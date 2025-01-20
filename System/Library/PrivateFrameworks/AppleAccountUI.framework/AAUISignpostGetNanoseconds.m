@interface AAUISignpostGetNanoseconds
@end

@implementation AAUISignpostGetNanoseconds

uint64_t ___AAUISignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_AAUISignpostGetNanoseconds_timebase_info);
}

@end