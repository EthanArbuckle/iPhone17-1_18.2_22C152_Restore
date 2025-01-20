@interface DNDSLegacyAssertionSyncManager
+ (void)cleanupState;
- (BOOL)_queue_updateCompanionToggleSyncForGizmoUpdateDate:(id)a3 modeAssertionUpdateContext:(id)a4;
- (DNDSAssertionSyncManagerDelegate)delegate;
- (DNDSLegacyAssertionSyncManager)initWithClientDetailsProvider:(id)a3 pairedDevice:(id)a4;
- (DNDSLegacyAssertionSyncManagerDataSource)dataSource;
- (id)_queue_gizmoUpdateDate;
- (void)_beginMonitoringForChanges;
- (void)_endMonitoringForChanges;
- (void)_queue_gizmoUpdateDate;
- (void)_queue_updateCompanionAssertionMirroringForState:(id)a3;
- (void)_queue_updateGizmoAssertionSyncWithModeAssertionUpdateContext:(id)a3;
- (void)_queue_updateGizmoToggleSyncForState:(id)a3 companionUpdateDate:(id)a4 reason:(unint64_t)a5;
- (void)_queue_updateToggleSyncForReason:(unint64_t)a3;
- (void)_updateForReason:(unint64_t)a3;
- (void)_updateGizmoAssertionSync;
- (void)dealloc;
- (void)resume;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateForStateUpdate:(id)a3;
@end

@implementation DNDSLegacyAssertionSyncManager

+ (void)cleanupState
{
  v2 = DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up state", v5, 2u);
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.nano"];
  [v3 removeObjectForKey:@"dndState"];
  [v3 removeObjectForKey:@"dndStateDate"];
  [v3 removeObjectForKey:@"dndCompanionAssertActive"];
  [v3 removeObjectForKey:@"dndGizmoAssertActive"];
  id v4 = (id)[v3 synchronize];
}

- (DNDSLegacyAssertionSyncManager)initWithClientDetailsProvider:(id)a3 pairedDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DNDSLegacyAssertionSyncManager;
  v9 = [(DNDSLegacyAssertionSyncManager *)&v21 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.donotdisturb.server.LegacyAssertionSyncManager", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    v13 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    npsManager = v9->_npsManager;
    v9->_npsManager = v13;

    id v15 = objc_alloc(MEMORY[0x1E4F79CD8]);
    v16 = [v8 pairingIdentifier];
    v17 = [v8 pairingDataStore];
    uint64_t v18 = [v15 initWithDomain:@"com.apple.nano" pairingID:v16 pairingDataStore:v17];
    accessor = v9->_accessor;
    v9->_accessor = (NPSDomainAccessor *)v18;

    objc_storeStrong((id *)&v9->_clientDetailsProvider, a3);
  }

  return v9;
}

- (void)dealloc
{
  [(DNDSLegacyAssertionSyncManager *)self _endMonitoringForChanges];
  v3.receiver = self;
  v3.super_class = (Class)DNDSLegacyAssertionSyncManager;
  [(DNDSLegacyAssertionSyncManager *)&v3 dealloc];
}

- (void)resume
{
  [(DNDSLegacyAssertionSyncManager *)self _beginMonitoringForChanges];
  [(DNDSLegacyAssertionSyncManager *)self _updateForReason:0];
}

- (void)updateForStateUpdate:(id)a3
{
  uint64_t v4 = [a3 reason];
  [(DNDSLegacyAssertionSyncManager *)self _updateForReason:v4];
}

- (void)_updateForReason:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__DNDSLegacyAssertionSyncManager__updateForReason___block_invoke;
  v4[3] = &unk_1E6973678;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __51__DNDSLegacyAssertionSyncManager__updateForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateToggleSyncForReason:", *(void *)(a1 + 40));
}

- (void)_updateGizmoAssertionSync
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__DNDSLegacyAssertionSyncManager__updateGizmoAssertionSync__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __59__DNDSLegacyAssertionSyncManager__updateGizmoAssertionSync__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __59__DNDSLegacyAssertionSyncManager__updateGizmoAssertionSync__block_invoke_2;
  id v7 = &unk_1E6974368;
  uint64_t v8 = v3;
  objc_msgSend(v2, "syncManager:performModeAssertionUpdatesWithHandler:");
}

uint64_t __59__DNDSLegacyAssertionSyncManager__updateGizmoAssertionSync__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)_beginMonitoringForChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)DNDSyncStateChanged, @"DNDStateChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)DNDAssertionStateChanged, @"DNDAssertStateChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_endMonitoringForChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"DNDStateChangedNotification", 0);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"DNDAssertStateChangedNotification", 0);
}

- (void)_queue_updateToggleSyncForReason:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
  v6 = [(DNDSLegacyAssertionSyncManager *)self delegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__DNDSLegacyAssertionSyncManager__queue_updateToggleSyncForReason___block_invoke;
  v7[3] = &unk_1E6974390;
  v7[4] = self;
  v7[5] = a3;
  [v6 syncManager:self performModeAssertionUpdatesWithHandler:v7];
}

uint64_t __67__DNDSLegacyAssertionSyncManager__queue_updateToggleSyncForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v4 currentStateForLegacyAssertionSyncManager:*(void *)(a1 + 32)];

  v23 = v3;
  v6 = [v3 store];
  id v7 = [v6 lastUpdateDate];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v5 activeModeAssertionMetadata];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      v13 = v7;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = [*(id *)(*((void *)&v24 + 1) + 8 * v12) activeDateInterval];
        id v15 = [v14 startDate];
        id v7 = [v13 laterDate:v15];

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v10);
  }

  v16 = objc_msgSend(*(id *)(a1 + 32), "_queue_gizmoUpdateDate");
  v17 = (void *)DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = v17;
    v19 = DNDStateUpdateReasonToString();
    *(_DWORD *)buf = 138543874;
    v29 = v7;
    __int16 v30 = 2114;
    v31 = v16;
    __int16 v32 = 2114;
    v33 = v19;
    _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Update toggle sync: companionUpdateDate=%{public}@, gizmoUpdateDate=%{public}@, reason=%{public}@", buf, 0x20u);
  }
  unint64_t v20 = [v7 compare:v16];
  if (v20 < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateGizmoToggleSyncForState:companionUpdateDate:reason:", v5, v7, *(void *)(a1 + 40));
LABEL_14:
    uint64_t v21 = 0;
    goto LABEL_15;
  }
  if (v20 != -1) {
    goto LABEL_14;
  }
  uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "_queue_updateCompanionToggleSyncForGizmoUpdateDate:modeAssertionUpdateContext:", v16, v23);
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateCompanionAssertionMirroringForState:", v5);

  return v21;
}

- (id)_queue_gizmoUpdateDate
{
  char v12 = 0;
  [(NPSDomainAccessor *)self->_accessor doubleForKey:@"dndStateDate" keyExistsAndHasValidFormat:&v12];
  v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  if (!v12)
  {
    id v3 = DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_ERROR)) {
      -[DNDSLegacyAssertionSyncManager _queue_gizmoUpdateDate](v3);
    }
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];

    v2 = (void *)v4;
  }
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
  if ([v2 compare:v5] != -1)
  {
    v6 = DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_ERROR)) {
      [(DNDSLegacyAssertionSyncManager *)(uint64_t)v2 _queue_gizmoUpdateDate];
    }
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];

    v2 = (void *)v7;
  }
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  if ([v2 compare:v8] != -1)
  {
    uint64_t v9 = DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_ERROR)) {
      [(DNDSLegacyAssertionSyncManager *)(uint64_t)v2 _queue_gizmoUpdateDate];
    }
    id v10 = v8;

    v2 = v10;
  }

  return v2;
}

- (void)_queue_updateGizmoToggleSyncForState:(id)a3 companionUpdateDate:(id)a4 reason:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a5 == 1)
  {
    int v10 = [(NPSDomainAccessor *)self->_accessor BOOLForKey:@"dndState"];
    uint64_t v11 = [v8 activeModeAssertionMetadata];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __98__DNDSLegacyAssertionSyncManager__queue_updateGizmoToggleSyncForState_companionUpdateDate_reason___block_invoke;
    v22[3] = &unk_1E69743B8;
    v22[4] = self;
    uint64_t v12 = objc_msgSend(v11, "bs_containsObjectPassingTest:", v22);

    v13 = (void *)DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      id v15 = DNDStateUpdateReasonToString();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)long long v24 = v12;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = v10;
      __int16 v25 = 2114;
      long long v26 = v15;
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Will update toggle sync state to reflect current companion state, companionToggleDNDActive=%{BOOL}d, gizmoDNDActive=%{BOOL}d, reason=%{public}@", buf, 0x18u);
    }
    [(NPSDomainAccessor *)self->_accessor setBool:v12 forKey:@"dndState"];
    accessor = self->_accessor;
    [v9 timeIntervalSinceReferenceDate];
    -[NPSDomainAccessor setDouble:forKey:](accessor, "setDouble:forKey:", @"dndStateDate");
    id v17 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"dndState", @"dndStateDate", 0);
    [(NPSManager *)self->_npsManager synchronizeNanoDomain:@"com.apple.nano" keys:v18];
  }
  else
  {
    v19 = (void *)DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = v19;
      uint64_t v21 = DNDStateUpdateReasonToString();
      *(_DWORD *)buf = 138543362;
      *(void *)long long v24 = v21;
      _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring update to toggle for reason %{public}@ as it was not user initiated", buf, 0xCu);
    }
  }
}

uint64_t __98__DNDSLegacyAssertionSyncManager__queue_updateGizmoToggleSyncForState_companionUpdateDate_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 lifetimeType];
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  v6 = [v3 clientIdentifier];
  uint64_t v7 = [v5 clientDetailsForIdentifier:v6];

  if (v4 == 4)
  {
    if ([v7 isSyncSuppressedClient])
    {
      id v8 = [v3 clientIdentifier];
      uint64_t v9 = [v8 isEqualToString:@"com.apple.donotdisturb.private.schedule"];
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_queue_updateCompanionToggleSyncForGizmoUpdateDate:(id)a3 modeAssertionUpdateContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v7 = [(NPSDomainAccessor *)self->_accessor BOOLForKey:@"dndState"];
  id v8 = DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v32 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Gizmo has toggled DND, will mirror locally: gizmoDNDActive=%{BOOL}d", buf, 8u);
  }
  __int16 v30 = @"com.donotdisturb.server.sync.legacy";
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v30, 1, v28);
  int v10 = [MEMORY[0x1E4F5F600] predicateForModeAssertionsWithClientIdentifiers:v9];
  uint64_t v11 = [v6 modeAssertionsMatchingPredicate:v10];
  uint64_t v12 = [v11 firstObject];

  if (v12) {
    int v13 = 0;
  }
  else {
    int v13 = v7;
  }
  if ((v13 & 1) != 0 || v7 != 1)
  {
    v16 = [(DNDSLegacyAssertionSyncManager *)self dataSource];
    id v17 = [v16 currentlyActivePairedDeviceForSyncManager:self];

    id v18 = objc_alloc(MEMORY[0x1E4F5F650]);
    v19 = [v17 deviceIdentifier];
    unint64_t v20 = (void *)[v18 initWithClientIdentifier:@"com.donotdisturb.server.sync.legacy" deviceIdentifier:v19];

    if (v13)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F5F700]);
      [v21 setIdentifier:@"com.apple.donotdisturb.sync.legacy.toggle-assertion"];
      v22 = [MEMORY[0x1E4F5F638] lifetimeUntilEndOfScheduleWithIdentifier:*MEMORY[0x1E4F5F520]];
      [v21 setLifetime:v22];

      [v21 setReason:1];
      v23 = [v6 takeAssertionWithDetails:v21 source:v20 startDate:v29];
      long long v24 = [v23 assertions];
      BOOL v15 = [v24 count] != 0;
    }
    else
    {
      if (v7)
      {
        BOOL v15 = 0;
LABEL_18:

        goto LABEL_19;
      }
      __int16 v25 = DNDSLogLegacyAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v25, OS_LOG_TYPE_DEFAULT, "Gizmo has invalidated its DND assertion, will mirror locally", buf, 2u);
      }
      id v21 = +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion];
      v23 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v21 requestDate:v29 source:v20 reason:2];
      id v26 = (id)[v6 invalidateAssertionsForRequest:v23];
      BOOL v15 = 1;
    }

    goto LABEL_18;
  }
  v14 = DNDSLogLegacyAssertionSync;
  BOOL v15 = 0;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Did not update local state as it was not required", buf, 2u);
    BOOL v15 = 0;
  }
LABEL_19:

  return v15;
}

- (void)_queue_updateCompanionAssertionMirroringForState:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [v5 activeModeAssertionMetadata];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__DNDSLegacyAssertionSyncManager__queue_updateCompanionAssertionMirroringForState___block_invoke;
  v11[3] = &unk_1E69743B8;
  v11[4] = self;
  uint64_t v7 = objc_msgSend(v6, "bs_containsObjectPassingTest:", v11);

  if (v7 != [(NPSDomainAccessor *)self->_accessor BOOLForKey:@"dndCompanionAssertActive"])
  {
    id v8 = DNDSLogLegacyAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v7;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Companion assertion active changed, will update gizmo: value=%{BOOL}d", buf, 8u);
    }
    [(NPSDomainAccessor *)self->_accessor setBool:v7 forKey:@"dndCompanionAssertActive"];
    id v9 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
    int v10 = [MEMORY[0x1E4F1CAD0] setWithObject:@"dndCompanionAssertActive"];
    [(NPSManager *)self->_npsManager synchronizeNanoDomain:@"com.apple.nano" keys:v10];
  }
}

uint64_t __83__DNDSLegacyAssertionSyncManager__queue_updateCompanionAssertionMirroringForState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 lifetimeType];
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = [v3 clientIdentifier];

  uint64_t v7 = [v5 clientDetailsForIdentifier:v6];

  if (v4 == 4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [v7 isSyncSuppressedClient] ^ 1;
  }

  return v8;
}

- (void)_queue_updateGizmoAssertionSyncWithModeAssertionUpdateContext:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (id)[(NPSDomainAccessor *)self->_accessor synchronize];
  int v6 = [(NPSDomainAccessor *)self->_accessor BOOLForKey:@"dndGizmoAssertActive"];
  v26[0] = @"com.donotdisturb.server.sync.legacy.workout";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  uint64_t v8 = [MEMORY[0x1E4F5F600] predicateForModeAssertionsWithClientIdentifiers:v7];
  id v9 = [v4 modeAssertionsMatchingPredicate:v8];
  int v10 = [v9 firstObject];

  if (v10) {
    int v11 = 0;
  }
  else {
    int v11 = v6;
  }
  if (v10) {
    int v12 = v6;
  }
  else {
    int v12 = 1;
  }
  if ((v11 & 1) != 0 || !v12)
  {
    int v13 = [(DNDSLegacyAssertionSyncManager *)self dataSource];
    uint64_t v14 = [v13 currentlyActivePairedDeviceForSyncManager:self];

    id v15 = objc_alloc(MEMORY[0x1E4F5F650]);
    v16 = [v14 deviceIdentifier];
    id v17 = (void *)[v15 initWithClientIdentifier:@"com.donotdisturb.server.sync.legacy.workout" deviceIdentifier:v16];

    if (v11)
    {
      id v18 = DNDSLogLegacyAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v25 = 0;
        _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Gizmo has taken a DND assertion, will mirror locally", v25, 2u);
      }
      v19 = [MEMORY[0x1E4F5F620] detailsWithIdentifier:@"com.apple.donotdisturb.sync.legacy.mirror-assertion" modeIdentifier:@"com.apple.donotdisturb.mode.workout" lifetime:0 reason:1];
      unint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      id v21 = (id)[v4 takeAssertionWithDetails:v19 source:v17 startDate:v20];
    }
    else
    {
      if (v12)
      {
LABEL_18:

        goto LABEL_19;
      }
      v22 = DNDSLogLegacyAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v25 = 0;
        _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Gizmo has invalidated its DND assertion, will mirror locally", v25, 2u);
      }
      v19 = [MEMORY[0x1E4F1C9C8] date];
      unint64_t v20 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:v7];
      v23 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v20 requestDate:v19 source:v17 reason:2];
      id v24 = (id)[v4 invalidateAssertionsForRequest:v23];
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (DNDSLegacyAssertionSyncManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSLegacyAssertionSyncManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (DNDSAssertionSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSAssertionSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_gizmoUpdateDate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Gizmo date was not valid, will reset to distantPast", v1, 2u);
}

@end