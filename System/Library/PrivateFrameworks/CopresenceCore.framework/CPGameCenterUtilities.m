@interface CPGameCenterUtilities
+ (id)shared;
- (BOOL)supportsBundleID:(id)a3;
- (CPGameCenterUtilities)init;
- (CPThreadSafeMutableSet)supportedBundleIDs;
- (void)fetchGameCenterMultiplayerGameStatusForBundleID:(id)a3 handler:(id)a4;
- (void)fetchOnDeviceMultiplayerBundleIDsWithHandler:(id)a3;
@end

@implementation CPGameCenterUtilities

- (CPGameCenterUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPGameCenterUtilities;
  v2 = [(CPGameCenterUtilities *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CPThreadSafeMutableSet);
    supportedBundleIDs = v2->_supportedBundleIDs;
    v2->_supportedBundleIDs = v3;
  }
  return v2;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)shared_sCPGameCenterUtilities;
  return v2;
}

uint64_t __31__CPGameCenterUtilities_shared__block_invoke()
{
  shared_sCPGameCenterUtilities = objc_alloc_init(CPGameCenterUtilities);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)supportsBundleID:(id)a3
{
  return [(CPThreadSafeMutableSet *)self->_supportedBundleIDs containsObject:a3];
}

- (void)fetchOnDeviceMultiplayerBundleIDsWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [getGKLocalPlayerClass() localPlayer];
  objc_super v6 = [getGKDaemonProxyClass() proxyForPlayer:v5];
  v7 = [v6 multiplayerService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CPGameCenterUtilities_fetchOnDeviceMultiplayerBundleIDsWithHandler___block_invoke;
  v9[3] = &unk_1E5FF1A18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 fetchOnDeviceMultiplayerBundleIDsWithHandler:v9];
}

void __70__CPGameCenterUtilities_fetchOnDeviceMultiplayerBundleIDsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = cpGameCenterLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1B0DF7000, v7, OS_LOG_TYPE_DEFAULT, "error encountered calling fetchOnDeviceMultiplayerBundleIDsWithHandler: error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v8 = cpGameCenterLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1B0DF7000, v8, OS_LOG_TYPE_DEFAULT, "fetched on device multiplayer bundleIDs: %@", (uint8_t *)&v12, 0xCu);
  }

  v9 = [*(id *)(a1 + 32) supportedBundleIDs];
  id v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [v9 unionSet:v10];

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

- (void)fetchGameCenterMultiplayerGameStatusForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [getGKLocalPlayerClass() localPlayer];
  v9 = [getGKDaemonProxyClass() proxyForPlayer:v8];
  id v10 = [v9 multiplayerService];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CPGameCenterUtilities_fetchGameCenterMultiplayerGameStatusForBundleID_handler___block_invoke;
  v13[3] = &unk_1E5FF1A40;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 isGameCenterMultiplayerGameForBundleID:v12 handler:v13];
}

void __81__CPGameCenterUtilities_fetchGameCenterMultiplayerGameStatusForBundleID_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = cpGameCenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1B0DF7000, v6, OS_LOG_TYPE_DEFAULT, "error encountered calling fetchGameCenterMultiplayerGameStatusForBundleID:handler: error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v7 = cpGameCenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    v9 = [NSNumber numberWithBool:a2];
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1B0DF7000, v7, OS_LOG_TYPE_DEFAULT, "fetched Game Center multiplayer game status for: %@, is: %@", (uint8_t *)&v12, 0x16u);
  }
  if (a2)
  {
    id v10 = [*(id *)(a1 + 40) supportedBundleIDs];
    [v10 addObject:*(void *)(a1 + 32)];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

- (CPThreadSafeMutableSet)supportedBundleIDs
{
  return self->_supportedBundleIDs;
}

- (void).cxx_destruct
{
}

@end