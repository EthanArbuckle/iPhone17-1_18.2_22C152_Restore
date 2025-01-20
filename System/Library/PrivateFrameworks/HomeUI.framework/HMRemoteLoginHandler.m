@interface HMRemoteLoginHandler
@end

@implementation HMRemoteLoginHandler

void __81__HMRemoteLoginHandler_HUMediaAdditions__hu_appleMusicInAppAuthenticationContext__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__HMRemoteLoginHandler_HUMediaAdditions__hu_appleMusicInAppAuthenticationContext__block_invoke_2;
  v6[3] = &unk_1E63919C8;
  id v7 = v3;
  v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 queryProxiedDevice:v6];
}

void __81__HMRemoteLoginHandler_HUMediaAdditions__hu_appleMusicInAppAuthenticationContext__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithError:a2];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F4F100]);
    [v5 setServiceType:2];
    [v5 setProxiedDevice:v6];
    [v5 setAnisetteDataProvider:*(void *)(a1 + 40)];
    [v5 _setProxyingForApp:1];
    [*(id *)(a1 + 32) finishWithResult:v5];
  }
}

@end