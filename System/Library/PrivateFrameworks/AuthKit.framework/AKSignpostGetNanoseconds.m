@interface AKSignpostGetNanoseconds
@end

@implementation AKSignpostGetNanoseconds

uint64_t ___AKSignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_AKSignpostGetNanoseconds_timebase_info);
}

@end