@interface CSStore
@end

@implementation CSStore

uint64_t __47___CSStore_setUnitIdentifierExhaustionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __29___CSStore_setAccessContext___block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyValue(@"CSStoreAssertOnIncorrectQueue", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v0)
  {
    v3 = (void *)v0;
    if (objc_opt_respondsToSelector())
    {
      char v1 = [v3 BOOLValue];
LABEL_7:
      performConstantAssertions = v1;
      goto LABEL_8;
    }
  }
  if (CSStore2::IsAppleInternal(void)::once != -1) {
    dispatch_once(&CSStore2::IsAppleInternal(void)::once, &__block_literal_global_131);
  }
  char v1 = 1;
  if (CSStore2::IsAppleInternal(void)::result) {
    goto LABEL_7;
  }
LABEL_8:
  performMutatingAssertions = v1;

  return MEMORY[0x1F4181820]();
}

@end