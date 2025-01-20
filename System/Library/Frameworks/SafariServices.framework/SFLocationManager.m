@interface SFLocationManager
@end

@implementation SFLocationManager

void __43___SFLocationManager_sharedLocationManager__block_invoke()
{
  v0 = objc_alloc_init(_SFLocationManager);
  v1 = (void *)sharedLocationManager_shared;
  sharedLocationManager_shared = (uint64_t)v0;
}

void __26___SFLocationManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26___SFLocationManager_init__block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __26___SFLocationManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleApplicationStateChange:*(void *)(a1 + 32)];
}

@end