@interface HDHealthRecordsIngestionServiceClient
- (HDHealthRecordsIngestionServiceClient)init;
- (HDHealthRecordsIngestionServiceClient)initWithConnection:(id)a3;
- (id)exportedInterface;
- (id)handleSignedClinicalDataFeature:(id)a3 context:(id)a4 error:(id *)a5;
- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_synchronousPerformWithProxyHandler:(id)a3 errorHandler:(id)a4;
- (void)addCardToWalletForRecord:(id)a3 completion:(id)a4;
- (void)didUpdateSignedClinicalDataRecord:(id)a3;
- (void)parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)reverifySignatureForRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)willDeleteSignedClinicalDataRecordWithSyncIdentifier:(id)a3;
@end

@implementation HDHealthRecordsIngestionServiceClient

- (HDHealthRecordsIngestionServiceClient)init
{
  v3 = +[HKHealthRecordsDaemonConnection sharedConnection];
  v4 = [(HDHealthRecordsIngestionServiceClient *)self initWithConnection:v3];

  return v4;
}

- (HDHealthRecordsIngestionServiceClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordsIngestionServiceClient;
  v5 = [(HDHealthRecordsIngestionServiceClient *)&v9 init];
  if (v5)
  {
    v6 = [[HKHealthRecordsDaemonProxyProvider alloc] initWithConnection:v4 serviceIdentifier:@"HealthRecordsIngestionService" exportedObject:v5];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = &v6->super;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

- (void)parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  objc_super v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__HDHealthRecordsIngestionServiceClient_parseSignedClinicalData_options_completion___block_invoke;
  v14[3] = &unk_2645EE978;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__HDHealthRecordsIngestionServiceClient_parseSignedClinicalData_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HDHealthRecordsIngestionServiceClient *)self _fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __84__HDHealthRecordsIngestionServiceClient_parseSignedClinicalData_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_parseSignedClinicalData:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __84__HDHealthRecordsIngestionServiceClient_parseSignedClinicalData_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)handleSignedClinicalDataFeature:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke;
  v18[3] = &unk_2645EE9C8;
  id v10 = v8;
  id v19 = v10;
  id v11 = v9;
  id v20 = v11;
  v21 = &v29;
  v22 = &v23;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke_3;
  v17[3] = &unk_2645EE518;
  v17[4] = &v23;
  [(HDHealthRecordsIngestionServiceClient *)self _synchronousPerformWithProxyHandler:v18 errorHandler:v17];
  v12 = (void *)v30[5];
  if (!v12)
  {
    id v13 = (id)v24[5];
    v14 = v13;
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v12 = (void *)v30[5];
  }
  id v15 = v12;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke_2;
  v5[3] = &unk_2645EE9A0;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_handleSignedClinicalDataFeature:context:completion:", v2, v3, v5);
}

void __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__HDHealthRecordsIngestionServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke;
  v14[3] = &unk_2645EE978;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __101__HDHealthRecordsIngestionServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HDHealthRecordsIngestionServiceClient *)self _fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __101__HDHealthRecordsIngestionServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_processOriginalSignedClinicalDataRecords:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __101__HDHealthRecordsIngestionServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reverifySignatureForRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__HDHealthRecordsIngestionServiceClient_reverifySignatureForRecord_options_completion___block_invoke;
  v14[3] = &unk_2645EE978;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__HDHealthRecordsIngestionServiceClient_reverifySignatureForRecord_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HDHealthRecordsIngestionServiceClient *)self _fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __87__HDHealthRecordsIngestionServiceClient_reverifySignatureForRecord_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_reverifySignatureForRecord:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __87__HDHealthRecordsIngestionServiceClient_reverifySignatureForRecord_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addCardToWalletForRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__HDHealthRecordsIngestionServiceClient_addCardToWalletForRecord_completion___block_invoke;
  v12[3] = &unk_2645EE9F0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__HDHealthRecordsIngestionServiceClient_addCardToWalletForRecord_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HDHealthRecordsIngestionServiceClient *)self _fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __77__HDHealthRecordsIngestionServiceClient_addCardToWalletForRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_addCardToWalletForRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __77__HDHealthRecordsIngestionServiceClient_addCardToWalletForRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didUpdateSignedClinicalDataRecord:(id)a3
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke;
  v8[3] = &unk_2645EEA18;
  id v9 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2;
  v7[3] = &unk_2645EEA40;
  v7[4] = self;
  v7[5] = a2;
  id v6 = v5;
  [(HDHealthRecordsIngestionServiceClient *)self _fetchProxyWithHandler:v8 errorHandler:v7];
}

uint64_t __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_didUpdateSignedClinicalDataRecord:", *(void *)(a1 + 32));
}

void __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)willDeleteSignedClinicalDataRecordWithSyncIdentifier:(id)a3
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __94__HDHealthRecordsIngestionServiceClient_willDeleteSignedClinicalDataRecordWithSyncIdentifier___block_invoke;
  v8[3] = &unk_2645EEA18;
  id v9 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__HDHealthRecordsIngestionServiceClient_willDeleteSignedClinicalDataRecordWithSyncIdentifier___block_invoke_2;
  v7[3] = &unk_2645EEA40;
  v7[4] = self;
  v7[5] = a2;
  id v6 = v5;
  [(HDHealthRecordsIngestionServiceClient *)self _fetchProxyWithHandler:v8 errorHandler:v7];
}

uint64_t __94__HDHealthRecordsIngestionServiceClient_willDeleteSignedClinicalDataRecordWithSyncIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_willDeleteSignedClinicalDataRecordWithSyncIdentifier:", *(void *)(a1 + 32));
}

void __94__HDHealthRecordsIngestionServiceClient_willDeleteSignedClinicalDataRecordWithSyncIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueDoubleObjectHandlerWithCompletion:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__HDHealthRecordsIngestionServiceClient_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke;
  v10[3] = &unk_2645EEA68;
  unint64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__HDHealthRecordsIngestionServiceClient_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke_2;
  v8[3] = &unk_2645EE630;
  id v9 = v11;
  id v7 = v11;
  [(HDHealthRecordsIngestionServiceClient *)self _fetchProxyWithHandler:v10 errorHandler:v8];
}

uint64_t __93__HDHealthRecordsIngestionServiceClient_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadIssuerRegistryWithOptions:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __93__HDHealthRecordsIngestionServiceClient_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueDoubleObjectHandlerWithCompletion:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__HDHealthRecordsIngestionServiceClient_triggerDownloadPublicKeysWithOptions_completion___block_invoke;
  v10[3] = &unk_2645EEA68;
  unint64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__HDHealthRecordsIngestionServiceClient_triggerDownloadPublicKeysWithOptions_completion___block_invoke_2;
  v8[3] = &unk_2645EE630;
  id v9 = v11;
  id v7 = v11;
  [(HDHealthRecordsIngestionServiceClient *)self _fetchProxyWithHandler:v10 errorHandler:v8];
}

uint64_t __89__HDHealthRecordsIngestionServiceClient_triggerDownloadPublicKeysWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadPublicKeysWithOptions:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __89__HDHealthRecordsIngestionServiceClient_triggerDownloadPublicKeysWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)_synchronousPerformWithProxyHandler:(id)a3 errorHandler:(id)a4
{
}

- (id)exportedInterface
{
  id v2 = objc_alloc_init(MEMORY[0x263F08D80]);

  return v2;
}

- (void).cxx_destruct
{
}

void __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_221D38000, v7, v8, "%{public}@ %{public}@ failed to connect to proxy: %{public}@", v9, v10, v11, v12, v13);
}

@end