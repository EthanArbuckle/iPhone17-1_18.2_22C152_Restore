@interface HDCloudSyncManager
+ (void)_containerIdentifiersWithEncryptionSupportEnabled:(BOOL)a3 accountManateeEnabled:(BOOL)a4 resultHandler:(id)a5;
- (BOOL)canPerformCloudSyncWithError:(id *)a3;
- (BOOL)isChild;
- (BOOL)persistRestoreCompletionDate:(id)a3 error:(id *)a4;
- (BOOL)setShareOwnerParticipant:(id)a3 error:(id *)a4;
- (BOOL)supportsRebase;
- (HDAssertion)preparedDatabaseAccessibilityAssertion;
- (HDAssertionManager)assertionManager;
- (HDCloudSyncContextSyncManager)contextSyncManager;
- (HDCloudSyncManager)initWithProfile:(id)a3;
- (HDCloudSyncOwnerIdentifierManager)ownerIdentifierManager;
- (HDCloudSyncSharedSummaryManager)sharedSummaryManager;
- (HDCloudSyncStatus)status;
- (HDProfile)profile;
- (HKProfileIdentifier)profileIdentifier;
- (OS_dispatch_queue)queue;
- (id)_containerWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5;
- (id)_errorForNilProfile;
- (id)assetDownloadStagingManagerWithAssertion:(id)a3;
- (id)disableAndDeleteAllSyncDataWithCompletion:(id)a3;
- (id)fetchDescriptionWithContext:(id)a3 completion:(id)a4;
- (id)fetchShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4;
- (id)fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4;
- (id)lastPushForwardProgressDate;
- (id)leaveSharesWithCompletion:(id)a3;
- (id)lookupParticipantWithIdentityLookUpInfo:(id)a3 completion:(id)a4;
- (id)prepareForSharingWithCompletion:(id)a3;
- (id)removeAllParticipantsForSharingType:(unint64_t)a3 completion:(id)a4;
- (id)removeParticipants:(id)a3 fromSharesWithCompletion:(id)a4;
- (id)resetWithContext:(id)a3 completion:(id)a4;
- (id)restoreCompletionDateWithError:(id *)a3;
- (id)setupSharingToAccountWithIdentityLookupInfo:(id)a3 requireExistingRelationship:(BOOL)a4 requireZoneDeviceMode:(id)a5 completion:(id)a6;
- (id)shareOwnerParticipantWithError:(id *)a3;
- (id)syncMedicalIDDataWithContext:(id)a3 completion:(id)a4;
- (id)syncSessionForSyncStore:(id)a3 reason:(id)a4 delegate:(id)a5 accessibilityAssertion:(id)a6 excludedStores:(id)a7 excludedSyncIdentities:(id)a8;
- (id)syncWithContext:(id)a3 completion:(id)a4;
- (id)unitTest_assertionInvalidatedHandler;
- (int64_t)bytesPerChangeRecordAssetThreshold;
- (int64_t)bytesPerChangeRecordAssetThresholdHardLimit;
- (uint64_t)_isValidOwnerParticipant:(uint64_t)a1;
- (void)_persistErrorRequiringUserAction:(uint64_t)a1;
- (void)_primaryContainerIdentifiersForCurrentAccountWithCompletion:(void *)a1;
- (void)_queue_considerStartingBackstopSyncForThreshold:(uint64_t)a1;
- (void)_queue_updateAccessibilityAssertion;
- (void)_scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery;
- (void)_subscribeToSubscriptions:(void *)a3 completion:;
- (void)_tinkerContainerIdentifiersWithCompletion:(void *)a1;
- (void)_workoutSamplesAssociated:(id)a3;
- (void)acceptShare:(id)a3 completion:(id)a4;
- (void)accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:(id)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)cloudSyncRepositoriesForClient:(id)a3 completion:(id)a4;
- (void)configureForShareSetupMetadata:(id)a3 acceptedShares:(id)a4 completion:(id)a5;
- (void)containerIdentifiersForCurrentAccountWithCompletion:(id)a3;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)didCompleteSuccessfulLitePushWithDate:(id)a3;
- (void)didCompleteSuccessfulPullOfUpdateWithDate:(id)a3;
- (void)didCompleteSuccessfulPullWithDate:(id)a3;
- (void)didCompleteSuccessfulPushWithDate:(id)a3;
- (void)fetchCloudKitAccountInfoWithCompletion:(id)a3;
- (void)fetchServerPreferredPushEnvironmentWithCompletion:(id)a3;
- (void)fetchSyncStatusWithCompletion:(id)a3;
- (void)prepareForPeriodicSync;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
- (void)requestDataUploadWithCompletion:(id)a3;
- (void)setUnitTest_assertionInvalidatedHandler:(id)a3;
- (void)subscribeToDataAvailableNotificationsWithCompletion:(id)a3;
- (void)subscribeToDataUploadRequestsWithCompletion:(id)a3;
- (void)syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)unitTest_setIsChild:(BOOL)a3;
- (void)unitTest_setSupportsRebase:(BOOL)a3;
- (void)updateDataUploadRequestStatus:(int64_t)a3;
- (void)updateErrorRequiringUserAction:(id)a3;
@end

@implementation HDCloudSyncManager

- (HDCloudSyncManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HDCloudSyncManager;
  v5 = [(HDCloudSyncManager *)&v33 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = HKCreateSerialUtilityDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = [v4 daemon];
    v10 = [v9 behavior];
    v6->_BOOL supportsRebase = [v10 isAppleWatch] ^ 1;

    BOOL supportsRebase = v6->_supportsRebase;
    if (supportsRebase) {
      BOOL supportsRebase = [v4 profileType] != 3;
    }
    v6->_BOOL supportsRebase = supportsRebase;
    v12 = [v4 daemon];
    v13 = [v12 behavior];
    if ([v13 isAppleWatch])
    {
      v14 = [v4 daemon];
      v15 = [v14 behavior];
      v6->_isChild = [v15 tinkerModeEnabled] ^ 1;
    }
    else
    {
      v6->_isChild = 0;
    }

    id v16 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    uint64_t v19 = [v16 initWithName:v18 loggingCategory:*MEMORY[0x1E4F29FA8]];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v19;

    v21 = [[HDCloudSyncOwnerIdentifierManager alloc] initWithCloudSyncManager:v6];
    ownerIdentifierManager = v6->_ownerIdentifierManager;
    v6->_ownerIdentifierManager = v21;

    v23 = [[HDCloudSyncSharedSummaryManager alloc] initWithProfile:v4];
    sharedSummaryManager = v6->_sharedSummaryManager;
    v6->_sharedSummaryManager = v23;

    v25 = [[HDCloudSyncContextSyncManager alloc] initWithProfile:v4];
    contextSyncManager = v6->_contextSyncManager;
    v6->_contextSyncManager = v25;

    v27 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v27;

    [(HDAssertionManager *)v6->_assertionManager addObserver:v6 forAssertionIdentifier:@"HDCloudSyncDownloadDirectoryAssertionIdentifier" queue:v6->_queue];
    v29 = [v4 directoryPath];
    uint64_t v30 = [v29 stringByAppendingPathComponent:@"InProgressCloudDownload"];
    inProgressDownloadDirectoryPath = v6->_inProgressDownloadDirectoryPath;
    v6->_inProgressDownloadDirectoryPath = (NSString *)v30;

    v6->_inProgressDownloadDirectoryLock._os_unfair_lock_opaque = 0;
    [v4 registerProfileReadyObserver:v6 queue:v6->_queue];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  [v3 invalidate];

  observers = self->_observers;
  self->_observers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained daemon];
  uint64_t v7 = [v6 analyticsSubmissionCoordinator];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncManager;
  [(HDCloudSyncManager *)&v8 dealloc];
}

- (void)_workoutSamplesAssociated:(id)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HDCloudSyncManager__workoutSamplesAssociated___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__HDCloudSyncManager__workoutSamplesAssociated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  v2 = [WeakRetained cloudSyncManager];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AD68]) initWithChangesSyncRequest:*(void *)(a1 + 40)];
  [v2 syncWithRequest:v3 reason:@"Workout samples associated" completion:&__block_literal_global_116];
}

void __48__HDCloudSyncManager__workoutSamplesAssociated___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      uint64_t v7 = [v4 localizedDescription];
      int v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to cloud sync after workout samples associated: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (int64_t)bytesPerChangeRecordAssetThreshold
{
  return +[HDCloudSyncChangeRecord bytesPerChangeRecordAssetThreshold];
}

- (int64_t)bytesPerChangeRecordAssetThresholdHardLimit
{
  return +[HDCloudSyncChangeRecord bytesPerChangeRecordAssetThresholdHardLimit];
}

- (HDCloudSyncStatus)status
{
  v3 = objc_alloc_init(HDCloudSyncStatus);
  os_unfair_lock_lock(&self->_lock);
  [(HDCloudSyncStatus *)v3 setLastSuccessfulPullDate:self->_lock_lastSuccessfulPullDate];
  [(HDCloudSyncStatus *)v3 setLastSuccessfulPushDate:self->_lock_lastSuccessfulPushDate];
  [(HDCloudSyncStatus *)v3 setLastSuccessfulLitePushDate:self->_lock_lastSuccessfulLitePushDate];
  os_unfair_lock_unlock(&self->_lock);

  return v3;
}

- (id)lastPushForwardProgressDate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = HDCloudSyncKeyValueDomainWithProfile(WeakRetained);

  id v10 = 0;
  id v4 = [v3 dateForKey:@"HDCloudSyncPrimaryLastPushForwardProgressDate" error:&v10];
  id v5 = v10;
  id v6 = v5;
  if (v4 || !v5)
  {
    id v8 = v4;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = @"HDCloudSyncPrimaryLastPushForwardProgressDate";
      __int16 v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Unable to determine value for %{public}@: %{public}@.", buf, 0x16u);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)didCompleteSuccessfulPullWithDate:(id)a3
{
  id v5 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_lastSuccessfulPullDate = self->_lock_lastSuccessfulPullDate;
  if (lock_lastSuccessfulPullDate == v5
    || v5 && [(NSDate *)lock_lastSuccessfulPullDate isEqual:v5])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_lastSuccessfulPullDate, a3);
    os_unfair_lock_unlock(&self->_lock);
    observers = self->_observers;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__HDCloudSyncManager_didCompleteSuccessfulPullWithDate___block_invoke;
    v8[3] = &unk_1E6301E50;
    v8[4] = self;
    v9 = v5;
    [(HKObserverSet *)observers notifyObservers:v8];
  }
}

uint64_t __56__HDCloudSyncManager_didCompleteSuccessfulPullWithDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cloudSyncManager:*(void *)(a1 + 32) didUpdateLastPullDate:*(void *)(a1 + 40)];
}

- (void)didCompleteSuccessfulPullOfUpdateWithDate:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HDCloudSyncManager_didCompleteSuccessfulPullOfUpdateWithDate___block_invoke;
  v7[3] = &unk_1E6301E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

uint64_t __64__HDCloudSyncManager_didCompleteSuccessfulPullOfUpdateWithDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cloudSyncManager:*(void *)(a1 + 32) didUpdateLastPulledUpdateDate:*(void *)(a1 + 40)];
}

- (void)didCompleteSuccessfulPushWithDate:(id)a3
{
  id v5 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_lastSuccessfulPushDate = self->_lock_lastSuccessfulPushDate;
  if (lock_lastSuccessfulPushDate == v5
    || v5 && [(NSDate *)lock_lastSuccessfulPushDate isEqual:v5])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_lastSuccessfulPushDate, a3);
    os_unfair_lock_unlock(&self->_lock);
    observers = self->_observers;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__HDCloudSyncManager_didCompleteSuccessfulPushWithDate___block_invoke;
    v8[3] = &unk_1E6301E50;
    v8[4] = self;
    v9 = v5;
    [(HKObserverSet *)observers notifyObservers:v8];
  }
}

uint64_t __56__HDCloudSyncManager_didCompleteSuccessfulPushWithDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cloudSyncManager:*(void *)(a1 + 32) didUpdateLastPushDate:*(void *)(a1 + 40)];
}

- (void)didCompleteSuccessfulLitePushWithDate:(id)a3
{
  id v5 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_lastSuccessfulLitePushDate = self->_lock_lastSuccessfulLitePushDate;
  if (lock_lastSuccessfulLitePushDate == v5
    || v5 && [(NSDate *)lock_lastSuccessfulLitePushDate isEqual:v5])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_lastSuccessfulLitePushDate, a3);
    os_unfair_lock_unlock(&self->_lock);
    observers = self->_observers;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__HDCloudSyncManager_didCompleteSuccessfulLitePushWithDate___block_invoke;
    v8[3] = &unk_1E6301E50;
    v8[4] = self;
    v9 = v5;
    [(HKObserverSet *)observers notifyObservers:v8];
  }
}

uint64_t __60__HDCloudSyncManager_didCompleteSuccessfulLitePushWithDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cloudSyncManager:*(void *)(a1 + 32) didUpdateLastLitePushDate:*(void *)(a1 + 40)];
}

- (id)assetDownloadStagingManagerWithAssertion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self)
  {
    [(HDAssertionManager *)self->_assertionManager takeAssertion:v4];
    os_unfair_lock_lock(&self->_inProgressDownloadDirectoryLock);
    id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_inProgressDownloadDirectoryPath isDirectory:1];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v17 = 0;
    char v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v8 = v17;
    if (v7)
    {
      os_unfair_lock_unlock(&self->_inProgressDownloadDirectoryLock);
      id v9 = v5;
      self = 0;
    }
    else
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = self;
        __int16 v20 = 2114;
        id v21 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Unable to create in progress download directory, %{public}@", buf, 0x16u);
      }
      os_unfair_lock_unlock(&self->_inProgressDownloadDirectoryLock);
      v11 = (HDCloudSyncManager *)v8;
      self = v11;
      if (v11) {
        v12 = v11;
      }

      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  __int16 v13 = self;
  if (v9)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F19E68]) initWithDirectory:v9];
    [v14 setFileProtectionType:*MEMORY[0x1E4F28348]];
    [v14 setKeepInflightFilesOpen:1];
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)_scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery
{
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__HDCloudSyncManager__scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery__block_invoke;
  v8[3] = &unk_1E62F3208;
  v8[4] = self;
  id v4 = +[HDMaintenanceOperation maintenanceOperationWithName:@"Reset Received Cloud Sync Anchors" queue:queue synchronousBlock:v8];
  id v5 = [(HDCloudSyncManager *)self profile];
  id v6 = [v5 daemon];
  char v7 = [v6 maintenanceWorkCoordinator];
  [v7 enqueueMaintenanceOperation:v4];
}

void __83__HDCloudSyncManager__scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (NSObject **)MEMORY[0x1E4F29F18];
  v3 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v4;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting reset of cloud sync anchors", buf, 0xCu);
  }
  id v5 = [*(id *)(a1 + 32) profile];
  id v6 = [v5 database];
  char v7 = +[HDDatabaseTransactionContext contextForWriting];
  id v23 = 0;
  char v8 = [v6 performTransactionWithContext:v7 error:&v23 block:&__block_literal_global_356_0 inaccessibilityHandler:0];
  id v9 = v23;

  _HKInitializeLogging();
  id v10 = *v2;
  v11 = *v2;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v12;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Reset of cloud sync anchors completed", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v20;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset sync anchors as requested after HFD rebuild step.", buf, 0xCu);
  }
  __int16 v13 = [MEMORY[0x1E4F1C9C8] date];
  v14 = [*(id *)(a1 + 32) profile];
  id v22 = v9;
  BOOL v15 = +[HDCloudSyncStoreEntity rebaseRequiredByDate:v13 intervals:0 profile:v14 error:&v22];
  id v16 = v22;

  _HKInitializeLogging();
  id v17 = *v2;
  v18 = *v2;
  if (v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v19;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Marked rebase required after HFD recovery.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v21;
    _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to request rebase after HFD recovery.", buf, 0xCu);
  }
}

BOOL __83__HDCloudSyncManager__scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery__block_invoke_353(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = +[HDSyncStoreEntity allSyncStoreEntitiesOfType:2 transaction:v4 error:a3];
  id v6 = v5;
  if (v5)
  {
    char v7 = objc_msgSend(v5, "hk_map:", &__block_literal_global_360_0);
    BOOL v8 = +[HDSyncAnchorEntity resetAllSyncAnchorsOfType:3 syncProvenances:v7 transaction:v4 error:a3];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __83__HDCloudSyncManager__scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 syncProvenance];

  return [v2 numberWithLongLong:v3];
}

- (void)addObserver:(id)a3 queue:(id)a4
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)canPerformCloudSyncWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained daemon];
  id v6 = [v5 cloudSyncCoordinator];
  LOBYTE(a3) = [v6 canPerformCloudSyncWithError:a3];

  return (char)a3;
}

- (void)prepareForPeriodicSync
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HDCloudSyncManager_prepareForPeriodicSync__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __44__HDCloudSyncManager_prepareForPeriodicSync__block_invoke(uint64_t a1)
{
}

- (void)_queue_updateAccessibilityAssertion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 120));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    uint64_t v3 = [WeakRetained database];
    id v10 = 0;
    id v4 = [v3 takeAccessibilityAssertionWithOwnerIdentifier:@"HDCloudSyncManager Sync Preparation" timeout:&v10 error:600.0];
    id v5 = v10;

    if (v4)
    {
      id v6 = [(id)a1 preparedDatabaseAccessibilityAssertion];
      BOOL v8 = v6;
      if (v6) {
        [v6 invalidate];
      }
      objc_setProperty_atomic((id)a1, v7, v4, 8);
    }
    else
    {
      _HKInitializeLogging();
      id v9 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v12 = a1;
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to take database accessibility assertion during sync preparation: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (id)syncSessionForSyncStore:(id)a3 reason:(id)a4 delegate:(id)a5 accessibilityAssertion:(id)a6 excludedStores:(id)a7 excludedSyncIdentities:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [(HDSyncSession *)[HDCloudSyncSession alloc] initWithSyncStore:v18 reason:v17 delegate:v16];

  [(HDSyncSession *)v19 setDatabaseAccessibilityAssertion:v15];
  [(HDCloudSyncSession *)v19 setExcludedSyncStores:v14];

  [(HDCloudSyncSession *)v19 setExcludedSyncIdentities:v13];

  return v19;
}

- (void)syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, id))a5;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Requested: %{public}@ Reason: %{public}@", buf, 0x20u);
  }
  id v12 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v8) reason:1 xpcActivity:0];
  [v12 setSyncRequest:v8];
  id v13 = [(HDCloudSyncManager *)self profile];
  id v14 = [v13 daemon];
  id v15 = [v14 cloudSyncCoordinator];
  id v18 = 0;
  uint64_t v16 = [v15 scheduleSyncForAllProfilesViaGatedXPCActivity:1 context:v12 reason:v9 error:&v18];
  id v17 = v18;

  v10[2](v10, v16, v17);
}

- (id)syncWithContext:(id)a3 completion:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if (!self)
  {

    id v14 = 0;
    goto LABEL_32;
  }
  id v10 = [(HDCloudSyncManager *)self profile];
  v11 = [v10 daemon];
  id v12 = [v11 behavior];
  char v13 = [v12 supportsPeriodicFullCloudSync];

  if (v13)
  {
LABEL_3:

    id v14 = 0;
LABEL_22:
    if (![(HDCloudSyncManager *)self supportsRebase])
    {
      uint64_t v33 = [v9 subContextByAddingOptions:320];

      id v9 = (void *)v33;
    }
    if ([v9 reason] == 1 && (objc_msgSend(v9, "options") & 8) == 0)
    {
      uint64_t v34 = [v9 subContextByAddingOptions:64];

      id v9 = (void *)v34;
    }
    observers = self->_observers;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __49__HDCloudSyncManager_syncWithContext_completion___block_invoke;
    v50[3] = &unk_1E6301E78;
    v50[4] = self;
    [(HKObserverSet *)observers notifyObservers:v50];
    v36 = [HDCloudSyncManagerSyncTask alloc];
    v37 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    v47 = __49__HDCloudSyncManager_syncWithContext_completion___block_invoke_2;
    v48 = &unk_1E6301EA0;
    id v49 = v7;
    v38 = [(HDCloudSyncManagerPipelineTask *)v36 initWithManager:self context:v9 accessibilityAssertion:v37 completion:&v45];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v40 = objc_msgSend(WeakRetained, "daemon", v45, v46, v47, v48);
    v41 = [v40 cloudSyncCoordinator];
    [v41 addManagerTask:v38];

    v42 = [(HDCloudSyncManagerTask *)v38 progress];

    goto LABEL_28;
  }
  id v15 = [v9 syncRequest];

  if (!v15)
  {
    id v29 = v9;
    if (([v29 options] & 0x80) != 0)
    {
      if (([v29 options] & 0x1000) == 0) {
        goto LABEL_14;
      }
      v27 = (void *)MEMORY[0x1E4F28C58];
      v28 = @"Sync options incorrectly setup, device cannot perform lite sync pull.";
    }
    else
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      v28 = @"Sync options incorrectly setup, device can only perform lite sync.";
    }
LABEL_17:
    objc_msgSend(v27, "hk_error:format:", 3, v28);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      id v30 = v32;
      char v31 = 0;
      __int16 v23 = v30;
      id v22 = v30;
    }
    else
    {
      id v30 = 0;
      __int16 v23 = 0;
      id v22 = 0;
      char v31 = 0;
    }
    goto LABEL_20;
  }
  uint64_t v16 = [v9 syncRequest];
  id v17 = [v16 changesSyncRequest];

  if (!v17) {
    goto LABEL_3;
  }
  id v18 = v9;
  uint64_t v19 = [v18 syncRequest];
  uint64_t v20 = [v19 changesSyncRequest];
  char v21 = [v20 lite];

  if ((v21 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E4F28C58];
    v28 = @"Sync request incorrectly setup, device can only perform lite sync.";
    goto LABEL_17;
  }
  id v22 = [v18 syncRequest];
  __int16 v23 = [v22 changesSyncRequest];
  if ([v23 lite])
  {
    id v24 = [v18 syncRequest];
    uint64_t v25 = [v24 changesSyncRequest];
    int v26 = [v25 pull];

    if (v26)
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      v28 = @"Sync request incorrectly setup, device cannot perform lite sync pull.";
      goto LABEL_17;
    }
LABEL_14:
    id v30 = 0;
    char v31 = 1;
    goto LABEL_21;
  }
  id v30 = 0;
  char v31 = 1;
LABEL_20:

LABEL_21:
  id v14 = v30;
  if (v31) {
    goto LABEL_22;
  }
LABEL_32:
  _HKInitializeLogging();
  v44 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v52 = self;
    __int16 v53 = 2114;
    v54 = v9;
    __int16 v55 = 2114;
    id v56 = v14;
    _os_log_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to validate cloud sync context %{public}@ with error %{public}@", buf, 0x20u);
  }
  (*((void (**)(id, void, id))v7 + 2))(v7, 0, v14);
  v42 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
LABEL_28:

  return v42;
}

void __49__HDCloudSyncManager_syncWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(*(void *)(a1 + 32) + 104);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained daemon];
  id v7 = [v6 cloudSyncCoordinator];
  id v10 = 0;
  uint64_t v8 = [v7 canPerformCloudSyncWithError:&v10];
  id v9 = v10;

  [v4 cloudSyncManager:*(void *)(a1 + 32) didUpdateSyncEnabled:v8];
}

uint64_t __49__HDCloudSyncManager_syncWithContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)resetWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HDCloudSyncManagerResetTask alloc];
  id v9 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__HDCloudSyncManager_resetWithContext_completion___block_invoke;
  v17[3] = &unk_1E6301EA0;
  id v18 = v6;
  id v10 = v6;
  v11 = [(HDCloudSyncManagerPipelineTask *)v8 initWithManager:self context:v7 accessibilityAssertion:v9 completion:v17];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  char v13 = [WeakRetained daemon];
  id v14 = [v13 cloudSyncCoordinator];
  [v14 addManagerTask:v11];

  id v15 = [(HDCloudSyncManagerTask *)v11 progress];

  return v15;
}

uint64_t __50__HDCloudSyncManager_resetWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchDescriptionWithContext:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  uint64_t v8 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    *(_DWORD *)buf = 138543874;
    __int16 v23 = self;
    __int16 v24 = 2114;
    id v25 = WeakRetained;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning description fetch for profile (%{public}@) %{public}@", buf, 0x20u);
  }
  v11 = [HDCloudSyncManagerShowTask alloc];
  id v12 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__HDCloudSyncManager_fetchDescriptionWithContext_completion___block_invoke;
  v20[3] = &unk_1E6301EC8;
  id v21 = v7;
  id v13 = v7;
  id v14 = [(HDCloudSyncManagerShowTask *)v11 initWithManager:self context:v6 accessibilityAssertion:v12 completion:v20];

  [(HDCloudSyncManagerRepositoryTask *)v14 setRunWhenSyncProhibited:1];
  id v15 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v16 = [v15 daemon];
  id v17 = [v16 cloudSyncCoordinator];
  [v17 addManagerTask:v14];

  id v18 = [(HDCloudSyncManagerTask *)v14 progress];

  return v18;
}

void __61__HDCloudSyncManager_fetchDescriptionWithContext_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a4;
  id v7 = [a2 repositoryDescriptions];
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v7, v6);
}

- (void)fetchSyncStatusWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  _HKInitializeLogging();
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F29FA8];
  id v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = self;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting fetch cloud sync status task", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v8 = [WeakRetained profileType];

  if (v8 != 3) {
    goto LABEL_6;
  }
  id v17 = 0;
  id v9 = [(HDCloudSyncManager *)self shareOwnerParticipantWithError:&v17];
  id v10 = (HDCloudSyncManagerStatusTask *)v17;
  if (v9)
  {

LABEL_6:
    id v10 = [[HDCloudSyncManagerStatusTask alloc] initWithManager:self completion:v4];
    [(HDCloudSyncManagerTask *)v10 startWithCompletion:&__block_literal_global_379];
    goto LABEL_7;
  }
  _HKInitializeLogging();
  os_log_t v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    id v15 = v11;
    uint64_t v16 = [(HDCloudSyncManager *)self profile];
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    id v21 = v16;
    _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Sync unavailable before setting a source share participant for profile %{public}@", buf, 0x16u);
  }
  id v12 = (void *)MEMORY[0x1E4F28C58];
  id v13 = [(HDCloudSyncManager *)self profile];
  id v14 = objc_msgSend(v12, "hk_error:format:", 729, @"Sync unavailable before setting a source share participant for profile: %@", v13);
  v4[2](v4, 0, v14);

LABEL_7:
}

- (void)fetchCloudKitAccountInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HDCloudSyncManager_fetchCloudKitAccountInfoWithCompletion___block_invoke;
  v6[3] = &unk_1E62FBAF0;
  id v7 = v4;
  id v5 = v4;
  [(HDCloudSyncManager *)self cloudSyncRepositoriesForClient:0 completion:v6];
}

void __61__HDCloudSyncManager_fetchCloudKitAccountInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 firstObject];
    id v6 = [v5 primaryCKContainer];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__HDCloudSyncManager_fetchCloudKitAccountInfoWithCompletion___block_invoke_2;
    v7[3] = &unk_1E6301EF0;
    id v9 = *(id *)(a1 + 32);
    id v8 = v4;
    [v6 fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __61__HDCloudSyncManager_fetchCloudKitAccountInfoWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v11 = a2;
  id v7 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F2AD18]);
    id v9 = [*(id *)(a1 + 32) firstObject];
    id v10 = objc_msgSend(v8, "initWithFullName:emailAddress:accountSettings:", v11, v7, objc_msgSend(v9, "repositorySettings"));

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)disableAndDeleteAllSyncDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HDCloudSyncContext alloc] initForPurpose:5 options:64 reason:6 xpcActivity:0];
  id v6 = [HDCloudSyncManagerDisableAndDeleteTask alloc];
  id v7 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HDCloudSyncManager_disableAndDeleteAllSyncDataWithCompletion___block_invoke;
  v15[3] = &unk_1E6301EA0;
  id v16 = v4;
  id v8 = v4;
  id v9 = [(HDCloudSyncManagerPipelineTask *)v6 initWithManager:self context:v5 accessibilityAssertion:v7 completion:v15];

  [(HDCloudSyncManagerRepositoryTask *)v9 setRunWhenSyncProhibited:1];
  [(HDCloudSyncManagerTask *)v9 setPriority:100];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained daemon];
  id v12 = [v11 cloudSyncCoordinator];
  [v12 addManagerTask:v9];

  id v13 = [(HDCloudSyncManagerTask *)v9 progress];

  return v13;
}

uint64_t __64__HDCloudSyncManager_disableAndDeleteAllSyncDataWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  id v5 = [(HDCloudSyncManager *)self _containerWithIdentifier:@"com.apple.health.sync" client:0 error:&v9];
  id v6 = v9;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__HDCloudSyncManager_accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion___block_invoke;
    v7[3] = &unk_1E6301F18;
    void v7[4] = self;
    id v8 = v4;
    [v5 accountInfoWithCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

void __86__HDCloudSyncManager_accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: accountInfo %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v5)
  {
    if ([v5 deviceToDeviceEncryptionAvailability]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = [v5 supportsDeviceToDeviceEncryption];
    }
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, v10, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
}

- (id)syncMedicalIDDataWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HDCloudSyncManagerMedicalIDSyncTask alloc];
  uint64_t v9 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__HDCloudSyncManager_syncMedicalIDDataWithContext_completion___block_invoke;
  v17[3] = &unk_1E6301EA0;
  id v18 = v6;
  id v10 = v6;
  int v11 = [(HDCloudSyncManagerPipelineTask *)v8 initWithManager:self context:v7 accessibilityAssertion:v9 completion:v17];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  __int16 v13 = [WeakRetained daemon];
  id v14 = [v13 cloudSyncCoordinator];
  [v14 addManagerTask:v11];

  uint64_t v15 = [(HDCloudSyncManagerTask *)v11 progress];

  return v15;
}

uint64_t __62__HDCloudSyncManager_syncMedicalIDDataWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cloudSyncRepositoriesForClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v9 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v19 = -[HDCloudSyncManager _errorForNilProfile](self);
    v7[2](v7, 0, v19);

    goto LABEL_15;
  }
  id v10 = WeakRetained;
  int v11 = v10;
  if (!self)
  {
    id v18 = 0;
    id v17 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = HDCloudSyncKeyValueDomainWithProfile(v10);
  id v29 = 0;
  __int16 v13 = [v12 stringForKey:@"HDCloudSyncCircleIdentifier" error:&v29];
  id v14 = v29;
  uint64_t v15 = v14;
  if (v13)
  {
    id v16 = v13;
  }
  else
  {
    if (v14)
    {
      id v18 = v14;
      id v17 = 0;
      goto LABEL_10;
    }
    uint64_t v21 = [v11 profileType];
    if ((unint64_t)(v21 - 1) >= 3)
    {
      if (v21 == 4)
      {
        uint64_t v22 = [v11 profileIdentifier];
        objc_msgSend(v22, "hd_syncCircleIdentifier");
        id v17 = (char *)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
      if (v21 != 100)
      {
        id v17 = sel__syncCircleIdentifierForProfile_error_;
        __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncCircleIdentifierForProfile_error_, self, @"HDCloudSyncManager.m", 734, @"Unhandled profile type %ld", objc_msgSend(v11, "profileType"));

        id v18 = 0;
        goto LABEL_10;
      }
    }
    id v16 = @"PrimarySyncCircle";
  }
  id v17 = (char *)v16;
LABEL_6:
  id v18 = 0;
LABEL_10:

LABEL_11:
  id v20 = v18;
  if (v17)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__HDCloudSyncManager_cloudSyncRepositoriesForClient_completion___block_invoke;
    v24[3] = &unk_1E6301F68;
    uint64_t v28 = v7;
    v24[4] = self;
    id v25 = v11;
    id v26 = v6;
    id v27 = v17;
    [(HDCloudSyncManager *)self containerIdentifiersForCurrentAccountWithCompletion:v24];
  }
  else
  {
    v7[2](v7, 0, v20);
  }

LABEL_15:
}

- (id)_errorForNilProfile
{
  if (a1)
  {
    a1 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"profile is nil");
    uint64_t v1 = vars8;
  }
  return a1;
}

void __64__HDCloudSyncManager_cloudSyncRepositoriesForClient_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v10;
      __int16 v32 = 2114;
      uint64_t v33 = v11;
      __int16 v34 = 2114;
      id v35 = v7;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Using primary cloud sync container identifier: %{public}@", buf, 0x20u);
    }
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 48);
    id v29 = 0;
    id v14 = [v12 _containerWithIdentifier:v7 client:v13 error:&v29];
    id v15 = v29;
    if (v14)
    {
      if (v8)
      {
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 48);
        id v28 = v15;
        id v18 = [v16 _containerWithIdentifier:v8 client:v17 error:&v28];
        id v19 = v28;

        if (!v18 && v19)
        {
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          id v15 = v19;
LABEL_14:

          goto LABEL_15;
        }
        id v15 = v19;
      }
      else
      {
        id v18 = 0;
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __64__HDCloudSyncManager_cloudSyncRepositoriesForClient_completion___block_invoke_407;
      v21[3] = &unk_1E6301F40;
      id v22 = *(id *)(a1 + 40);
      id v23 = *(id *)(a1 + 56);
      id v24 = v14;
      id v25 = v18;
      id v26 = *(id *)(a1 + 64);
      uint64_t v27 = a4;
      id v20 = v18;
      [v24 fetchUserRecordIDWithCompletionHandler:v21];

      goto LABEL_14;
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_14;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_15:
}

void __64__HDCloudSyncManager_cloudSyncRepositoriesForClient_completion___block_invoke_407(void *a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (HDIsUnitTesting())
  {
    id v7 = [HDCloudSyncRepository alloc];
    id v8 = v7;
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    uint64_t v11 = a1[6];
    if (a1[7])
    {
      v25[0] = a1[7];
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      uint64_t v13 = [(HDCloudSyncRepository *)v8 initWithProfile:v9 syncCircleIdentifier:v10 primaryCKContainer:v11 secondaryCKContainers:v12 userRecordName:@"TestUserRecordName"];
    }
    else
    {
      uint64_t v13 = [(HDCloudSyncRepository *)v7 initWithProfile:a1[4] syncCircleIdentifier:a1[5] primaryCKContainer:a1[6] secondaryCKContainers:MEMORY[0x1E4F1CBF0] userRecordName:@"TestUserRecordName"];
    }
LABEL_12:
    [(HDCloudSyncRepository *)v13 setRepositorySettings:a1[9]];
    uint64_t v21 = a1[8];
    id v23 = v13;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);

    goto LABEL_13;
  }
  if (v5)
  {
    id v14 = [HDCloudSyncRepository alloc];
    uint64_t v15 = a1[4];
    uint64_t v16 = a1[5];
    uint64_t v17 = a1[6];
    uint64_t v18 = a1[7];
    if (v18)
    {
      uint64_t v24 = a1[7];
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    }
    else
    {
      id v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v20 = [v5 recordName];
    uint64_t v13 = [(HDCloudSyncRepository *)v14 initWithProfile:v15 syncCircleIdentifier:v16 primaryCKContainer:v17 secondaryCKContainers:v19 userRecordName:v20];

    if (v18) {
    goto LABEL_12;
    }
  }
  (*(void (**)(void))(a1[8] + 16))();
LABEL_13:
}

+ (void)_containerIdentifiersWithEncryptionSupportEnabled:(BOOL)a3 accountManateeEnabled:(BOOL)a4 resultHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, __CFString *, __CFString *))a5;
  _HKInitializeLogging();
  id v8 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v6;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Setting container identifiers. CloudKitSupportsDeviceToDeviceEncryption=%{BOOL}d, CKDeviceToDeviceEncryptionStatusSupportedByAccount=%{BOOL}d", (uint8_t *)v11, 0xEu);
  }
  if (v6 || v5) {
    uint64_t v9 = @"com.apple.health.sync.secure";
  }
  else {
    uint64_t v9 = @"com.apple.health.sync";
  }
  if (v6 || v5) {
    uint64_t v10 = @"com.apple.health.sync";
  }
  else {
    uint64_t v10 = @"com.apple.health.sync.secure";
  }
  v7[2](v7, v9, v10);
}

- (id)_containerWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F19EC8] currentProcessCanUseCloudKit])
  {
    uint64_t v10 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:v8];
    uint64_t v11 = [v10 options];
    [v11 setUseZoneWidePCS:1];

    __int16 v12 = [v10 options];
    [v12 setApplicationBundleIdentifierOverride:*MEMORY[0x1E4F2BDC0]];

    if (v9)
    {
      BOOL v13 = [v9 process];
      uint64_t v14 = [v13 valueForEntitlement:*MEMORY[0x1E4F298F0]];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = [v10 options];
        [v15 setApplicationBundleIdentifierOverrideForNetworkAttribution:v14];
      }
      else
      {
        uint64_t v15 = [v9 process];
        uint64_t v16 = [v15 bundleIdentifier];
        uint64_t v17 = [v10 options];
        [v17 setApplicationBundleIdentifierOverrideForNetworkAttribution:v16];
      }
    }
    else
    {
      uint64_t v14 = [v10 options];
      [v14 setApplicationBundleIdentifierOverrideForNetworkAttribution:*MEMORY[0x1E4F2BE48]];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"%@: Process cannot use CloudKit", self);
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)containerIdentifiersForCurrentAccountWithCompletion:(id)a3
{
  id v17 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained profileType];
    switch(v6)
    {
      case 1:
        goto LABEL_8;
      case 2:
        id v7 = (void (**)(id, __CFString *, void, uint64_t, id))v17;
        if (self)
        {
          id v18 = 0;
          id v8 = [(HDCloudSyncManager *)self _containerWithIdentifier:@"com.apple.health.sync.secure" client:0 error:&v18];
          id v9 = v18;
          if (v8)
          {
            uint64_t v10 = @"com.apple.health.sync.secure";
            uint64_t v11 = 1;
            id v12 = 0;
          }
          else
          {
            uint64_t v10 = 0;
            uint64_t v11 = 0;
            id v12 = v9;
          }
          v7[2](v7, v10, 0, v11, v12);
        }
        break;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_10;
      default:
        if (v6 != 100) {
          break;
        }
LABEL_8:
        uint64_t v14 = objc_msgSend(v5, "daemon", v17);
        uint64_t v15 = [v14 behavior];
        int v16 = [v15 tinkerModeEnabled];

        if (v16) {
LABEL_9:
        }
          -[HDCloudSyncManager _tinkerContainerIdentifiersWithCompletion:](self, v17);
        else {
LABEL_10:
        }
          -[HDCloudSyncManager _primaryContainerIdentifiersForCurrentAccountWithCompletion:](self, v17);
        break;
    }
  }
  else
  {
    BOOL v13 = -[HDCloudSyncManager _errorForNilProfile](self);
    (*((void (**)(id, void, void, void, void *))v17 + 2))(v17, 0, 0, 0, v13);
  }
}

- (void)_tinkerContainerIdentifiersWithCompletion:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = @"com.apple.health.sync.secure";
    BOOL v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v6 = [v5 BOOLForKey:*MEMORY[0x1E4F299B0]];

    if (v6)
    {
      id v7 = @"com.apple.health.sync";

      uint64_t v8 = 0;
      id v4 = v7;
    }
    else
    {
      uint64_t v8 = 1;
    }
    id v14 = 0;
    id v9 = [a1 _containerWithIdentifier:v4 client:0 error:&v14];
    id v10 = v14;
    if (v9)
    {
      uint64_t v11 = v4;
      uint64_t v12 = v8;
      id v13 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      id v13 = v10;
    }
    v3[2](v3, v11, 0, v12, v13);
  }
}

- (void)_primaryContainerIdentifiersForCurrentAccountWithCompletion:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = 0;
    id v4 = [a1 _containerWithIdentifier:@"com.apple.health.sync" client:0 error:&v8];
    id v5 = v8;
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __82__HDCloudSyncManager__primaryContainerIdentifiersForCurrentAccountWithCompletion___block_invoke;
      v6[3] = &unk_1E6301F18;
      void v6[4] = a1;
      id v7 = v3;
      [v4 accountInfoWithCompletionHandler:v6];
    }
    else
    {
      (*((void (**)(id, void, void, void, id))v3 + 2))(v3, 0, 0, 0, v5);
    }
  }
}

void __82__HDCloudSyncManager__primaryContainerIdentifiersForCurrentAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (NSObject **)MEMORY[0x1E4F29FA8];
  id v8 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v9;
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: accountInfo %{public}@", buf, 0x16u);
  }
  if (v5)
  {
    id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v11 setObject:v10 forKey:@"HDCloudSyncAccountInfo"];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v12 = *v7;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Failed to archive CKAccountInfo", buf, 2u);
      }
    }
    uint64_t v13 = [v5 deviceToDeviceEncryptionAvailability] & 1;
    id v14 = objc_opt_class();
    uint64_t v15 = [v5 supportsDeviceToDeviceEncryption];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__HDCloudSyncManager__primaryContainerIdentifiersForCurrentAccountWithCompletion___block_invoke_425;
    v16[3] = &unk_1E6301F90;
    char v18 = v13;
    id v17 = *(id *)(a1 + 40);
    [v14 _containerIdentifiersWithEncryptionSupportEnabled:v15 accountManateeEnabled:v13 resultHandler:v16];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __82__HDCloudSyncManager__primaryContainerIdentifiersForCurrentAccountWithCompletion___block_invoke_425(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3, *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)updateErrorRequiringUserAction:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(a3, "hd_cloudKitErrorRequiringUserAction");
    if (v4)
    {
      id v10 = v4;
      if (!objc_msgSend(v4, "hk_isHealthKitErrorWithCode:", 706)) {
        goto LABEL_5;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      id v6 = [WeakRetained daemon];
      id v7 = [v6 cloudSyncCoordinator];
      id v8 = [v7 accountProvider];
      int v9 = [v8 isAccountInManateeUnavailableCFUState];

      id v4 = v10;
      if (v9)
      {
LABEL_5:
        -[HDCloudSyncManager _persistErrorRequiringUserAction:]((uint64_t)self, v10);
        id v4 = v10;
      }
    }
  }
  else
  {
    -[HDCloudSyncManager _persistErrorRequiringUserAction:]((uint64_t)self, 0);
  }
}

- (void)_persistErrorRequiringUserAction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    id v5 = [WeakRetained database];
    id v15 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__HDCloudSyncManager__persistErrorRequiringUserAction___block_invoke;
    v12[3] = &unk_1E62F5CB0;
    v12[4] = a1;
    id v6 = v3;
    id v13 = v6;
    id v14 = &v16;
    BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v5 error:&v15 block:v12];
    id v8 = v15;

    if (v7 && *((unsigned char *)v17 + 24))
    {
      int v9 = *(void **)(a1 + 88);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__HDCloudSyncManager__persistErrorRequiringUserAction___block_invoke_436;
      v10[3] = &unk_1E6301E50;
      v10[4] = a1;
      id v11 = v6;
      [v9 notifyObservers:v10];
    }
    _Block_object_dispose(&v16, 8);
  }
}

uint64_t __55__HDCloudSyncManager__persistErrorRequiringUserAction___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 104));
  id v6 = HDCloudSyncKeyValueDomainWithProfile(WeakRetained);

  id v21 = 0;
  BOOL v7 = [v6 dataForKey:@"HDCloudSyncKeyErrorRequiringUserAction" error:&v21];
  id v8 = v21;
  int v9 = v8;
  if (v7)
  {
LABEL_2:
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v10 = a1[5];
    if (v10)
    {
      id v20 = 0;
      id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v20];
      id v12 = v20;
      if (v12)
      {
        _HKInitializeLogging();
        id v13 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = a1[4];
          *(_DWORD *)buf = 138543618;
          uint64_t v23 = v18;
          __int16 v24 = 2114;
          id v25 = v12;
          _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive cloud sync error requiring user action: %{public}@", buf, 0x16u);
        }
        if (a3)
        {
          uint64_t v14 = 0;
          *a3 = v12;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v14 = 0;
        }
      }
      else
      {
        uint64_t v14 = [v6 setData:v11 forKey:@"HDCloudSyncKeyErrorRequiringUserAction" error:a3];
      }
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:@"HDCloudSyncKeyErrorRequiringUserAction"];
      uint64_t v14 = [v6 removeValuesForKeys:v16 error:a3];
    }
    goto LABEL_19;
  }
  if (!v8)
  {
    if (!a1[5])
    {
      uint64_t v14 = 1;
      goto LABEL_19;
    }
    goto LABEL_2;
  }
  _HKInitializeLogging();
  id v15 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = a1[4];
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v19;
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read cloud sync error requiring user action: %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    uint64_t v14 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v14 = 0;
  }
LABEL_19:

  return v14;
}

uint64_t __55__HDCloudSyncManager__persistErrorRequiringUserAction___block_invoke_436(uint64_t a1, void *a2)
{
  return [a2 cloudSyncManager:*(void *)(a1 + 32) didUpdateErrorRequiringUserAction:*(void *)(a1 + 40)];
}

- (BOOL)persistRestoreCompletionDate:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(HDCloudSyncManager *)self profile];
  id v8 = HDCloudSyncKeyValueDomainWithProfile(v7);

  int v9 = @"HKCloudSyncObserverRestoreCompletionDate";
  _HKInitializeLogging();
  uint64_t v10 = (NSObject **)MEMORY[0x1E4F29FA8];
  id v11 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = HKDiagnosticStringFromDate();
    *(_DWORD *)buf = 138543618;
    __int16 v24 = self;
    __int16 v25 = 2114;
    id v26 = v13;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "%{public}@: Set cloud sync restore completion date: %{public}@", buf, 0x16u);
  }
  id v22 = 0;
  char v14 = [v8 setDate:v6 forKey:v9 error:&v22];
  id v15 = v22;
  if (v14)
  {
    observers = self->_observers;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__HDCloudSyncManager_persistRestoreCompletionDate_error___block_invoke;
    v20[3] = &unk_1E6301E50;
    void v20[4] = self;
    id v21 = v6;
    [(HKObserverSet *)observers notifyObservers:v20];
  }
  else
  {
    _HKInitializeLogging();
    id v17 = *v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v24 = self;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record cloud sync restore completion date: %{public}@.", buf, 0x16u);
    }
    id v18 = v15;
    if (v18)
    {
      if (a4) {
        *a4 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v14;
}

uint64_t __57__HDCloudSyncManager_persistRestoreCompletionDate_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cloudSyncManager:*(void *)(a1 + 32) didUpdateRestoreCompletionDate:*(void *)(a1 + 40)];
}

- (id)restoreCompletionDateWithError:(id *)a3
{
  id v4 = [(HDCloudSyncManager *)self profile];
  id v5 = HDCloudSyncKeyValueDomainWithProfile(v4);

  id v6 = [v5 dateForKey:@"HKCloudSyncObserverRestoreCompletionDate" error:a3];

  return v6;
}

- (void)updateDataUploadRequestStatus:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_uploadRequestStatus = a3;
  if (a3 == 4)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    lock_lastDataUploadRequestCompletionDate = self->_lock_lastDataUploadRequestCompletionDate;
    self->_lock_lastDataUploadRequestCompletionDate = v8;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    lock_lastDataUploadRequestCompletionDate = self->_lock_lastDataUploadRequestStartDate;
    self->_lock_lastDataUploadRequestStartDate = v6;
LABEL_5:
  }
  int v9 = self->_lock_lastDataUploadRequestStartDate;
  uint64_t v10 = self->_lock_lastDataUploadRequestCompletionDate;
  observers = self->_observers;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__HDCloudSyncManager_updateDataUploadRequestStatus___block_invoke;
  v14[3] = &unk_1E6301FB8;
  v14[4] = self;
  id v15 = v9;
  uint64_t v16 = v10;
  int64_t v17 = a3;
  id v12 = v10;
  id v13 = v9;
  [(HKObserverSet *)observers notifyObservers:v14];
  os_unfair_lock_unlock(p_lock);
}

uint64_t __52__HDCloudSyncManager_updateDataUploadRequestStatus___block_invoke(void *a1, void *a2)
{
  return [a2 cloudSyncManager:a1[4] didUpdateDataUploadRequestStatus:a1[7] startDate:a1[5] endDate:a1[6]];
}

- (void)profileDidBecomeReady:(id)a3
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  [v6 addProtectedDataObserver:self queue:self->_queue];

  id v7 = objc_loadWeakRetained((id *)p_profile);
  id v8 = [v7 daemon];
  int v9 = [v8 analyticsSubmissionCoordinator];
  [v9 addObserver:self queue:self->_queue];

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__workoutSamplesAssociated_ name:@"HDHealthStoreServerDidAssociateWorkoutSamples" object:0];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    -[HDCloudSyncManager _queue_considerStartingBackstopSyncForThreshold:]((uint64_t)self, 345600.0);
  }
}

- (void)_queue_considerStartingBackstopSyncForThreshold:(uint64_t)a1
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 120));
    BOOL v4 = [(id)a1 profile];
    id v5 = [v4 daemon];
    id v6 = [v5 behavior];
    int v7 = [v6 supportsPeriodicFullCloudSync];

    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      int v9 = WeakRetained;
      if (!WeakRetained)
      {
LABEL_28:

        return;
      }
      id v10 = [WeakRetained daemon];
      id v11 = [v10 cloudSyncCoordinator];
      id v51 = 0;
      char v12 = [v11 canPerformCloudSyncWithError:&v51];
      id v13 = v51;

      if ((v12 & 1) == 0)
      {
        if (v13)
        {
          if ((objc_msgSend(v13, "hk_isHealthKitErrorWithCode:", 111) & 1) == 0)
          {
            _HKInitializeLogging();
            uint64_t v19 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v53 = a1;
              __int16 v54 = 2114;
              double v55 = *(double *)&v13;
              _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to check sync enablement status during backstop consideration: %{public}@", buf, 0x16u);
            }
          }
        }
        if (!_HDIsUnitTesting) {
          goto LABEL_27;
        }
        char v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v14 postNotificationName:@"HDBackstopSyncRefusedNotification" object:a1];
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      char v14 = [MEMORY[0x1E4F1C9C8] date];
      id v15 = HDCloudSyncKeyValueDomainWithProfile(v9);
      id v50 = v13;
      double v16 = [v15 dateForKey:@"HDBackstopSyncLastConsiderationDateKey" error:&v50];
      id v17 = v50;

      if (v16 == 0.0 && v17)
      {
        _HKInitializeLogging();
        id v18 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v53 = a1;
          __int16 v54 = 2114;
          double v55 = *(double *)&v17;
          _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get last backstop reconsideration date: %{public}@", buf, 0x16u);
        }
LABEL_21:
        if (!_HDIsUnitTesting)
        {
LABEL_24:
          id v13 = v17;
LABEL_25:

          goto LABEL_26;
        }
        double v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [*(id *)&v25 postNotificationName:@"HDBackstopSyncRefusedNotification" object:a1];
LABEL_23:

        goto LABEL_24;
      }
      if (v16 == 0.0)
      {
        id v22 = [MEMORY[0x1E4F1C9C8] distantPast];
        [v14 timeIntervalSinceDate:v22];
        double v21 = v23;
      }
      else
      {
        [v14 timeIntervalSinceDate:*(void *)&v16];
        double v21 = v20;
      }
      if (v21 < 14400.0)
      {
        _HKInitializeLogging();
        __int16 v24 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v53 = a1;
          __int16 v54 = 2048;
          double v55 = v21;
          __int16 v56 = 2114;
          double v57 = v16;
          _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_INFO, "%{public}@: Last backstop sync reconsideration was too recent, not syncing (%0.2lfs, %{public}@)", buf, 0x20u);
        }
        goto LABEL_21;
      }
      id v49 = v17;
      char v26 = [v15 setDate:v14 forKey:@"HDBackstopSyncLastConsiderationDateKey" error:&v49];
      id v13 = v49;

      if ((v26 & 1) == 0
        && (_HKInitializeLogging(),
            uint64_t v27 = *MEMORY[0x1E4F29FA8],
            os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR)))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = a1;
        __int16 v54 = 2114;
        double v55 = *(double *)&v13;
        _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update last backstop reconsideration date: %{public}@", buf, 0x16u);
        if (v16 == 0.0) {
          goto LABEL_54;
        }
      }
      else if (v16 == 0.0)
      {
        goto LABEL_54;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v13;
        double v25 = +[HDCloudSyncStoreEntity persistedMostRecentLastSyncDateForProfile:v9 error:&v48];
        id v17 = v48;

        if (v25 == 0.0 && v17)
        {
          _HKInitializeLogging();
          id v28 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v53 = a1;
            __int16 v54 = 2114;
            double v55 = *(double *)&v17;
            _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to check last successful push date: %{public}@", buf, 0x16u);
          }
          if (_HDIsUnitTesting)
          {
            id v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v29 postNotificationName:@"HDBackstopSyncRefusedNotification" object:a1];
          }
          double v25 = 0.0;
        }
        else
        {
          if (v25 == 0.0)
          {
            __int16 v32 = [MEMORY[0x1E4F1C9C8] distantPast];
            [v14 timeIntervalSinceDate:v32];
            double v31 = v33;
          }
          else
          {
            [v14 timeIntervalSinceDate:*(void *)&v25];
            double v31 = v30;
          }
          _HKInitializeLogging();
          __int16 v34 = (os_log_t *)MEMORY[0x1E4F29FA8];
          id v35 = *MEMORY[0x1E4F29FA8];
          uint64_t v36 = *MEMORY[0x1E4F29FA8];
          if (v31 >= a2)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v53 = a1;
              __int16 v54 = 2048;
              double v55 = v31;
              __int16 v56 = 2048;
              double v57 = a2;
              _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling backstop sync; time since last successful push (%0.2lfs) is greater than threshold %0.2lfs",
                buf,
                0x20u);
            }
            -[HDCloudSyncManager _queue_updateAccessibilityAssertion](a1);
            v38 = [(id)a1 preparedDatabaseAccessibilityAssertion];

            if (v38)
            {
              v39 = [v9 daemon];
              v40 = [v39 analyticsSubmissionCoordinator];
              objc_msgSend(v40, "cloudSync_reportPeriodicSyncStartForType:", 1);

              CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
              v47[0] = MEMORY[0x1E4F143A8];
              v47[1] = 3221225472;
              v47[2] = __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke;
              v47[3] = &unk_1E6302008;
              v47[4] = a1;
              *(CFAbsoluteTime *)&v47[5] = Current;
              v42 = +[HDMaintenanceOperation maintenanceOperationWithName:@"Backstop Cloud Sync" asynchronousBlock:v47];
              v43 = [v9 daemon];
              v44 = [v43 maintenanceWorkCoordinator];
              [v44 enqueueMaintenanceOperation:v42];
            }
            else
            {
              _HKInitializeLogging();
              uint64_t v46 = *v34;
              if (os_log_type_enabled(*v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v53 = a1;
                _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to take database accessibility assertion.", buf, 0xCu);
              }
            }
          }
          else
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v53 = a1;
              __int16 v54 = 2048;
              double v55 = v31;
              __int16 v56 = 2114;
              double v57 = v25;
              _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_INFO, "%{public}@: Last successful push was too recent, not syncing (%0.2lfs, %{public}@)", buf, 0x20u);
            }
            if (_HDIsUnitTesting)
            {
              v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
              [v37 postNotificationName:@"HDBackstopSyncRefusedNotification" object:a1];
            }
          }
        }
        goto LABEL_23;
      }
LABEL_54:
      _HKInitializeLogging();
      uint64_t v45 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v53 = a1;
        _os_log_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: First backstop reconsideration; setting date and not syncing.",
          buf,
          0xCu);
      }
      if (!_HDIsUnitTesting) {
        goto LABEL_25;
      }
      double v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [*(id *)&v25 postNotificationName:@"HDBackstopSyncRefusedNotification" object:a1];
      id v17 = v13;
      goto LABEL_23;
    }
  }
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 == 3)
  {
    -[HDCloudSyncManager _queue_considerStartingBackstopSyncForThreshold:]((uint64_t)self, 259200.0);
  }
}

void __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke_2;
  block[3] = &unk_1E62FFD00;
  uint64_t v9 = *(void *)(a1 + 40);
  block[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_sync(v5, block);
}

void __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing backstop sync.", buf, 0xCu);
  }
  id v4 = [[HDCloudSyncContext alloc] initForPurpose:0 options:0 reason:8 xpcActivity:0];
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke_440;
  v7[3] = &unk_1E6301FE0;
  void v7[4] = v5;
  uint64_t v9 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v6 = (id)[v5 syncWithContext:v4 completion:v7];
}

void __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke_440(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  int v7 = *MEMORY[0x1E4F29FA8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished backstop sync successfully.", (uint8_t *)&v14, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
    id v10 = [WeakRetained daemon];
    uint64_t v11 = [v10 analyticsSubmissionCoordinator];
    objc_msgSend(v11, "cloudSync_reportPeriodicSyncSuccessAfterDuration:type:", 1, CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
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
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Backstop sync failed with error: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
    id v10 = [WeakRetained daemon];
    uint64_t v11 = [v10 analyticsSubmissionCoordinator];
    objc_msgSend(v11, "cloudSync_reportPeriodicSyncFailureWithError:duration:type:", v5, 1, CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (_HDIsUnitTesting)
  {
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"HDBackstopSyncCompletionNotification" object:*(void *)(a1 + 32)];
  }
}

- (id)shareOwnerParticipantWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = HDCloudSyncKeyValueDomainWithProfile(WeakRetained);

  id v6 = [v5 dataForKey:@"HDCloudSyncShareOwnerParticipantKey" error:a3];
  if (v6)
  {
    int v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a3];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (BOOL)setShareOwnerParticipant:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[HDCloudSyncManager _isValidOwnerParticipant:]((uint64_t)self, v6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v8 = HDCloudSyncKeyValueDomainWithProfile(WeakRetained);

    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:a4];
    if (v9) {
      char v10 = [v8 setData:v9 forKey:@"HDCloudSyncShareOwnerParticipantKey" error:a4];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Owner participant is not valid; will not save.");
    char v10 = 0;
  }

  return v10;
}

- (uint64_t)_isValidOwnerParticipant:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    id v6 = [v3 userIdentity];
    int v7 = [v6 userRecordID];
    uint64_t v8 = [v7 recordName];

    if (v8)
    {
      uint64_t v5 = 1;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v9 = *MEMORY[0x1E4F29FA8];
      uint64_t v5 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        uint64_t v12 = a1;
        __int16 v13 = 2114;
        int v14 = v4;
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Participant record has nil record name; ignoring invalid participant: %{public}@",
          (uint8_t *)&v11,
          0x16u);
        uint64_t v5 = 0;
      }
    }
  }

  return v5;
}

- (void)configureForShareSetupMetadata:(id)a3 acceptedShares:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v12 = HDCloudSyncKeyValueDomainWithProfile(WeakRetained);

  __int16 v13 = [v8 syncCircleIdentifier];
  id v34 = 0;
  char v14 = [v12 setString:v13 forKey:@"HDCloudSyncCircleIdentifier" error:&v34];
  id v15 = v34;

  if (v14)
  {
    id v33 = 0;
    __int16 v16 = [(HDCloudSyncManager *)self shareOwnerParticipantWithError:&v33];
    id v17 = v33;
    id v22 = v17;
    if (!v16 || v17)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke;
      aBlock[3] = &unk_1E6302030;
      aBlock[4] = self;
      id v19 = v10;
      id v32 = v19;
      double v21 = (void (**)(void *, void))_Block_copy(aBlock);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v36 = __Block_byref_object_copy__108;
      v37 = __Block_byref_object_dispose__108;
      double v20 = [v9 firstObject];
      id v38 = [v20 owner];

      if (-[HDCloudSyncManager _isValidOwnerParticipant:]((uint64_t)self, *(void **)(*(void *)&buf[8] + 40)))
      {
        v21[2](v21, *(void *)(*(void *)&buf[8] + 40));
      }
      else
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_448;
        v24[3] = &unk_1E63020A8;
        id v27 = v19;
        id v25 = v8;
        char v26 = self;
        id v29 = buf;
        id v28 = v21;
        SEL v30 = a2;
        [(HDCloudSyncManager *)self cloudSyncRepositoriesForClient:0 completion:v24];
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v18 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Participant already set up for profile, skipping configuring share setup metadata. %{public}@", buf, 0x16u);
      }
      (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v15);
  }
}

void __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = 0;
  [v3 setShareOwnerParticipant:a2 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_448(uint64_t a1, void *a2, void *a3)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([v5 count] == 1)
    {
      int v7 = [v5 firstObject];
      id v8 = [*(id *)(a1 + 32) ownerCloudKitEmailAddress];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A488]) initWithEmailAddress:v8];
      id v10 = objc_alloc(MEMORY[0x1E4F1A0D8]);
      v30[0] = v9;
      int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      uint64_t v12 = (void *)[v10 initWithUserIdentityLookupInfos:v11];

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_2;
      v29[3] = &unk_1E6302058;
      uint64_t v13 = *(void *)(a1 + 64);
      v29[4] = *(void *)(a1 + 40);
      v29[5] = v13;
      [v12 setPerShareParticipantCompletionBlock:v29];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_455;
      v24[3] = &unk_1E6302080;
      id v15 = *(void **)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 64);
      void v24[4] = *(void *)(a1 + 40);
      uint64_t v27 = v14;
      id v16 = v15;
      uint64_t v17 = *(void *)(a1 + 72);
      id v25 = v16;
      uint64_t v28 = v17;
      id v26 = *(id *)(a1 + 48);
      [v12 setFetchShareParticipantsCompletionBlock:v24];
      id v18 = [[HDCloudSyncContext alloc] initForPurpose:13 options:0 reason:10 xpcActivity:0];
      id v19 = [v7 syncCircleIdentifier];
      double v20 = +[HDCloudSyncPipeline operationGroupForContext:v18 syncCircleIdentifier:v19 assetDownloadStagingManager:0];
      [v12 setGroup:v20];

      double v21 = [v7 primaryCKContainer];
      [v21 addOperation:v12];
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 48);
      double v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Expected a single repository during share configuration.");
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching participant %{public}@.", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_455(uint64_t *a1, void *a2)
{
  id v4 = a2;
  if (-[HDCloudSyncManager _isValidOwnerParticipant:](a1[4], *(void **)(*(void *)(a1[7] + 8) + 40)))
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v3 = (uint64_t)v4;
    if (!v4)
    {
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[8], @"Cannot fetch valid owner participant"");
    }
    id v4 = (id)v3;
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (id)prepareForSharingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HDCloudSyncContext alloc] initForPurpose:17 options:64 reason:19 xpcActivity:0];
  id v6 = [HDCloudSyncManagerPrepareForSharingTask alloc];
  id v7 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HDCloudSyncManager_prepareForSharingWithCompletion___block_invoke;
  v15[3] = &unk_1E63020D0;
  id v16 = v4;
  id v8 = v4;
  id v9 = [(HDCloudSyncManagerPipelineTask *)v6 initWithManager:self context:v5 accessibilityAssertion:v7 completion:v15];

  [(HDCloudSyncManagerTask *)v9 setPriority:100];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v11 = [WeakRetained daemon];
  uint64_t v12 = [v11 cloudSyncCoordinator];
  [v12 addManagerTask:v9];

  __int16 v13 = [(HDCloudSyncManagerTask *)v9 progress];

  return v13;
}

uint64_t __54__HDCloudSyncManager_prepareForSharingWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setupSharingToAccountWithIdentityLookupInfo:(id)a3 requireExistingRelationship:(BOOL)a4 requireZoneDeviceMode:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [[HDCloudSyncContext alloc] initForPurpose:10 options:64 reason:9 xpcActivity:0];
  id v14 = [HDCloudSyncSetupSharingForUnifiedZoneTask alloc];
  uint64_t v15 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __127__HDCloudSyncManager_setupSharingToAccountWithIdentityLookupInfo_requireExistingRelationship_requireZoneDeviceMode_completion___block_invoke;
  v23[3] = &unk_1E63020F8;
  id v24 = v10;
  id v16 = v10;
  uint64_t v17 = [(HDCloudSyncSetupSharingForUnifiedZoneTask *)v14 initWithManager:self context:v13 lookupInfo:v12 requireExistingRelationship:v7 requireZoneDeviceMode:v11 accessibilityAssertion:v15 completion:v23];

  [(HDCloudSyncManagerTask *)v17 setPriority:100];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v19 = [WeakRetained daemon];
  double v20 = [v19 cloudSyncCoordinator];
  [v20 addManagerTask:v17];

  double v21 = [(HDCloudSyncManagerTask *)v17 progress];

  return v21;
}

void __127__HDCloudSyncManager_setupSharingToAccountWithIdentityLookupInfo_requireExistingRelationship_requireZoneDeviceMode_completion___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    id v7 = [a2 shareSetupMetadata];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v7, 0);
  }
  else
  {
    id v5 = *(void (**)(uint64_t, void, uint64_t))(v4 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6, 0, a4);
  }
}

uint64_t __67__HDCloudSyncManager__removeParticipants_fromSharesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)removeParticipants:(id)a3 fromSharesWithCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      id v10 = [v6 description];
      *(_DWORD *)id v19 = 138543618;
      *(void *)&v19[4] = self;
      *(_WORD *)&v19[12] = 2114;
      *(void *)&v19[14] = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing Participants: %{public}@", v19, 0x16u);
    }
    id v11 = [[HDCloudSyncContext alloc] initForPurpose:11 options:64 reason:11 xpcActivity:0];
    id v12 = [HDCloudSyncManagerRemoveParticipantsTask alloc];
    id v13 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
    *(void *)id v19 = MEMORY[0x1E4F143A8];
    *(void *)&v19[8] = 3221225472;
    *(void *)&v19[16] = __67__HDCloudSyncManager__removeParticipants_fromSharesWithCompletion___block_invoke;
    double v20 = &unk_1E6302120;
    id v21 = v7;
    id v14 = [(HDCloudSyncManagerRemoveParticipantsTask *)v12 initWithManager:self context:v11 removeAllParticipants:v6 == 0 participantsToRemove:v6 accessibilityAssertion:v13 completion:v19];

    [(HDCloudSyncManagerTask *)v14 setPriority:100];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v16 = [WeakRetained daemon];
    uint64_t v17 = [v16 cloudSyncCoordinator];
    [v17 addManagerTask:v14];

    self = [(HDCloudSyncManagerTask *)v14 progress];
  }

  return self;
}

- (id)removeAllParticipantsForSharingType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = self;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing All Participants of Sharing Type: %lu", buf, 0x16u);
  }
  id v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1000];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke;
  v15[3] = &unk_1E6302148;
  id v17 = v6;
  void v15[4] = self;
  id v9 = v8;
  id v16 = v9;
  id v10 = v6;
  id v11 = [(HDCloudSyncManager *)self fetchShareParticipantsForSharingType:a3 completion:v15];
  id v12 = v16;
  id v13 = v9;

  return v13;
}

void __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5 || !a3)
  {
    id v6 = [[HDCloudSyncContext alloc] initForPurpose:11 options:64 reason:11 xpcActivity:0];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_472);
    id v9 = [v7 setWithArray:v8];

    id v10 = [HDCloudSyncManagerRemoveParticipantsTask alloc];
    id v11 = *(void **)(a1 + 32);
    id v12 = [v11 preparedDatabaseAccessibilityAssertion];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke_3;
    v19[3] = &unk_1E6302120;
    id v20 = *(id *)(a1 + 48);
    id v13 = [(HDCloudSyncManagerRemoveParticipantsTask *)v10 initWithManager:v11 context:v6 removeAllParticipants:0 participantsToRemove:v9 accessibilityAssertion:v12 completion:v19];

    [(HDCloudSyncManagerTask *)v13 setPriority:100];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
    uint64_t v15 = [WeakRetained daemon];
    id v16 = [v15 cloudSyncCoordinator];
    [v16 addManagerTask:v13];

    id v17 = *(void **)(a1 + 40);
    id v18 = [(HDCloudSyncManagerTask *)v13 progress];
    [v17 addChild:v18 withPendingUnitCount:1000];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

BOOL __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 role] != 1;
}

uint64_t __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [[HDCloudSyncContext alloc] initForPurpose:16 options:64 reason:12 xpcActivity:0];
  id v8 = [HDCloudSyncManagerFetchShareParticipantsTask alloc];
  id v9 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __70__HDCloudSyncManager_fetchShareParticipantsForSharingType_completion___block_invoke;
  id v20 = &unk_1E6302170;
  id v21 = v6;
  unint64_t v22 = a3;
  id v10 = v6;
  id v11 = [(HDCloudSyncManagerFetchShareParticipantsTask *)v8 initWithManager:self context:v7 fetchAllShares:0 accessibilityAssertion:v9 completion:&v17];

  -[HDCloudSyncManagerTask setPriority:](v11, "setPriority:", 100, v17, v18, v19, v20);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v13 = [WeakRetained daemon];
  id v14 = [v13 cloudSyncCoordinator];
  [v14 addManagerTask:v11];

  uint64_t v15 = [(HDCloudSyncManagerTask *)v11 progress];

  return v15;
}

void __70__HDCloudSyncManager_fetchShareParticipantsForSharingType_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_13:
    v18();
    goto LABEL_14;
  }
  id v7 = [v5 shares];

  if (!v7)
  {
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_13;
  }
  id v8 = [v6 shares];
  uint64_t v9 = *(void *)(a1 + 40);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __HDFilterSharesBySharingType_block_invoke;
  v23[3] = &__block_descriptor_40_e17_B16__0__CKShare_8l;
  void v23[4] = v9;
  id v10 = objc_msgSend(v8, "hk_filter:", v23);

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "participants", (void)v19);
        [v11 addObjectsFromArray:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_14:
}

- (id)fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[HDCloudSyncContext alloc] initForPurpose:16 options:64 reason:12 xpcActivity:0];
  uint64_t v9 = [HDCloudSyncManagerFetchShareParticipantsTask alloc];
  id v10 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  long long v21 = __90__HDCloudSyncManager_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke;
  long long v22 = &unk_1E6302198;
  id v23 = v6;
  id v24 = v7;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = [(HDCloudSyncManagerFetchShareParticipantsTask *)v9 initWithManager:self context:v8 fetchAllShares:1 accessibilityAssertion:v10 completion:&v19];

  -[HDCloudSyncManagerTask setPriority:](v13, "setPriority:", 100, v19, v20, v21, v22);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v15 = [WeakRetained daemon];
  id v16 = [v15 cloudSyncCoordinator];
  [v16 addManagerTask:v13];

  uint64_t v17 = [(HDCloudSyncManagerTask *)v13 progress];

  return v17;
}

void __90__HDCloudSyncManager_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v7 = [v5 shares];

    if (v7)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v8 = [v6 shares];
      uint64_t v24 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v24)
      {
        uint64_t v9 = *(void *)v32;
        id v26 = v8;
        uint64_t v23 = *(void *)v32;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v32 != v9) {
              objc_enumerationMutation(v8);
            }
            uint64_t v25 = v10;
            id v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v12 = objc_msgSend(v11, "participants", v23);
            uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v28;
              while (2)
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v28 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                  if ([v17 role] == 1)
                  {
                    uint64_t v18 = *(void **)(a1 + 32);
                    uint64_t v19 = [v17 userIdentity];
                    uint64_t v20 = [v19 lookupInfo];
                    long long v21 = [v20 emailAddress];
                    LOBYTE(v18) = [v18 isEqualToString:v21];

                    if (v18)
                    {
                      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

                      goto LABEL_23;
                    }
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }

            uint64_t v10 = v25 + 1;
            id v8 = v26;
            uint64_t v9 = v23;
          }
          while (v25 + 1 != v24);
          uint64_t v24 = [v26 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v24);
      }
    }
    long long v22 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    long long v22 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v22();
LABEL_23:
}

- (id)lookupParticipantWithIdentityLookUpInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HDCloudSyncContext alloc] initForPurpose:16 options:0 reason:12 xpcActivity:0];
  uint64_t v9 = [HDCloudSyncManagerLookupTask alloc];
  uint64_t v10 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__HDCloudSyncManager_lookupParticipantWithIdentityLookUpInfo_completion___block_invoke;
  v18[3] = &unk_1E63021C0;
  id v19 = v6;
  id v11 = v6;
  id v12 = [(HDCloudSyncManagerLookupTask *)v9 initWithManager:self context:v8 lookupInfo:v7 accessibilityAssertion:v10 completion:v18];

  [(HDCloudSyncManagerTask *)v12 setPriority:100];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v14 = [WeakRetained daemon];
  uint64_t v15 = [v14 cloudSyncCoordinator];
  [v15 addManagerTask:v12];

  id v16 = [(HDCloudSyncManagerTask *)v12 progress];

  return v16;
}

void __73__HDCloudSyncManager_lookupParticipantWithIdentityLookUpInfo_completion___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    id v7 = [a2 participant];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v7, 0);
  }
  else
  {
    id v5 = *(void (**)(uint64_t, void, uint64_t))(v4 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6, 0, a4);
  }
}

- (id)leaveSharesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HDCloudSyncContext alloc] initForPurpose:16 options:64 reason:13 xpcActivity:0];
  uint64_t v6 = [HDCloudSyncManagerLeaveSharesTask alloc];
  id v7 = [(HDCloudSyncManager *)self preparedDatabaseAccessibilityAssertion];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__HDCloudSyncManager_leaveSharesWithCompletion___block_invoke;
  v15[3] = &unk_1E63021E8;
  id v16 = v4;
  id v8 = v4;
  uint64_t v9 = [(HDCloudSyncManagerPipelineTask *)v6 initWithManager:self context:v5 accessibilityAssertion:v7 completion:v15];

  [(HDCloudSyncManagerTask *)v9 setPriority:100];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained daemon];
  id v12 = [v11 cloudSyncCoordinator];
  [v12 addManagerTask:v9];

  uint64_t v13 = [(HDCloudSyncManagerTask *)v9 progress];

  return v13;
}

uint64_t __48__HDCloudSyncManager_leaveSharesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acceptShare:(id)a3 completion:(id)a4
{
  id v6 = a4;
  p_profile = &self->_profile;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v10 = [WeakRetained database];
  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  id v28 = 0;
  uint64_t v13 = [v10 takeAccessibilityAssertionWithOwnerIdentifier:v12 timeout:&v28 error:300.0];
  id v14 = v28;

  id v15 = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = [v15 cloudSyncManager];
  [v16 prepareForPeriodicSync];

  id v17 = [[HDCloudSyncContext alloc] initForPurpose:13 options:64 reason:10 xpcActivity:0];
  uint64_t v18 = [HDCloudSyncManagerAcceptSharesTask alloc];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __45__HDCloudSyncManager_acceptShare_completion___block_invoke;
  v25[3] = &unk_1E6302210;
  id v26 = v13;
  id v27 = v6;
  id v19 = v6;
  id v20 = v13;
  long long v21 = [(HDCloudSyncManagerAcceptSharesTask *)v18 initWithManager:self context:v17 shareSetupMetadata:v8 accessibilityAssertion:v20 completion:v25];

  [(HDCloudSyncManagerTask *)v21 setPriority:100];
  id v22 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v23 = [v22 daemon];
  uint64_t v24 = [v23 cloudSyncCoordinator];
  [v24 addManagerTask:v21];
}

void __45__HDCloudSyncManager_acceptShare_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v10 = a2;
  id v7 = a4;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v8 = *(void *)(a1 + 40);
  if (a3)
  {
    uint64_t v9 = [v10 acceptedShares];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v7);
  }
}

- (void)_subscribeToSubscriptions:(void *)a3 completion:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    id v7 = [[HDCloudSyncContext alloc] initForPurpose:14 options:64 reason:22 xpcActivity:0];
    uint64_t v8 = [HDCloudSyncManagerSubscriptionTask alloc];
    uint64_t v9 = [a1 preparedDatabaseAccessibilityAssertion];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__HDCloudSyncManager__subscribeToSubscriptions_completion___block_invoke;
    v14[3] = &unk_1E6302238;
    id v15 = v5;
    id v10 = [(HDCloudSyncManagerSubscriptionTask *)v8 initWithManager:a1 context:v7 subscriptions:v6 accessibilityAssertion:v9 completion:v14];

    id WeakRetained = objc_loadWeakRetained(a1 + 13);
    id v12 = [WeakRetained daemon];
    uint64_t v13 = [v12 cloudSyncCoordinator];
    [v13 addManagerTask:v10];
  }
}

uint64_t __59__HDCloudSyncManager__subscribeToSubscriptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscribeToDataUploadRequestsWithCompletion:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HDCloudSyncManager *)self profile];
  uint64_t v6 = [v5 profileType];

  if (v6 == 1)
  {
    uint64_t v8 = HDCloudSyncPrimaryProfileDataRequestedSubscriptionIdentifier;
    v9[0] = 0x1F173B600;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    -[HDCloudSyncManager _subscribeToSubscriptions:completion:]((id *)&self->super.isa, v7, v4);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)subscribeToDataAvailableNotificationsWithCompletion:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = [(HDCloudSyncManager *)self profile];
  uint64_t v6 = [v5 profileType];

  switch(v6)
  {
    case 1:
      goto LABEL_4;
    case 2:
      id v12 = HDCloudSyncSharedSummaryDataAvailableForDownloadSubscriptionIdentifier;
      uint64_t v13 = 0x1F1749360;
      id v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = &v13;
      uint64_t v9 = &v12;
      uint64_t v10 = 1;
      goto LABEL_7;
    case 3:
      v14[0] = HDCloudSyncTinkerProfileDataAvailableForDownloadSubscriptionIdentifier;
      v14[1] = HDCloudSyncTinkerMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
      v15[0] = @"CloudSyncStoreRecord";
      v15[1] = 0x1F17353E0;
      id v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = v15;
      uint64_t v9 = (__CFString **)v14;
      goto LABEL_6;
    case 4:
      v4[2](v4, 1, 0);
      goto LABEL_8;
    default:
      if (v6 != 100) {
        goto LABEL_8;
      }
LABEL_4:
      v16[0] = HDCloudSyncPrimaryProfileDataAvailableForDownloadSubscriptionIdentifier;
      v16[1] = HDCloudSyncPrimaryMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
      v17[0] = @"CloudSyncStoreRecord";
      v17[1] = 0x1F17353E0;
      id v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = v17;
      uint64_t v9 = (__CFString **)v16;
LABEL_6:
      uint64_t v10 = 2;
LABEL_7:
      id v11 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:v10];
      -[HDCloudSyncManager _subscribeToSubscriptions:completion:]((id *)&self->super.isa, v11, v4);

LABEL_8:
      return;
  }
}

- (void)requestDataUploadWithCompletion:(id)a3
{
  id v5 = a3;
  [(HDCloudSyncManager *)self updateDataUploadRequestStatus:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HDCloudSyncManager_requestDataUploadWithCompletion___block_invoke;
  v7[3] = &unk_1E6302288;
  void v7[4] = self;
  id v8 = v5;
  SEL v9 = a2;
  id v6 = v5;
  [(HDCloudSyncManager *)self cloudSyncRepositoriesForClient:0 completion:v7];
}

void __54__HDCloudSyncManager_requestDataUploadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) updateDataUploadRequestStatus:5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = [v5 firstObject];
    if ([v5 count] != 1)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"HDCloudSyncManager.m" lineNumber:1718 description:@"Expected only a single repository when attempting to request data upload."];
    }
    id v8 = [[HDCloudSyncContext alloc] initForPurpose:15 options:64 reason:18 xpcActivity:0];
    SEL v9 = [HDCloudSyncPipeline alloc];
    uint64_t v10 = [*(id *)(a1 + 32) preparedDatabaseAccessibilityAssertion];
    id v11 = [(HDCloudSyncPipeline *)v9 initForContext:v8 repository:v7 accessibilityAssertion:v10 queue:*(void *)(*(void *)(a1 + 32) + 120)];

    id v12 = [v11 operationGroup];
    uint64_t v13 = [v12 defaultConfiguration];
    [v13 setQualityOfService:17];

    id v14 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
    id v15 = [v11 operationConfiguration];
    id v16 = [(HDCloudSyncPipelineStage *)v14 initWithConfiguration:v15 cloudState:0];
    [v11 addStage:v16];

    id v17 = [HDCloudSyncPipelineStageSynchronize alloc];
    uint64_t v18 = [v11 operationConfiguration];
    id v19 = [(HDCloudSyncPipelineStage *)v17 initWithConfiguration:v18 cloudState:0];
    [v11 addStage:v19];

    id v20 = [HDCloudSyncRequestDataUploadOperation alloc];
    long long v21 = [v11 operationConfiguration];
    id v22 = [(HDCloudSyncOperation *)v20 initWithConfiguration:v21 cloudState:0];
    uint64_t v23 = [(HDCloudSyncOperation *)v22 asPipelineStage];
    [v11 addStage:v23];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __54__HDCloudSyncManager_requestDataUploadWithCompletion___block_invoke_2;
    v27[3] = &unk_1E6302260;
    uint64_t v24 = *(void **)(a1 + 40);
    v27[4] = *(void *)(a1 + 32);
    id v28 = v24;
    id v25 = (id)[v11 beginWithCompletion:v27];
  }
}

void __54__HDCloudSyncManager_requestDataUploadWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v6 = *(void **)(a1 + 32);
  if (a3 == 1) {
    [v6 updateDataUploadRequestStatus:2];
  }
  else {
    [v6 updateDataUploadRequestStatus:5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchServerPreferredPushEnvironmentWithCompletion:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HDCloudSyncManager_fetchServerPreferredPushEnvironmentWithCompletion___block_invoke;
  v7[3] = &unk_1E63022B0;
  id v8 = v5;
  SEL v9 = a2;
  void v7[4] = self;
  id v6 = v5;
  [(HDCloudSyncManager *)self cloudSyncRepositoriesForClient:0 completion:v7];
}

void __72__HDCloudSyncManager_fetchServerPreferredPushEnvironmentWithCompletion___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = v5;
  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v6 = [v5 firstObject];
    if ([v9 count] != 1)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a1[6] object:a1[4] file:@"HDCloudSyncManager.m" lineNumber:1755 description:@"Expected only a single repository when attempting to fetch server preferred push environment."];
    }
    id v7 = [v6 primaryCKContainer];
    [v7 serverPreferredPushEnvironmentWithCompletionHandler:a1[5]];
  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"HDCloudSyncDownloadDirectoryAssertionIdentifier"];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = self;
      __int16 v27 = 2050;
      uint64_t v28 = v9;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Active assertions count: %{public}lu", buf, 0x16u);
    }
    id v11 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_inProgressDownloadDirectoryLock);
    id v12 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_inProgressDownloadDirectoryPath isDirectory:1];
    id v24 = 0;
    char v14 = [v12 removeItemAtURL:v13 error:&v24];
    id v15 = v24;
    if (v14)
    {
      os_unfair_lock_unlock(&self->_inProgressDownloadDirectoryLock);
      id v16 = 0;
      BOOL v17 = 1;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v18 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = self;
        __int16 v27 = 2114;
        uint64_t v28 = (uint64_t)v15;
        _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Unable to remove in progress download directory, %{public}@", buf, 0x16u);
      }
      os_unfair_lock_unlock(&self->_inProgressDownloadDirectoryLock);
      id v19 = v15;
      id v16 = v19;
      BOOL v17 = v19 == 0;
      if (v19) {
        id v20 = v19;
      }
    }
    id v11 = v16;
    if (!v17)
    {
      _HKInitializeLogging();
      long long v21 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = self;
        __int16 v27 = 2114;
        uint64_t v28 = (uint64_t)v11;
        _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete in progress download directory, %{public}@", buf, 0x16u);
      }
    }
  }
  id v22 = [(HDCloudSyncManager *)self unitTest_assertionInvalidatedHandler];

  if (v22)
  {
    uint64_t v23 = [(HDCloudSyncManager *)self unitTest_assertionInvalidatedHandler];
    ((void (**)(void, id, id))v23)[2](v23, v6, v7);
  }
}

- (void)unitTest_setSupportsRebase:(BOOL)a3
{
  self->_BOOL supportsRebase = a3;
}

- (void)unitTest_setIsChild:(BOOL)a3
{
  self->_isChild = a3;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDCloudSyncOwnerIdentifierManager)ownerIdentifierManager
{
  return self->_ownerIdentifierManager;
}

- (HDAssertion)preparedDatabaseAccessibilityAssertion
{
  return (HDAssertion *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)supportsRebase
{
  return self->_supportsRebase;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (HDCloudSyncSharedSummaryManager)sharedSummaryManager
{
  return self->_sharedSummaryManager;
}

- (HDCloudSyncContextSyncManager)contextSyncManager
{
  return self->_contextSyncManager;
}

- (HDAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (id)unitTest_assertionInvalidatedHandler
{
  return self->_unitTest_assertionInvalidatedHandler;
}

- (void)setUnitTest_assertionInvalidatedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_assertionInvalidatedHandler, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_contextSyncManager, 0);
  objc_storeStrong((id *)&self->_sharedSummaryManager, 0);
  objc_storeStrong((id *)&self->_ownerIdentifierManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_inProgressDownloadDirectoryPath, 0);
  objc_storeStrong((id *)&self->_lock_lastDataUploadRequestCompletionDate, 0);
  objc_storeStrong((id *)&self->_lock_lastDataUploadRequestStartDate, 0);
  objc_storeStrong((id *)&self->_lock_lastSuccessfulLitePushDate, 0);
  objc_storeStrong((id *)&self->_lock_lastSuccessfulPushDate, 0);
  objc_storeStrong((id *)&self->_lock_lastSuccessfulPullDate, 0);

  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(HDCloudSyncManager *)self profile];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F65CD8]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke;
    v22[3] = &unk_1E62FA040;
    id v23 = v6;
    uint64_t v9 = (void *)[v8 initWithDescription:@"Report Daily Analytics" completion:v22];
    uint64_t v10 = [(HDCloudSyncManager *)self queue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2;
    v20[3] = &unk_1E62F7640;
    void v20[4] = self;
    id v11 = v7;
    id v21 = v11;
    [v9 addTaskOnQueue:v10 task:v20];

    id v12 = [(HDCloudSyncManager *)self queue];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_299;
    id v16 = &unk_1E63077E0;
    id v17 = v11;
    uint64_t v18 = self;
    SEL v19 = a2;
    [v9 addTaskOnQueue:v12 task:&v13];

    objc_msgSend(v9, "begin", v13, v14, v15, v16);
  }
  else
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

uint64_t __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_3;
  v7[3] = &unk_1E6302148;
  id v9 = v4;
  void v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  id v6 = v4;
  [v5 cloudSyncRepositoriesForClient:0 completion:v7];
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 firstObject];
  if (v7)
  {
    id v8 = [v5 firstObject];
    id v9 = [v8 primaryCKContainer];
    uint64_t v10 = [v9 containerIdentifier];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_4;
    v15[3] = &unk_1E6307740;
    id v11 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v16 = v12;
    uint64_t v17 = v13;
    id v18 = v10;
    id v19 = *(id *)(a1 + 48);
    id v14 = v10;
    [v11 fetchSyncStatusWithCompletion:v15];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v100 = a3;
  id v6 = [*(id *)(a1 + 32) daemon];
  id v7 = [v6 cloudSyncCoordinator];
  id v119 = 0;
  unsigned int v94 = [v7 canPerformCloudSyncWithError:&v119];
  id v97 = v119;

  id v8 = HDCloudSyncKeyValueDomainWithProfile(*(void **)(a1 + 32));
  id v9 = HDCloudSyncRestorePhaseSyncCompleteStartDate(*(void **)(a1 + 32));
  uint64_t v10 = HDCloudSyncRestorePhaseMergeCompleteEndDate(*(void **)(a1 + 32));
  uint64_t v11 = 0;
  v102 = (void *)v10;
  if (!v10)
  {
    id v12 = NSNumber;
    [v9 timeIntervalSinceNow];
    uint64_t v11 = [v12 numberWithDouble:-v13];
  }
  v95 = (void *)v11;
  v96 = v9;
  id v14 = NSNumber;
  id v15 = [*(id *)(a1 + 32) database];
  id v16 = [v15 _journalForType:2];
  v110 = objc_msgSend(v14, "numberWithUnsignedLong:", (unint64_t)objc_msgSend(v16, "sizeOnDisk") >> 20);

  uint64_t v17 = NSNumber;
  id v18 = [*(id *)(a1 + 32) database];
  id v19 = [v18 _journalForType:2];
  [v19 ageOfOldestJournal];
  v109 = objc_msgSend(v17, "numberWithDouble:");

  id v20 = [v5 lastSuccessfulPullDate];
  if (v20)
  {
    id v21 = NSNumber;
    id v22 = [v5 lastSuccessfulPullDate];
    [v22 timeIntervalSinceNow];
    v108 = [v21 numberWithDouble:-v23];
  }
  else
  {
    v108 = 0;
  }

  id v24 = [v5 lastSuccessfulPushDate];
  if (v24)
  {
    id v25 = NSNumber;
    id v26 = [v5 lastSuccessfulPushDate];
    [v26 timeIntervalSinceNow];
    v107 = [v25 numberWithDouble:-v27];
  }
  else
  {
    v107 = 0;
  }

  uint64_t v28 = [v5 lastSuccessfulLitePushDate];
  if (v28)
  {
    uint64_t v29 = NSNumber;
    long long v30 = [v5 lastSuccessfulLitePushDate];
    [v30 timeIntervalSinceNow];
    v106 = [v29 numberWithDouble:-v31];
  }
  else
  {
    v106 = 0;
  }

  long long v32 = [*(id *)(a1 + 40) profile];
  id v118 = 0;
  long long v33 = +[HDCloudSyncStoreEntity persistedStoreUUIDsForProfile:v32 error:&v118];
  id v34 = v118;

  if (!v33)
  {
    _HKInitializeLogging();
    id v35 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v76 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v121 = v76;
      __int16 v122 = 2114;
      id v123 = v34;
      _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve persisted store UUIDs for daily analytics: %{public}@", buf, 0x16u);
    }
  }
  id v117 = 0;
  uint64_t v36 = [v8 dateForKey:@"HDCloudSyncPrimaryLastPushForwardProgressDate" error:&v117];
  id v92 = v117;
  if (v36)
  {
    uint64_t v37 = NSNumber;
    [v36 timeIntervalSinceNow];
    v91 = [v37 numberWithDouble:-v38];
  }
  else
  {
    v91 = 0;
  }
  id v116 = 0;
  uint64_t v39 = [v8 dataForKey:@"HDCloudSyncKeyErrorRequiringUserAction" error:&v116];
  id v89 = v116;
  v90 = (void *)v39;
  if (v39)
  {
    id v115 = 0;
    uint64_t v40 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v39 error:&v115];
    id v41 = v115;
    v42 = v41;
    v105 = (void *)v40;
    if (!v40)
    {
      if (v41)
      {
        _HKInitializeLogging();
        v43 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          uint64_t v78 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v121 = v78;
          __int16 v122 = 2114;
          id v123 = v42;
          _os_log_error_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive cloud sync error requiring user action: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    v105 = 0;
  }
  v44 = [*(id *)(a1 + 32) syncIdentityManager];
  id v114 = 0;
  uint64_t v45 = [v44 childIdentitiesForCurrentSyncIdentityWithError:&v114];
  id v99 = v114;

  v104 = (void *)v45;
  if (!v45)
  {
    _HKInitializeLogging();
    uint64_t v46 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v77 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v121 = v77;
      __int16 v122 = 2114;
      id v123 = v99;
      _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get child sync identities from local storage: %{public}@ for daily analytics", buf, 0x16u);
    }
  }
  v47 = *(void **)(a1 + 32);
  id v113 = 0;
  char v86 = HDUpgradedToSyncIdentity(v47, (uint64_t)&v113);
  id v48 = v113;
  if (v48)
  {
    _HKInitializeLogging();
    id v49 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v73 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v121 = v73;
      __int16 v122 = 2114;
      id v123 = v48;
      _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get upgraded to sync identity status for daily analytics: %{public}@", buf, 0x16u);
    }
  }
  id v50 = v34;
  v88 = v48;
  id v51 = *(void **)(a1 + 32);
  id v112 = 0;
  char v52 = HDCompletedTransitionToSyncIdentity(v51, (uint64_t)&v112);
  id v53 = v112;
  if (v53)
  {
    _HKInitializeLogging();
    __int16 v54 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v74 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v121 = v74;
      __int16 v122 = 2114;
      id v123 = v53;
      _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get completed transition to sync identity status for daily analytics: %{public}@", buf, 0x16u);
    }
  }
  v87 = v53;
  double v55 = [*(id *)(a1 + 32) deviceContextManager];
  id v111 = v100;
  v103 = [v55 numberOfDeviceContextsPerDeviceType:&v111];
  id v56 = v111;

  v101 = v56;
  if (v56)
  {
    _HKInitializeLogging();
    double v57 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v75 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v121 = v75;
      __int16 v122 = 2114;
      id v123 = v56;
      _os_log_error_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get device contexts dictionary for cloud sync daily analytics: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v58 = [v103 objectForKeyedSubscript:&unk_1F17EED18];
  if (v58)
  {
    v85 = [v103 objectForKeyedSubscript:&unk_1F17EED18];
  }
  else
  {
    v85 = &unk_1F17EED30;
  }

  v59 = [v103 objectForKeyedSubscript:&unk_1F17EED48];
  if (v59)
  {
    v84 = [v103 objectForKeyedSubscript:&unk_1F17EED48];
  }
  else
  {
    v84 = &unk_1F17EED30;
  }

  v60 = [v103 objectForKeyedSubscript:&unk_1F17EED60];
  if (v60)
  {
    v83 = [v103 objectForKeyedSubscript:&unk_1F17EED60];
  }
  else
  {
    v83 = &unk_1F17EED30;
  }

  v61 = [v103 objectForKeyedSubscript:&unk_1F17EED78];
  v93 = v50;
  if (v61)
  {
    v62 = [v103 objectForKeyedSubscript:&unk_1F17EED78];
  }
  else
  {
    v62 = &unk_1F17EED30;
  }

  v63 = +[HDCloudSyncPipeline retrieveAndResetSyncCounts];
  v64 = [v63 objectForKey:@"HDCloudSyncCountOfTotalSyncs"];
  v82 = v63;
  v65 = [v63 objectForKey:@"HDCloudSyncCountOfSuccessfulSyncs"];
  v98 = v5;
  v81 = v65;
  if ([v64 intValue])
  {
    v66 = NSNumber;
    [v65 doubleValue];
    double v68 = v67;
    [v64 doubleValue];
    v70 = [v66 numberWithDouble:v68 / v69];
  }
  else
  {
    v70 = &unk_1F17EED30;
  }
  v71 = [*(id *)(a1 + 32) daemon];
  v72 = [v71 analyticsSubmissionCoordinator];
  BYTE2(v80) = v86 & v52;
  BYTE1(v80) = v86 & (v52 ^ 1);
  LOBYTE(v80) = (v86 | v52) ^ 1;
  BYTE2(v79) = 0;
  LOWORD(v79) = 0;
  objc_msgSend(v72, "cloudSync_reportDailyAnalyticForProfileType:syncEnabled:syncDisabledError:primaryContainer:restoreComplete:timeSinceRestoreStart:journalSize:oldestJournalAge:timeSinceLastSuccessfulPull:timeSinceLastSuccessfulPush:timeSinceLastSuccessfulLitePush:timeSinceLastPushForwardProgress:storeCount:zoneCount:hasUnifiedZone:hasMasterZone:hasMedicalID:errorRequiringUserAction:childSyncIdentityCount:canUpgradeToSyncIdentity:startedUpgradeToSyncIdentity:completedUpgradeToSyncIdentity:iPhoneCount:iPadCount:watchCount:visionProCount:totalSyncsCount:successfulSyncPercentageCount:", objc_msgSend(*(id *)(a1 + 32), "profileType"), v94, v97, *(void *)(a1 + 48), v102 != 0, v95, v110, v109, v108, v107, v106, v91, objc_msgSend(v33, "count"),
    0,
    v79,
    v105,
    [v104 count],
    v80,
    v85,
    v84,
    v83,
    v62,
    v64,
    v70);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_299(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) daemon];
  id v6 = [v5 cloudSyncCoordinator];
  id v22 = 0;
  char v7 = [v6 canPerformCloudSyncWithError:&v22];
  id v8 = v22;
  if ((v7 & 1) == 0)
  {

    goto LABEL_5;
  }
  id v9 = [*(id *)(a1 + 40) profile];
  uint64_t v10 = [v9 daemon];
  uint64_t v11 = [v10 behavior];
  char v12 = [v11 supportsCloudSync];

  if ((v12 & 1) == 0)
  {
LABEL_5:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_6;
  }
  double v13 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2_300;
  v18[3] = &unk_1E63077B8;
  id v14 = v4;
  uint64_t v15 = *(void *)(a1 + 48);
  id v20 = v14;
  uint64_t v21 = v15;
  int8x16_t v17 = *(int8x16_t *)(a1 + 32);
  id v16 = (id)v17.i64[0];
  int8x16_t v19 = vextq_s8(v17, v17, 8uLL);
  [v13 cloudSyncRepositoriesForClient:0 completion:v18];

LABEL_6:
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2_300(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 firstObject];
  if (v7)
  {
    if ([v5 count] != 1)
    {
      long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"HDCloudSyncManager+Analytics.m" lineNumber:207 description:@"Expected only a single repository when attempting to report cache analytics."];
    }
    id v8 = [[HDCloudSyncContext alloc] initForPurpose:1 options:64 reason:31 xpcActivity:0];
    id v9 = [HDCloudSyncPipeline alloc];
    uint64_t v10 = [*(id *)(a1 + 32) queue];
    id v11 = [(HDCloudSyncPipeline *)v9 initForContext:v8 repository:v7 accessibilityAssertion:0 queue:v10];

    char v12 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
    double v13 = [v11 operationConfiguration];
    id v14 = [(HDCloudSyncPipelineStage *)v12 initWithConfiguration:v13 cloudState:0];
    [v11 addStage:v14];

    uint64_t v15 = [HDCloudSyncPipelineStageSynchronize alloc];
    id v16 = [v11 operationConfiguration];
    int8x16_t v17 = [(HDCloudSyncPipelineStage *)v15 initWithConfiguration:v16 cloudState:0];
    [v11 addStage:v17];

    id v18 = [HDCloudSyncPipelineStagePrepareForSync alloc];
    int8x16_t v19 = [v11 operationConfiguration];
    id v20 = [(HDCloudSyncPipelineStage *)v18 initWithConfiguration:v19 cloudState:0];
    [v11 addStage:v20];

    uint64_t v21 = [HDCloudSyncPipelineStageContextSyncPush alloc];
    id v22 = [v11 operationConfiguration];
    double v23 = [(HDCloudSyncPipelineStage *)v21 initWithConfiguration:v22 cloudState:0];
    [v11 addStage:v23];

    id v24 = [HDCloudSyncPipelineStageContextSyncPull alloc];
    id v25 = [v11 operationConfiguration];
    id v26 = [(HDCloudSyncPipelineStage *)v24 initWithConfiguration:v25 cloudState:0];
    [v11 addStage:v26];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_3_314;
    v33[3] = &unk_1E6307790;
    id v34 = v11;
    id v35 = v7;
    id v27 = *(id *)(a1 + 48);
    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v29 = *(void **)(a1 + 40);
    id v38 = v27;
    uint64_t v36 = v28;
    id v37 = v29;
    id v30 = v11;
    id v31 = (id)[v30 beginWithCompletion:v33];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_3_314(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v101 = a2;
  id v102 = a4;
  uint64_t v105 = a1;
  id v6 = [*(id *)(a1 + 32) operationConfiguration];
  char v7 = [v6 cachedCloudState];
  id v8 = [*(id *)(v105 + 40) primaryCKContainer];
  id v9 = [v8 containerIdentifier];
  id v138 = 0;
  v103 = [v7 zoneIdentifiersForContainerIdentifier:v9 databaseScope:2 error:&v138];
  id v104 = v138;

  if (v104)
  {
    (*(void (**)(void))(*(void *)(v105 + 64) + 16))();
    goto LABEL_65;
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id obj = v103;
  uint64_t v10 = [obj countByEnumeratingWithState:&v134 objects:v188 count:16];
  if (v10)
  {
    char v113 = 0;
    id v11 = 0;
    uint64_t v12 = *(void *)v135;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v135 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v134 + 1) + 8 * i);
        uint64_t v15 = [v14 zoneIdentifier];
        id v132 = 0;
        id v133 = 0;
        unsigned int v16 = objc_msgSend(v15, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v133, &v132);
        id v17 = v133;
        id v18 = v132;

        int8x16_t v19 = [v14 zoneIdentifier];
        id v131 = v18;
        LOBYTE(v14) = objc_msgSend(v19, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v131);
        id v20 = v131;

        v11 += v16;
        v113 |= v14;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v134 objects:v188 count:16];
    }
    while (v10);
  }
  else
  {
    char v113 = 0;
    id v11 = 0;
  }

  uint64_t v21 = objc_msgSend(obj, "hk_filter:", &__block_literal_global_184);
  id v22 = [v21 firstObject];

  uint64_t v23 = *(void *)(v105 + 48);
  id v24 = *(void **)(v105 + 40);
  id v25 = *(id *)(v105 + 56);
  id v26 = v22;
  id v27 = v24;
  id v100 = v26;
  if (!v23)
  {
    v43 = 0;
    char v44 = 0;
    goto LABEL_31;
  }
  uint64_t v174 = 0;
  v175 = &v174;
  uint64_t v176 = 0x2020000000;
  uint64_t v177 = 0;
  uint64_t v170 = 0;
  v171 = &v170;
  uint64_t v172 = 0x2020000000;
  uint64_t v173 = 0;
  uint64_t v166 = 0;
  v167 = &v166;
  uint64_t v168 = 0x2020000000;
  uint64_t v169 = 0;
  uint64_t v162 = 0;
  v163 = &v162;
  uint64_t v164 = 0x2020000000;
  uint64_t v165 = 0;
  uint64_t v158 = 0;
  v159 = &v158;
  uint64_t v160 = 0x2020000000;
  uint64_t v161 = 0;
  uint64_t v154 = 0;
  v155 = (double *)&v154;
  uint64_t v156 = 0x2020000000;
  uint64_t v157 = 0;
  if (v26)
  {
    id v28 = [[HDCloudSyncCachedZone alloc] initForZoneIdentifier:v26 repository:v27 accessibilityAssertion:0];
    uint64_t v29 = objc_opt_class();
    id v153 = 0;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke;
    v180 = (char *)&unk_1E6307830;
    *(void *)&long long v182 = &v174;
    *((void *)&v182 + 1) = &v154;
    id v30 = v28;
    id v181 = v30;
    v183 = &v162;
    LOBYTE(v29) = [v30 recordsForClass:v29 epoch:0 error:&v153 enumerationHandler:buf];
    id v31 = v153;
    long long v32 = v31;
    if ((v29 & 1) == 0)
    {
      id v45 = v31;
      v43 = v45;
      if (v45) {
        id v46 = v45;
      }

      BOOL v178 = v43 == 0;
      id v39 = v43;
      goto LABEL_29;
    }
    uint64_t v33 = objc_opt_class();
    id v152 = v32;
    uint64_t v145 = MEMORY[0x1E4F143A8];
    uint64_t v146 = 3221225472;
    uint64_t v147 = (uint64_t)__100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_3;
    v148 = &unk_1E6307858;
    v150 = &v170;
    id v34 = v30;
    id v149 = v34;
    v151 = &v158;
    char v35 = [v34 recordsForClass:v33 epoch:0 error:&v152 enumerationHandler:&v145];
    id v36 = v152;

    if (v35)
    {
      uint64_t v37 = objc_opt_class();
      id v144 = v36;
      uint64_t v139 = MEMORY[0x1E4F143A8];
      uint64_t v140 = 3221225472;
      uint64_t v141 = (uint64_t)__100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_5;
      v142 = &unk_1E6307880;
      v143 = &v166;
      char v38 = [v34 recordsForClass:v37 epoch:0 error:&v144 enumerationHandler:&v139];
      id v39 = v144;

      if (v38)
      {
        uint64_t v40 = objc_alloc_init(HDAttachmentCloudAnalytics);
        [(HDAttachmentCloudAnalytics *)v40 setNumberOfAttachmentRecords:v175[3]];
        [(HDAttachmentCloudAnalytics *)v40 setNumberOfReferenceRecords:v171[3]];
        [(HDAttachmentCloudAnalytics *)v40 setNumberOfTombstoneRecords:v167[3]];
        [(HDAttachmentCloudAnalytics *)v40 setNumberOfOrphanedAttachmentRecords:v163[3]];
        [(HDAttachmentCloudAnalytics *)v40 setNumberOfOrphanedReferenceRecords:v159[3]];
        [(HDAttachmentCloudAnalytics *)v40 setPercentageOfAttachmentsWithAssetData:(uint64_t)(v155[3] / (double)v175[3] * 100.0)];
        id v41 = [v25 daemon];
        v42 = [v41 analyticsSubmissionCoordinator];
        objc_msgSend(v42, "attachments_reportDailyCloudAnalytics:", v40);

        BOOL v178 = 1;
        v43 = 0;
LABEL_28:

LABEL_29:
        char v44 = v178;
        goto LABEL_30;
      }
      id v49 = v39;
      v43 = v49;
      if (v49) {
        id v50 = v49;
      }
    }
    else
    {
      id v47 = v36;
      v43 = v47;
      if (v47) {
        id v48 = v47;
      }
    }

    BOOL v178 = v43 == 0;
    id v39 = v43;
    goto LABEL_28;
  }
  v43 = 0;
  char v44 = 1;
LABEL_30:
  _Block_object_dispose(&v154, 8);
  _Block_object_dispose(&v158, 8);
  _Block_object_dispose(&v162, 8);
  _Block_object_dispose(&v166, 8);
  _Block_object_dispose(&v170, 8);
  _Block_object_dispose(&v174, 8);
LABEL_31:

  id v99 = v43;
  if ((v44 & 1) == 0)
  {
    _HKInitializeLogging();
    id v51 = HKLogAnalytics();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      uint64_t v94 = *(void *)(v105 + 48);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v94;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v99;
      _os_log_error_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_ERROR, "%{public}@ Failed to report attachment cloud analytics, %{public}@", buf, 0x16u);
    }
  }
  char v52 = [*(id *)(v105 + 32) operationConfiguration];
  id v53 = [v52 cachedCloudState];
  __int16 v54 = [*(id *)(v105 + 40) primaryCKContainer];
  double v55 = [v54 containerIdentifier];
  id v130 = 0;
  v103 = [v53 zoneIdentifiersForContainerIdentifier:v55 databaseScope:3 error:&v130];
  id v104 = v130;

  if (v103 || !v104)
  {
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v106 = v103;
    id obja = (id)[v106 countByEnumeratingWithState:&v126 objects:v187 count:16];
    if (obja)
    {
      uint64_t v56 = 0;
      char v57 = 0;
      uint64_t v108 = *(void *)v127;
      do
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(void *)v127 != v108) {
            objc_enumerationMutation(v106);
          }
          v59 = *(void **)(*((void *)&v126 + 1) + 8 * (void)j);
          v60 = [v59 zoneIdentifier];
          id v124 = 0;
          id v125 = 0;
          unsigned int v61 = objc_msgSend(v60, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v125, &v124);
          id v62 = v125;
          id v63 = v124;

          v64 = [v59 zoneIdentifier];
          id v123 = v63;
          LOBYTE(v59) = objc_msgSend(v64, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v123);
          id v65 = v123;

          v56 += v61;
          v57 |= v59;
        }
        id obja = (id)[v106 countByEnumeratingWithState:&v126 objects:v187 count:16];
      }
      while (obja);
    }
    else
    {
      uint64_t v56 = 0;
      char v57 = 0;
    }

    v66 = [*(id *)(v105 + 32) operationConfiguration];
    double v67 = [v66 cachedCloudState];
    double v68 = [*(id *)(v105 + 40) primaryCKContainer];
    double v69 = [v68 containerIdentifier];
    id v122 = 0;
    id objb = [v67 contextSyncZoneForContainerID:v69 error:&v122];
    id v109 = v122;

    if (objb)
    {
      uint64_t v145 = 0;
      uint64_t v146 = (uint64_t)&v145;
      uint64_t v147 = 0x2020000000;
      v148 = 0;
      uint64_t v139 = 0;
      uint64_t v140 = (uint64_t)&v139;
      uint64_t v141 = 0x2020000000;
      v142 = 0;
      uint64_t v70 = objc_opt_class();
      v120[4] = &v139;
      id v121 = 0;
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_321;
      v120[3] = &unk_1E6307768;
      [objb recordsForClass:v70 epoch:0 error:&v121 enumerationHandler:v120];
      id v71 = v121;
      uint64_t v72 = objc_opt_class();
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2_324;
      v118[3] = &unk_1E6307768;
      v118[4] = &v145;
      id v119 = v71;
      [objb recordsForClass:v72 epoch:0 error:&v119 enumerationHandler:v118];
      id v95 = v119;

      uint64_t v73 = [*(id *)(v105 + 32) operationConfiguration];
      uint64_t v74 = [v73 computedState];
      uint64_t v75 = [v74 pushTargets];

      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v76 = v75;
      uint64_t v77 = 0;
      uint64_t v78 = [v76 countByEnumeratingWithState:&v114 objects:v186 count:16];
      if (v78)
      {
        uint64_t v79 = *(void *)v115;
        do
        {
          for (uint64_t k = 0; k != v78; ++k)
          {
            if (*(void *)v115 != v79) {
              objc_enumerationMutation(v76);
            }
            v81 = [*(id *)(*((void *)&v114 + 1) + 8 * k) storeRecord];
            v82 = [v81 syncIdentity];

            if (!v82) {
              ++v77;
            }
          }
          uint64_t v78 = [v76 countByEnumeratingWithState:&v114 objects:v186 count:16];
        }
        while (v78);
      }

      _HKInitializeLogging();
      v83 = HKLogAnalytics();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v84 = *(void *)(v105 + 48);
        uint64_t v85 = *(void *)(v146 + 24);
        char v86 = *(uint64_t **)(v140 + 24);
        *(_DWORD *)buf = 138545154;
        *(void *)&uint8_t buf[4] = v84;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v56;
        *(_WORD *)&buf[22] = 2050;
        v180 = v11;
        LOWORD(v181) = 1026;
        *(_DWORD *)((char *)&v181 + 2) = v57 & 1;
        HIWORD(v181) = 1026;
        LODWORD(v182) = v113 & 1;
        WORD2(v182) = 2050;
        *(void *)((char *)&v182 + 6) = v85;
        HIWORD(v182) = 2050;
        v183 = v86;
        __int16 v184 = 2050;
        uint64_t v185 = v77;
        _os_log_impl(&dword_1BCB7D000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@ Reporting daily cache analytics -\n shared database sharing zone count: %{public}ld\n private database sharing zone count: %{public}ld\n shared database unified zone: %{public}d\n private unified zone: %{public}d\n device contexts count: %{public}ld\n device key values count: %{public}ld\n nil sync identities count: %{public}ld", buf, 0x4Au);
      }

      v87 = [*(id *)(v105 + 56) daemon];
      v96 = [v87 analyticsSubmissionCoordinator];
      id v107 = [*(id *)(v105 + 32) operationConfiguration];
      v98 = [v107 computedState];
      id v97 = [v98 pushTargets];
      uint64_t v88 = [v97 count];
      id v89 = [*(id *)(v105 + 32) operationConfiguration];
      v90 = [v89 computedState];
      v91 = [v90 pullTargets];
      uint64_t v92 = [v91 count];
      objc_msgSend(v96, "cloudCache_reportDailyCacheAnalyticsWithPushTargets:pullTargets:sharedDBSummarySharingZones:privateDBSummarySharingZones:unifiedZoneInSharedDB:unifiedZoneInPrivateDB:deviceContexts:deviceKeys:nilSyncIdentities:", v88, v92, v56, v11, v57 & 1, v113 & 1, *(void *)(v146 + 24), *(void *)(v140 + 24), v77);

      (*(void (**)(void))(*(void *)(v105 + 64) + 16))();
      _Block_object_dispose(&v139, 8);
      _Block_object_dispose(&v145, 8);
    }
    else
    {
      uint64_t v93 = (uint64_t)v109;
      if (!v109)
      {
        uint64_t v93 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 724, @"Context sync zone not present for daily analytic collection.");
      }
      id v109 = (id)v93;
      (*(void (**)(void))(*(void *)(v105 + 64) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(v105 + 64) + 16))();
  }

LABEL_65:
}

uint64_t __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_4_315(uint64_t a1, void *a2)
{
  v2 = [a2 zoneIdentifier];
  uint64_t v5 = 0;
  uint64_t v3 = objc_msgSend(v2, "hd_isAttachmentZoneIDForSyncCircleIdentifier:", &v5);

  return v3;
}

uint64_t __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_321(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = [a2 deviceKeyValueEntry:a4];
  if (v5) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }

  return 1;
}

uint64_t __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2_324(uint64_t a1)
{
  return 1;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  if ([v6 hasAssetData]) {
    *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) + 1.0;
  }
  char v7 = (void *)a1[4];
  uint64_t v8 = objc_opt_class();
  id v21 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_2;
  int8x16_t v19 = &unk_1E6307808;
  id v9 = v6;
  id v20 = v9;
  uint64_t v10 = [v7 recordsForClass:v8 error:&v21 filter:&v16];
  id v11 = v21;
  uint64_t v12 = v11;
  if (v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  uint64_t v14 = v13;
  if (v13)
  {
    if (!objc_msgSend(v10, "count", v16, v17, v18, v19)) {
      ++*(void *)(*(void *)(a1[7] + 8) + 24);
    }
  }
  else if (a4)
  {
    *a4 = v11;
  }
  else
  {
    _HKLogDroppedError();
  }

  return v14;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 attachmentIdentifier];
  id v4 = [*(id *)(a1 + 32) attachmentIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_3(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  char v7 = (void *)a1[4];
  uint64_t v8 = objc_opt_class();
  id v21 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_4;
  int8x16_t v19 = &unk_1E6301860;
  id v9 = v6;
  id v20 = v9;
  uint64_t v10 = [v7 recordsForClass:v8 error:&v21 filter:&v16];
  id v11 = v21;
  uint64_t v12 = v11;
  if (v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  uint64_t v14 = v13;
  if (v13)
  {
    if (!objc_msgSend(v10, "count", v16, v17, v18, v19)) {
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
  }
  else if (a4)
  {
    *a4 = v11;
  }
  else
  {
    _HKLogDroppedError();
  }

  return v14;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 attachmentIdentifier];
  id v4 = [*(id *)(a1 + 32) attachmentIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_5(uint64_t a1)
{
  return 1;
}

@end