@interface FEFocusEnvironmentIsAncestorOfEnvironment
@end

@implementation FEFocusEnvironmentIsAncestorOfEnvironment

uint64_t ___FEFocusEnvironmentIsAncestorOfEnvironment_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 32) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end