#!/usr/bin/perl -w

#========================================================================
# Author: Shujuan.Wang
# Email: okwangshujuan@163.com
#========================================================================

use strict;
use warnings;

use Pod::Usage;
use FindBin;
#use lib "$FindBin::Bin/lib";

use Getopt::Long;
my %opts = ();
GetOptions(\%opts, 'output=s', 'help') or &usage(2, $!);

# check options
&usage(2, "Show the help message\n") if (exists $opts{help});
&usage(1, "Input was not accepted, use '-help' to get more message\n")  if (@ARGV < 1);

open (STDOUT, ">$opts{output}") or die $! if (exists $opts{output});

sub usage {
    my $flag = shift;
    print qq(@_
    Usage:
        perl $FindBin::Script [options] <input>
    \n);
    print qq(
    Arguments:
        <input>    input
    Options:
        -output <file>    output file to instead of [STDOUT]
    Description:
        This script using for ...
    \n) if ($flag > 1);
    exit;
}
