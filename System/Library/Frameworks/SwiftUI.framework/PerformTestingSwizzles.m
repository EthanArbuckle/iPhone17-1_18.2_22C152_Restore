@interface PerformTestingSwizzles
@end

@implementation PerformTestingSwizzles

uint64_t ___PerformTestingSwizzles_block_invoke()
{
  [MEMORY[0x1E4FB1BA8] _performSwiftUITestingOverrides];
  v0 = (void *)MEMORY[0x1E4FB1568];

  return [v0 _performSwiftUITestingOverrides];
}

@end