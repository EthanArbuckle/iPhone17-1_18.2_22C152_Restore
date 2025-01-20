@interface DisplayGetPowerAccumulator
@end

@implementation DisplayGetPowerAccumulator

uint64_t ____DisplayGetPowerAccumulator_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOReportSimpleGetIntegerValue();
  return 0;
}

@end