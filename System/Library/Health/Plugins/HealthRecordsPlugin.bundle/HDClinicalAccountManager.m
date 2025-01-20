@interface HDClinicalAccountManager
- (BOOL)_createOrUpdateCredentialFromAuthResponse:(id)a3 account:(id)a4 requestedScope:(id)a5 event:(id)a6 error:(id *)a7;
- (BOOL)_deleteAccountWithSyncIdentifier:(id)a3 deletionReason:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)_isClinicalSharingSupportedLocale:(id)a3;
- (BOOL)_setAccountWithIdentifierNeedsRelogin:(id)a3 event:(id)a4 error:(id *)a5;
- (BOOL)_updateCredentialStateForAccountWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 error:(id *)a6;
- (BOOL)deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 error:(id *)a5;
- (BOOL)deleteAccountWithSyncIdentifier:(id)a3 deletionReason:(int64_t)a4 error:(id *)a5;
- (BOOL)invalidateCredentialForAccountWithIdentifier:(id)a3 event:(id)a4 error:(id *)a5;
- (BOOL)simulateAccountDownloadOverdueWithIdentifier:(id)a3 profile:(id)a4 stage:(int64_t)a5 error:(id *)a6;
- (BOOL)updateClinicalSharingStatusForAccountWithIdentifier:(id)a3 firstSharedDate:(id)a4 lastSharedDate:(id)a5 userStatus:(id)a6 multiDeviceStatus:(id)a7 primaryDeviceName:(id)a8 error:(id *)a9;
- (BOOL)updateCredentialStateForAccount:(id)a3 state:(int64_t)a4 event:(id)a5 error:(id *)a6;
- (BOOL)updateCredentialStateForAccount:(id)a3 state:(int64_t)a4 force:(BOOL)a5 event:(id)a6 error:(id *)a7;
- (BOOL)updateCredentialStateForAccountWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 error:(id *)a6;
- (HDClinicalAccountManager)init;
- (HDClinicalAccountManager)initWithProfileExtension:(id)a3;
- (HDClinicalIngestionAnalyticsAccumulator)currentAnalyticsAccumulator;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDProfile)profile;
- (HKSynchronousObserverSet)stateChangeObservers;
- (id)_createAccountForGatewayWithExternalID:(id)a3 database:(id)a4 profile:(id)a5 error:(id *)a6;
- (id)_createCredentialVendorForAccount:(id)a3 error:(id *)a4;
- (id)_newAccountIdentifierAfterReplacingAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 error:(id *)a5;
- (id)_savePatientMismatchedCredentialFromAuthResponse:(id)a3 requestedScope:(id)a4 error:(id *)a5;
- (id)accountEntityForRecord:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)accountForSource:(id)a3 error:(id *)a4;
- (id)accountWithIdentifier:(id)a3 error:(id *)a4;
- (id)accountsForGatewaysWithExternalIDs:(id)a3 errorOut:(id *)a4;
- (id)accountsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)allAccountsWithError:(id *)a3;
- (id)allEventsForAccountWithIdentifier:(id)a3 error:(id *)a4;
- (id)beginInitialLoginSessionForGatewayWithExternalID:(id)a3 error:(id *)a4;
- (id)beginReloginSessionForAccountWithIdentifier:(id)a3 error:(id *)a4;
- (id)createAccountForIssuer:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
- (id)createStaticAccountWithTitle:(id)a3 subtitle:(id)a4 description:(id)a5 countryCode:(id)a6 fhirVersion:(id)a7 onlyIfNeededForSimulatedGatewayID:(id)a8 error:(id *)a9;
- (id)createStaticDSTU2AccountWithTitle:(id)a3 error:(id *)a4;
- (id)credentialFromCodableCredential:(id)a3;
- (id)credentialedSessionForAccount:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)didRefreshCredentialForAccount:(id)a3 refreshResult:(id)a4 error:(id *)a5;
- (id)fetchableAccountsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)persistEphemeralAccount:(id)a3 triggerIngestion:(BOOL)a4 error:(id *)a5;
- (id)simulateUnmergeEventForAccountWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)unitTesting_createAccountForGateway:(id)a3 authResponse:(id)a4 error:(id *)a5;
- (id)unitTesting_createAccountForGateway:(id)a3 requestedScope:(id)a4 authResponse:(id)a5 error:(id *)a6;
- (id)unitTesting_createAccountWithoutCredentialForGateway:(id)a3 error:(id *)a4;
- (id)userFetchEligibleAccountsWithIdentifiers:(id)a3 error:(id *)a4;
- (int64_t)_hasClinicalSharingEnabledAccountWithError:(id *)a3;
- (int64_t)_highPriorityTransactionHasClinicalSharingEnabledAccountWithError:(id *)a3;
- (int64_t)deviceConfigurationSupportsClinicalSharingWithError:(id *)a3;
- (int64_t)deviceConfigurationSupportsHealthRecordsWithError:(id *)a3;
- (int64_t)hasGatewayBackedAccountsWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)hasIssuerBackedAccountsWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)highPriorityTransactionHasGatewayBackedAccountsWithError:(id *)a3;
- (int64_t)highPriorityTransactionHasIssuerBackedAccountsWithError:(id *)a3;
- (void)_accountDidChange:(id)a3;
- (void)_accountDidChange:(id)a3 changeType:(int64_t)a4;
- (void)_accumulateMetricsFromTaskEndStates:(id)a3 gateway:(id)a4;
- (void)_fetchAccessTokenForTokenSession:(id)a3 existingAccount:(id)a4 gateway:(id)a5 completion:(id)a6;
- (void)_messageObserversAboutAccount:(id)a3 changeType:(int64_t)a4;
- (void)_performIngestionForNewCredentialsWithReason:(id)a3 accountIdentifier:(id)a4;
- (void)_requestChangesCloudSyncForProfile:(id)a3 reason:(id)a4;
- (void)addAccountStateObserver:(id)a3;
- (void)dealloc;
- (void)didCompleteFetchForAccount:(id)a3 wasFullFetch:(BOOL)a4;
- (void)didRefreshCredentialForAccount:(id)a3 credentialVendor:(id)a4 refreshResult:(id)a5;
- (void)endLoginSessionWithState:(id)a3 code:(id)a4 completion:(id)a5;
- (void)failedToCompleteFetchForAccount:(id)a3 mustLimitFutureRequests:(BOOL)a4;
- (void)pruneAuthenticationDataWithCompletion:(id)a3;
- (void)removeAccountStateObserver:(id)a3;
- (void)replaceAccountWithNewAccountForAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 completion:(id)a5;
- (void)resetLastExtractedRowIDWithCompletion:(id)a3;
- (void)setStateChangeObservers:(id)a3;
@end

@implementation HDClinicalAccountManager

- (int64_t)deviceConfigurationSupportsHealthRecordsWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    char v14 = 0;
    unsigned int v6 = [WeakRetained deviceConfigurationSupportsHealthRecords:&v14 error:a3];
    uint64_t v7 = 1;
    if (!v14) {
      uint64_t v7 = 2;
    }
    if (v6) {
      int64_t v8 = v7;
    }
    else {
      int64_t v8 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_ADAA8(v9);
    }
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    id v12 = +[NSError hk_error:100, @"%@ lost track of its profile extension", v11 format];

    int64_t v8 = 0;
  }

  return v8;
}

- (void)addAccountStateObserver:(id)a3
{
}

- (HDClinicalAccountManager)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalAccountManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDClinicalAccountManager;
  v5 = [(HDClinicalAccountManager *)&v15 init];
  unsigned int v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    uint64_t v7 = [v4 profile];
    objc_storeWeak((id *)&v6->_profile, v7);

    int64_t v8 = objc_alloc_init(HDClinicalIngestionAnalyticsAccumulator);
    currentAnalyticsAccumulator = v6->_currentAnalyticsAccumulator;
    v6->_currentAnalyticsAccumulator = v8;

    id v10 = objc_alloc((Class)HKSynchronousObserverSet);
    v11 = (HKSynchronousObserverSet *)[v10 initWithName:@"HDClinicalAccountManager-accountStateChangeObservers" loggingCategory:HKLogHealthRecords];
    stateChangeObservers = v6->_stateChangeObservers;
    v6->_stateChangeObservers = v11;

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v6 selector:"_accountDidChange:" name:@"HDClinicalAccountEntityDidChangeEventNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"HDClinicalAccountEntityDidChangeEventNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)HDClinicalAccountManager;
  [(HDClinicalAccountManager *)&v4 dealloc];
}

- (id)beginInitialLoginSessionForGatewayWithExternalID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v8 = v7;
    v9 = [(HDClinicalAccountManager *)self debugDescription];
    id v10 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ beginning initial login session for gateway %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v41 = sub_33CE4;
  v42 = sub_33CF4;
  id v43 = 0;
  v11 = [(HDClinicalAccountManager *)self profile];
  id v12 = [v11 database];
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_33CFC;
  v29 = &unk_112D58;
  v30 = self;
  v32 = buf;
  id v33 = 0;
  id v13 = v6;
  id v31 = v13;
  unsigned __int8 v14 = +[HDClinicalAuthorizationSessionEntity performWriteTransactionWithHealthDatabase:v12 error:&v33 block:&v26];
  id v15 = v33;

  if (v14)
  {
    _HKInitializeLogging();
    v16 = HKLogHealthRecords;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(HDClinicalAccountManager *)self debugDescription];
      v18 = [*(id *)(*(void *)&buf[8] + 40) loginURL];
      v19 = HKSensitiveLogItem();
      *(_DWORD *)v34 = 138543618;
      v35 = v17;
      __int16 v36 = 2114;
      id v37 = v19;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ ready to start initial login session at %{public}@", v34, 0x16u);
    }
    id v20 = *(id *)(*(void *)&buf[8] + 40);
  }
  else
  {
    _HKInitializeLogging();
    v21 = HKLogHealthRecords;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = [(HDClinicalAccountManager *)self debugDescription];
      *(_DWORD *)v34 = 138543874;
      v35 = v25;
      __int16 v36 = 2114;
      id v37 = v13;
      __int16 v38 = 2114;
      id v39 = v15;
      _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%{public}@ failed to begin initial login session for gateway %{public}@: %{public}@", v34, 0x20u);
    }
    id v22 = v15;
    v23 = v22;
    if (v22)
    {
      if (a4) {
        *a4 = v22;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v20 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v20;
}

- (id)beginReloginSessionForAccountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v8 = v7;
    v9 = [(HDClinicalAccountManager *)self debugDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ beginning relogin session for account %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v36 = sub_33CE4;
  id v37 = sub_33CF4;
  id v38 = 0;
  id v10 = [(HDClinicalAccountManager *)self profile];
  v11 = [v10 database];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_341B0;
  v25[3] = &unk_112D80;
  uint64_t v27 = buf;
  id v28 = 0;
  id v12 = v6;
  id v26 = v12;
  unsigned __int8 v13 = +[HDClinicalAuthorizationSessionEntity performWriteTransactionWithHealthDatabase:v11 error:&v28 block:v25];
  id v14 = v28;

  if (v13)
  {
    _HKInitializeLogging();
    id v15 = HKLogHealthRecords;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(HDClinicalAccountManager *)self debugDescription];
      v17 = [*(id *)(*(void *)&buf[8] + 40) loginURL];
      v18 = HKSensitiveLogItem();
      *(_DWORD *)v29 = 138543618;
      v30 = v16;
      __int16 v31 = 2114;
      id v32 = v18;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ ready to start relogin session at %{public}@", v29, 0x16u);
    }
    id v19 = *(id *)(*(void *)&buf[8] + 40);
  }
  else
  {
    _HKInitializeLogging();
    id v20 = HKLogHealthRecords;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v24 = [(HDClinicalAccountManager *)self debugDescription];
      *(_DWORD *)v29 = 138543874;
      v30 = v24;
      __int16 v31 = 2114;
      id v32 = v12;
      __int16 v33 = 2114;
      id v34 = v14;
      _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to begin relogin session for account %{public}@: %{public}@", v29, 0x20u);
    }
    id v21 = v14;
    id v22 = v21;
    if (v21)
    {
      if (a4) {
        *a4 = v21;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v19 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v19;
}

- (void)endLoginSessionWithState:(id)a3 code:(id)a4 completion:(id)a5
{
  int64_t v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  v11 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    unsigned __int8 v13 = [(HDClinicalAccountManager *)self debugDescription];
    id v14 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    v80 = v8;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ ending login session with code %{public}@ and state %{public}@", buf, 0x20u);
  }
  id v15 = [(HDClinicalAccountManager *)self profile];
  id v38 = [v15 database];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v80 = sub_33CE4;
  v81 = sub_33CF4;
  id v82 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = sub_33CE4;
  v69 = sub_33CF4;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = sub_33CE4;
  v63 = sub_33CF4;
  id v64 = 0;
  id v58 = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_34950;
  v51[3] = &unk_112DA8;
  v52 = v8;
  id v53 = v9;
  v54 = self;
  v55 = &v59;
  v56 = &v65;
  v16 = v15;
  v57 = buf;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_34D54;
  v47[3] = &unk_112490;
  id v17 = v53;
  id v48 = v17;
  v18 = v52;
  v49 = v18;
  id v19 = v38;
  id v50 = v19;
  unsigned __int8 v20 = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v19 error:&v58 block:v51 inaccessibilityHandler:v47];
  id v21 = v58;
  if (v20)
  {
    if (*(void *)(*(void *)&buf[8] + 40) && v60[5])
    {
      _HKInitializeLogging();
      id v22 = HKLogHealthRecords;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = [(HDClinicalAccountManager *)self debugDescription];
        HKSensitiveLogItem();
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = [(id)v60[5] pkceVerifier];
        uint64_t v25 = HKStringFromBool();
        *(_DWORD *)v71 = 138543874;
        v72 = v39;
        __int16 v73 = 2114;
        id v74 = v23;
        __int16 v75 = 2114;
        id v37 = (void *)v25;
        uint64_t v76 = v25;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ exchanging code %{public}@ for tokens, using PKCE: %{public}@", v71, 0x20u);
      }
      uint64_t v26 = v60[5];
      uint64_t v27 = v66[5];
      uint64_t v28 = *(void *)(*(void *)&buf[8] + 40);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_34DB4;
      v40[3] = &unk_112DD0;
      v44 = &v65;
      v40[4] = self;
      v45 = buf;
      v46 = &v59;
      id v41 = v16;
      v42 = v18;
      id v43 = v10;
      [(HDClinicalAccountManager *)self _fetchAccessTokenForTokenSession:v26 existingAccount:v27 gateway:v28 completion:v40];
    }
    else {
      uint64_t v31 = {;
    }

      _HKInitializeLogging();
      id v32 = HKLogHealthRecords;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = [(HDClinicalAccountManager *)self debugDescription];
        sub_AD824(v33, v31, v71, v32);
      }

      id v34 = +[HKClinicalAccountLoginCompletionState completionStateWithError:v31];
      (*((void (**)(id, void *))v10 + 2))(v10, v34);

      id v21 = (id)v31;
    }
  }
  else
  {
    _HKInitializeLogging();
    v29 = HKLogHealthRecords;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v35 = [(HDClinicalAccountManager *)self debugDescription];
      __int16 v36 = HKSensitiveLogItem();
      *(_DWORD *)v71 = 138544130;
      v72 = v35;
      __int16 v73 = 2112;
      id v74 = v36;
      __int16 v75 = 2114;
      uint64_t v76 = (uint64_t)v18;
      __int16 v77 = 2114;
      id v78 = v21;
      _os_log_error_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "%{public}@ failed to end login session with code %@ and state %{public}@: %{public}@", v71, 0x2Au);
    }
    v30 = +[HKClinicalAccountLoginCompletionState completionStateWithError:v21];
    (*((void (**)(id, void *))v10 + 2))(v10, v30);
  }
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(buf, 8);
}

- (void)pruneAuthenticationDataWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, id, id))a3;
  v5 = [(HDClinicalAccountManager *)self profile];
  id v6 = [v5 database];
  id v9 = 0;
  id v7 = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v6 error:&v9 block:&stru_112E10];
  id v8 = v9;
  v4[2](v4, v7, v8);
}

- (void)_fetchAccessTokenForTokenSession:(id)a3 existingAccount:(id)a4 gateway:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v11 identifier];
  id v15 = v14;
  if (!v14)
  {
    id v15 = +[NSUUID UUID];
  }
  id v29 = 0;
  v16 = [v12 connectionInformationWithAccountIdentifier:v15 credential:0 error:&v29];
  id v17 = v29;
  if (!v14) {

  }
  if (v16)
  {
    id v28 = v17;
    v18 = +[HDFHIRSpecification specificationWithConnectionInformation:v16 error:&v28];
    id v19 = v28;

    if (v18)
    {
      unsigned __int8 v20 = [[HDFHIRSession alloc] initWithSpecification:v18];
      id v21 = [HDFHIRAccessTokenTask alloc];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_35678;
      v23[3] = &unk_112E38;
      v23[4] = self;
      id v24 = v12;
      id v27 = v13;
      id v25 = v11;
      id v26 = v10;
      id v22 = [(HDFHIRAccessTokenTask *)v21 initWithTokenSession:v26 FHIRSession:v20 completion:v23];
      [(HDFHIRRequestTask *)v22 resume];
    }
    else
    {
      (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v19);
    }
  }
  else
  {
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v17);
    id v19 = v17;
  }
}

- (id)persistEphemeralAccount:(id)a3 triggerIngestion:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_33CE4;
  id v28 = sub_33CF4;
  id v29 = 0;
  id v10 = [WeakRetained database];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_35BC0;
  id v19 = &unk_112E60;
  unsigned __int8 v20 = self;
  id v11 = v8;
  id v21 = v11;
  id v12 = WeakRetained;
  id v22 = v12;
  id v23 = &v24;
  LOBYTE(a5) = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v10 error:a5 block:&v16];

  if (a5)
  {
    if (v6)
    {
      id v13 = objc_msgSend((id)v25[5], "identifier", v16, v17, v18, v19, v20, v21);
      [(HDClinicalAccountManager *)self _performIngestionForNewCredentialsWithReason:@"account added" accountIdentifier:v13];
    }
    [(HDClinicalAccountManager *)self _requestChangesCloudSyncForProfile:v12, @"new CHR account inserted", v16, v17, v18, v19, v20 reason];
    id v14 = (id)v25[5];
  }
  else
  {
    id v14 = 0;
  }

  _Block_object_dispose(&v24, 8);

  return v14;
}

- (BOOL)_createOrUpdateCredentialFromAuthResponse:(id)a3 account:(id)a4 requestedScope:(id)a5 event:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [(HDClinicalAccountManager *)self profile];
  uint64_t v17 = [v16 database];

  [v13 identifier];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_3609C;
  v25[3] = &unk_112E88;
  id v26 = v13;
  id v27 = v12;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  id v29 = v14;
  v30 = self;
  id v31 = v17;
  id v32 = v15;
  id v18 = v15;
  id v19 = v17;
  id v20 = v14;
  id v21 = v28;
  id v22 = v12;
  id v23 = v13;
  LOBYTE(a7) = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v19 error:a7 block:v25];

  return (char)a7;
}

- (id)_savePatientMismatchedCredentialFromAuthResponse:(id)a3 requestedScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 createCredentialWithIdentifier:0 requestedScope:v9 error:a5];
  if (v10)
  {
    uint64_t v11 = [(HDClinicalAccountManager *)self profile];
    id v12 = [(id)v11 database];

    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = sub_33CE4;
    id v29 = sub_33CF4;
    id v30 = 0;
    id v24 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_3648C;
    v20[3] = &unk_112EB0;
    id v21 = v10;
    id v22 = self;
    id v23 = &v25;
    LOBYTE(v11) = +[HDFHIRCredentialEntity performWriteTransactionWithHealthDatabase:v12 error:&v24 block:v20];
    id v13 = v24;
    id v14 = v13;
    if (v11)
    {
      id v15 = (void *)v26[5];
    }
    else
    {
      id v17 = v13;
      id v18 = v17;
      if (v17)
      {
        if (a5) {
          *a5 = v17;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v15 = 0;
    }
    id v16 = v15;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)_newAccountIdentifierAfterReplacingAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HDClinicalAccountManager *)self profile];
  id v10 = [v9 database];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_33CE4;
  id v30 = sub_33CF4;
  id v31 = 0;
  id v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_3670C;
  v19[3] = &unk_112ED8;
  id v11 = v7;
  id v20 = v11;
  id v21 = self;
  id v12 = v9;
  id v22 = v12;
  id v13 = v8;
  id v23 = v13;
  id v24 = &v26;
  unsigned int v14 = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v10 error:&v25 block:v19];
  id v15 = v25;
  if (v14) {
    id v16 = (void *)v27[5];
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  _Block_object_dispose(&v26, 8);
  return v17;
}

- (void)replaceAccountWithNewAccountForAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, void))a5;
  id v11 = 0;
  id v9 = [(HDClinicalAccountManager *)self _newAccountIdentifierAfterReplacingAccountWithIdentifier:a3 usingCredentialWithPersistentID:a4 error:&v11];
  id v10 = v11;
  if (v9)
  {
    [(HDClinicalAccountManager *)self _performIngestionForNewCredentialsWithReason:@"account replacement" accountIdentifier:v9];
    v8[2](v8, 1, 0);
  }
  else
  {
    ((void (**)(id, uint64_t, id))v8)[2](v8, 0, v10);
  }
}

- (id)allAccountsWithError:(id *)a3
{
  objc_super v4 = [(HDClinicalAccountManager *)self profile];
  v5 = [v4 database];
  BOOL v6 = +[HDClinicalAccountEntity allAccountsInHealthDatabase:v5 error:a3];

  return v6;
}

- (int64_t)hasGatewayBackedAccountsWithTransaction:(id)a3 error:(id *)a4
{
  v5 = [(HDClinicalAccountManager *)self profile];
  BOOL v6 = [v5 database];
  int64_t v7 = +[HDClinicalAccountEntity hasGatewayBackedAccountsInHealthDatabase:v6 error:a4];

  return v7;
}

- (int64_t)hasIssuerBackedAccountsWithTransaction:(id)a3 error:(id *)a4
{
  v5 = [(HDClinicalAccountManager *)self profile];
  BOOL v6 = [v5 database];
  int64_t v7 = +[HDClinicalAccountEntity hasIssuerBackedAccountsInHealthDatabase:v6 error:a4];

  return v7;
}

- (int64_t)highPriorityTransactionHasGatewayBackedAccountsWithError:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5 = [(HDClinicalAccountManager *)self profile];
  BOOL v6 = [v5 database];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_36C80;
  v9[3] = &unk_112708;
  v9[4] = self;
  v9[5] = &v10;
  LODWORD(a3) = [v6 performHighPriorityTransactionsWithError:a3 block:v9];

  if (a3) {
    int64_t v7 = v11[3];
  }
  else {
    int64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (int64_t)highPriorityTransactionHasIssuerBackedAccountsWithError:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 2;
  v5 = [(HDClinicalAccountManager *)self profile];
  BOOL v6 = [v5 database];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_36E18;
  v9[3] = &unk_112708;
  v9[4] = self;
  v9[5] = &v10;
  LODWORD(a3) = [v6 performHighPriorityTransactionsWithError:a3 block:v9];

  if (a3) {
    int64_t v7 = v11[3];
  }
  else {
    int64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (int64_t)deviceConfigurationSupportsClinicalSharingWithError:(id *)a3
{
  v5 = +[NSLocale hk_testableCurrentLocale];
  unsigned __int8 v6 = [(HDClinicalAccountManager *)self _isClinicalSharingSupportedLocale:v5];

  if (v6) {
    return 1;
  }

  return [(HDClinicalAccountManager *)self _highPriorityTransactionHasClinicalSharingEnabledAccountWithError:a3];
}

- (BOOL)_isClinicalSharingSupportedLocale:(id)a3
{
  v3 = [a3 countryCode];
  unsigned __int8 v4 = [v3 isEqualToString:@"US"];

  return v4;
}

- (int64_t)_highPriorityTransactionHasClinicalSharingEnabledAccountWithError:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5 = [(HDClinicalAccountManager *)self profile];
  unsigned __int8 v6 = [v5 database];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_37074;
  v9[3] = &unk_112708;
  v9[4] = self;
  v9[5] = &v10;
  LODWORD(a3) = [v6 performHighPriorityTransactionsWithError:a3 block:v9];

  if (a3) {
    int64_t v7 = v11[3];
  }
  else {
    int64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (int64_t)_hasClinicalSharingEnabledAccountWithError:(id *)a3
{
  v3 = [(HDClinicalAccountManager *)self allAccountsWithError:a3];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hk_firstObjectPassingTest:", &stru_112F18);

    if (v5) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)accountsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(HDClinicalAccountManager *)self profile];
  id v8 = +[HDClinicalAccountEntity accountsWithIdentifiers:v6 profile:v7 error:a4];

  return v8;
}

- (id)accountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(HDClinicalAccountManager *)self profile];
  id v8 = [v7 database];
  id v9 = +[HDClinicalAccountEntity accountWithIdentifier:v6 healthDatabase:v8 error:a4];

  return v9;
}

- (id)userFetchEligibleAccountsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(HDClinicalAccountManager *)self profile];
  id v8 = +[HDClinicalAccountEntity userFetchEligibleAccountsWithIdentifiers:v6 profile:v7 error:a4];

  return v8;
}

- (id)fetchableAccountsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(HDClinicalAccountManager *)self profile];
  id v8 = +[HDClinicalAccountEntity fetchableAccountsWithIdentifiers:v6 profile:v7 error:a4];

  return v8;
}

- (id)accountsForGatewaysWithExternalIDs:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(HDClinicalAccountManager *)self profile];
  id v8 = [v7 database];
  id v9 = +[HDClinicalAccountEntity accountsForGatewayExternalIDs:v6 healthDatabase:v8 error:a4];

  return v9;
}

- (id)accountForSource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 _isClinicalSource])
  {
    int64_t v7 = [v6 _deducedClinicalAccountIdentifier];
    if (v7)
    {
      id v8 = [(HDClinicalAccountManager *)self profile];
      id v9 = [v8 database];
      uint64_t v10 = +[HDClinicalAccountEntity accountWithIdentifier:v7 healthDatabase:v9 error:a4];
    }
    else
    {
      +[NSError hk_assignError:a4, 3, @"Source does not represent a clinical account: %@", v6 code format];
      uint64_t v10 = 0;
    }
  }
  else
  {
    +[NSError hk_assignError:a4, 3, @"Source is not a clinical source: %@", v6 code format];
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)credentialedSessionForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [v6 credential];
  id v8 = [v6 connectionInformationWithCredential:v7 error:a4];

  if (v8)
  {
    id v9 = +[HDFHIRSpecification specificationWithConnectionInformation:v8 error:a4];
    if (v9)
    {
      uint64_t v10 = [(HDClinicalAccountManager *)self _createCredentialVendorForAccount:v6 error:a4];
      if (v10) {
        id v11 = [[HDFHIRCredentialedSession alloc] initWithSpecification:v9 credentialVendor:v10];
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_setAccountWithIdentifierNeedsRelogin:(id)a3 event:(id)a4 error:(id *)a5
{
  return [(HDClinicalAccountManager *)self _updateCredentialStateForAccountWithIdentifier:a3 state:1 event:a4 error:a5];
}

- (BOOL)_updateCredentialStateForAccountWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [(HDClinicalAccountManager *)self profile];
  uint64_t v13 = [v12 database];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a6) = +[HDClinicalAccountEntity updateAccountCredentialState:a4 identifier:v11 profile:WeakRetained healthDatabase:v13 event:v10 error:a6];

  return (char)a6;
}

- (BOOL)_deleteAccountWithSyncIdentifier:(id)a3 deletionReason:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [(HDClinicalAccountManager *)self profile];
  uint64_t v13 = [v11 protectedDatabase];
  unsigned int v14 = +[NSDate date];
  id v15 = +[NSString stringWithFormat:@"Failed to delete account with sync identifier %@", v10];
  id v60 = 0;
  unsigned __int8 v16 = +[HDClinicalDeletedAccountEntity insertTombstoneWithSyncIdentifierIfNotExists:v10 deletionDate:v14 deletionReason:0 profile:v12 transaction:v11 error:&v60];

  id v17 = v60;
  if (v16)
  {
    v54 = a6;
    id v59 = 0;
    id v18 = +[HDClinicalAccountEntity accountEntityWithSyncIdentifier:v10 database:v13 error:&v59];
    v55 = v18;
    id v56 = v59;
    if (v56)
    {
      _HKInitializeLogging();
      id v19 = (void *)HKLogHealthRecords;
      id v20 = v56;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        v40 = v19;
        id v41 = [(HDClinicalAccountManager *)self debugDescription];
        *(_DWORD *)buf = 138543874;
        v62 = v41;
        __int16 v63 = 2114;
        id v64 = v10;
        __int16 v65 = 2114;
        id v66 = v56;
        _os_log_error_impl(&dword_0, v40, OS_LOG_TYPE_ERROR, "%{public}@ unable to delete account with sync identifier %{public}@, failed to retrieve entity for account: %{public}@", buf, 0x20u);
      }
      +[NSError hk_assignError:v54 code:100 description:v15 underlyingError:v56];
      BOOL v21 = 0;
    }
    else if (v18)
    {
      id v53 = v17;
      id v23 = [v18 identifierInDatabase:v13];
      if (v23)
      {
        v52 = v13;
        id v24 = objc_alloc((Class)HKSharingRecipientIdentifier);
        id v25 = [v23 UUIDString];
        id v26 = [v24 initForClinicalAccountIdentifier:v25];

        uint64_t v27 = [v12 sharingAuthorizationManager];
        id v58 = 0;
        v51 = v26;
        LOBYTE(v26) = [v27 revokeRecipientWithIdentifier:v26 error:&v58];
        id v50 = v58;

        if (v26)
        {
          id v57 = 0;
          v49 = v23;
          BOOL v21 = +[HDClinicalAccountEntity deleteAccountWithIdentifier:v23 deletionReason:a4 deleteGateway:0 deleteIssuer:1 profile:v12 error:&v57];
          id v28 = v57;
          _HKInitializeLogging();
          id v48 = v28;
          if (v21)
          {
            id v29 = (void *)HKLogHealthRecords;
            uint64_t v13 = v52;
            id v20 = 0;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = v29;
              id v31 = [(HDClinicalAccountManager *)self debugDescription];
              id v32 = NSStringFromHKClinicalAccountDeletionReason();
              *(_DWORD *)buf = 138544130;
              v62 = v31;
              __int16 v63 = 2114;
              id v64 = v49;
              __int16 v65 = 2114;
              id v66 = v10;
              __int16 v67 = 2114;
              id v68 = v32;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully deleted account %{public}@, sync identifier %{public}@, with reason: %{public}@", buf, 0x2Au);

              id v20 = 0;
              uint64_t v13 = v52;
            }
          }
          else
          {
            v42 = (void *)HKLogHealthRecords;
            uint64_t v13 = v52;
            id v20 = 0;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              v46 = v42;
              v47 = [(HDClinicalAccountManager *)self debugDescription];
              *(_DWORD *)buf = 138544130;
              v62 = v47;
              __int16 v63 = 2114;
              id v64 = v49;
              __int16 v65 = 2114;
              id v66 = v10;
              __int16 v67 = 2114;
              id v68 = v28;
              _os_log_error_impl(&dword_0, v46, OS_LOG_TYPE_ERROR, "%{public}@ unable to delete account %{public}@, sync identifier %{public}@, clinical account entity deletion failed: %{public}@", buf, 0x2Au);

              uint64_t v13 = v52;
            }
            +[NSError hk_assignError:v54 code:100 description:v15 underlyingError:v28];
          }

          id v23 = v49;
          id v37 = v50;
        }
        else
        {
          _HKInitializeLogging();
          __int16 v36 = (void *)HKLogHealthRecords;
          id v37 = v50;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v44 = v36;
            v45 = [(HDClinicalAccountManager *)self debugDescription];
            *(_DWORD *)buf = 138544130;
            v62 = v45;
            __int16 v63 = 2114;
            id v64 = v23;
            __int16 v65 = 2114;
            id v66 = v10;
            __int16 v67 = 2114;
            id v68 = v50;
            _os_log_error_impl(&dword_0, v44, OS_LOG_TYPE_ERROR, "%{public}@ unable to delete account %{public}@, sync identifier %{public}@, revoking sharing authorization failed: %{public}@", buf, 0x2Au);
          }
          +[NSError hk_assignError:a6 code:100 description:v15 underlyingError:v50];
          BOOL v21 = 0;
          uint64_t v13 = v52;
          id v20 = 0;
        }
      }
      else
      {
        _HKInitializeLogging();
        id v20 = 0;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_ADAEC();
        }
        +[NSError hk_assignError:v54, 100, @"Failed to retrieve identifier for account with sync identifier %@", v10 code format];
        BOOL v21 = 0;
      }

      id v17 = v53;
    }
    else
    {
      _HKInitializeLogging();
      __int16 v33 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = v33;
        v35 = [(HDClinicalAccountManager *)self debugDescription];
        *(_DWORD *)buf = 138543618;
        v62 = v35;
        __int16 v63 = 2114;
        id v64 = v10;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ asked to delete account with sync identifier %{public}@, but no such account found.", buf, 0x16u);
      }
      BOOL v21 = 1;
      id v20 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v22 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      id v38 = v22;
      id v39 = [(HDClinicalAccountManager *)self debugDescription];
      *(_DWORD *)buf = 138543874;
      v62 = v39;
      __int16 v63 = 2114;
      id v64 = v10;
      __int16 v65 = 2114;
      id v66 = v17;
      _os_log_error_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, "%{public}@ unable to delete account with sync identifier %{public}@, failed to insert tombstone: %{public}@", buf, 0x20u);
    }
    +[NSError hk_assignError:a6 code:100 description:v15 underlyingError:v17];
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  _HKInitializeLogging();
  id v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = objc_opt_class();
    id v12 = v11;
    uint64_t v13 = NSStringFromHKClinicalAccountDeletionReason();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v35 = v13;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to delete account %{public}@ with reason: %{public}@", buf, 0x20u);
  }
  unsigned int v14 = [(HDClinicalAccountManager *)self profile];
  id v15 = [v14 database];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v35) = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_38164;
  v29[3] = &unk_112F80;
  id v30 = v8;
  id v31 = self;
  id v32 = buf;
  int64_t v33 = a4;
  BOOL v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_382A0;
  id v24 = &unk_112FA8;
  uint64_t v27 = buf;
  id v16 = v30;
  id v25 = v16;
  int64_t v28 = a4;
  id v17 = v15;
  id v26 = v17;
  unsigned int v18 = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v17 error:a5 block:v29 inaccessibilityHandler:&v21];
  if (v18 && *(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v19 = [(HDClinicalAccountManager *)self profile];
    [(HDClinicalAccountManager *)self _requestChangesCloudSyncForProfile:v19 reason:@"CHR account deleted"];
  }
  _Block_object_dispose(buf, 8);

  return v18;
}

- (BOOL)deleteAccountWithSyncIdentifier:(id)a3 deletionReason:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  _HKInitializeLogging();
  id v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = objc_opt_class();
    id v12 = v11;
    uint64_t v13 = NSStringFromHKClinicalAccountDeletionReason();
    *(_DWORD *)buf = 138543874;
    int64_t v28 = v11;
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v13;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to delete account with sync identifier %{public}@ with reason: %{public}@", buf, 0x20u);
  }
  unsigned int v14 = [(HDClinicalAccountManager *)self profile];
  id v15 = [v14 database];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_3854C;
  v24[3] = &unk_1125D8;
  v24[4] = self;
  id v25 = v8;
  int64_t v26 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_38564;
  v20[3] = &unk_112900;
  id v22 = v15;
  int64_t v23 = a4;
  id v21 = v25;
  id v16 = v15;
  id v17 = v25;
  unsigned __int8 v18 = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v16 error:a5 block:v24 inaccessibilityHandler:v20];

  return v18;
}

- (void)didCompleteFetchForAccount:(id)a3 wasFullFetch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = +[NSDate date];
  if (v4) {
    [v6 lastFullFetchDate];
  }
  else {
  id v8 = [v6 lastFetchDate];
  }
  id v9 = [(HDClinicalAccountManager *)self profile];
  id v10 = [v9 database];

  id v11 = [v6 identifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v26 = 0;
  unsigned int v13 = +[HDClinicalAccountEntity updateAccountLastFetchDate:v7 wasFullFetch:v4 identifier:v11 profile:WeakRetained healthDatabase:v10 error:&v26];
  id v14 = v26;

  _HKInitializeLogging();
  id v15 = (void *)HKLogHealthRecords;
  if (v13)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      log = v15;
      uint64_t v16 = [v6 identifier];
      uint64_t v17 = v16;
      unsigned __int8 v18 = "";
      if (v4) {
        unsigned __int8 v18 = "Full";
      }
      id v24 = (void *)v16;
      id v19 = objc_msgSend(v8, "hk_truncateToDay", v18);
      id v20 = HDDiagnosticStringFromDate();
      id v21 = objc_msgSend(v7, "hk_truncateToDay");
      id v22 = HDDiagnosticStringFromDate();
      *(_DWORD *)buf = 138544130;
      uint64_t v28 = v17;
      __int16 v29 = 2080;
      uint64_t v30 = v23;
      __int16 v31 = 2114;
      id v32 = v20;
      __int16 v33 = 2114;
      id v34 = v22;
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_ADB84();
  }
}

- (void)failedToCompleteFetchForAccount:(id)a3 mustLimitFutureRequests:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = +[NSDate date];
  if (v4)
  {
    id v8 = +[HDClinicalAccount numFailedAttemptsToReachMaxBlockTime];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(HDClinicalAccountManager *)self profile];
  id v10 = [v9 database];

  id v11 = [v6 identifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v23 = 0;
  unsigned int v13 = +[HDClinicalAccountEntity updateAccountLastFailedFetchDate:v7 overrideFailedAttemptsCount:v8 identifier:v11 profile:WeakRetained healthDatabase:v10 error:&v23];
  id v14 = v23;

  _HKInitializeLogging();
  id v15 = (void *)HKLogHealthRecords;
  if (v13)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      log = v15;
      id v20 = [v6 identifier];
      id v22 = [v6 lastFailedFetchDate];
      uint64_t v16 = objc_msgSend(v22, "hk_truncateToDay");
      uint64_t v17 = HDDiagnosticStringFromDate();
      unsigned __int8 v18 = objc_msgSend(v7, "hk_truncateToDay");
      id v19 = HDDiagnosticStringFromDate();
      *(_DWORD *)buf = 138543874;
      id v25 = v20;
      __int16 v26 = 2114;
      uint64_t v27 = v17;
      __int16 v28 = 2114;
      __int16 v29 = v19;
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_ADC1C();
  }
}

- (void)resetLastExtractedRowIDWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v7 = [WeakRetained database];
  id v36 = 0;
  id v8 = +[HDClinicalAccountEntity allAccountsInHealthDatabase:v7 error:&v36];
  id v9 = v36;

  if (!v8)
  {
    _HKInitializeLogging();
    id v24 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "No accounts for which to reset extracted row IDs", buf, 2u);
    }
    v4[2](v4, 0, v9);
    goto LABEL_24;
  }
  __int16 v26 = v4;

  id v10 = objc_loadWeakRetained((id *)p_profile);
  __int16 v29 = [v10 database];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v8;
  id v30 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (!v30)
  {

    goto LABEL_22;
  }
  id v25 = v8;
  id v9 = 0;
  uint64_t v28 = *(void *)v33;
  id obj = v11;
  do
  {
    id v12 = 0;
    do
    {
      unsigned int v13 = v9;
      if (*(void *)v33 != v28) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v12);
      id v15 = objc_msgSend(v14, "lastExtractedRulesVersion", v25);
      uint64_t v16 = [v14 identifier];
      uint64_t v17 = p_profile;
      id v18 = objc_loadWeakRetained((id *)p_profile);
      id v31 = v9;
      unsigned __int8 v19 = +[HDClinicalAccountEntity updateAccountLastExtractedRowID:0 rulesVersion:v15 identifier:v16 profile:v18 healthDatabase:v29 error:&v31];
      id v9 = v31;

      _HKInitializeLogging();
      id v20 = (void *)HKLogHealthRecords;
      if (v19)
      {
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        id v21 = v20;
        id v22 = [v14 identifier];
        *(_DWORD *)buf = 138543362;
        id v38 = v22;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Did reset last extracted row ID on account %{public}@", buf, 0xCu);
        goto LABEL_10;
      }
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        id v21 = v20;
        id v22 = [v14 identifier];
        *(_DWORD *)buf = 138543618;
        id v38 = v22;
        __int16 v39 = 2114;
        id v40 = v9;
        _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Unable to reset last extracted row ID for account %{public}@: %{public}@", buf, 0x16u);
LABEL_10:
      }
LABEL_12:
      id v12 = (char *)v12 + 1;
      p_profile = v17;
    }
    while (v30 != v12);
    id v23 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    id v30 = v23;
  }
  while (v23);

  id v8 = v25;
  if (v9)
  {
    BOOL v4 = v26;
    v26[2](v26, 0, v9);
    goto LABEL_23;
  }
LABEL_22:
  BOOL v4 = v26;
  v26[2](v26, 1, 0);
  id v9 = 0;
LABEL_23:

LABEL_24:
}

- (BOOL)updateCredentialStateForAccount:(id)a3 state:(int64_t)a4 event:(id)a5 error:(id *)a6
{
  return [(HDClinicalAccountManager *)self updateCredentialStateForAccount:a3 state:a4 force:0 event:a5 error:a6];
}

- (BOOL)updateCredentialStateForAccount:(id)a3 state:(int64_t)a4 force:(BOOL)a5 event:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  if (!a5 && (id v14 = (char *)[v12 credentialState], a4 == 2) && v14 == (unsigned char *)&dword_0 + 1)
  {
    id v15 = [v12 identifier];
    id v16 = +[NSError hk_error:3, @"Attempted to mark account %@ as needing scope upgrade when it already needs relogin", v15 format];
    if (v16)
    {
      if (a7) {
        *a7 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    id v21 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_ADCB4((uint64_t *)a7, v21);
    }
    unsigned __int8 v20 = 0;
  }
  else
  {
    uint64_t v17 = [(HDClinicalAccountManager *)self profile];
    id v18 = [v17 database];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_390D0;
    v26[3] = &unk_112FD0;
    id v27 = v12;
    int64_t v30 = a4;
    id v28 = v17;
    id v29 = v13;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_3922C;
    v23[3] = &unk_112FF8;
    id v24 = v29;
    id v25 = v28;
    id v19 = v28;
    unsigned __int8 v20 = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v18 error:a7 block:v26 inaccessibilityHandler:v23];
  }
  return v20;
}

- (BOOL)updateClinicalSharingStatusForAccountWithIdentifier:(id)a3 firstSharedDate:(id)a4 lastSharedDate:(id)a5 userStatus:(id)a6 multiDeviceStatus:(id)a7 primaryDeviceName:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [(HDClinicalAccountManager *)self profile];
  id v22 = [v21 database];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_394C4;
  v30[3] = &unk_112E88;
  id v31 = v15;
  long long v32 = self;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v20;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v15;
  LOBYTE(self) = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v22 error:a9 block:v30];

  return (char)self;
}

- (id)_createCredentialVendorForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [v6 credential];
  if (v7)
  {
    id v8 = [[HDFHIRCredentialVendor alloc] initWithCredential:v7];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_396A0;
    v10[3] = &unk_113020;
    v10[4] = self;
    id v11 = v6;
    [(HDFHIRCredentialVendor *)v8 setCredentialResultDidUpdateHandler:v10];
  }
  else
  {
    +[NSError hk_assignError:a4 code:3 format:@"Missing credential"];
    id v8 = 0;
  }

  return v8;
}

- (void)didRefreshCredentialForAccount:(id)a3 credentialVendor:(id)a4 refreshResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v17 = 0;
  id v10 = [(HDClinicalAccountManager *)self didRefreshCredentialForAccount:v8 refreshResult:a5 error:&v17];
  id v11 = v17;
  if (v10)
  {
    id v12 = [v9 currentResult];
    [v12 didRefreshCredential:v10];
  }
  else
  {
    _HKInitializeLogging();
    id v13 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      id v14 = v13;
      id v15 = [(HDClinicalAccountManager *)self debugDescription];
      id v16 = [v8 identifier];
      *(_DWORD *)buf = 138543874;
      id v19 = v15;
      __int16 v20 = 2114;
      id v21 = v16;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "%{public}@ failed to update credential for account %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

- (id)didRefreshCredentialForAccount:(id)a3 refreshResult:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HDClinicalAccountManager *)self profile];
  __int16 v65 = [v10 database];

  id v11 = [v8 identifier];
  id v12 = objc_alloc((Class)HKClinicalAccountEvent);
  id v13 = [v8 identifier];
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "-[HDClinicalAccountManager didRefreshCredentialForAccount:refreshResult:error:]", 1219, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Managers/HDClinicalAccountManager.m");
  id v15 = +[NSDate date];
  id v16 = [v12 initWithAccountIdentifier:v13 type:1 caller:v14 timestamp:v15 eventDescription:@"Updating existing account credential state from auth response in credentialed session"];

  id v17 = [v9 endStates];
  id v18 = [v17 eventLoggingDescription];
  id v19 = [v16 eventWithAppendedEventDescription:v18];

  __int16 v20 = [v9 credential];
  id v21 = [v20 refreshToken];
  __int16 v22 = [v19 eventWithAppendedRefreshToken:v21 description:@"Refresh token used for request."];

  id v23 = [v9 authResponse];

  if (v23)
  {
    id v24 = [v9 authResponse];
    id v25 = [v24 descriptionForAccountEvent];
    uint64_t v26 = [v22 eventWithAppendedEventDescription:v25];

    __int16 v22 = (void *)v26;
  }
  id v27 = [v9 endStates];
  id v28 = [v8 gateway];
  [(HDClinicalAccountManager *)self _accumulateMetricsFromTaskEndStates:v27 gateway:v28];

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_3A038;
  v71[3] = &unk_113048;
  uint8_t v71[4] = self;
  id v29 = v11;
  id v72 = v29;
  id v30 = v22;
  id v73 = v30;
  id v31 = objc_retainBlock(v71);
  long long v32 = [v9 authResponse];

  if (v32)
  {
    id v64 = (void (**)(void, id))v31;
    _HKInitializeLogging();
    id v33 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = v33;
      id v35 = [(HDClinicalAccountManager *)self debugDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v75 = v35;
      __int16 v76 = 2114;
      id v77 = v29;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ did change credential for account %{public}@", buf, 0x16u);
    }
    uint64_t v61 = a5;
    id v36 = [v8 credential];

    if (v36)
    {
      id v59 = [v9 authResponse];
      id v37 = [v9 credential];
      id v38 = [v37 requestedScopeString];
      id v62 = v8;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      [v30 eventWithAppendedEventDescription:@"update credential"];
      id v41 = v40 = v30;
      id v69 = 0;
      id v70 = 0;
      unsigned __int8 v42 = +[HDClinicalAccountEntity updateAccountCredentialFromAuthResponse:v59 accountIdentifier:v29 requestedScope:v38 profile:WeakRetained healthDatabase:v65 event:v41 updatedCredential:&v70 error:&v69];
      id v43 = v70;
      id v44 = v69;

      id v30 = v40;
      id v8 = v62;

      if ((v42 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else
    {
      id v48 = [v8 gateway];
      id v68 = 0;
      v49 = [v48 authScopeWithError:&v68];
      id v44 = v68;

      if (!v49)
      {
        _HKInitializeLogging();
        id v56 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          sub_ADDC0((uint64_t)v29, (uint64_t)v44, v56);
        }
        id v43 = 0;
        goto LABEL_22;
      }
      id v50 = [v9 authResponse];
      id v51 = objc_loadWeakRetained((id *)&self->_profile);
      [v30 eventWithAppendedEventDescription:@"create credential"];
      v52 = id v60 = v30;
      id v66 = v44;
      id v67 = 0;
      id v63 = v8;
      id v53 = v29;
      unsigned __int8 v54 = +[HDClinicalAccountEntity createAccountCredentialFromAuthResponse:v50 accountIdentifier:v29 requestedScope:v49 profile:v51 healthDatabase:v65 event:v52 createdCredential:&v67 error:&v66];
      id v43 = v67;
      id v55 = v66;

      id v30 = v60;
      id v44 = v55;
      id v29 = v53;
      id v8 = v63;
      if ((v54 & 1) == 0)
      {
LABEL_22:
        id v31 = v64;
        v64[2](v64, v44);
        id v57 = v44;
        id v44 = v57;
        if (v57)
        {
          if (v61) {
            *uint64_t v61 = v57;
          }
          else {
            _HKLogDroppedError();
          }
        }

        v47 = 0;
        goto LABEL_27;
      }
    }
    id v43 = v43;
    v47 = v43;
    id v31 = v64;
    goto LABEL_27;
  }
  v45 = [v9 error];
  if (objc_msgSend(v45, "hrs_isReloginRequiredError")) {
    ((void (*)(void *, void *))v31[2])(v31, v45);
  }
  id v46 = v45;
  id v43 = v46;
  if (v46)
  {
    if (a5)
    {
      id v43 = v46;
      v47 = 0;
      *a5 = v43;
      id v44 = v43;
      goto LABEL_27;
    }
    _HKLogDroppedError();
  }
  v47 = 0;
  id v44 = v43;
LABEL_27:

  return v47;
}

- (void)removeAccountStateObserver:(id)a3
{
}

- (void)_accountDidChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 userInfo];
    int64_t v7 = [v6 objectForKeyedSubscript:@"changeType"];

    if (v7) {
      id v8 = [v7 integerValue];
    }
    else {
      id v8 = 0;
    }
    [(HDClinicalAccountManager *)self _accountDidChange:v5 changeType:v8];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_ADEA8();
    }
  }
}

- (void)_accountDidChange:(id)a3 changeType:(int64_t)a4
{
  id v6 = a3;
  _HKInitializeLogging();
  int64_t v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    id v8 = v7;
    id v9 = [(HDClinicalAccountManager *)self debugDescription];
    id v10 = [v6 identifier];
    id v11 = NSStringFromAccountStateChangeType();
    int v12 = 138543874;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "%{public}@ account with identifier %{public}@ did change state: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  [(HDClinicalAccountManager *)self _messageObserversAboutAccount:v6 changeType:a4];
}

- (void)_messageObserversAboutAccount:(id)a3 changeType:(int64_t)a4
{
  id v6 = a3;
  stateChangeObservers = self->_stateChangeObservers;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3A3CC;
  v9[3] = &unk_113070;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [(HKSynchronousObserverSet *)stateChangeObservers notifyObservers:v9];
}

- (id)allEventsForAccountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(HDClinicalAccountManager *)self profile];
  id v8 = +[HDClinicalAccountEventEntity fetchEventsForAccountWithIdentifier:v6 profile:v7 error:a4];

  return v8;
}

- (BOOL)invalidateCredentialForAccountWithIdentifier:(id)a3 event:(id)a4 error:(id *)a5
{
  return [(HDClinicalAccountManager *)self _updateCredentialStateForAccountWithIdentifier:a3 state:1 event:a4 error:a5];
}

- (BOOL)updateCredentialStateForAccountWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 error:(id *)a6
{
  return [(HDClinicalAccountManager *)self _updateCredentialStateForAccountWithIdentifier:a3 state:a4 event:a5 error:a6];
}

- (id)createStaticDSTU2AccountWithTitle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = +[HKFHIRVersion primaryDSTU2Version];
  id v8 = [(HDClinicalAccountManager *)self createStaticAccountWithTitle:v6 subtitle:0 description:0 countryCode:0 fhirVersion:v7 onlyIfNeededForSimulatedGatewayID:0 error:a4];

  return v8;
}

- (id)createStaticAccountWithTitle:(id)a3 subtitle:(id)a4 description:(id)a5 countryCode:(id)a6 fhirVersion:(id)a7 onlyIfNeededForSimulatedGatewayID:(id)a8 error:(id *)a9
{
  id v37 = a3;
  id v38 = a4;
  id v39 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = v17;
  if (v17)
  {
    id v56 = v17;
    id v19 = +[NSArray arrayWithObjects:&v56 count:1];
    __int16 v20 = [(HDClinicalAccountManager *)self accountsForGatewaysWithExternalIDs:v19 errorOut:a9];

    if (!v20)
    {
      id v21 = 0;
      goto LABEL_20;
    }
    if ([(__CFString *)v20 count])
    {
      id v21 = [(__CFString *)v20 firstObject];
      goto LABEL_20;
    }

    id v36 = v18;
    if (!v15) {
      goto LABEL_12;
    }
  }
  else
  {
    id v22 = objc_alloc_init((Class)NSUUID);
    id v36 = [v22 UUIDString];

    if (!v15)
    {
LABEL_12:
      __int16 v20 = @"US";
      goto LABEL_13;
    }
  }
  id v23 = +[NSString stringWithFormat:@"en_%@", v15];
  id v24 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v23];
  id v25 = [v24 countryCode];
  if (v25)
  {
    uint64_t v26 = [v24 countryCode];
    BOOL v27 = [v26 length] == (char *)&dword_0 + 2;

    if (v27)
    {
      __int16 v20 = [v24 countryCode];

LABEL_13:
      HKFHIRRelease v28 = [v16 FHIRRelease];
      BOOL v29 = v28 == HKFHIRReleaseUnknown;

      if (!v29)
      {
        uint64_t v50 = 0;
        id v51 = &v50;
        uint64_t v52 = 0x3032000000;
        id v53 = sub_33CE4;
        unsigned __int8 v54 = sub_33CF4;
        id v55 = 0;
        id v30 = [(HDClinicalAccountManager *)self profile];
        id v31 = [v30 database];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_3A998;
        v40[3] = &unk_113098;
        BOOL v49 = v18 != 0;
        __int16 v20 = v20;
        id v41 = v20;
        id v42 = v16;
        id v18 = v36;
        id v43 = v18;
        id v44 = v37;
        id v45 = v38;
        id v46 = v39;
        v47 = self;
        id v48 = &v50;
        int v32 = +[HDClinicalGatewayEntity performWriteTransactionWithHealthDatabase:v31 error:a9 block:v40];

        if (v32) {
          id v21 = (id)v51[5];
        }
        else {
          id v21 = 0;
        }

        _Block_object_dispose(&v50, 8);
        goto LABEL_20;
      }
      id v33 = [v16 stringRepresentation];
      id v34 = +[NSString stringWithFormat:@"Unable to create HDClinicalAccount with unknown FHIR release for version %@", v33];

      +[NSError hk_assignError:a9 code:100 description:v34];
      id v21 = 0;
      goto LABEL_17;
    }
  }
  +[NSError hk_assignError:a9, 3, @"It appears country code \"%@\" is not valid", v15 code format];

  id v21 = 0;
  __int16 v20 = @"US";
LABEL_17:
  id v18 = v36;
LABEL_20:

  return v21;
}

- (id)unitTesting_createAccountForGateway:(id)a3 authResponse:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 authScopeWithError:a5];
  if (v10)
  {
    int64_t v11 = [(HDClinicalAccountManager *)self unitTesting_createAccountForGateway:v8 requestedScope:v10 authResponse:v9 error:a5];
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (id)unitTesting_createAccountWithoutCredentialForGateway:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(HDClinicalAccountManager *)self profile];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_33CE4;
  id v22 = sub_33CF4;
  id v23 = 0;
  id v8 = [v7 database];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3B02C;
  v14[3] = &unk_112E60;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  id v17 = &v18;
  LODWORD(a4) = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v8 error:a4 block:v14];

  if (a4) {
    int64_t v11 = (void *)v19[5];
  }
  else {
    int64_t v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)unitTesting_createAccountForGateway:(id)a3 requestedScope:(id)a4 authResponse:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HDClinicalAccountManager *)self profile];
  uint64_t v28 = 0;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_33CE4;
  int v32 = sub_33CF4;
  id v33 = 0;
  __int16 v14 = [v13 database];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_3B304;
  v22[3] = &unk_1130C0;
  v22[4] = self;
  id v15 = v10;
  id v23 = v15;
  id v16 = v13;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  id v18 = v11;
  id v26 = v18;
  BOOL v27 = &v28;
  LODWORD(a6) = +[HDClinicalAccountEntity performWriteTransactionWithHealthDatabase:v14 error:a6 block:v22];

  if (a6) {
    id v19 = (void *)v29[5];
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  _Block_object_dispose(&v28, 8);

  return v20;
}

- (id)credentialFromCodableCredential:(id)a3
{
  id v3 = a3;
  id v4 = [[HDFHIRCredential alloc] initWithCodableCredential:v3];

  return v4;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"%@ (%p)", v4, self];

  return v5;
}

- (id)_createAccountForGatewayWithExternalID:(id)a3 database:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = +[HDClinicalGatewayEntity existingGatewayEntityWithExternalID:a3 database:v9 error:a6];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 gatewayInDatabase:v9 error:a6];
    if (v13)
    {
      __int16 v14 = +[NSUUID UUID];
      id v15 = +[NSUUID UUID];
      id v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
      id v17 = +[HKClinicalSharingStatus unknownStatus];
      id v18 = +[HDClinicalAccountEntity insertAccountWithIdentifier:v14 syncIdentifier:v15 userEnabled:1 credentialState:0 credentialID:0 patientHash:0 gatewayID:v16 signedClinicalDataIssuerID:0 clinicalSharingStatus:v17 profile:v10 error:a6];
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)createAccountForIssuer:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 databaseForEntityClass:objc_opt_class()];
  id v34 = v8;
  id v11 = [v8 identifier];
  id v35 = 0;
  id v12 = +[HDSignedClinicalDataIssuerEntity issuerEntityWithIdentifier:v11 database:v10 error:&v35];
  id v13 = v35;

  if (v12) {
    goto LABEL_2;
  }
  if (v13)
  {
    if (a5)
    {
      id v20 = v13;
      id v21 = a5;
      a5 = 0;
      id *v21 = v20;
    }
    else
    {
      _HKLogDroppedError();
    }
  }
  else
  {
    p_profile = &self->_profile;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v33 = [WeakRetained syncIdentityManager];
    id v31 = [v33 currentSyncIdentity];
    BOOL v29 = [v31 identity];
    id v24 = [v29 codableSyncIdentity];
    [v34 asCodableIssuerWithSyncIdentity:v24];
    id v26 = v25 = self;
    id v27 = objc_loadWeakRetained((id *)p_profile);
    id v12 = +[HDSignedClinicalDataIssuerEntity insertCodableIssuer:v26 syncProvenance:0 profile:v27 transaction:v9 error:a5];

    self = v25;
    if (v12)
    {
LABEL_2:
      uint64_t v28 = +[NSUUID UUID];
      __int16 v14 = +[NSUUID UUID];
      +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
      id v30 = v9;
      id v15 = v32 = v10;
      id v16 = +[HKClinicalSharingStatus unknownStatus];
      id v17 = v13;
      id v18 = objc_loadWeakRetained((id *)&self->_profile);
      a5 = +[HDClinicalAccountEntity insertAccountWithIdentifier:v28 syncIdentifier:v14 userEnabled:1 credentialState:0 credentialID:0 patientHash:0 gatewayID:0 signedClinicalDataIssuerID:v15 clinicalSharingStatus:v16 profile:v18 error:a5];

      id v13 = v17;
      id v9 = v30;
      id v10 = v32;

      goto LABEL_3;
    }
    a5 = 0;
  }
LABEL_3:

  return a5;
}

- (id)accountEntityForRecord:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  int v32 = sub_33CE4;
  id v33 = sub_33CF4;
  id v34 = 0;
  id v9 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  id v28 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_3BC60;
  v23[3] = &unk_1130E8;
  id v26 = &v29;
  id v12 = v8;
  id v24 = v12;
  id v25 = self;
  BOOL v27 = a4;
  unsigned __int8 v13 = [v11 performTransactionWithContext:v9 error:&v28 block:v23 inaccessibilityHandler:&stru_113128];
  id v14 = v28;

  if (v13)
  {
    id v15 = (id)v30[5];
  }
  else
  {
    _HKInitializeLogging();
    id v16 = HKLogHealthRecords;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v20 = [(HDClinicalAccountManager *)self debugDescription];
      id v21 = [v12 issuerIdentifier];
      id v22 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      id v36 = v20;
      __int16 v37 = 2114;
      id v38 = v22;
      _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "%{public}@ failed to create account for issuer %{public}@", buf, 0x16u);
    }
    id v17 = v14;
    id v18 = v17;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v15 = 0;
  }

  _Block_object_dispose(&v29, 8);

  return v15;
}

- (void)_performIngestionForNewCredentialsWithReason:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"NewCredentialIngestion"];
  id v9 = [[HDClinicalIngestionTaskContext alloc] initWithOptions:0 reason:v6];
  id v10 = [(HDClinicalAccountManager *)self profileExtension];
  id v11 = [v10 ingestionManager];
  id v20 = v7;
  id v12 = +[NSArray arrayWithObjects:&v20 count:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3C288;
  v16[3] = &unk_113150;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v19 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v6;
  [v11 performIngestionWithContext:v9 accountIdentifiers:v12 completion:v16];
}

- (void)_accumulateMetricsFromTaskEndStates:(id)a3 gateway:(id)a4
{
  currentAnalyticsAccumulator = self->_currentAnalyticsAccumulator;
  id v6 = a3;
  id v7 = [a4 hkGateway];
  [(HDClinicalIngestionAnalyticsAccumulator *)currentAnalyticsAccumulator accumulateIngestionAnalyticsFromTaskStates:v6 gateway:v7 completion:0];
}

- (void)_requestChangesCloudSyncForProfile:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)HKChangesSyncRequest) initWithPush:1 pull:0 lite:1];
  id v9 = [objc_alloc((Class)HKCloudSyncRequest) initWithChangesSyncRequest:v8];
  id v10 = [v7 cloudSyncManager];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3C490;
  v12[3] = &unk_113178;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 syncWithRequest:v9 reason:v11 completion:v12];
}

- (HDClinicalIngestionAnalyticsAccumulator)currentAnalyticsAccumulator
{
  return self->_currentAnalyticsAccumulator;
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

- (HKSynchronousObserverSet)stateChangeObservers
{
  return self->_stateChangeObservers;
}

- (void)setStateChangeObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangeObservers, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_profileExtension);

  objc_storeStrong((id *)&self->_currentAnalyticsAccumulator, 0);
}

- (id)simulateUnmergeEventForAccountWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  id v9 = [v8 database];
  id v32 = 0;
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  BOOL v27 = sub_59C00;
  id v28 = &unk_112EB0;
  id v10 = v7;
  id v29 = v10;
  id v11 = v8;
  id v30 = v11;
  uint64_t v31 = &v33;
  unsigned __int8 v12 = +[HDOriginalFHIRResourceEntity performWriteTransactionWithHealthDatabase:v9 error:&v32 block:&v25];
  id v13 = v32;

  if (v12)
  {
    _HKInitializeLogging();
    id v14 = HKLogHealthRecords;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      uint64_t v17 = v34[3];
      *(_DWORD *)buf = 138543618;
      id v38 = v16;
      __int16 v39 = 2048;
      uint64_t v40 = v17;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ did mark %lu resources as \"stale\"", buf, 0x16u);
    }
    id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v34[3], v25, v26, v27, v28, v29);
  }
  else
  {
    _HKInitializeLogging();
    id v19 = HKLogHealthRecords;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      sub_AFA68(v21, (uint64_t)v13, buf, v19);
    }

    id v22 = v13;
    id v23 = v22;
    if (v22)
    {
      if (a5) {
        *a5 = v22;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v18 = 0;
  }

  _Block_object_dispose(&v33, 8);

  return v18;
}

- (BOOL)simulateAccountDownloadOverdueWithIdentifier:(id)a3 profile:(id)a4 stage:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (a5 == 1)
  {
    double v11 = -610000.0;
    unint64_t v12 = 5;
  }
  else
  {
    if (a5 != 2)
    {
      BOOL v16 = 0;
      goto LABEL_20;
    }
    double v11 = -2500000.0;
    unint64_t v12 = 11;
  }
  id v13 = +[NSDate dateWithTimeIntervalSinceNow:v11];
  id v14 = [v10 database];
  id v24 = 0;
  +[HDClinicalAccountEntity updateAccountLastFetchDateNoValidation:v13 identifier:v9 profile:v10 healthDatabase:v14 error:&v24];
  id v15 = v24;

  if (v15)
  {
    if (a6)
    {
      id v15 = v15;
      BOOL v16 = 0;
      *a6 = v15;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v16 = 0;
    }
  }
  else
  {
    id v21 = a6;
    id v22 = v13;
    BOOL v16 = 0;
    uint64_t v17 = 0;
    while (1)
    {
      id v18 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)(v17 - v12), v21);
      id v19 = [v10 database];
      id v23 = 0;
      +[HDClinicalAccountEntity updateAccountLastFailedFetchDate:v18 overrideFailedAttemptsCount:0 identifier:v9 profile:v10 healthDatabase:v19 error:&v23];
      id v15 = v23;

      if (v15) {
        break;
      }

      BOOL v16 = ++v17 >= v12;
      if (v17 == v12)
      {
        BOOL v16 = 1;
        id v13 = v22;
        goto LABEL_19;
      }
    }
    if (v21) {
      id *v21 = v15;
    }
    else {
      _HKLogDroppedError();
    }
    id v13 = v22;
  }
LABEL_19:

LABEL_20:
  return v16;
}

@end