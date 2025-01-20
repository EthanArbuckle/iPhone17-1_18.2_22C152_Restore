@interface CNUICachingLikenessRenderer
@end

@implementation CNUICachingLikenessRenderer

id __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_12_cold_1(a1, (uint64_t)v3, v4);
  }
}

id __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageCache];
  id v3 = [v2 cache];
  v4 = [v3 objectForKey:*(void *)(a1 + 40)];

  if (!v4)
  {
    v5 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_cold_1(a1, v5);
    }

    v6 = [*(id *)(a1 + 32) initialRenderedLikenessesForContacts:*(void *)(a1 + 48) withBadges:*(void *)(a1 + 64) scope:*(void *)(a1 + 56) workScheduler:*(void *)(a1 + 72)];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_12;
    v16 = &unk_2640198A0;
    id v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 40);
    v7 = [v6 doOnNext:&v13];

    v4 = objc_msgSend(*(id *)(a1 + 32), "startCacheEntryWithObservable:contacts:scope:", v7, *(void *)(a1 + 48), *(void *)(a1 + 56), v13, v14, v15, v16);
    v8 = [*(id *)(a1 + 32) imageCache];
    v9 = [v8 cache];
    [v9 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  v10 = [*(id *)(a1 + 32) imageCache];
  [v10 touchCacheKey:*(void *)(a1 + 40)];

  v11 = [v4 imageObservable];

  return v11;
}

void __77___CNUICachingLikenessRenderer_startCacheEntryWithObservable_contacts_scope___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

id __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newSynchronousSerialSchedulerWithName:a2];
  return v2;
}

id __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newReaderWriterSchedulerWithName:a2];
  return v2;
}

id __77___CNUICachingLikenessRenderer_renderedLikenessForBadge_scope_workScheduler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageCache];
  id v3 = [v2 cache];
  v4 = [v3 objectForKey:*(void *)(a1 + 40)];

  if (!v4)
  {
    v5 = [*(id *)(a1 + 32) renderer];
    v6 = [v5 renderedLikenessForBadge:*(void *)(a1 + 48) scope:*(void *)(a1 + 56) workScheduler:*(void *)(a1 + 64)];

    v4 = [*(id *)(a1 + 32) startCacheEntryWithObservable:v6 contacts:MEMORY[0x263EFFA68] scope:*(void *)(a1 + 56)];
    v7 = [*(id *)(a1 + 32) imageCache];
    v8 = [v7 cache];
    [v8 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  v9 = [*(id *)(a1 + 32) imageCache];
  [v9 touchCacheKey:*(void *)(a1 + 40)];

  v10 = [v4 imageObservable];

  return v10;
}

void __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "[LikenessCachingRenderer] Cache miss for %@, scope %@", (uint8_t *)&v4, 0x16u);
}

void __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_12_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) pointSize];
  __int16 v6 = NSStringFromSize(v15);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_20B704000, a3, OS_LOG_TYPE_DEBUG, "[LikenessCachingRenderer] New image (%@) for key '%@': %@", (uint8_t *)&v8, 0x20u);
}

@end