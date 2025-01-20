@interface CDPSignpostGetNanoseconds
@end

@implementation CDPSignpostGetNanoseconds

uint64_t ___CDPSignpostGetNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_CDPSignpostGetNanoseconds_timebase_info);
}

@end