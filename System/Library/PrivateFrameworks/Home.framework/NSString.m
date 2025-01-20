@interface NSString
@end

@implementation NSString

uint64_t __35__NSString_HFAdditions__hf_isEmail__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF MATCHES %@", @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"];
  uint64_t v1 = _MergedGlobals_258;
  _MergedGlobals_258 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __68__NSString_HFAdditions__hf_stringByTransformingFirstWordUsingBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = *(void *)(a1[5] + 8);
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 40) = a4;
  uint64_t v10 = (*(void (**)(void))(a1[4] + 16))();
  uint64_t v11 = *(void *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  *a7 = 1;
}

uint64_t __57__NSString_HFAdditions__hf_stringByCapitalizingFirstWord__block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedCapitalizedString];
}

uint64_t __56__NSString_HFAdditions__hf_stringByLowercasingFirstWord__block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedLowercaseString];
}

@end