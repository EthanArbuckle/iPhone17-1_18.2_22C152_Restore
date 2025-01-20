@interface FMFSession
+ (BOOL)FMFAllowed;
+ (BOOL)FMFRestricted;
+ (BOOL)isAnyAccountManaged;
+ (BOOL)isProvisionedForLocationSharing;
+ (FMFSession)sharedInstance;
- (BOOL)_isNoMappingPacketReturnedError:(id)a3;
- (BOOL)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5;
- (BOOL)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5;
- (BOOL)is5XXError:(id)a3;
- (BOOL)isModelInitialized;
- (BOOL)isMyLocationEnabled;
- (BOOL)shouldHandleErrorInFWK:(id)a3;
- (FMFSession)init;
- (FMFSession)initWithDelegate:(id)a3;
- (FMFSession)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (FMFSessionDelegate)delegate;
- (FMFuture)sessionInterruptionFuture;
- (FMFuture)sessionInvalidationFuture;
- (NSMutableDictionary)cachedCanShareLocationWithHandleByHandle;
- (NSMutableDictionary)cachedLocationForHandleByHandle;
- (NSMutableDictionary)cachedOfferExpirationForHandleByHandle;
- (NSMutableSet)internalHandles;
- (NSOperationQueue)delegateQueue;
- (NSSet)cachedGetHandlesFollowingMyLocation;
- (NSSet)cachedGetHandlesSharingLocationsWithMe;
- (NSSet)handles;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)handlesQueue;
- (double)maxLocatingInterval;
- (id)__connection;
- (id)cachedLocationForHandle:(id)a3;
- (id)getActiveLocationSharingDevice;
- (id)getAllDevices;
- (id)getFavoritesSharingLocationWithMe;
- (id)getHandlesFollowingMyLocation;
- (id)getHandlesSharingLocationsWithMe;
- (id)getHandlesWithPendingOffers;
- (id)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5;
- (id)serverProxy;
- (id)verifyRestrictionsAndShowDialogIfRequired;
- (void)_checkAndDisplayMeDeviceSwitchAlert;
- (void)_daemonDidLaunch;
- (void)_registerForApplicationLifecycleEvents;
- (void)_registerForFMFDLaunchedNotification;
- (void)_sendAutoSwitchMeDevice;
- (void)_sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)abDidChange;
- (void)abPreferencesDidChange;
- (void)addFavorite:(id)a3 completion:(id)a4;
- (void)addFence:(id)a3 completion:(id)a4;
- (void)addHandles:(id)a3;
- (void)addInterruptionHander:(id)a3;
- (void)addInvalidationHander:(id)a3;
- (void)approveFriendshipRequest:(id)a3 completion:(id)a4;
- (void)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)canOfferToHandles:(id)a3 completion:(id)a4;
- (void)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)contactForPayload:(id)a3 completion:(id)a4;
- (void)crashDaemon;
- (void)dataForPayload:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)declineFriendshipRequest:(id)a3 completion:(id)a4;
- (void)decryptPayload:(id)a3 withToken:(id)a4 completion:(id)a5;
- (void)deleteFence:(id)a3 completion:(id)a4;
- (void)didAddFollowerHandle:(id)a3;
- (void)didChangeActiveLocationSharingDevice:(id)a3;
- (void)didReceiveFriendshipRequest:(id)a3;
- (void)didReceiveServerError:(id)a3;
- (void)didRemoveFollowerHandle:(id)a3;
- (void)didStartFollowingHandle:(id)a3;
- (void)didStopFollowingHandle:(id)a3;
- (void)didUpdateActiveDeviceList:(id)a3;
- (void)didUpdateFavorites:(id)a3;
- (void)didUpdateFences:(id)a3;
- (void)didUpdateFollowers:(id)a3;
- (void)didUpdateFollowing:(id)a3;
- (void)didUpdateHideFromFollowersStatus:(BOOL)a3;
- (void)didUpdateLocations:(id)a3;
- (void)didUpdatePendingOffersForHandles:(id)a3;
- (void)didUpdatePreferences:(id)a3;
- (void)dispatchOnDelegateQueue:(id)a3;
- (void)dumpStateWithCompletion:(id)a3;
- (void)encryptPayload:(id)a3 completion:(id)a4;
- (void)exit5XXGracePeriod;
- (void)extendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)failedToGetLocationForHandle:(id)a3 error:(id)a4;
- (void)favoritesForMaxCount:(id)a3 completion:(id)a4;
- (void)fencesForHandles:(id)a3 completion:(id)a4;
- (void)forceRefresh;
- (void)forceRefreshWithCompletion:(id)a3;
- (void)getAccountEmailAddress:(id)a3;
- (void)getActiveLocationSharingDevice:(id)a3;
- (void)getAllDevices:(id)a3;
- (void)getAllLocations:(id)a3;
- (void)getDataForPerformanceRequest:(id)a3;
- (void)getFavoritesWithCompletion:(id)a3;
- (void)getFences:(id)a3;
- (void)getHandlesFollowingMyLocation:(id)a3;
- (void)getHandlesFollowingMyLocationWithGroupId:(id)a3 completion:(id)a4;
- (void)getHandlesSharingLocationsWithMe:(id)a3;
- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4;
- (void)getHandlesWithPendingOffers:(id)a3;
- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)getPendingFriendshipRequestsWithCompletion:(id)a3;
- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 completion:(id)a5;
- (void)getPrettyNameForHandle:(id)a3 completion:(id)a4;
- (void)getRecordIdForHandle:(id)a3 completion:(id)a4;
- (void)getThisDeviceAndCompanion:(id)a3;
- (void)handleAndLocationForPayload:(id)a3 completion:(id)a4;
- (void)handleIncomingAirDropURL:(id)a3 completion:(id)a4;
- (void)iCloudAccountNameWithCompletion:(id)a3;
- (void)includeDeviceInAutomations:(id)a3;
- (void)invalidate;
- (void)isAllowFriendRequestsEnabled:(id)a3;
- (void)isIn5XXGracePeriodWithCompletion:(id)a3;
- (void)isMyLocationEnabled:(id)a3;
- (void)locatingInProgressChanged:(id)a3;
- (void)locationForHandle:(id)a3 completion:(id)a4;
- (void)mappingPacketSendFailed:(id)a3 toHandle:(id)a4 withError:(id)a5;
- (void)modelDidLoad;
- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5;
- (void)nearbyLocationsWithCompletion:(id)a3;
- (void)networkReachabilityUpdated:(BOOL)a3;
- (void)receivedMappingPacket:(id)a3 completion:(id)a4;
- (void)refreshLocationForHandle:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6;
- (void)refreshLocationForHandles:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6;
- (void)reloadDataIfNotLoaded;
- (void)removeDevice:(id)a3 completion:(id)a4;
- (void)removeFavorite:(id)a3 completion:(id)a4;
- (void)removeHandles:(id)a3;
- (void)restoreClientConnection;
- (void)sendFriendshipInviteToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)sendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)sendIDSMessage:(id)a3 toIdentifier:(id)a4 completion:(id)a5;
- (void)sendIDSPacket:(id)a3 toHandle:(id)a4;
- (void)sendMappingPacket:(id)a3 toHandle:(id)a4;
- (void)sendNotNowToHandle:(id)a3 callerId:(id)a4 completion:(id)a5;
- (void)sessionHandleReport:(id)a3;
- (void)setActiveDevice:(id)a3 completion:(id)a4;
- (void)setAllowFriendRequestsEnabled:(BOOL)a3 completion:(id)a4;
- (void)setCachedCanShareLocationWithHandleByHandle:(id)a3;
- (void)setCachedGetHandlesFollowingMyLocation:(id)a3;
- (void)setCachedGetHandlesSharingLocationsWithMe:(id)a3;
- (void)setCachedLocationForHandleByHandle:(id)a3;
- (void)setCachedOfferExpirationForHandleByHandle:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setDebugContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setExpiredInitTimestamp;
- (void)setHandles:(id)a3;
- (void)setHandlesQueue:(id)a3;
- (void)setHideMyLocationEnabled:(BOOL)a3 completion:(id)a4;
- (void)setInternalHandles:(id)a3;
- (void)setIsModelInitialized:(BOOL)a3;
- (void)setLocations:(id)a3;
- (void)setSessionInterruptionFuture:(id)a3;
- (void)setSessionInvalidationFuture:(id)a3;
- (void)showMeDeviceAlert;
- (void)showShareMyLocationRestrictedAlert;
- (void)showShareMyLocationiCloudSettingsOffAlert;
- (void)stopSharingMyLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)stopSharingMyLocationWithHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7;
- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8;
@end

@implementation FMFSession

uint64_t __38__FMFSession_dispatchOnDelegateQueue___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __30__FMFSession_didUpdateFences___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 didUpdateFences:*(void *)(a1 + 40)];
  }
}

void __21__FMFSession_dealloc__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  --sessionCount;
  v0 = LogCategory_Daemon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 134217984;
    uint64_t v2 = sessionCount;
    _os_log_impl(&dword_20AD87000, v0, OS_LOG_TYPE_DEFAULT, "FMFSession current session count (%ld)", (uint8_t *)&v1, 0xCu);
  }
}

void __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_1(uint64_t a1)
{
  uint64_t v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice invalidated. Finishing with error.", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:1020 userInfo:0];
  [v3 finishWithError:v4];
}

void __36__FMFSession_addInterruptionHander___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained sessionInterruptionFuture];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__FMFSession_addInterruptionHander___block_invoke_2;
  v5[3] = &unk_263FE7688;
  id v6 = *(id *)(a1 + 32);
  id v4 = (id)[v3 addSuccessBlock:v5];
}

void __36__FMFSession_addInvalidationHander___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained sessionInvalidationFuture];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__FMFSession_addInvalidationHander___block_invoke_2;
  v5[3] = &unk_263FE7688;
  id v6 = *(id *)(a1 + 32);
  id v4 = (id)[v3 addSuccessBlock:v5];
}

- (FMFuture)sessionInvalidationFuture
{
  return self->_sessionInvalidationFuture;
}

- (FMFuture)sessionInterruptionFuture
{
  return self->_sessionInterruptionFuture;
}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__FMFSession_didChangeActiveLocationSharingDevice___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_2;
  v10[3] = &unk_263FE6F58;
  id v11 = v6;
  id v7 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 dispatchOnDelegateQueue:v10];
}

void __26__FMFSession___connection__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = WeakRetained;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "Connection to server invalidated! Session: %@", buf, 0xCu);
  }

  [WeakRetained invalidate];
  id v4 = *(void **)(a1 + 32);
  id v5 = FMEmptyResult();
  [v4 finishWithResult:v5];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__FMFSession___connection__block_invoke_318;
  v6[3] = &unk_263FE6F30;
  v6[4] = WeakRetained;
  [WeakRetained dispatchOnDelegateQueue:v6];
}

uint64_t __24__FMFSession_connection__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__connection");

  return MEMORY[0x270F9A758]();
}

void __51__FMFSession_didChangeActiveLocationSharingDevice___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 40) deviceName];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didChangeLocationSharingDevice: %@", (uint8_t *)&v5, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeActiveLocationSharingDevice:*(void *)(a1 + 40)];
  }
}

void __33__FMFSession_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (![*(id *)(a1 + 40) count] && objc_msgSend(v2, "conformsToProtocol:", &unk_26BEF4338))
  {
    uint64_t v3 = LogCategory_Daemon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "removing all location annotations from map", v4, 2u);
    }

    if (objc_opt_respondsToSelector()) {
      [v2 removeAllFriendLocationsFromMap];
    }
  }
}

void __35__FMFSession_didUpdatePreferences___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 didUpdatePreferences:*(void *)(a1 + 40)];
  }
}

- (FMFSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMFSessionDelegate *)WeakRetained;
}

- (void)didUpdateFollowers:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "didUpdateFollowers: %@", (uint8_t *)&v6, 0xCu);
  }

  int v5 = +[FMFSessionDataManager sharedInstance];
  [v5 setFollowers:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInterruptionFuture, 0);
  objc_storeStrong((id *)&self->_sessionInvalidationFuture, 0);
  objc_storeStrong((id *)&self->_handlesQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_cachedCanShareLocationWithHandleByHandle, 0);
  objc_storeStrong((id *)&self->_cachedOfferExpirationForHandleByHandle, 0);
  objc_storeStrong((id *)&self->_cachedLocationForHandleByHandle, 0);
  objc_storeStrong((id *)&self->_cachedGetHandlesFollowingMyLocation, 0);
  objc_storeStrong((id *)&self->_cachedGetHandlesSharingLocationsWithMe, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_internalHandles, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didUpdateFences:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    int v5 = LogCategory_Daemon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "FMFSession didUpdateFences: %@", buf, 0xCu);
    }

    int v6 = +[FMFSessionDataManager sharedInstance];
    [v6 setFences:v4];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__FMFSession_didUpdateFences___block_invoke;
    v7[3] = &unk_263FE75B8;
    v7[4] = self;
    id v8 = v4;
    [(FMFSession *)self dispatchOnDelegateQueue:v7];
  }
}

void __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice completed.", (uint8_t *)&v10, 2u);
  }

  if (*(void *)(a1 + 32))
  {
    id v8 = LogCategory_Daemon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice calling completion with result: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v9 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v9 = 0;
  }
  (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_sync((dispatch_queue_t)sessionCountQueue, &__block_literal_global_143);
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering for _FMFDDaemonDidLaunch notification", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.icloud.fmfd.launched", 0);
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating connection due to session dealloc", buf, 2u);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  id v6 = LogCategory_Daemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = self;
    _os_log_impl(&dword_20AD87000, v6, OS_LOG_TYPE_DEFAULT, "Deallocating session %@", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)FMFSession;
  [(FMFSession *)&v7 dealloc];
}

- (void)getActiveLocationSharingDevice:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice:", buf, 2u);
  }

  id v6 = [(FMFSession *)self serverProxy];
  objc_super v7 = objc_opt_new();
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke;
  v19[3] = &unk_263FE6F08;
  id v20 = v4;
  id v8 = v4;
  id v9 = (id)[v7 addCompletionBlock:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_1;
  v17[3] = &unk_263FE6F30;
  id v10 = v7;
  id v18 = v10;
  [(FMFSession *)self addInvalidationHander:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_4;
  v15[3] = &unk_263FE6F30;
  id v11 = v10;
  id v16 = v11;
  [(FMFSession *)self addInterruptionHander:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_5;
  v13[3] = &unk_263FE6F80;
  v13[4] = self;
  id v14 = v11;
  id v12 = v11;
  [v6 deviceSharingLocation:v13];
}

- (void)addInvalidationHander:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  objc_initWeak(&location, self);
  id v6 = [(FMFSession *)self connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__FMFSession_addInvalidationHander___block_invoke;
  block[3] = &unk_263FE76B0;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)didUpdateLocations:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "didUpdateLocations: %@", buf, 0xCu);
  }

  id v6 = +[FMFSessionDataManager sharedInstance];
  [v6 setLocations:v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__FMFSession_didUpdateLocations___block_invoke;
  v8[3] = &unk_263FE75B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v8];
}

- (void)didUpdateFollowing:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "didUpdateFollowing: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[FMFSessionDataManager sharedInstance];
  [v5 setFollowing:v3];
}

- (void)addInterruptionHander:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  objc_initWeak(&location, self);
  int v6 = [(FMFSession *)self connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__FMFSession_addInterruptionHander___block_invoke;
  block[3] = &unk_263FE76B0;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (FMFSession)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FMFSession;
  uint64_t v8 = [(FMFSession *)&v16 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("FMFSessionConnectionQueue", 0);
    [(FMFSession *)v8 setConnectionQueue:v9];

    if (initWithDelegate_delegateQueue__onceToken != -1) {
      dispatch_once(&initWithDelegate_delegateQueue__onceToken, &__block_literal_global_130);
    }
    dispatch_sync((dispatch_queue_t)sessionCountQueue, &__block_literal_global_133);
    dispatch_queue_t v10 = dispatch_queue_create("FMFSession-HandlesQueue", 0);
    [(FMFSession *)v8 setHandlesQueue:v10];

    id v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    internalHandles = v8->_internalHandles;
    v8->_internalHandles = v11;

    [(FMFSession *)v8 setDelegate:v6];
    [(FMFSession *)v8 setDelegateQueue:v7];
    id v13 = [(FMFSession *)v8 serverProxy];
    [(FMFSession *)v8 _registerForFMFDLaunchedNotification];
    [(FMFSession *)v8 _registerForApplicationLifecycleEvents];
    id v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v8 selector:sel_locatingInProgressChanged_ name:@"locatingInProgressChanged" object:0];
  }
  return v8;
}

- (void)setDelegate:(id)a3
{
}

- (void)setHandlesQueue:(id)a3
{
}

- (void)setDelegateQueue:(id)a3
{
}

- (void)setConnectionQueue:(id)a3
{
}

- (void)didUpdatePreferences:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "FMFSession didUpdatePreferences: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__FMFSession_didUpdatePreferences___block_invoke;
  v7[3] = &unk_263FE75B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v7];
}

- (void)dispatchOnDelegateQueue:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(FMFSession *)self delegateQueue];

  if (v5)
  {
    id v6 = [(FMFSession *)self delegateQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__FMFSession_dispatchOnDelegateQueue___block_invoke;
    v7[3] = &unk_263FE7728;
    id v8 = v4;
    [v6 addOperationWithBlock:v7];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (NSOperationQueue)delegateQueue
{
  return self->_delegateQueue;
}

- (id)serverProxy
{
  id v2 = [(FMFSession *)self connection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_353];

  return v3;
}

- (NSXPCConnection)connection
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  id v3 = [(FMFSession *)self connectionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __24__FMFSession_connection__block_invoke;
  v6[3] = &unk_263FE76D8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (id)__connection
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v2 = [(FMFSession *)self connectionQueue];
  dispatch_assert_queue_V2(v2);

  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    v63 = &unk_26BEF42D8;
    v61 = &unk_26BEEFFE0;
    id v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = objc_opt_class();
    v68 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v62 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v60 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v67 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
    v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    v66 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v65 = objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    v64 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, v34, v35, v36, v37, objc_opt_class(), 0);
    v39 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.icloud.fmfd" options:4096];
    v40 = self->_connection;
    self->_connection = v39;

    v41 = LogCategory_Daemon();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = self->_connection;
      *(_DWORD *)buf = 138412290;
      v78 = v42;
      _os_log_impl(&dword_20AD87000, v41, OS_LOG_TYPE_DEFAULT, "Created connection: %@", buf, 0xCu);
    }

    v43 = objc_opt_new();
    objc_storeStrong((id *)&self->_sessionInterruptionFuture, v43);
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __26__FMFSession___connection__block_invoke;
    v73[3] = &unk_263FE7700;
    objc_copyWeak(&v75, &location);
    id v59 = v43;
    id v74 = v59;
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v73];
    v44 = objc_opt_new();
    objc_storeStrong((id *)&self->_sessionInvalidationFuture, v44);
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __26__FMFSession___connection__block_invoke_2;
    v70[3] = &unk_263FE7700;
    objc_copyWeak(&v72, &location);
    id v45 = v44;
    id v71 = v45;
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v70];
    v46 = [MEMORY[0x263F08D80] interfaceWithProtocol:v63];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v46];
    [v46 setClasses:v68 forSelector:sel_getHandlesSharingLocationsWithMe_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v68 forSelector:sel_getHandlesSharingLocationsWithMeWithGroupId_completion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v68 forSelector:sel_getHandlesSharingMyLocation_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v68 forSelector:sel_getHandlesSharingMyLocationWithGroupId_completion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v66 forSelector:sel_getPendingFriendshipRequestsWithCompletion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v66 forSelector:sel_getPendingFriendshipRequestsWithCompletion_ argumentIndex:1 ofReply:1];
    [v46 setClasses:v68 forSelector:sel_getHandlesWithPendingOffers_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v67 forSelector:sel_getAllLocations_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v65 forSelector:sel_allDevices_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v64 forSelector:sel_favoritesForMaxCount_completion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v67 forSelector:sel_nearbyLocationsWithCompletion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v68 forSelector:sel_getHandlesWithPendingOffers_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v68 forSelector:sel_canOfferToHandles_completion_ argumentIndex:0 ofReply:1];
    v47 = (void *)MEMORY[0x263EFFA08];
    uint64_t v48 = objc_opt_class();
    v49 = objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
    [v46 setClasses:v49 forSelector:sel_sendFriendshipOfferToHandles_groupId_callerId_endDate_completion_ argumentIndex:1 ofReply:1];

    [v46 setClasses:v60 forSelector:sel_dumpStateWithCompletion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v38 forSelector:sel_addFence_completion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v38 forSelector:sel_deleteFence_completion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v38 forSelector:sel_getFences_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v38 forSelector:sel_fencesForHandles_completion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v62 forSelector:sel_getFavoritesWithCompletion_ argumentIndex:0 ofReply:1];
    [v46 setClasses:v38 forSelector:sel_triggerWithUUID_forFenceWithID_withStatus_forDate_completion_ argumentIndex:0 ofReply:1];
    v50 = [[FMFSessionProxy alloc] initWithFMFSession:self];
    v51 = [MEMORY[0x263F08D80] interfaceWithProtocol:v61];
    [(NSXPCConnection *)self->_connection setExportedInterface:v51];
    [(NSXPCConnection *)self->_connection setExportedObject:v50];
    [v51 setClasses:v67 forSelector:sel_setLocations_ argumentIndex:0 ofReply:0];
    [v51 setClasses:v68 forSelector:sel_didUpdatePendingOffersForHandles_ argumentIndex:0 ofReply:0];
    [v51 setClasses:v65 forSelector:sel_didUpdateActiveDeviceList_ argumentIndex:0 ofReply:0];
    [v51 setClasses:v68 forSelector:sel_didUpdateFollowers_ argumentIndex:0 ofReply:0];
    [v51 setClasses:v68 forSelector:sel_didUpdateFollowing_ argumentIndex:0 ofReply:0];
    [v51 setClasses:v67 forSelector:sel_didUpdateLocations_ argumentIndex:0 ofReply:0];
    [v51 setClasses:v64 forSelector:sel_didUpdateFavorites_ argumentIndex:0 ofReply:0];
    [v51 setClasses:v38 forSelector:sel_didUpdateFences_ argumentIndex:0 ofReply:0];
    [(NSXPCConnection *)self->_connection resume];
    v52 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_350];
    v53 = NSNumber;
    v54 = [MEMORY[0x263F08AB0] processInfo];
    v55 = objc_msgSend(v53, "numberWithInt:", objc_msgSend(v54, "processIdentifier"));
    [v52 setSessionClientPid:v55];

    v56 = [MEMORY[0x263F086E0] mainBundle];
    v57 = [v56 bundleIdentifier];
    [v52 setSessionClientBundleId:v57];

    [v52 sessionWasCreatedRefresh];
    objc_destroyWeak(&v72);

    objc_destroyWeak(&v75);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)_registerForFMFDLaunchedNotification
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_FMFDDaemonDidLaunch, @"com.apple.icloud.fmfd.launched", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v5 bundleIdentifier];
    int v8 = 138412546;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "Registered for _FMFDDaemonDidLaunch notification for session: (%@ - client bundle id(%@)", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__daemonDidLaunch name:@"FMFSessionDaemonDidLaunchNotification" object:0];
}

- (void)_registerForApplicationLifecycleEvents
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_applicationDidEnterBackground name:@"UIApplicationDidEnterBackgroundNotification" object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_applicationWillEnterForeground name:@"UIApplicationWillEnterForegroundNotification" object:0];
}

uint64_t __36__FMFSession_addInvalidationHander___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "finishWithError:");
  }
  else {
    return [v2 finishWithResult:a1[6]];
  }
}

void __45__FMFSession_initWithDelegate_delegateQueue___block_invoke_2()
{
  uint64_t v0 = sessionCount++;
  if (v0 >= 9)
  {
    int v1 = LogCategory_Daemon();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      __45__FMFSession_initWithDelegate_delegateQueue___block_invoke_2_cold_1(v1);
    }
  }
}

- (void)includeDeviceInAutomations:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__FMFSession_HomeKit__includeDeviceInAutomations___block_invoke;
  v7[3] = &unk_263FE6C30;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 includeDeviceInAutomations:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__FMFSession_HomeKit__includeDeviceInAutomations___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = LogCategory_Daemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_20AD87000, v6, OS_LOG_TYPE_DEFAULT, "includeDeviceInAutomations: %i %@", buf, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    id v9 = LogCategory_Daemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AD87000, v9, OS_LOG_TYPE_DEFAULT, "includeDeviceInAutomations: Could not dispatch to delegate queue. FMFSession was dereferenced.", buf, 2u);
    }
    goto LABEL_8;
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__FMFSession_HomeKit__includeDeviceInAutomations___block_invoke_1;
    v10[3] = &unk_263FE6C08;
    uint64_t v12 = v8;
    char v13 = a2;
    id v11 = v5;
    [WeakRetained dispatchOnDelegateQueue:v10];

    id v9 = v12;
LABEL_8:
  }
}

uint64_t __50__FMFSession_HomeKit__includeDeviceInAutomations___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)iCloudAccountNameWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__FMFSession_Internal__iCloudAccountNameWithCompletion___block_invoke;
  v7[3] = &unk_263FE6C90;
  id v8 = v4;
  id v6 = v4;
  [v5 iCloudAccountNameWithCompletion:v7];
}

uint64_t __56__FMFSession_Internal__iCloudAccountNameWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getActiveLocationSharingDevice
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v3 = [NSString stringWithUTF8String:"-[FMFSession(Internal) getActiveLocationSharingDevice]"];
  id v4 = [[FMFSynchronizer alloc] initWithDescription:v3 andTimeout:1.0];
  id v5 = [(FMFSession *)self serverProxy];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __54__FMFSession_Internal__getActiveLocationSharingDevice__block_invoke;
  uint64_t v12 = &unk_263FE6CB8;
  uint64_t v14 = &v15;
  id v6 = v4;
  char v13 = v6;
  [v5 deviceSharingLocation:&v9];

  [(FMFSynchronizer *)v6 wait];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

void __54__FMFSession_Internal__getActiveLocationSharingDevice__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
}

- (id)getAllDevices
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v3 = [NSString stringWithUTF8String:"-[FMFSession(Internal) getAllDevices]"];
  id v4 = [[FMFSynchronizer alloc] initWithDescription:v3 andTimeout:1.0];
  id v5 = [(FMFSession *)self serverProxy];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __37__FMFSession_Internal__getAllDevices__block_invoke;
  uint64_t v12 = &unk_263FE6CE0;
  uint64_t v14 = &v15;
  id v6 = v4;
  char v13 = v6;
  [v5 allDevices:&v9];

  [(FMFSynchronizer *)v6 wait];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

void __37__FMFSession_Internal__getAllDevices__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
}

- (double)maxLocatingInterval
{
  uint64_t v15 = 0;
  __int16 v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v3 = [NSString stringWithUTF8String:"-[FMFSession(Internal) maxLocatingInterval]"];
  id v4 = [[FMFSynchronizer alloc] initWithDescription:v3 andTimeout:1.0];
  id v5 = [(FMFSession *)self serverProxy];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __43__FMFSession_Internal__maxLocatingInterval__block_invoke;
  uint64_t v12 = &unk_263FE6D08;
  uint64_t v14 = &v15;
  id v6 = v4;
  char v13 = v6;
  [v5 getMaxLocatingInterval:&v9];

  [(FMFSynchronizer *)v6 wait];
  double v7 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __43__FMFSession_Internal__maxLocatingInterval__block_invoke(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return [*(id *)(a1 + 32) signal];
}

- (void)getAllDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__FMFSession_Internal__getAllDevices___block_invoke;
  v7[3] = &unk_263FE6D30;
  id v8 = v4;
  id v6 = v4;
  [v5 allDevices:v7];
}

uint64_t __38__FMFSession_Internal__getAllDevices___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  [v8 removeDevice:v7 completion:v6];
}

- (void)getPrettyNameForHandle:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  [v8 getPrettyNameForHandle:v7 completion:v6];
}

- (void)getRecordIdForHandle:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  [v8 getRecordIdForHandle:v7 completion:v6];
}

- (id)verifyRestrictionsAndShowDialogIfRequired
{
  if (+[FMFSession FMFRestricted])
  {
    uint64_t v3 = [(FMFSession *)self serverProxy];
    [v3 showRestrictedAlert];

    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:105 userInfo:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setExpiredInitTimestamp
{
  id v2 = [(FMFSession *)self serverProxy];
  [v2 setExpiredInitTimestamp];
}

- (BOOL)is5XXError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 code] == 1006 || objc_msgSend(v3, "code") == 1007;

  return v4;
}

- (BOOL)shouldHandleErrorInFWK:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 code];
    BOOL v7 = ((unint64_t)(v5 - 1000) > 5 || ((1 << (v5 + 24)) & 0x2B) == 0) && v5 != 104;
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v7;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 code];
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "shouldHandleErrorInFWK:%d, error.code(%ld)", (uint8_t *)v10, 0x12u);
  }

  return v7;
}

- (void)crashDaemon
{
  id v2 = [(FMFSession *)self serverProxy];
  [v2 crashDaemon];
}

- (void)exit5XXGracePeriod
{
  id v2 = [(FMFSession *)self serverProxy];
  [v2 exit5XXGracePeriod];
}

- (void)isIn5XXGracePeriodWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__FMFSession_Internal__isIn5XXGracePeriodWithCompletion___block_invoke;
  v7[3] = &unk_263FE6D58;
  id v8 = v4;
  id v6 = v4;
  [v5 isIn5XXGracePeriodWithCompletion:v7];
}

uint64_t __57__FMFSession_Internal__isIn5XXGracePeriodWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendIDSPacket:(id)a3 toHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  [v8 sendIDSPacket:v7 toHandle:v6];
}

- (void)sendIDSMessage:(id)a3 toIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FMFSession *)self serverProxy];
  [v11 sendIDSMessage:v10 toIdentifier:v9 completion:v8];
}

- (void)dumpStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__FMFSession_Internal__dumpStateWithCompletion___block_invoke;
  v7[3] = &unk_263FE6D80;
  id v8 = v4;
  id v6 = v4;
  [v5 dumpStateWithCompletion:v7];
}

uint64_t __48__FMFSession_Internal__dumpStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sessionHandleReport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__FMFSession_Internal__sessionHandleReport___block_invoke;
  v7[3] = &unk_263FE6D80;
  id v8 = v4;
  id v6 = v4;
  [v5 sessionHandleReport:v7];
}

uint64_t __44__FMFSession_Internal__sessionHandleReport___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDataForPerformanceRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  [v5 getDataForPerformanceRequest:v4];
}

- (void)showShareMyLocationiCloudSettingsOffAlert
{
  id v2 = [(FMFSession *)self serverProxy];
  [v2 showShareMyLocationiCloudSettingsOffAlert];
}

- (void)showShareMyLocationRestrictedAlert
{
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "FMFSession: showShareMyLocationRestrictedAlert", v5, 2u);
  }

  id v4 = [(FMFSession *)self serverProxy];
  [v4 showRestrictedAlert];
}

- (void)showMeDeviceAlert
{
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "FMFSession: showMeDeviceAlert", v5, 2u);
  }

  id v4 = [(FMFSession *)self serverProxy];
  [v4 showMeDeviceAlert];
}

- (void)refreshLocationForHandle:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(FMFSession *)self serverProxy];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__FMFSession_Locate__refreshLocationForHandle_callerId_priority_completion___block_invoke;
  v15[3] = &unk_263FE6DD0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 fetchLocationForHandle:v12 callerId:v11 priority:a5 completion:v15];
}

void __76__FMFSession_Locate__refreshLocationForHandle_callerId_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__FMFSession_Locate__refreshLocationForHandle_callerId_priority_completion___block_invoke_2;
  v11[3] = &unk_263FE6DA8;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  [v7 dispatchOnDelegateQueue:v11];
}

uint64_t __76__FMFSession_Locate__refreshLocationForHandle_callerId_priority_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)refreshLocationForHandles:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(FMFSession *)self serverProxy];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__FMFSession_Locate__refreshLocationForHandles_callerId_priority_completion___block_invoke;
  v15[3] = &unk_263FE6DD0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 fetchLocationForHandles:v12 callerId:v11 priority:a5 completion:v15];
}

void __77__FMFSession_Locate__refreshLocationForHandles_callerId_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__FMFSession_Locate__refreshLocationForHandles_callerId_priority_completion___block_invoke_2;
  v11[3] = &unk_263FE6DA8;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v12 = v6;
  id v9 = v5;
  id v10 = v6;
  [v7 dispatchOnDelegateQueue:v11];
}

uint64_t __77__FMFSession_Locate__refreshLocationForHandles_callerId_priority_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)locationForHandle:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __51__FMFSession_Locate__locationForHandle_completion___block_invoke;
  v10[3] = &unk_263FE6E20;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 locationForHandle:v7 completion:v10];
}

void __51__FMFSession_Locate__locationForHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__FMFSession_Locate__locationForHandle_completion___block_invoke_2;
  v15[3] = &unk_263FE6DF8;
  id v10 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  [v10 dispatchOnDelegateQueue:v15];
}

uint64_t __51__FMFSession_Locate__locationForHandle_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

void __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_4(uint64_t a1)
{
  id v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice interrupted. Finishing with error.", v5, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:1019 userInfo:0];
  [v3 finishWithError:v4];
}

- (void)getThisDeviceAndCompanion:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "getThisDeviceAndCompanion:", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__FMFSession_Admin__getThisDeviceAndCompanion___block_invoke;
  v7[3] = &unk_263FE6D30;
  id v8 = v4;
  id v6 = v4;
  [(FMFSession *)self getAllDevices:v7];
}

void __47__FMFSession_Admin__getThisDeviceAndCompanion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__FMFSession_Admin__getThisDeviceAndCompanion___block_invoke_cold_1((uint64_t)v6, v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      id v11 = 0;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v5);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v14 isThisDevice])
          {
            id v15 = v14;

            id v10 = v15;
          }
          if ([v14 isCompanionDevice])
          {
            id v16 = v14;

            id v11 = v16;
          }
        }
        uint64_t v9 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
      id v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setActiveDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  BOOL v8 = +[FMFSession FMFRestricted];
  uint64_t v9 = [(FMFSession *)self serverProxy];
  id v10 = v9;
  if (v8)
  {
    [v9 showRestrictedAlert];

    id v11 = LogCategory_Daemon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Admin) setActiveDevice:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (v7)
    {
      long long v19 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:105 userInfo:0];
      v7[2](v7, v19);
    }
  }
  else
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __48__FMFSession_Admin__setActiveDevice_completion___block_invoke;
    v20[3] = &unk_263FE7018;
    v20[4] = self;
    uint64_t v22 = v7;
    id v21 = v6;
    [v10 isNetworkReachable:v20];
  }
}

void __48__FMFSession_Admin__setActiveDevice_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      id v7 = [*(id *)(a1 + 32) serverProxy];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_5;
      v20[3] = &unk_263FE6FC8;
      uint64_t v8 = *(void *)(a1 + 40);
      v20[4] = *(void *)(a1 + 32);
      id v21 = *(id *)(a1 + 48);
      [v7 setActiveDevice:v8 completion:v20];

      uint64_t v9 = v21;
    }
    else
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_8;
      v22[3] = &unk_263FE6FF0;
      v22[4] = v6;
      id v23 = *(id *)(a1 + 48);
      [v6 getAllDevices:v22];
      uint64_t v9 = v23;
    }
  }
  else
  {
    id v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    uint64_t v18 = [*(id *)(a1 + 32) serverProxy];
    [v18 showNetworkOfflineDuringOfferAlert];

    uint64_t v19 = *(void *)(a1 + 48);
    if (v19) {
      (*(void (**)(uint64_t, id))(v19 + 16))(v19, v5);
    }
  }
}

void __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "fm_firstObjectPassingTest:", &__block_literal_global_0);
  id v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(v3, "fm_firstObjectPassingTest:", &__block_literal_global_11),
        (id v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([v4 isActiveDevice])
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5)
      {
        id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:108 userInfo:0];
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
      }
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) serverProxy];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      _DWORD v10[2] = __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_4;
      v10[3] = &unk_263FE6FC8;
      uint64_t v8 = *(void **)(a1 + 40);
      void v10[4] = *(void *)(a1 + 32);
      id v11 = v8;
      [v7 setActiveDevice:v4 completion:v10];
    }
  }
  else
  {
    id v4 = *(void (***)(void, void))(a1 + 40);
    if (v4)
    {
      uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:100 userInfo:0];
      ((void (**)(void, void *))v4)[2](v4, v9);

      id v4 = 0;
    }
  }
}

uint64_t __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isThisDevice];
}

uint64_t __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isCompanionDevice];
}

uint64_t __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldHandleErrorInFWK:"))
  {
    id v3 = [*(id *)(a1 + 32) serverProxy];
    [v3 showGenericErrorAlert];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = v3;
  if (v3)
  {
    if (!objc_msgSend(v4, "shouldHandleErrorInFWK:")) {
      goto LABEL_6;
    }
    uint64_t v5 = [*(id *)(a1 + 32) serverProxy];
    [v5 showGenericErrorAlert];
  }
  else
  {
    uint64_t v5 = [v4 serverProxy];
    [v5 showActiveDeviceChangedAlert];
  }

LABEL_6:
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
  }

  return MEMORY[0x270F9A758]();
}

- (void)getHandlesSharingLocationsWithMe:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__FMFSession_Admin__getHandlesSharingLocationsWithMe___block_invoke;
  v7[3] = &unk_263FE6FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getHandlesSharingLocationsWithMe:v7];
}

void __54__FMFSession_Admin__getHandlesSharingLocationsWithMe___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "Handles sharing location with me %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__FMFSession_Admin__getHandlesSharingLocationsWithMe___block_invoke_14;
  v12[3] = &unk_263FE6DA8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [v8 dispatchOnDelegateQueue:v12];
}

uint64_t __54__FMFSession_Admin__getHandlesSharingLocationsWithMe___block_invoke_14(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(FMFSession *)self serverProxy];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __76__FMFSession_Admin__getHandlesSharingLocationsWithMeWithGroupId_completion___block_invoke;
    v9[3] = &unk_263FE7040;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    [v8 getHandlesSharingLocationsWithMeWithGroupId:v10 completion:v9];
  }
  else
  {
    [(FMFSession *)self getHandlesSharingLocationsWithMe:v7];
  }
}

void __76__FMFSession_Admin__getHandlesSharingLocationsWithMeWithGroupId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "Handles sharing location with me through group Id: %@, %@", buf, 0x16u);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__FMFSession_Admin__getHandlesSharingLocationsWithMeWithGroupId_completion___block_invoke_15;
  v13[3] = &unk_263FE6DA8;
  id v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  [v9 dispatchOnDelegateQueue:v13];
}

uint64_t __76__FMFSession_Admin__getHandlesSharingLocationsWithMeWithGroupId_completion___block_invoke_15(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)getHandlesFollowingMyLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__FMFSession_Admin__getHandlesFollowingMyLocation___block_invoke;
  v7[3] = &unk_263FE6FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getHandlesSharingMyLocation:v7];
}

void __51__FMFSession_Admin__getHandlesFollowingMyLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "Handles following my location: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__FMFSession_Admin__getHandlesFollowingMyLocation___block_invoke_16;
  v12[3] = &unk_263FE6DA8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [v8 dispatchOnDelegateQueue:v12];
}

uint64_t __51__FMFSession_Admin__getHandlesFollowingMyLocation___block_invoke_16(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)getHandlesFollowingMyLocationWithGroupId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(FMFSession *)self serverProxy];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__FMFSession_Admin__getHandlesFollowingMyLocationWithGroupId_completion___block_invoke;
    v9[3] = &unk_263FE7040;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    [v8 getHandlesSharingMyLocationWithGroupId:v10 completion:v9];
  }
  else
  {
    [(FMFSession *)self getHandlesFollowingMyLocation:v7];
  }
}

void __73__FMFSession_Admin__getHandlesFollowingMyLocationWithGroupId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "Handles following my location, through group Id: %@, %@", buf, 0x16u);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__FMFSession_Admin__getHandlesFollowingMyLocationWithGroupId_completion___block_invoke_17;
  v13[3] = &unk_263FE6DA8;
  id v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  [v9 dispatchOnDelegateQueue:v13];
}

uint64_t __73__FMFSession_Admin__getHandlesFollowingMyLocationWithGroupId_completion___block_invoke_17(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)setHideMyLocationEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  BOOL v7 = +[FMFSession FMFRestricted];
  uint64_t v8 = [(FMFSession *)self serverProxy];
  id v9 = v8;
  if (v7)
  {
    [v8 showRestrictedAlert];

    id v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Admin) setHideMyLocationEnabled:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    if (v6)
    {
      uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:105 userInfo:0];
      v6[2](v6, v18);
    }
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__FMFSession_Admin__setHideMyLocationEnabled_completion___block_invoke;
    v19[3] = &unk_263FE6FC8;
    void v19[4] = self;
    id v20 = v6;
    [v9 setHideMyLocationEnabled:v4 completion:v19];
  }
}

void __57__FMFSession_Admin__setHideMyLocationEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__FMFSession_Admin__setHideMyLocationEnabled_completion___block_invoke_2;
  v7[3] = &unk_263FE7068;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 dispatchOnDelegateQueue:v7];
}

uint64_t __57__FMFSession_Admin__setHideMyLocationEnabled_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)isMyLocationEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__FMFSession_Admin__isMyLocationEnabled___block_invoke;
  v7[3] = &unk_263FE7090;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 isMyLocationEnabled:v7];
}

void __41__FMFSession_Admin__isMyLocationEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__FMFSession_Admin__isMyLocationEnabled___block_invoke_2;
  v9[3] = &unk_263FE6C08;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 dispatchOnDelegateQueue:v9];
}

uint64_t __41__FMFSession_Admin__isMyLocationEnabled___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)setAllowFriendRequestsEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(FMFSession *)self serverProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__FMFSession_Admin__setAllowFriendRequestsEnabled_completion___block_invoke;
  v9[3] = &unk_263FE6FC8;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 setAllowFriendRequestsEnabled:v4 completion:v9];
}

void __62__FMFSession_Admin__setAllowFriendRequestsEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__FMFSession_Admin__setAllowFriendRequestsEnabled_completion___block_invoke_2;
  v7[3] = &unk_263FE7068;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 dispatchOnDelegateQueue:v7];
}

uint64_t __62__FMFSession_Admin__setAllowFriendRequestsEnabled_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)isAllowFriendRequestsEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__FMFSession_Admin__isAllowFriendRequestsEnabled___block_invoke;
  v7[3] = &unk_263FE7090;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 isAllowFriendRequestsEnabled:v7];
}

void __50__FMFSession_Admin__isAllowFriendRequestsEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__FMFSession_Admin__isAllowFriendRequestsEnabled___block_invoke_2;
  v9[3] = &unk_263FE6C08;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 dispatchOnDelegateQueue:v9];
}

uint64_t __50__FMFSession_Admin__isAllowFriendRequestsEnabled___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)getAccountEmailAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__FMFSession_Admin__getAccountEmailAddress___block_invoke;
  v7[3] = &unk_263FE70B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getAccountEmailAddress:v7];
}

void __44__FMFSession_Admin__getAccountEmailAddress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__FMFSession_Admin__getAccountEmailAddress___block_invoke_2;
  v11[3] = &unk_263FE6DA8;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 dispatchOnDelegateQueue:v11];
}

uint64_t __44__FMFSession_Admin__getAccountEmailAddress___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(FMFSession *)self serverProxy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__FMFSession_Admin__canShareLocationWithHandle_groupId_callerId_completion___block_invoke;
  v16[3] = &unk_263FE70E0;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 canShareLocationWithHandle:v13 groupId:v12 callerId:v11 completion:v16];
}

void __76__FMFSession_Admin__canShareLocationWithHandle_groupId_callerId_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = a2;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "Can share location %d", buf, 8u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__FMFSession_Admin__canShareLocationWithHandle_groupId_callerId_completion___block_invoke_19;
  v11[3] = &unk_263FE6C08;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  char v14 = a2;
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  [v8 dispatchOnDelegateQueue:v11];
}

uint64_t __76__FMFSession_Admin__canShareLocationWithHandle_groupId_callerId_completion___block_invoke_19(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  char v14 = [(FMFSession *)self serverProxy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__FMFSession_Admin__canGetLocationForHandle_groupId_callerId_completion___block_invoke;
  v16[3] = &unk_263FE70E0;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 canGetLocationForHandle:v13 groupId:v12 callerId:v11 completion:v16];
}

void __73__FMFSession_Admin__canGetLocationForHandle_groupId_callerId_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = a2;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "Can get location %d", buf, 8u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__FMFSession_Admin__canGetLocationForHandle_groupId_callerId_completion___block_invoke_21;
  v11[3] = &unk_263FE6C08;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  char v14 = a2;
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  [v8 dispatchOnDelegateQueue:v11];
}

uint64_t __73__FMFSession_Admin__canGetLocationForHandle_groupId_callerId_completion___block_invoke_21(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FMFSession *)self serverProxy];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__FMFSession_Admin__getPendingMappingPacketsForHandle_groupId_completion___block_invoke;
  v13[3] = &unk_263FE7108;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 getPendingMappingPacketsForHandle:v10 groupId:v9 completion:v13];
}

void __74__FMFSession_Admin__getPendingMappingPacketsForHandle_groupId_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__FMFSession_Admin__getPendingMappingPacketsForHandle_groupId_completion___block_invoke_2;
  v15[3] = &unk_263FE6DF8;
  id v10 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  [v10 dispatchOnDelegateQueue:v15];
}

void __74__FMFSession_Admin__getPendingMappingPacketsForHandle_groupId_completion___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[7];
  if (v1)
  {
    id v4 = [MEMORY[0x263EFFA08] setWithArray:a1[4]];
    id v3 = [MEMORY[0x263EFFA08] setWithArray:a1[5]];
    (*(void (**)(uint64_t, id, void *, void))(v1 + 16))(v1, v4, v3, a1[6]);
  }
}

- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(FMFSession *)self serverProxy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__FMFSession_Admin__getOfferExpirationForHandle_groupId_callerId_completion___block_invoke;
  v16[3] = &unk_263FE7130;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 getOfferExpirationForHandle:v13 groupId:v12 callerId:v11 completion:v16];
}

void __77__FMFSession_Admin__getOfferExpirationForHandle_groupId_callerId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__FMFSession_Admin__getOfferExpirationForHandle_groupId_callerId_completion___block_invoke_2;
  v11[3] = &unk_263FE6DA8;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 dispatchOnDelegateQueue:v11];
}

uint64_t __77__FMFSession_Admin__getOfferExpirationForHandle_groupId_callerId_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)getHandlesWithPendingOffers:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__FMFSession_Admin__getHandlesWithPendingOffers___block_invoke;
  v7[3] = &unk_263FE6FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getHandlesWithPendingOffers:v7];
}

void __49__FMFSession_Admin__getHandlesWithPendingOffers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__FMFSession_Admin__getHandlesWithPendingOffers___block_invoke_2;
  v11[3] = &unk_263FE6DA8;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 dispatchOnDelegateQueue:v11];
}

uint64_t __49__FMFSession_Admin__getHandlesWithPendingOffers___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)canOfferToHandles:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  [v8 canOfferToHandles:v7 completion:v6];
}

- (void)contactForPayload:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __58__FMFSession_Notifications__contactForPayload_completion___block_invoke;
  v10[3] = &unk_263FE7218;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 contactForPayload:v7 completion:v10];
}

void __58__FMFSession_Notifications__contactForPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__FMFSession_Notifications__contactForPayload_completion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__FMFSession_Notifications__contactForPayload_completion___block_invoke_1;
  v18[3] = &unk_263FE6DA8;
  id v14 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v20 = v6;
  id v21 = v15;
  id v19 = v5;
  id v16 = v6;
  id v17 = v5;
  [v14 dispatchOnDelegateQueue:v18];
}

uint64_t __58__FMFSession_Notifications__contactForPayload_completion___block_invoke_1(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)handleAndLocationForPayload:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FMFSession *)self serverProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke;
  v10[3] = &unk_263FE7240;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 handleAndLocationForPayload:v7 completion:v10];
}

void __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke_cold_1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke_3;
  v22[3] = &unk_263FE6DF8;
  id v17 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v23 = v7;
  id v24 = v8;
  id v25 = v9;
  id v26 = v18;
  id v19 = v9;
  id v20 = v8;
  id v21 = v7;
  [v17 dispatchOnDelegateQueue:v22];
}

uint64_t __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)dataForPayload:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __55__FMFSession_Notifications__dataForPayload_completion___block_invoke;
  v10[3] = &unk_263FE7290;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 dataForPayload:v7 completion:v10];
}

void __55__FMFSession_Notifications__dataForPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    uint64_t v13 = LogCategory_Daemon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __55__FMFSession_Notifications__dataForPayload_completion___block_invoke_cold_1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __55__FMFSession_Notifications__dataForPayload_completion___block_invoke_5;
  v26[3] = &unk_263FE7268;
  id v20 = *(void **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v30 = v12;
  id v31 = v21;
  id v27 = v9;
  id v28 = v10;
  id v29 = v11;
  id v22 = v12;
  id v23 = v11;
  id v24 = v10;
  id v25 = v9;
  [v20 dispatchOnDelegateQueue:v26];
}

void *__55__FMFSession_Notifications__dataForPayload_completion___block_invoke_5(void *result)
{
  uint64_t v1 = result[8];
  if (v1) {
    return (void *)(*(uint64_t (**)(void, void, void, void, void))(v1 + 16))(result[8], result[4], result[5], result[6], result[7]);
  }
  return result;
}

- (void)decryptPayload:(id)a3 withToken:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = LogCategory_Daemon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_20AD87000, v12, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }
  uint64_t v14 = [(FMFSession *)self serverProxy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__FMFSession_Notifications__decryptPayload_withToken_completion___block_invoke;
  v16[3] = &unk_263FE70B8;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 decryptPayload:v9 withToken:v11 completion:v16];
}

void __65__FMFSession_Notifications__decryptPayload_withToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "Error occured when decryptPayload %@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__FMFSession_Notifications__decryptPayload_withToken_completion___block_invoke_7;
  v12[3] = &unk_263FE6DA8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [v8 dispatchOnDelegateQueue:v12];
}

uint64_t __65__FMFSession_Notifications__decryptPayload_withToken_completion___block_invoke_7(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)encryptPayload:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = LogCategory_Daemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_20AD87000, v9, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }
  id v11 = [(FMFSession *)self serverProxy];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__FMFSession_Notifications__encryptPayload_completion___block_invoke;
  v13[3] = &unk_263FE70B8;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 encryptPayload:v7 completion:v13];
}

void __55__FMFSession_Notifications__encryptPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "Error occured when encryptPayload: %@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__FMFSession_Notifications__encryptPayload_completion___block_invoke_9;
  v12[3] = &unk_263FE6DA8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [v8 dispatchOnDelegateQueue:v12];
}

uint64_t __55__FMFSession_Notifications__encryptPayload_completion___block_invoke_9(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)favoritesForMaxCount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSession *)self serverProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __59__FMFSession_TodayWidget__favoritesForMaxCount_completion___block_invoke;
  v10[3] = &unk_263FE73B0;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 favoritesForMaxCount:v7 completion:v10];
}

void __59__FMFSession_TodayWidget__favoritesForMaxCount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "favoritesForMaxCount: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__FMFSession_TodayWidget__favoritesForMaxCount_completion___block_invoke_1;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __59__FMFSession_TodayWidget__favoritesForMaxCount_completion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)nearbyLocationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__FMFSession_TodayWidget__nearbyLocationsWithCompletion___block_invoke;
  v7[3] = &unk_263FE6FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 nearbyLocationsWithCompletion:v7];
}

void __57__FMFSession_TodayWidget__nearbyLocationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "nearbyLocationsWithCompletion: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__FMFSession_TodayWidget__nearbyLocationsWithCompletion___block_invoke_3;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __57__FMFSession_TodayWidget__nearbyLocationsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)getAllLocations:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "getAllLocations", v7, 2u);
  }

  id v6 = [(FMFSession *)self serverProxy];
  [v6 getAllLocations:v4];
}

- (void)getFavoritesWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = self;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ getFavoritesWithCompletion", buf, 0xCu);
  }

  id v6 = [(FMFSession *)self serverProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__FMFSession_Favorites__getFavoritesWithCompletion___block_invoke;
  v8[3] = &unk_263FE73B0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getFavoritesWithCompletion:v8];
}

void __52__FMFSession_Favorites__getFavoritesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      id v9 = "FMFSession: getFavoritesWithCompletion completed with error: %@";
LABEL_6:
      _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
  else if (v8)
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    id v9 = "FMFSession: getFavorites: %@";
    goto LABEL_6;
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__FMFSession_Favorites__getFavoritesWithCompletion___block_invoke_1;
  v14[3] = &unk_263FE6DA8;
  id v10 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v11;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  [v10 dispatchOnDelegateQueue:v14];
}

uint64_t __52__FMFSession_Favorites__getFavoritesWithCompletion___block_invoke_1(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)addFavorite:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ addFavorite: %@", buf, 0x16u);
  }

  id v9 = [(FMFSession *)self serverProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__FMFSession_Favorites__addFavorite_completion___block_invoke;
  v11[3] = &unk_263FE6FC8;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 addFavorite:v6 completion:v11];
}

void __48__FMFSession_Favorites__addFavorite_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = LogCategory_Daemon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "FMFSession: addFavorite completed with error: %@", buf, 0xCu);
    }
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__FMFSession_Favorites__addFavorite_completion___block_invoke_3;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __48__FMFSession_Favorites__addFavorite_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)removeFavorite:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ removeFavorite: %@", buf, 0x16u);
  }

  id v9 = [(FMFSession *)self serverProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__FMFSession_Favorites__removeFavorite_completion___block_invoke;
  v11[3] = &unk_263FE6FC8;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 removeFavorite:v6 completion:v11];
}

void __51__FMFSession_Favorites__removeFavorite_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = LogCategory_Daemon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "FMFSession: removeFavorite completed with error: %@", buf, 0xCu);
    }
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__FMFSession_Favorites__removeFavorite_completion___block_invoke_5;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __51__FMFSession_Favorites__removeFavorite_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)_isNoMappingPacketReturnedError:(id)a3
{
  return a3 && [a3 code] == 204;
}

- (void)_sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = LogCategory_Daemon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    _os_log_impl(&dword_20AD87000, v17, OS_LOG_TYPE_INFO, "Sending friend offer for: %@ to date: %@ withGroupId: %@ fromCallerId: %@", buf, 0x2Au);
  }

  uint64_t v18 = [(FMFSession *)self serverProxy];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__FMFSession_Establish___sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke;
  v20[3] = &unk_263FE73F8;
  v20[4] = self;
  id v21 = v16;
  id v19 = v16;
  [v18 sendFriendshipOfferToHandles:v12 groupId:v13 callerId:v14 endDate:v15 completion:v20];
}

void __91__FMFSession_Establish___sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91__FMFSession_Establish___sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2;
  v14[3] = &unk_263FE6DA8;
  id v7 = *(void **)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  [v7 dispatchOnDelegateQueue:v14];
  if ([*(id *)(a1 + 32) shouldHandleErrorInFWK:v9])
  {
    int v10 = [*(id *)(a1 + 32) is5XXError:v9];
    id v11 = *(void **)(a1 + 32);
    if (v10)
    {
      id v12 = [v11 serverProxy];
      [v12 show5XXDuringStartOfferAlert];
LABEL_6:

      goto LABEL_7;
    }
    if (([v11 _isNoMappingPacketReturnedError:v9] & 1) == 0)
    {
      id v12 = [*(id *)(a1 + 32) serverProxy];
      [v12 showGenericErrorAlert];
      goto LABEL_6;
    }
  }
LABEL_7:
  int v13 = [*(id *)(a1 + 32) _isNoMappingPacketReturnedError:v9];
  if (!v9 || v13) {
    [*(id *)(a1 + 32) _checkAndDisplayMeDeviceSwitchAlert];
  }
}

uint64_t __91__FMFSession_Establish___sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)_sendAutoSwitchMeDevice
{
}

void __48__FMFSession_Establish___sendAutoSwitchMeDevice__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 code];
    id v5 = LogCategory_Daemon();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4 == 108)
    {
      if (v6)
      {
        LOWORD(v9) = 0;
        id v7 = "Offer: This device is already set as Me device";
LABEL_7:
        _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 2u);
      }
    }
    else if (v6)
    {
      id v8 = [v3 description];
      int v9 = 138412290;
      int v10 = v8;
      _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_INFO, "Offer: Error while trying to set this device as Me device, error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v5 = LogCategory_Daemon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      id v7 = "Offer: Successfully set this devie as Me device.";
      goto LABEL_7;
    }
  }
}

- (void)_checkAndDisplayMeDeviceSwitchAlert
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke;
  v2[3] = &unk_263FE7468;
  v2[4] = self;
  [(FMFSession *)self getActiveLocationSharingDevice:v2];
}

void __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke_cold_1((uint64_t)v6, v7);
    }
LABEL_4:

    goto LABEL_5;
  }
  if ([v5 isThisDevice] & 1) != 0 || (objc_msgSend(v5, "isCompanionDevice"))
  {
    id v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_INFO, "This device is already MeDevice", buf, 2u);
    }
    goto LABEL_4;
  }
  id v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_INFO, "This device is not MeDevice", buf, 2u);
  }

  int v9 = LogCategory_Daemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v9, OS_LOG_TYPE_INFO, "Showing MeDevice switch alert", buf, 2u);
  }

  int v10 = [*(id *)(a1 + 32) serverProxy];
  uint64_t v11 = [v5 deviceName];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke_3;
  v12[3] = &unk_263FE7440;
  void v12[4] = *(void *)(a1 + 32);
  [v10 showSwitchMeDeviceAlertUsingCurrentMeDeviceName:v11 completion:v12];

LABEL_5:
}

void __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v4 = LogCategory_Daemon();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_INFO, "User selected to switch this device as MeDevice", buf, 2u);
    }

    [*(id *)(a1 + 32) _sendAutoSwitchMeDevice];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_INFO, "User selected NOT to switch this device as MeDevice", v6, 2u);
    }
  }
}

- (void)sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(FMFSession *)self verifyRestrictionsAndShowDialogIfRequired];
  if (v17)
  {
    uint64_t v18 = LogCategory_Daemon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Establish) sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:]();
    }

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke;
    v29[3] = &unk_263FE7068;
    id v31 = v16;
    id v30 = v17;
    id v19 = v16;
    [(FMFSession *)self dispatchOnDelegateQueue:v29];

    uint64_t v20 = v31;
  }
  else
  {
    id v21 = [(FMFSession *)self serverProxy];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2;
    v23[3] = &unk_263FE7490;
    v23[4] = self;
    id v28 = v16;
    id v24 = v12;
    id v25 = v13;
    id v26 = v14;
    id v27 = v15;
    id v22 = v16;
    [v21 isNetworkReachable:v23];

    uint64_t v20 = v28;
  }
}

uint64_t __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _sendFriendshipOfferToHandles:*(void *)(a1 + 40) groupId:*(void *)(a1 + 48) callerId:*(void *)(a1 + 56) endDate:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
  }
  else
  {
    id v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2_cold_1();
    }

    id v7 = [*(id *)(a1 + 32) serverProxy];
    [v7 showNetworkOfflineDuringOfferAlert];

    uint64_t v8 = *(void *)(a1 + 72);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
    }
  }
}

- (void)sendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12 = (void *)MEMORY[0x263EFFA08];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = [v12 setWithObject:a3];
  [(FMFSession *)self sendFriendshipOfferToHandles:v17 groupId:v16 callerId:v15 endDate:v14 completion:v13];
}

- (void)extendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = LogCategory_Daemon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v15;
    _os_log_impl(&dword_20AD87000, v17, OS_LOG_TYPE_INFO, "Extending friend offer for: %@ to date: %@", buf, 0x16u);
  }

  uint64_t v18 = [(FMFSession *)self verifyRestrictionsAndShowDialogIfRequired];
  if (v18)
  {
    id v19 = LogCategory_Daemon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Establish) extendFriendshipOfferToHandle:groupId:callerId:endDate:completion:]();
    }

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke;
    v26[3] = &unk_263FE7068;
    id v28 = v16;
    id v27 = v18;
    id v20 = v16;
    [(FMFSession *)self dispatchOnDelegateQueue:v26];

    id v21 = v28;
  }
  else
  {
    id v22 = [(FMFSession *)self serverProxy];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke_2;
    v24[3] = &unk_263FE70B8;
    v24[4] = self;
    id v25 = v16;
    id v23 = v16;
    [v22 extendFriendshipOfferToHandle:v12 groupId:v13 callerId:v14 endDate:v15 completion:v24];

    id v21 = v25;
  }
}

uint64_t __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke_3;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)sendFriendshipInviteToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  id v17 = LogCategory_Daemon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v12;
    _os_log_impl(&dword_20AD87000, v17, OS_LOG_TYPE_INFO, "Sending friend invite for: %@", buf, 0xCu);
  }

  uint64_t v18 = [(FMFSession *)self verifyRestrictionsAndShowDialogIfRequired];
  if (v18)
  {
    id v19 = LogCategory_Daemon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Establish) sendFriendshipInviteToHandle:groupId:callerId:endDate:completion:]();
    }

    if (v16) {
      v16[2](v16, 0, v18);
    }
  }
  else
  {
    id v20 = [(FMFSession *)self serverProxy];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __90__FMFSession_Establish__sendFriendshipInviteToHandle_groupId_callerId_endDate_completion___block_invoke;
    v21[3] = &unk_263FE70B8;
    v21[4] = self;
    id v22 = v16;
    [v20 sendFriendshipInviteToHandle:v12 groupId:v13 callerId:v14 endDate:v15 completion:v21];
  }
}

void __90__FMFSession_Establish__sendFriendshipInviteToHandle_groupId_callerId_endDate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__FMFSession_Establish__sendFriendshipInviteToHandle_groupId_callerId_endDate_completion___block_invoke_2;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __90__FMFSession_Establish__sendFriendshipInviteToHandle_groupId_callerId_endDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)sendNotNowToHandle:(id)a3 callerId:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = LogCategory_Daemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_20AD87000, v11, OS_LOG_TYPE_INFO, "Sending notNow for: %@", buf, 0xCu);
  }

  id v12 = [(FMFSession *)self verifyRestrictionsAndShowDialogIfRequired];
  if (v12)
  {
    id v13 = LogCategory_Daemon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Establish) sendNotNowToHandle:callerId:completion:]();
    }

    if (v10) {
      v10[2](v10, 0, v12);
    }
  }
  else
  {
    id v14 = [(FMFSession *)self serverProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__FMFSession_Establish__sendNotNowToHandle_callerId_completion___block_invoke;
    v15[3] = &unk_263FE70B8;
    void v15[4] = self;
    id v16 = v10;
    [v14 sendNotNowToHandle:v8 callerId:v9 completion:v15];
  }
}

void __64__FMFSession_Establish__sendNotNowToHandle_callerId_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__FMFSession_Establish__sendNotNowToHandle_callerId_completion___block_invoke_2;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __64__FMFSession_Establish__sendNotNowToHandle_callerId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)approveFriendshipRequest:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_INFO, "Approving friend request for: %@", buf, 0xCu);
  }

  id v9 = [(FMFSession *)self verifyRestrictionsAndShowDialogIfRequired];
  if (v9)
  {
    id v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Establish) approveFriendshipRequest:completion:]();
    }

    if (v7) {
      v7[2](v7, v9);
    }
  }
  else
  {
    uint64_t v11 = [(FMFSession *)self serverProxy];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__FMFSession_Establish__approveFriendshipRequest_completion___block_invoke;
    v12[3] = &unk_263FE6FC8;
    void v12[4] = self;
    id v13 = v7;
    [v11 approveFriendshipRequest:v6 completion:v12];
  }
}

void __61__FMFSession_Establish__approveFriendshipRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__FMFSession_Establish__approveFriendshipRequest_completion___block_invoke_2;
  v7[3] = &unk_263FE7068;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 dispatchOnDelegateQueue:v7];
}

uint64_t __61__FMFSession_Establish__approveFriendshipRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)declineFriendshipRequest:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_INFO, "Declining friend request for: %@", buf, 0xCu);
  }

  id v9 = [(FMFSession *)self verifyRestrictionsAndShowDialogIfRequired];
  if (v9)
  {
    id v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Establish) declineFriendshipRequest:completion:]();
    }

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke;
    v17[3] = &unk_263FE7068;
    id v19 = v7;
    id v18 = v9;
    id v11 = v7;
    [(FMFSession *)self dispatchOnDelegateQueue:v17];

    id v12 = v19;
  }
  else
  {
    id v13 = [(FMFSession *)self serverProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke_2;
    v15[3] = &unk_263FE6FC8;
    void v15[4] = self;
    id v16 = v7;
    id v14 = v7;
    [v13 declineFriendshipRequest:v6 completion:v15];

    id v12 = v16;
  }
}

uint64_t __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke_3;
  v7[3] = &unk_263FE7068;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 dispatchOnDelegateQueue:v7];
}

uint64_t __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)stopSharingMyLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = LogCategory_Daemon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v10;
    _os_log_impl(&dword_20AD87000, v14, OS_LOG_TYPE_INFO, "Stop sharing location with handle: %@", buf, 0xCu);
  }

  id v15 = [(FMFSession *)self verifyRestrictionsAndShowDialogIfRequired];
  if (v15)
  {
    id v16 = LogCategory_Daemon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Establish) stopSharingMyLocationWithHandle:groupId:callerId:completion:]();
    }

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke;
    v23[3] = &unk_263FE7068;
    id v25 = v13;
    id v24 = v15;
    id v17 = v13;
    [(FMFSession *)self dispatchOnDelegateQueue:v23];

    id v18 = v25;
  }
  else
  {
    id v19 = [(FMFSession *)self serverProxy];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke_2;
    v21[3] = &unk_263FE70B8;
    v21[4] = self;
    id v22 = v13;
    id v20 = v13;
    [v19 stopSharingMyLocationWithHandle:v10 groupId:v11 callerId:v12 completion:v21];

    id v18 = v22;
  }
}

uint64_t __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke_3;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)stopSharingMyLocationWithHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = LogCategory_Daemon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v10;
    _os_log_impl(&dword_20AD87000, v14, OS_LOG_TYPE_INFO, "Stop sharing location with handles: [%@]", buf, 0xCu);
  }

  id v15 = [(FMFSession *)self verifyRestrictionsAndShowDialogIfRequired];
  if (v15)
  {
    id v16 = LogCategory_Daemon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[FMFSession(Establish) stopSharingMyLocationWithHandle:groupId:callerId:completion:]();
    }

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke;
    v26[3] = &unk_263FE7068;
    id v28 = v13;
    id v27 = v15;
    id v17 = v13;
    [(FMFSession *)self dispatchOnDelegateQueue:v26];

    id v18 = v28;
  }
  else
  {
    id v19 = [(FMFSession *)self serverProxy];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2;
    v21[3] = &unk_263FE74B8;
    v21[4] = self;
    id v25 = v13;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    id v20 = v13;
    [v19 isNetworkReachable:v21];

    id v18 = v25;
  }
}

uint64_t __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) serverProxy];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_8;
    v13[3] = &unk_263FE70B8;
    void v13[4] = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    [v6 stopSharingMyLocationWithHandles:v7 groupId:v8 callerId:v9 completion:v13];
  }
  else
  {
    id v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2_cold_1();
    }

    id v11 = [*(id *)(a1 + 32) serverProxy];
    [v11 showNetworkOfflineDuringStopOfferAlert];

    uint64_t v12 = *(void *)(a1 + 64);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v5);
    }
  }
}

void __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([*(id *)(a1 + 32) shouldHandleErrorInFWK:v4])
  {
    int v5 = [*(id *)(a1 + 32) is5XXError:v4];
    id v6 = [*(id *)(a1 + 32) serverProxy];
    uint64_t v7 = v6;
    if (v5) {
      [v6 show5XXDuringStopOfferAlert];
    }
    else {
      [v6 showGenericErrorAlert];
    }
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2_9;
  v11[3] = &unk_263FE7068;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v12 = v4;
  id v13 = v9;
  id v10 = v4;
  [v8 dispatchOnDelegateQueue:v11];
}

uint64_t __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2_9(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)getPendingFriendshipRequestsWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_INFO, "Get pending friendship requests", buf, 2u);
  }

  id v6 = [(FMFSession *)self serverProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__FMFSession_Establish__getPendingFriendshipRequestsWithCompletion___block_invoke;
  v8[3] = &unk_263FE74E0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getPendingFriendshipRequestsWithCompletion:v8];
}

void __68__FMFSession_Establish__getPendingFriendshipRequestsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__FMFSession_Establish__getPendingFriendshipRequestsWithCompletion___block_invoke_2;
  v15[3] = &unk_263FE6DF8;
  id v10 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  [v10 dispatchOnDelegateQueue:v15];
}

uint64_t __68__FMFSession_Establish__getPendingFriendshipRequestsWithCompletion___block_invoke_2(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)addFence:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ addFence: %@", buf, 0x16u);
  }

  id v9 = [(FMFSession *)self serverProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__FMFSession_Fences__addFence_completion___block_invoke;
  v11[3] = &unk_263FE7630;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 addFence:v6 completion:v11];
}

void __42__FMFSession_Fences__addFence_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "FMFSession: addFences result: error? %@, fences: %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__FMFSession_Fences__addFence_completion___block_invoke_1;
  v12[3] = &unk_263FE6DA8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [v8 dispatchOnDelegateQueue:v12];
}

uint64_t __42__FMFSession_Fences__addFence_completion___block_invoke_1(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)deleteFence:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ deleteFence: %@", buf, 0x16u);
  }

  id v9 = [(FMFSession *)self serverProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__FMFSession_Fences__deleteFence_completion___block_invoke;
  v11[3] = &unk_263FE6FC8;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 deleteFence:v6 completion:v11];
}

void __45__FMFSession_Fences__deleteFence_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "FMFSession: deleteFence result: error? %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__FMFSession_Fences__deleteFence_completion___block_invoke_3;
  v8[3] = &unk_263FE7068;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 dispatchOnDelegateQueue:v8];
}

uint64_t __45__FMFSession_Fences__deleteFence_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)getFences:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = self;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "FMFSession: getFences: %@", buf, 0xCu);
  }

  id v6 = [(FMFSession *)self serverProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__FMFSession_Fences__getFences___block_invoke;
  v8[3] = &unk_263FE6FF0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getFences:v8];
}

void __32__FMFSession_Fences__getFences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "FMFSession: getFences result: error? %@, fences: %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__FMFSession_Fences__getFences___block_invoke_5;
  v12[3] = &unk_263FE6DA8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [v8 dispatchOnDelegateQueue:v12];
}

uint64_t __32__FMFSession_Fences__getFences___block_invoke_5(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)fencesForHandles:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ fenceForHandles: %@", buf, 0x16u);
  }

  id v9 = [(FMFSession *)self serverProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__FMFSession_Fences__fencesForHandles_completion___block_invoke;
  v11[3] = &unk_263FE6FF0;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 fencesForHandles:v6 completion:v11];
}

void __50__FMFSession_Fences__fencesForHandles_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "FMFSession: fenceForHandles result: error? %@, fences: %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__FMFSession_Fences__fencesForHandles_completion___block_invoke_7;
  v12[3] = &unk_263FE6DA8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [v8 dispatchOnDelegateQueue:v12];
}

uint64_t __50__FMFSession_Fences__fencesForHandles_completion___block_invoke_7(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  id v17 = LogCategory_Daemon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v23 = "-[FMFSession(Fences) triggerWithUUID:forFenceWithID:withStatus:forDate:completion:]";
    __int16 v24 = 2112;
    id v25 = self;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v13;
    _os_log_impl(&dword_20AD87000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@ fenceID: %@ status: %@", buf, 0x2Au);
  }

  __int16 v18 = [(FMFSession *)self serverProxy];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __83__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_completion___block_invoke;
  v20[3] = &unk_263FE6FC8;
  v20[4] = self;
  id v21 = v14;
  id v19 = v14;
  [v18 triggerWithUUID:v16 forFenceWithID:v12 withStatus:v13 forDate:v15 completion:v20];
}

void __83__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_completion___block_invoke_2;
  v7[3] = &unk_263FE7068;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 dispatchOnDelegateQueue:v7];
}

uint64_t __83__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  uint64_t v20 = LogCategory_Daemon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v26 = "-[FMFSession(Fences) triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:]";
    __int16 v27 = 2112;
    __int16 v28 = self;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    _os_log_impl(&dword_20AD87000, v20, OS_LOG_TYPE_DEFAULT, "%s: %@ fenceID: %@ status: %@ with trigger location", buf, 0x2Au);
  }

  id v21 = [(FMFSession *)self serverProxy];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __99__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion___block_invoke;
  v23[3] = &unk_263FE6FC8;
  void v23[4] = self;
  id v24 = v16;
  id v22 = v16;
  [v21 triggerWithUUID:v19 forFenceWithID:v14 withStatus:v15 forDate:v18 triggerLocation:v17 completion:v23];
}

void __99__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __99__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion___block_invoke_2;
  v7[3] = &unk_263FE7068;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 dispatchOnDelegateQueue:v7];
}

uint64_t __99__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = LogCategory_Daemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v17 = "-[FMFSession(Fences) muteFencesForHandle:untilDate:completion:]";
    __int16 v18 = 2112;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_20AD87000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ handle: %@ date: %@", buf, 0x2Au);
  }

  id v12 = [(FMFSession *)self serverProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__FMFSession_Fences__muteFencesForHandle_untilDate_completion___block_invoke;
  v14[3] = &unk_263FE6FC8;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 muteFencesForHandle:v8 untilDate:v9 completion:v14];
}

void __63__FMFSession_Fences__muteFencesForHandle_untilDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__FMFSession_Fences__muteFencesForHandle_untilDate_completion___block_invoke_2;
  v7[3] = &unk_263FE7068;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 dispatchOnDelegateQueue:v7];
}

uint64_t __63__FMFSession_Fences__muteFencesForHandle_untilDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_daemonDidLaunch
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = [v4 bundleIdentifier];
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "Received _daemonDidLaunch notification, attempting to restore connection if needed (session: %@ - client bundle id(%@))", (uint8_t *)&v6, 0x16u);
  }
  [(FMFSession *)self restoreClientConnection];
}

- (void)restoreClientConnection
{
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "FMFSession will restore connection if needed.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = [(FMFSession *)self connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__FMFSession_restoreClientConnection__block_invoke;
  block[3] = &unk_263FE7508;
  objc_copyWeak(&v6, buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __37__FMFSession_restoreClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = LogCategory_Daemon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [MEMORY[0x263F086E0] mainBundle];
      id v4 = [v3 bundleIdentifier];
      int v8 = 138412546;
      id v9 = WeakRetained;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "FMFSession restoring connection (session: %@ - client bundle id(%@))", (uint8_t *)&v8, 0x16u);
    }
    id v5 = [WeakRetained delegate];

    if (v5)
    {
      id v6 = objc_msgSend(WeakRetained, "__connection");
      id v7 = (id)[v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_6];
    }
  }
}

void __37__FMFSession_restoreClientConnection__block_invoke_107(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __37__FMFSession_restoreClientConnection__block_invoke_107_cold_1();
  }
}

+ (FMFSession)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__FMFSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_dispatch_predicate_2 != -1) {
    dispatch_once(&sharedInstance_dispatch_predicate_2, block);
  }
  id v2 = (void *)sharedInstance__instance_1;

  return (FMFSession *)v2;
}

void __28__FMFSession_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = (void *)sharedInstance__instance_1;
  sharedInstance__instance_1 = (uint64_t)v0;

  id v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_INFO, "Creating shared instance of FMFSession", v3, 2u);
  }
}

- (FMFSession)init
{
  return [(FMFSession *)self initWithDelegate:0];
}

void __45__FMFSession_initWithDelegate_delegateQueue___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("FMFSession.count", 0);
  uint64_t v1 = (void *)sessionCountQueue;
  sessionCountQueue = (uint64_t)v0;

  sessionCount = 0;
}

- (void)locatingInProgressChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [a3 object];
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 handle];
    *(_DWORD *)buf = 138412802;
    __int16 v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 1024;
    int v14 = [v4 isLocatingInProgress];
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "locatingInProgressChanged: %@, %@, %d", buf, 0x1Cu);
  }
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__FMFSession_locatingInProgressChanged___block_invoke;
    v7[3] = &unk_263FE75B8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __40__FMFSession_locatingInProgressChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
  [v1 setLocations:v2];
}

- (FMFSession)initWithDelegate:(id)a3
{
  return [(FMFSession *)self initWithDelegate:a3 delegateQueue:0];
}

uint64_t __36__FMFSession_addInterruptionHander___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __26__FMFSession___connection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = WeakRetained;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "Connection to server interrupted! Session: %@", buf, 0xCu);
  }

  [WeakRetained invalidate];
  id v4 = *(void **)(a1 + 32);
  id v5 = FMEmptyResult();
  [v4 finishWithResult:v5];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__FMFSession___connection__block_invoke_315;
  v6[3] = &unk_263FE6F30;
  v6[4] = WeakRetained;
  [WeakRetained dispatchOnDelegateQueue:v6];
}

void __26__FMFSession___connection__block_invoke_315(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v1 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:1019 userInfo:0];
    [v2 connectionError:v1];
  }
}

void __26__FMFSession___connection__block_invoke_318(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v1 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.icloud.fmf.error" code:1020 userInfo:0];
    [v2 connectionError:v1];
  }
}

void __26__FMFSession___connection__block_invoke_2_348(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __26__FMFSession___connection__block_invoke_2_348_cold_1();
  }
}

void __25__FMFSession_serverProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __25__FMFSession_serverProxy__block_invoke_cold_1();
  }
}

- (void)invalidate
{
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "FMFSession will invalidate connection if needed.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = [(FMFSession *)self connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__FMFSession_invalidate__block_invoke;
  block[3] = &unk_263FE7508;
  objc_copyWeak(&v6, buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __24__FMFSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = *((id *)WeakRetained + 5);
    id v4 = v3;
    if (v3)
    {
      [v3 invalidate];
      id v5 = (void *)v2[5];
      void v2[5] = 0;

      id v6 = LogCategory_Daemon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        id v8 = v4;
        _os_log_impl(&dword_20AD87000, v6, OS_LOG_TYPE_DEFAULT, "FMFSession did invalidate connection %@.", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)forceRefresh
{
  id v2 = [(FMFSession *)self serverProxy];
  [v2 forceRefresh];
}

- (void)forceRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  [v5 forceRefreshWithCompletion:v4];
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self delegate];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__FMFSession_setLocations___block_invoke;
  v8[3] = &unk_263FE75B8;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v8];
}

void __27__FMFSession_setLocations___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(*(id *)(a1 + 40), "didReceiveLocation:", v7, (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)failedToGetLocationForHandle:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __49__FMFSession_failedToGetLocationForHandle_error___block_invoke;
  v10[3] = &unk_263FE6F58;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(FMFSession *)self dispatchOnDelegateQueue:v10];
}

void __49__FMFSession_failedToGetLocationForHandle_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 didFailToFetchLocationForHandle:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
  }
}

- (void)didAddFollowerHandle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__FMFSession_didAddFollowerHandle___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __35__FMFSession_didAddFollowerHandle___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didAddFollowerHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didStartSharingMyLocationWithHandle:*(void *)(a1 + 40)];
  }
}

- (void)didRemoveFollowerHandle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__FMFSession_didRemoveFollowerHandle___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __38__FMFSession_didRemoveFollowerHandle___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didRemoveFollowerHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didStopSharingMyLocationWithHandle:*(void *)(a1 + 40)];
  }
}

- (void)didStartFollowingHandle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__FMFSession_didStartFollowingHandle___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __38__FMFSession_didStartFollowingHandle___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didStartFollowingHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didStartAbilityToGetLocationForHandle:*(void *)(a1 + 40)];
  }
}

- (void)didStopFollowingHandle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__FMFSession_didStopFollowingHandle___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __37__FMFSession_didStopFollowingHandle___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didStopFollowingHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didStopAbilityToGetLocationForHandle:*(void *)(a1 + 40)];
  }
}

- (void)didUpdateFavorites:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__FMFSession_didUpdateFavorites___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __33__FMFSession_didUpdateFavorites___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didUpdateFavorites: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didUpdateFavoriteHandles:*(void *)(a1 + 40)];
  }
}

- (void)didUpdateHideFromFollowersStatus:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__FMFSession_didUpdateHideFromFollowersStatus___block_invoke;
  v3[3] = &unk_263FE7750;
  v3[4] = self;
  BOOL v4 = a3;
  [(FMFSession *)self dispatchOnDelegateQueue:v3];
}

void __47__FMFSession_didUpdateHideFromFollowersStatus___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didUpdateHideFromFollowersStatus: %d", (uint8_t *)v5, 8u);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didUpdateHidingStatus:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)didUpdateActiveDeviceList:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__FMFSession_didUpdateActiveDeviceList___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __40__FMFSession_didUpdateActiveDeviceList___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didUpdateActiveDeviceList: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didUpdateActiveDeviceList:*(void *)(a1 + 40)];
  }
}

- (void)didReceiveFriendshipRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__FMFSession_didReceiveFriendshipRequest___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __42__FMFSession_didReceiveFriendshipRequest___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didReceiveFriendshipRequest: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didReceiveFriendshipRequest:*(void *)(a1 + 40)];
  }
}

- (void)didUpdatePendingOffersForHandles:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__FMFSession_didUpdatePendingOffersForHandles___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __47__FMFSession_didUpdatePendingOffersForHandles___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didUpdatePendingOffersForHandles: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didUpdatePendingOffersForHandles:*(void *)(a1 + 40)];
  }
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __41__FMFSession_sendMappingPacket_toHandle___block_invoke;
  v10[3] = &unk_263FE6F58;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(FMFSession *)self dispatchOnDelegateQueue:v10];
}

void __41__FMFSession_sendMappingPacket_toHandle___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "sendMappingPacket:toHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 sendMappingPacket:*(void *)(a1 + 48) toHandle:*(void *)(a1 + 40)];
  }
}

- (void)didReceiveServerError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__FMFSession_didReceiveServerError___block_invoke;
  v6[3] = &unk_263FE75B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __36__FMFSession_didReceiveServerError___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "didReceiveServerError: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 didReceiveServerError:*(void *)(a1 + 40)];
  }
}

- (void)abDidChange
{
  id v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "abDidChange", v4, 2u);
  }

  uint64_t v3 = +[FMFSessionDataManager sharedInstance];
  [v3 abDidChange];
}

- (void)abPreferencesDidChange
{
  id v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "abPreferencesDidChange", v4, 2u);
  }

  uint64_t v3 = +[FMFSessionDataManager sharedInstance];
  [v3 abPreferencesDidChange];
}

- (void)networkReachabilityUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v9 = v3;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "networkReachabilityUpdated, Is reachable %d", buf, 8u);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__FMFSession_networkReachabilityUpdated___block_invoke;
  v6[3] = &unk_263FE7750;
  v6[4] = self;
  BOOL v7 = v3;
  [(FMFSession *)self dispatchOnDelegateQueue:v6];
}

void __41__FMFSession_networkReachabilityUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 networkReachabilityUpdated:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)modelDidLoad
{
}

- (NSSet)handles
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  BOOL v3 = [(FMFSession *)self handlesQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __21__FMFSession_handles__block_invoke;
  v6[3] = &unk_263FE76D8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __21__FMFSession_handles__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) internalHandles];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self handles];
  id v6 = (id)[v5 mutableCopy];

  [v6 minusSet:v4];
  [(FMFSession *)self removeHandles:v6];
  [(FMFSession *)self addHandles:v4];
}

- (void)addHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self handlesQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __25__FMFSession_addHandles___block_invoke;
  id v11 = &unk_263FE75B8;
  id v6 = v4;
  id v12 = v6;
  uint64_t v13 = self;
  dispatch_sync(v5, &v8);

  if (objc_msgSend(v6, "count", v8, v9, v10, v11))
  {
    uint64_t v7 = [(FMFSession *)self serverProxy];
    [v7 addFriendHandles:v6];
  }
}

void __25__FMFSession_addHandles___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "Adding handles: %@ to session: %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) internalHandles];
  [v5 unionSet:*(void *)(a1 + 32)];
}

- (void)removeHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self handlesQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __28__FMFSession_removeHandles___block_invoke;
  id v11 = &unk_263FE75B8;
  id v12 = v4;
  uint64_t v13 = self;
  id v6 = v4;
  dispatch_sync(v5, &v8);

  uint64_t v7 = [(FMFSession *)self serverProxy];
  [v7 removeFriendHandles:v6];
}

void __28__FMFSession_removeHandles___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "Removing handles: %@ from session: %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) internalHandles];
  [v5 minusSet:*(void *)(a1 + 32)];
}

- (void)setDebugContext:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSession *)self serverProxy];
  [v5 setDebugContext:v4];
}

- (void)receivedMappingPacket:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "receivedMappingPacket:", v10, 2u);
  }

  uint64_t v9 = [(FMFSession *)self serverProxy];
  [v9 importMappingPacket:v7 completion:v6];
}

- (void)mappingPacketSendFailed:(id)a3 toHandle:(id)a4 withError:(id)a5
{
  id v5 = a5;
  id v6 = LogCategory_Daemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[FMFSession mappingPacketSendFailed:toHandle:withError:]((uint64_t)v5, v6);
  }
}

- (void)handleIncomingAirDropURL:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "handleIncomingAirDropURL: %@", buf, 0xCu);
  }

  uint64_t v9 = [v6 absoluteString];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__FMFSession_handleIncomingAirDropURL_completion___block_invoke;
  v11[3] = &unk_263FE70B8;
  void v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(FMFSession *)self receivedMappingPacket:v9 completion:v11];
}

void __50__FMFSession_handleIncomingAirDropURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "receivedMappingPacket: completion responseId: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    if ([v6 code] != 1000) {
      goto LABEL_8;
    }
    __int16 v8 = [*(id *)(a1 + 32) serverProxy];
    [v8 showAirDropImportErrorAlert];
  }
  else
  {
    __int16 v8 = [*(id *)(a1 + 32) serverProxy];
    [v8 showAirDropImportAlertForId:v5];
  }

LABEL_8:
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

+ (BOOL)FMFAllowed
{
  if (!FMFAllowed_fmfAllowedNumber)
  {
    uint64_t v2 = (void *)MGCopyAnswer();
    objc_storeStrong((id *)&FMFAllowed_fmfAllowedNumber, v2);
    if (v2) {
      CFRelease(v2);
    }
  }
  uint64_t v3 = (void *)FMFAllowed_fmfAllowedNumber;

  return [v3 BOOLValue];
}

+ (BOOL)FMFRestricted
{
  uint64_t v2 = *MEMORY[0x263F538D0];
  uint64_t v3 = [MEMORY[0x263F53C50] sharedConnection];
  LOBYTE(v2) = [v3 effectiveBoolValueForSetting:v2] == 2;

  return v2;
}

+ (BOOL)isProvisionedForLocationSharing
{
  id v2 = objc_alloc_init(getACAccountStoreClass());
  uint64_t v3 = objc_msgSend(v2, "aa_primaryAppleAccountWithPreloadedDataclasses");
  id v4 = v3;
  if (v3) {
    char v5 = [v3 isProvisionedForDataclass:*MEMORY[0x263EFB488]];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

+ (BOOL)isAnyAccountManaged
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(getACAccountStoreClass());
  objc_msgSend(v2, "aa_appleAccounts");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "aa_isManagedAppleID", (void)v9))
        {
          LODWORD(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = v4;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "FMFSession: isAnyAccountManaged %d", buf, 8u);
  }

  return v4;
}

- (NSMutableSet)internalHandles
{
  return self->_internalHandles;
}

- (void)setInternalHandles:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (NSSet)cachedGetHandlesSharingLocationsWithMe
{
  return self->_cachedGetHandlesSharingLocationsWithMe;
}

- (void)setCachedGetHandlesSharingLocationsWithMe:(id)a3
{
}

- (NSSet)cachedGetHandlesFollowingMyLocation
{
  return self->_cachedGetHandlesFollowingMyLocation;
}

- (void)setCachedGetHandlesFollowingMyLocation:(id)a3
{
}

- (NSMutableDictionary)cachedLocationForHandleByHandle
{
  return self->_cachedLocationForHandleByHandle;
}

- (void)setCachedLocationForHandleByHandle:(id)a3
{
}

- (NSMutableDictionary)cachedOfferExpirationForHandleByHandle
{
  return self->_cachedOfferExpirationForHandleByHandle;
}

- (void)setCachedOfferExpirationForHandleByHandle:(id)a3
{
}

- (NSMutableDictionary)cachedCanShareLocationWithHandleByHandle
{
  return self->_cachedCanShareLocationWithHandleByHandle;
}

- (void)setCachedCanShareLocationWithHandleByHandle:(id)a3
{
}

- (OS_dispatch_queue)handlesQueue
{
  return self->_handlesQueue;
}

- (BOOL)isModelInitialized
{
  return self->_isModelInitialized;
}

- (void)setIsModelInitialized:(BOOL)a3
{
  self->_isModelInitialized = a3;
}

- (void)setSessionInvalidationFuture:(id)a3
{
}

- (void)setSessionInterruptionFuture:(id)a3
{
}

- (id)getHandlesSharingLocationsWithMe
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = +[FMFSessionDataManager sharedInstance];
  uint64_t v4 = [v3 following];

  uint64_t v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    __int16 v8 = v4;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "getHandlesSharingLocationsWithMe: %@", (uint8_t *)&v7, 0xCu);
  }

  [(FMFSession *)self reloadDataIfNotLoaded];

  return v4;
}

- (id)getHandlesFollowingMyLocation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = +[FMFSessionDataManager sharedInstance];
  uint64_t v4 = [v3 followers];

  uint64_t v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    __int16 v8 = v4;
    _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "getHandlesFollowingMyLocation: %@", (uint8_t *)&v7, 0xCu);
  }

  [(FMFSession *)self reloadDataIfNotLoaded];

  return v4;
}

- (id)getFavoritesSharingLocationWithMe
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__3;
  id v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  id v3 = [NSString stringWithUTF8String:"-[FMFSession(Data) getFavoritesSharingLocationWithMe]"];
  uint64_t v4 = [[FMFSynchronizer alloc] initWithDescription:v3 andTimeout:1.0];
  uint64_t v5 = [(FMFSession *)self serverProxy];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __53__FMFSession_Data__getFavoritesSharingLocationWithMe__block_invoke;
  int v14 = &unk_263FE7878;
  uint64_t v16 = &v17;
  id v6 = v4;
  uint64_t v15 = v6;
  [v5 favoritesForMaxCount:0 completion:&v11];

  [(FMFSynchronizer *)v6 wait];
  int v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v18[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v8;
    _os_log_impl(&dword_20AD87000, v7, OS_LOG_TYPE_DEFAULT, "getFavoritesSharingLocationWithMe: %@", buf, 0xCu);
  }

  id v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __53__FMFSession_Data__getFavoritesSharingLocationWithMe__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
}

- (BOOL)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[FMFSessionDataManager sharedInstance];
  long long v10 = [v9 followerForHandle:v7];

  if (v10)
  {
    if (v8) {
      int v11 = [v10 isSharingThroughGroupId:v8];
    }
    else {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v12 = LogCategory_Daemon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v7;
    __int16 v16 = 1024;
    int v17 = v11;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_20AD87000, v12, OS_LOG_TYPE_DEFAULT, "canShareLocationWithHandle: %@: %d groupId: %@", (uint8_t *)&v14, 0x1Cu);
  }

  [(FMFSession *)self reloadDataIfNotLoaded];
  return v11;
}

- (BOOL)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[FMFSessionDataManager sharedInstance];
  long long v10 = [v9 followingForHandle:v7];

  if (v10)
  {
    if (v8) {
      int v11 = [v10 isSharingThroughGroupId:v8];
    }
    else {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v12 = LogCategory_Daemon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v7;
    __int16 v16 = 1024;
    int v17 = v11;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_20AD87000, v12, OS_LOG_TYPE_DEFAULT, "canGetLocationForHandle: %@: %d groupId: %@", (uint8_t *)&v14, 0x1Cu);
  }

  [(FMFSession *)self reloadDataIfNotLoaded];
  return v11;
}

- (id)getHandlesWithPendingOffers
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  id v3 = [NSString stringWithUTF8String:"-[FMFSession(Data) getHandlesWithPendingOffers]"];
  id v4 = [[FMFSynchronizer alloc] initWithDescription:v3 andTimeout:1.0];
  uint64_t v5 = [(FMFSession *)self serverProxy];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  int v11 = __47__FMFSession_Data__getHandlesWithPendingOffers__block_invoke;
  uint64_t v12 = &unk_263FE6CE0;
  int v14 = &v15;
  id v6 = v4;
  uint64_t v13 = v6;
  [v5 getHandlesWithPendingOffers:&v9];

  [(FMFSynchronizer *)v6 wait];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

void __47__FMFSession_Data__getHandlesWithPendingOffers__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
}

- (BOOL)isMyLocationEnabled
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v3 = [NSString stringWithUTF8String:"-[FMFSession(Data) isMyLocationEnabled]"];
  id v4 = [[FMFSynchronizer alloc] initWithDescription:v3 andTimeout:1.0];
  uint64_t v5 = [(FMFSession *)self serverProxy];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __39__FMFSession_Data__isMyLocationEnabled__block_invoke;
  int v11 = &unk_263FE78A0;
  uint64_t v13 = &v14;
  id v6 = v4;
  uint64_t v12 = v6;
  [v5 isMyLocationEnabled:&v8];

  [(FMFSynchronizer *)v6 wait];
  LOBYTE(v5) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v5;
}

uint64_t __39__FMFSession_Data__isMyLocationEnabled__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return [*(id *)(a1 + 32) signal];
}

- (id)cachedLocationForHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[FMFSessionDataManager sharedInstance];
  uint64_t v5 = [v4 locationForHandle:v3];

  id v6 = LogCategory_Daemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    int v11 = v5;
    _os_log_impl(&dword_20AD87000, v6, OS_LOG_TYPE_DEFAULT, "cachedLocationForHandle: %@: %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (id)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[FMFSessionDataManager sharedInstance];
  __int16 v10 = [v9 offerExpirationForHandle:v7 groupId:v8];

  int v11 = LogCategory_Daemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    _os_log_impl(&dword_20AD87000, v11, OS_LOG_TYPE_DEFAULT, "getOfferExpirationForHandle: %@ groupId: %@ result:%@", (uint8_t *)&v13, 0x20u);
  }

  [(FMFSession *)self reloadDataIfNotLoaded];

  return v10;
}

- (void)reloadDataIfNotLoaded
{
  if (![(FMFSession *)self hasModelInitialized])
  {
    id v3 = LogCategory_Daemon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "Reloading Data - Not Loaded", v4, 2u);
    }

    [(FMFSession *)self forceRefresh];
  }
}

void __47__FMFSession_Admin__getThisDeviceAndCompanion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[FMFSession(Admin) getThisDeviceAndCompanion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_20AD87000, a2, OS_LOG_TYPE_ERROR, "%s: getAllDevices failed, error = %@", (uint8_t *)&v2, 0x16u);
}

void __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__FMFSession_Notifications__contactForPayload_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__FMFSession_Notifications__dataForPayload_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20AD87000, a2, OS_LOG_TYPE_ERROR, "Error while trying to get active Share My Location device: %@", (uint8_t *)&v2, 0xCu);
}

void __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20AD87000, v0, v1, "Trying to sendFriendshipOfferToHandles:groupId:callerId:endDate:completion: when device is offline", v2, v3, v4, v5, v6);
}

void __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20AD87000, v0, v1, "Trying to stopSharingMyLocationWithHandle:groupId:callerId:endDate:completion: when device is offline", v2, v3, v4, v5, v6);
}

void __37__FMFSession_restoreClientConnection__block_invoke_107_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_20AD87000, v0, v1, "Failed to restore connection. %s: error: %@", v2, v3, v4, v5, 2u);
}

void __45__FMFSession_initWithDelegate_delegateQueue___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = sessionCount;
  _os_log_fault_impl(&dword_20AD87000, log, OS_LOG_TYPE_FAULT, "Too many FMFSession instances (%ld)", (uint8_t *)&v1, 0xCu);
}

void __26__FMFSession___connection__block_invoke_2_348_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_20AD87000, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void __25__FMFSession_serverProxy__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_20AD87000, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

- (void)mappingPacketSendFailed:(uint64_t)a1 toHandle:(NSObject *)a2 withError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20AD87000, a2, OS_LOG_TYPE_ERROR, "mappingPacketSendFailed: Error: %@", (uint8_t *)&v2, 0xCu);
}

@end