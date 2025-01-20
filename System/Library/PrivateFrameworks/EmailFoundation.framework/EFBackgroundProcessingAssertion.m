@interface EFBackgroundProcessingAssertion
@end

@implementation EFBackgroundProcessingAssertion

uint64_t __68___EFBackgroundProcessingAssertion__takeAssertionForDuration_error___block_invoke(uint64_t a1, int a2)
{
  return fcntl(a2, 108, a1 + 32);
}

uint64_t __63___EFBackgroundProcessingAssertion__releaseAssertionWithError___block_invoke(int a1, int a2)
{
  return fcntl(a2, 109, 0);
}

@end