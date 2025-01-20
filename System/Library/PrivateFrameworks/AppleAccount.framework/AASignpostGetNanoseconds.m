@interface AASignpostGetNanoseconds
@end

@implementation AASignpostGetNanoseconds

uint64_t ___AASignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_AASignpostGetNanoseconds_timebase_info);
}

@end