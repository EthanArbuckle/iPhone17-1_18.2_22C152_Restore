@interface HDClinicalIngestionTask
+ (BOOL)_accumulatedErrorAllowsToProceedRunningStaleResourcesOperation:(id)a3;
- (BOOL)_handleStaleResourcesOfAccount:(id)a3 ingestStartDate:(id)a4 error:(id *)a5;
- (BOOL)_ingestionAllowed;
- (BOOL)_performResourceFetchWithAccount:(id)a3 batchingSemaphore:(id)a4 error:(id *)a5;
- (BOOL)_prepareAccounts:(id *)a3 userFetchEligibleAccounts:(id *)a4 withError:(id *)a5;
- (BOOL)_updateGatewayForAccount:(id)a3 error:(id *)a4;
- (BOOL)hasNewRecords;
- (HDClinicalIngestionAnalyticsAccumulator)analyticsAccumulator;
- (HDClinicalIngestionTask)init;
- (HDClinicalIngestionTask)initWithContext:(id)a3 extension:(id)a4 accountIdentifiers:(id)a5 completion:(id)a6;
- (HDClinicalIngestionTaskContext)context;
- (HDHealthRecordsIngestionServiceClient)healthRecordsIngestionServiceClient;
- (HDHealthRecordsLegacyIngestionServiceClient)legacyXPCIngestionServiceClient;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDHealthRecordsXPCServiceClient)healthRecordsServiceClient;
- (HDProfile)profile;
- (HKClinicalIngestionOutcome)outcome;
- (NSDate)taskBeganDate;
- (NSDictionary)updateGatewayOperationsByAccountIdentifier;
- (NSString)analyticsString;
- (NSString)taskIdentifier;
- (id)_analyticsStringAfterCollectingAndSubmittingIngestionAnalyticsOnQueue:(id)a3;
- (id)_fetchableAccountForAccount:(id)a3 error:(id *)a4;
- (id)_gatewayFeatureOperationsForAccount:(id)a3 session:(id)a4 queryMode:(int64_t)a5 error:(id *)a6;
- (id)_gatewaysOperationForAccount:(id)a3;
- (id)_ivarLock_synthesizeTaskOutcomeWithSuccess:(BOOL)a3 runTime:(double)a4;
- (id)_runAndAwaitPreflightOperations:(id)a3 accountContext:(id)a4;
- (id)_serialIngestionDoneOperations;
- (id)completion;
- (id)description;
- (id)didFinishFetchingAndExtracting;
- (id)willBeginFetchingAndExtracting;
- (id)willFinishFetchingAndExtracting;
- (unint64_t)countOfAllLabs;
- (unint64_t)countOfAllRecords;
- (unint64_t)countOfPinnedLabs;
- (void)_accountWithIdentifier:(id)a3 addOutcomeInfo:(unint64_t)a4;
- (void)_cancelWithError:(id)a3;
- (void)_didFinishWithStartTimeInternal:(double)a3;
- (void)_didStart;
- (void)_markAccountsWithoutCredentialsAsReloginNeeded:(id)a3;
- (void)_markHadError:(id)a3;
- (void)_notifyIfWorkMayBeDoneForAccounts:(id)a3;
- (void)_performExtractionWithAccount:(id)a3;
- (void)_performFetchWithAccount:(id)a3 batchingSemaphore:(id)a4;
- (void)_performFileImportWithAccount:(id)a3;
- (void)_prepareUpdateGatewaysOperationsForAccounts:(id)a3;
- (void)_runIngestionDoneOperations;
- (void)accumulateIngestionAnalyticsFromTaskStates:(id)a3 gateway:(id)a4;
- (void)cancel;
- (void)main;
- (void)markDidProduceNewRecords;
- (void)recordCountOfAllRecords:(unint64_t)a3 allLabs:(unint64_t)a4 pinnedLabs:(unint64_t)a5;
- (void)setAnalyticsString:(id)a3;
- (void)setDidFinishFetchingAndExtracting:(id)a3;
- (void)setHasNewRecords:(BOOL)a3;
- (void)setWillBeginFetchingAndExtracting:(id)a3;
- (void)setWillFinishFetchingAndExtracting:(id)a3;
@end

@implementation HDClinicalIngestionTask

- (HDClinicalIngestionTask)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTask)initWithContext:(id)a3 extension:(id)a4 accountIdentifiers:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)HDClinicalIngestionTask;
  v14 = [(HDClinicalIngestionTask *)&v35 init];
  if (v14)
  {
    v15 = +[NSUUID UUID];
    uint64_t v16 = [v15 UUIDString];
    taskIdentifier = v14->_taskIdentifier;
    v14->_taskIdentifier = (NSString *)v16;

    v18 = (HDClinicalIngestionTaskContext *)[v10 copy];
    context = v14->_context;
    v14->_context = v18;

    id v20 = [v13 copy];
    id completion = v14->_completion;
    v14->_id completion = v20;

    objc_storeStrong((id *)&v14->_profileExtension, a4);
    uint64_t v22 = [v11 profile];
    profile = v14->_profile;
    v14->_profile = (HDProfile *)v22;

    uint64_t v24 = [v11 createHealthRecordsXPCServiceClient];
    healthRecordsServiceClient = v14->_healthRecordsServiceClient;
    v14->_healthRecordsServiceClient = (HDHealthRecordsXPCServiceClient *)v24;

    uint64_t v26 = [v11 createHealthRecordsIngestionServiceClient];
    healthRecordsIngestionServiceClient = v14->_healthRecordsIngestionServiceClient;
    v14->_healthRecordsIngestionServiceClient = (HDHealthRecordsIngestionServiceClient *)v26;

    uint64_t v28 = [(HDHealthRecordsProfileExtension *)v14->_profileExtension createHealthRecordsLegacyIngestionServiceClient];
    legacyXPCIngestionServiceClient = v14->_legacyXPCIngestionServiceClient;
    v14->_legacyXPCIngestionServiceClient = (HDHealthRecordsLegacyIngestionServiceClient *)v28;

    v30 = objc_alloc_init(HDClinicalIngestionAnalyticsAccumulator);
    analyticsAccumulator = v14->_analyticsAccumulator;
    v14->_analyticsAccumulator = v30;

    v14->_ivarLock._os_unfair_lock_opaque = 0;
    id v32 = [v12 count];
    if (v32) {
      id v33 = [objc_alloc((Class)NSSet) initWithArray:v12];
    }
    else {
      id v33 = 0;
    }
    objc_storeStrong((id *)&v14->_accountIdentifiers, v33);
    if (v32) {
  }
    }
  return v14;
}

- (void)main
{
  v3 = (NSDate *)objc_alloc_init((Class)NSDate);
  taskBeganDate = self->_taskBeganDate;
  self->_taskBeganDate = v3;

  [(HDClinicalIngestionTask *)self _didStart];
  v37 = self;
  id obj = [(HDHealthRecordsProfileExtension *)self->_profileExtension accountManager];
  if (!obj)
  {
    uint64_t v22 = [(HDClinicalIngestionTask *)self profile];
    v23 = +[NSError hk_error:100, @"HDClinicalIngestionTask can only be used on profiles with account managers, but %@ doesn't have one", v22 format];

    [(HDClinicalIngestionTask *)self _cancelWithError:v23];
    id v31 = 0;
    id v32 = 0;
    id v34 = 0;
    goto LABEL_31;
  }
  objc_storeStrong((id *)&self->_accountManager, obj);
  if (![(HDClinicalIngestionTask *)self _ingestionAllowed])
  {
    v5 = [(HDClinicalIngestionTask *)self context];
    unsigned __int8 v6 = [v5 shouldSkipFetch];

    if ((v6 & 1) == 0)
    {
      _HKInitializeLogging();
      v25 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = self;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ will not perform ingestion because ingestion is not allowed in this context", buf, 0xCu);
      }
      id v31 = 0;
      id v32 = 0;
      id v34 = 0;
      [(HDClinicalIngestionTask *)self _cancelWithError:0];
      goto LABEL_26;
    }
  }
  id v51 = 0;
  id v52 = 0;
  id v50 = 0;
  unsigned __int8 v7 = [(HDClinicalIngestionTask *)self _prepareAccounts:&v52 userFetchEligibleAccounts:&v51 withError:&v50];
  id v8 = v52;
  id v31 = v51;
  id v32 = v50;
  id v34 = v8;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v24 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AA2A0((uint64_t)v37, (uint64_t)v32, v24);
    }
LABEL_24:
    v27 = v37;
    goto LABEL_25;
  }
  if ([v8 count])
  {
    [(HDClinicalIngestionTask *)v37 _prepareUpdateGatewaysOperationsForAccounts:v8];
    [(HDClinicalIngestionTask *)v37 _notifyIfWorkMayBeDoneForAccounts:v31];
    id v35 = objc_alloc_init((Class)NSOperationQueue);
    v9 = +[NSString stringWithFormat:@"%@-Main-WorkQueue", objc_opt_class()];
    [v35 setName:v9];

    [v35 setQualityOfService:17];
    [v35 setMaxConcurrentOperationCount:2];
    id v36 = objc_alloc_init((Class)NSOperationQueue);
    id v10 = +[NSString stringWithFormat:@"%@-Main-ExtractionQueue", objc_opt_class()];
    [v36 setName:v10];

    [v36 setQualityOfService:17];
    [v36 setMaxConcurrentOperationCount:2];
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = [v8 count];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling ingestion & extraction operations for %ld accounts", buf, 0x16u);
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v34 = v8;
    id v14 = [v34 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v47;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(v34);
          }
          uint64_t v17 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2810000000;
          v54 = &unk_ED979;
          v55[0] = 0;
          atomic_exchange(v55, 1u);
          dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_7A24;
          v43[3] = &unk_1117E8;
          v43[4] = v37;
          v43[5] = v17;
          v19 = v18;
          v44 = v19;
          v45 = buf;
          [v35 addOperationWithBlock:v43];
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_7C34;
          v38[3] = &unk_111810;
          v42 = buf;
          id v20 = v19;
          v39 = v20;
          v40 = v37;
          uint64_t v41 = v17;
          [v36 addOperationWithBlock:v38];

          _Block_object_dispose(buf, 8);
        }
        id v14 = [v34 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v14);
    }

    [v35 waitUntilAllOperationsAreFinished];
    [v36 waitUntilAllOperationsAreFinished];
    v21 = [(HDClinicalIngestionTask *)v37 _analyticsStringAfterCollectingAndSubmittingIngestionAnalyticsOnQueue:v36];
    [(HDClinicalIngestionTask *)v37 setAnalyticsString:v21];

    [(HDClinicalIngestionTask *)v37 _runIngestionDoneOperations];
    goto LABEL_26;
  }
  _HKInitializeLogging();
  uint64_t v26 = HKLogHealthRecords;
  if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_24;
  }
  *(_DWORD *)buf = 138543362;
  v27 = v37;
  *(void *)&buf[4] = v37;
  _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ will not perform ingestion since there are no CHR accounts", buf, 0xCu);
LABEL_25:
  [(HDClinicalIngestionTask *)v27 _cancelWithError:v32];
LABEL_26:
  if (([(HDClinicalIngestionTaskContext *)v37->_context options] & 0x80) != 0)
  {
    _HKInitializeLogging();
    uint64_t v28 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v37;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ task has option \"never finish\" set, starting to spin", buf, 0xCu);
    }
    dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
    neverFinishSemaphore = v37->_neverFinishSemaphore;
    v37->_neverFinishSemaphore = (OS_dispatch_semaphore *)v29;

    dispatch_semaphore_wait((dispatch_semaphore_t)v37->_neverFinishSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
  [(NSDate *)v37->_taskBeganDate timeIntervalSinceReferenceDate];
  -[HDClinicalIngestionTask _didFinishWithStartTimeInternal:](v37, "_didFinishWithStartTimeInternal:");
LABEL_31:
}

- (void)_notifyIfWorkMayBeDoneForAccounts:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  v5 = (void (**)(id, HDClinicalIngestionTask *))objc_retainBlock(self->_willBeginFetchingAndExtracting);
  id willBeginFetchingAndExtracting = self->_willBeginFetchingAndExtracting;
  self->_id willBeginFetchingAndExtracting = 0;

  os_unfair_lock_unlock(&self->_ivarLock);
  if (v5)
  {
    unsigned int v7 = [(HDClinicalIngestionTaskContext *)self->_context shouldFetchImmediately];
    id v8 = +[NSDate date];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          if (v7) {
            unsigned int v7 = 1;
          }
          else {
            unsigned int v7 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v13), "shouldPerformFetchWithNowDate:", v8, (void)v14);
          }
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }

    if (v7) {
      v5[2](v5, self);
    }
  }
}

- (void)_performFileImportWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [HDClinicalIngestionFileImportOperation alloc];
  unsigned __int8 v6 = [(HDClinicalIngestionTaskContext *)self->_context inputFileHandle];
  unsigned int v7 = [(HDClinicalIngestionFileImportOperation *)v5 initWithFileHandle:v6];

  [(HDClinicalIngestionFileImportOperation *)v7 start];
  id v8 = [v4 identifier];
  [(HDClinicalIngestionTask *)self _accountWithIdentifier:v8 addOutcomeInfo:4];

  id v9 = [(HDClinicalIngestionFileImportOperation *)v7 documentData];

  if (v9)
  {
    id v10 = [v4 gateway];
    id v11 = [v10 FHIRVersion];

    id v12 = objc_alloc((Class)HDFHIRResourceData);
    id v13 = [(HDClinicalIngestionFileImportOperation *)v7 documentData];
    id v14 = [v12 initWithData:v13 sourceURL:0 FHIRVersion:v11];

    _HKInitializeLogging();
    long long v15 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AA36C((uint64_t)self, v15, v4);
    }
    long long v16 = [HDClinicalIngestionExtractReferencesOperation alloc];
    id v51 = v14;
    id v53 = v14;
    long long v17 = +[NSArray arrayWithObjects:&v53 count:1];
    dispatch_semaphore_t v18 = [(HDClinicalIngestionExtractReferencesOperation *)v16 initWithTask:self account:v4 resourceData:v17 sourceResourceObjects:0 nextOperation:0];

    [(HDClinicalIngestionExtractReferencesOperation *)v18 start];
    v19 = [(HDClinicalIngestionExtractReferencesOperation *)v18 extractionResult];
    id v20 = [v19 completeResources];

    v21 = [(HDClinicalIngestionExtractReferencesOperation *)v18 extractionResult];
    uint64_t v22 = [v21 incompleteResources];
    v23 = objc_msgSend(v22, "hk_map:", &stru_111850);
    uint64_t v24 = [v20 arrayByAddingObjectsFromArray:v23];

    v25 = [(HDClinicalIngestionExtractReferencesOperation *)v18 extractionResult];
    uint64_t v26 = [v25 unresolvableReferences];
    v27 = objc_msgSend(v26, "hk_map:", &stru_111870);
    uint64_t v28 = [v24 arrayByAddingObjectsFromArray:v27];

    _HKInitializeLogging();
    dispatch_semaphore_t v29 = (void *)HKLogHealthRecords;
    if (v28)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v29;
        id v31 = [v4 identifier];
        id v32 = [v28 count];
        *(_DWORD *)buf = 138543874;
        v55 = self;
        __int16 v56 = 2114;
        v57 = v31;
        __int16 v58 = 2048;
        id v59 = v32;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: extractReferencesOperation complete: %lu resources", buf, 0x20u);
      }
      id v33 = [(HDClinicalIngestionTask *)self profile];
      id v52 = 0;
      unsigned int v34 = +[HDOriginalFHIRResourceEntity insertNewResourceObjects:v28 account:v4 profile:v33 error:&v52];
      id v35 = v52;

      _HKInitializeLogging();
      id v36 = (void *)HKLogHealthRecords;
      if (!v35)
      {
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v36;
          uint64_t v41 = [v4 identifier];
          *(_DWORD *)buf = 138543618;
          v55 = self;
          __int16 v56 = 2114;
          v57 = v41;
          _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: saveFetchedResources is complete", buf, 0x16u);
        }
        if (v34) {
          [(HDClinicalAccountManager *)self->_accountManager didCompleteFetchForAccount:v4 wasFullFetch:1];
        }
        _HKInitializeLogging();
        v42 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          v43 = v42;
          v44 = [v4 identifier];
          *(_DWORD *)buf = 138543874;
          v55 = self;
          __int16 v56 = 2114;
          v57 = v44;
          __int16 v58 = 1024;
          LODWORD(v59) = v34;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: file Import is complete. Did add new resources? %{BOOL}d", buf, 0x1Cu);
        }
        goto LABEL_17;
      }
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        v37 = v36;
        v38 = [v4 identifier];
        *(_DWORD *)buf = 138543874;
        v55 = self;
        __int16 v56 = 2114;
        v57 = v38;
        __int16 v58 = 2112;
        id v59 = v35;
        _os_log_error_impl(&dword_0, v37, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: saveFetchedResources failed with error: %@", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        long long v48 = v29;
        long long v49 = [v4 identifier];
        id v50 = [(HDClinicalIngestionExtractReferencesOperation *)v18 resolutionError];
        *(_DWORD *)buf = 138543874;
        v55 = self;
        __int16 v56 = 2114;
        v57 = v49;
        __int16 v58 = 2112;
        id v59 = v50;
        _os_log_error_impl(&dword_0, v48, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: extractReferencesOperation failed with error: %@", buf, 0x20u);
      }
      id v35 = [(HDClinicalIngestionExtractReferencesOperation *)v18 resolutionError];
    }
    [(HDClinicalIngestionTask *)self _markHadError:v35];
LABEL_17:

    goto LABEL_18;
  }
  _HKInitializeLogging();
  v39 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    v45 = v39;
    long long v46 = [v4 identifier];
    long long v47 = [(HDClinicalIngestionFileImportOperation *)v7 operationError];
    *(_DWORD *)buf = 138543874;
    v55 = self;
    __int16 v56 = 2114;
    v57 = v46;
    __int16 v58 = 2112;
    id v59 = v47;
    _os_log_error_impl(&dword_0, v45, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: fileImportOperation failed with error: %@", buf, 0x20u);
  }
  id v11 = [(HDClinicalIngestionFileImportOperation *)v7 operationError];
  [(HDClinicalIngestionTask *)self _markHadError:v11];
LABEL_18:
}

- (void)_performFetchWithAccount:(id)a3 batchingSemaphore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(HDClinicalIngestionTask *)self isCancelled] & 1) == 0)
  {
    id v8 = [v6 gateway];

    _HKInitializeLogging();
    id v9 = (void *)HKLogHealthRecords;
    BOOL v10 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        id v11 = v9;
        id v12 = [v6 identifier];
        *(_DWORD *)buf = 138543618;
        v55 = self;
        __int16 v56 = 2114;
        v57 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: preparing ingestion", buf, 0x16u);
      }
      id v53 = 0;
      unsigned __int8 v13 = [(HDClinicalIngestionTask *)self _updateGatewayForAccount:v6 error:&v53];
      id v14 = v53;
      long long v15 = v14;
      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        id v35 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = v35;
          v42 = [v6 identifier];
          *(_DWORD *)buf = 138543874;
          v55 = self;
          __int16 v56 = 2114;
          v57 = v42;
          __int16 v58 = 2114;
          id v59 = v15;
          _os_log_error_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: gateway operation failed: %{public}@.", buf, 0x20u);
        }
        [(HDClinicalIngestionTask *)self _markHadError:v15];
        goto LABEL_37;
      }
      id v52 = v14;
      long long v16 = [(HDClinicalIngestionTask *)self _fetchableAccountForAccount:v6 error:&v52];
      id v17 = v52;

      if (!v16)
      {
        _HKInitializeLogging();
        id v36 = (void *)HKLogHealthRecords;
        if (v17)
        {
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v43 = v36;
            v44 = [v6 identifier];
            *(_DWORD *)buf = 138543874;
            v55 = self;
            __int16 v56 = 2114;
            v57 = v44;
            __int16 v58 = 2114;
            id v59 = v17;
            _os_log_error_impl(&dword_0, v43, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: account fetchability determination failed: %{public}@.", buf, 0x20u);
          }
          [(HDClinicalIngestionTask *)self _markHadError:v17];
        }
        else
        {
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
          {
            v39 = v36;
            v40 = [v6 identifier];
            *(_DWORD *)buf = 138543618;
            v55 = self;
            __int16 v56 = 2114;
            v57 = v40;
            _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: not fetchable, not performing ingestion", buf, 0x16u);
          }
          id v17 = 0;
        }
        goto LABEL_36;
      }
      if ([v16 currentCredentialHasOutdatedScopes])
      {
        id v18 = objc_alloc((Class)HKClinicalAccountEvent);
        v19 = [v6 identifier];
        uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "-[HDClinicalIngestionTask _performFetchWithAccount:batchingSemaphore:]", 348, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Ingestion/Pipeline/HDClinicalIngestionTask.m");
        v21 = +[NSDate date];
        [v6 credentialState];
        uint64_t v22 = HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState();
        id v23 = [v18 initWithAccountIdentifier:v19 type:1 caller:v20 timestamp:v21 eventDescription:@"The current credential had outdated scopes during clinical ingestion task (fetchableAccount.currentCredentialHasOutdatedScopes was true)." credentialStateBefore:v22 credentialStateAfter:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];

        accountManager = self->_accountManager;
        id v51 = v17;
        LOBYTE(v20) = [(HDClinicalAccountManager *)accountManager updateCredentialStateForAccount:v6 state:2 event:v23 error:&v51];
        id v25 = v51;

        if ((v20 & 1) == 0)
        {
          _HKInitializeLogging();
          v38 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v45 = v38;
            long long v46 = [v6 identifier];
            *(_DWORD *)buf = 138543874;
            v55 = self;
            __int16 v56 = 2114;
            v57 = v46;
            __int16 v58 = 2114;
            id v59 = v25;
            _os_log_error_impl(&dword_0, v45, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: attempt to mark account as needing upgrade failed with error: %{public}@", buf, 0x20u);
          }
          id v17 = v25;
          goto LABEL_36;
        }
        uint64_t v26 = [v6 identifier];
        [(HDClinicalIngestionTask *)self _accountWithIdentifier:v26 addOutcomeInfo:64];

        id v17 = v25;
      }
      id v50 = 0;
      unsigned __int8 v27 = [(HDClinicalIngestionTask *)self _performResourceFetchWithAccount:v16 batchingSemaphore:v7 error:&v50];
      id v28 = v50;
      if (v27)
      {
        _HKInitializeLogging();
        dispatch_semaphore_t v29 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          id v31 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          v55 = self;
          __int16 v56 = 2114;
          v57 = v31;
          id v32 = "%{public}@ Account %{public}@: ingestion complete";
LABEL_34:
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 0x16u);
        }
      }
      else
      {
        _HKInitializeLogging();
        v37 = (void *)HKLogHealthRecords;
        if (v28)
        {
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            long long v47 = v37;
            long long v48 = [v6 identifier];
            long long v49 = objc_msgSend(v28, "hrs_safelyLoggableDescription");
            *(_DWORD *)buf = 138543874;
            v55 = self;
            __int16 v56 = 2114;
            v57 = v48;
            __int16 v58 = 2112;
            id v59 = v49;
            _os_log_error_impl(&dword_0, v47, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: ingestion failed: %@", buf, 0x20u);
          }
          [(HDClinicalIngestionTask *)self _markHadError:v28];
          goto LABEL_35;
        }
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v37;
          id v31 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          v55 = self;
          __int16 v56 = 2114;
          v57 = v31;
          id v32 = "%{public}@ Account %{public}@: ingestion not completed";
          goto LABEL_34;
        }
      }
LABEL_35:

LABEL_36:
      long long v15 = v17;
LABEL_37:

      goto LABEL_38;
    }
    if (v10)
    {
      id v33 = v9;
      unsigned int v34 = [v6 identifier];
      *(_DWORD *)buf = 138543618;
      v55 = self;
      __int16 v56 = 2114;
      v57 = v34;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: not gateway backed, not attempting to ingest", buf, 0x16u);
    }
  }
LABEL_38:
}

- (BOOL)_performResourceFetchWithAccount:(id)a3 batchingSemaphore:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v89 = a4;
  v99 = v6;
  id v7 = [v6 currentCredentialScopeSet];
  v91 = +[NSDate date];
  accountManager = self->_accountManager;
  id v114 = 0;
  v92 = [(HDClinicalAccountManager *)accountManager credentialedSessionForAccount:v6 error:&v114];
  id v9 = v114;
  v87 = v9;
  if (v92)
  {
    if ([v6 canDetectUnmergeFromPatientResource])
    {
      if ([v6 shouldPerformFullFetchWithNowDate:v91]) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
      id v11 = [(HDClinicalIngestionTask *)self context];
      v90 = (char *)[v11 queryModeFromOptionsGivenQueryMode:v10];

      BOOL v96 = v90 == (unsigned char *)&dword_0 + 2;
    }
    else
    {
      id v14 = [(HDClinicalIngestionTask *)self context];
      if ([v14 isBackgroundTask]) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 1;
      }

      if ([v99 shouldPerformFullFetchWithNowDate:v91]) {
        uint64_t v15 = 1;
      }
      long long v16 = [(HDClinicalIngestionTask *)self context];
      v90 = (char *)[v16 queryModeFromOptionsGivenQueryMode:v15];

      BOOL v96 = 0;
    }
    _HKInitializeLogging();
    id v17 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      v19 = [v99 identifier];
      uint64_t v20 = NSStringFromHKFHIRResourceQueryMode();
      *(_DWORD *)buf = 138543874;
      v116 = self;
      __int16 v117 = 2114;
      v118 = v19;
      __int16 v119 = 2114;
      id v120 = v20;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: %{public}@ fetch beginning", buf, 0x20u);
    }
    v112[0] = 0;
    v112[1] = v112;
    v112[2] = 0x2810000000;
    v112[3] = &unk_ED979;
    int v113 = 0;
    v111[0] = 0;
    v111[1] = v111;
    v111[2] = 0x2020000000;
    v111[3] = 0;
    v21 = [HDClinicalIngestionTaskAccountContext alloc];
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_9A9C;
    v107[3] = &unk_111898;
    v109 = v112;
    v110 = v111;
    id v108 = v89;
    uint64_t v22 = [(HDClinicalIngestionTaskAccountContext *)v21 initWithIngestionTask:self account:v99 queryMode:v90 ingestStartDate:v91 session:v92 didSaveResourcesHandler:v107];
    id v94 = objc_alloc_init((Class)NSMutableArray);
    id v100 = objc_alloc_init((Class)NSMutableArray);
    id v93 = objc_alloc_init((Class)NSMutableArray);
    v97 = v22;
    id v23 = [v92 specification];
    uint64_t v24 = [v23 resourceSchemas];
    v86 = objc_msgSend(v24, "hk_filter:", &stru_1118D8);

    id v95 = [v86 count];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v25 = [v92 specification];
    uint64_t v26 = [v25 resourceSchemas];

    id v27 = [v26 countByEnumeratingWithState:&v103 objects:v123 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v104;
      do
      {
        dispatch_semaphore_t v29 = 0;
        do
        {
          if (*(void *)v104 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v29);
          if (v7
            && [v7 hasAtLeastOneResourceTypeScope]
            && ([v30 name],
                id v31 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v32 = [v7 canReadResourceType:v31],
                v31,
                (v32 & 1) == 0))
          {
            _HKInitializeLogging();
            id v33 = (HDClinicalIngestionTaskResourceSchemaOperation *)HKLogHealthRecords;
            if (os_log_type_enabled(&v33->super.super, OS_LOG_TYPE_DEFAULT))
            {
              long long v48 = [v99 identifier];
              long long v49 = [v30 name];
              id v50 = [v7 originalScopes];
              *(_DWORD *)buf = 138544130;
              v116 = self;
              __int16 v117 = 2114;
              v118 = v48;
              __int16 v119 = 2114;
              id v120 = v49;
              __int16 v121 = 2114;
              CFStringRef v122 = v50;
              _os_log_impl(&dword_0, &v33->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: Skipping ingest for resource type %{public}@ because a valid scope wasn't found in %{public}@", buf, 0x2Au);
            }
          }
          else
          {
            [v30 minCompatibleAPIVersion];
            if (HKProviderServiceIsMinCompatibleAPIVersionSupported())
            {
              id v33 = [[HDClinicalIngestionTaskResourceSchemaOperation alloc] initWithResourceSchema:v30 accountContext:v97];
              if (v96)
              {
                unsigned int v34 = [v30 name];
                unsigned int v35 = [v34 isEqualToString:@"Patient"];

                if (v35)
                {
                  _HKInitializeLogging();
                  id v36 = HKLogHealthRecords;
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    v37 = [v99 identifier];
                    v38 = [v30 name];
                    *(_DWORD *)buf = 138543874;
                    v116 = self;
                    __int16 v117 = 2114;
                    v118 = v37;
                    __int16 v119 = 2114;
                    id v120 = v38;
                    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: Preflighting ingest for %{public}@", buf, 0x20u);
                  }
                  v39 = v94;
LABEL_39:
                  [v39 addObject:v33];
                  goto LABEL_40;
                }
              }
              v39 = v100;
              if (!v95) {
                goto LABEL_39;
              }
              v42 = [v30 name];
              unsigned int v43 = [v42 isEqualToString:@"DiagnosticReport"];

              v39 = v100;
              if (!v43) {
                goto LABEL_39;
              }
              _HKInitializeLogging();
              v44 = HKLogHealthRecords;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                v45 = [v99 identifier];
                long long v46 = [v30 name];
                *(_DWORD *)buf = 138543874;
                v116 = self;
                __int16 v117 = 2114;
                v118 = v45;
                __int16 v119 = 2114;
                id v120 = v46;
                _os_log_impl(&dword_0, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: Postponing ingest for %{public}@ until all other resources have been ingested", buf, 0x20u);
              }
              [v93 addObject:v33];
              long long v47 = [v99 identifier];
              [(HDClinicalIngestionTask *)self _accountWithIdentifier:v47 addOutcomeInfo:1024];
            }
            else
            {
              _HKInitializeLogging();
              id v33 = (HDClinicalIngestionTaskResourceSchemaOperation *)HKLogHealthRecords;
              if (os_log_type_enabled(&v33->super.super, OS_LOG_TYPE_DEFAULT))
              {
                v40 = [v99 identifier];
                id v41 = [v30 minCompatibleAPIVersion];
                *(_DWORD *)buf = 138543874;
                v116 = self;
                __int16 v117 = 2114;
                v118 = v40;
                __int16 v119 = 2050;
                id v120 = v41;
                _os_log_impl(&dword_0, &v33->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: Detected a resource schema with MCAV %{public}ld, which is greater than our version, skipping this schema", buf, 0x20u);
              }
            }
          }
LABEL_40:

          dispatch_semaphore_t v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v51 = [v26 countByEnumeratingWithState:&v103 objects:v123 count:16];
        id v27 = v51;
      }
      while (v51);
    }

    id v52 = [(HDClinicalIngestionTask *)self _runAndAwaitPreflightOperations:v94 accountContext:v97];
    id v53 = [(HDClinicalIngestionTaskAccountContext *)v97 runAndAwaitSchemaOperations:v100];
    if ([v52 atLeastOneFetchSucceeded]) {
      unsigned int v54 = 1;
    }
    else {
      unsigned int v54 = [v53 atLeastOneFetchSucceeded];
    }
    if ([v52 accountMustLimitRequests]) {
      id v55 = &dword_0 + 1;
    }
    else {
      id v55 = [v53 accountMustLimitRequests];
    }
    if ([v93 count])
    {
      _HKInitializeLogging();
      __int16 v56 = HKLogHealthRecords;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = [v99 identifier];
        id v58 = [v93 count];
        id v59 = (char *)[v93 count];
        CFStringRef v60 = @"s";
        *(_DWORD *)buf = 138544130;
        v116 = self;
        __int16 v117 = 2114;
        if (v59 == (unsigned char *)&dword_0 + 1) {
          CFStringRef v60 = &stru_1152E8;
        }
        v118 = v57;
        __int16 v119 = 2048;
        id v120 = v58;
        __int16 v121 = 2114;
        CFStringRef v122 = v60;
        _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: Running %ld postponed ingest operation%{public}@", buf, 0x2Au);
      }
      v61 = [(HDClinicalIngestionTaskAccountContext *)v97 runAndAwaitSchemaOperations:v93];
      v62 = v61;
      if (v54) {
        unsigned int v54 = 1;
      }
      else {
        unsigned int v54 = [v61 atLeastOneFetchSucceeded];
      }
    }
    v63 = [v99 identifier];
    [(HDClinicalIngestionTask *)self _accountWithIdentifier:v63 addOutcomeInfo:8];

    [(HDClinicalIngestionTaskAccountContext *)v97 queryMode];
    if (HKFHIRResourceQueryModeIncludesFullMode())
    {
      v64 = [v99 identifier];
      [(HDClinicalIngestionTask *)self _accountWithIdentifier:v64 addOutcomeInfo:16];
    }
    if (v55)
    {
      id v65 = [v99 identifier];
      [(HDClinicalIngestionTask *)self _accountWithIdentifier:v65 addOutcomeInfo:4096];
    }
    else
    {
      id v102 = 0;
      v66 = [(HDClinicalIngestionTask *)self _gatewayFeatureOperationsForAccount:v99 session:v92 queryMode:v90 error:&v102];
      id v65 = v102;
      if (v66)
      {
        if ([v66 count])
        {
          [(HDClinicalIngestionTaskAccountContext *)v97 runAndAwaitFeatureOperations:v66];
          v67 = [v99 identifier];
          [(HDClinicalIngestionTask *)self _accountWithIdentifier:v67 addOutcomeInfo:512];
        }
      }
      else
      {
        _HKInitializeLogging();
        v68 = HKLogHealthRecords;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v85 = [v99 identifier];
          *(_DWORD *)buf = 138543874;
          v116 = self;
          __int16 v117 = 2114;
          v118 = v85;
          __int16 v119 = 2114;
          id v120 = v65;
          _os_log_error_impl(&dword_0, v68, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: gateway feature operations error: %{public}@", buf, 0x20u);
        }
        [(HDClinicalIngestionTaskAccountContext *)v97 didEncounterError:v65];
      }
    }
    v69 = [(HDClinicalIngestionTaskAccountContext *)v97 accumulatedErrors];
    id v70 = [v69 count];
    id v71 = v70;
    if (v54)
    {
      int ModeIncludesFullMode = HKFHIRResourceQueryModeIncludesFullMode();
      if (!v71) {
        goto LABEL_73;
      }
    }
    else
    {
      int ModeIncludesFullMode = 0;
      if (!v70)
      {
LABEL_73:
        v73 = 0;
        if (ModeIncludesFullMode)
        {
LABEL_74:
          id v101 = 0;
          unsigned __int8 v74 = [(HDClinicalIngestionTask *)self _handleStaleResourcesOfAccount:v99 ingestStartDate:v91 error:&v101];
          id v75 = v101;
          if (v74)
          {
            uint64_t v76 = (uint64_t)v69;
          }
          else
          {
            uint64_t v76 = [v69 arrayByAddingObject:v75];

            uint64_t v78 = +[NSError hrs_errorWithAccumulatedErrors:v76];

            v73 = (void *)v78;
          }

          unsigned int v77 = 0;
          v69 = (void *)v76;
LABEL_83:
          if ((v77 | v55))
          {
            [(HDClinicalAccountManager *)self->_accountManager failedToCompleteFetchForAccount:v99 mustLimitFutureRequests:v55];
          }
          else
          {
            unsigned int v79 = HKFHIRResourceQueryModeIncludesFullMode();
            if (v71) {
              uint64_t v80 = 0;
            }
            else {
              uint64_t v80 = v79;
            }
            [(HDClinicalAccountManager *)self->_accountManager didCompleteFetchForAccount:v99 wasFullFetch:v80];
          }
          BOOL v81 = v73 == 0;
          if (v73)
          {
            id v82 = v73;
            v83 = v82;
            if (a5) {
              *a5 = v82;
            }
            else {
              _HKLogDroppedError();
            }
          }
          _Block_object_dispose(v111, 8);
          _Block_object_dispose(v112, 8);
          goto LABEL_97;
        }
LABEL_80:
        unsigned int v77 = 0;
        goto LABEL_83;
      }
    }
    v73 = +[NSError hrs_errorWithAccumulatedErrors:v69];
    unsigned int v77 = objc_msgSend(v73, "hrs_hasAuthorizationFailure") | v54 ^ 1;
    if (!ModeIncludesFullMode || (v77 & 1) != 0) {
      goto LABEL_83;
    }
    if ([(id)objc_opt_class() _accumulatedErrorAllowsToProceedRunningStaleResourcesOperation:v73])goto LABEL_74; {
    goto LABEL_80;
    }
  }
  id v12 = v9;
  unsigned __int8 v13 = v12;
  if (v12)
  {
    if (a5) {
      *a5 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v81 = 0;
LABEL_97:

  return v81;
}

- (id)_runAndAwaitPreflightOperations:(id)a3 accountContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 count]
    || ([(HDClinicalIngestionTask *)self isCancelled] & 1) != 0)
  {
    id v8 = 0;
    goto LABEL_32;
  }
  _HKInitializeLogging();
  id v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AA40C((uint64_t)self, v9, v7);
  }
  uint64_t v10 = [v7 account];
  id v11 = [v10 identifier];
  profile = self->_profile;
  id v53 = 0;
  unsigned __int8 v13 = +[HDOriginalFHIRResourceEntity resourceDataForPatientResourceForAccountWithIdentifier:v11 profile:profile error:&v53];
  id v14 = v53;

  if (v13) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v14 == 0;
  }
  if (!v15)
  {
    unsigned __int8 v29 = objc_msgSend(v14, "hk_isObjectNotFoundError");
    if (v29)
    {
      id v8 = [v7 runAndAwaitSchemaOperations:v6];
      goto LABEL_31;
    }
    _HKInitializeLogging();
    v30 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      v45 = v30;
      long long v46 = [v7 account];
      long long v47 = [v46 identifier];
      *(_DWORD *)buf = 138543874;
      id v55 = self;
      __int16 v56 = 2114;
      v57 = v47;
      __int16 v58 = 2114;
      id v59 = v14;
      _os_log_error_impl(&dword_0, v45, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: failed to retrieve existing Patient resource: %{public}@", buf, 0x20u);
    }
    id v8 = [v7 runAndAwaitSchemaOperations:v6];
    goto LABEL_27;
  }
  id v8 = [v7 runAndAwaitSchemaOperations:v6];
  if (v13)
  {

    long long v16 = [v7 account];
    id v17 = [v16 identifier];
    id v18 = self->_profile;
    id v52 = 0;
    v19 = +[HDOriginalFHIRResourceEntity resourceDataForPatientResourceForAccountWithIdentifier:v17 profile:v18 error:&v52];
    id v14 = v52;

    if (!v19)
    {
      _HKInitializeLogging();
      id v31 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v32 = v31;
        id v33 = [v7 account];
        unsigned int v34 = [v33 identifier];
        *(_DWORD *)buf = 138543874;
        id v55 = self;
        __int16 v56 = 2114;
        v57 = v34;
        __int16 v58 = 2114;
        id v59 = v14;
        _os_log_error_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: failed to retrieve incoming Patient resource: %{public}@", buf, 0x20u);
      }
      goto LABEL_31;
    }
    uint64_t v20 = [HDClinicalIngestionComparePatientResourcesOperation alloc];
    v21 = [v7 account];
    uint64_t v22 = [(HDClinicalIngestionComparePatientResourcesOperation *)v20 initWithTask:self account:v21 existingResourceData:v13 incomingResourceData:v19];

    [(HDClinicalIngestionComparePatientResourcesOperation *)v22 start];
    id v23 = [(HDClinicalIngestionComparePatientResourcesOperation *)v22 result];
    unsigned __int8 v24 = [v23 outcome];

    if ((v24 & 8) == 0)
    {
      id v25 = [(HDClinicalIngestionOperation *)v22 operationError];

      _HKInitializeLogging();
      uint64_t v26 = (void *)HKLogHealthRecords;
      if (v25)
      {
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          log = v26;
          os_log_t v49 = [v7 account];
          id v27 = [v49 identifier];
          uint64_t v28 = [(HDClinicalIngestionOperation *)v22 operationError];
          *(_DWORD *)buf = 138543874;
          id v55 = self;
          __int16 v56 = 2114;
          v57 = v27;
          __int16 v58 = 2114;
          id v59 = v28;
          _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: failed to compare Patient resources: %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        id v51 = v26;
        unsigned int v43 = [v7 account];
        v44 = [v43 identifier];
        *(_DWORD *)buf = 138543618;
        id v55 = self;
        __int16 v56 = 2114;
        v57 = v44;
        _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: no unmerge detected", buf, 0x16u);
      }
      goto LABEL_30;
    }
    _HKInitializeLogging();
    unsigned int v35 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = v35;
      os_log_t v50 = [v7 account];
      v37 = [v50 identifier];
      *(_DWORD *)buf = 138543618;
      id v55 = self;
      __int16 v56 = 2114;
      v57 = v37;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: unmerge detected!!", buf, 0x16u);
    }
LABEL_27:
    _HKInitializeLogging();
    v38 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      v40 = [v7 account];
      id v41 = [v40 identifier];
      *(_DWORD *)buf = 138543618;
      id v55 = self;
      __int16 v56 = 2114;
      v57 = v41;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: upgrading ingest to \"full\" query mode", buf, 0x16u);
    }
    [v7 changeQueryMode:1];
    v19 = [v7 account];
    uint64_t v22 = [v19 identifier];
    [(HDClinicalIngestionTask *)self _accountWithIdentifier:v22 addOutcomeInfo:2048];
LABEL_30:
  }
LABEL_31:

LABEL_32:

  return v8;
}

- (BOOL)_handleStaleResourcesOfAccount:(id)a3 ingestStartDate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSOperationQueue);
  id v11 = +[NSString stringWithFormat:@"%@-ResourceFetch-StaleResourcesQueue", objc_opt_class()];
  [v10 setName:v11];

  [v10 setQualityOfService:17];
  _HKInitializeLogging();
  id v12 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v13 = v12;
    id v14 = [v8 identifier];
    *(_DWORD *)buf = 138543618;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v14;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: running stale resources operation", buf, 0x16u);
  }
  BOOL v15 = [[HDClinicalIngestionHandleStaleResourcesOperation alloc] initWithTask:self account:v8 ingestStartDate:v9 nextOperation:0];

  [v10 addOperation:v15];
  [v10 waitUntilAllOperationsAreFinished];
  long long v16 = [v8 identifier];
  [(HDClinicalIngestionTask *)self _accountWithIdentifier:v16 addOutcomeInfo:256];

  id v17 = [(HDClinicalIngestionOperation *)v15 operationError];

  if (v17)
  {
    _HKInitializeLogging();
    id v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      v21 = v18;
      uint64_t v22 = [v8 identifier];
      id v23 = [(HDClinicalIngestionOperation *)v15 operationError];
      *(_DWORD *)buf = 138543874;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v22;
      __int16 v28 = 2114;
      unsigned __int8 v29 = v23;
      _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: stale resources operation failed: %{public}@", buf, 0x20u);
    }
    id v19 = [(HDClinicalIngestionOperation *)v15 operationError];
    if (v19)
    {
      if (a5) {
        *a5 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v17 == 0;
}

- (void)_performExtractionWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  [(HDClinicalIngestionTask *)self _accountWithIdentifier:v5 addOutcomeInfo:32];

  while (1)
  {
    id v6 = [[HDClinicalIngestionExtractionOperation alloc] initWithTask:self account:v4 nextOperation:0];
    [(HDClinicalIngestionExtractionOperation *)v6 setBatchSize:&off_11CED0];
    [(HDClinicalIngestionExtractionOperation *)v6 start];
    if ([(HDClinicalIngestionExtractionOperation *)v6 isCancelled]) {
      break;
    }
    if (![(HDClinicalIngestionExtractionOperation *)v6 countOfExtractedResources]) {
      goto LABEL_8;
    }
    unsigned int v7 = [(HDClinicalIngestionTask *)self isCancelled];

    if (v7) {
      goto LABEL_9;
    }
  }
  _HKInitializeLogging();
  id v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    id v9 = v8;
    id v10 = [v4 identifier];
    id v11 = [(HDClinicalIngestionExtractionOperation *)v6 extractionError];
    int v12 = 138543874;
    unsigned __int8 v13 = self;
    __int16 v14 = 2114;
    BOOL v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: extraction failed: %@", (uint8_t *)&v12, 0x20u);
  }
LABEL_8:

LABEL_9:
}

- (void)_didStart
{
  _HKInitializeLogging();
  v3 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    unsigned int v7 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "START ingestion task %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = +[HDDaemonTransaction transactionWithOwner:self activityName:self->_taskIdentifier];
  transaction = self->_transaction;
  self->_transaction = v4;
}

- (void)_didFinishWithStartTimeInternal:(double)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  os_unfair_lock_lock(&self->_ivarLock);
  double v7 = v6 - a3;
  id v8 = (void (**)(id, HDClinicalIngestionTask *))objc_retainBlock(self->_willFinishFetchingAndExtracting);
  id willFinishFetchingAndExtracting = self->_willFinishFetchingAndExtracting;
  self->_id willFinishFetchingAndExtracting = 0;

  id v10 = (void (**)(id, HDClinicalIngestionTask *))objc_retainBlock(self->_didFinishFetchingAndExtracting);
  id didFinishFetchingAndExtracting = self->_didFinishFetchingAndExtracting;
  self->_id didFinishFetchingAndExtracting = 0;

  id v12 = objc_retainBlock(self->_completion);
  id completion = self->_completion;
  self->_id completion = 0;

  if ([(HDClinicalIngestionTask *)self isCancelled]) {
    BOOL v14 = self->_ingestionError == 0;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = [(HDClinicalIngestionTask *)self _ivarLock_synthesizeTaskOutcomeWithSuccess:v14 runTime:v7];
  objc_storeStrong((id *)&self->_outcome, v15);
  os_unfair_lock_unlock(&self->_ivarLock);
  if (v8) {
    v8[2](v8, self);
  }
  _HKInitializeLogging();
  __int16 v16 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2048;
    double v23 = v7;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "FINISH ingestion task %{public}@. Runtime: %.2f sec", buf, 0x16u);
  }
  if (v10) {
    v10[2](v10, self);
  }
  id v19 = v12;
  id v17 = v15;
  id v18 = v12;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (void)_markHadError:(id)a3
{
  id v4 = (NSError *)a3;
  os_unfair_lock_lock(&self->_ivarLock);
  ingestionError = self->_ingestionError;
  self->_ingestionError = v4;

  os_unfair_lock_unlock(&self->_ivarLock);
}

- (void)_cancelWithError:(id)a3
{
  if (a3) {
    -[HDClinicalIngestionTask _markHadError:](self, "_markHadError:");
  }

  [(HDClinicalIngestionTask *)self cancel];
}

- (void)cancel
{
  if (self->_neverFinishSemaphore)
  {
    _HKInitializeLogging();
    v3 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AA4BC((uint64_t)self, v3);
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_neverFinishSemaphore);
    neverFinishSemaphore = self->_neverFinishSemaphore;
    self->_neverFinishSemaphore = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HDClinicalIngestionTask;
    [(HDClinicalIngestionTask *)&v5 cancel];
  }
}

- (id)_ivarLock_synthesizeTaskOutcomeWithSuccess:(BOOL)a3 runTime:(double)a4
{
  BOOL v5 = a3;
  os_unfair_lock_assert_owner(&self->_ivarLock);
  double v7 = [(NSDictionary *)self->_perAccountInfo allValues];
  id v8 = objc_msgSend(v7, "hk_map:", &stru_111940);

  id v9 = objc_alloc((Class)HKClinicalIngestionOutcome);
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = &__NSArray0__struct;
  }
  id v11 = [v9 initWithTaskSuccess:v5 taskError:self->_ingestionError taskRuntime:v10 perAccountOutcomes:self->_analyticsString analyticsString:a4];

  return v11;
}

- (id)_gatewaysOperationForAccount:(id)a3
{
  id v4 = [a3 identifier];
  BOOL v5 = [(HDClinicalIngestionTask *)self updateGatewayOperationsByAccountIdentifier];
  double v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    _HKInitializeLogging();
    double v7 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: no update gateways operation created", (uint8_t *)&v9, 0x16u);
    }
  }

  return v6;
}

- (BOOL)_ingestionAllowed
{
  v3 = [(HDClinicalIngestionTask *)self context];
  unsigned int v4 = [v3 isBackgroundTask];

  if (v4
    && (+[MCProfileConnection sharedConnection],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isAutomaticAppUpdatesAllowed],
        v5,
        !v6))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    double v7 = [(HDClinicalIngestionTask *)self profile];
    id v8 = [v7 daemon];
    int v9 = [v8 behavior];
    unsigned int v10 = [v9 healthAppNotInstalled] ^ 1;
  }
  return v10;
}

- (void)_prepareUpdateGatewaysOperationsForAccounts:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HDClinicalIngestionTask *)self context];
  unsigned int v6 = [v5 shouldSkipGatewaysUpdate];

  if (v6)
  {
    _HKInitializeLogging();
    double v7 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      int v9 = objc_msgSend(v4, "hk_map:", &stru_111980);
      unsigned int v10 = [v9 componentsJoinedByString:@", "];
      int v13 = 138543618;
      BOOL v14 = self;
      __int16 v15 = 2114;
      __int16 v16 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping _prepareUpdateGatewaysOperationsForAccounts %{public}@", (uint8_t *)&v13, 0x16u);

LABEL_6:
    }
  }
  else if (!self->_updateGatewayOperationsByAccountIdentifier)
  {
    id v8 = [(HDHealthRecordsProfileExtension *)self->_profileExtension providerServiceManager];
    __int16 v11 = [v8 createUpdateGatewaysOperationsForAccounts:v4];
    updateGatewayOperationsByAccountIdentifier = self->_updateGatewayOperationsByAccountIdentifier;
    self->_updateGatewayOperationsByAccountIdentifier = v11;

    goto LABEL_6;
  }
}

- (BOOL)_prepareAccounts:(id *)a3 userFetchEligibleAccounts:(id *)a4 withError:(id *)a5
{
  accountManager = self->_accountManager;
  unsigned int v10 = [(NSSet *)self->_accountIdentifiers allObjects];
  id v23 = 0;
  __int16 v11 = [(HDClinicalAccountManager *)accountManager accountsWithIdentifiers:v10 error:&v23];
  id v12 = v23;

  if (!v11)
  {
LABEL_5:
    id v20 = v12;
    id v15 = v20;
    if (v20)
    {
      if (a5)
      {
        id v15 = v20;
        BOOL v19 = 0;
        *a5 = v15;
        id v16 = v15;
        goto LABEL_10;
      }
      _HKLogDroppedError();
    }
    BOOL v19 = 0;
    id v16 = v15;
    goto LABEL_10;
  }
  int v13 = self->_accountManager;
  BOOL v14 = [(NSSet *)self->_accountIdentifiers allObjects];
  id v22 = v12;
  id v15 = [(HDClinicalAccountManager *)v13 userFetchEligibleAccountsWithIdentifiers:v14 error:&v22];
  id v16 = v22;

  [(HDClinicalIngestionTask *)self _markAccountsWithoutCredentialsAsReloginNeeded:v11];
  if (!v15)
  {
    id v12 = v16;
    goto LABEL_5;
  }
  *a3 = [v11 copy];
  *a4 = [v15 copy];
  objc_msgSend(v11, "hk_mapToDictionary:", &stru_1119C0);
  id v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  perAccountInfo = self->_perAccountInfo;
  self->_perAccountInfo = v17;

  BOOL v19 = 1;
LABEL_10:

  return v19;
}

- (void)_markAccountsWithoutCredentialsAsReloginNeeded:(id)a3
{
  id v3 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = [v8 credential];
        if (!v9)
        {
          if ([v8 needsRelogin]) {
            continue;
          }
          id v10 = objc_alloc((Class)HKClinicalAccountEvent);
          __int16 v11 = [v8 identifier];
          id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "-[HDClinicalIngestionTask _markAccountsWithoutCredentialsAsReloginNeeded:]", 833, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Ingestion/Pipeline/HDClinicalIngestionTask.m");
          int v13 = +[NSDate date];
          [v8 credentialState];
          uint64_t v14 = HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState();
          id v15 = [v10 initWithAccountIdentifier:v11 type:1 caller:v12 timestamp:v13 eventDescription:@"No credentials were found for the account during clinical ingestion task." credentialStateBefore:v14 credentialStateAfter:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];

          accountManager = self->_accountManager;
          id v21 = 0;
          [(HDClinicalAccountManager *)accountManager updateCredentialStateForAccount:v8 state:1 event:v15 error:&v21];
          id v9 = v21;
          if (v9)
          {
            _HKInitializeLogging();
            id v17 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
            {
              id v18 = v17;
              BOOL v19 = [v8 identifier];
              *(_DWORD *)buf = 138543874;
              id v27 = self;
              __int16 v28 = 2114;
              unsigned __int8 v29 = v19;
              __int16 v30 = 2114;
              id v31 = v9;
              _os_log_fault_impl(&dword_0, v18, OS_LOG_TYPE_FAULT, "%{public}@ Error marking account: %{public}@ as needs relogin %{public}@", buf, 0x20u);
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v5);
  }
}

- (BOOL)_updateGatewayForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(HDClinicalIngestionTask *)self _gatewaysOperationForAccount:v6];
  if (v7)
  {
    id v8 = [(HDClinicalIngestionTask *)self profileExtension];
    id v9 = [v8 providerServiceManager];
    [v9 addOperationUnlessAlreadyEnqueued:v7];

    [v7 waitUntilFinished];
    id v10 = [v6 identifier];
    [(HDClinicalIngestionTask *)self _accountWithIdentifier:v10 addOutcomeInfo:1];
  }
  unsigned int v11 = [v7 isCancelled];
  if (v11)
  {
    id v12 = [v7 error];
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v11 ^ 1;
}

- (id)_fetchableAccountForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  accountManager = self->_accountManager;
  id v8 = [v6 identifier];
  id v9 = [(HDClinicalAccountManager *)accountManager accountWithIdentifier:v8 error:a4];

  if (v9)
  {
    id v10 = [(HDClinicalIngestionPerAccountOperation *)[HDClinicalIngestionIsAccountFetchableOperation alloc] initWithTask:self account:v9 nextOperation:0];
    [(HDClinicalIngestionIsAccountFetchableOperation *)v10 start];
    id v11 = 0;
    if ([(HDClinicalIngestionIsAccountFetchableOperation *)v10 accountFetchable])
    {
      id v12 = [v6 identifier];
      [(HDClinicalIngestionTask *)self _accountWithIdentifier:v12 addOutcomeInfo:2];

      id v11 = v9;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_gatewayFeatureOperationsForAccount:(id)a3 session:(id)a4 queryMode:(int64_t)a5 error:(id *)a6
{
  id v8 = a3;
  id v51 = a4;
  id v9 = [v8 gateway];

  if (v9)
  {
    id v10 = [v8 gateway];
    id v11 = [v10 hkGateway];

    *(void *)buf = objc_opt_class();
    v45 = +[NSArray arrayWithObjects:buf count:1];
    os_log_t v49 = v11;
    id v50 = objc_alloc_init((Class)NSMutableArray);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = [v11 features];
    id v46 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (!v46) {
      goto LABEL_32;
    }
    uint64_t v44 = *(void *)v59;
    id v52 = v8;
    while (1)
    {
      for (i = 0; i != v46; i = (char *)i + 1)
      {
        if (*(void *)v59 != v44) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        _HKInitializeLogging();
        uint64_t v14 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
        {
          v37 = v14;
          [v8 identifier];
          v39 = v38 = i;
          v40 = [v13 name];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = self;
          __int16 v63 = 2114;
          v64 = v39;
          __int16 v65 = 2114;
          v66 = v40;
          _os_log_debug_impl(&dword_0, v37, OS_LOG_TYPE_DEBUG, "%{public}@ Account %{public}@: checking for gateway feature \"%{public}@\" handlers", buf, 0x20u);

          i = v38;
        }
        [v13 minCompatibleAPIVersion];
        if ((HKProviderServiceIsMinCompatibleAPIVersionSupported() & 1) == 0)
        {
          _HKInitializeLogging();
          id v15 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
          {
            id v16 = v15;
            [v8 identifier];
            v18 = id v17 = i;
            BOOL v19 = [v13 name];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = self;
            __int16 v63 = 2114;
            v64 = v18;
            __int16 v65 = 2114;
            v66 = v19;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%{public}@ Account %{public}@: gateway feature \"%{public}@\" is not supported by this device, skipping", buf, 0x20u);

            i = v17;
          }
        }
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v20 = v45;
        id v21 = [v20 countByEnumeratingWithState:&v54 objects:v69 count:16];
        if (v21)
        {
          id v22 = v21;
          long long v47 = i;
          uint64_t v23 = 0;
          uint64_t v24 = *(void *)v55;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v55 != v24) {
                objc_enumerationMutation(v20);
              }
              __int16 v26 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
              if (([v26 isSubclassOfClass:objc_opt_class()] & 1) == 0)
              {
                id v31 = +[NSAssertionHandler currentHandler];
                [v31 handleFailureInMethod:a2, self, @"HDClinicalIngestionTask.m", 910, @"Gateway feature handler classes must be subclasses of HDClinicalIngestionGatewayFeatureOperation, but %@ is not", v26 object file lineNumber description];
              }
              id v27 = [v13 name];
              __int16 v28 = [v26 featureName];
              unsigned int v29 = [v27 isEqualToString:v28];

              if (v29)
              {
                ++v23;
                id v30 = [objc_alloc((Class)v26) initWithTask:self account:v52 session:v51 gateway:v49 feature:v13 queryMode:a5];
                [v50 addObject:v30];
              }
            }
            id v22 = [v20 countByEnumeratingWithState:&v54 objects:v69 count:16];
          }
          while (v22);

          id v8 = v52;
          i = v47;
          if (v23)
          {
            _HKInitializeLogging();
            unsigned __int8 v32 = (void *)HKLogHealthRecords;
            if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
              continue;
            }
            id v33 = v32;
            unsigned int v34 = [v52 identifier];
            unsigned int v35 = [v13 name];
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = self;
            __int16 v63 = 2114;
            v64 = v34;
            __int16 v65 = 2114;
            v66 = v35;
            __int16 v67 = 2050;
            uint64_t v68 = v23;
            _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%{public}@ Account %{public}@: gateway feature \"%{public}@\" is handled by %{public}lld", buf, 0x2Au);
            goto LABEL_29;
          }
        }
        else
        {
        }
        _HKInitializeLogging();
        id v36 = (void *)HKLogHealthRecords;
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT)) {
          continue;
        }
        id v33 = v36;
        unsigned int v34 = [v8 identifier];
        unsigned int v35 = [v13 name];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = self;
        __int16 v63 = 2114;
        v64 = v34;
        __int16 v65 = 2114;
        v66 = v35;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: gateway feature \"%{public}@\" NOT handled, no handler is registered", buf, 0x20u);
LABEL_29:
      }
      id v46 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (!v46)
      {
LABEL_32:

        goto LABEL_34;
      }
    }
  }
  +[NSError hk_assignError:a6 code:3 description:@"account does not have a gateway"];
  id v50 = 0;
LABEL_34:

  return v50;
}

- (id)_serialIngestionDoneOperations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(HDClinicalIngestionOperation *)[HDClinicalIngestionNotifyHealthRecordsDaemonOperation alloc] initWithTask:self nextOperation:0];
  [v3 addObject:v4];
  id v5 = [(HDClinicalIngestionTask *)self context];
  unsigned __int8 v6 = objc_msgSend(v5, "_unitTesting_shouldSkipAttachmentDownload");

  if ((v6 & 1) == 0)
  {
    double v7 = [(HDClinicalIngestionOperation *)[HDClinicalIngestionDownloadAttachmentsOperation alloc] initWithTask:self nextOperation:0];
    [v3 addObject:v7];
  }
  id v8 = [[HDClinicalIngestionNewRecordsCheckOperation alloc] initWithTask:self startTime:self->_taskBeganDate];
  [v3 addObject:v8];

  return v3;
}

- (void)_runIngestionDoneOperations
{
  id v3 = [(HDClinicalIngestionTask *)self _serialIngestionDoneOperations];
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSOperationQueue);
    id v5 = +[NSString stringWithFormat:@"%@-Main-IngestDoneQueue", objc_opt_class()];
    [v4 setName:v5];

    [v4 setQualityOfService:17];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
          _HKInitializeLogging();
          id v12 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v24 = self;
            __int16 v25 = 2114;
            __int16 v26 = v11;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Running ingest done operation %{public}@", buf, 0x16u);
          }
          [v4 addOperation:v11];
          [v11 waitUntilFinished];
          int v13 = [v11 operationError];

          if (v13)
          {
            _HKInitializeLogging();
            uint64_t v14 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              id v16 = v14;
              id v17 = [v11 operationError];
              *(_DWORD *)buf = 138543874;
              uint64_t v24 = self;
              __int16 v25 = 2114;
              __int16 v26 = v11;
              __int16 v27 = 2112;
              __int16 v28 = v17;
              _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "%{public}@: Ingest done operation %{public}@ failed with error: %@", buf, 0x20u);
            }
            id v15 = [v11 operationError];
            [(HDClinicalIngestionTask *)self _markHadError:v15];
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v8);
    }

    id v3 = v18;
  }
}

- (void)accumulateIngestionAnalyticsFromTaskStates:(id)a3 gateway:(id)a4
{
  analyticsAccumulator = self->_analyticsAccumulator;
  id v6 = a3;
  id v7 = [a4 hkGateway];
  [(HDClinicalIngestionAnalyticsAccumulator *)analyticsAccumulator accumulateIngestionAnalyticsFromTaskStates:v6 gateway:v7 completion:0];
}

- (id)_analyticsStringAfterCollectingAndSubmittingIngestionAnalyticsOnQueue:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(HDClinicalIngestionTaskContext *)self->_context shouldSkipIngestionMetricsSubmission];
  id v6 = [(HDClinicalAccountManager *)self->_accountManager currentAnalyticsAccumulator];
  id v7 = self->_analyticsAccumulator;
  id v8 = [(HDHealthRecordsProfileExtension *)self->_profileExtension analyticsManager];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  __int16 v26 = sub_C344;
  __int16 v27 = sub_C354;
  __int16 v28 = &stru_1152E8;
  id v9 = objc_alloc((Class)HKAsynchronousOperation);
  char v10 = v5 ^ 1;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_C35C;
  v17[3] = &unk_111A38;
  id v11 = v7;
  id v18 = v11;
  id v12 = v6;
  id v19 = v12;
  long long v21 = &v23;
  char v22 = v10;
  id v13 = v8;
  id v20 = v13;
  id v14 = [v9 initWithName:@"ingestion-analytics-submission" operationBlock:v17];
  [v4 addOperation:v14];
  [v4 waitUntilAllOperationsAreFinished];
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v15;
}

- (void)_accountWithIdentifier:(id)a3 addOutcomeInfo:(unint64_t)a4
{
  id v9 = a3;
  id v7 = -[NSDictionary objectForKeyedSubscript:](self->_perAccountInfo, "objectForKeyedSubscript:");
  if (!v7)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDClinicalIngestionTask.m", 1033, @"%@ There is no account outcome info object to track info for account %@", self, v9 object file lineNumber description];
  }
  [v7 addOutcomeInfo:a4];
}

- (void)markDidProduceNewRecords
{
  self->_hasNewRecords = 1;
}

- (void)recordCountOfAllRecords:(unint64_t)a3 allLabs:(unint64_t)a4 pinnedLabs:(unint64_t)a5
{
  self->_countOfAllRecords = a3;
  self->_countOfAllLabs = a4;
  self->_countOfPinnedLabs = a5;
}

+ (BOOL)_accumulatedErrorAllowsToProceedRunningStaleResourcesOperation:(id)a3
{
  id v5 = a3;
  id v6 = [v5 domain];
  unsigned __int8 v7 = [v6 isEqualToString:HRSAccumulatedIngestionErrorDomain];

  if ((v7 & 1) == 0)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDClinicalIngestionTask.m", 1048, @"Invalid parameter not satisfying: %@", @"[accumulationError.domain isEqualToString:HRSAccumulatedIngestionErrorDomain]" object file lineNumber description];
  }
  if (objc_msgSend(v5, "hrs_hasAuthorizationFailure"))
  {
    char v8 = 0;
  }
  else
  {
    id v9 = objc_msgSend(v5, "hrs_accumulatedResourceFetchFailures");
    if ([v9 count])
    {
      char v10 = objc_msgSend(v9, "hk_filter:", &stru_111A78);
      char v8 = [v10 count] == 0;
    }
    else
    {
      char v8 = 1;
    }
  }
  return v8;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  id v5 = [(HDClinicalIngestionTask *)self taskIdentifier];
  id v6 = [(HDClinicalIngestionTask *)self context];
  id v7 = [v3 initWithFormat:@"<%@ %@; context: %@;>", v4, v5, v6, 0];

  return v7;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (HDClinicalIngestionTaskContext)context
{
  return self->_context;
}

- (id)completion
{
  return self->_completion;
}

- (BOOL)hasNewRecords
{
  return self->_hasNewRecords;
}

- (void)setHasNewRecords:(BOOL)a3
{
  self->_hasNewRecords = a3;
}

- (unint64_t)countOfAllRecords
{
  return self->_countOfAllRecords;
}

- (unint64_t)countOfAllLabs
{
  return self->_countOfAllLabs;
}

- (unint64_t)countOfPinnedLabs
{
  return self->_countOfPinnedLabs;
}

- (HKClinicalIngestionOutcome)outcome
{
  return self->_outcome;
}

- (NSDictionary)updateGatewayOperationsByAccountIdentifier
{
  return self->_updateGatewayOperationsByAccountIdentifier;
}

- (NSString)analyticsString
{
  return self->_analyticsString;
}

- (void)setAnalyticsString:(id)a3
{
}

- (NSDate)taskBeganDate
{
  return self->_taskBeganDate;
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  return self->_profileExtension;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HDHealthRecordsXPCServiceClient)healthRecordsServiceClient
{
  return self->_healthRecordsServiceClient;
}

- (HDHealthRecordsIngestionServiceClient)healthRecordsIngestionServiceClient
{
  return self->_healthRecordsIngestionServiceClient;
}

- (HDHealthRecordsLegacyIngestionServiceClient)legacyXPCIngestionServiceClient
{
  return self->_legacyXPCIngestionServiceClient;
}

- (HDClinicalIngestionAnalyticsAccumulator)analyticsAccumulator
{
  return self->_analyticsAccumulator;
}

- (id)willBeginFetchingAndExtracting
{
  return self->_willBeginFetchingAndExtracting;
}

- (void)setWillBeginFetchingAndExtracting:(id)a3
{
}

- (id)willFinishFetchingAndExtracting
{
  return self->_willFinishFetchingAndExtracting;
}

- (void)setWillFinishFetchingAndExtracting:(id)a3
{
}

- (id)didFinishFetchingAndExtracting
{
  return self->_didFinishFetchingAndExtracting;
}

- (void)setDidFinishFetchingAndExtracting:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishFetchingAndExtracting, 0);
  objc_storeStrong(&self->_willFinishFetchingAndExtracting, 0);
  objc_storeStrong(&self->_willBeginFetchingAndExtracting, 0);
  objc_storeStrong((id *)&self->_analyticsAccumulator, 0);
  objc_storeStrong((id *)&self->_legacyXPCIngestionServiceClient, 0);
  objc_storeStrong((id *)&self->_healthRecordsIngestionServiceClient, 0);
  objc_storeStrong((id *)&self->_healthRecordsServiceClient, 0);
  objc_storeStrong((id *)&self->_taskBeganDate, 0);
  objc_storeStrong((id *)&self->_analyticsString, 0);
  objc_storeStrong((id *)&self->_updateGatewayOperationsByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_neverFinishSemaphore, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_ingestionError, 0);
  objc_storeStrong((id *)&self->_perAccountInfo, 0);
  objc_storeStrong((id *)&self->_accountIdentifiers, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_profileExtension, 0);
}

@end