@interface DNDSRemoteServiceProvider
- (DNDSRemoteServiceProvider)initWithClientDetailsProvider:(id)a3;
- (DNDSRemoteServiceProviderDelegate)delegate;
- (id)_clientDetailsForClientIdentifier:(id)a3 clientConnection:(id)a4;
- (void)_addConnection:(id)a3;
- (void)_handleClientConnectionInterrupted:(id)a3;
- (void)_handleClientConnectionInvalidated:(id)a3;
- (void)_iterateClientConnectionsToSendWithHandler:(id)a3;
- (void)_queryStateWithCompletionHandler:(id)a3;
- (void)_registerOrMutateConnectionDetailsForClientConnection:(id)a3 handler:(id)a4;
- (void)_removeConnection:(id)a3;
- (void)_unregisterConnectionDetailsForClientConnection:(id)a3;
- (void)activateModeWithDetails:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)activeModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7;
- (void)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAccountFeatureSupportWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getActiveModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getAllModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getAllModesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getAllowedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAppActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAppConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7;
- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAppInfoForBundleIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAppInfoForBundleIdentifiers:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAvailableModesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getBehaviorSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getCloudSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getLatestModeAssertionInvalidationWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getModeConfigurationForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getModesCanImpactAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getPairSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getPreventAutoReplyWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getScheduleSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getSilencedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getStateDumpWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getSystemActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getUserAvailabilityInActiveModeForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)handleAppConfigurationContextUpdateForModeIdentifier:(id)a3;
- (void)handleMeDeviceStateUpdate:(id)a3;
- (void)handleModeAssertionUpdateResult:(id)a3;
- (void)handleStateUpdate:(id)a3;
- (void)handleUpdatedBehaviorSettings:(id)a3;
- (void)handleUpdatedModes:(id)a3 availableModes:(id)a4;
- (void)handleUpdatedPairSyncState:(unint64_t)a3;
- (void)handleUpdatedPhoneCallBypassSettings:(id)a3;
- (void)handleUpdatedPreventAutoReplySetting:(BOOL)a3;
- (void)handleUpdatedScheduleSettings:(id)a3;
- (void)invalidate;
- (void)invalidateActiveModeAssertionWithDetails:(id)a3 reasonOverride:(id)a4 requestDetails:(id)a5 completionHandler:(id)a6;
- (void)invalidateAllActiveModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)invalidateModeAssertionWithUUID:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)publishStatusKitAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)queryMeDeviceStateWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)queryStateForUpdateWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)queryStateWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForAssertionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForGlobalConfigurationUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForMeDeviceStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForModeSelectionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForSettingsUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)resolveBehaviorForEventDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5;
- (void)resume;
- (void)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7;
- (void)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8;
- (void)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8;
- (void)setBehaviorSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setCloudSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHearingTestIsActive:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setModeConfiguration:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setModesCanImpactAvailability:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setPairSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setPreventAutoReply:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setScheduleSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setScreenIsShared:(id)a3 screenIsMirrored:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)setSystemAction:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)syncModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)takeModeAssertionWithDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5;
@end

@implementation DNDSRemoteServiceProvider

- (void)registerForModeSelectionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = NSString;
  v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  v12 = (void *)os_transaction_create();

  v13 = [MEMORY[0x1E4F50BA0] currentContext];
  v14 = [v7 clientIdentifier];
  char v15 = objc_msgSend(v13, "dnds_hasModeConfigurationUpdatesEntitlementForClientIdentifier:", v14);

  v16 = [v7 clientIdentifier];
  int v17 = objc_msgSend(v13, "dnds_hasActiveModeUpdatesEntitlementForClientIdentifier:", v16);

  if ((v15 & 1) != 0 || v17)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __97__DNDSRemoteServiceProvider_registerForModeSelectionUpdatesWithRequestDetails_completionHandler___block_invoke;
    v22[3] = &unk_1E6975558;
    char v24 = v15;
    char v25 = v17;
    id v18 = v7;
    id v23 = v18;
    [(DNDSRemoteServiceProvider *)self _registerOrMutateConnectionDetailsForClientConnection:v13 handler:v22];
    if (v17)
    {
      v19 = [(DNDSRemoteServiceProvider *)self delegate];
      v20 = [v18 clientIdentifier];
      v21 = [v19 remoteServiceProvider:self activeAssertionWithClientIdentifer:v20 error:0];
    }
    else
    {
      v21 = 0;
    }
    (*((void (**)(id, void, void *, void))v8 + 2))(v8, MEMORY[0x1E4F1CC38], v21, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider registerForModeSelectionUpdatesWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v4];

  v5 = DNDRemoteServiceServerInterface();
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E6973990;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3;
  v6[3] = &unk_1E6973990;
  objc_copyWeak(&v7, (id *)a1);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v4];

  v5 = DNDRemoteMonitorServerInterface();
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_5;
  v8[3] = &unk_1E6973990;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_6;
  v6[3] = &unk_1E6973990;
  objc_copyWeak(&v7, (id *)a1);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

- (void)queryStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  v12 = (void *)os_transaction_create();

  v13 = [MEMORY[0x1E4F50BA0] currentContext];
  v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasStateRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    [(DNDSRemoteServiceProvider *)self _queryStateWithCompletionHandler:v8];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider queryStateWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)_queryStateWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(DNDSRemoteServiceProvider *)self delegate];
  id v8 = 0;
  v6 = [v5 remoteServiceProvider:self currentStateWithError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)registerForStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  v12 = (void *)os_transaction_create();

  v13 = [MEMORY[0x1E4F50BA0] currentContext];
  v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasStateUpdatesEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    [(DNDSRemoteServiceProvider *)self _registerOrMutateConnectionDetailsForClientConnection:v13 handler:&__block_literal_global_36];
    (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC38], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider registerForStateUpdatesWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)_registerOrMutateConnectionDetailsForClientConnection:(id)a3 handler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, DNDSClientConnectionDetails *))a4;
  id v8 = self->_clientConnectionDetailsByConnection;
  objc_sync_enter(v8);
  id v9 = [(NSMapTable *)self->_clientConnectionDetailsByConnection objectForKey:v6];
  if (!v9)
  {
    v10 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Registering new connection details for connection: connection=%{public}@", (uint8_t *)&v13, 0xCu);
    }
    id v9 = objc_alloc_init(DNDSClientConnectionDetails);
  }
  id v11 = v7[2](v7, v9);
  if (([(DNDSClientConnectionDetails *)v9 isEqual:v11] & 1) == 0)
  {
    v12 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = v6;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Updating connection details for connection: connection=%{public}@, updatedConnectionDetails=%{public}@", (uint8_t *)&v13, 0x16u);
    }
    [(NSMapTable *)self->_clientConnectionDetailsByConnection setObject:v11 forKey:v6];
  }

  objc_sync_exit(v8);
}

id __89__DNDSRemoteServiceProvider_registerForStateUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  [v2 setWantsStateUpdates:1];
  return v2;
}

id __97__DNDSRemoteServiceProvider_registerForModeSelectionUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  v4 = v3;
  if (*(unsigned char *)(a1 + 40)) {
    [v3 setWantsModeUpdates:1];
  }
  if (*(unsigned char *)(a1 + 41))
  {
    [v4 setWantsActiveModeUpdates:1];
    v5 = [v4 activeAssertionUpdateClientIdentifiers];
    id v6 = [*(id *)(a1 + 32) clientIdentifier];
    id v7 = [v5 setByAddingObject:v6];

    [v4 setActiveAssertionUpdateClientIdentifiers:v7];
  }
  id v8 = (void *)[v4 copy];

  return v8;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (BSServiceConnectionListener *)a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  if (self->_requestListener == v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke;
    v16[3] = &unk_1E69739B8;
    v16[4] = self;
    id v11 = &v17;
    objc_copyWeak(&v17, &location);
    [v9 configureConnection:v16];
  }
  else
  {
    if (self->_monitorListener != v8)
    {
      [v9 invalidate];
      goto LABEL_11;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_4;
    v14[3] = &unk_1E69739B8;
    v14[4] = self;
    id v11 = &v15;
    objc_copyWeak(&v15, &location);
    [v9 configureConnection:v14];
  }
  objc_destroyWeak(v11);
  if (objc_msgSend(v9, "dnds_hasAnyValidEntitlement"))
  {
    [(DNDSRemoteServiceProvider *)self _addConnection:v9];
    [v9 activate];
    v12 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v9;
      _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "XPC connection successfully accepted: connection=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    [v9 invalidate];
    int v13 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider listener:didReceiveConnection:withContext:]((uint64_t)v9, v13);
    }
  }
LABEL_11:
  objc_destroyWeak(&location);
}

- (void)_addConnection:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableSet *)self->_connections addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)getModeConfigurationForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  v12 = NSString;
  int v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  id v15 = (void *)os_transaction_create();

  v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v22 = 0;
    id v20 = [v19 remoteServiceProvider:self modeConfigurationForModeIdentifier:v9 withError:&v22];
    id v21 = v22;

    v11[2](v11, v20, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getModeConfigurationForModeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (DNDSRemoteServiceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSRemoteServiceProviderDelegate *)WeakRetained;
}

- (DNDSRemoteServiceProvider)initWithClientDetailsProvider:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DNDSRemoteServiceProvider;
  id v6 = [(DNDSRemoteServiceProvider *)&v31 init];
  id v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connections = v7->_connections;
    v7->_connections = v8;

    id v10 = (void *)MEMORY[0x1E4F50BC8];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __59__DNDSRemoteServiceProvider_initWithClientDetailsProvider___block_invoke;
    v29[3] = &unk_1E6973968;
    id v11 = v7;
    v30 = v11;
    uint64_t v12 = [v10 listenerWithConfigurator:v29];
    requestListener = v11->_requestListener;
    v11->_requestListener = (BSServiceConnectionListener *)v12;

    id v14 = (void *)MEMORY[0x1E4F50BC8];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __59__DNDSRemoteServiceProvider_initWithClientDetailsProvider___block_invoke_2;
    v27 = &unk_1E6973968;
    id v15 = v11;
    v28 = v15;
    uint64_t v16 = [v14 listenerWithConfigurator:&v24];
    monitorListener = v15->_monitorListener;
    v15->_monitorListener = (BSServiceConnectionListener *)v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28E10], "weakToStrongObjectsMapTable", v24, v25, v26, v27);
    clientConnectionDetailsByConnection = v15->_clientConnectionDetailsByConnection;
    v15->_clientConnectionDetailsByConnection = (NSMapTable *)v18;

    objc_storeStrong((id *)&v15->_clientDetailsProvider, a3);
    id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.donotdisturbd.remoteserviceprovider", v20);
    clientNotificationQueue = v15->_clientNotificationQueue;
    v15->_clientNotificationQueue = (OS_dispatch_queue *)v21;
  }
  return v7;
}

void __59__DNDSRemoteServiceProvider_initWithClientDetailsProvider___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDomain:@"com.apple.donotdisturb.service.launching"];
  id v3 = DNDRemoteServiceServerInterface();
  v4 = [v3 identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

void __59__DNDSRemoteServiceProvider_initWithClientDetailsProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDomain:@"com.apple.donotdisturb.service.non-launching"];
  id v3 = DNDRemoteMonitorServerInterface();
  v4 = [v3 identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(DNDSRemoteServiceProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DNDSRemoteServiceProvider;
  [(DNDSRemoteServiceProvider *)&v3 dealloc];
}

- (void)resume
{
  [(BSServiceConnectionListener *)self->_monitorListener activate];
  [(BSServiceConnectionListener *)self->_requestListener activate];
  id v3 = (id)[MEMORY[0x1E4F50BF0] activateManualDomain:@"com.apple.donotdisturb.service.launching"];
  id v4 = (id)[MEMORY[0x1E4F50BF0] activateManualDomain:@"com.apple.donotdisturb.service.non-launching"];
}

- (void)invalidate
{
  [(BSServiceConnectionListener *)self->_monitorListener invalidate];
  requestListener = self->_requestListener;
  [(BSServiceConnectionListener *)requestListener invalidate];
}

- (void)handleStateUpdate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Did receive state update, will handle; stateUpdate=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__DNDSRemoteServiceProvider_handleStateUpdate___block_invoke;
  v7[3] = &unk_1E6975430;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v7];
}

void __47__DNDSRemoteServiceProvider_handleStateUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v33 = a3;
  if ([v5 wantsStateUpdates])
  {
    id v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [v33 remoteProcess];
      int v9 = [v8 pid];
      id v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 67109634;
      int v42 = v9;
      __int16 v43 = 2114;
      v44 = v10;
      __int16 v45 = 2114;
      id v46 = v33;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Delivering state update: pid=%d, stateUpdate=%{public}@, connection=%{public}@", buf, 0x1Cu);
    }
    id v11 = [v33 remoteTarget];
    [v11 deliverStateUpdate:*(void *)(a1 + 32)];
  }
  if ([v5 wantsActiveModeUpdates])
  {
    uint64_t v12 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = v12;
      id v14 = [v33 remoteProcess];
      int v15 = [v14 pid];
      uint64_t v16 = [*(id *)(a1 + 32) state];
      id v17 = [v16 activeModeIdentifier];
      *(_DWORD *)buf = 67109634;
      int v42 = v15;
      __int16 v43 = 2114;
      v44 = v17;
      __int16 v45 = 2114;
      id v46 = v33;
      _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Delivering active mode update: pid=%d, activeModeIdentifier=%{public}@, connection=%{public}@", buf, 0x1Cu);
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [v5 activeAssertionUpdateClientIdentifiers];
    uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v31 = v5;
      id v20 = 0;
      uint64_t v21 = *(void *)v36;
      do
      {
        uint64_t v22 = 0;
        id v23 = v20;
        do
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * v22);
          uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "delegate", v31);
          uint64_t v26 = *(void *)(a1 + 40);
          id v34 = v23;
          v27 = [v25 remoteServiceProvider:v26 activeAssertionWithClientIdentifer:v24 error:&v34];
          id v20 = v34;

          v28 = [v33 remoteTarget];
          uint64_t v29 = *(void *)(a1 + 32);
          uint64_t v39 = v24;
          v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
          [v28 deliverActiveModeAssertion:v27 stateUpdate:v29 clientIdentifiers:v30];

          ++v22;
          id v23 = v20;
        }
        while (v19 != v22);
        uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v19);

      id v5 = v31;
    }
  }
}

- (void)handleModeAssertionUpdateResult:(id)a3
{
  id v4 = a3;
  clientNotificationQueue = self->_clientNotificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke;
  v7[3] = &unk_1E69735B8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(clientNotificationQueue, v7);
}

void __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v2 = (void *)DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 assertions];
    uint64_t v6 = [v5 count];
    id v7 = [*(id *)(a1 + 32) invalidations];
    uint64_t v8 = [v7 count];
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v62 = v6;
    __int16 v63 = 2048;
    uint64_t v64 = v8;
    __int16 v65 = 2114;
    uint64_t v66 = v9;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Did receive update result with %lu assertion(s) & %lu invalidation(s), will handle; updateResult=%{public}@",
      buf,
      0x20u);
  }
  id v10 = [*(id *)(a1 + 32) assertions];
  id v11 = (void *)[v10 mutableCopy];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = [*(id *)(a1 + 32) invalidations];
  uint64_t v12 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    id v40 = *(id *)v56;
    *(void *)&long long v13 = 138412290;
    long long v38 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(id *)v56 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v17 = DNDSLogServiceProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v38;
          uint64_t v62 = (uint64_t)v16;
          _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Handling invalidation: %@", buf, 0xCu);
        }
        uint64_t v18 = objc_msgSend(v16, "assertion", v38);
        uint64_t v19 = [v18 source];
        id v20 = [v19 clientIdentifier];

        uint64_t v21 = [*(id *)(*(void *)(a1 + 40) + 32) clientDetailsForIdentifier:v20];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_22;
        v53[3] = &unk_1E6974548;
        v53[4] = *(void *)(a1 + 40);
        id v22 = v21;
        id v54 = v22;
        id v23 = objc_msgSend(v11, "bs_firstObjectPassingTest:", v53);
        if (v23) {
          [v11 removeObject:v23];
        }
        uint64_t v24 = *(void **)(a1 + 40);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_2;
        v49[3] = &unk_1E6975480;
        id v50 = v22;
        id v51 = v23;
        v52 = v16;
        id v25 = v23;
        id v26 = v22;
        [v24 _iterateClientConnectionsToSendWithHandler:v49];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v14);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v41 = v11;
  uint64_t v27 = [v41 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v46 != v29) {
          objc_enumerationMutation(v41);
        }
        id v31 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        v32 = DNDSLogServiceProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v62 = (uint64_t)v31;
          _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Handling assertion: %@", buf, 0xCu);
        }
        id v33 = [v31 source];
        id v34 = [v33 clientIdentifier];

        long long v35 = [*(id *)(*(void *)(a1 + 40) + 32) clientDetailsForIdentifier:v34];
        long long v36 = *(void **)(a1 + 40);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_25;
        v42[3] = &unk_1E6975430;
        id v43 = v35;
        v44 = v31;
        id v37 = v35;
        [v36 _iterateClientConnectionsToSendWithHandler:v42];
      }
      uint64_t v28 = [v41 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v28);
  }
}

uint64_t __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v4 = [a2 source];
  id v5 = [v4 clientIdentifier];
  uint64_t v6 = [v3 clientDetailsForIdentifier:v5];

  uint64_t v7 = [*(id *)(a1 + 40) isEqual:v6];
  return v7;
}

void __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) identifiers];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_3;
  v14[3] = &unk_1E6975458;
  id v8 = v5;
  id v15 = v8;
  uint64_t v9 = objc_msgSend(v7, "bs_filter:", v14);

  if ([v9 count])
  {
    id v10 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Delivering assertion update with invalidation: assertion=%{public}@, invalidation=%{public}@, connection=%{public}@", buf, 0x20u);
    }
    long long v13 = [v6 remoteTarget];
    [v13 deliverActiveModeAssertionUpdate:*(void *)(a1 + 40) invalidation:*(void *)(a1 + 48) clientIdentifiers:v9];
  }
}

uint64_t __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 assertionUpdateClientIdentifiers];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

void __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) identifiers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_2_26;
  v13[3] = &unk_1E6975458;
  id v8 = v5;
  id v14 = v8;
  uint64_t v9 = objc_msgSend(v7, "bs_filter:", v13);

  if ([v9 count])
  {
    id v10 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Delivering assertion update: assertion=%{public}@, connection=%{public}@", buf, 0x16u);
    }
    uint64_t v12 = [v6 remoteTarget];
    [v12 deliverActiveModeAssertionUpdate:*(void *)(a1 + 40) invalidation:0 clientIdentifiers:v9];
  }
}

uint64_t __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_2_26(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 assertionUpdateClientIdentifiers];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (void)handleUpdatedBehaviorSettings:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Did receive updated behavior settings, will handle; settings=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__DNDSRemoteServiceProvider_handleUpdatedBehaviorSettings___block_invoke;
  v7[3] = &unk_1E69754A8;
  id v8 = v4;
  id v6 = v4;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v7];
}

void __59__DNDSRemoteServiceProvider_handleUpdatedBehaviorSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 wantsSettingsUpdates])
  {
    id v6 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Delivering settings update: settings=%{public}@, connection=%{public}@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [v5 remoteTarget];
    [v8 deliverUpdatedBehaviorSettings:*(void *)(a1 + 32)];
  }
}

- (void)handleUpdatedPhoneCallBypassSettings:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Did receive updated phone call bypass settings, will handle; settings=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__DNDSRemoteServiceProvider_handleUpdatedPhoneCallBypassSettings___block_invoke;
  v7[3] = &unk_1E69754A8;
  id v8 = v4;
  id v6 = v4;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v7];
}

void __66__DNDSRemoteServiceProvider_handleUpdatedPhoneCallBypassSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v5 wantsGlobalConfigurationUpdates] & 1) != 0
    || [v5 wantsSettingsUpdates])
  {
    uint64_t v7 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Delivering bypass update: settings=%{public}@, connection=%{public}@", (uint8_t *)&v10, 0x16u);
    }
    int v9 = [v6 remoteTarget];
    [v9 deliverUpdatedPhoneCallBypassSettings:*(void *)(a1 + 32)];
  }
}

- (void)handleUpdatedPairSyncState:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    uint64_t v7 = v5;
    uint64_t v8 = [v6 numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Did receive updated pair sync state, will handle; state=%{public}@",
      buf,
      0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__DNDSRemoteServiceProvider_handleUpdatedPairSyncState___block_invoke;
  v9[3] = &__block_descriptor_40_e89_v24__0__DNDSClientConnectionDetails_8__BSServiceConnection_BSServiceConnectionContext__16l;
  v9[4] = a3;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v9];
}

void __56__DNDSRemoteServiceProvider_handleUpdatedPairSyncState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 wantsGlobalConfigurationUpdates])
  {
    id v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = NSNumber;
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = v6;
      int v10 = [v7 numberWithUnsignedInteger:v8];
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Delivering pair sync state: state=%{public}@, connection=%{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = [v5 remoteTarget];
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
    [v11 deliverUpdatedPairSyncState:v12];
  }
}

- (void)handleUpdatedPreventAutoReplySetting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    uint64_t v7 = v5;
    uint64_t v8 = [v6 numberWithBool:v3];
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Did receive updated prevent auto reply settings, will handle; settings=%{public}@",
      buf,
      0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__DNDSRemoteServiceProvider_handleUpdatedPreventAutoReplySetting___block_invoke;
  v9[3] = &__block_descriptor_33_e89_v24__0__DNDSClientConnectionDetails_8__BSServiceConnection_BSServiceConnectionContext__16l;
  BOOL v10 = v3;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v9];
}

void __66__DNDSRemoteServiceProvider_handleUpdatedPreventAutoReplySetting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v5 wantsGlobalConfigurationUpdates] & 1) != 0
    || [v5 wantsSettingsUpdates])
  {
    uint64_t v7 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = NSNumber;
      uint64_t v9 = *(unsigned __int8 *)(a1 + 32);
      BOOL v10 = v7;
      uint64_t v11 = [v8 numberWithBool:v9];
      int v14 = 138543618;
      __int16 v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Delivering prevent auto reply update: settings=%{public}@, connection=%{public}@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v12 = [v6 remoteTarget];
    uint64_t v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
    [v12 deliverUpdatedPreventAutoReplySetting:v13];
  }
}

- (void)handleUpdatedScheduleSettings:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Did receive updated schedule settings, will handle; settings=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__DNDSRemoteServiceProvider_handleUpdatedScheduleSettings___block_invoke;
  v7[3] = &unk_1E69754A8;
  id v8 = v4;
  id v6 = v4;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v7];
}

void __59__DNDSRemoteServiceProvider_handleUpdatedScheduleSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 wantsSettingsUpdates])
  {
    id v6 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Delivering settings update: settings=%{public}@, connection=%{public}@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [v5 remoteTarget];
    [v8 deliverUpdatedScheduleSettings:*(void *)(a1 + 32)];
  }
}

- (void)handleUpdatedModes:(id)a3 availableModes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Did receive updated available modes, will handle; modes=%{public}@",
      buf,
      0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__DNDSRemoteServiceProvider_handleUpdatedModes_availableModes___block_invoke;
  v11[3] = &unk_1E6975430;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v11];
}

void __63__DNDSRemoteServiceProvider_handleUpdatedModes_availableModes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 wantsModeUpdates])
  {
    id v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [v5 remoteProcess];
      int v9 = [v8 pid];
      uint64_t v10 = *(void *)(a1 + 32);
      int v18 = 67109634;
      int v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      id v23 = v5;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Delivering modes update: pid=%d, modes=%{public}@, connection=%{public}@", (uint8_t *)&v18, 0x1Cu);
    }
    __int16 v11 = [v5 remoteTarget];
    [v11 deliverAllModes:*(void *)(a1 + 40)];

    id v12 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      int v14 = [v5 remoteProcess];
      int v15 = [v14 pid];
      uint64_t v16 = *(void *)(a1 + 32);
      int v18 = 67109634;
      int v19 = v15;
      __int16 v20 = 2114;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      id v23 = v5;
      _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Delivering available modes update: pid=%d, modes=%{public}@, connection=%{public}@", (uint8_t *)&v18, 0x1Cu);
    }
    id v17 = [v5 remoteTarget];
    [v17 deliverAvailableModes:*(void *)(a1 + 32)];
  }
}

- (void)handleAppConfigurationContextUpdateForModeIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Mode did receive updated app configuration context, will handle; mode=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__DNDSRemoteServiceProvider_handleAppConfigurationContextUpdateForModeIdentifier___block_invoke;
  v7[3] = &unk_1E69754A8;
  id v8 = v4;
  id v6 = v4;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v7];
}

void __82__DNDSRemoteServiceProvider_handleAppConfigurationContextUpdateForModeIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 wantsModeUpdates])
  {
    id v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [v5 remoteProcess];
      int v9 = [v8 pid];
      uint64_t v10 = *(void *)(a1 + 32);
      v12[0] = 67109634;
      v12[1] = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Signaling mode app configuration context update: pid=%d, mode=%{public}@, connection=%{public}@", (uint8_t *)v12, 0x1Cu);
    }
    uint64_t v11 = [v5 remoteTarget];
    [v11 signalAppConfigurationContextUpdateForModeIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)handleMeDeviceStateUpdate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    [v4 meDeviceStatus];
    id v7 = DNDMeDeviceStatusToString();
    id v8 = [v4 meDeviceName];
    *(_DWORD *)buf = 138543618;
    __int16 v13 = v7;
    __int16 v14 = 2114;
    __int16 v15 = v8;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Did receive updated 'Me Device' state, will handle; meDeviceStatus=%{public}@, meDeviceName=%{public}@",
      buf,
      0x16u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__DNDSRemoteServiceProvider_handleMeDeviceStateUpdate___block_invoke;
  v10[3] = &unk_1E69754A8;
  id v11 = v4;
  id v9 = v4;
  [(DNDSRemoteServiceProvider *)self _iterateClientConnectionsToSendWithHandler:v10];
}

void __55__DNDSRemoteServiceProvider_handleMeDeviceStateUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 wantsMeDeviceStateUpdates])
  {
    id v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [v5 remoteProcess];
      int v9 = [v8 pid];
      [*(id *)(a1 + 32) meDeviceStatus];
      uint64_t v10 = DNDMeDeviceStatusToString();
      id v11 = [*(id *)(a1 + 32) meDeviceName];
      v13[0] = 67109890;
      v13[1] = v9;
      __int16 v14 = 2114;
      __int16 v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Delivering 'Me Device' state update: pid=%d, meDeviceStatus=%{public}@, meDeviceName=%{public}@, connection=%{public}@", (uint8_t *)v13, 0x26u);
    }
    id v12 = [v5 remoteTarget];
    [v12 deliverMeDeviceState:*(void *)(a1 + 32)];
  }
}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientConnectionInterrupted:v3];
  [WeakRetained _removeConnection:v3];
}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientConnectionInvalidated:v3];
  [WeakRetained _removeConnection:v3];
}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientConnectionInterrupted:v3];
  [WeakRetained _removeConnection:v3];
}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientConnectionInvalidated:v3];
  [WeakRetained _removeConnection:v3];
}

- (void)resolveBehaviorForEventDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void, void *, id))a5;
  id v12 = NSString;
  __int16 v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  __int16 v15 = (void *)os_transaction_create();

  __int16 v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  if (objc_msgSend(v16, "dnds_hasBehaviorResolutionEntitlementForClientIdentifier:", v17))
  {
    __int16 v18 = [(DNDSRemoteServiceProvider *)self _clientDetailsForClientIdentifier:v17 clientConnection:v16];
    [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = v26 = v11;
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    id v27 = 0;
    uint64_t v21 = [v19 remoteServiceProvider:self resolveBehaviorForEventDetails:v9 clientDetails:v18 date:v20 error:&v27];
    id v22 = v10;
    id v23 = v15;
    id v24 = v9;
    id v25 = v27;

    id v11 = v26;
    v26[2](v26, v21, v25);

    id v9 = v24;
    __int16 v15 = v23;
    id v10 = v22;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider resolveBehaviorForEventDetails:requestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)takeModeAssertionWithDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  __int16 v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  __int16 v15 = (void *)os_transaction_create();

  __int16 v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  if (objc_msgSend(v16, "dnds_hasEntitlementsToRequestAssertionWithDetails:clientIdentifier:", v9, v17))
  {
    __int16 v18 = [(DNDSRemoteServiceProvider *)self delegate];
    id v25 = 0;
    id v19 = [v18 remoteServiceProvider:self takeModeAssertionWithDetails:v9 clientIdentifier:v17 error:&v25];
    id v20 = v25;

    if (v19)
    {
      uint64_t v21 = [(DNDSClientDetailsProvider *)self->_clientDetailsProvider clientDetailsForIdentifier:v17];
      if (([v21 isPersistentAssertionClient] & 1) == 0)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __91__DNDSRemoteServiceProvider_takeModeAssertionWithDetails_requestDetails_completionHandler___block_invoke;
        v23[3] = &unk_1E6975510;
        id v24 = v19;
        [(DNDSRemoteServiceProvider *)self _registerOrMutateConnectionDetailsForClientConnection:v16 handler:v23];
      }
    }
    v11[2](v11, v19, v20);
  }
  else
  {
    id v22 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v27 = v10;
      __int16 v28 = 2114;
      uint64_t v29 = v16;
      __int16 v30 = 2114;
      id v31 = v9;
      _os_log_error_impl(&dword_1D3052000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] XPC connection without any valid entitlements tried to take mode assertion, will invalidate: connection=%{public}@, assertionDetails=%{public}@", buf, 0x20u);
    }
    [v16 invalidate];
  }
}

id __91__DNDSRemoteServiceProvider_takeModeAssertionWithDetails_requestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = [*(id *)(a1 + 32) UUID];
  [v3 setInterruptionInvalidationAssertionUUID:v4];

  return v3;
}

- (void)invalidateActiveModeAssertionWithDetails:(id)a3 reasonOverride:(id)a4 requestDetails:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *, id))a6;
  __int16 v15 = NSString;
  __int16 v16 = NSStringFromSelector(a2);
  id v17 = [v15 stringWithFormat:@"com.apple.donotdisturbd.%@", v16];
  [v17 UTF8String];
  __int16 v18 = (void *)os_transaction_create();

  id v19 = [MEMORY[0x1E4F50BA0] currentContext];
  id v20 = [v13 clientIdentifier];
  if (objc_msgSend(v19, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v20))
  {
    uint64_t v21 = [(DNDSRemoteServiceProvider *)self delegate];
    id v24 = 0;
    id v22 = objc_msgSend(v21, "remoteServiceProvider:invalidateModeAssertionForClientIdentifier:reason:reasonOverride:details:error:", self, v20, 3, objc_msgSend(v12, "unsignedIntegerValue"), v11, &v24);
    id v23 = v24;

    v14[2](v14, v22, v23);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider invalidateActiveModeAssertionWithDetails:reasonOverride:requestDetails:completionHandler:]();
    }
    [v19 invalidate];
  }
}

- (void)getActiveModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    __int16 v15 = [(DNDSRemoteServiceProvider *)self delegate];
    id v18 = 0;
    __int16 v16 = [v15 remoteServiceProvider:self assertionWithClientIdentifer:v14 error:&v18];
    id v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getActiveModeAssertionWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)getLatestModeAssertionInvalidationWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    __int16 v15 = [(DNDSRemoteServiceProvider *)self delegate];
    id v18 = 0;
    __int16 v16 = [v15 remoteServiceProvider:self latestInvalidationWithClientIdentifer:v14 error:&v18];
    id v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getLatestModeAssertionInvalidationWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)invalidateAllActiveModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14)
    && objc_msgSend(v13, "dnds_hasUserRequestedModeAssertionEntitlementForClientIdentifier:", v14))
  {
    __int16 v15 = [(DNDSRemoteServiceProvider *)self delegate];
    __int16 v16 = [MEMORY[0x1E4F1C9C8] date];
    id v20 = 0;
    id v17 = [v15 remoteServiceProvider:self invalidateAllModeAssertionsTakenBeforeDate:v16 forReason:2 clientIdentifier:v14 error:&v20];
    id v18 = v20;

    id v19 = [NSNumber numberWithBool:v17 != 0];
    v8[2](v8, v19, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider invalidateAllActiveModeAssertionsWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)getAllModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    __int16 v15 = [(DNDSRemoteServiceProvider *)self delegate];
    id v18 = 0;
    __int16 v16 = [v15 remoteServiceProvider:self allActiveModeAssertionsWithError:&v18];
    id v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAllModeAssertionsWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)registerForAssertionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__DNDSRemoteServiceProvider_registerForAssertionUpdatesWithRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E6975510;
    id v16 = v14;
    [(DNDSRemoteServiceProvider *)self _registerOrMutateConnectionDetailsForClientConnection:v13 handler:v15];
    (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC38], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider registerForAssertionUpdatesWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

id __93__DNDSRemoteServiceProvider_registerForAssertionUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = [v3 assertionUpdateClientIdentifiers];
  id v5 = [v4 setByAddingObject:*(void *)(a1 + 32)];

  [v3 setAssertionUpdateClientIdentifiers:v5];
  return v3;
}

- (void)queryStateForUpdateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasStateUpdatesEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    [(DNDSRemoteServiceProvider *)self _queryStateWithCompletionHandler:v8];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider queryStateForUpdateWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)setScreenIsShared:(id)a3 screenIsMirrored:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *, id))a6;
  int v15 = NSString;
  id v16 = NSStringFromSelector(a2);
  id v17 = [v15 stringWithFormat:@"com.apple.donotdisturbd.%@", v16];
  [v17 UTF8String];
  id v18 = (void *)os_transaction_create();

  id v19 = [MEMORY[0x1E4F50BA0] currentContext];
  id v20 = [v13 clientIdentifier];
  int v21 = objc_msgSend(v19, "dnds_hasAuxiliaryStateModificationEntitlementForClientIdentifier:", v20);

  if (v21)
  {
    id v22 = [(DNDSRemoteServiceProvider *)self delegate];
    id v26 = 0;
    uint64_t v23 = objc_msgSend(v22, "remoteServiceProvider:setScreenIsShared:screenIsMirrored:withError:", self, objc_msgSend(v11, "BOOLValue"), objc_msgSend(v12, "BOOLValue"), &v26);
    id v24 = v26;

    id v25 = [NSNumber numberWithBool:v23];
    v14[2](v14, v25, v24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setScreenIsShared:screenIsMirrored:withRequestDetails:completionHandler:]();
    }
    [v19 invalidate];
  }
}

- (void)setHearingTestIsActive:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasHearingTestEventUpdateEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v20 = -[DNDSHearingTestEvent initWithIsHearingTestActive:]([DNDSHearingTestEvent alloc], "initWithIsHearingTestActive:", [v9 BOOLValue]);
    id v24 = 0;
    uint64_t v21 = [v19 remoteServiceProvider:self handleHearingTestEvent:v20 withError:&v24];
    id v22 = v24;

    uint64_t v23 = [NSNumber numberWithBool:v21];
    v11[2](v11, v23, v22);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setScreenIsShared:screenIsMirrored:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getBehaviorSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = 0;
    id v17 = [v16 remoteServiceProvider:self behaviorSettingsWithError:&v19];
    id v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getBehaviorSettingsWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)setBehaviorSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    uint64_t v20 = [v19 remoteServiceProvider:self setBehaviorSettings:v9 withError:&v23];
    id v21 = v23;

    id v22 = [NSNumber numberWithBool:v20];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setBehaviorSettings:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getScheduleSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = 0;
    id v17 = [v16 remoteServiceProvider:self scheduleSettingsWithError:&v19];
    id v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getScheduleSettingsWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)setScheduleSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    uint64_t v20 = [v19 remoteServiceProvider:self setScheduleSettings:v9 withError:&v23];
    id v21 = v23;

    id v22 = [NSNumber numberWithBool:v20];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setScheduleSettings:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)registerForSettingsUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsUpdatesEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    [(DNDSRemoteServiceProvider *)self _registerOrMutateConnectionDetailsForClientConnection:v13 handler:&__block_literal_global_42];
    (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC38], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setScheduleSettings:withRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

id __92__DNDSRemoteServiceProvider_registerForSettingsUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  [v2 setWantsSettingsUpdates:1];
  return v2;
}

- (void)setPreventAutoReply:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    uint64_t v20 = objc_msgSend(v19, "remoteServiceProvider:setPreventAutoReply:withError:", self, objc_msgSend(v9, "BOOLValue"), &v23);
    id v21 = v23;

    id v22 = [NSNumber numberWithBool:v20];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setPreventAutoReply:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getPreventAutoReplyWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v20 = 0;
    uint64_t v17 = [v16 remoteServiceProvider:self getPreventAutoReplyReturningError:&v20];
    id v18 = v20;

    id v19 = [NSNumber numberWithBool:v17];
    v8[2](v8, v19, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getPreventAutoReplyWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)setModesCanImpactAvailability:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    uint64_t v20 = objc_msgSend(v19, "remoteServiceProvider:setModesCanImpactAvailability:withError:", self, objc_msgSend(v9, "BOOLValue"), &v23);
    id v21 = v23;

    id v22 = [NSNumber numberWithBool:v20];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setPreventAutoReply:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getModesCanImpactAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v20 = 0;
    uint64_t v17 = [v16 remoteServiceProvider:self getModesCanImpactAvailabilityReturningError:&v20];
    id v18 = v20;

    id v19 = [NSNumber numberWithBool:v17];
    v8[2](v8, v19, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getModesCanImpactAvailabilityWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)registerForGlobalConfigurationUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsUpdatesEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    [(DNDSRemoteServiceProvider *)self _registerOrMutateConnectionDetailsForClientConnection:v13 handler:&__block_literal_global_44];
    (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC38], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider registerForGlobalConfigurationUpdatesWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

id __103__DNDSRemoteServiceProvider_registerForGlobalConfigurationUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  [v2 setWantsGlobalConfigurationUpdates:1];
  return v2;
}

- (void)getCloudSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v20 = 0;
    uint64_t v17 = [v16 remoteServiceProvider:self getCloudSyncStateReturningError:&v20];
    id v18 = v20;

    id v19 = [NSNumber numberWithUnsignedInteger:v17];
    v8[2](v8, v19, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getCloudSyncStateWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)setCloudSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    uint64_t v20 = objc_msgSend(v19, "remoteServiceProvider:setCloudSyncPreferenceEnabled:withError:", self, objc_msgSend(v9, "BOOLValue"), &v23);
    id v21 = v23;

    id v22 = [NSNumber numberWithBool:v20];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setCloudSyncPreferenceEnabled:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getPairSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v20 = 0;
    uint64_t v17 = [v16 remoteServiceProvider:self getPairSyncStateReturningError:&v20];
    id v18 = v20;

    id v19 = [NSNumber numberWithUnsignedInteger:v17];
    v8[2](v8, v19, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getPairSyncStateWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)setPairSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    uint64_t v20 = objc_msgSend(v19, "remoteServiceProvider:setPairSyncPreferenceEnabled:withError:", self, objc_msgSend(v9, "BOOLValue"), &v23);
    id v21 = v23;

    id v22 = [NSNumber numberWithBool:v20];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setPairSyncPreferenceEnabled:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getAccountFeatureSupportWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = 0;
    uint64_t v17 = [v16 remoteServiceProvider:self getAccountFeatureSupportWithError:&v19];
    id v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAccountFeatureSupportWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)getStateDumpWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = NSString;
  id v9 = NSStringFromSelector(a2);
  id v10 = [v8 stringWithFormat:@"com.apple.donotdisturbd.%@", v9];
  [v10 UTF8String];
  id v11 = (void *)os_transaction_create();

  id v12 = [MEMORY[0x1E4F50BA0] currentContext];
  id v13 = [v6 clientIdentifier];
  int v14 = objc_msgSend(v12, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v13);

  if (v14)
  {
    int v15 = [MEMORY[0x1E4F1C9C8] date];
    id v16 = DNDSCollectSysdiagnoseState(v15);

    v7[2](v7, v16, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getStateDumpWithRequestDetails:completionHandler:]();
    }
    [v12 invalidate];
  }
}

- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    [v19 remoteServiceProvider:self didChangeFocusStatusSharingSettingForApplicationIdentifier:v9];

    (*((void (**)(id, void, void))v11 + 2))(v11, MEMORY[0x1E4F1CC38], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider didChangeFocusStatusSharingSettingForApplicationIdentifier:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)setModeConfiguration:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    uint64_t v20 = [v19 remoteServiceProvider:self setModeConfiguration:v9 withError:&v23];
    id v21 = v23;

    id v22 = [NSNumber numberWithBool:v20];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setModeConfiguration:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *, id))a6;
  int v15 = NSString;
  id v16 = NSStringFromSelector(a2);
  id v17 = [v15 stringWithFormat:@"com.apple.donotdisturbd.%@", v16];
  [v17 UTF8String];
  int v18 = (void *)os_transaction_create();

  id v19 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v20 = [v13 clientIdentifier];
  int v21 = objc_msgSend(v19, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v20);

  if (v21)
  {
    id v22 = [(DNDSRemoteServiceProvider *)self delegate];
    id v26 = 0;
    uint64_t v23 = objc_msgSend(v22, "remoteServiceProvider:removeModeConfigurationWithModeIdentifier:deletePlaceholder:withError:", self, v11, objc_msgSend(v12, "BOOLValue"), &v26);
    id v24 = v26;

    id v25 = [NSNumber numberWithBool:v23];
    v14[2](v14, v25, v24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider removeModeConfigurationForModeIdentifier:deletePlaceholder:withRequestDetails:completionHandler:]();
    }
    [v19 invalidate];
  }
}

- (void)getModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v20 = 0;
    id v17 = [v16 remoteServiceProvider:self modeConfigurationsWithError:&v20];
    id v18 = v20;

    id v19 = [v17 allValues];
    v8[2](v8, v19, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getModeConfigurationsWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)getAllModesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = 0;
    id v17 = [v16 remoteServiceProvider:self allModesReturningError:&v19];
    id v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAllModesWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)getAvailableModesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = 0;
    id v17 = [v16 remoteServiceProvider:self availableModesReturningError:&v19];
    id v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAvailableModesWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)syncModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v20 = 0;
    uint64_t v17 = [v16 remoteServiceProvider:self syncModeConfigurationsReturningError:&v20];
    id v18 = v20;

    id v19 = [NSNumber numberWithBool:v17];
    v8[2](v8, v19, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider syncModeConfigurationsWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)getAllowedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v24 = 0;
    id v20 = [v19 remoteServiceProvider:self allowedModesForContactHandle:v9 withError:&v24];
    id v21 = v24;

    if (v21)
    {
      id v22 = 0;
      id v23 = v21;
    }
    else
    {
      id v22 = v20;
      id v23 = 0;
    }
    v11[2](v11, v22, v23);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAllowedModesForContactHandle:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getSilencedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v24 = 0;
    id v20 = [v19 remoteServiceProvider:self silencedModesForContactHandle:v9 withError:&v24];
    id v21 = v24;

    if (v21)
    {
      id v22 = 0;
      id v23 = v21;
    }
    else
    {
      id v22 = v20;
      id v23 = 0;
    }
    v11[2](v11, v22, v23);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAllowedModesForContactHandle:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getUserAvailabilityInActiveModeForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    id v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    uint64_t v20 = [v19 remoteServiceProvider:self userAvailabilityInActiveModeForContactHandle:v9 withError:&v23];
    id v21 = v23;

    if (v21)
    {
      v11[2](v11, MEMORY[0x1E4F1CC38], v21);
    }
    else
    {
      id v22 = [NSNumber numberWithBool:v20];
      ((void (**)(id, void *, id))v11)[2](v11, v22, 0);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getUserAvailabilityInActiveModeForContactHandle:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)publishStatusKitAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = 0;
    uint64_t v17 = [v16 remoteServiceProvider:self publishStatusKitAvailabilityReturningError:&v19];
    id v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider publishStatusKitAvailabilityWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)activateModeWithDetails:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v17 = [v9 modeIdentifier];
  id v18 = [v10 clientIdentifier];
  int v19 = objc_msgSend(v16, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v18);
  uint64_t v20 = DNDSLogServiceProvider;
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Activating mode %@ with details %@", buf, 0x16u);
    }
    id v27 = v15;
    id v21 = [(DNDSRemoteServiceProvider *)self delegate];
    id v22 = v21;
    if (v17)
    {
      id v29 = 0;
      id v23 = [v21 remoteServiceProvider:self takeModeAssertionWithDetails:v9 clientIdentifier:v18 error:&v29];
      id v24 = v29;
    }
    else
    {
      id v25 = [MEMORY[0x1E4F1C9C8] date];
      id v28 = 0;
      id v23 = [v22 remoteServiceProvider:self invalidateAllModeAssertionsTakenBeforeDate:v25 forReason:2 clientIdentifier:v18 error:&v28];
      id v24 = v28;
    }
    id v26 = [NSNumber numberWithInt:v23 != 0];
    v11[2](v11, v26, v24);

    int v15 = v27;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v31 = v10;
      __int16 v32 = 2114;
      id v33 = v16;
      __int16 v34 = 2114;
      long long v35 = v17;
      _os_log_error_impl(&dword_1D3052000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] XPC connection without any valid entitlements tried to activate a mode, will invalidate: connection=%{public}@, modeIdentifier=%{public}@", buf, 0x20u);
    }
    [v16 invalidate];
  }
}

- (void)activeModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    int v15 = [(DNDSRemoteServiceProvider *)self delegate];
    id v18 = 0;
    id v16 = [v15 remoteServiceProvider:self activeAssertionWithClientIdentifer:v14 error:&v18];
    id v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider activeModeAssertionWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)invalidateModeAssertionWithUUID:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, uint64_t))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v17);
  int v19 = DNDSLogServiceProvider;
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_1D3052000, v19, OS_LOG_TYPE_DEFAULT, "Invalidating mode with UUID %@ with details %@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v27 = 0;
    uint64_t v21 = [WeakRetained remoteServiceProvider:self invalidateModeAssertionWithUUID:v9 reason:2 reasonOverride:0 clientIdentifier:v17 error:&v27];
    uint64_t v22 = (uint64_t)v27;

    if (!(v22 | v21))
    {
      id v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F5F528];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35[0] = @"Mode assertion not found for assertion UUID.";
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      uint64_t v22 = [v23 errorWithDomain:v24 code:1005 userInfo:v25];
    }
    id v26 = [NSNumber numberWithInt:v21 != 0];
    v11[2](v11, v26, v22);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v29 = v10;
      __int16 v30 = 2114;
      id v31 = v16;
      __int16 v32 = 2114;
      id v33 = v9;
      _os_log_error_impl(&dword_1D3052000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] XPC connection without any valid entitlements tried to invalidate a mode, will invalidate: connection=%{public}@, assertionUUID=%{public}@", buf, 0x20u);
    }
    [v16 invalidate];
  }
}

- (void)getAppInfoForBundleIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    int v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v22 = 0;
    uint64_t v20 = [v19 remoteServiceProvider:self getAppInfoForBundleIdentifier:v9 withError:&v22];
    id v21 = v22;

    v11[2](v11, v20, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAppInfoForBundleIdentifier:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)getAppInfoForBundleIdentifiers:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  int v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    int v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v22 = 0;
    uint64_t v20 = [v19 remoteServiceProvider:self getAppInfoForBundleIdentifiers:v9 withError:&v22];
    id v21 = v22;

    v11[2](v11, v20, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAppInfoForBundleIdentifier:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)queryMeDeviceStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasMeDeviceStateEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = 0;
    id v17 = [v16 remoteServiceProvider:self currentMeDeviceStateWithError:&v19];
    id v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider queryMeDeviceStateWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

- (void)registerForMeDeviceStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *, id))a4;
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  id v11 = [v9 stringWithFormat:@"com.apple.donotdisturbd.%@", v10];
  [v11 UTF8String];
  id v12 = (void *)os_transaction_create();

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  id v14 = [v7 clientIdentifier];
  int v15 = objc_msgSend(v13, "dnds_hasMeDeviceStateEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    [(DNDSRemoteServiceProvider *)self _registerOrMutateConnectionDetailsForClientConnection:v13 handler:&__block_literal_global_51];
    id v16 = [(DNDSRemoteServiceProvider *)self delegate];
    id v19 = 0;
    id v17 = [v16 remoteServiceProvider:self currentMeDeviceStateWithError:&v19];
    id v18 = v19;

    v8[2](v8, MEMORY[0x1E4F1CC38], v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider registerForMeDeviceStateUpdatesWithRequestDetails:completionHandler:]();
    }
    [v13 invalidate];
  }
}

id __97__DNDSRemoteServiceProvider_registerForMeDeviceStateUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  [v2 setWantsMeDeviceStateUpdates:1];
  return v2;
}

- (void)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *, id))a8;
  uint64_t v20 = NSString;
  id v21 = NSStringFromSelector(a2);
  id v22 = [v20 stringWithFormat:@"com.apple.donotdisturbd.%@", v21];
  [v22 UTF8String];
  id v23 = (void *)os_transaction_create();

  uint64_t v24 = [MEMORY[0x1E4F50BA0] currentContext];
  id v25 = [v18 clientIdentifier];
  int v26 = objc_msgSend(v24, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v25);

  if (v26)
  {
    uint64_t v36 = v23;
    id v27 = [(DNDSRemoteServiceProvider *)self delegate];
    id v38 = 0;
    id v28 = v17;
    id v29 = v16;
    id v30 = v15;
    id v31 = v14;
    uint64_t v32 = [v27 remoteServiceProvider:self setAppConfigurationPredicate:v14 forActionIdentifier:v30 forApplicationIdentifier:v29 modeIdentifier:v28 withError:&v38];
    id v33 = v38;

    uint64_t v34 = [NSNumber numberWithBool:v32];
    v19[2](v19, v34, v33);

    long long v35 = v31;
    id v15 = v30;
    id v16 = v29;
    id v17 = v28;
    id v23 = v36;
  }
  else
  {
    long long v35 = v14;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v24 invalidate];
  }
}

- (void)getAppConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(id, void *, id))a7;
  id v18 = NSString;
  id v19 = NSStringFromSelector(a2);
  id v20 = [v18 stringWithFormat:@"com.apple.donotdisturbd.%@", v19];
  [v20 UTF8String];
  id v21 = (void *)os_transaction_create();

  id v22 = [MEMORY[0x1E4F50BA0] currentContext];
  id v23 = [v16 clientIdentifier];
  int v24 = objc_msgSend(v22, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v23);

  if (v24)
  {
    id v25 = [(DNDSRemoteServiceProvider *)self delegate];
    id v28 = 0;
    int v26 = [v25 remoteServiceProvider:self getAppConfigurationPredicateForActionIdentifier:v13 forApplicationIdentifier:v14 modeIdentifier:v15 withError:&v28];
    id v27 = v28;

    v17[2](v17, v26, v27);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v22 invalidate];
  }
}

- (void)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *, id))a8;
  id v20 = NSString;
  id v21 = NSStringFromSelector(a2);
  id v22 = [v20 stringWithFormat:@"com.apple.donotdisturbd.%@", v21];
  [v22 UTF8String];
  id v23 = (void *)os_transaction_create();

  int v24 = [MEMORY[0x1E4F50BA0] currentContext];
  id v25 = [v18 clientIdentifier];
  int v26 = objc_msgSend(v24, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v25);

  if (v26)
  {
    uint64_t v36 = v23;
    id v27 = [(DNDSRemoteServiceProvider *)self delegate];
    id v38 = 0;
    id v28 = v17;
    id v29 = v16;
    id v30 = v15;
    id v31 = v14;
    uint64_t v32 = [v27 remoteServiceProvider:self setAppConfigurationTargetContentIdentifierPrefix:v14 forActionIdentifier:v30 forApplicationIdentifier:v29 modeIdentifier:v28 withError:&v38];
    id v33 = v38;

    uint64_t v34 = [NSNumber numberWithBool:v32];
    v19[2](v19, v34, v33);

    long long v35 = v31;
    id v15 = v30;
    id v16 = v29;
    id v17 = v28;
    id v23 = v36;
  }
  else
  {
    long long v35 = v14;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v24 invalidate];
  }
}

- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, id, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  id v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [(DNDSRemoteServiceProvider *)self delegate];
  id v18 = [v10 clientIdentifier];
  int v19 = objc_msgSend(v16, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v18);

  if (v19)
  {
    if ([v9 isEqualToString:@"com.apple.focus.current-sentinel"])
    {
      id v27 = 0;
      id v20 = [v17 remoteServiceProvider:self currentStateWithError:&v27];
      id v21 = v27;
      uint64_t v22 = [v20 activeModeIdentifier];

      id v9 = (id)v22;
    }
    else
    {
      id v21 = 0;
    }
    id v23 = objc_alloc_init(MEMORY[0x1E4F5F580]);
    if (v9)
    {
      id v26 = v21;
      int v24 = [v17 remoteServiceProvider:self getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:v9 withError:&v26];
      id v25 = v26;

      id v21 = v25;
    }
    else
    {
      int v24 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    [v23 setAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:v24];

    v11[2](v11, v23, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(id, void *, id))a7;
  id v18 = NSString;
  int v19 = NSStringFromSelector(a2);
  id v20 = [v18 stringWithFormat:@"com.apple.donotdisturbd.%@", v19];
  [v20 UTF8String];
  id v21 = (void *)os_transaction_create();

  uint64_t v22 = [MEMORY[0x1E4F50BA0] currentContext];
  id v23 = [v16 clientIdentifier];
  int v24 = objc_msgSend(v22, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v23);

  if (v24)
  {
    id v25 = [(DNDSRemoteServiceProvider *)self delegate];
    id v29 = 0;
    uint64_t v26 = [v25 remoteServiceProvider:self setAppAction:v13 forApplicationIdentifier:v14 modeIdentifier:v15 withError:&v29];
    id v27 = v29;

    id v28 = [NSNumber numberWithBool:v26];
    v17[2](v17, v28, v27);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setAppAction:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v22 invalidate];
  }
}

- (void)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(id, void *, id))a7;
  id v18 = NSString;
  int v19 = NSStringFromSelector(a2);
  id v20 = [v18 stringWithFormat:@"com.apple.donotdisturbd.%@", v19];
  [v20 UTF8String];
  id v21 = (void *)os_transaction_create();

  uint64_t v22 = [MEMORY[0x1E4F50BA0] currentContext];
  id v23 = [v16 clientIdentifier];
  int v24 = objc_msgSend(v22, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v23);

  if (v24)
  {
    id v25 = [(DNDSRemoteServiceProvider *)self delegate];
    id v29 = 0;
    uint64_t v26 = [v25 remoteServiceProvider:self clearAppActionWithIdentifier:v13 forApplicationIdentifier:v14 modeIdentifier:v15 withError:&v29];
    id v27 = v29;

    id v28 = [NSNumber numberWithBool:v26];
    v17[2](v17, v28, v27);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v22 invalidate];
  }
}

- (void)getAppActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, id, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  id v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    int v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    id v20 = [v19 remoteServiceProvider:self getAppActionsForModeIdentifier:v9 withError:&v23];
    id v21 = v23;

    id v22 = objc_alloc_init(MEMORY[0x1E4F5F578]);
    [v22 setAppActionsForModeIdentifier:v20];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getAppActionsForModeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *, id))a6;
  id v15 = NSString;
  id v16 = NSStringFromSelector(a2);
  id v17 = [v15 stringWithFormat:@"com.apple.donotdisturbd.%@", v16];
  [v17 UTF8String];
  int v18 = (void *)os_transaction_create();

  int v19 = [MEMORY[0x1E4F50BA0] currentContext];
  id v20 = [v13 clientIdentifier];
  int v21 = objc_msgSend(v19, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v20);

  if (v21)
  {
    id v22 = [(DNDSRemoteServiceProvider *)self delegate];
    id v26 = 0;
    uint64_t v23 = [v22 remoteServiceProvider:self clearSystemActionWithIdentifier:v11 forModeIdentifier:v12 withError:&v26];
    id v24 = v26;

    id v25 = [NSNumber numberWithBool:v23];
    v14[2](v14, v25, v24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider clearSystemActionWithIdentifier:forModeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v19 invalidate];
  }
}

- (void)getSystemActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  id v12 = NSString;
  id v13 = NSStringFromSelector(a2);
  id v14 = [v12 stringWithFormat:@"com.apple.donotdisturbd.%@", v13];
  [v14 UTF8String];
  id v15 = (void *)os_transaction_create();

  id v16 = [MEMORY[0x1E4F50BA0] currentContext];
  id v17 = [v10 clientIdentifier];
  int v18 = objc_msgSend(v16, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    int v19 = [(DNDSRemoteServiceProvider *)self delegate];
    id v23 = 0;
    id v20 = [v19 remoteServiceProvider:self getSystemActionsForModeIdentifier:v9 withError:&v23];
    id v21 = v23;

    id v22 = [v20 allObjects];
    v11[2](v11, v22, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider getSystemActionsForModeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v16 invalidate];
  }
}

- (void)setSystemAction:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *, id))a6;
  id v15 = NSString;
  id v16 = NSStringFromSelector(a2);
  id v17 = [v15 stringWithFormat:@"com.apple.donotdisturbd.%@", v16];
  [v17 UTF8String];
  int v18 = (void *)os_transaction_create();

  int v19 = [MEMORY[0x1E4F50BA0] currentContext];
  id v20 = [v13 clientIdentifier];
  int v21 = objc_msgSend(v19, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v20);

  if (v21)
  {
    id v22 = [(DNDSRemoteServiceProvider *)self delegate];
    id v26 = 0;
    uint64_t v23 = [v22 remoteServiceProvider:self setSystemAction:v11 forModeIdentifier:v12 withError:&v26];
    id v24 = v26;

    id v25 = [NSNumber numberWithBool:v23];
    v14[2](v14, v25, v24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSRemoteServiceProvider setSystemAction:forModeIdentifier:withRequestDetails:completionHandler:]();
    }
    [v19 invalidate];
  }
}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was interrupted: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(DNDSRemoteServiceProvider *)self _unregisterConnectionDetailsForClientConnection:v4];
}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was invalidated: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(DNDSRemoteServiceProvider *)self _unregisterConnectionDetailsForClientConnection:v4];
}

- (void)_unregisterConnectionDetailsForClientConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_clientConnectionDetailsByConnection;
  objc_sync_enter(v5);
  int v6 = [(NSMapTable *)self->_clientConnectionDetailsByConnection objectForKey:v4];
  [(NSMapTable *)self->_clientConnectionDetailsByConnection removeObjectForKey:v4];
  [(DNDSRemoteServiceProvider *)self _removeConnection:v4];
  id v7 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v4;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Connection details unregistered: connection=%{public}@, clientDetails=%{public}@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v8 = [v6 interruptionInvalidationAssertionUUID];
  if (v8)
  {
    id v9 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      id v15 = v8;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Invalidating assertion due to client disconnect: connection=%{public}@, UUID=%{public}@", (uint8_t *)&v12, 0x16u);
    }
    id v10 = [(DNDSRemoteServiceProvider *)self delegate];
    id v11 = (id)[v10 remoteServiceProvider:self invalidateModeAssertionWithUUID:v8 reason:6 reasonOverride:1 clientIdentifier:0 error:0];
  }
  objc_sync_exit(v5);
}

- (void)_iterateClientConnectionsToSendWithHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = self->_clientConnectionDetailsByConnection;
  objc_sync_enter(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v6 = self->_clientConnectionDetailsByConnection;
  uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = -[NSMapTable objectForKey:](self->_clientConnectionDetailsByConnection, "objectForKey:", v10, (void)v12);
        v4[2](v4, v11, v10);
      }
      uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (id)_clientDetailsForClientIdentifier:(id)a3 clientConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DNDSClientDetailsProvider *)self->_clientDetailsProvider findClientDetailsForIdentifier:v6];
  if (!v8)
  {
    id v9 = objc_msgSend(v7, "remoteProcess", 0, 0, 0, 0);
    uint64_t v10 = [v9 auditToken];
    id v11 = v10;
    if (v10)
    {
      [v10 realToken];
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }

    BSPIDForAuditToken();
    long long v12 = BSExecutablePathForPID();
    if (v12)
    {
      long long v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
      long long v14 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    }
    else
    {
      long long v14 = 0;
    }
    uint64_t v8 = -[DNDSClientDetailsProvider clientDetailsForIdentifier:applicationBundleURL:](self->_clientDetailsProvider, "clientDetailsForIdentifier:applicationBundleURL:", v6, v14, v16, v17);
  }
  return v8;
}

- (void)_removeConnection:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableSet *)self->_connections removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientNotificationQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_clientConnectionDetailsByConnection, 0);
  objc_storeStrong((id *)&self->_monitorListener, 0);
  objc_storeStrong((id *)&self->_requestListener, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "XPC connection without any valid entitlements tried to connect, will reject: connection=%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)resolveBehaviorForEventDetails:requestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to process event, will invalidate: connection=%{public}@");
}

- (void)invalidateActiveModeAssertionWithDetails:reasonOverride:requestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to invalidate mode assertion, will invalidate: connection=%{public}@");
}

- (void)getActiveModeAssertionWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode assertion, will invalidate: connection=%{public}@");
}

- (void)getLatestModeAssertionInvalidationWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode assertion invalidation, will invalidate: connection=%{public}@");
}

- (void)invalidateAllActiveModeAssertionsWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to invalidate all mode assertions, will invalidate: connection=%{public}@");
}

- (void)getAllModeAssertionsWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to request all mode assertions, will invalidate: connection=%{public}@");
}

- (void)registerForAssertionUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to register for assertion updates, will invalidate: connection=%{public}@");
}

- (void)queryStateWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to query state, will invalidate: connection=%{public}@");
}

- (void)queryStateForUpdateWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to query state as a part of registering for updates, will invalidate: connection=%{public}@");
}

- (void)registerForStateUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to register for state updates, will invalidate: connection=%{public}@");
}

- (void)setScreenIsShared:screenIsMirrored:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set screen sharing / mirroring settings, will invalidate: connection=%{public}@");
}

- (void)getBehaviorSettingsWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get behavior settings, will invalidate: connection=%{public}@");
}

- (void)setBehaviorSettings:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set behavior settings, will invalidate: connection=%{public}@");
}

- (void)getScheduleSettingsWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get schedule settings, will invalidate: connection=%{public}@");
}

- (void)setScheduleSettings:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set schedule settings, will invalidate: connection=%{public}@");
}

- (void)setPreventAutoReply:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set global configuration, will invalidate: connection=%{public}@");
}

- (void)getPreventAutoReplyWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get auto reply prevention state, will invalidate: connection=%{public}@");
}

- (void)getModesCanImpactAvailabilityWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get global availability state, will invalidate: connection=%{public}@");
}

- (void)registerForGlobalConfigurationUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to register for global configuration updates; will inva"
    "lidate: connection=%{public}@");
}

- (void)getCloudSyncStateWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get cloud sync state, will invalidate: connection=%{public}@");
}

- (void)setCloudSyncPreferenceEnabled:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to change cloud sync preference enabled state, will invalidate: connection=%{public}@");
}

- (void)getPairSyncStateWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get pair sync state, will invalidate: connection=%{public}@");
}

- (void)setPairSyncPreferenceEnabled:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to change pair sync preference enabled state, will invalidate: connection=%{public}@");
}

- (void)getAccountFeatureSupportWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get supported account features, will invalidate: connection=%{public}@");
}

- (void)getStateDumpWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to fetch state dump, will invalidate: connection=%{public}@");
}

- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to notify of focus status sharing change, will invalidate: connection=%{public}@");
}

- (void)setModeConfiguration:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set mode configuration, will invalidate: connection=%{public}@");
}

- (void)removeModeConfigurationForModeIdentifier:deletePlaceholder:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to remove mode configuration, will invalidate: connection=%{public}@");
}

- (void)getModeConfigurationsWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode configurations, will invalidate: connection=%{public}@");
}

- (void)getModeConfigurationForModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode configuration, will invalidate: connection=%{public}@");
}

- (void)getAllModesWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get all modes, will invalidate: connection=%{public}@");
}

- (void)getAvailableModesWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get available modes, will invalidate: connection=%{public}@");
}

- (void)syncModeConfigurationsWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to sync modes, will invalidate: connection=%{public}@");
}

- (void)getAllowedModesForContactHandle:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get silenced modes for a contact, will invalidate: connection=%{public}@");
}

- (void)getUserAvailabilityInActiveModeForContactHandle:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get availability state, will invalidate: connection=%{public}@");
}

- (void)publishStatusKitAvailabilityWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to publish statuskit availability, will invalidate: connection=%{public}@");
}

- (void)activeModeAssertionWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode assertion, will invalidate: connection=%{public}@");
}

- (void)registerForModeSelectionUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to register for available mode identifiers; will invali"
    "date: connection=%{public}@");
}

- (void)getAppInfoForBundleIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to fetch app info; will invalidate: connection=%{public}@");
}

- (void)queryMeDeviceStateWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to query 'Me Device' state; will invalidate: connection=%{public}@");
}

- (void)registerForMeDeviceStateUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to register for 'Me Device' state updates; will invalid"
    "ate: connection=%{public}@");
}

- (void)setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set app predicate, will invalidate: connection=%{public}@");
}

- (void)getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get app predicate, will invalidate: connection=%{public}@");
}

- (void)setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set target content identifier prefix, will invalidate: connection=%{public}@");
}

- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get target content identifier prefixes, will invalidate: connection=%{public}@");
}

- (void)setAppAction:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set app action, will invalidate: connection=%{public}@");
}

- (void)clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to clear app action, will invalidate: connection=%{public}@");
}

- (void)getAppActionsForModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get app actions, will invalidate: connection=%{public}@");
}

- (void)clearSystemActionWithIdentifier:forModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to clear system action, will invalidate: connection=%{public}@");
}

- (void)getSystemActionsForModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get system actions, will invalidate: connection=%{public}@");
}

- (void)setSystemAction:forModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set system action, will invalidate: connection=%{public}@");
}

@end