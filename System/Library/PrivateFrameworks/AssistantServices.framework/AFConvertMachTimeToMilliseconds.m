@interface AFConvertMachTimeToMilliseconds
@end

@implementation AFConvertMachTimeToMilliseconds

uint64_t ___AFConvertMachTimeToMilliseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_AFConvertMachTimeToMilliseconds_machTimebaseInfo);
}

@end