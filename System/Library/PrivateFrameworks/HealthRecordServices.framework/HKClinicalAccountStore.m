@interface HKClinicalAccountStore
- (BOOL)supportsClinicalSharing;
- (HKClinicalAccountStore)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (id)_clientQueueBoolHandlerWithCompletion:(id)a3;
- (id)_clientQueueDoubleBoolHandlerWithCompletion:(id)a3;
- (id)_clientQueueFailableActionHandlerWithCompletion:(id)a3;
- (id)accountWithIdentifier:(id)a3 error:(id *)a4;
- (id)allAccountsWithError:(id *)a3;
- (id)unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
- (void)_establishProxyConnection;
- (void)_establishProxyConnectionIfNoObserversArePresent;
- (void)_executeCheapCallOnPluginServerProxy:(id)a3;
- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_getSynchronousServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3;
- (void)addAccountStateChangeListener:(id)a3;
- (void)beginInitialLoginSessionForGateway:(id)a3 completion:(id)a4;
- (void)beginReloginSessionForAccount:(id)a3 completion:(id)a4;
- (void)clientRemote_accountDidChange:(id)a3 changeType:(int64_t)a4;
- (void)createStaticAccountWithTitle:(id)a3 subtitle:(id)a4 description:(id)a5 countryCode:(id)a6 fhirVersion:(id)a7 onlyIfNeededForSimulatedGatewayID:(id)a8 completion:(id)a9;
- (void)deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 completion:(id)a5;
- (void)deviceConfigurationSupportsHealthRecords:(id)a3;
- (void)endLoginSessionWithState:(id)a3 code:(id)a4 completion:(id)a5;
- (void)fetchAccountForSource:(id)a3 completion:(id)a4;
- (void)fetchAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchAccountsForGatewaysWithExternalIDs:(id)a3 completion:(id)a4;
- (void)fetchAllAccountsWithCompletion:(id)a3;
- (void)fetchAllEventsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)hasAnyHealthRecordsAccountWithCompletion:(id)a3;
- (void)hasGatewayBackedHealthRecordsAccountWithCompletion:(id)a3;
- (void)invalidateCredentialForAccountWithIdentifier:(id)a3 event:(id)a4 completion:(id)a5;
- (void)persistEphemeralAccount:(id)a3 triggerIngestion:(BOOL)a4 completion:(id)a5;
- (void)pruneAuthenticationDataWithCompletion:(id)a3;
- (void)refreshAccountConnectionInformationForAccountsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)removeAccountStateChangeListener:(id)a3;
- (void)replaceAccountWithNewAccountForAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 completion:(id)a5;
- (void)setUnitTesting_didCallReestablishProxyConnectionIfObserversArePresent:(id)a3;
- (void)shouldShowHealthRecordsSectionWithCompletion:(id)a3;
- (void)simulateAccountDownloadOverdueWithIdentifier:(id)a3 stage:(int64_t)a4 completion:(id)a5;
- (void)simulateUnmergeEventForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountCredentialStateForAccountWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 completion:(id)a6;
- (void)updateClinicalSharingStatusForAccountWithIdentifier:(id)a3 firstSharedDate:(id)a4 lastSharedDate:(id)a5 userStatus:(id)a6 multiDeviceStatus:(id)a7 primaryDeviceName:(id)a8 completion:(id)a9;
@end

@implementation HKClinicalAccountStore

void __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2;
  v3[3] = &unk_2645EF1A0;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_shouldShowHealthRecordsSectionWithCompletion:", v3);
}

void __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1, a3);
}

void __63__HKClinicalAccountStore__executeCheapCallOnPluginServerProxy___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_2_cold_1();
    }
  }
}

void __70__HKClinicalAccountStore__clientQueueDoubleBoolHandlerWithCompletion___block_invoke(uint64_t a1, char a2, char a3)
{
  v6 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HKClinicalAccountStore__clientQueueDoubleBoolHandlerWithCompletion___block_invoke_2;
  block[3] = &unk_2645EF3A8;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  char v13 = a3;
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  dispatch_async(v6, block);
}

- (void)addAccountStateChangeListener:(id)a3
{
  id v4 = a3;
  [(HKClinicalAccountStore *)self _establishProxyConnectionIfNoObserversArePresent];
  [(HKObserverSet *)self->_accountStateChangeObservers registerObserver:v4];
}

- (void)_establishProxyConnectionIfNoObserversArePresent
{
  if (![(HKObserverSet *)self->_accountStateChangeObservers count])
  {
    [(HKClinicalAccountStore *)self _establishProxyConnection];
  }
}

- (void)_establishProxyConnection
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__HKClinicalAccountStore__establishProxyConnection__block_invoke;
  v3[3] = &unk_2645EF330;
  void v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__HKClinicalAccountStore__establishProxyConnection__block_invoke_2;
  v2[3] = &unk_2645EE770;
  v2[4] = self;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v3 errorHandler:v2];
}

- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_accountStateChangeObservers, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

- (void)shouldShowHealthRecordsSectionWithCompletion:(id)a3
{
  id v4 = [(HKClinicalAccountStore *)self _clientQueueDoubleBoolHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke;
  v8[3] = &unk_2645EF0B0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_288;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

- (id)_clientQueueDoubleBoolHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  id v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider exportedObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HKClinicalAccountStore__clientQueueDoubleBoolHandlerWithCompletion___block_invoke;
  v8[3] = &unk_2645EF3D0;
  void v8[4] = self;
  id v9 = v4;
  id v10 = v11;
  id v5 = v4;
  v6 = (void *)MEMORY[0x223C90C60](v8);

  _Block_object_dispose(v11, 8);

  return v6;
}

- (void)_executeCheapCallOnPluginServerProxy:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG)) {
    -[HKClinicalAccountStore _executeCheapCallOnPluginServerProxy:]();
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__HKClinicalAccountStore__executeCheapCallOnPluginServerProxy___block_invoke;
  v5[3] = &unk_2645EE720;
  v5[4] = self;
  objc_msgSend(v4, "remote_pingWithCompletion:", v5);
}

- (HKClinicalAccountStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKClinicalAccountStore;
  v6 = [(HKClinicalAccountStore *)&v22 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = HKLogInfrastructure();
    uint64_t v11 = [v7 initWithName:v9 loggingCategory:v10];
    accountStateChangeObservers = v6->_accountStateChangeObservers;
    v6->_accountStateChangeObservers = (HKObserverSet *)v11;

    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v13 = objc_alloc(MEMORY[0x263F0A818]);
    v14 = [(id)objc_opt_class() taskIdentifier];
    v15 = [MEMORY[0x263F08C38] UUID];
    uint64_t v16 = [v13 initWithHealthStore:v5 taskIdentifier:v14 exportedObject:v6 taskUUID:v15];
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = (HKTaskServerProxyProvider *)v16;

    objc_initWeak(&location, v6);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __46__HKClinicalAccountStore_initWithHealthStore___block_invoke;
    v19[3] = &unk_2645EF038;
    objc_copyWeak(&v20, &location);
    [(HKTaskServerProxyProvider *)v6->_proxyProvider setAutomaticProxyReconnectionHandler:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __51__HKClinicalAccountStore__establishProxyConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _executeCheapCallOnPluginServerProxy:a2];
}

void __70__HKClinicalAccountStore__clientQueueDoubleBoolHandlerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __46__HKClinicalAccountStore_initWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:v4];
}

- (id)allAccountsWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__HKClinicalAccountStore_allAccountsWithError___block_invoke;
  v10[3] = &unk_2645EF088;
  v10[4] = &v11;
  v10[5] = &v17;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__HKClinicalAccountStore_allAccountsWithError___block_invoke_3;
  v9[3] = &unk_2645EE518;
  v9[4] = &v17;
  [(HKClinicalAccountStore *)self _getSynchronousServerProxyWithHandler:v10 errorHandler:v9];
  id v4 = (void *)v12[5];
  if (!v4)
  {
    id v5 = (id)v18[5];
    v6 = v5;
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v4 = (void *)v12[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __47__HKClinicalAccountStore_allAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__HKClinicalAccountStore_allAccountsWithError___block_invoke_2;
  v3[3] = &unk_2645EF060;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchAllAccountsWithCompletion:", v3);
}

void __47__HKClinicalAccountStore_allAccountsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __47__HKClinicalAccountStore_allAccountsWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)fetchAllAccountsWithCompletion:(id)a3
{
  long long v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__HKClinicalAccountStore_fetchAllAccountsWithCompletion___block_invoke;
  v8[3] = &unk_2645EF0B0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__HKClinicalAccountStore_fetchAllAccountsWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __57__HKClinicalAccountStore_fetchAllAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllAccountsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __57__HKClinicalAccountStore_fetchAllAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAccountsForGatewaysWithExternalIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__HKClinicalAccountStore_fetchAccountsForGatewaysWithExternalIDs_completion___block_invoke;
  v12[3] = &unk_2645EF0D8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__HKClinicalAccountStore_fetchAccountsForGatewaysWithExternalIDs_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __77__HKClinicalAccountStore_fetchAccountsForGatewaysWithExternalIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAccountsForGatewaysWithExternalIDs:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __77__HKClinicalAccountStore_fetchAccountsForGatewaysWithExternalIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAccountForSource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__HKClinicalAccountStore_fetchAccountForSource_completion___block_invoke;
  v12[3] = &unk_2645EF0D8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__HKClinicalAccountStore_fetchAccountForSource_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __59__HKClinicalAccountStore_fetchAccountForSource_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAccountForSource:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __59__HKClinicalAccountStore_fetchAccountForSource_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)accountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke;
  v14[3] = &unk_2645EF128;
  id v7 = v6;
  id v15 = v7;
  id v16 = &v18;
  uint64_t v17 = &v24;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke_3;
  v13[3] = &unk_2645EE518;
  v13[4] = &v24;
  [(HKClinicalAccountStore *)self _getSynchronousServerProxyWithHandler:v14 errorHandler:v13];
  id v8 = (void *)v19[5];
  if (!v8)
  {
    id v9 = (id)v25[5];
    id v10 = v9;
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v8 = (void *)v19[5];
  }
  id v11 = v8;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke_2;
  v4[3] = &unk_2645EF100;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchAccountWithIdentifier:completion:", v2, v4);
}

void __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)fetchAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__HKClinicalAccountStore_fetchAccountWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2645EF0D8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HKClinicalAccountStore_fetchAccountWithIdentifier_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __64__HKClinicalAccountStore_fetchAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAccountWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __64__HKClinicalAccountStore_fetchAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__HKClinicalAccountStore_deleteAccountWithIdentifier_deletionReason_completion___block_invoke;
  v14[3] = &unk_2645EF150;
  id v15 = v8;
  int64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__HKClinicalAccountStore_deleteAccountWithIdentifier_deletionReason_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __80__HKClinicalAccountStore_deleteAccountWithIdentifier_deletionReason_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteAccountWithIdentifier:deletionReason:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __80__HKClinicalAccountStore_deleteAccountWithIdentifier_deletionReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hasAnyHealthRecordsAccountWithCompletion:(id)a3
{
  long long v4 = [(HKClinicalAccountStore *)self _clientQueueBoolHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke;
  v8[3] = &unk_2645EF0B0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_285;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

void __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2;
  v3[3] = &unk_2645EF178;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_hasAnyHealthRecordsAccountWithCompletion:", v3);
}

void __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

void __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_285(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hasGatewayBackedHealthRecordsAccountWithCompletion:(id)a3
{
  id v4 = [(HKClinicalAccountStore *)self _clientQueueBoolHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke;
  v8[3] = &unk_2645EF0B0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_286;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

void __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2;
  v3[3] = &unk_2645EF178;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_hasGatewayBackedHealthRecordsAccountWithCompletion:", v3);
}

void __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

void __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_286(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deviceConfigurationSupportsHealthRecords:(id)a3
{
  id v4 = [(HKClinicalAccountStore *)self _clientQueueFailableActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke;
  v8[3] = &unk_2645EF0B0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deviceConfigurationSupportsHealthRecords:", *(void *)(a1 + 32));
}

void __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_288(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)supportsClinicalSharing
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke;
  v5[3] = &unk_2645EF1F0;
  v5[4] = &v6;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_289;
  v4[3] = &unk_2645EE518;
  void v4[4] = &v6;
  [(HKClinicalAccountStore *)self _getSynchronousServerProxyWithHandler:v5 errorHandler:v4];
  char v2 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2;
  v3[3] = &unk_2645EF1C8;
  void v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_supportsClinicalSharingWithCompletion:", v3);
}

void __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 1;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2_cold_1();
    }
  }
}

void __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_289(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

- (void)beginInitialLoginSessionForGateway:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([MEMORY[0x263F0A980] isRunningStoreDemoMode])
  {
    _HKInitializeLogging();
    uint64_t v8 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      char v9 = v8;
      *(_DWORD *)buf = 138543362;
      id v19 = (id)objc_opt_class();
      id v10 = v19;
      _os_log_impl(&dword_221D38000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ running store demo mode, connecting to gateways is not supported", buf, 0xCu);
    }
    id v11 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 111, @"Running in store demo mode, connecting to gateways is not supported");
    v7[2](v7, 0, v11);
  }
  else
  {
    id v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v7];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__HKClinicalAccountStore_beginInitialLoginSessionForGateway_completion___block_invoke;
    v15[3] = &unk_2645EF0D8;
    id v16 = v6;
    id v17 = v12;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__HKClinicalAccountStore_beginInitialLoginSessionForGateway_completion___block_invoke_2;
    v13[3] = &unk_2645EE630;
    id v7 = (void (**)(id, void, void *))v17;
    id v14 = v7;
    [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v15 errorHandler:v13];

    id v11 = v16;
  }
}

void __72__HKClinicalAccountStore_beginInitialLoginSessionForGateway_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 externalID];
  objc_msgSend(v4, "remote_beginInitialLoginSessionForGatewayWithExternalID:completion:", v5, *(void *)(a1 + 40));
}

uint64_t __72__HKClinicalAccountStore_beginInitialLoginSessionForGateway_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginReloginSessionForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HKClinicalAccountStore_beginReloginSessionForAccount_completion___block_invoke;
  v12[3] = &unk_2645EF0D8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__HKClinicalAccountStore_beginReloginSessionForAccount_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

void __67__HKClinicalAccountStore_beginReloginSessionForAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  objc_msgSend(v4, "remote_beginReloginSessionForAccountWithIdentifier:completion:", v5, *(void *)(a1 + 40));
}

uint64_t __67__HKClinicalAccountStore_beginReloginSessionForAccount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endLoginSessionWithState:(id)a3 code:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__2;
  v25[4] = __Block_byref_object_dispose__2;
  id v11 = self;
  uint64_t v26 = v11;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke;
  v22[3] = &unk_2645EF240;
  v22[4] = v11;
  id v23 = v10;
  uint64_t v24 = v25;
  id v12 = (void *)MEMORY[0x223C90C60](v22);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_3;
  v18[3] = &unk_2645EF268;
  id v13 = v8;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  id v21 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_4;
  v16[3] = &unk_2645EE630;
  id v15 = v21;
  id v17 = v15;
  [(HKClinicalAccountStore *)v11 _fetchServerProxyWithHandler:v18 errorHandler:v16];

  _Block_object_dispose(v25, 8);
}

void __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_2;
  block[3] = &unk_2645EF218;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

uint64_t __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_3(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_endLoginSessionWithState:code:completion:", a1[4], a1[5], a1[6]);
}

void __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[HKClinicalAccountLoginCompletionState completionStateWithError:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)persistEphemeralAccount:(id)a3 triggerIngestion:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__HKClinicalAccountStore_persistEphemeralAccount_triggerIngestion_completion___block_invoke;
  v14[3] = &unk_2645EF290;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__HKClinicalAccountStore_persistEphemeralAccount_triggerIngestion_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __78__HKClinicalAccountStore_persistEphemeralAccount_triggerIngestion_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_persistEphemeralAccount:triggerIngestion:completion:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __78__HKClinicalAccountStore_persistEphemeralAccount_triggerIngestion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pruneAuthenticationDataWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__HKClinicalAccountStore_pruneAuthenticationDataWithCompletion___block_invoke;
  v8[3] = &unk_2645EF0B0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__HKClinicalAccountStore_pruneAuthenticationDataWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __64__HKClinicalAccountStore_pruneAuthenticationDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pruneAuthenticationDataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __64__HKClinicalAccountStore_pruneAuthenticationDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)replaceAccountWithNewAccountForAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __122__HKClinicalAccountStore_replaceAccountWithNewAccountForAccountWithIdentifier_usingCredentialWithPersistentID_completion___block_invoke;
  v16[3] = &unk_2645EF268;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __122__HKClinicalAccountStore_replaceAccountWithNewAccountForAccountWithIdentifier_usingCredentialWithPersistentID_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __122__HKClinicalAccountStore_replaceAccountWithNewAccountForAccountWithIdentifier_usingCredentialWithPersistentID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_replaceAccountWithNewAccountForAccountWithIdentifier:usingCredentialWithPersistentID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __122__HKClinicalAccountStore_replaceAccountWithNewAccountForAccountWithIdentifier_usingCredentialWithPersistentID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshAccountConnectionInformationForAccountsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__HKClinicalAccountStore_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion___block_invoke;
  v12[3] = &unk_2645EF0D8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __99__HKClinicalAccountStore_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __99__HKClinicalAccountStore_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_refreshAccountConnectionInformationForAccountsWithIdentifiers:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __99__HKClinicalAccountStore_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateClinicalSharingStatusForAccountWithIdentifier:(id)a3 firstSharedDate:(id)a4 lastSharedDate:(id)a5 userStatus:(id)a6 multiDeviceStatus:(id)a7 primaryDeviceName:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a9];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __167__HKClinicalAccountStore_updateClinicalSharingStatusForAccountWithIdentifier_firstSharedDate_lastSharedDate_userStatus_multiDeviceStatus_primaryDeviceName_completion___block_invoke;
  v31[3] = &unk_2645EF2B8;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v20;
  id v38 = v21;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __167__HKClinicalAccountStore_updateClinicalSharingStatusForAccountWithIdentifier_firstSharedDate_lastSharedDate_userStatus_multiDeviceStatus_primaryDeviceName_completion___block_invoke_2;
  v29[3] = &unk_2645EE630;
  id v30 = v38;
  id v22 = v38;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v15;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v31 errorHandler:v29];
}

uint64_t __167__HKClinicalAccountStore_updateClinicalSharingStatusForAccountWithIdentifier_firstSharedDate_lastSharedDate_userStatus_multiDeviceStatus_primaryDeviceName_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateClinicalSharingStatusForAccountWithIdentifier:firstSharedDate:lastSharedDate:userStatus:multiDeviceStatus:primaryDeviceName:completion:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
}

uint64_t __167__HKClinicalAccountStore_updateClinicalSharingStatusForAccountWithIdentifier_firstSharedDate_lastSharedDate_userStatus_multiDeviceStatus_primaryDeviceName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAccountStateChangeListener:(id)a3
{
}

- (void)fetchAllEventsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__HKClinicalAccountStore_fetchAllEventsForAccountWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2645EF0D8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__HKClinicalAccountStore_fetchAllEventsForAccountWithIdentifier_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __76__HKClinicalAccountStore_fetchAllEventsForAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllEventsForAccountIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __76__HKClinicalAccountStore_fetchAllEventsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createStaticAccountWithTitle:(id)a3 subtitle:(id)a4 description:(id)a5 countryCode:(id)a6 fhirVersion:(id)a7 onlyIfNeededForSimulatedGatewayID:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a9];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __145__HKClinicalAccountStore_createStaticAccountWithTitle_subtitle_description_countryCode_fhirVersion_onlyIfNeededForSimulatedGatewayID_completion___block_invoke;
  v31[3] = &unk_2645EF2B8;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v20;
  id v38 = v21;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __145__HKClinicalAccountStore_createStaticAccountWithTitle_subtitle_description_countryCode_fhirVersion_onlyIfNeededForSimulatedGatewayID_completion___block_invoke_2;
  v29[3] = &unk_2645EE630;
  id v30 = v38;
  id v22 = v38;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v15;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v31 errorHandler:v29];
}

uint64_t __145__HKClinicalAccountStore_createStaticAccountWithTitle_subtitle_description_countryCode_fhirVersion_onlyIfNeededForSimulatedGatewayID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_createStaticAccountWithTitle:subtitle:description:countryCode:fhirVersion:onlyIfNeededForSimulatedGatewayID:completion:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
}

uint64_t __145__HKClinicalAccountStore_createStaticAccountWithTitle_subtitle_description_countryCode_fhirVersion_onlyIfNeededForSimulatedGatewayID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateCredentialForAccountWithIdentifier:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__HKClinicalAccountStore_invalidateCredentialForAccountWithIdentifier_event_completion___block_invoke;
  v16[3] = &unk_2645EF268;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__HKClinicalAccountStore_invalidateCredentialForAccountWithIdentifier_event_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __88__HKClinicalAccountStore_invalidateCredentialForAccountWithIdentifier_event_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_invalidateCredentialForAccountWithIdentifier:event:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __88__HKClinicalAccountStore_invalidateCredentialForAccountWithIdentifier_event_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAccountCredentialStateForAccountWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a6];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __102__HKClinicalAccountStore_updateAccountCredentialStateForAccountWithIdentifier_state_event_completion___block_invoke;
  v18[3] = &unk_2645EF2E0;
  int64_t v22 = a4;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __102__HKClinicalAccountStore_updateAccountCredentialStateForAccountWithIdentifier_state_event_completion___block_invoke_2;
  v16[3] = &unk_2645EE630;
  id v17 = v21;
  id v13 = v21;
  id v14 = v11;
  id v15 = v10;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v18 errorHandler:v16];
}

uint64_t __102__HKClinicalAccountStore_updateAccountCredentialStateForAccountWithIdentifier_state_event_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateAccountCredentialStateWithIdentifier:state:event:completion:", a1[4], a1[7], a1[5], a1[6]);
}

uint64_t __102__HKClinicalAccountStore_updateAccountCredentialStateForAccountWithIdentifier_state_event_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)simulateUnmergeEventForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__HKClinicalAccountStore_simulateUnmergeEventForAccountWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2645EF0D8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__HKClinicalAccountStore_simulateUnmergeEventForAccountWithIdentifier_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __82__HKClinicalAccountStore_simulateUnmergeEventForAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_simulateUnmergeEventForAccountWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __82__HKClinicalAccountStore_simulateUnmergeEventForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)simulateAccountDownloadOverdueWithIdentifier:(id)a3 stage:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__HKClinicalAccountStore_simulateAccountDownloadOverdueWithIdentifier_stage_completion___block_invoke;
  v14[3] = &unk_2645EF150;
  id v15 = v8;
  int64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__HKClinicalAccountStore_simulateAccountDownloadOverdueWithIdentifier_stage_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKClinicalAccountStore *)self _fetchServerProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __88__HKClinicalAccountStore_simulateAccountDownloadOverdueWithIdentifier_stage_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_simulateAccountDownloadOverdueWithIdentifier:stage:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __88__HKClinicalAccountStore_simulateAccountDownloadOverdueWithIdentifier_stage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_accountDidChange:(id)a3 changeType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
  {
    id v10 = v7;
    id v11 = [v6 identifier];
    id v12 = NSStringFromAccountStateChangeType(a4);
    *(_DWORD *)buf = 138543874;
    int64_t v17 = self;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_log_debug_impl(&dword_221D38000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: account with identifier %{public}@ did change state: %{public}@", buf, 0x20u);
  }
  accountStateChangeObservers = self->_accountStateChangeObservers;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__HKClinicalAccountStore_clientRemote_accountDidChange_changeType___block_invoke;
  v13[3] = &unk_2645EF308;
  void v13[4] = self;
  id v14 = v6;
  int64_t v15 = a4;
  id v9 = v6;
  [(HKObserverSet *)accountStateChangeObservers notifyObservers:v13];
}

uint64_t __67__HKClinicalAccountStore_clientRemote_accountDidChange_changeType___block_invoke(void *a1, void *a2)
{
  return [a2 clinicalAccountStore:a1[4] accountDidChange:a1[5] changeType:a1[6]];
}

- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3
{
  id v5 = a3;
  if ([(HKObserverSet *)self->_accountStateChangeObservers count])
  {
    [(HKClinicalAccountStore *)self _executeCheapCallOnPluginServerProxy:v5];
    unitTesting_didCallReestablishProxyConnectionIfObserversArePresent = (void (**)(void))self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
    if (unitTesting_didCallReestablishProxyConnectionIfObserversArePresent) {
      unitTesting_didCallReestablishProxyConnectionIfObserversArePresent[2]();
    }
  }
}

void __51__HKClinicalAccountStore__establishProxyConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __52__HKClinicalDocumentStore__establishProxyConnection__block_invoke_282_cold_1();
  }
}

- (void)_getSynchronousServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (id)_clientQueueBoolHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  id v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider exportedObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__HKClinicalAccountStore__clientQueueBoolHandlerWithCompletion___block_invoke;
  v8[3] = &unk_2645EF380;
  void v8[4] = self;
  id v9 = v4;
  id v10 = v11;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x223C90C60](v8);

  _Block_object_dispose(v11, 8);

  return v6;
}

void __64__HKClinicalAccountStore__clientQueueBoolHandlerWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HKClinicalAccountStore__clientQueueBoolHandlerWithCompletion___block_invoke_2;
  block[3] = &unk_2645EF358;
  id v5 = *(id *)(a1 + 40);
  char v10 = a2;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, block);
}

void __64__HKClinicalAccountStore__clientQueueBoolHandlerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 48));
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)_clientQueueFailableActionHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  id v12 = [(HKTaskServerProxyProvider *)self->_proxyProvider exportedObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__HKClinicalAccountStore__clientQueueFailableActionHandlerWithCompletion___block_invoke;
  v8[3] = &unk_2645EF420;
  void v8[4] = self;
  id v9 = v4;
  char v10 = v11;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x223C90C60](v8);

  _Block_object_dispose(v11, 8);

  return v6;
}

void __74__HKClinicalAccountStore__clientQueueFailableActionHandlerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__HKClinicalAccountStore__clientQueueFailableActionHandlerWithCompletion___block_invoke_2;
  v9[3] = &unk_2645EF3F8;
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = a2;
  id v8 = v5;
  dispatch_async(v6, v9);
}

void __74__HKClinicalAccountStore__clientQueueFailableActionHandlerWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[7], a1[4]);
  }
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (id)unitTesting_didCallReestablishProxyConnectionIfObserversArePresent
{
  return self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
}

- (void)setUnitTesting_didCallReestablishProxyConnectionIfObserversArePresent:(id)a3
{
}

void __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_221D38000, v0, v1, "Failed to query for any health records account availability with error: %{public}@", v2, v3, v4, v5, v6);
}

void __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_221D38000, v0, v1, "Failed to query for gateway backed account availability with error: %{public}@", v2, v3, v4, v5, v6);
}

void __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_221D38000, v0, v1, "Failed to determine if device configuration supports CHR with error: %{public}@", v2, v3, v4, v5, v6);
}

void __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_221D38000, v0, v1, "Failed to determine if CHR section should be shown with error: %{public}@", v2, v3, v4, v5, v6);
}

void __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_221D38000, v0, v1, "Failed to query for clinical sharing availability with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_executeCheapCallOnPluginServerProxy:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_221D38000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: making cheap XCP call to establish connection on %{public}@", v2, 0x16u);
}

@end