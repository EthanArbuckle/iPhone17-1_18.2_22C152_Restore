@interface HDCloudSyncSubscriptionNotificationHandler
- (BOOL)_shouldTriggerDownload;
- (BOOL)_shouldTriggerUpload;
- (HDCloudSyncSubscriptionNotificationHandler)initWithCoordinator:(id)a3 behavior:(id)a4;
- (id)_copyAPSEntitlement;
- (void)_enableAPSPush;
- (void)_queue_fetchAPSEnvironmentStringWithHandler:(id)a3;
- (void)_queue_handleIncomingCloudKitPushNotification:(id)a3;
- (void)_queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices;
- (void)_queue_handleIncomingDataDownloadAvailableNotificationOnTinkerDevices;
- (void)_queue_handleIncomingDataUploadRequest;
- (void)_queue_handleIncomingPrimaryMedicalIDDataAvailableForDownloadNotification;
- (void)_queue_handleIncomingSharedSummaryDataAvailableForDownloadNotification;
- (void)_queue_handleIncomingTinkerMedicalIDDataAvailableForDownloadNotification;
- (void)_queue_handleMedicationsStateUpdatedNotification;
- (void)_queue_handleSubscriptionWithID:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)daemonReady:(id)a3;
- (void)resetSubscriptionSyncBackoff;
- (void)triggerSubscription:(id)a3;
@end

@implementation HDCloudSyncSubscriptionNotificationHandler

- (HDCloudSyncSubscriptionNotificationHandler)initWithCoordinator:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncSubscriptionNotificationHandler;
  v8 = [(HDCloudSyncSubscriptionNotificationHandler *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_coordinator, v6);
    objc_storeStrong((id *)&v9->_behavior, a4);
    uint64_t v10 = HKCreateSerialUtilityDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v9->_lock._os_unfair_lock_opaque = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_coordinator);
    v13 = [WeakRetained daemon];
    [v13 registerDaemonReadyObserver:v9 queue:v9->_queue];
  }
  return v9;
}

- (void)_enableAPSPush
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!_HDIsUnitTesting)
  {
    if (self->_apsConnection)
    {
      _HKInitializeLogging();
      v3 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "APS connection is already created (#t0)", v4, 2u);
      }
    }
    else
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __60__HDCloudSyncSubscriptionNotificationHandler__enableAPSPush__block_invoke;
      v5[3] = &unk_1E62FBB88;
      v5[4] = self;
      [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_fetchAPSEnvironmentStringWithHandler:v5];
    }
  }
}

void __60__HDCloudSyncSubscriptionNotificationHandler__enableAPSPush__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__HDCloudSyncSubscriptionNotificationHandler__enableAPSPush__block_invoke_283;
    v8[3] = &unk_1E62F31C0;
    v8[4] = v5;
    id v9 = v3;
    dispatch_async(v6, v8);
  }
  else
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Error establishing APS connection due to nil APS enviroment.", buf, 2u);
    }
  }
}

void __60__HDCloudSyncSubscriptionNotificationHandler__enableAPSPush__block_invoke_283(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [@"com.apple.icloud-container." stringByAppendingString:*MEMORY[0x1E4F2BDC0]];
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F4E1E8]) initWithEnvironmentName:*(void *)(a1 + 40) namedDelegatePort:@"com.apple.aps.healthd.cloud.subscription.push" queue:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setDelegate:");
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40);
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FA8];
  v8 = *MEMORY[0x1E4F29FA8];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Created APS connection %p (#t0)", buf, 0xCu);
    }
    v11 = v2;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [*(id *)(*(void *)(a1 + 32) + 40) _setEnabledTopics:v10];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Couldn't create APS push connection (#t0)", buf, 2u);
  }
}

- (id)_copyAPSEntitlement
{
  v2 = (void *)xpc_copy_entitlement_for_self();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v2)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_queue_fetchAPSEnvironmentStringWithHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HDCloudSyncSubscriptionNotificationHandler *)self _copyAPSEntitlement];
  uint64_t v6 = v5;
  if (v5)
  {
    if (![v5 compare:*MEMORY[0x1E4F19CE0] options:1])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
      v8 = [WeakRetained daemon];
      uint64_t v9 = [v8 primaryProfile];
      uint64_t v10 = [v9 cloudSyncManager];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __90__HDCloudSyncSubscriptionNotificationHandler__queue_fetchAPSEnvironmentStringWithHandler___block_invoke;
      v11[3] = &unk_1E62F8AA0;
      id v12 = v4;
      [v10 fetchServerPreferredPushEnvironmentWithCompletion:v11];
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __90__HDCloudSyncSubscriptionNotificationHandler__queue_fetchAPSEnvironmentStringWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)*MEMORY[0x1E4F4E1D0];
  v8 = (os_log_t *)MEMORY[0x1E4F29FA8];
  if (v6)
  {
    _HKInitializeLogging();
    uint64_t v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "Error getting server APS preferred push environment: %{public}@ (#t0)", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v10 = v5;

    id v7 = v10;
  }
  _HKInitializeLogging();
  v11 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "Using APS push environment: %{public}@ (#t0)", (uint8_t *)&v12, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_queue_handleSubscriptionWithID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v4 isEqual:HDCloudSyncPrimaryProfileDataRequestedSubscriptionIdentifier])
  {
    [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleIncomingDataUploadRequest];
  }
  else if ([v4 isEqual:HDCloudSyncPrimaryProfileDataAvailableForDownloadSubscriptionIdentifier])
  {
    [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleIncomingDataDownloadAvailableNotificationOnTinkerDevices];
  }
  else if ([v4 isEqual:HDCloudSyncTinkerProfileDataAvailableForDownloadSubscriptionIdentifier])
  {
    [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices];
  }
  else if ([v4 isEqual:HDCloudSyncPrimaryMedicalIDDataAvailableForDownloadSubscriptionIdentifier])
  {
    [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleIncomingPrimaryMedicalIDDataAvailableForDownloadNotification];
  }
  else if ([v4 isEqual:HDCloudSyncTinkerMedicalIDDataAvailableForDownloadSubscriptionIdentifier])
  {
    [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleIncomingTinkerMedicalIDDataAvailableForDownloadNotification];
  }
  else if ([v4 isEqual:HDCloudSyncSharedSummaryDataAvailableForDownloadSubscriptionIdentifier])
  {
    [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleIncomingSharedSummaryDataAvailableForDownloadNotification];
  }
  else if ([v4 isEqual:HDCloudSyncMedicationsStateChangedSubscriptionIdentifier])
  {
    [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleMedicationsStateUpdatedNotification];
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543618;
      id v7 = self;
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Unknown subscription type %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v4 = [WeakRetained daemon];
  id v5 = [v4 primaryProfile];
  [v5 registerProfileReadyObserver:self queue:self->_queue];
}

- (void)_queue_handleIncomingCloudKitPushNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 subscriptionID];
  _HKInitializeLogging();
  int v6 = (os_log_t *)MEMORY[0x1E4F29FA8];
  id v7 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Recieved CloudKit push notification for subscription with id: %{public}@ (#t0)", (uint8_t *)&v10, 0xCu);
  }
  __int16 v8 = [v4 alertBody];

  if (v8)
  {
    [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleSubscriptionWithID:v5];
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "Push notification is low-priority, ignoring. (#t0)", (uint8_t *)&v10, 2u);
    }
  }
}

- (BOOL)_shouldTriggerUpload
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = CFAbsoluteTimeGetCurrent() - self->_lock_lastTinkerDataUploadTriggerTime;
  if (v4 <= 300.0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543874;
      __int16 v8 = self;
      __int16 v9 = 2048;
      double v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = 0x4072C00000000000;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data upload request; time since last request %lf is less than threshold %lf",
        (uint8_t *)&v7,
        0x20u);
    }
  }
  else
  {
    self->_lock_lastTinkerDataUploadTriggerTime = CFAbsoluteTimeGetCurrent();
  }
  os_unfair_lock_unlock(p_lock);
  return v4 > 300.0;
}

- (void)_queue_handleIncomingDataUploadRequest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(_HKBehavior *)self->_behavior tinkerModeEnabled])
  {
    if ([(HDCloudSyncSubscriptionNotificationHandler *)self _shouldTriggerUpload])
    {
      id v3 = objc_alloc(MEMORY[0x1E4F2AD68]);
      double v4 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:0];
      id v5 = (void *)[v3 initWithChangesSyncRequest:v4 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:0 summarySharingSyncRequest:0 allowCellular:1 qualityOfService:25];

      id v6 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v5) reason:16 xpcActivity:0];
      [v6 setSyncRequest:v5];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
      id v13 = 0;
      char v8 = [WeakRetained scheduleSyncForAllProfilesViaGatedXPCActivity:1 context:v6 reason:@"Tinker data upload requested notification" error:&v13];
      id v9 = v13;

      _HKInitializeLogging();
      double v10 = *MEMORY[0x1E4F29FA8];
      __int16 v11 = *MEMORY[0x1E4F29FA8];
      if (v8)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          objc_super v15 = self;
          _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Tinker data upload requested notification", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        objc_super v15 = self;
        __int16 v16 = 2114;
        id v17 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Tinker data upload requested notification %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v12 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v15 = self;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data upload request on ineligible device.", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldTriggerDownload
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = CFAbsoluteTimeGetCurrent() - self->_lock_lastTinkerDataDownloadTriggerTime;
  if (v4 <= 1800.0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543874;
      char v8 = self;
      __int16 v9 = 2048;
      double v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = 0x409C200000000000;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data download request; time since last request %lf is less than threshold %lf",
        (uint8_t *)&v7,
        0x20u);
    }
  }
  else
  {
    self->_lock_lastTinkerDataDownloadTriggerTime = CFAbsoluteTimeGetCurrent();
  }
  os_unfair_lock_unlock(p_lock);
  return v4 > 1800.0;
}

- (void)_queue_handleIncomingDataDownloadAvailableNotificationOnTinkerDevices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(_HKBehavior *)self->_behavior tinkerModeEnabled])
  {
    if ([(HDCloudSyncSubscriptionNotificationHandler *)self _shouldTriggerDownload])
    {
      id v3 = objc_alloc(MEMORY[0x1E4F2AD68]);
      double v4 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:0 pull:1 lite:0];
      id v5 = (void *)[v3 initWithChangesSyncRequest:v4 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:0 summarySharingSyncRequest:0 allowCellular:1 qualityOfService:25];

      id v6 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v5) reason:17 xpcActivity:0];
      [v6 setSyncRequest:v5];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
      id v13 = 0;
      char v8 = [WeakRetained scheduleSyncForAllProfilesViaGatedXPCActivity:1 context:v6 reason:@"Guardian data available for download notification" error:&v13];
      id v9 = v13;

      if ((v8 & 1) == 0)
      {
        _HKInitializeLogging();
        double v10 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          objc_super v15 = self;
          __int16 v16 = 2114;
          id v17 = v9;
          _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Guardian data available for download notification %{public}@", buf, 0x16u);
        }
      }
      _HKInitializeLogging();
      __int16 v11 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        objc_super v15 = self;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Guardian data available for download notification", buf, 0xCu);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v12 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v15 = self;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data download request on ineligible device.", buf, 0xCu);
    }
  }
}

- (void)_queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(_HKBehavior *)self->_behavior tinkerModeEnabled])
  {
    _HKInitializeLogging();
    id v3 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring data download on ineligible device.", buf, 0xCu);
    }
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F2AD68]);
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:0 pull:1 lite:0];
    id v6 = (void *)[v4 initWithChangesSyncRequest:v5 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:0 summarySharingSyncRequest:0 allowCellular:1 qualityOfService:25];

    id v7 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v6) reason:17 xpcActivity:0];
    [v7 setSyncRequest:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
    id v9 = [WeakRetained syncStatusProvider];
    [v9 setDataUploadRequestStatus:3 profileType:3];

    id v10 = objc_loadWeakRetained((id *)&self->_coordinator);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __117__HDCloudSyncSubscriptionNotificationHandler__queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices__block_invoke;
    v11[3] = &unk_1E62F2978;
    void v11[4] = self;
    [v10 syncAllProfilesViaGatedXPCActivity:0 context:v7 reason:@"Tinker data available for download notification" completion:v11];
  }
}

void __117__HDCloudSyncSubscriptionNotificationHandler__queue_handleIncomingDataDownloadAvailableNotificationOnGuardianDevices__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  id v7 = *MEMORY[0x1E4F29FA8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully completed sync for Tinker data available for download notification", (uint8_t *)&v14, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v10 = [WeakRetained syncStatusProvider];
    __int16 v11 = v10;
    uint64_t v12 = 4;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Error syncing Tinker data available for download notification %{public}@", (uint8_t *)&v14, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v10 = [WeakRetained syncStatusProvider];
    __int16 v11 = v10;
    uint64_t v12 = 5;
  }
  [v10 setDataUploadRequestStatus:v12 profileType:3];
}

- (void)_queue_handleIncomingPrimaryMedicalIDDataAvailableForDownloadNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc(MEMORY[0x1E4F2AD68]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F2B198]);
  id v5 = (void *)[v3 initWithChangesSyncRequest:0 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:v4 summarySharingSyncRequest:0 allowCellular:1 qualityOfService:25];

  id v6 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v5) reason:23 xpcActivity:0];
  [v6 setSyncRequest:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v12 = 0;
  char v8 = [WeakRetained scheduleSyncForAllProfilesViaGatedXPCActivity:1 context:v6 reason:@"Medical ID on data available notification" error:&v12];
  id v9 = v12;

  _HKInitializeLogging();
  id v10 = *MEMORY[0x1E4F29FA8];
  __int16 v11 = *MEMORY[0x1E4F29FA8];
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v14 = self;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Medical ID on data available notification", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    int v14 = self;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Medical ID on data available notification %{public}@", buf, 0x16u);
  }
}

- (void)_queue_handleIncomingTinkerMedicalIDDataAvailableForDownloadNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc(MEMORY[0x1E4F2AD68]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F2B198]);
  id v5 = (void *)[v3 initWithChangesSyncRequest:0 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:v4 summarySharingSyncRequest:0 allowCellular:1 qualityOfService:25];

  id v6 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v5) reason:23 xpcActivity:0];
  [v6 setSyncRequest:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v12 = 0;
  char v8 = [WeakRetained scheduleSyncForAllProfilesViaGatedXPCActivity:1 context:v6 reason:@"Tinker Medical ID on data available notification" error:&v12];
  id v9 = v12;

  _HKInitializeLogging();
  id v10 = *MEMORY[0x1E4F29FA8];
  __int16 v11 = *MEMORY[0x1E4F29FA8];
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v14 = self;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Tinker Medical ID on data available notification", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    int v14 = self;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Tinker Medical ID on data available notification %{public}@", buf, 0x16u);
  }
}

- (void)_queue_handleIncomingSharedSummaryDataAvailableForDownloadNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc(MEMORY[0x1E4F2AD68]);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F2B5E8]) initWithPush:0 pull:1];
  id v5 = (void *)[v3 initWithChangesSyncRequest:0 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:0 summarySharingSyncRequest:v4 allowCellular:1 qualityOfService:25];

  id v6 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v5) reason:25 xpcActivity:0];
  [v6 setSyncRequest:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v12 = 0;
  char v8 = [WeakRetained scheduleSyncForAllProfilesViaGatedXPCActivity:1 context:v6 reason:@"Summary sharing data available notification" error:&v12];
  id v9 = v12;

  _HKInitializeLogging();
  id v10 = *MEMORY[0x1E4F29FA8];
  __int16 v11 = *MEMORY[0x1E4F29FA8];
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v14 = self;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for Summary sharing data available notification", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    int v14 = self;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for Summary sharing data available notification %{public}@", buf, 0x16u);
  }
}

- (void)_queue_handleMedicationsStateUpdatedNotification
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  id v4 = [WeakRetained stateSyncDomainForSubscriptionIdentifier];
  id v5 = [v4 objectForKeyedSubscript:HDCloudSyncMedicationsStateChangedSubscriptionIdentifier];

  id v6 = objc_loadWeakRetained((id *)&self->_coordinator);
  id v7 = [v6 daemon];
  char v8 = [v7 analyticsSubmissionCoordinator];
  objc_msgSend(v8, "stateSync_subscriptionTriggeredDomain:", v5);

  id v9 = objc_alloc(MEMORY[0x1E4F2AD68]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F2B5A0]);
  __int16 v11 = (void *)[v9 initWithChangesSyncRequest:0 contextSyncRequest:0 stateSyncRequest:v10 medicalIDSyncRequest:0 summarySharingSyncRequest:0 allowCellular:1 qualityOfService:25];

  id v12 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v11) reason:29 xpcActivity:0];
  [v12 setSyncRequest:v11];
  id v13 = objc_loadWeakRetained((id *)&self->_coordinator);
  id v18 = 0;
  char v14 = [v13 scheduleSyncForAllProfilesViaGatedXPCActivity:1 context:v12 reason:@"Medications subscription notification" error:&v18];
  id v15 = v18;

  _HKInitializeLogging();
  id v16 = *MEMORY[0x1E4F29FA8];
  uint64_t v17 = *MEMORY[0x1E4F29FA8];
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully triggered sync for medications on receiving subscription notification", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    __int16 v21 = 2114;
    id v22 = v15;
    _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error triggering sync for medications on receiving subscription notification %{public}@", buf, 0x16u);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  char v8 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2048;
    id v12 = v6;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "Subscription notification registration complete or updated with public token \"%@\" on connection %p", (uint8_t *)&v9, 0x16u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  char v14 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    int v15 = 138413058;
    id v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v13;
    __int16 v21 = 2048;
    id v22 = v10;
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "Received per-topic push token \"%@\" for topic \"%{public}@\" identifier \"%@\" on connection %p", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = [v5 userInfo];
  id v7 = [MEMORY[0x1E4F1A1D0] notificationFromRemoteNotificationDictionary:v6];
  _HKInitializeLogging();
  char v8 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    id v10 = [v5 topic];
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    char v14 = v7;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "APS push recieved: %@ %@ (#t0)", (uint8_t *)&v11, 0x16u);
  }
  [(HDCloudSyncSubscriptionNotificationHandler *)self _queue_handleIncomingCloudKitPushNotification:v7];
}

- (void)triggerSubscription:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HDCloudSyncSubscriptionNotificationHandler_triggerSubscription___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __66__HDCloudSyncSubscriptionNotificationHandler_triggerSubscription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleSubscriptionWithID:", *(void *)(a1 + 40));
}

- (void)resetSubscriptionSyncBackoff
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_lastTinkerDataDownloadTriggerTime = 0.0;
  self->_lock_lastTinkerDataUploadTriggerTime = 0.0;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_behavior, 0);

  objc_destroyWeak((id *)&self->_coordinator);
}

@end