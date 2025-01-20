@interface GEOExperimentConfigurationObserverProxy
@end

@implementation GEOExperimentConfigurationObserverProxy

void __60___GEOExperimentConfigurationObserverProxy_forEachObserver___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(a1 + 40);
        if (v8) {
          (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(*((void *)&v9 + 1) + 8 * v7));
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

@end