@interface CSStringBindingEnumerateAllBindings
@end

@implementation CSStringBindingEnumerateAllBindings

uint64_t ___CSStringBindingEnumerateAllBindings_block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

@end