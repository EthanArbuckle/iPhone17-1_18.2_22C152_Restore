@interface ASGatewayManager
- (ASGatewayManager)init;
- (BOOL)_shouldFilterBlacklistContactDestinations:(id)a3;
- (BOOL)_shouldFilterWhitelistContactDestinations:(id)a3;
- (BOOL)hasReachedMaximumNumberOfFriends;
- (BOOL)isInviteVersionCompatible:(unsigned int)a3;
- (BOOL)isReadyToProcessChanges;
- (BOOL)shouldFilterIncomingMessageFromContact:(id)a3;
- (unsigned)inviteCompatibilityVersion;
- (void)_queue_notifyObservers;
- (void)activitySharingManagerReady:(id)a3;
- (void)addObserver:(id)a3;
- (void)cloudKitManager:(id)a3 didUpdateAccountStatus:(int64_t)a4;
- (void)gatewayStatusWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)updateState;
@end

@implementation ASGatewayManager

- (ASGatewayManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ASGatewayManager;
  v2 = [(ASGatewayManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = HKCreateSerialDispatchQueue();
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v5;

    v2->_currentlyPairedWatchMeetsMinimumVersion = 0;
    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;
  }
  return v2;
}

- (void)activitySharingManagerReady:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 friendListManager];
  friendListManager = self->_friendListManager;
  self->_friendListManager = v5;

  uint64_t v7 = [v4 cloudKitManager];

  cloudKitManager = self->_cloudKitManager;
  self->_cloudKitManager = v7;

  v9 = (STConversation *)[objc_alloc(MEMORY[0x263F67148]) initWithBundleIdentifier:@"com.apple.Fitness"];
  screenTimeConversation = self->_screenTimeConversation;
  self->_screenTimeConversation = v9;

  self->_BOOL currentlyPairedWatchMeetsMinimumVersion = FIDeviceMeetsMinimumOSVersionDaytona();
  ASLoggingInitialize();
  v11 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL currentlyPairedWatchMeetsMinimumVersion = self->_currentlyPairedWatchMeetsMinimumVersion;
    v13[0] = 67109120;
    v13[1] = currentlyPairedWatchMeetsMinimumVersion;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Status for currentlyPairedWatchMeetsMinimumVersion: %{BOOL}d", (uint8_t *)v13, 8u);
  }
  [(ASCloudKitManager *)self->_cloudKitManager addObserver:self];
}

- (void)gatewayStatusWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__ASGatewayManager_gatewayStatusWithCompletion___block_invoke;
  v7[3] = &unk_265215728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __48__ASGatewayManager_gatewayStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    char v3 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x263F0A980] sharedBehavior];
    char v3 = [v4 isStandalonePhoneFitnessMode] ^ 1;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void **)(v2 + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ASGatewayManager_gatewayStatusWithCompletion___block_invoke_2;
  v6[3] = &unk_265218D38;
  char v8 = v3;
  id v7 = *(id *)(a1 + 40);
  [v5 fetchCloudKitAccountStatusWithCompletion:v6];
}

void __48__ASGatewayManager_gatewayStatusWithCompletion___block_invoke_2(uint64_t a1, int a2, char a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  ASLoggingInitialize();
  char v8 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109376;
    int v19 = a2;
    __int16 v20 = 1024;
    int v21 = v9;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Gateway status, iCloud signed in: %{BOOL}d, need to upgrade: %{BOOL}d", buf, 0xEu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ASGatewayManager_gatewayStatusWithCompletion___block_invoke_288;
  block[3] = &unk_265218D10;
  id v10 = *(id *)(a1 + 32);
  char v15 = a2;
  char v16 = *(unsigned char *)(a1 + 40);
  char v17 = a3;
  id v13 = v7;
  id v14 = v10;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__ASGatewayManager_gatewayStatusWithCompletion___block_invoke_288(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), *(void *)(a1 + 32));
}

- (BOOL)hasReachedMaximumNumberOfFriends
{
  uint64_t v2 = [(ASFriendListManager *)self->_friendListManager friends];
  BOOL v3 = ASNumberOfNewFriendsAllowedForFriends() < 1;

  return v3;
}

- (BOOL)shouldFilterIncomingMessageFromContact:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  uint64_t v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Checking whitelist and blacklist for contact %@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [v4 destinations];
  id v7 = [v6 allObjects];
  if ([(ASGatewayManager *)self _shouldFilterWhitelistContactDestinations:v7])
  {
    BOOL v8 = 1;
  }
  else
  {
    int v9 = [v4 destinations];
    BOOL v8 = [(ASGatewayManager *)self _shouldFilterBlacklistContactDestinations:v9];
  }
  return v8;
}

- (BOOL)_shouldFilterWhitelistContactDestinations:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(STConversation *)self->_screenTimeConversation allowableByContactsHandles:v4];
  int v6 = [v5 allowedByScreenTime] ^ 1;
  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Should filter non-whitelisted incoming message from %@: %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (BOOL)_shouldFilterBlacklistContactDestinations:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  ASLoggingInitialize();
  id v4 = (os_log_t *)MEMORY[0x263F23AE0];
  uint64_t v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v3;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Checking destinations: %@ against contacts blacklist for incoming message", buf, 0xCu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        __int16 v11 = objc_msgSend(v10, "_stripFZIDPrefix", (void)v16);
        CMFItemFromString = (const void *)CreateCMFItemFromString();
        int IsItemBlocked = CMFBlockListIsItemBlocked();
        if (CMFItemFromString) {
          CFRelease(CMFItemFromString);
        }
        if (IsItemBlocked)
        {
          ASLoggingInitialize();
          id v14 = *v4;
          if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v21 = v10;
            __int16 v22 = 1024;
            int v23 = 1;
            _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Should filter blacklisted incoming message from %@ = %{BOOL}d", buf, 0x12u);
          }

          LOBYTE(v7) = 1;
          goto LABEL_17;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v7;
}

- (void)updateState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ASGatewayManager_updateState__block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __31__ASGatewayManager_updateState__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = FIDeviceMeetsMinimumOSVersionDaytona();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v3 + 48) != v2)
  {
    *(unsigned char *)(v3 + 48) = v2;
    ASLoggingInitialize();
    id v4 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 67109120;
      int v10 = v5;
      _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Updating state - status for canProcessInvitation: %{BOOL}d", buf, 8u);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__ASGatewayManager_updateState__block_invoke_291;
    block[3] = &unk_2652157F0;
    void block[4] = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __31__ASGatewayManager_updateState__block_invoke_291(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
  v1 = (const char *)*MEMORY[0x263F23CE0];
  return notify_post(v1);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__ASGatewayManager_addObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __32__ASGatewayManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__ASGatewayManager_removeObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __35__ASGatewayManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
}

- (void)_queue_notifyObservers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Gateway Manager status changed. Notifying observers", buf, 2u);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "gatewayManagerStatusDidChange", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)isInviteVersionCompatible:(unsigned int)a3
{
  return [(ASGatewayManager *)self inviteCompatibilityVersion] == a3;
}

- (unsigned)inviteCompatibilityVersion
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x263F23CC8]];
  if ([v3 BOOLForKey:@"MasqueradeActivitySharingInviteVersion"]) {
    unsigned int v4 = 4;
  }
  else {
    unsigned int v4 = 3;
  }

  return v4;
}

- (BOOL)isReadyToProcessChanges
{
  return 1;
}

- (void)cloudKitManager:(id)a3 didUpdateAccountStatus:(int64_t)a4
{
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ASGatewayManager_cloudKitManager_didUpdateAccountStatus___block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(observerQueue, block);
}

uint64_t __59__ASGatewayManager_cloudKitManager_didUpdateAccountStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_screenTimeConversation, 0);
  objc_storeStrong((id *)&self->_cloudKitManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
}

@end