@interface AFAnalyticsSafeDictionaryValueForJson
@end

@implementation AFAnalyticsSafeDictionaryValueForJson

void ___AFAnalyticsSafeDictionaryValueForJson_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  v5 = _AFAnalyticsMapToSafeValueForJson(a3, *(void *)(a1 + 48));
  if (**(unsigned char **)(a1 + 48))
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 setObject:v5 forKey:v10];
  }
}

uint64_t ___AFAnalyticsSafeDictionaryValueForJson_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

@end