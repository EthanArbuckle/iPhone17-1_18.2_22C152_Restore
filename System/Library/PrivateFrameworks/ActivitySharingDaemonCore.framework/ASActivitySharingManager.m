@interface ASActivitySharingManager
- (ASAchievementManager)achievementManager;
- (ASActivityDataBulletinManager)activityDataBulletinManager;
- (ASActivityDataManager)activityDataManager;
- (ASActivityDataNotificationManager)activityDataNotificationManager;
- (ASActivitySharingManager)initWithDatabaseClient:(id)a3 isWatch:(BOOL)a4;
- (ASActivitySharingManagerSecureCloudDelegate)secureCloudDelegate;
- (ASBulletinPostingManager)bulletinPostingManager;
- (ASCloudKitManager)cloudKitManager;
- (ASCompetitionBulletinManager)competitionBulletinManager;
- (ASCompetitionManager)competitionManager;
- (ASContactsManager)contactsManager;
- (ASDatabaseClient)databaseClient;
- (ASFakeBulletinManager)fakeBulletinManager;
- (ASFakingManager)fakingManager;
- (ASFriendInviteBulletinManager)friendInviteBulletinManager;
- (ASFriendListManager)friendListManager;
- (ASGatewayManager)gatewayManager;
- (ASKeyValueDomain)deviceLocalActivitySharingKeyValueDomain;
- (ASPeriodicUpdateManager)periodicUpdateManager;
- (ASRelationshipManager)relationshipManager;
- (ASSetupManager)setupManager;
- (BOOL)_mainQueue_shouldCompleteSetup;
- (BOOL)_mainQueue_startSubmanagerProcessingIfNeeded;
- (BOOL)_mainQueue_stopSubmanagerProcessingIfNeeded;
- (BOOL)isWatch;
- (BOOL)processingStarted;
- (FIFitnessAppsStateObserver)fitnessAppsStateObserver;
- (id)allFriends;
- (void)_activateActivitySharingManager;
- (void)_deactivateActivitySharingManager;
- (void)_mainQueue_completeSetupIfNeeded;
- (void)_mainQueue_nanoRegistryInfoChanged;
- (void)_mainQueue_notifyObserversOfActivation;
- (void)_mainQueue_notifyObserversOfDeactivation;
- (void)_mainQueue_notifySubmanagersOfManagerReady;
- (void)_updateSubmanagerProcessingStarted:(BOOL)a3;
- (void)_waitUntilSubmanagersReady;
- (void)acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)addFriendListObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)clearFriendListWithCompletion:(id)a3;
- (void)cloudKitAccountStatusWithCompletion:(id)a3;
- (void)completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4;
- (void)daemonReady;
- (void)dealloc;
- (void)expireChangeTokenWithCompletion:(id)a3;
- (void)fetchAllDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4;
- (void)fetchAllDataWithCompletion:(id)a3;
- (void)fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4;
- (void)fetchCodableFriendWithRemoteUUID:(id)a3 completion:(id)a4;
- (void)fetchFriendWithRemoteUUID:(id)a3 completion:(id)a4;
- (void)fitnessAppsStateObserver:(id)a3 applicationInstallStateDidChangeForBundleIdentifiers:(id)a4;
- (void)fitnessAppsStateObserver:(id)a3 restrictedStateDidChange:(int64_t)a4;
- (void)handleNotificationResponse:(id)a3 completion:(id)a4;
- (void)ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)pushActivityDataToAllFriendsWithCompletion:(id)a3;
- (void)pushFakeActivityDataToAllFriendsWithCompletion:(id)a3;
- (void)queryAppBadgeCountWithCompletion:(id)a3;
- (void)removeFriendListObserver:(id)a3;
- (void)removeFriendWithUUID:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)rollCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4;
- (void)sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4;
- (void)sendInviteRequestToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6;
- (void)sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4;
- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5;
- (void)setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5;
- (void)setSecureCloudDelegate:(id)a3;
@end

@implementation ASActivitySharingManager

void __54__ASActivitySharingManager__waitUntilSubmanagersReady__block_invoke_2(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[32] && (objc_msgSend(v1, "_mainQueue_shouldCompleteSetup") & 1) == 0)
  {
    ASLoggingInitialize();
    v2 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
      __54__ASActivitySharingManager__waitUntilSubmanagersReady__block_invoke_2_cold_1(v2);
    }
  }
}

- (void)cloudKitAccountStatusWithCompletion:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v5 = [(ASActivitySharingManager *)self cloudKitManager];
  [v5 fetchCloudKitAccountStatusWithCompletion:v4];
}

- (ASCloudKitManager)cloudKitManager
{
  return self->_cloudKitManager;
}

- (void)queryAppBadgeCountWithCompletion:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v5 = [(ASActivitySharingManager *)self friendListManager];
  [v5 queryAppBadgeCountWithCompletion:v4];
}

- (ASFriendListManager)friendListManager
{
  return self->_friendListManager;
}

- (id)allFriends
{
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  v3 = [(ASActivitySharingManager *)self activityDataManager];
  [v3 loadLocalActivityDataIfNeeded];

  friendListManager = self->_friendListManager;
  return [(ASFriendListManager *)friendListManager friends];
}

- (ASActivityDataManager)activityDataManager
{
  return self->_activityDataManager;
}

intptr_t __54__ASActivitySharingManager__waitUntilSubmanagersReady__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ASActivitySharingManager__waitUntilSubmanagersReady__block_invoke_2;
  block[3] = &unk_2652157F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  return dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_waitUntilSubmanagersReady
{
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  submanagerBarrierQueue = self->_submanagerBarrierQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ASActivitySharingManager__waitUntilSubmanagersReady__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_sync(submanagerBarrierQueue, block);
}

- (ASActivitySharingManager)initWithDatabaseClient:(id)a3 isWatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ASActivitySharingManager;
  v8 = [(ASActivitySharingManager *)&v25 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databaseClient, a3);
    v10 = (FIFitnessAppsStateObserver *)objc_alloc_init(MEMORY[0x263F3D160]);
    fitnessAppsStateObserver = v9->_fitnessAppsStateObserver;
    v9->_fitnessAppsStateObserver = v10;

    [(FIFitnessAppsStateObserver *)v9->_fitnessAppsStateObserver setDelegate:v9];
    v12 = (id *)MEMORY[0x263F3D120];
    if (!v4) {
      v12 = (id *)MEMORY[0x263F3D138];
    }
    objc_storeStrong((id *)&v9->_appBundleIdentifier, *v12);
    v9->_appInstalled = [(FIFitnessAppsStateObserver *)v9->_fitnessAppsStateObserver installStateForBundleIdentifier:v9->_appBundleIdentifier] == 1;
    v9->_fitnessAppsRestricted = [(FIFitnessAppsStateObserver *)v9->_fitnessAppsStateObserver areFitnessAppsRestricted];
    v9->_submanagersProcessingStartedLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = HKCreateSerialDispatchQueue();
    readWriteQueue = v9->_readWriteQueue;
    v9->_readWriteQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = HKCreateConcurrentDispatchQueue();
    submanagerBarrierQueue = v9->_submanagerBarrierQueue;
    v9->_submanagerBarrierQueue = (OS_dispatch_queue *)v15;

    dispatch_group_t v17 = dispatch_group_create();
    submanagerBarrierGroup = v9->_submanagerBarrierGroup;
    v9->_submanagerBarrierGroup = (OS_dispatch_group *)v17;

    dispatch_group_enter((dispatch_group_t)v9->_submanagerBarrierGroup);
    v9->_isWatch = v4;
    *(_WORD *)&v9->_submanagerInitializationComplete = 0;
    uint64_t v19 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v19;

    databaseClient = v9->_databaseClient;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __59__ASActivitySharingManager_initWithDatabaseClient_isWatch___block_invoke;
    v23[3] = &unk_2652157F0;
    v24 = v9;
    [(ASDatabaseClient *)databaseClient performWhenDaemonReady:v23];
  }
  return v9;
}

uint64_t __59__ASActivitySharingManager_initWithDatabaseClient_isWatch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) daemonReady];
}

- (void)dealloc
{
  if (!self->_isWatch)
  {
    if (notify_is_valid_token(self->_nanoRegistryDeviceDidPairToken)) {
      notify_cancel(self->_nanoRegistryDeviceDidPairToken);
    }
    if (notify_is_valid_token(self->_nanoRegistryDeviceDidUnpairToken)) {
      notify_cancel(self->_nanoRegistryDeviceDidUnpairToken);
    }
    if (notify_is_valid_token(self->_nanoRegistryDeviceDidBecomeActiveToken)) {
      notify_cancel(self->_nanoRegistryDeviceDidBecomeActiveToken);
    }
    if (notify_is_valid_token(self->_nanoRegistryDeviceDidChangeVersionToken)) {
      notify_cancel(self->_nanoRegistryDeviceDidChangeVersionToken);
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)ASActivitySharingManager;
  [(ASActivitySharingManager *)&v3 dealloc];
}

- (void)daemonReady
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ASActivitySharingManager_daemonReady__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __39__ASActivitySharingManager_daemonReady__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_completeSetupIfNeeded");
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[80])
  {
    objc_initWeak(&location, v2);
    objc_super v3 = (const char *)[(id)*MEMORY[0x263F576A0] UTF8String];
    BOOL v4 = (int *)(*(void *)(a1 + 32) + 52);
    id v5 = MEMORY[0x263EF83A0];
    id v6 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __39__ASActivitySharingManager_daemonReady__block_invoke_2;
    handler[3] = &unk_265216948;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v3, v4, v5, handler);

    id v7 = (const char *)[(id)*MEMORY[0x263F576B0] UTF8String];
    v8 = (int *)(*(void *)(a1 + 32) + 56);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __39__ASActivitySharingManager_daemonReady__block_invoke_295;
    v17[3] = &unk_265216948;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch(v7, v8, MEMORY[0x263EF83A0], v17);

    v9 = (const char *)[(id)*MEMORY[0x263F576F0] UTF8String];
    v10 = (int *)(*(void *)(a1 + 32) + 60);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__ASActivitySharingManager_daemonReady__block_invoke_296;
    v15[3] = &unk_265216948;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch(v9, v10, MEMORY[0x263EF83A0], v15);

    v11 = (const char *)[(id)*MEMORY[0x263F576D8] UTF8String];
    v12 = (int *)(*(void *)(a1 + 32) + 64);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __39__ASActivitySharingManager_daemonReady__block_invoke_297;
    v13[3] = &unk_265216948;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v11, v12, MEMORY[0x263EF83A0], v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __39__ASActivitySharingManager_daemonReady__block_invoke_2(uint64_t a1)
{
  ASLoggingInitialize();
  v2 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Received NR pairing device did pair notification", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_nanoRegistryInfoChanged");
}

void __39__ASActivitySharingManager_daemonReady__block_invoke_295(uint64_t a1)
{
  ASLoggingInitialize();
  v2 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Received NR pairing device did unpair notification", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_nanoRegistryInfoChanged");
}

void __39__ASActivitySharingManager_daemonReady__block_invoke_296(uint64_t a1)
{
  ASLoggingInitialize();
  v2 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Received NR pairing device did become active notification", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_nanoRegistryInfoChanged");
}

void __39__ASActivitySharingManager_daemonReady__block_invoke_297(uint64_t a1)
{
  ASLoggingInitialize();
  v2 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Received NR pairing status changed notification", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_nanoRegistryInfoChanged");
}

- (BOOL)_mainQueue_shouldCompleteSetup
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  BOOL v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x263F23CC8]];
  char v5 = [v4 BOOLForKey:*MEMORY[0x263F23CB8]];
  if (self->_appInstalled)
  {
    if (self->_fitnessAppsRestricted) {
      char v6 = 0;
    }
    else {
      char v6 = v5 ^ 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_mainQueue_completeSetupIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_submanagerInitializationComplete
    || ![(ASActivitySharingManager *)self _mainQueue_shouldCompleteSetup])
  {
    ASLoggingInitialize();
    v42 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v42, OS_LOG_TYPE_DEFAULT, "Skipping friend manager setup", buf, 2u);
    }
  }
  else
  {
    ASLoggingInitialize();
    id v3 = (os_log_t *)MEMORY[0x263F23AC0];
    BOOL v4 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Running friend manager setup", buf, 2u);
    }
    self->_submanagerInitializationComplete = 1;
    char v5 = [MEMORY[0x263F0A980] sharedBehavior];
    int v6 = [v5 isStandalonePhoneFitnessMode];

    if ((v6 & 1) == 0)
    {
      id v7 = [[ASAchievementManager alloc] initWithIsWatch:self->_isWatch];
      achievementManager = self->_achievementManager;
      self->_achievementManager = v7;
    }
    v9 = [[ASActivityDataManager alloc] initWithDatabaseClient:self->_databaseClient isWatch:self->_isWatch];
    activityDataManager = self->_activityDataManager;
    self->_activityDataManager = v9;

    v11 = objc_alloc_init(ASCloudKitManager);
    cloudKitManager = self->_cloudKitManager;
    self->_cloudKitManager = v11;

    uint64_t v13 = [[ASCompetitionManager alloc] initWithDatabaseClient:self->_databaseClient isWatch:self->_isWatch];
    competitionManager = self->_competitionManager;
    self->_competitionManager = v13;

    uint64_t v15 = [[ASContactsManager alloc] initWithIsWatch:self->_isWatch];
    contactsManager = self->_contactsManager;
    self->_contactsManager = v15;

    dispatch_group_t v17 = [[ASFakingManager alloc] initWithDatabaseClient:self->_databaseClient];
    fakingManager = self->_fakingManager;
    self->_fakingManager = v17;

    uint64_t v19 = [[ASFriendListManager alloc] initWithDatabaseClient:self->_databaseClient isWatch:self->_isWatch];
    friendListManager = self->_friendListManager;
    self->_friendListManager = v19;

    v21 = objc_alloc_init(ASGatewayManager);
    gatewayManager = self->_gatewayManager;
    self->_gatewayManager = v21;

    v23 = [[ASPeriodicUpdateManager alloc] initWithIsWatch:self->_isWatch];
    periodicUpdateManager = self->_periodicUpdateManager;
    self->_periodicUpdateManager = v23;

    objc_super v25 = [[ASRelationshipManager alloc] initWithIsWatch:self->_isWatch];
    relationshipManager = self->_relationshipManager;
    self->_relationshipManager = v25;

    v27 = objc_alloc_init(ASActivityDataBulletinManager);
    activityDataBulletinManager = self->_activityDataBulletinManager;
    self->_activityDataBulletinManager = v27;

    v29 = objc_alloc_init(ASCompetitionBulletinManager);
    competitionBulletinManager = self->_competitionBulletinManager;
    self->_competitionBulletinManager = v29;

    v31 = objc_alloc_init(ASFriendInviteBulletinManager);
    friendInviteBulletinManager = self->_friendInviteBulletinManager;
    self->_friendInviteBulletinManager = v31;

    v33 = objc_alloc_init(ASFakeBulletinManager);
    fakeBulletinManager = self->_fakeBulletinManager;
    self->_fakeBulletinManager = v33;

    v35 = objc_alloc_init(ASSetupManager);
    setupManager = self->_setupManager;
    self->_setupManager = v35;

    if (self->_isWatch) {
      int v37 = 1;
    }
    else {
      int v37 = v6;
    }
    if (v37 != 1) {
      goto LABEL_17;
    }
    ASLoggingInitialize();
    v38 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v38, OS_LOG_TYPE_DEFAULT, "This device is a watch or standalone phone; setting up activity data notification manager.",
        buf,
        2u);
    }
    v39 = [[ASActivityDataNotificationManager alloc] initWithDatabaseClient:self->_databaseClient];
    activityDataNotificationManager = self->_activityDataNotificationManager;
    self->_activityDataNotificationManager = v39;

    if (self->_isWatch) {
      v41 = [[ASGizmoBulletinPostingManager alloc] initWithDatabaseClient:self->_databaseClient];
    }
    else {
LABEL_17:
    }
      v41 = objc_alloc_init(ASCompanionBulletinPostingManager);
    bulletinPostingManager = self->_bulletinPostingManager;
    self->_bulletinPostingManager = (ASBulletinPostingManager *)v41;

    [(ASActivitySharingManager *)self _mainQueue_notifySubmanagersOfManagerReady];
    databaseClient = self->_databaseClient;
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __60__ASActivitySharingManager__mainQueue_completeSetupIfNeeded__block_invoke;
    v45[3] = &unk_2652157F0;
    v45[4] = self;
    [(ASDatabaseClient *)databaseClient performWhenDataProtectedByFirstUnlockIsAvailable:v45];
  }
}

void __60__ASActivitySharingManager__mainQueue_completeSetupIfNeeded__block_invoke(uint64_t a1)
{
  ASLoggingInitialize();
  v2 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Data protected by first unlock available", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, *(id *)(a1 + 32));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ASActivitySharingManager__mainQueue_completeSetupIfNeeded__block_invoke_317;
  block[3] = &unk_265216A20;
  objc_copyWeak(&v6, buf);
  dispatch_sync(v3, block);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__ASActivitySharingManager__mainQueue_completeSetupIfNeeded__block_invoke_2;
  v4[3] = &unk_2652157F0;
  v4[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __60__ASActivitySharingManager__mainQueue_completeSetupIfNeeded__block_invoke_317(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    uint64_t v2 = [WeakRetained[12] makeASKeyValueDomainWithDomainName:@"ActivitySharing" category:3];
    id v3 = v4[31];
    v4[31] = (id)v2;

    id WeakRetained = v4;
  }
}

void __60__ASActivitySharingManager__mainQueue_completeSetupIfNeeded__block_invoke_2(uint64_t a1)
{
  int v1 = objc_msgSend(*(id *)(a1 + 32), "_mainQueue_startSubmanagerProcessingIfNeeded");
  ASLoggingInitialize();
  uint64_t v2 = *MEMORY[0x263F23AC0];
  BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "ActivitySharingManager setup complete", buf, 2u);
    }
    BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"ActivitySharingMangerProcessingStartedNotification" object:0];
  }
  else if (v3)
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "ActivitySharingManager final setup skipped", v5, 2u);
  }
}

- (BOOL)_mainQueue_startSubmanagerProcessingIfNeeded
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  ASLoggingInitialize();
  BOOL v3 = (os_log_t *)MEMORY[0x263F23AC0];
  BOOL v4 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to start submanagers", (uint8_t *)&v18, 2u);
  }
  BOOL v5 = [(ASActivitySharingManager *)self processingStarted];
  if (self->_appInstalled)
  {
    if (self->_fitnessAppsRestricted)
    {
      ASLoggingInitialize();
      os_log_t v6 = *v3;
      BOOL v7 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
      BOOL v8 = 0;
      if (v7)
      {
        LOWORD(v18) = 0;
        v9 = "Not starting submanagers, fitness apps are restricted";
LABEL_12:
        uint64_t v13 = v6;
        uint32_t v14 = 2;
        goto LABEL_13;
      }
    }
    else
    {
      if (!v5)
      {
        id v16 = [MEMORY[0x263F431B0] transactionWithOwner:self];
        [(ASContactsManager *)self->_contactsManager loadCachedContacts];
        [(ASCompetitionManager *)self->_competitionManager loadCachedCompetitions];
        [(ASFriendListManager *)self->_friendListManager initializeFriendListAndBeginObserving];
        [(ASCloudKitManager *)self->_cloudKitManager beginHandlingOperations];
        [(ASActivityDataManager *)self->_activityDataManager beginObservingData];
        [(ASActivityDataNotificationManager *)self->_activityDataNotificationManager beginObserving];
        [(ASRelationshipManager *)self->_relationshipManager beginReceivingMessages];
        [(ASFakeBulletinManager *)self->_fakeBulletinManager registerBulletins];
        [(ASActivitySharingManager *)self _mainQueue_notifyObserversOfActivation];
        dispatch_group_leave((dispatch_group_t)self->_submanagerBarrierGroup);
        BOOL v8 = 1;
        [(ASActivitySharingManager *)self _updateSubmanagerProcessingStarted:1];
        [v16 invalidate];

        return v8;
      }
      ASLoggingInitialize();
      os_log_t v6 = *v3;
      BOOL v15 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
      BOOL v8 = 0;
      if (v15)
      {
        LOWORD(v18) = 0;
        v9 = "Not starting submanagers, processing has already started";
        goto LABEL_12;
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    os_log_t v10 = *v3;
    BOOL v11 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
    BOOL v8 = 0;
    if (v11)
    {
      appBundleIdentifier = self->_appBundleIdentifier;
      int v18 = 138543362;
      uint64_t v19 = appBundleIdentifier;
      v9 = "Not starting submanagers, %{public}@ is not installed";
      uint64_t v13 = v10;
      uint32_t v14 = 12;
LABEL_13:
      _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v18, v14);
      return 0;
    }
  }
  return v8;
}

- (BOOL)_mainQueue_stopSubmanagerProcessingIfNeeded
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  ASLoggingInitialize();
  BOOL v3 = (NSObject **)MEMORY[0x263F23AC0];
  BOOL v4 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to stop submanagers", (uint8_t *)&v17, 2u);
  }
  BOOL v5 = [(ASActivitySharingManager *)self processingStarted];
  os_log_t v6 = (id *)MEMORY[0x263F3D120];
  if (!self->_isWatch) {
    os_log_t v6 = (id *)MEMORY[0x263F3D138];
  }
  id v7 = *v6;
  if (self->_appInstalled && !self->_fitnessAppsRestricted)
  {
    ASLoggingInitialize();
    uint32_t v14 = *v3;
    BOOL v10 = 0;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    appBundleIdentifier = self->_appBundleIdentifier;
    int v17 = 138543362;
    int v18 = appBundleIdentifier;
    BOOL v11 = "Not stopping submanagers, %{public}@ is installed and fitness apps are not restricted";
    v12 = v14;
    uint32_t v13 = 12;
    goto LABEL_15;
  }
  ASLoggingInitialize();
  BOOL v8 = *v3;
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (!v9)
    {
LABEL_16:
      BOOL v10 = 0;
      goto LABEL_17;
    }
    LOWORD(v17) = 0;
    BOOL v11 = "Not stopping submanagers, processing has not been started";
    v12 = v8;
    uint32_t v13 = 2;
LABEL_15:
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
    goto LABEL_16;
  }
  if (v9)
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Proceeding with submanager shutdown", (uint8_t *)&v17, 2u);
  }
  [(ASFriendListManager *)self->_friendListManager endObserving];
  [(ASCloudKitManager *)self->_cloudKitManager endHandlingOperations];
  [(ASActivityDataManager *)self->_activityDataManager endObservingData];
  [(ASActivityDataNotificationManager *)self->_activityDataNotificationManager endObserving];
  [(ASFakeBulletinManager *)self->_fakeBulletinManager deregisterBulletins];
  [(ASRelationshipManager *)self->_relationshipManager endReceivingMessages];
  [(ASPeriodicUpdateManager *)self->_periodicUpdateManager endPeriodicUpdates];
  [(ASActivitySharingManager *)self _mainQueue_notifyObserversOfDeactivation];
  dispatch_group_enter((dispatch_group_t)self->_submanagerBarrierGroup);
  [(ASActivitySharingManager *)self _updateSubmanagerProcessingStarted:0];
  BOOL v10 = 1;
LABEL_17:

  return v10;
}

- (void)_mainQueue_notifySubmanagersOfManagerReady
{
  v45[15] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v36 = [(ASActivitySharingManager *)self activityDataManager];
  v45[0] = v36;
  v35 = [(ASActivitySharingManager *)self cloudKitManager];
  v45[1] = v35;
  v34 = [(ASActivitySharingManager *)self competitionManager];
  v45[2] = v34;
  v33 = [(ASActivitySharingManager *)self contactsManager];
  v45[3] = v33;
  v32 = [(ASActivitySharingManager *)self fakingManager];
  v45[4] = v32;
  v31 = [(ASActivitySharingManager *)self friendListManager];
  void v45[5] = v31;
  v30 = [(ASActivitySharingManager *)self gatewayManager];
  v45[6] = v30;
  BOOL v3 = [(ASActivitySharingManager *)self periodicUpdateManager];
  v45[7] = v3;
  BOOL v4 = [(ASActivitySharingManager *)self relationshipManager];
  v45[8] = v4;
  BOOL v5 = [(ASActivitySharingManager *)self activityDataBulletinManager];
  v45[9] = v5;
  os_log_t v6 = [(ASActivitySharingManager *)self competitionBulletinManager];
  v45[10] = v6;
  id v7 = [(ASActivitySharingManager *)self friendInviteBulletinManager];
  v45[11] = v7;
  BOOL v8 = [(ASActivitySharingManager *)self fakeBulletinManager];
  v45[12] = v8;
  BOOL v9 = [(ASActivitySharingManager *)self bulletinPostingManager];
  v45[13] = v9;
  BOOL v10 = [(ASActivitySharingManager *)self setupManager];
  v45[14] = v10;
  BOOL v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:15];

  v12 = [(ASActivitySharingManager *)self achievementManager];

  if (v12)
  {
    uint32_t v13 = [(ASActivitySharingManager *)self achievementManager];
    v44 = v13;
    uint32_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    uint64_t v15 = [v14 arrayByAddingObjectsFromArray:v11];

    BOOL v11 = (void *)v15;
  }
  id v16 = [(ASActivitySharingManager *)self activityDataNotificationManager];

  if (v16)
  {
    int v17 = [(ASActivitySharingManager *)self activityDataNotificationManager];
    uint64_t v18 = [v11 arrayByAddingObject:v17];

    BOOL v11 = (void *)v18;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v19 = v11;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v38;
    v23 = (os_log_t *)MEMORY[0x263F23AC0];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_super v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          ASLoggingInitialize();
          os_log_t v26 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v26;
            v28 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v42 = v28;
            id v29 = v28;
            _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "Notifying object of class %{public}@ of Activity Sharing Manager ready.", buf, 0xCu);
          }
          [v25 activitySharingManagerReady:self];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v21);
  }
}

- (BOOL)processingStarted
{
  uint64_t v2 = self;
  p_submanagersProcessingStartedLock = &self->_submanagersProcessingStartedLock;
  os_unfair_lock_lock(&self->_submanagersProcessingStartedLock);
  LOBYTE(v2) = v2->_submanagerProcessingStarted;
  os_unfair_lock_unlock(p_submanagersProcessingStartedLock);
  return (char)v2;
}

- (void)_updateSubmanagerProcessingStarted:(BOOL)a3
{
  p_submanagersProcessingStartedLock = &self->_submanagersProcessingStartedLock;
  os_unfair_lock_lock(&self->_submanagersProcessingStartedLock);
  self->_submanagerProcessingStarted = a3;
  os_unfair_lock_unlock(p_submanagersProcessingStartedLock);
}

- (void)_mainQueue_nanoRegistryInfoChanged
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  ASLoggingInitialize();
  BOOL v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "NanoSyncManager updated status, completing setup if needed", v4, 2u);
  }
  [(ASActivitySharingManager *)self _mainQueue_completeSetupIfNeeded];
  [(ASGatewayManager *)self->_gatewayManager updateState];
}

- (void)fitnessAppsStateObserver:(id)a3 applicationInstallStateDidChangeForBundleIdentifiers:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  ASLoggingInitialize();
  os_log_t v6 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "ActivitySharingManager applications install state changed: %{public}@", buf, 0xCu);
  }
  if ([v5 containsObject:self->_appBundleIdentifier])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__ASActivitySharingManager_fitnessAppsStateObserver_applicationInstallStateDidChangeForBundleIdentifiers___block_invoke;
    block[3] = &unk_2652157F0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __106__ASActivitySharingManager_fitnessAppsStateObserver_applicationInstallStateDidChangeForBundleIdentifiers___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = [*(id *)(*(void *)(a1 + 32) + 104) installStateForBundleIdentifier:*(void *)(*(void *)(a1 + 32) + 40)] == 1;
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[48])
  {
    return [v2 _activateActivitySharingManager];
  }
  else
  {
    return [v2 _deactivateActivitySharingManager];
  }
}

- (void)fitnessAppsStateObserver:(id)a3 restrictedStateDidChange:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  os_log_t v6 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v9 = a4;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "ActivitySharingManager fitness apps restriction state changed: %ld", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__ASActivitySharingManager_fitnessAppsStateObserver_restrictedStateDidChange___block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __78__ASActivitySharingManager_fitnessAppsStateObserver_restrictedStateDidChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = [*(id *)(*(void *)(a1 + 32) + 104) areFitnessAppsRestricted];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[49])
  {
    return [v2 _deactivateActivitySharingManager];
  }
  else
  {
    return [v2 _activateActivitySharingManager];
  }
}

- (void)_activateActivitySharingManager
{
  ASLoggingInitialize();
  BOOL v3 = (os_log_t *)MEMORY[0x263F23AC0];
  BOOL v4 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "ActivitySharingManager activating after app install/restriction state changed", buf, 2u);
  }
  if ([(ASDatabaseClient *)self->_databaseClient isDataProtectedByFirstUnlockAvailable])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__ASActivitySharingManager__activateActivitySharingManager__block_invoke;
    block[3] = &unk_2652157F0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    ASLoggingInitialize();
    id v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ActivitySharingManager data protected by first unlock not available, not responding to installation", buf, 2u);
    }
  }
}

void __59__ASActivitySharingManager__activateActivitySharingManager__block_invoke(uint64_t a1)
{
  int v1 = *(unsigned char **)(a1 + 32);
  if (v1[32])
  {
    if (objc_msgSend(v1, "_mainQueue_startSubmanagerProcessingIfNeeded"))
    {
      id v2 = [MEMORY[0x263F08A00] defaultCenter];
      [v2 postNotificationName:@"ActivitySharingMangerProcessingStartedNotification" object:0];
    }
  }
  else
  {
    objc_msgSend(v1, "_mainQueue_completeSetupIfNeeded");
  }
}

- (void)_deactivateActivitySharingManager
{
  ASLoggingInitialize();
  BOOL v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "ActivitySharingManager deactivating after app install/restriction state changed", buf, 2u);
  }
  ASRemoveAllActivitySharingUserDefaults();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ASActivitySharingManager__deactivateActivitySharingManager__block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__ASActivitySharingManager__deactivateActivitySharingManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_stopSubmanagerProcessingIfNeeded");
}

- (void)sendInviteRequestToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  [(ASRelationshipManager *)self->_relationshipManager sendInviteToPersonWithDestination:v13 callerID:v12 serviceIdentifier:v11 completion:v10];
}

- (void)acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  relationshipManager = self->_relationshipManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASRelationshipManager *)relationshipManager acceptInviteRequestFromFriendWithUUID:v9 completion:v6];
}

- (void)sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  relationshipManager = self->_relationshipManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASRelationshipManager *)relationshipManager sendWithdrawInviteRequestToFriendWithUUID:v9 completion:v6];
}

- (void)setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  relationshipManager = self->_relationshipManager;
  id v11 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];

  [(ASRelationshipManager *)relationshipManager setMuteEnabled:v6 forFriendWithUUID:v11 completion:v8];
}

- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  relationshipManager = self->_relationshipManager;
  id v11 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];

  [(ASRelationshipManager *)relationshipManager setActivityDataVisible:v6 toFriendWithUUID:v11 completion:v8];
}

- (void)removeFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  relationshipManager = self->_relationshipManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASRelationshipManager *)relationshipManager removeFriendWithUUID:v9 completion:v6];
}

- (void)ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  relationshipManager = self->_relationshipManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASRelationshipManager *)relationshipManager ignoreInviteRequestFromFriendWithUUID:v9 completion:v6];
}

- (void)sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  competitionManager = self->_competitionManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASCompetitionManager *)competitionManager sendCompetitionRequestToFriendWithUUID:v9 completion:v6];
}

- (void)acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  competitionManager = self->_competitionManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASCompetitionManager *)competitionManager acceptCompetitionRequestFromFriendWithUUID:v9 completion:v6];
}

- (void)ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  competitionManager = self->_competitionManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASCompetitionManager *)competitionManager ignoreCompetitionRequestFromFriendWithUUID:v9 completion:v6];
}

- (void)completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  competitionManager = self->_competitionManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASCompetitionManager *)competitionManager completeCompetitionWithFriendWithUUID:v9 completion:v6];
}

- (void)rollCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  competitionManager = self->_competitionManager;
  id v9 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [(ASCompetitionManager *)competitionManager rollCompetitionWithFriendWithUUID:v9 completion:v6];
}

- (void)pushActivityDataToAllFriendsWithCompletion:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v6 = [(ASActivitySharingManager *)self periodicUpdateManager];
  id v5 = ASCloudKitGroupUserActionExplicit();
  [v6 requestImmediateUpdateWithCloudKitGroup:v5 completion:v4];
}

- (void)fetchAllDataWithCompletion:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v6 = [(ASActivitySharingManager *)self cloudKitManager];
  id v5 = ASCloudKitGroupUserActionExplicit();
  [v6 fetchAllChangesWithPriority:2 activity:0 group:v5 completion:v4];
}

- (void)fetchAllDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v7 = [(ASActivitySharingManager *)self activityDataManager];
  [v7 loadLocalActivityDataIfNeeded];

  id v9 = [(ASActivitySharingManager *)self cloudKitManager];
  id v8 = ASCloudKitGroupUserActionExplicit();
  [v9 fetchAllChangesIfTimeSinceLastFetchIsGreaterThan:a3 priority:2 activity:0 group:v8 completion:v6];
}

- (void)expireChangeTokenWithCompletion:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v5 = [(ASActivitySharingManager *)self cloudKitManager];
  [v5 expireChangeTokenWithCompletion:v4];
}

- (void)fetchAreMultipleDevicesSharingDataForSnapshotIndex:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v8 = [(ASActivitySharingManager *)self activityDataManager];
  [v8 fetchAreMultipleDevicesSharingDataForSnapshotIndex:v7 withCompletion:v6];
}

- (void)pushFakeActivityDataToAllFriendsWithCompletion:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v5 = [(ASActivitySharingManager *)self fakingManager];
  [v5 pushFakeActivityDataToAllFriendsWithCompletion:v4];
}

- (void)clearFriendListWithCompletion:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v5 = [(ASActivitySharingManager *)self friendListManager];
  [v5 clearFriendListWithCompletion:v4];
}

- (void)fetchCodableFriendWithRemoteUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v9 = [(ASActivitySharingManager *)self friendListManager];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [v9 fetchCodableFriendWithRemoteUUID:v8 completion:v6];
}

- (void)fetchFriendWithRemoteUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v9 = [(ASActivitySharingManager *)self friendListManager];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];

  [v9 fetchfriendDataWithRemoteUUID:v8 completion:v6];
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v8 = [(ASActivitySharingManager *)self bulletinPostingManager];
  [v8 handleNotificationResponse:v7 completion:v6];
}

- (void)addFriendListObserver:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v5 = [(ASActivitySharingManager *)self friendListManager];
  [v5 addObserver:v4];
}

- (void)removeFriendListObserver:(id)a3
{
  id v4 = a3;
  [(ASActivitySharingManager *)self _waitUntilSubmanagersReady];
  id v5 = [(ASActivitySharingManager *)self friendListManager];
  [v5 removeObserver:v4];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__ASActivitySharingManager_addObserver___block_invoke;
  v6[3] = &unk_2652157C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __40__ASActivitySharingManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__ASActivitySharingManager_removeObserver___block_invoke;
  v6[3] = &unk_2652157C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __43__ASActivitySharingManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

- (void)_mainQueue_notifyObserversOfActivation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "activitySharingManagerActivated:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_mainQueue_notifyObserversOfDeactivation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "activitySharingManagerDeactivated:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (ASActivitySharingManagerSecureCloudDelegate)secureCloudDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
  return (ASActivitySharingManagerSecureCloudDelegate *)WeakRetained;
}

- (void)setSecureCloudDelegate:(id)a3
{
}

- (ASDatabaseClient)databaseClient
{
  return self->_databaseClient;
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (FIFitnessAppsStateObserver)fitnessAppsStateObserver
{
  return self->_fitnessAppsStateObserver;
}

- (ASAchievementManager)achievementManager
{
  return self->_achievementManager;
}

- (ASActivityDataNotificationManager)activityDataNotificationManager
{
  return self->_activityDataNotificationManager;
}

- (ASActivityDataBulletinManager)activityDataBulletinManager
{
  return self->_activityDataBulletinManager;
}

- (ASCompetitionManager)competitionManager
{
  return self->_competitionManager;
}

- (ASCompetitionBulletinManager)competitionBulletinManager
{
  return self->_competitionBulletinManager;
}

- (ASContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (ASFakeBulletinManager)fakeBulletinManager
{
  return self->_fakeBulletinManager;
}

- (ASFakingManager)fakingManager
{
  return self->_fakingManager;
}

- (ASFriendInviteBulletinManager)friendInviteBulletinManager
{
  return self->_friendInviteBulletinManager;
}

- (ASGatewayManager)gatewayManager
{
  return self->_gatewayManager;
}

- (ASPeriodicUpdateManager)periodicUpdateManager
{
  return self->_periodicUpdateManager;
}

- (ASRelationshipManager)relationshipManager
{
  return self->_relationshipManager;
}

- (ASBulletinPostingManager)bulletinPostingManager
{
  return self->_bulletinPostingManager;
}

- (ASSetupManager)setupManager
{
  return self->_setupManager;
}

- (ASKeyValueDomain)deviceLocalActivitySharingKeyValueDomain
{
  return self->_deviceLocalActivitySharingKeyValueDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLocalActivitySharingKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_bulletinPostingManager, 0);
  objc_storeStrong((id *)&self->_relationshipManager, 0);
  objc_storeStrong((id *)&self->_periodicUpdateManager, 0);
  objc_storeStrong((id *)&self->_gatewayManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_friendInviteBulletinManager, 0);
  objc_storeStrong((id *)&self->_fakingManager, 0);
  objc_storeStrong((id *)&self->_fakeBulletinManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_competitionBulletinManager, 0);
  objc_storeStrong((id *)&self->_competitionManager, 0);
  objc_storeStrong((id *)&self->_cloudKitManager, 0);
  objc_storeStrong((id *)&self->_activityDataBulletinManager, 0);
  objc_storeStrong((id *)&self->_activityDataNotificationManager, 0);
  objc_storeStrong((id *)&self->_activityDataManager, 0);
  objc_storeStrong((id *)&self->_achievementManager, 0);
  objc_storeStrong((id *)&self->_fitnessAppsStateObserver, 0);
  objc_storeStrong((id *)&self->_databaseClient, 0);
  objc_destroyWeak((id *)&self->_secureCloudDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_submanagerBarrierGroup, 0);
  objc_storeStrong((id *)&self->_submanagerBarrierQueue, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);
}

void __54__ASActivitySharingManager__waitUntilSubmanagersReady__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "ASActivitySharingManager method called when submanagers will not be initialized, waiting forever is expected.", v1, 2u);
}

@end