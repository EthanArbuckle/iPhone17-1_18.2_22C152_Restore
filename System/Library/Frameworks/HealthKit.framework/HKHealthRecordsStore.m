@interface HKHealthRecordsStore
- (HKHealthRecordsStore)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (HKObserverSet)accountsEventObservers;
- (HKObserverSet)chrSupportedStateChangeObservers;
- (NSString)description;
- (id)_actionCompletionWithObjectOnClientQueue:(id)a3;
- (id)unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
- (void)_executeCheapCallOnPluginServerProxy:(id)a3;
- (void)_fetchHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_getSynchronousHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3;
- (void)_withLock_notifyAccountsEventsListenerOfEvent:(unint64_t)a3;
- (void)addHealthRecordsSupportedChangeListener:(id)a3;
- (void)clientRemote_healthRecordsAccountsEventObserved:(unint64_t)a3;
- (void)clientRemote_healthRecordsSupportedDidChangeTo:(BOOL)a3;
- (void)deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4;
- (void)fetchClinicalConnectedAccountsWithCompletion:(id)a3;
- (void)fetchClinicalOptInDataCollectionFilePathsWithCompletion:(id)a3;
- (void)fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:(id)a3;
- (void)fetchCurrentIngestionStatusWithCompletion:(id)a3;
- (void)fetchExportedPropertiesForHealthRecord:(id)a3 completion:(id)a4;
- (void)fetchFHIRJSONDocumentWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:(id)a3;
- (void)fetchLogoForBrand:(id)a3 scale:(id)a4 completion:(id)a5;
- (void)fetchRawSourceStringForHealthRecord:(id)a3 completion:(id)a4;
- (void)fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion:(id)a3;
- (void)fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion:(id)a3;
- (void)pingWithCompletion:(id)a3;
- (void)registerAccountsEventListener:(id)a3;
- (void)registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4;
- (void)removeAccountsEventListener:(id)a3;
- (void)removeHealthRecordsSupportedChangeListener:(id)a3;
- (void)resetClinicalContentAnalyticsAnchorsWithCompletion:(id)a3;
- (void)resetClinicalOptInDataCollectionAnchorsWithCompletion:(id)a3;
- (void)setAccountsEventObservers:(id)a3;
- (void)setChrSupportedStateChangeObservers:(id)a3;
- (void)setUnitTesting_didCallReestablishProxyConnectionIfObserversArePresent:(id)a3;
- (void)stringifyExtractionFailureReasonsForRecord:(id)a3 completion:(id)a4;
- (void)triggerClinicalContentAnalyticsForReason:(int64_t)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)triggerClinicalOptInDataCollectionForReason:(int64_t)a3 completion:(id)a4;
- (void)triggerHealthCloudUploadWithCompletion:(id)a3;
@end

@implementation HKHealthRecordsStore

- (HKHealthRecordsStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HKHealthRecordsStore;
  v6 = [(HKHealthRecordsStore *)&v25 init];
  v7 = v6;
  if (v6)
  {
    v6->_ivarLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = [HKTaskServerProxyProvider alloc];
    v9 = [(id)objc_opt_class() taskIdentifier];
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [(HKTaskServerProxyProvider *)v8 initWithHealthStore:v5 taskIdentifier:v9 exportedObject:v7 taskUUID:v10];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
    v7->_lastKnownIngestionStatus = 0;
    objc_initWeak(&location, v7);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __44__HKHealthRecordsStore_initWithHealthStore___block_invoke;
    v22[3] = &unk_1E58C2290;
    objc_copyWeak(&v23, &location);
    [(HKProxyProvider *)v7->_proxyProvider setAutomaticProxyReconnectionHandler:v22];
    v13 = [HKObserverSet alloc];
    uint64_t v14 = [(HKObserverSet *)v13 initWithName:@"HKHealthRecordsStore-healthRecordsSupportedStateChangeObservers" loggingCategory:HKLogHealthRecords];
    chrSupportedStateChangeObservers = v7->_chrSupportedStateChangeObservers;
    v7->_chrSupportedStateChangeObservers = (HKObserverSet *)v14;

    v16 = [HKObserverSet alloc];
    uint64_t v17 = [(HKObserverSet *)v16 initWithName:@"HKHealthRecordsStore-accountsEventObservers" loggingCategory:HKLogHealthRecords];
    accountsEventObservers = v7->_accountsEventObservers;
    v7->_accountsEventObservers = (HKObserverSet *)v17;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__HKHealthRecordsStore_initWithHealthStore___block_invoke_2;
    v20[3] = &unk_1E58C22B8;
    v21 = v7;
    [(HKHealthRecordsStore *)v21 fetchCurrentIngestionStatusWithCompletion:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __44__HKHealthRecordsStore_initWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:v4];
}

void __44__HKHealthRecordsStore_initWithHealthStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 24))
  {
    *(void *)(v4 + 24) = a2;
    objc_msgSend(*(id *)(a1 + 32), "_withLock_notifyAccountsEventsListenerOfEvent:", a2);
    uint64_t v4 = *(void *)(a1 + 32);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  return (NSString *)v6;
}

- (void)pingWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__HKHealthRecordsStore_pingWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__HKHealthRecordsStore_pingWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __43__HKHealthRecordsStore_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __43__HKHealthRecordsStore_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchClinicalConnectedAccountsWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__HKHealthRecordsStore_fetchClinicalConnectedAccountsWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__HKHealthRecordsStore_fetchClinicalConnectedAccountsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __69__HKHealthRecordsStore_fetchClinicalConnectedAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchClinicalConnectedAccountsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __69__HKHealthRecordsStore_fetchClinicalConnectedAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLogoForBrand:(id)a3 scale:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__HKHealthRecordsStore_fetchLogoForBrand_scale_completion___block_invoke;
  v16[3] = &unk_1E58C2308;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__HKHealthRecordsStore_fetchLogoForBrand_scale_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __59__HKHealthRecordsStore_fetchLogoForBrand_scale_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchLogoForBrand:scale:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __59__HKHealthRecordsStore_fetchLogoForBrand_scale_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerAccountsEventListener:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  [v5 healthRecordsStore:self observedAccountsEvent:self->_lastKnownIngestionStatus];
  [(HKObserverSet *)self->_accountsEventObservers registerObserver:v5 queue:0];

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)removeAccountsEventListener:(id)a3
{
}

- (void)_withLock_notifyAccountsEventsListenerOfEvent:(unint64_t)a3
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  accountsEventObservers = self->_accountsEventObservers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HKHealthRecordsStore__withLock_notifyAccountsEventsListenerOfEvent___block_invoke;
  v6[3] = &unk_1E58C2330;
  void v6[4] = self;
  v6[5] = a3;
  [(HKObserverSet *)accountsEventObservers notifyObservers:v6];
}

uint64_t __70__HKHealthRecordsStore__withLock_notifyAccountsEventsListenerOfEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 healthRecordsStore:*(void *)(a1 + 32) observedAccountsEvent:*(void *)(a1 + 40)];
}

- (void)fetchCurrentIngestionStatusWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke;
  v14[3] = &unk_1E58BDD18;
  id v6 = v4;
  id v15 = v6;
  id v7 = [(HKProxyProvider *)proxyProvider clientQueueObjectHandlerWithCompletion:v14];
  id v11 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_2;
  v12[3] = &unk_1E58C22E0;
  id v13 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_3;
  v10[3] = &unk_1E58BBC48;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = [a2 integerValue];
    if ((unint64_t)(v4 - 1) >= 5) {
      a2 = 0;
    }
    else {
      a2 = (void *)v4;
    }
    id v5 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);
    uint64_t v6 = v3;
    a3 = 0;
  }
  else
  {
    id v5 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
  }

  return v5(v6, a2, a3);
}

uint64_t __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_currentIngestionStatusWithCompletion:", *(void *)(a1 + 32));
}

void __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_3_cold_1(a1);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clientRemote_healthRecordsAccountsEventObserved:(unint64_t)a3
{
  _HKInitializeLogging();
  id v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    [(HKHealthRecordsStore *)(uint64_t)self clientRemote_healthRecordsAccountsEventObserved:v5];
  }
  os_unfair_lock_lock(&self->_ivarLock);
  if (a3 - 1 <= 1) {
    self->_lastKnownIngestionStatus = a3;
  }
  [(HKHealthRecordsStore *)self _withLock_notifyAccountsEventsListenerOfEvent:a3];
  os_unfair_lock_unlock(&self->_ivarLock);
}

- (void)fetchRawSourceStringForHealthRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__HKHealthRecordsStore_fetchRawSourceStringForHealthRecord_completion___block_invoke;
  v12[3] = &unk_1E58C2358;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HKHealthRecordsStore_fetchRawSourceStringForHealthRecord_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __71__HKHealthRecordsStore_fetchRawSourceStringForHealthRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRawSourceStringForHealthRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __71__HKHealthRecordsStore_fetchRawSourceStringForHealthRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchExportedPropertiesForHealthRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HKHealthRecordsStore_fetchExportedPropertiesForHealthRecord_completion___block_invoke;
  v12[3] = &unk_1E58C2358;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HKHealthRecordsStore_fetchExportedPropertiesForHealthRecord_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __74__HKHealthRecordsStore_fetchExportedPropertiesForHealthRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchExportedPropertiesForHealthRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __74__HKHealthRecordsStore_fetchExportedPropertiesForHealthRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchFHIRJSONDocumentWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__HKHealthRecordsStore_fetchFHIRJSONDocumentWithAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E58C2358;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__HKHealthRecordsStore_fetchFHIRJSONDocumentWithAccountIdentifier_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __78__HKHealthRecordsStore_fetchFHIRJSONDocumentWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchFHIRJSONDocumentWithAccountIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __78__HKHealthRecordsStore_fetchFHIRJSONDocumentWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stringifyExtractionFailureReasonsForRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  if (+[_HKBehavior isAppleInternalInstall])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__HKHealthRecordsStore_stringifyExtractionFailureReasonsForRecord_completion___block_invoke;
    v10[3] = &unk_1E58C2358;
    id v11 = v6;
    id v12 = v7;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__HKHealthRecordsStore_stringifyExtractionFailureReasonsForRecord_completion___block_invoke_2;
    v8[3] = &unk_1E58BBD88;
    id v9 = v12;
    [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v10 errorHandler:v8];
  }
  else
  {
    v7[2](v7, MEMORY[0x1E4F1CBF0], 0);
  }
}

uint64_t __78__HKHealthRecordsStore_stringifyExtractionFailureReasonsForRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stringifyExtractionFailureReasonsForRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __78__HKHealthRecordsStore_stringifyExtractionFailureReasonsForRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__HKHealthRecordsStore_fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__HKHealthRecordsStore_fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __86__HKHealthRecordsStore_fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __86__HKHealthRecordsStore_fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__HKHealthRecordsStore_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__HKHealthRecordsStore_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __87__HKHealthRecordsStore_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __87__HKHealthRecordsStore_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__HKHealthRecordsStore_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__HKHealthRecordsStore_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __93__HKHealthRecordsStore_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __93__HKHealthRecordsStore_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__HKHealthRecordsStore_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __105__HKHealthRecordsStore_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __105__HKHealthRecordsStore_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __105__HKHealthRecordsStore_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerClinicalOptInDataCollectionForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__HKHealthRecordsStore_triggerClinicalOptInDataCollectionForReason_completion___block_invoke;
  v10[3] = &unk_1E58C2380;
  int64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__HKHealthRecordsStore_triggerClinicalOptInDataCollectionForReason_completion___block_invoke_2;
  v8[3] = &unk_1E58BBD88;
  id v9 = v11;
  id v7 = v11;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v10 errorHandler:v8];
}

uint64_t __79__HKHealthRecordsStore_triggerClinicalOptInDataCollectionForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerClinicalOptInDataCollectionForReason:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __79__HKHealthRecordsStore_triggerClinicalOptInDataCollectionForReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetClinicalOptInDataCollectionAnchorsWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__HKHealthRecordsStore_resetClinicalOptInDataCollectionAnchorsWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__HKHealthRecordsStore_resetClinicalOptInDataCollectionAnchorsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __78__HKHealthRecordsStore_resetClinicalOptInDataCollectionAnchorsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetClinicalOptInDataCollectionAnchorsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __78__HKHealthRecordsStore_resetClinicalOptInDataCollectionAnchorsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchClinicalOptInDataCollectionFilePathsWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__HKHealthRecordsStore_fetchClinicalOptInDataCollectionFilePathsWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__HKHealthRecordsStore_fetchClinicalOptInDataCollectionFilePathsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __80__HKHealthRecordsStore_fetchClinicalOptInDataCollectionFilePathsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchClinicalOptInDataCollectionFilePathsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __80__HKHealthRecordsStore_fetchClinicalOptInDataCollectionFilePathsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerClinicalContentAnalyticsForReason:(int64_t)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__HKHealthRecordsStore_triggerClinicalContentAnalyticsForReason_options_completion___block_invoke;
  v12[3] = &unk_1E58C23A8;
  int64_t v14 = a3;
  unint64_t v15 = a4;
  id v13 = v8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__HKHealthRecordsStore_triggerClinicalContentAnalyticsForReason_options_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v9 = v13;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __84__HKHealthRecordsStore_triggerClinicalContentAnalyticsForReason_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerClinicalContentAnalyticsForReason:options:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __84__HKHealthRecordsStore_triggerClinicalContentAnalyticsForReason_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerHealthCloudUploadWithCompletion:(id)a3
{
  uint64_t v4 = [(HKHealthRecordsStore *)self _actionCompletionWithObjectOnClientQueue:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HKHealthRecordsStore_triggerHealthCloudUploadWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HKHealthRecordsStore_triggerHealthCloudUploadWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __63__HKHealthRecordsStore_triggerHealthCloudUploadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerHealthCloudUploadWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __63__HKHealthRecordsStore_triggerHealthCloudUploadWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetClinicalContentAnalyticsAnchorsWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__HKHealthRecordsStore_resetClinicalContentAnalyticsAnchorsWithCompletion___block_invoke;
  v8[3] = &unk_1E58C22E0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__HKHealthRecordsStore_resetClinicalContentAnalyticsAnchorsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __75__HKHealthRecordsStore_resetClinicalContentAnalyticsAnchorsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetClinicalContentAnalyticsAnchorsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __75__HKHealthRecordsStore_resetClinicalContentAnalyticsAnchorsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addHealthRecordsSupportedChangeListener:(id)a3
{
}

- (void)removeHealthRecordsSupportedChangeListener:(id)a3
{
}

- (void)clientRemote_healthRecordsSupportedDidChangeTo:(BOOL)a3
{
  _HKInitializeLogging();
  id v5 = HKLogHealthRecords;
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    [(HKHealthRecordsStore *)(uint64_t)self clientRemote_healthRecordsSupportedDidChangeTo:v5];
  }
  chrSupportedStateChangeObservers = self->_chrSupportedStateChangeObservers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HKHealthRecordsStore_clientRemote_healthRecordsSupportedDidChangeTo___block_invoke;
  v7[3] = &unk_1E58C23D0;
  v7[4] = self;
  BOOL v8 = a3;
  [(HKObserverSet *)chrSupportedStateChangeObservers notifyObservers:v7];
}

uint64_t __71__HKHealthRecordsStore_clientRemote_healthRecordsSupportedDidChangeTo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 healthRecordsStore:*(void *)(a1 + 32) healthRecordsSupportedDidChangeTo:*(unsigned __int8 *)(a1 + 40)];
}

- (void)registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 _isApplication] & 1) == 0)
  {
    int64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthRecordsStore.m", 341, @"Invalid parameter not satisfying: %@", @"[source _isApplication]" object file lineNumber description];
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__HKHealthRecordsStore_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke;
  v15[3] = &unk_1E58C2358;
  id v16 = v7;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__HKHealthRecordsStore_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v10 = v17;
  id v11 = v7;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __102__HKHealthRecordsStore_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __102__HKHealthRecordsStore_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 _isApplication] & 1) == 0)
  {
    int64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthRecordsStore.m", 354, @"Invalid parameter not satisfying: %@", @"[source _isApplication]" object file lineNumber description];
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__HKHealthRecordsStore_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke;
  v15[3] = &unk_1E58C2358;
  id v16 = v7;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__HKHealthRecordsStore_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v10 = v17;
  id v11 = v7;
  [(HKHealthRecordsStore *)self _fetchHealthRecordsPluginServerProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __105__HKHealthRecordsStore_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __105__HKHealthRecordsStore_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)_getSynchronousHealthRecordsPluginServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (id)_actionCompletionWithObjectOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HKHealthRecordsStore__actionCompletionWithObjectOnClientQueue___block_invoke;
  v8[3] = &unk_1E58C23F8;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)[v8 copy];

  return v6;
}

void __65__HKHealthRecordsStore__actionCompletionWithObjectOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) healthStore];
  id v10 = [v9 clientQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HKHealthRecordsStore__actionCompletionWithObjectOnClientQueue___block_invoke_2;
  v14[3] = &unk_1E58BF598;
  id v11 = *(id *)(a1 + 40);
  id v16 = v8;
  id v17 = v11;
  char v18 = a2;
  id v15 = v7;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, v14);
}

uint64_t __65__HKHealthRecordsStore__actionCompletionWithObjectOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  unint64_t v4 = [(HKObserverSet *)self->_chrSupportedStateChangeObservers count];
  unint64_t v5 = [(HKObserverSet *)self->_accountsEventObservers count];
  os_unfair_lock_unlock(&self->_ivarLock);
  if (v4 + v5)
  {
    [(HKHealthRecordsStore *)self _executeCheapCallOnPluginServerProxy:v7];
    unitTesting_didCallReestablishProxyConnectionIfObserversArePresent = (void (**)(void))self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
    if (unitTesting_didCallReestablishProxyConnectionIfObserversArePresent) {
      unitTesting_didCallReestablishProxyConnectionIfObserversArePresent[2]();
    }
  }
}

- (void)_executeCheapCallOnPluginServerProxy:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    -[HKHealthRecordsStore _executeCheapCallOnPluginServerProxy:]((uint64_t)self);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__HKHealthRecordsStore__executeCheapCallOnPluginServerProxy___block_invoke;
  v5[3] = &unk_1E58BBE28;
  v5[4] = self;
  objc_msgSend(v4, "remote_pingWithCompletion:", v5);
}

void __61__HKHealthRecordsStore__executeCheapCallOnPluginServerProxy___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      __61__HKHealthRecordsStore__executeCheapCallOnPluginServerProxy___block_invoke_cold_1(a1);
    }
  }
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKObserverSet)chrSupportedStateChangeObservers
{
  return self->_chrSupportedStateChangeObservers;
}

- (void)setChrSupportedStateChangeObservers:(id)a3
{
}

- (HKObserverSet)accountsEventObservers
{
  return self->_accountsEventObservers;
}

- (void)setAccountsEventObservers:(id)a3
{
}

- (id)unitTesting_didCallReestablishProxyConnectionIfObserversArePresent
{
  return self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
}

- (void)setUnitTesting_didCallReestablishProxyConnectionIfObserversArePresent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent, 0);
  objc_storeStrong((id *)&self->_accountsEventObservers, 0);
  objc_storeStrong((id *)&self->_chrSupportedStateChangeObservers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __66__HKHealthRecordsStore_fetchCurrentIngestionStatusWithCompletion___block_invoke_3_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_19C023000, v1, v2, "%{public}@: failed to fetch server proxy and determine current accounts ingestion status: %{public}@", (void)v3, DWORD2(v3));
}

- (void)clientRemote_healthRecordsAccountsEventObserved:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a2 - 1) > 4) {
    long long v3 = @"unknown";
  }
  else {
    long long v3 = off_1E58C2418[a2 - 1];
  }
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  id v8 = v3;
  id v4 = a3;
  _os_log_debug_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: health records accounts event observed: %{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)clientRemote_healthRecordsSupportedDidChangeTo:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1026;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_19C023000, log, OS_LOG_TYPE_DEBUG, "%{public}@: health records supported did change to: %{public}d", (uint8_t *)&v3, 0x12u);
}

- (void)_executeCheapCallOnPluginServerProxy:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0_7();
  _os_log_debug_impl(&dword_19C023000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: making cheap XCP call to establish connection on %{public}@", (uint8_t *)&v2, 0x16u);
}

void __61__HKHealthRecordsStore__executeCheapCallOnPluginServerProxy___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_19C023000, v1, v2, "%{public}@: cheap XPC call didn't return YES, error: %{public}@", (void)v3, DWORD2(v3));
}

@end