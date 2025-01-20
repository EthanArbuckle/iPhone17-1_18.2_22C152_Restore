@interface HMDCloudManager
+ (id)logCategory;
- (BOOL)_processFetchedTransaction:(id)a3;
- (BOOL)_validFetchRetryCKErrorCode:(int64_t)a3;
- (BOOL)accountActive;
- (BOOL)cloudHomeDataRecordExists;
- (BOOL)decryptionFailed;
- (BOOL)isFirstDBQueryRun;
- (BOOL)isFirstV3FetchRun;
- (BOOL)keychainSyncEnabled;
- (BOOL)legacyZoneHasRecordsAvailable;
- (CKContainer)container;
- (CKDatabase)database;
- (HMDCloudCache)cloudCache;
- (HMDCloudDataSyncStateFilter)cloudDataSyncStateFilter;
- (HMDCloudHomeManagerZone)homeManagerZone;
- (HMDCloudLegacyZone)legacyZone;
- (HMDCloudManager)initWithMessageDispatcher:(id)a3 cloudDataSyncStateFilter:(id)a4 cloudCache:(id)a5 delegate:(id)a6 dataSource:(id)a7 syncManager:(id)a8 callbackQueue:(id)a9 container:(id)a10 logEventSubmitter:(id)a11 workQueue:(id)a12;
- (HMDCloudManager)initWithMessageDispatcher:(id)a3 cloudDataSyncStateFilter:(id)a4 cloudCache:(id)a5 delegate:(id)a6 dataSource:(id)a7 syncManager:(id)a8 logEventSubmitter:(id)a9 callbackQueue:(id)a10;
- (HMDCloudManagerDataSource)dataSource;
- (HMDCloudManagerDelegate)delegate;
- (HMDCloudMetadataZone)metadataZone;
- (HMDSyncOperationManager)syncManager;
- (HMFMessageDispatcher)configSyncDispatcher;
- (HMFMessageDispatcher)msgDispatcher;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSData)serverTokenData;
- (NSMutableArray)currentBackoffTimerValuesInMinutes;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)clientCallbackQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)controllerKeyPollTimer;
- (OS_dispatch_source)pollTimer;
- (OS_dispatch_source)retryTimer;
- (OS_dispatch_source)watchdogControllerKeyPollTimer;
- (id)_changeTokenFromData:(id)a3;
- (id)_serverTokenData;
- (id)accountActiveUpdateHandler;
- (id)cloudDataDeletedNotificationHandler;
- (id)cloudMetadataDeletedNotificationHandler;
- (id)controllerKeyAvailableNotificationHandler;
- (id)dataDecryptionFailedHandler;
- (id)fetchCompletionHandler;
- (void)__addCKDatabaseOperation:(id)a3;
- (void)__deleteRecordWithID:(id)a3 completionHandler:(id)a4;
- (void)__deleteRecordZoneWithID:(id)a3 completionHandler:(id)a4;
- (void)__deleteRecordZonesWithIDs:(id)a3 completionHandler:(id)a4;
- (void)__fetchAllRecordZonesWithCompletionHandler:(id)a3;
- (void)__fetchRecordZoneWithID:(id)a3 completionHandler:(id)a4;
- (void)__fetchSubscriptionWithID:(id)a3 completionHandler:(id)a4;
- (void)__saveRecordZone:(id)a3 completionHandler:(id)a4;
- (void)__saveSubscription:(id)a3 completionHandler:(id)a4;
- (void)_accountIsActive;
- (void)_addHomeZoneName:(id)a3 owner:(id)a4;
- (void)_auditProxSetupNotification:(id)a3;
- (void)_checkZoneAndUploadTransaction:(id)a3 completionHandler:(id)a4;
- (void)_createZoneAndFetchChanges:(id)a3;
- (void)_createZoneAndUploadTransaction:(id)a3 completionHandler:(id)a4;
- (void)_fetchAndVerifyZoneRootRecord:(id)a3 completionHandler:(id)a4;
- (void)_fetchDatabaseZoneChangesCompletion:(id)a3;
- (void)_fetchLegacyTransaction:(id)a3 forceFetch:(BOOL)a4 accountCompletionHandler:(id)a5 dataCompletionHandler:(id)a6;
- (void)_fetchTransaction:(id)a3 completionHandler:(id)a4;
- (void)_forceCleanCloud:(BOOL)a3 fetchTransaction:(id)a4 completionHandler:(id)a5;
- (void)_handleAccountStatus:(int64_t)a3 completionHandler:(id)a4;
- (void)_handleControllerKeyAvailable;
- (void)_handleKeychainSyncStateChanged:(BOOL)a3;
- (void)_processFetchCompletedWithError:(id)a3 serverToken:(id)a4 fetchTransaction:(id)a5 migrationOptions:(unint64_t)a6 completionHandler:(id)a7 moreRecordsComing:(BOOL)a8 emptyRecord:(BOOL)a9;
- (void)_registerForProxSetupNotifications;
- (void)_removeAllHomeZonesCompletionHandler:(id)a3;
- (void)_removeHomeZoneName:(id)a3;
- (void)_removeZonesTransactions:(id)a3 completionHandler:(id)a4;
- (void)_resetCloudCache:(id)a3;
- (void)_resetCloudDataAndDeleteMetadataForCurrentAccount:(BOOL)a3 completionHandler:(id)a4;
- (void)_resetCloudServerTokenData;
- (void)_resetCloudZonesIgnoreHomeManager:(BOOL)a3 completionHandler:(id)a4;
- (void)_resetHomeDataRecordState;
- (void)_scheduleZoneFetch:(id)a3;
- (void)_setupSubscriptionForZone:(id)a3;
- (void)_startControllerKeyPollTimer;
- (void)_startControllerKeyPollTimerWithBackoff;
- (void)_startControllerKeyPollTimerWithValue:(int64_t)a3;
- (void)_startFetchPollTimer;
- (void)_startFetchRetryTimer;
- (void)_startWatchdogControllerKeyPollTimer;
- (void)_stopControllerKeyPollTimer;
- (void)_stopFetchPollTimer;
- (void)_stopFetchRetryTimer;
- (void)_stopWatchdogControllerKeyPollTimer;
- (void)_updateServerTokenStatusOnCloudFilter;
- (void)_uploadLegacyTransaction:(id)a3 completionHandler:(id)a4;
- (void)_uploadTransaction:(id)a3 completionHandler:(id)a4;
- (void)_verifyAndRemoveAllHomeZonesCompletionHandler:(id)a3;
- (void)_verifyAndRemoveZone:(id)a3 completionHandler:(id)a4;
- (void)_verifyHH2SentinelCloudZoneExist:(id)a3;
- (void)_verifyZoneHasBeenDeletedTransaction:(id)a3 completionHandler:(id)a4;
- (void)_verifyZonesExist:(id)a3 zoneIndex:(unint64_t)a4 completion:(id)a5;
- (void)addHomeZoneName:(id)a3 owner:(id)a4;
- (void)cacheDatabaseServerToken;
- (void)dealloc;
- (void)fetchCurrentAccountStateWithCompletionHandler:(id)a3;
- (void)fetchDatabaseZoneChanges;
- (void)fetchLegacyTransaction:(id)a3 forceFetch:(BOOL)a4 accountCompletionHandler:(id)a5 dataCompletionHandler:(id)a6;
- (void)fetchTransaction:(id)a3 completionHandler:(id)a4;
- (void)handleKeychainStateChangedNotification:(id)a3;
- (void)handler:(id)a3 didReceiveCKNotification:(id)a4;
- (void)handler:(id)a3 didReceivePushForTopic:(id)a4;
- (void)initializeServerTokenStatusOnCloudFilter;
- (void)registerForPushNotifications;
- (void)removeHomeZoneName:(id)a3;
- (void)removeZonesTransactions:(id)a3 completionHandler:(id)a4;
- (void)resetCloudCache:(id)a3;
- (void)resetCloudDataAndDeleteMetadataForCurrentAccount:(BOOL)a3 completionHandler:(id)a4;
- (void)resetCloudServerTokenData:(id)a3;
- (void)setAccountActive:(BOOL)a3;
- (void)setAccountActiveUpdateCallback:(id)a3;
- (void)setAccountActiveUpdateHandler:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setClientCallbackQueue:(id)a3;
- (void)setCloudCache:(id)a3;
- (void)setCloudDataDeletedNotificationBlock:(id)a3;
- (void)setCloudDataDeletedNotificationHandler:(id)a3;
- (void)setCloudDataSyncStateFilter:(id)a3;
- (void)setCloudHomeDataRecordExists:(BOOL)a3;
- (void)setCloudMetadataDeletedNotificationBlock:(id)a3;
- (void)setCloudMetadataDeletedNotificationHandler:(id)a3;
- (void)setConfigSyncDispatcher:(id)a3;
- (void)setControllerKeyAvailableNotificationBlock:(id)a3;
- (void)setControllerKeyAvailableNotificationHandler:(id)a3;
- (void)setControllerKeyPollTimer:(id)a3;
- (void)setCurrentBackoffTimerValuesInMinutes:(id)a3;
- (void)setDataAvailableFromCloudCompletionBlock:(id)a3;
- (void)setDataDecryptionFailedCompletionBlock:(id)a3;
- (void)setDataDecryptionFailedHandler:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setFirstDBQueryRun:(BOOL)a3;
- (void)setFirstV3FetchRun:(BOOL)a3;
- (void)setKeychainSyncEnabled:(BOOL)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setPollTimer:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)setWatchdogControllerKeyPollTimer:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateAccountStatusChanged:(BOOL)a3 completionHandler:(id)a4;
- (void)updateCloudDataSyncFilterState:(BOOL)a3;
- (void)updateServerTokenStatusOnCloudFilter;
- (void)uploadLegacyTransaction:(id)a3 completionHandler:(id)a4;
- (void)uploadTransaction:(id)a3 completionHandler:(id)a4;
- (void)verifyAndRemoveZone:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDCloudManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountActiveUpdateHandler, 0);
  objc_storeStrong(&self->_dataDecryptionFailedHandler, 0);
  objc_storeStrong((id *)&self->_currentBackoffTimerValuesInMinutes, 0);
  objc_destroyWeak((id *)&self->_syncManager);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_cloudDataSyncStateFilter, 0);
  objc_storeStrong(&self->_controllerKeyAvailableNotificationHandler, 0);
  objc_storeStrong(&self->_cloudMetadataDeletedNotificationHandler, 0);
  objc_storeStrong(&self->_cloudDataDeletedNotificationHandler, 0);
  objc_storeStrong((id *)&self->_watchdogControllerKeyPollTimer, 0);
  objc_storeStrong((id *)&self->_controllerKeyPollTimer, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_clientCallbackQueue, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_configSyncDispatcher, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setFirstDBQueryRun:(BOOL)a3
{
  self->_firstDBQueryRun = a3;
}

- (BOOL)isFirstDBQueryRun
{
  return self->_firstDBQueryRun;
}

- (void)setFirstV3FetchRun:(BOOL)a3
{
  self->_firstV3FetchRun = a3;
}

- (BOOL)isFirstV3FetchRun
{
  return self->_firstV3FetchRun;
}

- (void)setAccountActiveUpdateHandler:(id)a3
{
}

- (id)accountActiveUpdateHandler
{
  return self->_accountActiveUpdateHandler;
}

- (void)setDataDecryptionFailedHandler:(id)a3
{
}

- (id)dataDecryptionFailedHandler
{
  return self->_dataDecryptionFailedHandler;
}

- (void)setCurrentBackoffTimerValuesInMinutes:(id)a3
{
}

- (NSMutableArray)currentBackoffTimerValuesInMinutes
{
  return self->_currentBackoffTimerValuesInMinutes;
}

- (void)setSyncManager:(id)a3
{
}

- (HMDSyncOperationManager)syncManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncManager);
  return (HMDSyncOperationManager *)WeakRetained;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setCloudDataSyncStateFilter:(id)a3
{
}

- (HMDCloudDataSyncStateFilter)cloudDataSyncStateFilter
{
  return self->_cloudDataSyncStateFilter;
}

- (void)setControllerKeyAvailableNotificationHandler:(id)a3
{
}

- (id)controllerKeyAvailableNotificationHandler
{
  return self->_controllerKeyAvailableNotificationHandler;
}

- (void)setCloudMetadataDeletedNotificationHandler:(id)a3
{
}

- (id)cloudMetadataDeletedNotificationHandler
{
  return self->_cloudMetadataDeletedNotificationHandler;
}

- (void)setCloudDataDeletedNotificationHandler:(id)a3
{
}

- (id)cloudDataDeletedNotificationHandler
{
  return self->_cloudDataDeletedNotificationHandler;
}

- (void)setWatchdogControllerKeyPollTimer:(id)a3
{
}

- (OS_dispatch_source)watchdogControllerKeyPollTimer
{
  return self->_watchdogControllerKeyPollTimer;
}

- (void)setControllerKeyPollTimer:(id)a3
{
}

- (OS_dispatch_source)controllerKeyPollTimer
{
  return self->_controllerKeyPollTimer;
}

- (void)setPollTimer:(id)a3
{
}

- (OS_dispatch_source)pollTimer
{
  return self->_pollTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (void)setKeychainSyncEnabled:(BOOL)a3
{
  self->_keychainSyncEnabled = a3;
}

- (BOOL)keychainSyncEnabled
{
  return self->_keychainSyncEnabled;
}

- (void)setCloudHomeDataRecordExists:(BOOL)a3
{
  self->_cloudHomeDataRecordExists = a3;
}

- (BOOL)cloudHomeDataRecordExists
{
  return self->_cloudHomeDataRecordExists;
}

- (void)setClientCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)clientCallbackQueue
{
  return self->_clientCallbackQueue;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setConfigSyncDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)configSyncDispatcher
{
  return self->_configSyncDispatcher;
}

- (void)setCloudCache:(id)a3
{
}

- (HMDCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (void)setDatabase:(id)a3
{
}

- (CKDatabase)database
{
  return self->_database;
}

- (CKContainer)container
{
  return self->_container;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDCloudManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDCloudManagerDataSource *)WeakRetained;
}

- (HMDCloudManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCloudManagerDelegate *)WeakRetained;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (BOOL)accountActive
{
  return self->_accountActive;
}

- (void)handler:(id)a3 didReceiveCKNotification:(id)a4
{
  v5 = objc_msgSend(a4, "containerIdentifier", a3);
  v6 = [(HMDCloudManager *)self container];
  v7 = [v6 containerIdentifier];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    v9 = [(HMDCloudManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMDCloudManager_handler_didReceiveCKNotification___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

void __52__HMDCloudManager_handler_didReceiveCKNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) accountActive];
  v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      v7 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Did receive message from push, fetching new changes", (uint8_t *)&v12, 0xCu);
    }
    int v8 = [*(id *)(a1 + 32) dataSource];
    if ([v8 isControllerKeyAvailable])
    {
    }
    else
    {
      int v11 = [*(id *)(a1 + 32) keychainSyncEnabled];

      if (v11) {
        [*(id *)(a1 + 32) _startControllerKeyPollTimer];
      }
    }
    [*(id *)(a1 + 32) _stopFetchRetryTimer];
    [*(id *)(a1 + 32) fetchDatabaseZoneChanges];
  }
  else
  {
    if (v6)
    {
      v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Did receive message from push, ignoring since account is not active", (uint8_t *)&v12, 0xCu);
    }
    v10 = [*(id *)(a1 + 32) delegate];
    [v10 kickAccountAvailabilityCheck];
  }
}

- (void)handler:(id)a3 didReceivePushForTopic:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F65520];
  id v6 = a4;
  v7 = [v5 sharedPowerLogger];
  [v7 reportIncomingCloudPush:v6];

  id v9 = [(HMDCloudManager *)self logEventSubmitter];
  int v8 = +[HMDIncomingCloudPushLogEvent incomingCloudPush:v6];

  [v9 submitLogEvent:v8];
}

- (void)_fetchDatabaseZoneChangesCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = [(HMDCloudManager *)v6 cloudCache];
    v10 = [v9 databaseServerChangeToken];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching zone changes for the database with %@", buf, 0x16u);
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1A038]);
  int v12 = [(HMDCloudManager *)v6 cloudCache];
  v13 = [v12 databaseServerChangeToken];
  uint64_t v14 = (void *)[v11 initWithPreviousServerChangeToken:v13];

  [v14 setFetchAllChanges:1];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v33 = __Block_byref_object_copy__39674;
  v34 = __Block_byref_object_dispose__39675;
  id v35 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, v6);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke;
  v26[3] = &unk_1E6A09E00;
  v26[4] = v6;
  v26[5] = buf;
  [v14 setRecordZoneWithIDChangedBlock:v26];
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DBQuery", "", v28, 2u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke_203;
  v22[3] = &unk_1E6A0A468;
  objc_copyWeak(v25, &location);
  v25[1] = (id)0xEEEEB0B5B2B2EEEELL;
  v24 = buf;
  id v16 = v4;
  id v23 = v16;
  v17 = (void *)MEMORY[0x1D9452090]([v14 setFetchDatabaseChangesCompletionBlock:v22]);
  v18 = v6;
  HMFGetOSLogHandle();
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = [v14 operationID];
    *(_DWORD *)v28 = 138543618;
    id v29 = v20;
    __int16 v30 = 2112;
    v31 = v21;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetching database zone changes with operation ID: %@", v28, 0x16u);
  }
  [(HMDCloudManager *)v18 __addCKDatabaseOperation:v14];

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

void __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    id v5 = a2;
    id v4 = [v5 zoneName];
    [v3 _scheduleZoneFetch:v4];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

void __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke_203(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Completed fetching database zone changes", buf, 0xCu);
    }
    v13 = [v10 workQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke_204;
    v18[3] = &unk_1E6A0A440;
    uint64_t v14 = *(void *)(a1 + 56);
    v18[4] = v10;
    uint64_t v23 = v14;
    id v15 = v7;
    uint64_t v16 = *(void *)(a1 + 40);
    id v19 = v15;
    uint64_t v22 = v16;
    id v20 = v6;
    id v21 = *(id *)(a1 + 32);
    dispatch_async(v13, v18);
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v7);
    }
  }
}

void __55__HMDCloudManager__fetchDatabaseZoneChangesCompletion___block_invoke_204(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  int v2 = *(id *)(*(void *)(a1 + 32) + 8);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(v1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, v3, OS_SIGNPOST_INTERVAL_END, v4, "DBQuery", "", buf, 2u);
  }

  id v5 = [*(id *)(v1 + 40) domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v6 = [*(id *)(v1 + 40) code];

    if (v6 == 21)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = *(id *)(v1 + 32);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v110 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Database zone change fetch failed due to expired token, resetting token and re-fetching", buf, 0xCu);
      }
      id v11 = [*(id *)(v1 + 32) cloudCache];
      [v11 setDatabaseServerChangeToken:0];

      int v12 = [*(id *)(v1 + 32) cloudCache];
      [v12 persistDatabaseServerChangeToken];

      [*(id *)(v1 + 32) fetchDatabaseZoneChanges];
      return;
    }
  }
  else
  {
  }
  v91 = [*(id *)(v1 + 32) delegate];
  v89 = [*(id *)(v1 + 32) legacyZone];
  v13 = [v89 serverChangeToken];

  if (!v13)
  {
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(v1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v110 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Force Scheduling fetch for legacy zone", buf, 0xCu);
    }
    [v91 fetchHomeDataFromCloudWithCloudConflict:0 withDelay:0.0];
    v18 = [v89 zone];
    id v19 = [v18 zoneID];

    if (([*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) containsObject:v19] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) addObject:v19];
    }
  }
  v88 = [*(id *)(v1 + 32) homeManagerZone];
  id v20 = [v88 serverChangeToken];

  if (!v20)
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = *(id *)(v1 + 32);
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v110 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Force Scheduling fetch for home manager zone", buf, 0xCu);
    }
    [v91 fetchHomeManagerCloudConflict:0 withDelay:0.0];
    v25 = [v88 zone];
    uint64_t v26 = [v25 zoneID];

    if (([*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) containsObject:v26] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) addObject:v26];
    }
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v27 = [*(id *)(v1 + 32) cloudCache];
  v28 = [v27 allHomeZones];

  obuint64_t j = v28;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v98 objects:v113 count:16];
  uint64_t v93 = v1;
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v99;
    uint64_t v90 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v99 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        v34 = [v33 serverChangeToken];

        if (!v34)
        {
          id v35 = (void *)MEMORY[0x1D9452090]();
          id v36 = *(id *)(v1 + 32);
          v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v38 = HMFGetLogIdentifier();
            v39 = [v33 zone];
            v40 = [v39 zoneID];
            v41 = [v40 zoneName];
            *(_DWORD *)buf = 138543618;
            v110 = v38;
            __int16 v111 = 2112;
            uint64_t v112 = (uint64_t)v41;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch for home zone %@", buf, 0x16u);

            uint64_t v1 = v93;
          }

          id v42 = objc_alloc(MEMORY[0x1E4F29128]);
          v43 = [v33 zone];
          v44 = [v43 zoneID];
          v45 = [v44 zoneName];
          v46 = (void *)[v42 initWithUUIDString:v45];

          [v91 fetchHomeFromCloudZone:v46 cloudConflict:0 withDelay:0.0];
          v47 = [v33 zone];
          v48 = [v47 zoneID];

          if (([*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) containsObject:v48] & 1) == 0) {
            [*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) addObject:v48];
          }

          uint64_t v31 = v90;
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v98 objects:v113 count:16];
    }
    while (v30);
  }

  v49 = (void *)MEMORY[0x1D9452090]();
  id v50 = *(id *)(v1 + 32);
  v51 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    v52 = HMFGetLogIdentifier();
    uint64_t v53 = *(void *)(v1 + 48);
    *(_DWORD *)buf = 138543618;
    v110 = v52;
    __int16 v111 = 2112;
    uint64_t v112 = v53;
    _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Updating databaseServerChangeToken with %@", buf, 0x16u);
  }
  uint64_t v54 = *(void *)(v1 + 48);
  v55 = [*(id *)(v1 + 32) cloudCache];
  [v55 setDatabaseServerChangeToken:v54];

  [v91 schedulePostFetch];
  if (([*(id *)(v1 + 32) isFirstDBQueryRun] & 1) == 0)
  {
    [*(id *)(v1 + 32) setFirstDBQueryRun:1];
    v56 = [MEMORY[0x1E4F1CA48] array];
    v57 = *(void **)(*(void *)(*(void *)(v1 + 64) + 8) + 40);
    v58 = [v89 zone];
    v59 = [v58 zoneID];
    LOBYTE(v57) = [v57 containsObject:v59];

    uint64_t v60 = MEMORY[0x1E4F1CC28];
    if ((v57 & 1) == 0)
    {
      [*(id *)(v1 + 32) setFirstV3FetchRun:1];
      v107[0] = @"HMDCR.stc";
      v107[1] = @"HMDCR.if";
      v108[0] = v60;
      v108[1] = v60;
      v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:2];
      [v56 addObject:v61];
    }
    v62 = *(void **)(*(void *)(*(void *)(v1 + 64) + 8) + 40);
    v63 = [v88 zone];
    v64 = [v63 zoneID];
    LOBYTE(v62) = [v62 containsObject:v64];

    if ((v62 & 1) == 0)
    {
      v105[0] = @"HMDCR.id";
      v105[1] = @"HMDCR.stc";
      v106[0] = @"1411CE6C-B4DE-4622-A49D-F66FE296D6B5";
      v106[1] = v60;
      v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];
      [v56 addObject:v65];
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v66 = [*(id *)(v1 + 32) cloudCache];
    v67 = [v66 allHomeZones];

    uint64_t v68 = [v67 countByEnumeratingWithState:&v94 objects:v104 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v95 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = *(void **)(*((void *)&v94 + 1) + 8 * j);
          v73 = *(void **)(*(void *)(*(void *)(v93 + 64) + 8) + 40);
          v74 = [v72 zone];
          v75 = [v74 zoneID];
          LOBYTE(v73) = [v73 containsObject:v75];

          if ((v73 & 1) == 0)
          {
            v76 = [v72 zone];
            v77 = [v76 zoneID];
            v78 = [v77 zoneName];

            if (v78)
            {
              v102[0] = @"HMDCR.id";
              v102[1] = @"HMDCR.stc";
              v103[0] = v78;
              v103[1] = v60;
              v102[2] = @"HMDCR.if";
              v103[2] = v60;
              v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
              [v56 addObject:v79];
            }
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v94 objects:v104 count:16];
      }
      while (v69);
    }

    if ([v56 count]) {
      [v91 notifyZonesCloudZoneReady:v56];
    }

    uint64_t v1 = v93;
  }
  if ([*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) count])
  {
    v80 = [*(id *)(v1 + 32) pollTimer];
    if (v80)
    {
      uint64_t v81 = arc4random_uniform(0x1C21u) + 86400;
      v82 = (void *)MEMORY[0x1D9452090]();
      id v83 = *(id *)(v1 + 32);
      v84 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        v85 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v110 = v85;
        __int16 v111 = 2048;
        uint64_t v112 = v81;
        _os_log_impl(&dword_1D49D5000, v84, OS_LOG_TYPE_INFO, "%{public}@Resetting next cloud sync poll timer set to %lld secs since we just fetched", buf, 0x16u);
      }
      dispatch_time_t v86 = dispatch_walltime(0, 1000000000 * v81);
      dispatch_source_set_timer(v80, v86, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
    }
  }
  uint64_t v87 = *(void *)(v1 + 56);
  if (v87) {
    (*(void (**)(uint64_t, void))(v87 + 16))(v87, *(void *)(v1 + 40));
  }
}

- (void)cacheDatabaseServerToken
{
  v3 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMDCloudManager_cacheDatabaseServerToken__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __43__HMDCloudManager_cacheDatabaseServerToken__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  os_signpost_id_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Caching database server token", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) cloudCache];
  [v6 persistDatabaseServerChangeToken];
}

- (void)fetchDatabaseZoneChanges
{
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __43__HMDCloudManager_fetchDatabaseZoneChanges__block_invoke;
  id v10 = &unk_1E6A15BB0;
  objc_copyWeak(&v11, &location);
  id v3 = _Block_copy(&v7);
  os_signpost_id_t v4 = [(HMDCloudManager *)self dataSource];
  id v5 = [v4 queryDatabaseOperationWithBlock:v3];

  uint64_t v6 = [(HMDCloudManager *)self syncManager];
  [v6 addOperation:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __43__HMDCloudManager_fetchDatabaseZoneChanges__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v9 = WeakRetained;
    if (WeakRetained)
    {
      id v11 = [WeakRetained workQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__HMDCloudManager_fetchDatabaseZoneChanges__block_invoke_2;
      v12[3] = &unk_1E6A19530;
      v12[4] = v9;
      id v13 = v7;
      dispatch_async(v11, v12);
    }
    goto LABEL_6;
  }
  if (v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23 description:@"Operation was cancelled before it could run" reason:@"HMDCloudManager cancelled the operation" suggestion:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
LABEL_6:
  }
}

uint64_t __43__HMDCloudManager_fetchDatabaseZoneChanges__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDatabaseZoneChangesCompletion:*(void *)(a1 + 40)];
}

- (void)_scheduleZoneFetch:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDCloudManager *)self delegate];
    uint64_t v6 = [(HMDCloudManager *)self legacyZone];
    id v7 = [v6 zone];
    id v8 = [v7 zoneID];
    uint64_t v9 = [v8 zoneName];
    int v10 = [v9 isEqualToString:v4];

    if (v10)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      int v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v35 = 138543362;
        id v36 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch for legacy zone", (uint8_t *)&v35, 0xCu);
      }
      [v5 fetchHomeDataFromCloudWithCloudConflict:0 withDelay:0.0];
    }
    else
    {
      id v19 = [(HMDCloudManager *)self homeManagerZone];
      id v20 = [v19 zone];
      id v21 = [v20 zoneID];
      id v22 = [v21 zoneName];
      int v23 = [v22 isEqualToString:v4];

      if (v23)
      {
        v24 = (void *)MEMORY[0x1D9452090]();
        v25 = self;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = HMFGetLogIdentifier();
          int v35 = 138543362;
          id v36 = v27;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch for home manager zone", (uint8_t *)&v35, 0xCu);
        }
        [v5 fetchHomeManagerCloudConflict:0 withDelay:0.0];
      }
      else
      {
        v28 = [(HMDCloudManager *)self cloudCache];
        int v29 = [v28 homeZoneExists:v4];

        if (v29)
        {
          uint64_t v30 = (void *)MEMORY[0x1D9452090]();
          uint64_t v31 = self;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = HMFGetLogIdentifier();
            int v35 = 138543618;
            id v36 = v33;
            __int16 v37 = 2112;
            id v38 = v4;
            _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch for home zone %@", (uint8_t *)&v35, 0x16u);
          }
          v34 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
          [v5 fetchHomeFromCloudZone:v34 cloudConflict:0 withDelay:0.0];
        }
      }
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v35 = 138543362;
      id v36 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Zone not specified, cannot fetch", (uint8_t *)&v35, 0xCu);
    }
  }
}

- (void)registerForPushNotifications
{
  id v3 = [(HMDCloudManager *)self container];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__HMDCloudManager_registerForPushNotifications__block_invoke;
  v4[3] = &unk_1E6A12EB8;
  v4[4] = self;
  [v3 serverPreferredPushEnvironmentWithCompletionHandler:v4];
}

void __47__HMDCloudManager_registerForPushNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMDCloudManager_registerForPushNotifications__block_invoke_2;
  block[3] = &unk_1E6A19668;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __47__HMDCloudManager_registerForPushNotifications__block_invoke_2(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (id)*MEMORY[0x1E4F4E1D0];
  if (a1[4])
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = a1[5];
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      id v7 = objc_msgSend(a1[4], "hmd_conciseCKError");
      uint64_t v8 = [v7 shortDescription];
      int v15 = 138543618;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDCloudManager] Failed to resolve preferred CloudKit environment with error: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else if ([a1[6] length])
  {
    id v9 = a1[6];

    id v2 = v9;
  }
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = a1[5];
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v15 = 138543618;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v2;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Registering APS Connection for preferred environment: %@", (uint8_t *)&v15, 0x16u);
  }
  id v14 = [MEMORY[0x1E4F69E48] sharedHandlerForEnvironment:v2];
  [v14 addObserver:a1[5] forBundleIdentifier:@"com.apple.willowd"];
}

- (void)_setupSubscriptionForZone:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 subscription];

  if (!v5)
  {
    id v6 = [v4 subscriptionName];

    if (v6)
    {
      id inited = objc_initWeak(&location, self);
      uint64_t v8 = (void *)MEMORY[0x1D9452090](inited);
      id v9 = self;
      HMFGetOSLogHandle();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = [v4 subscriptionName];
        *(_DWORD *)buf = 138543618;
        id v19 = v11;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching subscription with ID %@", buf, 0x16u);
      }
      uint64_t v13 = [v4 subscriptionName];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke;
      v14[3] = &unk_1E6A0A418;
      objc_copyWeak(&v16, &location);
      id v15 = v4;
      [(HMDCloudManager *)v9 __fetchSubscriptionWithID:v13 completionHandler:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

void __45__HMDCloudManager__setupSubscriptionForZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_2;
    block[3] = &unk_1E6A0B940;
    id v11 = v6;
    id v12 = v5;
    id v13 = *(id *)(a1 + 32);
    id v14 = v8;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    dispatch_async(v9, block);

    objc_destroyWeak(&v15);
  }
}

void __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    id v2 = *(id *)(a1 + 40);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;

    if (v4)
    {
      id v5 = [v4 subscriptionID];
      id v6 = [*(id *)(a1 + 48) subscriptionName];
      int v7 = [v5 isEqualToString:v6];

      if (v7)
      {
        uint64_t v8 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 48) setSubscription:v4]);
        id v9 = *(id *)(a1 + 56);
        id v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = HMFGetLogIdentifier();
          id v12 = [*(id *)(a1 + 48) zone];
          id v13 = [v12 zoneID];
          id v14 = [v13 zoneName];
          *(_DWORD *)buf = 138543618;
          v28 = v11;
          __int16 v29 = 2112;
          uint64_t v30 = v14;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Already have subscription for in zone %@, caching", buf, 0x16u);
        }
        goto LABEL_14;
      }
    }
  }
  id v15 = objc_alloc(MEMORY[0x1E4F1A340]);
  id v16 = [*(id *)(a1 + 48) zone];
  __int16 v17 = [v16 zoneID];
  id v18 = [*(id *)(a1 + 48) subscriptionName];
  id v4 = (id)[v15 initWithZoneID:v17 subscriptionID:v18];

  id v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = *(id *)(a1 + 56);
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v28 = v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Subscription not found, attempting to create one", buf, 0xCu);
  }
  int v23 = *(void **)(a1 + 56);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_186;
  v24[3] = &unk_1E6A0A3F0;
  objc_copyWeak(&v26, (id *)(a1 + 64));
  id v25 = *(id *)(a1 + 48);
  objc_msgSend(v23, "__saveSubscription:completionHandler:", v4, v24);

  objc_destroyWeak(&v26);
LABEL_14:
}

void __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = WeakRetained;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        id v12 = objc_msgSend(v6, "hmd_conciseCKError");
        id v13 = [v12 shortDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v11;
        __int16 v32 = 2112;
        v33 = v13;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not modify iCloud subscription: %@", buf, 0x16u);
      }
      id v14 = [v9 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_187;
      block[3] = &unk_1E6A19B30;
      id v15 = &v29;
      id v29 = *(id *)(a1 + 32);
      dispatch_async(v14, block);
LABEL_10:

      goto LABEL_11;
    }
    if (v5)
    {
      id v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = WeakRetained;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [*(id *)(a1 + 32) zone];
        id v21 = [v20 zoneID];
        [v21 zoneName];
        uint64_t v22 = v24 = v16;
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v19;
        __int16 v32 = 2112;
        v33 = v22;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Registered for push notifications from record zone %@", buf, 0x16u);

        id v16 = v24;
      }

      int v23 = [v17 workQueue];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      id v25[2] = __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_188;
      v25[3] = &unk_1E6A197C8;
      id v15 = &v26;
      id v26 = *(id *)(a1 + 32);
      v27 = v5;
      dispatch_async(v23, v25);

      id v14 = v27;
      goto LABEL_10;
    }
  }
LABEL_11:
}

uint64_t __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_187(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSubscription:0];
}

uint64_t __45__HMDCloudManager__setupSubscriptionForZone___block_invoke_188(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSubscription:*(void *)(a1 + 40)];
}

- (void)_registerForProxSetupNotifications
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = +[HMDDeviceSetupManager sharedManager];
  [v4 addObserver:self selector:sel__auditProxSetupNotification_ name:@"HMDDeviceSetupManagerUpdatedRunningNotification" object:v3];
}

- (void)_auditProxSetupNotification:(id)a3
{
  id v4 = [a3 userInfo];
  int v5 = objc_msgSend(v4, "hmf_BOOLForKey:", @"running");

  if (v5)
  {
    [(HMDCloudManager *)self _startWatchdogControllerKeyPollTimer];
    id v6 = [(HMDCloudManager *)self controllerKeyPollTimer];

    if (v6)
    {
      [(HMDCloudManager *)self _stopControllerKeyPollTimer];
      [(HMDCloudManager *)self setCurrentBackoffTimerValuesInMinutes:0];
      [(HMDCloudManager *)self _startControllerKeyPollTimer];
      int v7 = [(HMDCloudManager *)self dataSource];
      int v8 = [v7 isControllerKeyAvailable];

      if (v8) {
        [(HMDCloudManager *)self _handleControllerKeyAvailable];
      }
      id v9 = [(HMDCloudManager *)self cloudDataSyncStateFilter];
      [v9 kickResetConfigDisplayTimer];
    }
  }
  else
  {
    [(HMDCloudManager *)self _stopWatchdogControllerKeyPollTimer];
  }
}

- (void)_stopControllerKeyPollTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudManager *)self controllerKeyPollTimer];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    int v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cancelling controller key poll timer", (uint8_t *)&v9, 0xCu);
    }
    int v8 = [(HMDCloudManager *)v5 controllerKeyPollTimer];
    dispatch_source_cancel(v8);

    [(HMDCloudManager *)v5 setControllerKeyPollTimer:0];
  }
}

- (void)_startControllerKeyPollTimerWithValue:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(HMDCloudManager *)self _stopControllerKeyPollTimer];
  int v5 = [(HMDCloudManager *)self workQueue];
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);
  [(HMDCloudManager *)self setControllerKeyPollTimer:v6];

  int v7 = [(HMDCloudManager *)self controllerKeyPollTimer];
  dispatch_time_t v8 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);

  objc_initWeak(&location, self);
  int v9 = [(HMDCloudManager *)self controllerKeyPollTimer];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __57__HMDCloudManager__startControllerKeyPollTimerWithValue___block_invoke;
  handler[3] = &unk_1E6A15B88;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  dispatch_source_set_event_handler(v9, handler);

  id v10 = [(HMDCloudManager *)self controllerKeyPollTimer];
  dispatch_resume(v10);

  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  HMFGetOSLogHandle();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v19 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting controller key poll timer", buf, 0xCu);
  }
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __57__HMDCloudManager__startControllerKeyPollTimerWithValue___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = WeakRetained;
    int v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dispatch_source_t v6 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Controller key poll timer fired", (uint8_t *)&v17, 0xCu);
    }
    int v7 = [v4 dataSource];
    int v8 = [v7 isControllerKeyAvailable];

    if (v8)
    {
      [v4 _handleControllerKeyAvailable];
    }
    else
    {
      uint64_t v9 = controllerKeyPollInterval;
      uint64_t v10 = [v4 watchdogControllerKeyPollTimer];
      if (v10
        && (uint64_t v11 = (void *)v10,
            +[HMDDeviceSetupManager sharedManager],
            id v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v12 isRunning],
            v12,
            v11,
            v13))
      {
        uint64_t v14 = aggressiveControllerKeyPollInterval;
      }
      else if (*(void *)(a1 + 40) <= v9)
      {
        uint64_t v14 = v9;
      }
      else
      {
        uint64_t v14 = *(void *)(a1 + 40);
      }
      id v15 = [v4 controllerKeyPollTimer];
      dispatch_time_t v16 = dispatch_time(0, 1000000000 * v14);
      dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
    }
  }
}

- (void)_startControllerKeyPollTimerWithBackoff
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudManager *)self currentBackoffTimerValuesInMinutes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int v5 = [(HMDCloudManager *)self currentBackoffTimerValuesInMinutes];
    dispatch_source_t v6 = [v5 objectAtIndex:0];
    uint64_t v7 = [v6 integerValue];

    int v8 = [(HMDCloudManager *)self currentBackoffTimerValuesInMinutes];
    unint64_t v9 = [v8 count];

    if (v9 >= 2)
    {
      uint64_t v10 = [(HMDCloudManager *)self currentBackoffTimerValuesInMinutes];
      [v10 removeObjectAtIndex:0];
    }
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting a back off timer with %lld minutes timeout", (uint8_t *)&v19, 0x16u);
    }
    [(HMDCloudManager *)v12 _startControllerKeyPollTimerWithValue:60 * v7];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    dispatch_time_t v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Current back off timer values count is 0?", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)_startControllerKeyPollTimer
{
  uint64_t v3 = controllerKeyPollInterval;
  uint64_t v4 = [(HMDCloudManager *)self watchdogControllerKeyPollTimer];

  if (v4) {
    uint64_t v5 = aggressiveControllerKeyPollInterval;
  }
  else {
    uint64_t v5 = v3;
  }
  [(HMDCloudManager *)self _startControllerKeyPollTimerWithValue:v5];
}

- (void)_stopWatchdogControllerKeyPollTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDCloudManager *)self watchdogControllerKeyPollTimer];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = self;
    dispatch_source_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cancelling watchdog controller key poll timer", (uint8_t *)&v9, 0xCu);
    }
    int v8 = [(HMDCloudManager *)v5 watchdogControllerKeyPollTimer];
    dispatch_source_cancel(v8);

    [(HMDCloudManager *)v5 setWatchdogControllerKeyPollTimer:0];
  }
}

- (void)_startWatchdogControllerKeyPollTimer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(HMDCloudManager *)self _stopWatchdogControllerKeyPollTimer];
  uint64_t v3 = watchdogControllerKeyPollTimeout;
  uint64_t v4 = [(HMDCloudManager *)self workQueue];
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  [(HMDCloudManager *)self setWatchdogControllerKeyPollTimer:v5];

  dispatch_source_t v6 = [(HMDCloudManager *)self watchdogControllerKeyPollTimer];
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * v3);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);

  objc_initWeak(&location, self);
  int v8 = [(HMDCloudManager *)self watchdogControllerKeyPollTimer];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  dispatch_time_t v16 = __55__HMDCloudManager__startWatchdogControllerKeyPollTimer__block_invoke;
  int v17 = &unk_1E6A16E40;
  objc_copyWeak(&v18, &location);
  dispatch_source_set_event_handler(v8, &v14);

  int v9 = [(HMDCloudManager *)self watchdogControllerKeyPollTimer];
  dispatch_resume(v9);

  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  uint64_t v11 = self;
  HMFGetOSLogHandle();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v21 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting watchdog controller key poll timer", buf, 0xCu);
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __55__HMDCloudManager__startWatchdogControllerKeyPollTimer__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = WeakRetained;
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      dispatch_source_t v5 = HMFGetLogIdentifier();
      int v6 = 138543362;
      dispatch_time_t v7 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Watchdog controller key poll timer fired", (uint8_t *)&v6, 0xCu);
    }
    [v3 _stopWatchdogControllerKeyPollTimer];
  }
}

- (void)_handleControllerKeyAvailable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v4 = self;
  dispatch_source_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    dispatch_time_t v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Controller key is available, fetching new changes", (uint8_t *)&v15, 0xCu);
  }
  dispatch_time_t v7 = [(HMDCloudManager *)v4 delegate];
  [v7 reloadHomeDataFromLocalStore:0];

  uint64_t v8 = [(HMDCloudManager *)v4 controllerKeyAvailableNotificationHandler];

  if (v8)
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = v4;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v15 = 138543362;
      dispatch_time_t v16 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Controller key is available, notifying availability", (uint8_t *)&v15, 0xCu);
    }
    int v13 = [(HMDCloudManager *)v10 clientCallbackQueue];
    uint64_t v14 = [(HMDCloudManager *)v10 controllerKeyAvailableNotificationHandler];
    dispatch_async(v13, v14);
  }
  [(HMDCloudManager *)v4 _stopControllerKeyPollTimer];
  [(HMDCloudManager *)v4 _stopFetchRetryTimer];
  [(HMDCloudManager *)v4 fetchDatabaseZoneChanges];
}

- (void)_handleKeychainSyncStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[HMDCloudManager setKeychainSyncEnabled:](self, "setKeychainSyncEnabled:");
  if (v3)
  {
    if ([(HMDCloudManager *)self accountActive])
    {
      dispatch_source_t v5 = [(HMDCloudManager *)self dataSource];
      int v6 = [v5 isControllerKeyAvailable];

      if (v6)
      {
        [(HMDCloudManager *)self _handleControllerKeyAvailable];
      }
      else if ([(HMDCloudManager *)self cloudHomeDataRecordExists])
      {
        uint64_t v11 = (void *)MEMORY[0x1D9452090]();
        id v12 = self;
        int v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = HMFGetLogIdentifier();
          int v15 = 138543362;
          dispatch_time_t v16 = v14;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Keychain is enabled and data in cloud. We don't have controller key as yet, starting poll timer", (uint8_t *)&v15, 0xCu);
        }
        [(HMDCloudManager *)v12 _startControllerKeyPollTimer];
      }
    }
  }
  else
  {
    dispatch_time_t v7 = (void *)MEMORY[0x1D9452090]([(HMDCloudManager *)self _stopControllerKeyPollTimer]);
    uint64_t v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v15 = 138543362;
      dispatch_time_t v16 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received message that keychain sync is not available", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)handleKeychainStateChangedNotification:(id)a3
{
  uint64_t v4 = [(HMDCloudManager *)self dataSource];
  char v5 = [v4 isKeychainSyncEnabled];

  int v6 = [(HMDCloudManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMDCloudManager_handleKeychainStateChangedNotification___block_invoke;
  v7[3] = &unk_1E6A19B58;
  v7[4] = self;
  char v8 = v5;
  dispatch_async(v6, v7);
}

uint64_t __58__HMDCloudManager_handleKeychainStateChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeychainSyncStateChanged:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopFetchPollTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDCloudManager *)self pollTimer];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    char v5 = self;
    int v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cancelling cloud sync poll timer", (uint8_t *)&v9, 0xCu);
    }
    char v8 = [(HMDCloudManager *)v5 pollTimer];
    dispatch_source_cancel(v8);

    [(HMDCloudManager *)v5 setPollTimer:0];
  }
}

- (void)_startFetchPollTimer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(HMDCloudManager *)self _stopFetchPollTimer];
  BOOL v3 = [(HMDCloudManager *)self workQueue];
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  [(HMDCloudManager *)self setPollTimer:v4];

  uint32_t v5 = arc4random_uniform(0x1C21u);
  int v6 = (void *)MEMORY[0x1D9452090]();
  dispatch_time_t v7 = self;
  char v8 = HMFGetOSLogHandle();
  uint64_t v9 = v5 + 86400;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v10;
    __int16 v27 = 2048;
    uint64_t v28 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Cloud sync initial poll timer set to %lld secs", buf, 0x16u);
  }
  uint64_t v11 = [(HMDCloudManager *)v7 pollTimer];
  dispatch_time_t v12 = dispatch_walltime(0, 1000000000 * v9);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);

  objc_initWeak(&location, v7);
  int v13 = [(HMDCloudManager *)v7 pollTimer];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  __int16 v21 = __39__HMDCloudManager__startFetchPollTimer__block_invoke;
  uint64_t v22 = &unk_1E6A16E40;
  objc_copyWeak(&v23, &location);
  dispatch_source_set_event_handler(v13, &v19);

  uint64_t v14 = [(HMDCloudManager *)v7 pollTimer];
  dispatch_resume(v14);

  int v15 = (void *)MEMORY[0x1D9452090]();
  dispatch_time_t v16 = v7;
  HMFGetOSLogHandle();
  uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v26 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting cloud sync poll timer", buf, 0xCu);
  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __39__HMDCloudManager__startFetchPollTimer__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = WeakRetained;
    dispatch_source_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint32_t v5 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Cloud sync poll timer fired, fetching any new changes", (uint8_t *)&v13, 0xCu);
    }
    [v3 _stopFetchRetryTimer];
    [v3 fetchDatabaseZoneChanges];
    uint64_t v6 = arc4random_uniform(0x1C21u) + 86400;
    dispatch_time_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = v3;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Next cloud sync poll timer set to %lld secs", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = [v8 pollTimer];
    dispatch_time_t v12 = dispatch_walltime(0, 1000000000 * v6);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
}

- (void)_stopFetchRetryTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudManager *)self retryTimer];

  if (v3)
  {
    dispatch_source_t v4 = (void *)MEMORY[0x1D9452090]();
    uint32_t v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cancelling fetch retry timer", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [(HMDCloudManager *)v5 retryTimer];
    dispatch_source_cancel(v8);

    [(HMDCloudManager *)v5 setRetryTimer:0];
  }
}

- (void)_startFetchRetryTimer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudManager *)self retryTimer];

  if (!v3)
  {
    dispatch_source_t v4 = [(HMDCloudManager *)self workQueue];
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    [(HMDCloudManager *)self setRetryTimer:v5];

    uint64_t v6 = [(HMDCloudManager *)self retryTimer];
    dispatch_time_t v7 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    objc_initWeak(&location, self);
    id v8 = [(HMDCloudManager *)self retryTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__HMDCloudManager__startFetchRetryTimer__block_invoke;
    handler[3] = &unk_1E6A16CE0;
    objc_copyWeak(&v15, &location);
    void handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    int v9 = [(HMDCloudManager *)self retryTimer];
    dispatch_resume(v9);

    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    HMFGetOSLogHandle();
    dispatch_time_t v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting retry fetch timer", buf, 0xCu);
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __40__HMDCloudManager__startFetchRetryTimer__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    dispatch_source_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetch retry timer fired, fetching any new changes", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) fetchDatabaseZoneChanges];
  }
}

- (void)_updateServerTokenStatusOnCloudFilter
{
  id v3 = [(HMDCloudManager *)self legacyZone];
  id v4 = [v3 serverChangeToken];
  BOOL v5 = v4 != 0;

  id v6 = [(HMDCloudManager *)self cloudDataSyncStateFilter];
  [v6 updateServerTokenAvailable:v5];
}

- (void)updateServerTokenStatusOnCloudFilter
{
  id v3 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDCloudManager_updateServerTokenStatusOnCloudFilter__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__HMDCloudManager_updateServerTokenStatusOnCloudFilter__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateServerTokenStatusOnCloudFilter];
}

- (void)initializeServerTokenStatusOnCloudFilter
{
  objc_initWeak(&location, self);
  id v3 = [(HMDCloudManager *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__HMDCloudManager_initializeServerTokenStatusOnCloudFilter__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__HMDCloudManager_initializeServerTokenStatusOnCloudFilter__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v2 = [WeakRetained legacyZone];
    id v3 = [v2 serverChangeToken];
    BOOL v4 = v3 != 0;

    id v5 = [v6 cloudDataSyncStateFilter];
    [v5 updateWithoutDataSynCheckServerTokenAvailable:v4];

    id WeakRetained = v6;
  }
}

- (BOOL)_validFetchRetryCKErrorCode:(int64_t)a3
{
  return a3 == 1 || a3 == 4;
}

- (void)_forceCleanCloud:(BOOL)a3 fetchTransaction:(id)a4 completionHandler:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 cloudZone];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    int v13 = [v12 homeDataObjectID];
    char v14 = [v8 doesRecordExistInCacheWithObjectID:v13];

    id v15 = [v12 homeDataV3ObjectID];
    char v16 = [v8 doesRecordExistInCacheWithObjectID:v15];

    objc_initWeak(location, self);
    uint64_t v17 = [(HMDCloudManager *)self homeManagerZone];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke;
    v22[3] = &unk_1E6A0A3C8;
    objc_copyWeak(&v25, location);
    id v24 = v9;
    BOOL v26 = a3;
    id v23 = v12;
    char v27 = v14 | v16;
    [(HMDCloudManager *)self _fetchAndVerifyZoneRootRecord:v17 completionHandler:v22];

    objc_destroyWeak(&v25);
    objc_destroyWeak(location);
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Legacy zone does not exist, cannot process force clean", (uint8_t *)location, 0xCu);
    }
  }
}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = WeakRetained;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        id v12 = objc_msgSend(v6, "hmd_conciseCKError");
        int v13 = [v12 shortDescription];
        *(_DWORD *)buf = 138543618;
        char v27 = v11;
        __int16 v28 = 2112;
        uint64_t v29 = v13;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine fetch zone information to determine local data should be cleaned %@", buf, 0x16u);
      }
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v6);
      }
    }
    else if (a2)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_180;
      v21[3] = &unk_1E6A15C28;
      objc_copyWeak(&v24, (id *)(a1 + 48));
      char v25 = *(unsigned char *)(a1 + 56);
      id v22 = *(id *)(a1 + 32);
      id v23 = *(id *)(a1 + 40);
      [WeakRetained _resetCloudZonesIgnoreHomeManager:0 completionHandler:v21];

      objc_destroyWeak(&v24);
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_182;
      v15[3] = &unk_1E6A0A3A0;
      objc_copyWeak(&v18, (id *)(a1 + 48));
      char v19 = *(unsigned char *)(a1 + 56);
      id v16 = *(id *)(a1 + 32);
      char v20 = *(unsigned char *)(a1 + 57);
      id v17 = *(id *)(a1 + 40);
      [WeakRetained _resetCloudZonesIgnoreHomeManager:1 completionHandler:v15];

      objc_destroyWeak(&v18);
    }
  }
}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_180(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_8;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    id v15 = [*(id *)(a1 + 32) homeDataV3RecordID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v16[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_2;
    v16[3] = &unk_1E6A0A350;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    id v17 = *(id *)(a1 + 40);
    objc_msgSend(v5, "__deleteRecordWithID:completionHandler:", v15, v16);

    objc_destroyWeak(&v18);
    goto LABEL_11;
  }
  id v6 = [WeakRetained cloudDataDeletedNotificationHandler];

  if (v6)
  {
    int v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v20 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud home data deleted notification block", buf, 0xCu);
    }
    uint64_t v11 = [v8 clientCallbackQueue];
    id v12 = [v8 cloudDataDeletedNotificationHandler];
    dispatch_async(v11, v12);

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, 1, v3);
    }
  }
  else
  {
LABEL_8:
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v3);
    }
  }
LABEL_11:
}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    id v15 = [*(id *)(a1 + 32) homeDataV3RecordID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v16[2] = __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_2_183;
    v16[3] = &unk_1E6A0A378;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    char v19 = *(unsigned char *)(a1 + 57);
    id v17 = *(id *)(a1 + 40);
    objc_msgSend(v5, "__deleteRecordWithID:completionHandler:", v15, v16);

    objc_destroyWeak(&v18);
    goto LABEL_12;
  }
  if (*(unsigned char *)(a1 + 57)
    && ([WeakRetained cloudDataDeletedNotificationHandler],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    int v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud home data deleted notification block", buf, 0xCu);
    }
    uint64_t v11 = [v8 clientCallbackQueue];
    id v12 = [v8 cloudDataDeletedNotificationHandler];
    dispatch_async(v11, v12);

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, 1, v3);
    }
  }
  else
  {
LABEL_9:
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v3);
    }
  }
LABEL_12:
}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_2_183(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v6 && WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v8;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = objc_msgSend(v6, "hmd_conciseCKError");
      uint64_t v14 = [v13 shortDescription];
      int v25 = 138543618;
      BOOL v26 = v12;
      __int16 v27 = 2112;
      __int16 v28 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to delete Version 3 record due to error %@", (uint8_t *)&v25, 0x16u);
    }
  }
  if (*(unsigned char *)(a1 + 48)
    && ([v8 cloudDataDeletedNotificationHandler],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = v8;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      char v19 = HMFGetLogIdentifier();
      int v25 = 138543362;
      BOOL v26 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud home data deleted notification block", (uint8_t *)&v25, 0xCu);
    }
    char v20 = [v17 clientCallbackQueue];
    uint64_t v21 = [v17 cloudDataDeletedNotificationHandler];
    dispatch_async(v20, v21);

    uint64_t v22 = *(void *)(a1 + 32);
    if (v22)
    {
      id v23 = *(void (**)(void))(v22 + 16);
LABEL_14:
      v23();
    }
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24)
    {
      id v23 = *(void (**)(void))(v24 + 16);
      goto LABEL_14;
    }
  }
}

void __71__HMDCloudManager__forceCleanCloud_fetchTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v6 && WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v8;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = objc_msgSend(v6, "hmd_conciseCKError");
      uint64_t v14 = [v13 shortDescription];
      int v25 = 138543618;
      BOOL v26 = v12;
      __int16 v27 = 2112;
      __int16 v28 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to delete Version 3 record due to error %@", (uint8_t *)&v25, 0x16u);
    }
  }
  id v15 = [v8 cloudDataDeletedNotificationHandler];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = v8;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      char v19 = HMFGetLogIdentifier();
      int v25 = 138543362;
      BOOL v26 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud home data deleted notification block", (uint8_t *)&v25, 0xCu);
    }
    char v20 = [v17 clientCallbackQueue];
    uint64_t v21 = [v17 cloudDataDeletedNotificationHandler];
    dispatch_async(v20, v21);

    uint64_t v22 = *(void *)(a1 + 32);
    if (v22)
    {
      id v23 = *(void (**)(void))(v22 + 16);
LABEL_13:
      v23();
    }
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24)
    {
      id v23 = *(void (**)(void))(v24 + 16);
      goto LABEL_13;
    }
  }
}

- (void)updateCloudDataSyncFilterState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HMDCloudManager *)self cloudDataSyncStateFilter];
  [v4 updateCloudDataSyncState:v3];
}

- (void)setAccountActive:(BOOL)a3
{
  self->_accountActive = a3;
  id v4 = [(HMDCloudManager *)self accountActiveUpdateHandler];

  if (v4)
  {
    id v5 = [(HMDCloudManager *)self accountActiveUpdateHandler];
    v5[2](v5, self->_accountActive);
  }
}

- (void)_accountIsActive
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Marking account is active", buf, 0xCu);
  }
  [(HMDCloudManager *)v4 setAccountActive:1];
  int v7 = [(HMDCloudManager *)v4 dataSource];
  -[HMDCloudManager _handleKeychainSyncStateChanged:](v4, "_handleKeychainSyncStateChanged:", [v7 isKeychainSyncEnabled]);

  [(HMDCloudManager *)v4 _startFetchPollTimer];
  [(HMDCloudManager *)v4 fetchDatabaseZoneChanges];
  id v8 = [(HMDCloudManager *)v4 legacyZone];
  [(HMDCloudManager *)v4 _setupSubscriptionForZone:v8];

  id v9 = [(HMDCloudManager *)v4 homeManagerZone];
  [(HMDCloudManager *)v4 _setupSubscriptionForZone:v9];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [(HMDCloudManager *)v4 cloudCache];
  uint64_t v11 = [v10 allHomeZones];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(HMDCloudManager *)v4 _setupSubscriptionForZone:*(void *)(*((void *)&v16 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)_createZoneAndFetchChanges:(id)a3
{
  id v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMDCloudManager *)self _stopControllerKeyPollTimer];
  [(HMDCloudManager *)self _stopFetchRetryTimer];
  id v5 = [(HMDCloudManager *)self homeManagerZone];
  id v6 = [(HMDCloudManager *)self metadataZone];
  uint64_t v7 = [(HMDCloudManager *)self legacyZone];
  id v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    objc_initWeak(&location, self);
    id v9 = [v8 serverChangeToken];

    if (v9)
    {
      v25[0] = @"84968B22-8974-4102-AAA6-7B9C763A14B5";
      v25[1] = @"9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300";
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_2;
      v18[3] = &unk_1E6A16150;
      objc_copyWeak(&v20, &location);
      id v19 = v4;
      [v8 cloudRecordWithNames:v10 completionHandler:v18];

      objc_destroyWeak(&v20);
    }
    else
    {
      v24[0] = v5;
      v24[1] = v6;
      v24[2] = v8;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_5;
      v14[3] = &unk_1E6A14C10;
      objc_copyWeak(&v17, &location);
      id v16 = v4;
      id v13 = v12;
      id v15 = v13;
      [(HMDCloudManager *)self _verifyHH2SentinelCloudZoneExist:v14];

      objc_destroyWeak(&v17);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v11 = [(HMDCloudManager *)self clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v23 = v4;
    dispatch_async(v11, block);
  }
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_3;
    block[3] = &unk_1E6A193D0;
    void block[4] = v6;
    id v9 = v4;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);
  }
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = [WeakRetained clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_6;
      block[3] = &unk_1E6A19530;
      id v20 = *(id *)(a1 + 40);
      id v19 = v5;
      dispatch_async(v8, block);

      id v9 = v20;
    }
    else
    {
      if (!a2)
      {
        [WeakRetained _verifyZonesExist:*(void *)(a1 + 32) zoneIndex:0 completion:*(void *)(a1 + 40)];
        goto LABEL_9;
      }
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = v7;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot continue HH1 initial fetch because HH2 sentinel zone exists", buf, 0xCu);
      }
      uint64_t v14 = [v11 delegate];
      [v14 makeSureWeAreRunningInRightEnvironment:1];

      id v15 = [v11 clientCallbackQueue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      id v16[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_179;
      v16[3] = &unk_1E6A186E0;
      id v17 = *(id *)(a1 + 40);
      dispatch_async(v15, v16);

      id v9 = v17;
    }
  }
LABEL_9:
}

uint64_t __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_179(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:77 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_3(id *a1)
{
  objc_msgSend(a1[4], "setCloudHomeDataRecordExists:", objc_msgSend(a1[5], "containsObject:", @"84968B22-8974-4102-AAA6-7B9C763A14B5") ^ 1);
  char v2 = [a1[5] containsObject:@"9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300"] ^ 1;
  BOOL v3 = [a1[4] clientCallbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_4;
  block[3] = &unk_1E6A113D0;
  id v4 = a1[6];
  void block[4] = a1[4];
  id v6 = v4;
  char v7 = v2;
  dispatch_async(v3, block);

  [a1[4] _accountIsActive];
}

uint64_t __46__HMDCloudManager__createZoneAndFetchChanges___block_invoke_4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = [*(id *)(result + 32) cloudHomeDataRecordExists];
    uint64_t v4 = *(unsigned __int8 *)(v2 + 48);
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v1 + 16);
    return v5(v1, v3, v4, 0);
  }
  return result;
}

- (void)_verifyZonesExist:(id)a3 zoneIndex:(unint64_t)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8 && [v8 count] - 1 >= a4)
  {
    id v16 = [v8 objectAtIndex:a4];
    objc_initWeak((id *)buf, self);
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)int v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VerifyZone", "", v25, 2u);
    }
    long long v18 = [v16 zone];
    id v19 = [v18 zoneID];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_163;
    v20[3] = &unk_1E6A0A328;
    objc_copyWeak(v24, (id *)buf);
    v24[1] = (id)0xEEEEB0B5B2B2EEEELL;
    id v15 = v16;
    id v21 = v15;
    id v23 = v9;
    v24[2] = (id)a4;
    id v22 = v8;
    [(HMDCloudManager *)self __fetchRecordZoneWithID:v19 completionHandler:v20];

    objc_destroyWeak(v24);
    objc_destroyWeak((id *)buf);
    goto LABEL_10;
  }
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No cloud zones to process", buf, 0xCu);
  }
  if (v9)
  {
    uint64_t v14 = [(HMDCloudManager *)v11 clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v27 = v9;
    dispatch_async(v14, block);

    id v15 = v27;
LABEL_10:
  }
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v39 = a2;
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  char v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained[1];
    id v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 64);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v9, OS_SIGNPOST_INTERVAL_END, v10, "VerifyZone", "", buf, 2u);
    }

    if (v5)
    {
      BOOL IsZoneNotExistError = HMDCloudManagerIsZoneNotExistError(v5);
      context = (void *)MEMORY[0x1D9452090]();
      uint64_t v12 = v7;
      id v13 = HMFGetOSLogHandle();
      uint64_t v14 = v13;
      if (IsZoneNotExistError)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v15 = HMFGetLogIdentifier();
          id v16 = [*(id *)(a1 + 32) zone];
          id v17 = [v16 zoneID];
          long long v18 = [v17 zoneName];
          *(_DWORD *)buf = 138543618;
          v52 = v15;
          __int16 v53 = 2114;
          uint64_t v54 = v18;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch record zone %{public}@, creating", buf, 0x16u);
        }
        id v19 = [*(id *)(a1 + 32) zone];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_164;
        v46[3] = &unk_1E6A0A300;
        objc_copyWeak(v50, (id *)(a1 + 56));
        id v47 = *(id *)(a1 + 32);
        id v20 = *(id *)(a1 + 48);
        id v21 = *(void **)(a1 + 72);
        id v49 = v20;
        v50[1] = v21;
        id v48 = *(id *)(a1 + 40);
        objc_msgSend(v12, "__saveRecordZone:completionHandler:", v19, v46);

        objc_destroyWeak(v50);
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = HMFGetLogIdentifier();
          id v36 = [*(id *)(a1 + 32) zone];
          uint64_t v30 = [v36 zoneID];
          uint64_t v31 = [v30 zoneName];
          __int16 v32 = objc_msgSend(v5, "hmd_conciseCKError");
          v33 = [v32 shortDescription];
          *(_DWORD *)buf = 138543874;
          v52 = v29;
          __int16 v53 = 2114;
          uint64_t v54 = v31;
          __int16 v55 = 2114;
          v56 = v33;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch record zone %{public}@ due to error: %{public}@", buf, 0x20u);
        }
        if (*(void *)(a1 + 48))
        {
          uint64_t v34 = [v12 clientCallbackQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_174;
          block[3] = &unk_1E6A19530;
          id v45 = *(id *)(a1 + 48);
          id v44 = v5;
          dispatch_async(v34, block);
        }
      }
    }
    else
    {
      contexta = (void *)MEMORY[0x1D9452090]();
      id v22 = v7;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        int v25 = [*(id *)(a1 + 32) zone];
        BOOL v26 = [v25 zoneID];
        id v27 = [v26 zoneName];
        *(_DWORD *)buf = 138543618;
        v52 = v24;
        __int16 v53 = 2112;
        uint64_t v54 = v27;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Verified record zone %@ exists", buf, 0x16u);
      }
      unint64_t v28 = *(void *)(a1 + 72);
      if (v28 >= [*(id *)(a1 + 40) count] - 1)
      {
        int v35 = [v22 workQueue];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_175;
        v40[3] = &unk_1E6A10B58;
        v40[4] = v22;
        id v41 = *(id *)(a1 + 48);
        objc_copyWeak(&v42, (id *)(a1 + 56));
        dispatch_async(v35, v40);

        objc_destroyWeak(&v42);
      }
      else
      {
        [v22 _verifyZonesExist:*(void *)(a1 + 40) zoneIndex:*(void *)(a1 + 72) + 1 completion:*(void *)(a1 + 48)];
      }
    }
  }
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_164(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    os_signpost_id_t v10 = HMFGetOSLogHandle();
    id v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        [*(id *)(a1 + 32) zone];
        int v25 = v28 = v5;
        id v13 = [v25 zoneID];
        [v13 zoneName];
        uint64_t v14 = v26 = v8;
        id v15 = objc_msgSend(v6, "hmd_conciseCKError");
        id v16 = [v15 shortDescription];
        *(_DWORD *)buf = 138543874;
        __int16 v37 = v12;
        __int16 v38 = 2112;
        id v39 = v14;
        __int16 v40 = 2112;
        id v41 = v16;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to create record zone %@ due to error: %@", buf, 0x20u);

        id v8 = v26;
        id v5 = v28;
      }
      if (*(void *)(a1 + 48))
      {
        id v17 = [v9 clientCallbackQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_165;
        block[3] = &unk_1E6A19530;
        id v35 = *(id *)(a1 + 48);
        id v34 = v6;
        dispatch_async(v17, block);

        long long v18 = v35;
LABEL_12:
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = id v29 = v5;
        [*(id *)(a1 + 32) zone];
        id v20 = v27 = v8;
        id v21 = [v20 zoneID];
        id v22 = [v21 zoneName];
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v19;
        __int16 v38 = 2112;
        id v39 = v22;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully created record zone %@", buf, 0x16u);

        id v8 = v27;
        id v5 = v29;
      }

      unint64_t v23 = *(void *)(a1 + 64);
      if (v23 >= [*(id *)(a1 + 40) count] - 1)
      {
        uint64_t v24 = [v9 workQueue];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_166;
        v30[3] = &unk_1E6A10B58;
        v30[4] = v9;
        id v31 = *(id *)(a1 + 48);
        objc_copyWeak(&v32, (id *)(a1 + 56));
        dispatch_async(v24, v30);

        objc_destroyWeak(&v32);
        long long v18 = v31;
        goto LABEL_12;
      }
      [v9 _verifyZonesExist:*(void *)(a1 + 40) zoneIndex:*(void *)(a1 + 64) + 1 completion:*(void *)(a1 + 48)];
    }
  }
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_174(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_175(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] delegate];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_176;
    v9[3] = &unk_1E6A16268;
    id v10 = a1[5];
    objc_copyWeak(&v11, a1 + 6);
    [v2 verifyHomeDataFromCloud:v9];
    objc_destroyWeak(&v11);
    uint64_t v3 = v10;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = a1[4];
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Delegate is no longer valid", buf, 0xCu);
    }
    id v8 = a1[5];
    uint64_t v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Delegate is missing" reason:@"Delegate is nil" suggestion:0 underlyingError:0];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v3);
  }
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_176(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_2_177;
    block[3] = &unk_1E6A19B30;
    void block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_2_177(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accountIsActive];
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_165(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_166(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] delegate];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_173;
    v9[3] = &unk_1E6A16268;
    id v10 = a1[5];
    objc_copyWeak(&v11, a1 + 6);
    [v2 verifyHomeDataFromCloud:v9];
    objc_destroyWeak(&v11);
    uint64_t v3 = v10;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = a1[4];
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Delegate is no longer valid", buf, 0xCu);
    }
    id v8 = a1[5];
    uint64_t v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Delegate is missing" reason:@"Delegate is nil" suggestion:0 underlyingError:0];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v3);
  }
}

void __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_173(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_2;
    block[3] = &unk_1E6A19B30;
    void block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __58__HMDCloudManager__verifyZonesExist_zoneIndex_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accountIsActive];
}

- (void)_verifyHH2SentinelCloudZoneExist:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F1A320]);
  id v6 = (void *)[v5 initWithZoneName:@"HH2-CD9D5508-EAED-4462-A7CB-AFB779F35A71" ownerName:*MEMORY[0x1E4F19C08]];
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VerifyZone", "", buf, 2u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke;
  v10[3] = &unk_1E6A0A2D8;
  objc_copyWeak(v13, &location);
  v13[1] = (id)0xEEEEB0B5B2B2EEEELL;
  id v8 = v6;
  id v11 = v8;
  id v9 = v4;
  id v12 = v9;
  [(HMDCloudManager *)self __fetchRecordZoneWithID:v8 completionHandler:v10];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained[1];
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, v9, OS_SIGNPOST_INTERVAL_END, v10, "VerifyZone", "", buf, 2u);
  }

  if (!v6)
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = WeakRetained;
    unint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      int v25 = [*(id *)(a1 + 32) zoneName];
      *(_DWORD *)buf = 138543618;
      __int16 v40 = v24;
      __int16 v41 = 2114;
      uint64_t v42 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Verified HH2 sentinel record zone exists: %{public}@", buf, 0x16u);
    }
    long long v18 = [v22 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_162;
    block[3] = &unk_1E6A186E0;
    id v19 = &v33;
    id v33 = *(id *)(a1 + 40);
    id v20 = block;
    goto LABEL_12;
  }
  BOOL IsZoneNotExistError = HMDCloudManagerIsZoneNotExistError(v6);
  id v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = WeakRetained;
  uint64_t v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (IsZoneNotExistError)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [*(id *)(a1 + 32) zoneName];
      *(_DWORD *)buf = 138543618;
      __int16 v40 = v16;
      __int16 v41 = 2114;
      uint64_t v42 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Verified HH2 sentinel record zone does not exist: %{public}@", buf, 0x16u);
    }
    long long v18 = [v13 workQueue];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_160;
    v37[3] = &unk_1E6A186E0;
    id v19 = &v38;
    id v38 = *(id *)(a1 + 40);
    id v20 = v37;
LABEL_12:
    dispatch_async(v18, v20);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    BOOL v26 = HMFGetLogIdentifier();
    id v27 = [*(id *)(a1 + 32) zoneName];
    objc_msgSend(v6, "hmd_conciseCKError");
    v28 = id v31 = v5;
    id v29 = [v28 shortDescription];
    *(_DWORD *)buf = 138543874;
    __int16 v40 = v26;
    __int16 v41 = 2114;
    uint64_t v42 = v27;
    __int16 v43 = 2114;
    id v44 = v29;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch HH2 sentinel record zone %{public}@: %{public}@", buf, 0x20u);

    id v5 = v31;
  }

  uint64_t v30 = [v13 workQueue];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_161;
  v34[3] = &unk_1E6A19530;
  id v19 = &v36;
  id v36 = *(id *)(a1 + 40);
  id v35 = v6;
  dispatch_async(v30, v34);

  long long v18 = v35;
LABEL_16:
}

uint64_t __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_160(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_161(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

uint64_t __52__HMDCloudManager__verifyHH2SentinelCloudZoneExist___block_invoke_162(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_resetHomeDataRecordState
{
  uint64_t v3 = [(HMDCloudManager *)self legacyZone];
  [v3 setRecordsAvailable:0];

  [(HMDCloudManager *)self setCloudHomeDataRecordExists:0];
  [(HMDCloudManager *)self _stopControllerKeyPollTimer];
}

- (id)_changeTokenFromData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v16 = 0;
    id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v16];
    id v6 = v16;
    if (!v5)
    {
      char v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      HMFGetOSLogHandle();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        os_signpost_id_t v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v18 = v10;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive server change token from token data: %@", buf, 0x16u);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = self;
      HMFGetOSLogHandle();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v18 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to decode client Token data", buf, 0xCu);
      }

      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_handleAccountStatus:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (a3 == 1)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v18 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@iCloud account is available, going to start syncing data from the cloud", buf, 0xCu);
    }
    [(HMDCloudManager *)v8 _createZoneAndFetchChanges:v6];
    [(HMDCloudManager *)v8 registerForPushNotifications];
  }
  else
  {
    if (v10)
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v18 = v12;
      __int16 v19 = 2048;
      int64_t v20 = a3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@iCloud account status (%tu) is not available", buf, 0x16u);
    }
    [(HMDCloudManager *)v8 setAccountActive:0];
    [(HMDCloudManager *)v8 _stopFetchPollTimer];
    [(HMDCloudManager *)v8 _stopControllerKeyPollTimer];
    id v13 = [(HMDCloudManager *)v8 dataSource];
    -[HMDCloudManager setKeychainSyncEnabled:](v8, "setKeychainSyncEnabled:", [v13 isKeychainSyncEnabled]);

    if (v6)
    {
      uint64_t v14 = [(HMDCloudManager *)v8 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__HMDCloudManager__handleAccountStatus_completionHandler___block_invoke;
      block[3] = &unk_1E6A186E0;
      id v16 = v6;
      dispatch_async(v14, block);
    }
  }
}

void __58__HMDCloudManager__handleAccountStatus_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:75];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (void)updateAccountStatusChanged:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  char v7 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HMDCloudManager_updateAccountStatusChanged_completionHandler___block_invoke;
  block[3] = &unk_1E6A113D0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __64__HMDCloudManager_updateAccountStatusChanged_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = HMFBooleanToString();
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Account status has changed (accountIsActive %@), re-kicking query of current account state", (uint8_t *)&v9, 0x16u);
  }
  char v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    return [v7 fetchCurrentAccountStateWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else {
    return [v7 _handleAccountStatus:3 completionHandler:*(void *)(a1 + 40)];
  }
}

- (void)_processFetchCompletedWithError:(id)a3 serverToken:(id)a4 fetchTransaction:(id)a5 migrationOptions:(unint64_t)a6 completionHandler:(id)a7 moreRecordsComing:(BOOL)a8 emptyRecord:(BOOL)a9
{
  BOOL v9 = a8;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  __int16 v19 = [v17 cloudZone];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v20 = v19;
  }
  else {
    int64_t v20 = 0;
  }
  id v21 = v20;

  if (!v15)
  {
    if (v9)
    {
      id v35 = (void *)MEMORY[0x1D9452090]();
      id v36 = self;
      __int16 v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        id v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v85 = v38;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@More records expected, auto fetch in progress", buf, 0xCu);
      }
      goto LABEL_47;
    }
    if (![(HMDCloudManager *)self decryptionFailed] && !a9)
    {
LABEL_37:
      v62 = [(HMDCloudManager *)self dataSource];
      if ([v62 isControllerKeyAvailable])
      {
      }
      else
      {
        BOOL v63 = [(HMDCloudManager *)self cloudHomeDataRecordExists];

        if (v63)
        {
          v64 = (void *)MEMORY[0x1D9452090]();
          v65 = self;
          v66 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v85 = v67;
            _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_ERROR, "%{public}@We have data in the cloud, but no controller key yet, dropping downloaded record data", buf, 0xCu);
          }
          if (v18)
          {
            uint64_t v68 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:77 userInfo:0];
            uint64_t v69 = [(HMDCloudManager *)v65 clientCallbackQueue];
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v78[2] = __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke_156;
            v78[3] = &unk_1E6A19530;
            id v79 = v68;
            id v80 = v18;
            id v70 = v68;
            dispatch_async(v69, v78);
          }
          goto LABEL_47;
        }
      }
      if (!v18) {
        goto LABEL_47;
      }
      v71 = [(HMDCloudManager *)self clientCallbackQueue];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke_2;
      v74[3] = &unk_1E6A181A0;
      id v76 = v18;
      unint64_t v77 = a6;
      id v75 = 0;
      dispatch_async(v71, v74);

      v52 = v76;
LABEL_46:

      goto LABEL_47;
    }
    BOOL v53 = [(HMDCloudManager *)self decryptionFailed];
    uint64_t v54 = (void *)MEMORY[0x1D9452090]();
    __int16 v55 = self;
    v56 = HMFGetOSLogHandle();
    BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);
    if (v53)
    {
      if (v57)
      {
        v58 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v85 = v58;
        v59 = "%{public}@Resetting the cloud server token since we failed to decrypt the data";
LABEL_33:
        _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, v59, buf, 0xCu);
      }
    }
    else if (v57)
    {
      v58 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v85 = v58;
      v59 = "%{public}@Resetting the cloud server token since iCloud Switch is off";
      goto LABEL_33;
    }

    if (v21)
    {
      uint64_t v60 = [v21 homeDataObjectID];
      [v17 removeChangeWithObjectID:v60];

      v61 = [v21 homeDataV3ObjectID];
      [v17 removeChangeWithObjectID:v61];
    }
    [v17 setUpdatedServerChangeToken:0];
    [(HMDCloudManager *)v55 _resetCloudServerTokenData];
    id v16 = v73;
    goto LABEL_37;
  }
  id v22 = (void *)MEMORY[0x1D9452090]();
  unint64_t v23 = self;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v85 = v25;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because legacy fetch failed", buf, 0xCu);
  }
  BOOL v26 = [(HMDCloudManager *)v23 cloudCache];
  [v26 setDatabaseServerChangeToken:0];

  id v27 = [(HMDCloudManager *)v23 cloudCache];
  [v27 persistDatabaseServerChangeToken];

  id v28 = [v15 domain];
  uint64_t v29 = *MEMORY[0x1E4F19C40];
  if ([v28 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v30 = [v15 code];

    if (v30 == 21)
    {
      id v31 = (void *)MEMORY[0x1D9452090]();
      id v32 = v23;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v85 = v34;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Fetch failed due to expired token, resetting token and re-fetching", buf, 0xCu);
      }
      [(HMDCloudManager *)v32 _resetCloudServerTokenData];
      [(HMDCloudManager *)v32 _fetchLegacyTransaction:v17 forceFetch:0 accountCompletionHandler:0 dataCompletionHandler:v18];
      goto LABEL_47;
    }
  }
  else
  {
  }
  id v39 = [v15 domain];
  if ([v39 isEqualToString:v29])
  {
    BOOL v40 = -[HMDCloudManager _validFetchRetryCKErrorCode:](v23, "_validFetchRetryCKErrorCode:", [v15 code]);

    if (!v18 && v40) {
      [(HMDCloudManager *)v23 _startFetchRetryTimer];
    }
  }
  else
  {
  }
  __int16 v41 = (void *)MEMORY[0x1D9452090]();
  uint64_t v42 = v23;
  __int16 v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    id v44 = HMFGetLogIdentifier();
    objc_msgSend(v15, "hmd_conciseCKError");
    id v72 = v15;
    id v45 = v18;
    id v46 = v17;
    id v47 = v21;
    v49 = id v48 = v16;
    id v50 = [v49 shortDescription];
    *(_DWORD *)buf = 138543618;
    v85 = v44;
    __int16 v86 = 2112;
    uint64_t v87 = v50;
    _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Fetch failed with error: %@", buf, 0x16u);

    id v16 = v48;
    id v21 = v47;
    id v17 = v46;
    id v18 = v45;
    id v15 = v72;
  }
  if (v18)
  {
    v51 = [(HMDCloudManager *)v42 clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke;
    block[3] = &unk_1E6A19530;
    id v83 = v18;
    id v82 = v15;
    dispatch_async(v51, block);

    v52 = v83;
    goto LABEL_46;
  }
LABEL_47:
}

uint64_t __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke_156(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __145__HMDCloudManager__processFetchCompletedWithError_serverToken_fetchTransaction_migrationOptions_completionHandler_moreRecordsComing_emptyRecord___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (BOOL)_processFetchedTransaction:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v64 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received event that home data record has been modified", buf, 0xCu);
  }
  BOOL v9 = [(HMDCloudManager *)v6 logEventSubmitter];
  id v10 = +[HMDDecryptionCompletedLogEvent decryptionCompletedWithFailure:[(HMDCloudManager *)v6 decryptionFailed]];
  [v9 submitLogEvent:v10];

  __int16 v11 = [(HMDCloudManager *)v6 delegate];
  if ([v4 decryptionFailed])
  {
    id v12 = [(HMDCloudManager *)v6 legacyZone];
    [v12 setRecordsAvailable:0];

    uint64_t v13 = [(HMDCloudManager *)v6 dataSource];
    if ([v13 supportsKeyTransferServer])
    {
      uint64_t v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = v6;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v64 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Attempting to start key transfer because of failed decryption.", buf, 0xCu);
      }
      id v18 = [v13 keyTransferAgent];
      [v18 beginPairingWithCompletionHandler:0];
    }
    __int16 v19 = [(HMDCloudManager *)v6 legacyZone];
    int64_t v20 = [v19 serverChangeToken];
    char v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
    {
      id v22 = (void *)MEMORY[0x1D9452090]();
      unint64_t v23 = v6;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v64 = v25;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Resetting the server token data to nil", buf, 0xCu);
      }
      [(HMDCloudManager *)v23 _resetCloudServerTokenData];
      [v11 archiveServerToken:0];
    }
    if ([v4 iCloudSwitchStateEnabled])
    {
      BOOL v26 = [(HMDCloudManager *)v6 watchdogControllerKeyPollTimer];
      if (v26
        && (+[HMDDeviceSetupManager sharedManager],
            id v27 = objc_claimAutoreleasedReturnValue(),
            int v28 = [v27 isRunning],
            v27,
            v26,
            v28))
      {
        [(HMDCloudManager *)v6 _startControllerKeyPollTimer];
      }
      else
      {
        __int16 v41 = [(HMDCloudManager *)v6 currentBackoffTimerValuesInMinutes];
        BOOL v42 = v41 == 0;

        if (v42)
        {
          __int16 v43 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
          [(HMDCloudManager *)v6 setCurrentBackoffTimerValuesInMinutes:v43];

          for (uint64_t i = 0; i != 5; ++i)
          {
            id v45 = [(HMDCloudManager *)v6 currentBackoffTimerValuesInMinutes];
            id v46 = [NSNumber numberWithUnsignedInteger:sBackoffTimerValuesInMinutes[i]];
            [v45 addObject:v46];
          }
        }
        [(HMDCloudManager *)v6 _startControllerKeyPollTimerWithBackoff];
      }
    }
    id v47 = +[HMDDeviceSetupManager sharedManager];
    id v48 = [v47 followUpManager];
    [v48 startAdvertising:1];

    id v49 = (void *)MEMORY[0x1D9452090]();
    id v50 = v6;
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v64 = v52;
      _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Decryption has failed, updating to cloud data sync filter", buf, 0xCu);
    }
    BOOL v53 = [(HMDCloudManager *)v50 dataDecryptionFailedHandler];

    if (v53)
    {
      uint64_t v54 = [(HMDCloudManager *)v50 dataDecryptionFailedHandler];
      v54[2]();
    }
    __int16 v55 = [(HMDCloudManager *)v50 cloudDataSyncStateFilter];
    [v55 setDecryptionFailed:1];

    LOBYTE(v29) = 0;
  }
  else
  {
    int v29 = [v4 controllerIdentifierChanged];
    if (v29)
    {
      uint64_t v30 = (void *)MEMORY[0x1D9452090]();
      id v31 = v6;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v64 = v33;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Controller identifier has changed, erasing local home data", buf, 0xCu);
      }
      id v34 = dispatch_group_create();
      dispatch_group_enter(v34);
      objc_initWeak((id *)buf, v31);
      id v35 = [(HMDCloudManager *)v31 homeManagerZone];
      uint64_t v57 = MEMORY[0x1E4F143A8];
      uint64_t v58 = 3221225472;
      v59 = __46__HMDCloudManager__processFetchedTransaction___block_invoke;
      uint64_t v60 = &unk_1E6A0A2B0;
      objc_copyWeak(&v62, (id *)buf);
      id v36 = v34;
      v61 = v36;
      [(HMDCloudManager *)v31 _verifyAndRemoveZone:v35 completionHandler:&v57];

      dispatch_group_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
      objc_destroyWeak(&v62);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [v11 reloadHomeDataFromLocalStore:1];
    }
    -[HMDCloudManager setCurrentBackoffTimerValuesInMinutes:](v6, "setCurrentBackoffTimerValuesInMinutes:", 0, v57, v58, v59, v60);
    __int16 v37 = +[HMDDeviceSetupManager sharedManager];
    id v38 = [v37 followUpManager];
    [v38 stopAdvertising:1];

    if ([(HMDCloudManager *)v6 decryptionFailed]) {
      [v11 fetchAllZones];
    }
    id v39 = [(HMDCloudManager *)v6 legacyZone];
    [v39 setRecordsAvailable:1];

    BOOL v40 = [(HMDCloudManager *)v6 cloudDataSyncStateFilter];
    [v40 setDecryptionFailed:0];

    uint64_t v13 = [MEMORY[0x1E4F5BE48] systemStore];
    [v13 ensureControllerKeyExistsForAllViews];
  }

  return v29;
}

void __46__HMDCloudManager__processFetchedTransaction___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained delegate];
    if (a2)
    {
      BOOL v9 = v13;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      id v13[2] = __46__HMDCloudManager__processFetchedTransaction___block_invoke_2;
      v13[3] = &unk_1E6A15888;
      id v10 = &v14;
      objc_copyWeak(&v14, (id *)(a1 + 40));
      v13[4] = v8;
      v13[5] = *(id *)(a1 + 32);
      [v7 _removeAllHomeZonesCompletionHandler:v13];
    }
    else
    {
      BOOL v9 = v11;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __46__HMDCloudManager__processFetchedTransaction___block_invoke_3;
      v11[3] = &unk_1E6A15888;
      id v10 = &v12;
      objc_copyWeak(&v12, (id *)(a1 + 40));
      v11[4] = v8;
      v11[5] = *(id *)(a1 + 32);
      [v7 _verifyAndRemoveAllHomeZonesCompletionHandler:v11];
    }

    objc_destroyWeak(v10);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __46__HMDCloudManager__processFetchedTransaction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    [*(id *)(a1 + 32) eraseLocalHomeData];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __46__HMDCloudManager__processFetchedTransaction___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    [*(id *)(a1 + 32) eraseLocalHomeData];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_fetchLegacyTransaction:(id)a3 forceFetch:(BOOL)a4 accountCompletionHandler:(id)a5 dataCompletionHandler:(id)a6
{
  BOOL v8 = a4;
  v137[1] = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v79 = a5;
  id v76 = (void (**)(void))a6;
  id v10 = [(HMDCloudManager *)self dataSource];
  __int16 v11 = [v10 keyTransferAgent];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  id v75 = v13;
  id v14 = [v13 progressState];

  if (v14)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Key transfer in progress. Not fetching from the cloud.", buf, 0xCu);
    }
    unint64_t v77 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:12 userInfo:0];
    if (v79) {
      (*((void (**)(id, void, void, void *))v79 + 2))(v79, 0, 0, v77);
    }
    if (v76) {
      v76[2]();
    }
  }
  else
  {
    __int16 v19 = [v78 cloudZone];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v20 = v19;
    }
    else {
      int64_t v20 = 0;
    }
    id v21 = v20;

    unint64_t v77 = v21;
    id v22 = (void *)MEMORY[0x1D9452090]();
    unint64_t v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    int v25 = v24;
    if (v21)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        id v27 = (void *)v26;
        int v28 = @"existing";
        if (!v79) {
          int v28 = @"changed";
        }
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v28;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Fetching %@ records from cloud", buf, 0x16u);
      }
      int v29 = [(HMDCloudManager *)v23 cloudDataSyncStateFilter];
      objc_msgSend(v78, "setICloudSwitchStateEnabled:", objc_msgSend(v29, "isiCloudSwitchEnabled"));

      id v74 = objc_alloc_init(MEMORY[0x1E4F1A060]);
      if (v8)
      {
        [v74 setPreviousServerChangeToken:0];
      }
      else
      {
        id v31 = [(HMDCloudManager *)v23 legacyZone];
        id v32 = [v31 serverChangeToken];
        [v74 setPreviousServerChangeToken:v32];
      }
      id v33 = [v74 previousServerChangeToken];
      BOOL v71 = v33 == 0;

      id v34 = (void *)MEMORY[0x1D9452090]();
      val = v23;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = HMFGetLogIdentifier();
        __int16 v37 = [v74 previousServerChangeToken];
        id v38 = [v37 debugDescription];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v38;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Fetching legacy data with current server token: %@", buf, 0x16u);
      }
      if (([v78 iCloudSwitchStateEnabled] & 1) == 0)
      {
        id v39 = (void *)MEMORY[0x1D9452090]();
        BOOL v40 = val;
        __int16 v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          BOOL v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v42;
          _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Setting desired keys to empty since iCloud Switch is off", buf, 0xCu);
        }
        [v74 setDesiredKeys:MEMORY[0x1E4F1CBF0]];
      }
      id v43 = objc_alloc(MEMORY[0x1E4F1A070]);
      id v44 = [(HMDCloudManager *)val legacyZone];
      id v45 = [v44 zone];
      id v46 = [v45 zoneID];
      v137[0] = v46;
      id v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:1];
      id v48 = [(HMDCloudManager *)val legacyZone];
      id v49 = [v48 zone];
      id v50 = [v49 zoneID];
      v135 = v50;
      id v136 = v74;
      v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      v52 = (void *)[v43 initWithRecordZoneIDs:v47 configurationsByRecordZoneID:v51];

      [v52 setFetchAllChanges:1];
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v134 = 0;
      v127[0] = 0;
      v127[1] = v127;
      v127[2] = 0x2020000000;
      char v128 = 0;
      objc_initWeak(&location, val);
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke;
      v120[3] = &unk_1E6A0A1C0;
      uint64_t v69 = &v125;
      objc_copyWeak(&v125, &location);
      id v53 = v77;
      id v121 = v53;
      v123 = buf;
      id v54 = v78;
      id v122 = v54;
      v124 = v127;
      [v52 setRecordChangedBlock:v120];
      v118[0] = 0;
      v118[1] = v118;
      v118[2] = 0x2020000000;
      char v119 = 0;
      v116[0] = 0;
      v116[1] = v116;
      v116[2] = 0x2020000000;
      char v117 = 0;
      v114[0] = 0;
      v114[1] = v114;
      v114[2] = 0x2020000000;
      char v115 = 0;
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      void v107[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_142;
      v107[3] = &unk_1E6A0A1E8;
      id v70 = &v113;
      objc_copyWeak(&v113, &location);
      id v55 = v53;
      id v108 = v55;
      v110 = v118;
      __int16 v111 = v116;
      uint64_t v112 = v114;
      id v56 = v54;
      id v109 = v56;
      [v52 setRecordWithIDWasDeletedBlock:v107];
      v105[0] = 0;
      v105[1] = v105;
      void v105[2] = 0x2020000000;
      char v106 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_143;
      aBlock[3] = &unk_1E6A0A238;
      objc_copyWeak(&v103, &location);
      long long v98 = v118;
      long long v99 = v116;
      id v57 = v56;
      id v94 = v57;
      id v58 = v55;
      BOOL v104 = v71;
      id v95 = v58;
      long long v100 = buf;
      id v59 = v79;
      id v96 = v59;
      long long v101 = v114;
      uint64_t v60 = v76;
      long long v97 = v60;
      v102 = v127;
      v61 = _Block_copy(aBlock);
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_150;
      v89[3] = &unk_1E6A0A260;
      id v72 = &v92;
      objc_copyWeak(&v92, &location);
      v91 = v105;
      id v62 = v61;
      id v90 = v62;
      [v52 setRecordZoneFetchCompletionBlock:v89];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_151;
      v80[3] = &unk_1E6A0A288;
      objc_copyWeak(&v88, &location);
      v85 = v105;
      id v83 = v59;
      id v81 = v57;
      id v82 = v58;
      __int16 v86 = v114;
      uint64_t v87 = v118;
      v84 = v60;
      BOOL v63 = (void *)MEMORY[0x1D9452090]([v52 setFetchRecordZoneChangesCompletionBlock:v80]);
      v64 = val;
      HMFGetOSLogHandle();
      uint64_t v65 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        id v66 = v62;
        HMFGetLogIdentifier();
        id v67 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v68 = objc_msgSend(v52, "operationID", &v125, &v113, &v92);
        *(_DWORD *)v129 = 138543618;
        id v130 = v67;
        __int16 v131 = 2112;
        v132 = v68;
        _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_INFO, "%{public}@[Legacy] Fetching record changes operation with ID: %@", v129, 0x16u);

        id v62 = v66;
      }

      [(HMDCloudManager *)v64 __addCKDatabaseOperation:v52];

      objc_destroyWeak(&v88);
      objc_destroyWeak(v72);

      objc_destroyWeak(&v103);
      _Block_object_dispose(v105, 8);

      objc_destroyWeak(v70);
      _Block_object_dispose(v114, 8);
      _Block_object_dispose(v116, 8);
      _Block_object_dispose(v118, 8);

      objc_destroyWeak(v69);
      objc_destroyWeak(&location);
      _Block_object_dispose(v127, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Legacy zone does not exist, cannot fetch", buf, 0xCu);
      }
      id v74 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      if (v79) {
        (*((void (**)(id, void, void, id))v79 + 2))(v79, 0, 0, v74);
      }
      if (v76) {
        v76[2]();
      }
    }
  }
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_17;
  }
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    int v46 = 138543618;
    id v47 = v8;
    __int16 v48 = 2048;
    uint64_t v49 = [v3 size];
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[HomeKit Data Usage Metric Log] Fetched record with size (Legacy recordChangedBlock): %lu", (uint8_t *)&v46, 0x16u);
  }
  BOOL v9 = [v6 logEventSubmitter];
  id v10 = +[HMDRecordChangedLogEvent legacyRecordChanged:v3];
  [v9 submitLogEvent:v10];

  __int16 v11 = [v3 recordID];
  id v12 = [*(id *)(a1 + 32) homeDataRecordID];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v6;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v46 = 138543362;
      id v47 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Version 0 exists", (uint8_t *)&v46, 0xCu);
    }
    uint64_t v18 = *(void *)(a1 + 48);
LABEL_12:
    *(unsigned char *)(*(void *)(v18 + 8) + 24) = 1;
    goto LABEL_13;
  }
  __int16 v19 = [v3 recordID];
  int64_t v20 = [*(id *)(a1 + 32) homeDataV3RecordID];
  int v21 = [v19 isEqual:v20];

  if (v21)
  {
    id v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = v6;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = HMFGetLogIdentifier();
      int v46 = 138543362;
      id v47 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Version 3 exists", (uint8_t *)&v46, 0xCu);
    }
    uint64_t v18 = *(void *)(a1 + 56);
    goto LABEL_12;
  }
  id v34 = [v3 recordID];
  id v35 = [*(id *)(a1 + 32) metadataRecordID];
  int v36 = [v34 isEqual:v35];

  __int16 v37 = (void *)MEMORY[0x1D9452090]();
  id v38 = v6;
  id v39 = HMFGetOSLogHandle();
  BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
  if (!v36)
  {
    if (v40)
    {
      BOOL v42 = HMFGetLogIdentifier();
      id v43 = [v3 recordType];
      id v44 = [v3 recordID];
      id v45 = [v44 recordName];
      int v46 = 138543874;
      id v47 = v42;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v43;
      __int16 v50 = 2112;
      v51 = v45;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Ignoring unknown legacy record %@/%@", (uint8_t *)&v46, 0x20u);
    }
    goto LABEL_14;
  }
  if (v40)
  {
    __int16 v41 = HMFGetLogIdentifier();
    int v46 = 138543362;
    id v47 = v41;
    _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Metadata exists", (uint8_t *)&v46, 0xCu);
  }
LABEL_13:
  uint64_t v26 = [*(id *)(a1 + 40) addChangeWithRecord:v3];
LABEL_14:
  id v27 = (void *)MEMORY[0x1D9452090](v26);
  id v28 = v6;
  int v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = HMFGetLogIdentifier();
    id v31 = [v3 recordType];
    id v32 = [v3 recordID];
    id v33 = [v32 recordName];
    int v46 = 138543874;
    id v47 = v30;
    __int16 v48 = 2112;
    uint64_t v49 = (uint64_t)v31;
    __int16 v50 = 2112;
    v51 = v33;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Received record changed event for record %@/%@", (uint8_t *)&v46, 0x20u);
  }
LABEL_17:
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_142(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    BOOL v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      id v12 = [v5 recordName];
      int v40 = 138543618;
      __int16 v41 = v11;
      __int16 v42 = 2112;
      id v43 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received deleted record changed event for record %@", (uint8_t *)&v40, 0x16u);
    }
    int v13 = [*(id *)(a1 + 32) homeDataRecordID];
    int v14 = [v5 isEqual:v13];

    if (v14)
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v9;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v40 = 138543362;
        __int16 v41 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Version 0 data was deleted", (uint8_t *)&v40, 0xCu);
      }
      uint64_t v19 = *(void *)(a1 + 48);
    }
    else
    {
      int64_t v20 = [*(id *)(a1 + 32) homeDataV3RecordID];
      int v21 = [v5 isEqual:v20];

      if (!v21)
      {
        uint64_t v26 = [*(id *)(a1 + 32) metadataRecordID];
        int v27 = [v5 isEqual:v26];

        if (v27)
        {
          id v28 = (void *)MEMORY[0x1D9452090]();
          id v29 = v9;
          uint64_t v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            id v31 = HMFGetLogIdentifier();
            int v40 = 138543362;
            __int16 v41 = v31;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Metadata record was deleted in the cloud", (uint8_t *)&v40, 0xCu);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          id v32 = *(void **)(a1 + 40);
          id v33 = [*(id *)(a1 + 32) metadataObjectID];
          if ([v32 doesRecordExistInCacheWithObjectID:v33])
          {
            id v34 = [v29 cloudMetadataDeletedNotificationHandler];

            if (!v34) {
              goto LABEL_13;
            }
            id v35 = (void *)MEMORY[0x1D9452090]();
            id v36 = v29;
            __int16 v37 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              id v38 = HMFGetLogIdentifier();
              int v40 = 138543362;
              __int16 v41 = v38;
              _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Invoking cloud metadata deleted notification block", (uint8_t *)&v40, 0xCu);
            }
            id v33 = [v36 clientCallbackQueue];
            id v39 = [v36 cloudMetadataDeletedNotificationHandler];
            dispatch_async(v33, v39);
          }
        }
LABEL_13:
        [*(id *)(a1 + 40) addChangeWithDeletedRecordID:v5];
        goto LABEL_14;
      }
      id v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = v9;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = HMFGetLogIdentifier();
        int v40 = 138543362;
        __int16 v41 = v25;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Version 3 data was deleted", (uint8_t *)&v40, 0xCu);
      }
      uint64_t v19 = *(void *)(a1 + 56);
    }
    *(unsigned char *)(*(void *)(v19 + 8) + 24) = 1;
    goto LABEL_13;
  }
LABEL_14:
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_143(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v11 = [WeakRetained logEventSubmitter];
    id v12 = +[HMDCloudSyncLegacyFetchLogEvent fetchCompletedWithError:v8];
    [v11 submitLogEvent:v12];

    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    char v42 = 0;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      int v13 = dispatch_group_create();
      dispatch_group_enter(v13);
      uint64_t v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v15 = *(void *)(a1 + 32);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2;
      v38[3] = &unk_1E6A0A0A8;
      int v40 = v41;
      id v16 = v13;
      id v39 = v16;
      [v10 _forceCleanCloud:v14 fetchTransaction:v15 completionHandler:v38];
      dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    }
    id v17 = [v10 workQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_3;
    v23[3] = &unk_1E6A0A210;
    id v24 = *(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 40);
    uint64_t v26 = v10;
    char v36 = *(unsigned char *)(a1 + 112);
    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v31 = *(void *)(a1 + 80);
    uint64_t v32 = v18;
    id v19 = *(id *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 88);
    id v29 = v19;
    uint64_t v33 = v20;
    id v27 = v8;
    id v28 = v7;
    id v34 = v41;
    id v21 = *(id *)(a1 + 56);
    uint64_t v22 = *(void *)(a1 + 96);
    id v30 = v21;
    uint64_t v35 = v22;
    char v37 = a3;
    dispatch_async(v17, v23);

    _Block_object_dispose(v41, 8);
  }
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_150(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = WeakRetained;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v19 = v31 = v13;
      [v11 zoneName];
      char v30 = a5;
      id v20 = v14;
      id v21 = v12;
      id v23 = v22 = v11;
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v19;
      __int16 v34 = 2112;
      uint64_t v35 = v23;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetch record completion for zone %@", buf, 0x16u);

      id v11 = v22;
      id v12 = v21;
      id v14 = v20;
      a5 = v30;

      id v13 = v31;
    }

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v24 = v11;
      id v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = v17;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v29 = v28 = v13;
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v29;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Completion handler for fetch has already been called", buf, 0xCu);

        id v13 = v28;
      }

      id v11 = v24;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      if ((a5 & 1) == 0) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    if (!*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + 24) = 1;
      id v6 = v3;
      if (!v6)
      {
        id v7 = (void *)MEMORY[0x1D9452090]();
        id v8 = WeakRetained;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v39 = v10;
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Legacy zone fetch failed to return data, nothing to process", buf, 0xCu);
        }
        id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      }
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = WeakRetained;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        uint64_t v15 = objc_msgSend(v6, "hmd_conciseCKError");
        id v16 = [v15 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v39 = v14;
        __int16 v40 = 2112;
        __int16 v41 = v16;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not fetch zone due to: %@", buf, 0x16u);
      }
      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = v12;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v39 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because fetch failed", buf, 0xCu);
      }
      id v21 = [v18 cloudCache];
      [v21 setDatabaseServerChangeToken:0];

      id v22 = [v18 cloudCache];
      [v22 persistDatabaseServerChangeToken];

      if (*(void *)(a1 + 48))
      {
        id v23 = *(void **)(a1 + 32);
        id v24 = [*(id *)(a1 + 40) metadataObjectID];
        if ([v23 doesRecordExistWithObjectID:v24]) {
          BOOL v25 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0;
        }
        else {
          BOOL v25 = 0;
        }

        id v26 = *(void **)(a1 + 32);
        id v27 = [*(id *)(a1 + 40) homeDataObjectID];
        if ([v26 doesRecordExistWithObjectID:v27]) {
          BOOL v28 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 0;
        }
        else {
          BOOL v28 = 0;
        }
        [v18 setCloudHomeDataRecordExists:v28];

        id v29 = [v18 clientCallbackQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_152;
        block[3] = &unk_1E6A16328;
        id v36 = *(id *)(a1 + 48);
        void block[4] = v18;
        BOOL v37 = v25;
        id v35 = v6;
        dispatch_async(v29, block);
      }
      if (*(void *)(a1 + 56))
      {
        char v30 = [v18 clientCallbackQueue];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2_153;
        v31[3] = &unk_1E6A19530;
        id v33 = *(id *)(a1 + 56);
        id v32 = v6;
        dispatch_async(v30, v31);
      }
    }
  }
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_152(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) cloudHomeDataRecordExists];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "hmd_hmErrorFromCKError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4, v5);
}

uint64_t __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2_153(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) homeDataObjectID];
  uint64_t v4 = [v2 changeWithObjectID:v3];

  if ([v4 isDeleted]) {
    [*(id *)(a1 + 48) _resetHomeDataRecordState];
  }
  if (*(unsigned char *)(a1 + 128))
  {
    [*(id *)(a1 + 48) setCloudHomeDataRecordExists:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) != 0];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) homeDataObjectID];
      LODWORD(v5) = [v5 doesRecordExistWithObjectID:v6];

      if (v5)
      {
        id v7 = *(void **)(a1 + 32);
        id v8 = [*(id *)(a1 + 40) homeDataRecordID];
        [v7 setDeleteAsProcessedWithRecordID:v8];
      }
    }
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    [*(id *)(a1 + 48) setCloudHomeDataRecordExists:1];
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) homeDataObjectID];
    if ([v9 doesRecordExistWithObjectID:v10]) {
      BOOL v11 = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) == 0;
    }
    else {
      BOOL v11 = 0;
    }
    [*(id *)(a1 + 48) setCloudHomeDataRecordExists:v11];
  }
  id v12 = [*(id *)(a1 + 48) dataSource];
  if (*(void *)(a1 + 72))
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = [*(id *)(a1 + 40) metadataObjectID];
    if ([v13 doesRecordExistWithObjectID:v14])
    {
      int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);

      if (!v15)
      {
        char v16 = 1;
LABEL_21:
        if (([v12 isControllerKeyAvailable] & 1) == 0
          && [*(id *)(a1 + 48) keychainSyncEnabled])
        {
          [*(id *)(a1 + 48) _startControllerKeyPollTimer];
        }
        id v21 = [*(id *)(a1 + 48) clientCallbackQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_145;
        block[3] = &unk_1E6A16328;
        id v22 = *(id *)(a1 + 72);
        uint64_t v23 = *(void *)(a1 + 48);
        id v24 = *(void **)(a1 + 56);
        id v74 = v22;
        void block[4] = v23;
        char v75 = v16;
        id v73 = v24;
        dispatch_async(v21, block);

        goto LABEL_25;
      }
    }
    else
    {
    }
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 48);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v79 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch metadata record during initial fetch", buf, 0xCu);
    }
    char v16 = 0;
    goto LABEL_21;
  }
LABEL_25:
  uint64_t v25 = [v12 dataMigrationOptions];
  [*(id *)(a1 + 32) setUpdatedServerChangeToken:*(void *)(a1 + 64)];
  id v26 = [*(id *)(a1 + 48) legacyZone];
  id v27 = [v26 serverChangeToken];
  int v28 = HMFEqualObjects();

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    [*(id *)(a1 + 48) _resetCloudServerTokenData];
    [*(id *)(a1 + 32) setUpdatedServerChangeToken:0];
    [*(id *)(a1 + 32) setOsTransaction:0];
    if (!*(void *)(a1 + 80)) {
      goto LABEL_44;
    }
    id v29 = [*(id *)(a1 + 48) clientCallbackQueue];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2_146;
    v70[3] = &unk_1E6A186E0;
    id v71 = *(id *)(a1 + 80);
    dispatch_async(v29, v70);

    char v30 = v71;
    goto LABEL_43;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
  {
    int v31 = [*(id *)(a1 + 48) _processFetchedTransaction:*(void *)(a1 + 32)];
    id v32 = *(void **)(a1 + 48);
    if (!v31)
    {
      uint64_t v34 = *(void *)(a1 + 56);
      uint64_t v35 = *(void *)(a1 + 64);
      uint64_t v65 = v12;
      id v36 = v4;
      int v37 = v28;
      id v38 = *(void **)(a1 + 32);
      uint64_t v39 = *(void *)(a1 + 80);
      uint64_t v40 = *(unsigned __int8 *)(a1 + 129);
      LOBYTE(v64) = [v38 iCloudSwitchStateEnabled] ^ 1;
      __int16 v41 = v38;
      int v28 = v37;
      uint64_t v4 = v36;
      id v12 = v65;
      [v32 _processFetchCompletedWithError:v34 serverToken:v35 fetchTransaction:v41 migrationOptions:v25 completionHandler:v39 moreRecordsComing:v40 emptyRecord:v64];
      goto LABEL_44;
    }
    [*(id *)(a1 + 48) _resetCloudServerTokenData];
    [*(id *)(a1 + 32) setUpdatedServerChangeToken:0];
    [*(id *)(a1 + 32) setOsTransaction:0];
    if (!*(void *)(a1 + 80)) {
      goto LABEL_44;
    }
    id v33 = [*(id *)(a1 + 48) clientCallbackQueue];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_3_147;
    v68[3] = &unk_1E6A186E0;
    id v69 = *(id *)(a1 + 80);
    dispatch_async(v33, v68);

    char v30 = v69;
    goto LABEL_43;
  }
  if (([*(id *)(a1 + 32) iCloudSwitchStateEnabled] & 1) == 0)
  {
    [*(id *)(a1 + 32) setUpdatedServerChangeToken:0];
    [*(id *)(a1 + 48) _resetCloudServerTokenData];
  }
  if (([*(id *)(a1 + 48) cloudHomeDataRecordExists] & 1) == 0)
  {
    uint64_t v42 = [*(id *)(a1 + 48) cloudDataSyncStateFilter];
    int v43 = [v42 isLocalDataDecryptionFailed];

    if (v43)
    {
      uint64_t v44 = (void *)MEMORY[0x1D9452090]();
      id v45 = *(id *)(a1 + 48);
      int v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v79 = v47;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@No data in the cloud and local decryption has failed, start reset timer", buf, 0xCu);
      }
      __int16 v48 = [*(id *)(a1 + 48) cloudDataSyncStateFilter];
      [v48 startDataConfigResetTimers];
    }
  }
  if (*(void *)(a1 + 80))
  {
    uint64_t v49 = [*(id *)(a1 + 48) clientCallbackQueue];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_148;
    v66[3] = &unk_1E6A186E0;
    id v67 = *(id *)(a1 + 80);
    dispatch_async(v49, v66);

    char v30 = v67;
LABEL_43:
  }
LABEL_44:
  if ([*(id *)(a1 + 48) decryptionFailed])
  {
    __int16 v50 = (void *)MEMORY[0x1D9452090]();
    id v51 = *(id *)(a1 + 48);
    uint64_t v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      id v53 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v79 = v53;
      _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_INFO, "%{public}@Decryption from V3 zone failed, do not notify of successful fetch, reset first fetch run and db query run", buf, 0xCu);
    }
    [*(id *)(a1 + 48) setFirstV3FetchRun:0];
    [*(id *)(a1 + 48) setFirstDBQueryRun:0];
  }
  else if (([*(id *)(a1 + 48) isFirstV3FetchRun] & 1) == 0 && !*(void *)(a1 + 56))
  {
    uint64_t v54 = v28 ^ 1u;
    id v55 = (void *)MEMORY[0x1D9452090]();
    id v56 = *(id *)(a1 + 48);
    id v57 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      id v58 = HMFGetLogIdentifier();
      id v59 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      id v79 = v58;
      __int16 v80 = 2112;
      id v81 = v59;
      _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@Zone ready determined for legacy zone; didServerTokenChange: %@",
        buf,
        0x16u);
    }
    [*(id *)(a1 + 48) setFirstV3FetchRun:1];
    uint64_t v60 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v76[0] = @"HMDCR.stc";
    v61 = [NSNumber numberWithBool:v54];
    v76[1] = @"HMDCR.de";
    v77[0] = v61;
    id v62 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "cloudHomeDataRecordExists"));
    v77[1] = v62;
    BOOL v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
    [v60 postNotificationName:@"HMDCloudZoneReadyNotification" object:0 userInfo:v63];
  }
}

void __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_145(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) cloudHomeDataRecordExists];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "hmd_hmErrorFromCKError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4, v5);
}

uint64_t __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_2_146(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_3_147(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__HMDCloudManager__fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLegacyTransaction:(id)a3 forceFetch:(BOOL)a4 accountCompletionHandler:(id)a5 dataCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__HMDCloudManager_fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke;
  block[3] = &unk_1E6A0A198;
  id v19 = v11;
  id v20 = v12;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __100__HMDCloudManager_fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) accountActive];
  uint64_t v3 = *(void *)(a1 + 48);
  if ((v2 & 1) != 0 || v3)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 56);
    [v9 _fetchLegacyTransaction:v10 forceFetch:v11 accountCompletionHandler:v3 dataCompletionHandler:v12];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing request fetch", buf, 0xCu);
    }
    if (*(void *)(a1 + 56))
    {
      id v8 = [*(id *)(a1 + 32) clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__HMDCloudManager_fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_133;
      block[3] = &unk_1E6A186E0;
      id v14 = *(id *)(a1 + 56);
      dispatch_async(v8, block);
    }
  }
}

void __100__HMDCloudManager_fetchLegacyTransaction_forceFetch_accountCompletionHandler_dataCompletionHandler___block_invoke_133(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:75];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)setAccountActiveUpdateCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDCloudManager_setAccountActiveUpdateCallback___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__HMDCloudManager_setAccountActiveUpdateCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccountActiveUpdateHandler:*(void *)(a1 + 40)];
}

- (void)setDataDecryptionFailedCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMDCloudManager_setDataDecryptionFailedCompletionBlock___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__HMDCloudManager_setDataDecryptionFailedCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDataDecryptionFailedHandler:*(void *)(a1 + 40)];
}

- (void)setControllerKeyAvailableNotificationBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HMDCloudManager_setControllerKeyAvailableNotificationBlock___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__HMDCloudManager_setControllerKeyAvailableNotificationBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setControllerKeyAvailableNotificationHandler:*(void *)(a1 + 40)];
}

- (void)setCloudMetadataDeletedNotificationBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HMDCloudManager_setCloudMetadataDeletedNotificationBlock___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__HMDCloudManager_setCloudMetadataDeletedNotificationBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCloudMetadataDeletedNotificationHandler:*(void *)(a1 + 40)];
}

- (void)setCloudDataDeletedNotificationBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDCloudManager_setCloudDataDeletedNotificationBlock___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__HMDCloudManager_setCloudDataDeletedNotificationBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCloudDataDeletedNotificationHandler:*(void *)(a1 + 40)];
}

- (void)setDataAvailableFromCloudCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HMDCloudManager_setDataAvailableFromCloudCompletionBlock___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__HMDCloudManager_setDataAvailableFromCloudCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFetchCompletionHandler:*(void *)(a1 + 40)];
}

- (void)fetchCurrentAccountStateWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Start query for container account status", buf, 0xCu);
  }
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AccountStatus", "", buf, 2u);
  }
  objc_initWeak((id *)buf, v6);
  uint64_t v10 = [(HMDCloudManager *)v6 container];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HMDCloudManager_fetchCurrentAccountStateWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6A0A170;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = (id)0xEEEEB0B5B2B2EEEELL;
  id v11 = v4;
  id v13 = v11;
  [v10 accountStatusWithCompletionHandler:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __65__HMDCloudManager_fetchCurrentAccountStateWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = (id *)WeakRetained;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = objc_msgSend(v5, "hmd_conciseCKError");
      uint64_t v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      BOOL v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = a2;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Query for container account status completed with status (%lu) and error %@", buf, 0x20u);
    }
    id v13 = v8[1];
    id v14 = v13;
    os_signpost_id_t v15 = *(void *)(a1 + 48);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v14, OS_SIGNPOST_INTERVAL_END, v15, "AccountStatus", "", buf, 2u);
    }

    id v16 = [v8 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HMDCloudManager_fetchCurrentAccountStateWithCompletionHandler___block_invoke_131;
    block[3] = &unk_1E6A181A0;
    void block[4] = v8;
    uint64_t v19 = a2;
    id v18 = *(id *)(a1 + 32);
    dispatch_async(v16, block);
  }
}

uint64_t __65__HMDCloudManager_fetchCurrentAccountStateWithCompletionHandler___block_invoke_131(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAccountStatus:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (id)_serverTokenData
{
  uint64_t v3 = [(HMDCloudManager *)self legacyZone];
  id v4 = [v3 serverChangeToken];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DB0];
    id v6 = [(HMDCloudManager *)self legacyZone];
    id v7 = [v6 serverChangeToken];
    id v8 = [v5 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (NSData)serverTokenData
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__39674;
  id v11 = __Block_byref_object_dispose__39675;
  id v12 = 0;
  uint64_t v3 = [(HMDCloudManager *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__HMDCloudManager_serverTokenData__block_invoke;
  v6[3] = &unk_1E6A18690;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

uint64_t __34__HMDCloudManager_serverTokenData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _serverTokenData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)decryptionFailed
{
  uint64_t v2 = [(HMDCloudManager *)self cloudDataSyncStateFilter];
  char v3 = [v2 decryptionFailed];

  return v3;
}

- (void)_resetCloudCache:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Cloud cache has been reset", buf, 0xCu);
  }
  uint64_t v9 = [(HMDCloudManager *)v6 cloudCache];
  [v9 deleteAllZones];

  objc_initWeak((id *)buf, v6);
  uint64_t v10 = [(HMDCloudManager *)v6 cloudCache];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__HMDCloudManager__resetCloudCache___block_invoke;
  v12[3] = &unk_1E6A16F80;
  objc_copyWeak(&v14, (id *)buf);
  id v11 = v4;
  id v13 = v11;
  [v10 createAndFetchZonesFromBackingStore:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __36__HMDCloudManager__resetCloudCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x1D9452090]([WeakRetained updateServerTokenStatusOnCloudFilter]);
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Completed resetting cloud cached with error %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (void)resetCloudCache:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__HMDCloudManager_resetCloudCache___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __35__HMDCloudManager_resetCloudCache___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetCloudCache:*(void *)(a1 + 40)];
}

- (void)_resetCloudServerTokenData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Cloud server token has been reset", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [(HMDCloudManager *)v4 legacyZone];
  [v7 setServerChangeToken:0];

  id v8 = [(HMDCloudManager *)v4 cloudCache];
  [v8 setDatabaseServerChangeToken:0];

  uint64_t v9 = [(HMDCloudManager *)v4 cloudCache];
  [v9 persistDatabaseServerChangeToken];

  [(HMDCloudManager *)v4 _updateServerTokenStatusOnCloudFilter];
}

- (void)resetCloudServerTokenData:(id)a3
{
  id v4 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDCloudManager_resetCloudServerTokenData___block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __45__HMDCloudManager_resetCloudServerTokenData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetCloudServerTokenData];
}

- (void)_resetCloudDataAndDeleteMetadataForCurrentAccount:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v34[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = [(HMDCloudManager *)self legacyZone];
  uint64_t v9 = [v8 homeDataRecordID];
  v34[0] = v9;
  int v10 = [(HMDCloudManager *)self legacyZone];
  id v11 = [v10 homeDataV3RecordID];
  v34[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  id v13 = [v7 arrayWithArray:v12];

  if (v4)
  {
    uint64_t v14 = [(HMDCloudManager *)self legacyZone];
    os_signpost_id_t v15 = [v14 metadataRecordID];
    [v13 addObject:v15];
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:0 recordIDsToDelete:v13];
  [v16 setSavePolicy:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke;
  v29[3] = &unk_1E6A0A0F8;
  v29[4] = self;
  [v16 setPerRecordProgressBlock:v29];
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_126;
  v26[3] = &unk_1E6A0A120;
  objc_copyWeak(&v27, &location);
  [v16 setPerRecordCompletionBlock:v26];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_127;
  v23[3] = &unk_1E6A0A148;
  objc_copyWeak(&v25, &location);
  id v17 = v6;
  id v24 = v17;
  id v18 = (void *)MEMORY[0x1D9452090]([v16 setModifyRecordsCompletionBlock:v23]);
  uint64_t v19 = self;
  HMFGetOSLogHandle();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v22 = [v16 operationID];
    *(_DWORD *)buf = 138543618;
    id v31 = v21;
    __int16 v32 = 2112;
    id v33 = v22;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding deleting operation with ID: %@", buf, 0x16u);
  }
  [(HMDCloudManager *)v19 _stopFetchRetryTimer];
  [(HMDCloudManager *)v19 __addCKDatabaseOperation:v16];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = [v5 recordType];
    id v11 = [v5 recordID];
    uint64_t v12 = [v11 recordName];
    int v13 = 138544130;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2048;
    double v20 = a3;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Record delete %@/%@ progress %f", (uint8_t *)&v13, 0x2Au);
  }
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    int v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v11)
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v13 = objc_msgSend(v6, "hmd_conciseCKError");
        uint64_t v14 = [v13 shortDescription];
        int v16 = 138543618;
        __int16 v17 = v12;
        __int16 v18 = 2112;
        __int16 v19 = v14;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to delete record in the server, %@", (uint8_t *)&v16, 0x16u);
LABEL_7:
      }
    }
    else if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = [v5 recordType];
      uint64_t v14 = [v5 recordID];
      __int16 v15 = [v14 recordName];
      int v16 = 138543874;
      __int16 v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Deleted home data record %@/%@", (uint8_t *)&v16, 0x20u);

      goto LABEL_7;
    }
  }
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_127(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    int v10 = [WeakRetained workQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6A18398;
    id v12 = v7;
    int v13 = v9;
    id v15 = *(id *)(a1 + 32);
    id v14 = v6;
    dispatch_async(v10, v11);
  }
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_2(id *a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = a1[5];
    BOOL v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = objc_msgSend(a1[4], "hmd_conciseCKError");
      id v7 = [v6 shortDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v41 = v5;
      __int16 v42 = 2112;
      uint64_t v43 = (uint64_t)v7;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Could not delete records due to: %@", buf, 0x16u);
    }
    if (a1[7])
    {
      id v8 = [a1[5] clientCallbackQueue];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_128;
      v36[3] = &unk_1E6A19530;
      id v9 = &v38;
      id v38 = a1[7];
      int v10 = &v37;
      id v37 = a1[4];
      BOOL v11 = v36;
      goto LABEL_21;
    }
    return;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = a1[6];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (!v13) {
    goto LABEL_17;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v33;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v33 != v15) {
        objc_enumerationMutation(v12);
      }
      __int16 v17 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
      __int16 v18 = [a1[5] legacyZone];
      __int16 v19 = [v18 homeDataRecordID];
      if ([v17 isEqual:v19])
      {
      }
      else
      {
        __int16 v20 = [a1[5] legacyZone];
        uint64_t v21 = [v20 homeDataV3RecordID];
        int v22 = [v17 isEqual:v21];

        if (!v22) {
          goto LABEL_15;
        }
      }
      uint64_t v23 = [a1[5] legacyZone];
      [v23 setRecordsAvailable:0];

      [a1[5] setCloudHomeDataRecordExists:0];
LABEL_15:
      ++v16;
    }
    while (v14 != v16);
    uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v39 count:16];
  }
  while (v14);
LABEL_17:

  id v24 = (void *)MEMORY[0x1D9452090]();
  id v25 = a1[5];
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = HMFGetLogIdentifier();
    uint64_t v28 = [a1[6] count];
    *(_DWORD *)buf = 138543618;
    __int16 v41 = v27;
    __int16 v42 = 2048;
    uint64_t v43 = v28;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Deleted %ld records", buf, 0x16u);
  }
  [a1[5] _resetCloudServerTokenData];
  if (a1[7])
  {
    id v8 = [a1[5] clientCallbackQueue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_129;
    v29[3] = &unk_1E6A19530;
    id v9 = &v31;
    id v31 = a1[7];
    int v10 = &v30;
    id v30 = a1[4];
    BOOL v11 = v29;
LABEL_21:
    dispatch_async(v8, v11);
  }
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_128(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __87__HMDCloudManager__resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_129(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hmd_hmErrorFromCKError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_resetCloudZonesIgnoreHomeManager:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(HMDCloudManager *)self accountActive];
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  BOOL v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v22 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing all zones", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_124;
    v15[3] = &unk_1E6A0A0D0;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v6;
    BOOL v18 = a3;
    [(HMDCloudManager *)v9 __fetchAllRecordZonesWithCompletionHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v22 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Ignoring request to reset cloud data since there is no active account", buf, 0xCu);
    }
    if (v6)
    {
      uint64_t v14 = [(HMDCloudManager *)v9 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke;
      block[3] = &unk_1E6A186E0;
      id v20 = v6;
      dispatch_async(v14, block);
    }
  }
}

void __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:75];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  id v25 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v25)
    {
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = v23;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (*(unsigned char *)(a1 + 48))
            {
              id v16 = [*(id *)(*((void *)&v30 + 1) + 8 * i) zoneID];
              id v17 = [v16 zoneName];
              char v18 = [@"1411CE6C-B4DE-4622-A49D-F66FE296D6B5" isEqualToString:v17];

              if (v18) {
                continue;
              }
            }
            __int16 v19 = [v15 zoneID];
            id v20 = [v19 zoneName];

            uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v20];
            if (v21)
            {
              int v22 = [v15 zoneID];
              [v26 addObject:v22];
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v12);
      }

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_2;
      v27[3] = &unk_1E6A151F8;
      objc_copyWeak(&v29, (id *)(a1 + 40));
      id v28 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "__deleteRecordZonesWithIDs:completionHandler:", v26, v27);

      objc_destroyWeak(&v29);
      int v10 = v26;
      goto LABEL_20;
    }
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v38 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch zone information", buf, 0xCu);
    }
    if (*(void *)(a1 + 32))
    {
      id v9 = [v6 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_125;
      block[3] = &unk_1E6A186E0;
      id v35 = *(id *)(a1 + 32);
      dispatch_async(v9, block);

      int v10 = v35;
LABEL_20:
    }
  }
}

void __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_125(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    BOOL v4 = [WeakRetained clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_3;
    block[3] = &unk_1E6A186E0;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
}

uint64_t __71__HMDCloudManager__resetCloudZonesIgnoreHomeManager_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_verifyAndRemoveAllHomeZonesCompletionHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  BOOL v4 = [(HMDCloudManager *)self cloudCache];
  id v5 = [v4 allHomeZones];

  v25[0] = 0;
  v25[1] = v25;
  id v25[2] = 0x3032000000;
  void v25[3] = __Block_byref_object_copy__39674;
  void v25[4] = __Block_byref_object_dispose__39675;
  id v26 = 0;
  id v6 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
        dispatch_group_enter(v6);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __65__HMDCloudManager__verifyAndRemoveAllHomeZonesCompletionHandler___block_invoke;
        v18[3] = &unk_1E6A0A0A8;
        id v20 = v25;
        __int16 v19 = v6;
        [(HMDCloudManager *)self _verifyAndRemoveZone:v10 completionHandler:v18];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  id v11 = [(HMDCloudManager *)self clientCallbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDCloudManager__verifyAndRemoveAllHomeZonesCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6A15810;
  id v16 = v13;
  id v17 = v25;
  id v12 = v13;
  dispatch_group_notify(v6, v11, block);

  _Block_object_dispose(v25, 8);
}

void __65__HMDCloudManager__verifyAndRemoveAllHomeZonesCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __65__HMDCloudManager__verifyAndRemoveAllHomeZonesCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (void)_verifyAndRemoveZone:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v21 = v12;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Verifying zone after controller key change: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_119;
    v14[3] = &unk_1E6A0A080;
    objc_copyWeak(&v17, (id *)buf);
    id v15 = v6;
    id v16 = v8;
    [(HMDCloudManager *)v10 _fetchAndVerifyZoneRootRecord:v15 completionHandler:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    id v13 = [(HMDCloudManager *)self clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v19 = v8;
    dispatch_async(v13, block);
  }
}

void __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_119(id *a1, int a2, char a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2 || (a3 & 1) != 0)
    {
      if (a1[5])
      {
        char v18 = [WeakRetained clientCallbackQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_2;
        block[3] = &unk_1E6A19530;
        id v22 = a1[5];
        id v21 = v7;
        dispatch_async(v18, block);
      }
    }
    else
    {
      context = (void *)MEMORY[0x1D9452090]();
      id v10 = v9;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = objc_msgSend(a1[4], "zone", context);
        uint64_t v14 = [v13 zoneID];
        id v15 = [v14 zoneName];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v12;
        __int16 v29 = 2112;
        long long v30 = v15;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Zone cannot be decrypted with current controller key, removing zone %@", buf, 0x16u);
      }
      id v16 = [a1[4] zone];
      id v17 = [v16 zoneID];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_120;
      v23[3] = &unk_1E6A0A058;
      objc_copyWeak(&v26, a1 + 6);
      id v24 = a1[4];
      id v25 = a1[5];
      objc_msgSend(v10, "__deleteRecordZoneWithID:completionHandler:", v17, v23);

      objc_destroyWeak(&v26);
    }
  }
}

void __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_120(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v11 = v16 = v5;
      id v12 = [a1[4] zone];
      id v13 = [v12 zoneID];
      uint64_t v14 = [v13 zoneName];
      *(_DWORD *)buf = 138543874;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v14;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed zone %@ with error %@", buf, 0x20u);

      id v5 = v16;
    }

    if (a1[5])
    {
      id v15 = [v9 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_121;
      block[3] = &unk_1E6A19530;
      id v19 = a1[5];
      id v18 = v6;
      dispatch_async(v15, block);
    }
  }
}

uint64_t __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __58__HMDCloudManager__verifyAndRemoveZone_completionHandler___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32));
}

- (void)verifyAndRemoveZone:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HMDCloudManager_verifyAndRemoveZone_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __57__HMDCloudManager_verifyAndRemoveZone_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _verifyAndRemoveZone:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_removeAllHomeZonesCompletionHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCloudManager *)self cloudCache];
  id v6 = [v5 allHomeZones];

  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) zone];
        id v13 = [v12 zoneID];

        if (v13) {
          [v7 addObject:v13];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  uint64_t v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v27 = v17;
    __int16 v28 = 2112;
    __int16 v29 = v7;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing zones %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__HMDCloudManager__removeAllHomeZonesCompletionHandler___block_invoke;
  v19[3] = &unk_1E6A151F8;
  objc_copyWeak(&v21, (id *)buf);
  id v18 = v4;
  id v20 = v18;
  [(HMDCloudManager *)v15 __deleteRecordZonesWithIDs:v7 completionHandler:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __56__HMDCloudManager__removeAllHomeZonesCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v4 = [WeakRetained clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HMDCloudManager__removeAllHomeZonesCompletionHandler___block_invoke_2;
    block[3] = &unk_1E6A186E0;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
}

uint64_t __56__HMDCloudManager__removeAllHomeZonesCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetCloudDataAndDeleteMetadataForCurrentAccount:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(HMDCloudManager *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke;
  v9[3] = &unk_1E6A0A030;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6A15C28;
  objc_copyWeak(&v7, v2);
  char v8 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  v5[4] = WeakRetained;
  id v6 = v4;
  [WeakRetained _resetCloudZonesIgnoreHomeManager:0 completionHandler:v5];

  objc_destroyWeak(&v7);
}

void __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (*(void *)(a1 + 40))
    {
      id v4 = [*(id *)(a1 + 32) clientCallbackQueue];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_3;
      v6[3] = &unk_1E6A19530;
      id v8 = *(id *)(a1 + 40);
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _resetCloudDataAndDeleteMetadataForCurrentAccount:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 40)];
  }
}

uint64_t __86__HMDCloudManager_resetCloudDataAndDeleteMetadataForCurrentAccount_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_fetchAndVerifyZoneRootRecord:(id)a3 completionHandler:(id)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  if (v6)
  {
    id v7 = [[HMDCloudTransaction alloc] initWithType:3 temporaryCache:1];
    [(HMDCloudTransaction *)v7 updateCloudZone:v6];
    id v8 = [(HMDCloudTransaction *)v7 privateZoneRootRecordID];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1A0A8]);
      v53[0] = v8;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
      id v11 = (void *)[v9 initWithRecordIDs:v10];

      *(void *)id v51 = 0;
      *(void *)&v51[8] = v51;
      *(void *)&v51[16] = 0x2020000000;
      char v52 = 0;
      objc_initWeak(&location, self);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_2;
      v40[3] = &unk_1E6A09FB8;
      objc_copyWeak(&v41, &location);
      [v11 setPerRecordProgressBlock:v40];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_101;
      v35[3] = &unk_1E6A09FE0;
      objc_copyWeak(&v39, &location);
      id v36 = v8;
      id v38 = v51;
      BOOL v12 = v7;
      id v37 = v12;
      [v11 setPerRecordCompletionBlock:v35];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_103;
      v29[3] = &unk_1E6A0A008;
      objc_copyWeak(&v34, &location);
      id v30 = v6;
      id v32 = v28;
      long long v33 = v51;
      uint64_t v31 = v12;
      id v13 = (void *)MEMORY[0x1D9452090]([v11 setFetchRecordsCompletionBlock:v29]);
      uint64_t v14 = self;
      HMFGetOSLogHandle();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        id v17 = [v11 operationID];
        *(_DWORD *)buf = 138543618;
        id v48 = v16;
        __int16 v49 = 2112;
        __int16 v50 = v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching zone root record operation with ID: %@", buf, 0x16u);
      }
      [(HMDCloudManager *)v14 __addCKDatabaseOperation:v11];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
      _Block_object_dispose(v51, 8);
    }
    else
    {
      long long v23 = (void *)MEMORY[0x1D9452090]();
      long long v24 = self;
      long long v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)id v51 = 138543618;
        *(void *)&v51[4] = v26;
        *(_WORD *)&v51[12] = 2112;
        *(void *)&v51[14] = v6;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine root record for zone %@", v51, 0x16u);
      }
      if (!v28) {
        goto LABEL_15;
      }
      id v27 = [(HMDCloudManager *)v24 clientCallbackQueue];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_98;
      v43[3] = &unk_1E6A186E0;
      id v44 = v28;
      dispatch_async(v27, v43);

      id v11 = v44;
    }

LABEL_15:
    goto LABEL_16;
  }
  id v18 = (void *)MEMORY[0x1D9452090]();
  id v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)id v51 = 138543362;
    *(void *)&v51[4] = v21;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cloud zone need to be specified to verify root record", v51, 0xCu);
  }
  if (v28)
  {
    long long v22 = [(HMDCloudManager *)v19 clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke;
    block[3] = &unk_1E6A186E0;
    int v46 = (HMDCloudTransaction *)v28;
    dispatch_async(v22, block);

    id v7 = v46;
LABEL_16:
  }
}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_98(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v5 recordName];
      int v12 = 138543874;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2048;
      double v17 = a3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching %@ progress %f", (uint8_t *)&v12, 0x20u);
    }
  }
}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_101(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v9)
    {
      id v11 = [v9 domain];
      if ([v11 isEqualToString:*MEMORY[0x1E4F19C40]] && objc_msgSend(v9, "code") == 11)
      {
        int v12 = [*(id *)(a1 + 32) isEqual:v8];

        if (v12)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          id v13 = (void *)MEMORY[0x1D9452090]();
          id v14 = WeakRetained;
          id v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __int16 v16 = HMFGetLogIdentifier();
            double v17 = [*(id *)(a1 + 32) recordName];
            int v25 = 138543618;
            uint64_t v26 = v16;
            __int16 v27 = 2112;
            id v28 = v17;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Root record %@ does not exist", (uint8_t *)&v25, 0x16u);
          }
        }
      }
      else
      {
      }
    }
    else if (v7)
    {
      uint64_t v18 = *(void **)(a1 + 32);
      id v19 = [v7 recordID];
      LODWORD(v18) = [v18 isEqual:v19];

      if (v18)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        id v20 = (void *)MEMORY[0x1D9452090]();
        id v21 = WeakRetained;
        long long v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          long long v23 = HMFGetLogIdentifier();
          long long v24 = [*(id *)(a1 + 32) recordName];
          int v25 = 138543618;
          uint64_t v26 = v23;
          __int16 v27 = 2112;
          id v28 = v24;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Root record %@ does exist", (uint8_t *)&v25, 0x16u);
        }
        [*(id *)(a1 + 40) addChangeWithRecord:v7];
      }
    }
  }
}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_20;
  }
  if (v6)
  {
    id v8 = [(__CFString *)v6 domain];
    if ([v8 isEqualToString:*MEMORY[0x1E4F19C40]])
    {
      uint64_t v9 = [(__CFString *)v6 code];

      if (v9 != 2)
      {
        id v10 = (void *)MEMORY[0x1D9452090]();
        id v11 = WeakRetained;
        int v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = HMFGetLogIdentifier();
          uint64_t v14 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          id v34 = v13;
          __int16 v35 = 2112;
          uint64_t v36 = v14;
          __int16 v37 = 2112;
          id v38 = v6;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch root record for zone %@ with error %@", buf, 0x20u);
        }
        if (*(void *)(a1 + 48))
        {
          id v15 = [v11 clientCallbackQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_104;
          block[3] = &unk_1E6A186E0;
          __int16 v16 = &v32;
          id v32 = *(id *)(a1 + 48);
          dispatch_async(v15, block);
LABEL_19:

          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  double v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = WeakRetained;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      id v21 = @"exists";
    }
    else {
      id v21 = @"does not exist";
    }
    uint64_t v22 = *(void *)(a1 + 32);
    int v23 = [*(id *)(a1 + 40) decryptionFailed];
    long long v24 = @"was";
    *(_DWORD *)buf = 138544130;
    id v34 = v20;
    __int16 v35 = 2112;
    if (v23) {
      long long v24 = @"failed to";
    }
    uint64_t v36 = v22;
    __int16 v37 = 2112;
    id v38 = v21;
    __int16 v39 = 2112;
    uint64_t v40 = v24;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetched zone %@ and record %@ and %@ to decrypt", buf, 0x2Au);
  }
  if (*(void *)(a1 + 48))
  {
    int v25 = [v18 clientCallbackQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_117;
    v28[3] = &unk_1E6A15CC8;
    __int16 v16 = (id *)v30;
    id v26 = *(id *)(a1 + 48);
    uint64_t v27 = *(void *)(a1 + 56);
    v30[0] = v26;
    v30[1] = v27;
    uint64_t v29 = *(id *)(a1 + 40);
    dispatch_async(v25, v28);

    id v15 = v29;
    goto LABEL_19;
  }
LABEL_20:
}

void __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_104(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__HMDCloudManager__fetchAndVerifyZoneRootRecord_completionHandler___block_invoke_117(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v3 = [*(id *)(a1 + 32) decryptionFailed] ^ 1;
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v1 + 16);
  return v4(v1, v2, v3, 0);
}

- (void)_uploadLegacyTransaction:(id)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cloudZone];
  if (v8)
  {
    objc_initWeak(location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6A09F90;
    objc_copyWeak(&v18, location);
    id v17 = v7;
    id v15 = v8;
    id v16 = v6;
    [v16 fetchBatchToUpload:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to upload data", (uint8_t *)location, 0xCu);
    }
    if (v7)
    {
      id v13 = [(HMDCloudManager *)v10 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke;
      block[3] = &unk_1E6A186E0;
      id v20 = v7;
      dispatch_async(v13, block);
    }
  }
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v52 = a2;
  id v51 = a3;
  id v53 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v53)
    {
      if (*(void *)(a1 + 48))
      {
        id v50 = WeakRetained;
        uint64_t v9 = [WeakRetained clientCallbackQueue];
        id v10 = block;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_3;
        block[3] = &unk_1E6A186E0;
        void block[4] = *(id *)(a1 + 48);
        dispatch_async(v9, block);

LABEL_5:
        id v11 = (void *)v10[4];
LABEL_31:

        id v8 = v50;
      }
    }
    else
    {
      uint64_t v49 = a1;
      id v50 = WeakRetained;
      if ([v52 count] || objc_msgSend(v51, "count"))
      {
        from = (id *)(a1 + 56);
        int v12 = (void *)MEMORY[0x1D9452090]();
        id v13 = v8;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = HMFGetLogIdentifier();
          uint64_t v16 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v84 = [v52 count];
          __int16 v85 = 2048;
          uint64_t v86 = [v51 count];
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Operations in zone %@ (%lu save, %lu delete)", buf, 0x2Au);
        }
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        obuint64_t j = v52;
        uint64_t v17 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v72 != v18) {
                objc_enumerationMutation(obj);
              }
              id v20 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              id v21 = (void *)MEMORY[0x1D9452090]();
              id v22 = v13;
              int v23 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                long long v24 = HMFGetLogIdentifier();
                int v25 = [v20 recordID];
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v24;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v25;
                _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@     Saving: %@", buf, 0x16u);
              }
            }
            uint64_t v17 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
          }
          while (v17);
        }

        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v26 = v51;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v67 objects:v81 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v68;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v68 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = *(void *)(*((void *)&v67 + 1) + 8 * j);
              uint64_t v31 = (void *)MEMORY[0x1D9452090]();
              id v32 = v13;
              long long v33 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                id v34 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v34;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v30;
                _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@     Deleting: %@", buf, 0x16u);
              }
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v67 objects:v81 count:16];
          }
          while (v27);
        }

        __int16 v35 = [v13 logEventSubmitter];
        uint64_t v36 = +[HMDRecordsSavedLogEvent legacyRecordsSaved:obj];
        [v35 submitLogEvent:v36];

        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:obj recordIDsToDelete:v26];
        [v11 setSavePolicy:0];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_88;
        v65[3] = &unk_1E6A09EA0;
        objc_copyWeak(&v66, from);
        [v11 setPerRecordProgressBlock:v65];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v84) = 0;
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_89;
        v61[3] = &unk_1E6A09EC8;
        objc_copyWeak(&v64, from);
        BOOL v63 = buf;
        id v62 = *(id *)(v49 + 40);
        [v11 setPerRecordCompletionBlock:v61];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_91;
        v55[3] = &unk_1E6A09F68;
        objc_copyWeak(&v60, from);
        id v59 = buf;
        id v56 = *(id *)(v49 + 40);
        id v58 = *(id *)(v49 + 48);
        id v57 = obj;
        __int16 v37 = (void *)MEMORY[0x1D9452090]([v11 setModifyRecordsCompletionBlock:v55]);
        id v38 = v13;
        HMFGetOSLogHandle();
        __int16 v39 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v40 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v41 = [v11 operationID];
          *(_DWORD *)unint64_t v77 = 138543618;
          id v78 = v40;
          __int16 v79 = 2112;
          __int16 v80 = v41;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Modifying records with operation ID: %@", v77, 0x16u);
        }
        objc_msgSend(v38, "__addCKDatabaseOperation:", v11);

        objc_destroyWeak(&v60);
        objc_destroyWeak(&v64);
        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v66);
        goto LABEL_31;
      }
      __int16 v42 = (void *)MEMORY[0x1D9452090]();
      id v43 = v8;
      id v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        id v45 = HMFGetLogIdentifier();
        uint64_t v46 = *(void *)(v49 + 32);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v45;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v46;
        _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_DEBUG, "%{public}@There are no records to save or delete for zone %@", buf, 0x16u);
      }
      id v8 = v50;
      if (*(void *)(v49 + 48))
      {
        id v47 = [v43 clientCallbackQueue];
        id v10 = v75;
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_87;
        v75[3] = &unk_1E6A186E0;
        v75[4] = *(id *)(v49 + 48);
        dispatch_async(v47, v75);

        goto LABEL_5;
      }
    }
  }
}

uint64_t __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_88(uint64_t a1, void *a2, double a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v5 recordType];
      int v12 = [v5 recordID];
      id v13 = [v12 recordName];
      int v14 = 138544130;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Record modify %@/%@ progress %f", (uint8_t *)&v14, 0x2Au);
    }
  }
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_28;
  }
  if (v6)
  {
    id v8 = [v6 domain];
    uint64_t v9 = *MEMORY[0x1E4F19C40];
    if ([v8 isEqualToString:*MEMORY[0x1E4F19C40]])
    {
      uint64_t v10 = [v6 code];

      if (v10 == 26)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        goto LABEL_28;
      }
    }
    else
    {
    }
    int v25 = [v6 domain];
    if ([v25 isEqualToString:v9])
    {
      uint64_t v26 = [v6 code];

      if (v26 == 14)
      {
        uint64_t v27 = (void *)MEMORY[0x1D9452090]();
        id v28 = WeakRetained;
        uint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = HMFGetLogIdentifier();
          uint64_t v31 = objc_msgSend(v6, "hmd_conciseCKError");
          id v32 = [v31 shortDescription];
          *(_DWORD *)buf = 138543618;
          id v64 = v30;
          __int16 v65 = 2112;
          id v66 = v32;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Failed to save record due to updated record in the server, need to resolve conflict, %@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) setNeedConflictResolution:1];
        long long v33 = *(void **)(a1 + 32);
        id v34 = [v5 recordID];
        __int16 v35 = [v34 recordName];
        uint64_t v36 = [v33 changeWithRecordName:v35];

        if (v36)
        {
          __int16 v37 = [v36 cloudRecord];
          int v38 = [v37 isRecordCreated];

          if (v38)
          {
            __int16 v39 = (void *)MEMORY[0x1D9452090]();
            id v40 = v28;
            uint64_t v41 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              __int16 v42 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              id v64 = v42;
              _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Conflict caused by new record, zone and cache can be out of sync, resetting token for fetch", buf, 0xCu);
            }
            id v43 = [*(id *)(a1 + 32) cloudZone];
            [v43 setServerChangeToken:0];

            id v44 = (void *)MEMORY[0x1D9452090]();
            id v45 = v40;
            uint64_t v46 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              id v47 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              id v64 = v47;
              _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because legacy record conflict", buf, 0xCu);
            }
            id v48 = [v45 cloudCache];
            [v48 setDatabaseServerChangeToken:0];

            uint64_t v49 = [v45 cloudCache];
            [v49 persistDatabaseServerChangeToken];
          }
        }
        id v50 = *(void **)(a1 + 32);
        id v51 = [v5 recordID];
        [v50 resetRecordWithRecordID:v51];

        goto LABEL_28;
      }
    }
    else
    {
    }
    id v52 = (void *)MEMORY[0x1D9452090]();
    id v53 = WeakRetained;
    uint64_t v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      id v55 = HMFGetLogIdentifier();
      id v56 = [v5 recordType];
      id v60 = [v5 recordID];
      id v57 = [v60 recordName];
      objc_msgSend(v6, "hmd_conciseCKError");
      id v58 = v62 = v52;
      id v59 = [v58 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v64 = v55;
      __int16 v65 = 2112;
      id v66 = v56;
      __int16 v67 = 2112;
      long long v68 = v57;
      __int16 v69 = 2112;
      long long v70 = v59;
      _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_INFO, "%{public}@Could not save record %@/%@: %@", buf, 0x2Au);

      id v52 = v62;
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = WeakRetained;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      id v15 = [v5 recordType];
      __int16 v16 = [v5 recordID];
      [v16 recordName];
      uint64_t v61 = a1;
      id v17 = v5;
      id v19 = v18 = v11;
      *(_DWORD *)buf = 138543874;
      id v64 = v14;
      __int16 v65 = 2112;
      id v66 = v15;
      __int16 v67 = 2112;
      long long v68 = v19;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Saved record %@/%@", buf, 0x20u);

      id v11 = v18;
      id v5 = v17;
      a1 = v61;
    }
    __int16 v20 = [v5 recordID];
    double v21 = [v12 legacyZone];
    uint64_t v22 = [v21 homeDataRecordID];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      [v12 setCloudHomeDataRecordExists:1];
      long long v24 = [MEMORY[0x1E4F5BE48] systemStore];
      [v24 ensureControllerKeyExistsForAllViews];
    }
    [*(id *)(a1 + 32) setSaveAsProcessedWithRecord:v5];
  }
LABEL_28:
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_91(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v54 = a2;
  id v55 = a3;
  id v57 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v58 = v57;
    id v56 = WeakRetained;
    id v8 = [WeakRetained logEventSubmitter];
    uint64_t v9 = +[HMDCloudSyncLegacyUploadLogEvent uploadCompletedWithError:v58];
    [v8 submitLogEvent:v9];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v10 = [*(id *)(a1 + 32) cloudZone];
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = v56;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = HMFGetLogIdentifier();
        id v15 = [v10 zone];
        __int16 v16 = [v15 zoneID];
        id v17 = [v16 zoneName];
        *(_DWORD *)buf = 138543618;
        id v81 = v14;
        __int16 v82 = 2112;
        uint64_t v83 = (uint64_t)v17;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to upload records to zone %@, creating", buf, 0x16u);
      }
      __int16 v18 = [v10 zone];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_93;
      v74[3] = &unk_1E6A09F40;
      objc_copyWeak(&v77, (id *)(a1 + 64));
      id v19 = v10;
      id v75 = v19;
      id v76 = *(id *)(a1 + 48);
      objc_msgSend(v12, "__saveRecordZone:completionHandler:", v18, v74);

      objc_destroyWeak(&v77);
      goto LABEL_43;
    }
    id v19 = [v56 delegate];
    __int16 v20 = (void *)MEMORY[0x1D9452090]();
    id v53 = v56;
    double v21 = HMFGetOSLogHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v58)
    {
      if (v22)
      {
        int v23 = HMFGetLogIdentifier();
        long long v24 = objc_msgSend(v58, "hmd_conciseCKError");
        int v25 = [v24 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v81 = v23;
        __int16 v82 = 2114;
        uint64_t v83 = (uint64_t)v25;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Failed to save records due %{public}@", buf, 0x16u);
      }
      if ([*(id *)(a1 + 32) needConflictResolution])
      {
        uint64_t v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = v53;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v81 = v29;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Need conflict resolution for home manager, schedule zone fetch and repush.", buf, 0xCu);
        }
        objc_msgSend(v19, "fetchHomeDataFromCloudWithCloudConflict:withDelay:", objc_msgSend(*(id *)(a1 + 32), "needConflictResolution"), 0.0);
      }
      else
      {
        uint64_t v41 = [v58 domain];
        int v42 = [v41 isEqualToString:*MEMORY[0x1E4F19C40]];

        if (v42)
        {
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v43 = *(id *)(a1 + 40);
          uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v79 count:16];
          if (v44)
          {
            uint64_t v45 = *(void *)v71;
            while (2)
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v71 != v45) {
                  objc_enumerationMutation(v43);
                }
                unint64_t v47 = [*(id *)(*((void *)&v70 + 1) + 8 * i) size];
                if (v47 > cloudRecordSizeLimit)
                {
                  id v48 = (void *)MEMORY[0x1D9452090]();
                  id v49 = v53;
                  id v50 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    id v51 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543362;
                    id v81 = v51;
                    _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@Operations failed because of record size, ignoring error", buf, 0xCu);
                  }

                  id v58 = 0;
                  goto LABEL_40;
                }
              }
              uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v79 count:16];
              if (v44) {
                continue;
              }
              break;
            }
          }
LABEL_40:
        }
      }
    }
    else
    {
      if (v22)
      {
        uint64_t v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v81 = v30;
        __int16 v82 = 2048;
        uint64_t v83 = [v54 count];
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Saved %ld records", buf, 0x16u);
      }
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v31 = v55;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v66 objects:v78 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v67 != v33) {
              objc_enumerationMutation(v31);
            }
            [*(id *)(a1 + 32) setDeleteAsProcessedWithRecordID:*(void *)(*((void *)&v66 + 1) + 8 * j)];
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v66 objects:v78 count:16];
        }
        while (v32);
      }

      __int16 v35 = (void *)MEMORY[0x1D9452090]();
      id v36 = v53;
      __int16 v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        int v38 = HMFGetLogIdentifier();
        uint64_t v39 = [v31 count];
        *(_DWORD *)buf = 138543618;
        id v81 = v38;
        __int16 v82 = 2048;
        uint64_t v83 = v39;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Deleted %ld records", buf, 0x16u);
      }
      if ([*(id *)(a1 + 32) moreChangesToProcess])
      {
        id v40 = [v36 workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_95;
        block[3] = &unk_1E6A10B58;
        objc_copyWeak(&v65, (id *)(a1 + 64));
        id v63 = *(id *)(a1 + 32);
        id v64 = *(id *)(a1 + 48);
        dispatch_async(v40, block);

        objc_destroyWeak(&v65);
        id v58 = 0;
LABEL_43:

        id WeakRetained = v56;
        goto LABEL_44;
      }
      [v19 fetchHomeDataFromCloudWithCloudConflict:0 withDelay:0.0];
      id v58 = 0;
    }
    if (*(void *)(a1 + 48))
    {
      id v52 = [v53 clientCallbackQueue];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_2_96;
      v59[3] = &unk_1E6A19530;
      id v61 = *(id *)(a1 + 48);
      id v58 = v58;
      id v60 = v58;
      dispatch_async(v52, v59);
    }
    goto LABEL_43;
  }
LABEL_44:
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_93(id *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v8 = v6;
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    id v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = id v22 = v6;
        double v21 = [a1[4] zone];
        [v21 zoneID];
        int v14 = v23 = v9;
        id v15 = [v14 zoneName];
        objc_msgSend(v8, "hmd_conciseCKError");
        __int16 v16 = v24 = v5;
        id v17 = [v16 shortDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v29 = v13;
        __int16 v30 = 2112;
        id v31 = v15;
        __int16 v32 = 2112;
        uint64_t v33 = v17;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to create record zone %@ due to error: %@", buf, 0x20u);

        id v5 = v24;
        uint64_t v9 = v23;

        id v6 = v22;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v18;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Restarting legacy push", buf, 0xCu);
      }
      id v19 = [v10 delegate];
      [v19 uploadHomeConfigToCloud:0 withDelay:0.0];

      id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    }
    if (a1[5])
    {
      __int16 v20 = [v10 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_94;
      block[3] = &unk_1E6A19530;
      id v27 = a1[5];
      id v26 = v8;
      dispatch_async(v20, block);
    }
  }
}

void __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_95(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _uploadLegacyTransaction:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

uint64_t __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_2_96(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __62__HMDCloudManager__uploadLegacyTransaction_completionHandler___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)uploadLegacyTransaction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HMDCloudManager *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke;
  v11[3] = &unk_1E6A10B58;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained accountActive] & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v4;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing transaction upload", buf, 0xCu);
    }
    if (a1[5])
    {
      id v10 = [v7 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_86;
      block[3] = &unk_1E6A186E0;
      id v16 = a1[5];
      dispatch_async(v10, block);
    }
  }
  else
  {
    id v5 = a1[4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6A18500;
    objc_copyWeak(&v14, v2);
    id v12 = a1[4];
    id v13 = a1[5];
    [v5 loadCloudRecordsAndDetermineDeletesFromCache:v11];

    objc_destroyWeak(&v14);
  }
}

void __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_86(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:75];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_3;
    block[3] = &unk_1E6A193D0;
    void block[4] = v3;
    id v6 = a1[4];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

uint64_t __61__HMDCloudManager_uploadLegacyTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _uploadLegacyTransaction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_removeZonesTransactions:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cloudZone];
  id v9 = [v8 zone];
  id v10 = [v9 zoneID];

  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v14;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing zone %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke;
  v18[3] = &unk_1E6A09E50;
  objc_copyWeak(&v22, (id *)buf);
  id v15 = v10;
  id v19 = v15;
  id v16 = v7;
  id v21 = v16;
  id v17 = v6;
  id v20 = v17;
  [(HMDCloudManager *)v12 __deleteRecordZoneWithID:v15 completionHandler:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = [v6 domain];
      if ([v8 isEqualToString:*MEMORY[0x1E4F19C40]])
      {
        uint64_t v9 = [v6 code];

        if (v9 == 26)
        {
          id v10 = (void *)MEMORY[0x1D9452090]();
          id v11 = WeakRetained;
          id v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v13 = HMFGetLogIdentifier();
            uint64_t v14 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            int v23 = v13;
            __int16 v24 = 2112;
            uint64_t v25 = v14;
            _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Zone %@ does not exist in cloud, nothing to delete", buf, 0x16u);
          }
          if (*(void *)(a1 + 48))
          {
            [*(id *)(a1 + 40) setZoneWasDeleted:1];
            id v15 = [v11 clientCallbackQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke_85;
            block[3] = &unk_1E6A186E0;
            id v21 = *(id *)(a1 + 48);
            dispatch_async(v15, block);
          }
        }
      }
      else
      {
      }
    }
    else
    {
      [*(id *)(a1 + 40) setZoneWasDeleted:1];
    }
    if (*(void *)(a1 + 48))
    {
      id v16 = [WeakRetained clientCallbackQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke_2;
      v17[3] = &unk_1E6A19530;
      id v19 = *(id *)(a1 + 48);
      id v18 = v6;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__HMDCloudManager__removeZonesTransactions_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeZonesTransactions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HMDCloudManager_removeZonesTransactions_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __61__HMDCloudManager_removeZonesTransactions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) accountActive])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v2 _removeZonesTransactions:v3 completionHandler:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing transaction to remove zone", buf, 0xCu);
    }
    if (*(void *)(a1 + 48))
    {
      id v9 = [*(id *)(a1 + 32) clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__HMDCloudManager_removeZonesTransactions_completionHandler___block_invoke_84;
      block[3] = &unk_1E6A186E0;
      id v11 = *(id *)(a1 + 48);
      dispatch_async(v9, block);
    }
  }
}

void __61__HMDCloudManager_removeZonesTransactions_completionHandler___block_invoke_84(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:75];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_uploadTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cloudZone];
  if (v8)
  {
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UploadTransaction", "", buf, 2u);
    }
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_73;
    v15[3] = &unk_1E6A09F18;
    objc_copyWeak(v19, (id *)buf);
    id v18 = v7;
    id v16 = v8;
    id v17 = v6;
    v19[1] = (id)0xEEEEB0B5B2B2EEEELL;
    [v17 fetchBatchToUpload:v15];

    objc_destroyWeak(v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v23 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to upload data", buf, 0xCu);
    }
    if (v7)
    {
      uint64_t v14 = [(HMDCloudManager *)v11 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke;
      block[3] = &unk_1E6A186E0;
      id v21 = v7;
      dispatch_async(v14, block);
    }
  }
}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_73(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v33 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      if (a1[6])
      {
        id v11 = [WeakRetained clientCallbackQueue];
        id v12 = block;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_2;
        block[3] = &unk_1E6A186E0;
        void block[4] = a1[6];
        dispatch_async(v11, block);

LABEL_5:
        id v13 = (void *)v12[4];
LABEL_13:
      }
    }
    else
    {
      if ([v7 count] || objc_msgSend(v33, "count"))
      {
        uint64_t v14 = (void *)MEMORY[0x1D9452090]();
        id v15 = v10;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = HMFGetLogIdentifier();
          id v18 = v15;
          id v19 = a1[4];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v19;
          id v15 = v18;
          id v8 = 0;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v53 = [v7 count];
          __int16 v54 = 2048;
          uint64_t v55 = [v33 count];
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Operations in zone %@ (%lu save, %lu delete)", buf, 0x2Au);
        }
        id v20 = [v15 logEventSubmitter];
        id v21 = +[HMDRecordsSavedLogEvent recordsSaved:v7];
        [v20 submitLogEvent:v21];

        id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v7 recordIDsToDelete:v33];
        [v13 setSavePolicy:0];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_76;
        v44[3] = &unk_1E6A09EA0;
        objc_copyWeak(&v45, a1 + 7);
        [v13 setPerRecordProgressBlock:v44];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v53) = 0;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_78;
        v40[3] = &unk_1E6A09EC8;
        objc_copyWeak(&v43, a1 + 7);
        int v42 = buf;
        id v41 = a1[5];
        [v13 setPerRecordCompletionBlock:v40];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_80;
        v34[3] = &unk_1E6A09EF0;
        objc_copyWeak(v39, a1 + 7);
        v39[1] = a1[8];
        id v35 = a1[5];
        int v38 = buf;
        id v36 = a1[4];
        id v37 = a1[6];
        id v22 = (void *)MEMORY[0x1D9452090]([v13 setModifyRecordsCompletionBlock:v34]);
        id v23 = v15;
        HMFGetOSLogHandle();
        uint64_t v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = [v13 operationID];
          *(_DWORD *)id v48 = 138543618;
          id v49 = v25;
          __int16 v50 = 2112;
          id v51 = v26;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Modifying records with operation ID: %@", v48, 0x16u);
        }
        objc_msgSend(v23, "__addCKDatabaseOperation:", v13);

        objc_destroyWeak(v39);
        objc_destroyWeak(&v43);
        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v45);
        goto LABEL_13;
      }
      uint64_t v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = v10;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        __int16 v30 = HMFGetLogIdentifier();
        id v31 = a1[4];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEBUG, "%{public}@There are no records to save or delete for zone %@", buf, 0x16u);
      }
      if (a1[6])
      {
        __int16 v32 = [v28 clientCallbackQueue];
        id v12 = v46;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_74;
        v46[3] = &unk_1E6A186E0;
        void v46[4] = a1[6];
        dispatch_async(v32, v46);

        goto LABEL_5;
      }
    }
  }
}

uint64_t __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_76(uint64_t a1, void *a2, double a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v5 recordType];
      id v12 = [v5 recordID];
      id v13 = [v12 recordName];
      int v14 = 138544130;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Record modify %@/%@ progress %f", (uint8_t *)&v14, 0x2Au);
    }
  }
}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_28;
  }
  if (v6)
  {
    id v8 = [v6 domain];
    uint64_t v9 = *MEMORY[0x1E4F19C40];
    if ([v8 isEqualToString:*MEMORY[0x1E4F19C40]])
    {
      uint64_t v10 = [v6 code];

      if (v10 == 26)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v19 = [v6 domain];
    if ([v19 isEqualToString:v9])
    {
      if ([v6 code] == 14)
      {

LABEL_18:
        uint64_t v29 = (void *)MEMORY[0x1D9452090]();
        id v30 = WeakRetained;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = HMFGetLogIdentifier();
          id v33 = objc_msgSend(v6, "hmd_conciseCKError");
          uint64_t v34 = [v33 shortDescription];
          *(_DWORD *)buf = 138543618;
          id v58 = v32;
          __int16 v59 = 2112;
          id v60 = v34;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Failed to save record due to updated record in the server, need to resolve conflict, %@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) setNeedConflictResolution:1];
        id v35 = *(void **)(a1 + 32);
        id v36 = [v5 recordID];
        id v37 = [v36 recordName];
        int v38 = [v35 changeWithRecordName:v37];

        if (v38)
        {
          uint64_t v39 = [v38 cloudRecord];
          int v40 = [v39 isRecordCreated];

          if (v40)
          {
            id v41 = (void *)MEMORY[0x1D9452090]();
            id v42 = v30;
            id v43 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              uint64_t v44 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              id v58 = v44;
              _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Conflict caused by new record, zone and cache can be out of sync, resetting token for fetch", buf, 0xCu);
            }
            id v45 = [*(id *)(a1 + 32) cloudZone];
            [v45 setServerChangeToken:0];

            uint64_t v46 = (void *)MEMORY[0x1D9452090]();
            id v47 = v42;
            id v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              id v49 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              id v58 = v49;
              _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because record conflict", buf, 0xCu);
            }
            __int16 v50 = [v47 cloudCache];
            [v50 setDatabaseServerChangeToken:0];

            id v51 = [v47 cloudCache];
            [v51 persistDatabaseServerChangeToken];
          }
        }
        id v52 = *(void **)(a1 + 32);
        uint64_t v53 = [v5 recordID];
        [v52 resetRecordWithRecordID:v53];

        goto LABEL_28;
      }
      uint64_t v28 = [v6 code];

      if (v28 == 11) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    __int16 v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = WeakRetained;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v5 recordType];
      __int16 v54 = [v5 recordID];
      id v25 = [v54 recordName];
      objc_msgSend(v6, "hmd_conciseCKError");
      uint64_t v26 = v56 = v20;
      uint64_t v27 = [v26 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v58 = v23;
      __int16 v59 = 2112;
      id v60 = v24;
      __int16 v61 = 2112;
      id v62 = v25;
      __int16 v63 = 2112;
      id v64 = v27;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Could not save record %@/%@: %@", buf, 0x2Au);

      __int16 v20 = v56;
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = WeakRetained;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      id v15 = [v5 recordType];
      __int16 v16 = [v5 recordID];
      [v16 recordName];
      id v55 = v5;
      v18 = id v17 = v11;
      *(_DWORD *)buf = 138543874;
      id v58 = v14;
      __int16 v59 = 2112;
      id v60 = v15;
      __int16 v61 = 2112;
      id v62 = v18;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Saved record %@/%@", buf, 0x20u);

      id v11 = v17;
      id v5 = v55;
    }
    [*(id *)(a1 + 32) setSaveAsProcessedWithRecord:v5];
  }
LABEL_28:
}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_80(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 8);
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    from = a1 + 8;
    id v12 = WeakRetained[1];
    id v13 = v12;
    os_signpost_id_t v14 = (os_signpost_id_t)a1[9];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v13, OS_SIGNPOST_INTERVAL_END, v14, "UploadTransaction", "", buf, 2u);
    }
    id v92 = v7;

    id v15 = [v11 logEventSubmitter];
    __int16 v16 = +[HMDCloudSyncUploadLogEvent uploadCompletedWithError:v9];
    [v15 submitLogEvent:v16];

    id v90 = [v11 delegate];
    if ([a1[4] wasZoneCreated])
    {
      id v17 = [a1[4] cloudZone];
      __int16 v18 = [v17 zone];
      id v19 = [v18 zoneID];
      __int16 v20 = [v19 zoneName];
      [v17 owner];
      v22 = id v21 = a1;
      [v11 _addHomeZoneName:v20 owner:v22];

      a1 = v21;
    }
    id v23 = (void *)MEMORY[0x1D9452090]();
    v91 = v11;
    id v94 = v11;
    uint64_t v24 = HMFGetOSLogHandle();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v25)
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = objc_msgSend(v9, "hmd_conciseCKError");
        uint64_t v28 = [v27 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v111 = v26;
        __int16 v112 = 2114;
        uint64_t v113 = (uint64_t)v28;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to save records due %{public}@", buf, 0x16u);
      }
      if (*(unsigned char *)(*((void *)a1[7] + 1) + 24))
      {
        uint64_t v29 = a1;
        id v30 = (void *)MEMORY[0x1D9452090]();
        id v31 = v94;
        __int16 v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          id v33 = HMFGetLogIdentifier();
          uint64_t v34 = [v29[5] zone];
          [v34 zoneID];
          v36 = id v35 = v9;
          id v37 = [v36 zoneName];
          *(_DWORD *)buf = 138543618;
          __int16 v111 = v33;
          __int16 v112 = 2112;
          uint64_t v113 = (uint64_t)v37;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Failed to save records because zone %@ does not exist", buf, 0x16u);

          id v9 = v35;
        }

        [v31 _verifyZoneHasBeenDeletedTransaction:v29[4] completionHandler:v29[6]];
        int v38 = v90;
        id v11 = v91;
        id v7 = v92;
        goto LABEL_57;
      }
      int v38 = v90;
      id v11 = v91;
      id v7 = v92;
      if ([a1[4] needConflictResolution])
      {
        if ([a1[4] isHomeManagerTransaction])
        {
          id v58 = (void *)MEMORY[0x1D9452090]();
          __int16 v59 = v94;
          id v60 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v61 = uint64_t v93 = v58;
            *(_DWORD *)buf = 138543362;
            __int16 v111 = v61;
            _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_INFO, "%{public}@Need conflict resolution for home manager, schedule zone fetch and repush.", buf, 0xCu);

            id v58 = v93;
          }

          [v90 fetchHomeManagerCloudConflict:1 withDelay:0.0];
        }
        else if ([a1[4] isHomeTransaction])
        {
          id v76 = (void *)MEMORY[0x1D9452090]();
          id v77 = v94;
          id v78 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            __int16 v79 = HMFGetLogIdentifier();
            id v80 = a1[5];
            *(_DWORD *)buf = 138543618;
            __int16 v111 = v79;
            __int16 v112 = 2112;
            uint64_t v113 = (uint64_t)v80;
            _os_log_impl(&dword_1D49D5000, v78, OS_LOG_TYPE_INFO, "%{public}@Need conflict resolution for home %@, schedule zone fetch and repush.", buf, 0x16u);
          }
          id v81 = objc_alloc(MEMORY[0x1E4F29128]);
          __int16 v82 = [a1[5] zone];
          uint64_t v83 = [v82 zoneID];
          uint64_t v84 = [v83 zoneName];
          __int16 v85 = (void *)[v81 initWithUUIDString:v84];

          if (v85) {
            [v90 fetchHomeFromCloudZone:v85 cloudConflict:1 withDelay:0.0];
          }
        }
      }
    }
    else
    {
      if (v25)
      {
        uint64_t v39 = HMFGetLogIdentifier();
        uint64_t v40 = [v92 count];
        *(_DWORD *)buf = 138543618;
        __int16 v111 = v39;
        __int16 v112 = 2048;
        uint64_t v113 = v40;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Saved %ld records", buf, 0x16u);
      }
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v88 = v8;
      id v41 = v8;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v106 objects:v117 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v107 != v44) {
              objc_enumerationMutation(v41);
            }
            [a1[4] setDeleteAsProcessedWithRecordID:*(void *)(*((void *)&v106 + 1) + 8 * i)];
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v106 objects:v117 count:16];
        }
        while (v43);
      }
      uint64_t v87 = a1;

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v46 = v41;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v102 objects:v116 count:16];
      id v48 = v94;
      if (v47)
      {
        uint64_t v49 = v47;
        uint64_t v50 = *(void *)v103;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v103 != v50) {
              objc_enumerationMutation(v46);
            }
            uint64_t v52 = *(void *)(*((void *)&v102 + 1) + 8 * j);
            uint64_t v53 = (void *)MEMORY[0x1D9452090]();
            __int16 v54 = v48;
            id v55 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              uint64_t v56 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              __int16 v111 = v56;
              __int16 v112 = 2112;
              uint64_t v113 = v52;
              _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@   Deleting: %@", buf, 0x16u);

              id v48 = v94;
            }
          }
          uint64_t v49 = [v46 countByEnumeratingWithState:&v102 objects:v116 count:16];
        }
        while (v49);
      }

      a1 = v87;
      if ([v87[4] moreChangesToProcess])
      {
        id v57 = [v48 workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_82;
        block[3] = &unk_1E6A10B58;
        objc_copyWeak(&v101, from);
        id v99 = v87[4];
        id v100 = v87[6];
        dispatch_async(v57, block);

        objc_destroyWeak(&v101);
        id v11 = v91;
        id v7 = v92;
        id v9 = 0;
        id v8 = v88;
        int v38 = v90;
LABEL_57:

        goto LABEL_58;
      }
      id v9 = 0;
      int v38 = v90;
      id v11 = v91;
      if ([v87[4] isHomeManagerTransaction])
      {
        id v62 = (void *)MEMORY[0x1D9452090]();
        __int16 v63 = v48;
        id v64 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          uint64_t v65 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v111 = v65;
          _os_log_impl(&dword_1D49D5000, v64, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch of home manager zone to update server token", buf, 0xCu);
        }
        [v90 fetchHomeManagerCloudConflict:0 withDelay:0.0];
        id v7 = v92;
        id v8 = v88;
      }
      else
      {
        id v7 = v92;
        id v8 = v88;
        if ([v87[4] isHomeTransaction])
        {
          id v66 = objc_alloc(MEMORY[0x1E4F29128]);
          long long v67 = [v87[5] zone];
          long long v68 = [v67 zoneID];
          long long v69 = [v68 zoneName];
          long long v70 = (void *)[v66 initWithUUIDString:v69];

          long long v71 = (void *)MEMORY[0x1D9452090]();
          long long v72 = v94;
          long long v73 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            long long v74 = HMFGetLogIdentifier();
            id v75 = v87[5];
            *(_DWORD *)buf = 138543874;
            __int16 v111 = v74;
            __int16 v112 = 2112;
            uint64_t v113 = (uint64_t)v75;
            __int16 v114 = 2112;
            char v115 = v70;
            _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_INFO, "%{public}@Scheduling fetch of zone %@/%@ to update server token", buf, 0x20u);
          }
          if (v70) {
            [v90 fetchHomeFromCloudZone:v70 cloudConflict:0 withDelay:0.0];
          }

          id v9 = 0;
          id v8 = v88;
        }
      }
    }
    if (a1[6])
    {
      uint64_t v86 = [v94 clientCallbackQueue];
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_83;
      v95[3] = &unk_1E6A19530;
      id v97 = a1[6];
      id v96 = v9;
      dispatch_async(v86, v95);
    }
    goto LABEL_57;
  }
LABEL_58:
}

void __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_82(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _uploadTransaction:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

uint64_t __56__HMDCloudManager__uploadTransaction_completionHandler___block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_checkZoneAndUploadTransaction:(id)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cloudZone];
  if (v8)
  {
    objc_initWeak(location, self);
    if ([v6 shouldDeleteZone])
    {
      id v9 = [v8 zone];
      uint64_t v10 = [v9 zoneID];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      id v25[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_2;
      void v25[3] = &unk_1E6A09E50;
      id v11 = &v29;
      objc_copyWeak(&v29, location);
      id v26 = v8;
      id v28 = v7;
      id v27 = v6;
      [(HMDCloudManager *)self __deleteRecordZoneWithID:v10 completionHandler:v25];
      id v12 = &v26;
      id v13 = &v28;
      os_signpost_id_t v14 = &v27;
    }
    else
    {
      if (![v6 shouldCreateZone])
      {
        [(HMDCloudManager *)self _uploadTransaction:v6 completionHandler:v7];
        goto LABEL_12;
      }
      id v9 = [v8 zone];
      uint64_t v10 = [v9 zoneID];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_3;
      v20[3] = &unk_1E6A09E78;
      id v11 = &v24;
      objc_copyWeak(&v24, location);
      id v21 = v8;
      id v22 = v6;
      id v23 = v7;
      [(HMDCloudManager *)self __fetchRecordZoneWithID:v10 completionHandler:v20];
      id v12 = &v21;
      id v13 = &v22;
      os_signpost_id_t v14 = &v23;
    }

    objc_destroyWeak(v11);
LABEL_12:
    objc_destroyWeak(location);
    goto LABEL_13;
  }
  id v15 = (void *)MEMORY[0x1D9452090]();
  __int16 v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    __int16 v18 = HMFGetLogIdentifier();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to upload data", (uint8_t *)location, 0xCu);
  }
  if (v7)
  {
    id v19 = [(HMDCloudManager *)v16 clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v31 = v7;
    dispatch_async(v19, block);
  }
LABEL_13:
}

void __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = [v6 domain];
      if ([v8 isEqualToString:*MEMORY[0x1E4F19C40]])
      {
        uint64_t v9 = [v6 code];

        if (v9 == 26)
        {
          uint64_t v10 = (void *)MEMORY[0x1D9452090]();
          id v11 = WeakRetained;
          id v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v13 = HMFGetLogIdentifier();
            uint64_t v14 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            id v23 = v13;
            __int16 v24 = 2112;
            uint64_t v25 = v14;
            _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Zone %@ does not exist in cloud, nothing to delete", buf, 0x16u);
          }
          if (*(void *)(a1 + 48))
          {
            id v15 = [v11 clientCallbackQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_69;
            block[3] = &unk_1E6A186E0;
            id v21 = *(id *)(a1 + 48);
            dispatch_async(v15, block);
          }
        }
      }
      else
      {
      }
    }
    else
    {
      [*(id *)(a1 + 40) setZoneWasDeleted:1];
    }
    if (*(void *)(a1 + 48))
    {
      __int16 v16 = [WeakRetained clientCallbackQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_2_70;
      v17[3] = &unk_1E6A19530;
      id v19 = *(id *)(a1 + 48);
      id v18 = v6;
      dispatch_async(v16, v17);
    }
  }
}

void __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_14;
  }
  if (!v6)
  {
    [WeakRetained _uploadTransaction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  uint64_t v9 = [v6 domain];
  if ([v9 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v10 = [v6 code];

    if (v10 == 26)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = v8;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v14;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Create zone %@", buf, 0x16u);
      }
      [v12 _createZoneAndUploadTransaction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
      goto LABEL_14;
    }
  }
  else
  {
  }
  __int16 v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = v8;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    uint64_t v28 = v20;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch zone %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 48))
  {
    id v21 = [v17 clientCallbackQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_72;
    v22[3] = &unk_1E6A19530;
    id v24 = *(id *)(a1 + 48);
    id v23 = v6;
    dispatch_async(v21, v22);
  }
LABEL_14:
}

uint64_t __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__HMDCloudManager__checkZoneAndUploadTransaction_completionHandler___block_invoke_2_70(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_verifyZoneHasBeenDeletedTransaction:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cloudZone];
  if (v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A038]) initWithPreviousServerChangeToken:0];
    [v9 setFetchAllChanges:1];
    *(void *)&long long v37 = 0;
    *((void *)&v37 + 1) = &v37;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    objc_initWeak(&location, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_2;
    v27[3] = &unk_1E6A09E00;
    id v10 = v8;
    id v28 = v10;
    uint64_t v29 = &v37;
    [v9 setRecordZoneWithIDWasDeletedBlock:v27];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_3;
    v21[3] = &unk_1E6A09E28;
    objc_copyWeak(&v26, &location);
    id v22 = v10;
    id v24 = v7;
    uint64_t v25 = &v37;
    id v23 = v6;
    id v11 = (void *)MEMORY[0x1D9452090]([v9 setFetchDatabaseChangesCompletionBlock:v21]);
    id v12 = self;
    HMFGetOSLogHandle();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v9 operationID];
      *(_DWORD *)buf = 138543618;
      id v34 = v14;
      __int16 v35 = 2112;
      id v36 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Verifying zone was deleted operation: %@", buf, 0x16u);
    }
    [(HMDCloudManager *)v12 __addCKDatabaseOperation:v9];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v37, 8);
    goto LABEL_9;
  }
  __int16 v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    LODWORD(v37) = 138543362;
    *(void *)((char *)&v37 + 4) = v19;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to determine if deleted", (uint8_t *)&v37, 0xCu);
  }
  if (v7)
  {
    uint64_t v20 = [(HMDCloudManager *)v17 clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v32 = v7;
    dispatch_async(v20, block);

    uint64_t v9 = v32;
LABEL_9:
  }
}

void __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 zone];
  id v6 = [v5 zoneID];
  int v7 = [v6 isEqual:v4];

  if (v7) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v7)
    {
      uint64_t v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = WeakRetained;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v32 = v12;
        __int16 v33 = 2112;
        uint64_t v34 = v13;
        __int16 v35 = 2112;
        id v36 = v7;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine if zone %@ was deleted in the cloud with error %@", buf, 0x20u);
      }
      if (*(void *)(a1 + 48))
      {
        id v14 = [v10 clientCallbackQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_67;
        block[3] = &unk_1E6A19530;
        uint64_t v15 = &v30;
        id v30 = *(id *)(a1 + 48);
        uint64_t v29 = v7;
        dispatch_async(v14, block);

        __int16 v16 = v29;
LABEL_16:
      }
    }
    else
    {
      int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      id v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = WeakRetained;
      uint64_t v20 = HMFGetOSLogHandle();
      id v21 = v20;
      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v22 = HMFGetLogIdentifier();
          uint64_t v23 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          id v32 = v22;
          __int16 v33 = 2112;
          uint64_t v34 = v23;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Zone %@ was deleted in the cloud", buf, 0x16u);
        }
        [*(id *)(a1 + 40) setZoneWasDeleted:1];
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v24 = HMFGetLogIdentifier();
          uint64_t v25 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          id v32 = v24;
          __int16 v33 = 2112;
          uint64_t v34 = v25;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Zone %@ does not exist in cloud and transaction is not marked to create, cannot upload records", buf, 0x16u);
        }
      }
      if (*(void *)(a1 + 48))
      {
        __int16 v16 = [v19 clientCallbackQueue];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_68;
        v26[3] = &unk_1E6A186E0;
        uint64_t v15 = &v27;
        id v27 = *(id *)(a1 + 48);
        dispatch_async(v16, v26);
        goto LABEL_16;
      }
    }
  }
}

uint64_t __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__HMDCloudManager__verifyZoneHasBeenDeletedTransaction_completionHandler___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createZoneAndUploadTransaction:(id)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cloudZone];
  if (v8)
  {
    objc_initWeak(location, self);
    uint64_t v9 = [v8 zone];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke_2;
    v15[3] = &unk_1E6A09E78;
    objc_copyWeak(&v19, location);
    id v16 = v8;
    id v18 = v7;
    id v17 = v6;
    [(HMDCloudManager *)self __saveRecordZone:v9 completionHandler:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to upload data", (uint8_t *)location, 0xCu);
    }
    if (v7)
    {
      id v14 = [(HMDCloudManager *)v11 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke;
      block[3] = &unk_1E6A186E0;
      id v21 = v7;
      dispatch_async(v14, block);
    }
  }
}

void __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = WeakRetained;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        id v16 = v8;
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = objc_msgSend(v6, "hmd_conciseCKError");
        id v14 = [v13 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v21 = v11;
        __int16 v22 = 2112;
        uint64_t v23 = v12;
        id v8 = v16;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to create zone %@ due to error: %@", buf, 0x20u);
      }
      if (*(void *)(a1 + 48))
      {
        uint64_t v15 = [v9 clientCallbackQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke_63;
        block[3] = &unk_1E6A19530;
        id v19 = *(id *)(a1 + 48);
        id v18 = v6;
        dispatch_async(v15, block);
      }
    }
    else
    {
      [*(id *)(a1 + 40) setZoneWasCreated:1];
      [WeakRetained _uploadTransaction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
  }
}

uint64_t __69__HMDCloudManager__createZoneAndUploadTransaction_completionHandler___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)uploadTransaction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HMDCloudManager *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke;
  v11[3] = &unk_1E6A10B58;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained accountActive] & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v4;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing transaction upload", buf, 0xCu);
    }
    if (a1[5])
    {
      id v10 = [v7 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_62;
      block[3] = &unk_1E6A186E0;
      id v16 = a1[5];
      dispatch_async(v10, block);
    }
  }
  else
  {
    id v5 = a1[4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6A18500;
    objc_copyWeak(&v14, v2);
    id v12 = a1[4];
    id v13 = a1[5];
    [v5 loadCloudRecordsAndDetermineDeletesFromCache:v11];

    objc_destroyWeak(&v14);
  }
}

void __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_62(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:75];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_3;
    block[3] = &unk_1E6A193D0;
    void block[4] = v3;
    id v6 = a1[4];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

uint64_t __55__HMDCloudManager_uploadTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkZoneAndUploadTransaction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_fetchTransaction:(id)a3 completionHandler:(id)a4
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v47 = a4;
  uint64_t v49 = v6;
  uint64_t v50 = [v6 cloudZone];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v50)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v50;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching changes from zone %@", buf, 0x16u);
    }
    id v48 = objc_alloc_init(MEMORY[0x1E4F1A060]);
    id v12 = [v50 serverChangeToken];
    [v48 setPreviousServerChangeToken:v12];

    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v8;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [v48 previousServerChangeToken];
      id v18 = [v17 debugDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching data with current server token: %@", buf, 0x16u);
    }
    if (([v6 zoneHasNoLocalData] & 1) != 0
      || [v6 isHomeManagerTransaction]
      && ([v6 doRecordsExistInCache] & 1) == 0)
    {
      [v48 setFetchNewestChangesFirst:1];
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
    }
    logger = v14->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FetchTransaction", "", buf, 2u);
    }
    id v23 = objc_alloc(MEMORY[0x1E4F1A070]);
    __int16 v24 = [v50 zone];
    uint64_t v25 = [v24 zoneID];
    v81[0] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
    id v27 = [v50 zone];
    id v28 = [v27 zoneID];
    __int16 v79 = v28;
    id v80 = v48;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    id v30 = (void *)[v23 initWithRecordZoneIDs:v26 configurationsByRecordZoneID:v29];

    [v30 setFetchAllChanges:1];
    objc_initWeak(&location, v14);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_49;
    v67[3] = &unk_1E6A09D60;
    objc_copyWeak(v69, &location);
    v69[1] = (id)0xEEEEB0B5B2B2EEEELL;
    id v31 = v49;
    id v68 = v31;
    uint64_t v32 = [v30 setRecordChangedBlock:v67];
    if (v19)
    {
      __int16 v33 = (void *)MEMORY[0x1D9452090](v32);
      uint64_t v34 = v14;
      HMFGetOSLogHandle();
      __int16 v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v36;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Ignoring deleted records while fetch zone", buf, 0xCu);
      }
    }
    else
    {
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_52;
      v64[3] = &unk_1E6A09D88;
      objc_copyWeak(v66, &location);
      v66[1] = (id)0xEEEEB0B5B2B2EEEELL;
      id v65 = v31;
      [v30 setRecordWithIDWasDeletedBlock:v64];

      objc_destroyWeak(v66);
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v78 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_54;
    aBlock[3] = &unk_1E6A09DB0;
    id v46 = &v63;
    objc_copyWeak(&v63, &location);
    id v37 = v47;
    id v62 = v37;
    id v38 = v31;
    id v61 = v38;
    char v39 = _Block_copy(aBlock);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_2;
    v56[3] = &unk_1E6A09DD8;
    objc_copyWeak(v59, &location);
    v59[1] = (id)0xEEEEB0B5B2B2EEEELL;
    id v58 = buf;
    id v40 = v39;
    id v57 = v40;
    [v30 setRecordZoneFetchCompletionBlock:v56];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_59;
    v51[3] = &unk_1E6A16C20;
    objc_copyWeak(&v55, &location);
    __int16 v54 = buf;
    id v52 = v38;
    id v53 = v37;
    id v41 = (void *)MEMORY[0x1D9452090]([v30 setFetchRecordZoneChangesCompletionBlock:v51]);
    uint64_t v42 = v14;
    HMFGetOSLogHandle();
    uint64_t v43 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      id v45 = objc_msgSend(v30, "operationID", &v63);
      *(_DWORD *)long long v73 = 138543618;
      id v74 = v44;
      __int16 v75 = 2112;
      id v76 = v45;
      _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Fetching record changes operation with ID: %@", v73, 0x16u);
    }
    [(HMDCloudManager *)v42 __addCKDatabaseOperation:v30];

    objc_destroyWeak(&v55);
    objc_destroyWeak(v59);

    objc_destroyWeak(v46);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(v69);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine zone to fetch data", buf, 0xCu);
    }
    if (v47)
    {
      id v21 = [(HMDCloudManager *)v8 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke;
      block[3] = &unk_1E6A186E0;
      id v72 = v47;
      dispatch_async(v21, block);
    }
  }
}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    id v7 = v6;
    os_signpost_id_t v8 = *(void *)(a1 + 48);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      id v9 = [v3 recordID];
      id v10 = [v9 recordName];
      int v13 = 138412290;
      id v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v7, OS_SIGNPOST_EVENT, v8, "FetchTransaction", "recordcallbackrecordName=%{signpost.description:attribute}@ ", (uint8_t *)&v13, 0xCu);
    }
    id v11 = [v5 logEventSubmitter];
    id v12 = +[HMDRecordChangedLogEvent recordChanged:v3];
    [v11 submitLogEvent:v12];

    [*(id *)(a1 + 32) addChangeWithRecord:v3];
  }
}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  os_signpost_id_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[1];
    id v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 48);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      id v12 = [v5 recordName];
      int v18 = 138412290;
      int v19 = v12;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v10, OS_SIGNPOST_EVENT, v11, "FetchTransaction", "deletecallbackrecordName=%{signpost.description:attribute}@ ", (uint8_t *)&v18, 0xCu);
    }
    int v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v8;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [v5 recordName];
      int v18 = 138543618;
      int v19 = v16;
      __int16 v20 = 2112;
      id v21 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Received deleted record changed event for record %@", (uint8_t *)&v18, 0x16u);
    }
    [*(id *)(a1 + 32) addChangeWithDeletedRecordID:v5];
  }
}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_54(id *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained logEventSubmitter];
    os_signpost_id_t v11 = +[HMDCloudSyncFetchLogEvent fetchCompletedWithError:v7];
    [v10 submitLogEvent:v11];

    if (a1[5])
    {
      id v12 = [v7 domain];
      uint64_t v13 = *MEMORY[0x1E4F19C40];
      if ([v12 isEqualToString:*MEMORY[0x1E4F19C40]])
      {
        uint64_t v14 = [v7 code];

        if (v14 == 21)
        {
          uint64_t v15 = (void *)MEMORY[0x1D9452090]();
          id v16 = v9;
          id v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v45 = v18;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Fetch failed due to expired token, resetting token and re-fetching", buf, 0xCu);
          }
          int v19 = [a1[4] cloudZone];
          [v19 setServerChangeToken:0];
          __int16 v20 = [v16 delegate];
          if ([a1[4] isHomeManagerTransaction])
          {
            uint64_t v21 = [v20 fetchHomeManagerCloudConflict:0 withDelay:0.0];
          }
          else
          {
            uint64_t v21 = [a1[4] isHomeTransaction];
            if (v21)
            {
              id v28 = objc_alloc(MEMORY[0x1E4F29128]);
              uint64_t v29 = [v19 zone];
              [v29 zoneID];
              id v30 = v40 = v20;
              id v31 = [v30 zoneName];
              uint64_t v32 = (void *)[v28 initWithUUIDString:v31];

              __int16 v20 = v40;
              if (v32) {
                [v40 fetchHomeFromCloudZone:v32 cloudConflict:0 withDelay:0.0];
              }
            }
          }
          __int16 v33 = (void *)MEMORY[0x1D9452090](v21);
          id v34 = v16;
          __int16 v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            id v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v45 = v36;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because zone fetch failed", buf, 0xCu);
          }
          id v37 = [v34 cloudCache];
          [v37 setDatabaseServerChangeToken:0];

          id v38 = [v34 cloudCache];
          [v38 persistDatabaseServerChangeToken];

          goto LABEL_24;
        }
      }
      else
      {
      }
      uint64_t v22 = [v7 domain];
      if ([v22 isEqualToString:v13])
      {
        uint64_t v23 = [v7 code];

        if (v23 == 26)
        {
          __int16 v24 = (void *)MEMORY[0x1D9452090]();
          id v25 = v9;
          uint64_t v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            id v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v45 = v27;
            _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Zone does not exist in cloud, nothing to fetch", buf, 0xCu);
          }
          [a1[4] setZoneWasDeleted:1];
          goto LABEL_24;
        }
      }
      else
      {
      }
      [a1[4] setUpdatedServerChangeToken:v6];
LABEL_24:
      char v39 = [v9 clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_56;
      block[3] = &unk_1E6A19530;
      id v43 = a1[5];
      id v42 = v7;
      dispatch_async(v39, block);
    }
  }
}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = (id *)WeakRetained;
  int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v31 = v14;
    char v19 = a5;
    id v20 = v12;
    v22 = id v21 = v13;
    uint64_t v23 = [v11 zoneName];
    *(_DWORD *)buf = 138543618;
    __int16 v33 = v22;
    __int16 v34 = 2112;
    __int16 v35 = v23;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetch record completion for zone %@", buf, 0x16u);

    id v13 = v21;
    id v12 = v20;
    a5 = v19;
    id v14 = v31;
  }

  if (v17)
  {
    __int16 v24 = v17[1];
    id v25 = v24;
    os_signpost_id_t v26 = *(void *)(a1 + 56);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v25, OS_SIGNPOST_INTERVAL_END, v26, "FetchTransaction", "", buf, 2u);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = v17;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v33 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Completion handler for fetch has already been called", buf, 0xCu);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if ((a5 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

void __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    goto LABEL_14;
  }
  id v5 = [v3 domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F19C40]])
  {

    goto LABEL_9;
  }
  uint64_t v6 = [v3 code];

  if (v6 != 26)
  {
LABEL_9:
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = WeakRetained;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v21 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Resetting databaseServerChangeToken because zone fetch failed", buf, 0xCu);
    }
    uint64_t v15 = [v12 cloudCache];
    [v15 setDatabaseServerChangeToken:0];

    goto LABEL_12;
  }
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = WeakRetained;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v21 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Zone does not exist in cloud, nothing to fetch", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setZoneWasDeleted:1];
LABEL_12:
  if (*(void *)(a1 + 40))
  {
    id v16 = [WeakRetained clientCallbackQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_60;
    v17[3] = &unk_1E6A19530;
    id v19 = *(id *)(a1 + 40);
    id v18 = v3;
    dispatch_async(v16, v17);
  }
LABEL_14:
}

uint64_t __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__HMDCloudManager__fetchTransaction_completionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchTransaction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMDCloudManager_fetchTransaction_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __54__HMDCloudManager_fetchTransaction_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) accountActive])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v2 _fetchTransaction:v3 completionHandler:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@User account is not active, failing transaction fetch", buf, 0xCu);
    }
    if (*(void *)(a1 + 48))
    {
      id v9 = [*(id *)(a1 + 32) clientCallbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__HMDCloudManager_fetchTransaction_completionHandler___block_invoke_44;
      block[3] = &unk_1E6A186E0;
      id v11 = *(id *)(a1 + 48);
      dispatch_async(v9, block);
    }
  }
}

void __54__HMDCloudManager_fetchTransaction_completionHandler___block_invoke_44(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:75];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeHomeZoneName:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing zone %@", (uint8_t *)&v10, 0x16u);
  }
  if (v4)
  {
    id v9 = [(HMDCloudManager *)v6 cloudCache];
    [v9 deleteHomeZoneWithName:v4];
  }
}

- (void)removeHomeZoneName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HMDCloudManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HMDCloudManager_removeHomeZoneName___block_invoke;
  block[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__HMDCloudManager_removeHomeZoneName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeHomeZoneName:*(void *)(a1 + 32)];
}

- (void)_addHomeZoneName:(id)a3 owner:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding home cloud zone %@", buf, 0x16u);
  }
  if (v6)
  {
    __int16 v12 = [(HMDCloudManager *)v9 cloudCache];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v13[2] = __42__HMDCloudManager__addHomeZoneName_owner___block_invoke;
    v13[3] = &unk_1E6A09D38;
    v13[4] = v9;
    id v14 = v6;
    [v12 homeZoneWithName:v14 owner:v7 completion:v13];
  }
}

void __42__HMDCloudManager__addHomeZoneName_owner___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setupSubscriptionForZone:a2];
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 fetchHomeFromCloudZone:v4 cloudConflict:0 withDelay:0.0];
}

- (void)addHomeZoneName:(id)a3 owner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HMDCloudManager *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__HMDCloudManager_addHomeZoneName_owner___block_invoke;
  v11[3] = &unk_1E6A16550;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __41__HMDCloudManager_addHomeZoneName_owner___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _addHomeZoneName:*(void *)(a1 + 32) owner:*(void *)(a1 + 40)];
}

- (HMDCloudHomeManagerZone)homeManagerZone
{
  id v2 = [(HMDCloudManager *)self cloudCache];
  uint64_t v3 = [v2 homeManagerZone];

  return (HMDCloudHomeManagerZone *)v3;
}

- (HMDCloudMetadataZone)metadataZone
{
  id v2 = [(HMDCloudManager *)self cloudCache];
  uint64_t v3 = [v2 metadataZone];

  return (HMDCloudMetadataZone *)v3;
}

- (BOOL)legacyZoneHasRecordsAvailable
{
  id v2 = [(HMDCloudManager *)self cloudCache];
  uint64_t v3 = [v2 legacyZone];
  char v4 = [v3 hasRecordsAvailable];

  return v4;
}

- (HMDCloudLegacyZone)legacyZone
{
  id v2 = [(HMDCloudManager *)self cloudCache];
  uint64_t v3 = [v2 legacyZone];

  return (HMDCloudLegacyZone *)v3;
}

- (void)__deleteRecordWithID:(id)a3 completionHandler:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A198]);
    v33[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v10 = (void *)[v8 initWithRecordsToSave:0 recordIDsToDelete:v9];

    id v11 = [v10 operationID];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __58__HMDCloudManager___deleteRecordWithID_completionHandler___block_invoke;
    __int16 v24 = &unk_1E6A09CE8;
    id v25 = self;
    id v12 = v11;
    id v26 = v12;
    id v27 = v6;
    id v28 = v7;
    id v13 = (void *)MEMORY[0x1D9452090]([v10 setModifyRecordsCompletionBlock:&v21]);
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Start deleting record with operation ID %@", buf, 0x16u);
    }
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@No recordID specified to delete", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __58__HMDCloudManager___deleteRecordWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v18 = 138543874;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Completed deleting record with operation ID %@ and error %@", (uint8_t *)&v18, 0x20u);
  }
  uint64_t v15 = objc_msgSend(v9, "hmd_actualCKErrorFromCKErrorPartialFailure:", *(void *)(a1 + 48));
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16)
  {
    __int16 v17 = [v8 firstObject];
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v15);
  }
}

- (void)__deleteRecordZonesWithIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A180]) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v6];
    id v9 = [v8 operationID];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v19[2] = __64__HMDCloudManager___deleteRecordZonesWithIDs_completionHandler___block_invoke;
    v19[3] = &unk_1E6A09D10;
    void v19[4] = self;
    id v10 = v9;
    id v20 = v10;
    id v21 = v7;
    id v11 = (void *)MEMORY[0x1D9452090]([v8 setModifyRecordZonesCompletionBlock:v19]);
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v14;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Start deleting record zones with operation ID %@", buf, 0x16u);
    }
    [(HMDCloudManager *)v12 __addCKDatabaseOperation:v8];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v23 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@No zones specified to delete", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __64__HMDCloudManager___deleteRecordZonesWithIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v16 = 138543874;
    __int16 v17 = v13;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Completed deleting record zones with operation ID %@ and error %@", (uint8_t *)&v16, 0x20u);
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v8, v9);
  }
}

- (void)__deleteRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v16 = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v13[2] = __62__HMDCloudManager___deleteRecordZoneWithID_completionHandler___block_invoke;
    v13[3] = &unk_1E6A187D0;
    id v14 = v6;
    id v15 = v7;
    [(HMDCloudManager *)self __deleteRecordZonesWithIDs:v8 completionHandler:v13];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@No zoneID specified to delete", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __62__HMDCloudManager___deleteRecordZoneWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = objc_msgSend(a3, "hmd_actualCKErrorFromCKErrorPartialFailure:", *(void *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    id v7 = [v8 firstObject];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v5);
  }
}

- (void)__saveRecordZone:(id)a3 completionHandler:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A180]);
    v33[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v10 = (void *)[v8 initWithRecordZonesToSave:v9 recordZoneIDsToDelete:0];

    id v11 = [v10 operationID];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __54__HMDCloudManager___saveRecordZone_completionHandler___block_invoke;
    __int16 v24 = &unk_1E6A09CE8;
    id v25 = self;
    id v12 = v11;
    id v26 = v12;
    id v27 = v6;
    id v28 = v7;
    id v13 = (void *)MEMORY[0x1D9452090]([v10 setModifyRecordZonesCompletionBlock:&v21]);
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Start saving record zone with operation ID %@", buf, 0x16u);
    }
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    __int16 v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@No zone specified to create", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __54__HMDCloudManager___saveRecordZone_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v19 = 138543874;
    __int16 v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Completed saving record zone with operation ID %@ and error %@", (uint8_t *)&v19, 0x20u);
  }
  id v15 = [*(id *)(a1 + 48) zoneID];
  id v16 = objc_msgSend(v9, "hmd_actualCKErrorFromCKErrorPartialFailure:", v15);

  uint64_t v17 = *(void *)(a1 + 56);
  if (v17)
  {
    __int16 v18 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v16);
  }
}

- (void)__fetchRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A090]);
    v33[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v10 = (void *)[v8 initWithRecordZoneIDs:v9];

    id v11 = [v10 operationID];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    __int16 v23 = __61__HMDCloudManager___fetchRecordZoneWithID_completionHandler___block_invoke;
    id v24 = &unk_1E6A09CC0;
    uint64_t v25 = self;
    id v12 = v11;
    id v26 = v12;
    id v27 = v6;
    id v28 = v7;
    id v13 = (void *)MEMORY[0x1D9452090]([v10 setFetchRecordZonesCompletionBlock:&v21]);
    uint64_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Start fetching record zone with operation ID %@", buf, 0x16u);
    }
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    __int16 v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@No zoneID specified to fetch", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __61__HMDCloudManager___fetchRecordZoneWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v15 = 138543874;
    id v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Completed fetching record zone with operation ID %@ and error %@", (uint8_t *)&v15, 0x20u);
  }
  id v12 = objc_msgSend(v6, "hmd_actualCKErrorFromCKErrorPartialFailure:", *(void *)(a1 + 48));
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13)
  {
    uint64_t v14 = [v5 objectForKeyedSubscript:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v12);
  }
}

- (void)__fetchAllRecordZonesWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1A090] fetchAllRecordZonesOperation];
  id v6 = [v5 operationID];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __62__HMDCloudManager___fetchAllRecordZonesWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E6A0B918;
  void v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  id v8 = v4;
  id v15 = v8;
  id v9 = (void *)MEMORY[0x1D9452090]([v5 setFetchRecordZonesCompletionBlock:v13]);
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Start fetching all record zone with operation ID %@", buf, 0x16u);
  }
  [(HMDCloudManager *)v10 __addCKDatabaseOperation:v5];
}

void __62__HMDCloudManager___fetchAllRecordZonesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v14 = 138543874;
    id v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Completed fetching all record zone with operation ID %@ and error %@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    uint64_t v13 = [v5 allValues];
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v6);
  }
}

- (void)__saveSubscription:(id)a3 completionHandler:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A1B8]);
    v33[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v10 = (void *)[v8 initWithSubscriptionsToSave:v9 subscriptionIDsToDelete:0];

    uint64_t v11 = [v10 operationID];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    __int16 v23 = __56__HMDCloudManager___saveSubscription_completionHandler___block_invoke;
    id v24 = &unk_1E6A09CE8;
    uint64_t v25 = self;
    id v12 = v11;
    id v26 = v12;
    id v27 = v6;
    id v28 = v7;
    uint64_t v13 = (void *)MEMORY[0x1D9452090]([v10 setModifySubscriptionsCompletionBlock:&v21]);
    int v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Start saving zone subscription with operation ID %@", buf, 0x16u);
    }
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    __int16 v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@No subscription specified to save", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __56__HMDCloudManager___saveSubscription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    char v39 = v13;
    __int16 v40 = 2112;
    uint64_t v41 = v14;
    __int16 v42 = 2112;
    id v43 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Completed saving zone subscription with operation ID %@ and error %@", buf, 0x20u);
  }
  id v15 = [*(id *)(a1 + 48) subscriptionID];
  __int16 v16 = objc_msgSend(v9, "hmd_actualCKErrorFromCKErrorPartialFailure:", v15);

  if (v16)
  {
    id v17 = 0;
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v7;
    uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v29 = v9;
      uint64_t v20 = a1;
      id v30 = v7;
      id v31 = v8;
      uint64_t v21 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(id *)(*((void *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v23 = v17;
          }
          else {
            __int16 v23 = 0;
          }
          id v24 = v23;

          if (v24)
          {
            uint64_t v25 = [v24 subscriptionID];
            id v26 = [*(id *)(v20 + 48) subscriptionID];
            char v27 = [v25 isEqualToString:v26];

            if (v27)
            {
              id v7 = v30;
              id v8 = v31;
              goto LABEL_19;
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        id v8 = v31;
        if (v19) {
          continue;
        }
        break;
      }
      id v17 = 0;
      id v7 = v30;
LABEL_19:
      __int16 v16 = 0;
      id v9 = v29;
      a1 = v20;
    }
    else
    {
      id v17 = 0;
    }
  }
  uint64_t v28 = *(void *)(a1 + 56);
  if (v28) {
    (*(void (**)(uint64_t, id, void *))(v28 + 16))(v28, v17, v16);
  }
}

- (void)__fetchSubscriptionWithID:(id)a3 completionHandler:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A0F0]);
    v33[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v10 = (void *)[v8 initWithSubscriptionIDs:v9];

    id v11 = [v10 operationID];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    __int16 v23 = __63__HMDCloudManager___fetchSubscriptionWithID_completionHandler___block_invoke;
    id v24 = &unk_1E6A09CC0;
    uint64_t v25 = self;
    id v12 = v11;
    id v26 = v12;
    id v27 = v6;
    id v28 = v7;
    uint64_t v13 = (void *)MEMORY[0x1D9452090]([v10 setFetchSubscriptionCompletionBlock:&v21]);
    uint64_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Start fetching zone subscription with operation ID %@", buf, 0x16u);
    }
    -[HMDCloudManager __addCKDatabaseOperation:](v14, "__addCKDatabaseOperation:", v10, v21, v22, v23, v24, v25);
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@No subscriptionID specified to fetch", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __63__HMDCloudManager___fetchSubscriptionWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v15 = 138543874;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Completed fetching zone subscription with operation ID %@ and error %@", (uint8_t *)&v15, 0x20u);
  }
  id v12 = objc_msgSend(v6, "hmd_actualCKErrorFromCKErrorPartialFailure:", *(void *)(a1 + 48));
  if (v12)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [v5 objectForKeyedSubscript:*(void *)(a1 + 48)];
  }
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v13, v12);
  }
}

- (void)__addCKDatabaseOperation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 configuration];
    [v6 setQualityOfService:17];

    id v7 = [(HMDCloudManager *)self database];
    [v7 addOperation:v5];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Operation no specified to submit to database", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDCloudManager;
  [(HMDCloudManager *)&v4 dealloc];
}

- (HMDCloudManager)initWithMessageDispatcher:(id)a3 cloudDataSyncStateFilter:(id)a4 cloudCache:(id)a5 delegate:(id)a6 dataSource:(id)a7 syncManager:(id)a8 callbackQueue:(id)a9 container:(id)a10 logEventSubmitter:(id)a11 workQueue:(id)a12
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v42 = a4;
  id v48 = a4;
  id v47 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v46 = a9;
  id v45 = a10;
  id v44 = a11;
  id v43 = a12;
  v50.receiver = self;
  v50.super_class = (Class)HMDCloudManager;
  uint64_t v21 = [(HMDCloudManager *)&v50 init];
  if (v21)
  {
    uint64_t v22 = HMFGetOSLogHandle();
    logger = v21->_logger;
    v21->_logger = (OS_os_log *)v22;

    objc_storeStrong((id *)&v21->_workQueue, a12);
    objc_storeStrong((id *)&v21->_container, a10);
    uint64_t v24 = [(CKContainer *)v21->_container privateCloudDatabase];
    database = v21->_database;
    v21->_database = (CKDatabase *)v24;

    objc_storeStrong((id *)&v21->_cloudCache, a5);
    v21->_cloudHomeDataRecordExists = 0;
    objc_storeStrong((id *)&v21->_clientCallbackQueue, a9);
    objc_storeStrong((id *)&v21->_msgDispatcher, a3);
    id v26 = v18;
    objc_storeWeak((id *)&v21->_delegate, v18);
    objc_storeWeak((id *)&v21->_dataSource, v19);
    id v27 = v20;
    objc_storeWeak((id *)&v21->_syncManager, v20);
    retryTimer = v21->_retryTimer;
    v21->_retryTimer = 0;

    pollTimer = v21->_pollTimer;
    v21->_pollTimer = 0;

    controllerKeyPollTimer = v21->_controllerKeyPollTimer;
    v21->_controllerKeyPollTimer = 0;

    id cloudDataDeletedNotificationHandler = v21->_cloudDataDeletedNotificationHandler;
    v21->_id cloudDataDeletedNotificationHandler = 0;

    id cloudMetadataDeletedNotificationHandler = v21->_cloudMetadataDeletedNotificationHandler;
    v21->_id cloudMetadataDeletedNotificationHandler = 0;

    v21->_keychainSyncEnabled = [v19 isKeychainSyncEnabled];
    v21->_firstV3FetchRun = 0;
    v21->_firstDBQueryRun = 0;
    objc_storeStrong((id *)&v21->_cloudDataSyncStateFilter, v42);
    objc_storeStrong((id *)&v21->_logEventSubmitter, a11);
    long long v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v21 selector:sel_resetCloudServerTokenData_ name:@"kCloudServerTokenDataResetNotification" object:0];

    long long v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v21 selector:sel_handleKeychainStateChangedNotification_ name:@"HMDAppleAccountSettingsKeychainSyncStateUpdatedNotificationKey" object:0];

    long long v35 = (void *)MEMORY[0x1D9452090]([(HMDCloudManager *)v21 _registerForProxSetupNotifications]);
    long long v36 = v21;
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v38 = HMFGetLogIdentifier();
      char v39 = [(CKContainer *)v21->_container containerIdentifier];
      *(_DWORD *)buf = 138543618;
      id v52 = v38;
      __int16 v53 = 2112;
      __int16 v54 = v39;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Using %@ as container identifier", buf, 0x16u);
    }
    id v18 = v26;
    id v20 = v27;
  }

  return v21;
}

- (HMDCloudManager)initWithMessageDispatcher:(id)a3 cloudDataSyncStateFilter:(id)a4 cloudCache:(id)a5 delegate:(id)a6 dataSource:(id)a7 syncManager:(id)a8 logEventSubmitter:(id)a9 callbackQueue:(id)a10
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v34 = a4;
  id v16 = a5;
  id v17 = a6;
  id v33 = a7;
  id v32 = a8;
  id v31 = a9;
  id v18 = a10;
  id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v20 = dispatch_queue_create("com.apple.hmd.cksync", v19);

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.willow.config" environment:cloudKitContainerEnvironment];
  uint64_t v22 = (void *)MEMORY[0x1D9452090]();
  __int16 v23 = self;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v26 = v25 = v17;
    id v27 = CKContainerEnvironmentString();
    *(_DWORD *)buf = 138543618;
    id v37 = v26;
    __int16 v38 = 2112;
    char v39 = v27;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Creating CloudKit container in '%@' environment", buf, 0x16u);

    id v17 = v25;
  }

  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v21];
  id v30 = [(HMDCloudManager *)v23 initWithMessageDispatcher:v35 cloudDataSyncStateFilter:v34 cloudCache:v16 delegate:v17 dataSource:v33 syncManager:v32 callbackQueue:v18 container:v28 logEventSubmitter:v31 workQueue:v20];

  return v30;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_40016 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_40016, &__block_literal_global_40017);
  }
  id v2 = (void *)logCategory__hmf_once_v3_40018;
  return v2;
}

uint64_t __30__HMDCloudManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_40018;
  logCategory__hmf_once_v3_40018 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end