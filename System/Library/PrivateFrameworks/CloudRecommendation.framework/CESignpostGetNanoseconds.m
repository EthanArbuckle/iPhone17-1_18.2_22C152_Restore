@interface CESignpostGetNanoseconds
@end

@implementation CESignpostGetNanoseconds

uint64_t ___CESignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_CESignpostGetNanoseconds_timebase_info);
}

@end