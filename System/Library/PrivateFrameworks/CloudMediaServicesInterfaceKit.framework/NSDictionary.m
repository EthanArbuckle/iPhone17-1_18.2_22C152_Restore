@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __70__NSDictionary_CMSCodingUtils__cmsOptionalArrayOfDecodedClass_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) instanceFromCMSCoded:a2];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  return MEMORY[0x270F9A758]();
}

void __35__NSDictionary_CMSCoding__cmsCoded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v6 = *(void **)(a1 + 32);
    v7 = [v5 cmsCoded];
    [v6 setObject:v7 forKey:v8];
  }
}

@end