@interface ACSignpostGetNanoseconds
@end

@implementation ACSignpostGetNanoseconds

uint64_t ___ACSignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_ACSignpostGetNanoseconds_timebase_info);
}

@end