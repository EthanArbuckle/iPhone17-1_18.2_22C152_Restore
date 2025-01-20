@interface OctagonSignpostGetNanoseconds
@end

@implementation OctagonSignpostGetNanoseconds

uint64_t ___OctagonSignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_OctagonSignpostGetNanoseconds_timebase_info);
}

@end