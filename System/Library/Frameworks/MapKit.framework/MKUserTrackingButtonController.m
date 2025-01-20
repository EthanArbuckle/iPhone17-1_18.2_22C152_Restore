@interface MKUserTrackingButtonController
@end

@implementation MKUserTrackingButtonController

void __55___MKUserTrackingButtonController_setUserTrackingView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setInternallyEnabled:*(unsigned char *)(a1 + 40) == 0];
}

void __55___MKUserTrackingButtonController_setUserTrackingView___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isLocationServicesRestricted];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___MKUserTrackingButtonController_setUserTrackingView___block_invoke_2;
  v3[3] = &unk_1E54B8718;
  v3[4] = *(void *)(a1 + 40);
  char v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

@end