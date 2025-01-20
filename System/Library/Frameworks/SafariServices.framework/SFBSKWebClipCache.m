@interface SFBSKWebClipCache
@end

@implementation SFBSKWebClipCache

void __40___SFBSKWebClipCache_sharedWebClipCache__block_invoke()
{
  v0 = objc_alloc_init(_SFBSKWebClipCache);
  v1 = (void *)+[_SFBSKWebClipCache sharedWebClipCache]::cache;
  +[_SFBSKWebClipCache sharedWebClipCache]::cache = (uint64_t)v0;

  -[_SFBSKWebClipCache _reloadWebClips]((void *)+[_SFBSKWebClipCache sharedWebClipCache]::cache);
  int out_token = 0;
  v2 = MEMORY[0x1E4F14428];
  notify_register_dispatch("com.apple.webclip.placeholder.added", &out_token, MEMORY[0x1E4F14428], &__block_literal_global_4);
  notify_register_dispatch("com.apple.webclip.placeholder.updated", &out_token, v2, &__block_literal_global_4);

  notify_register_dispatch("com.apple.webclip.placeholder.removed", &out_token, v2, &__block_literal_global_4);
}

uint64_t __40___SFBSKWebClipCache_sharedWebClipCache__block_invoke_2()
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:+[_SFBSKWebClipCache sharedWebClipCache]::cache selector:sel__reloadWebClipsWithObject_ object:0];
  v0 = (void *)+[_SFBSKWebClipCache sharedWebClipCache]::cache;

  return [v0 performSelector:sel__reloadWebClipsWithObject_ withObject:0 afterDelay:1.0];
}

void __37___SFBSKWebClipCache__reloadWebClips__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __37___SFBSKWebClipCache__reloadWebClips__block_invoke_cold_1((uint64_t)v5, v8);
    }
  }
  else
  {
    uint64_t v9 = [v6 count];
    v10 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1A690B000, v10, OS_LOG_TYPE_DEFAULT, "Fetched %zu web clips", (uint8_t *)&v11, 0xCu);
    }
    if (!v7)
    {
      v7 = [MEMORY[0x1E4F1C978] array];
    }
    -[_SFBSKWebClipCache _setWebClipURLs:](*(id **)(a1 + 32), v7);
  }
}

void __38___SFBSKWebClipCache__setWebClipURLs___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_SFBSKWebClipCacheDidChange" object:*(void *)(a1 + 32)];
}

void __37___SFBSKWebClipCache__reloadWebClips__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch web clips: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end