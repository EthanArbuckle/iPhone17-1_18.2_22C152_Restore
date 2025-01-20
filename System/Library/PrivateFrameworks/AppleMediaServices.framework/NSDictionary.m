@interface NSDictionary
@end

@implementation NSDictionary

void __56__NSDictionary_AppleMediaServices__ams_filterUsingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

uint64_t __62__NSDictionary_AppleMediaServices_Project__ams_valuesForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __60__NSDictionary_AppleMediaServices__ams_arrayUsingTransform___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

void __57__NSDictionary_AppleMediaServices__ams_mapWithTransform___block_invoke(uint64_t a1)
{
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2)
  {
    id v6 = v2;
    v3 = [v2 second];
    v4 = *(void **)(a1 + 32);
    id v5 = [v6 first];
    [v4 setObject:v3 forKeyedSubscript:v5];

    id v2 = v6;
  }
}

AMSPair *__53__NSDictionary_AppleMediaServices__hashedDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [AMSPair alloc];
  v7 = AMSHashIfNeeded(v5);

  v8 = AMSHashIfNeeded(v4);

  v9 = [(AMSPair *)v6 initWithFirst:v7 second:v8];
  return v9;
}

uint64_t __64__NSDictionary_AppleMediaServices__ams_sanitizedForSecureCoding__block_invoke()
{
  v0 = objc_opt_class();
  return [v0 supportsSecureCoding];
}

AMSPair *__64__NSDictionary_AppleMediaServices__ams_sanitizedForSecureCoding__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [AMSPair alloc];
    uint64_t v7 = objc_msgSend(v5, "ams_sanitizedForSecureCoding");
LABEL_8:
    v9 = (void *)v7;
    v8 = [(AMSPair *)v6 initWithFirst:v4 second:v7];

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(id)objc_opt_class() supportsSecureCoding])
  {
    v8 = [[AMSPair alloc] initWithFirst:v4 second:v5];
    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [AMSPair alloc];
    uint64_t v7 = [v5 description];
    goto LABEL_8;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

void __57__NSDictionary_AppleMediaServices__ams_compactMapValues___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
}

void __66__NSDictionary_AppleMediaServices__ams_firstKeyObjectPassingTest___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    v8 = [[AMSPair alloc] initWithFirst:v11 second:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

uint64_t __89__NSDictionary_AppleMediaServices_Project__ams_keysForChangedValuesComparedToDictionary___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];

  uint64_t v7 = [v5 isEqual:v6] ^ 1;
  return v7;
}

@end