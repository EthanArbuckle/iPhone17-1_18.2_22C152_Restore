@interface DNDRemoteServiceConnection
+ (id)sharedInstance;
- (DNDRemoteServiceConnection)init;
- (id)_monitorTarget;
- (id)_remoteTarget;
- (void)_connectionLock_createConnection;
- (void)_connectionLock_invalidateConnection;
- (void)_monitorLock_createMonitorConnection;
- (void)_monitorLock_invalidateMonitorConnection;
- (void)_setMonitorState:(int64_t)a3;
- (void)activateModeWithDetails:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)activeModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)addEventListener:(id)a3;
- (void)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7;
- (void)clearAppConfigurationActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7;
- (void)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)clearSystemConfigurationActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)deliverActiveModeAssertion:(id)a3 stateUpdate:(id)a4 clientIdentifiers:(id)a5;
- (void)deliverActiveModeAssertionUpdate:(id)a3 invalidation:(id)a4 clientIdentifiers:(id)a5;
- (void)deliverAllModes:(id)a3;
- (void)deliverAvailableModes:(id)a3;
- (void)deliverMeDeviceState:(id)a3;
- (void)deliverStateUpdate:(id)a3;
- (void)deliverUpdatedBehaviorSettings:(id)a3;
- (void)deliverUpdatedPairSyncState:(id)a3;
- (void)deliverUpdatedPhoneCallBypassSettings:(id)a3;
- (void)deliverUpdatedPreventAutoReplySetting:(id)a3;
- (void)deliverUpdatedScheduleSettings:(id)a3;
- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAccountFeatureSupportWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getActiveModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getAllModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getAllModesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)getAllowedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAppActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getAppConfigurationActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
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
- (void)getSystemConfigurationActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)getUserAvailabilityInActiveModeForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)invalidateActiveModeAssertionWithDetails:(id)a3 reasonOverride:(id)a4 requestDetails:(id)a5 completionHandler:(id)a6;
- (void)invalidateAllActiveModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)invalidateModeAssertionWithUUID:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)publishStatusKitAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)queryMeDeviceStateWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)queryStateWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForAssertionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForGlobalConfigurationUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForMeDeviceStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForModeSelectionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForSettingsUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)registerForStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)removeEventListener:(id)a3;
- (void)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)resolveBehaviorForEventDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5;
- (void)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7;
- (void)setAppConfigurationAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7;
- (void)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8;
- (void)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8;
- (void)setBehaviorSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setCloudSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setHearingTestIsActive:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setModeConfiguration:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setModesCanImpactAvailability:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setPairSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setPreventAutoReply:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setScheduleSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)setScreenIsShared:(id)a3 screenIsMirrored:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)setSystemAction:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)setSystemConfigurationAction:(id)a3 modeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6;
- (void)signalAppConfigurationContextUpdateForModeIdentifier:(id)a3;
- (void)syncModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4;
- (void)takeModeAssertionWithDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5;
@end

@implementation DNDRemoteServiceConnection

void __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F50BE0];
  id v5 = a2;
  v4 = [v3 userInitiated];
  [v5 setServiceQuality:v4];

  [v5 setInterface:*(void *)(a1 + 32)];
  [v5 setInterfaceTarget:*(void *)(a1 + 40)];
  [v5 setActivationHandler:&__block_literal_global_265];
  [v5 setInterruptionHandler:&__block_literal_global_268];
  [v5 setInvalidationHandler:&__block_literal_global_271];
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v4];

  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_2;
  v9[3] = &unk_1E5911C80;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v9[4] = *(void *)(a1 + 40);
  [v3 setActivationHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_289;
  v7[3] = &unk_1E5911CA8;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  [v3 setInterruptionHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_290;
  v5[3] = &unk_1E5911CA8;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  [v3 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
}

- (void)queryStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__DNDRemoteServiceConnection_queryStateWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911DC0;
  id v11 = v6;
  id v9 = v6;
  [v8 queryStateWithRequestDetails:v7 completionHandler:v10];
}

- (void)addEventListener:(id)a3
{
  id v5 = a3;
  v4 = self->_eventListeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_eventListeners addObject:v5];
  objc_sync_exit(v4);
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v98 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "XPC monitor connection was activated: connection=%p", buf, 0xCu);
  }
  v54 = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setMonitorState:2];
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
  id v5 = (void *)[*((id *)WeakRetained + 6) copy];
  id v6 = (void *)[*((id *)WeakRetained + 7) copy];
  v49 = (void *)[*((id *)WeakRetained + 8) copy];
  id v55 = (id)[*((id *)WeakRetained + 9) copy];
  v51 = (void *)[*((id *)WeakRetained + 10) copy];
  v53 = (void *)[*((id *)WeakRetained + 11) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v88;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v88 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v87 + 1) + 8 * v10);
        v12 = [WeakRetained _monitorTarget];
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_276;
        v86[3] = &unk_1E5911BE0;
        v86[4] = v11;
        [v12 registerForAssertionUpdatesWithRequestDetails:v11 completionHandler:v86];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
    }
    while (v8);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v57 = v6;
  uint64_t v13 = [v57 countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v83;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v83 != v15) {
          objc_enumerationMutation(v57);
        }
        uint64_t v17 = *(void *)(*((void *)&v82 + 1) + 8 * v16);
        v18 = [WeakRetained _monitorTarget];
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_278;
        v81[3] = &unk_1E5911BE0;
        v81[4] = v17;
        [v18 registerForStateUpdatesWithRequestDetails:v17 completionHandler:v81];

        if (*((void *)WeakRetained + 13))
        {
          v19 = [WeakRetained _remoteTarget];
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_279;
          v80[3] = &unk_1E5911C08;
          v80[4] = WeakRetained;
          [v19 queryStateForUpdateWithRequestDetails:v17 completionHandler:v80];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v57 countByEnumeratingWithState:&v82 objects:v95 count:16];
    }
    while (v14);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v20 = v49;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v77;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v77 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v76 + 1) + 8 * v24);
        v26 = [WeakRetained _monitorTarget];
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_2_282;
        v75[3] = &unk_1E5911BE0;
        v75[4] = v25;
        [v26 registerForSettingsUpdatesWithRequestDetails:v25 completionHandler:v75];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v76 objects:v94 count:16];
    }
    while (v22);
  }
  v50 = v20;

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v56 = v55;
  uint64_t v27 = [v56 countByEnumeratingWithState:&v71 objects:v93 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v72;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v72 != v29) {
          objc_enumerationMutation(v56);
        }
        uint64_t v31 = *(void *)(*((void *)&v71 + 1) + 8 * v30);
        v32 = objc_msgSend(WeakRetained, "_monitorTarget", v50);
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_283;
        v70[3] = &unk_1E5911C30;
        uint64_t v33 = *(void *)(a1 + 32);
        v70[4] = v31;
        v70[5] = v33;
        [v32 registerForModeSelectionUpdatesWithRequestDetails:v31 completionHandler:v70];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v56 countByEnumeratingWithState:&v71 objects:v93 count:16];
    }
    while (v28);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v34 = v51;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v66 objects:v92 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v67;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v67 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v66 + 1) + 8 * v38);
        v40 = objc_msgSend(WeakRetained, "_monitorTarget", v50);
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_286;
        v65[3] = &unk_1E5911BE0;
        v65[4] = v39;
        [v40 registerForGlobalConfigurationUpdatesWithRequestDetails:v39 completionHandler:v65];

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [v34 countByEnumeratingWithState:&v66 objects:v92 count:16];
    }
    while (v36);
  }
  v52 = v34;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v41 = v53;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v61 objects:v91 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v62;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v62 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void *)(*((void *)&v61 + 1) + 8 * v45);
        v47 = objc_msgSend(WeakRetained, "_monitorTarget", v50, v52);
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_287;
        v60[3] = &unk_1E5911C58;
        uint64_t v48 = *(void *)(a1 + 32);
        v60[4] = v46;
        v60[5] = v48;
        [v47 registerForMeDeviceStateUpdatesWithRequestDetails:v46 completionHandler:v60];

        ++v45;
      }
      while (v43 != v45);
      uint64_t v43 = [v41 countByEnumeratingWithState:&v61 objects:v91 count:16];
    }
    while (v43);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__DNDRemoteServiceConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  id v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

- (void)getModeConfigurationForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 getModeConfigurationForModeIdentifier:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)registerForStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t monitorState = self->_monitorState;
  [(NSMutableArray *)self->_stateMonitorRequestDetails addObject:v9];
  os_unfair_lock_unlock(&self->_stateLock);
  if (monitorState == 2)
  {
    id v8 = [(DNDRemoteServiceConnection *)self _monitorTarget];
    [v8 registerForStateUpdatesWithRequestDetails:v9 completionHandler:v6];
  }
  else
  {
    if (monitorState != 1)
    {
      if (monitorState) {
        goto LABEL_7;
      }
      os_unfair_lock_lock(&self->_monitorLock);
      [(DNDRemoteServiceConnection *)self _monitorLock_createMonitorConnection];
      os_unfair_lock_unlock(&self->_monitorLock);
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CC38], 0);
  }
LABEL_7:
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([a2 BOOLValue] & 1) == 0)
  {
    id v6 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for state updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_setMonitorState:(int64_t)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_monitorState != a3) {
    self->_int64_t monitorState = a3;
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (id)_monitorTarget
{
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  os_unfair_lock_lock(&self->_monitorLock);
  id v3 = [(BSServiceConnection *)self->_monitorLock_monitorService remoteTarget];
  if (!v3)
  {
    [(DNDRemoteServiceConnection *)self _monitorLock_invalidateMonitorConnection];
    [(DNDRemoteServiceConnection *)self _monitorLock_createMonitorConnection];
    id v3 = [(BSServiceConnection *)self->_monitorLock_monitorService remoteTarget];
  }
  os_unfair_lock_unlock(&self->_monitorLock);
  return v3;
}

- (void)_monitorLock_createMonitorConnection
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "Unable to create monitor endpoint.", v1, 2u);
}

- (id)_remoteTarget
{
  os_unfair_lock_assert_not_owner(&self->_monitorLock);
  os_unfair_lock_lock(&self->_connectionLock);
  id v3 = [(BSServiceConnection *)self->_connectionLock_connection remoteTarget];
  if (!v3)
  {
    [(DNDRemoteServiceConnection *)self _connectionLock_invalidateConnection];
    [(DNDRemoteServiceConnection *)self _connectionLock_createConnection];
    id v3 = [(BSServiceConnection *)self->_connectionLock_connection remoteTarget];
  }
  os_unfair_lock_unlock(&self->_connectionLock);
  return v3;
}

- (void)_connectionLock_invalidateConnection
{
  os_unfair_lock_assert_owner(&self->_connectionLock);
  os_unfair_lock_assert_not_owner(&self->_monitorLock);
  connectionLock_connection = self->_connectionLock_connection;
  if (connectionLock_connection)
  {
    [(BSServiceConnection *)connectionLock_connection invalidate];
    v4 = self->_connectionLock_connection;
    self->_connectionLock_connection = 0;
  }
}

- (void)_connectionLock_createConnection
{
  os_unfair_lock_assert_owner(&self->_connectionLock);
  os_unfair_lock_assert_not_owner(&self->_monitorLock);
  id v3 = DNDRemoteServiceServerInterface();
  v4 = (void *)MEMORY[0x1E4F50BB8];
  id v5 = [v3 identifier];
  id v6 = [v4 endpointForMachName:@"com.apple.donotdisturb.service" service:v5 instance:0];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
    connectionLock_connection = self->_connectionLock_connection;
    self->_connectionLock_connection = v7;

    uint64_t v9 = self->_connectionLock_connection;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke;
    uint64_t v13 = &unk_1E5911850;
    id v14 = v3;
    uint64_t v15 = self;
    [(BSServiceConnection *)v9 configureConnection:&v10];
    [(BSServiceConnection *)self->_connectionLock_connection activate];
  }
}

uint64_t __44__DNDRemoteServiceConnection_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (DNDRemoteServiceConnection)init
{
  v18.receiver = self;
  v18.super_class = (Class)DNDRemoteServiceConnection;
  id v2 = [(DNDRemoteServiceConnection *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    assertionMonitorRequestDetails = v2->_assertionMonitorRequestDetails;
    v2->_assertionMonitorRequestDetails = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    stateMonitorRequestDetails = v2->_stateMonitorRequestDetails;
    v2->_stateMonitorRequestDetails = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    settingsMonitorRequestDetails = v2->_settingsMonitorRequestDetails;
    v2->_settingsMonitorRequestDetails = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    modeIdentifiersMonitorRequestDetails = v2->_modeIdentifiersMonitorRequestDetails;
    v2->_modeIdentifiersMonitorRequestDetails = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    globalConfigurationMonitorRequestDetails = v2->_globalConfigurationMonitorRequestDetails;
    v2->_globalConfigurationMonitorRequestDetails = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    meDeviceStateMonitorRequestDetails = v2->_meDeviceStateMonitorRequestDetails;
    v2->_meDeviceStateMonitorRequestDetails = (NSMutableArray *)v15;

    v2->_int64_t monitorState = 0;
    *(void *)&v2->_stateLock._os_unfair_lock_opaque = 0;
    v2->_monitorLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

uint64_t __77__DNDRemoteServiceConnection_queryStateWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was activated: connection=%p", (uint8_t *)&v4, 0xCu);
  }
}

- (void)registerForModeSelectionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t monitorState = self->_monitorState;
  [(NSMutableArray *)self->_modeIdentifiersMonitorRequestDetails addObject:v9];
  os_unfair_lock_unlock(&self->_stateLock);
  if (monitorState == 2)
  {
    int v8 = [(DNDRemoteServiceConnection *)self _monitorTarget];
    [v8 registerForModeSelectionUpdatesWithRequestDetails:v9 completionHandler:v6];
  }
  else
  {
    if (monitorState != 1)
    {
      if (monitorState) {
        goto LABEL_7;
      }
      os_unfair_lock_lock(&self->_monitorLock);
      [(DNDRemoteServiceConnection *)self _monitorLock_createMonitorConnection];
      os_unfair_lock_unlock(&self->_monitorLock);
    }
    (*((void (**)(id, void, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CC38], 0, 0);
  }
LABEL_7:
}

void __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke_266(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was interrupted: connection=%p", (uint8_t *)&v4, 0xCu);
  }
}

void __62__DNDRemoteServiceConnection__connectionLock_createConnection__block_invoke_269(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was invalidated, cannot recover: connection=%p", (uint8_t *)&v4, 0xCu);
  }
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_276(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([a2 BOOLValue] & 1) == 0)
  {
    uint64_t v6 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for assertion updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_279(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    if (!a3)
    {
      id v8 = v5;
      if (([*(id *)(*(void *)(a1 + 32) + 104) isEqual:v5] & 1) == 0)
      {
        uint64_t v6 = [[DNDStateUpdate alloc] initWithPreviousState:*(void *)(*(void *)(a1 + 32) + 104) state:v8 reason:4 source:1 options:1];
        [*(id *)(a1 + 32) deliverStateUpdate:v6];
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_2_282(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([a2 BOOLValue] & 1) == 0)
  {
    uint64_t v6 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for settings updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_283(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([a2 BOOLValue])
  {
    uint64_t v9 = *(void **)(a1 + 40);
    __int16 v10 = [*(id *)(a1 + 32) clientIdentifier];
    id v14 = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v9 deliverActiveModeAssertion:v7 stateUpdate:0 clientIdentifiers:v11];
  }
  else
  {
    uint64_t v12 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_19CC2C000, v12, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for available mode identifier updates on activation: requestDetails=%{public}@, error=%{public}@", buf, 0x16u);
    }
  }
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_286(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([a2 BOOLValue] & 1) == 0)
  {
    uint64_t v6 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for global configuration updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_287(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([a2 BOOLValue])
  {
    [*(id *)(a1 + 40) deliverMeDeviceState:v7];
  }
  else
  {
    uint64_t v9 = DNDLogRemoteConnection;
    if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "Remote service connection failed to register for 'Me Device' state updates on activation: requestDetails=%{public}@, error=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_289(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl(&dword_19CC2C000, v4, OS_LOG_TYPE_DEFAULT, "XPC monitor connection was interrupted, reactivating: connection=%p", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setMonitorState:1];

  [v3 activate];
}

void __66__DNDRemoteServiceConnection__monitorLock_createMonitorConnection__block_invoke_290(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl(&dword_19CC2C000, v4, OS_LOG_TYPE_DEFAULT, "XPC monitor connection was invalidated, cannot recover: connection=%p", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setMonitorState:0];
}

- (void)_monitorLock_invalidateMonitorConnection
{
  os_unfair_lock_assert_owner(&self->_monitorLock);
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  monitorLock_monitorService = self->_monitorLock_monitorService;
  if (monitorLock_monitorService)
  {
    [(BSServiceConnection *)monitorLock_monitorService invalidate];
    int v4 = self->_monitorLock_monitorService;
    self->_monitorLock_monitorService = 0;
  }
}

- (void)removeEventListener:(id)a3
{
  id v5 = a3;
  int v4 = self->_eventListeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_eventListeners removeObject:v5];
  objc_sync_exit(v4);
}

- (void)resolveBehaviorForEventDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__DNDRemoteServiceConnection_resolveBehaviorForEventDetails_requestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911CF8;
  id v14 = v8;
  id v12 = v8;
  [v11 resolveBehaviorForEventDetails:v10 requestDetails:v9 completionHandler:v13];
}

uint64_t __94__DNDRemoteServiceConnection_resolveBehaviorForEventDetails_requestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)takeModeAssertionWithDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__DNDRemoteServiceConnection_takeModeAssertionWithDetails_requestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911D20;
  id v14 = v8;
  id v12 = v8;
  [v11 takeModeAssertionWithDetails:v10 requestDetails:v9 completionHandler:v13];
}

uint64_t __92__DNDRemoteServiceConnection_takeModeAssertionWithDetails_requestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateActiveModeAssertionWithDetails:(id)a3 reasonOverride:(id)a4 requestDetails:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __119__DNDRemoteServiceConnection_invalidateActiveModeAssertionWithDetails_reasonOverride_requestDetails_completionHandler___block_invoke;
  v16[3] = &unk_1E5911D48;
  id v17 = v10;
  id v15 = v10;
  [v14 invalidateActiveModeAssertionWithDetails:v13 reasonOverride:v12 requestDetails:v11 completionHandler:v16];
}

uint64_t __119__DNDRemoteServiceConnection_invalidateActiveModeAssertionWithDetails_reasonOverride_requestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getActiveModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__DNDRemoteServiceConnection_getActiveModeAssertionWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911D20;
  id v11 = v6;
  id v9 = v6;
  [v8 getActiveModeAssertionWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __89__DNDRemoteServiceConnection_getActiveModeAssertionWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getLatestModeAssertionInvalidationWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__DNDRemoteServiceConnection_getLatestModeAssertionInvalidationWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911D48;
  id v11 = v6;
  id v9 = v6;
  [v8 getLatestModeAssertionInvalidationWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __101__DNDRemoteServiceConnection_getLatestModeAssertionInvalidationWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateAllActiveModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__DNDRemoteServiceConnection_invalidateAllActiveModeAssertionsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911D70;
  id v11 = v6;
  id v9 = v6;
  [v8 invalidateAllActiveModeAssertionsWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __100__DNDRemoteServiceConnection_invalidateAllActiveModeAssertionsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__DNDRemoteServiceConnection_getAllModeAssertionsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911D98;
  id v11 = v6;
  id v9 = v6;
  [v8 getAllModeAssertionsWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __87__DNDRemoteServiceConnection_getAllModeAssertionsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForAssertionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t monitorState = self->_monitorState;
  [(NSMutableArray *)self->_assertionMonitorRequestDetails addObject:v9];
  os_unfair_lock_unlock(&self->_stateLock);
  if (monitorState == 2)
  {
    id v8 = [(DNDRemoteServiceConnection *)self _monitorTarget];
    [v8 registerForAssertionUpdatesWithRequestDetails:v9 completionHandler:v6];
  }
  else
  {
    if (monitorState != 1)
    {
      if (monitorState) {
        goto LABEL_7;
      }
      os_unfair_lock_lock(&self->_monitorLock);
      [(DNDRemoteServiceConnection *)self _monitorLock_createMonitorConnection];
      os_unfair_lock_unlock(&self->_monitorLock);
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CC38], 0);
  }
LABEL_7:
}

- (void)deliverActiveModeAssertionUpdate:(id)a3 invalidation:(id)a4 clientIdentifiers:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v18 = a4;
  id v8 = a5;
  id v9 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v26 = v19;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    id v30 = v8;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "Remote service connection got assertion update: assertion=%{public}@, invalidation=%{public}@, clientIdentifiers=%{public}@", buf, 0x20u);
  }
  id obj = self->_eventListeners;
  objc_sync_enter(obj);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = self->_eventListeners;
  uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [v14 clientIdentifier];
          int v16 = [v8 containsObject:v15];

          if (v16) {
            [v14 remoteService:self didChangeActiveModeAssertion:v19 invalidation:v18];
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  objc_sync_exit(obj);
}

- (void)deliverStateUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 state];
  lastReceivedState = self->_lastReceivedState;
  self->_lastReceivedState = v5;

  id v7 = self->_eventListeners;
  objc_sync_enter(v7);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_eventListeners;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "remoteService:didReceiveDoNotDisturbStateUpdate:", self, v4, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)setScreenIsShared:(id)a3 screenIsMirrored:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  long long v14 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__DNDRemoteServiceConnection_setScreenIsShared_screenIsMirrored_withRequestDetails_completionHandler___block_invoke;
  v16[3] = &unk_1E5911D70;
  id v17 = v10;
  id v15 = v10;
  [v14 setScreenIsShared:v13 screenIsMirrored:v12 withRequestDetails:v11 completionHandler:v16];
}

uint64_t __102__DNDRemoteServiceConnection_setScreenIsShared_screenIsMirrored_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setHearingTestIsActive:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__DNDRemoteServiceConnection_setHearingTestIsActive_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911D70;
  id v14 = v8;
  id v12 = v8;
  [v11 setHearingTestIsActive:v10 withRequestDetails:v9 completionHandler:v13];
}

uint64_t __90__DNDRemoteServiceConnection_setHearingTestIsActive_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getBehaviorSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__DNDRemoteServiceConnection_getBehaviorSettingsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911DE8;
  id v11 = v6;
  id v9 = v6;
  [v8 getBehaviorSettingsWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __86__DNDRemoteServiceConnection_getBehaviorSettingsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setBehaviorSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__DNDRemoteServiceConnection_setBehaviorSettings_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911D70;
  id v14 = v8;
  id v12 = v8;
  [v11 setBehaviorSettings:v10 withRequestDetails:v9 completionHandler:v13];
}

uint64_t __87__DNDRemoteServiceConnection_setBehaviorSettings_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getScheduleSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__DNDRemoteServiceConnection_getScheduleSettingsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911E10;
  id v11 = v6;
  id v9 = v6;
  [v8 getScheduleSettingsWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __86__DNDRemoteServiceConnection_getScheduleSettingsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setScheduleSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__DNDRemoteServiceConnection_setScheduleSettings_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911D70;
  id v14 = v8;
  id v12 = v8;
  [v11 setScheduleSettings:v10 withRequestDetails:v9 completionHandler:v13];
}

uint64_t __87__DNDRemoteServiceConnection_setScheduleSettings_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForSettingsUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t monitorState = self->_monitorState;
  [(NSMutableArray *)self->_settingsMonitorRequestDetails addObject:v9];
  os_unfair_lock_unlock(&self->_stateLock);
  if (monitorState == 2)
  {
    id v8 = [(DNDRemoteServiceConnection *)self _monitorTarget];
    [v8 registerForSettingsUpdatesWithRequestDetails:v9 completionHandler:v6];
  }
  else
  {
    if (monitorState != 1)
    {
      if (monitorState) {
        goto LABEL_7;
      }
      os_unfair_lock_lock(&self->_monitorLock);
      [(DNDRemoteServiceConnection *)self _monitorLock_createMonitorConnection];
      os_unfair_lock_unlock(&self->_monitorLock);
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CC38], 0);
  }
LABEL_7:
}

- (void)syncModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__DNDRemoteServiceConnection_syncModeConfigurationsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911D70;
  id v11 = v6;
  id v9 = v6;
  [v8 syncModeConfigurationsWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __89__DNDRemoteServiceConnection_syncModeConfigurationsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCloudSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__DNDRemoteServiceConnection_getCloudSyncStateWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911D70;
  id v11 = v6;
  id v9 = v6;
  [v8 getCloudSyncStateWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __84__DNDRemoteServiceConnection_getCloudSyncStateWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCloudSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__DNDRemoteServiceConnection_setCloudSyncPreferenceEnabled_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911D70;
  id v14 = v8;
  id v12 = v8;
  [v11 setCloudSyncPreferenceEnabled:v10 withRequestDetails:v9 completionHandler:v13];
}

uint64_t __97__DNDRemoteServiceConnection_setCloudSyncPreferenceEnabled_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPairSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__DNDRemoteServiceConnection_getPairSyncStateWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911D70;
  id v11 = v6;
  id v9 = v6;
  [v8 getPairSyncStateWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __83__DNDRemoteServiceConnection_getPairSyncStateWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPairSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__DNDRemoteServiceConnection_setPairSyncPreferenceEnabled_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911D70;
  id v14 = v8;
  id v12 = v8;
  [v11 setPairSyncPreferenceEnabled:v10 withRequestDetails:v9 completionHandler:v13];
}

uint64_t __96__DNDRemoteServiceConnection_setPairSyncPreferenceEnabled_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAccountFeatureSupportWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__DNDRemoteServiceConnection_getAccountFeatureSupportWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911E38;
  id v11 = v6;
  id v9 = v6;
  [v8 getAccountFeatureSupportWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __91__DNDRemoteServiceConnection_getAccountFeatureSupportWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deliverUpdatedBehaviorSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_eventListeners;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_eventListeners;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "remoteService:didReceiveUpdatedBehaviorSettings:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)deliverUpdatedScheduleSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_eventListeners;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_eventListeners;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "remoteService:didReceiveUpdatedScheduleSettings:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)deliverUpdatedPairSyncState:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_eventListeners;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_eventListeners;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "remoteService:didReceiveUpdatedPairSyncState:", self, objc_msgSend(v4, "unsignedIntegerValue", (void)v11));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)deliverUpdatedPhoneCallBypassSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_eventListeners;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_eventListeners;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "remoteService:didReceiveUpdatedPhoneCallBypassSettings:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)deliverUpdatedPreventAutoReplySetting:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_eventListeners;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_eventListeners;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "remoteService:didReceiveUpdatedPreventAutoReplySetting:", self, objc_msgSend(v4, "BOOLValue", (void)v11));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)setModeConfiguration:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 setModeConfiguration:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)getAllModesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__DNDRemoteServiceConnection_getAllModesWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911E60;
  id v11 = v6;
  id v9 = v6;
  [v8 getAllModesWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __78__DNDRemoteServiceConnection_getAllModesWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAvailableModesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__DNDRemoteServiceConnection_getAvailableModesWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911E60;
  id v11 = v6;
  id v9 = v6;
  [v8 getAvailableModesWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __84__DNDRemoteServiceConnection_getAvailableModesWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v14 removeModeConfigurationForModeIdentifier:v13 deletePlaceholder:v12 withRequestDetails:v11 completionHandler:v10];
}

- (void)getModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__DNDRemoteServiceConnection_getModeConfigurationsWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911E88;
  id v11 = v6;
  id v9 = v6;
  [v8 getModeConfigurationsWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __88__DNDRemoteServiceConnection_getModeConfigurationsWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllowedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 getAllowedModesForContactHandle:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)getSilencedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 getSilencedModesForContactHandle:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)getUserAvailabilityInActiveModeForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 getUserAvailabilityInActiveModeForContactHandle:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)publishStatusKitAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v8 publishStatusKitAvailabilityWithRequestDetails:v7 completionHandler:v6];
}

- (void)getPreventAutoReplyWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v8 getPreventAutoReplyWithRequestDetails:v7 completionHandler:v6];
}

- (void)setPreventAutoReply:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 setPreventAutoReply:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)getModesCanImpactAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v8 getModesCanImpactAvailabilityWithRequestDetails:v7 completionHandler:v6];
}

- (void)setModesCanImpactAvailability:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 setModesCanImpactAvailability:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __126__DNDRemoteServiceConnection_didChangeFocusStatusSharingSettingForApplicationIdentifier_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911D70;
  id v14 = v8;
  id v12 = v8;
  [v11 didChangeFocusStatusSharingSettingForApplicationIdentifier:v10 withRequestDetails:v9 completionHandler:v13];
}

uint64_t __126__DNDRemoteServiceConnection_didChangeFocusStatusSharingSettingForApplicationIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStateDumpWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__DNDRemoteServiceConnection_getStateDumpWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911EB0;
  id v11 = v6;
  id v9 = v6;
  [v8 getStateDumpWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __79__DNDRemoteServiceConnection_getStateDumpWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForGlobalConfigurationUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t monitorState = self->_monitorState;
  [(NSMutableArray *)self->_globalConfigurationMonitorRequestDetails addObject:v9];
  os_unfair_lock_unlock(&self->_stateLock);
  if (monitorState == 2)
  {
    id v8 = [(DNDRemoteServiceConnection *)self _monitorTarget];
    [v8 registerForGlobalConfigurationUpdatesWithRequestDetails:v9 completionHandler:v6];
  }
  else
  {
    if (monitorState != 1)
    {
      if (monitorState) {
        goto LABEL_7;
      }
      os_unfair_lock_lock(&self->_monitorLock);
      [(DNDRemoteServiceConnection *)self _monitorLock_createMonitorConnection];
      os_unfair_lock_unlock(&self->_monitorLock);
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CC38], 0);
  }
LABEL_7:
}

- (void)deliverAllModes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id obj = self->_eventListeners;
  objc_sync_enter(obj);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_eventListeners;
  id v6 = 0;
  uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 remoteService:self didReceiveUpdatedModes:v4];
        }
        if (objc_opt_respondsToSelector())
        {
          if (!v6)
          {
            id v6 = objc_msgSend(v4, "bs_map:", &__block_literal_global_321);
          }
          [v10 remoteService:self didReceiveUpdatedModeIdentifiers:v6];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_sync_exit(obj);
}

uint64_t __46__DNDRemoteServiceConnection_deliverAllModes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 modeIdentifier];
}

- (void)deliverAvailableModes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id obj = self->_eventListeners;
  objc_sync_enter(obj);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_eventListeners;
  id v6 = 0;
  uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 remoteService:self didReceiveUpdatedAvailableModes:v4];
        }
        if (objc_opt_respondsToSelector())
        {
          if (!v6)
          {
            id v6 = objc_msgSend(v4, "bs_map:", &__block_literal_global_327);
          }
          [v10 remoteService:self didReceiveUpdatedAvailableModeIdentifiers:v6];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_sync_exit(obj);
}

uint64_t __52__DNDRemoteServiceConnection_deliverAvailableModes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 modeIdentifier];
}

- (void)deliverActiveModeAssertion:(id)a3 stateUpdate:(id)a4 clientIdentifiers:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v17 = a4;
  id v8 = a5;
  id obj = self->_eventListeners;
  objc_sync_enter(obj);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = self->_eventListeners;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          long long v14 = [v13 clientIdentifier];
          int v15 = [v8 containsObject:v14];

          if (v15) {
            [v13 remoteService:self didReceiveUpdatedActiveModeAssertion:v18 stateUpdate:v17];
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  objc_sync_exit(obj);
}

- (void)signalAppConfigurationContextUpdateForModeIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_eventListeners;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_eventListeners;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "remoteService:didReceiveAppConfigurationContextUpdateForModeIdentifier:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)activateModeWithDetails:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 activateModeWithDetails:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)activeModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__DNDRemoteServiceConnection_activeModeAssertionWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911D20;
  id v11 = v6;
  id v9 = v6;
  [v8 activeModeAssertionWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __86__DNDRemoteServiceConnection_activeModeAssertionWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateModeAssertionWithUUID:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 invalidateModeAssertionWithUUID:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)getAppInfoForBundleIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 getAppInfoForBundleIdentifier:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)getAppInfoForBundleIdentifiers:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  [v11 getAppInfoForBundleIdentifiers:v10 withRequestDetails:v9 completionHandler:v8];
}

- (void)deliverMeDeviceState:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_eventListeners;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_eventListeners;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "remoteService:didReceiveUpdatedMeDeviceState:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)queryMeDeviceStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__DNDRemoteServiceConnection_queryMeDeviceStateWithRequestDetails_completionHandler___block_invoke;
  v10[3] = &unk_1E5911EF8;
  id v11 = v6;
  id v9 = v6;
  [v8 queryMeDeviceStateWithRequestDetails:v7 completionHandler:v10];
}

uint64_t __85__DNDRemoteServiceConnection_queryMeDeviceStateWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForMeDeviceStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t monitorState = self->_monitorState;
  [(NSMutableArray *)self->_meDeviceStateMonitorRequestDetails addObject:v9];
  os_unfair_lock_unlock(&self->_stateLock);
  if (monitorState == 2)
  {
    uint64_t v8 = [(DNDRemoteServiceConnection *)self _monitorTarget];
    [v8 registerForMeDeviceStateUpdatesWithRequestDetails:v9 completionHandler:v6];
  }
  else
  {
    if (monitorState != 1)
    {
      if (monitorState) {
        goto LABEL_7;
      }
      os_unfair_lock_lock(&self->_monitorLock);
      [(DNDRemoteServiceConnection *)self _monitorLock_createMonitorConnection];
      os_unfair_lock_unlock(&self->_monitorLock);
    }
    (*((void (**)(id, void, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CC38], 0, 0);
  }
LABEL_7:
}

- (void)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    long long v20 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __156__DNDRemoteServiceConnection_setAppConfigurationPredicate_forActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v24[3] = &unk_1E5911D70;
    id v25 = v19;
    [v20 setAppConfigurationPredicate:v14 forActionIdentifier:v15 forApplicationIdentifier:v16 modeIdentifier:v17 withRequestDetails:v18 completionHandler:v24];

    long long v21 = v25;
  }
  else
  {
    long long v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"DNDAppConfigurationService is only supported when linking LinkServices";
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    long long v23 = [v22 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v21];
    (*((void (**)(id, void, void *))v19 + 2))(v19, MEMORY[0x1E4F1CC28], v23);
  }
}

void __156__DNDRemoteServiceConnection_setAppConfigurationPredicate_forActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Failed to set predicate.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = [v8 errorWithDomain:@"DNDErrorDomain" code:1008 userInfo:v9];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAppConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    id v17 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __155__DNDRemoteServiceConnection_getAppConfigurationPredicateForActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E5911F20;
    id v22 = v16;
    [v17 getAppConfigurationPredicateForActionIdentifier:v12 forApplicationIdentifier:v13 modeIdentifier:v14 withRequestDetails:v15 completionHandler:v21];

    id v18 = v22;
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"DNDAppConfigurationService is only supported when linking LinkServices";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    long long v20 = [v19 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v18];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v20);
  }
}

uint64_t __155__DNDRemoteServiceConnection_getAppConfigurationPredicateForActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  long long v20 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __176__DNDRemoteServiceConnection_setAppConfigurationTargetContentIdentifierPrefix_forActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
  v22[3] = &unk_1E5911D70;
  id v23 = v14;
  id v21 = v14;
  [v20 setAppConfigurationTargetContentIdentifierPrefix:v19 forActionIdentifier:v18 forApplicationIdentifier:v17 modeIdentifier:v16 withRequestDetails:v15 completionHandler:v22];
}

void __176__DNDRemoteServiceConnection_setAppConfigurationTargetContentIdentifierPrefix_forActionIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Failed to set target content identifier prefix.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = [v8 errorWithDomain:@"DNDErrorDomain" code:1008 userInfo:v9];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __135__DNDRemoteServiceConnection_getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
  v13[3] = &unk_1E5911F48;
  id v14 = v8;
  id v12 = v8;
  [v11 getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:v10 withRequestDetails:v9 completionHandler:v13];
}

uint64_t __135__DNDRemoteServiceConnection_getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAppConfigurationAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    id v17 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __133__DNDRemoteServiceConnection_setAppConfigurationAction_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E5911D70;
    id v22 = v16;
    [v17 setAppConfigurationAction:v12 forApplicationIdentifier:v13 modeIdentifier:v14 withRequestDetails:v15 completionHandler:v21];

    id v18 = v22;
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"DNDAppConfigurationService is only supported when linking LinkServices";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    long long v20 = [v19 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v18];
    (*((void (**)(id, void, void *))v16 + 2))(v16, MEMORY[0x1E4F1CC28], v20);
  }
}

uint64_t __133__DNDRemoteServiceConnection_setAppConfigurationAction_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearAppConfigurationActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    id v17 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __149__DNDRemoteServiceConnection_clearAppConfigurationActionWithIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E5911D70;
    id v22 = v16;
    [v17 clearAppConfigurationActionWithIdentifier:v12 forApplicationIdentifier:v13 modeIdentifier:v14 withRequestDetails:v15 completionHandler:v21];

    id v18 = v22;
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"DNDAppConfigurationService is only supported when linking LinkServices";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    long long v20 = [v19 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v18];
    (*((void (**)(id, void, void *))v16 + 2))(v16, MEMORY[0x1E4F1CC28], v20);
  }
}

uint64_t __149__DNDRemoteServiceConnection_clearAppConfigurationActionWithIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAppConfigurationActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    uint64_t v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __111__DNDRemoteServiceConnection_getAppConfigurationActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E5911F70;
    id v16 = v10;
    [v11 getAppConfigurationActionsForModeIdentifier:v8 withRequestDetails:v9 completionHandler:v15];

    id v12 = v16;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"DNDAppConfigurationService is only supported when linking LinkServices";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v14 = [v13 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v12];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

uint64_t __111__DNDRemoteServiceConnection_getAppConfigurationActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    uint64_t v17 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __120__DNDRemoteServiceConnection_setAppAction_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E5911D70;
    id v22 = v16;
    [v17 setAppAction:v12 forApplicationIdentifier:v13 modeIdentifier:v14 withRequestDetails:v15 completionHandler:v21];

    id v18 = v22;
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"DNDAppConfigurationService is only supported when linking LinkServices";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    long long v20 = [v19 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v18];
    (*((void (**)(id, void, void *))v16 + 2))(v16, MEMORY[0x1E4F1CC28], v20);
  }
}

void __120__DNDRemoteServiceConnection_setAppAction_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Failed to save action.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = [v8 errorWithDomain:@"DNDErrorDomain" code:1008 userInfo:v9];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAppActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    uint64_t v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__DNDRemoteServiceConnection_getAppActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E5911F70;
    id v16 = v10;
    [v11 getAppActionsForModeIdentifier:v8 withRequestDetails:v9 completionHandler:v15];

    id v12 = v16;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"DNDAppConfigurationService is only supported when linking LinkServices";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v14 = [v13 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v12];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

uint64_t __98__DNDRemoteServiceConnection_getAppActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    uint64_t v17 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __136__DNDRemoteServiceConnection_clearAppActionWithIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v21[3] = &unk_1E5911D70;
    id v22 = v16;
    [v17 clearAppActionWithIdentifier:v12 forApplicationIdentifier:v13 modeIdentifier:v14 withRequestDetails:v15 completionHandler:v21];

    id v18 = v22;
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"DNDAppConfigurationService is only supported when linking LinkServices";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    long long v20 = [v19 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v18];
    (*((void (**)(id, void, void *))v16 + 2))(v16, MEMORY[0x1E4F1CC28], v20);
  }
}

uint64_t __136__DNDRemoteServiceConnection_clearAppActionWithIdentifier_forApplicationIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSystemAction:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (NSClassFromString(&cfstr_Wftogglesettin.isa))
  {
    id v14 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __101__DNDRemoteServiceConnection_setSystemAction_forModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v18[3] = &unk_1E5911D70;
    id v19 = v13;
    [v14 setSystemAction:v10 forModeIdentifier:v11 withRequestDetails:v12 completionHandler:v18];

    id v15 = v19;
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"DNDAppConfigurationService is only supported when linking VoiceShortcutClient";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v17 = [v16 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v15];
    (*((void (**)(id, void, void *))v13 + 2))(v13, MEMORY[0x1E4F1CC28], v17);
  }
}

void __101__DNDRemoteServiceConnection_setSystemAction_forModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Failed to save action.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = [v8 errorWithDomain:@"DNDErrorDomain" code:1008 userInfo:v9];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (NSClassFromString(&cfstr_Wftogglesettin.isa))
  {
    id v14 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __117__DNDRemoteServiceConnection_clearSystemActionWithIdentifier_forModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v18[3] = &unk_1E5911D70;
    id v19 = v13;
    [v14 clearSystemActionWithIdentifier:v10 forModeIdentifier:v11 withRequestDetails:v12 completionHandler:v18];

    id v15 = v19;
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"DNDAppConfigurationService is only supported when linking VoiceShortcutClient";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v17 = [v16 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v15];
    (*((void (**)(id, void, void *))v13 + 2))(v13, MEMORY[0x1E4F1CC28], v17);
  }
}

uint64_t __117__DNDRemoteServiceConnection_clearSystemActionWithIdentifier_forModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSystemActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (NSClassFromString(&cfstr_Wftogglesettin.isa))
  {
    id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __101__DNDRemoteServiceConnection_getSystemActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E5911F98;
    id v16 = v10;
    [v11 getSystemActionsForModeIdentifier:v8 withRequestDetails:v9 completionHandler:v15];

    id v12 = v16;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"DNDAppConfigurationService is only supported when linking VoiceShortcutClient";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v14 = [v13 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v12];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

uint64_t __101__DNDRemoteServiceConnection_getSystemActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSystemConfigurationAction:(id)a3 modeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (NSClassFromString(&cfstr_Wftogglesettin.isa))
  {
    id v14 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __111__DNDRemoteServiceConnection_setSystemConfigurationAction_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v18[3] = &unk_1E5911D70;
    id v19 = v13;
    [v14 setSystemConfigurationAction:v10 modeIdentifier:v11 withRequestDetails:v12 completionHandler:v18];

    id v15 = v19;
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"DNDAppConfigurationService is only supported when linking VoiceShortcutClient";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v17 = [v16 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v15];
    (*((void (**)(id, void, void *))v13 + 2))(v13, MEMORY[0x1E4F1CC28], v17);
  }
}

uint64_t __111__DNDRemoteServiceConnection_setSystemConfigurationAction_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearSystemConfigurationActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (NSClassFromString(&cfstr_Wftogglesettin.isa))
  {
    id v14 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __127__DNDRemoteServiceConnection_clearSystemConfigurationActionWithIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v18[3] = &unk_1E5911D70;
    id v19 = v13;
    [v14 clearSystemConfigurationActionWithIdentifier:v10 modeIdentifier:v11 withRequestDetails:v12 completionHandler:v18];

    id v15 = v19;
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"DNDAppConfigurationService is only supported when linking VoiceShortcutClient";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v17 = [v16 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v15];
    (*((void (**)(id, void, void *))v13 + 2))(v13, MEMORY[0x1E4F1CC28], v17);
  }
}

uint64_t __127__DNDRemoteServiceConnection_clearSystemConfigurationActionWithIdentifier_modeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSystemConfigurationActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (NSClassFromString(&cfstr_Wftogglesettin.isa))
  {
    id v11 = [(DNDRemoteServiceConnection *)self _remoteTarget];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __114__DNDRemoteServiceConnection_getSystemConfigurationActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E5911FC0;
    id v16 = v10;
    [v11 getSystemConfigurationActionsForModeIdentifier:v8 withRequestDetails:v9 completionHandler:v15];

    id v12 = v16;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"DNDAppConfigurationService is only supported when linking VoiceShortcutClient";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v14 = [v13 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v12];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

uint64_t __114__DNDRemoteServiceConnection_getSystemConfigurationActionsForModeIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedState, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
  objc_storeStrong((id *)&self->_meDeviceStateMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_globalConfigurationMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_modeIdentifiersMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_settingsMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_stateMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_assertionMonitorRequestDetails, 0);
  objc_storeStrong((id *)&self->_connectionLock_connection, 0);
  objc_storeStrong((id *)&self->_monitorLock_monitorService, 0);
}

@end