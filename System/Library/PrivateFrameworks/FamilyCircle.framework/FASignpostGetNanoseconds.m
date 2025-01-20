@interface FASignpostGetNanoseconds
@end

@implementation FASignpostGetNanoseconds

uint64_t ___FASignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_FASignpostGetNanoseconds_timebase_info);
}

@end