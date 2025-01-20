@interface ICMachTimeToNanoseconds
@end

@implementation ICMachTimeToNanoseconds

uint64_t ___ICMachTimeToNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_ICMachTimeToNanoseconds_machTimebaseInfo);
}

@end