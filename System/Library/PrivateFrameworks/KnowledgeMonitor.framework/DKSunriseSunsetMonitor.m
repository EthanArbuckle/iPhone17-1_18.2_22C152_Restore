@interface DKSunriseSunsetMonitor
@end

@implementation DKSunriseSunsetMonitor

uint64_t __31___DKSunriseSunsetMonitor_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedUpdateSunriseSunsetTime:0];
}

void __31___DKSunriseSunsetMonitor_init__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F00A60]);
  id v6 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/LocationBundles/SystemCustomization.bundle"];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 queue];
  v5 = (void *)[v2 initWithEffectiveBundle:v6 delegate:v3 onQueue:v4];
  [*(id *)(a1 + 32) setManager:v5];
}

void __31___DKSunriseSunsetMonitor_init__block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F00A60];
  id v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/LocationBundles/SystemCustomization.bundle"];
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationStatus:", objc_msgSend(v2, "authorizationStatusForBundle:", v3));
}

void __31___DKSunriseSunsetMonitor_init__block_invoke_32(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31___DKSunriseSunsetMonitor_init__block_invoke_2_33;
  v6[3] = &unk_264714788;
  id v7 = *(id *)(a1 + 32);
  id v3 = v6;
  v4 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_9;
  block[3] = &unk_2647148A0;
  id v9 = v4;
  id v10 = v3;
  id v5 = v4;
  dispatch_async(v2, block);
}

uint64_t __31___DKSunriseSunsetMonitor_init__block_invoke_2_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedUpdateSunriseSunsetTime:0];
}

void __31___DKSunriseSunsetMonitor_stop__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 152));
}

uint64_t __47___DKSunriseSunsetMonitor_respondToTimeChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedUpdateSunriseSunsetTime:0];
}

uint64_t __72___DKSunriseSunsetMonitor_locationManager_didChangeAuthorizationStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedUpdateSunriseSunsetTime:0];
}

void __62___DKSunriseSunsetMonitor_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) lastObject];
  [v1 unprotectedUpdateSunriseSunsetTime:v2];
}

@end