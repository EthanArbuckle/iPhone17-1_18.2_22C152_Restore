@interface GCAppleTVRemoteControllerProfile
@end

@implementation GCAppleTVRemoteControllerProfile

void __46___GCAppleTVRemoteControllerProfile_setOwner___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _motion];
  v3 = [v2 valueChangedHandler];

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) _motion];
    v4 = [v6 valueChangedHandler];
    v5 = [*(id *)(a1 + 32) _motion];
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
}

void __46___GCAppleTVRemoteControllerProfile_setOwner___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _motion];
  v3 = [v2 internalValueChangedHandler];

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) _motion];
    v4 = [v6 internalValueChangedHandler];
    v5 = [*(id *)(a1 + 32) _motion];
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
}

void __55___GCAppleTVRemoteControllerProfile_setAllowsRotation___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processOrientationData:v3];
}

@end