@interface HMFLocationAuthorizationStartMonitoring
@end

@implementation HMFLocationAuthorizationStartMonitoring

uint64_t ____HMFLocationAuthorizationStartMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 72))
  {
    uint64_t v3 = [objc_alloc((Class)getCLLocationManagerClass()) initWithEffectiveBundleIdentifier:*(void *)(*(void *)(a1 + 32) + 72) delegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 64)];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 80);
    id v6 = objc_alloc((Class)getCLLocationManagerClass());
    uint64_t v7 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v3 = [v6 initWithEffectiveBundlePath:*(void *)(v7 + 80) delegate:v7 onQueue:*(void *)(v7 + 64)];
    }
    else {
      uint64_t v3 = [v6 _initWithDelegate:*(void *)(a1 + 32) onQueue:*(void *)(v7 + 64)];
    }
    uint64_t v4 = *(void *)(a1 + 32);
  }
  *(void *)(v4 + 88) = v3;
  return MEMORY[0x1F41817F8]();
}

@end