@interface GEOResourceManifestTileGroupObserverProxy
@end

@implementation GEOResourceManifestTileGroupObserverProxy

void __71___GEOResourceManifestTileGroupObserverProxy_forEachObserver_finished___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x18C1203C0]();
  os_unfair_lock_lock_with_options();
  v3 = [*(id *)(a1[4] + 8) allObjects];
  v4 = (void *)[v3 copy];

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = a1[5];
        if (v10) {
          (*(void (**)(uint64_t, void))(v10 + 16))(v10, *(void *)(*((void *)&v12 + 1) + 8 * v9));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v11 = a1[6];
  if (v11) {
    (*(void (**)(uint64_t))(v11 + 16))(v11);
  }
}

@end