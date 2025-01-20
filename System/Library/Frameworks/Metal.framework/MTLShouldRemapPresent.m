@interface MTLShouldRemapPresent
@end

@implementation MTLShouldRemapPresent

uint64_t ___MTLShouldRemapPresent_block_invoke()
{
  uint64_t result = _MTLIsInternalBuild();
  if (result)
  {
    uint64_t result = MTLGetEnvDefault("MTL_PRESENT_FIFO", 1);
    BOOL v1 = result != 0;
  }
  else
  {
    BOOL v1 = 1;
  }
  _MTLShouldRemapPresent_shouldRemapPresent = v1;
  return result;
}

@end