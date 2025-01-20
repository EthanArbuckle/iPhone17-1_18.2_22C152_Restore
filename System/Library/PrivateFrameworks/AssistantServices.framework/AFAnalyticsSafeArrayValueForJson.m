@interface AFAnalyticsSafeArrayValueForJson
@end

@implementation AFAnalyticsSafeArrayValueForJson

void ___AFAnalyticsSafeArrayValueForJson_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = _AFAnalyticsMapToSafeValueForJson(a2, *(void *)(a1 + 48));
  if (**(unsigned char **)(a1 + 48))
  {
    id v11 = v5;
    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v6 setObject:v11 forKey:v10];

    v5 = v11;
  }
}

void ___AFAnalyticsSafeArrayValueForJson_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v5, objc_msgSend(a2, "integerValue"));
}

@end