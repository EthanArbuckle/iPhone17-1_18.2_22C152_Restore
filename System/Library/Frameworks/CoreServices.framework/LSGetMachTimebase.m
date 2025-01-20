@interface LSGetMachTimebase
@end

@implementation LSGetMachTimebase

uint64_t ___LSGetMachTimebase_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_LSGetMachTimebase::info);
}

@end