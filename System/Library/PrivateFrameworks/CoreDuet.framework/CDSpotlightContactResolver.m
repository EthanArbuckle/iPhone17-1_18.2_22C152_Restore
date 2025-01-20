@interface CDSpotlightContactResolver
@end

@implementation CDSpotlightContactResolver

uint64_t __35___CDSpotlightContactResolver_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purge];
}

void __45___CDSpotlightContactResolver_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;
}

uint64_t __45___CDSpotlightContactResolver__validateCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purge];
}

void __53___CDSpotlightContactResolver__setContact_forHandle___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithTimeIntervalSinceNow:120.0];
  v5 = [[_CDSpotlightCachedContact alloc] initWithExpirationDate:v6 contact:*(void *)(a1 + 32)];
  [v4 setObject:v5 forKey:*(void *)(a1 + 40)];
}

void __58___CDSpotlightContactResolver__getCachedContactForHandle___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    v7 = [v6 expirationDate];
    [v7 timeIntervalSinceNow];
    double v9 = v8;

    if (v9 <= 0.0)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;

      [v13 removeObjectForKey:*(void *)(a1 + 32)];
    }
    else
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:120.0];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setExpirationDate:v10];
    }
  }
}

void __37___CDSpotlightContactResolver__purge__block_invoke(uint64_t a1, void *a2)
{
  [a2 removeAllObjects];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;
}

@end