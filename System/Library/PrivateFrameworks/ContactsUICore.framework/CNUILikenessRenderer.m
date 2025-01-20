@interface CNUILikenessRenderer
+ (id)cachingRendererWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5;
+ (id)cachingRendererWithLikenessResolver:(id)a3 schedulerProvider:(id)a4;
+ (id)concurrentCachingRendererWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysForCaching;
+ (id)rendererWithLikenessResolver:(id)a3 schedulerProvider:(id)a4;
@end

@implementation CNUILikenessRenderer

id __97___CNUILikenessRenderer_renderedLikenessesForLikenessProviders_badges_scope_likenessFingerprint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ((unint64_t)[v3 count] >= 2)
  {
    v4 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __97___CNUILikenessRenderer_renderedLikenessesForLikenessProviders_badges_scope_likenessFingerprint___block_invoke_cold_1(a1, v4);
    }
  }
  v5 = *(void **)(a1 + 64);
  v6 = [*(id *)(a1 + 40) likenessProvidersForBadges:*(void *)(a1 + 48)];
  v7 = [v5 renderedLikenessesForProviders:v3 likenessBadgeProviders:v6 scope:*(void *)(a1 + 56)];

  if (v7)
  {
    v8 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      [v7 size];
      uint64_t v10 = v9;
      [v7 size];
      uint64_t v11 = *(void *)(a1 + 32);
      int v14 = 134218498;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      _os_log_impl(&dword_20B704000, v8, OS_LOG_TYPE_INFO, "[LikenessRenderer] Successful {%.2f, %.2f} result for rendered likeness for %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  return v7;
}

id __92___CNUILikenessRenderer_likenessProvidersForContacts_likenessResolverOptions_workScheduler___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  v5 = [v3 likenessResolver];
  v6 = [v5 likenessesForContact:v4 options:a1[5] workScheduler:a1[6]];

  v7 = [v6 observeOn:a1[6]];

  return v7;
}

+ (id)descriptorForRequiredKeysForCaching
{
  return +[_CNUICachingLikenessRenderer descriptorForRequiredKeys];
}

+ (id)descriptorForRequiredKeys
{
  return +[_CNUILikenessRenderer descriptorForRequiredKeys];
}

id __65___CNUILikenessRenderer_loadingPlaceholderForContactCount_scope___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) >= 2uLL
    && +[CNUISnowglobeUtilities enableGroupPhoto])
  {
    v2 = [*(id *)(a1 + 32) likenessResolver];
    id v3 = [v2 placeholderProviderFactory];
    uint64_t v4 = objc_msgSend(v3, "loadingGroupPlaceholderProviderWithBackgroundStyle:", objc_msgSend(*(id *)(a1 + 40), "backgroundStyle"));
  }
  else
  {
    v2 = [*(id *)(a1 + 32) likenessResolver];
    id v3 = [v2 placeholderProviderFactory];
    uint64_t v4 = [v3 loadingPlaceholderProvider];
  }
  v5 = (void *)v4;

  v6 = [*(id *)(a1 + 32) renderedLoadingPlaceholderForContactCount:*(void *)(a1 + 48) provider:v5 scope:*(void *)(a1 + 40)];

  return v6;
}

+ (id)cachingRendererWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [[_CNUILikenessRenderer alloc] initWithLikenessResolver:v8 schedulerProvider:v7];
  uint64_t v10 = [_CNUICachingLikenessRenderer alloc];
  uint64_t v11 = [v8 contactStore];

  uint64_t v12 = [(_CNUICachingLikenessRenderer *)v10 initWithLikenessRenderer:v9 schedulerProvider:v7 capacity:a4 shouldRequireMainThread:1 contactStore:v11];
  return v12;
}

+ (id)cachingRendererWithLikenessResolver:(id)a3 schedulerProvider:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_CNUILikenessRenderer alloc] initWithLikenessResolver:v6 schedulerProvider:v5];

  id v8 = [[_CNUICachingLikenessRenderer alloc] initWithLikenessRenderer:v7 schedulerProvider:v5];
  return v8;
}

+ (id)rendererWithLikenessResolver:(id)a3 schedulerProvider:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_CNUILikenessRenderer alloc] initWithLikenessResolver:v6 schedulerProvider:v5];

  return v7;
}

id __66___CNUILikenessRenderer_likenessProvidersForBadges_workScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 likenessResolver];
  id v6 = [v5 badgeObservableWithLikenessBadge:v4 workScheduler:*(void *)(a1 + 40)];

  return v6;
}

CNUIPRLikenessBadgeImageProvider *__52___CNUILikenessRenderer_likenessProvidersForBadges___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNUIPRLikenessBadgeImageProvider alloc] initWithBadge:v2];

  return v3;
}

uint64_t __64___CNUILikenessRenderer_renderedLikenessForBadgeProvider_scope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = [a2 firstObject];
  [*(id *)(a1 + 32) pointSize];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) scale];
  uint64_t v10 = (CGImage *)objc_msgSend(v3, "cgImageForLikenessProvider:pointSize:scale:style:alwaysUsePointSize:", v4, objc_msgSend(*(id *)(a1 + 32), "style"), 1, v6, v8, v9);

  CGImageGetWidth(v10);
  CGImageGetHeight(v10);
  [*(id *)(a1 + 32) scale];
  double v12 = v11;
  Class v13 = NSClassFromString(&cfstr_Uiimage.isa);
  return [(objc_class *)v13 imageWithCGImage:v10 scale:0 orientation:v12];
}

id __63___CNUILikenessRenderer_renderedBasicMonogramFromString_scope___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 40);
  double v9 = a2;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  double v6 = [v4 arrayWithObjects:&v9 count:1];
  double v7 = objc_msgSend(v3, "renderedLikenessesForProviders:likenessBadgeProviders:scope:", v6, MEMORY[0x263EFFA68], *(void *)(a1 + 32), v9, v10);

  return v7;
}

+ (id)concurrentCachingRendererWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [[_CNUILikenessRenderer alloc] initWithLikenessResolver:v8 schedulerProvider:v7];
  uint64_t v10 = [_CNUICachingLikenessRenderer alloc];
  double v11 = [v8 contactStore];

  double v12 = [(_CNUICachingLikenessRenderer *)v10 initWithLikenessRenderer:v9 schedulerProvider:v7 capacity:a4 shouldRequireMainThread:0 contactStore:v11];
  return v12;
}

void __97___CNUILikenessRenderer_renderedLikenessesForLikenessProviders_badges_scope_likenessFingerprint___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "[LikenessRenderer] Requesting group rendered likeness for %{public}@", (uint8_t *)&v3, 0xCu);
}

@end