@interface NSObject
@end

@implementation NSObject

void __67__NSObject_GKBlockKVO___gkAddObserverForKeyPath_options_withBlock___block_invoke(uint64_t a1)
{
  objc_getAssociatedObject(*(id *)(a1 + 32), @"com.apple.gamekit.blockObserverMap");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_setAssociatedObject(*(id *)(a1 + 32), @"com.apple.gamekit.blockObserverMap", v8, (void *)0x301);
  }
  id v2 = [[GKObserverTrampoline alloc] initObservingObject:*(void *)(a1 + 32) keyPath:*(void *)(a1 + 40) options:*(void *)(a1 + 72) block:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) token];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [v8 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

void __56__NSObject_GKBlockKVO___gkRemoveObserverWithBlockToken___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = objc_getAssociatedObject(*(id *)(a1 + 32), @"com.apple.gamekit.blockObserverMap");
  uint64_t v5 = *(void *)(a1 + 40);
  v4 = (uint64_t *)(a1 + 40);
  uint64_t v6 = [v3 objectForKey:v5];
  v7 = v6;
  if (v6)
  {
    [v6 cancelObservation];
    [v3 removeObjectForKey:*v4];
    if (![v3 count]) {
      objc_setAssociatedObject(*v2, @"com.apple.gamekit.blockObserverMap", 0, (void *)0x301);
    }
  }
  else
  {
    id v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v9 = GKOSLoggers();
      id v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__NSObject_GKBlockKVO___gkRemoveObserverWithBlockToken___block_invoke_cold_1((uint64_t *)v2, v4, v8);
    }
  }
}

void __56__NSObject_GKBlockKVO___gkRemoveObserverWithBlockToken___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "Ignoring attempt to remove non-existent observer on %@ for token %@.", (uint8_t *)&v5, 0x16u);
}

@end