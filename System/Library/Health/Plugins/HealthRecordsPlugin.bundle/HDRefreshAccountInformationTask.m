@interface HDRefreshAccountInformationTask
- (BOOL)didUpdateGatewaysFromProviderService;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDRefreshAccountInformationTask)init;
- (HDRefreshAccountInformationTask)initWithProfileExtension:(id)a3 accountIdentifiers:(id)a4 completion:(id)a5;
- (NSArray)accountIdentifiers;
- (id)completion;
- (void)askForAccessCredentialsWithSession:(id)a3 completion:(id)a4;
- (void)cancelWithError:(id)a3;
- (void)main;
@end

@implementation HDRefreshAccountInformationTask

- (HDRefreshAccountInformationTask)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDRefreshAccountInformationTask)initWithProfileExtension:(id)a3 accountIdentifiers:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDRefreshAccountInformationTask;
  v12 = [(HDRefreshAccountInformationTask *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profileExtension, a3);
    v14 = (NSArray *)[v10 copy];
    accountIdentifiers = v13->_accountIdentifiers;
    v13->_accountIdentifiers = v14;

    id v16 = [v11 copy];
    id completion = v13->_completion;
    v13->_id completion = v16;

    v13->_didUpdateGatewaysFromProviderService = 0;
    v13->_ivarLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)main
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  v55 = self;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(HDRefreshAccountInformationTask *)self debugDescription];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ beginning", buf, 0xCu);

    self = v55;
  }
  v6 = [(HDHealthRecordsProfileExtension *)self->_profileExtension accountManager];
  v54 = v6;
  if (!v6)
  {
    v30 = [(HDHealthRecordsProfileExtension *)v55->_profileExtension profile];
    v47 = +[NSError hk_error:100, @"HDRefreshAccountInformationTask can only be used on profiles with account managers, but %@ doesn't have one", v30 format];

    [(HDRefreshAccountInformationTask *)v55 cancelWithError:v47];
    goto LABEL_54;
  }
  accountIdentifiers = v55->_accountIdentifiers;
  id v74 = 0;
  v46 = [v6 userFetchEligibleAccountsWithIdentifiers:accountIdentifiers error:&v74];
  id v8 = v74;
  v47 = v8;
  if (!v46)
  {
    [(HDRefreshAccountInformationTask *)v55 cancelWithError:v8];
    goto LABEL_53;
  }
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v11 = v46;
  id v12 = [v11 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v71;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v71 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        id v16 = [v15 lastFetchDate];
        v17 = v10;
        if (v16)
        {
          v18 = [v15 lastFetchDate];
          [v18 timeIntervalSinceNow];
          BOOL v20 = v19 < -43200.0;

          v17 = v10;
          if (!v20) {
            v17 = v9;
          }
        }
        [v17 addObject:v15];
      }
      id v12 = [v11 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v12);
  }

  if (![v10 count])
  {
    v49 = 0;
    goto LABEL_29;
  }
  dispatch_group_t group = [(HDHealthRecordsProfileExtension *)v55->_profileExtension providerServiceManager];
  v49 = [group createUpdateGatewaysOperationsForAccounts:v10];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v21 = [v49 allKeys];
  id v22 = [v21 countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (!v22) {
    goto LABEL_25;
  }
  uint64_t v51 = *(void *)v67;
  while (2)
  {
    for (j = 0; j != v22; j = (char *)j + 1)
    {
      if (*(void *)v67 != v51) {
        objc_enumerationMutation(v21);
      }
      uint64_t v24 = *(void *)(*((void *)&v66 + 1) + 8 * (void)j);
      v25 = [v49 objectForKeyedSubscript:v24];
      [group addOperationUnlessAlreadyEnqueued:v25];
      [v25 waitUntilFinished];
      v26 = [v25 error];
      BOOL v27 = v26 == 0;

      if (!v27)
      {
        _HKInitializeLogging();
        v41 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          v44 = v41;
          v45 = [v25 error];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          v79 = v45;
          _os_log_error_impl(&dword_0, v44, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: refresh gateway operation failed: %{public}@.", buf, 0x20u);
        }
        id v29 = [v25 error];
        [(HDRefreshAccountInformationTask *)v55 cancelWithError:v29];
        goto LABEL_51;
      }
      v55->_didUpdateGatewaysFromProviderService = 1;
      id v65 = 0;
      v28 = [v54 accountWithIdentifier:v24 error:&v65];
      id v29 = v65;
      if (!v28)
      {
        _HKInitializeLogging();
        v42 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          v79 = v29;
          _os_log_error_impl(&dword_0, v42, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: retrieve up-to-date account failed: %{public}@.", buf, 0x20u);
        }
        [(HDRefreshAccountInformationTask *)v55 cancelWithError:v29];

LABEL_51:
        goto LABEL_52;
      }
      [v9 addObject:v28];
    }
    id v22 = [v21 countByEnumeratingWithState:&v66 objects:v81 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_25:

LABEL_29:
  dispatch_group_t group = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2810000000;
  v79 = &unk_ED979;
  int v80 = 0;
  id v52 = objc_alloc_init((Class)NSMutableDictionary);
  id v50 = objc_alloc_init((Class)NSMutableArray);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v9;
  id v31 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v62;
    while (2)
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v62 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v61 + 1) + 8 * (void)k);
        id v60 = 0;
        v35 = [v54 credentialedSessionForAccount:v34 error:&v60];
        id v36 = v60;
        if (!v35)
        {
          [(HDRefreshAccountInformationTask *)v55 cancelWithError:v36];

          goto LABEL_43;
        }
        [v50 addObject:v35];
        dispatch_group_enter(group);
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_1D3BC;
        v56[3] = &unk_112418;
        v56[4] = v55;
        v56[5] = v34;
        v59 = buf;
        id v57 = v52;
        v58 = group;
        [(HDRefreshAccountInformationTask *)v55 askForAccessCredentialsWithSession:v35 completion:v56];
      }
      id v31 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  if (([(HDRefreshAccountInformationTask *)v55 isCancelled] & 1) == 0)
  {
    _HKInitializeLogging();
    v37 = HKLogHealthRecords;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = [(HDRefreshAccountInformationTask *)v55 debugDescription];
      *(_DWORD *)v75 = 138543362;
      v76 = v38;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ done", v75, 0xCu);
    }
    os_unfair_lock_lock(&v55->_ivarLock);
    id obj = [v55->_completion copy];
    id completion = v55->_completion;
    v55->_id completion = 0;

    os_unfair_lock_unlock(&v55->_ivarLock);
    if (obj)
    {
      v40 = [v52 allValues];
      (*((void (**)(id, HDRefreshAccountInformationTask *, void *, void))obj + 2))(obj, v55, v40, 0);
    }
    else
    {
      _HKInitializeLogging();
      v43 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_ABB54(v43);
      }
    }
LABEL_43:
  }
  _Block_object_dispose(buf, 8);
LABEL_52:

LABEL_53:
LABEL_54:
}

- (void)cancelWithError:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDRefreshAccountInformationTask.m", 176, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  _HKInitializeLogging();
  v6 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_ABB98(v6, self, (uint64_t)v5);
  }
  [(HDRefreshAccountInformationTask *)self cancel];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1D6D8;
  uint64_t v13 = sub_1D704;
  id v14 = 0;
  HKWithUnfairLock();
  uint64_t v7 = v10[5];
  if (v7) {
    (*(void (**)(uint64_t, HDRefreshAccountInformationTask *, void, id))(v7 + 16))(v7, self, 0, v5);
  }
  _Block_object_dispose(&v9, 8);
}

- (void)askForAccessCredentialsWithSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_ABC5C(v8, self);
  }
  uint64_t v9 = [v6 credentialVendor];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1D864;
  v11[3] = &unk_112440;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 fetchOrRefreshCredentialWithCompletion:v11];
}

- (NSArray)accountIdentifiers
{
  return self->_accountIdentifiers;
}

- (BOOL)didUpdateGatewaysFromProviderService
{
  return self->_didUpdateGatewaysFromProviderService;
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  return self->_profileExtension;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);

  objc_storeStrong((id *)&self->_accountIdentifiers, 0);
}

@end