@interface HDClinicalIngestionManager
- (BOOL)_enableCHRNotificationsIfNeeded;
- (BOOL)_isCHRNotifcationsEnabled;
- (BOOL)_queue_shouldScheduleIngestion;
- (BOOL)_shouldFireNotifications;
- (BOOL)unitTesting_didUpdateGatewaysFromProviderService;
- (BOOL)unitTesting_preventExtractionScheduling;
- (HDClinicalIngestionManager)initWithProfileExtension:(id)a3;
- (HDKeyValueDomain)keyValueDomain;
- (HDProfile)profile;
- (id)_initWithProfileExtension:(id)a3;
- (id)logDescription;
- (id)unitTesting_didCallDidReceiveFHIRResourceSyncEntities;
- (id)unitTesting_didCompleteScheduledExtraction;
- (id)unitTesting_didScheduleIngestionAfterQueryNotification;
- (int64_t)currentIngestionState;
- (void)_addIngestionTask:(id)a3;
- (void)_enqueueRefreshAccountInformationTask:(id)a3;
- (void)_notifyForNewHealthLabRecordsFromTask:(id)a3 countOfAllLabs:(unint64_t)a4 countOfPinnedLabs:(unint64_t)a5;
- (void)_notifyForNewHealthRecordsFromTask:(id)a3;
- (void)_performExtractionWithReason:(id)a3 completion:(id)a4;
- (void)_performMaintenanceIngestionWithReason:(id)a3 completion:(id)a4;
- (void)_queue_didReceiveFHIRResourceSyncEntities;
- (void)_queue_performProtectedDataAvailableChecks;
- (void)_queue_setIngestionState:(int64_t)a3;
- (void)_registerForProfileDidBecomeReady;
- (void)_resetIngestionScheduleBlock;
- (void)_scheduleExtractionWithReason:(id)a3;
- (void)_taskDidFinish:(id)a3;
- (void)_taskWillReallyBegin;
- (void)badgeForNewHealthRecords;
- (void)cancelAllIngestionTasks;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)didReceiveFHIRResourceSyncEntities;
- (void)didRecieveHealthRecordsQueryNotification:(id)a3;
- (void)performIngestionWithContext:(id)a3 accountIdentifiers:(id)a4 completion:(id)a5;
- (void)performPeriodicIngestionWithCompletion:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)refreshAccountConnectionInformationForAccountsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)registerIngestionStateChangeObserver:(id)a3;
- (void)scheduleIngestionWithReason:(id)a3;
- (void)setUnitTesting_didCallDidReceiveFHIRResourceSyncEntities:(id)a3;
- (void)setUnitTesting_didCompleteScheduledExtraction:(id)a3;
- (void)setUnitTesting_didScheduleIngestionAfterQueryNotification:(id)a3;
- (void)setUnitTesting_didUpdateGatewaysFromProviderService:(BOOL)a3;
- (void)setUnitTesting_preventExtractionScheduling:(BOOL)a3;
- (void)unregisterIngestionStateChangeObserver:(id)a3;
@end

@implementation HDClinicalIngestionManager

- (void)didRecieveHealthRecordsQueryNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5454;
  block[3] = &unk_113B88;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_queue_shouldScheduleIngestion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ingestionSchedulingBlockedUntil = self->_ingestionSchedulingBlockedUntil;
  v4 = +[NSDate date];
  LOBYTE(ingestionSchedulingBlockedUntil) = [(NSDate *)ingestionSchedulingBlockedUntil hk_isAfterDate:v4] ^ 1;

  return (char)ingestionSchedulingBlockedUntil;
}

- (void)registerIngestionStateChangeObserver:(id)a3
{
}

- (int64_t)currentIngestionState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_51E8;
  v5[3] = &unk_1122F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  int64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained database];
  [v5 removeProtectedDataObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HDClinicalIngestionManager;
  [(HDClinicalIngestionManager *)&v6 dealloc];
}

- (id)_initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDClinicalIngestionManager;
  v5 = [(HDClinicalIngestionManager *)&v26 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = [v4 profile];
    objc_storeWeak((id *)&v6->_profile, v7);

    id v8 = objc_alloc((Class)HDKeyValueDomain);
    uint64_t v9 = HDHRSNotificationKeyValueDomainIdentifier;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v11 = (HDKeyValueDomain *)[v8 initWithCategory:0 domainName:v9 profile:WeakRetained];
    keyValueDomain = v6->_keyValueDomain;
    v6->_keyValueDomain = v11;

    uint64_t v13 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v6->_ingestionState = 1;
    id v15 = objc_alloc((Class)HKObserverSet);
    v16 = (HKObserverSet *)[v15 initWithName:@"ingestion-state-change-observer" loggingCategory:HKLogHealthRecords];
    ingestionStateObserverSet = v6->_ingestionStateObserverSet;
    v6->_ingestionStateObserverSet = v16;

    v18 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    [(NSOperationQueue *)v18 setQualityOfService:17];
    [(NSOperationQueue *)v18 setMaxConcurrentOperationCount:1];
    ingestionOperationQueue = v6->_ingestionOperationQueue;
    v6->_ingestionOperationQueue = v18;
    v20 = v18;

    v21 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    [(NSOperationQueue *)v21 setQualityOfService:17];
    [(NSOperationQueue *)v21 setMaxConcurrentOperationCount:1];
    accountRefreshOperationQueue = v6->_accountRefreshOperationQueue;
    v6->_accountRefreshOperationQueue = v21;
    v23 = v21;

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v6 selector:"didRecieveHealthRecordsQueryNotification:" name:HDQueryServerDidReceiveQueryForHealthRecordsNotification object:0];
  }
  return v6;
}

- (void)_registerForProfileDidBecomeReady
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  [WeakRetained registerProfileReadyObserver:self queue:0];
}

- (HDClinicalIngestionManager)initWithProfileExtension:(id)a3
{
  int64_t v3 = [(HDClinicalIngestionManager *)self _initWithProfileExtension:a3];
  id v4 = v3;
  if (v3) {
    [(HDClinicalIngestionManager *)v3 _registerForProfileDidBecomeReady];
  }
  return v4;
}

- (void)profileDidBecomeReady:(id)a3
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v6 = [WeakRetained database];
  [v6 addProtectedDataObserver:self queue:self->_queue];

  id v7 = objc_loadWeakRetained((id *)p_profile);
  id v8 = [v7 database];
  LODWORD(v6) = [v8 isProtectedDataAvailable];

  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_83D78;
    block[3] = &unk_113B88;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)performIngestionWithContext:(id)a3 accountIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 copy];
  v11 = [HDClinicalIngestionTask alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_83E8C;
  v15[3] = &unk_114648;
  id v16 = v8;
  id v13 = v8;
  v14 = [(HDClinicalIngestionTask *)v11 initWithContext:v10 extension:WeakRetained accountIdentifiers:v9 completion:v15];

  [(HDClinicalIngestionManager *)self _addIngestionTask:v14];
}

- (void)cancelAllIngestionTasks
{
}

- (void)unregisterIngestionStateChangeObserver:(id)a3
{
}

- (void)refreshAccountConnectionInformationForAccountsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [HDRefreshAccountInformationTask alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_83FA8;
  id v15 = &unk_114670;
  id v16 = self;
  id v17 = v6;
  id v10 = v6;
  v11 = [(HDRefreshAccountInformationTask *)v8 initWithProfileExtension:WeakRetained accountIdentifiers:v7 completion:&v12];

  -[HDClinicalIngestionManager _enqueueRefreshAccountInformationTask:](self, "_enqueueRefreshAccountInformationTask:", v11, v12, v13, v14, v15, v16);
}

- (void)_enqueueRefreshAccountInformationTask:(id)a3
{
  id v4 = a3;
  +[HDDaemonTransaction transactionWithOwner:v4 activityName:@"RefreshAccountConnectionInformation"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_841DC;
  v11[3] = &unk_113B88;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v5;
  id v6 = +[NSBlockOperation blockOperationWithBlock:v11];
  [v6 addDependency:v4];
  _HKInitializeLogging();
  id v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543618;
    v14 = v10;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding task %{public}@", buf, 0x16u);
  }
  [(NSOperationQueue *)self->_accountRefreshOperationQueue addOperation:v4];
  [(NSOperationQueue *)self->_accountRefreshOperationQueue addOperation:v6];
}

- (void)didReceiveFHIRResourceSyncEntities
{
  id v3 = objc_retainBlock(self->_unitTesting_didCallDidReceiveFHIRResourceSyncEntities);
  id v4 = v3;
  if (v3) {
    (*((void (**)(id))v3 + 2))(v3);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_84284;
  block[3] = &unk_113B88;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_addIngestionTask:(id)a3
{
  id v4 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8446C;
  v12[3] = &unk_114698;
  v12[4] = self;
  [v4 setWillBeginFetchingAndExtracting:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_84474;
  v11[3] = &unk_114698;
  void v11[4] = self;
  [v4 setDidFinishFetchingAndExtracting:v11];
  _HKInitializeLogging();
  id v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding ingestion task %{public}@", buf, 0x16u);
  }
  [(NSOperationQueue *)self->_ingestionOperationQueue addOperation:v4];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_84480;
  block[3] = &unk_113B88;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_taskWillReallyBegin
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_84538;
  block[3] = &unk_113B88;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_taskDidFinish:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hasNewRecords];
  id v6 = [v4 countOfAllRecords];
  id v7 = [v4 countOfAllLabs];
  id v8 = [v4 countOfPinnedLabs];
  uint64_t v9 = [v4 description];
  id v10 = (void *)v9;
  v11 = @"<no task>";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  id v12 = v11;

  uint64_t v13 = +[_HKBehavior sharedBehavior];
  unsigned int v14 = [v13 showSensitiveLogItems];

  _HKInitializeLogging();
  __int16 v15 = (void *)HKLogHealthRecords;
  BOOL v16 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      id v17 = v15;
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      v36 = v19;
      __int16 v37 = 2114;
      id v38 = v4;
      __int16 v39 = 2048;
      id v40 = v6;
      __int16 v41 = 2048;
      id v42 = v7;
      __int16 v43 = 2048;
      id v44 = v8;
      __int16 v45 = 1024;
      unsigned int v46 = v5;
      v20 = "%{public}@ Finished ingestion task %{public}@, count of records: %lu, labs: %lu, pinned labs: %lu, should notify: %d";
      v21 = v17;
      uint32_t v22 = 58;
LABEL_8:
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
  }
  else if (v16)
  {
    id v17 = v15;
    v23 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138543874;
    v36 = v19;
    __int16 v37 = 2114;
    id v38 = v4;
    __int16 v39 = 1024;
    LODWORD(v40) = v5;
    v20 = "%{public}@ Finished ingestion task %{public}@, should notify: %d";
    v21 = v17;
    uint32_t v22 = 28;
    goto LABEL_8;
  }
  v24 = +[HDDaemonTransaction transactionWithOwner:v4 activityName:@"Cleanup"];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_84804;
  block[3] = &unk_1146C0;
  char v34 = v5;
  block[4] = self;
  v29 = v12;
  id v32 = v6;
  id v33 = v7;
  id v30 = v24;
  id v31 = v8;
  id v26 = v24;
  v27 = v12;
  dispatch_async(queue, block);
}

- (void)_queue_setIngestionState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_ingestionState != a3)
  {
    ingestionStateObserverSet = self->_ingestionStateObserverSet;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_84940;
    v6[3] = &unk_1146E8;
    v6[4] = self;
    v6[5] = a3;
    [(HKObserverSet *)ingestionStateObserverSet notifyObservers:v6];
    self->_ingestionState = a3;
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    [(HDClinicalIngestionManager *)self _queue_performProtectedDataAvailableChecks];
  }
}

- (void)scheduleIngestionWithReason:(id)a3
{
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_84B14;
  uint64_t v13 = &unk_114710;
  unsigned int v14 = self;
  id v4 = a3;
  id v15 = v4;
  unsigned int v5 = +[HDMaintenanceOperation maintenanceOperationWithName:v4 asynchronousBlock:&v10];
  _HKInitializeLogging();
  id v6 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Scheduling ingestion on maintenance coordinator with reason: %@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = objc_msgSend(WeakRetained, "daemon", v10, v11, v12, v13, v14);
  uint64_t v9 = [v8 maintenanceWorkCoordinator];
  [v9 enqueueMaintenanceOperation:v5];
}

- (void)_resetIngestionScheduleBlock
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_84BA8;
  block[3] = &unk_113B88;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)performPeriodicIngestionWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[HDClinicalIngestionTaskContext alloc] initWithOptions:1 reason:@"periodic ingestion"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_84C84;
  v7[3] = &unk_112A88;
  id v8 = v4;
  id v6 = v4;
  [(HDClinicalIngestionManager *)self performIngestionWithContext:v5 accountIdentifiers:0 completion:v7];
}

- (void)_performMaintenanceIngestionWithReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[HDClinicalIngestionTaskContext alloc] initWithOptions:0 reason:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_84DEC;
  v11[3] = &unk_114738;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(HDClinicalIngestionManager *)self performIngestionWithContext:v8 accountIdentifiers:0 completion:v11];
}

- (void)_performExtractionWithReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[HDClinicalIngestionTaskContext alloc] initWithOptions:6 reason:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_84F54;
  v11[3] = &unk_114738;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(HDClinicalIngestionManager *)self performIngestionWithContext:v8 accountIdentifiers:0 completion:v11];
}

- (void)_queue_performProtectedDataAvailableChecks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_scheduleExtractionOnProtectedDataBecomingAvailable)
  {
    *(_WORD *)&self->_scheduleExtractionOnProtectedDataBecomingAvailable = 256;
    CFStringRef v3 = @"protected data available after extraction was requested";
  }
  else
  {
    if (self->_didCheckWhetherResourcesNeedExtraction) {
      return;
    }
    self->_didCheckWhetherResourcesNeedExtraction = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    unsigned int v5 = +[HDClinicalAccountEntity accountsNeedExtractionForProfile:WeakRetained];

    if (!v5) {
      return;
    }
    CFStringRef v3 = @"unextracted resources present";
  }

  [(HDClinicalIngestionManager *)self _scheduleExtractionWithReason:v3];
}

- (void)_scheduleExtractionWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (!self->_unitTesting_preventExtractionScheduling)
  {
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_851DC;
    id v13 = &unk_114710;
    unsigned int v14 = self;
    id v15 = v4;
    id v6 = +[HDMaintenanceOperation maintenanceOperationWithName:v15 asynchronousBlock:&v10];
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B2CF4();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v8 = objc_msgSend(WeakRetained, "daemon", v10, v11, v12, v13, v14);
    id v9 = [v8 maintenanceWorkCoordinator];
    [v9 enqueueMaintenanceOperation:v6];
  }
}

- (void)_queue_didReceiveFHIRResourceSyncEntities
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  unsigned int v5 = [v4 contentProtectionManager];
  unsigned int v6 = [v5 isProtectedDataAvailable];

  if (v6)
  {
    [(HDClinicalIngestionManager *)self _scheduleExtractionWithReason:@"sync entities inserted"];
  }
  else
  {
    self->_scheduleExtractionOnProtectedDataBecomingAvailable = 1;
  }
}

- (BOOL)_enableCHRNotificationsIfNeeded
{
  if (![(HDClinicalIngestionManager *)self _isCHRNotifcationsEnabled]) {
    return 1;
  }
  keyValueDomain = self->_keyValueDomain;
  id v7 = 0;
  unsigned __int8 v4 = [(HDKeyValueDomain *)keyValueDomain setNumber:&__kCFBooleanTrue forKey:HDHRSNotificationKeyValueDomainKey error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B2D98();
    }
  }

  return v4;
}

- (BOOL)_isCHRNotifcationsEnabled
{
  keyValueDomain = self->_keyValueDomain;
  id v7 = 0;
  CFStringRef v3 = [(HDKeyValueDomain *)keyValueDomain numberForKey:HDHRSNotificationKeyValueDomainKey error:&v7];
  id v4 = v7;
  if (!v3)
  {
    _HKInitializeLogging();
    if (v4)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B2ED0();
      }
      CFStringRef v3 = 0;
    }
    else
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
        sub_B2E38();
      }
      CFStringRef v3 = &off_11D2D8;
    }
  }
  unsigned __int8 v5 = [v3 BOOLValue];

  return v5;
}

- (BOOL)_shouldFireNotifications
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  unsigned __int8 v5 = [WeakRetained daemon];
  unsigned int v6 = [v5 primaryProfile];
  id v7 = [v6 notificationManager];

  if (!v7)
  {
    _HKInitializeLogging();
    v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B2F70(v18);
    }
    goto LABEL_12;
  }
  id v8 = objc_loadWeakRetained((id *)p_profile);
  id v9 = [v8 daemon];
  id v10 = [v9 behavior];
  unsigned int v11 = [v10 healthAppHiddenOrNotInstalled];

  if (v11)
  {
    _HKInitializeLogging();
    id v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      id v13 = v12;
      unsigned int v14 = [(HDClinicalIngestionManager *)self logDescription];
      int v22 = 138543362;
      v23 = v14;
      id v15 = "%{public}@: not posting notification for new health records, app is hidden or deleted";
      BOOL v16 = v13;
      uint32_t v17 = 12;
LABEL_11:
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v22, v17);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (![(HDClinicalIngestionManager *)self _isCHRNotifcationsEnabled])
  {
    _HKInitializeLogging();
    v20 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      id v13 = v20;
      unsigned int v14 = [(HDClinicalIngestionManager *)self logDescription];
      int v22 = 138543618;
      v23 = v14;
      __int16 v24 = 2114;
      uint64_t v25 = HDHRSNotificationKeyValueDomainKey;
      id v15 = "%{public}@: not posting notification for new health records, %{public}@ is OFF";
      BOOL v16 = v13;
      uint32_t v17 = 22;
      goto LABEL_11;
    }
LABEL_12:
    BOOL v19 = 0;
    goto LABEL_13;
  }
  BOOL v19 = 1;
LABEL_13:

  return v19;
}

- (void)_notifyForNewHealthRecordsFromTask:(id)a3
{
  id v4 = a3;
  if ([(HDClinicalIngestionManager *)self _shouldFireNotifications])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    unsigned int v6 = [WeakRetained daemon];
    id v7 = [v6 primaryProfile];
    id v8 = [v7 notificationManager];

    id v9 = +[NSString localizedUserNotificationStringForKey:@"HEALTH_RECORDS_NOTIF_TITLE" arguments:0];
    id v10 = +[NSString localizedUserNotificationStringForKey:@"HEALTH_RECORDS_NOTIF_BODY_NEW_DATA" arguments:0];
    _HKInitializeLogging();
    unsigned int v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = [(HDClinicalIngestionManager *)self logDescription];
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: posting new health records notification for task %{public}@", buf, 0x16u);
    }
    uint64_t v14 = kHKNotificationsHealthRecordsIdentifier;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_8598C;
    v15[3] = &unk_113178;
    void v15[4] = self;
    id v16 = v4;
    [v8 postNotificationWithTitle:v9 body:v10 categoryIdentifier:v14 subtitle:0 domain:3 accessoryImageName:0 header:0 completion:v15];
  }
}

- (void)_notifyForNewHealthLabRecordsFromTask:(id)a3 countOfAllLabs:(unint64_t)a4 countOfPinnedLabs:(unint64_t)a5
{
  id v7 = a3;
  unsigned int v8 = [(HDClinicalIngestionManager *)self _shouldFireNotifications];
  if (a5 && v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v10 = [WeakRetained daemon];
    unsigned int v11 = [v10 primaryProfile];
    id v12 = [v11 notificationManager];

    id v13 = +[NSString localizedUserNotificationStringForKey:@"HEALTH_RECORDS_NOTIF_LABS_TITLE" arguments:0];
    uint64_t v14 = HKHealthKitFrameworkBundle();
    id v15 = [v14 localizedStringForKey:@"HEALTH_RECORDS_NOTIF_LABS_BODY_NEW_DATA_PINNED" value:&stru_1152E8 table:@"Localizable-Clinical-Health-Records"];
    id v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, a5);

    _HKInitializeLogging();
    uint32_t v17 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v7;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Posting new health lab records notification for task %{public}@", buf, 0xCu);
    }
    uint64_t v18 = kHKNotificationsHealthRecordsIdentifier;
    __int16 v19 = +[NSURL URLWithString:@"x-apple-health://ViewHealthRecordsCategoryRoom/2"];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_85C40;
    v20[3] = &unk_1139C8;
    id v21 = v7;
    [v12 postNotificationWithTitle:v13 body:v16 categoryIdentifier:v18 subtitle:0 domain:3 url:v19 accessoryImageName:0 header:0 completion:v20];
  }
}

- (void)badgeForNewHealthRecords
{
}

- (id)logDescription
{
  return @"HDClinicalIngestionManager";
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (BOOL)unitTesting_preventExtractionScheduling
{
  return self->_unitTesting_preventExtractionScheduling;
}

- (void)setUnitTesting_preventExtractionScheduling:(BOOL)a3
{
  self->_unitTesting_preventExtractionScheduling = a3;
}

- (BOOL)unitTesting_didUpdateGatewaysFromProviderService
{
  return self->_unitTesting_didUpdateGatewaysFromProviderService;
}

- (void)setUnitTesting_didUpdateGatewaysFromProviderService:(BOOL)a3
{
  self->_unitTesting_didUpdateGatewaysFromProviderService = a3;
}

- (id)unitTesting_didCallDidReceiveFHIRResourceSyncEntities
{
  return self->_unitTesting_didCallDidReceiveFHIRResourceSyncEntities;
}

- (void)setUnitTesting_didCallDidReceiveFHIRResourceSyncEntities:(id)a3
{
}

- (id)unitTesting_didCompleteScheduledExtraction
{
  return self->_unitTesting_didCompleteScheduledExtraction;
}

- (void)setUnitTesting_didCompleteScheduledExtraction:(id)a3
{
}

- (id)unitTesting_didScheduleIngestionAfterQueryNotification
{
  return self->_unitTesting_didScheduleIngestionAfterQueryNotification;
}

- (void)setUnitTesting_didScheduleIngestionAfterQueryNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didScheduleIngestionAfterQueryNotification, 0);
  objc_storeStrong(&self->_unitTesting_didCompleteScheduledExtraction, 0);
  objc_storeStrong(&self->_unitTesting_didCallDidReceiveFHIRResourceSyncEntities, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_ingestionSchedulingBlockedUntil, 0);
  objc_storeStrong((id *)&self->_ingestionStateObserverSet, 0);
  objc_storeStrong((id *)&self->_accountRefreshOperationQueue, 0);
  objc_storeStrong((id *)&self->_ingestionOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profileExtension);
}

@end