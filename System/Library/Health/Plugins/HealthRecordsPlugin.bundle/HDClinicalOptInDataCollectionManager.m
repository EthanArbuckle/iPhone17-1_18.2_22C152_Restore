@interface HDClinicalOptInDataCollectionManager
+ (id)_optInJSONForBuild:(id)a3 extractionRulesVersion:(id)a4 FHIRVersion:(id)a5 resource:(id)a6;
- (BOOL)_queue_updateSubmittedAnchors:(id)a3 accounts:(id)a4 error:(id *)a5;
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (HDClinicalOptInDataCollectionManager)initWithProfileExtension:(id)a3;
- (HDClinicalOptInStudy)study;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDProfile)profile;
- (void)_queue_submitAnalyticsForResult:(id)a3 completion:(id)a4;
- (void)_queue_submitFetchedResources:(id)a3 completion:(id)a4;
- (void)_queue_submitOptInResourcesForAccounts:(id)a3 batchCountLimit:(int64_t)a4 batchSizeLimit:(int64_t)a5 completion:(id)a6;
- (void)_queue_triggerClinicalOptInDataCollectionWithCompletion:(id)a3;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)resetClinicalOptInDataCollectionAnchorsWithCompletion:(id)a3;
- (void)triggerClinicalOptInDataCollectionForReason:(int64_t)a3 completion:(id)a4;
@end

@implementation HDClinicalOptInDataCollectionManager

- (HDClinicalOptInDataCollectionManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDClinicalOptInDataCollectionManager;
  v5 = [(HDClinicalOptInDataCollectionManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = [v4 profile];
    objc_storeWeak((id *)&v6->_profile, v7);

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profileExtension);
    uint64_t v9 = [WeakRetained optInStudy];
    study = v6->_study;
    v6->_study = (HDClinicalOptInStudy *)v9;

    uint64_t v11 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    id v13 = objc_alloc((Class)HDPeriodicActivity);
    id v14 = objc_loadWeakRetained((id *)&v6->_profile);
    v15 = (HDPeriodicActivity *)[v13 initWithProfile:v14 name:@"com.apple.healthd.healthrecords.opt-in-data-collection" interval:v6 delegate:HKLogHealthRecords loggingCategory:(double)XPC_ACTIVITY_INTERVAL_7_DAYS];
    periodicActivity = v6->_periodicActivity;
    v6->_periodicActivity = v15;
  }
  return v6;
}

- (void)triggerClinicalOptInDataCollectionForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_69D58;
  block[3] = &unk_113DC8;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)resetClinicalOptInDataCollectionAnchorsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6A0A0;
  v7[3] = &unk_111E90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_queue_triggerClinicalOptInDataCollectionWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [(HDClinicalOptInDataCollectionManager *)self profileExtension];
  unsigned __int8 v6 = [v5 isImproveHealthRecordsDataSubmissionAllowed];

  if (v6)
  {
    v7 = [(HDClinicalOptInDataCollectionManager *)self profile];
    id v8 = [v7 database];
    unsigned __int8 v9 = [v8 isProtectedDataAvailable];

    if (v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      int64_t v11 = [WeakRetained database];
      id v21 = 0;
      v12 = +[HDClinicalAccountEntity allAccountsInHealthDatabase:v11 error:&v21];
      id v13 = v21;

      if (v12)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_6A6FC;
        v19[3] = &unk_113DF0;
        v19[4] = self;
        id v20 = v4;
        [(HDClinicalOptInDataCollectionManager *)self _queue_submitOptInResourcesForAccounts:v12 batchCountLimit:50 batchSizeLimit:102400 completion:v19];
      }
      else
      {
        (*((void (**)(id, void, id))v4 + 2))(v4, 0, v13);
      }
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B1728(v17, self);
      }
      objc_super v18 = +[NSError hk_protectedDataInaccessibilityError];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v18);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v14 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      v16 = [(HDClinicalOptInDataCollectionManager *)self debugDescription];
      *(_DWORD *)buf = 138543362;
      v23 = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%{public}@ opt-in data collection is not enabled by the user", buf, 0xCu);
    }
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)_queue_submitOptInResourcesForAccounts:(id)a3 batchCountLimit:(int64_t)a4 batchSizeLimit:(int64_t)a5 completion:(id)a6
{
  id v8 = a3;
  v42 = (void (**)(id, void, id))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v40 = v8;
  if ([v8 count])
  {
    unsigned __int8 v9 = [(HDClinicalOptInDataCollectionManager *)self profile];
    id v10 = [v9 daemon];
    v38 = [v10 ontologyConfigurationProvider];

    if (v38)
    {
      v48 = [v38 optInDataCollectionEnabledCountryCodes];
      int64_t v11 = objc_msgSend(v40, "hk_map:", &stru_113E30);
      v39 = +[NSMutableSet setWithArray:v11];

      id v47 = objc_alloc_init((Class)NSMutableArray);
      id v44 = objc_alloc_init((Class)NSMutableDictionary);
      id v43 = objc_alloc_init((Class)NSMutableDictionary);
      *(void *)&long long v78 = 0;
      *((void *)&v78 + 1) = &v78;
      uint64_t v79 = 0x2020000000;
      uint64_t v80 = 0;
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      char v74 = 0;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id obj = v40;
      id v12 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v12)
      {
        uint64_t v14 = *(void *)v68;
        *(void *)&long long v13 = 138543362;
        long long v37 = v13;
LABEL_5:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v68 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v67 + 1) + 8 * v15);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          objc_super v18 = [WeakRetained database];
          id v66 = 0;
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_6AF00;
          v57[3] = &unk_113E80;
          v57[4] = v16;
          v57[5] = self;
          id v58 = v48;
          id v59 = v44;
          id v60 = v43;
          v62 = &v78;
          id v19 = v47;
          int64_t v64 = a4;
          int64_t v65 = a5;
          id v61 = v19;
          v63 = &v71;
          unsigned __int8 v20 = +[HDOriginalFHIRResourceEntity performReadTransactionWithHealthDatabase:v18 error:&v66 block:v57];
          id v21 = v66;

          if ((v20 & 1) == 0)
          {
            v42[2](v42, 0, v21);
            BOOL v22 = 0;
            int v26 = 1;
            goto LABEL_18;
          }
          BOOL v22 = *((unsigned char *)v72 + 24) == 0;
          if (!*((unsigned char *)v72 + 24)) {
            break;
          }
          _HKInitializeLogging();
          v23 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
          {
            v24 = v23;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = [(HDClinicalOptInDataCollectionManager *)self debugDescription];
              *(_DWORD *)buf = v37;
              v76 = v25;
              _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "%{public}@: Hit a batch limit, so we'll process this batch before continuing", buf, 0xCu);
            }
            int v26 = 6;
            goto LABEL_16;
          }
          BOOL v22 = 0;
          int v26 = 6;
LABEL_18:

          if (!v22)
          {

            v27 = self;
            if (v26 != 6 && v26) {
              goto LABEL_39;
            }
            goto LABEL_27;
          }
          if (v12 == (id)++v15)
          {
            id v12 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
            if (v12) {
              goto LABEL_5;
            }
            goto LABEL_21;
          }
        }
        v24 = [v16 identifier];
        [v39 removeObject:v24];
        int v26 = 0;
LABEL_16:

        goto LABEL_18;
      }
LABEL_21:

      v27 = self;
LABEL_27:
      if (objc_msgSend(v47, "count", v37))
      {
        if (!v27->_transaction)
        {
          uint64_t v31 = +[HDDaemonTransaction transactionWithOwner:v27];
          transaction = v27->_transaction;
          v27->_transaction = (HDDaemonTransaction *)v31;

          v27 = self;
        }
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_6B4AC;
        v49[3] = &unk_113EA8;
        v53 = v42;
        v49[4] = v27;
        id v50 = v44;
        id v51 = v43;
        v54 = &v71;
        id v52 = v39;
        int64_t v55 = a4;
        int64_t v56 = a5;
        [(HDClinicalOptInDataCollectionManager *)v27 _queue_submitFetchedResources:v47 completion:v49];
      }
      else
      {
        _HKInitializeLogging();
        v34 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          v35 = v34;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v36 = [(HDClinicalOptInDataCollectionManager *)self debugDescription];
            *(_DWORD *)buf = 138543362;
            v76 = v36;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "%{public}@: no resources to submit, trigger upload only", buf, 0xCu);
          }
        }
        v42[2](v42, 1, 0);
      }
LABEL_39:
      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(&v78, 8);
    }
    else
    {
      _HKInitializeLogging();
      v33 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_B17D0(v33, self);
      }
      v48 = +[NSError hk_error:100 description:@"unable to find ontology configuration provider needed for Opt-In eligibility determination"];
      v42[2](v42, 0, v48);
    }
  }
  else
  {
    _HKInitializeLogging();
    v28 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      v29 = v28;
      v30 = [(HDClinicalOptInDataCollectionManager *)self debugDescription];
      LODWORD(v78) = 138543362;
      *(void *)((char *)&v78 + 4) = v30;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "%{public}@: no accounts for which to submit resources", (uint8_t *)&v78, 0xCu);
    }
    v42[2](v42, 1, 0);
  }
}

- (void)_queue_submitFetchedResources:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v17 = 0;
  unsigned __int8 v9 = +[HKPIIRedactor redactorWithProfile:WeakRetained error:&v17];
  id v10 = v17;

  if (v9)
  {
    id v11 = [objc_alloc((Class)HDExtractionRequest) initWithResources:v6];
    id v12 = objc_loadWeakRetained((id *)&self->_profileExtension);
    long long v13 = [v12 createHealthRecordsXPCServiceClient];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_6B7D0;
    v15[3] = &unk_113ED0;
    v15[4] = self;
    id v16 = v7;
    [v13 optInDataForFHIRDocumentWithRequest:v11 redactor:v9 completion:v15];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B1974(v14, self);
    }
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
  }
}

- (void)_queue_submitAnalyticsForResult:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id, id))a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  unsigned __int8 v9 = +[_HKBehavior currentOSBuild];
  id v10 = [v8 rulesVersion];
  id v11 = [v10 stringValue];

  id v12 = [v8 redactedResources];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_6BB2C;
  v23[3] = &unk_113EF8;
  v23[4] = self;
  id v13 = v9;
  id v24 = v13;
  id v14 = v11;
  id v25 = v14;
  uint64_t v15 = objc_msgSend(v12, "hk_map:", v23);

  if ([v15 count])
  {
    id v16 = [(HDClinicalOptInDataCollectionManager *)self study];

    if (v16)
    {
      id v17 = [(HDClinicalOptInDataCollectionManager *)self study];
      id v22 = 0;
      id v18 = [v17 submitJSONAnalyticsData:v15 error:&v22];
      id v19 = v22;

      if ((v18 & 1) == 0)
      {
        _HKInitializeLogging();
        unsigned __int8 v20 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_B1A14(v20, self);
        }
      }
      v6[2](v6, v18, v19);
    }
    else
    {
      id v21 = +[NSError hk_error:3 description:@"Study object not available when collecting opt-in data"];
      v6[2](v6, 0, v21);
    }
  }
  else
  {
    v6[2](v6, (char *)&dword_0 + 1, 0);
  }
}

- (BOOL)_queue_updateSubmittedAnchors:(id)a3 accounts:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v30 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v8;
  id v31 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (!v31)
  {
    char v22 = 1;
    id v21 = v9;
LABEL_21:

    goto LABEL_22;
  }
  id v24 = a5;
  uint64_t v29 = *(void *)v34;
  id v25 = self;
  id v27 = 0;
  location = (id *)&self->_profile;
  char v26 = 1;
  do
  {
    for (i = 0; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v34 != v29) {
        objc_enumerationMutation(v9);
      }
      uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
      id v12 = [v9 objectForKeyedSubscript:v11];
      id v13 = [v30 objectForKeyedSubscript:v11];
      id v14 = [v13 lastExtractedRulesVersion];
      id WeakRetained = objc_loadWeakRetained(location);
      id v16 = [WeakRetained database];
      id v32 = 0;
      unsigned __int8 v17 = +[HDClinicalAccountEntity updateAccountLastSubmittedRowID:v12 expectedRulesVersion:v14 identifier:v11 healthDatabase:v16 error:&v32];
      id v18 = v32;

      if ((v17 & 1) == 0)
      {
        _HKInitializeLogging();
        id v19 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v38 = v25;
          __int16 v39 = 2114;
          uint64_t v40 = v11;
          __int16 v41 = 2114;
          id v42 = v18;
          _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%{public}@: Unable to update last submitted anchor for account %{public}@, %{public}@", buf, 0x20u);
        }
        if (!v27) {
          id v27 = v18;
        }
        char v26 = 0;
      }
    }
    id v31 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
  }
  while (v31);

  id v20 = v27;
  if (v20)
  {
    id v21 = v20;
    if (v24) {
      id *v24 = v20;
    }
    else {
      _HKLogDroppedError();
    }
    char v22 = v26;

    goto LABEL_21;
  }
  char v22 = v26;
LABEL_22:

  return v22 & 1;
}

+ (id)_optInJSONForBuild:(id)a3 extractionRulesVersion:(id)a4 FHIRVersion:(id)a5 resource:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  [v13 setObject:&off_11D200 forKeyedSubscript:@"schemaVersion"];
  [v13 setObject:v12 forKeyedSubscript:@"os"];

  [v13 setObject:v11 forKeyedSubscript:@"extractionRulesVersion"];
  [v13 setObject:v10 forKeyedSubscript:@"FHIRVersion"];

  [v13 setObject:v9 forKeyedSubscript:@"resource"];

  return v13;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6C0D8;
  v6[3] = &unk_113F20;
  id v7 = a4;
  id v5 = v7;
  [(HDClinicalOptInDataCollectionManager *)self triggerClinicalOptInDataCollectionForReason:0 completion:v6];
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDClinicalOptInStudy)study
{
  return self->_study;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_study, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_profileExtension);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_periodicActivity, 0);
}

@end