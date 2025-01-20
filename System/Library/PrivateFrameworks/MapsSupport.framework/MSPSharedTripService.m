@interface MSPSharedTripService
+ (BOOL)_supportsPassingClosureReasons;
+ (id)sharedInstance;
- (BOOL)_isMapsInstalled;
- (BOOL)_serviceCanAttemptConnection:(id *)a3;
- (BOOL)_supportsArchivingSharingState;
- (BOOL)_supportsMonitoringBlockList;
- (BOOL)canAddReceivers;
- (BOOL)entitledToReceiveTrips;
- (BOOL)entitledToShareTrip;
- (BOOL)isSharingWithContact:(id)a3;
- (MSPSharedTripService)init;
- (MSPSharedTripSharingIdentity)sharingIdentity;
- (NSArray)receivedTrips;
- (NSArray)receivers;
- (id)_addSubscriptionTokenForTripID:(id)a3;
- (id)_insertOrUpdateTrip:(id)a3;
- (id)_receivers;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_subscriptionTokensForTripID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)archivedSharingState;
- (id)contactsFromArchivedTripSharingState:(id)a3;
- (unint64_t)_capabilityTypeForContact:(id)a3 serviceName:(id *)a4 isActiveReceiver:(BOOL *)a5;
- (unint64_t)capabilityTypeForContact:(id)a3 serviceName:(id *)a4 isActiveReceiver:(BOOL *)a5;
- (void)_addTestTripsTo:(id)a3;
- (void)_checkBlockList;
- (void)_checkEnabledState;
- (void)_checkin;
- (void)_checkinWithCompletion:(id)a3;
- (void)_clearBlockedTripIdentifiers;
- (void)_fetchActiveHandlesWithCompletion:(id)a3;
- (void)_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3;
- (void)_fetchSharedTripsWithCompletion:(id)a3;
- (void)_fetchSharingIdentityWithCompletion:(id)a3;
- (void)_handleCheckinWithSharingIdentity:(id)a3 activeRecipients:(id)a4 serviceNamesByHandle:(id)a5 receivedTrips:(id)a6 permissions:(unint64_t)a7;
- (void)_networkReachabilityChanged:(id)a3;
- (void)_openConnectionIfNeeded;
- (void)_performBlockAfterInitialConnection:(id)a3;
- (void)_performBlockAfterInitialSync:(id)a3;
- (void)_performBlockWhenCheckinCompleted:(id)a3;
- (void)_purgeExpiredBlockedTripIdentifiers;
- (void)_purgeToken:(id)a3 forTripID:(id)a4;
- (void)_reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4;
- (void)_resetCheckinIdentityAndPermissions;
- (void)_scheduleCoalescedBlockListCheckIfNeeded;
- (void)_startMonitoringSystemBlockListIfNeeded;
- (void)_startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5 completion:(id)a6;
- (void)_startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4;
- (void)_startSharingWithContact:(id)a3 completion:(id)a4;
- (void)_stopAllSharingWithReason:(unint64_t)a3 completion:(id)a4;
- (void)_stopMonitoringSystemBlockList;
- (void)_stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)_stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)_stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4;
- (void)_stopSharingWithContact:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)_subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4;
- (void)_subscriptionTokenDidInvalidate:(id)a3 forTripID:(id)a4;
- (void)_systemBlockListDidUpdate;
- (void)_validateCurrentConfigurationWithCompletion:(id)a3;
- (void)addReceivingObserver:(id)a3;
- (void)addSendingObserver:(id)a3;
- (void)blockSharedTrip:(id)a3;
- (void)blockSharedTripWithIdentifier:(id)a3;
- (void)checkin;
- (void)checkinWithCompletion:(id)a3;
- (void)clearBlockedTripIdentifiers;
- (void)dealloc;
- (void)destinationDidUpdateForSharedTrip:(id)a3;
- (void)destinationReachedDidUpdateForSharedTrip:(id)a3;
- (void)etaDidUpdateForSharedTrip:(id)a3;
- (void)fetchActiveHandlesWithCompletion:(id)a3;
- (void)fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3;
- (void)fetchSharedTripsWithCompletion:(id)a3;
- (void)fetchSharingIdentityWithCompletion:(id)a3;
- (void)performBlockAfterInitialConnection:(id)a3;
- (void)performBlockAfterInitialSync:(id)a3;
- (void)purgeExpiredBlockedTripIdentifiers;
- (void)purgeToken:(id)a3 forTripID:(id)a4;
- (void)removeReceivingObserver:(id)a3;
- (void)removeSendingObserver:(id)a3;
- (void)reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4;
- (void)routeDidUpdateForSharedTrip:(id)a3;
- (void)sharedTripContactController:(id)a3 didUpdateActiveContactsValues:(id)a4;
- (void)sharedTripDidBecomeAvailable:(id)a3;
- (void)sharedTripDidBecomeUnavailable:(id)a3;
- (void)sharedTripDidClose:(id)a3;
- (void)sharedTripDidStartSharingWithIdentifier:(id)a3;
- (void)sharedTripDidUpdateRecipients:(id)a3 withServices:(id)a4;
- (void)sharedTripInvalidatedWithError:(id)a3;
- (void)sharingIdentityDidChange:(id)a3;
- (void)startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5 completion:(id)a6;
- (void)startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4;
- (void)startSharingWithContact:(id)a3 completion:(id)a4;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopAllSharingWithReason:(unint64_t)a3 completion:(id)a4;
- (void)stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4;
- (void)stopSharingWithContact:(id)a3 completion:(id)a4;
- (void)stopSharingWithContact:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4;
- (void)unsubscribeFromSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation MSPSharedTripService

- (void)addReceivingObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136380931;
    v7 = "-[MSPSharedTripService addReceivingObserver:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_receivingObservers registerObserver:v4];
}

void __31__MSPSharedTripService_checkin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkin];
}

uint64_t __37__MSPSharedTripService_receivedTrips__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];

  return MEMORY[0x1F41817F8]();
}

void __32__MSPSharedTripService__checkin__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v16 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleCheckinWithSharingIdentity:v11 activeRecipients:v12 serviceNamesByHandle:v13 receivedTrips:v14 permissions:a6];
    uint64_t v17 = *((void *)v16 + 15);
    v18 = MSPGetSharedTripLog();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_DEBUG, "[Service] Leaving checkin dispatch group", buf, 2u);
      }

      dispatch_group_leave(*((dispatch_group_t *)v16 + 15));
      v19 = *((void *)v16 + 15);
      *((void *)v16 + 15) = 0;
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_ERROR, "[Service] Checkin dispatch group missing when checkin completed", v21, 2u);
    }

    [*((id *)v16 + 6) sharedTripServiceDidUpdateReceivingAvailability:*(void *)(a1 + 32)];
    [*((id *)v16 + 7) sharedTripServiceDidUpdateSendingAvailability:*(void *)(a1 + 32)];
  }
  else
  {
    v20 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_DEBUG, "[Service] Leaving checking dispatch group, self deallocated", v23, 2u);
    }
  }
}

- (void)_handleCheckinWithSharingIdentity:(id)a3 activeRecipients:(id)a4 serviceNamesByHandle:(id)a5 receivedTrips:(id)a6 permissions:(unint64_t)a7
{
  id v19 = a3;
  id v13 = a6;
  isolationQueue = self->_isolationQueue;
  id v15 = a5;
  id v16 = a4;
  dispatch_assert_queue_V2(isolationQueue);
  self->_connectionError = 0;
  self->_connectionRetryCounter = 0;
  os_unfair_lock_lock(&self->_sharingIdentityLock);
  objc_storeStrong((id *)&self->_sharingIdentity, a3);
  self->_permissions = a7;
  os_unfair_lock_unlock(&self->_sharingIdentityLock);
  [(MSPSharedTripContactController *)self->_sharingContactController updateActiveSharingHandles:v16 serviceNames:v15];

  if (v13) {
    uint64_t v17 = (NSMutableArray *)[v13 mutableCopy];
  }
  else {
    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  receivedTrips = self->_receivedTrips;
  self->_receivedTrips = v17;

  [(MSPSharedTripService *)self _addTestTripsTo:self->_receivedTrips];
}

- (void)_addTestTripsTo:(id)a3
{
  id v18 = a3;
  if (GEOConfigGetBOOL())
  {
    v3 = objc_msgSend(MEMORY[0x1E4F64A38], "_msp_testTrip");
    id v4 = (void *)MEMORY[0x1E4F64A38];
    v5 = [v3 groupIdentifier];
    LOBYTE(v4) = objc_msgSend(v4, "_msp_isTestTripBlockedWithIdentifier:", v5);

    if ((v4 & 1) == 0) {
      [v18 addObject:v3];
    }
  }
  if (GEOConfigGetBOOL())
  {
    int v6 = objc_msgSend(MEMORY[0x1E4F64A38], "_msp_testTripWithMultipleStops");
    v7 = (void *)MEMORY[0x1E4F64A38];
    __int16 v8 = [v6 groupIdentifier];
    LOBYTE(v7) = objc_msgSend(v7, "_msp_isTestTripBlockedWithIdentifier:", v8);

    if ((v7 & 1) == 0) {
      [v18 addObject:v6];
    }
  }
  if (GEOConfigGetBOOL())
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F64A38], "_msp_testTripWithMultipleStopsMiddleOfTrip");
    uint64_t v10 = (void *)MEMORY[0x1E4F64A38];
    id v11 = [v9 groupIdentifier];
    LOBYTE(v10) = objc_msgSend(v10, "_msp_isTestTripBlockedWithIdentifier:", v11);

    if ((v10 & 1) == 0) {
      [v18 addObject:v9];
    }
  }
  if (GEOConfigGetBOOL())
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F64A38], "_msp_testTripSky");
    id v13 = (void *)MEMORY[0x1E4F64A38];
    id v14 = [v12 groupIdentifier];
    LOBYTE(v13) = objc_msgSend(v13, "_msp_isTestTripBlockedWithIdentifier:", v14);

    if ((v13 & 1) == 0) {
      [v18 addObject:v12];
    }
  }
  if (GEOConfigGetBOOL())
  {
    id v15 = objc_msgSend(MEMORY[0x1E4F64A38], "_msp_testTripClosedTripInPast");
    id v16 = (void *)MEMORY[0x1E4F64A38];
    uint64_t v17 = [v15 groupIdentifier];
    LOBYTE(v16) = objc_msgSend(v16, "_msp_isTestTripBlockedWithIdentifier:", v17);

    if ((v16 & 1) == 0) {
      [v18 addObject:v15];
    }
  }
}

uint64_t __38__MSPSharedTripService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB7F4698;
  qword_1EB7F4698 = (uint64_t)v1;

  v3 = MSPSharedTripServerStartDarwinNotification;
  id v4 = MEMORY[0x1E4F14428];

  return notify_register_dispatch(v3, &dword_1EB7F4694, v4, &__block_literal_global_21);
}

- (MSPSharedTripService)init
{
  v27.receiver = self;
  v27.super_class = (Class)MSPSharedTripService;
  v2 = [(MSPSharedTripService *)&v27 init];
  v3 = v2;
  if (v2)
  {
    v2->_sharingIdentityLock._os_unfair_lock_opaque = 0;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Maps.SharedTrip.Service.Isolation", v4);
    isolationQueue = v3->_isolationQueue;
    v3->_isolationQueue = (OS_dispatch_queue *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F647B0]);
    __int16 v8 = (void *)MEMORY[0x1E4F14428];
    uint64_t v9 = [v7 initWithProtocol:&unk_1F1222DB0 queue:MEMORY[0x1E4F14428]];
    receivingObservers = v3->_receivingObservers;
    v3->_receivingObservers = (GEOObserverHashTable *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F647B0]) initWithProtocol:&unk_1F1222E10 queue:v8];
    sendingObservers = v3->_sendingObservers;
    v3->_sendingObservers = (GEOObserverHashTable *)v11;

    id v13 = [[MSPSharedTripContactController alloc] initWithSharedTripServer:v3];
    sharingContactController = v3->_sharingContactController;
    v3->_sharingContactController = v13;

    [(MSPSharedTripContactController *)v3->_sharingContactController setDelegate:v3];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    subscriptionTokensByTripID = v3->_subscriptionTokensByTripID;
    v3->_subscriptionTokensByTripID = (NSMutableDictionary *)v15;

    objc_initWeak(&location, v3);
    v24[1] = (id)MEMORY[0x1E4F143A8];
    v24[2] = (id)3221225472;
    v24[3] = __28__MSPSharedTripService_init__block_invoke;
    v24[4] = &unk_1E617E168;
    objc_copyWeak(&v25, &location);
    uint64_t v17 = _GEOConfigAddBlockListenerForKey();
    id userDisabledDefaultListener = v3->_userDisabledDefaultListener;
    v3->_id userDisabledDefaultListener = (id)v17;

    objc_copyWeak(v24, &location);
    uint64_t v19 = _GEOConfigAddBlockListenerForKey();
    id serverDisabledDefaultListener = v3->_serverDisabledDefaultListener;
    v3->_id serverDisabledDefaultListener = (id)v19;

    v21 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
    v3->_networkReachable = [v21 isNetworkReachable];

    v22 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
    [v22 addNetworkReachableObserver:v3 selector:sel__networkReachabilityChanged_];

    [(MSPSharedTripService *)v3 checkin];
    objc_destroyWeak(v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)checkin
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__MSPSharedTripService_checkin__block_invoke;
  v4[3] = &unk_1E617C9A8;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSArray)receivedTrips
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__9;
  uint64_t v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MSPSharedTripService_receivedTrips__block_invoke;
  v6[3] = &unk_1E617DAE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)_checkin
{
  if (self->_checkinDispatchGroup)
  {
    v2 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      v3 = "[Service] Will not checkin, still waiting for previous checkin to complete";
LABEL_12:
      _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    char v5 = MSPSharedTripEnabled();
    v2 = MSPGetSharedTripLog();
    BOOL v6 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v6)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEBUG, "[Service] Preparing checkin dispatch group", (uint8_t *)buf, 2u);
      }

      v2 = dispatch_group_create();
      checkinDispatchGroup = self->_checkinDispatchGroup;
      self->_checkinDispatchGroup = (OS_dispatch_group *)v2;

      dispatch_group_enter(v2);
      __int16 v8 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEBUG, "[Service] Entering checkin dispatch group", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __32__MSPSharedTripService__checkin__block_invoke;
      v9[3] = &unk_1E617EB98;
      objc_copyWeak(&v10, buf);
      v9[4] = self;
      [(MSPSharedTripService *)self _checkinWithCompletion:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
    else if (v6)
    {
      LOWORD(buf[0]) = 0;
      v3 = "[Service] Will not checkin, feature is not enabled";
      goto LABEL_12;
    }
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MSPSharedTripService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB7F46A0 != -1) {
    dispatch_once(&qword_1EB7F46A0, block);
  }
  v2 = (void *)qword_1EB7F4698;

  return v2;
}

- (MSPSharedTripSharingIdentity)sharingIdentity
{
  p_sharingIdentityLock = &self->_sharingIdentityLock;
  os_unfair_lock_lock(&self->_sharingIdentityLock);
  id v4 = self->_sharingIdentity;
  os_unfair_lock_unlock(p_sharingIdentityLock);

  return v4;
}

- (BOOL)entitledToReceiveTrips
{
  p_sharingIdentityLock = &self->_sharingIdentityLock;
  os_unfair_lock_lock(&self->_sharingIdentityLock);
  unint64_t v4 = (self->_permissions >> 1) & 1;
  os_unfair_lock_unlock(p_sharingIdentityLock);
  return v4;
}

- (BOOL)entitledToShareTrip
{
  v2 = self;
  p_sharingIdentityLock = &self->_sharingIdentityLock;
  os_unfair_lock_lock(&self->_sharingIdentityLock);
  LODWORD(v2) = v2->_permissions & 1;
  os_unfair_lock_unlock(p_sharingIdentityLock);
  return (char)v2;
}

- (void)_checkinWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_checkinWithCompletion", (const char *)&unk_1B8876199, v7, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  BOOL v6 = [(MSPSharedTripService *)self _remoteObjectProxy];
  [v6 checkinWithCompletion:v4];
}

- (id)_remoteObjectProxy
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(MSPSharedTripService *)self _openConnectionIfNeeded];
  connection = self->_connection;

  return [(NSXPCConnection *)connection remoteObjectProxy];
}

- (void)_openConnectionIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!self->_connection)
  {
    v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Will open connection to daemon", buf, 2u);
    }

    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.Maps.xpc.SharedTrip" options:0];
    connection = self->_connection;
    self->_connection = v4;

    BOOL v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F12097C0];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_fetchSharedTripsWithCompletion_ argumentIndex:0 ofReply:1];

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    [v6 setClasses:v12 forSelector:sel_checkinWithCompletion_ argumentIndex:3 ofReply:1];

    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];
    id v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1218670];
    [(NSXPCConnection *)self->_connection setExportedInterface:v13];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    [(NSXPCConnection *)self->_connection _setQueue:self->_isolationQueue];
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_connection);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__MSPSharedTripService__openConnectionIfNeeded__block_invoke;
    v19[3] = &unk_1E617C4C0;
    objc_copyWeak(&v20, &from);
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v19];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__MSPSharedTripService__openConnectionIfNeeded__block_invoke_191;
    v16[3] = &unk_1E617C4C0;
    objc_copyWeak(&v17, &from);
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v16];
    id v14 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = self->_connection;
      *(_DWORD *)buf = 138412290;
      id v25 = v15;
      _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEFAULT, "[Service] Checking in on connection: %@", buf, 0xCu);
    }

    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)addSendingObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136380931;
    uint64_t v7 = "-[MSPSharedTripService addSendingObserver:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_sendingObservers registerObserver:v4];
}

uint64_t __38__MSPSharedTripService_sharedInstance__block_invoke_2()
{
  return [(id)qword_1EB7F4698 checkin];
}

void __28__MSPSharedTripService_init__block_invoke(uint64_t a1)
{
  v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEFAULT, "[Service] Notified Share ETA user enabled did change", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkEnabledState];
}

void __28__MSPSharedTripService_init__block_invoke_68(uint64_t a1)
{
  v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEFAULT, "[Service] Notified Share ETA server enabled did change", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkEnabledState];
}

- (void)dealloc
{
  [(MSPSharedTripService *)self _stopMonitoringSystemBlockList];
  v3 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
  [v3 removeNetworkReachableObserver:self];

  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  id userDisabledDefaultListener = self->_userDisabledDefaultListener;
  self->_id userDisabledDefaultListener = 0;

  id serverDisabledDefaultListener = self->_serverDisabledDefaultListener;
  self->_id serverDisabledDefaultListener = 0;

  checkinDispatchGroup = self->_checkinDispatchGroup;
  if (checkinDispatchGroup)
  {
    self->_checkinDispatchGroup = 0;
    uint64_t v7 = checkinDispatchGroup;

    dispatch_group_leave(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)MSPSharedTripService;
  [(MSPSharedTripService *)&v8 dealloc];
}

- (void)_resetCheckinIdentityAndPermissions
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[Service] Resetting checkin identity and permissions", v5, 2u);
  }

  os_unfair_lock_lock(&self->_sharingIdentityLock);
  sharingIdentity = self->_sharingIdentity;
  self->_sharingIdentity = 0;

  self->_permissions = 0;
  os_unfair_lock_unlock(&self->_sharingIdentityLock);
}

- (void)_performBlockWhenCheckinCompleted:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_checkinDispatchGroup)
  {
    char v5 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] Registering to be notified when checkin is completed", v6, 2u);
    }

    dispatch_group_notify((dispatch_group_t)self->_checkinDispatchGroup, (dispatch_queue_t)self->_isolationQueue, v4);
  }
}

- (void)_checkEnabledState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  char v3 = MSPSharedTripEnabled();
  connection = self->_connection;
  if (v3)
  {
    if (!connection)
    {
      char v5 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[Service] Feature is enabled, will attempt checkin", (uint8_t *)&v8, 2u);
      }

      [(MSPSharedTripService *)self _checkin];
    }
  }
  else if (connection)
  {
    int v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = self->_connection;
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[Service] Feature is disabled, invalidating current connection: %@", (uint8_t *)&v8, 0xCu);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
}

- (void)performBlockAfterInitialConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSPSharedTripService_performBlockAfterInitialConnection___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__MSPSharedTripService_performBlockAfterInitialConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performBlockAfterInitialConnection:*(void *)(a1 + 32)];
}

- (void)_performBlockAfterInitialConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MSPSharedTripService__performBlockAfterInitialConnection___block_invoke;
  v11[3] = &unk_1E617E298;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  id v6 = (void (**)(void))MEMORY[0x1BA9C2AF0](v11);
  checkinDispatchGroup = self->_checkinDispatchGroup;
  id v8 = MSPGetSharedTripLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (checkinDispatchGroup)
  {
    if (v9)
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEBUG, "[Service] Will fire external post-checkin block when checkin is completed", v10, 2u);
    }

    dispatch_group_notify((dispatch_group_t)self->_checkinDispatchGroup, (dispatch_queue_t)self->_isolationQueue, v6);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEBUG, "[Service] Will fire external post-checkin block, checkin is not in progress", v10, 2u);
    }

    v6[2](v6);
  }
}

void __60__MSPSharedTripService__performBlockAfterInitialConnection___block_invoke(uint64_t a1)
{
  v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEBUG, "[Service] Firing external post-checkin block", buf, 2u);
  }

  char v3 = *(void **)(a1 + 32);
  id v10 = 0;
  [v3 _serviceCanAttemptConnection:&v10];
  id v4 = v10;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MSPSharedTripService__performBlockAfterInitialConnection___block_invoke_76;
  v7[3] = &unk_1E617EBE8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  v7[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __60__MSPSharedTripService__performBlockAfterInitialConnection___block_invoke_76(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performBlockAfterInitialSync:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MSPSharedTripService_performBlockAfterInitialSync___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__MSPSharedTripService_performBlockAfterInitialSync___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performBlockAfterInitialSync:*(void *)(a1 + 32)];
}

- (void)_performBlockAfterInitialSync:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (_performBlockAfterInitialSync__onceToken != -1) {
    dispatch_once(&_performBlockAfterInitialSync__onceToken, &__block_literal_global_78);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MSPSharedTripService__performBlockAfterInitialSync___block_invoke_79;
  v6[3] = &unk_1E617EC10;
  id v7 = v4;
  id v5 = v4;
  [(MSPSharedTripService *)self _performBlockAfterInitialConnection:v6];
}

void __54__MSPSharedTripService__performBlockAfterInitialSync___block_invoke()
{
  v0 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1B87E5000, v0, OS_LOG_TYPE_INFO, "[Service] Call to deprecated performAfterInitialSync:, please use performBlockAfterInitialConnection: instead", v1, 2u);
  }
}

uint64_t __54__MSPSharedTripService__performBlockAfterInitialSync___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canAddReceivers
{
  return self->_networkReachable && MSPSharedTripSharingAvailable();
}

- (void)_networkReachabilityChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F63F20]];
  int v6 = [v5 BOOLValue];

  if (self->_networkReachable != v6)
  {
    id v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_networkReachable) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      id v9 = v8;
      if (v6) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      uint64_t v11 = v10;
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "[Service] Network reachability changed: %{public}@ -> %{public}@, notifying sending observers", (uint8_t *)&v12, 0x16u);
    }
    self->_networkReachable = v6;
    [(GEOObserverHashTable *)self->_sendingObservers sharedTripServiceDidUpdateSendingAvailability:self];
  }
}

- (NSArray)receivers
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__9;
  id v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MSPSharedTripService_receivers__block_invoke;
  block[3] = &unk_1E617DBD8;
  void block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(isolationQueue, block);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

void __33__MSPSharedTripService_receivers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _receivers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_receivers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [(MSPSharedTripContactController *)self->_sharingContactController activeContactsValues];
  id v4 = [v3 array];

  return v4;
}

- (unint64_t)capabilityTypeForContact:(id)a3 serviceName:(id *)a4 isActiveReceiver:(BOOL *)a5
{
  id v8 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__MSPSharedTripService_capabilityTypeForContact_serviceName_isActiveReceiver___block_invoke;
  v13[3] = &unk_1E617EC38;
  uint64_t v15 = &v18;
  objc_copyWeak(v16, &location);
  id v14 = v8;
  v16[1] = a4;
  v16[2] = a5;
  id v10 = v8;
  dispatch_sync(isolationQueue, v13);
  unint64_t v11 = v19[3];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __78__MSPSharedTripService_capabilityTypeForContact_serviceName_isActiveReceiver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _capabilityTypeForContact:*(void *)(a1 + 32) serviceName:*(void *)(a1 + 56) isActiveReceiver:*(void *)(a1 + 64)];
}

- (unint64_t)_capabilityTypeForContact:(id)a3 serviceName:(id *)a4 isActiveReceiver:(BOOL *)a5
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v9 = [(MSPSharedTripContactController *)self->_sharingContactController activeCapabilityTypeForContact:v8 serviceName:a4];
  if (v9)
  {
    unint64_t v10 = v9;
    if (a5) {
      *a5 = 1;
    }
  }
  else
  {
    unint64_t v11 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    unint64_t v10 = [v11 capabilityLevelForContact:v8];

    int v12 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    id v13 = [v12 serviceNameForContact:v8];

    if (a4) {
      *a4 = v13;
    }
    if (a5) {
      *a5 = 0;
    }
  }
  return v10;
}

- (BOOL)isSharingWithContact:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MSPSharedTripService_isSharingWithContact___block_invoke;
  block[3] = &unk_1E617C798;
  id v9 = v4;
  unint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(isolationQueue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __45__MSPSharedTripService_isSharingWithContact___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) contactIsActive:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)startSharingWithContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__MSPSharedTripService_startSharingWithContact_completion___block_invoke;
  v11[3] = &unk_1E617EC60;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __59__MSPSharedTripService_startSharingWithContact_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _startSharingWithContact:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_startSharingWithContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_networkReachable)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_82;
    v8[3] = &unk_1E617ED00;
    id v9 = v6;
    id v10 = v7;
    objc_copyWeak(&v11, &location);
    [(MSPSharedTripService *)self _validateCurrentConfigurationWithCompletion:v8];
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke;
    block[3] = &unk_1E617E298;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F28228];
  *(void *)id v6 = @"No network connection";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v9 count:1];
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:20 userInfo:v2];

  id v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)id v6 = 138478083;
    *(void *)&void v6[4] = v5;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_82(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_2;
    block[3] = &unk_1E617EC88;
    v22 = (uint64_t *)a1[4];
    id v23 = v3;
    id v24 = a1[5];
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v4 = v22;
  }
  else if (objc_msgSend(MEMORY[0x1E4F1B980], "_maps_isAuthorized"))
  {
    if ([a1[4] isHandleBlocked])
    {
      uint64_t v5 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "[Service] Will not start sharing, contact is in system block list", buf, 2u);
      }

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_85;
      v14[3] = &unk_1E617E298;
      id v15 = a1[4];
      id v16 = a1[5];
      dispatch_async(MEMORY[0x1E4F14428], v14);
    }
    id WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 6);
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      __int16 v7 = (void *)WeakRetained[9];
      id v8 = a1[4];
      uint64_t v9 = WeakRetained[3];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_86;
      v11[3] = &unk_1E617ECD8;
      id v12 = v8;
      id v13 = a1[5];
      [v7 shareWithContactValue:v12 queue:v9 completion:v11];
    }
  }
  else
  {
    id v10 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_ERROR, "[Service] Will not start sharing, Maps is not authorised for Contacts", buf, 2u);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_84;
    v17[3] = &unk_1E617E298;
    uint64_t v18 = (uint64_t *)a1[4];
    id v19 = a1[5];
    dispatch_async(MEMORY[0x1E4F14428], v17);

    id v4 = v18;
  }
}

uint64_t __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138478083;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_84(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F28228];
  *(void *)int v6 = @"Maps does not have authorisation for Contacts";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v9 count:1];
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:19 userInfo:v2];

  uint64_t v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)int v6 = 138478083;
    *(void *)&void v6[4] = v5;
    __int16 v7 = 2114;
    __int16 v8 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_85(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F28228];
  *(void *)int v6 = @"Contact is in system block list";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v9 count:1];
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:21 userInfo:v2];

  uint64_t v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)int v6 = 138478083;
    *(void *)&void v6[4] = v5;
    __int16 v7 = 2114;
    __int16 v8 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_86(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_2_87;
  v8[3] = &unk_1E617ECB0;
  id v9 = v6;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = a2;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_2_87(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v2 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = a1[4];
      uint64_t v3 = a1[5];
      int v6 = 138478083;
      uint64_t v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

+ (BOOL)_supportsPassingClosureReasons
{
  if (qword_1EB7F46A8 != -1) {
    dispatch_once(&qword_1EB7F46A8, &__block_literal_global_91);
  }
  return _MergedGlobals_52;
}

void __54__MSPSharedTripService__supportsPassingClosureReasons__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  if ([v1 isEqual:*MEMORY[0x1E4F64320]]) {
    char v2 = 1;
  }
  else {
    char v2 = [v1 isEqualToString:@"com.apple.Preferences"];
  }
  _MergedGlobals_52 = v2;
  uint64_t v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = "YES";
    if (!_MergedGlobals_52) {
      uint64_t v4 = "NO";
    }
    int v5 = 138543618;
    int v6 = v1;
    __int16 v7 = 2080;
    __int16 v8 = v4;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Service] %{public}@ supports passing sharing closure reasons: %s", (uint8_t *)&v5, 0x16u);
  }
}

- (void)stopSharingWithContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__MSPSharedTripService_stopSharingWithContact_completion___block_invoke;
  v11[3] = &unk_1E617EC60;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __58__MSPSharedTripService_stopSharingWithContact_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _stopSharingWithContact:*(void *)(a1 + 32) reason:0 completion:*(void *)(a1 + 40)];
}

- (void)stopSharingWithContact:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if ([(id)objc_opt_class() _supportsPassingClosureReasons])
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__MSPSharedTripService_stopSharingWithContact_reason_completion___block_invoke_2;
    v14[3] = &unk_1E617DAC0;
    objc_copyWeak(v17, &location);
    id v11 = v8;
    v17[1] = (id)a4;
    id v15 = v11;
    id v16 = v9;
    id v12 = v9;
    dispatch_async(isolationQueue, v14);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MSPSharedTripService_stopSharingWithContact_reason_completion___block_invoke;
    block[3] = &unk_1E617D980;
    id v20 = v9;
    id v13 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __65__MSPSharedTripService_stopSharingWithContact_reason_completion___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F28228];
  v5[0] = @"Operation not permitted";
  char v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:22 userInfo:v2];

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void __65__MSPSharedTripService_stopSharingWithContact_reason_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _stopSharingWithContact:*(void *)(a1 + 32) reason:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)_stopSharingWithContact:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke;
  v12[3] = &unk_1E617ED28;
  id v10 = v8;
  id v13 = v10;
  id v11 = v9;
  id v14 = v11;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a4;
  [(MSPSharedTripService *)self _validateCurrentConfigurationWithCompletion:v12];
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
}

void __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && [v3 code] != 20)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_2;
    block[3] = &unk_1E617EC88;
    id v15 = (uint64_t *)*(id *)(a1 + 32);
    id v16 = v4;
    id v17 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v6 = v15;
    goto LABEL_6;
  }
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = (void *)WeakRetained[9];
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = WeakRetained[3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_96;
    v11[3] = &unk_1E617E5E8;
    id v12 = v8;
    id v13 = *(id *)(a1 + 40);
    [v7 stopSharingWithContactValue:v12 reason:v9 queue:v10 completion:v11];

LABEL_6:
  }
}

uint64_t __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138478083;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_ERROR, "[Service] Error stopping sharing with contact %{private}@: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_2_97;
  block[3] = &unk_1E617EC88;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_2_97(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    char v2 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = a1[4];
      uint64_t v3 = a1[5];
      int v6 = 138478083;
      uint64_t v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_ERROR, "[Service] Error stopping sharing with contact %{private}@: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MSPSharedTripService_stopAllSharingWithCompletion___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__MSPSharedTripService_stopAllSharingWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _stopAllSharingWithReason:0 completion:*(void *)(a1 + 32)];
}

- (void)stopAllSharingWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if ([(id)objc_opt_class() _supportsPassingClosureReasons])
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MSPSharedTripService_stopAllSharingWithReason_completion___block_invoke_98;
    block[3] = &unk_1E617C478;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    id v11 = v6;
    id v8 = v6;
    dispatch_async(isolationQueue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__MSPSharedTripService_stopAllSharingWithReason_completion___block_invoke;
    v14[3] = &unk_1E617D980;
    id v15 = v6;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

void __60__MSPSharedTripService_stopAllSharingWithReason_completion___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4F28228];
  *(void *)int v5 = @"Operation not permitted";
  char v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v6 count:1];
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:22 userInfo:v2];

  id v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int v5 = 138543362;
    *(void *)&v5[4] = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_ERROR, "[Service] Error stopping all sharing: %{public}@", v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__MSPSharedTripService_stopAllSharingWithReason_completion___block_invoke_98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _stopAllSharingWithReason:*(void *)(a1 + 48) completion:*(void *)(a1 + 32)];
}

- (void)_stopAllSharingWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke;
  v8[3] = &unk_1E617ED50;
  id v7 = v6;
  id v9 = v7;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  [(MSPSharedTripService *)self _validateCurrentConfigurationWithCompletion:v8];
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

void __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3 || [v3 code] == 20)
  {
    id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = (void *)WeakRetained[9];
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = WeakRetained[3];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      id v10[2] = __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_99;
      v10[3] = &unk_1E617DA20;
      id v11 = *(id *)(a1 + 32);
      [v7 stopAllSharingWithReason:v8 queue:v9 completion:v10];
    }
    goto LABEL_7;
  }
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_2;
    block[3] = &unk_1E617E298;
    id v13 = v4;
    id v14 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v6 = v13;
LABEL_7:
  }
}

uint64_t __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_ERROR, "[Service] Error stopping all sharing: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_99(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_2_100;
    v5[3] = &unk_1E617E298;
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_2_100(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    char v2 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_ERROR, "[Service] Error stopping all sharing: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sharedTripContactController:(id)a3 didUpdateActiveContactsValues:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315395;
    uint64_t v10 = "-[MSPSharedTripService sharedTripContactController:didUpdateActiveContactsValues:]";
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[Service] %s %{private}@", (uint8_t *)&v9, 0x16u);
  }

  sendingObservers = self->_sendingObservers;
  uint64_t v8 = [v5 array];
  [(GEOObserverHashTable *)sendingObservers sharedTripService:self didUpdateReceivers:v8];
}

- (BOOL)_supportsMonitoringBlockList
{
  if (qword_1EB7F46B0 != -1) {
    dispatch_once(&qword_1EB7F46B0, &__block_literal_global_102);
  }
  return byte_1EB7F4691;
}

void __52__MSPSharedTripService__supportsMonitoringBlockList__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  byte_1EB7F4691 = [v1 isEqual:*MEMORY[0x1E4F64320]];

  char v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1EB7F4691) {
      uint64_t v3 = "YES";
    }
    else {
      uint64_t v3 = "NO";
    }
    int v4 = 136315138;
    id v5 = v3;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEFAULT, "[Service] Supports monitoring system block list: %s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_startMonitoringSystemBlockListIfNeeded
{
  if ([(MSPSharedTripService *)self _supportsMonitoringBlockList]
    && !self->_blockListMonitoringObserver)
  {
    uint64_t v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Will start monitoring system block list updates", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4F59E40];
    uint64_t v6 = [MEMORY[0x1E4F28F08] mainQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __63__MSPSharedTripService__startMonitoringSystemBlockListIfNeeded__block_invoke;
    v9[3] = &unk_1E617DD90;
    objc_copyWeak(&v10, buf);
    uint64_t v7 = [v4 addObserverForName:v5 object:0 queue:v6 usingBlock:v9];
    id blockListMonitoringObserver = self->_blockListMonitoringObserver;
    self->_id blockListMonitoringObserver = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

void __63__MSPSharedTripService__startMonitoringSystemBlockListIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _systemBlockListDidUpdate];
}

- (void)_stopMonitoringSystemBlockList
{
  if (self->_blockListMonitoringObserver)
  {
    uint64_t v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Will stop monitoring system block list updates", v7, 2u);
    }

    int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_blockListMonitoringObserver];

    id blockListMonitoringObserver = self->_blockListMonitoringObserver;
    self->_id blockListMonitoringObserver = 0;

    [(GCDTimer *)self->_blockListCoalescingTimer invalidate];
    blockListCoalescingTimer = self->_blockListCoalescingTimer;
    self->_blockListCoalescingTimer = 0;
  }
}

- (void)_systemBlockListDidUpdate
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MSPSharedTripService__systemBlockListDidUpdate__block_invoke;
  block[3] = &unk_1E617C770;
  void block[4] = self;
  dispatch_async(isolationQueue, block);
}

uint64_t __49__MSPSharedTripService__systemBlockListDidUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleCoalescedBlockListCheckIfNeeded];
}

- (void)_scheduleCoalescedBlockListCheckIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_blockListCoalescingTimer)
  {
    uint64_t v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = 0x3FF0000000000000;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Service] System block list did update, scheduling coalescing check in %#.1lfs", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    isolationQueue = self->_isolationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__MSPSharedTripService__scheduleCoalescedBlockListCheckIfNeeded__block_invoke;
    v7[3] = &unk_1E617C748;
    objc_copyWeak(&v8, (id *)buf);
    uint64_t v5 = +[GCDTimer scheduledTimerWithTimeInterval:isolationQueue queue:v7 block:1.0];
    blockListCoalescingTimer = self->_blockListCoalescingTimer;
    self->_blockListCoalescingTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __64__MSPSharedTripService__scheduleCoalescedBlockListCheckIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkBlockList];
}

- (void)_checkBlockList
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  blockListCoalescingTimer = self->_blockListCoalescingTimer;
  self->_blockListCoalescingTimer = 0;

  int v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[Service] Instructing capability fetcher to check existing blocked statuses", buf, 2u);
  }

  uint64_t v5 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
  [v5 verifyBlockedStatuses];

  uint64_t v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[Service] Checking blocklist to see if we need to stop any sharing...", buf, 2u);
  }

  uint64_t v21 = self;
  uint64_t v7 = [(MSPSharedTripService *)self _receivers];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v14 isHandleBlocked])
        {
          id v15 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = [v14 handleForIDS];
            *(_DWORD *)buf = 138477827;
            uint64_t v27 = (uint64_t)v16;
            _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_DEFAULT, "[Service] Found %{private}@ is now blocked", buf, 0xCu);
          }
          id v17 = [v14 handleForIDS];
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }

  if (v8)
  {
    uint64_t v18 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v19;
      _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_DEFAULT, "[Service] Found %lu handles are now blocked, will stop sharing", buf, 0xCu);
    }

    id v20 = [v8 allObjects];
    [(MSPSharedTripService *)v21 _stopSharingTripWithContacts:v20 reason:0 completion:&__block_literal_global_110];
  }
}

- (void)blockSharedTripWithIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(MEMORY[0x1E4F64A38], "_msp_blockTestTripWithIdentifier:", v4))
  {
    isolationQueue = self->_isolationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __54__MSPSharedTripService_blockSharedTripWithIdentifier___block_invoke;
    v6[3] = &unk_1E617C510;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(isolationQueue, v6);
  }
  else
  {
    [(MSPSharedTripService *)self blockSharedTrip:v4];
  }
}

void __54__MSPSharedTripService_blockSharedTripWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F64A38], "_msp_testTripForIdentifier:", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 sharedTripDidBecomeUnavailable:v2];
}

- (id)_subscriptionTokensForTripID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_subscriptionTokensByTripID objectForKeyedSubscript:v6];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !v4;
    }
    if (!v8)
    {
      id v9 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEBUG, "[Service] Initialising subscription tokens for trip %@", (uint8_t *)&v11, 0xCu);
      }

      id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      [(NSMutableDictionary *)self->_subscriptionTokensByTripID setObject:v7 forKeyedSubscript:v6];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_addSubscriptionTokenForTripID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [MSPSharedTripSubscriptionToken alloc];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __55__MSPSharedTripService__addSubscriptionTokenForTripID___block_invoke;
    id v14 = &unk_1E617ED78;
    objc_copyWeak(&v15, &location);
    id v6 = [(MSPSharedTripSubscriptionToken *)v5 initWithSharedTripIdentifier:v4 invalidationHandler:&v11];
    id v7 = -[MSPSharedTripService _subscriptionTokensForTripID:createIfNeeded:](self, "_subscriptionTokensForTripID:createIfNeeded:", v4, 1, v11, v12, v13, v14);
    [v7 addObject:v6];
    BOOL v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v7 count];
      *(_DWORD *)buf = 138412546;
      id v18 = v4;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "[Service] Add subscription token for trip %@ (%lu subscriptions)", buf, 0x16u);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __55__MSPSharedTripService__addSubscriptionTokenForTripID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[Service] Token invalidated, will purge", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _subscriptionTokenDidInvalidate:v6 forTripID:v5];
}

- (void)purgeToken:(id)a3 forTripID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MSPSharedTripService_purgeToken_forTripID___block_invoke;
  block[3] = &unk_1E617C940;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(isolationQueue, block);
}

uint64_t __45__MSPSharedTripService_purgeToken_forTripID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeToken:*(void *)(a1 + 40) forTripID:*(void *)(a1 + 48)];
}

- (void)_subscriptionTokenDidInvalidate:(id)a3 forTripID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  isolationQueue = self->_isolationQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v17 = __66__MSPSharedTripService__subscriptionTokenDidInvalidate_forTripID___block_invoke;
  id v18 = &unk_1E617C940;
  __int16 v19 = self;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  uint64_t v11 = isolationQueue;
  id v12 = v16;
  label = dispatch_queue_get_label(v11);
  id v14 = dispatch_queue_get_label(0);
  if (label == v14 || label && v14 && !strcmp(label, v14))
  {
    id v15 = (void *)MEMORY[0x1BA9C28D0]();
    v17((uint64_t)v12);
  }
  else
  {
    dispatch_sync(v11, v12);
  }
}

uint64_t __66__MSPSharedTripService__subscriptionTokenDidInvalidate_forTripID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeToken:*(void *)(a1 + 40) forTripID:*(void *)(a1 + 48)];
}

- (void)_purgeToken:(id)a3 forTripID:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  BOOL v8 = [(MSPSharedTripService *)self _subscriptionTokensForTripID:v7 createIfNeeded:0];
  if (v8)
  {
    id v9 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_INFO, "[Service] Purging %@ for trip %@", buf, 0x16u);
    }

    [v8 removeObject:v6];
    if (![v8 count])
    {
      id v10 = [(MSPSharedTripService *)self _remoteObjectProxy];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __46__MSPSharedTripService__purgeToken_forTripID___block_invoke;
      v11[3] = &unk_1E617E638;
      id v12 = v7;
      [v10 unsubscribeFromSharedTripUpdatesWithIdentifier:v12 completion:v11];
    }
  }
}

void __46__MSPSharedTripService__purgeToken_forTripID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MSPGetSharedTripLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      id v7 = "[Service] Failed to unsubscribe from trip %@: %@";
      BOOL v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1B87E5000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v11;
    id v7 = "[Service] Unsubscribed from trip %@";
    BOOL v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

- (void)removeReceivingObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136380931;
    id v7 = "-[MSPSharedTripService removeReceivingObserver:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_receivingObservers unregisterObserver:v4];
}

- (void)removeSendingObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136380931;
    id v7 = "-[MSPSharedTripService removeSendingObserver:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_sendingObservers unregisterObserver:v4];
}

- (void)_validateCurrentConfigurationWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v18 = 0;
  BOOL v5 = [(MSPSharedTripService *)self _serviceCanAttemptConnection:&v18];
  id v6 = v18;
  id v7 = v6;
  if (v6) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v5;
  }
  if (!v8)
  {
    if (v6)
    {
      id v9 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [v7 code];
        *(_DWORD *)id location = 134218242;
        *(void *)&location[4] = v10;
        __int16 v20 = 2112;
        id v21 = v7;
        uint64_t v11 = "[Service] Validated configuration with error code: %ld, %@";
        int v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        uint32_t v14 = 22;
LABEL_12:
        _os_log_impl(&dword_1B87E5000, v12, v13, v11, location, v14);
      }
LABEL_13:

      v4[2](v4, v7);
      goto LABEL_14;
    }
LABEL_10:
    id v9 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id location = 0;
      uint64_t v11 = "[Service] Validated configuration with no error";
      int v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 2;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (self->_sharingIdentity) {
    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __68__MSPSharedTripService__validateCurrentConfigurationWithCompletion___block_invoke;
  v15[3] = &unk_1E617EBC0;
  objc_copyWeak(&v17, (id *)location);
  uint64_t v16 = v4;
  [(MSPSharedTripService *)self _performBlockWhenCheckinCompleted:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)location);
LABEL_14:
}

void __68__MSPSharedTripService__validateCurrentConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEBUG, "[Service] Notified identity should have synced, retrying validation", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _validateCurrentConfigurationWithCompletion:*(void *)(a1 + 32)];
}

- (BOOL)_serviceCanAttemptConnection:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if ([(MSPSharedTripService *)self _isMapsInstalled])
  {
    if (GEOConfigGetBOOL())
    {
      if (GEOConfigGetBOOL())
      {
        sharingIdentity = self->_sharingIdentity;
        if (sharingIdentity && ![(MSPSharedTripSharingIdentity *)sharingIdentity hasValidAccount])
        {
          uint64_t v11 = *MEMORY[0x1E4F28228];
          v12[0] = @"Invalid account for sharing";
          id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
          id v7 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v8 = 5;
        }
        else
        {
          if (!self->_connectionError)
          {
            id v9 = 0;
            if (!a3) {
              goto LABEL_14;
            }
            goto LABEL_13;
          }
          uint64_t v11 = *MEMORY[0x1E4F28228];
          v12[0] = @"Failed to connect to trip sharing process";
          id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
          id v7 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v8 = 1;
        }
      }
      else
      {
        uint64_t v11 = *MEMORY[0x1E4F28228];
        v12[0] = @"Feature disabled remotely";
        id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = 3;
      }
    }
    else
    {
      uint64_t v11 = *MEMORY[0x1E4F28228];
      v12[0] = @"Feature disabled by user";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = 4;
    }
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F28228];
    v12[0] = @"Maps is not installed";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = 2;
  }
  id v9 = [v7 errorWithDomain:@"com.apple.Maps.SharedTrip" code:v8 userInfo:v6];

  if (a3) {
LABEL_13:
  }
    *a3 = v9;
LABEL_14:

  return v9 == 0;
}

- (BOOL)_isMapsInstalled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!self->_confirmedMapsIsInstalled)
  {
    id v4 = [MEMORY[0x1E4F4F7F8] processHandle];
    BOOL v5 = [v4 bundleIdentifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F64320]];

    if (!v6)
    {
      if ([v4 hasEntitlement:@"com.apple.private.coreservices.canmaplsdatabase"])
      {
        objc_initWeak(location, self);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __40__MSPSharedTripService__isMapsInstalled__block_invoke;
        v14[3] = &unk_1E617C9A8;
        objc_copyWeak(&v15, location);
        id v7 = +[MSPMapsPaths mapsApplicationContainerPathsWithInvalidationHandler:v14];
        mapsPaths = self->_mapsPaths;
        self->_mapsPaths = v7;

        id v9 = self->_mapsPaths;
        BOOL v3 = v9 != 0;
        if (v9)
        {
          self->_confirmedMapsIsInstalled = 1;
        }
        else
        {
          uint64_t v11 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)os_log_type_t v13 = 0;
            _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "[Service] Maps app is not available", v13, 2u);
          }
        }
        objc_destroyWeak(&v15);
        objc_destroyWeak(location);
        goto LABEL_15;
      }
      uint64_t v10 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEBUG, "[Service] Assuming Maps is installed, not entitled to check", (uint8_t *)location, 2u);
      }
    }
    BOOL v3 = 1;
    self->_confirmedMapsIsInstalled = 1;
LABEL_15:

    return v3;
  }
  return 1;
}

void __40__MSPSharedTripService__isMapsInstalled__block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MSPSharedTripService__isMapsInstalled__block_invoke_2;
    block[3] = &unk_1E617C770;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __40__MSPSharedTripService__isMapsInstalled__block_invoke_2(uint64_t a1)
{
  id v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_ERROR, "[Service] Maps paths invalidated, clearing cached installation state", v5, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 152) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = 0;
}

- (id)archivedSharingState
{
  if ([(MSPSharedTripService *)self _supportsArchivingSharingState])
  {
    uint64_t v3 = MSPGetSharedTripLog();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_archivedSharingState", (const char *)&unk_1B8876199, buf, 2u);
    }

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
    *(void *)buf = 0;
    id v9 = buf;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__9;
    int v12 = __Block_byref_object_dispose__9;
    id v13 = 0;
    isolationQueue = self->_isolationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__MSPSharedTripService_archivedSharingState__block_invoke;
    v7[3] = &unk_1E617EDA0;
    void v7[4] = self;
    void v7[5] = buf;
    dispatch_sync(isolationQueue, v7);
    id v5 = *((id *)v9 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __44__MSPSharedTripService_archivedSharingState__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 88))
  {
    uint64_t v3 = [*(id *)(v1 + 72) archivedSharingStorage];
    [v3 setGroupIdentifier:*(void *)(*(void *)(a1 + 32) + 88)];
    id v4 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "[Service] Fetching archived sharing state: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = [v3 data];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "[Service] No shared trip group identifier, will not create archived sharing state", (uint8_t *)&v8, 2u);
    }
  }
}

- (id)contactsFromArchivedTripSharingState:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[MSPSharingRestorationStorage alloc] initWithData:v3];
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      uint64_t v6 = [(MSPSharingRestorationStorage *)v4 mapsIdentifiers];
      [v5 addObjectsFromArray:v6];

      id v7 = [(MSPSharingRestorationStorage *)v4 messagesIdentifiers];
      [v5 addObjectsFromArray:v7];

      int v8 = [v5 array];
      id v9 = +[MSPSharedTripContact contactsFromIDSHandles:v8];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (BOOL)_supportsArchivingSharingState
{
  if (qword_1EB7F46B8 != -1) {
    dispatch_once(&qword_1EB7F46B8, &__block_literal_global_125);
  }
  return byte_1EB7F4692;
}

void __54__MSPSharedTripService__supportsArchivingSharingState__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];

  byte_1EB7F4692 = [v1 isEqual:*MEMORY[0x1E4F64320]];
  id v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = "YES";
    if (!byte_1EB7F4692) {
      id v3 = "NO";
    }
    int v4 = 138543618;
    id v5 = v1;
    __int16 v6 = 2080;
    id v7 = v3;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEFAULT, "[Service] %{public}@ supports archiving sharing state: %s", (uint8_t *)&v4, 0x16u);
  }
}

- (void)checkinWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MSPSharedTripService_checkinWithCompletion___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__MSPSharedTripService_checkinWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _checkinWithCompletion:*(void *)(a1 + 32)];
}

- (void)fetchSharingIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSPSharedTripService_fetchSharingIdentityWithCompletion___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__MSPSharedTripService_fetchSharingIdentityWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchSharingIdentityWithCompletion:*(void *)(a1 + 32)];
}

- (void)_fetchSharingIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_fetchSharingIdentityWithCompletion", (const char *)&unk_1B8876199, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v6 = [(MSPSharedTripService *)self _remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MSPSharedTripService__fetchSharingIdentityWithCompletion___block_invoke;
  v8[3] = &unk_1E617EDC8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchSharingIdentityWithCompletion:v8];
}

void __60__MSPSharedTripService__fetchSharingIdentityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), a2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MSPSharedTripService__fetchSharingIdentityWithCompletion___block_invoke_2;
  v7[3] = &unk_1E617D7A0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __60__MSPSharedTripService__fetchSharingIdentityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MSPSharedTripService_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __85__MSPSharedTripService_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:*(void *)(a1 + 32)];
}

- (void)_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion", (const char *)&unk_1B8876199, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v6 = [(MSPSharedTripService *)self _remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__MSPSharedTripService__fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke;
  v8[3] = &unk_1E617EE18;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:v8];
}

void __86__MSPSharedTripService__fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __86__MSPSharedTripService__fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke_2;
  v12[3] = &unk_1E617EDF0;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  char v16 = a2;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __86__MSPSharedTripService__fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__MSPSharedTripService_reportUserConfirmationOfSharingIdentity_completion___block_invoke;
  v11[3] = &unk_1E617EC60;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__MSPSharedTripService_reportUserConfirmationOfSharingIdentity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _reportUserConfirmationOfSharingIdentity:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_reportUserConfirmationOfSharingIdentity", (const char *)&unk_1B8876199, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v9 = [(MSPSharedTripService *)self _remoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__MSPSharedTripService__reportUserConfirmationOfSharingIdentity_completion___block_invoke;
  v11[3] = &unk_1E617DA20;
  id v12 = v6;
  id v10 = v6;
  [v9 reportUserConfirmationOfSharingIdentity:v7 completion:v11];
}

void __76__MSPSharedTripService__reportUserConfirmationOfSharingIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __76__MSPSharedTripService__reportUserConfirmationOfSharingIdentity_completion___block_invoke_2;
  v6[3] = &unk_1E617D7A0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __76__MSPSharedTripService__reportUserConfirmationOfSharingIdentity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __91__MSPSharedTripService_startSharingTripWithContacts_capabilityType_serviceName_completion___block_invoke;
  v17[3] = &unk_1E617DA98;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a4;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(isolationQueue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __91__MSPSharedTripService_startSharingTripWithContacts_capabilityType_serviceName_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _startSharingTripWithContacts:*(void *)(a1 + 32) capabilityType:*(void *)(a1 + 64) serviceName:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5 completion:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v13))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_startSharingTripWithContacts:capabilityType:", (const char *)&unk_1B8876199, (uint8_t *)&v17, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v14 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 > 4) {
      id v15 = @"Unknown";
    }
    else {
      id v15 = off_1E617EED8[a4];
    }
    int v17 = 138412546;
    id v18 = v10;
    __int16 v19 = 2114;
    id v20 = v15;
    _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEFAULT, "[Service] Start sharing trip with contacts: %@ via %{public}@", (uint8_t *)&v17, 0x16u);
  }

  id v16 = [(MSPSharedTripService *)self _remoteObjectProxy];
  [v16 startSharingTripWithContacts:v10 capabilityType:a4 serviceName:v12 completion:v11];
}

- (void)startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__MSPSharedTripService_startSharingTripWithMessagesGroup_completion___block_invoke;
  v11[3] = &unk_1E617EC60;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __69__MSPSharedTripService_startSharingTripWithMessagesGroup_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _startSharingTripWithMessagesGroup:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_startSharingTripWithMessagesGroup", (const char *)&unk_1B8876199, (uint8_t *)&v11, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v9 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEFAULT, "[Service] Start sharing trip with group: %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(MSPSharedTripService *)self _remoteObjectProxy];
  [v10 startSharingTripWithMessagesGroup:v6 completion:v7];
}

- (void)stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MSPSharedTripService_stopSharingTripWithContacts_reason_completion___block_invoke;
  block[3] = &unk_1E617DAC0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __70__MSPSharedTripService_stopSharingTripWithContacts_reason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _stopSharingTripWithContacts:*(void *)(a1 + 32) reason:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)_stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_stopSharingTripWithContacts", (const char *)&unk_1B8876199, (uint8_t *)&v13, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v11 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[Service] Stop sharing trip with Maps/Messages contacts: %@", (uint8_t *)&v13, 0xCu);
  }

  id v12 = [(MSPSharedTripService *)self _remoteObjectProxy];
  [v12 stopSharingTripWithContacts:v8 reason:a4 completion:v9];
}

- (void)stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MSPSharedTripService_stopSharingTripWithMessagesGroup_reason_completion___block_invoke;
  block[3] = &unk_1E617DAC0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __75__MSPSharedTripService_stopSharingTripWithMessagesGroup_reason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _stopSharingTripWithMessagesGroup:*(void *)(a1 + 32) reason:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)_stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_stopSharingTripWithMessagesGroup", (const char *)&unk_1B8876199, (uint8_t *)&v13, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v11 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[Service] Stop sharing trip with group: %@", (uint8_t *)&v13, 0xCu);
  }

  id v12 = [(MSPSharedTripService *)self _remoteObjectProxy];
  [v12 stopSharingTripWithMessagesGroup:v8 reason:a4 completion:v9];
}

- (void)stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __61__MSPSharedTripService_stopSharingTripWithReason_completion___block_invoke;
  v9[3] = &unk_1E617C478;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(isolationQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __61__MSPSharedTripService_stopSharingTripWithReason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _stopSharingTripWithReason:*(void *)(a1 + 48) completion:*(void *)(a1 + 32)];
}

- (void)_stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_stopSharingTrip", (const char *)&unk_1B8876199, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v8 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[Service] Stop sharing trip", v10, 2u);
  }

  id v9 = [(MSPSharedTripService *)self _remoteObjectProxy];
  [v9 stopSharingTripWithReason:a3 completion:v6];
}

- (void)fetchActiveHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MSPSharedTripService_fetchActiveHandlesWithCompletion___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__MSPSharedTripService_fetchActiveHandlesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchActiveHandlesWithCompletion:*(void *)(a1 + 32)];
}

- (void)_fetchActiveHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_fetchActiveHandlesWithCompletion:", (const char *)&unk_1B8876199, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[Service] Fetch active handles", buf, 2u);
  }

  id v7 = [(MSPSharedTripService *)self _remoteObjectProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __58__MSPSharedTripService__fetchActiveHandlesWithCompletion___block_invoke;
  v9[3] = &unk_1E617EE40;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 fetchActiveHandlesWithCompletion:v9];
}

void __58__MSPSharedTripService__fetchActiveHandlesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v16 = v5;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "[Service] Fetched active handles: %{private}@", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 72) updateActiveSharingHandles:v5 serviceNames:v6];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MSPSharedTripService__fetchActiveHandlesWithCompletion___block_invoke_128;
  block[3] = &unk_1E617EBE8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__MSPSharedTripService__fetchActiveHandlesWithCompletion___block_invoke_128(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchSharedTripsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MSPSharedTripService_fetchSharedTripsWithCompletion___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__MSPSharedTripService_fetchSharedTripsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchSharedTripsWithCompletion:*(void *)(a1 + 32)];
}

- (void)_fetchSharedTripsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[Service] Fetch shared trips", buf, 2u);
  }

  id v6 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_fetchSharedTripsOnQueue", (const char *)&unk_1B8876199, buf, 2u);
  }

  id v7 = [(MSPSharedTripService *)self _remoteObjectProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __56__MSPSharedTripService__fetchSharedTripsWithCompletion___block_invoke;
  v9[3] = &unk_1E617EE68;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 fetchSharedTripsWithCompletion:v9];
}

void __56__MSPSharedTripService__fetchSharedTripsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t v3 = [a2 mutableCopy];
  }
  else {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  }
  id v4 = (void *)v3;
  [*(id *)(a1 + 32) _addTestTripsTo:v3];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v4);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MSPSharedTripService__fetchSharedTripsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E617D7A0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __56__MSPSharedTripService__fetchSharedTripsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __78__MSPSharedTripService_subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E617EC60;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __78__MSPSharedTripService_subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _subscribeToSharedTripUpdatesWithIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v8 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[Service] Request to subscribe to trip: %@", (uint8_t *)&buf, 0xCu);
  }

  id v9 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_subscribeToSharedTripUpdatesWithIdentifier", (const char *)&unk_1B8876199, (uint8_t *)&buf, 2u);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__9;
  long long v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke;
  v18[3] = &unk_1E617EE90;
  id v10 = v7;
  id v19 = v10;
  p_long long buf = &buf;
  id v11 = (void *)MEMORY[0x1BA9C2AF0](v18);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E617EEB8;
  id v12 = v11;
  id v16 = v12;
  void v14[4] = self;
  id v13 = v6;
  id v15 = v13;
  uint64_t v17 = &buf;
  [(MSPSharedTripService *)self _validateCurrentConfigurationWithCompletion:v14];

  _Block_object_dispose(&buf, 8);
}

void __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E617D9F8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

void __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _subscriptionTokensForTripID:*(void *)(a1 + 40) createIfNeeded:0];
    uint64_t v5 = [v4 count];
    id v6 = MSPGetSharedTripLog();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [v4 count];
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 134218242;
        uint64_t v22 = v8;
        __int16 v23 = 2112;
        uint64_t v24 = v9;
        _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[Service] Skipping remote subscribe, already %lu subscription tokens for trip: %@", buf, 0x16u);
      }

      uint64_t v10 = [*(id *)(a1 + 32) _addSubscriptionTokenForTripID:*(void *)(a1 + 40)];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v22 = v13;
        _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "[Service] Subscribe to trip: %@", buf, 0xCu);
      }

      id v14 = [*(id *)(a1 + 32) _remoteObjectProxyWithErrorHandler:*(void *)(a1 + 48)];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      id v17[2] = __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_131;
      v17[3] = &unk_1E617EEB8;
      uint64_t v16 = *(void *)(a1 + 32);
      id v15 = *(void **)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 56);
      void v17[4] = v16;
      id v18 = v15;
      id v19 = *(id *)(a1 + 48);
      [v14 subscribeToSharedTripUpdatesWithIdentifier:v18 completion:v17];
    }
  }
}

void __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_131(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_ERROR, "[Service] Failed to subscribe to trip %@: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) _addSubscriptionTokenForTripID:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)unsubscribeFromSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)blockSharedTrip:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MSPSharedTripService_blockSharedTrip___block_invoke;
  block[3] = &unk_1E617C560;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__MSPSharedTripService_blockSharedTrip___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _blockSharedTrip:*(void *)(a1 + 32)];
}

- (void)clearBlockedTripIdentifiers
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__MSPSharedTripService_clearBlockedTripIdentifiers__block_invoke;
  v4[3] = &unk_1E617C9A8;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__MSPSharedTripService_clearBlockedTripIdentifiers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearBlockedTripIdentifiers];
}

- (void)_clearBlockedTripIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Clear blocked trip identifiers", buf, 2u);
  }

  id v4 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_clearBlockedTripIdentifiers", (const char *)&unk_1B8876199, v6, 2u);
  }

  id v5 = [(MSPSharedTripService *)self _remoteObjectProxy];
  [v5 clearBlockedTripIdentifiers];
}

- (void)purgeExpiredBlockedTripIdentifiers
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__MSPSharedTripService_purgeExpiredBlockedTripIdentifiers__block_invoke;
  v4[3] = &unk_1E617C9A8;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__MSPSharedTripService_purgeExpiredBlockedTripIdentifiers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _purgeExpiredBlockedTripIdentifiers];
}

- (void)_purgeExpiredBlockedTripIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Purge expired blocked trip identifiers", buf, 2u);
  }

  id v4 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_purgeExpiredBlockedTripIdentifiers", (const char *)&unk_1B8876199, v6, 2u);
  }

  id v5 = [(MSPSharedTripService *)self _remoteObjectProxy];
  [v5 purgeExpiredBlockedTripIdentifiers];
}

- (void)sharedTripDidBecomeAvailable:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136380675;
    id v9 = "-[MSPSharedTripService sharedTripDidBecomeAvailable:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(MSPSharedTripService *)self _insertOrUpdateTrip:v5];

  [(GEOObserverHashTable *)self->_receivingObservers sharedTripService:self didReceiveSharedTrip:v7];
}

- (void)destinationDidUpdateForSharedTrip:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136380675;
    id v9 = "-[MSPSharedTripService destinationDidUpdateForSharedTrip:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(MSPSharedTripService *)self _insertOrUpdateTrip:v5];

  [(GEOObserverHashTable *)self->_receivingObservers sharedTripService:self didUpdateDestinationForSharedTrip:v7];
}

- (void)destinationReachedDidUpdateForSharedTrip:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136380675;
    id v9 = "-[MSPSharedTripService destinationReachedDidUpdateForSharedTrip:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(MSPSharedTripService *)self _insertOrUpdateTrip:v5];

  [(GEOObserverHashTable *)self->_receivingObservers sharedTripService:self didUpdateReachedDestinationForSharedTrip:v7];
}

- (void)etaDidUpdateForSharedTrip:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136380675;
    id v9 = "-[MSPSharedTripService etaDidUpdateForSharedTrip:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(MSPSharedTripService *)self _insertOrUpdateTrip:v5];

  [(GEOObserverHashTable *)self->_receivingObservers sharedTripService:self didUpdateETAForSharedTrip:v7];
}

- (void)routeDidUpdateForSharedTrip:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136380675;
    id v9 = "-[MSPSharedTripService routeDidUpdateForSharedTrip:]";
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(MSPSharedTripService *)self _insertOrUpdateTrip:v5];

  [(GEOObserverHashTable *)self->_receivingObservers sharedTripService:self didUpdateRouteForSharedTrip:v7];
}

- (void)sharedTripDidBecomeUnavailable:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136380675;
    __int16 v11 = "-[MSPSharedTripService sharedTripDidBecomeUnavailable:]";
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v10, 0xCu);
  }

  if (!v4)
  {
    id v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "[Service] Notified trip became unavailable but passed nil", (uint8_t *)&v10, 2u);
    }
  }
  receivedTrips = self->_receivedTrips;
  int v8 = [v4 equalityTest];
  uint64_t v9 = [(NSMutableArray *)receivedTrips indexOfObjectPassingTest:v8];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_receivedTrips removeObjectAtIndex:v9];
    [(GEOObserverHashTable *)self->_receivingObservers sharedTripService:self didRemoveSharedTrip:v4];
  }
}

- (void)sharedTripDidClose:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136380675;
    uint64_t v9 = "-[MSPSharedTripService sharedTripDidClose:]";
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  if (!v4)
  {
    id v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "[Service] Notified trip closed but passed nil", (uint8_t *)&v8, 2u);
    }
  }
  uint64_t v7 = [(MSPSharedTripService *)self _insertOrUpdateTrip:v4];

  [(GEOObserverHashTable *)self->_receivingObservers sharedTripService:self didUpdateClosedTrip:v7];
}

- (id)_insertOrUpdateTrip:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = MSPGetSharedTripLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_insertOrUpdateTrip", (const char *)&unk_1B8876199, buf, 2u);
  }

  receivedTrips = self->_receivedTrips;
  uint64_t v7 = [v4 equalityTest];
  uint64_t v8 = [(NSMutableArray *)receivedTrips indexOfObjectPassingTest:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4) {
      [(NSMutableArray *)self->_receivedTrips insertObject:v4 atIndex:0];
    }
    id v9 = v4;
  }
  else
  {
    id v9 = [(NSMutableArray *)self->_receivedTrips objectAtIndex:v8];
    [v9 merge:v4];
    if ([v9 hasClosed] && (objc_msgSend(v9, "closed") & 1) != 0
      || [v9 hasArrived] && objc_msgSend(v9, "arrived"))
    {
      if ([v9 hasEtaInfo])
      {
        uint64_t v10 = [v9 finalETAInfo];
        int v11 = [v10 hasEtaTimestamp];

        if (v11)
        {
          uint64_t v12 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v14 = 0;
            _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_INFO, "Re-stripping eta and route info from closed/arrived trip", v14, 2u);
          }

          [v9 stripArrivedOrClosedTrip];
        }
      }
    }
  }

  return v9;
}

- (void)sharedTripDidStartSharingWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136380675;
    id v9 = "-[MSPSharedTripService sharedTripDidStartSharingWithIdentifier:]";
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = (NSString *)[v4 copy];
  sharingGroupIdentifier = self->_sharingGroupIdentifier;
  self->_sharingGroupIdentifier = v6;

  [(MSPSharedTripService *)self _startMonitoringSystemBlockListIfNeeded];
}

- (void)sharedTripDidUpdateRecipients:(id)a3 withServices:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315395;
    uint64_t v10 = "-[MSPSharedTripService sharedTripDidUpdateRecipients:withServices:]";
    __int16 v11 = 2113;
    id v12 = v6;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "[Service] %s: %{private}@", (uint8_t *)&v9, 0x16u);
  }

  [(MSPSharedTripContactController *)self->_sharingContactController updateActiveSharingHandles:v6 serviceNames:v7];
}

- (void)sharedTripInvalidatedWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136380675;
    int v8 = "-[MSPSharedTripService sharedTripInvalidatedWithError:]";
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v7, 0xCu);
  }

  [(MSPSharedTripService *)self _stopMonitoringSystemBlockList];
  sharingGroupIdentifier = self->_sharingGroupIdentifier;
  self->_sharingGroupIdentifier = 0;

  [(MSPSharedTripContactController *)self->_sharingContactController reset];
  [(GEOObserverHashTable *)self->_sendingObservers sharedTripService:self sharingDidInvalidateWithError:v4];
}

- (void)sharingIdentityDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (MSPSharedTripSharingIdentity *)a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136380675;
    uint64_t v9 = "-[MSPSharedTripService sharingIdentityDidChange:]";
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  sharingIdentity = self->_sharingIdentity;
  self->_sharingIdentity = v4;
  int v7 = v4;

  [(GEOObserverHashTable *)self->_sendingObservers sharedTripService:self didUpdateSharingIdentity:v7];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  [(MSPSharedTripService *)self _openConnectionIfNeeded];
  id v6 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  int v7 = [v6 remoteObjectProxyWithErrorHandler:v5];

  return v7;
}

void __47__MSPSharedTripService__openConnectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = WeakRetained;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_ERROR, "[Service] Connection invalidated: %@", (uint8_t *)&v9, 0xCu);
  }

  id v4 = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) = 1;
    if (v4[15])
    {
      id v6 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Service] Leaving checkin group, connection invalidated", (uint8_t *)&v9, 2u);
      }

      dispatch_group_leave(v5[15]);
      dispatch_group_t v7 = v5[15];
      v5[15] = 0;
    }
    dispatch_group_t v8 = v5[1];
    v5[1] = 0;
  }
}

void __47__MSPSharedTripService__openConnectionIfNeeded__block_invoke_191(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v21 = 138412290;
    dispatch_group_t v22 = WeakRetained;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_ERROR, "[Service] Connection interrupted: %@", (uint8_t *)&v21, 0xCu);
  }

  id v4 = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) = 1;
    if (v4[15])
    {
      id v6 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "[Service] Leaving checkin group, connection interrupted", (uint8_t *)&v21, 2u);
      }

      dispatch_group_leave(v5[15]);
      dispatch_group_t v7 = v5[15];
      v5[15] = 0;
    }
    dispatch_group_t v8 = v5[5];
    unint64_t v9 = (unint64_t)&v5[4]->isa + 1;
    void v5[4] = (dispatch_group_t)v9;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 < 5)
    {
      if (v10)
      {
        [v10 timeIntervalSinceNow];
        if (v16 <= 0.0)
        {
          dispatch_group_t v17 = v5[5];
          v5[5] = 0;

          void v5[4] = 0;
          id v18 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v21) = 0;
            _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_DEFAULT, "[Service] BackoffUntilDate has passed, resetting connection retries", (uint8_t *)&v21, 2u);
          }
        }
      }
      id v19 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_group_t v20 = v5[4];
        int v21 = 134218240;
        dispatch_group_t v22 = v20;
        __int16 v23 = 2048;
        uint64_t v24 = 5;
        _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_DEFAULT, "[Service] Attempting to resume connection (%lu/%lu)", (uint8_t *)&v21, 0x16u);
      }

      [(dispatch_group_t *)v5 _checkin];
    }
    else
    {
      if (!v10)
      {
        uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
        dispatch_group_t v13 = v5[5];
        v5[5] = (dispatch_group_t)v12;
      }
      id v14 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_group_t v15 = v5[5];
        int v21 = 138412290;
        dispatch_group_t v22 = v15;
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEFAULT, "[Service] Will not attempt to resume connection, backing off until %@", (uint8_t *)&v21, 0xCu);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockListCoalescingTimer, 0);
  objc_storeStrong(&self->_blockListMonitoringObserver, 0);
  objc_storeStrong((id *)&self->_mapsPaths, 0);
  objc_storeStrong(&self->_serverDisabledDefaultListener, 0);
  objc_storeStrong(&self->_userDisabledDefaultListener, 0);
  objc_storeStrong((id *)&self->_checkinDispatchGroup, 0);
  objc_storeStrong((id *)&self->_sharingIdentity, 0);
  objc_storeStrong((id *)&self->_sharingGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriptionTokensByTripID, 0);
  objc_storeStrong((id *)&self->_sharingContactController, 0);
  objc_storeStrong((id *)&self->_receivedTrips, 0);
  objc_storeStrong((id *)&self->_sendingObservers, 0);
  objc_storeStrong((id *)&self->_receivingObservers, 0);
  objc_storeStrong((id *)&self->_reconnectionBackoffUntilDate, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end