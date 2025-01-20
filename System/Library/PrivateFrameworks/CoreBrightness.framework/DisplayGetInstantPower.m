@interface DisplayGetInstantPower
@end

@implementation DisplayGetInstantPower

uint64_t ____DisplayGetInstantPower_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOReportSimpleGetIntegerValue();
  return 0;
}

@end