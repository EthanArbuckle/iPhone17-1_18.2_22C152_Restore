@interface HDClinicalAccountStoreServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (HDClinicalAccountStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 accountManager:(id)a7 ingestionManager:(id)a8;
- (id)_clientAccountsFromAccounts:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)accountManager:(id)a3 account:(id)a4 didChangeState:(int64_t)a5;
- (void)connectionConfigured;
- (void)dealloc;
- (void)registerForAccountStateChanges;
- (void)remote_beginInitialLoginSessionForGatewayWithExternalID:(id)a3 completion:(id)a4;
- (void)remote_beginReloginSessionForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_createStaticAccountWithTitle:(id)a3 subtitle:(id)a4 description:(id)a5 countryCode:(id)a6 fhirVersion:(id)a7 onlyIfNeededForSimulatedGatewayID:(id)a8 completion:(id)a9;
- (void)remote_deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 completion:(id)a5;
- (void)remote_deviceConfigurationSupportsHealthRecords:(id)a3;
- (void)remote_endLoginSessionWithState:(id)a3 code:(id)a4 completion:(id)a5;
- (void)remote_fetchAccountForSource:(id)a3 completion:(id)a4;
- (void)remote_fetchAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_fetchAccountsForGatewaysWithExternalIDs:(id)a3 completion:(id)a4;
- (void)remote_fetchAllAccountsWithCompletion:(id)a3;
- (void)remote_fetchAllEventsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)remote_hasAnyHealthRecordsAccountWithCompletion:(id)a3;
- (void)remote_hasGatewayBackedHealthRecordsAccountWithCompletion:(id)a3;
- (void)remote_invalidateCredentialForAccountWithIdentifier:(id)a3 event:(id)a4 completion:(id)a5;
- (void)remote_persistEphemeralAccount:(id)a3 triggerIngestion:(BOOL)a4 completion:(id)a5;
- (void)remote_pingWithCompletion:(id)a3;
- (void)remote_pruneAuthenticationDataWithCompletion:(id)a3;
- (void)remote_refreshAccountConnectionInformationForAccountsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)remote_replaceAccountWithNewAccountForAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 completion:(id)a5;
- (void)remote_shouldShowHealthRecordsSectionWithCompletion:(id)a3;
- (void)remote_simulateAccountDownloadOverdueWithIdentifier:(id)a3 stage:(int64_t)a4 completion:(id)a5;
- (void)remote_simulateUnmergeEventForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_supportsClinicalSharingWithCompletion:(id)a3;
- (void)remote_updateAccountCredentialStateWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 completion:(id)a6;
- (void)remote_updateClinicalSharingStatusForAccountWithIdentifier:(id)a3 firstSharedDate:(id)a4 lastSharedDate:(id)a5 userStatus:(id)a6 multiDeviceStatus:(id)a7 primaryDeviceName:(id)a8 completion:(id)a9;
@end

@implementation HDClinicalAccountStoreServer

- (id)remoteInterface
{
  return (id)_HKClinicalAccountStoreClientInterface(self, a2);
}

- (id)exportedInterface
{
  return (id)_HKClinicalAccountStoreServerInterface(self, a2);
}

- (void)connectionConfigured
{
}

- (void)remote_shouldShowHealthRecordsSectionWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, BOOL, id))a3;
  accountManager = self->_accountManager;
  id v12 = 0;
  v6 = [(HDClinicalAccountManager *)accountManager deviceConfigurationSupportsHealthRecordsWithError:&v12];
  id v7 = v12;
  if (v6 == (unsigned char *)&dword_0 + 2)
  {
    v8 = self->_accountManager;
    id v11 = v7;
    id v9 = [(HDClinicalAccountManager *)v8 highPriorityTransactionHasIssuerBackedAccountsWithError:&v11];
    id v10 = v11;

    id v7 = v10;
  }
  else
  {
    id v9 = v6;
  }
  v4[2](v4, v9, v6 == (unsigned char *)&dword_0 + 1, v7);
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [v14 profile];
  v17 = [v16 profileExtensionWithIdentifier:HKHealthRecordsPluginIdentifier];

  v18 = [v17 accountManager];
  if (v18)
  {
    v19 = [v17 ingestionManager];
    if (v19)
    {
      id v20 = [objc_alloc((Class)a1) initWithUUID:v12 configuration:v13 client:v14 delegate:v15 accountManager:v18 ingestionManager:v19];
      goto LABEL_7;
    }
    v23 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v23);
    v24 = [v14 profile];
    +[NSError hk_assignError:a7, 100, @"Cannot use %@ on profile without ingestion manager: %@", v22, v24 code format];
  }
  else
  {
    v21 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v21);
    v22 = [v14 profile];
    +[NSError hk_assignError:a7, 100, @"Cannot use %@ on profile without account manager: %@", v19, v22 code format];
  }

  id v20 = 0;
LABEL_7:

  return v20;
}

- (HDClinicalAccountStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 accountManager:(id)a7 ingestionManager:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)HDClinicalAccountStoreServer;
  v17 = [(HDClinicalAccountStoreServer *)&v20 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accountManager, a7);
    objc_storeStrong((id *)&v18->_ingestionManager, a8);
  }

  return v18;
}

- (void)registerForAccountStateChanges
{
}

- (void)remote_pingWithCompletion:(id)a3
{
}

- (void)dealloc
{
  [(HDClinicalAccountManager *)self->_accountManager removeAccountStateObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HDClinicalAccountStoreServer;
  [(HDClinicalAccountStoreServer *)&v3 dealloc];
}

- (void)remote_beginInitialLoginSessionForGatewayWithExternalID:(id)a3 completion:(id)a4
{
  accountManager = self->_accountManager;
  id v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  id v7 = [(HDClinicalAccountManager *)accountManager beginInitialLoginSessionForGatewayWithExternalID:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)remote_beginReloginSessionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  accountManager = self->_accountManager;
  id v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  id v7 = [(HDClinicalAccountManager *)accountManager beginReloginSessionForAccountWithIdentifier:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)remote_endLoginSessionWithState:(id)a3 code:(id)a4 completion:(id)a5
{
}

- (void)remote_persistEphemeralAccount:(id)a3 triggerIngestion:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  accountManager = self->_accountManager;
  id v11 = 0;
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = [(HDClinicalAccountManager *)accountManager persistEphemeralAccount:a3 triggerIngestion:v5 error:&v11];
  id v10 = v11;
  v8[2](v8, v9, v10);
}

- (void)remote_replaceAccountWithNewAccountForAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 completion:(id)a5
{
}

- (void)remote_pruneAuthenticationDataWithCompletion:(id)a3
{
}

- (void)remote_fetchAllAccountsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_21830;
  id v14 = sub_21840;
  id v15 = 0;
  BOOL v5 = [(HDClinicalAccountStoreServer *)self profile];
  v6 = [v5 database];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_21848;
  v8[3] = &unk_112708;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);
}

- (void)remote_fetchAccountsForGatewaysWithExternalIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_21830;
  objc_super v20 = sub_21840;
  id v21 = 0;
  id v8 = [(HDClinicalAccountStoreServer *)self profile];
  id v9 = [v8 database];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_21A4C;
  v12[3] = &unk_112730;
  id v14 = &v16;
  id v15 = 0;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  [v9 performHighPriorityTransactionsWithError:&v15 block:v12];
  id v11 = v15;

  v7[2](v7, v17[5], v11);
  _Block_object_dispose(&v16, 8);
}

- (void)remote_fetchAccountForSource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_21830;
  v25 = sub_21840;
  id v26 = 0;
  id v8 = [(HDClinicalAccountStoreServer *)self profile];
  id v9 = [v8 database];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_21C64;
  uint64_t v16 = &unk_112730;
  v19 = &v21;
  id v20 = 0;
  v17 = self;
  id v10 = v6;
  id v18 = v10;
  [v9 performHighPriorityTransactionsWithError:&v20 block:&v13];
  id v11 = v20;

  uint64_t v12 = objc_msgSend((id)v22[5], "hkAccount", v13, v14, v15, v16, v17);
  v7[2](v7, v12, v11);

  _Block_object_dispose(&v21, 8);
}

- (void)remote_fetchAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, uint64_t))a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_21830;
  v22 = sub_21840;
  id v23 = 0;
  id v8 = [(HDClinicalAccountStoreServer *)self profile];
  id v9 = [v8 database];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_21E90;
  v14[3] = &unk_112730;
  uint64_t v16 = &v18;
  id v17 = 0;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  [v9 performHighPriorityTransactionsWithError:&v17 block:v14];
  uint64_t v11 = (uint64_t)v17;

  unint64_t v12 = v19[5];
  if (!(v12 | v11))
  {
    uint64_t v11 = +[NSError hk_error:118, @"Account with id %@ not found", v10 format];
    unint64_t v12 = v19[5];
  }
  id v13 = [(id)v12 hkAccount];
  v7[2](v7, v13, v11);

  _Block_object_dispose(&v18, 8);
}

- (void)remote_deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 completion:(id)a5
{
  accountManager = self->_accountManager;
  id v11 = 0;
  id v8 = (void (**)(id, id, id))a5;
  BOOL v9 = [(HDClinicalAccountManager *)accountManager deleteAccountWithIdentifier:a3 deletionReason:a4 error:&v11];
  id v10 = v11;
  v8[2](v8, (id)v9, v10);
}

- (void)remote_deviceConfigurationSupportsHealthRecords:(id)a3
{
  accountManager = self->_accountManager;
  id v7 = 0;
  v4 = (void (**)(id, id, id))a3;
  id v5 = [(HDClinicalAccountManager *)accountManager deviceConfigurationSupportsHealthRecordsWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_hasAnyHealthRecordsAccountWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, id))a3;
  accountManager = self->_accountManager;
  id v11 = 0;
  id v6 = [(HDClinicalAccountManager *)accountManager highPriorityTransactionHasGatewayBackedAccountsWithError:&v11];
  id v7 = v11;
  if (v6 == (unsigned char *)&dword_0 + 2)
  {
    id v8 = self->_accountManager;
    id v10 = v7;
    id v6 = [(HDClinicalAccountManager *)v8 highPriorityTransactionHasIssuerBackedAccountsWithError:&v10];
    id v9 = v10;

    id v7 = v9;
  }
  v4[2](v4, v6, v7);
}

- (void)remote_hasGatewayBackedHealthRecordsAccountWithCompletion:(id)a3
{
  accountManager = self->_accountManager;
  id v7 = 0;
  v4 = (void (**)(id, id, id))a3;
  id v5 = [(HDClinicalAccountManager *)accountManager highPriorityTransactionHasGatewayBackedAccountsWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_supportsClinicalSharingWithCompletion:(id)a3
{
  accountManager = self->_accountManager;
  id v7 = 0;
  v4 = (void (**)(id, id, id))a3;
  id v5 = [(HDClinicalAccountManager *)accountManager deviceConfigurationSupportsClinicalSharingWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_refreshAccountConnectionInformationForAccountsWithIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)remote_updateClinicalSharingStatusForAccountWithIdentifier:(id)a3 firstSharedDate:(id)a4 lastSharedDate:(id)a5 userStatus:(id)a6 multiDeviceStatus:(id)a7 primaryDeviceName:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v21 = (void (**)(id, id, id))a9;
  _HKInitializeLogging();
  v22 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AC088(v22);
  }
  accountManager = self->_accountManager;
  v32 = v15;
  id v33 = 0;
  v31 = v16;
  BOOL v24 = [(HDClinicalAccountManager *)accountManager updateClinicalSharingStatusForAccountWithIdentifier:v15 firstSharedDate:v16 lastSharedDate:v17 userStatus:v18 multiDeviceStatus:v19 primaryDeviceName:v20 error:&v33];
  id v25 = v33;
  _HKInitializeLogging();
  id v26 = (void *)HKLogHealthRecords;
  if (v24)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_ABFE4(v26);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    v27 = v26;
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    v30 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    v35 = v29;
    __int16 v36 = 2114;
    v37 = v32;
    __int16 v38 = 2114;
    v39 = v30;
    _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "%{public}@ remote_updateClinicalSharingStatusForAccountWithIdentifier: failed to update clinical sharing status on account %{public}@ with error: %{public}@", buf, 0x20u);
  }
  v21[2](v21, (id)v24, v25);
}

- (void)remote_fetchAllEventsForAccountIdentifier:(id)a3 completion:(id)a4
{
  accountManager = self->_accountManager;
  id v9 = 0;
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = [(HDClinicalAccountManager *)accountManager allEventsForAccountWithIdentifier:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)remote_createStaticAccountWithTitle:(id)a3 subtitle:(id)a4 description:(id)a5 countryCode:(id)a6 fhirVersion:(id)a7 onlyIfNeededForSimulatedGatewayID:(id)a8 completion:(id)a9
{
  accountManager = self->_accountManager;
  id v20 = 0;
  id v16 = (void (**)(id, void *, id))a9;
  id v17 = [(HDClinicalAccountManager *)accountManager createStaticAccountWithTitle:a3 subtitle:a4 description:a5 countryCode:a6 fhirVersion:a7 onlyIfNeededForSimulatedGatewayID:a8 error:&v20];
  id v18 = v20;
  id v19 = [v17 hkAccount];
  v16[2](v16, v19, v18);
}

- (void)remote_invalidateCredentialForAccountWithIdentifier:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  id v11 = [(HDClinicalAccountStoreServer *)self client];
  unint64_t v12 = [v11 process];
  id v19 = 0;
  unsigned __int8 v13 = [v12 hasRequiredEntitlement:HKControlEntitlement error:&v19];
  id v14 = v19;

  if (v13)
  {
    accountManager = self->_accountManager;
    id v18 = 0;
    BOOL v16 = [(HDClinicalAccountManager *)accountManager invalidateCredentialForAccountWithIdentifier:v8 event:v9 error:&v18];
    id v17 = v18;
    v10[2](v10, (id)v16, v17);
  }
  else
  {
    v10[2](v10, 0, v14);
  }
}

- (void)remote_updateAccountCredentialStateWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 completion:(id)a6
{
  accountManager = self->_accountManager;
  id v13 = 0;
  id v10 = (void (**)(id, id, id))a6;
  BOOL v11 = [(HDClinicalAccountManager *)accountManager updateCredentialStateForAccountWithIdentifier:a3 state:a4 event:a5 error:&v13];
  id v12 = v13;
  v10[2](v10, (id)v11, v12);
}

- (void)remote_simulateUnmergeEventForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = [(HDClinicalAccountStoreServer *)self client];
  id v9 = [v8 process];
  id v17 = 0;
  unsigned __int8 v10 = [v9 hasRequiredEntitlement:HKControlEntitlement error:&v17];
  id v11 = v17;

  if (v10)
  {
    accountManager = self->_accountManager;
    id v13 = [(HDClinicalAccountStoreServer *)self profile];
    id v16 = 0;
    id v14 = [(HDClinicalAccountManager *)accountManager simulateUnmergeEventForAccountWithIdentifier:v6 profile:v13 error:&v16];
    id v15 = v16;

    v7[2](v7, v14, v15);
  }
  else
  {
    v7[2](v7, 0, v11);
  }
}

- (void)remote_simulateAccountDownloadOverdueWithIdentifier:(id)a3 stage:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id, id))a5;
  unsigned __int8 v10 = [(HDClinicalAccountStoreServer *)self client];
  id v11 = [v10 process];
  id v19 = 0;
  unsigned __int8 v12 = [v11 hasRequiredEntitlement:HKControlEntitlement error:&v19];
  id v13 = v19;

  if (v12)
  {
    accountManager = self->_accountManager;
    id v15 = [(HDClinicalAccountStoreServer *)self profile];
    id v18 = 0;
    BOOL v16 = [(HDClinicalAccountManager *)accountManager simulateAccountDownloadOverdueWithIdentifier:v8 profile:v15 stage:a4 error:&v18];
    id v17 = v18;

    v9[2](v9, (id)v16, v17);
  }
  else
  {
    v9[2](v9, 0, v13);
  }
}

- (void)accountManager:(id)a3 account:(id)a4 didChangeState:(int64_t)a5
{
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v12 = v8;
    id v13 = [v7 identifier];
    id v14 = NSStringFromAccountStateChangeType();
    *(_DWORD *)buf = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v13;
    __int16 v20 = 2114;
    uint64_t v21 = v14;
    _os_log_debug_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "%{public}@: account %{public}@ did change state: %{public}@", buf, 0x20u);
  }
  id v9 = [(HDClinicalAccountStoreServer *)self client];
  unsigned __int8 v10 = [v9 connection];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_22B5C;
  v15[3] = &unk_111BF8;
  v15[4] = self;
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v15];

  objc_msgSend(v11, "clientRemote_accountDidChange:changeType:", v7, a5);
}

- (id)_clientAccountsFromAccounts:(id)a3
{
  return objc_msgSend(a3, "hk_map:", &stru_112770);
}

+ (id)taskIdentifier
{
  return +[HKClinicalAccountStore taskIdentifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestionManager, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end