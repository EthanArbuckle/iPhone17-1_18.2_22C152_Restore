@interface HDClinicalIngestionTaskAccountContext
+ (HDClinicalIngestionTaskAccountContext)new;
- (BOOL)mayMakeRequests;
- (HDClinicalAccount)account;
- (HDClinicalIngestionTask)task;
- (HDClinicalIngestionTaskAccountContext)init;
- (HDClinicalIngestionTaskAccountContext)initWithIngestionTask:(id)a3 account:(id)a4 queryMode:(int64_t)a5 ingestStartDate:(id)a6 session:(id)a7 didSaveResourcesHandler:(id)a8;
- (HDFHIRCredentialedSession)session;
- (NSArray)accumulatedErrors;
- (NSDate)ingestStartDate;
- (id)runAndAwaitSchemaOperations:(id)a3;
- (int64_t)queryMode;
- (void)_withLock_evaluateNewErrors:(id)a3;
- (void)changeQueryMode:(int64_t)a3;
- (void)didEncounterError:(id)a3;
- (void)didEncounterErrors:(id)a3;
- (void)runAndAwaitFeatureOperations:(id)a3;
- (void)saveResourceObjects:(id)a3;
@end

@implementation HDClinicalIngestionTaskAccountContext

+ (HDClinicalIngestionTaskAccountContext)new
{
  v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v2, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskAccountContext)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskAccountContext)initWithIngestionTask:(id)a3 account:(id)a4 queryMode:(int64_t)a5 ingestStartDate:(id)a6 session:(id)a7 didSaveResourcesHandler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)HDClinicalIngestionTaskAccountContext;
  v20 = [(HDClinicalIngestionTaskAccountContext *)&v35 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_task, a3);
    v22 = (HDClinicalAccount *)[v16 copy];
    account = v21->_account;
    v21->_account = v22;

    v21->_queryMode = a5;
    v24 = (NSDate *)[v17 copy];
    ingestStartDate = v21->_ingestStartDate;
    v21->_ingestStartDate = v24;

    objc_storeStrong((id *)&v21->_session, a7);
    id v26 = [v19 copy];
    id didSaveResourcesHandler = v21->_didSaveResourcesHandler;
    v21->_id didSaveResourcesHandler = v26;

    v21->_accumulatedErrorLock._os_unfair_lock_opaque = 0;
    v28 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableAccumulatedErrors = v21->_mutableAccumulatedErrors;
    v21->_mutableAccumulatedErrors = v28;

    v21->_mayMakeRequests = 1;
    v30 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    producerQueue = v21->_producerQueue;
    v21->_producerQueue = v30;

    v32 = [v16 identifier];
    v33 = +[NSString stringWithFormat:@"IngestionQueue-%@", v32];
    [(NSOperationQueue *)v21->_producerQueue setName:v33];

    [(NSOperationQueue *)v21->_producerQueue setQualityOfService:17];
    [(NSOperationQueue *)v21->_producerQueue setMaxConcurrentOperationCount:3];
  }

  return v21;
}

- (void)changeQueryMode:(int64_t)a3
{
  self->_queryMode = a3;
}

- (id)runAndAwaitSchemaOperations:(id)a3
{
  id v5 = a3;
  BOOL mayMakeRequests = self->_mayMakeRequests;
  _HKInitializeLogging();
  v7 = (void *)HKLogHealthRecords;
  if (mayMakeRequests)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AC370();
    }
    [(NSOperationQueue *)self->_producerQueue addOperations:v5 waitUntilFinished:1];
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AC2DC();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v9)
    {
      uint64_t v11 = 0;
      goto LABEL_23;
    }
    id v10 = v9;
    LOBYTE(v11) = 0;
    uint64_t v12 = *(void *)v26;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v14 isFinished])
        {
          if (v11) {
            goto LABEL_13;
          }
        }
        else
        {
          id v15 = +[NSAssertionHandler currentHandler];
          [v15 handleFailureInMethod:a2 object:self file:@"HDClinicalIngestionTaskAccountContext.m" lineNumber:96 description:@"Should have waited until all operations are finished"];

          if (v11)
          {
LABEL_13:
            uint64_t v11 = 1;
            continue;
          }
        }
        id v16 = [v14 atLeastOneFetchSucceeded];
        uint64_t v11 = (uint64_t)[v16 BOOLValue];
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v10)
      {
LABEL_23:

        v20 = [HDClinicalIngestionTaskAccountContextOutcome alloc];
        BOOL v22 = !self->_mayMakeRequests;
        uint64_t v21 = v11;
        goto LABEL_24;
      }
    }
  }
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    id v18 = v7;
    id v19 = [(HDClinicalAccount *)account identifier];
    *(_DWORD *)buf = 138543874;
    v31 = self;
    __int16 v32 = 2114;
    v33 = v19;
    __int16 v34 = 2048;
    id v35 = [v5 count];
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: context may not make requests, will not run %lu schema operations", buf, 0x20u);
  }
  v20 = [HDClinicalIngestionTaskAccountContextOutcome alloc];
  uint64_t v21 = 0;
  BOOL v22 = 1;
LABEL_24:
  v23 = [(HDClinicalIngestionTaskAccountContextOutcome *)v20 initWithOneFetchSucceeded:v21 accountMustLimitRequests:v22];

  return v23;
}

- (void)saveResourceObjects:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    account = self->_account;
    v6 = [(HDClinicalIngestionTask *)self->_task profile];
    id v12 = 0;
    LOBYTE(account) = +[HDOriginalFHIRResourceEntity insertNewResourceObjects:v4 account:account profile:v6 error:&v12];
    id v7 = v12;

    if (account)
    {
      (*((void (**)(id, id))self->_didSaveResourcesHandler + 2))(self->_didSaveResourcesHandler, [v4 count]);
    }
    else
    {
      _HKInitializeLogging();
      id v8 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        id v9 = self->_account;
        id v10 = v8;
        uint64_t v11 = [(HDClinicalAccount *)v9 identifier];
        *(_DWORD *)buf = 138543874;
        v14 = self;
        __int16 v15 = 2114;
        id v16 = v11;
        __int16 v17 = 2114;
        id v18 = v7;
        _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: saveResourcesObjects error: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)runAndAwaitFeatureOperations:(id)a3
{
  id v4 = a3;
  BOOL mayMakeRequests = self->_mayMakeRequests;
  _HKInitializeLogging();
  v6 = (void *)HKLogHealthRecords;
  if (mayMakeRequests)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AC498();
    }
    [(NSOperationQueue *)self->_producerQueue addOperations:v4 waitUntilFinished:1];
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AC404();
    }
    id v7 = objc_msgSend(v4, "hk_map:", &stru_112860);
    [(HDClinicalIngestionTaskAccountContext *)self didEncounterErrors:v7];
    goto LABEL_9;
  }
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    id v7 = v6;
    id v9 = [(HDClinicalAccount *)account identifier];
    int v10 = 138543874;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2048;
    id v15 = [v4 count];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: context may not make requests, will not run %lu feature operations", (uint8_t *)&v10, 0x20u);

LABEL_9:
  }
}

- (void)didEncounterError:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDClinicalIngestionTaskAccountContext.m", 139, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_accumulatedErrorLock);
  [(NSMutableArray *)self->_mutableAccumulatedErrors hk_addNonNilObject:v5];
  id v8 = v5;
  v6 = +[NSArray arrayWithObjects:&v8 count:1];
  [(HDClinicalIngestionTaskAccountContext *)self _withLock_evaluateNewErrors:v6];

  os_unfair_lock_unlock(&self->_accumulatedErrorLock);
}

- (void)didEncounterErrors:(id)a3
{
  p_accumulatedErrorLock = &self->_accumulatedErrorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accumulatedErrorLock);
  [(NSMutableArray *)self->_mutableAccumulatedErrors addObjectsFromArray:v5];
  [(HDClinicalIngestionTaskAccountContext *)self _withLock_evaluateNewErrors:v5];

  os_unfair_lock_unlock(p_accumulatedErrorLock);
}

- (NSArray)accumulatedErrors
{
  p_accumulatedErrorLock = &self->_accumulatedErrorLock;
  os_unfair_lock_lock(&self->_accumulatedErrorLock);
  id v4 = [(NSMutableArray *)self->_mutableAccumulatedErrors copy];
  os_unfair_lock_unlock(p_accumulatedErrorLock);

  return (NSArray *)v4;
}

- (void)_withLock_evaluateNewErrors:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_accumulatedErrorLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "hrs_hasResourceFetchErrorsIndicatingRateLimitation", (void)v10))
        {
          self->_BOOL mayMakeRequests = 0;
          [(NSOperationQueue *)self->_producerQueue cancelAllOperations];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (HDClinicalIngestionTask)task
{
  return self->_task;
}

- (HDClinicalAccount)account
{
  return self->_account;
}

- (int64_t)queryMode
{
  return self->_queryMode;
}

- (NSDate)ingestStartDate
{
  return self->_ingestStartDate;
}

- (HDFHIRCredentialedSession)session
{
  return self->_session;
}

- (BOOL)mayMakeRequests
{
  return self->_mayMakeRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_ingestStartDate, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_didSaveResourcesHandler, 0);
  objc_storeStrong((id *)&self->_producerQueue, 0);

  objc_storeStrong((id *)&self->_mutableAccumulatedErrors, 0);
}

@end