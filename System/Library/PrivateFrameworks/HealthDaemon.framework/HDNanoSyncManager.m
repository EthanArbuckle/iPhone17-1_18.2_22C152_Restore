@interface HDNanoSyncManager
- (BOOL)enablePeriodicSyncTimer;
- (BOOL)isMaster;
- (HDNanoSyncManager)initWithProfile:(id)a3 isMaster:(BOOL)a4;
- (HDPairedSyncManager)pairedSyncManager;
- (HKNanoSyncPairedDevicesSnapshot)pairedDevicesSnapshot;
- (double)restoreTimeout;
- (id)_queue_eligibleInactiveSyncStores;
- (id)_queue_syncStoreForIDSDevice:(uint64_t)a1 updateIfNecessary:(void *)a2;
- (id)_queue_validatedSyncStore:(void *)a3 device:(void *)a4 message:(uint64_t)a5 error:;
- (id)diagnosticDescription;
- (uint64_t)_queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:(uint64_t)a1;
- (uint64_t)_queue_isRestoreCompleteForSyncStore:(uint64_t)a3 error:;
- (void)_deviceDidBecomeActive:(id)a3;
- (void)_deviceDidPair:(id)a3;
- (void)_deviceDidUnpair:(id)a3;
- (void)_handleIncomingRequest:(void *)a3 usingBlock:;
- (void)_handleIncomingResponse:(void *)a3 usingBlock:;
- (void)_handleOutgoingMessageError:(void *)a3 usingBlock:;
- (void)_invalidate;
- (void)_logIncomingRequest:(uint64_t)a1;
- (void)_logOutgoingMessageError:(uint64_t)a1;
- (void)_notifyObserversPairedDevicesChanged:(uint64_t)a1;
- (void)_queue_generateWatchActivationSamples;
- (void)_queue_handleTinkerOptInNotification:(uint64_t)a1;
- (void)_queue_performNextProactiveSyncWithRemainingDevices:(void *)a3 accessibilityAssertion:(void *)a4 completion:;
- (void)_queue_sendChangeSet:(void *)a3 status:(void *)a4 session:(void *)a5 completion:;
- (void)_queue_sendRequest:(uint64_t)a3 syncStore:;
- (void)_queue_sendResponse:(void *)a3 syncStore:;
- (void)_queue_setUpMessageCentersIfNecessary;
- (void)_queue_syncImmediatelyWithReason:(uint64_t)a3 options:(void *)a4 accessibilityAssertion:(void *)a5 completion:;
- (void)_queue_synchronizeWithOptions:(void *)a3 restoreMessagesSentHandler:(void *)a4 targetSyncStore:(void *)a5 reason:(void *)a6 accessibilityAssertion:(void *)a7 completion:;
- (void)_queue_transitionToRestoreCompleteWithSyncStore:(uint64_t)a1;
- (void)_queue_transitionToRestoreIncompleteWithSyncStore:(void *)a3 error:;
- (void)_queue_updateDeviceNameIfNecessaryWithSyncStore:(uint64_t)a1;
- (void)_queue_updateSyncStores;
- (void)_queue_updateSyncStoresWithCompletion:(uint64_t)a1;
- (void)_queue_updateTinkerSyncStore;
- (void)_scheduleResetReceivedNanoSyncAnchorsForHFD;
- (void)_sendFinalMessageForSyncSession:(void *)a3 status:(uint64_t)a4 success:(void *)a5 error:;
- (void)_sendFinalStatusMessageForSyncSession:(char)a3 didFinishSuccessfully:(void *)a4 error:;
- (void)_syncImmediatelyWithReason:(uint64_t)a3 options:;
- (void)_userCharacteristicsDidChange:(id)a3;
- (void)_userPreferencesDidChange:(id)a3;
- (void)_watchOffWristNotification:(id)a3;
- (void)_workoutSamplesWereAssociated:(id)a3;
- (void)addObserver:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)foregroundClientProcessesDidChange:(id)a3 previouslyForegroundBundleIdentifiers:(id)a4;
- (void)initializeMessageCenterIfNeeded;
- (void)invalidateAndWait;
- (void)messageCenter:(id)a3 activeDeviceDidChange:(id)a4 acknowledgementHandler:(id)a5;
- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4;
- (void)messageCenter:(id)a3 didResolveIDSIdentifierForResponse:(id)a4;
- (void)messageCenterChangesError:(id)a3;
- (void)messageCenterDidReceiveAuthorizationCompleteRequest:(id)a3;
- (void)messageCenterDidReceiveAuthorizationError:(id)a3;
- (void)messageCenterDidReceiveAuthorizationRequest:(id)a3;
- (void)messageCenterDidReceiveAuthorizationResponse:(id)a3;
- (void)messageCenterDidReceiveChangesRequest:(id)a3;
- (void)messageCenterDidReceiveChangesResponse:(id)a3;
- (void)messageCenterDidReceiveCompanionUserNotificationError:(id)a3;
- (void)messageCenterDidReceiveCompanionUserNotificationRequest:(id)a3;
- (void)messageCenterDidReceiveCompanionUserNotificationResponse:(id)a3;
- (void)messageCenterDidReceiveNotificationInstructionRequest:(id)a3;
- (void)messageCenterDidReceiveRestoreRequest:(id)a3;
- (void)messageCenterDidReceiveRestoreResponse:(id)a3;
- (void)messageCenterDidReceiveRoutineRequest:(id)a3;
- (void)messageCenterDidReceiveStartWorkoutAppError:(id)a3;
- (void)messageCenterDidReceiveStartWorkoutAppRequest:(id)a3;
- (void)messageCenterDidReceiveStartWorkoutAppResponse:(id)a3;
- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncError:(id)a3;
- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncRequest:(id)a3;
- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncResponse:(id)a3;
- (void)messageCenterDidReceiveTinkerOptInError:(id)a3;
- (void)messageCenterDidReceiveTinkerOptInRequest:(id)a3;
- (void)messageCenterDidReceiveTinkerOptInResponse:(id)a3;
- (void)messageCenterDidReceiveTinkerPairingError:(id)a3;
- (void)messageCenterDidReceiveTinkerPairingRequest:(id)a3;
- (void)messageCenterDidReceiveTinkerPairingResponse:(id)a3;
- (void)messageCenterRestoreError:(id)a3;
- (void)nanoSyncStore:(id)a3 deviceNameDidChange:(id)a4;
- (void)nanoSyncStore:(id)a3 remoteSystemBuildVersionDidChange:(id)a4;
- (void)nanoSyncStore:(id)a3 restoreStateDidChange:(int64_t)a4;
- (void)obliterateWithOptions:(unint64_t)a3 reason:(id)a4;
- (void)pairedSyncDidBeginForDevice:(id)a3 messagesSentHandler:(id)a4 completion:(id)a5;
- (void)persistChildIdentityFromCodable:(uint64_t)a1;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestAuthorizationForRequestRecord:(id)a3 requestSentHandler:(id)a4 completion:(id)a5;
- (void)resetSyncWithCompletion:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)sendCompanionUserNotificationRequest:(id)a3 completion:(id)a4;
- (void)sendNotificationInstructionMessageRequest:(id)a3 completion:(id)a4;
- (void)sendStartWorkoutAppRequest:(id)a3 completion:(id)a4;
- (void)sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID:(id)a3 completion:(id)a4;
- (void)sendTinkerSharingOptInRequest:(id)a3 forNRDeviceUUID:(id)a4 completion:(id)a5;
- (void)sendTinkerWatchPairingRequest:(id)a3 forNRDeviceUUID:(id)a4 completion:(id)a5;
- (void)setEnablePeriodicSyncTimer:(BOOL)a3;
- (void)setRestoreTimeout:(double)a3;
- (void)syncHealthDataWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)syncHealthDataWithOptions:(unint64_t)a3 reason:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6;
- (void)syncHealthDataWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5;
- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5;
- (void)unitTest_performWithActiveSyncStore:(id)a3;
- (void)updatePairedDevicesWithCompletion:(id)a3;
- (void)waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation HDNanoSyncManager

void __61__HDNanoSyncManager__queue_startPeriodicSyncTimerIfNecessary__block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[7]);
    uint64_t v1 = [MEMORY[0x1E4F1C9C8] date];
    dispatch_queue_t v2 = WeakRetained[18];
    WeakRetained[18] = (dispatch_queue_t)v1;

    -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:]((uint64_t)WeakRetained, @"periodic sync timer fired", 0, 0, 0);
  }
}

- (uint64_t)_queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if (!*(unsigned char *)(a1 + 24)) {
    return 1;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(a1 + 9));
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 100, @"%@ invalidated", objc_opt_class());
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = [WeakRetained daemon];

  v7 = [v6 contentProtectionManager];
  uint64_t v8 = [v7 deviceUnlockedSinceBoot];

  if (v8)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 48));
      v10 = [v9 database];
      [v10 addProtectedDataObserver:a1 queue:*(void *)(a1 + 56)];
    }
    *(unsigned char *)(a1 + 24) = 0;
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v12 = objc_loadWeakRetained((id *)(a1 + 48));
    v13 = [v12 daemon];
    id v14 = [v13 nanoPairedDeviceRegistry];

    [v11 addObserver:a1 selector:sel__deviceDidPair_ name:*MEMORY[0x1E4F79EC0] object:v14];
    [v11 addObserver:a1 selector:sel__deviceDidUnpair_ name:*MEMORY[0x1E4F79EB8] object:v14];
    [v11 addObserver:a1 selector:sel__deviceDidBecomeActive_ name:*MEMORY[0x1E4F79E88] object:v14];
    id v15 = objc_loadWeakRetained((id *)(a1 + 48));
    v16 = [v15 daemon];
    v17 = [v16 processStateManager];
    [v17 registerForegroundClientProcessObserver:a1];

    -[HDNanoSyncManager _queue_setUpMessageCentersIfNecessary](a1);
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:a1 selector:sel__userCharacteristicsDidChange_ name:@"HDUserCharacteristicsShouldSyncNotification" object:0];
    [v18 addObserver:a1 selector:sel__userPreferencesDidChange_ name:@"HDHealthStoreServerUserPreferencesDidChangeNotification" object:0];

    v19 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    -[HDNanoSyncManager _queue_updateSyncStores](a1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_databaseInaccessibleBeforeFirstUnlockError");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v20;
    if (v20)
    {
      if (a2)
      {
        id v14 = v20;
        *a2 = v14;
      }
      else
      {
        _HKLogDroppedError();
      }
      v11 = v14;
    }
    else
    {
      v11 = 0;
    }
  }

  return v8;
}

- (void)_queue_updateSyncStores
{
  v66[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:sel__queue_updateSyncStores, a1, @"HDNanoSyncManager.m", 1498, @"Invalid parameter not satisfying: %@", @"_waitingForFirstUnlock == NO" object file lineNumber description];
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  id v2 = *(id *)(a1 + 120);
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned __int8 v4 = *(void **)(a1 + 120);
  *(void *)(a1 + 120) = v3;

  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v49 = a1;
  v6 = [*(id *)(a1 + 72) nanoSyncDevices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v57 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        if ([v11 isLocallyPaired]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v8);
  }

  uint64_t v12 = v49;
  v46 = v5;
  objc_storeStrong((id *)(v49 + 128), v5);
  v48 = [MEMORY[0x1E4F1CA48] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = *(id *)(v49 + 128);
  uint64_t v13 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (!v13)
  {
    id v50 = 0;
    goto LABEL_40;
  }
  uint64_t v14 = v13;
  id v50 = 0;
  uint64_t v15 = *(void *)v53;
  do
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      if (*(void *)v53 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v52 + 1) + 8 * j);
      v18 = objc_msgSend(v17, "hd_deviceIdentifier");
      v19 = [v2 objectForKeyedSubscript:v18];
      int v20 = [v19 isActive];
      if (v20 != [v17 isActive]) {
        [v19 invalidate];
      }
      if (v19 && ![v19 isInvalidated])
      {
        uint64_t v12 = v49;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v49 + 48));
        uint64_t v12 = v49;
        uint64_t v22 = +[HDNanoSyncStore nanoSyncStoreWithProfile:WeakRetained device:v17 delegate:v49 tinkerPaired:0];

        v19 = (void *)v22;
        if (!v22) {
          goto LABEL_36;
        }
      }
      if ([v19 isActive]) {
        BOOL v23 = v50 == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (!v23)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:sel__queue_updateSyncStores, v12, @"HDNanoSyncManager.m", 1536, @"Invalid parameter not satisfying: %@", @"![syncStore isActive] || (activeSyncStore == nil)" object file lineNumber description];
      }
      if ([v19 isActive])
      {
        if (v50)
        {
          _HKInitializeLogging();
          v24 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = *(void *)(v49 + 128);
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v25;
            _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "multiple active sync stores for IDS devices: %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          id v50 = v19;
        }
      }
      [*(id *)(v12 + 120) setObject:v19 forKeyedSubscript:v18];
      v26 = [v19 deviceInfo];
      [v48 addObject:v26];

LABEL_36:
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
  }
  while (v14);
LABEL_40:

  id v28 = *(id *)(v12 + 40);
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F2B260]) initWithPairedDeviceInfos:v48];
  objc_setProperty_atomic((id)v12, v30, v29, 40);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __44__HDNanoSyncManager__queue_updateSyncStores__block_invoke;
  v51[3] = &unk_1E62F71F0;
  v51[4] = v12;
  [v2 enumerateKeysAndObjectsUsingBlock:v51];

  v31 = v46;
  if (*(id *)(v12 + 96) != v50)
  {
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v50;
      _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "got new active paired device %{public}@", (uint8_t *)&buf, 0xCu);
    }
    objc_storeStrong((id *)(v12 + 96), v50);
    if (v50)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
      if (!*(void *)(v12 + 136) && [(id)v12 enablePeriodicSyncTimer])
      {
        dispatch_source_t v33 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v12 + 56));
        v34 = *(void **)(v12 + 136);
        *(void *)(v12 + 136) = v33;

        v35 = *(NSObject **)(v12 + 136);
        dispatch_time_t v36 = dispatch_walltime(0, 0);
        dispatch_source_set_timer(v35, v36, 0x1A3185C5000uLL, 0x45D964B800uLL);
        objc_initWeak(&location, (id)v12);
        v37 = *(NSObject **)(v12 + 136);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v64 = __61__HDNanoSyncManager__queue_startPeriodicSyncTimerIfNecessary__block_invoke;
        v65 = &unk_1E62F6BD0;
        objc_copyWeak(v66, &location);
        dispatch_source_set_event_handler(v37, &buf);
        dispatch_resume(*(dispatch_object_t *)(v49 + 136));
        uint64_t v12 = v49;
        objc_destroyWeak(v66);
        objc_destroyWeak(&location);
      }
      if (!CFPreferencesGetAppBooleanValue(@"SBIconVisibility", @"com.apple.Fitness", 0)
        || !CFPreferencesGetAppBooleanValue(@"SBIconVisibility", @"com.apple.Fitness.activity-widget", 0))
      {
        _HKInitializeLogging();
        v38 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "Showing fitness app. Setting defaults and notifying Springboard.", (uint8_t *)&buf, 2u);
        }
        v39 = (const void *)*MEMORY[0x1E4F1CFD0];
        CFStringRef v40 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
        CFStringRef v41 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
        CFPreferencesSetValue(@"SBIconVisibility", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.Fitness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
        CFPreferencesSetValue(@"SBIconVisibility", v39, @"com.apple.Fitness.activity-widget", v40, v41);
        CFPreferencesSynchronize(@"com.apple.Fitness", v40, v41);
        CFPreferencesSynchronize(@"com.apple.Fitness.activity-widget", v40, v41);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
        uint64_t v12 = v49;
        v31 = v46;
      }
      -[HDNanoSyncManager _queue_updateDeviceNameIfNecessaryWithSyncStore:](v12, v50);
    }
    else
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
      v43 = *(NSObject **)(v12 + 136);
      if (v43)
      {
        dispatch_source_cancel(v43);
        v44 = *(void **)(v12 + 136);
        *(void *)(v12 + 136) = 0;
      }
    }
    -[HDNanoSyncManager _queue_generateWatchActivationSamples](v12);
  }
  if (!v28 || ([v29 isEqual:v28] & 1) == 0) {
    -[HDNanoSyncManager _notifyObserversPairedDevicesChanged:](v12, v29);
  }
}

void __44__HDNanoSyncManager__queue_updateSyncStores__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:a2];

  v6 = v7;
  if (v5 != v7)
  {
    [v7 invalidate];
    v6 = v7;
  }
}

- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  id v8 = a5;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v10 = [WeakRetained daemon];
    v11 = [v10 behavior];
    char v12 = [v11 isAppleWatch];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [v16 syncStore];
      messageCenter = self->_messageCenter;
      uint64_t v15 = [v13 device];
      [(HDIDSMessageCenter *)messageCenter cancelPendingRequestsWithMessageID:7 device:v15];
    }
  }
  if ([v16 isPullRequest]) {
    -[HDNanoSyncManager _sendFinalStatusMessageForSyncSession:didFinishSuccessfully:error:]((uint64_t)self, v16, v6, v8);
  }
  else {
    -[HDNanoSyncManager _sendFinalMessageForSyncSession:status:success:error:]((uint64_t)self, v16, 0, v6, v8);
  }
}

- (void)_sendFinalMessageForSyncSession:(void *)a3 status:(uint64_t)a4 success:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    if ([v9 messageCount]
      || ([v9 isPullRequest] & 1) != 0
      || ([v9 isRequestedByRemote] & 1) != 0)
    {
      char v12 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__HDNanoSyncManager__sendFinalMessageForSyncSession_status_success_error___block_invoke;
      block[3] = &unk_1E62F77F0;
      char v18 = a4;
      id v14 = v9;
      id v15 = v11;
      uint64_t v16 = a1;
      id v17 = v10;
      dispatch_async(v12, block);
    }
    else
    {
      [v9 invokeCompletionWithSuccess:a4 error:v11];
    }
  }
}

- (HKNanoSyncPairedDevicesSnapshot)pairedDevicesSnapshot
{
  return (HKNanoSyncPairedDevicesSnapshot *)objc_getProperty(self, a2, 40, 1);
}

- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 changeSetWithChanges:a4 statusCode:1 error:0];
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__HDNanoSyncManager_syncSession_sendChanges_completion___block_invoke;
  v15[3] = &unk_1E62F2F48;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

void __56__HDNanoSyncManager_syncSession_sendChanges_completion___block_invoke(uint64_t a1)
{
}

- (void)_queue_sendChangeSet:(void *)a3 status:(void *)a4 session:(void *)a5 completion:
{
  unint64_t v9 = a2;
  unint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    id v13 = [v11 syncStore];
    id v20 = 0;
    int v14 = -[HDNanoSyncManager _queue_isRestoreCompleteForSyncStore:error:](a1, v13, (uint64_t)&v20);
    id v15 = v20;
    if (v14)
    {
      unsigned int v16 = v9 | v10;
      if (v9 | v10)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        id v18 = +[HDIDSOutgoingRequest changeRequestWithChangeSet:v9 status:v10 syncStore:v13 profile:WeakRetained];

        if ([v11 isLastChance]) {
          [v18 setPriority:1];
        }
        if ([(id)v10 statusCode] == 1) {
          [v18 setNonWaking:1];
        }
        -[HDNanoSyncManager _queue_sendRequest:syncStore:](a1, v18, (uint64_t)v13);
        [v11 incrementMessageCount];

        unsigned int v16 = 1;
      }
    }
    else
    {
      unsigned int v16 = 0;
    }
    if (v12)
    {
      uint64_t v19 = v16;
      if ((v16 & 1) == 0 && !v15)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Failed to send change set without reporting an error.");
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12[2](v12, v19, v15);
    }
  }
}

- (uint64_t)_queue_isRestoreCompleteForSyncStore:(uint64_t)a3 error:
{
  id v5 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if (!*(unsigned char *)(a1 + 24))
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_9:
    id v7 = @"missing sync store";
    goto LABEL_10;
  }
  unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:sel__queue_isRestoreCompleteForSyncStore_error_, a1, @"HDNanoSyncManager.m", 2801, @"Invalid parameter not satisfying: %@", @"_waitingForFirstUnlock == NO" object file lineNumber description];

  if (!v5) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v6 = [v5 restoreState];
  if ((unint64_t)(v6 - 1) < 2)
  {
    id v7 = @"restore is incomplete";
LABEL_10:
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 100, v7);
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  if (v6 != 3)
  {
    id v7 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = 1;
LABEL_11:

  return v8;
}

- (void)_queue_sendRequest:(uint64_t)a3 syncStore:
{
  id v8 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    id v5 = v8;
    if (v8)
    {
      if (a3)
      {
LABEL_4:
        [*(id *)(a1 + 72) sendRequest:v5];
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__queue_sendRequest_syncStore_, a1, @"HDNanoSyncManager.m", 989, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

      id v5 = 0;
      if (a3) {
        goto LABEL_4;
      }
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:sel__queue_sendRequest_syncStore_, a1, @"HDNanoSyncManager.m", 990, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

    id v5 = v8;
    goto LABEL_4;
  }
LABEL_5:
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = [v4 toParticipant];
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 nanoSyncDescription];
    unint64_t v9 = [v5 description];
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "resolved %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

void __74__HDNanoSyncManager__sendFinalMessageForSyncSession_status_success_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 3;
  }
  uint64_t v3 = [*(id *)(a1 + 32) changeSetWithChanges:0 statusCode:v2 error:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HDNanoSyncManager__sendFinalMessageForSyncSession_status_success_error___block_invoke_2;
  v7[3] = &unk_1E62F77C8;
  id v8 = v6;
  char v10 = *(unsigned char *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  -[HDNanoSyncManager _queue_sendChangeSet:status:session:completion:](v4, v3, v5, v8, v7);
}

- (void)messageCenterDidReceiveChangesResponse:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HDNanoSyncManager_messageCenterDidReceiveChangesResponse___block_invoke;
  v6[3] = &unk_1E62F71A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);
}

- (void)_handleIncomingResponse:(void *)a3 usingBlock:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6)
      {
LABEL_4:
        -[HDNanoSyncManager _logIncomingRequest:](a1, v5);
        id v8 = *(NSObject **)(a1 + 56);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__HDNanoSyncManager__handleIncomingResponse_usingBlock___block_invoke;
        block[3] = &unk_1E62F4E40;
        void block[4] = a1;
        id v12 = v5;
        id v13 = v7;
        dispatch_async(v8, block);

        goto LABEL_5;
      }
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__handleIncomingResponse_usingBlock_, a1, @"HDNanoSyncManager.m", 1090, @"Invalid parameter not satisfying: %@", @"response != nil" object file lineNumber description];

      if (v7) {
        goto LABEL_4;
      }
    }
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel__handleIncomingResponse_usingBlock_, a1, @"HDNanoSyncManager.m", 1091, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:
}

- (void)_logIncomingRequest:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 fromParticipant];
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [v4 nanoSyncDescription];
      id v9 = [v5 description];
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "received %{public}@ from %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __56__HDNanoSyncManager__handleIncomingResponse_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) fromParticipant];
  id v4 = [v3 device];
  id v5 = -[HDNanoSyncManager _queue_syncStoreForIDSDevice:updateIfNecessary:](v2, v4);

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = v6;
      id v9 = [v7 fromParticipant];
      int v10 = [v9 device];
      id v11 = [v10 description];
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "unable to find sync store for response from device %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)_queue_syncStoreForIDSDevice:(uint64_t)a1 updateIfNecessary:(void *)a2
{
  id v3 = a2;
  if (a1 && (dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56)), v3))
  {
    id v4 = objc_msgSend(v3, "hd_deviceIdentifier");
    id v5 = [*(id *)(a1 + 120) objectForKeyedSubscript:v4];
    if (!v5)
    {
      -[HDNanoSyncManager _queue_updateSyncStores](a1);
      id v5 = [*(id *)(a1 + 120) objectForKeyedSubscript:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __60__HDNanoSyncManager_messageCenterDidReceiveChangesResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = a2;
  id v6 = v5;
  if (!v3)
  {
    int v12 = v5;
    goto LABEL_22;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (v4)
  {
    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:sel__queue_receiveChangeResponse_syncStore_, v3, @"HDNanoSyncManager.m", 2710, @"Invalid parameter not satisfying: %@", @"response != nil" object file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:sel__queue_receiveChangeResponse_syncStore_, v3, @"HDNanoSyncManager.m", 2711, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

LABEL_4:
  id v7 = [v4 pbResponse];
  id v8 = [v7 status];
  uint64_t v9 = [v8 statusCode];
  -[HDNanoSyncManager persistChildIdentityFromCodable:](v3, v7);
  int v10 = [v4 fromParticipant];
  id v11 = [v10 device];
  id v38 = 0;
  int v12 = -[HDNanoSyncManager _queue_validatedSyncStore:device:message:error:](v3, v6, v11, v7, (uint64_t)&v38);
  id v13 = v38;

  if (!v12)
  {
    _HKInitializeLogging();
    id v20 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      uint64_t v22 = [v4 idsIdentifier];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "ignoring change response %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_21;
  }
  id v37 = v13;
  dispatch_time_t v36 = +[HKDaemonTransaction transactionWithOwner:v3 activityName:@"ReceiveChangeResponse"];
  id v14 = v7;
  id v15 = v12;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  *(void *)long long buf = 0;
  char v16 = -[HDNanoSyncManager _queue_isRestoreCompleteForSyncStore:error:](v3, v15, (uint64_t)buf);
  id v17 = *(id *)buf;
  id v18 = v17;
  if (v16)
  {
    if ([v14 hasStatus])
    {
      switch((int)v9)
      {
        case 0:
        case 4:
        case 5:
          objc_msgSend(NSString, "stringWithFormat:", @"unhandled status code %d", v9);
          uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v19) {
            goto LABEL_13;
          }
          goto LABEL_15;
        case 1:
        case 2:
          if ([v15 validatePairingUUIDsWithIncomingMessage:v14])
          {

            v27 = *(NSObject **)(v3 + 64);
            *(void *)long long buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __60__HDNanoSyncManager__queue_receiveChangeResponse_syncStore___block_invoke;
            CFStringRef v40 = &unk_1E62F7468;
            int v45 = v9;
            uint64_t v41 = v3;
            id v42 = v8;
            id v43 = v15;
            v24 = v36;
            id v44 = v36;
            dispatch_async(v27, buf);

            uint64_t v25 = 0;
            id v13 = v37;
            goto LABEL_20;
          }
          uint64_t v19 = @"invalid pairing UUIDs";
          goto LABEL_15;
        case 3:

          id WeakRetained = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Remote requested reactivation");
          -[HDNanoSyncManager _queue_transitionToRestoreIncompleteWithSyncStore:error:](v3, v15, WeakRetained);
          goto LABEL_33;
        case 6:
          if (*(unsigned char *)(v3 + 8))
          {
            uint64_t v19 = @"illegal obliteration request";
            goto LABEL_15;
          }

          _HKInitializeLogging();
          v31 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v32 = v31;
            dispatch_source_t v33 = [v4 idsIdentifier];
            *(_DWORD *)long long buf = 138543362;
            *(void *)&buf[4] = v33;
            _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "Obliterating in response to request %{public}@", buf, 0xCu);
          }
          id WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
          [WeakRetained obliterateAndTerminateWithOptions:1 reason:@"Requested by NanoSync remote" completion:0];
LABEL_33:

          uint64_t v25 = 0;
          v24 = v36;
          id v13 = v37;
          break;
        default:

          BOOL v23 = 0;
          goto LABEL_17;
      }
      goto LABEL_19;
    }
    uint64_t v19 = @"missing status content";
  }
  else
  {
    uint64_t v19 = [v17 description];
    if (!v19)
    {
LABEL_13:
      BOOL v23 = 0;
      goto LABEL_16;
    }
  }
LABEL_15:
  BOOL v23 = v19;
LABEL_16:

LABEL_17:
  v24 = v36;
  uint64_t v25 = v23;
  _HKInitializeLogging();
  v26 = (void *)*MEMORY[0x1E4F29FA8];
  id v13 = v37;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    id v28 = v26;
    v29 = [v4 idsIdentifier];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v25;
    _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "ignoring status response %{public}@: %{public}@", buf, 0x16u);
  }
LABEL_19:
  [v24 invalidate];
LABEL_20:

LABEL_21:
LABEL_22:
}

void __60__HDNanoSyncManager__queue_receiveChangeResponse_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(_DWORD *)(a1 + 64) == 2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v4 = [WeakRetained syncEngine];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = 0;
  char v7 = [v4 applyAcknowledgedAnchorMap:v5 forStore:v6 resetNext:v2 resetInvalid:1 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v12 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "failed to apply received anchors: %{public}@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 56) invalidate];
}

- (void)messageCenterDidReceiveChangesRequest:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__HDNanoSyncManager_messageCenterDidReceiveChangesRequest___block_invoke;
  v12[3] = &unk_1E62F71C8;
  v12[4] = self;
  id v13 = v4;
  id v5 = v4;
  uint64_t v6 = v12;
  if (self)
  {
    if (!v5)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__syncronouslyHandleIncomingRequest_usingBlock_, self, @"HDNanoSyncManager.m", 1107, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];
    }
    -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v5);
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__HDNanoSyncManager__syncronouslyHandleIncomingRequest_usingBlock___block_invoke;
    block[3] = &unk_1E62F7150;
    void block[4] = self;
    id v15 = v5;
    uint64_t v9 = v6;
    dispatch_semaphore_t v16 = v7;
    id v17 = v9;
    id v10 = v7;
    dispatch_sync(queue, block);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_handleIncomingRequest:(void *)a3 usingBlock:
{
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6)
      {
LABEL_4:
        -[HDNanoSyncManager _logIncomingRequest:](a1, v5);
        id v8 = *(NSObject **)(a1 + 56);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__HDNanoSyncManager__handleIncomingRequest_usingBlock___block_invoke;
        block[3] = &unk_1E62F4E40;
        void block[4] = a1;
        id v12 = v5;
        id v13 = v7;
        dispatch_async(v8, block);

        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__handleIncomingRequest_usingBlock_, a1, @"HDNanoSyncManager.m", 1072, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

      if (v7) {
        goto LABEL_4;
      }
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel__handleIncomingRequest_usingBlock_, a1, @"HDNanoSyncManager.m", 1073, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:
}

void __55__HDNanoSyncManager__handleIncomingRequest_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) fromParticipant];
  id v4 = [v3 device];
  id v5 = -[HDNanoSyncManager _queue_syncStoreForIDSDevice:updateIfNecessary:](v2, v4);

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v7 = *(void **)(a1 + 40);
      id v8 = v6;
      uint64_t v9 = [v7 fromParticipant];
      id v10 = [v9 device];
      id v11 = [v10 description];
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "unable to find sync store for request from device %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __59__HDNanoSyncManager_messageCenterDidReceiveChangesRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = a2;
  id v38 = a3;
  if (!v5)
  {
    v39 = v7;
    goto LABEL_24;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
  if (v6)
  {
    if (v7) {
      goto LABEL_4;
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:sel__queue_receiveChangeRequest_syncStore_completion_, v5, @"HDNanoSyncManager.m", 2470, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_4;
    }
  }
  dispatch_source_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:sel__queue_receiveChangeRequest_syncStore_completion_, v5, @"HDNanoSyncManager.m", 2471, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

LABEL_4:
  HDSetHealthInUseDefaultWithReason(@"Received sync data.");
  id v8 = [v6 pbRequest];
  id v37 = [v8 changeSet];
  CFStringRef v40 = [v8 status];
  int v35 = [v40 statusCode];
  -[HDNanoSyncManager persistChildIdentityFromCodable:](v5, v8);
  uint64_t v9 = [v6 fromParticipant];
  id v10 = [v9 device];
  id v43 = 0;
  v39 = -[HDNanoSyncManager _queue_validatedSyncStore:device:message:error:](v5, v7, v10, v8, (uint64_t)&v43);
  id v36 = v43;

  if (!v39)
  {
    _HKInitializeLogging();
    id v18 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v18;
      id v20 = [v6 idsIdentifier];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v36;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "ignoring change request %{public}@: %{public}@", buf, 0x16u);
    }
    v38[2]();
    goto LABEL_23;
  }
  v34 = +[HKDaemonTransaction transactionWithOwner:v5 activityName:@"ReceiveChangeRequest"];
  id v11 = v8;
  id v12 = v39;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
  id v13 = [v11 decodedHealthPairingUUID];
  *(void *)long long buf = 0;
  if (!-[HDNanoSyncManager _queue_isRestoreCompleteForSyncStore:error:](v5, v12, (uint64_t)buf))
  {
    dispatch_semaphore_t v16 = @"restore incomplete";
    goto LABEL_14;
  }
  if (([v11 hasChangeSet] & 1) != 0 || objc_msgSend(v11, "hasStatus"))
  {
    uint64_t v14 = [v12 obliteratedDatabaseUUIDs];
    char v15 = [v14 containsObject:v13];

    if (v15)
    {
      dispatch_semaphore_t v16 = @"remote requires obliteration";
      uint64_t v17 = 3;
      goto LABEL_15;
    }
    if ([v12 validatePairingUUIDsWithIncomingMessage:v11])
    {
      dispatch_semaphore_t v16 = 0;
      uint64_t v17 = 1;
      goto LABEL_15;
    }
    dispatch_semaphore_t v16 = @"invalid pairing UUIDs";
LABEL_14:
    uint64_t v17 = 2;
    goto LABEL_15;
  }
  uint64_t v17 = 0;
  dispatch_semaphore_t v16 = @"missing changeset and status content";
LABEL_15:

  v21 = v16;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  int v22 = 3;
  BOOL v23 = v21;
  switch(v17)
  {
    case 1:
      int v42 = 1;
      v24 = -[HDNanoSyncManager _queue_eligibleInactiveSyncStores](v5);
      goto LABEL_22;
    case 2:
      goto LABEL_19;
    case 3:
      int v22 = 6;
      goto LABEL_19;
    default:
      int v22 = 0;
LABEL_19:
      int v42 = v22;
      _HKInitializeLogging();
      uint64_t v25 = (id)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v31 = [v6 idsIdentifier];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v23;
        _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "will not apply change request %{public}@: %{public}@", buf, 0x16u);
      }
      v24 = 0;
LABEL_22:
      v26 = *(NSObject **)(v5 + 64);
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke;
      int v45 = &unk_1E62F7440;
      uint64_t v46 = v5;
      uint64_t v55 = v17;
      id v47 = v37;
      id v48 = v12;
      id v27 = v6;
      long long v54 = v41;
      id v49 = v27;
      id v50 = v24;
      id v28 = v40;
      int v56 = v35;
      id v51 = v28;
      id v52 = v34;
      long long v53 = v38;
      id v29 = v34;
      id v30 = v24;
      dispatch_async(v26, buf);

      _Block_object_dispose(v41, 8);
      break;
  }
LABEL_23:

LABEL_24:
}

- (id)_queue_eligibleInactiveSyncStores
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [v2 dateByAddingTimeInterval:-604800.0];

  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 120), "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v10 isActive] & 1) == 0)
        {
          if ([v10 isRestoreComplete])
          {
            id v11 = [v10 lastInactiveDate];
            int v12 = objc_msgSend(v11, "hk_isAfterDate:", v3);

            if (v12) {
              [v4 addObject:v10];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_queue_sendResponse:(void *)a3 syncStore:
{
  id v13 = a2;
  id v5 = a3;
  if (!a1) {
    goto LABEL_7;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if (!v13)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel__queue_sendResponse_syncStore_, a1, @"HDNanoSyncManager.m", 997, @"Invalid parameter not satisfying: %@", @"response != nil" object file lineNumber description];

    if (v5) {
      goto LABEL_4;
    }
LABEL_11:
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__queue_sendResponse_syncStore_, a1, @"HDNanoSyncManager.m", 998, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v5) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = [v5 device];
  uint64_t v7 = [v13 toParticipant];
  uint64_t v8 = [v7 device];
  char v9 = objc_msgSend(v6, "hd_isEquivalentToDevice:", v8);

  if ((v9 & 1) == 0)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel__queue_sendResponse_syncStore_, a1, @"HDNanoSyncManager.m", 1001, @"Invalid parameter not satisfying: %@", @"[[syncStore device] hd_isEquivalentToDevice:[response.toParticipant device]]" object file lineNumber description];
  }
  [v5 configureOutgoingResponse:v13];
  [v13 send];
LABEL_7:
}

- (void)_queue_setUpMessageCentersIfNecessary
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 9));
    if ((v2 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      if (WeakRetained && !*(void *)(a1 + 72))
      {
        id v4 = [NSString stringWithFormat:@"com.apple.private.alloy.health.sync.db"];
        id v5 = [WeakRetained directoryURL];
        uint64_t v6 = [v5 URLByAppendingPathComponent:@"NanoSync" isDirectory:1];

        uint64_t v7 = [v6 URLByAppendingPathComponent:v4 isDirectory:0];
        uint64_t v8 = +[HDIDSMessageCenter createPersistentDictionaryWithURL:v7];
        char v9 = HKCreateSerialDispatchQueue();
        if (v8)
        {
          v32 = v7;
          id v10 = v6;
          id v11 = v9;
          int v12 = [HDIDSMessageCenter alloc];
          id v13 = objc_loadWeakRetained((id *)(a1 + 48));
          long long v14 = [v13 daemon];
          uint64_t v15 = [(HDIDSMessageCenter *)v12 initWithIDSServiceIdentifier:@"com.apple.private.alloy.health.sync.classc" persistentDictionary:v8 queue:v11 daemon:v14];
          long long v16 = *(void **)(a1 + 72);
          *(void *)(a1 + 72) = v15;

          id v17 = *(id *)(a1 + 72);
          [v17 addRequestHandler:sel_messageCenterDidReceiveRestoreRequest_ forMessageID:1];
          [v17 addResponseHandler:sel_messageCenterDidReceiveRestoreResponse_ forMessageID:1];
          [v17 addErrorHandler:sel_messageCenterRestoreError_ forMessageID:1];
          uint64_t v18 = objc_opt_class();
          [v17 mapPBRequest:v18 toResponse:objc_opt_class() messageID:1];
          [v17 addRequestHandler:sel_messageCenterDidReceiveChangesRequest_ forMessageID:2];
          [v17 addResponseHandler:sel_messageCenterDidReceiveChangesResponse_ forMessageID:2];
          [v17 addErrorHandler:sel_messageCenterChangesError_ forMessageID:2];
          dispatch_source_t v33 = v4;
          uint64_t v19 = objc_opt_class();
          [v17 mapPBRequest:v19 toResponse:objc_opt_class() messageID:2];
          [v17 addResponseHandler:sel_messageCenterDidReceiveAuthorizationResponse_ forMessageID:3];
          [v17 addRequestHandler:sel_messageCenterDidReceiveAuthorizationRequest_ forMessageID:3];
          [v17 addErrorHandler:sel_messageCenterDidReceiveAuthorizationError_ forMessageID:3];
          uint64_t v20 = objc_opt_class();
          [v17 mapPBRequest:v20 toResponse:objc_opt_class() messageID:3];
          [v17 addRequestHandler:sel_messageCenterDidReceiveAuthorizationCompleteRequest_ forMessageID:4];
          [v17 mapPBRequest:objc_opt_class() toResponse:0 messageID:4];
          [v17 addRequestHandler:sel_messageCenterDidReceiveRoutineRequest_ forMessageID:5];
          uint64_t v21 = objc_opt_class();
          [v17 mapPBRequest:v21 toResponse:objc_opt_class() messageID:5];
          char v9 = v11;
          uint64_t v6 = v10;
          uint64_t v7 = v32;
          [v17 addRequestHandler:sel_messageCenterDidReceiveChangesRequest_ forMessageID:7];
          [v17 addErrorHandler:sel_messageCenterChangesError_ forMessageID:7];
          uint64_t v22 = objc_opt_class();
          [v17 mapPBRequest:v22 toResponse:objc_opt_class() messageID:7];
          [v17 addRequestHandler:sel_messageCenterDidReceiveStartWorkoutAppRequest_ forMessageID:8];
          [v17 addResponseHandler:sel_messageCenterDidReceiveStartWorkoutAppResponse_ forMessageID:8];
          [v17 addErrorHandler:sel_messageCenterDidReceiveStartWorkoutAppError_ forMessageID:8];
          uint64_t v23 = objc_opt_class();
          [v17 mapPBRequest:v23 toResponse:objc_opt_class() messageID:8];
          [v17 addRequestHandler:sel_messageCenterDidReceiveCompanionUserNotificationRequest_ forMessageID:9];
          [v17 addResponseHandler:sel_messageCenterDidReceiveCompanionUserNotificationResponse_ forMessageID:9];
          [v17 addErrorHandler:sel_messageCenterDidReceiveCompanionUserNotificationError_ forMessageID:9];
          uint64_t v24 = objc_opt_class();
          [v17 mapPBRequest:v24 toResponse:objc_opt_class() messageID:9];

          id v25 = *(id *)(a1 + 72);
          [v25 addRequestHandler:sel_messageCenterDidReceiveTinkerOptInRequest_ forMessageID:11];
          [v25 addResponseHandler:sel_messageCenterDidReceiveTinkerOptInResponse_ forMessageID:11];
          [v25 addErrorHandler:sel_messageCenterDidReceiveTinkerOptInError_ forMessageID:11];
          uint64_t v26 = objc_opt_class();
          [v25 mapPBRequest:v26 toResponse:objc_opt_class() messageID:11];
          [v25 addRequestHandler:sel_messageCenterDidReceiveTinkerPairingRequest_ forMessageID:10];
          [v25 addResponseHandler:sel_messageCenterDidReceiveTinkerPairingResponse_ forMessageID:10];
          [v25 addErrorHandler:sel_messageCenterDidReceiveTinkerPairingError_ forMessageID:10];
          uint64_t v27 = objc_opt_class();
          [v25 mapPBRequest:v27 toResponse:objc_opt_class() messageID:10];
          [v25 addRequestHandler:sel_messageCenterDidReceiveTinkerEndToEndCloudSyncRequest_ forMessageID:12];
          [v25 addResponseHandler:sel_messageCenterDidReceiveTinkerEndToEndCloudSyncResponse_ forMessageID:12];
          [v25 addErrorHandler:sel_messageCenterDidReceiveTinkerEndToEndCloudSyncError_ forMessageID:12];
          uint64_t v28 = objc_opt_class();
          uint64_t v29 = objc_opt_class();
          uint64_t v30 = v28;
          id v4 = v33;
          [v25 mapPBRequest:v30 toResponse:v29 messageID:12];
          [v25 addRequestHandler:sel_messageCenterDidReceiveNotificationInstructionRequest_ forMessageID:13];
          [v25 mapPBRequest:objc_opt_class() toResponse:0 messageID:13];

          [*(id *)(a1 + 72) setDelegate:a1];
          [*(id *)(a1 + 72) resume];
        }
        else
        {
          _HKInitializeLogging();
          v31 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "failed to create persistent dictionary", buf, 2u);
          }
        }
      }
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (BOOL)isMaster
{
  return self->_isMaster;
}

- (BOOL)enablePeriodicSyncTimer
{
  return self->_enablePeriodicSyncTimer;
}

- (void)_queue_updateDeviceNameIfNecessaryWithSyncStore:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    id v4 = [v3 sourceBundleIdentifier];
    uint64_t v5 = [v3 deviceName];
    uint64_t v6 = (void *)v5;
    if (v4 && v5)
    {
      id v7 = v4;
      id v8 = v3;
      id v9 = v6;
      HKDispatchAsyncOnGlobalConcurrentQueue();
    }
  }
}

- (void)_queue_generateWatchActivationSamples
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (*(unsigned char *)(a1 + 8))
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
      unsigned __int8 v2 = *(void **)(a1 + 88);
      if (!v2)
      {
        id v3 = [HDKeyValueDomain alloc];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        uint64_t v5 = [(HDKeyValueDomain *)v3 initWithCategory:0 domainName:@"NanoSync" profile:WeakRetained];
        uint64_t v6 = *(void **)(a1 + 88);
        *(void *)(a1 + 88) = v5;

        unsigned __int8 v2 = *(void **)(a1 + 88);
      }
      id v7 = v2;
      id v33 = 0;
      id v8 = [v7 numberForKey:@"WatchSwitchIndex" error:&v33];
      id v9 = v33;
      id v10 = v9;
      if (v8 || !v9)
      {
        id v12 = objc_loadWeakRetained((id *)(a1 + 48));
        id v13 = [v12 daemon];
        long long v14 = [v13 nanoPairedDeviceRegistry];

        uint64_t v15 = [v8 unsignedIntValue];
        unsigned int v16 = [v14 switchIndex];
        if (v15 > v16)
        {
          _HKInitializeLogging();
          id v17 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 67109376;
            DWORD1(buf) = v15;
            WORD4(buf) = 1024;
            *(_DWORD *)((char *)&buf + 10) = v16;
            _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "current switch index %u is greater than %u", (uint8_t *)&buf, 0xEu);
          }
        }
        if (v15 >= v16)
        {
          id v22 = v10;
        }
        else
        {
          uint64_t v18 = [MEMORY[0x1E4F2ACB8] watchActivationType];
          uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v37 = 0x2020000000;
          int v38 = v15;
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __58__HDNanoSyncManager__queue_generateWatchActivationSamples__block_invoke;
          v28[3] = &unk_1E62F72B8;
          int v32 = v15;
          id v20 = v18;
          id v29 = v20;
          id v21 = v19;
          id v30 = v21;
          p_long long buf = &buf;
          [v14 getSwitchEventsFromIndex:v15 inlineCallback:v28];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __58__HDNanoSyncManager__queue_generateWatchActivationSamples__block_invoke_533;
          v27[3] = &unk_1E62F72E0;
          v27[4] = a1;
          [v21 enumerateKeysAndObjectsUsingBlock:v27];
          if (*(_DWORD *)(*((void *)&buf + 1) + 24) == v15)
          {
            id v22 = v10;
          }
          else
          {
            uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
            id v26 = v10;
            char v24 = [v7 setNumber:v23 forKey:@"WatchSwitchIndex" error:&v26];
            id v22 = v26;

            if ((v24 & 1) == 0)
            {
              _HKInitializeLogging();
              id v25 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v34 = 138543362;
                id v35 = v22;
                _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "failed to set switch index: %{public}@", v34, 0xCu);
              }
            }
          }

          _Block_object_dispose(&buf, 8);
        }

        id v10 = v22;
      }
      else
      {
        _HKInitializeLogging();
        id v11 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v10;
          _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "failed to get switch index: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
}

- (void)_notifyObserversPairedDevicesChanged:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 80);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__HDNanoSyncManager__notifyObserversPairedDevicesChanged___block_invoke;
    v6[3] = &unk_1E62F7818;
    v6[4] = a1;
    id v7 = v3;
    [v5 notifyObservers:v6];
  }
}

uint64_t __58__HDNanoSyncManager__notifyObserversPairedDevicesChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 nanoSyncManager:*(void *)(a1 + 32) pairedDevicesChanged:*(void *)(a1 + 40)];
}

- (void)syncHealthDataWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifierForResponse:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v5 = [v4 toParticipant];
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 nanoSyncDescription];
    id v9 = [v5 description];
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "resolved %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_workoutSamplesWereAssociated:(id)a3
{
  if (self) {
    -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, @"workout samples were associated", 0);
  }
}

- (void)_syncImmediatelyWithReason:(uint64_t)a3 options:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    id v7 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HDNanoSyncManager__syncImmediatelyWithReason_options___block_invoke;
    block[3] = &unk_1E62F4978;
    void block[4] = a1;
    id v9 = v5;
    uint64_t v10 = a3;
    dispatch_async(v7, block);
  }
}

void __56__HDNanoSyncManager__syncImmediatelyWithReason_options___block_invoke(uint64_t a1)
{
}

- (HDNanoSyncManager)initWithProfile:(id)a3 isMaster:(BOOL)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDNanoSyncManager;
  id v7 = [(HDNanoSyncManager *)&v26 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    uint64_t v9 = HKCreateSerialDispatchQueue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = HKCreateSerialDispatchQueue();
    syncQueue = v8->_syncQueue;
    v8->_syncQueue = (OS_dispatch_queue *)v11;

    v8->_isMaster = a4;
    v8->_waitingForFirstUnlock = 1;
    atomic_store(0, (unsigned __int8 *)&v8->_invalidated);
    id v13 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    uint64_t v16 = [v13 initWithName:v15 loggingCategory:*MEMORY[0x1E4F29FA8]];
    observers = v8->_observers;
    v8->_observers = (HKObserverSet *)v16;

    uint64_t v18 = [[HDPairedSyncManager alloc] initWithProfile:v6 queue:v8->_queue];
    pairedSyncManager = v8->_pairedSyncManager;
    v8->_pairedSyncManager = v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    syncStoresByDeviceIdentifier = v8->_syncStoresByDeviceIdentifier;
    v8->_syncStoresByDeviceIdentifier = (NSMutableDictionary *)v20;

    v8->_restoreTimeout = 60.0;
    v8->_enablePeriodicSyncTimer = 1;
    uint64_t v22 = [MEMORY[0x1E4F5B6A8] userContext];
    context = v8->_context;
    v8->_context = (_CDLocalContext *)v22;

    char v24 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v24 addObject:v8];

    [v6 registerProfileReadyObserver:v8 queue:0];
  }

  return v8;
}

- (void)invalidateAndWait
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HDNanoSyncManager_invalidateAndWait__block_invoke;
  block[3] = &unk_1E62F3230;
  void block[4] = self;
  void block[5] = &v7;
  dispatch_sync(queue, block);
  if (!*((unsigned char *)v8 + 24))
  {
    [(HDIDSMessageCenter *)self->_messageCenter invalidate];
    id v4 = self->_queue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__HDNanoSyncManager_invalidateAndWait__block_invoke_2;
    v5[3] = &unk_1E62F3208;
    v5[4] = self;
    dispatch_sync(v4, v5);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __38__HDNanoSyncManager_invalidateAndWait__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = atomic_exchange((atomic_uchar *volatile)(*(void *)(result + 32)+ 9), 1u) & 1;
  return result;
}

void __38__HDNanoSyncManager_invalidateAndWait__block_invoke_2(uint64_t a1)
{
}

- (void)_invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unsigned __int8 v2 = *(NSObject **)(a1 + 136);
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = 0;
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:a1 name:@"HDUserCharacteristicsShouldSyncNotification" object:0];
    [v4 removeObserver:a1 name:@"HDHealthStoreServerUserPreferencesDidChangeNotification" object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:a1 name:*MEMORY[0x1E4F79EC0] object:0];
    [v5 removeObserver:a1 name:*MEMORY[0x1E4F79EB8] object:0];
    [v5 removeObserver:a1 name:*MEMORY[0x1E4F79E88] object:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = objc_msgSend(*(id *)(a1 + 120), "allValues", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) invalidate];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)obliterateWithOptions:(unint64_t)a3 reason:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HDNanoSyncManager_obliterateWithOptions_reason___block_invoke;
  block[3] = &unk_1E62F7040;
  char v11 = v4 & 1;
  void block[4] = self;
  id v10 = v6;
  BOOL v12 = (v4 & 2) != 0;
  id v8 = v6;
  dispatch_sync(queue, block);
}

uint64_t __50__HDNanoSyncManager_obliterateWithOptions_reason___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8) && *(unsigned char *)(a1 + 48))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = objc_msgSend(*(id *)(v2 + 120), "allValues", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v7++) prepareForObliteration];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  return [*(id *)(v2 + 72) obliterateWithReason:*(void *)(a1 + 40) preserveCopy:*(unsigned __int8 *)(a1 + 49)];
}

- (void)initializeMessageCenterIfNeeded
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDNanoSyncManager_initializeMessageCenterIfNeeded__block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __52__HDNanoSyncManager_initializeMessageCenterIfNeeded__block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_invalidated, 1u) & 1) == 0)
  {
    [(HDIDSMessageCenter *)self->_messageCenter invalidate];
    -[HDNanoSyncManager _invalidate]((uint64_t)self);
  }
  v3.receiver = self;
  v3.super_class = (Class)HDNanoSyncManager;
  [(HDNanoSyncManager *)&v3 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v5 = [WeakRetained database];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HDNanoSyncManager_profileDidBecomeReady___block_invoke;
  v7[3] = &unk_1E62F3208;
  void v7[4] = self;
  [v5 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v7];
}

void __43__HDNanoSyncManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (os_log_t *)MEMORY[0x1E4F29FA8];
  objc_super v3 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEBUG, "data protected by first unlock available", buf, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = 0;
  char v5 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v4, &v8);
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v7 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "failed to initialize NanoSync after first unlock: %{public}@", buf, 0xCu);
    }
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HDNanoSyncStore *)self->_activeSyncStore needsSyncOnUnlock])
  {
    [(HDNanoSyncStore *)self->_activeSyncStore setNeedsSyncOnUnlock:0];
    -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:]((uint64_t)self, @"syncing after unlock", 1, 0, &__block_literal_global_38);
  }
}

void __62__HDNanoSyncManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if ((a2 & 1) == 0 && (objc_msgSend(v4, "hk_isDatabaseAccessibilityError") & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "post-unlock sync failed: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_queue_syncImmediatelyWithReason:(uint64_t)a3 options:(void *)a4 accessibilityAssertion:(void *)a5 completion:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    id v67 = 0;
    uint64_t v59 = a1;
    char v12 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](a1, &v67);
    id v13 = v67;
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29FA8];
    uint64_t v15 = *MEMORY[0x1E4F29FA8];
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v48 = v14;
        id v49 = _StringFromSyncOptions(a3);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v79 = (uint64_t)v9;
        __int16 v80 = 2112;
        id v81 = v49;
        _os_log_debug_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_DEBUG, "syncing immediately with reason \"%@\" options:'%@'", buf, 0x16u);
      }
      uint64_t v57 = a3;
      uint64_t v16 = [HDKeyValueDomain alloc];
      id v17 = (id *)(a1 + 48);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v19 = [(HDKeyValueDomain *)v16 initWithCategory:0 domainName:@"CloudSync" profile:WeakRetained];

      uint64_t v20 = *MEMORY[0x1E4F2BDA8];
      id v73 = 0;
      uint64_t v60 = v20;
      v61 = v19;
      id v21 = -[HDKeyValueDomain numberForKey:error:](v19, "numberForKey:error:");
      id v22 = v73;
      uint64_t v23 = v22;
      if (v21 || !v22)
      {
        if (([v21 BOOLValue] & 1) == 0)
        {
          id v52 = v21;
          id v53 = v13;
          id v54 = v11;
          id v55 = v10;
          id v56 = v9;
          id v25 = objc_loadWeakRetained(v17);
          objc_super v26 = [v25 daemon];
          uint64_t v27 = [v26 nanoPairedDeviceRegistry];

          id v51 = v27;
          uint64_t v28 = [v27 getPairedDevices];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v29 = v28;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v69 objects:buf count:16];
          if (v30)
          {
            uint64_t v32 = v30;
            uint64_t v33 = *(void *)v70;
            v34 = @"21R0";
            *(void *)&long long v31 = 138543618;
            long long v50 = v31;
            id v58 = v29;
            while (2)
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v70 != v33) {
                  objc_enumerationMutation(v29);
                }
                id v36 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                uint64_t v37 = objc_msgSend(v36, "hd_productType", v50);
                int v38 = [v37 hasPrefix:@"Watch"];

                if (v38)
                {
                  uint64_t v39 = objc_msgSend(v36, "hd_systemBuildVersion");
                  if (objc_msgSend(v39, "hk_compareBuildVersionWithString:", v34) == -1)
                  {
                    uint64_t v41 = v34;
                    int v42 = (void *)[objc_alloc(NSNumber) initWithBool:1];
                    id v68 = v23;
                    BOOL v43 = [(HDKeyValueDomain *)v61 setNumber:v42 forKey:v60 error:&v68];
                    id v40 = v68;

                    if (v43)
                    {

                      uint64_t v23 = v40;
                      id v29 = v58;
                      goto LABEL_33;
                    }
                    _HKInitializeLogging();
                    id v44 = *MEMORY[0x1E4F29FA8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v74 = v50;
                      uint64_t v75 = v59;
                      __int16 v76 = 2114;
                      id v77 = v40;
                      _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set flag for old watch paired to Dawn+ phone %{public}@.", v74, 0x16u);
                    }
                    v34 = v41;
                    id v29 = v58;
                  }
                  else
                  {
                    id v40 = v23;
                  }

                  uint64_t v23 = v40;
                }
              }
              uint64_t v32 = [v29 countByEnumeratingWithState:&v69 objects:buf count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }
LABEL_33:

          id v10 = v55;
          id v9 = v56;
          id v13 = v53;
          id v11 = v54;
          id v21 = v52;
        }
      }
      else
      {
        _HKInitializeLogging();
        char v24 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          uint64_t v79 = v59;
          __int16 v80 = 2114;
          id v81 = v23;
          _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not read key for whether device was ever paired to old watch %{public}@.", buf, 0x16u);
        }
      }

      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __96__HDNanoSyncManager__queue_syncImmediatelyWithReason_options_accessibilityAssertion_completion___block_invoke;
      aBlock[3] = &unk_1E62F7490;
      CFAbsoluteTime v65 = Current;
      aBlock[4] = v59;
      id v46 = v9;
      id v63 = v46;
      uint64_t v66 = v57;
      id v64 = v11;
      id v47 = _Block_copy(aBlock);
      -[HDNanoSyncManager _queue_synchronizeWithOptions:restoreMessagesSentHandler:targetSyncStore:reason:accessibilityAssertion:completion:](v59, v57, 0, *(void **)(v59 + 96), v46, v10, v47);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v79 = (uint64_t)v9;
        __int16 v80 = 2114;
        id v81 = v13;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "failed to sync immediately for reason \"%{public}@\": %{public}@", buf, 0x16u);
      }
      if (v11)
      {
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Sync failed without reporting an error.");
          id v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        (*((void (**)(id, void, id))v11 + 2))(v11, 0, v13);
      }
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)pairedSyncDidBeginForDevice:(id)a3 messagesSentHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HDNanoSyncManager_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke;
  v15[3] = &unk_1E62F7088;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __80__HDNanoSyncManager_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke(void *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v28 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v28);
  id v4 = v28;
  if (v3)
  {
    uint64_t v6 = a1[4];
    char v5 = (void *)a1[5];
    int v7 = (void *)a1[6];
    id v8 = (void *)a1[7];
    id v9 = v5;
    id v10 = v7;
    id v11 = v8;
    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __87__HDNanoSyncManager__queue_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke;
      aBlock[3] = &unk_1E62F29A0;
      id v30 = v11;
      id v11 = _Block_copy(aBlock);
      if (v9)
      {
        -[HDNanoSyncManager _queue_updateSyncStores](v6);
        uint64_t v27 = v9;
        objc_msgSend(v9, "hd_pairingID");
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v13 = [*(id *)(v6 + 120) allValues];
        id v14 = (id)[v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v14)
        {
          id v25 = v10;
          id v26 = v4;
          uint64_t v15 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v13);
              }
              id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              id v18 = [v17 nanoRegistryUUID];
              char v19 = [v18 isEqual:v12];

              if (v19)
              {
                id v14 = v17;
                goto LABEL_16;
              }
            }
            id v14 = (id)[v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
            if (v14) {
              continue;
            }
            break;
          }
LABEL_16:
          id v10 = v25;
          id v4 = v26;
        }

        if (v14)
        {
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __87__HDNanoSyncManager__queue_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke_2;
          v35[3] = &unk_1E62F2A18;
          id v9 = v27;
          id v36 = v27;
          id v21 = v14;
          id v37 = v21;
          id v38 = v11;
          -[HDNanoSyncManager _queue_synchronizeWithOptions:restoreMessagesSentHandler:targetSyncStore:reason:accessibilityAssertion:completion:](v6, 0, v10, v21, @"PairedSync session began", 0, v35);

          id v22 = v36;
        }
        else
        {
          uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
          id v9 = v27;
          id v22 = objc_msgSend(v27, "hd_shortDescription");
          char v24 = objc_msgSend(v23, "hk_error:format:", 100, @"failed to find sync store for device %@", v22);
          (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v24);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"no device specified");
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void, id))v11 + 2))(v11, 0, v14);
      }
    }
  }
  else
  {
    uint64_t v20 = a1[7];
    if (v20) {
      (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v4);
    }
  }
}

- (void)syncHealthDataWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  NSStringFromSelector(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(HDNanoSyncManager *)self syncHealthDataWithOptions:a3 reason:v8 completion:v7];
}

- (void)syncHealthDataWithOptions:(unint64_t)a3 reason:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if (a5)
  {
    id v12 = a5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v14 = [WeakRetained database];
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v34 = 0;
    a5 = [v14 cloneAccessibilityAssertion:v12 ownerIdentifier:v16 error:&v34];

    id v17 = v34;
    if (!a5)
    {
      _HKInitializeLogging();
      id v18 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        id v36 = self;
        __int16 v37 = 2114;
        id v38 = v17;
        _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Unable to clone assertion error: %{public}@", buf, 0x16u);
      }
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HDNanoSyncManager_syncHealthDataWithOptions_reason_accessibilityAssertion_completion___block_invoke;
  aBlock[3] = &unk_1E62F70B0;
  id v19 = a5;
  id v32 = v19;
  id v33 = v11;
  id v20 = v11;
  id v21 = _Block_copy(aBlock);
  queue = self->_queue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __88__HDNanoSyncManager_syncHealthDataWithOptions_reason_accessibilityAssertion_completion___block_invoke_2;
  v26[3] = &unk_1E62F70D8;
  v26[4] = self;
  id v27 = v10;
  id v29 = v21;
  unint64_t v30 = a3;
  id v28 = v19;
  id v23 = v21;
  id v24 = v19;
  id v25 = v10;
  dispatch_async(queue, v26);
}

void __88__HDNanoSyncManager_syncHealthDataWithOptions_reason_accessibilityAssertion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void __88__HDNanoSyncManager_syncHealthDataWithOptions_reason_accessibilityAssertion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v5);
  id v4 = v5;
  if (v3) {
    -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 56));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__HDNanoSyncManager_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke;
  v13[3] = &unk_1E62F7100;
  v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __81__HDNanoSyncManager_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v24 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v24);
  id v4 = v24;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(double *)(a1 + 56);
    id v7 = *(void **)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    id v9 = v7;
    if (v5)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
      if (v9)
      {
        if (v8)
        {
          id v10 = *(void **)(v5 + 96);
          if (v10
            && ([v10 nanoRegistryUUID],
                id v11 = objc_claimAutoreleasedReturnValue(),
                char v12 = [v8 isEqual:v11],
                v11,
                (v12 & 1) != 0))
          {
            objc_initWeak(&location, *(id *)(v5 + 96));
            id v13 = *(id *)(v5 + 56);
            id v14 = *(void **)(v5 + 96);
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke;
            v25[3] = &unk_1E62F74E0;
            id v15 = v13;
            id v26 = v15;
            objc_copyWeak(&v27, &location);
            [v14 addIncomingSyncObserverWithTimeout:v25 timeoutHandler:v9 completion:v6];
            double v16 = [[HDNanoSyncSession alloc] initWithSyncStore:*(void *)(v5 + 96) options:3 reason:@"Last chance sync request" delegate:v5 completion:&__block_literal_global_749];
            -[HDNanoSyncManager _sendFinalStatusMessageForSyncSession:didFinishSuccessfully:error:](v5, v16, 1, 0);

            objc_destroyWeak(&v27);
            objc_destroyWeak(&location);
          }
          else
          {
            id v18 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v19 = objc_opt_class();
            id v20 = [v8 UUIDString];
            id v21 = objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v19, sel__queue_waitForLastChanceSyncWithPairingID_timeout_completion_, @"Device with pairing ID \"%@\" is not active"", v20);
            v9[2](v9, 0, v21);
          }
        }
        else
        {
          id v22 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__queue_waitForLastChanceSyncWithPairingID_timeout_completion_, @"pairingID cannot be nil"");
          v9[2](v9, 0, v22);
        }
      }
      else
      {
        id v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:sel__queue_waitForLastChanceSyncWithPairingID_timeout_completion_, v5, @"HDNanoSyncManager.m", 3117, @"Invalid parameter not satisfying: %@", @"completion != NULL" object file lineNumber description];
      }
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 48);
    if (v17) {
      (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v4);
    }
  }
}

- (void)resetSyncWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HDNanoSyncManager_resetSyncWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__HDNanoSyncManager_resetSyncWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v15 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v15);
  id v4 = v15;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void (**)(id, uint64_t, void))*(id *)(a1 + 40);
    if (v5)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
      if (*(unsigned char *)(v5 + 24))
      {
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:sel__queue_resetSyncWithCompletion_, v5, @"HDNanoSyncManager.m", 1779, @"Invalid parameter not satisfying: %@", @"_waitingForFirstUnlock == NO" object file lineNumber description];
      }
      id v7 = *(void **)(v5 + 96);
      if (v7)
      {
        if ([v7 restoreState] != 1)
        {
          id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Restore cancelled by reset");
          -[HDNanoSyncManager _queue_transitionToRestoreIncompleteWithSyncStore:error:](v5, *(void **)(v5 + 96), v8);
        }
        id WeakRetained = objc_loadWeakRetained((id *)(v5 + 48));
        id v10 = [WeakRetained syncEngine];
        [v10 resetStore:*(void *)(v5 + 96)];

        _HKInitializeLogging();
        id v11 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(v5 + 96);
          *(_DWORD *)long long buf = 138543362;
          uint64_t v17 = v12;
          _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "resetting sync store %{public}@", buf, 0xCu);
        }
      }
      if (v6) {
        v6[2](v6, 1, 0);
      }
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v4);
    }
  }
}

- (void)updatePairedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HDNanoSyncManager_updatePairedDevicesWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__HDNanoSyncManager_updatePairedDevicesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v6);
  id v4 = v6;
  if (v3)
  {
    -[HDNanoSyncManager _queue_updateSyncStoresWithCompletion:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v4);
    }
  }
}

- (void)_queue_updateSyncStoresWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    -[HDNanoSyncManager _queue_updateSyncStores](a1);
    id v3 = v4;
    if (v4)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 40), 0);
      id v3 = v4;
    }
  }
}

- (void)unitTest_performWithActiveSyncStore:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HDNanoSyncManager_unitTest_performWithActiveSyncStore___block_invoke;
  v7[3] = &unk_1E62F3CA8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __57__HDNanoSyncManager_unitTest_performWithActiveSyncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 96));
}

- (void)requestAuthorizationForRequestRecord:(id)a3 requestSentHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__HDNanoSyncManager_requestAuthorizationForRequestRecord_requestSentHandler_completion___block_invoke;
  v15[3] = &unk_1E62F7088;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __88__HDNanoSyncManager_requestAuthorizationForRequestRecord_requestSentHandler_completion___block_invoke(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v24 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v24);
  id v4 = v24;
  if (v3)
  {
    uint64_t v6 = a1[4];
    uint64_t v5 = (void *)a1[5];
    id v7 = *(void **)(v6 + 96);
    id v8 = (void *)a1[6];
    id v9 = (void *)a1[7];
    id v10 = v5;
    id v11 = v7;
    id v12 = v8;
    id v13 = v9;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "Requesting authorization from companion.", buf, 2u);
    }
    id v15 = [v11 createRequestWithMessageID:3];
    id v16 = +[HDCodableAuthorizationRequestMessage codableAuthorizationRequestWithRecord:v10];
    [v15 setPbRequest:v16];

    id v25 = @"auth-identifier";
    id v17 = [v10 sessionIdentifier];
    *(void *)long long buf = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v25 count:1];
    [v15 setPersistentUserInfo:v18];

    -[HDNanoSyncManager _queue_sendRequest:syncStore:](v6, v15, (uint64_t)v11);
    uint64_t v19 = objc_alloc_init(HDRemoteAuthorizationRequestContext);
    id v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_requestRecord, v5);
      objc_setProperty_nonatomic_copy(v20, v21, v12, 16);
      objc_setProperty_nonatomic_copy(v20, v22, v13, 24);
    }
    id v23 = [v10 sessionIdentifier];
    [v11 addPendingRequestContext:v20 forUUID:v23];
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (void)sendStartWorkoutAppRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HDNanoSyncManager_sendStartWorkoutAppRequest_completion___block_invoke;
  block[3] = &unk_1E62F69F0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __59__HDNanoSyncManager_sendStartWorkoutAppRequest_completion___block_invoke(void *a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v25 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v25);
  id v4 = v25;
  if (v3)
  {
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 96);
    if (v6)
    {
      id v8 = (void *)a1[5];
      id v7 = (void *)a1[6];
      id v9 = v8;
      id v10 = v6;
      id v11 = v7;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
      id v12 = [v10 createRequestWithMessageID:8];
      [v12 setPbRequest:v9];
      id v13 = objc_alloc(MEMORY[0x1E4F29128]);
      id v14 = [v9 requestIdentifier];
      id v15 = (void *)[v13 initWithUUIDString:v14];

      if (v15)
      {
        id v26 = @"workout-launch";
        v27[0] = v15;
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
        [v12 setPersistentUserInfo:v16];

        [v12 setPriority:1];
        -[HDNanoSyncManager _queue_sendRequest:syncStore:](v5, v12, (uint64_t)v10);
        id v17 = objc_alloc_init(HDRemoteStartWorkoutAppRequestContext);
        id v18 = v17;
        if (v17)
        {
          objc_storeStrong((id *)&v17->_request, v8);
          objc_setProperty_nonatomic_copy(v18, v19, v11, 16);
        }
        [v10 addPendingRequestContext:v18 forUUID:v15];
      }
      else
      {
        SEL v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = objc_opt_class();
        id v18 = [v9 requestIdentifier];
        id v24 = objc_msgSend(v22, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v23, sel__queue_sendStartWorkoutAppRequest_syncStore_completion_, @"Invalid request identifier %@"", v18);
        (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v24);
      }
    }
    else
    {
      SEL v21 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 550, @"Unable to launch watch app");
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    uint64_t v20 = a1[6];
    if (v20) {
      (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v4);
    }
  }
}

- (void)sendCompanionUserNotificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HDNanoSyncManager_sendCompanionUserNotificationRequest_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __69__HDNanoSyncManager_sendCompanionUserNotificationRequest_completion___block_invoke(void *a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v24 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v24);
  id v4 = v24;
  if (v3)
  {
    uint64_t v6 = a1[4];
    uint64_t v5 = (void *)a1[5];
    id v7 = *(void **)(v6 + 96);
    id v8 = (void *)a1[6];
    id v9 = v5;
    id v10 = v7;
    id v11 = v8;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
    id v12 = [v10 createRequestWithMessageID:9];
    [v12 setPbRequest:v9];
    id v13 = [v9 requestIdentifier];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F29128]);
      id v15 = [v9 requestIdentifier];
      id v16 = (void *)[v14 initWithUUIDString:v15];

      id v25 = @"companion-user-notification";
      v26[0] = v16;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      [v12 setPersistentUserInfo:v17];

      [v12 setPriority:1];
      -[HDNanoSyncManager _queue_sendRequest:syncStore:](v6, v12, (uint64_t)v10);
      v11[2](v11, 1, 0);
      id v18 = objc_alloc_init(HDRemoteCompanionUserNotificationRequestContext);
      SEL v19 = v18;
      if (v18)
      {
        objc_storeStrong((id *)&v18->_request, v5);
        objc_setProperty_nonatomic_copy(v19, v20, &__block_literal_global_783, 16);
      }
      [v10 addPendingRequestContext:v19 forUUID:v16];
    }
    else
    {
      SEL v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = objc_opt_class();
      id v16 = [v9 requestIdentifier];
      SEL v19 = objc_msgSend(v22, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v23, sel__queue_sendCompanionUserNotificationRequest_syncStore_completion_, @"Invalid request identifier %@"", v16);
      ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v19);
    }
  }
  else
  {
    uint64_t v21 = a1[6];
    if (v21) {
      (*(void (**)(uint64_t, void, id))(v21 + 16))(v21, 0, v4);
    }
  }
}

- (void)sendNotificationInstructionMessageRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HDNanoSyncManager_sendNotificationInstructionMessageRequest_completion___block_invoke;
  block[3] = &unk_1E62F69F0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __74__HDNanoSyncManager_sendNotificationInstructionMessageRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v19 = 0;
  int v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v19);
  id v4 = v19;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 96);
    if (v6)
    {
      id v7 = *(void **)(a1 + 48);
      id v8 = *(id *)(a1 + 40);
      id v9 = v6;
      id v10 = v7;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
      id v11 = [v9 createRequestWithMessageID:13];
      [v11 setPbRequest:v8];
      id v12 = [v8 requestIdentifier];

      if (v12)
      {
        [v11 setPriority:1];
        -[HDNanoSyncManager _queue_sendRequest:syncStore:](v5, v11, (uint64_t)v9);
        v10[2](v10, 1, 0);
      }
      else
      {
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = objc_opt_class();
        id v17 = [v8 requestIdentifier];
        id v18 = objc_msgSend(v15, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v16, sel__queue_sendNotificationInstructionRequest_syncStore_completion_, @"Invalid request identifier %@"", v17);
        ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v18);
      }
    }
    else
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"Cannot send a message without an active sync store. There is likely not a paired watch.");
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v4);
    }
  }
}

- (void)sendTinkerSharingOptInRequest:(id)a3 forNRDeviceUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__HDNanoSyncManager_sendTinkerSharingOptInRequest_forNRDeviceUUID_completion___block_invoke;
  v15[3] = &unk_1E62F7128;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

void __78__HDNanoSyncManager_sendTinkerSharingOptInRequest_forNRDeviceUUID_completion___block_invoke(uint64_t *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v31 = 0;
  char v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v31);
  id v4 = v31;
  if (v3)
  {
    -[HDNanoSyncManager _queue_updateTinkerSyncStore](a1[4]);
    uint64_t v5 = *(void **)(a1[4] + 104);
    if (v5)
    {
      id v6 = [v5 nanoRegistryUUID];
      if ([v6 isEqual:a1[5]])
      {
        uint64_t v7 = a1[4];
        id v8 = *(void **)(v7 + 104);
        id v10 = (void *)a1[6];
        id v9 = (void *)a1[7];
        id v11 = v10;
        id v12 = v8;
        id v13 = v9;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 56));
        _HKInitializeLogging();
        id v14 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v14;
          id v16 = [v11 requestIdentifier];
          *(_DWORD *)long long buf = 138543874;
          *(void *)&uint8_t buf[4] = v7;
          __int16 v34 = 2114;
          id v35 = v16;
          __int16 v36 = 2114;
          id v37 = v12;
          _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Will send Tinker opt in request %{public}@, syncStore %{public}@ (#t0)", buf, 0x20u);
        }
        id v17 = [v12 createRequestWithMessageID:11];
        [v17 setPbRequest:v11];
        id v18 = [v11 requestIdentifier];

        if (v18)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F29128]);
          SEL v20 = [v11 requestIdentifier];
          uint64_t v21 = (void *)[v19 initWithUUIDString:v20];

          id v32 = @"tinker-optin";
          *(void *)long long buf = v21;
          SEL v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v32 count:1];
          [v17 setPersistentUserInfo:v22];

          [v17 setPriority:1];
          -[HDNanoSyncManager _queue_sendRequest:syncStore:](v7, v17, (uint64_t)v12);
          uint64_t v23 = objc_alloc_init(HDRemoteTinkerOptInRequestContext);
          id v24 = v23;
          if (v23)
          {
            objc_storeStrong((id *)&v23->_request, v10);
            objc_setProperty_nonatomic_copy(v24, v25, v13, 16);
          }
          [v12 addPendingRequestContext:v24 forUUID:v21];
        }
        else
        {
          id v29 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v30 = objc_opt_class();
          uint64_t v21 = [v11 requestIdentifier];
          id v24 = objc_msgSend(v29, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v30, sel__queue_sendTinkerOptInRequest_syncStore_completion_, @"Invalid request identifier %@"", v21);
          (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v24);
        }
      }
      else
      {
        uint64_t v28 = a1[7];
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Active device (%@) is not same as the device we want to pair to (%@).", v6, a1[5]);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void, id))(v28 + 16))(v28, 0, v11);
      }
    }
    else
    {
      uint64_t v26 = a1[7];
      uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to complete Tinker health sharing opt in because active sync store is nil");
      (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v27);
    }
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (void)_queue_updateTinkerSyncStore
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24))
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:sel__queue_updateTinkerSyncStore, a1, @"HDNanoSyncManager.m", 758, @"Invalid parameter not satisfying: %@", @"_waitingForFirstUnlock == NO" object file lineNumber description];
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    char v3 = [WeakRetained daemon];
    id v4 = [v3 nanoPairedDeviceRegistry];

    uint64_t v5 = [MEMORY[0x1E4F79EF0] activeDeviceSelectorBlock];
    id v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    uint64_t v7 = [v6 firstObject];

    id v8 = [*(id *)(a1 + 72) idsService];
    id v9 = [v8 linkedDevicesWithRelationship:2];

    id v10 = [v4 deviceForNRDevice:v7 fromIDSDevices:v9];
    _HKInitializeLogging();
    id v11 = (os_log_t *)MEMORY[0x1E4F29FA8];
    id v12 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = objc_msgSend(v7, "hd_pairingID");
      id v15 = objc_msgSend(v10, "hd_deviceIdentifier");
      *(_DWORD *)long long buf = 138412802;
      uint64_t v23 = a1;
      __int16 v24 = 2112;
      SEL v25 = v14;
      __int16 v26 = 2112;
      uint64_t v27 = v15;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%@ Active tinker NR device %@, IDS device %@ (#t0)", buf, 0x20u);
    }
    id v16 = objc_loadWeakRetained((id *)(a1 + 48));
    id v17 = +[HDNanoSyncStore nanoSyncStoreWithProfile:v16 device:v10 delegate:a1 tinkerPaired:1];

    id v18 = objc_msgSend(v10, "hd_deviceIdentifier");
    [*(id *)(a1 + 120) setObject:v17 forKeyedSubscript:v18];
    [*(id *)(a1 + 104) invalidate];
    objc_storeStrong((id *)(a1 + 104), v17);
    _HKInitializeLogging();
    id v19 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      SEL v20 = *(void **)(a1 + 104);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v23 = a1;
      __int16 v24 = 2114;
      SEL v25 = v20;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Active tinker store %{public}@ (#t0)", buf, 0x16u);
    }
  }
}

- (void)sendTinkerWatchPairingRequest:(id)a3 forNRDeviceUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__HDNanoSyncManager_sendTinkerWatchPairingRequest_forNRDeviceUUID_completion___block_invoke;
  v15[3] = &unk_1E62F7128;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

void __78__HDNanoSyncManager_sendTinkerWatchPairingRequest_forNRDeviceUUID_completion___block_invoke(uint64_t *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v27 = 0;
  char v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v27);
  id v4 = v27;
  if (v3)
  {
    -[HDNanoSyncManager _queue_updateTinkerSyncStore](a1[4]);
    uint64_t v5 = *(void **)(a1[4] + 104);
    if (v5)
    {
      id v6 = [v5 nanoRegistryUUID];
      if ([v6 isEqual:a1[5]])
      {
        uint64_t v7 = a1[4];
        id v8 = *(void **)(v7 + 104);
        id v10 = (void *)a1[6];
        id v9 = (void *)a1[7];
        id v11 = v10;
        id v12 = v8;
        id v13 = v9;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 56));
        _HKInitializeLogging();
        id v14 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Guardian requesting health sharing with Tinker watch. (#t0)", buf, 2u);
        }
        id v15 = [v12 createRequestWithMessageID:10];
        [v15 setPbRequest:v11];
        id v16 = [v11 requestIdentifier];

        if (v16)
        {
          id v17 = objc_alloc(MEMORY[0x1E4F29128]);
          id v18 = [v11 requestIdentifier];
          id v19 = (void *)[v17 initWithUUIDString:v18];

          uint64_t v28 = @"tinker-pairing";
          *(void *)long long buf = v19;
          SEL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v28 count:1];
          [v15 setPersistentUserInfo:v20];

          [v15 setPriority:1];
          -[HDNanoSyncManager _queue_sendRequest:syncStore:](v7, v15, (uint64_t)v12);
          uint64_t v21 = objc_alloc_init(HDRemoteTinkerPairingRequestContext);
          SEL v22 = v21;
          if (v21)
          {
            objc_storeStrong((id *)&v21->_request, v10);
            objc_setProperty_nonatomic_copy(v22, v23, v13, 16);
          }
          [v12 addPendingRequestContext:v22 forUUID:v19];
        }
        else
        {
          SEL v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = objc_opt_class();
          id v19 = [v11 requestIdentifier];
          SEL v22 = objc_msgSend(v25, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v26, sel__queue_sendTinkerPairingRequest_syncStore_completion_, @"Invalid request identifier %@"", v19);
          (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v22);
        }
      }
      else
      {
        __int16 v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Active device (%@) is not same as the device we want to pair to (%@).", v6, a1[5]);
        (*(void (**)(void))(a1[7] + 16))();
      }
    }
    else
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to complete Tinker health sharing because active sync store is nil");
      (*(void (**)(void))(a1[7] + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (void)sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HDNanoSyncManager_sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID_completion___block_invoke;
  block[3] = &unk_1E62F69F0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __82__HDNanoSyncManager_sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID_completion___block_invoke(uint64_t *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v29 = 0;
  char v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v29);
  id v4 = v29;
  if (v3)
  {
    -[HDNanoSyncManager _queue_updateTinkerSyncStore](a1[4]);
    uint64_t v5 = *(void **)(a1[4] + 104);
    if (v5)
    {
      id v6 = [v5 nanoRegistryUUID];
      if ([v6 isEqual:a1[5]])
      {
        uint64_t v7 = a1[4];
        id v8 = (void *)a1[6];
        id v9 = *(id *)(v7 + 104);
        id v10 = v8;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 56));
        id v11 = [MEMORY[0x1E4F29128] UUID];
        id v12 = objc_alloc_init(HDCodableTinkerEndToEndCloudSyncRequest);
        id v13 = [v11 UUIDString];
        [(HDCodableTinkerEndToEndCloudSyncRequest *)v12 setRequestIdentifier:v13];

        _HKInitializeLogging();
        id v14 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v14;
          id v16 = [(HDCodableTinkerEndToEndCloudSyncRequest *)v12 requestIdentifier];
          *(_DWORD *)long long buf = 138543874;
          uint64_t v31 = v7;
          __int16 v32 = 2114;
          id v33 = v16;
          __int16 v34 = 2114;
          id v35 = v9;
          _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Will send Tinker end to end Cloud Sync request %{public}@, syncStore %{public}@ (#t0)", buf, 0x20u);
        }
        id v17 = [v9 createRequestWithMessageID:12];
        [v17 setPbRequest:v12];
        id v18 = [(HDCodableTinkerEndToEndCloudSyncRequest *)v12 requestIdentifier];

        if (v18)
        {
          id v19 = objc_alloc_init(HDRemoteTinkerEndToEndCloudSyncRequestContext);
          SEL v20 = v19;
          if (v19)
          {
            objc_storeStrong((id *)&v19->_request, v12);
            objc_setProperty_nonatomic_copy(v20, v21, v10, 16);
          }
          [v9 addPendingRequestContext:v20 forUUID:v11];
          [v17 setPriority:1];
          -[HDNanoSyncManager _queue_sendRequest:syncStore:](v7, v17, (uint64_t)v9);
        }
        else
        {
          uint64_t v28 = v11;
          SEL v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = objc_opt_class();
          SEL v20 = [(HDCodableTinkerEndToEndCloudSyncRequest *)v12 requestIdentifier];
          id v27 = objc_msgSend(v25, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v26, sel__queue_sendTinkerEndToEndCloudSyncRequestWithSyncStore_completion_, @"Invalid request identifier %@"", v20);
          (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v27);

          id v11 = v28;
        }
      }
      else
      {
        uint64_t v24 = a1[6];
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Active device (%@) is not same as the device we want to pair to (%@).", v6, a1[5]);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void, id))(v24 + 16))(v24, 0, v9);
      }
    }
    else
    {
      uint64_t v22 = a1[6];
      SEL v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to complete Tinker end to end Cloud Sync because active sync store is nil");
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);
    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (id)_queue_validatedSyncStore:(void *)a3 device:(void *)a4 message:(uint64_t)a5 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if (([v11 hasVersion] & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    id v16 = @"Incoming message has no sync version information.";
LABEL_11:
    objc_msgSend(v15, "hk_assignError:code:format:", a5, 3, v16, v22, v23, v24);
    id v14 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = [v11 version];
  uint64_t v13 = [v9 protocolVersion];
  if (v12 == v13)
  {
    id v14 = v9;
    goto LABEL_12;
  }
  uint64_t v17 = v13;
  if ((int)v12 > 16 || (int)v12 <= (int)v13)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = v17;
    uint64_t v24 = 16;
    uint64_t v22 = v12;
    id v16 = @"Incoming message has unexpected version %d (expected %d, current is %d).";
    goto LABEL_11;
  }
  _HKInitializeLogging();
  id v18 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138544130;
    uint64_t v26 = a1;
    __int16 v27 = 1024;
    int v28 = v12;
    __int16 v29 = 1024;
    int v30 = v17;
    __int16 v31 = 1024;
    int v32 = v12;
    _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Incoming message has sync protocol version %d, but we were only expecting %d. Adjusting expected version to %d", buf, 0x1Eu);
  }
  id v14 = [v9 nanoSyncStoreForProtocolVersion:v12];
  [v9 invalidate];
  id v19 = *(void **)(a1 + 120);
  SEL v20 = objc_msgSend(v10, "hd_deviceIdentifier");
  [v19 setObject:v14 forKeyedSubscript:v20];

LABEL_12:

  return v14;
}

void __67__HDNanoSyncManager__syncronouslyHandleIncomingRequest_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) fromParticipant];
  id v4 = [v3 device];
  uint64_t v5 = -[HDNanoSyncManager _queue_syncStoreForIDSDevice:updateIfNecessary:](v2, v4);

  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__HDNanoSyncManager__syncronouslyHandleIncomingRequest_usingBlock___block_invoke_2;
    v13[3] = &unk_1E62F3208;
    uint64_t v6 = *(void *)(a1 + 56);
    id v14 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v13);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = v7;
      id v10 = [v8 fromParticipant];
      id v11 = [v10 device];
      uint64_t v12 = [v11 description];
      *(_DWORD *)long long buf = 138543362;
      id v16 = v12;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "unable to find sync store for request from device %{public}@", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

intptr_t __67__HDNanoSyncManager__syncronouslyHandleIncomingRequest_usingBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handleOutgoingMessageError:(void *)a3 usingBlock:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6)
      {
LABEL_4:
        -[HDNanoSyncManager _logOutgoingMessageError:](a1, v5);
        id v8 = *(NSObject **)(a1 + 56);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __60__HDNanoSyncManager__handleOutgoingMessageError_usingBlock___block_invoke;
        block[3] = &unk_1E62F4E40;
        void block[4] = a1;
        id v12 = v5;
        id v13 = v7;
        dispatch_async(v8, block);

        goto LABEL_5;
      }
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__handleOutgoingMessageError_usingBlock_, a1, @"HDNanoSyncManager.m", 1143, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];

      if (v7) {
        goto LABEL_4;
      }
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel__handleOutgoingMessageError_usingBlock_, a1, @"HDNanoSyncManager.m", 1144, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:
}

- (void)_logOutgoingMessageError:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    int v5 = objc_msgSend(v3, "hd_messageID");
    int v6 = objc_msgSend(v4, "hd_isFromRequest");
    uint64_t v7 = objc_msgSend(v4, "hd_messageIDSIdentifier");
    id v8 = objc_msgSend(v4, "hd_messageIDSDeviceIdentifier");
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      id v11 = HDNanoSyncMessageIDString(v5);
      __int16 v15 = 2080;
      id v12 = "response";
      int v13 = 138544386;
      id v14 = v11;
      if (v6) {
        id v12 = "request";
      }
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      SEL v20 = v8;
      __int16 v21 = 2114;
      uint64_t v22 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ %s %{public}@ to device %{public}@ error: %{public}@", (uint8_t *)&v13, 0x34u);
    }
  }
}

void __60__HDNanoSyncManager__handleOutgoingMessageError_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  id v4 = v3;
  if (v2)
  {
    if (!v3)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel__queue_syncStoreForMessageCenterError_, v2, @"HDNanoSyncManager.m", 1131, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
    int v5 = objc_msgSend(v4, "hd_messageIDSDeviceIdentifier");
    if (v5)
    {
      int v6 = [*(id *)(v2 + 120) objectForKeyedSubscript:v5];
    }
    else
    {
      int v6 = 0;
    }

    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_13;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = v8;
    id v11 = objc_msgSend(v9, "hd_messageIDSIdentifier");
    id v12 = objc_msgSend(*(id *)(a1 + 40), "hd_messageIDSDeviceIdentifier");
    *(_DWORD *)long long buf = 138543618;
    id v14 = v11;
    __int16 v15 = 2114;
    id v16 = v12;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "unable to find sync store for error from message %{public}@ to device %{public}@", buf, 0x16u);
  }
  int v6 = 0;
LABEL_13:
}

- (void)messageCenter:(id)a3 activeDeviceDidChange:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v9 isActive] & 1) == 0)
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      id v16 = v11;
      uint64_t v17 = objc_msgSend(v9, "hd_shortDescription");
      *(_DWORD *)long long buf = 138543362;
      uint64_t v24 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "IDS bug: active device isActive=NO %{public}@", buf, 0xCu);
    }
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__HDNanoSyncManager_messageCenter_activeDeviceDidChange_acknowledgementHandler___block_invoke;
  v18[3] = &unk_1E62F7150;
  id v19 = v8;
  SEL v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(queue, v18);
}

void __80__HDNanoSyncManager_messageCenter_activeDeviceDidChange_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v2 + 72))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__HDNanoSyncManager_messageCenter_activeDeviceDidChange_acknowledgementHandler___block_invoke_2;
    v6[3] = &unk_1E62F7178;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    id v9 = *(id *)(a1 + 56);
    -[HDNanoSyncManager _queue_updateSyncStoresWithCompletion:](v2, v6);
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void __80__HDNanoSyncManager_messageCenter_activeDeviceDidChange_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "hd_deviceIdentifier");
  id v3 = [*(id *)(*(void *)(a1 + 40) + 96) device];
  id v4 = objc_msgSend(v3, "hd_deviceIdentifier");

  if (v2 != v4 && (!v4 || ([v2 isEqualToString:v4] & 1) == 0))
  {
    _HKInitializeLogging();
    uint64_t v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 96);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "unexpected active store %{public}@ after switch to device %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)messageCenterDidReceiveRestoreRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HDNanoSyncManager_messageCenterDidReceiveRestoreRequest___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);
}

void __59__HDNanoSyncManager_messageCenterDidReceiveRestoreRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = v5;
  if (!v3)
  {
    uint64_t v11 = v5;
    goto LABEL_34;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (v4)
  {
    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:sel__queue_handleRestoreRequest_syncStore_, v3, @"HDNanoSyncManager.m", 2120, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
  }
  __int16 v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:sel__queue_handleRestoreRequest_syncStore_, v3, @"HDNanoSyncManager.m", 2121, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

LABEL_4:
  id v7 = [v4 pbRequest];
  int v8 = [v7 activationRestore];
  id v51 = [v8 decodedRestoreUUID];
  uint64_t v49 = [v8 sequenceNumber];
  uint64_t v9 = [v4 fromParticipant];
  __int16 v10 = [v9 device];
  id v55 = 0;
  uint64_t v11 = -[HDNanoSyncManager _queue_validatedSyncStore:device:message:error:](v3, v6, v10, v7, (uint64_t)&v55);
  id v48 = v55;

  if (!v11)
  {
    _HKInitializeLogging();
    id v19 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      SEL v20 = v19;
      id v21 = [v4 idsIdentifier];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v48;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "ignoring restore request %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_33;
  }
  os_signpost_id_t v12 = _HKLogSignpostIDGenerate();
  _HKInitializeLogging();
  id v13 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29FA8]))
  {
    id v14 = v13;
    id v15 = v14;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v16 = [v4 idsIdentifier];
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v12, "nano-sync-restore-request", "request %{public}@", buf, 0xCu);
    }
  }
  uint64_t v17 = +[HKDaemonTransaction transactionWithOwner:v3 activityName:@"ReceiveRestoreRequest"];
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__31;
  v53[4] = __Block_byref_object_dispose__31;
  id v54 = 0;
  obuint64_t j = 0;
  id v18 = v4;
  id v50 = v11;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (!*(unsigned char *)(v3 + 8))
  {
    BOOL v43 = [v18 pbRequest];
    int v42 = [v43 decodedPersistentPairingUUID];
    uint64_t v41 = [v43 decodedHealthPairingUUID];
    if (v42)
    {
      if (v41)
      {
        id v22 = [v43 activationRestore];
        uint64_t v23 = v22;
        if (v22)
        {
          if ([v22 hasRequiredFields])
          {
            if ([v23 sequenceNumber] == 1)
            {
              if ([v23 statusCode] == 3)
              {
                objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &obj, 100, @"remote requested abort");
                uint64_t log = 2;
              }
              else
              {
                uint64_t v39 = [v50 persistentUUID];
                id v40 = [v50 healthUUID];
                if (v40
                  && ([v23 decodedObliteratedHealthPairingUUIDs],
                      os_log_t logb = (os_log_t)objc_claimAutoreleasedReturnValue(),
                      char v37 = [logb containsObject:v40],
                      logb,
                      (v37 & 1) != 0))
                {
                  uint64_t v31 = 4;
                }
                else if (v39 && ![v39 isEqual:v42] {
                       || v40 && ([v40 isEqual:v41] & 1) == 0)
                }
                {
                  _HKInitializeLogging();
                  os_log_t loga = (os_log_t)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                  {
                    logc = loga;
                    uint64_t v38 = [v18 idsIdentifier];
                    uint64_t v36 = [v42 UUIDString];
                    uint64_t v32 = [v39 UUIDString];
                    *(_DWORD *)long long buf = 138543874;
                    *(void *)&uint8_t buf[4] = v38;
                    *(_WORD *)&unsigned char buf[12] = 2114;
                    *(void *)&buf[14] = v36;
                    *(_WORD *)&buf[22] = 2114;
                    uint64_t v57 = (void *)v32;
                    id v35 = (void *)v32;
                    _os_log_impl(&dword_1BCB7D000, logc, OS_LOG_TYPE_DEFAULT, "received restore message %{public}@ with unknown persistent pairing UUID %{public}@ (expected %{public}@)", buf, 0x20u);
                  }
                  uint64_t v31 = 3;
                }
                else
                {
                  uint64_t v31 = 1;
                }
                uint64_t log = v31;
              }
              goto LABEL_28;
            }
            uint64_t v25 = @"restore request has invalid sequence number";
          }
          else
          {
            uint64_t v25 = @"restore request missing required fields";
          }
        }
        else
        {
          uint64_t v25 = @"missing restore request content";
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &obj, 100, v25);
        uint64_t log = 0;
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v24 = @"missing health UUID";
    }
    else
    {
      uint64_t v24 = @"missing persistent UUID";
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &obj, 100, v24);
    uint64_t log = 0;
LABEL_29:

    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &obj, 100, @"unexpected restore request on master device");
  uint64_t log = 0;
LABEL_30:

  objc_storeStrong(&v54, obj);
  uint64_t v26 = [v50 restoreSession];
  if (log == 1)
  {
    uint64_t v27 = [v50 beginRestoreSessionWithUUID:v51 timeout:0 timeoutHandler:0.0];

    uint64_t v26 = (void *)v27;
  }
  [v26 setSequenceNumber:v49];
  int v28 = *(NSObject **)(v3 + 64);
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&uint8_t buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __59__HDNanoSyncManager__queue_handleRestoreRequest_syncStore___block_invoke;
  uint64_t v57 = &unk_1E62F7378;
  id v58 = v50;
  id v29 = v7;
  uint64_t v66 = log;
  id v59 = v29;
  uint64_t v60 = v3;
  id v61 = v8;
  id v62 = v18;
  CFAbsoluteTime v65 = v53;
  id v63 = v51;
  id v64 = v17;
  uint64_t v67 = v49;
  os_signpost_id_t v68 = v12;
  id v30 = v17;
  dispatch_async(v28, buf);

  _Block_object_dispose(v53, 8);
LABEL_33:

LABEL_34:
}

- (void)messageCenterDidReceiveRestoreResponse:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HDNanoSyncManager_messageCenterDidReceiveRestoreResponse___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);
}

void __60__HDNanoSyncManager_messageCenterDidReceiveRestoreResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = v5;
  if (!v3)
  {
    id v13 = v5;
    goto LABEL_34;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (v4)
  {
    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
    __int16 v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:sel__queue_handleRestoreResponse_syncStore_, v3, @"HDNanoSyncManager.m", 2215, @"Invalid parameter not satisfying: %@", @"response != nil" object file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
  }
  id v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:sel__queue_handleRestoreResponse_syncStore_, v3, @"HDNanoSyncManager.m", 2216, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

LABEL_4:
  id v7 = [v4 pbResponse];
  int v8 = [v7 activationRestore];
  uint64_t v39 = [v8 decodedRestoreUUID];
  uint64_t v9 = [v8 sequenceNumber];
  int v10 = [v8 statusCode];
  id v40 = [v6 restoreSession];
  uint64_t v11 = [v4 fromParticipant];
  os_signpost_id_t v12 = [v11 device];
  id v41 = 0;
  id v13 = -[HDNanoSyncManager _queue_validatedSyncStore:device:message:error:](v3, v6, v12, v7, (uint64_t)&v41);
  id v38 = v41;

  if (v13)
  {
    if (*(unsigned char *)(v3 + 8))
    {
      id v14 = v39;
      if (v8)
      {
        if ([v13 validatePairingUUIDsWithIncomingMessage:v7])
        {
          if ([v8 hasRequiredFields])
          {
            if (v40)
            {
              id v15 = [v40 sessionUUID];
              char v16 = [v39 isEqual:v15];

              if (v16)
              {
                *(void *)aBlock = MEMORY[0x1E4F143A8];
                *(void *)&aBlock[8] = 3221225472;
                *(void *)&aBlock[16] = __60__HDNanoSyncManager__queue_handleRestoreResponse_syncStore___block_invoke;
                id v47 = &unk_1E62F73A0;
                id v17 = v4;
                int v50 = v10;
                id v48 = v17;
                uint64_t v49 = v9;
                id v18 = (void (**)(void))_Block_copy(aBlock);
                id v19 = v18;
                switch(v10)
                {
                  case 1:
                    uint64_t v32 = v18[2];
                    break;
                  case 3:
                    ((void (*)(void (**)(void), uint64_t, __CFString *))v18[2])(v18, 16, @"aborting restore");
                    uint64_t v24 = @"abort requested by remote";
LABEL_36:

                    _HKInitializeLogging();
                    uint64_t v33 = (void *)*MEMORY[0x1E4F29FA8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v36 = v33;
                      char v37 = [v17 idsIdentifier];
                      *(_DWORD *)long long buf = 138543618;
                      BOOL v43 = v37;
                      __int16 v44 = 2114;
                      int v45 = v24;
                      _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "aborted restore with message %{public}@: %{public}@", buf, 0x16u);
                    }
                    uint64_t v23 = v38;
                    id v14 = v39;
                    if (!v38)
                    {
                      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, v24);
                    }
                    -[HDNanoSyncManager _queue_transitionToRestoreIncompleteWithSyncStore:error:](v3, v13, v23);
LABEL_26:

                    goto LABEL_33;
                  case 2:
                    ((void (*)(void (**)(void), void, __CFString *))v18[2])(v18, 0, @"finishing restore");
                    if (v9 == [v40 sequenceNumber])
                    {
                      -[HDNanoSyncManager _queue_transitionToRestoreCompleteWithSyncStore:](v3, v13);
LABEL_31:

                      goto LABEL_32;
                    }
                    objc_msgSend(NSString, "stringWithFormat:", @"unxpected finish sequence number %lld (expected %lld)", v9, objc_msgSend(v40, "sequenceNumber"));
                    uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_36;
                  default:
                    uint64_t v32 = v18[2];
                    break;
                }
                v32();
                goto LABEL_31;
              }
              uint64_t v25 = NSString;
              uint64_t v26 = [v39 UUIDString];
              uint64_t v27 = [v40 sessionUUID];
              int v28 = [v27 UUIDString];
              uint64_t v24 = [v25 stringWithFormat:@"unexpected restore UUID %@ (expected %@)", v26, v28];
            }
            else
            {
              uint64_t v24 = @"no active restore session";
            }
          }
          else
          {
            uint64_t v24 = @"restore response missing required fields";
          }
        }
        else
        {
          uint64_t v24 = @"invalid pairing UUIDs";
        }
      }
      else
      {
        uint64_t v24 = @"missing restore response content";
      }
    }
    else
    {
      uint64_t v24 = @"unexpected restore response on slave";
      id v14 = v39;
    }
    _HKInitializeLogging();
    id v29 = (void *)*MEMORY[0x1E4F29FA8];
    uint64_t v23 = v38;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v30 = v29;
      uint64_t v31 = [v4 idsIdentifier];
      *(_DWORD *)aBlock = 138543618;
      *(void *)&void aBlock[4] = v31;
      *(_WORD *)&aBlock[12] = 2114;
      *(void *)&aBlock[14] = v24;
      _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "ignoring restore response %{public}@: %{public}@", aBlock, 0x16u);
    }
    goto LABEL_26;
  }
  _HKInitializeLogging();
  SEL v20 = (void *)*MEMORY[0x1E4F29FA8];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
LABEL_32:
    uint64_t v23 = v38;
    id v14 = v39;
    goto LABEL_33;
  }
  id v21 = v20;
  id v22 = [v4 idsIdentifier];
  *(_DWORD *)aBlock = 138543618;
  *(void *)&void aBlock[4] = v22;
  *(_WORD *)&aBlock[12] = 2114;
  uint64_t v23 = v38;
  *(void *)&aBlock[14] = v38;
  _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "ignoring restore response %{public}@: %{public}@", aBlock, 0x16u);

  id v14 = v39;
LABEL_33:

LABEL_34:
}

- (void)messageCenterRestoreError:(id)a3
{
}

- (void)messageCenterChangesError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HDNanoSyncManager_messageCenterChangesError___block_invoke;
  v6[3] = &unk_1E62F71A0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  -[HDNanoSyncManager _handleOutgoingMessageError:usingBlock:]((uint64_t)self, v5, v6);
}

void __47__HDNanoSyncManager_messageCenterChangesError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v29 = a2;
  int v4 = objc_msgSend(v3, "hd_isFromRequest");
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v4)
  {
    id v7 = v5;
    id v8 = v29;
    if (!v6) {
      goto LABEL_20;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
    if (!objc_msgSend(v7, "hd_isResponseTimeout"))
    {
      uint64_t v23 = objc_msgSend(v7, "hd_persistentMessage");
      _HKInitializeLogging();
      uint64_t v24 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = v24;
        uint64_t v26 = objc_msgSend(v7, "hd_messageIDSIdentifier");
        uint64_t v27 = [v23 nanoSyncDescription];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&unsigned char buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "resetting anchors for failed change request %{public}@: %{public}@", buf, 0x16u);
      }
      int v28 = *(NSObject **)(v6 + 64);
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __74__HDNanoSyncManager__queue_changeRequestDidFailToSendWithError_syncStore___block_invoke;
      uint64_t v31 = &unk_1E62F30F8;
      uint64_t v32 = v6;
      id v33 = v23;
      id v34 = v8;
      int v10 = v23;
      dispatch_async(v28, buf);

      goto LABEL_19;
    }
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x1E4F29FA8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    int v10 = v9;
    objc_msgSend(v7, "hd_messageIDSIdentifier");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "timeout waiting for response to change request %{public}@", buf, 0xCu);
  }
  else
  {
    id v7 = v5;
    id v8 = v29;
    if (!v6) {
      goto LABEL_20;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
    os_signpost_id_t v12 = objc_msgSend(v7, "hd_persistentMessage");
    int v10 = [v12 status];
    int v13 = [v10 statusCode];
    id v14 = (os_log_t *)MEMORY[0x1E4F29FA8];
    if (v13 == 2 && ([v8 needsSyncOnUnlock] & 1) == 0)
    {
      _HKInitializeLogging();
      os_log_t v15 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        char v16 = v15;
        id v17 = objc_msgSend(v7, "hd_messageIDSIdentifier");
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "failed to send Resend response %{public}@; will attempt to send at next unlock",
          buf,
          0xCu);
      }
      [v8 setNeedsSyncOnUnlock:1];
    }
    _HKInitializeLogging();
    os_log_t v18 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      SEL v20 = objc_msgSend(v7, "hd_messageIDSIdentifier");
      id v21 = [v12 nanoSyncDescription];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "resetting anchors for failed change request %{public}@: %{public}@", buf, 0x16u);
    }
    id v22 = *(NSObject **)(v6 + 64);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __75__HDNanoSyncManager__queue_changeResponseDidFailToSendWithError_syncStore___block_invoke;
    uint64_t v31 = &unk_1E62F30F8;
    uint64_t v32 = v6;
    id v33 = v12;
    id v34 = v8;
    id v11 = v12;
    dispatch_async(v22, buf);
  }
LABEL_19:

LABEL_20:
}

- (void)messageCenterDidReceiveAuthorizationRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HDNanoSyncManager_messageCenterDidReceiveAuthorizationRequest___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);
}

void __65__HDNanoSyncManager_messageCenterDidReceiveAuthorizationRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = a2;
  if (!v3) {
    goto LABEL_8;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (!v4)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:sel__queue_receiveAuthorizationRequest_syncStore_, v3, @"HDNanoSyncManager.m", 4160, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

    if (v5) {
      goto LABEL_4;
    }
LABEL_10:
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:sel__queue_receiveAuthorizationRequest_syncStore_, v3, @"HDNanoSyncManager.m", 4161, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v5) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v6 = [v4 pbRequest];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke;
  aBlock[3] = &unk_1E62F7708;
  void aBlock[4] = v3;
  id v7 = v6;
  id v41 = v7;
  id v8 = v5;
  id v42 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_2;
  v35[3] = &unk_1E62F7730;
  id v36 = v4;
  id v10 = v7;
  id v37 = v10;
  uint64_t v38 = v3;
  id v39 = v8;
  id v11 = _Block_copy(v35);
  os_signpost_id_t v12 = [v10 appBundleIdentifier];
  int v13 = v12;
  if (v12)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_2_894;
    v29[3] = &unk_1E62F7758;
    id v26 = v12;
    id v30 = v26;
    uint64_t v31 = v3;
    id v14 = v9;
    id v32 = v14;
    id v33 = v11;
    id v34 = sel__queue_receiveAuthorizationRequest_syncStore_;
    os_log_t v15 = _Block_copy(v29);
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
    [WeakRetained authorizationManager];
    v17 = id v28 = v5;
    [v10 decodedWriteTypes];
    uint64_t v27 = v13;
    v19 = os_log_t v18 = v9;
    [v10 decodedReadTypes];
    SEL v20 = v11;
    id v22 = v21 = v4;
    id v23 = (id)[v17 enqueueAuthorizationRequestForBundleIdentifier:v26 writeTypes:v19 readTypes:v22 authorizationNeededHandler:v15 completion:v14];

    id v4 = v21;
    id v11 = v20;

    uint64_t v9 = v18;
    int v13 = v27;

    id v5 = v28;
  }
  else
  {
    (*((void (**)(void *, void, void, void))v11 + 2))(v11, 0, 0, 0);
  }

LABEL_8:
}

- (void)messageCenterDidReceiveAuthorizationResponse:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__HDNanoSyncManager_messageCenterDidReceiveAuthorizationResponse___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);
}

void __66__HDNanoSyncManager_messageCenterDidReceiveAuthorizationResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = a2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    if (v4)
    {
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      os_log_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:sel__queue_receiveAuthorizationResponse_syncStore_, v3, @"HDNanoSyncManager.m", 4264, @"Invalid parameter not satisfying: %@", @"response != nil" object file lineNumber description];

      if (v5) {
        goto LABEL_4;
      }
    }
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel__queue_receiveAuthorizationResponse_syncStore_, v3, @"HDNanoSyncManager.m", 4265, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

LABEL_4:
    uint64_t v6 = [v4 requestPersistentUserInfo];
    id v7 = [v6 objectForKeyedSubscript:@"auth-identifier"];
    if (!v7)
    {
LABEL_15:

      goto LABEL_16;
    }
    id v8 = [v5 pendingRequestContextForUUID:v7];
    if (!v8)
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v9 = [v4 pbResponse];
    int v10 = [v9 shouldPrompt];
    id v11 = [v9 errorDescription];
    os_signpost_id_t v12 = [v9 hostAppName];
    _HKInitializeLogging();
    int v13 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v11;
      _os_log_debug_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEBUG, "Received response to authorization request; host app is %@ and should prompt is %d; error: %{public}@",
        buf,
        0x1Cu);
      if (v11) {
        goto LABEL_8;
      }
    }
    else if (v11)
    {
LABEL_8:
      id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 5, v11);
LABEL_11:
      if (v8[2])
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __67__HDNanoSyncManager__queue_receiveAuthorizationResponse_syncStore___block_invoke;
        *(void *)&unsigned char buf[24] = &unk_1E62F7780;
        os_log_t v18 = v8;
        char v21 = v10;
        id v19 = v12;
        id v20 = v14;
        HKDispatchAsyncOnGlobalConcurrentQueue();
      }
      goto LABEL_14;
    }
    id v14 = 0;
    goto LABEL_11;
  }
LABEL_16:
}

- (void)messageCenterDidReceiveAuthorizationError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HDNanoSyncManager_messageCenterDidReceiveAuthorizationError___block_invoke;
  v6[3] = &unk_1E62F71A0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[HDNanoSyncManager _handleOutgoingMessageError:usingBlock:]((uint64_t)self, v5, v6);
}

void __63__HDNanoSyncManager_messageCenterDidReceiveAuthorizationError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hd_isFromRequest"))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(id *)(a1 + 32);
    id v5 = v11;
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
      _HKInitializeLogging();
      uint64_t v6 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Error sending authorization request: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      id v7 = objc_msgSend(v4, "hd_persistentUserInfo");
      id v8 = [v7 objectForKeyedSubscript:@"auth-identifier"];
      if (v8)
      {
        uint64_t v9 = [v5 pendingRequestContextForUUID:v8];
        int v10 = v9;
        if (v9)
        {
          if (v9[2])
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            os_log_t v15 = __81__HDNanoSyncManager__queue_authorizationRequestDidFailToSendWithError_syncStore___block_invoke;
            char v16 = &unk_1E62F31C0;
            id v17 = v9;
            id v18 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();
          }
          if (v10[3])
          {
            os_signpost_id_t v12 = v10;
            id v13 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();
          }
          [v5 removePendingRequestContextForUUID:v8];
        }
      }
    }
  }
}

- (void)messageCenterDidReceiveAuthorizationCompleteRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__HDNanoSyncManager_messageCenterDidReceiveAuthorizationCompleteRequest___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);
}

void __73__HDNanoSyncManager_messageCenterDidReceiveAuthorizationCompleteRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = a2;
  if (!v3) {
    goto LABEL_20;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (!v4)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:sel__queue_receiveAuthorizationCompleteRequest_syncStore_, v3, @"HDNanoSyncManager.m", 4328, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

    if (v5) {
      goto LABEL_4;
    }
LABEL_22:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__queue_receiveAuthorizationCompleteRequest_syncStore_, v3, @"HDNanoSyncManager.m", 4329, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v5) {
    goto LABEL_22;
  }
LABEL_4:
  uint64_t v6 = [v4 pbRequest];
  id v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = [v6 requestIdentifier];
  uint64_t v9 = objc_msgSend(v7, "hk_UUIDWithData:", v8);

  int v10 = [v5 pendingRequestContextForUUID:v9];
  if (v10)
  {
    id v11 = [v6 errorDescription];
    if (v11
      && (objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 5, v11),
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v13 = (void *)v12;
      _HKInitializeLogging();
      id v14 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&unsigned char buf[12] = 2114;
        *(void *)&buf[14] = v11;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Received authorization error from companion for request UUID: %@; error: %{public}@",
          buf,
          0x16u);
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v15 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_debug_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEBUG, "Received authorization complete from companion for request UUID: %@", buf, 0xCu);
      }
      id v13 = 0;
    }
    if (v10[3])
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __74__HDNanoSyncManager__queue_receiveAuthorizationCompleteRequest_syncStore___block_invoke;
      char v21 = &unk_1E62F31C0;
      uint64_t v22 = v10;
      id v23 = v13;
      HKDispatchAsyncOnGlobalConcurrentQueue();
    }
    else
    {
      _HKInitializeLogging();
      id v17 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEBUG, "No completion handler found for authorization complete message; dropping.",
          buf,
          2u);
      }
    }
    [v5 removePendingRequestContextForUUID:v9];
  }
  else
  {
    _HKInitializeLogging();
    char v16 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_debug_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEBUG, "Received authorization complete from companion for request UUID: %@, but no request context was found; dropping",
        buf,
        0xCu);
    }
  }

LABEL_20:
}

- (void)messageCenterDidReceiveRoutineRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HDNanoSyncManager_messageCenterDidReceiveRoutineRequest___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);
}

void __59__HDNanoSyncManager_messageCenterDidReceiveRoutineRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  if (v3)
  {
    id v4 = *(NSObject **)(v3 + 56);
    id v5 = a2;
    dispatch_assert_queue_V2(v4);
    uint64_t v6 = v14;
    if (v14)
    {
      if (v5)
      {
LABEL_4:
        id v7 = v6;
        id v8 = objc_alloc_init(HDCodableRoutineResponseMessage);
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"request not supported");
        int v10 = [v9 localizedDescription];
        [(HDCodableRoutineResponseMessage *)v8 setErrorDescription:v10];

        id v11 = [v7 response];

        [v11 setPbResponse:v8];
        -[HDNanoSyncManager _queue_sendResponse:syncStore:](v3, v11, v5);

        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel__queue_receiveRoutineRequest_syncStore_, v3, @"HDNanoSyncManager.m", 3164, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

      uint64_t v6 = 0;
      if (v5) {
        goto LABEL_4;
      }
    }
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:sel__queue_receiveRoutineRequest_syncStore_, v3, @"HDNanoSyncManager.m", 3165, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

    uint64_t v6 = v14;
    goto LABEL_4;
  }
LABEL_5:
}

- (void)messageCenterDidReceiveStartWorkoutAppRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppRequest___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);
}

void __67__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = a2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    uint64_t v6 = [v4 pbRequest];
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
    {
      id v13 = v7;
      id v14 = [v6 requestIdentifier];
      LODWORD(aBlock) = 138412290;
      *(void *)((char *)&aBlock + 4) = v14;
      _os_log_debug_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEBUG, "Received start workout app request %@", (uint8_t *)&aBlock, 0xCu);
    }
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__31;
    v15[4] = __Block_byref_object_dispose__31;
    id v8 = v4;
    id v16 = v8;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 3221225472;
    id v18 = __68__HDNanoSyncManager__queue_recieveStartWorkoutAppRequest_syncStore___block_invoke;
    uint64_t v19 = &unk_1E62F7530;
    id v9 = v6;
    id v20 = v9;
    id v21 = v8;
    uint64_t v22 = v3;
    id v23 = v5;
    uint64_t v24 = v15;
    int v10 = _Block_copy(&aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
    uint64_t v12 = [WeakRetained workoutManager];
    [v12 receivedStartWorkoutAppRequest:v9 completion:v10];

    _Block_object_dispose(v15, 8);
  }
}

- (void)messageCenterDidReceiveStartWorkoutAppResponse:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppResponse___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);
}

void __68__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  if (v2)
  {
    id v5 = *(NSObject **)(v2 + 56);
    id v6 = v3;
    dispatch_assert_queue_V2(v5);
    id v7 = [v6 requestPersistentUserInfo];
    id v8 = [v6 pbResponse];

    if ([v8 hasLaunchError])
    {
      id v9 = [v8 launchError];
      int v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorWithCodableError:", v9);
    }
    else
    {
      int v10 = 0;
    }
    _HKInitializeLogging();
    id v11 = (os_log_t *)MEMORY[0x1E4F29FB8];
    uint64_t v12 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
    {
      id v21 = v12;
      uint64_t v22 = [v8 requestIdentifier];
      *(_DWORD *)id v23 = 138412546;
      *(void *)&v23[4] = v22;
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v10;
      _os_log_debug_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEBUG, "Received response to start workout app request %@, error: %{public}@", v23, 0x16u);
    }
    id v13 = [v7 objectForKeyedSubscript:@"workout-launch"];
    if (v13)
    {
      uint64_t v14 = [v4 pendingRequestContextForUUID:v13];
      os_log_t v15 = v14;
      if (v14)
      {
        id v16 = *(id *)(v14 + 16);
        id v17 = v16;
        if (v16)
        {
          *(void *)id v23 = MEMORY[0x1E4F143A8];
          *(void *)&v23[8] = 3221225472;
          *(void *)&v23[16] = __69__HDNanoSyncManager__queue_recieveStartWorkoutAppResponse_syncStore___block_invoke;
          uint64_t v24 = &unk_1E62F61D0;
          uint64_t v27 = v16;
          id v25 = v8;
          id v26 = v10;
          HKDispatchAsyncOnGlobalConcurrentQueue();
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v19 = *v11;
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
LABEL_16:

          goto LABEL_17;
        }
        id v17 = v19;
        id v20 = [v13 UUIDString];
        *(_DWORD *)id v23 = 138412290;
        *(void *)&v23[4] = v20;
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_INFO, "Ignoring response: no context for %@", v23, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v18 = *v11;
      if (!os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      os_log_t v15 = v18;
      id v17 = [v8 requestIdentifier];
      *(_DWORD *)id v23 = 138412290;
      *(void *)&v23[4] = v17;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_INFO, "Ignoring response: no request identifier for %@", v23, 0xCu);
    }

    goto LABEL_16;
  }
LABEL_18:
}

- (void)messageCenterDidReceiveStartWorkoutAppError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppError___block_invoke;
  v6[3] = &unk_1E62F71A0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[HDNanoSyncManager _handleOutgoingMessageError:usingBlock:]((uint64_t)self, v5, v6);
}

void __65__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hd_isFromRequest"))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(id *)(a1 + 32);
    id v5 = v14;
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
      id v6 = objc_msgSend(v4, "hd_persistentUserInfo");
      id v7 = [v6 objectForKeyedSubscript:@"workout-launch"];
      if (v7)
      {
        uint64_t v8 = [v5 pendingRequestContextForUUID:v7];
        id v9 = (void *)v8;
        if (v8)
        {
          id v10 = *(id *)(v8 + 16);
          id v11 = v10;
          if (v10)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            id v16 = __83__HDNanoSyncManager__queue_startWorkoutAppRequestDidFailToSendWithError_syncStore___block_invoke;
            id v17 = &unk_1E62F3CA8;
            id v19 = v10;
            id v18 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();
          }
          [v5 removePendingRequestContextForUUID:v7];
        }
        else
        {
          _HKInitializeLogging();
          id v13 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, "Ignoring error: no context for %@", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v12 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "Ignoring error: no request identifier", (uint8_t *)&buf, 2u);
        }
      }
    }
  }
}

- (void)messageCenterDidReceiveCompanionUserNotificationRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationRequest___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);
}

void __77__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = a2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    id v6 = [v4 pbRequest];
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEBUG))
    {
      id v13 = v7;
      id v14 = [v6 requestIdentifier];
      LODWORD(aBlock) = 138412290;
      *(void *)((char *)&aBlock + 4) = v14;
      _os_log_debug_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEBUG, "Received display notification request %@", (uint8_t *)&aBlock, 0xCu);
    }
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__31;
    v15[4] = __Block_byref_object_dispose__31;
    id v8 = v4;
    id v16 = v8;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 3221225472;
    id v18 = __78__HDNanoSyncManager__queue_recieveCompanionUserNotificationRequest_syncStore___block_invoke;
    id v19 = &unk_1E62F7578;
    id v9 = v6;
    id v20 = v9;
    id v21 = v8;
    uint64_t v22 = v3;
    id v23 = v5;
    uint64_t v24 = v15;
    id v10 = _Block_copy(&aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
    uint64_t v12 = [WeakRetained notificationManager];
    [v12 receivedCompanionUserNotificationRequest:v9 completion:v10];

    _Block_object_dispose(v15, 8);
  }
}

- (void)messageCenterDidReceiveCompanionUserNotificationResponse:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationResponse___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);
}

void __78__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  if (v2)
  {
    id v5 = *(NSObject **)(v2 + 56);
    id v6 = v3;
    dispatch_assert_queue_V2(v5);
    id v7 = [v6 requestPersistentUserInfo];
    id v8 = [v6 pbResponse];

    if ([v8 hasError])
    {
      id v9 = [v8 error];
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorWithCodableError:", v9);
    }
    else
    {
      id v10 = 0;
    }
    _HKInitializeLogging();
    id v11 = (os_log_t *)MEMORY[0x1E4F29F80];
    uint64_t v12 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEBUG))
    {
      id v21 = v12;
      uint64_t v22 = [v8 requestIdentifier];
      *(_DWORD *)id v23 = 138412546;
      *(void *)&v23[4] = v22;
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v10;
      _os_log_debug_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEBUG, "Received response to display notification request %@, error: %@", v23, 0x16u);
    }
    id v13 = [v7 objectForKeyedSubscript:@"companion-user-notification"];
    if (v13)
    {
      uint64_t v14 = [v4 pendingRequestContextForUUID:v13];
      os_log_t v15 = v14;
      if (v14)
      {
        id v16 = *(id *)(v14 + 16);
        id v17 = v16;
        if (v16)
        {
          *(void *)id v23 = MEMORY[0x1E4F143A8];
          *(void *)&v23[8] = 3221225472;
          *(void *)&v23[16] = __79__HDNanoSyncManager__queue_recieveCompanionUserNotificationResponse_syncStore___block_invoke;
          uint64_t v24 = &unk_1E62F61D0;
          uint64_t v27 = v16;
          id v25 = v8;
          id v26 = v10;
          HKDispatchAsyncOnGlobalConcurrentQueue();
        }
      }
      else
      {
        _HKInitializeLogging();
        id v19 = *v11;
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
LABEL_16:

          goto LABEL_17;
        }
        id v17 = v19;
        id v20 = [v13 UUIDString];
        *(_DWORD *)id v23 = 138412290;
        *(void *)&v23[4] = v20;
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_INFO, "Ignoring response: no context for %@", v23, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v18 = *v11;
      if (!os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      os_log_t v15 = v18;
      id v17 = [v8 requestIdentifier];
      *(_DWORD *)id v23 = 138412290;
      *(void *)&v23[4] = v17;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_INFO, "Ignoring response: no request identifier for %@", v23, 0xCu);
    }

    goto LABEL_16;
  }
LABEL_18:
}

- (void)messageCenterDidReceiveCompanionUserNotificationError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationError___block_invoke;
  v6[3] = &unk_1E62F71A0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[HDNanoSyncManager _handleOutgoingMessageError:usingBlock:]((uint64_t)self, v5, v6);
}

void __75__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hd_isFromRequest"))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(id *)(a1 + 32);
    id v5 = v14;
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
      id v6 = objc_msgSend(v4, "hd_persistentUserInfo");
      id v7 = [v6 objectForKeyedSubscript:@"companion-user-notification"];
      if (v7)
      {
        uint64_t v8 = [v5 pendingRequestContextForUUID:v7];
        id v9 = (void *)v8;
        if (v8)
        {
          id v10 = *(id *)(v8 + 16);
          id v11 = v10;
          if (v10)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            id v16 = __93__HDNanoSyncManager__queue_companionUserNotificationRequestDidFailToSendWithError_syncStore___block_invoke;
            id v17 = &unk_1E62F3CA8;
            id v19 = v10;
            id v18 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();
          }
          [v5 removePendingRequestContextForUUID:v7];
        }
        else
        {
          _HKInitializeLogging();
          id v13 = *MEMORY[0x1E4F29F80];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, "Ignoring error: no context for %@", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v12 = *MEMORY[0x1E4F29F80];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "Ignoring error: no request identifier", (uint8_t *)&buf, 2u);
        }
      }
    }
  }
}

- (void)messageCenterDidReceiveNotificationInstructionRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__HDNanoSyncManager_messageCenterDidReceiveNotificationInstructionRequest___block_invoke;
  v6[3] = &unk_1E62F71A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);
}

void __75__HDNanoSyncManager_messageCenterDidReceiveNotificationInstructionRequest___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 56));
    uint64_t v3 = [v2 pbRequest];
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEBUG))
    {
      id v18 = v4;
      id v19 = objc_opt_class();
      id v20 = v19;
      id v21 = [v3 requestIdentifier];
      *(_DWORD *)uint64_t v22 = 138543618;
      *(void *)&v22[4] = v19;
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v21;
      _os_log_debug_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] Received notification instruction request %@", v22, 0x16u);
    }
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    id v6 = [v2 fromParticipant];
    id v7 = [v6 device];
    uint64_t v8 = objc_msgSend(v7, "hd_shortDescription");
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v11 = [v2 fromParticipant];
      uint64_t v12 = [v11 deviceIdentifier];
      id v13 = (void *)v12;
      id v14 = @"Unknown fromParticipant";
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      id v10 = v14;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 48));
    id v16 = [WeakRetained notificationSyncManager];
    *(void *)uint64_t v22 = MEMORY[0x1E4F143A8];
    *(void *)&v22[8] = 3221225472;
    *(void *)&v22[16] = __76__HDNanoSyncManager__queue_receiveNotificationInstructionRequest_syncStore___block_invoke;
    id v23 = &unk_1E62F5D48;
    uint64_t v24 = v1;
    id v25 = v3;
    id v17 = v3;
    [v16 nanoSyncManagerDidReceiveNotificationInstructionRequest:v17 receivedDate:v5 sendingDeviceName:v10 completion:v22];
  }
}

- (void)messageCenterDidReceiveTinkerOptInRequest:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInRequest___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInRequest___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)*v2 + 6);
  id v4 = [v2[1] fromParticipant];
  id v5 = [v4 device];
  uint64_t v6 = +[HDNanoSyncStore nanoSyncStoreWithProfile:WeakRetained device:v5 delegate:*v2 tinkerPaired:1];
  id v7 = (void *)*((void *)*v2 + 13);
  *((void *)*v2 + 13) = v6;

  uint64_t v8 = *((void *)*v2 + 13);
  _HKInitializeLogging();
  id v9 = (os_log_t *)MEMORY[0x1E4F29FA8];
  id v10 = *MEMORY[0x1E4F29FA8];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 104);
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Created _activeTinkerSyncStore for new pairing request %{public}@ (#t0)", buf, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 104);
    id v15 = *(id *)(a1 + 40);
    id v16 = v14;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v13 + 56));
    if (!v15)
    {
      id v53 = [MEMORY[0x1E4F28B00] currentHandler];
      [v53 handleFailureInMethod:sel__queue_receiveTinkerOptInRequest_syncStore_, v13, @"HDNanoSyncManager.m", 3497, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];
    }
    if (!v16)
    {
      id v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:sel__queue_receiveTinkerOptInRequest_syncStore_, v13, @"HDNanoSyncManager.m", 3498, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];
    }
    id v17 = [v15 pbRequest];
    _HKInitializeLogging();
    os_log_t v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      id v20 = [v17 requestIdentifier];
      id v21 = [v16 nanoRegistryUUID];
      uint64_t v22 = [v16 device];
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      id v64 = v21;
      LOWORD(v65) = 2114;
      *(void *)((char *)&v65 + 2) = v22;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did receive Tinker opt in request from guardian %{public}@, active NR device ID %{public}@, active IDS device %{public}@ (#t0)", buf, 0x2Au);
    }
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __64__HDNanoSyncManager__queue_receiveTinkerOptInRequest_syncStore___block_invoke;
    id v64 = &unk_1E62F75A0;
    *(void *)&long long v65 = v13;
    id v23 = v15;
    *((void *)&v65 + 1) = v23;
    id v24 = v17;
    id v66 = v24;
    id v25 = v16;
    id v67 = v25;
    uint64_t v26 = _Block_copy(buf);
    uint64_t v27 = (id *)(v13 + 48);
    id v28 = objc_loadWeakRetained((id *)(v13 + 48));
    id v29 = [v28 daemon];

    id v30 = [v29 contentProtectionManager];
    LOBYTE(v28) = [v30 isProtectedDataAvailable];

    if (v28)
    {
      if ([v25 isAltAccount])
      {
        id v57 = v26;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v13 + 56));
        uint64_t v31 = *(void **)(v13 + 112);
        if (v31)
        {
          id v32 = (void *)[v57 copy];
          id v33 = _Block_copy(v32);
          [v31 addObject:v33];
        }
        else
        {
          id v40 = objc_alloc(MEMORY[0x1E4F1CA48]);
          id v41 = (void *)[v57 copy];
          uint64_t v42 = objc_msgSend(v40, "initWithObjects:", v41, 0);
          BOOL v43 = *(void **)(v13 + 112);
          *(void *)(v13 + 112) = v42;

          objc_initWeak(&location, (id)v13);
          __int16 v44 = *(NSObject **)(v13 + 56);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __75__HDNanoSyncManager__queue_registerForTinkerOptInNotificationWithResponse___block_invoke;
          handler[3] = &unk_1E62F3490;
          objc_copyWeak(&v61, &location);
          notify_register_dispatch((const char *)*MEMORY[0x1E4F2AA40], (int *)(v13 + 28), v44, handler);
          int v45 = *(NSObject **)(v13 + 56);
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __75__HDNanoSyncManager__queue_registerForTinkerOptInNotificationWithResponse___block_invoke_2;
          v58[3] = &unk_1E62F3490;
          objc_copyWeak(&v59, &location);
          notify_register_dispatch((const char *)*MEMORY[0x1E4F2AA48], (int *)(v13 + 32), v45, v58);
          objc_destroyWeak(&v59);
          objc_destroyWeak(&v61);
          objc_destroyWeak(&location);
        }

        id v46 = objc_loadWeakRetained((id *)(v13 + 48));
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          id v55 = [MEMORY[0x1E4F28B00] currentHandler];
          id v56 = objc_loadWeakRetained((id *)(v13 + 48));
          [v55 handleFailureInMethod:sel__queue_receiveTinkerOptInRequest_syncStore_, v13, @"HDNanoSyncManager.m", 3544, @"[sharing-setup] Profile %@ is not an instance of type HDPrimaryProfile (#t0)", v56 object file lineNumber description];
        }
        id v48 = [HDNotificationManager alloc];
        id v49 = objc_loadWeakRetained(v27);
        id v39 = [(HDNotificationManager *)v48 initWithProfile:v49 bundle:1];

        int v50 = [HDSharedDataOptInNotification alloc];
        uint64_t v51 = [v24 guardianDisplayName];
        id v52 = [(HDSharedDataOptInNotification *)v50 initWithNotificationManager:v39 guardianDisplayName:v51];

        [(HDNanoHealthNotification *)v52 triggerNotification];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Watch is not in Tinker pairing mode, ignoring opt in request: %@", v23);
        id v39 = (HDNotificationManager *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void, HDNotificationManager *))v26 + 2))(v26, 0, v39);
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v38 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(handler[0]) = 0;
        _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "[sharing-setup] Apple Watch is locked, sending setup error to guardian (#t0)", (uint8_t *)handler, 2u);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 6, @"Apple Watch needs to be unlocked for sharing setup, ignoring opt in request: %@", v23);
      id v39 = (HDNotificationManager *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void, HDNotificationManager *))v26 + 2))(v26, 0, v39);
    }
  }
  else if (v11)
  {
    id v34 = *(void **)(a1 + 40);
    uint64_t v35 = v10;
    id v36 = [v34 fromParticipant];
    id v37 = [v36 description];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v37;
    _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for request from device %{public}@ (#t0)", buf, 0xCu);
  }
}

- (void)messageCenterDidReceiveTinkerOptInResponse:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInResponse___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __64__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInResponse___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  if (v3) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  id v5 = [*(id *)(a1 + 40) fromParticipant];
  id v6 = [v5 device];
  uint64_t v7 = +[HDNanoSyncStore nanoSyncStoreWithProfile:WeakRetained device:v6 delegate:*(void *)(a1 + 32) tinkerPaired:1];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 104);
  *(void *)(v8 + 104) = v7;

  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  if (v3)
  {
LABEL_3:
    id v10 = *(void **)(a1 + 40);
    id v11 = v3;
    uint64_t v12 = *(NSObject **)(v2 + 56);
    id v13 = v10;
    dispatch_assert_queue_V2(v12);
    if (!v13)
    {
      uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:sel__queue_receiveTinkerOptInResponse_syncStore_, v2, @"HDNanoSyncManager.m", 3599, @"Invalid parameter not satisfying: %@", @"response != nil" object file lineNumber description];
    }
    id v14 = [v13 requestPersistentUserInfo];
    id v15 = [v13 pbResponse];

    if ([v15 hasError])
    {
      id v16 = [v15 error];
      id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorWithCodableError:", v16);
    }
    else
    {
      id v17 = 0;
    }
    _HKInitializeLogging();
    os_log_t v18 = (os_log_t *)MEMORY[0x1E4F29FA8];
    id v19 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      id v21 = [v15 requestIdentifier];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      id v37 = v17;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did receive Tinker opt in response from watch %@, error: %@ (#t0)", buf, 0x20u);
    }
    uint64_t v22 = [v14 objectForKeyedSubscript:@"tinker-optin"];
    if (v22)
    {
      uint64_t v23 = [v11 pendingRequestContextForUUID:v22];
      id v24 = v23;
      if (v23)
      {
        id v25 = *(id *)(v23 + 16);
        uint64_t v26 = v25;
        if (v25)
        {
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = __65__HDNanoSyncManager__queue_receiveTinkerOptInResponse_syncStore___block_invoke;
          id v37 = &unk_1E62F61D0;
          id v40 = v25;
          id v38 = v15;
          id v39 = v17;
          HKDispatchAsyncOnGlobalConcurrentQueue();
        }
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v28 = *v18;
        if (!os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:

          goto LABEL_20;
        }
        uint64_t v26 = v28;
        id v29 = [v22 UUIDString];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no context for %@ (#t0)", buf, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v27 = *v18;
      if (!os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        return;
      }
      id v24 = v27;
      uint64_t v26 = [v15 requestIdentifier];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no request identifier for %@ (#t0)", buf, 0xCu);
    }

    goto LABEL_19;
  }
  _HKInitializeLogging();
  id v30 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = *(void **)(a1 + 40);
    id v32 = v30;
    id v33 = [v31 fromParticipant];
    id v34 = [v33 description];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v34;
    _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for response from device %{public}@ (#t0)", buf, 0xCu);
  }
}

- (void)messageCenterDidReceiveTinkerOptInError:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logOutgoingMessageError:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInError___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInError___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hd_isFromRequest"))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(v2 + 104);
      id v4 = *(id *)(a1 + 40);
      id v5 = v3;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)os_log_t v18 = 138543362;
        *(void *)&void v18[4] = v4;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[sharing-setup] Error sending health sharing opt in request %{public}@ (#t0)", v18, 0xCu);
      }
      uint64_t v7 = objc_msgSend(v4, "hd_persistentUserInfo");
      id v8 = [v7 objectForKeyedSubscript:@"tinker-optin"];
      if (v8)
      {
        uint64_t v9 = [v5 pendingRequestContextForUUID:v8];
        id v10 = (void *)v9;
        if (v9)
        {
          id v11 = *(id *)(v9 + 16);
          uint64_t v12 = v11;
          if (v11)
          {
            *(void *)os_log_t v18 = MEMORY[0x1E4F143A8];
            *(void *)&v18[8] = 3221225472;
            *(void *)&v18[16] = __79__HDNanoSyncManager__queue_tinkerOptInRequestDidFailToSendWithError_syncStore___block_invoke;
            id v19 = &unk_1E62F3CA8;
            id v21 = v11;
            id v20 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();
          }
          [v5 removePendingRequestContextForUUID:v8];
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v13 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *(void **)(a1 + 40);
      id v15 = v13;
      id v16 = objc_msgSend(v14, "hd_messageIDSIdentifier");
      id v17 = objc_msgSend(*(id *)(a1 + 40), "hd_messageIDSDeviceIdentifier");
      *(_DWORD *)os_log_t v18 = 138543618;
      *(void *)&void v18[4] = v16;
      *(_WORD *)&v18[12] = 2114;
      *(void *)&v18[14] = v17;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to find sync store for error from message %{public}@ to device %{public}@ (#t0)", v18, 0x16u);
    }
  }
}

- (void)messageCenterDidReceiveTinkerPairingRequest:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingRequest___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingRequest___block_invoke(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)*v2 + 6);
  id v4 = [v2[1] fromParticipant];
  id v5 = [v4 device];
  uint64_t v6 = +[HDNanoSyncStore nanoSyncStoreWithProfile:WeakRetained device:v5 delegate:*v2 tinkerPaired:1];
  uint64_t v7 = (void *)*((void *)*v2 + 13);
  *((void *)*v2 + 13) = v6;

  uint64_t v8 = *((void *)*v2 + 13);
  _HKInitializeLogging();
  uint64_t v9 = *MEMORY[0x1E4F29FA8];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 104);
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Created _activeTinkerSyncStore for new pairing request %{public}@ (#t0)", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 104);
    id v14 = *(id *)(a1 + 40);
    id v15 = v13;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
    if (!v14)
    {
      id v53 = [MEMORY[0x1E4F28B00] currentHandler];
      [v53 handleFailureInMethod:sel__queue_receiveTinkerPairingRequest_syncStore_, v12, @"HDNanoSyncManager.m", 3699, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];
    }
    if (!v15)
    {
      id v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:sel__queue_receiveTinkerPairingRequest_syncStore_, v12, @"HDNanoSyncManager.m", 3700, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];
    }
    id v16 = [v14 pbRequest];
    _HKInitializeLogging();
    id v17 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v18 = v17;
      id v19 = [v16 requestIdentifier];
      id v20 = [v15 nanoRegistryUUID];
      id v21 = [v15 device];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      v87 = v21;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Received health sharing request from guardian %{public}@, active NR device ID %{public}@, active IDS device %{public}@ (#t0)", buf, 0x20u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke;
    aBlock[3] = &unk_1E62F75C8;
    id v22 = v14;
    id v82 = v22;
    id v23 = v16;
    id v83 = v23;
    uint64_t v84 = v12;
    id v24 = v15;
    id v85 = v24;
    id v25 = _Block_copy(aBlock);
    uint64_t v26 = [v23 guardianIcloudIdentifier];
    if (v26)
    {
      if ([v24 isAltAccount])
      {
        os_log_t v27 = objc_alloc_init(HDMutableDatabaseTransactionContext);
        id v28 = objc_loadWeakRetained((id *)(v12 + 48));
        id v29 = [v28 database];
        id v80 = 0;
        id v30 = [v29 takeAccessibilityAssertionWithOwnerIdentifier:@"Tinker Setup" timeout:&v80 error:600.0];
        id v57 = v80;

        id v56 = v27;
        if (v30)
        {
          [(HDMutableDatabaseTransactionContext *)v27 addAccessibilityAssertion:v30];
        }
        else
        {
          _HKInitializeLogging();
          id v39 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v12;
            *(_WORD *)&unsigned char buf[12] = 2114;
            *(void *)&buf[14] = v57;
            _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "%{public}@: Failed to take tinker setup accessibility assertion (#t0): %{public}@", buf, 0x16u);
          }
        }
        v78[0] = 0;
        v78[1] = v78;
        v78[2] = 0x3032000000;
        v78[3] = __Block_byref_object_copy__31;
        v78[4] = __Block_byref_object_dispose__31;
        id v79 = 0;
        v76[0] = 0;
        v76[1] = v76;
        v76[2] = 0x3032000000;
        v76[3] = __Block_byref_object_copy__31;
        v76[4] = __Block_byref_object_dispose__31;
        id v77 = 0;
        id v40 = objc_alloc(MEMORY[0x1E4F65CD8]);
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_841;
        v72[3] = &unk_1E62F75F0;
        id v74 = v25;
        uint64_t v75 = v76;
        id v55 = v30;
        id v73 = v55;
        uint64_t v41 = (void *)[v40 initWithDescription:@"Setup Tinker sharing." completion:v72];
        uint64_t v42 = *(void *)(v12 + 56);
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_843;
        v71[3] = &unk_1E62F7618;
        v71[4] = v12;
        [v41 addTaskOnQueue:v42 task:v71];
        uint64_t v43 = *(void *)(v12 + 56);
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2;
        v68[3] = &unk_1E62F7640;
        id v44 = v23;
        id v69 = v44;
        uint64_t v70 = v12;
        [v41 addTaskOnQueue:v43 task:v68];
        uint64_t v45 = *(void *)(v12 + 56);
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_846;
        v87 = &unk_1E62F7690;
        id v46 = v44;
        id v88 = v46;
        uint64_t v89 = v12;
        id v90 = v22;
        v91 = v76;
        v92 = v78;
        [v41 addTaskOnQueue:v45 task:buf];
        uint64_t v47 = *(void *)(v12 + 56);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_851;
        v63[3] = &unk_1E62F76E0;
        id v67 = v78;
        id v64 = v46;
        uint64_t v65 = v12;
        id v48 = v56;
        id v66 = v48;
        [v41 addTaskOnQueue:v47 task:v63];
        uint64_t v49 = *(void *)(v12 + 56);
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_854;
        v61[3] = &unk_1E62F7640;
        v61[4] = v12;
        id v38 = v48;
        id v62 = v38;
        [v41 addTaskOnQueue:v49 task:v61];
        uint64_t v50 = *(void *)(v12 + 56);
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_856;
        v60[3] = &unk_1E62F7618;
        v60[4] = v12;
        [v41 addTaskOnQueue:v50 task:v60];
        uint64_t v51 = *(void *)(v12 + 56);
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_858;
        v59[3] = &unk_1E62F7618;
        v59[4] = v12;
        [v41 addTaskOnQueue:v51 task:v59];
        uint64_t v52 = *(void *)(v12 + 56);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_860;
        v58[3] = &unk_1E62F7618;
        void v58[4] = v12;
        [v41 addTaskOnQueue:v52 task:v58];
        [v41 begin];

        _Block_object_dispose(v76, 8);
        _Block_object_dispose(v78, 8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Watch is not in Tinker pairing mode, ignoring request: %@", v22);
        id v38 = (HDMutableDatabaseTransactionContext *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void, HDMutableDatabaseTransactionContext *))v25 + 2))(v25, 0, v38);
      }
    }
    else
    {
      uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = objc_opt_class();
      id v37 = [v23 requestIdentifier];
      objc_msgSend(v35, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v36, sel__queue_receiveTinkerPairingRequest_syncStore_, @"Guardian icloud ID not found %@"", v37);
      id v38 = (HDMutableDatabaseTransactionContext *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(void *, void, HDMutableDatabaseTransactionContext *))v25 + 2))(v25, 0, v38);
    }
  }
  else if (v10)
  {
    uint64_t v31 = *(void **)(a1 + 40);
    id v32 = v9;
    id v33 = [v31 fromParticipant];
    id v34 = [v33 description];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v34;
    _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for request from device %{public}@ (#t0)", buf, 0xCu);
  }
}

- (void)messageCenterDidReceiveTinkerPairingResponse:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingResponse___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingResponse___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  if (v3) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  id v5 = [*(id *)(a1 + 40) fromParticipant];
  id v6 = [v5 device];
  uint64_t v7 = +[HDNanoSyncStore nanoSyncStoreWithProfile:WeakRetained device:v6 delegate:*(void *)(a1 + 32) tinkerPaired:1];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 104);
  *(void *)(v8 + 104) = v7;

  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  if (v3)
  {
LABEL_3:
    BOOL v10 = *(void **)(a1 + 40);
    id v11 = v3;
    uint64_t v12 = *(NSObject **)(v2 + 56);
    id v13 = v10;
    dispatch_assert_queue_V2(v12);
    if (!v13)
    {
      uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:sel__queue_receiveTinkerPairingResponse_syncStore_, v2, @"HDNanoSyncManager.m", 3923, @"Invalid parameter not satisfying: %@", @"response != nil" object file lineNumber description];
    }
    id v14 = [v13 requestPersistentUserInfo];
    id v15 = [v13 pbResponse];

    if ([v15 hasError])
    {
      id v16 = [v15 error];
      id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorWithCodableError:", v16);
    }
    else
    {
      id v17 = 0;
    }
    _HKInitializeLogging();
    os_log_t v18 = (os_log_t *)MEMORY[0x1E4F29FA8];
    id v19 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      id v21 = [v15 requestIdentifier];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Received health sharing response from tinker watch %@, error: %@ (#t0)", buf, 0x16u);
    }
    id v22 = [v14 objectForKeyedSubscript:@"tinker-pairing"];
    if (v22)
    {
      uint64_t v23 = [v11 pendingRequestContextForUUID:v22];
      id v24 = v23;
      if (v23)
      {
        id v25 = *(id *)(v23 + 16);
        uint64_t v26 = v25;
        if (v25)
        {
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = __67__HDNanoSyncManager__queue_receiveTinkerPairingResponse_syncStore___block_invoke;
          id v37 = &unk_1E62F61D0;
          id v40 = v25;
          id v38 = v15;
          id v39 = v17;
          HKDispatchAsyncOnGlobalConcurrentQueue();
        }
      }
      else
      {
        _HKInitializeLogging();
        id v28 = *v18;
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:

          goto LABEL_20;
        }
        uint64_t v26 = v28;
        id v29 = [v22 UUIDString];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no context for %@ (#t0)", buf, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v27 = *v18;
      if (!os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        return;
      }
      id v24 = v27;
      uint64_t v26 = [v15 requestIdentifier];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no request identifier for %@ (#t0)", buf, 0xCu);
    }

    goto LABEL_19;
  }
  _HKInitializeLogging();
  id v30 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = *(void **)(a1 + 40);
    id v32 = v30;
    id v33 = [v31 fromParticipant];
    id v34 = [v33 description];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v34;
    _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for response from device %{public}@ (#t0)", buf, 0xCu);
  }
}

- (void)messageCenterDidReceiveTinkerPairingError:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logOutgoingMessageError:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingError___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hd_isFromRequest"))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(v2 + 104);
      id v4 = *(id *)(a1 + 40);
      id v5 = v3;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v16 = 138543362;
        *(void *)&v16[4] = v4;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[sharing-setup] Error sending health sharing request %{public}@ (#t0)", v16, 0xCu);
      }
      uint64_t v7 = objc_msgSend(v4, "hd_persistentUserInfo");
      id v8 = [v7 objectForKeyedSubscript:@"tinker-pairing"];
      if (v8)
      {
        uint64_t v9 = [v5 pendingRequestContextForUUID:v8];
        BOOL v10 = v9;
        if (v9)
        {
          if (v9[2])
          {
            *(void *)id v16 = MEMORY[0x1E4F143A8];
            *(void *)&v16[8] = 3221225472;
            *(void *)&v16[16] = __81__HDNanoSyncManager__queue_tinkerPairingRequestDidFailToSendWithError_syncStore___block_invoke;
            id v17 = &unk_1E62F31C0;
            os_log_t v18 = v9;
            id v19 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();
          }
          [v5 removePendingRequestContextForUUID:v8];
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void **)(a1 + 40);
      id v13 = v11;
      id v14 = objc_msgSend(v12, "hd_messageIDSIdentifier");
      id v15 = objc_msgSend(*(id *)(a1 + 40), "hd_messageIDSDeviceIdentifier");
      *(_DWORD *)id v16 = 138543618;
      *(void *)&v16[4] = v14;
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v15;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to find sync store for error from message %{public}@ to device %{public}@ (#t0)", v16, 0x16u);
    }
  }
}

- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncRequest:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncRequest___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __75__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncRequest___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = [*(id *)(a1 + 40) fromParticipant];
  id v4 = [v3 device];
  uint64_t v5 = +[HDNanoSyncStore nanoSyncStoreWithProfile:WeakRetained device:v4 delegate:*(void *)(a1 + 32) tinkerPaired:1];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v5;

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 104);
  _HKInitializeLogging();
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F29FA8];
  BOOL v10 = *MEMORY[0x1E4F29FA8];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 104);
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Created _activeTinkerSyncStore for new end to end Cloud Sync request %{public}@ (#t0)", buf, 0xCu);
    }
    uint64_t v14 = *(void *)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    id v15 = *(void **)(v14 + 104);
    id v16 = v13;
    id v17 = v15;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v14 + 56));
    if (v16)
    {
      if (v17)
      {
LABEL_6:
        os_log_t v18 = [v16 pbRequest];
        _HKInitializeLogging();
        os_log_t v19 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = v19;
          id v21 = [v18 requestIdentifier];
          id v22 = [v17 nanoRegistryUUID];
          uint64_t v23 = [v17 device];
          *(_DWORD *)long long buf = 138544130;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&unsigned char buf[12] = 2114;
          *(void *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2114;
          id v44 = v22;
          LOWORD(v45) = 2114;
          *(void *)((char *)&v45 + 2) = v23;
          _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did receive Tinker end to end Cloud Sync request from guardian %{public}@, active NR device ID %{public}@, active IDS device %{public}@ (#t0)", buf, 0x2Au);
        }
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __76__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore___block_invoke;
        id v44 = &unk_1E62F75A0;
        *(void *)&long long v45 = v14;
        id v24 = v16;
        *((void *)&v45 + 1) = v24;
        id v25 = v18;
        id v46 = v25;
        id v26 = v17;
        id v47 = v26;
        os_log_t v27 = _Block_copy(buf);
        if ([v26 isAltAccount])
        {
          id v28 = v27;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v14 + 56));
          id v29 = [[HDCloudSyncContext alloc] initForPurpose:0 options:0 reason:20 xpcActivity:0];
          id v30 = objc_loadWeakRetained((id *)(v14 + 48));
          uint64_t v31 = [v30 cloudSyncManager];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __80__HDNanoSyncManager__queue_performSyncForTinkerEndToEndCloudSyncWithCompletion___block_invoke;
          void v41[3] = &unk_1E62F29A0;
          id v32 = v28;
          id v42 = v32;
          id v33 = (id)[v31 syncWithContext:v29 completion:v41];
        }
        else
        {
          id v38 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Watch is not in Tinker pairing mode, ignoring end to end Cloud Sync request: %@", v24);
          (*((void (**)(void *, void, void *))v27 + 2))(v27, 0, v38);
        }
        return;
      }
    }
    else
    {
      id v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:sel__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore_, v14, @"HDNanoSyncManager.m", 4020, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

      if (v17) {
        goto LABEL_6;
      }
    }
    id v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:sel__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore_, v14, @"HDNanoSyncManager.m", 4021, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];

    goto LABEL_6;
  }
  if (v11)
  {
    id v34 = *(void **)(a1 + 40);
    uint64_t v35 = v10;
    uint64_t v36 = [v34 fromParticipant];
    id v37 = [v36 description];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v37;
    _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for end to end Cloud Sync request from device %{public}@ (#t0)", buf, 0xCu);
  }
}

- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncResponse:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncResponse___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __76__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncResponse___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  if (v3) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  uint64_t v5 = [*(id *)(a1 + 40) fromParticipant];
  id v6 = [v5 device];
  uint64_t v7 = +[HDNanoSyncStore nanoSyncStoreWithProfile:WeakRetained device:v6 delegate:*(void *)(a1 + 32) tinkerPaired:1];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 104);
  *(void *)(v8 + 104) = v7;

  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  if (v3)
  {
LABEL_3:
    id v10 = *(id *)(a1 + 40);
    BOOL v11 = *(NSObject **)(v2 + 56);
    id v12 = v3;
    dispatch_assert_queue_V2(v11);
    if (!v10)
    {
      id v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:sel__queue_receiveTinkerEndToEndCloudSyncResponse_syncStore_, v2, @"HDNanoSyncManager.m", 4075, @"Invalid parameter not satisfying: %@", @"response != nil" object file lineNumber description];
    }
    id v13 = [v10 pbResponse];
    if ([v13 hasError])
    {
      uint64_t v14 = [v13 error];
      id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorWithCodableError:", v14);
    }
    else
    {
      id v15 = 0;
    }
    _HKInitializeLogging();
    id v16 = (os_log_t *)MEMORY[0x1E4F29FA8];
    id v17 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v18 = v17;
      os_log_t v19 = [v13 requestIdentifier];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v35 = v15;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did receive Tinker end to end Cloud Sync response from watch %@, error: %@ (#t0)", buf, 0x20u);
    }
    id v20 = objc_alloc(MEMORY[0x1E4F29128]);
    id v21 = [v13 requestIdentifier];
    id v22 = (void *)[v20 initWithUUIDString:v21];

    uint64_t v23 = [v12 pendingRequestContextForUUID:v22];

    if (v23)
    {
      id v24 = v23[2];
      id v25 = v24;
      if (v24)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __77__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncResponse_syncStore___block_invoke;
        uint64_t v35 = &unk_1E62F61D0;
        id v38 = v24;
        id v36 = v13;
        id v37 = v15;
        HKDispatchAsyncOnGlobalConcurrentQueue();
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v26 = *v16;
      if (!os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        return;
      }
      id v25 = v26;
      os_log_t v27 = [v22 UUIDString];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no context for %@ (#t0)", buf, 0xCu);
    }
    goto LABEL_16;
  }
  _HKInitializeLogging();
  id v28 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v29 = *(void **)(a1 + 40);
    id v30 = v28;
    uint64_t v31 = [v29 fromParticipant];
    id v32 = [v31 description];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v32;
    _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for end to end Cloud Sync response from device %{public}@ (#t0)", buf, 0xCu);
  }
}

- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncError:(id)a3
{
  id v4 = a3;
  -[HDNanoSyncManager _logOutgoingMessageError:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncError___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __73__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncError___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hd_isFromRequest"))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(v2 + 104);
      id v4 = *(id *)(a1 + 40);
      id v5 = v3;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)os_log_t v18 = 138543362;
        *(void *)&void v18[4] = v4;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[sharing-setup] Error sending Tinker end to end Cloud Sync request %{public}@ (#t0)", v18, 0xCu);
      }
      uint64_t v7 = objc_msgSend(v4, "hd_persistentUserInfo");
      id v8 = [v7 objectForKeyedSubscript:@"tinker-optin"];
      if (v8)
      {
        uint64_t v9 = [v5 pendingRequestContextForUUID:v8];
        id v10 = (void *)v9;
        if (v9)
        {
          id v11 = *(id *)(v9 + 16);
          id v12 = v11;
          if (v11)
          {
            *(void *)os_log_t v18 = MEMORY[0x1E4F143A8];
            *(void *)&v18[8] = 3221225472;
            *(void *)&v18[16] = __91__HDNanoSyncManager__queue_tinkerEndToEndCloudSyncRequestDidFailToSendWithError_syncStore___block_invoke;
            os_log_t v19 = &unk_1E62F3CA8;
            id v21 = v11;
            id v20 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();
          }
          [v5 removePendingRequestContextForUUID:v8];
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v13 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void **)(a1 + 40);
      id v15 = v13;
      id v16 = objc_msgSend(v14, "hd_messageIDSIdentifier");
      id v17 = objc_msgSend(*(id *)(a1 + 40), "hd_messageIDSDeviceIdentifier");
      *(_DWORD *)os_log_t v18 = 138543618;
      *(void *)&void v18[4] = v16;
      *(_WORD *)&v18[12] = 2114;
      *(void *)&v18[14] = v17;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to find sync store for end to end Cloud Sync error from message %{public}@ to device %{public}@ (#t0)", v18, 0x16u);
    }
  }
}

- (void)_queue_synchronizeWithOptions:(void *)a3 restoreMessagesSentHandler:(void *)a4 targetSyncStore:(void *)a5 reason:(void *)a6 accessibilityAssertion:(void *)a7 completion:
{
  v75[2] = *(id *)MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v13 = a4;
  id v56 = a5;
  id v55 = a6;
  id v14 = a7;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  -[HDNanoSyncManager _queue_updateSyncStores](a1);
  BOOL v16 = (a2 & 4) == 0 && *(unsigned char *)(a1 + 8) != 0;
  id v66 = 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if ([*(id *)(a1 + 160) permitSynchronization])
  {
    if (v13 || (id v13 = *(id *)(a1 + 96)) != 0)
    {
      id v17 = (os_log_t *)MEMORY[0x1E4F29FA8];
      os_signpost_id_t v18 = _HKLogSignpostIDGenerate();
      _HKInitializeLogging();
      os_log_t v19 = *v17;
      if (os_signpost_enabled(*v17))
      {
        id v20 = v19;
        id v21 = v20;
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          uint64_t v22 = _StringFromSyncOptions(a2);
          *(_DWORD *)long long buf = 138543618;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&unsigned char buf[12] = 2114;
          *(void *)&buf[14] = v22;
          _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v18, "nano-sync-with-options", "reason=%{public}@ options=%{public}@", buf, 0x16u);
        }
      }
      uint64_t v23 = [v13 restoreState];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke;
      aBlock[3] = &unk_1E62F7290;
      BOOL v65 = v16;
      id v61 = v54;
      void aBlock[4] = a1;
      id v58 = v55;
      id v62 = v14;
      os_signpost_id_t v63 = v18;
      id v13 = v13;
      id v59 = v13;
      uint64_t v64 = a2;
      id v60 = v56;
      id v14 = _Block_copy(aBlock);
      BOOL v24 = v23 == 3;
      if (v23 != 3 && *(unsigned char *)(a1 + 8))
      {
        if (v23 == 1)
        {
          _HKInitializeLogging();
          id v25 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v13;
            _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_INFO, "will attempt restore for paired device %{public}@", buf, 0xCu);
          }
          id v26 = v13;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
          if ([v26 restoreState] == 1)
          {
            if (!*(unsigned char *)(a1 + 8))
            {
              uint64_t v48 = [MEMORY[0x1E4F28B00] currentHandler];
              [v48 handleFailureInMethod:sel__queue_transitionToRestoreInProgressWithSyncStore_, a1, @"HDNanoSyncManager.m", 1757, @"Invalid parameter not satisfying: %@", @"_isMaster" object file lineNumber description];
            }
            os_log_t v27 = [v26 persistentUUID];
            BOOL v28 = v27 == 0;

            if (v28)
            {
              uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
              [v49 handleFailureInMethod:sel__queue_transitionToRestoreInProgressWithSyncStore_, a1, @"HDNanoSyncManager.m", 1758, @"Invalid parameter not satisfying: %@", @"[syncStore persistentUUID] != nil" object file lineNumber description];
            }
            id v29 = +[HKDaemonTransaction transactionWithOwner:a1 activityName:@"Restore"];
            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            uint64_t v68 = __71__HDNanoSyncManager__queue_transitionToRestoreInProgressWithSyncStore___block_invoke;
            id v69 = &unk_1E62F2978;
            id v70 = v29;
            id v51 = v29;
            id v30 = v26;
            uint64_t v31 = v30;
            id v53 = v67;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
            if ([v30 restoreState] == 1)
            {
              objc_initWeak(&location, (id)a1);
              id v32 = [MEMORY[0x1E4F29128] UUID];
              [(id)a1 restoreTimeout];
              double v34 = v33;
              *(void *)long long buf = MEMORY[0x1E4F143A8];
              *(void *)&uint8_t buf[8] = 3221225472;
              *(void *)&uint8_t buf[16] = __61__HDNanoSyncManager__queue_beginRestoreWithStore_completion___block_invoke;
              id v73 = &unk_1E62F7308;
              objc_copyWeak(v75, &location);
              id v35 = v30;
              id v74 = v35;
              uint64_t v50 = [v35 beginRestoreSessionWithUUID:v32 timeout:buf timeoutHandler:v34];

              id v36 = [v50 sessionUUID];
              id v37 = *(NSObject **)(a1 + 56);
              id v38 = v36;
              id v39 = v35;
              dispatch_assert_queue_V2(v37);
              uint64_t v52 = +[HDCodableNanoSyncActivationRestore activationRestoreWithRestoreUUID:v38 sequenceNumber:1 statusCode:2];

              id v40 = [v39 sourceBundleIdentifier];
              [v52 setDefaultSourceBundleIdentifier:v40];

              uint64_t v41 = [v39 obliteratedDatabaseUUIDs];
              [v52 encodeObliteratedHealthPairingUUIDs:v41];

              id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
              uint64_t v43 = +[HDIDSOutgoingRequest activationRequestWithRestore:v52 syncStore:v39 profile:WeakRetained];

              -[HDNanoSyncManager _queue_sendRequest:syncStore:](a1, v43, (uint64_t)v39);
              [v50 setSequenceNumber:1];
              ((void (*)(void *, uint64_t, void))v68)(v53, 1, 0);

              objc_destroyWeak(v75);
              objc_destroyWeak(&location);
            }
            else
            {
              id v46 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Unexpected restore state %ld", objc_msgSend(v30, "restoreState"));
              ((void (*)(void *, void, void *))v68)(v53, 0, v46);
            }
          }
        }
        id v47 = [v13 restoreSession];
        [v47 addCompletionHandler:v14];

        id v14 = 0;
      }

      id v44 = 0;
      long long v45 = v61;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"no active paired device");
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      long long v45 = 0;
      id v13 = 0;
      BOOL v24 = 0;
    }

    if (v14) {
      (*((void (**)(id, BOOL, id))v14 + 2))(v14, v24, v44);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &v66, 100, @"sync is restricted by PairedSync");
    id v44 = v66;
    if (v14) {
      (*((void (**)(id, void, id))v14 + 2))(v14, 0, v44);
    }
  }
}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_2;
  aBlock[3] = &unk_1E62F7218;
  id v6 = *(id *)(a1 + 64);
  char v30 = *(unsigned char *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v27 = v6;
  void aBlock[4] = v7;
  id v26 = v8;
  id v9 = *(id *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  id v28 = v9;
  uint64_t v29 = v10;
  id v11 = _Block_copy(aBlock);
  id v12 = v11;
  if (a2)
  {
    id v13 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_487;
    v18[3] = &unk_1E62F7268;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 88);
    id v19 = v14;
    uint64_t v24 = v15;
    id v16 = *(id *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 32);
    id v20 = v16;
    uint64_t v21 = v17;
    id v23 = v12;
    id v22 = *(id *)(a1 + 40);
    dispatch_async(v13, v18);
  }
  else
  {
    (*((void (**)(void *, void, id))v11 + 2))(v11, 0, v5);
  }
}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
  if (a2 && *(unsigned char *)(a1 + 72))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_3;
    block[3] = &unk_1E62F4E40;
    void block[4] = v7;
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 56);
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      if (!v5 && (a2 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Sync failed without reporting an error.");
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = *(void *)(a1 + 56);
      }
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
    }
  }
  _HKInitializeLogging();
  uint64_t v10 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29FA8]))
  {
    id v11 = v10;
    id v12 = v11;
    os_signpost_id_t v13 = *(void *)(a1 + 64);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      id v14 = "NO";
      if (a2) {
        id v14 = "YES";
      }
      *(_DWORD *)long long buf = 136315138;
      id v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v12, OS_SIGNPOST_INTERVAL_END, v13, "nano-sync-with-options", "success=%s", buf, 0xCu);
    }
  }
}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (!v1) {
    goto LABEL_18;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 56));
  if (!*(unsigned char *)(v1 + 8))
  {
    if (!v4) {
      goto LABEL_18;
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"proactive sync is unavailable on this device");
LABEL_17:
    id v16 = (void *)v15;
    v4[2](v4, 0, v15);

    goto LABEL_18;
  }
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 48));
    uint64_t v6 = [WeakRetained database];
    char v7 = [v6 isProtectedDataAvailable];

    if ((v7 & 1) == 0)
    {
      if (!v4) {
        goto LABEL_18;
      }
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
      goto LABEL_17;
    }
  }
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = -[HDNanoSyncManager _queue_eligibleInactiveSyncStores](v1);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "device", (void)v17);
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  -[HDNanoSyncManager _queue_performNextProactiveSyncWithRemainingDevices:accessibilityAssertion:completion:](v1, v8, v3, v4);
LABEL_18:
}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_487(uint64_t a1)
{
  uint64_t v2 = [[HDNanoSyncSession alloc] initWithSyncStore:*(void *)(a1 + 32) options:*(void *)(a1 + 72) reason:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__31;
  uint64_t v24 = __Block_byref_object_dispose__31;
  id v25 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 48));
  id v4 = [WeakRetained syncEngine];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 48));
  char v7 = (id *)(v21 + 5);
  obuint64_t j = (id)v21[5];
  [v4 resetNextAnchorsForStore:v5 profile:v6 minimumElapsedTime:&obj error:86400.0];
  objc_storeStrong(v7, obj);

  id v8 = [(HDSyncSession *)v2 syncStore];
  uint64_t v9 = NSString;
  uint64_t v10 = [v8 syncStoreIdentifier];
  uint64_t v11 = [v9 stringWithFormat:@"%@.nano-sync.%@", *MEMORY[0x1E4F2BE48], v10];

  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 48));
  uint64_t v13 = [v12 daemon];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_495;
  v15[3] = &unk_1E62F7240;
  v15[4] = *(void *)(a1 + 48);
  id v14 = v2;
  id v16 = v14;
  id v17 = *(id *)(a1 + 56);
  long long v18 = &v20;
  [v13 performBlockWithPowerAssertionIdentifier:v11 transactionName:@"NanoSyncSession" powerAssertionInterval:v15 block:30.0];

  _Block_object_dispose(&v20, 8);
}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_495(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  id v3 = [WeakRetained syncEngine];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  [v3 performSyncSession:v4 accessibilityAssertion:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
}

- (void)_queue_transitionToRestoreIncompleteWithSyncStore:(void *)a3 error:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (v6)
    {
      if (!v5) {
        goto LABEL_8;
      }
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__queue_transitionToRestoreIncompleteWithSyncStore_error_, a1, @"HDNanoSyncManager.m", 1727, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];

      if (!v5) {
        goto LABEL_8;
      }
    }
    if ([v5 restoreState] != 1)
    {
      _HKInitializeLogging();
      char v7 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543618;
        id v10 = v5;
        __int16 v11 = 2114;
        id v12 = v6;
        _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "resetting restore state to incomplete for paired device %{public}@, error: %{public}@", buf, 0x16u);
      }
      [v5 finishRestoreSessionWithError:v6];
    }
  }
LABEL_8:
}

- (void)_queue_transitionToRestoreCompleteWithSyncStore:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (v3)
    {
      _HKInitializeLogging();
      uint64_t v4 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
      {
        LODWORD(v8) = 138543362;
        *(void *)((char *)&v8 + 4) = v3;
        _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "finished restore for paired device %{public}@", (uint8_t *)&v8, 0xCu);
      }
      id v5 = v3;
      id v6 = *(NSObject **)(a1 + 64);
      *(void *)&long long v8 = MEMORY[0x1E4F143A8];
      *((void *)&v8 + 1) = 3221225472;
      uint64_t v9 = __47__HDNanoSyncManager__resetSyncAnchorsForStore___block_invoke;
      id v10 = &unk_1E62F31C0;
      uint64_t v11 = a1;
      id v7 = v5;
      id v12 = v7;
      dispatch_async(v6, &v8);

      [v7 finishRestoreSessionWithError:0];
    }
  }
}

uint64_t __71__HDNanoSyncManager__queue_transitionToRestoreInProgressWithSyncStore___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __51__HDNanoSyncManager__restoreTimedOutWithSyncStore___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) restoreState] == 2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Restore timed out");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    -[HDNanoSyncManager _queue_transitionToRestoreIncompleteWithSyncStore:error:](*(void *)(a1 + 40), *(void **)(a1 + 32), v2);
  }
}

- (void)_deviceDidPair:(id)a3
{
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "did pair notification", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HDNanoSyncManager__deviceDidPair___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __36__HDNanoSyncManager__deviceDidPair___block_invoke(uint64_t a1)
{
}

- (void)_deviceDidUnpair:(id)a3
{
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "did unpair notification", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HDNanoSyncManager__deviceDidUnpair___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __38__HDNanoSyncManager__deviceDidUnpair___block_invoke(uint64_t a1)
{
}

- (void)_deviceDidBecomeActive:(id)a3
{
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "did become active notification", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HDNanoSyncManager__deviceDidBecomeActive___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __44__HDNanoSyncManager__deviceDidBecomeActive___block_invoke(uint64_t a1)
{
  -[HDNanoSyncManager _queue_generateWatchActivationSamples](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  -[HDNanoSyncManager _notifyObserversPairedDevicesChanged:](v2, 0);
}

void __58__HDNanoSyncManager__queue_generateWatchActivationSamples__block_invoke(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7 && v8 && *(_DWORD *)(a1 + 56) < a2)
  {
    id v10 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:*(void *)(a1 + 32) value:1 startDate:v7 endDate:v7];
    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
      if (!v11)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
        [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v9];
      }
      [v11 addObject:v10];
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  else
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109634;
      v13[1] = a2;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "got index %u pairingID %@ and date %@ from getSwitchEventsFromIndex", (uint8_t *)v13, 0x1Cu);
    }
  }
}

void __58__HDNanoSyncManager__queue_generateWatchActivationSamples__block_invoke_533(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v26 = 0;
  id v8 = +[HDNanoPairingEntity sourceEntityForRegistryUUID:v5 profile:WeakRetained error:&v26];
  id v9 = v26;

  if (v8)
  {
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    uint64_t v11 = [v10 dataManager];
    id v25 = v9;
    int v12 = [v11 insertDataObjects:v6 sourceEntity:v8 deviceEntity:0 sourceVersion:0 creationDate:&v25 error:2.22507386e-308];
    id v13 = v25;

    _HKInitializeLogging();
    __int16 v14 = *MEMORY[0x1E4F29FA8];
    uint64_t v15 = *MEMORY[0x1E4F29FA8];
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        __int16 v16 = v14;
        uint64_t v17 = [v6 count];
        uint64_t v18 = [v5 UUIDString];
        *(_DWORD *)long long buf = 134218242;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_debug_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEBUG, "inserted %lu activation samples for pairing ID %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v28 = (uint64_t)v13;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "failed to insert watch activation samples: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    _HKInitializeLogging();
    long long v19 = (void *)*MEMORY[0x1E4F29FA8];
    uint64_t v20 = *MEMORY[0x1E4F29FA8];
    if (v9)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v23 = v19;
        uint64_t v24 = [v5 UUIDString];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v28 = (uint64_t)v24;
        __int16 v29 = 2114;
        id v30 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "failed to get source for watch activation with pairing ID %{public}@: %{public}@", buf, 0x16u);
      }
      id v13 = v9;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = v19;
        uint64_t v22 = [v5 UUIDString];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v28 = (uint64_t)v22;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "no source exists for watch activation with pairing ID %{public}@", buf, 0xCu);
      }
      id v13 = 0;
    }
  }
}

uint64_t __87__HDNanoSyncManager__queue_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __87__HDNanoSyncManager__queue_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0 && objc_msgSend(v5, "hk_isDatabaseAccessibilityError"))
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      id v10 = objc_msgSend(v8, "hd_shortDescription");
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "PairedSync for device %{public}@ postponed until unlock", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 40) setNeedsSyncOnUnlock:1];

    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __61__HDNanoSyncManager__queue_beginRestoreWithStore_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    id v3 = WeakRetained[7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HDNanoSyncManager__restoreTimedOutWithSyncStore___block_invoke;
    block[3] = &unk_1E62F31C0;
    id v6 = v2;
    id v7 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __73__HDNanoSyncManager__syncQueue_prepareForCompanionChangeWithStore_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(*(id *)(a1 + 32), "resetProvenanceWithError:")) {
    return 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [*(id *)(a1 + 32) orderedSyncEntities];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    long long v19 = a3;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
          id v20 = 0;
          char v12 = [v10 companionDidChangeForProfile:WeakRetained error:&v20];
          id v13 = v20;

          if ((v12 & 1) == 0)
          {
            _HKInitializeLogging();
            uint64_t v15 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543618;
              id v26 = v10;
              __int16 v27 = 2114;
              id v28 = v13;
              _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: failed to apply companion change: %{public}@", buf, 0x16u);
            }
            id v16 = v13;
            uint64_t v17 = v16;
            if (v16)
            {
              if (v19) {
                void *v19 = v16;
              }
              else {
                _HKLogDroppedError();
              }
            }

            uint64_t v14 = 0;
            goto LABEL_21;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_21:

  return v14;
}

uint64_t __73__HDNanoSyncManager__syncQueue_prepareForCompanionChangeWithStore_error___block_invoke_577(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0;
}

void __59__HDNanoSyncManager__queue_handleRestoreRequest_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) decodedPersistentPairingUUID];
  [v2 setPersistentUUID:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) decodedHealthPairingUUID];
  [v4 setHealthUUID:v5];

  switch(*(void *)(a1 + 96))
  {
    case 1:
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = *(void **)(a1 + 56);
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v14 = *(void **)(v11 + 40);
      char v12 = (id *)(v11 + 40);
      id v13 = v14;
      id v15 = *(id *)(a1 + 64);
      if (v8)
      {
        uint64_t v6 = *(void *)(v8 + 64);
        id v16 = v10;
        id v17 = v9;
        dispatch_assert_queue_V2((dispatch_queue_t)v6);
        uint64_t v18 = [v16 persistentUUID];

        long long v19 = [v17 defaultSourceBundleIdentifier];

        LOBYTE(v6) = 1;
        if (v18 && v19)
        {
          uint64_t v52 = v15;
          id v20 = (id *)(v8 + 48);
          id WeakRetained = objc_loadWeakRetained((id *)(v8 + 48));
          long long v22 = [WeakRetained sourceManager];
          id v66 = 0;
          LODWORD(v6) = [v22 setLocalDeviceSourceUUID:v18 bundleIdentifier:v19 error:&v66];
          id v23 = v66;

          if (v6)
          {
            id v51 = v23;
            id v24 = objc_loadWeakRetained(v20);
            id v25 = [v24 daemon];
            id v26 = [v25 behavior];
            int v27 = [v26 isAppleInternalInstall];

            if (v27)
            {
              _HKInitializeLogging();
              id v28 = (void *)*MEMORY[0x1E4F29FA8];
              id v15 = v52;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
              {
                __int16 v29 = v28;
                uint64_t v30 = [v52 idsIdentifier];
                *(_DWORD *)long long buf = 138543618;
                *(void *)&uint8_t buf[4] = v19;
                *(_WORD *)&unsigned char buf[12] = 2114;
                *(void *)&buf[14] = v30;
                _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_INFO, "set local device source bundle identifier to \"%{public}@\" with message %{public}@", buf, 0x16u);
              }
            }
            else
            {
              id v15 = v52;
            }
            id v23 = v51;
          }
          else
          {
            _HKInitializeLogging();
            uint64_t v41 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543362;
              *(void *)&uint8_t buf[4] = v23;
              _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "failed to set local device source bundle identifier: %{public}@", buf, 0xCu);
            }
            id v42 = v23;
            uint64_t v43 = v42;
            id v15 = v52;
            if (v42) {
              id v13 = v42;
            }
          }
        }
      }
      else
      {
        LOBYTE(v6) = 0;
      }

      id v40 = v12;
      id v39 = v13;
      goto LABEL_24;
    case 2:
    case 4:
      LOBYTE(v6) = 0;
      char v7 = 1;
      break;
    case 3:
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v31 = *(void **)(a1 + 32);
      uint64_t v32 = *(void *)(*(void *)(a1 + 88) + 8);
      double v34 = *(void **)(v32 + 40);
      double v33 = (id *)(v32 + 40);
      BOOL v65 = v34;
      id v35 = v31;
      if (v6)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 64));
        id v36 = objc_loadWeakRetained((id *)(v6 + 48));
        id v37 = [v36 database];
        id v38 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __73__HDNanoSyncManager__syncQueue_prepareForCompanionChangeWithStore_error___block_invoke;
        uint64_t v68 = &unk_1E62F2AE0;
        id v69 = v35;
        uint64_t v70 = v6;
        LOBYTE(v6) = [v37 performTransactionWithContext:v38 error:&v65 block:buf inaccessibilityHandler:&__block_literal_global_580];
      }
      id v39 = v65;
      id v40 = v33;
LABEL_24:
      objc_storeStrong(v40, v39);
      char v7 = v6 ^ 1;
      break;
    default:
      char v7 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  id v44 = *(NSObject **)(*(void *)(a1 + 48) + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HDNanoSyncManager__queue_handleRestoreRequest_syncStore___block_invoke_2;
  block[3] = &unk_1E62F7350;
  id v45 = *(id *)(a1 + 56);
  char v63 = v6;
  uint64_t v46 = *(void *)(a1 + 48);
  id v54 = v45;
  uint64_t v55 = v46;
  id v56 = *(id *)(a1 + 32);
  char v64 = v7;
  id v47 = *(id *)(a1 + 64);
  uint64_t v48 = *(void *)(a1 + 88);
  id v57 = v47;
  uint64_t v60 = v48;
  id v58 = *(id *)(a1 + 72);
  int8x16_t v61 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
  id v49 = *(id *)(a1 + 80);
  uint64_t v50 = *(void *)(a1 + 112);
  id v59 = v49;
  uint64_t v62 = v50;
  dispatch_async(v44, block);
}

void __59__HDNanoSyncManager__queue_handleRestoreRequest_syncStore___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) statusCode];
  uint64_t v3 = [*(id *)(a1 + 32) statusCode];
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F29FA8];
  if (*(unsigned char *)(a1 + 112))
  {
    if (v2 == 2) {
      -[HDNanoSyncManager _queue_transitionToRestoreCompleteWithSyncStore:](*(void *)(a1 + 40), *(void **)(a1 + 48));
    }
  }
  else
  {
    int v5 = *(unsigned __int8 *)(a1 + 113);
    _HKInitializeLogging();
    os_log_t v6 = *v4;
    char v7 = *v4;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = *(void **)(a1 + 48);
        uint64_t v30 = v6;
        uint64_t v31 = [v29 restoreSession];
        uint64_t v32 = [v31 sessionUUID];
        double v33 = [v32 UUIDString];
        double v34 = [*(id *)(a1 + 56) idsIdentifier];
        uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        int v36 = 138543874;
        *(void *)id v37 = v33;
        *(_WORD *)&v37[8] = 2114;
        *(void *)&v37[10] = v34;
        __int16 v38 = 2114;
        uint64_t v39 = v35;
        _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "aborting restore %{public}@ after message %{public}@: %{public}@", (uint8_t *)&v36, 0x20u);
      }
      uint64_t v3 = 3;
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(a1 + 56);
      id v9 = v6;
      id v10 = [v8 idsIdentifier];
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      int v36 = 138543618;
      *(void *)id v37 = v10;
      *(_WORD *)&v37[8] = 2114;
      *(void *)&v37[10] = v11;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "unhandled restore message %{public}@: %{public}@", (uint8_t *)&v36, 0x16u);
    }
  }
  char v12 = [*(id *)(a1 + 56) response];
  id v13 = +[HDCodableNanoSyncActivationRestore activationRestoreWithRestoreUUID:*(void *)(a1 + 64) sequenceNumber:*(void *)(a1 + 88) statusCode:v3];
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  if (v14) {
    id WeakRetained = objc_loadWeakRetained((id *)(v14 + 48));
  }
  else {
    id WeakRetained = 0;
  }
  [v12 configureWithActivationRestore:v13 syncStore:v15 profile:WeakRetained];

  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(void *)(a1 + 40), v12, *(void **)(a1 + 48));
  if (*(void *)(a1 + 96) == 4)
  {
    _HKInitializeLogging();
    os_log_t v17 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void **)(a1 + 56);
      long long v19 = v17;
      id v20 = [v18 idsIdentifier];
      int v36 = 138543362;
      *(void *)id v37 = v20;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "obliterating in response to restore message %{public}@", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      id v22 = objc_loadWeakRetained((id *)(v21 + 48));
    }
    else {
      id v22 = 0;
    }
    [v22 obliterateAndTerminateWithOptions:1 reason:@"Requested by NanoSync remote" completion:0];
  }
  [*(id *)(a1 + 72) invalidate];
  _HKInitializeLogging();
  os_log_t v23 = *v4;
  if (os_signpost_enabled(*v4))
  {
    id v24 = v23;
    id v25 = v24;
    os_signpost_id_t v26 = *(void *)(a1 + 104);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      int v27 = *(unsigned __int8 *)(a1 + 112);
      uint64_t v28 = *(void *)(a1 + 96);
      int v36 = 67109376;
      *(_DWORD *)id v37 = v27;
      *(_WORD *)&v37[4] = 2048;
      *(void *)&v37[6] = v28;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v25, OS_SIGNPOST_INTERVAL_END, v26, "nano-sync-restore-request", "didApply=%d action=%ld", (uint8_t *)&v36, 0x12u);
    }
  }
}

void __60__HDNanoSyncManager__queue_handleRestoreResponse_syncStore___block_invoke(uint64_t a1, os_log_type_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_log_t v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], a2))
  {
    char v7 = *(void **)(a1 + 32);
    uint64_t v8 = v6;
    id v9 = [v7 idsIdentifier];
    int v10 = *(_DWORD *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138413058;
    id v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1BCB7D000, v8, a2, "%@ with response %{public}@ statusCode:%d seq:%lld", (uint8_t *)&v12, 0x26u);
  }
}

- (void)persistChildIdentityFromCodable:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 hasCurrentSyncIdentity])
  {
    uint64_t v4 = [v3 currentSyncIdentity];
    id v18 = 0;
    id v5 = +[HDSyncIdentity syncIdentityWithCodable:v4 error:&v18];
    id v6 = v18;

    if (v5) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v6 == 0;
    }
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      id v9 = [WeakRetained database];
      id v17 = v6;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __53__HDNanoSyncManager_persistChildIdentityFromCodable___block_invoke;
      v15[3] = &unk_1E62F2AE0;
      v15[4] = a1;
      id v16 = v5;
      BOOL v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:&v17 block:v15];
      id v11 = v17;

      if (!v10)
      {
        _HKInitializeLogging();
        int v12 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v20 = v11;
          _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Could not persist child sync identity from HDCodableNanoSyncMessage, %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      id v13 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v20 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Could not extract sync identity from HDCodableNanoSyncMessage, %@", buf, 0xCu);
      }
      id v11 = v6;
    }
  }
}

uint64_t __53__HDNanoSyncManager_persistChildIdentityFromCodable___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 48));
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v8 = [WeakRetained syncIdentityManager];
  id v9 = [v8 concreteIdentityForIdentity:*(void *)(a1 + 40) shouldCreate:1 transaction:v5 error:a3];

  if ([v9 isChild])
  {
    uint64_t v10 = v9 != 0;
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    int v12 = [v11 daemon];
    id v13 = [v12 analyticsSubmissionCoordinator];
    objc_msgSend(v13, "cloudSync_newChildAdded:", 1);

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      id v15 = objc_loadWeakRetained((id *)(v14 + 48));
    }
    else {
      id v15 = 0;
    }
    id v16 = [v15 syncIdentityManager];
    uint64_t v10 = [v16 updateIsChild:1 concreteIdentity:v9 error:a3];
  }
  return v10;
}

void __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v32 = [WeakRetained syncEngine];

  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  char v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  char v57 = 0;
  if (*(void *)(a1 + 104) == 1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    [(HDMutableDatabaseTransactionContext *)v4 setCacheScope:1];
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    uint64_t v6 = [v5 database];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_2;
    v43[3] = &unk_1E62F73F0;
    id v44 = *(id *)(a1 + 40);
    id v45 = v32;
    id v46 = *(id *)(a1 + 48);
    id v7 = v3;
    id v47 = v7;
    id v8 = *(id *)(a1 + 56);
    uint64_t v52 = *(void *)(a1 + 96);
    uint64_t v9 = *(void *)(a1 + 32);
    id v48 = v8;
    uint64_t v49 = v9;
    id v50 = *(id *)(a1 + 64);
    id v10 = *(id *)(a1 + 72);
    int v55 = *(_DWORD *)(a1 + 112);
    id v51 = v10;
    id v53 = v58;
    id v54 = v56;
    [v6 performWithTransactionContext:v4 error:0 block:v43];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  int v12 = *(void **)(a1 + 48);
  uint64_t v13 = *(unsigned int *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  id v14 = *(id *)(a1 + 56);
  id v15 = v12;
  if (v11
    && (dispatch_assert_queue_V2(*(dispatch_queue_t *)(v11 + 64)), [v14 expectsResponse]))
  {
    id v16 = +[HDCodableNanoSyncStatus statusWithStatusCode:v13];
    id v17 = (id *)(v11 + 48);
    id v18 = objc_loadWeakRetained((id *)(v11 + 48));
    uint64_t v19 = [v18 syncEngine];
    id v60 = 0;
    char v20 = [v19 getReceivedAnchorMap:v16 forStore:v15 error:&v60];
    id v31 = v60;

    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v21 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v62 = v31;
        _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "failed to get received anchors: %{public}@", buf, 0xCu);
      }
      objc_msgSend(v16, "clearAnchors", v31);
      [v16 setStatusCode:0];
    }
    id v22 = objc_loadWeakRetained(v17);
    os_log_t v23 = [v22 daemon];
    id v24 = [v23 analyticsSubmissionCoordinator];
    uint64_t v25 = [v16 statusCode];
    id v26 = objc_loadWeakRetained(v17);
    objc_msgSend(v24, "nanoSync_reportResponseStatusCode:profileType:", v25, objc_msgSend(v26, "profileType"));

    int v27 = [v14 response];
    id v28 = objc_loadWeakRetained(v17);
    [v27 configureWithStatus:v16 syncStore:v15 profile:v28];
  }
  else
  {
    int v27 = 0;
  }

  __int16 v29 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_652;
  block[3] = &unk_1E62F7418;
  id v34 = *(id *)(a1 + 56);
  id v35 = *(id *)(a1 + 48);
  id v36 = *(id *)(a1 + 40);
  id v37 = v27;
  uint64_t v38 = *(void *)(a1 + 32);
  uint64_t v41 = v58;
  id v42 = v56;
  id v39 = *(id *)(a1 + 80);
  id v40 = *(id *)(a1 + 88);
  id v30 = v27;
  dispatch_async(v29, block);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);
}

uint64_t __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  int v2 = [*(id *)(a1 + 32) changes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v53 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        v45[1] = (id)MEMORY[0x1E4F143A8];
        v45[2] = (id)3221225472;
        v45[3] = __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_3;
        v45[4] = &unk_1E62F73C8;
        id v46 = *(id *)(a1 + 40);
        uint64_t v47 = v7;
        id v48 = *(id *)(a1 + 48);
        id v49 = *(id *)(a1 + 56);
        id v8 = *(id *)(a1 + 64);
        uint64_t v9 = *(void *)(a1 + 96);
        id v50 = v8;
        uint64_t v51 = v9;
        HKWithAutoreleasePool();
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v4);
  }

  if ([*(id *)(a1 + 56) count])
  {
    uint64_t v11 = *(void *)(a1 + 72);
    id v10 = *(void **)(a1 + 80);
    int v12 = *(void **)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v14 = v10;
    id v15 = v12;
    if (!v11)
    {
LABEL_29:

      goto LABEL_30;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v11 + 64));
    if (v13)
    {
      if (v15)
      {
LABEL_12:
        if (*(unsigned char *)(v11 + 8) && [v13 count] && objc_msgSend(v14, "count"))
        {
          uint64_t v43 = v11;
          uint64_t v41 = v14;
          id v44 = [MEMORY[0x1E4F1CA48] array];
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v42 = v13;
          id v16 = v13;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:buf count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v61;
            char v20 = (id *)(v11 + 48);
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v61 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v22 = *(void **)(*((void *)&v60 + 1) + 8 * j);
                id WeakRetained = objc_loadWeakRetained(v20);
                uint64_t v24 = [v22 syncEntityClassForProfile:WeakRetained];

                if ([v15 supportsSpeculativeChangesForSyncEntityClass:v24])
                {
                  uint64_t v25 = [v22 speculativeCopy];
                  if (v25) {
                    [v44 addObject:v25];
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v60 objects:buf count:16];
            }
            while (v18);
          }

          id v14 = v41;
          if ([v44 count])
          {
            id v26 = *(NSObject **)(v43 + 56);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __119__HDNanoSyncManager__syncQueue_forwardSpeculativeChangeSetIfNecessaryForChanges_destinationSyncStores_originSyncStore___block_invoke;
            block[3] = &unk_1E62F30F8;
            id v57 = v41;
            id v58 = v44;
            uint64_t v59 = v43;
            dispatch_async(v26, block);
          }
          id v13 = v42;
        }
        goto LABEL_29;
      }
    }
    else
    {
      id v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:sel__syncQueue_forwardSpeculativeChangeSetIfNecessaryForChanges_destinationSyncStores_originSyncStore_, v11, @"HDNanoSyncManager.m", 2966, @"Invalid parameter not satisfying: %@", @"changes != nil" object file lineNumber description];

      if (v15) {
        goto LABEL_12;
      }
    }
    id v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:sel__syncQueue_forwardSpeculativeChangeSetIfNecessaryForChanges_destinationSyncStores_originSyncStore_, v11, @"HDNanoSyncManager.m", 2967, @"Invalid parameter not satisfying: %@", @"originSyncStore != nil" object file lineNumber description];

    goto LABEL_12;
  }
LABEL_30:
  uint64_t v27 = *(void *)(a1 + 88);
  if (v27)
  {
    id v28 = *(void **)(a1 + 40);
    uint64_t v29 = *(void *)(a1 + 48);
    v45[0] = 0;
    char v30 = [v28 applyAcknowledgedAnchorMap:v27 forStore:v29 resetNext:1 resetInvalid:1 error:v45];
    id v31 = v45[0];
    if ((v30 & 1) == 0)
    {
      _HKInitializeLogging();
      id v34 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        id v35 = *(void **)(a1 + 64);
        id v36 = v34;
        id v37 = [v35 idsIdentifier];
        *(_DWORD *)long long buf = 138543618;
        id v66 = v37;
        __int16 v67 = 2114;
        id v68 = v31;
        _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "failed to apply acknowledged anchors for request %{public}@: %{public}@", buf, 0x16u);
      }
      goto LABEL_39;
    }
    int v32 = *(_DWORD *)(a1 + 120);
    if (v32 == 5)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
      uint64_t v33 = *(void *)(*(void *)(a1 + 112) + 8);
    }
    else
    {
      if (v32 != 4)
      {
LABEL_39:

        return 1;
      }
      uint64_t v33 = *(void *)(*(void *)(a1 + 104) + 8);
    }
    *(unsigned char *)(v33 + 24) = 1;
    goto LABEL_39;
  }
  return 1;
}

uint64_t __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v13 = 0;
  int v5 = [v2 applySyncChange:v3 forStore:v4 error:&v13];
  id v6 = v13;
  if (v5)
  {
    [*(id *)(a1 + 56) addObject:*(void *)(a1 + 40)];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void **)(a1 + 64);
      id v10 = v7;
      uint64_t v11 = [v9 idsIdentifier];
      int v12 = [*(id *)(a1 + 40) nanoSyncDescription];
      *(_DWORD *)long long buf = 138543874;
      id v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "failed to apply request %{public}@ change %{public}@: %{public}@", buf, 0x20u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 2;
  }

  return 1;
}

uint64_t __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_652(uint64_t a1)
{
  if ([*(id *)(a1 + 32) messageID] == 2) {
    [*(id *)(a1 + 40) didReceiveRequestWithChangeSet:*(void *)(a1 + 48)];
  }
  int v2 = *(void **)(a1 + 56);
  if (v2) {
    -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(void *)(a1 + 64), v2, *(void **)(a1 + 40));
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
      uint64_t v3 = 10;
    }
    else {
      uint64_t v3 = 8;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
      uint64_t v4 = @"Remote requested last chance sync";
    }
    else {
      uint64_t v4 = @"Remote requested sync";
    }
    -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:](*(void *)(a1 + 64), v4, v3, 0, 0);
  }
  [*(id *)(a1 + 72) invalidate];
  int v5 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);

  return v5();
}

void __74__HDNanoSyncManager__queue_changeRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  int v2 = [WeakRetained syncEngine];
  uint64_t v3 = [*(id *)(a1 + 40) changeSet];
  uint64_t v4 = [v3 changes];
  [v2 resetAnchorsWithFailedChanges:v4 store:*(void *)(a1 + 48)];
}

void __75__HDNanoSyncManager__queue_changeResponseDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  int v2 = [WeakRetained syncEngine];
  uint64_t v3 = [*(id *)(a1 + 40) changeSet];
  uint64_t v4 = [v3 changes];
  [v2 resetAnchorsWithFailedChanges:v4 store:*(void *)(a1 + 48)];
}

void __96__HDNanoSyncManager__queue_syncImmediatelyWithReason_options_accessibilityAssertion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v8 = [WeakRetained daemon];
  uint64_t v9 = [v8 analyticsSubmissionCoordinator];
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v13 = [v12 profileType];
  if (a2) {
    objc_msgSend(v9, "nanoSync_reportSyncSuccessWithReason:options:duration:profileType:", v11, v10, v13, v6);
  }
  else {
    objc_msgSend(v9, "nanoSync_reportSyncFailureWithReason:options:duration:profileType:error:", v11, v10, v13, v5, v6);
  }

  _HKInitializeLogging();
  id v14 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 64);
    __int16 v18 = v14;
    id v19 = _StringFromSyncOptions(v17);
    int v20 = 138413314;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    double v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v19;
    __int16 v26 = 1024;
    int v27 = a2;
    __int16 v28 = 2114;
    id v29 = v5;
    _os_log_debug_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEBUG, "Finished sync (%@) in %lfs options='%@' success=%d error=%{public}@", (uint8_t *)&v20, 0x30u);
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a2, v5);
  }
}

- (void)_queue_performNextProactiveSyncWithRemainingDevices:(void *)a3 accessibilityAssertion:(void *)a4 completion:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if ([v7 count])
    {
      _HKInitializeLogging();
      uint64_t v10 = (os_log_t *)MEMORY[0x1E4F29FA8];
      uint64_t v11 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
      {
        id v12 = v11;
        *(_DWORD *)long long buf = 134217984;
        uint64_t v27 = [v7 count];
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "performing proactive sync with %lu remaining device(s)", buf, 0xCu);
      }
      uint64_t v13 = [v7 firstObject];
      [v7 removeObjectAtIndex:0];
      id v14 = *(void **)(a1 + 120);
      uint64_t v15 = objc_msgSend(v13, "hd_deviceIdentifier");
      uint64_t v16 = [v14 objectForKeyedSubscript:v15];

      if (v16 && ([v16 isActive] & 1) == 0 && objc_msgSend(v16, "isRestoreComplete"))
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __107__HDNanoSyncManager__queue_performNextProactiveSyncWithRemainingDevices_accessibilityAssertion_completion___block_invoke;
        v20[3] = &unk_1E62F74B8;
        id v21 = v16;
        uint64_t v22 = a1;
        id v23 = v7;
        id v24 = v8;
        id v25 = v9;
        -[HDNanoSyncManager _queue_synchronizeWithOptions:restoreMessagesSentHandler:targetSyncStore:reason:accessibilityAssertion:completion:](a1, 4, 0, v21, @"proactive sync", v24, v20);
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v17 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = v17;
          id v19 = objc_msgSend(v13, "hd_shortDescription");
          *(_DWORD *)long long buf = 138543618;
          uint64_t v27 = (uint64_t)v16;
          __int16 v28 = 2114;
          id v29 = v19;
          _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "skipping proactive sync for store %{public}@ for device \"%{public}@\"", buf, 0x16u);
        }
        -[HDNanoSyncManager _queue_performNextProactiveSyncWithRemainingDevices:accessibilityAssertion:completion:](a1, v7, v8, v9);
      }
    }
    else if (v9)
    {
      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    }
  }
}

void __107__HDNanoSyncManager__queue_performNextProactiveSyncWithRemainingDevices_accessibilityAssertion_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    double v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "failed proactive sync for store %{public}@: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(NSObject **)(v7 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __107__HDNanoSyncManager__queue_performNextProactiveSyncWithRemainingDevices_accessibilityAssertion_completion___block_invoke_695;
  v10[3] = &unk_1E62F2F48;
  v10[4] = v7;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  dispatch_async(v8, v10);
}

uint64_t __107__HDNanoSyncManager__queue_performNextProactiveSyncWithRemainingDevices_accessibilityAssertion_completion___block_invoke_695(void *a1)
{
  return -[HDNanoSyncManager _queue_performNextProactiveSyncWithRemainingDevices:accessibilityAssertion:completion:](a1[4], a1[5], a1[6], a1[7]);
}

void __119__HDNanoSyncManager__syncQueue_forwardSpeculativeChangeSetIfNecessaryForChanges_destinationSyncStores_originSyncStore___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v2;
        uint64_t v3 = *(void **)(*((void *)&v31 + 1) + 8 * v2);
        uint64_t v4 = objc_alloc_init(HDCodableNanoSyncChangeSet);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v5 = *(id *)(a1 + 40);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v38 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v28 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 48));
              uint64_t v12 = [v10 syncEntityClassForProfile:WeakRetained];

              if ([v3 supportsSpeculativeChangesForSyncEntityClass:v12]) {
                [(HDCodableNanoSyncChangeSet *)v4 addChanges:v10];
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v38 count:16];
          }
          while (v7);
        }

        if ([(HDCodableNanoSyncChangeSet *)v4 changesCount])
        {
          _HKInitializeLogging();
          id v13 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            id v14 = v13;
            uint64_t v15 = [(HDCodableNanoSyncChangeSet *)v4 nanoSyncDescription];
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v15;
            __int16 v36 = 2114;
            id v37 = v3;
            _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "forwarding speculative change set %{public}@ to %{public}@", buf, 0x16u);
          }
          uint64_t v16 = *(void *)(a1 + 48);
          id v17 = v4;
          id v18 = v3;
          if (v16)
          {
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v16 + 56));
            *(void *)long long buf = 0;
            int v19 = -[HDNanoSyncManager _queue_isRestoreCompleteForSyncStore:error:](v16, v18, (uint64_t)buf);
            id v20 = *(id *)buf;
            if (v17 && v19)
            {
              id v21 = objc_loadWeakRetained((id *)(v16 + 48));
              uint64_t v22 = +[HDIDSOutgoingRequest speculativeChangeRequestWithChangeSet:v17 syncStore:v18 profile:v21];

              [v22 setNonWaking:1];
              -[HDNanoSyncManager _queue_sendRequest:syncStore:](v16, v22, (uint64_t)v18);
            }
          }
        }
        uint64_t v2 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }
}

void __47__HDNanoSyncManager__resetSyncAnchorsForStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v2 = [WeakRetained syncEngine];
  [v2 resetStore:*(void *)(a1 + 40)];
}

- (void)_userCharacteristicsDidChange:(id)a3
{
  if (self) {
    -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, @"user characteristics changed", 0);
  }
}

- (void)_userPreferencesDidChange:(id)a3
{
  if (self) {
    -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, @"user preferences changed", 0);
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  if (self) {
    -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, @"samples of observed types were added", 0);
  }
}

- (void)_watchOffWristNotification:(id)a3
{
}

void __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke_2;
  block[3] = &unk_1E62F6BD0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeExpiredIncomingSyncObservers];
}

void __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "error occurred during last-chance sync request: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_sendFinalStatusMessageForSyncSession:(char)a3 didFinishSuccessfully:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = *(NSObject **)(a1 + 64);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__HDNanoSyncManager__sendFinalStatusMessageForSyncSession_didFinishSuccessfully_error___block_invoke;
    v10[3] = &unk_1E62F7780;
    id v11 = v7;
    uint64_t v12 = a1;
    char v14 = a3;
    id v13 = v8;
    dispatch_async(v9, v10);
  }
}

void __68__HDNanoSyncManager__queue_recieveStartWorkoutAppRequest_syncStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    id v18 = @"with response";
    if (!v5) {
      id v18 = @"with nil response";
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v26 = v18;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "Start workout app request complete %@, error: %{public}@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) requestIdentifier];
  [v5 setRequestIdentifier:v8];

  if (v6)
  {
    uint64_t v9 = objc_msgSend(v6, "hk_codableError");
    [v5 setLaunchError:v9];
  }
  uint64_t v10 = [*(id *)(a1 + 40) response];
  [v10 setPbResponse:v5];
  id v11 = *(NSObject **)(*(void *)(a1 + 48) + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HDNanoSyncManager__queue_recieveStartWorkoutAppRequest_syncStore___block_invoke_774;
  block[3] = &unk_1E62F7508;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  char v14 = *(void **)(a1 + 56);
  id v20 = v12;
  uint64_t v21 = v13;
  id v22 = v10;
  id v15 = v14;
  uint64_t v16 = *(void *)(a1 + 64);
  id v23 = v15;
  uint64_t v24 = v16;
  id v17 = v10;
  dispatch_async(v11, block);
}

void __68__HDNanoSyncManager__queue_recieveStartWorkoutAppRequest_syncStore___block_invoke_774(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v2;
    id v7 = [v5 requestIdentifier];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "Sending response to start app request %@", (uint8_t *)&v8, 0xCu);
  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(void *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t __69__HDNanoSyncManager__queue_recieveStartWorkoutAppResponse_syncStore___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __83__HDNanoSyncManager__queue_startWorkoutAppRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __86__HDNanoSyncManager__queue_sendCompanionUserNotificationRequest_syncStore_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!a2)
  {
    if (v4)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29F80];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        int v8 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Request to display companion user notification failed: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void __78__HDNanoSyncManager__queue_recieveCompanionUserNotificationRequest_syncStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  int v7 = *MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEBUG))
  {
    id v18 = @"with response";
    if (!v5) {
      id v18 = @"with nil response";
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v26 = v18;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "Display notification request complete %@, error: %@", buf, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) requestIdentifier];
  [v5 setRequestIdentifier:v8];

  if (v6)
  {
    uint64_t v9 = objc_msgSend(v6, "hk_codableError");
    [v5 setError:v9];
  }
  uint64_t v10 = [*(id *)(a1 + 40) response];
  [v10 setPbResponse:v5];
  id v11 = *(NSObject **)(*(void *)(a1 + 48) + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HDNanoSyncManager__queue_recieveCompanionUserNotificationRequest_syncStore___block_invoke_785;
  block[3] = &unk_1E62F7508;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  char v14 = *(void **)(a1 + 56);
  id v20 = v12;
  uint64_t v21 = v13;
  id v22 = v10;
  id v15 = v14;
  uint64_t v16 = *(void *)(a1 + 64);
  id v23 = v15;
  uint64_t v24 = v16;
  id v17 = v10;
  dispatch_async(v11, block);
}

void __78__HDNanoSyncManager__queue_recieveCompanionUserNotificationRequest_syncStore___block_invoke_785(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEBUG))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v2;
    int v7 = [v5 requestIdentifier];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "Sending response to start app request %@", (uint8_t *)&v8, 0xCu);
  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(void *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t __79__HDNanoSyncManager__queue_recieveCompanionUserNotificationResponse_syncStore___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __93__HDNanoSyncManager__queue_companionUserNotificationRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __76__HDNanoSyncManager__queue_receiveNotificationInstructionRequest_syncStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEBUG))
  {
    id v6 = v5;
    int v7 = objc_opt_class();
    int v8 = *(void **)(a1 + 40);
    id v9 = v7;
    uint64_t v10 = [v8 requestIdentifier];
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2112;
    char v14 = v10;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Processed Notification instruction request %@, error: %@", (uint8_t *)&v11, 0x20u);
  }
}

void __64__HDNanoSyncManager__queue_receiveTinkerOptInRequest_syncStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v20 = v7;
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing response to Tinker opt in request; error: %{public}@ (#t0)",
      buf,
      0x16u);
  }
  int v8 = [*(id *)(a1 + 40) response];
  id v9 = objc_alloc_init(HDCodableTinkerOptInResponse);
  uint64_t v10 = [*(id *)(a1 + 48) requestIdentifier];
  [(HDCodableTinkerOptInResponse *)v9 setRequestIdentifier:v10];

  [(HDCodableTinkerOptInResponse *)v9 setAccepted:a2];
  if (v5)
  {
    int v11 = objc_msgSend(v5, "hk_codableError");
    [(HDCodableTinkerOptInResponse *)v9 setError:v11];
  }
  [v8 setPbResponse:v9];
  uint64_t v12 = *(void *)(a1 + 32);
  __int16 v13 = *(NSObject **)(v12 + 56);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HDNanoSyncManager__queue_receiveTinkerOptInRequest_syncStore___block_invoke_799;
  v15[3] = &unk_1E62F6A40;
  v15[4] = v12;
  id v16 = *(id *)(a1 + 48);
  id v17 = v8;
  id v18 = *(id *)(a1 + 56);
  id v14 = v8;
  dispatch_async(v13, v15);
}

void __64__HDNanoSyncManager__queue_receiveTinkerOptInRequest_syncStore___block_invoke_799(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    id v5 = v2;
    id v6 = [v3 requestIdentifier];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Will send Tinker opt in response to request %{public}@ (#t0)", (uint8_t *)&v7, 0x16u);
  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(void *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __75__HDNanoSyncManager__queue_registerForTinkerOptInNotificationWithResponse___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDNanoSyncManager _queue_handleTinkerOptInNotification:]((uint64_t)WeakRetained, 1);
}

- (void)_queue_handleTinkerOptInNotification:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    notify_cancel(*(_DWORD *)(a1 + 28));
    notify_cancel(*(_DWORD *)(a1 + 32));
    _HKInitializeLogging();
    uint64_t v4 = (void *)*MEMORY[0x1E4F29FA8];
    BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        id v6 = *(void **)(a1 + 112);
        int v7 = v4;
        *(_DWORD *)long long buf = 134349056;
        uint64_t v32 = [v6 count];
        _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Tinker opt in accepted for the previous %{public}lu requests. Sending answer to companion (#t0)", buf, 0xCu);
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v8 = *(id *)(a1 + 112);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * i) + 16))();
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v10);
      }
    }
    else
    {
      if (v5)
      {
        __int16 v13 = *(void **)(a1 + 112);
        id v14 = v4;
        *(_DWORD *)long long buf = 134349056;
        uint64_t v32 = [v13 count];
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Tinker opt in declined for the previous %{public}lu requests. Sending answer to companion (#t0)", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Tinker user declined Health sharing opt-in");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v15 = *(id *)(a1 + 112);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * j));
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v17);
      }
    }
    uint64_t v20 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = 0;
  }
}

void __75__HDNanoSyncManager__queue_registerForTinkerOptInNotificationWithResponse___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDNanoSyncManager _queue_handleTinkerOptInNotification:]((uint64_t)WeakRetained, 0);
}

uint64_t __65__HDNanoSyncManager__queue_receiveTinkerOptInResponse_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) accepted];
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

uint64_t __79__HDNanoSyncManager__queue_tinkerOptInRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  int v7 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v23 = v5;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Preparing response %{public}@ to Tinker pairing request; error: %{public}@ (#t0)",
      buf,
      0x16u);
  }
  id v8 = [*(id *)(a1 + 32) response];
  uint64_t v9 = objc_alloc_init(HDCodableTinkerPairingResponse);
  uint64_t v10 = [*(id *)(a1 + 40) requestIdentifier];
  [(HDCodableTinkerPairingResponse *)v9 setRequestIdentifier:v10];

  [(HDCodableTinkerPairingResponse *)v9 setSetupMetadata:v5];
  if (v6)
  {
    uint64_t v11 = objc_msgSend(v6, "hk_codableError");
    [(HDCodableTinkerPairingResponse *)v9 setError:v11];
  }
  [v8 setPbResponse:v9];
  uint64_t v12 = *(NSObject **)(*(void *)(a1 + 48) + 56);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_826;
  v17[3] = &unk_1E62F6A40;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = *(void **)(a1 + 56);
  id v18 = v13;
  uint64_t v19 = v14;
  id v20 = v8;
  id v21 = v15;
  id v16 = v8;
  dispatch_async(v12, v17);
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_826(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 requestIdentifier];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Sending response to Tinker pairing request %{public}@ (#t0)", (uint8_t *)&v6, 0xCu);
  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(void *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_841(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  int v7 = *MEMORY[0x1E4F29FA8];
  uint64_t v8 = *MEMORY[0x1E4F29FA8];
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[sharing-setup] Failed health sharing set up process: %{public}@ (#t0)", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Successfully finished health sharing set up process, sending response (#t0)", (uint8_t *)&v10, 2u);
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
  [*(id *)(a1 + 32) invalidate];
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_843(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ensuring that sync is enabled locally. (#t0)", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  int v7 = [WeakRetained daemon];
  uint64_t v8 = [v7 cloudSyncCoordinator];
  [v8 cloudSyncSupportStatusDidChange];

  id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  int v10 = [v9 daemon];
  id v11 = [v10 cloudSyncCoordinator];
  uint64_t v12 = [v11 accountProvider];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_844;
  v14[3] = &unk_1E62F29A0;
  id v15 = v4;
  id v13 = v4;
  [v12 enableSyncLocallyWithCompletion:v14];
}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_844(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) tinkerFirstName];

  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Updating profile name for local device. (#t0)", buf, 2u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      id WeakRetained = objc_loadWeakRetained((id *)(v8 + 48));
    }
    else {
      id WeakRetained = 0;
    }
    int v10 = [*(id *)(a1 + 32) tinkerFirstName];
    id v11 = [*(id *)(a1 + 32) tinkerLastName];
    id v17 = 0;
    int v12 = [WeakRetained setDisplayFirstName:v10 lastName:v11 error:&v17];
    id v13 = v17;

    if (v12)
    {
      uint64_t v14 = 0;
      id v15 = 0;
    }
    else
    {
      uint64_t v14 = 1;
      id v15 = v13;
    }
    ((void (**)(id, uint64_t, id))v4)[2](v4, v14, v15);
  }
  else
  {
    if (v7)
    {
      __int16 v16 = 0;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] No first/last name present; not saving in local profile. (#t0)",
        (uint8_t *)&v16,
        2u);
    }
    v4[2](v4, 0, 0);
  }
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_846(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1A488]);
  id v6 = [*(id *)(a1 + 32) guardianIcloudIdentifier];
  BOOL v7 = (void *)[v5 initWithEmailAddress:v6];

  _HKInitializeLogging();
  uint64_t v8 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Starting sharing setup with lookupInfo %{public}@ (#t0)", buf, 0xCu);
  }
  BOOL v9 = [*(id *)(a1 + 32) setupType] == 1;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  id v11 = [WeakRetained cloudSyncManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_849;
  v14[3] = &unk_1E62F7668;
  id v16 = v4;
  id v15 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 56);
  id v12 = v4;
  id v13 = (id)[v11 setupSharingToAccountWithIdentityLookupInfo:v7 requireExistingRelationship:v9 requireZoneDeviceMode:&unk_1F17EB358 completion:v14];
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_849(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  _HKInitializeLogging();
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F29FA8];
  BOOL v9 = *MEMORY[0x1E4F29FA8];
  int v10 = *MEMORY[0x1E4F29FA8];
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)a1[4];
      *(_DWORD *)long long buf = 138543362;
      id v20 = v11;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Set up shares in response to Tinker pairing request %{public}@ (#t0)", buf, 0xCu);
    }
    id v18 = 0;
    uint64_t v12 = [v6 codableSharingSetupMetadataWithError:&v18];
    id v13 = v18;
    uint64_t v14 = *(void *)(a1[6] + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v12;

    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
      id v16 = *(void (**)(void))(a1[5] + 16);
    }
    else
    {
      _HKInitializeLogging();
      long long v17 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v20 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "[sharing-setup] Encoding sharing setup metadata failed %{public}@ (#t0)", buf, 0xCu);
      }
      id v16 = *(void (**)(void))(a1[5] + 16);
    }
    v16();
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v20 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[sharing-setup] Share setup failed %{public}@ (#t0)", buf, 0xCu);
    }
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_851(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v7 = v5;
    uint64_t v8 = [v6 shareParticipant];
    *(_DWORD *)long long buf = 138543362;
    __int16 v24 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Sharing set up successful to %{public}@. Save guardian details for transparency alert (#t0)", buf, 0xCu);
  }
  BOOL v9 = objc_alloc_init(HDTinkerPairedUserInfo);
  int v10 = [*(id *)(a1 + 32) guardianFirstName];
  [(HDTinkerPairedUserInfo *)v9 setFirstName:v10];

  id v11 = [*(id *)(a1 + 32) guardianLastName];
  [(HDTinkerPairedUserInfo *)v9 setLastName:v11];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "guardianDSID"));
  [(HDTinkerPairedUserInfo *)v9 setDsid:v12];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  uint64_t v14 = [WeakRetained database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_853;
  v19[3] = &unk_1E62F76B8;
  uint64_t v15 = *(void *)(a1 + 48);
  v19[4] = *(void *)(a1 + 40);
  id v20 = v9;
  uint64_t v21 = *(void *)(a1 + 56);
  id v22 = 0;
  id v16 = v9;
  LODWORD(v9) = [v14 performWithTransactionContext:v15 error:&v22 block:v19];
  id v17 = v22;

  if (v9) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = 2;
  }
  v4[2](v4, v18, v17);
}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_853(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) shareParticipant];
  id v6 = v3;
  id v7 = v5;
  if (!v4) {
    goto LABEL_6;
  }
  _HKInitializeLogging();
  uint64_t v8 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Saving guardian info %{public}@, guardianParticipant %{public}@ (#t0)", (uint8_t *)&v15, 0x16u);
  }
  BOOL v9 = (id *)(v4 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(v4 + 48));
  int v11 = [WeakRetained setPairedGuardianUserInfo:v6 error:a2];

  if (v11)
  {
    id v12 = objc_loadWeakRetained(v9);
    uint64_t v13 = [v12 setPairedGuardianParticipant:v7 error:a2];
  }
  else
  {
LABEL_6:
    uint64_t v13 = 0;
  }

  return v13;
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_854(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Scheduling buddy flow transparency alert(#t0)", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v7 = [WeakRetained database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_855;
  v12[3] = &unk_1E62F6A18;
  uint64_t v8 = *(void *)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = 0;
  int v9 = [v7 performWithTransactionContext:v8 error:&v13 block:v12];
  id v10 = v13;

  if (v9) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 2;
  }
  v4[2](v4, v11, v10);
}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_855(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0;
  }
  _HKInitializeLogging();
  uint64_t v4 = (NSObject **)MEMORY[0x1E4F29FA8];
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Set up transparency alert to fire after buddy flow (#t0)", v21, 2u);
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v7 = [v6 objectForKey:*MEMORY[0x1E4F299A8]];

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  int v9 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 128, objc_msgSend(v7, "integerValue"), v8, 0);
    _HKInitializeLogging();
    uint64_t v11 = *v4;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = NSStringFromSelector(sel__scheduleTransparencyAlert_);
      *(_DWORD *)uint64_t v21 = 138543618;
      *(void *)&v21[4] = v13;
      *(_WORD *)&v21[12] = 2114;
      *(void *)&v21[14] = v10;
      uint64_t v14 = "[sharing-setup] %{public}@ Found user defaults, scheduling alert for %{public}@ (#t0)";
LABEL_10:
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, v14, v21, 0x16u);
    }
  }
  else
  {
    id v10 = [v9 dateByAddingUnit:16 value:2 toDate:v8 options:0];
    _HKInitializeLogging();
    int v15 = *v4;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v15;
      id v13 = NSStringFromSelector(sel__scheduleTransparencyAlert_);
      *(_DWORD *)uint64_t v21 = 138543618;
      *(void *)&v21[4] = v13;
      *(_WORD *)&v21[12] = 2114;
      *(void *)&v21[14] = v10;
      uint64_t v14 = "[sharing-setup] %{public}@ Did not find any user defaults. Scheduling alert for %{public}@ (#t0)";
      goto LABEL_10;
    }
  }
  id v16 = objc_msgSend(v9, "components:fromDate:", 62, v10, *(_OWORD *)v21, *(void *)&v21[16], v22);
  [v16 setCalendar:v9];
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  id v18 = [WeakRetained tinkerPrivacyAlertCoordinator];
  uint64_t v19 = [v18 scheduleEventIfRequiredForDateComponents:v16 eventIdentifier:@"TinkerPrivacyAlertEventSharingSetUp" error:a2];

  return v19;
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_856(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Subscribing to data upload requests (#t0)", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v7 = [WeakRetained cloudSyncManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_857;
  v9[3] = &unk_1E62F29A0;
  id v10 = v4;
  id v8 = v4;
  [v7 subscribeToDataUploadRequestsWithCompletion:v9];
}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_857(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_858(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Subscribing to data download available notifications (#t0)", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v7 = [WeakRetained cloudSyncManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_859;
  v9[3] = &unk_1E62F29A0;
  id v10 = v4;
  id v8 = v4;
  [v7 subscribeToDataAvailableNotificationsWithCompletion:v9];
}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_859(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_860(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [HDKeyValueDomain alloc];
  uint64_t v6 = *MEMORY[0x1E4F2BDD8];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 48));
  }
  else {
    id WeakRetained = 0;
  }
  int v9 = [(HDKeyValueDomain *)v5 initWithCategory:100 domainName:v6 profile:WeakRetained];

  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2BDD0]];
  id v14 = 0;
  BOOL v11 = [(HDKeyValueDomain *)v9 removeValuesForKeys:v10 error:&v14];
  id v12 = v14;

  if (!v11)
  {
    _HKInitializeLogging();
    id v13 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v16 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "[sharing-setup] Failed to purge sharing state cache with error: %{public}@ (#t0)", buf, 0xCu);
    }
  }
  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
}

void __67__HDNanoSyncManager__queue_receiveTinkerPairingResponse_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) setupMetadata];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

uint64_t __81__HDNanoSyncManager__queue_tinkerPairingRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 16);
  }
  return (*(uint64_t (**)(uint64_t, void, void))(v1 + 16))(v1, 0, *(void *)(a1 + 40));
}

void __76__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v20 = v7;
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing response to Tinker end to end Cloud Sync request; error: %{public}@ (#t0)",
      buf,
      0x16u);
  }
  id v8 = [*(id *)(a1 + 40) response];
  int v9 = objc_alloc_init(HDCodableTinkerEndToEndCloudSyncResponse);
  id v10 = [*(id *)(a1 + 48) requestIdentifier];
  [(HDCodableTinkerEndToEndCloudSyncResponse *)v9 setRequestIdentifier:v10];

  [(HDCodableTinkerEndToEndCloudSyncResponse *)v9 setSuccess:a2];
  if (v5)
  {
    BOOL v11 = objc_msgSend(v5, "hk_codableError");
    [(HDCodableTinkerEndToEndCloudSyncResponse *)v9 setError:v11];
  }
  [v8 setPbResponse:v9];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(NSObject **)(v12 + 56);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore___block_invoke_873;
  v15[3] = &unk_1E62F6A40;
  v15[4] = v12;
  id v16 = *(id *)(a1 + 48);
  id v17 = v8;
  id v18 = *(id *)(a1 + 56);
  id v14 = v8;
  dispatch_async(v13, v15);
}

void __76__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore___block_invoke_873(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    id v5 = v2;
    uint64_t v6 = [v3 requestIdentifier];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Will send Tinker end to end Cloud Sync response to request %{public}@ (#t0)", (uint8_t *)&v7, 0x16u);
  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(void *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __80__HDNanoSyncManager__queue_performSyncForTinkerEndToEndCloudSyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

uint64_t __77__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncResponse_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) success];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

uint64_t __91__HDNanoSyncManager__queue_tinkerEndToEndCloudSyncRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  int v7 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109378;
    int v18 = a3;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "Authorization request complete with success: %d, error: %{public}@.", buf, 0x12u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_889;
  v12[3] = &unk_1E62F75A0;
  id v13 = v6;
  uint64_t v8 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v9;
  uint64_t v16 = v10;
  id v11 = v6;
  [v8 syncHealthDataWithOptions:0 reason:@"Remote authorization request complete" completion:v12];
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_889(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 67109378;
    int v21 = a2;
    __int16 v22 = 2114;
    uint64_t v23 = v16;
    _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "Post-authorization sync complete with success: %d, error: %{public}@.", buf, 0x12u);
  }
  int v7 = objc_alloc_init(HDCodableAuthorizationCompleteMessage);
  uint64_t v8 = [*(id *)(a1 + 40) appBundleIdentifier];
  [(HDCodableAuthorizationCompleteMessage *)v7 setAppBundleIdentifier:v8];

  id v9 = [*(id *)(a1 + 40) requestIdentifier];
  [(HDCodableAuthorizationCompleteMessage *)v7 setRequestIdentifier:v9];

  uint64_t v10 = *(void **)(a1 + 32);
  if (v10 || (uint64_t v10 = v5) != 0)
  {
    id v11 = [v10 localizedDescription];
    [(HDCodableAuthorizationCompleteMessage *)v7 setErrorDescription:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 48) createRequestWithMessageID:4];
  [v12 setPbRequest:v7];
  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = *(NSObject **)(v13 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_890;
  block[3] = &unk_1E62F30F8;
  void block[4] = v13;
  id v18 = v12;
  id v19 = *(id *)(a1 + 48);
  id v15 = v12;
  dispatch_async(v14, block);
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_890(uint64_t a1)
{
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412802;
    id v22 = v7;
    __int16 v23 = 1024;
    int v24 = a2;
    __int16 v25 = 2114;
    id v26 = v8;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "Sending response to authorization request; host app is %@ and should prompt is %d; error: %{public}@",
      buf,
      0x1Cu);
  }
  uint64_t v10 = [*(id *)(a1 + 32) response];
  id v11 = objc_alloc_init(HDCodableAuthorizationResponseMessage);
  uint64_t v12 = [*(id *)(a1 + 40) appBundleIdentifier];
  [(HDCodableAuthorizationResponseMessage *)v11 setAppBundleIdentifier:v12];

  uint64_t v13 = [*(id *)(a1 + 40) requestIdentifier];
  [(HDCodableAuthorizationResponseMessage *)v11 setRequestIdentifier:v13];

  [(HDCodableAuthorizationResponseMessage *)v11 setShouldPrompt:a2];
  [(HDCodableAuthorizationResponseMessage *)v11 setHostAppName:v7];
  if (v8)
  {
    id v14 = [v8 localizedDescription];
    [(HDCodableAuthorizationResponseMessage *)v11 setErrorDescription:v14];
  }
  [v10 setPbResponse:v11];
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(NSObject **)(v15 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_892;
  block[3] = &unk_1E62F30F8;
  void block[4] = v15;
  id v19 = v10;
  id v20 = *(id *)(a1 + 56);
  id v17 = v10;
  dispatch_async(v16, block);
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_892(uint64_t a1)
{
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_2_894(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (!a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_7;
  }
  id v9 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:*(void *)(a1 + 32)];
  uint64_t v10 = [v9 localizedName];
  if (!v10)
  {
    uint64_t v10 = [v9 localizedShortName];
    if (!v10)
    {
      _HKInitializeLogging();
      id v14 = *MEMORY[0x1E4F29EF8];
      BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v15)
        {
          uint64_t v16 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v24 = v16;
          id v17 = "Failed to lookup name for bundle '%@': got a proxy, but didn't find a localizedName or localizedShortName.";
LABEL_14:
          _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
        }
      }
      else if (v15)
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v24 = v19;
        id v17 = "Failed to lookup name for bundle '%@': failed to get an application proxy object from LSApplicationProxy.";
        goto LABEL_14;
      }
      uint64_t v18 = *(void *)(a1 + 56);
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 64), @"Unable to look up host app with requested bundle identifier."");
      (*(void (**)(uint64_t, void, void, void *))(v18 + 16))(v18, 0, 0, v10);
      goto LABEL_5;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  uint64_t v12 = [WeakRetained authorizationManager];
  uint64_t v13 = *(void *)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_3;
  v20[3] = &unk_1E62F69A0;
  id v22 = *(id *)(a1 + 48);
  id v21 = v7;
  [v12 openAppForAuthorization:v13 sessionIdentifier:v21 completion:v20];

  (*(void (**)(void, uint64_t, void *, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 1, v10, 0);
LABEL_5:

LABEL_7:
}

uint64_t __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_3(uint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(result + 40) + 16))(*(void *)(result + 40), *(void *)(result + 32), 0, a3);
  }
  return result;
}

uint64_t __67__HDNanoSyncManager__queue_receiveAuthorizationResponse_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 16);
  }
  return (*(uint64_t (**)(uint64_t, void, void, void))(v1 + 16))(v1, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __81__HDNanoSyncManager__queue_authorizationRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 16);
  }
  return (*(uint64_t (**)(uint64_t, void, void, void))(v1 + 16))(v1, 0, 0, *(void *)(a1 + 40));
}

uint64_t __81__HDNanoSyncManager__queue_authorizationRequestDidFailToSendWithError_syncStore___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 24);
  }
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(v1, *(void *)(a1 + 40));
}

uint64_t __74__HDNanoSyncManager__queue_receiveAuthorizationCompleteRequest_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 24);
  }
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(v1, *(void *)(a1 + 40));
}

- (void)_scheduleResetReceivedNanoSyncAnchorsForHFD
{
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HDNanoSyncManager__scheduleResetReceivedNanoSyncAnchorsForHFD__block_invoke;
  v8[3] = &unk_1E62F3208;
  v8[4] = self;
  uint64_t v4 = +[HDMaintenanceOperation maintenanceOperationWithName:@"Reset Received Nanosync Anchors" queue:queue synchronousBlock:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained daemon];
  id v7 = [v6 maintenanceWorkCoordinator];
  [v7 enqueueMaintenanceOperation:v4];
}

void __64__HDNanoSyncManager__scheduleResetReceivedNanoSyncAnchorsForHFD__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (NSObject **)MEMORY[0x1E4F29F18];
  uint64_t v3 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "Attempting reset of sync anchors", buf, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 48));
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = [WeakRetained database];
  id v7 = +[HDDatabaseTransactionContext contextForWriting];
  id v13 = 0;
  char v8 = [v6 performTransactionWithContext:v7 error:&v13 block:&__block_literal_global_909 inaccessibilityHandler:0];
  id v9 = v13;

  _HKInitializeLogging();
  uint64_t v10 = *v2;
  id v11 = *v2;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Reset of sync anchors completed", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v15 = v12;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset sync anchors as requested after HFD rebuild step.", buf, 0xCu);
  }
}

BOOL __64__HDNanoSyncManager__scheduleResetReceivedNanoSyncAnchorsForHFD__block_invoke_907(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = +[HDSyncStoreEntity allSyncStoreEntitiesOfType:1 transaction:v4 error:a3];
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(v5, "hk_map:", &__block_literal_global_913);
    BOOL v8 = +[HDSyncAnchorEntity resetAllSyncAnchorsOfType:3 syncProvenances:v7 transaction:v4 error:a3];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __64__HDNanoSyncManager__scheduleResetReceivedNanoSyncAnchorsForHFD__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 syncProvenance];

  return [v2 numberWithLongLong:v3];
}

void __87__HDNanoSyncManager__sendFinalStatusMessageForSyncSession_didFinishSuccessfully_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isLastChance]) {
    uint64_t v2 = 5;
  }
  else {
    uint64_t v2 = 4;
  }
  uint64_t v3 = +[HDCodableNanoSyncStatus statusWithStatusCode:v2];
  id v4 = [*(id *)(a1 + 32) syncStore];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  id v6 = [WeakRetained syncEngine];
  id v15 = 0;
  int v7 = [v6 getReceivedAnchorMap:v3 forStore:v4 error:&v15];
  id v8 = v15;

  if (v7)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v12 = *(void **)(a1 + 48);
    id v13 = v3;
  }
  else
  {
    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v17 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "failed to get received anchors for outgoing change pull request: %{public}@", buf, 0xCu);
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    if (*(void *)(a1 + 48)) {
      uint64_t v12 = *(void **)(a1 + 48);
    }
    else {
      uint64_t v12 = v8;
    }
    id v13 = v3;
    uint64_t v11 = 0;
  }
  -[HDNanoSyncManager _sendFinalMessageForSyncSession:status:success:error:](v9, v10, v13, v11, v12);
}

uint64_t __74__HDNanoSyncManager__sendFinalMessageForSyncSession_status_success_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    BOOL v3 = *(unsigned char *)(a1 + 48) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  if (*(void *)(a1 + 40)) {
    a3 = *(void *)(a1 + 40);
  }
  return [*(id *)(a1 + 32) invokeCompletionWithSuccess:v4 error:a3];
}

- (void)nanoSyncStore:(id)a3 remoteSystemBuildVersionDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HDNanoSyncManager_nanoSyncStore_remoteSystemBuildVersionDidChange___block_invoke;
  block[3] = &unk_1E62F30F8;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __69__HDNanoSyncManager_nanoSyncStore_remoteSystemBuildVersionDidChange___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "store %{public}@ remote system build version changed to %{public}@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) invalidate];
  -[HDNanoSyncManager _queue_updateSyncStores](*(void *)(a1 + 48));
}

- (void)nanoSyncStore:(id)a3 deviceNameDidChange:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HDNanoSyncManager_nanoSyncStore_deviceNameDidChange___block_invoke;
  v8[3] = &unk_1E62F31C0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __55__HDNanoSyncManager_nanoSyncStore_deviceNameDidChange___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "store %{public}@ device name did change", (uint8_t *)&v6, 0xCu);
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v5 == *(void **)(v4 + 96)) {
    -[HDNanoSyncManager _queue_updateDeviceNameIfNecessaryWithSyncStore:](v4, v5);
  }
}

void __69__HDNanoSyncManager__queue_updateDeviceNameIfNecessaryWithSyncStore___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  uint64_t v3 = [WeakRetained sourceManager];
  uint64_t v4 = a1[5];
  id v19 = 0;
  id v5 = [v3 localSourceForBundleIdentifier:v4 error:&v19];
  id v6 = v19;

  if (v5)
  {
    uint64_t v7 = a1[7];
    id v8 = objc_loadWeakRetained((id *)(a1[4] + 48));
    id v18 = v6;
    int v9 = [v5 setName:v7 profile:v8 error:&v18];
    id v10 = v18;

    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FA8];
    id v12 = *MEMORY[0x1E4F29FA8];
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v14 = (void *)a1[6];
        uint64_t v13 = a1[7];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v21 = v13;
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_debug_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEBUG, "updated device name to %@ for %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = a1[6];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "failed to set device name for %{public}@: %{public}@", buf, 0x16u);
    }
    id v6 = v10;
  }
  else
  {
    _HKInitializeLogging();
    id v15 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = a1[6];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "failed to look up source for %{public}@: %{public}@", buf, 0x16u);
    }
  }
}

- (void)nanoSyncStore:(id)a3 restoreStateDidChange:(int64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HDNanoSyncManager_nanoSyncStore_restoreStateDidChange___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __57__HDNanoSyncManager_nanoSyncStore_restoreStateDidChange___block_invoke(uint64_t a1)
{
}

- (id)diagnosticDescription
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = v3;
  if (self->_isMaster) {
    id v5 = "YES";
  }
  else {
    id v5 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"\n\tMaster: %s", v5);
  id v6 = self->_activeSyncStore;
  if (v6)
  {
    [v4 appendString:@"\n\tActive Store:\n\t"];
    uint64_t v7 = [(HDNanoSyncStore *)v6 diagnosticDescription];
    id v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
    [v4 appendString:v8];
  }
  int v9 = [(NSMutableDictionary *)self->_syncStoresByDeviceIdentifier allValues];
  unint64_t v10 = [v9 count];
  if (!v6 || v10 >= 2)
  {
    id v23 = v6;
    [v4 appendString:@"\n\n\tInactive Stores:\n\t"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    __int16 v22 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(HDNanoSyncStore **)(*((void *)&v24 + 1) + 8 * i);
          if (v16 != self->_activeSyncStore)
          {
            uint64_t v17 = [(HDNanoSyncStore *)v16 diagnosticDescription];
            id v18 = [v17 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
            [v4 appendString:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    int v9 = v22;
    id v6 = v23;
  }
  if (self->_periodicSyncTimer) {
    id v19 = "ON";
  }
  else {
    id v19 = "OFF";
  }
  objc_msgSend(v4, "appendFormat:", @"\n\tPeriodic sync timer: %s", v19);
  id v20 = HKDiagnosticStringFromDate();
  [v4 appendFormat:@"\n\tLast periodic sync: %@", v20];

  return v4;
}

- (void)foregroundClientProcessesDidChange:(id)a3 previouslyForegroundBundleIdentifiers:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = (_CDLocalContext *)a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (os_log_t *)MEMORY[0x1E4F29FA8];
  int v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412546;
    long long v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "CoreDuet: Attempt to add new foregroundClientBundleIds: %@ \n and remove previouslyForegroundBundleIds: %@", (uint8_t *)&v27, 0x16u);
  }
  unint64_t v10 = [MEMORY[0x1E4F5B6B8] keyPathForServicesAppearingForeground];
  if ([v7 count])
  {
    context = self->_context;
    uint64_t v12 = [v7 allObjects];
    LOBYTE(context) = [(_CDLocalContext *)context removeObjects:v12 fromArrayAtKeyPath:v10];

    if ((context & 1) == 0)
    {
      _HKInitializeLogging();
      os_log_t v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        long long v24 = self->_context;
        long long v25 = v13;
        long long v26 = [(_CDLocalContext *)v24 objectForContextualKeyPath:v10];
        int v27 = 138412802;
        long long v28 = v24;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        uint64_t v32 = v26;
        _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "CoreDuet: Unsuccessful attempt to remove previously foreground bundleIDs from context %@ at keypath %@. Existing foreground bundleIDs: %@", (uint8_t *)&v27, 0x20u);
      }
    }
  }
  if ([(_CDLocalContext *)v6 count])
  {
    uint64_t v14 = self->_context;
    id v15 = [(_CDLocalContext *)v6 allObjects];
    LOBYTE(v14) = [(_CDLocalContext *)v14 addObjects:v15 toArrayAtKeyPath:v10];

    if ((v14 & 1) == 0)
    {
      _HKInitializeLogging();
      os_log_t v16 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = self->_context;
        id v18 = v16;
        id v19 = [(_CDLocalContext *)v17 objectForContextualKeyPath:v10];
        int v27 = 138412802;
        long long v28 = v17;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        uint64_t v32 = v19;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "CoreDuet: Unsuccessful attempt to add new foreground bundle ids to context %@ at keypath %@. Existing foreground bundleIDs: %@", (uint8_t *)&v27, 0x20u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v21 = [WeakRetained daemon];
    __int16 v22 = [v21 behavior];
    char v23 = [v22 isAppleWatch];

    if ((v23 & 1) == 0) {
      -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, @"client process entered foreground", 1);
    }
  }
}

- (double)restoreTimeout
{
  return self->_restoreTimeout;
}

- (void)setRestoreTimeout:(double)a3
{
  self->_restoreTimeout = a3;
}

- (void)setEnablePeriodicSyncTimer:(BOOL)a3
{
  self->_enablePeriodicSyncTimer = a3;
}

- (HDPairedSyncManager)pairedSyncManager
{
  return self->_pairedSyncManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSyncManager, 0);
  objc_storeStrong((id *)&self->_lastPeriodicSyncDate, 0);
  objc_storeStrong((id *)&self->_periodicSyncTimer, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_syncStoresByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_tinkerOptInResponseBlocks, 0);
  objc_storeStrong((id *)&self->_activeTinkerSyncStore, 0);
  objc_storeStrong((id *)&self->_activeSyncStore, 0);
  objc_storeStrong((id *)&self->_nanoSyncDomain, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_pairedDevicesSnapshot, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end