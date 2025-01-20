@interface FLSignpostGetNanoseconds
@end

@implementation FLSignpostGetNanoseconds

uint64_t ___FLSignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_FLSignpostGetNanoseconds_timebase_info);
}

@end