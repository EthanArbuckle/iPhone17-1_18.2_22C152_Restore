@interface AIDASignpostGetNanoseconds
@end

@implementation AIDASignpostGetNanoseconds

uint64_t ___AIDASignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_AIDASignpostGetNanoseconds_timebase_info);
}

@end