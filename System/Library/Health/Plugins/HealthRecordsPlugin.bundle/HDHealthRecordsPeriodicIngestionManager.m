@interface HDHealthRecordsPeriodicIngestionManager
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (HDHealthDaemon)healthDaemon;
- (HDHealthRecordsPeriodicIngestionManager)init;
- (HDHealthRecordsPeriodicIngestionManager)initWithHealthDaemon:(id)a3;
- (HDPeriodicActivity)periodicActivity;
- (OS_dispatch_queue)ingestQueue;
- (id)logPrefix;
- (void)_ingestQueue_triggerBackgroundIngestionOnAllProfilesWithProfileManager:(id)a3 completion:(id)a4;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDHealthRecordsPeriodicIngestionManager

- (HDHealthRecordsPeriodicIngestionManager)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDHealthRecordsPeriodicIngestionManager)initWithHealthDaemon:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDHealthRecordsPeriodicIngestionManager;
  v5 = [(HDHealthRecordsPeriodicIngestionManager *)&v10 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueueWithQOSClass();
    ingestQueue = v5->_ingestQueue;
    v5->_ingestQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_healthDaemon, v4);
    v8 = [v4 primaryProfile];
    [v8 registerProfileReadyObserver:v5 queue:0];
  }
  return v5;
}

- (void)profileDidBecomeReady:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDHealthRecordsPeriodicIngestionManager.m", 47, @"Invalid parameter not satisfying: %@", @"[profile isKindOfClass:[HDPrimaryProfile class]]" object file lineNumber description];
  }
  id v5 = objc_alloc((Class)HDPeriodicActivity);
  uint64_t v6 = (HDPeriodicActivity *)[v5 initWithProfile:v9 name:@"com.apple.healthd.healthrecords.ingestion" interval:self delegate:HKLogHealthRecords loggingCategory:(double)XPC_ACTIVITY_INTERVAL_7_DAYS];
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v6;
}

- (void)_ingestQueue_triggerBackgroundIngestionOnAllProfilesWithProfileManager:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ingestQueue);
  _HKInitializeLogging();
  v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B1298(v7, self);
  }
  v8 = dispatch_group_create();
  id v26 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v6 allProfileIdentifiers];
  id v9 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    v24 = self;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = [v6 profileForIdentifier:*(void *)(*((void *)&v34 + 1) + 8 * (void)v12)];
        v14 = [v13 healthRecordsExtension];
        v15 = [v14 ingestionManager];

        if (v15)
        {
          _HKInitializeLogging();
          v16 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
          {
            v17 = v16;
            v18 = [(HDHealthRecordsPeriodicIngestionManager *)self logPrefix];
            *(_DWORD *)buf = 138543618;
            v39 = v18;
            __int16 v40 = 2114;
            v41 = v13;
            _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "%{public}@ triggering background ingestion on profile %{public}@", buf, 0x16u);

            self = v24;
          }
          dispatch_group_enter(v8);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_68B00;
          v30[3] = &unk_113150;
          v30[4] = self;
          id v31 = v26;
          id v32 = v13;
          v33 = v8;
          [v15 performPeriodicIngestionWithCompletion:v30];
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v10);
  }

  _HKInitializeLogging();
  v19 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B1204(v19, self);
  }
  ingestQueue = self->_ingestQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_68D18;
  block[3] = &unk_113290;
  block[4] = self;
  id v28 = v26;
  id v29 = v23;
  id v21 = v23;
  id v22 = v26;
  dispatch_group_notify(v8, ingestQueue, block);
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 name];
  unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.healthd.healthrecords.ingestion"];

  _HKInitializeLogging();
  id v10 = (void *)HKLogHealthRecords;
  if (v9)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v10;
      v12 = [(HDHealthRecordsPeriodicIngestionManager *)self logPrefix];
      v13 = [v6 name];
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ configuring periodic activity %{public}@", (uint8_t *)&v14, 0x16u);
    }
    xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_B13F0(v10, (uint64_t)self, v6);
  }
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 name];
  if ([v7 isEqualToString:@"com.apple.healthd.healthrecords.ingestion"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_healthDaemon);
    unsigned __int8 v9 = [WeakRetained primaryProfile];
    id v10 = [v9 daemon];
    uint64_t v11 = [v10 profileManager];

    if (v11)
    {
      ingestQueue = self->_ingestQueue;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_6921C;
      v15[3] = &unk_113268;
      v15[4] = self;
      id v16 = v7;
      id v17 = v11;
      id v18 = v6;
      dispatch_async(ingestQueue, v15);
    }
    else
    {
      _HKInitializeLogging();
      int v14 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_B14B0(v14);
      }
      (*((void (**)(id, uint64_t, void, double))v6 + 2))(v6, 3, 0, 0.0);
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B14F4(v13);
    }
    (*((void (**)(id, uint64_t, void, double))v6 + 2))(v6, 1, 0, 0.0);
  }
}

- (id)logPrefix
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HDPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (OS_dispatch_queue)ingestQueue
{
  return self->_ingestQueue;
}

- (HDHealthDaemon)healthDaemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthDaemon);

  return (HDHealthDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_healthDaemon);
  objc_storeStrong((id *)&self->_ingestQueue, 0);

  objc_storeStrong((id *)&self->_periodicActivity, 0);
}

@end