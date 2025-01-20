@interface HDClinicalProviderServiceManager
- (BOOL)_insertOrUpdateGatewayIfSupported:(id)a3 error:(id *)a4;
- (BOOL)_isCountryCodeSupported:(id)a3;
- (HDClinicalProviderServiceManager)init;
- (HDClinicalProviderServiceManager)initWithProfileExtension:(id)a3;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDProfile)profile;
- (NSDate)currentSearchSessionIDMaxLifetime;
- (NSOperationQueue)operationQueue;
- (NSString)currentSearchSessionID;
- (id)_allSupportedCountryCodes;
- (id)_createURLForSearchQuery:(id)a3 error:(id *)a4;
- (id)_searchResultsPageWithOnlySupportedSearchResultsInSearchResultsPage:(id)a3;
- (id)_supportedGatewaysFromFetchedJSONObject:(id)a3 externalIDs:(id)a4 error:(id *)a5;
- (id)createUpdateGatewaysOperationsForAccounts:(id)a3;
- (id)remoteGatewaysWithBatchID:(id)a3 externalIDs:(id)a4 error:(id *)a5;
- (id)unitTesting_didAddOperationToTaskScheduleQueue;
- (void)_addOperationWithBlock:(id)a3;
- (void)_createSessionIDIfNeeded;
- (void)_fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5;
- (void)addOperationUnlessAlreadyEnqueued:(id)a3;
- (void)cancelInFlightSearchQueriesWithCompletion:(id)a3;
- (void)fetchLogoDataForBrand:(id)a3 scaleKey:(id)a4 completion:(id)a5;
- (void)fetchLogoDataForFeaturedBrandsAtScaleKey:(id)a3 completion:(id)a4;
- (void)fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5;
- (void)fetchRemoteGatewayWithExternalID:(id)a3 completion:(id)a4;
- (void)fetchRemoteProviderWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5;
- (void)fetchRemoteSearchResultsPageForQuery:(id)a3 completion:(id)a4;
- (void)setUnitTesting_didAddOperationToTaskScheduleQueue:(id)a3;
- (void)unitTesting_markSessionIDExpired;
@end

@implementation HDClinicalProviderServiceManager

- (HDClinicalProviderServiceManager)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalProviderServiceManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDClinicalProviderServiceManager;
  v5 = [(HDClinicalProviderServiceManager *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = [v4 profile];
    objc_storeWeak((id *)&v6->_profile, v7);

    v8 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    taskScheduleQueue = v6->_taskScheduleQueue;
    v6->_taskScheduleQueue = v8;

    [(NSOperationQueue *)v6->_taskScheduleQueue setMaxConcurrentOperationCount:5];
    v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    searchQueue = v6->_searchQueue;
    v6->_searchQueue = v10;

    [(NSOperationQueue *)v6->_searchQueue setQualityOfService:25];
    v12 = +[HDProviderServiceSpecification defaultSessionConfiguration];
    uint64_t v13 = +[NSURLSession sessionWithConfiguration:v12];
    URLSession = v6->_URLSession;
    v6->_URLSession = (NSURLSession *)v13;

    _HKInitializeLogging();
    v15 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      +[HDProviderServiceSpecification currentServiceEnvironment];
      v17 = HDCPSNameForEnvironment();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Health Records using %{public}@ environment", buf, 0xCu);
    }
    v18 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    [(NSOperationQueue *)v18 setQualityOfService:17];
    [(NSOperationQueue *)v18 setMaxConcurrentOperationCount:3];
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v18;

    v6->_addOperationLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)fetchRemoteSearchResultsPageForQuery:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v20 = 0;
  v7 = [(HDClinicalProviderServiceManager *)self _createURLForSearchQuery:a3 error:&v20];
  id v8 = v20;
  if (v7)
  {
    id v9 = [objc_alloc((Class)NSURLRequest) initWithURL:v7];
    v10 = [[HDCPSSearchOperation alloc] initWithRequest:v9 session:self->_URLSession];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_3F814;
    v16 = &unk_1131C8;
    v17 = v10;
    v18 = self;
    id v19 = v6;
    v11 = v10;
    v12 = objc_retainBlock(&v13);
    -[HDCPSSearchOperation setCompletionBlock:](v11, "setCompletionBlock:", v12, v13, v14, v15, v16);
    [(NSOperationQueue *)self->_searchQueue addOperation:v11];
  }
  else
  {
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v8);
  }
}

- (void)cancelInFlightSearchQueriesWithCompletion:(id)a3
{
  searchQueue = self->_searchQueue;
  id v4 = (void (**)(id, uint64_t, void))a3;
  [(NSOperationQueue *)searchQueue cancelAllOperations];
  v4[2](v4, 1, 0);
}

- (id)_createURLForSearchQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDClinicalProviderServiceManager *)self _allSupportedCountryCodes];
  [(HDClinicalProviderServiceManager *)self _createSessionIDIfNeeded];
  id v8 = +[HDProviderServiceSpecification URLForSearchQuery:v6 supportedCountryCodes:v7 searchSessionID:self->_currentSearchSessionID error:a4];

  return v8;
}

- (void)fetchRemoteProviderWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3FAD4;
  v12[3] = &unk_113218;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = v8;
  id v16 = a5;
  id v9 = v8;
  id v10 = v16;
  id v11 = v13;
  [(HDClinicalProviderServiceManager *)self _addOperationWithBlock:v12];
}

- (void)fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3FF40;
  v10[3] = &unk_113268;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(HDClinicalProviderServiceManager *)v11 _addOperationWithBlock:v10];
}

- (void)fetchRemoteGatewayWithExternalID:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_40138;
  v7[3] = &unk_113290;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(HDClinicalProviderServiceManager *)v8 _addOperationWithBlock:v7];
}

- (void)_fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_40380;
  v12[3] = &unk_1132B8;
  id v13 = a4;
  id v14 = self;
  id v15 = v8;
  id v16 = a5;
  id v9 = v8;
  id v10 = v16;
  id v11 = v13;
  [(HDClinicalProviderServiceManager *)self _addOperationWithBlock:v12];
}

- (id)remoteGatewaysWithBatchID:(id)a3 externalIDs:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[HDProviderServiceSpecification URLForGatewaysWithBatchID:a3 error:a5];
  if (v9)
  {
    id v10 = [objc_alloc((Class)NSURLRequest) initWithURL:v9];
    id v11 = [[HDCPSFetchJSONTask alloc] initWithSession:self->_URLSession request:v10];
    [(HDCPSFetchJSONTask *)v11 resume];
    [(HDCPSFetchJSONTask *)v11 waitUntilFinished];
    id v12 = [(HDCPSFetchJSONTask *)v11 JSONObject];
    if (v12)
    {
      id v13 = [(HDClinicalProviderServiceManager *)self _supportedGatewaysFromFetchedJSONObject:v12 externalIDs:v8 error:a5];
    }
    else
    {
      id v14 = [(HDCPSFetchJSONTask *)v11 error];
      if (v14)
      {
        if (a5) {
          *a5 = v14;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_searchResultsPageWithOnlySupportedSearchResultsInSearchResultsPage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 searchResults];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_40778;
  v9[3] = &unk_1132E0;
  v9[4] = self;
  id v6 = objc_msgSend(v5, "hk_filter:", v9);

  id v7 = [v4 copyWithSearchResults:v6];

  return v7;
}

- (id)_supportedGatewaysFromFetchedJSONObject:(id)a3 externalIDs:(id)a4 error:(id *)a5
{
  id v6 = +[HDProviderServiceSpecification gatewaysFromFetchedJSONObject:a3 matchingExternalIDs:a4 error:a5];
  id v7 = v6;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_408A8;
    v10[3] = &unk_113308;
    void v10[4] = self;
    id v8 = objc_msgSend(v6, "hk_filter:", v10);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_allSupportedCountryCodes
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained daemon];
  id v6 = [v5 ontologyConfigurationProvider];

  if (!v6)
  {
    _HKInitializeLogging();
    id v7 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AE944(v7, (uint64_t)self, (id *)p_profile);
    }
  }
  id v8 = [v6 allSupportedCountryCodes];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSSet set];
  }
  id v11 = v10;

  return v11;
}

- (BOOL)_isCountryCodeSupported:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained daemon];
  id v7 = [v6 ontologyConfigurationProvider];

  if (!v7)
  {
    _HKInitializeLogging();
    id v8 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AE944(v8, (uint64_t)self, (id *)&self->_profile);
    }
  }
  unsigned __int8 v9 = [v7 isCountryCodeSupported:v4];

  return v9;
}

- (BOOL)_insertOrUpdateGatewayIfSupported:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 country];
  unsigned __int8 v8 = [(HDClinicalProviderServiceManager *)self _isCountryCodeSupported:v7];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    BOOL v10 = +[HDClinicalGatewayEntity insertOrUpdateGateway:v6 profile:WeakRetained error:a4];
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AEA38(v11, (uint64_t)self, v6);
    }
    BOOL v10 = 1;
  }

  return v10;
}

- (void)fetchLogoDataForBrand:(id)a3 scaleKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isFakeBrandForTestAccounts])
  {
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AEB18(v11, (uint64_t)self, v8);
    }
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_40CD8;
    v12[3] = &unk_113218;
    id v13 = v8;
    id v14 = v9;
    id v15 = self;
    id v16 = v10;
    [(HDClinicalProviderServiceManager *)self _addOperationWithBlock:v12];
  }
}

- (void)fetchLogoDataForFeaturedBrandsAtScaleKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_41000;
  v9[3] = &unk_1131C8;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  [(HDClinicalProviderServiceManager *)self _addOperationWithBlock:v9];
}

- (id)createUpdateGatewaysOperationsForAccounts:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v54;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v53 + 1) + 8 * i) gateway];
        id v10 = v9;
        if (v9)
        {
          id v11 = [v9 batchID];
          id v12 = [v10 externalID];
          id v13 = v4;
          id v14 = [v4 objectForKeyedSubscript:v11];
          id v15 = [v14 arrayByAddingObject:v12];
          id v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            v59 = v12;
            id v17 = +[NSArray arrayWithObjects:&v59 count:1];
          }
          v18 = v17;

          id v4 = v13;
          [v13 setObject:v18 forKeyedSubscript:v11];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v6);
  }

  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v20 = v4;
  id v21 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v50;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
        v26 = [v20 objectForKeyedSubscript:v25];
        v27 = [HDCPSUpdateGatewaysOperation alloc];
        v28 = [(HDClinicalProviderServiceManager *)self profile];
        v29 = [(HDCPSUpdateGatewaysOperation *)v27 initWithManager:self profile:v28 batchID:v25 externalIDs:v26];

        [v19 setObject:v29 forKeyedSubscript:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v22);
  }

  id v44 = objc_alloc_init((Class)NSMutableDictionary);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v30 = obj;
  id v31 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v46;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v45 + 1) + 8 * (void)k);
        v36 = [v35 gateway];
        v37 = v36;
        if (v36)
        {
          v38 = [v36 batchID];
          v39 = [v19 objectForKeyedSubscript:v38];

          v40 = [v35 identifier];
          [v44 setObject:v39 forKeyedSubscript:v40];
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v32);
  }

  return v44;
}

- (void)addOperationUnlessAlreadyEnqueued:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDClinicalProviderServiceManager.m", 460, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_addOperationLock);
  id v5 = [(HDClinicalProviderServiceManager *)self operationQueue];
  id v6 = [v5 operations];
  if ([v6 containsObject:v9])
  {
  }
  else
  {
    unsigned __int8 v7 = [v9 isFinished];

    if (v7) {
      goto LABEL_8;
    }
    id v5 = [(HDClinicalProviderServiceManager *)self operationQueue];
    [v5 addOperation:v9];
  }

LABEL_8:
  os_unfair_lock_unlock(&self->_addOperationLock);
}

- (void)_addOperationWithBlock:(id)a3
{
  [(NSOperationQueue *)self->_taskScheduleQueue addOperationWithBlock:a3];
  if (_HDIsUnitTesting)
  {
    id v4 = [(HDClinicalProviderServiceManager *)self unitTesting_didAddOperationToTaskScheduleQueue];

    if (v4)
    {
      id v5 = [(HDClinicalProviderServiceManager *)self unitTesting_didAddOperationToTaskScheduleQueue];
      v5[2]();
    }
  }
}

- (void)_createSessionIDIfNeeded
{
  if (!self->_currentSearchSessionID
    || (currentSearchSessionIDMaxLifetime = self->_currentSearchSessionIDMaxLifetime) != 0
    && (+[NSDate date],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [(NSDate *)currentSearchSessionIDMaxLifetime hk_isBeforeDate:v4],
        v4,
        v5))
  {
    id v6 = +[NSUUID UUID];
    unsigned __int8 v7 = [v6 UUIDString];
    id v8 = [v7 substringFromIndex:24];
    currentSearchSessionID = self->_currentSearchSessionID;
    self->_currentSearchSessionID = v8;

    self->_currentSearchSessionIDMaxLifetime = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
    _objc_release_x1();
  }
}

- (void)unitTesting_markSessionIDExpired
{
  self->_currentSearchSessionIDMaxLifetime = +[NSDate dateWithTimeIntervalSinceNow:-300.0];

  _objc_release_x1();
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSString)currentSearchSessionID
{
  return self->_currentSearchSessionID;
}

- (NSDate)currentSearchSessionIDMaxLifetime
{
  return self->_currentSearchSessionIDMaxLifetime;
}

- (id)unitTesting_didAddOperationToTaskScheduleQueue
{
  return self->_unitTesting_didAddOperationToTaskScheduleQueue;
}

- (void)setUnitTesting_didAddOperationToTaskScheduleQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didAddOperationToTaskScheduleQueue, 0);
  objc_storeStrong((id *)&self->_currentSearchSessionIDMaxLifetime, 0);
  objc_storeStrong((id *)&self->_currentSearchSessionID, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_profileExtension);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);

  objc_storeStrong((id *)&self->_taskScheduleQueue, 0);
}

@end