@interface DNDSServer
- (BOOL)_setDefaultScheduleTriggerWithScheduleSettings:(id)a3;
- (BOOL)_setDimsLockScreenSetting:(unint64_t)a3 forModeConfigurationWithIdentifier:(id)a4;
- (BOOL)_setLostModeState:(unint64_t)a3 error:(id *)a4;
- (BOOL)_setScheduleTrigger:(id)a3 forModeConfigurationWithIdentifier:(id)a4;
- (BOOL)eventBehaviorResolver:(id)a3 isAvailabilityActiveForBundleIdentifier:(id)a4;
- (BOOL)isCloudSyncDisabledForSyncManager:(id)a3;
- (BOOL)layoutIsLocked:(id)a3;
- (BOOL)remoteAppConfigurationServiceProvider:(id)a3 invalidateAppContextForActionIdentifier:(id)a4 bundleIdentifier:(id)a5 withError:(id *)a6;
- (BOOL)remoteAvailabilityServiceProvider:(id)a3 isLocalUserAvailableForApplicationIdentifier:(id)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 clearAppActionWithIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7;
- (BOOL)remoteServiceProvider:(id)a3 clearSystemActionWithIdentifier:(id)a4 forModeIdentifier:(id)a5 withError:(id *)a6;
- (BOOL)remoteServiceProvider:(id)a3 clearSystemConfigurationActionWithIdentifier:(id)a4 modeIdentifier:(id)a5 withError:(id *)a6;
- (BOOL)remoteServiceProvider:(id)a3 getModesCanImpactAvailabilityReturningError:(id *)a4;
- (BOOL)remoteServiceProvider:(id)a3 getPreventAutoReplyReturningError:(id *)a4;
- (BOOL)remoteServiceProvider:(id)a3 handleHearingTestEvent:(id)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 removeModeConfigurationWithModeIdentifier:(id)a4 deletePlaceholder:(BOOL)a5 withError:(id *)a6;
- (BOOL)remoteServiceProvider:(id)a3 setAppAction:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7;
- (BOOL)remoteServiceProvider:(id)a3 setAppConfigurationPredicate:(id)a4 forActionIdentifier:(id)a5 forApplicationIdentifier:(id)a6 modeIdentifier:(id)a7 withError:(id *)a8;
- (BOOL)remoteServiceProvider:(id)a3 setAppConfigurationTargetContentIdentifierPrefix:(id)a4 forActionIdentifier:(id)a5 forApplicationIdentifier:(id)a6 modeIdentifier:(id)a7 withError:(id *)a8;
- (BOOL)remoteServiceProvider:(id)a3 setBehaviorSettings:(id)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 setCloudSyncPreferenceEnabled:(BOOL)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 setModeConfiguration:(id)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 setModesCanImpactAvailability:(BOOL)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 setPairSyncPreferenceEnabled:(BOOL)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 setPreventAutoReply:(BOOL)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 setScheduleSettings:(id)a4 withError:(id *)a5;
- (BOOL)remoteServiceProvider:(id)a3 setScreenIsShared:(BOOL)a4 screenIsMirrored:(BOOL)a5 withError:(id *)a6;
- (BOOL)remoteServiceProvider:(id)a3 setSystemAction:(id)a4 forModeIdentifier:(id)a5 withError:(id *)a6;
- (BOOL)remoteServiceProvider:(id)a3 syncModeConfigurationsReturningError:(id *)a4;
- (BOOL)remoteServiceProvider:(id)a3 userAvailabilityInActiveModeForContactHandle:(id)a4 withError:(id *)a5;
- (BOOL)setUILockState:(unint64_t)a3 error:(id *)a4;
- (DNDSServer)init;
- (id)_activeDateIntervalForModeAssertion:(id)a3 currentlyActive:(BOOL)a4;
- (id)_allModes;
- (id)_createDefaultModeForWorkoutTriggerIfNecessary;
- (id)_invalidateModeAssertionForClientIdentifier:(id)a3 reason:(unint64_t)a4 reasonOverride:(unint64_t)a5 details:(id)a6 error:(id *)a7;
- (id)_scheduleSettingsForModeConfigurations;
- (id)_scheduleSettingsFromDefaultScheduleTrigger;
- (id)_scheduleSettingsMatchingTrigger:(id)a3;
- (id)_scheduleTriggerMatchingSettings:(id)a3;
- (id)_stateSystemSnapshot;
- (id)_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:(id)a3 error:(id *)a4;
- (id)appForegroundTriggerConfigurationForAppForegroundTriggerManager:(id)a3;
- (id)currentStateForAppFocusConfigurationCoordinator:(id)a3;
- (id)currentStateForEventBehaviorResolver:(id)a3;
- (id)currentStateForLegacyAssertionSyncManager:(id)a3;
- (id)currentStateForSystemFocusConfigurationCoordinator:(id)a3;
- (id)currentlyActivePairedDeviceForSyncManager:(id)a3;
- (id)drivingModeForDrivingTriggerManager:(id)a3;
- (id)eventBehaviorResolver:(id)a3 appPredicateForApplicationIdentifier:(id)a4 modeIdentifier:(id)a5;
- (id)eventBehaviorResolver:(id)a3 bypassSettingsForClientIdentifier:(id)a4;
- (id)eventBehaviorResolver:(id)a3 configurationForModeIdentifier:(id)a4;
- (id)gamingModeForGamingTriggerManager:(id)a3;
- (id)hearingTestModeForHearingTestTriggerManager:(id)a3;
- (id)lifetimeMonitor:(id)a3 modeAssertionsWithLifetimeClass:(Class)a4;
- (id)lifetimeMonitor:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6;
- (id)locationTriggerConfigurationForLifetimeMonitor:(id)a3;
- (id)mindfulnessModeForMindfulnessTriggerManager:(id)a3;
- (id)modesSupportingSmartEntryForSmartTriggerManager:(id)a3;
- (id)pairedCloudDevicesForSyncManager:(id)a3;
- (id)pairedDevicesForSyncManager:(id)a3;
- (id)phoneCallBypassSettingsForSyncManager:(id)a3;
- (id)remoteAppConfigurationServiceProvider:(id)a3 getCurrentAppConfigurationForActionIdentifier:(id)a4 bundleIdentifier:(id)a5 withError:(id *)a6;
- (id)remoteServiceProvider:(id)a3 activeAssertionWithClientIdentifer:(id)a4 error:(id *)a5;
- (id)remoteServiceProvider:(id)a3 allActiveModeAssertionsWithError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 allModesReturningError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 allowedModesForContactHandle:(id)a4 withError:(id *)a5;
- (id)remoteServiceProvider:(id)a3 assertionWithClientIdentifer:(id)a4 error:(id *)a5;
- (id)remoteServiceProvider:(id)a3 availableModesReturningError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 behaviorSettingsWithError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 currentMeDeviceStateWithError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 currentStateWithError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 getAccountFeatureSupportWithError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 getAppActionsForModeIdentifier:(id)a4 withError:(id *)a5;
- (id)remoteServiceProvider:(id)a3 getAppConfigurationPredicateForActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7;
- (id)remoteServiceProvider:(id)a3 getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a4 withError:(id *)a5;
- (id)remoteServiceProvider:(id)a3 getAppInfoForBundleIdentifier:(id)a4 withError:(id *)a5;
- (id)remoteServiceProvider:(id)a3 getAppInfoForBundleIdentifiers:(id)a4 withError:(id *)a5;
- (id)remoteServiceProvider:(id)a3 getSystemActionsForModeIdentifier:(id)a4 withError:(id *)a5;
- (id)remoteServiceProvider:(id)a3 invalidateAllModeAssertionsTakenBeforeDate:(id)a4 forReason:(unint64_t)a5 clientIdentifier:(id)a6 error:(id *)a7;
- (id)remoteServiceProvider:(id)a3 invalidateModeAssertionForClientIdentifier:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 details:(id)a7 error:(id *)a8;
- (id)remoteServiceProvider:(id)a3 invalidateModeAssertionWithUUID:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 clientIdentifier:(id)a7 error:(id *)a8;
- (id)remoteServiceProvider:(id)a3 latestInvalidationWithClientIdentifer:(id)a4 error:(id *)a5;
- (id)remoteServiceProvider:(id)a3 modeConfigurationForModeIdentifier:(id)a4 withError:(id *)a5;
- (id)remoteServiceProvider:(id)a3 modeConfigurationsWithError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 publishStatusKitAvailabilityReturningError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 resolveBehaviorForEventDetails:(id)a4 clientDetails:(id)a5 date:(id)a6 error:(id *)a7;
- (id)remoteServiceProvider:(id)a3 scheduleSettingsWithError:(id *)a4;
- (id)remoteServiceProvider:(id)a3 silencedModesForContactHandle:(id)a4 withError:(id *)a5;
- (id)remoteServiceProvider:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6;
- (id)scheduleSettingsForSyncManager:(id)a3;
- (id)sleepingModeForSleepingTriggerManager:(id)a3;
- (id)syncManager:(id)a3 deviceForDeviceIdentifier:(id)a4;
- (id)syncManager:(id)a3 scheduleSettingsForModeIdentifier:(id)a4;
- (id)syncManager:(id)a3 updateOutboundModeAssertion:(id)a4;
- (id)triggerManager:(id)a3 assertionsWithClientIdentifer:(id)a4 error:(id *)a5;
- (id)triggerManager:(id)a3 invalidateModeAssertionWithUUID:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 clientIdentifier:(id)a7 error:(id *)a8;
- (id)triggerManager:(id)a3 latestInvalidationWithClientIdentifer:(id)a4 error:(id *)a5;
- (id)triggerManager:(id)a3 performModeAssertionUpdatesWithHandler:(id)a4;
- (id)triggerManager:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6;
- (id)workoutModeForWorkoutTriggerManager:(id)a3;
- (unint64_t)lockState;
- (unint64_t)lostModeState;
- (unint64_t)remoteServiceProvider:(id)a3 getCloudSyncStateReturningError:(id *)a4;
- (unint64_t)remoteServiceProvider:(id)a3 getPairSyncStateReturningError:(id *)a4;
- (void)_forceConfigurationSyncIfNeededWithUpdateResult:(id)a3;
- (void)_handleSignificantTimeChange;
- (void)_migrateBypassSettingsIfNeeded;
- (void)_migrateDefaultDoNotDisturbModeIfNeeded;
- (void)_migrateReduceInterruptionsIfNeeded;
- (void)_queue_handlePairedDeviceAndSyncSettingsChange;
- (void)_queue_resume;
- (void)_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:(unint64_t)a3 source:(int64_t)a4;
- (void)_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:(unint64_t)a3 source:(int64_t)a4 options:(int64_t)a5;
- (void)_queue_validateIDSSyncEngine;
- (void)activeAssertionsDidChangeForLifetimeMonitor:(id)a3;
- (void)appFocusConfigurationCoordinator:(id)a3 didUpdateAppConfigurationContextForModeIdentifier:(id)a4;
- (void)globalConfigurationManager:(id)a3 didUpdateModesCanImpactAvailabilitySetting:(BOOL)a4;
- (void)globalConfigurationManager:(id)a3 didUpdatePhoneCallBypassSettings:(id)a4;
- (void)globalConfigurationManager:(id)a3 didUpdatePreventAutoReplySetting:(BOOL)a4;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)lifetimeMonitor:(id)a3 lifetimeDidExpireForAssertionUUIDs:(id)a4 expirationDate:(id)a5;
- (void)lifetimeMonitor:(id)a3 registerTimerHandlerWithServiceIdentifier:(id)a4 handler:(id)a5;
- (void)lifetimeMonitor:(id)a3 setTimer:(id)a4;
- (void)meDeviceService:(id)a3 didReceiveMeDeviceStateUpdate:(id)a4;
- (void)modeConfigurationManager:(id)a3 didModifyAvailableMode:(id)a4;
- (void)modeConfigurationManager:(id)a3 didModifyExceptionsForContacts:(id)a4 forModeConfiguration:(id)a5;
- (void)modeConfigurationManager:(id)a3 didUpdateAvailableModes:(id)a4;
- (void)pairedDeviceStateMonitor:(id)a3 cloudPairingChangedFromDevices:(id)a4 toDevices:(id)a5;
- (void)pairedDeviceStateMonitor:(id)a3 pairingChangedFromDevice:(id)a4 toDevice:(id)a5;
- (void)reachabilityChangedTo:(BOOL)a3;
- (void)remoteServiceProvider:(id)a3 didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a4;
- (void)resume;
- (void)setLockState:(unint64_t)a3;
- (void)setLostModeState:(unint64_t)a3;
- (void)setWorkoutTriggerEnabled:(BOOL)a3 forWorkoutTriggerManager:(id)a4;
- (void)settingsManager:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4;
- (void)settingsManager:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4;
- (void)settingsManager:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4;
- (void)settingsManager:(id)a3 didReceiveUpdatedSyncSettings:(id)a4;
- (void)syncManager:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4;
- (void)syncManager:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4;
- (void)syncManager:(id)a3 performModeAssertionUpdatesWithHandler:(id)a4;
- (void)syncManager:(id)a3 prepareForSyncToDevices:(id)a4;
@end

@implementation DNDSServer

- (BOOL)setUILockState:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

uint64_t __58__DNDSServer_remoteServiceProvider_currentStateWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 168) lastCalculatedState];
  return MEMORY[0x1F41817F8]();
}

- (id)remoteAppConfigurationServiceProvider:(id)a3 getCurrentAppConfigurationForActionIdentifier:(id)a4 bundleIdentifier:(id)a5 withError:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v10 = (__CFString *)a5;
  v11 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  v12 = [v11 activeModeIdentifier];

  if (!v12)
  {
    id v16 = 0;
LABEL_11:
    v20 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v10;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "No enabled action for %@ in active mode %@", buf, 0x16u);
    }
    if (a6 && v16)
    {
      id v16 = v16;
      v17 = 0;
      *a6 = v16;
    }
    else
    {
      if (a6)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F5F528];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v27 = @"No current action is available. Supply the caller with the default.";
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        *a6 = [v21 errorWithDomain:v22 code:1007 userInfo:v23];
      }
      v17 = 0;
    }
    goto LABEL_19;
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v10];
  appConfigurationManager = self->_appConfigurationManager;
  id v25 = 0;
  v15 = [(DNDSAppConfigurationManager *)appConfigurationManager appActionForActionIdentifier:v9 applicationIdentifier:v13 modeIdentifier:v12 error:&v25];
  id v16 = v25;
  v17 = 0;
  if ([v15 isEnabled])
  {
    v17 = [v15 action];
  }
  v18 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v19 = @"Found";
    *(_DWORD *)buf = 138412802;
    if (!v17) {
      v19 = @"No";
    }
    v29 = v19;
    __int16 v30 = 2112;
    v31 = v10;
    __int16 v32 = 2112;
    v33 = v12;
    _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "%@ action for '%@' in active mode %@", buf, 0x20u);
  }

  if (!v17) {
    goto LABEL_11;
  }
LABEL_19:

  return v17;
}

- (id)remoteServiceProvider:(id)a3 currentStateWithError:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__DNDSServer_remoteServiceProvider_currentStateWithError___block_invoke;
  v7[3] = &unk_1E6973518;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __18__DNDSServer_init__block_invoke_128(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_msgSend(v1, "layoutIsLocked:") ^ 1;
  return [v1 setUILockState:v2 error:0];
}

- (BOOL)layoutIsLocked:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a3, "elements", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = *MEMORY[0x1E4F625B0];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        char v10 = [v9 isEqualToString:v7];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)remoteServiceProvider:(id)a3 modeConfigurationForModeIdentifier:(id)a4 withError:(id *)a5
{
  return [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationForModeIdentifier:a4 withError:a5];
}

- (id)triggerManager:(id)a3 performModeAssertionUpdatesWithHandler:(id)a4
{
  return [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:a4 error:0];
}

- (id)triggerManager:(id)a3 assertionsWithClientIdentifer:(id)a4 error:(id *)a5
{
  uint64_t v6 = [(DNDSClientDetailsProvider *)self->_clientDetailsProvider clientDetailsForIdentifier:a4];
  uint64_t v7 = (void *)MEMORY[0x1E4F5F600];
  uint64_t v8 = [v6 identifiers];
  id v9 = [v7 predicateForModeAssertionsWithClientIdentifiers:v8];

  char v10 = [(DNDSModeAssertionManager *)self->_modeAssertionManager modeAssertionsMatchingPredicate:v9];

  return v10;
}

- (id)triggerManager:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __114__DNDSServer_DNDSAutomationManagerDataSource__triggerManager_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke;
  v24 = &unk_1E6973798;
  id v25 = v10;
  id v26 = v9;
  id v11 = v9;
  id v12 = v10;
  long long v13 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:&v21 error:a6];
  long long v14 = objc_msgSend(v13, "assertions", v21, v22, v23, v24);
  long long v15 = [v14 firstObject];

  clientDetailsProvider = self->_clientDetailsProvider;
  v17 = [v15 source];
  uint64_t v18 = [v17 clientIdentifier];
  v19 = [(DNDSClientDetailsProvider *)clientDetailsProvider clientDetailsForIdentifier:v18];

  [(DNDSMetricsManager *)self->_metricsManager assertionTaken:v15 withClientDetails:v19 lockState:[(DNDSServer *)self lockState]];
  return v15;
}

uint64_t __114__DNDSServer_DNDSAutomationManagerDataSource__triggerManager_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:*(void *)(a1 + 32) deviceIdentifier:0];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = (id)[v3 takeAssertionWithDetails:v5 source:v4 startDate:v6];

  return 1;
}

- (id)triggerManager:(id)a3 invalidateModeAssertionWithUUID:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 clientIdentifier:(id)a7 error:(id *)a8
{
  id v13 = a4;
  id v14 = a7;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __139__DNDSServer_DNDSAutomationManagerDataSource__triggerManager_invalidateModeAssertionWithUUID_reason_reasonOverride_clientIdentifier_error___block_invoke;
  v24 = &unk_1E69737C0;
  id v25 = v13;
  id v26 = v14;
  unint64_t v27 = a5;
  unint64_t v28 = a6;
  id v15 = v14;
  id v16 = v13;
  v17 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:&v21 error:a8];
  uint64_t v18 = objc_msgSend(v17, "invalidations", v21, v22, v23, v24);
  v19 = [v18 firstObject];

  return v19;
}

uint64_t __139__DNDSServer_DNDSAutomationManagerDataSource__triggerManager_invalidateModeAssertionWithUUID_reason_reasonOverride_clientIdentifier_error___block_invoke(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v11[0] = a1[4];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v5 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:v4];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:a1[5] deviceIdentifier:0];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v5 requestDate:v7 details:0 source:v6 reason:a1[6] reasonOverride:a1[7]];

  id v9 = (id)[v3 invalidateAssertionsForRequest:v8];
  return 1;
}

- (id)triggerManager:(id)a3 latestInvalidationWithClientIdentifer:(id)a4 error:(id *)a5
{
  uint64_t v6 = [(DNDSClientDetailsProvider *)self->_clientDetailsProvider clientDetailsForIdentifier:a4];
  id v7 = (void *)MEMORY[0x1E4F5F630];
  uint64_t v8 = [v6 identifiers];
  id v9 = [v7 predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:v8];

  id v10 = [(DNDSModeAssertionManager *)self->_modeAssertionManager modeAssertionInvalidationsMatchingPredicate:v9];
  id v11 = [v10 firstObject];

  return v11;
}

- (id)appForegroundTriggerConfigurationForAppForegroundTriggerManager:(id)a3
{
  uint64_t v4 = objc_alloc_init(DNDSAppForegroundTriggerConfiguration);
  uint64_t v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __121__DNDSServer_DNDSAppForegroundTriggerManagerDataSource__appForegroundTriggerConfigurationForAppForegroundTriggerManager___block_invoke;
  v8[3] = &unk_1E6975218;
  uint64_t v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __121__DNDSServer_DNDSAppForegroundTriggerManagerDataSource__appForegroundTriggerConfigurationForAppForegroundTriggerManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(a3, "triggers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 isEnabled])
        {
          id v12 = *(void **)(a1 + 32);
          id v13 = [v11 bundleIdentifier];
          [v12 addTriggerForModeWithIdentifier:v5 onForegroundOfApp:v13];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)drivingModeForDrivingTriggerManager:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  id v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__DNDSServer_DNDSDrivingTriggerManagerDataSource__drivingModeForDrivingTriggerManager___block_invoke;
  v8[3] = &unk_1E6975240;
  void v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __87__DNDSServer_DNDSDrivingTriggerManagerDataSource__drivingModeForDrivingTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v6, "triggers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 isEnabled])
          {
            uint64_t v13 = [v6 mode];
            uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
            long long v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;
          }
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (id)gamingModeForGamingTriggerManager:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  uint64_t v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__DNDSServer_DNDSGamingTriggerManagerDataSource__gamingModeForGamingTriggerManager___block_invoke;
  v8[3] = &unk_1E6975240;
  void v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __84__DNDSServer_DNDSGamingTriggerManagerDataSource__gamingModeForGamingTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v6, "triggers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 isEnabled])
          {
            uint64_t v13 = [v6 mode];
            uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
            long long v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;
          }
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (id)hearingTestModeForHearingTestTriggerManager:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  uint64_t v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__DNDSServer_DNDSHearingTestTriggerManagerDataSource__hearingTestModeForHearingTestTriggerManager___block_invoke;
  v8[3] = &unk_1E6975240;
  void v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __99__DNDSServer_DNDSHearingTestTriggerManagerDataSource__hearingTestModeForHearingTestTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  id v6 = [v11 mode];
  uint64_t v7 = [v6 semanticType];

  if (!v7)
  {
    uint64_t v8 = [v11 mode];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (id)mindfulnessModeForMindfulnessTriggerManager:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  uint64_t v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__DNDSServer_DNDSMindfulnessTriggerManagerDataSource__mindfulnessModeForMindfulnessTriggerManager___block_invoke;
  v8[3] = &unk_1E6975240;
  void v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __99__DNDSServer_DNDSMindfulnessTriggerManagerDataSource__mindfulnessModeForMindfulnessTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v6, "triggers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 isEnabled])
          {
            uint64_t v13 = [v6 mode];
            uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
            long long v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;
          }
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (id)sleepingModeForSleepingTriggerManager:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  uint64_t v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__DNDSServer_DNDSSleepingTriggerManagerDataSource__sleepingModeForSleepingTriggerManager___block_invoke;
  v8[3] = &unk_1E6975240;
  void v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __90__DNDSServer_DNDSSleepingTriggerManagerDataSource__sleepingModeForSleepingTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v6, "triggers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 isEnabled])
          {
            uint64_t v13 = [v6 mode];
            uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
            long long v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;
          }
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (id)modesSupportingSmartEntryForSmartTriggerManager:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  uint64_t v13 = __Block_byref_object_dispose__14;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__DNDSServer_DNDSSmartTriggerManagerDataSource__modesSupportingSmartEntryForSmartTriggerManager___block_invoke;
  v8[3] = &unk_1E6975240;
  void v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __97__DNDSServer_DNDSSmartTriggerManagerDataSource__modesSupportingSmartEntryForSmartTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v4, "triggers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v10 isEnabled])
          {
            uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
            id v12 = [v4 mode];
            [v11 addObject:v12];
          }
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)workoutModeForWorkoutTriggerManager:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  long long v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__DNDSServer_DNDSWorkoutTriggerManagerDataSource__workoutModeForWorkoutTriggerManager___block_invoke;
  v8[3] = &unk_1E6975240;
  void v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __87__DNDSServer_DNDSWorkoutTriggerManagerDataSource__workoutModeForWorkoutTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v12 = a3;
  uint64_t v7 = [v12 triggers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setWorkoutTriggerEnabled:(BOOL)a3 forWorkoutTriggerManager:(id)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = [(DNDSServer *)self workoutModeForWorkoutTriggerManager:a4];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F5F6B0]);
    if (v4) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    uint64_t v10 = (void *)[v8 initWithEnabledSetting:v9];
    uint64_t v11 = [v7 triggers];
    id v12 = objc_msgSend((id)v11, "bs_filter:", &__block_literal_global_31);
    long long v13 = (void *)[v12 mutableCopy];

    [v13 addObject:v10];
    [v7 setTriggers:v13];
    modeConfigurationManager = self->_modeConfigurationManager;
    id v18 = 0;
    LOBYTE(v11) = [(DNDSModeConfigurationManager *)modeConfigurationManager setModeConfiguration:v7 withError:&v18];
    id v15 = v18;
    if ((v11 & 1) == 0)
    {
      long long v16 = DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = @"N";
        *(_DWORD *)buf = 138543874;
        if (v4) {
          long long v17 = @"Y";
        }
        v20 = v17;
        __int16 v21 = 2114;
        uint64_t v22 = v7;
        __int16 v23 = 2114;
        id v24 = v15;
        _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Unable to updated workout trigger enabled setting: enabled=%{public}@ mode=%{public}@ error=%{public}@", buf, 0x20u);
      }
    }
  }
}

BOOL __101__DNDSServer_DNDSWorkoutTriggerManagerDataSource__setWorkoutTriggerEnabled_forWorkoutTriggerManager___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)globalConfigurationManager:(id)a3 didUpdatePhoneCallBypassSettings:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "DND phone call bypass settings changed, will refresh state; manager=%{public}@, settings=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  [(DNDSRemoteServiceProvider *)self->_serviceProvider handleUpdatedPhoneCallBypassSettings:v7];
  [(DNDSSettingsSyncManager *)self->_settingsSyncManager update];
}

- (void)globalConfigurationManager:(id)a3 didUpdatePreventAutoReplySetting:(BOOL)a4
{
}

- (void)globalConfigurationManager:(id)a3 didUpdateModesCanImpactAvailabilitySetting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(DNDSSettingsManager *)self->_settingsManager syncSettingsWithError:0];
  int v7 = [v6 isCloudSyncEnabled];

  if (v4)
  {
    if (v7)
    {
      userAvailabilityCoordinator = self->_userAvailabilityCoordinator;
      int v9 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager relevantContacts];
      id v10 = [v9 allObjects];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __124__DNDSServer_DNDSGlobalConfigurationManagerDelegate__globalConfigurationManager_didUpdateModesCanImpactAvailabilitySetting___block_invoke;
      v13[3] = &unk_1E6975680;
      v13[4] = self;
      [(DNDSUserAvailabilityCoordinator *)userAvailabilityCoordinator resumeUpdatingInvitationsForContacts:v10 completionHandler:v13];
    }
  }
  else if (v7)
  {
    __int16 v11 = self->_userAvailabilityCoordinator;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __124__DNDSServer_DNDSGlobalConfigurationManagerDelegate__globalConfigurationManager_didUpdateModesCanImpactAvailabilitySetting___block_invoke_2;
    v12[3] = &unk_1E6975680;
    v12[4] = self;
    [(DNDSUserAvailabilityCoordinator *)v11 suspendWithOverrideSetting:1 completionHandler:v12];
  }
}

void __124__DNDSServer_DNDSGlobalConfigurationManagerDelegate__globalConfigurationManager_didUpdateModesCanImpactAvailabilitySetting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 availability];
  unsigned int v6 = [v5 isAvailable];

  int v7 = [*(id *)(*(void *)(a1 + 32) + 168) lastCalculatedState];
  id v11 = [v7 activeModeConfiguration];

  if (v11)
  {
    id v8 = [v11 mode];
    unint64_t v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType([v8 semanticType]);
  }
  else
  {
    unint64_t v9 = -2;
  }
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);
}

void __124__DNDSServer_DNDSGlobalConfigurationManagerDelegate__globalConfigurationManager_didUpdateModesCanImpactAvailabilitySetting___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 availability];
  unsigned int v6 = [v5 isAvailable];

  int v7 = [*(id *)(*(void *)(a1 + 32) + 168) lastCalculatedState];
  id v11 = [v7 activeModeConfiguration];

  if (v11)
  {
    id v8 = [v11 mode];
    unint64_t v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType([v8 semanticType]);
  }
  else
  {
    unint64_t v9 = -2;
  }
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);
}

- (DNDSServer)init
{
  v150[5] = *MEMORY[0x1E4F143B8];
  v149.receiver = self;
  v149.super_class = (Class)DNDSServer;
  id v2 = [(DNDSServer *)&v149 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.donotdisturb.server.Server"];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[DNDSKeybag sharedInstance];
    keybag = v2->_keybag;
    v2->_keybag = (DNDSKeybagStateProviding *)v5;

    int v7 = [DNDSAppInfoCache alloc];
    id v8 = +[DNDSKeybag sharedInstance];
    uint64_t v9 = [(DNDSAppInfoCache *)v7 initWithKeybag:v8];
    appInfoCache = v2->_appInfoCache;
    v2->_appInfoCache = (DNDSAppInfoCache *)v9;

    id v11 = objc_alloc_init(DNDSClientDetailsProvider);
    clientDetailsProvider = v2->_clientDetailsProvider;
    v2->_clientDetailsProvider = v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    [v13 requestAccessForEntityType:0 completionHandler:&__block_literal_global_40];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DNDHandleSignificantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
    id v15 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v15, v2, (CFNotificationCallback)DNDSHandleLostModeStateChange, (CFStringRef)*MEMORY[0x1E4F61A58], 0, CFNotificationSuspensionBehaviorCoalesce);
    long long v16 = [MEMORY[0x1E4F61A48] sharedInstance];
    v2->_lostModeState = [v16 lostModeIsActive];

    long long v17 = objc_alloc_init(DNDSIntelligentBehaviorResolver);
    intelligentBehaviorResolver = v2->_intelligentBehaviorResolver;
    v2->_intelligentBehaviorResolver = v17;

    long long v19 = objc_alloc_init(DNDSAuxiliaryStateMonitor);
    auxiliaryStateMonitor = v2->_auxiliaryStateMonitor;
    v2->_auxiliaryStateMonitor = v19;

    __int16 v21 = [DNDSModeAssertionManager alloc];
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_localAssertionBackingStoreFileURL");
    uint64_t v23 = [(DNDSModeAssertionManager *)v21 initWithBackingStoreURL:v22 clientDetailsProvider:v2->_clientDetailsProvider];
    modeAssertionManager = v2->_modeAssertionManager;
    v2->_modeAssertionManager = (DNDSModeAssertionManager *)v23;

    uint64_t v25 = objc_alloc_init(DNDSMeDeviceService);
    meDeviceService = v2->_meDeviceService;
    v2->_meDeviceService = v25;

    [(DNDSMeDeviceService *)v2->_meDeviceService addListener:v2];
    unint64_t v27 = objc_alloc_init(DNDSXPCEventStream);
    eventStream = v2->_eventStream;
    v2->_eventStream = v27;

    v29 = objc_alloc_init(DNDSCalendarEventLifetimeMonitor);
    calendarEventLifetimeMonitor = v2->_calendarEventLifetimeMonitor;
    v2->_calendarEventLifetimeMonitor = v29;

    [(DNDSBaseLifetimeMonitor *)v2->_calendarEventLifetimeMonitor setDataSource:v2];
    [(DNDSCalendarEventLifetimeMonitor *)v2->_calendarEventLifetimeMonitor setDelegate:v2];
    v31 = [DNDSXPCEventPublisher alloc];
    uint64_t v32 = [(DNDSXPCEventPublisher *)v31 initWithStream:*MEMORY[0x1E4F5F538]];
    focusConfigurationEventPublisher = v2->_focusConfigurationEventPublisher;
    v2->_focusConfigurationEventPublisher = (DNDSXPCEventPublisher *)v32;

    uint64_t v34 = objc_alloc_init(DNDSScheduleLifetimeMonitor);
    scheduleLifetimeMonitor = v2->_scheduleLifetimeMonitor;
    v2->_scheduleLifetimeMonitor = v34;

    [(DNDSBaseLifetimeMonitor *)v2->_scheduleLifetimeMonitor setDataSource:v2];
    [(DNDSScheduleLifetimeMonitor *)v2->_scheduleLifetimeMonitor setDelegate:v2];
    v36 = objc_alloc_init(DNDSDefaultLifetimeMonitor);
    [(DNDSBaseLifetimeMonitor *)v36 setDataSource:v2];
    [(DNDSBaseLifetimeMonitor *)v36 setDelegate:v2];
    v37 = objc_alloc_init(DNDSDateIntervalLifetimeMonitor);
    [(DNDSBaseLifetimeMonitor *)v37 setDataSource:v2];
    [(DNDSDateIntervalLifetimeMonitor *)v37 setDelegate:v2];
    v38 = [[DNDSLocationLifetimeMonitor alloc] initWithMeDeviceService:v2->_meDeviceService];
    locationLifetimeMonitor = v2->_locationLifetimeMonitor;
    v2->_locationLifetimeMonitor = v38;

    [(DNDSLocationLifetimeMonitor *)v2->_locationLifetimeMonitor setDataSource:v2];
    [(DNDSLocationLifetimeMonitor *)v2->_locationLifetimeMonitor setDelegate:v2];
    v40 = v2->_scheduleLifetimeMonitor;
    v150[0] = v2->_calendarEventLifetimeMonitor;
    v150[1] = v40;
    v145 = v37;
    v146 = v36;
    v150[2] = v36;
    v150[3] = v37;
    v150[4] = v2->_locationLifetimeMonitor;
    uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:5];
    lifetimeMonitors = v2->_lifetimeMonitors;
    v2->_lifetimeMonitors = (NSArray *)v41;

    v43 = [[DNDSScheduleManager alloc] initWithModeAssertionManager:v2->_modeAssertionManager];
    scheduleManager = v2->_scheduleManager;
    v2->_scheduleManager = v43;

    [(DNDSScheduleManager *)v2->_scheduleManager setDataSource:v2];
    v45 = [MEMORY[0x1E4F5F5C8] currentDevice];
    if ([v45 deviceClass] == 5 || objc_msgSend(v45, "deviceClass") == 1)
    {
      uint64_t v46 = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.donotdisturb"];
      idsLocalService = v2->_idsLocalService;
      v2->_idsLocalService = (IDSService *)v46;
    }
    v144 = v45;
    v143 = objc_alloc_init(DNDSModeRepository);
    v48 = [[DNDSEventBehaviorResolver alloc] initWithModeRepository:v143 contactStore:v13 auxiliaryStateMonitor:v2->_auxiliaryStateMonitor intelligentBehaviorResolver:v2->_intelligentBehaviorResolver IDSLocalService:v2->_idsLocalService];
    eventBehaviorResolver = v2->_eventBehaviorResolver;
    v2->_eventBehaviorResolver = v48;

    [(DNDSEventBehaviorResolver *)v2->_eventBehaviorResolver setDataSource:v2];
    uint64_t v50 = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.status.personal"];
    idsCloudService = v2->_idsCloudService;
    v2->_idsCloudService = (IDSService *)v50;

    uint64_t v52 = +[DNDSSyncEngine sharedInstance];
    syncEngine = v2->_syncEngine;
    v2->_syncEngine = (DNDSSyncEngine *)v52;

    v54 = [[DNDSIDSSyncService alloc] initWithIDSService:v2->_idsLocalService];
    v55 = [DNDSIDSSyncEngineMetadataStore alloc];
    v56 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_idsSyncEngineMetadataFileURL");
    uint64_t v57 = [(DNDSIDSSyncEngineMetadataStore *)v55 initWithURL:v56];

    v141 = (void *)v57;
    v142 = v54;
    v58 = [[DNDSIDSSyncEngine alloc] initWithMetadataStore:v57 syncService:v54 keybag:v2->_keybag];
    idsSyncEngine = v2->_idsSyncEngine;
    v2->_idsSyncEngine = v58;

    v60 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_globalConfigurationBackingStoreFileURL");
    uint64_t v61 = +[DNDSGlobalConfiguration backingStoreWithFileURL:v60];

    v140 = (void *)v61;
    v139 = [[DNDSMemoryCachedBackingStore alloc] initWithUnderlyingBackingStore:v61];
    v62 = [[DNDSGlobalConfigurationStore alloc] initWithBackingStore:v139 syncEngine:v2->_syncEngine idsSyncEngine:v2->_idsSyncEngine];
    globalConfigurationStore = v2->_globalConfigurationStore;
    v2->_globalConfigurationStore = v62;

    v64 = [[DNDSGlobalConfigurationManager alloc] initWithBackingStore:v2->_globalConfigurationStore];
    globalConfigurationManager = v2->_globalConfigurationManager;
    v2->_globalConfigurationManager = v64;

    [(DNDSGlobalConfigurationManager *)v2->_globalConfigurationManager setDelegate:v2];
    v66 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_modeConfigurationsBackingStoreFileURL");
    v67 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_modeConfigurationsSecureBackingStoreFileURL");
    uint64_t v68 = +[DNDSModeConfigurationsRecord backingStoreWithFileURL:v66 secureFileURL:v67];

    v138 = (void *)v68;
    v137 = [[DNDSMemoryCachedBackingStore alloc] initWithUnderlyingBackingStore:v68];
    v136 = [[DNDSFirstUnlockPurgedBackingStore alloc] initWithUnderlyingBackingStore:v137 keybag:v2->_keybag];
    v69 = [[DNDSModeConfigurationsStore alloc] initWithBackingStore:v136 syncEngine:v2->_syncEngine idsSyncEngine:v2->_idsSyncEngine];
    modeConfigurationsStore = v2->_modeConfigurationsStore;
    v2->_modeConfigurationsStore = v69;

    v71 = [[DNDSModeConfigurationManager alloc] initWithBackingStore:v2->_modeConfigurationsStore keybag:v2->_keybag];
    modeConfigurationManager = v2->_modeConfigurationManager;
    v2->_modeConfigurationManager = v71;

    [(DNDSModeConfigurationManager *)v2->_modeConfigurationManager setDelegate:v2];
    v73 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_placeholderModesLocalBackingStoreFileURL");
    v74 = +[DNDSPlaceholderModesRecord backingStoreWithFileURL:v73];

    v75 = [[DNDSMemoryCachedBackingStore alloc] initWithUnderlyingBackingStore:v74];
    v76 = [[DNDSPlaceholderModeManager alloc] initWithBackingStore:v75];
    placeholderModeManager = v2->_placeholderModeManager;
    v2->_placeholderModeManager = v76;

    v78 = [[DNDSStateProvider alloc] initWithModeConfigurationManager:v2->_modeConfigurationManager];
    stateProvider = v2->_stateProvider;
    v2->_stateProvider = v78;

    v80 = objc_alloc_init(DNDSAppForegroundTriggerManager);
    appForegroundTriggerManager = v2->_appForegroundTriggerManager;
    v2->_appForegroundTriggerManager = v80;

    [(DNDSAppForegroundTriggerManager *)v2->_appForegroundTriggerManager setDataSource:v2];
    [(DNDSAppForegroundTriggerManager *)v2->_appForegroundTriggerManager refresh];
    v82 = objc_alloc_init(DNDSDrivingTriggerManager);
    drivingTriggerManager = v2->_drivingTriggerManager;
    v2->_drivingTriggerManager = v82;

    [(DNDSDrivingTriggerManager *)v2->_drivingTriggerManager setDataSource:v2];
    [(DNDSDrivingTriggerManager *)v2->_drivingTriggerManager refresh];
    v84 = objc_alloc_init(DNDSGamingTriggerManager);
    gamingTriggerManager = v2->_gamingTriggerManager;
    v2->_gamingTriggerManager = v84;

    [(DNDSGamingTriggerManager *)v2->_gamingTriggerManager setDataSource:v2];
    [(DNDSGamingTriggerManager *)v2->_gamingTriggerManager refresh];
    v86 = objc_alloc_init(DNDSHearingTestTriggerManager);
    hearingTestTriggerManager = v2->_hearingTestTriggerManager;
    v2->_hearingTestTriggerManager = v86;

    [(DNDSHearingTestTriggerManager *)v2->_hearingTestTriggerManager setDataSource:v2];
    [(DNDSHearingTestTriggerManager *)v2->_hearingTestTriggerManager refresh];
    v88 = objc_alloc_init(DNDSMindfulnessTriggerManager);
    mindfulnessTriggerManager = v2->_mindfulnessTriggerManager;
    v2->_mindfulnessTriggerManager = v88;

    [(DNDSMindfulnessTriggerManager *)v2->_mindfulnessTriggerManager setDataSource:v2];
    [(DNDSMindfulnessTriggerManager *)v2->_mindfulnessTriggerManager refresh];
    v90 = objc_alloc_init(DNDSSleepingTriggerManager);
    sleepingTriggerManager = v2->_sleepingTriggerManager;
    v2->_sleepingTriggerManager = v90;

    [(DNDSSleepingTriggerManager *)v2->_sleepingTriggerManager setDataSource:v2];
    [(DNDSSleepingTriggerManager *)v2->_sleepingTriggerManager refresh];
    v92 = objc_alloc_init(DNDSSmartTriggerManager);
    smartTriggerManager = v2->_smartTriggerManager;
    v2->_smartTriggerManager = v92;

    [(DNDSSmartTriggerManager *)v2->_smartTriggerManager setDataSource:v2];
    [(DNDSSmartTriggerManager *)v2->_smartTriggerManager refresh];
    v94 = objc_alloc_init(DNDSWorkoutTriggerManager);
    workoutTriggerManager = v2->_workoutTriggerManager;
    v2->_workoutTriggerManager = v94;

    [(DNDSWorkoutTriggerManager *)v2->_workoutTriggerManager setDataSource:v2];
    [(DNDSWorkoutTriggerManager *)v2->_workoutTriggerManager refreshMigratingIfNecessary];
    v96 = objc_alloc_init(DNDSBiomeDonationManager);
    biomeDonationManager = v2->_biomeDonationManager;
    v2->_biomeDonationManager = v96;

    v98 = [[DNDSPairedDeviceStateMonitor alloc] initWithLocalIDSService:v2->_idsLocalService cloudIDSService:v2->_idsCloudService];
    pairedDeviceStateMonitor = v2->_pairedDeviceStateMonitor;
    v2->_pairedDeviceStateMonitor = v98;

    [(DNDSPairedDeviceStateMonitor *)v2->_pairedDeviceStateMonitor setDelegate:v2];
    v100 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_settingsBackingStoreFileURL");
    v101 = +[DNDSSettingsRecord backingStoreWithFileURL:v100];

    v102 = [[DNDSMemoryCachedBackingStore alloc] initWithUnderlyingBackingStore:v101];
    v103 = [[DNDSSettingsManager alloc] initWithBackingStore:v102 contactStore:v13];
    settingsManager = v2->_settingsManager;
    v2->_settingsManager = v103;

    [(DNDSSettingsManager *)v2->_settingsManager setDelegate:v2];
    v105 = objc_alloc_init(DNDSContactProvider);
    v106 = [[DNDSContactMonitor alloc] initWithContactStore:v13 contactProvider:v105];
    contactMonitor = v2->_contactMonitor;
    v2->_contactMonitor = v106;

    [(DNDSContactMonitor *)v2->_contactMonitor addListener:v2->_modeConfigurationsStore];
    v108 = [[DNDSRemoteServiceProvider alloc] initWithClientDetailsProvider:v2->_clientDetailsProvider];
    serviceProvider = v2->_serviceProvider;
    v2->_serviceProvider = v108;

    [(DNDSRemoteServiceProvider *)v2->_serviceProvider setDelegate:v2];
    v110 = [[DNDSRemoteAvailabilityServiceProvider alloc] initWithClientDetailsProvider:v2->_clientDetailsProvider];
    availabilityServiceProvider = v2->_availabilityServiceProvider;
    v2->_availabilityServiceProvider = v110;

    [(DNDSRemoteAvailabilityServiceProvider *)v2->_availabilityServiceProvider setDelegate:v2];
    v112 = [[DNDSRemoteAppConfigurationServiceProvider alloc] initWithClientDetailsProvider:v2->_clientDetailsProvider];
    appConfigurationServiceProvider = v2->_appConfigurationServiceProvider;
    v2->_appConfigurationServiceProvider = v112;

    [(DNDSRemoteAppConfigurationServiceProvider *)v2->_appConfigurationServiceProvider setDelegate:v2];
    v114 = [[DNDSAppSpecificSettingsManager alloc] initWithIDSSyncEngine:v2->_idsSyncEngine backingStoreURL:0];
    v115 = [[DNDSAppConfigurationManager alloc] initWithAppSpecificSettingsManager:v114];
    appConfigurationManager = v2->_appConfigurationManager;
    v2->_appConfigurationManager = v115;

    v117 = [[DNDSAppFocusConfigurationCoordinator alloc] initWithAppConfigurationManager:v2->_appConfigurationManager keybagProviding:v2->_keybag xpcEventPublisher:v2->_focusConfigurationEventPublisher];
    appFocusConfigurationCoordinator = v2->_appFocusConfigurationCoordinator;
    v2->_appFocusConfigurationCoordinator = v117;

    [(DNDSAppFocusConfigurationCoordinator *)v2->_appFocusConfigurationCoordinator setDelegate:v2];
    v119 = [[DNDSSystemFocusConfigurationCoordinator alloc] initWithAppConfigurationManager:v2->_appConfigurationManager];
    systemFocusConfigurationCoordinator = v2->_systemFocusConfigurationCoordinator;
    v2->_systemFocusConfigurationCoordinator = v119;

    [(DNDSSystemFocusConfigurationCoordinator *)v2->_systemFocusConfigurationCoordinator setDelegate:v2];
    uint64_t v121 = +[DNDSReachability commonReachability];
    reachability = v2->_reachability;
    v2->_reachability = (DNDSReachability *)v121;

    [(DNDSReachability *)v2->_reachability addDelegate:v2];
    [(DNDSKeybagStateProviding *)v2->_keybag addObserver:v2];
    v123 = (STFocusStatusDomainPublisher *)objc_alloc_init(MEMORY[0x1E4FA93A0]);
    focusStatusDomainPublisher = v2->_focusStatusDomainPublisher;
    v2->_focusStatusDomainPublisher = v123;

    [(DNDSServer *)v2 _migrateDefaultDoNotDisturbModeIfNeeded];
    [(DNDSServer *)v2 _migrateReduceInterruptionsIfNeeded];
    v125 = objc_alloc_init(DNDSMetricsManager);
    metricsManager = v2->_metricsManager;
    v2->_metricsManager = v125;

    v127 = [[DNDSUserAvailabilityCoordinator alloc] initWithConfigurationProvider:v2->_modeConfigurationManager stateProvider:v2->_stateProvider];
    userAvailabilityCoordinator = v2->_userAvailabilityCoordinator;
    v2->_userAvailabilityCoordinator = v127;

    v129 = [(DNDSSettingsManager *)v2->_settingsManager syncSettingsWithError:0];
    LODWORD(v68) = [v129 isCloudSyncEnabled];

    v130 = v2->_userAvailabilityCoordinator;
    if (v68) {
      [(DNDSUserAvailabilityCoordinator *)v130 resume];
    }
    else {
      [(DNDSUserAvailabilityCoordinator *)v130 suspend];
    }
    v131 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __18__DNDSServer_init__block_invoke_128;
    v147[3] = &unk_1E69756A8;
    v132 = v2;
    v148 = v132;
    [v131 setTransitionHandler:v147];
    uint64_t v133 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v131];
    layoutMonitor = v132->_layoutMonitor;
    v132->_layoutMonitor = (FBSDisplayLayoutMonitor *)v133;

    [(DNDSXPCEventStream *)v2->_eventStream start];
  }
  return v2;
}

void __18__DNDSServer_init__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2114;
    id v8 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Access to contacts store: granted=%{BOOL}u, error=%{public}@", (uint8_t *)v6, 0x12u);
  }
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__DNDSServer_resume__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __20__DNDSServer_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resume");
}

- (void)_handleSignificantTimeChange
{
  uint64_t v3 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Got significant time change; update lifetime monitors",
      buf,
      2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__DNDSServer__handleSignificantTimeChange__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__DNDSServer__handleSignificantTimeChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 4, 1);
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_validateIDSSyncEngine");
}

- (BOOL)_setLostModeState:(unint64_t)a3 error:(id *)a4
{
  -[DNDSServer setLostModeState:](self, "setLostModeState:", a3, a4);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__DNDSServer__setLostModeState_error___block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

uint64_t __38__DNDSServer__setLostModeState_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 4, 1);
}

- (id)currentStateForEventBehaviorResolver:(id)a3
{
  uint64_t v3 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F5F750] fallbackState];
  }
  unsigned int v6 = v5;

  return v6;
}

- (id)eventBehaviorResolver:(id)a3 bypassSettingsForClientIdentifier:(id)a4
{
  id v4 = -[DNDSServer currentStateForEventBehaviorResolver:](self, "currentStateForEventBehaviorResolver:", a3, a4);
  id v5 = [v4 activeModeConfiguration];

  unsigned int v6 = [v5 configuration];
  __int16 v7 = [v6 phoneCallBypassSettings];

  return v7;
}

- (id)eventBehaviorResolver:(id)a3 configurationForModeIdentifier:(id)a4
{
  modeConfigurationManager = self->_modeConfigurationManager;
  id v13 = 0;
  unsigned int v6 = [(DNDSModeConfigurationManager *)modeConfigurationManager modeConfigurationForModeIdentifier:a4 withError:&v13];
  id v7 = v13;
  id v8 = [v6 configuration];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(DNDSGlobalConfigurationManager *)self->_globalConfigurationManager fallbackConfiguration];
  }
  id v11 = v10;

  return v11;
}

- (BOOL)eventBehaviorResolver:(id)a3 isAvailabilityActiveForBundleIdentifier:(id)a4
{
  id v4 = -[DNDSServer currentStateForEventBehaviorResolver:](self, "currentStateForEventBehaviorResolver:", a3, a4);
  id v5 = [v4 activeModeConfiguration];
  uint64_t v6 = [v5 impactsAvailability];

  return v6 != 1;
}

- (id)eventBehaviorResolver:(id)a3 appPredicateForApplicationIdentifier:(id)a4 modeIdentifier:(id)a5
{
  return [(DNDSAppConfigurationManager *)self->_appConfigurationManager predicateForApplicationIdentifier:a4 modeIdentifier:a5 error:0];
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  [(DNDSServer *)self _migrateDefaultDoNotDisturbModeIfNeeded];
  if (+[DNDSPlatformEligibility isIntelligenceAvailable])
  {
    [(DNDSServer *)self _migrateReduceInterruptionsIfNeeded];
  }
}

- (id)lifetimeMonitor:(id)a3 modeAssertionsWithLifetimeClass:(Class)a4
{
  id v5 = [MEMORY[0x1E4F5F600] predicateForModeAssertionsWithLifetimeClass:a4];
  uint64_t v6 = [(DNDSModeAssertionManager *)self->_modeAssertionManager modeAssertionsMatchingPredicate:v5];

  return v6;
}

- (id)locationTriggerConfigurationForLifetimeMonitor:(id)a3
{
  id v4 = objc_alloc_init(DNDSLocationTriggerConfiguration);
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __61__DNDSServer_locationTriggerConfigurationForLifetimeMonitor___block_invoke;
  v11[3] = &unk_1E6975218;
  id v12 = v4;
  uint64_t v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
  id v7 = [(DNDSLocationTriggerConfiguration *)v6 regions];
  if ([v7 count]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  uint64_t v9 = v8;

  return v9;
}

void __61__DNDSServer_locationTriggerConfigurationForLifetimeMonitor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(a3, "triggers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 isEnabled])
        {
          id v12 = [v11 region];
          [*(id *)(a1 + 32) addTriggerForModeWithIdentifier:v5 forRegion:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)activeAssertionsDidChangeForLifetimeMonitor:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Lifetime monitor says active assertions changed; monitor=%p",
      buf,
      0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__DNDSServer_activeAssertionsDidChangeForLifetimeMonitor___block_invoke;
  v8[3] = &unk_1E69735B8;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __58__DNDSServer_activeAssertionsDidChangeForLifetimeMonitor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2 == v1[3]) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 6;
  }
  return objc_msgSend(v1, "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", v3, 1);
}

- (id)lifetimeMonitor:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __82__DNDSServer_lifetimeMonitor_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke;
  id v24 = &unk_1E6973798;
  id v25 = v10;
  id v26 = v9;
  id v11 = v9;
  id v12 = v10;
  uint64_t v13 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:&v21 error:a6];
  long long v14 = objc_msgSend(v13, "assertions", v21, v22, v23, v24);
  long long v15 = [v14 firstObject];

  clientDetailsProvider = self->_clientDetailsProvider;
  long long v17 = [v15 source];
  uint64_t v18 = [v17 clientIdentifier];
  long long v19 = [(DNDSClientDetailsProvider *)clientDetailsProvider clientDetailsForIdentifier:v18];

  [(DNDSMetricsManager *)self->_metricsManager assertionTaken:v15 withClientDetails:v19 lockState:[(DNDSServer *)self lockState]];
  return v15;
}

uint64_t __82__DNDSServer_lifetimeMonitor_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:*(void *)(a1 + 32) deviceIdentifier:0];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = (id)[v3 takeAssertionWithDetails:v5 source:v4 startDate:v6];

  return 1;
}

- (void)lifetimeMonitor:(id)a3 lifetimeDidExpireForAssertionUUIDs:(id)a4 expirationDate:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id v11 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v8;
      __int16 v22 = 2114;
      id v23 = v9;
      _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Lifetime monitor says UUIDs should expire; monitor=%{public}@, UUIDs=%{public}@",
        buf,
        0x16u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__DNDSServer_lifetimeMonitor_lifetimeDidExpireForAssertionUUIDs_expirationDate___block_invoke;
    v15[3] = &unk_1E69756D0;
    id v16 = v9;
    id v17 = v8;
    uint64_t v18 = self;
    id v19 = v10;
    id v14 = 0;
    id v12 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:v15 error:&v14];
    id v13 = v14;
  }
}

uint64_t __80__DNDSServer_lifetimeMonitor_lifetimeDidExpireForAssertionUUIDs_expirationDate___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:a1[4]];
  id v5 = objc_alloc(MEMORY[0x1E4F5F650]);
  uint64_t v6 = (void *)[v5 initWithClientIdentifier:*MEMORY[0x1E4F5F558] deviceIdentifier:0];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  if (v7 == *(void *)(v8 + 32))
  {
    uint64_t v9 = 7;
  }
  else if (v7 == *(void *)(v8 + 16))
  {
    uint64_t v9 = 8;
  }
  else
  {
    uint64_t v9 = 1;
  }
  id v10 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v4 requestDate:a1[7] details:0 source:v6 reason:v9 reasonOverride:0];
  id v11 = (id)[v3 invalidateAssertionsForRequest:v10];

  return 1;
}

- (void)lifetimeMonitor:(id)a3 setTimer:(id)a4
{
}

- (void)lifetimeMonitor:(id)a3 registerTimerHandlerWithServiceIdentifier:(id)a4 handler:(id)a5
{
}

- (id)remoteServiceProvider:(id)a3 resolveBehaviorForEventDetails:(id)a4 clientDetails:(id)a5 date:(id)a6 error:(id *)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  metricsManager = self->_metricsManager;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  [(DNDSMetricsManager *)metricsManager sendMetricsHeartbeatsIfNeeded];
  long long v15 = [(DNDSEventBehaviorResolver *)self->_eventBehaviorResolver resolveBehaviorForEventDetails:v14 clientDetails:v13 date:v12 error:a7];

  id v16 = [v15 eventDetails];
  id v17 = [v16 bundleIdentifier];

  if (v17)
  {
    BOOL v18 = DNDSPowerLogInterruptionSuppressionForDNDInterruptionSuppression([v15 interruptionSuppression]);
    id v19 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543618;
      __int16 v22 = v17;
      __int16 v23 = 2048;
      BOOL v24 = v18;
      _os_log_impl(&dword_1D3052000, v19, OS_LOG_TYPE_INFO, "Notifying PowerLog of Focus interruption suppression event: bundleIdentifier=%{public}@ suppression=%ld", (uint8_t *)&v21, 0x16u);
    }
    DNDSPowerLogFocusInterruptionSuppresionEvent(v17, v18);
  }

  return v15;
}

- (id)remoteServiceProvider:(id)a3 activeAssertionWithClientIdentifer:(id)a4 error:(id *)a5
{
  id v6 = a4;
  uint64_t v7 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  uint64_t v8 = [(DNDSStateProvider *)self->_stateProvider lastSystemSnapshot];
  uint64_t v9 = [v7 activeModeIdentifier];
  id v10 = [v8 assertions];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke;
  v20[3] = &unk_1E6974548;
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = objc_msgSend(v10, "bs_filter:", v20);

  if ((unint64_t)[v13 count] < 2)
  {
    long long v15 = [v13 firstObject];
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke_2;
    v18[3] = &unk_1E6973720;
    id v19 = v6;
    id v14 = objc_msgSend(v13, "bs_filter:", v18);
    if ([v14 count] == 1)
    {
      long long v15 = [v14 firstObject];
    }
    else
    {
      id v16 = [v13 sortedArrayUsingComparator:&__block_literal_global_145];
      long long v15 = [v16 lastObject];
    }
  }

  return v15;
}

uint64_t __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activeAssertionUUIDs];
  id v5 = [v3 UUID];
  if ([v4 containsObject:v5])
  {
    id v6 = [v3 details];
    uint64_t v7 = [v6 modeIdentifier];
    uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 source];
  id v4 = [v3 clientIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)remoteServiceProvider:(id)a3 assertionWithClientIdentifer:(id)a4 error:(id *)a5
{
  id v6 = [(DNDSClientDetailsProvider *)self->_clientDetailsProvider clientDetailsForIdentifier:a4];
  uint64_t v7 = (void *)MEMORY[0x1E4F5F600];
  uint64_t v8 = [v6 identifiers];
  uint64_t v9 = [v7 predicateForModeAssertionsWithClientIdentifiers:v8];

  id v10 = [(DNDSModeAssertionManager *)self->_modeAssertionManager modeAssertionsMatchingPredicate:v9];
  id v11 = [v10 firstObject];

  return v11;
}

- (id)remoteServiceProvider:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  modeConfigurationManager = self->_modeConfigurationManager;
  id v12 = [v9 modeIdentifier];
  id v13 = [(DNDSModeConfigurationManager *)modeConfigurationManager modeConfigurationForModeIdentifier:v12 withError:a6];

  if (v13)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    __int16 v30 = __88__DNDSServer_remoteServiceProvider_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke;
    v31 = &unk_1E6973798;
    id v32 = v10;
    id v33 = v9;
    id v14 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:&v28 error:a6];
    long long v15 = objc_msgSend(v14, "assertions", v28, v29, v30, v31);
    id v16 = [v15 firstObject];

    clientDetailsProvider = self->_clientDetailsProvider;
    BOOL v18 = [v16 source];
    id v19 = [v18 clientIdentifier];
    v20 = [(DNDSClientDetailsProvider *)clientDetailsProvider clientDetailsForIdentifier:v19];

    [(DNDSMetricsManager *)self->_metricsManager assertionTaken:v16 withClientDetails:v20 lockState:[(DNDSServer *)self lockState]];
  }
  else
  {
    if (a6)
    {
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F5F528];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37[0] = @"No mode configuration found for mode identifier.";
      __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a6 = [v21 errorWithDomain:v22 code:1003 userInfo:v23];
    }
    BOOL v24 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = v24;
      id v26 = [v9 modeIdentifier];
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      _os_log_impl(&dword_1D3052000, v25, OS_LOG_TYPE_DEFAULT, "No mode configuration found for mode identifier: modeIdentifier=%{public}@", buf, 0xCu);
    }
    id v16 = 0;
  }

  return v16;
}

uint64_t __88__DNDSServer_remoteServiceProvider_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:*(void *)(a1 + 32) deviceIdentifier:0];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = (id)[v3 takeAssertionWithDetails:v5 source:v4 startDate:v6];

  return 1;
}

- (id)remoteServiceProvider:(id)a3 invalidateModeAssertionWithUUID:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 clientIdentifier:(id)a7 error:(id *)a8
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = (id)*MEMORY[0x1E4F5F558];
  if (a7) {
    id v14 = a7;
  }
  id v15 = v14;
  modeAssertionManager = self->_modeAssertionManager;
  id v17 = (void *)MEMORY[0x1E4F5F600];
  v41[0] = v13;
  BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  id v19 = [v17 predicateForModeAssertionsWithUUIDs:v18];
  v20 = [(DNDSModeAssertionManager *)modeAssertionManager modeAssertionsMatchingPredicate:v19];
  id v21 = [v20 firstObject];

  uint64_t v22 = [v21 source];
  __int16 v23 = [v22 clientIdentifier];

  if ([v23 hasSuffix:@".private.schedule"])
  {
    BOOL v24 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v38 = v15;
      __int16 v39 = 2114;
      v40 = v23;
      _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "Overriding invalidation client (%{public}@) with assertion client (%{public}@)", buf, 0x16u);
    }
    uint64_t v25 = [(DNDSServer *)self _invalidateModeAssertionForClientIdentifier:v23 reason:a5 reasonOverride:a6 details:0 error:a8];
  }
  else
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __113__DNDSServer_remoteServiceProvider_invalidateModeAssertionWithUUID_reason_reasonOverride_clientIdentifier_error___block_invoke;
    id v32 = &unk_1E69737C0;
    id v33 = v13;
    id v34 = v15;
    unint64_t v35 = a5;
    unint64_t v36 = a6;
    id v26 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:&v29 error:a8];
    unint64_t v27 = objc_msgSend(v26, "invalidations", v29, v30, v31, v32);
    uint64_t v25 = [v27 firstObject];
  }
  return v25;
}

uint64_t __113__DNDSServer_remoteServiceProvider_invalidateModeAssertionWithUUID_reason_reasonOverride_clientIdentifier_error___block_invoke(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v11[0] = a1[4];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v5 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:v4];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:a1[5] deviceIdentifier:0];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v5 requestDate:v7 details:0 source:v6 reason:a1[6] reasonOverride:a1[7]];

  id v9 = (id)[v3 invalidateAssertionsForRequest:v8];
  return 1;
}

- (id)remoteServiceProvider:(id)a3 invalidateModeAssertionForClientIdentifier:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 details:(id)a7 error:(id *)a8
{
  return [(DNDSServer *)self _invalidateModeAssertionForClientIdentifier:a4 reason:a5 reasonOverride:a6 details:a7 error:a8];
}

- (id)_invalidateModeAssertionForClientIdentifier:(id)a3 reason:(unint64_t)a4 reasonOverride:(unint64_t)a5 details:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__DNDSServer__invalidateModeAssertionForClientIdentifier_reason_reasonOverride_details_error___block_invoke;
  v20[3] = &unk_1E69756F8;
  void v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  id v14 = v13;
  id v15 = v12;
  id v16 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:v20 error:a7];
  id v17 = [v16 invalidations];
  BOOL v18 = [v17 firstObject];

  return v18;
}

uint64_t __94__DNDSServer__invalidateModeAssertionForClientIdentifier_reason_reasonOverride_details_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1[4] + 392) clientDetailsForIdentifier:a1[5]];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v4 identifiers];
  id v7 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:v6];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:a1[5] deviceIdentifier:0];
  id v9 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v7 requestDate:v5 details:a1[6] source:v8 reason:a1[7] reasonOverride:a1[8]];
  id v10 = (id)[v3 invalidateAssertionsForRequest:v9];

  return 1;
}

- (id)remoteServiceProvider:(id)a3 latestInvalidationWithClientIdentifer:(id)a4 error:(id *)a5
{
  id v6 = [(DNDSClientDetailsProvider *)self->_clientDetailsProvider clientDetailsForIdentifier:a4];
  id v7 = (void *)MEMORY[0x1E4F5F630];
  uint64_t v8 = [v6 identifiers];
  id v9 = [v7 predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:v8];

  id v10 = [(DNDSModeAssertionManager *)self->_modeAssertionManager modeAssertionInvalidationsMatchingPredicate:v9];
  id v11 = [v10 firstObject];

  return v11;
}

- (id)remoteServiceProvider:(id)a3 invalidateAllModeAssertionsTakenBeforeDate:(id)a4 forReason:(unint64_t)a5 clientIdentifier:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __112__DNDSServer_remoteServiceProvider_invalidateAllModeAssertionsTakenBeforeDate_forReason_clientIdentifier_error___block_invoke;
  v18[3] = &unk_1E69748E8;
  id v19 = v12;
  id v20 = v11;
  unint64_t v21 = a5;
  id v13 = v11;
  id v14 = v12;
  id v15 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:v18 error:a7];
  id v16 = [v15 invalidations];

  return v16;
}

uint64_t __112__DNDSServer_remoteServiceProvider_invalidateAllModeAssertionsTakenBeforeDate_forReason_clientIdentifier_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:a1[4] deviceIdentifier:0];
  id v6 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v4 requestDate:a1[5] source:v5 reason:a1[6]];
  id v7 = (id)[v3 invalidateAssertionsForRequest:v6];

  return 1;
}

- (id)remoteServiceProvider:(id)a3 allActiveModeAssertionsWithError:(id *)a4
{
  id v4 = [(DNDSServer *)self _stateSystemSnapshot];
  uint64_t v5 = [v4 assertions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__DNDSServer_remoteServiceProvider_allActiveModeAssertionsWithError___block_invoke;
  v9[3] = &unk_1E6973720;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "bs_filter:", v9);

  return v7;
}

uint64_t __69__DNDSServer_remoteServiceProvider_allActiveModeAssertionsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 activeAssertionUUIDs];
  uint64_t v5 = [v3 UUID];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (BOOL)remoteServiceProvider:(id)a3 setScreenIsShared:(BOOL)a4 screenIsMirrored:(BOOL)a5 withError:(id *)a6
{
  BOOL v6 = a5;
  [(DNDSAuxiliaryStateMonitor *)self->_auxiliaryStateMonitor setScreenShared:a4];
  [(DNDSAuxiliaryStateMonitor *)self->_auxiliaryStateMonitor setScreenMirrored:v6];
  return 1;
}

- (BOOL)remoteServiceProvider:(id)a3 handleHearingTestEvent:(id)a4 withError:(id *)a5
{
  return 1;
}

- (void)appFocusConfigurationCoordinator:(id)a3 didUpdateAppConfigurationContextForModeIdentifier:(id)a4
{
  unint64_t v10 = (unint64_t)a4;
  uint64_t v5 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F5F750] fallbackState];
  }
  uint64_t v8 = v7;

  uint64_t v9 = [v8 activeModeIdentifier];
  if (!(v10 | v9) || v9 && [(id)v9 isEqualToString:v10]) {
    [(DNDSRemoteServiceProvider *)self->_serviceProvider handleAppConfigurationContextUpdateForModeIdentifier:v10];
  }
}

- (id)currentStateForAppFocusConfigurationCoordinator:(id)a3
{
  id v3 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F5F750] fallbackState];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)currentStateForSystemFocusConfigurationCoordinator:(id)a3
{
  id v3 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F5F750] fallbackState];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)remoteServiceProvider:(id)a3 behaviorSettingsWithError:(id *)a4
{
  settingsManager = self->_settingsManager;
  id v12 = 0;
  uint64_t v6 = [(DNDSSettingsManager *)settingsManager behaviorSettingsWithError:&v12];
  unint64_t v7 = (unint64_t)v12;
  uint64_t v8 = (void *)v7;
  if (v6 | v7)
  {
    if (a4 && v7) {
      *a4 = (id) v7;
    }
  }
  else
  {
    uint64_t v6 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F5F5A0]);
    uint64_t v9 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "No behavior settings in settings manager, will return default settings", v11, 2u);
    }
  }

  return (id)v6;
}

- (BOOL)remoteServiceProvider:(id)a3 setBehaviorSettings:(id)a4 withError:(id *)a5
{
  return [(DNDSSettingsManager *)self->_settingsManager setBehaviorSettings:a4 withError:a5];
}

- (id)remoteServiceProvider:(id)a3 scheduleSettingsWithError:(id *)a4
{
  id v4 = [(DNDSServer *)self _scheduleSettingsFromDefaultScheduleTrigger];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F5F740]);
    id v5 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "No schedule settings in settings manager, will return default settings", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)remoteServiceProvider:(id)a3 setScheduleSettings:(id)a4 withError:(id *)a5
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  uint64_t v8 = [v6 date];
  uint64_t v9 = +[DNDSScheduleSettings settingsWithClientSettings:v7 creationDate:v8];

  LOBYTE(self) = [(DNDSServer *)self _setDefaultScheduleTriggerWithScheduleSettings:v9];
  return (char)self;
}

- (id)currentlyActivePairedDeviceForSyncManager:(id)a3
{
  return [(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor pairedDevice];
}

- (id)pairedCloudDevicesForSyncManager:(id)a3
{
  id v4 = [(DNDSSettingsManager *)self->_settingsManager syncSettingsWithError:0];
  if (![v4 isCloudSyncEnabled]
    || ([(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor cloudDevices],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEBUG)) {
    -[DNDSServer pairedCloudDevicesForSyncManager:]();
  }

  return v5;
}

- (id)pairedDevicesForSyncManager:(id)a3
{
  id v4 = [(DNDSSettingsManager *)self->_settingsManager syncSettingsWithError:0];
  if (![v4 isCloudSyncEnabled]
    || ([(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor cloudDevices],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  if ([v4 isPairSyncEnabled])
  {
    uint64_t v6 = [(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor pairedDevice];
    if (v6)
    {
      uint64_t v7 = [v5 setByAddingObject:v6];

      id v5 = (void *)v7;
    }
    else
    {
      uint64_t v8 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v10 = 0;
        _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "No default paired device", v10, 2u);
      }
    }
  }
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEBUG)) {
    -[DNDSServer pairedDevicesForSyncManager:]();
  }

  return v5;
}

- (id)syncManager:(id)a3 deviceForDeviceIdentifier:(id)a4
{
  id v5 = [(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor pairedDeviceForDeviceIdentifier:a4];
  uint64_t v6 = [(DNDSSettingsManager *)self->_settingsManager syncSettingsWithError:0];
  if ([v5 syncServiceType] == 2 && !objc_msgSend(v6, "isCloudSyncEnabled")
    || [v5 syncServiceType] == 1 && (objc_msgSend(v6, "isPairSyncEnabled") & 1) == 0)
  {

    id v5 = 0;
  }

  return v5;
}

- (id)syncManager:(id)a3 updateOutboundModeAssertion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 details];
  uint64_t v7 = (void *)[v6 mutableCopy];

  modeConfigurationManager = self->_modeConfigurationManager;
  uint64_t v9 = [v7 modeIdentifier];
  unint64_t v10 = [(DNDSModeConfigurationManager *)modeConfigurationManager modeConfigurationForModeIdentifier:v9 withError:0];

  if (v10)
  {
    id v11 = [v10 lastModified];
    if (v11
      && ([MEMORY[0x1E4F1C9C8] distantPast],
          id v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v11 isEqualToDate:v12],
          v12,
          (v13 & 1) == 0))
    {
      id v20 = [v10 lastModified];
      [v7 setModeConfigurationModifiedDate:v20];

      id v21 = objc_alloc(MEMORY[0x1E4F5F600]);
      id v22 = [v5 UUID];
      unint64_t v23 = [v5 startDate];
      unint64_t v24 = [v5 source];
      uint64_t v17 = [v21 initWithUUID:v22 startDate:v23 details:v7 source:v24];

      uint64_t v25 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412546;
        unint64_t v27 = v11;
        __int16 v28 = 2112;
        uint64_t v29 = v17;
        _os_log_impl(&dword_1D3052000, v25, OS_LOG_TYPE_INFO, "Updated mode modifification date to %@ on assertion %@", (uint8_t *)&v26, 0x16u);
      }
    }
    else
    {
      id v14 = (void *)DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v14;
        id v16 = [v7 modeIdentifier];
        int v26 = 138412546;
        unint64_t v27 = v16;
        __int16 v28 = 2112;
        uint64_t v29 = (uint64_t)v11;
        _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "%@ configuration doesn't have a useful modification date: %@", (uint8_t *)&v26, 0x16u);
      }
      uint64_t v17 = (uint64_t)v5;
    }

    id v5 = (id)v17;
  }
  else
  {
    BOOL v18 = (void *)DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_FAULT)) {
      -[DNDSServer syncManager:updateOutboundModeAssertion:](v18, v7);
    }
  }

  return v5;
}

- (id)syncManager:(id)a3 scheduleSettingsForModeIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(DNDSServer *)self _scheduleSettingsForModeConfigurations];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  uint64_t v8 = [v7 firstObject];

  return v8;
}

- (BOOL)isCloudSyncDisabledForSyncManager:(id)a3
{
  id v3 = [(DNDSSettingsManager *)self->_settingsManager syncSettingsWithError:0];
  char v4 = [v3 isCloudSyncEnabled] ^ 1;

  return v4;
}

- (void)syncManager:(id)a3 performModeAssertionUpdatesWithHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  uint64_t v7 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:a4 error:&v12];
  id v8 = v12;
  if (v7)
  {
    uint64_t v9 = +[DNDSModeAssertionUpdateResult emptyResult];
    char v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v6;
        _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Performed update for sync manager; manager=%{public}@",
          buf,
          0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
  {
    -[DNDSServer syncManager:performModeAssertionUpdatesWithHandler:]();
  }
}

- (void)syncManager:(id)a3 prepareForSyncToDevices:(id)a4
{
  if (objc_msgSend(a4, "bs_containsObjectPassingTest:", &__block_literal_global_162))
  {
    syncEngine = self->_syncEngine;
    [(DNDSSyncEngine *)syncEngine sendChangesWithCompletionHandler:&__block_literal_global_165];
  }
  else
  {
    id v6 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Not requesting cloud sync because the Focus sync does not target any cloud devices.", v7, 2u);
    }
  }
}

BOOL __50__DNDSServer_syncManager_prepareForSyncToDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 syncServiceType] == 2;
}

void __50__DNDSServer_syncManager_prepareForSyncToDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = DNDSLogGeneral;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
      __50__DNDSServer_syncManager_prepareForSyncToDevices___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Completed settings sync for Focus sync.", v4, 2u);
  }
}

- (id)currentStateForLegacyAssertionSyncManager:(id)a3
{
  id v3 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F5F750] fallbackState];
  }
  id v6 = v5;

  return v6;
}

- (id)phoneCallBypassSettingsForSyncManager:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationForModeIdentifier:*MEMORY[0x1E4F5F518] withError:0];
  id v6 = [v5 configuration];
  uint64_t v7 = [v6 phoneCallBypassSettings];

  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v4;
    __int16 v12 = 2114;
    char v13 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Sync manager gets bypass settings; manager=%{public}@, settings=%{public}@",
      (uint8_t *)&v10,
      0x16u);
  }

  return v7;
}

- (id)scheduleSettingsForSyncManager:(id)a3
{
  id v3 = [(DNDSServer *)self _scheduleSettingsFromDefaultScheduleTrigger];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F5F740]);
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = +[DNDSScheduleSettings settingsWithClientSettings:v6 creationDate:v7];
  }
  return v5;
}

- (void)syncManager:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Received updated bypass settings via sync; manager=%{public}@, settings=%{public}@",
      buf,
      0x16u);
  }
  modeConfigurationManager = self->_modeConfigurationManager;
  uint64_t v10 = *MEMORY[0x1E4F5F518];
  id v19 = 0;
  id v11 = [(DNDSModeConfigurationManager *)modeConfigurationManager modeConfigurationForModeIdentifier:v10 withError:&v19];
  id v12 = v19;
  if (v12)
  {
    id v13 = v12;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[DNDSServer syncManager:didReceiveUpdatedPhoneCallBypassSettings:]();
    }
  }
  else
  {
    uint64_t v14 = (void *)[v11 mutableCopy];
    uint64_t v15 = [v14 configuration];
    id v16 = (void *)[v15 mutableCopy];

    [v16 setPhoneCallBypassSettings:v7];
    [v14 setConfiguration:v16];
    uint64_t v17 = self->_modeConfigurationManager;
    id v18 = 0;
    [(DNDSModeConfigurationManager *)v17 setModeConfiguration:v14 withError:&v18];
    id v13 = v18;
    if (v13 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[DNDSServer syncManager:didReceiveUpdatedPhoneCallBypassSettings:]();
    }
  }
}

- (void)syncManager:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Received updated schedule settings via sync; manager=%{public}@, settings=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  [(DNDSServer *)self _setDefaultScheduleTriggerWithScheduleSettings:v7];
}

- (void)settingsManager:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "DND behavior settings changed, will refresh state; manager=%{public}@, settings=%{public}@",
      buf,
      0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__DNDSServer_settingsManager_didReceiveUpdatedBehaviorSettings___block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(queue, block);
  [(DNDSRemoteServiceProvider *)self->_serviceProvider handleUpdatedBehaviorSettings:v7];
}

uint64_t __64__DNDSServer_settingsManager_didReceiveUpdatedBehaviorSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 1, 1);
}

- (void)settingsManager:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "DND phone call bypass settings changed, will refresh state; manager=%{public}@, settings=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  [(DNDSRemoteServiceProvider *)self->_serviceProvider handleUpdatedPhoneCallBypassSettings:v7];
  [(DNDSSettingsSyncManager *)self->_settingsSyncManager update];
}

- (void)settingsManager:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "DND schedule settings changed, will refresh state; manager=%{public}@, settings=%{public}@",
      buf,
      0x16u);
  }
  [(DNDSRemoteServiceProvider *)self->_serviceProvider handleUpdatedScheduleSettings:v7];
  [(DNDSSettingsSyncManager *)self->_settingsSyncManager update];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__DNDSServer_settingsManager_didReceiveUpdatedScheduleSettings___block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__DNDSServer_settingsManager_didReceiveUpdatedScheduleSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 1, 1);
}

- (void)settingsManager:(id)a3 didReceiveUpdatedSyncSettings:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Sync settings updated; manager=%{public}@, settings=%{public}@",
      buf,
      0x16u);
  }
  -[DNDSSyncEngine setSyncPreferenceEnabled:](self->_syncEngine, "setSyncPreferenceEnabled:", [v7 isCloudSyncEnabled]);
  int v9 = [v7 isCloudSyncEnabled];
  BOOL v10 = [(DNDSGlobalConfigurationManager *)self->_globalConfigurationManager getModesCanImpactAvailabilityReturningError:0];
  if (v9)
  {
    if (v10)
    {
      userAvailabilityCoordinator = self->_userAvailabilityCoordinator;
      id v12 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager relevantContacts];
      __int16 v13 = [v12 allObjects];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke;
      v18[3] = &unk_1E6975680;
      void v18[4] = self;
      [(DNDSUserAvailabilityCoordinator *)userAvailabilityCoordinator resumeUpdatingInvitationsForContacts:v13 completionHandler:v18];
    }
  }
  else if (v10)
  {
    id v14 = self->_userAvailabilityCoordinator;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke_2;
    v17[3] = &unk_1E6975680;
    v17[4] = self;
    [(DNDSUserAvailabilityCoordinator *)v14 suspendWithOverrideSetting:1 completionHandler:v17];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke_3;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(queue, block);
}

void __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 availability];
  unsigned int v6 = [v5 isAvailable];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 168) lastCalculatedState];
  id v11 = [v7 activeModeConfiguration];

  if (v11)
  {
    id v8 = [v11 mode];
    unint64_t v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType([v8 semanticType]);
  }
  else
  {
    unint64_t v9 = -2;
  }
  BOOL v10 = [MEMORY[0x1E4F1C9C8] date];
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);
}

void __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 availability];
  unsigned int v6 = [v5 isAvailable];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 168) lastCalculatedState];
  id v11 = [v7 activeModeConfiguration];

  if (v11)
  {
    id v8 = [v11 mode];
    unint64_t v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType([v8 semanticType]);
  }
  else
  {
    unint64_t v9 = -2;
  }
  BOOL v10 = [MEMORY[0x1E4F1C9C8] date];
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);
}

uint64_t __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_handlePairedDeviceAndSyncSettingsChange");
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:options:", 1, 1, 1);
}

- (void)modeConfigurationManager:(id)a3 didUpdateAvailableModes:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v6;
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Available modes updated; manager=%{public}@, modes=%{public}@",
      buf,
      0x16u);
  }
  [(DNDSSettingsSyncManager *)self->_settingsSyncManager update];
  [(DNDSAppForegroundTriggerManager *)self->_appForegroundTriggerManager refresh];
  [(DNDSDrivingTriggerManager *)self->_drivingTriggerManager refresh];
  [(DNDSGamingTriggerManager *)self->_gamingTriggerManager refresh];
  [(DNDSMindfulnessTriggerManager *)self->_mindfulnessTriggerManager refresh];
  [(DNDSSleepingTriggerManager *)self->_sleepingTriggerManager refresh];
  [(DNDSSmartTriggerManager *)self->_smartTriggerManager refresh];
  [(DNDSWorkoutTriggerManager *)self->_workoutTriggerManager refresh];
  unint64_t v9 = [(DNDSServer *)self _allModes];
  [(DNDSRemoteServiceProvider *)self->_serviceProvider handleUpdatedModes:v9 availableModes:v7];
  [(DNDSAppConfigurationManager *)self->_appConfigurationManager refreshWithAvailableModes:v7];
  BOOL v10 = [v6 relevantApplicationIdentifiers];
  [(DNDSAppInfoCache *)self->_appInfoCache monitorApplicationIdentifiers:v10];
  id v11 = (void *)MEMORY[0x1E4F5F600];
  id v12 = objc_msgSend(v7, "bs_map:", &__block_literal_global_168);
  __int16 v13 = [v11 predicateForModeAssertionsWithModeIdentifiersNotContainedIn:v12];

  id v14 = [(DNDSModeAssertionManager *)self->_modeAssertionManager modeAssertionsMatchingPredicate:v13];
  uint64_t v15 = objc_msgSend(v14, "bs_compactMap:", &__block_literal_global_171);

  if ([v15 count])
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_3;
    v27[3] = &unk_1E6974368;
    id v28 = v15;
    id v16 = [(DNDSServer *)self _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:v27 error:0];
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v17 = [v16 assertions];
  if ([v17 count])
  {
  }
  else
  {
    [v16 invalidations];
    id v25 = v7;
    id v18 = v13;
    id v19 = v10;
    id v20 = v9;
    id v22 = v21 = v6;
    uint64_t v23 = [v22 count];

    id v6 = v21;
    unint64_t v9 = v20;
    BOOL v10 = v19;
    __int16 v13 = v18;
    id v7 = v25;

    if (!v23)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_4;
      block[3] = &unk_1E6973540;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

uint64_t __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 modeIdentifier];
}

id __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 source];
  id v4 = [v3 deviceIdentifier];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v2 UUID];
  }

  return v5;
}

uint64_t __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:*(void *)(a1 + 32)];
  id v6 = objc_alloc(MEMORY[0x1E4F5F650]);
  id v7 = (void *)[v6 initWithClientIdentifier:*MEMORY[0x1E4F5F558] deviceIdentifier:0];
  id v8 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v5 requestDate:v4 details:0 source:v7 reason:2 reasonOverride:0];
  id v9 = (id)[v3 invalidateAssertionsForRequest:v8];

  return 1;
}

uint64_t __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 4, 1);
}

- (void)modeConfigurationManager:(id)a3 didModifyAvailableMode:(id)a4
{
  id v5 = a4;
  id v6 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F5F750] fallbackState];
  }
  id v9 = v8;

  if ([v9 isActive])
  {
    BOOL v10 = [v5 modeIdentifier];
    id v11 = [v9 activeModeIdentifier];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      BOOL v13 = [(DNDSSyncEngine *)self->_syncEngine hasLocalChanges];
      id v14 = DNDSLogGeneral;
      BOOL v15 = os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Settings for this mode changed. Forcing a sync to all devices.", buf, 2u);
        }
        [(DNDSAssertionSyncManager *)self->_assertionSyncManager forceUpdateAllDevices];
      }
      else if (v15)
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Skipping forced update for settings change because they were not local changes.", v16, 2u);
      }
    }
  }
}

- (void)modeConfigurationManager:(id)a3 didModifyExceptionsForContacts:(id)a4 forModeConfiguration:(id)a5
{
  userAvailabilityCoordinator = self->_userAvailabilityCoordinator;
  objc_msgSend(a4, "allKeys", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(DNDSUserAvailabilityCoordinator *)userAvailabilityCoordinator sendStatusKitInvitationsForContacts:v6 completionHandler:0];
}

- (void)pairedDeviceStateMonitor:(id)a3 pairingChangedFromDevice:(id)a4 toDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__DNDSServer_pairedDeviceStateMonitor_pairingChangedFromDevice_toDevice___block_invoke;
  v15[3] = &unk_1E6974180;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __73__DNDSServer_pairedDeviceStateMonitor_pairingChangedFromDevice_toDevice___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Paired devices updated; monitor=%{public}@, previousDevice=%{public}@, device=%{public}@",
      (uint8_t *)&v7,
      0x20u);
  }
  [*(id *)(*(void *)(a1 + 56) + 152) pairedDeviceDidChange];
  [*(id *)(*(void *)(a1 + 56) + 232) pairedDeviceDidChange];
  objc_msgSend(*(id *)(a1 + 56), "_queue_handlePairedDeviceAndSyncSettingsChange");
  return objc_msgSend(*(id *)(a1 + 56), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 1, 1);
}

- (void)pairedDeviceStateMonitor:(id)a3 cloudPairingChangedFromDevices:(id)a4 toDevices:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v10;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Cloud devices changed; monitor=%{public}@, previousDevices=%{public}@, devices=%{public}@",
      buf,
      0x20u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__DNDSServer_pairedDeviceStateMonitor_cloudPairingChangedFromDevices_toDevices___block_invoke;
  aBlock[3] = &unk_1E6975740;
  aBlock[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = (void (**)(void *, DNDSAssertionSyncManager *))_Block_copy(aBlock);
  v14[2](v14, self->_assertionSyncManager);
  v14[2](v14, self->_legacyAssertionSyncManager);
}

void __80__DNDSServer_pairedDeviceStateMonitor_cloudPairingChangedFromDevices_toDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__DNDSServer_pairedDeviceStateMonitor_cloudPairingChangedFromDevices_toDevices___block_invoke_2;
    block[3] = &unk_1E69734A0;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v8 = v3;
    dispatch_async(v4, block);
  }
}

void __80__DNDSServer_pairedDeviceStateMonitor_cloudPairingChangedFromDevices_toDevices___block_invoke_2(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v4 minusSet:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);
  id v3 = [v4 allObjects];
  [v2 updateDevices:v3];
}

- (BOOL)remoteServiceProvider:(id)a3 setPreventAutoReply:(BOOL)a4 withError:(id *)a5
{
  return [(DNDSGlobalConfigurationManager *)self->_globalConfigurationManager setPreventAutoReply:a4 withError:a5];
}

- (BOOL)remoteServiceProvider:(id)a3 getPreventAutoReplyReturningError:(id *)a4
{
  return [(DNDSGlobalConfigurationManager *)self->_globalConfigurationManager getPreventAutoReplyReturningError:a4];
}

- (BOOL)remoteServiceProvider:(id)a3 setModesCanImpactAvailability:(BOOL)a4 withError:(id *)a5
{
  return [(DNDSGlobalConfigurationManager *)self->_globalConfigurationManager setModesCanImpactAvailability:a4 withError:a5];
}

- (BOOL)remoteServiceProvider:(id)a3 getModesCanImpactAvailabilityReturningError:(id *)a4
{
  return [(DNDSGlobalConfigurationManager *)self->_globalConfigurationManager getModesCanImpactAvailabilityReturningError:a4];
}

- (unint64_t)remoteServiceProvider:(id)a3 getCloudSyncStateReturningError:(id *)a4
{
  return [(DNDSSyncEngine *)self->_syncEngine cloudSyncState];
}

- (BOOL)remoteServiceProvider:(id)a3 setCloudSyncPreferenceEnabled:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3);
  [v8 setBool:!v6 forKey:@"disableCloudSync"];

  if (!v6)
  {
    modeConfigurationManager = self->_modeConfigurationManager;
    id v35 = 0;
    id v10 = [(DNDSModeConfigurationManager *)modeConfigurationManager modeConfigurationsWithError:&v35];
    id v11 = v35;
    if (v11)
    {
      id v12 = v11;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
        -[DNDSServer remoteServiceProvider:setCloudSyncPreferenceEnabled:withError:]();
      }
    }
    else
    {
      id v28 = v10;
      uint64_t v29 = a5;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = [v10 allValues];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v32;
        uint64_t v17 = *MEMORY[0x1E4F5F508];
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v13);
            }
            id v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (([v19 isSupportedConfiguration] & 1) == 0)
            {
              __int16 v20 = (void *)[v19 mutableCopy];
              [v20 setCompatibilityVersion:v17];
              if (([v20 isSupportedConfiguration] & 1) == 0)
              {
                id v21 = [v20 triggers];
                __int16 v22 = objc_msgSend(v21, "bs_filter:", &__block_literal_global_178);
                [v20 setTriggers:v22];
              }
              id v23 = self->_modeConfigurationManager;
              id v30 = 0;
              [(DNDSModeConfigurationManager *)v23 setModeConfiguration:v20 withError:&v30];
              id v24 = v30;
              if (v24)
              {
                id v25 = v24;
                int v26 = DNDSLogGeneral;
                if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v37 = v25;
                  _os_log_error_impl(&dword_1D3052000, v26, OS_LOG_TYPE_ERROR, "Unable to reset incompatible mode configuration: error=%{public}@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v38 count:16];
        }
        while (v15);
      }

      id v12 = 0;
      id v10 = v28;
      a5 = v29;
    }
    if (a5) {
      *a5 = v12;
    }
  }
  return 1;
}

BOOL __76__DNDSServer_remoteServiceProvider_setCloudSyncPreferenceEnabled_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 compatibilityVersion];
  return v2 < *MEMORY[0x1E4F5F508];
}

- (unint64_t)remoteServiceProvider:(id)a3 getPairSyncStateReturningError:(id *)a4
{
  return [(DNDSIDSSyncEngine *)self->_idsSyncEngine pairSyncState];
}

- (BOOL)remoteServiceProvider:(id)a3 setPairSyncPreferenceEnabled:(BOOL)a4 withError:(id *)a5
{
  return 1;
}

- (id)remoteServiceProvider:(id)a3 getAccountFeatureSupportWithError:(id *)a4
{
  return [(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor accountFeatureSupport];
}

- (void)remoteServiceProvider:(id)a3 didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a4
{
  userAvailabilityCoordinator = self->_userAvailabilityCoordinator;
  BOOL v6 = (objc_class *)MEMORY[0x1E4F5F598];
  id v7 = a4;
  id v8 = (void *)[[v6 alloc] initWithBundleID:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__DNDSServer_remoteServiceProvider_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke;
  v9[3] = &unk_1E6975680;
  void v9[4] = self;
  [(DNDSUserAvailabilityCoordinator *)userAvailabilityCoordinator coordinateUserAvailabilityUpdateForApplicationIdentifier:v8 forced:1 completionHandler:v9];
}

void __95__DNDSServer_remoteServiceProvider_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 availability];
  unsigned int v6 = [v5 isAvailable];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 168) lastCalculatedState];
  id v11 = [v7 activeModeConfiguration];

  if (v11)
  {
    id v8 = [v11 mode];
    unint64_t v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType([v8 semanticType]);
  }
  else
  {
    unint64_t v9 = -2;
  }
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);
}

- (id)remoteServiceProvider:(id)a3 modeConfigurationsWithError:(id *)a4
{
  return [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:a4];
}

- (BOOL)remoteServiceProvider:(id)a3 removeModeConfigurationWithModeIdentifier:(id)a4 deletePlaceholder:(BOOL)a5 withError:(id *)a6
{
  return [(DNDSModeConfigurationManager *)self->_modeConfigurationManager removeModeConfigurationForModeIdentifier:a4 deletePlaceholder:a5 withError:a6];
}

- (BOOL)remoteServiceProvider:(id)a3 setModeConfiguration:(id)a4 withError:(id *)a5
{
  return [(DNDSModeConfigurationManager *)self->_modeConfigurationManager setModeConfiguration:a4 withError:a5];
}

- (id)remoteServiceProvider:(id)a3 allModesReturningError:(id *)a4
{
  uint64_t v5 = [(DNDSServer *)self _allModes];
  [(DNDSIDSSyncEngine *)self->_idsSyncEngine sync];
  [(DNDSSyncEngine *)self->_syncEngine fetchChanges:0 withCompletionHandler:&__block_literal_global_181];
  return v5;
}

void __59__DNDSServer_remoteServiceProvider_allModesReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = DNDSLogCloudSync;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __59__DNDSServer_remoteServiceProvider_allModesReturningError___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Fetched changes", v4, 2u);
  }
}

- (id)remoteServiceProvider:(id)a3 availableModesReturningError:(id *)a4
{
  [(DNDSIDSSyncEngine *)self->_idsSyncEngine sync];
  [(DNDSSyncEngine *)self->_syncEngine fetchChanges:0 withCompletionHandler:&__block_literal_global_183];
  modeConfigurationManager = self->_modeConfigurationManager;
  return [(DNDSModeConfigurationManager *)modeConfigurationManager availableModesFilteringPlaceholders:1 returningError:a4];
}

void __65__DNDSServer_remoteServiceProvider_availableModesReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = DNDSLogCloudSync;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __59__DNDSServer_remoteServiceProvider_allModesReturningError___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Fetched changes", v4, 2u);
  }
}

- (BOOL)remoteServiceProvider:(id)a3 syncModeConfigurationsReturningError:(id *)a4
{
  uint64_t v5 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Forcing cloud sync", v7, 2u);
  }
  [(DNDSIDSSyncEngine *)self->_idsSyncEngine sync];
  [(DNDSSyncEngine *)self->_syncEngine sync:1 withCompletionHandler:&__block_literal_global_185];
  return 1;
}

void __73__DNDSServer_remoteServiceProvider_syncModeConfigurationsReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = DNDSLogCloudSync;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __73__DNDSServer_remoteServiceProvider_syncModeConfigurationsReturningError___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Sent changes", v4, 2u);
  }
}

- (id)remoteServiceProvider:(id)a3 allowedModesForContactHandle:(id)a4 withError:(id *)a5
{
  return [(DNDSUserAvailabilityCoordinator *)self->_userAvailabilityCoordinator allowedModesForContactHandle:a4 withError:a5];
}

- (id)remoteServiceProvider:(id)a3 silencedModesForContactHandle:(id)a4 withError:(id *)a5
{
  return [(DNDSUserAvailabilityCoordinator *)self->_userAvailabilityCoordinator silencedModesForContactHandle:a4 withError:a5];
}

- (BOOL)remoteServiceProvider:(id)a3 userAvailabilityInActiveModeForContactHandle:(id)a4 withError:(id *)a5
{
  return [(DNDSUserAvailabilityCoordinator *)self->_userAvailabilityCoordinator userAvailabilityInActiveModeForContactHandle:a4 withError:a5];
}

- (id)remoteServiceProvider:(id)a3 publishStatusKitAvailabilityReturningError:(id *)a4
{
  id v4 = [(DNDSUserAvailabilityCoordinator *)self->_userAvailabilityCoordinator publishStatusKitAvailabilityReturningError:a4];
  uint64_t v5 = [v4 identifier];

  return v5;
}

- (BOOL)remoteAvailabilityServiceProvider:(id)a3 isLocalUserAvailableForApplicationIdentifier:(id)a4 withError:(id *)a5
{
  return [(DNDSUserAvailabilityCoordinator *)self->_userAvailabilityCoordinator isLocalUserAvailableForApplicationIdentifier:a4 withError:a5];
}

- (BOOL)remoteAppConfigurationServiceProvider:(id)a3 invalidateAppContextForActionIdentifier:(id)a4 bundleIdentifier:(id)a5 withError:(id *)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DNDSStateProvider *)self->_stateProvider lastCalculatedState];
  id v11 = [v10 activeModeIdentifier];

  if (v11)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v9];
    [(DNDSAppConfigurationManager *)self->_appConfigurationManager invalidateAppContextForActionIdentifier:v8 applicationIdentifier:v12 modeIdentifier:v11];
  }
  return 1;
}

- (id)remoteServiceProvider:(id)a3 getAppInfoForBundleIdentifier:(id)a4 withError:(id *)a5
{
  return [(DNDSAppInfoCache *)self->_appInfoCache appInfoForBundleIdentifier:a4];
}

- (id)remoteServiceProvider:(id)a3 getAppInfoForBundleIdentifiers:(id)a4 withError:(id *)a5
{
  appInfoCache = self->_appInfoCache;
  unsigned int v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a4];
  id v7 = [(DNDSAppInfoCache *)appInfoCache appInfoForBundleIdentifiers:v6];
  id v8 = [v7 allValues];

  return v8;
}

- (id)remoteServiceProvider:(id)a3 currentMeDeviceStateWithError:(id *)a4
{
  return [(DNDSMeDeviceService *)self->_meDeviceService meDeviceState];
}

- (BOOL)remoteServiceProvider:(id)a3 setAppConfigurationPredicate:(id)a4 forActionIdentifier:(id)a5 forApplicationIdentifier:(id)a6 modeIdentifier:(id)a7 withError:(id *)a8
{
  id v9 = [(DNDSAppConfigurationManager *)self->_appConfigurationManager setPredicate:a4 forActionIdentifier:a5 forApplicationIdentifier:a6 modeIdentifier:a7];
  id v10 = v9;
  if (a8) {
    *a8 = v9;
  }

  return v10 == 0;
}

- (id)remoteServiceProvider:(id)a3 getAppConfigurationPredicateForActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7
{
  return [(DNDSAppConfigurationManager *)self->_appConfigurationManager predicateForActionIdentifier:a4 forApplicationIdentifier:a5 modeIdentifier:a6 error:a7];
}

- (BOOL)remoteServiceProvider:(id)a3 setAppConfigurationTargetContentIdentifierPrefix:(id)a4 forActionIdentifier:(id)a5 forApplicationIdentifier:(id)a6 modeIdentifier:(id)a7 withError:(id *)a8
{
  id v9 = [(DNDSAppConfigurationManager *)self->_appConfigurationManager setTargetContentIdentifierPrefix:a4 forActionIdentifier:a5 forApplicationIdentifier:a6 modeIdentifier:a7];
  id v10 = v9;
  if (a8) {
    *a8 = v9;
  }

  return v10 == 0;
}

- (id)remoteServiceProvider:(id)a3 getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a4 withError:(id *)a5
{
  return [(DNDSAppConfigurationManager *)self->_appConfigurationManager targetContentIdentifierPrefixesForModeIdentifier:a4 error:a5];
}

- (BOOL)remoteServiceProvider:(id)a3 clearSystemConfigurationActionWithIdentifier:(id)a4 modeIdentifier:(id)a5 withError:(id *)a6
{
  id v7 = [(DNDSAppConfigurationManager *)self->_appConfigurationManager clearSystemActionWithIdentifier:a4 modeIdentifier:a5];
  id v8 = v7;
  if (a6) {
    *a6 = v7;
  }

  return v8 == 0;
}

- (id)remoteServiceProvider:(id)a3 getAppActionsForModeIdentifier:(id)a4 withError:(id *)a5
{
  return [(DNDSAppConfigurationManager *)self->_appConfigurationManager appActionsForModeIdentifier:a4 error:a5];
}

- (BOOL)remoteServiceProvider:(id)a3 setAppAction:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  uint64_t v14 = [v13 action];

  appConfigurationManager = self->_appConfigurationManager;
  if (v14)
  {
    uint64_t v16 = [(DNDSAppConfigurationManager *)appConfigurationManager setAppAction:v13 forApplicationIdentifier:v11 modeIdentifier:v12];
  }
  else
  {
    uint64_t v17 = [v13 identifier];

    uint64_t v16 = [(DNDSAppConfigurationManager *)appConfigurationManager clearAppActionWithIdentifier:v17 forApplicationIdentifier:v11 modeIdentifier:v12];
    id v13 = (id)v17;
  }

  if (a7) {
    *a7 = v16;
  }

  return v16 == 0;
}

- (BOOL)remoteServiceProvider:(id)a3 clearAppActionWithIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7
{
  id v8 = [(DNDSAppConfigurationManager *)self->_appConfigurationManager clearAppActionWithIdentifier:a4 forApplicationIdentifier:a5 modeIdentifier:a6];
  id v9 = v8;
  if (a7) {
    *a7 = v8;
  }

  return v9 == 0;
}

- (BOOL)remoteServiceProvider:(id)a3 setSystemAction:(id)a4 forModeIdentifier:(id)a5 withError:(id *)a6
{
  id v7 = [(DNDSAppConfigurationManager *)self->_appConfigurationManager setSystemAction:a4 modeIdentifier:a5];
  id v8 = v7;
  if (a6) {
    *a6 = v7;
  }

  return v8 == 0;
}

- (BOOL)remoteServiceProvider:(id)a3 clearSystemActionWithIdentifier:(id)a4 forModeIdentifier:(id)a5 withError:(id *)a6
{
  id v7 = [(DNDSAppConfigurationManager *)self->_appConfigurationManager clearSystemActionWithIdentifier:a4 modeIdentifier:a5];
  id v8 = v7;
  if (a6) {
    *a6 = v7;
  }

  return v8 == 0;
}

- (id)remoteServiceProvider:(id)a3 getSystemActionsForModeIdentifier:(id)a4 withError:(id *)a5
{
  return [(DNDSAppConfigurationManager *)self->_appConfigurationManager systemActionsForModeIdentifier:a4 error:a5];
}

- (void)meDeviceService:(id)a3 didReceiveMeDeviceStateUpdate:(id)a4
{
}

- (void)reachabilityChangedTo:(BOOL)a3
{
  if (a3)
  {
    id v4 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Device regained internet connectivity. Queueing a current activity sync.", buf, 2u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__DNDSServer_reachabilityChangedTo___block_invoke;
    aBlock[3] = &unk_1E6975768;
    aBlock[4] = self;
    uint64_t v5 = (void (**)(void *, DNDSAssertionSyncManager *))_Block_copy(aBlock);
    v5[2](v5, self->_assertionSyncManager);
    v5[2](v5, self->_legacyAssertionSyncManager);
  }
}

void __36__DNDSServer_reachabilityChangedTo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__DNDSServer_reachabilityChangedTo___block_invoke_2;
    block[3] = &unk_1E69735B8;
    void block[4] = v4;
    id v9 = v3;
    dispatch_async(v5, block);
  }
  else
  {
    unsigned int v6 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Device lost internet connectivity.", v7, 2u);
    }
  }
}

void __36__DNDSServer_reachabilityChangedTo___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) pairedCloudDevicesForSyncManager:*(void *)(a1 + 40)];
  if ([v4 count])
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = [v4 allObjects];
    [v2 updateDevices:v3];
  }
}

- (void)_queue_resume
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor resume];
  [(DNDSServer *)self _queue_handlePairedDeviceAndSyncSettingsChange];
  [(DNDSServer *)self _queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:4 source:1];
  [(DNDSRemoteServiceProvider *)self->_serviceProvider resume];
  [(DNDSRemoteAvailabilityServiceProvider *)self->_availabilityServiceProvider resume];
  appConfigurationServiceProvider = self->_appConfigurationServiceProvider;
  [(DNDSRemoteAppConfigurationServiceProvider *)appConfigurationServiceProvider resume];
}

- (void)_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:(unint64_t)a3 source:(int64_t)a4
{
}

- (void)_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:(unint64_t)a3 source:(int64_t)a4 options:(int64_t)a5
{
  uint64_t v5 = self;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(DNDSScheduleManager *)v5->_scheduleManager refresh];
  unsigned int v6 = [MEMORY[0x1E4F1C9C8] date];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v7 = v5->_lifetimeMonitors;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v62;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v61 + 1) + 8 * v11++) refreshMonitorForDate:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v61 objects:v71 count:16];
    }
    while (v9);
  }

  id v12 = [(DNDSStateProvider *)v5->_stateProvider lastCalculatedState];
  id v13 = [(DNDSServer *)v5 _stateSystemSnapshot];
  uint64_t v14 = [(DNDSStateProvider *)v5->_stateProvider recalculateStateForSnapshot:v13];
  uint64_t v15 = [v12 activeModeIdentifier];

  if (v15)
  {
    uint64_t v16 = [v12 activeModeConfiguration];
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [v14 activeModeIdentifier];

  if (v17)
  {
    id v18 = [v14 activeModeConfiguration];
  }
  else
  {
    id v18 = 0;
  }
  id v19 = [v18 mode];
  __int16 v20 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v20;
    __int16 v22 = [v19 modeIdentifier];
    [v19 name];
    id v23 = v48 = v18;
    [v19 symbolImageName];
    v45 = v5;
    id v24 = v12;
    id v25 = v14;
    int v26 = v16;
    v28 = unint64_t v27 = v13;
    *(_DWORD *)buf = 138412802;
    v66 = v22;
    __int16 v67 = 2112;
    uint64_t v68 = v23;
    __int16 v69 = 2112;
    v70 = v28;
    _os_log_impl(&dword_1D3052000, v21, OS_LOG_TYPE_DEFAULT, "Sending modeIdentifier: %@, modeName:%@, symbolImageName: %@ to focusStatusDomainPublisher", buf, 0x20u);

    id v13 = v27;
    uint64_t v16 = v26;
    uint64_t v14 = v25;
    id v12 = v24;
    uint64_t v5 = v45;

    id v18 = v48;
  }
  focusStatusDomainPublisher = v5->_focusStatusDomainPublisher;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke;
  v59[3] = &unk_1E6975790;
  id v30 = v19;
  id v60 = v30;
  [(STFocusStatusDomainPublisher *)focusStatusDomainPublisher updateDataWithBlock:v59];
  if (v12 && ([v12 isEqual:v14] & 1) == 0)
  {
    v49 = v18;
    uint64_t v46 = v13;
    long long v31 = (void *)[objc_alloc(MEMORY[0x1E4F5F768]) initWithPreviousState:v12 state:v14 reason:a3 source:a4 options:a5];
    long long v32 = (void *)DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
    {
      long long v33 = v32;
      long long v34 = [v31 previousState];
      *(_DWORD *)buf = 138543362;
      v66 = v34;
      _os_log_impl(&dword_1D3052000, v33, OS_LOG_TYPE_DEFAULT, "State was updated: previousState=%{public}@", buf, 0xCu);
    }
    id v35 = (void *)DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v36 = v35;
      v37 = [v31 state];
      *(_DWORD *)buf = 138543362;
      v66 = v37;
      _os_log_impl(&dword_1D3052000, v36, OS_LOG_TYPE_DEFAULT, "State was updated: currentState=%{public}@", buf, 0xCu);
    }
    id v38 = (void *)DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = v38;
      [v31 reason];
      v40 = DNDStateUpdateReasonToString();
      [v31 source];
      uint64_t v41 = DNDStateUpdateSourceToString();
      *(_DWORD *)buf = 138543618;
      v66 = v40;
      __int16 v67 = 2114;
      uint64_t v68 = v41;
      _os_log_impl(&dword_1D3052000, v39, OS_LOG_TYPE_DEFAULT, "State was updated: reason=%{public}@ source=%{public}@", buf, 0x16u);
    }
    [(DNDSRemoteServiceProvider *)v5->_serviceProvider handleStateUpdate:v31];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke_197;
    aBlock[3] = &unk_1E6975768;
    id v58 = v31;
    id v42 = v31;
    v43 = (void (**)(void *, void))_Block_copy(aBlock);
    ((void (**)(void *, DNDSAssertionSyncManager *))v43)[2](v43, v5->_assertionSyncManager);
    ((void (**)(void *, DNDSAssertionSyncManager *))v43)[2](v43, v5->_legacyAssertionSyncManager);
    [(DNDSBiomeDonationManager *)v5->_biomeDonationManager handleStateUpdate:v42];
    [(DNDSAppFocusConfigurationCoordinator *)v5->_appFocusConfigurationCoordinator handleStateUpdate:v42];
    [(DNDSSystemFocusConfigurationCoordinator *)v5->_systemFocusConfigurationCoordinator handleStateUpdate:v42];
    userAvailabilityCoordinator = v5->_userAvailabilityCoordinator;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke_2;
    v52[3] = &unk_1E69757B8;
    id v18 = v49;
    id v53 = v49;
    int64_t v55 = a4;
    unint64_t v56 = a3;
    id v54 = v6;
    [(DNDSUserAvailabilityCoordinator *)userAvailabilityCoordinator coordinateUserAvailability:v42 fromConfiguration:v16 toConfiguration:v53 completionHandler:v52];

    id v13 = v46;
  }
}

void __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) modeIdentifier];
  [v3 setModeIdentifier:v4];

  uint64_t v5 = [*(id *)(a1 + 32) name];
  [v3 setModeName:v5];

  unsigned int v6 = [*(id *)(a1 + 32) symbolImageName];
  [v3 setModeSymbol:v6];

  id v7 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = [v3 modeIdentifier];
    uint64_t v10 = [v3 modeName];
    uint64_t v11 = [v3 modeSymbol];
    int v12 = 138412802;
    id v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "currentData has been set to modeIdentifer: %@, modeName: %@, symbolImageName: %@", (uint8_t *)&v12, 0x20u);
  }
}

void __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke_197(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 updateForStateUpdate:*(void *)(a1 + 32)];
  }
}

void __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unsigned int v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 impactsAvailability];
    BOOL v7 = DNDResolvedImpactsAvailabilitySetting() != 2;
    uint64_t v8 = [*(id *)(a1 + 32) mode];
    unint64_t v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType([v8 semanticType]);
  }
  else
  {
    unint64_t v9 = -2;
    BOOL v7 = 1;
  }
  BOOL updated = DNDSPowerLogFocusUpdateSourceForDNDStateUpdateSource(*(void *)(a1 + 48));
  uint64_t v11 = DNDSPowerLogFocusUpdateReasonForDNDStateUpdateReason(*(void *)(a1 + 56));
  int v12 = DNDSLogMetrics;
  if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_INFO))
  {
    int v13 = 134219008;
    BOOL v14 = v7;
    __int16 v15 = 2048;
    BOOL v16 = updated;
    __int16 v17 = 2048;
    uint64_t v18 = v11;
    __int16 v19 = 2048;
    unint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = a3;
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_INFO, "Notifying PowerLog of Focus status change event: availability=%ld source=%ld reason=%ld semanticType=%ld extensionsLaunched=%ld", (uint8_t *)&v13, 0x34u);
  }
  DNDSPowerLogFocusStatusChangeEvent(*(void **)(a1 + 40), v7, updated, v11, v9, a3);
}

- (void)_queue_validateIDSSyncEngine
{
}

- (void)_migrateBypassSettingsIfNeeded
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unable to fetch mode configurations to migrate bypass settings: error=%{public}@", v2, v3, v4, v5, v6);
}

- (void)_migrateDefaultDoNotDisturbModeIfNeeded
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "Unable to save migrated default mode: mode=%{public}@ error=%{public}@");
}

- (void)_migrateReduceInterruptionsIfNeeded
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "Unable to save migrated Reduce Interruptions: mode=%{public}@ error=%{public}@");
}

BOOL __49__DNDSServer__migrateReduceInterruptionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 semanticType] == 9;
}

- (id)_createDefaultModeForWorkoutTriggerIfNecessary
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationForModeIdentifier:@"com.apple.donotdisturb.mode.workout" withError:0];
  if (!v3)
  {
    uint64_t v4 = [(DNDSPlaceholderModeManager *)self->_placeholderModeManager placeholderModesWithError:0];
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    int v26 = __Block_byref_object_copy__15;
    unint64_t v27 = __Block_byref_object_dispose__15;
    id v28 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__DNDSServer__createDefaultModeForWorkoutTriggerIfNecessary__block_invoke;
    v20[3] = &unk_1E6975800;
    __int16 v21 = @"com.apple.donotdisturb.mode.workout";
    uint64_t v22 = &v23;
    [v4 enumerateObjectsUsingBlock:v20];
    id v5 = objc_alloc(MEMORY[0x1E4F5F5F8]);
    uint8_t v6 = [(id)v24[5] name];
    BOOL v7 = [(id)v24[5] modeIdentifier];
    uint64_t v8 = [(id)v24[5] symbolImageName];
    uint64_t v9 = [(id)v24[5] tintColorName];
    uint64_t v10 = objc_msgSend(v5, "initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:", v6, v7, v8, v9, objc_msgSend((id)v24[5], "semanticType"));

    uint64_t v11 = [MEMORY[0x1E4F5F6E8] defaultConfiguration];
    id v12 = objc_alloc_init(MEMORY[0x1E4F5F6B0]);
    v33[0] = v12;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

    BOOL v14 = (void *)[objc_alloc(MEMORY[0x1E4F5F710]) initWithMode:v10 configuration:v11 triggers:v13];
    [v14 setImpactsAvailability:0];
    [v14 setDimsLockScreen:1];
    [v14 setAutomaticallyGenerated:1];
    modeConfigurationManager = self->_modeConfigurationManager;
    id v19 = 0;
    LOBYTE(v9) = [(DNDSModeConfigurationManager *)modeConfigurationManager setModeConfiguration:v14 withError:&v19];
    id v16 = v19;
    if (v9)
    {
      uint64_t v3 = (void *)[v14 copy];
    }
    else
    {
      __int16 v17 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v30 = v14;
        __int16 v31 = 2114;
        id v32 = v16;
        _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Unable to save migrated default mode: mode=%{public}@ error=%{public}@", buf, 0x16u);
      }
      uint64_t v3 = 0;
    }

    _Block_object_dispose(&v23, 8);
  }
  return v3;
}

void __60__DNDSServer__createDefaultModeForWorkoutTriggerIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  BOOL v7 = [v9 modeIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)_setDimsLockScreenSetting:(unint64_t)a3 forModeConfigurationWithIdentifier:(id)a4
{
  uint8_t v6 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationForModeIdentifier:a4 withError:0];
  BOOL v7 = v6;
  if (v6)
  {
    int v8 = (void *)[v6 mutableCopy];
    [v8 setDimsLockScreen:a3];
    BOOL v9 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager setModeConfiguration:v8 withError:0];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_setScheduleTrigger:(id)a3 forModeConfigurationWithIdentifier:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationForModeIdentifier:a4 withError:0];
  int v8 = v7;
  if (v7)
  {
    BOOL v9 = [v7 triggers];
    uint64_t v10 = objc_msgSend(v9, "bs_filter:", &__block_literal_global_220);

    uint64_t v11 = (void *)[v8 mutableCopy];
    id v12 = [v11 triggers];
    int v13 = [v12 arrayByExcludingObjectsInArray:v10];

    BOOL v14 = [v13 arrayByAddingObject:v6];

    [v11 setTriggers:v14];
    BOOL v15 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager setModeConfiguration:v11 withError:0];
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __69__DNDSServer__setScheduleTrigger_forModeConfigurationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_setDefaultScheduleTriggerWithScheduleSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSServer *)self _scheduleTriggerMatchingSettings:v4];
  uint64_t v6 = *MEMORY[0x1E4F5F518];
  if ([(DNDSServer *)self _setScheduleTrigger:v5 forModeConfigurationWithIdentifier:*MEMORY[0x1E4F5F518]])
  {
    BOOL v7 = -[DNDSServer _setDimsLockScreenSetting:forModeConfigurationWithIdentifier:](self, "_setDimsLockScreenSetting:forModeConfigurationWithIdentifier:", [v4 bedtimeBehaviorEnabledSetting], v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_scheduleSettingsForModeConfigurations
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationsWithError:0];
  if (v4)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    BOOL v9 = __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke;
    uint64_t v10 = &unk_1E6975850;
    uint64_t v11 = self;
    id v12 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:&v7];
  }
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10, v11);

  return v5;
}

void __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 triggers];
  uint64_t v7 = objc_msgSend(v6, "bs_filter:", &__block_literal_global_223);

  if ([v7 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke_3;
    v9[3] = &unk_1E6975828;
    void v9[4] = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v7, "bs_map:", v9);
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
  }
}

uint64_t __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleSettingsMatchingTrigger:a2];
}

- (id)_scheduleSettingsFromDefaultScheduleTrigger
{
  id v2 = [(DNDSServer *)self _scheduleSettingsForModeConfigurations];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5F518]];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)_scheduleSettingsMatchingTrigger:(id)a3
{
  id v3 = a3;
  id v4 = [DNDSScheduleSettings alloc];
  uint64_t v5 = [v3 enabledSetting];
  uint64_t v6 = [v3 timePeriod];
  uint64_t v7 = [v3 creationDate];

  uint64_t v8 = [(DNDSScheduleSettings *)v4 initWithScheduleEnabledSetting:v5 timePeriod:v6 bedtimeBehaviorEnabledSetting:0 creationDate:v7];
  return v8;
}

- (id)_scheduleTriggerMatchingSettings:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F5F688];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 timePeriod];
  uint64_t v7 = [v4 creationDate];
  uint64_t v8 = [v4 scheduleEnabledSetting];

  BOOL v9 = (void *)[v5 initWithTimePeriod:v6 creationDate:v7 enabledSetting:v8];
  return v9;
}

- (id)_stateSystemSnapshot
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  modeAssertionManager = self->_modeAssertionManager;
  id v4 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  id v5 = [(DNDSModeAssertionManager *)modeAssertionManager modeAssertionsMatchingPredicate:v4];

  uint64_t v6 = self->_modeAssertionManager;
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  uint64_t v8 = [(DNDSModeAssertionManager *)v6 modeAssertionInvalidationsMatchingPredicate:v7];

  BOOL v9 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v81;
    do
    {
      uint64_t v14 = 0;
      BOOL v15 = v9;
      do
      {
        if (*(void *)v81 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = [*(id *)(*((void *)&v80 + 1) + 8 * v14) invalidationDate];
        BOOL v9 = [v15 laterDate:v16];

        ++v14;
        BOOL v15 = v9;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v12);
  }
  id v60 = v10;

  __int16 v17 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager availableModesFilteringPlaceholders:1 returningError:0];
  uint64_t v18 = objc_msgSend(v17, "bs_map:", &__block_literal_global_227);

  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __34__DNDSServer__stateSystemSnapshot__block_invoke_2;
  v78[3] = &unk_1E6975878;
  id v59 = v18;
  id v79 = v59;
  v65 = objc_msgSend(v5, "bs_compactMap:", v78);
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v61 = self;
  id v19 = self->_lifetimeMonitors;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v75 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [*(id *)(*((void *)&v74 + 1) + 8 * i) activeLifetimeAssertionUUIDs];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __34__DNDSServer__stateSystemSnapshot__block_invoke_3;
        v72[3] = &unk_1E69758A0;
        id v73 = v65;
        uint64_t v25 = objc_msgSend(v24, "bs_filter:", v72);

        [v67 addObjectsFromArray:v25];
      }
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v21);
  }

  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v5;
  uint64_t v66 = [obj countByEnumeratingWithState:&v68 objects:v84 count:16];
  if (!v66)
  {
    p_isa = (id *)&v61->super.isa;
    goto LABEL_35;
  }
  uint64_t v63 = *(void *)v69;
  p_isa = (id *)&v61->super.isa;
  do
  {
    uint64_t v27 = 0;
    do
    {
      if (*(void *)v69 != v63) {
        objc_enumerationMutation(obj);
      }
      id v28 = *(void **)(*((void *)&v68 + 1) + 8 * v27);
      uint64_t v29 = [v28 UUID];
      uint64_t v30 = [v67 containsObject:v29];

      __int16 v31 = [p_isa _activeDateIntervalForModeAssertion:v28 currentlyActive:v30];
      id v32 = [v28 UUID];
      [v64 setObject:v31 forKey:v32];

      if (v30)
      {
        long long v33 = [v31 startDate];
        uint64_t v34 = [v9 laterDate:v33];
LABEL_28:

        BOOL v9 = (void *)v34;
        goto LABEL_29;
      }
      id v35 = [v28 details];
      uint64_t v36 = [v35 reason];

      v37 = [v28 details];
      id v38 = [v37 identifier];
      int v39 = [v38 isEqualToString:@"schedule"];

      v40 = [p_isa[21] lastSystemSnapshot];
      uint64_t v41 = [v40 activeAssertionUUIDs];
      id v42 = [v28 UUID];
      int v43 = [v41 containsObject:v42];

      if (v36 == 2 && v39)
      {
        p_isa = (id *)&v61->super.isa;
        if (!v43) {
          goto LABEL_29;
        }
        long long v33 = [MEMORY[0x1E4F1C9C8] date];
        [v31 duration];
        uint64_t v45 = [v33 dateByAddingTimeInterval:-v44];
        scheduleLifetimeMonitor = v61->_scheduleLifetimeMonitor;
        v47 = [v28 details];
        v48 = [v47 lifetime];
        v49 = [(DNDSScheduleLifetimeMonitor *)scheduleLifetimeMonitor activeDateIntervalForScheduleLifetime:v48 assertion:v28 date:v45];

        uint64_t v50 = [v49 endDate];
        [v50 timeIntervalSinceDate:v33];
        double v52 = v51;

        if (v52 < 0.0)
        {
          id v53 = [v49 endDate];
          uint64_t v54 = [v9 laterDate:v53];

          BOOL v9 = (void *)v54;
        }
        uint64_t v34 = (uint64_t)v9;

        BOOL v9 = (void *)v45;
        goto LABEL_28;
      }
      p_isa = (id *)&v61->super.isa;
LABEL_29:

      ++v27;
    }
    while (v66 != v27);
    uint64_t v55 = [obj countByEnumeratingWithState:&v68 objects:v84 count:16];
    uint64_t v66 = v55;
  }
  while (v55);
LABEL_35:

  unint64_t v56 = objc_alloc_init(DNDSMutableStateProviderSystemSnapshot);
  [(DNDSMutableStateProviderSystemSnapshot *)v56 setAssertions:obj];
  [(DNDSMutableStateProviderSystemSnapshot *)v56 setActiveAssertionUUIDs:v67];
  [(DNDSMutableStateProviderSystemSnapshot *)v56 setActiveDateIntervalByAssertionUUID:v64];
  -[DNDSMutableStateProviderSystemSnapshot setLostModeState:](v56, "setLostModeState:", [p_isa lostModeState]);
  [(DNDSMutableStateProviderSystemSnapshot *)v56 setLastUpdate:v9];
  uint64_t v57 = [p_isa[29] behaviorSettingsWithError:0];
  -[DNDSMutableStateProviderSystemSnapshot setInterruptionBehaviorSetting:](v56, "setInterruptionBehaviorSetting:", [v57 interruptionBehaviorSetting]);

  return v56;
}

uint64_t __34__DNDSServer__stateSystemSnapshot__block_invoke(uint64_t a1, void *a2)
{
  return [a2 modeIdentifier];
}

id __34__DNDSServer__stateSystemSnapshot__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 UUID];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v3 details];

  uint64_t v7 = [v6 modeIdentifier];
  LODWORD(v5) = [v5 containsObject:v7];

  if (v5)
  {

    id v4 = 0;
  }
  return v4;
}

uint64_t __34__DNDSServer__stateSystemSnapshot__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)_activeDateIntervalForModeAssertion:(id)a3 currentlyActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 details];
  uint64_t v8 = [v7 lifetime];

  switch([v8 lifetimeType])
  {
    case 0:
    case 3:
    case 5:
      id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v10 = [v6 startDate];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];

      break;
    case 1:
      id v13 = v8;
      calendarEventLifetimeMonitor = self->_calendarEventLifetimeMonitor;
      BOOL v15 = [v6 startDate];
      uint64_t v12 = [(DNDSCalendarEventLifetimeMonitor *)calendarEventLifetimeMonitor activeDateIntervalForCalendarEventLifetime:v13 assertionStartDate:v15];

      if (v12) {
        goto LABEL_18;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
      __int16 v17 = [v6 startDate];
      uint64_t v18 = v17;
      if (!v17)
      {
        uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
      }
      id v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v12 = (void *)[v16 initWithStartDate:v18 endDate:v19];

      if (!v17) {
      goto LABEL_17;
      }
    case 2:
      uint64_t v12 = [v8 dateInterval];
      break;
    case 4:
      id v13 = v8;
      scheduleLifetimeMonitor = self->_scheduleLifetimeMonitor;
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
      if (v4) {
        [(DNDSScheduleLifetimeMonitor *)scheduleLifetimeMonitor activeDateIntervalForScheduleLifetime:v13 assertion:v6 date:v21];
      }
      else {
      __int16 v17 = [(DNDSScheduleLifetimeMonitor *)scheduleLifetimeMonitor nextActiveDateIntervalForScheduleLifetime:v13 assertion:v6 date:v21];
      }

      if (v17) {
        id v22 = v17;
      }
      else {
        id v22 = objc_alloc_init(MEMORY[0x1E4F28C18]);
      }
      uint64_t v12 = v22;
LABEL_17:

LABEL_18:
      break;
    default:
      uint64_t v12 = 0;
      break;
  }

  return v12;
}

- (void)_forceConfigurationSyncIfNeededWithUpdateResult:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  BOOL v4 = [a3 assertions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (!v5)
  {

    goto LABEL_26;
  }
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)v40;
  *(void *)&long long v6 = 138412546;
  long long v36 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v40 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      uint64_t v11 = (void *)DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = v11;
        id v24 = [v10 source];
        uint64_t v25 = [v24 deviceIdentifier];
        *(_DWORD *)buf = v36;
        id v44 = v25;
        __int16 v45 = 2112;
        uint64_t v46 = v10;
        _os_log_debug_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEBUG, "Checking configuration from %@ for %@", buf, 0x16u);
      }
      uint64_t v12 = objc_msgSend(v10, "source", v36);
      id v13 = [v12 deviceIdentifier];

      if (v13)
      {
        uint64_t v14 = [v10 details];
        BOOL v15 = [v14 modeIdentifier];

        uint64_t v16 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager modeConfigurationForModeIdentifier:v15 withError:0];
        if (v16)
        {
          __int16 v17 = (void *)v16;
          uint64_t v18 = [v10 details];
          id v19 = [v18 modeConfigurationModifiedDate];

          uint64_t v20 = [v17 lastModified];
          [v19 timeIntervalSinceDate:v20];
          double v22 = v21;

          if (v22 <= 1.0)
          {

            continue;
          }
          id v28 = v15;
          uint64_t v29 = (void *)DNDSLogGeneral;
          if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = v29;
            __int16 v31 = [v17 lastModified];
            *(_DWORD *)buf = 138412802;
            id v44 = v28;
            __int16 v45 = 2112;
            uint64_t v46 = v19;
            __int16 v47 = 2112;
            v48 = v31;
            _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_DEFAULT, "Configuration for %@ is out of date. %@ < %@", buf, 0x20u);
          }
        }
        else
        {
          id v26 = v15;
          uint64_t v27 = DNDSLogGeneral;
          if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v44 = v26;
            _os_log_impl(&dword_1D3052000, v27, OS_LOG_TYPE_DEFAULT, "Unable to find configuration for %@. It may not yet exist on this device.", buf, 0xCu);
          }
        }

        goto LABEL_22;
      }
    }
    uint64_t v7 = [v4 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v7) {
      continue;
    }
    break;
  }
  BOOL v15 = 0;
LABEL_22:

  if (v15)
  {
    id v32 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v15;
      _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Requesting configuration sync for stale mode %@.", buf, 0xCu);
    }
    [(DNDSIDSSyncEngine *)self->_idsSyncEngine sync];
    syncEngine = self->_syncEngine;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __62__DNDSServer__forceConfigurationSyncIfNeededWithUpdateResult___block_invoke;
    v37[3] = &unk_1E69758C8;
    id v38 = v15;
    id v34 = v15;
    [(DNDSSyncEngine *)syncEngine fetchChanges:1 withCompletionHandler:v37];

    return;
  }
LABEL_26:
  id v35 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v35, OS_LOG_TYPE_INFO, "Mode configuration is up to date.", buf, 2u);
  }
}

void __62__DNDSServer__forceConfigurationSyncIfNeededWithUpdateResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = DNDSLogGeneral;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
      __62__DNDSServer__forceConfigurationSyncIfNeededWithUpdateResult___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Updated configurations succesfully synced for %@.", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:(id)a3 error:(id *)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(DNDSModeAssertionManager *)self->_modeAssertionManager updateModeAssertionsWithContextHandler:a3 error:a4];
  uint64_t v5 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    uint64_t v7 = [v4 assertions];
    *(_DWORD *)buf = 138543362;
    v88 = v7;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Mode assertion update result:\n assertions=%{public}@", buf, 0xCu);
  }
  uint64_t v8 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v4 invalidations];
    *(_DWORD *)buf = 138543362;
    v88 = v10;
    _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Mode assertion update result:\n invalidations=%{public}@", buf, 0xCu);
  }
  uint64_t v11 = [v4 assertions];
  if ([v11 count])
  {

LABEL_8:
    uint64_t v14 = self;
    [(DNDSRemoteServiceProvider *)self->_serviceProvider handleModeAssertionUpdateResult:v4];
    [(DNDSServer *)self _forceConfigurationSyncIfNeededWithUpdateResult:v4];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v60 = v4;
    id obj = [v4 invalidations];
    uint64_t v70 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    if (v70)
    {
      unsigned __int8 v64 = 0;
      int v15 = 0;
      char v16 = 0;
      int v62 = 0;
      unsigned __int8 v17 = 0;
      int v18 = 0;
      uint64_t v68 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v70; ++i)
        {
          if (*(void *)v82 != v68) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          clientDetailsProvider = v14->_clientDetailsProvider;
          double v22 = [v20 source];
          uint64_t v23 = [v22 clientIdentifier];
          id v24 = [(DNDSClientDetailsProvider *)clientDetailsProvider clientDetailsForIdentifier:v23];

          if ([v24 isUserInteractionClient])
          {
            int v62 = 1;
          }
          else
          {
            [v20 reason];
            [v20 reasonOverride];
            unint64_t v25 = DNDResolvedModeAssertionInvalidationReason();
            if (v25 > 8 || ((1 << v25) & 0x182) == 0)
            {
              int v15 = 1;
            }
            else
            {
              uint64_t v27 = [v20 assertion];
              id v28 = [v27 source];
              uint64_t v29 = [v28 clientIdentifier];
              BOOL v30 = v29 != @"com.apple.donotdisturb.private.schedule";
              int v31 = v15;
              BOOL v32 = v29 == @"com.apple.donotdisturb.private.schedule";

              v64 |= v32;
              int v15 = v31 | v30;
              uint64_t v14 = self;
              char v16 = 1;
            }
          }
          long long v33 = [v20 source];
          id v34 = [v33 deviceIdentifier];
          v17 |= v34 != 0;

          v18 |= [v24 forcesAssertionStatusUpdate];
        }
        uint64_t v70 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
      }
      while (v70);
    }
    else
    {
      unsigned __int8 v64 = 0;
      int v15 = 0;
      char v16 = 0;
      int v62 = 0;
      unsigned __int8 v17 = 0;
      int v18 = 0;
    }
    char v58 = v16;
    int v59 = v15;

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v63 = [v60 assertions];
    uint64_t v35 = [v63 countByEnumeratingWithState:&v77 objects:v85 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      unsigned __int8 v69 = 0;
      int v71 = 0;
      int v61 = 0;
      unsigned __int8 v37 = 0;
      id obja = *(id *)v78;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(id *)v78 != obja) {
            objc_enumerationMutation(v63);
          }
          long long v39 = *(void **)(*((void *)&v77 + 1) + 8 * j);
          long long v40 = v14->_clientDetailsProvider;
          long long v41 = [v39 source];
          long long v42 = [v41 clientIdentifier];
          int v43 = [(DNDSClientDetailsProvider *)v40 clientDetailsForIdentifier:v42];

          if ([v43 isUserInteractionClient])
          {
            int v61 = 1;
          }
          else
          {
            id v44 = [v39 source];
            __int16 v45 = [v44 clientIdentifier];
            BOOL v46 = v45 != @"com.apple.donotdisturb.private.schedule";
            BOOL v47 = v45 == @"com.apple.donotdisturb.private.schedule";

            v69 |= v47;
            uint64_t v14 = self;
            v71 |= v46;
          }
          v48 = [v39 source];
          v49 = [v48 deviceIdentifier];
          v37 |= v49 != 0;

          v18 |= [v43 forcesAssertionStatusUpdate];
        }
        uint64_t v36 = [v63 countByEnumeratingWithState:&v77 objects:v85 count:16];
      }
      while (v36);
    }
    else
    {
      unsigned __int8 v69 = 0;
      int v71 = 0;
      int v61 = 0;
      unsigned __int8 v37 = 0;
    }

    if ((v61 | v62))
    {
      uint64_t v50 = 1;
      BOOL v4 = v60;
    }
    else
    {
      BOOL v4 = v60;
      if ((v71 | v59))
      {
        uint64_t v50 = 6;
      }
      else
      {
        uint64_t v51 = 2;
        if (v58) {
          uint64_t v51 = 3;
        }
        uint64_t v50 = 5;
        if (((v69 | v64) & 1) == 0) {
          uint64_t v50 = v51;
        }
      }
    }
    uint64_t v52 = 1;
    if ((v37 | v17)) {
      uint64_t v52 = 2;
    }
    id v53 = v14;
    queue = v14->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__DNDSServer__updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler_error___block_invoke;
    block[3] = &unk_1E69758F0;
    void block[4] = v53;
    uint64_t v74 = v50;
    uint64_t v75 = v52;
    if (v18) {
      uint64_t v55 = 3;
    }
    else {
      uint64_t v55 = 1;
    }
    uint64_t v76 = v55;
    id v73 = v4;
    dispatch_async(queue, block);

    goto LABEL_51;
  }
  uint64_t v12 = [v4 invalidations];
  uint64_t v13 = [v12 count];

  if (v13) {
    goto LABEL_8;
  }
  uint64_t v57 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v57, OS_LOG_TYPE_DEFAULT, "Ignored update as it changed nothing", buf, 2u);
  }
LABEL_51:
  return v4;
}

void __86__DNDSServer__updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:options:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__DNDSServer__updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler_error___block_invoke_2;
  aBlock[3] = &unk_1E6975768;
  id v4 = *(id *)(a1 + 40);
  id v2 = (void (**)(void *, void))_Block_copy(aBlock);
  v2[2](v2, *(void *)(*(void *)(a1 + 32) + 208));
  v2[2](v2, *(void *)(*(void *)(a1 + 32) + 216));
}

void __86__DNDSServer__updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 updateForModeAssertionUpdateResult:*(void *)(a1 + 32)];
  }
}

- (id)_allModes
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(DNDSModeConfigurationManager *)self->_modeConfigurationManager availableModesFilteringPlaceholders:0 returningError:0];
  uint64_t v5 = [(DNDSPlaceholderModeManager *)self->_placeholderModeManager placeholderModesWithError:0];
  double v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isPlaceholder == NO"];
  uint64_t v20 = objc_msgSend(v4, "filteredArrayUsingPredicate:");
  objc_msgSend(v3, "addObjectsFromArray:");
  id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NONE %@.modeIdentifier == modeIdentifier", v4];
  int v18 = objc_msgSend(v5, "filteredArrayUsingPredicate:");
  objc_msgSend(v3, "addObjectsFromArray:");
  int v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isPlaceholder == YES"];
  uint64_t v7 = [v4 filteredArrayUsingPredicate:v6];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %@.modeIdentifier == modeIdentifier", v7];
  double v22 = v5;
  id v9 = [v5 filteredArrayUsingPredicate:v8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = [MEMORY[0x1E4F5F5F8] placeholderModeFromMode:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        [v3 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  char v16 = (void *)[v3 copy];
  return v16;
}

- (void)_queue_handlePairedDeviceAndSyncSettingsChange
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor cloudDevices];
  id v4 = [(DNDSSettingsManager *)self->_settingsManager syncSettingsWithError:0];
  uint64_t v5 = [(DNDSPairedDeviceStateMonitor *)self->_pairedDeviceStateMonitor pairedDevice];
  int v6 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543874;
    uint64_t v27 = v5;
    __int16 v28 = 2114;
    uint64_t v29 = v3;
    __int16 v30 = 2114;
    int v31 = v4;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Current DND sync status: local device=%{public}@, cloud devices=%{public}@, settings=%{public}@", (uint8_t *)&v26, 0x20u);
  }
  assertionSyncManager = self->_assertionSyncManager;
  self->_assertionSyncManager = 0;

  legacyAssertionSyncManager = self->_legacyAssertionSyncManager;
  self->_legacyAssertionSyncManager = 0;

  settingsSyncManager = self->_settingsSyncManager;
  self->_settingsSyncManager = 0;

  [(DNDSIDSSyncEngine *)self->_idsSyncEngine setPairedDevice:0 syncEnabled:0];
  id v10 = [[DNDSIDSSyncService alloc] initWithIDSService:self->_idsCloudService];
  uint64_t v11 = [MEMORY[0x1E4F5F5C8] currentDevice];
  if ([v11 deviceClass] == 1)
  {

LABEL_6:
    if ([v5 deviceClass] == 3 && objc_msgSend(v5, "assertionSyncProtocolVersion") == 1)
    {
      uint64_t v14 = [[DNDSLegacyAssertionSyncManager alloc] initWithClientDetailsProvider:self->_clientDetailsProvider pairedDevice:v5];
      int v15 = self->_legacyAssertionSyncManager;
      self->_legacyAssertionSyncManager = (DNDSAssertionSyncManager *)v14;

      char v16 = +[DNDSLegacySettingsSyncManager sendManagerForPairedDevice:v5];
      unsigned __int8 v17 = self->_settingsSyncManager;
      self->_settingsSyncManager = v16;
    }
    else
    {
      if ([v5 deviceClass])
      {
        int v18 = [[DNDSIDSSyncService alloc] initWithIDSService:self->_idsLocalService];
        id v19 = [MEMORY[0x1E4F5F5C8] currentDevice];
        if ([v19 deviceClass] == 1)
        {
          uint64_t v20 = [v5 deviceClass];

          if (v20 == 3)
          {
            if ((unint64_t)[v5 configurationSyncProtocolVersion] > 8)
            {
              +[DNDSLegacyAssertionSyncManager cleanupState];
              +[DNDSLegacySettingsSyncManager cleanupState];
            }
            else
            {
              double v21 = +[DNDSLegacySettingsSyncManager sendManagerForPairedDevice:v5];
              double v22 = self->_settingsSyncManager;
              self->_settingsSyncManager = v21;
            }
          }
        }
        else
        {
        }
        goto LABEL_18;
      }
      +[DNDSLegacyAssertionSyncManager cleanupState];
      +[DNDSLegacySettingsSyncManager cleanupState];
    }
    int v18 = 0;
LABEL_18:
    long long v24 = [[DNDSModernAssertionSyncManager alloc] initWithClientDetailsProvider:self->_clientDetailsProvider localSyncService:v18 cloudSyncService:v10 keybag:self->_keybag];
    long long v25 = self->_assertionSyncManager;
    self->_assertionSyncManager = (DNDSAssertionSyncManager *)v24;

    -[DNDSIDSSyncEngine setPairedDevice:syncEnabled:](self->_idsSyncEngine, "setPairedDevice:syncEnabled:", v5, [v4 isPairSyncEnabled]);
    [(DNDSSyncEngine *)self->_syncEngine pairedDeviceDidChange];
    goto LABEL_19;
  }
  uint64_t v12 = [MEMORY[0x1E4F5F5C8] currentDevice];
  uint64_t v13 = [v12 deviceClass];

  if (v13 == 5) {
    goto LABEL_6;
  }
  long long v23 = [[DNDSModernAssertionSyncManager alloc] initWithClientDetailsProvider:self->_clientDetailsProvider localSyncService:0 cloudSyncService:v10 keybag:self->_keybag];
  int v18 = (DNDSIDSSyncService *)self->_assertionSyncManager;
  self->_assertionSyncManager = (DNDSAssertionSyncManager *)v23;
LABEL_19:

  [(DNDSAssertionSyncManager *)self->_assertionSyncManager setDataSource:self];
  [(DNDSAssertionSyncManager *)self->_assertionSyncManager setDelegate:self];
  [(DNDSAssertionSyncManager *)self->_assertionSyncManager resume];
  [(DNDSAssertionSyncManager *)self->_legacyAssertionSyncManager setDataSource:self];
  [(DNDSAssertionSyncManager *)self->_legacyAssertionSyncManager setDelegate:self];
  [(DNDSAssertionSyncManager *)self->_legacyAssertionSyncManager resume];
  [(DNDSSettingsSyncManager *)self->_settingsSyncManager setDataSource:self];
  [(DNDSSettingsSyncManager *)self->_settingsSyncManager setDelegate:self];
  [(DNDSSettingsSyncManager *)self->_settingsSyncManager resume];
  -[DNDSRemoteServiceProvider handleUpdatedPairSyncState:](self->_serviceProvider, "handleUpdatedPairSyncState:", [v4 isPairSyncEnabled]);
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (unint64_t)lostModeState
{
  return self->_lostModeState;
}

- (void)setLostModeState:(unint64_t)a3
{
  self->_lostModeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsManager, 0);
  objc_storeStrong((id *)&self->_modeConfigurationManager, 0);
  objc_storeStrong((id *)&self->_modeAssertionManager, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_focusStatusDomainPublisher, 0);
  objc_storeStrong((id *)&self->_userAvailabilityCoordinator, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_appInfoCache, 0);
  objc_storeStrong((id *)&self->_contactMonitor, 0);
  objc_storeStrong((id *)&self->_placeholderModeManager, 0);
  objc_storeStrong((id *)&self->_modeConfigurationsStore, 0);
  objc_storeStrong((id *)&self->_globalConfigurationManager, 0);
  objc_storeStrong((id *)&self->_globalConfigurationStore, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_focusConfigurationEventPublisher, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_idsSyncEngine, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_pairedDeviceStateMonitor, 0);
  objc_storeStrong((id *)&self->_idsCloudService, 0);
  objc_storeStrong((id *)&self->_idsLocalService, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_settingsSyncManager, 0);
  objc_storeStrong((id *)&self->_legacyAssertionSyncManager, 0);
  objc_storeStrong((id *)&self->_assertionSyncManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationServiceProvider, 0);
  objc_storeStrong((id *)&self->_availabilityServiceProvider, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_eventBehaviorResolver, 0);
  objc_storeStrong((id *)&self->_stateProvider, 0);
  objc_storeStrong((id *)&self->_meDeviceService, 0);
  objc_storeStrong((id *)&self->_workoutTriggerManager, 0);
  objc_storeStrong((id *)&self->_smartTriggerManager, 0);
  objc_storeStrong((id *)&self->_sleepingTriggerManager, 0);
  objc_storeStrong((id *)&self->_mindfulnessTriggerManager, 0);
  objc_storeStrong((id *)&self->_intelligentBehaviorResolver, 0);
  objc_storeStrong((id *)&self->_hearingTestTriggerManager, 0);
  objc_storeStrong((id *)&self->_gamingTriggerManager, 0);
  objc_storeStrong((id *)&self->_drivingTriggerManager, 0);
  objc_storeStrong((id *)&self->_biomeDonationManager, 0);
  objc_storeStrong((id *)&self->_auxiliaryStateMonitor, 0);
  objc_storeStrong((id *)&self->_appForegroundTriggerManager, 0);
  objc_storeStrong((id *)&self->_systemFocusConfigurationCoordinator, 0);
  objc_storeStrong((id *)&self->_appFocusConfigurationCoordinator, 0);
  objc_storeStrong((id *)&self->_scheduleManager, 0);
  objc_storeStrong((id *)&self->_lifetimeMonitors, 0);
  objc_storeStrong((id *)&self->_locationLifetimeMonitor, 0);
  objc_storeStrong((id *)&self->_scheduleLifetimeMonitor, 0);
  objc_storeStrong((id *)&self->_calendarEventLifetimeMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)pairedCloudDevicesForSyncManager:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1D3052000, v0, OS_LOG_TYPE_DEBUG, "Paired cloud devices: %@", v1, 0xCu);
}

- (void)pairedDevicesForSyncManager:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1D3052000, v0, OS_LOG_TYPE_DEBUG, "Paired devices: %@", v1, 0xCu);
}

- (void)syncManager:(void *)a1 updateOutboundModeAssertion:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [a2 modeIdentifier];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1D3052000, v3, OS_LOG_TYPE_FAULT, "Unable to find mode configuration for mode %@", v5, 0xCu);
}

- (void)syncManager:performModeAssertionUpdatesWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "Error when performing update for sync manager; manager=%{public}@, error=%{public}@");
}

void __50__DNDSServer_syncManager_prepareForSyncToDevices___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error while requesting settings sync for Focus sync. %@", v2, v3, v4, v5, v6);
}

- (void)syncManager:didReceiveUpdatedPhoneCallBypassSettings:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error replacing bypass settings in default mode: %{public}@", v2, v3, v4, v5, v6);
}

- (void)syncManager:didReceiveUpdatedPhoneCallBypassSettings:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error fetching default mode: %{public}@", v2, v3, v4, v5, v6);
}

- (void)remoteServiceProvider:setCloudSyncPreferenceEnabled:withError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unable to fetch incompatible mode configurations for reset: error=%{public}@", v2, v3, v4, v5, v6);
}

void __59__DNDSServer_remoteServiceProvider_allModesReturningError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error fetching changes: %@", v2, v3, v4, v5, v6);
}

void __73__DNDSServer_remoteServiceProvider_syncModeConfigurationsReturningError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error sending changes: %@", v2, v3, v4, v5, v6);
}

void __62__DNDSServer__forceConfigurationSyncIfNeededWithUpdateResult___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, a2, a3, "Failed to sync updated configurations for synced %@ assertion. Error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end