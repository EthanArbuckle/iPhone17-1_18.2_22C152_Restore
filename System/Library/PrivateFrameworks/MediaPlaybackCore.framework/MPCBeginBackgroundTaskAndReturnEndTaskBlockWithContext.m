@interface MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext
@end

@implementation MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext

void ___MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext_block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *MEMORY[0x263F54E88];
  if (*(void *)(*(void *)(a1[5] + 8) + 24) != *MEMORY[0x263F54E88])
  {
    v3 = MPSharedBackgroundTaskProvider();
    [v3 endTask:*(void *)(*(void *)(a1[5] + 8) + 24)];

    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[6];
      uint64_t v6 = a1[4];
      uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 24);
      int v8 = 136315650;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "%s: BackgroundTask: End assertion for %{public}@ (%lli)", (uint8_t *)&v8, 0x20u);
    }

    *(void *)(*(void *)(a1[5] + 8) + 24) = v1;
  }
}

@end