@interface NSError
@end

@implementation NSError

uint64_t __50__NSError_FPAdditions__fp_initLocalizationStrings__block_invoke()
{
  return [MEMORY[0x1E4F28C58] setUserInfoValueProviderForDomain:@"NSFileProviderErrorDomain" provider:&__block_literal_global_118_0];
}

uint64_t __50__NSError_FPAdditions__fp_initLocalizationStrings__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fp_userInfoValueForKey:");
}

void __40__NSError_FPAdditions__fp_strippedError__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = objc_msgSend(v5, "fp_strippedError");
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
      }
    }
  }
}

uint64_t __59__NSError_FPAdditions__fp_annotatedErrorWithItems_variant___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 itemIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

@end