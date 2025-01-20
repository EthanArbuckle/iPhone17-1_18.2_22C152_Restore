@interface GKAppLevelSignInVisibility
+ (void)didShowBanner;
+ (void)didShowFullscreen;
+ (void)fetchAppLevelVisibilityConstraintsWithHandler:(id)a3;
+ (void)fetchConfigsWithHandler:(id)a3;
@end

@implementation GKAppLevelSignInVisibility

+ (void)fetchConfigsWithHandler:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F401B0] proxyForLocalPlayer];
  v5 = [v4 utilityService];
  uint64_t v6 = *MEMORY[0x263F400F0];
  v11[0] = *MEMORY[0x263F40130];
  v11[1] = v6;
  v11[2] = *MEMORY[0x263F400E8];
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__GKAppLevelSignInVisibility_fetchConfigsWithHandler___block_invoke;
  v9[3] = &unk_26478A400;
  id v10 = v3;
  id v8 = v3;
  [v5 getStoreBagValuesForKeys:v7 handler:v9];
}

void __54__GKAppLevelSignInVisibility_fetchConfigsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    id v3 = objc_alloc_init(NSDictionary);
  }
  id v12 = v3;
  id v4 = objc_alloc_init(MEMORY[0x263F402C8]);
  id v5 = objc_alloc_init(MEMORY[0x263F402C8]);
  uint64_t v6 = [v12 integerValueFromKey:*MEMORY[0x263F400F0] defaultValue:1];
  v7 = [v5 sheetConfig];
  [v7 setLimit:v6];

  uint64_t v8 = [v12 integerValueFromKey:*MEMORY[0x263F400E8] defaultValue:1];
  v9 = [v5 bannerConfig];
  [v9 setLimit:v8];

  uint64_t v10 = [v12 integerValueFromKey:*MEMORY[0x263F40130] defaultValue:1];
  v11 = [v4 sheetConfig];
  [v11 setLimit:v10];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)fetchAppLevelVisibilityConstraintsWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke;
  v6[3] = &unk_26478A4F0;
  id v7 = v4;
  id v5 = v4;
  [a1 fetchConfigsWithHandler:v6];
}

void __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F401C0];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKAppLevelSignInVisibility.m", 73, "+[GKAppLevelSignInVisibility fetchAppLevelVisibilityConstraintsWithHandler:]_block_invoke");
  v9 = [v7 dispatchGroupWithName:v8];

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_2;
  v20[3] = &unk_26478A450;
  id v10 = v6;
  id v21 = v10;
  v22 = v28;
  v23 = v26;
  [v9 perform:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_4;
  v17[3] = &unk_26478A4A0;
  id v11 = v5;
  id v18 = v11;
  v19 = v24;
  [v9 perform:v17];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_6;
  v12[3] = &unk_26478A4C8;
  v14 = v28;
  v15 = v26;
  v16 = v24;
  id v13 = *(id *)(a1 + 32);
  [v9 notifyOnMainQueueWithBlock:v12];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

void __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F402D0] shared];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_3;
  v7[3] = &unk_26478A428;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v8 = v3;
  id v6 = v3;
  [v4 promptsDisabledWithConfig:v5 scope:2 handler:v7];
}

uint64_t __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_3(void *a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F402D0] sharedWithoutPersistence];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_5;
  v8[3] = &unk_26478A478;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v7 = v3;
  [v4 loginDisabledWithConfig:v6 scope:3 handler:v8];
}

uint64_t __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_5(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_6(void *a1)
{
  v2 = objc_alloc_init(GKAppLevelSignInVisibilityData);
  [(GKAppLevelSignInVisibilityData *)v2 setAppLevelFullscreenDisabled:*(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24)];
  [(GKAppLevelSignInVisibilityData *)v2 setAppLevelBannerDisabled:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24)];
  [(GKAppLevelSignInVisibilityData *)v2 setProcessLevelPromptDisabled:*(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24)];
  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)didShowBanner
{
  v2 = [MEMORY[0x263F402D0] shared];
  [v2 didShowBanner];

  id v3 = [MEMORY[0x263F402D0] sharedWithoutPersistence];
  [v3 didShowFullscreen];
}

+ (void)didShowFullscreen
{
  v2 = [MEMORY[0x263F402D0] shared];
  [v2 didShowFullscreen];

  id v3 = [MEMORY[0x263F402D0] sharedWithoutPersistence];
  [v3 didShowFullscreen];
}

@end