@interface MPCReportingPlaybackEnvironmentPropertiesLoader
- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment;
- (MPCReportingPlaybackEnvironmentPropertiesLoader)initWithPlaybackRequestEnvironment:(id)a3;
- (void)_getHasSubscriptionPlaybackCapabilityForUserIdentity:(id)a3 completion:(id)a4;
- (void)loadReportingIdentityPropertiesWithCompletionHandler:(id)a3;
@end

@implementation MPCReportingPlaybackEnvironmentPropertiesLoader

- (void).cxx_destruct
{
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (void)_getHasSubscriptionPlaybackCapabilityForUserIdentity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x263F89208];
  id v7 = a3;
  v8 = [v6 sharedStatusController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __115__MPCReportingPlaybackEnvironmentPropertiesLoader__getHasSubscriptionPlaybackCapabilityForUserIdentity_completion___block_invoke;
  v10[3] = &unk_2643C2ED0;
  id v11 = v5;
  id v9 = v5;
  [v8 getSubscriptionStatusForUserIdentity:v7 withCompletionHandler:v10];
}

void __115__MPCReportingPlaybackEnvironmentPropertiesLoader__getHasSubscriptionPlaybackCapabilityForUserIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x263F12300];
    id v4 = a2;
    id v5 = (id)[[v3 alloc] initWithICSubscriptionStatus:v4];
  }
  else
  {
    id v5 = 0;
  }
  [v5 hasPlaybackCapability];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadReportingIdentityPropertiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_2643C2D98;
  id v25 = v4;
  id v5 = v4;
  v6 = _Block_copy(aBlock);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_2;
  v22[3] = &unk_2643C2D98;
  id v23 = v6;
  id v7 = v6;
  v8 = _Block_copy(v22);
  id v9 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment _createStoreRequestContext];
  v10 = (void *)[v9 copyWithBlock:&__block_literal_global_20254];
  id v11 = [MEMORY[0x263F893A0] sharedBagProvider];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_5;
  v16[3] = &unk_2643C2EA8;
  id v17 = v10;
  v18 = self;
  id v19 = v9;
  id v20 = v11;
  id v21 = v8;
  id v12 = v8;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  [v13 getBagForRequestContext:v15 withCompletionHandler:v16];
}

uint64_t __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [MEMORY[0x263F891E0] sharedController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_2643C2DC0;
    id v9 = v5;
    id v11 = *(id *)(a1 + 32);
    id v10 = v6;
    [v7 getLastKnownHouseholdIDWithCompletion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) identity];
  id v5 = [*(id *)(a1 + 32) identityStore];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_6;
  v10[3] = &unk_2643C2E80;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v11 = v3;
  uint64_t v12 = v6;
  id v13 = v4;
  id v14 = v7;
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v8 = v4;
  id v9 = v3;
  [v5 getPropertiesForUserIdentity:v8 completionHandler:v10];
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MPCReportingIdentityProperties);
  id v5 = [v3 DSID];
  -[MPCReportingIdentityProperties setStoreAccountID:](v4, "setStoreAccountID:", [v5 unsignedLongLongValue]);

  uint64_t v6 = [v3 storefrontIdentifier];

  uint64_t v7 = [*(id *)(a1 + 32) storefrontHeaderSuffix];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = &stru_26CBCA930;
  }
  id v10 = [v6 stringByAppendingString:v9];
  [(MPCReportingIdentityProperties *)v4 setStoreFrontID:v10];

  id v11 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_7;
  v16[3] = &unk_2643C2E58;
  id v17 = v4;
  id v18 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 40);
  id v19 = v13;
  uint64_t v20 = v14;
  id v21 = *(id *)(a1 + 72);
  id v15 = v4;
  [v11 _getHasSubscriptionPlaybackCapabilityForUserIdentity:v12 completion:v16];
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setHasSubscriptionPlaybackCapability:a2];
  id v3 = [*(id *)(a1 + 40) delegatedIdentity];
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_8;
    v15[3] = &unk_2643C4310;
    id v16 = v3;
    uint64_t v6 = (void *)[v5 copyWithBlock:v15];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_9;
    v10[3] = &unk_2643C2E30;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v11 = v6;
    uint64_t v12 = v7;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 64);
    id v9 = v6;
    [v8 getBagForRequestContext:v9 withCompletionHandler:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setIdentity:v2];
  [v3 setDelegatedIdentity:0];
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) identityStore];
  id v5 = [*(id *)(a1 + 32) identity];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_10;
  v8[3] = &unk_2643C2E08;
  uint64_t v6 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v11 = *(id *)(a1 + 56);
  id v7 = v3;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v8];
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id v18 = [v3 delegationProperties];
  id v5 = objc_alloc_init(MEMORY[0x263F89230]);
  uint64_t v6 = [v4 DSID];
  objc_msgSend(v5, "setStoreAccountID:", objc_msgSend(v6, "unsignedLongLongValue"));

  id v7 = [v4 storefrontIdentifier];

  uint64_t v8 = [*(id *)(a1 + 40) storefrontHeaderSuffix];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_26CBCA930;
  }
  id v11 = [v7 stringByAppendingString:v10];
  [v5 setStoreFrontID:v11];

  uint64_t v12 = [v18 requestUserAgent];
  [v5 setBuildVersion:v12];

  id v13 = [v18 deviceGUID];
  [v5 setDeviceGUID:v13];

  id v14 = [v18 deviceName];
  [v5 setDeviceName:v14];

  uint64_t v15 = [v18 systemReleaseType];
  if ((unint64_t)(v15 - 1) >= 4) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v15;
  }
  [v5 setSystemReleaseType:v16];
  id v17 = [v18 timeZone];
  [v5 setTimeZone:v17];

  [v5 setSBEnabled:1];
  [*(id *)(a1 + 48) setEnqueuerProperties:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setDelegatedIdentity:0];
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v7 = a3;
  [v5 setHouseholdID:a2];
  id v6 = v7;
  if (a1[5]) {
    id v6 = (id)a1[5];
  }
  (*(void (**)(void, void, id))(a1[6] + 16))(a1[6], a1[4], v6);
}

- (MPCReportingPlaybackEnvironmentPropertiesLoader)initWithPlaybackRequestEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCReportingPlaybackEnvironmentPropertiesLoader;
  id v5 = [(MPCReportingPlaybackEnvironmentPropertiesLoader *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    playbackRequestEnvironment = v5->_playbackRequestEnvironment;
    v5->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v6;
  }
  return v5;
}

@end