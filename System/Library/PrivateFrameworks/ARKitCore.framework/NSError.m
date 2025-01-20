@interface NSError
@end

@implementation NSError

id __43__NSError_ARAdditions__initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F28C58];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithDictionary:v3];

  return v4;
}

void __42__NSError_ARAdditions__encodeToDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 encodeToDictionary];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v9];
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F28750];
    if ([v9 isEqualToString:*MEMORY[0x1E4F28750]])
    {
      v8 = objc_msgSend(v5, "ar_map:", &__block_literal_global_11_0);
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
    }
    else
    {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v9];
    }
  }
}

uint64_t __42__NSError_ARAdditions__encodeToDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 encodeToDictionary];
}

@end