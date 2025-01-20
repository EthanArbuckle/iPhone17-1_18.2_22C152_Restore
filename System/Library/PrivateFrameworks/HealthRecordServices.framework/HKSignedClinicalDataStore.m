@interface HKSignedClinicalDataStore
- (HKSignedClinicalDataStore)init;
- (HKSignedClinicalDataStore)initWithHealthStore:(id)a3;
- (NSString)description;
- (id)logPrefix;
- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)connectionInvalidated;
- (void)deleteSignedClinicalDataRecord:(id)a3 completion:(id)a4;
- (void)fetchCurrentRegistryIssuerContentVersionWithCompletion:(id)a3;
- (void)fetchCurrentRegistryPublicKeyContentVersionWithCompletion:(id)a3;
- (void)fetchPublicKeyEntriesWithCompletion:(id)a3;
- (void)fetchPublicKeyWithKeyID:(id)a3 completion:(id)a4;
- (void)fetchSignedClinicalDataGroupBackingMedicalRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)insertOrReplaceIssuerRegistryEntries:(id)a3 completion:(id)a4;
- (void)insertOrReplacePublicKeyEntries:(id)a3 completion:(id)a4;
- (void)parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)reextractSignedClinicalDataRecordsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)removePublicKeyEntriesWithKeyIDs:(id)a3 completion:(id)a4;
- (void)reverifySignatureForRecord:(id)a3 completion:(id)a4;
- (void)setRegistryIssuerContentVersion:(id)a3 completion:(id)a4;
- (void)setRegistryPublicKeyContentVersion:(id)a3 completion:(id)a4;
- (void)storeSignedClinicalData:(id)a3 completion:(id)a4;
- (void)triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4;
@end

@implementation HKSignedClinicalDataStore

- (HKSignedClinicalDataStore)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSignedClinicalDataStore;
  v5 = [(HKSignedClinicalDataStore *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F0A818]);
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    [(HKTaskServerProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  return (NSString *)v6;
}

- (id)logPrefix
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__HKSignedClinicalDataStore_parseSignedClinicalData_options_completion___block_invoke;
  v14[3] = &unk_2645EEC10;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__HKSignedClinicalDataStore_parseSignedClinicalData_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __72__HKSignedClinicalDataStore_parseSignedClinicalData_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_parseSignedClinicalData:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __72__HKSignedClinicalDataStore_parseSignedClinicalData_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeSignedClinicalData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__HKSignedClinicalDataStore_storeSignedClinicalData_completion___block_invoke;
  v12[3] = &unk_2645EEC38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HKSignedClinicalDataStore_storeSignedClinicalData_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __64__HKSignedClinicalDataStore_storeSignedClinicalData_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_storeSignedClinicalData:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __64__HKSignedClinicalDataStore_storeSignedClinicalData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSignedClinicalDataGroupBackingMedicalRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__HKSignedClinicalDataStore_fetchSignedClinicalDataGroupBackingMedicalRecord_options_completion___block_invoke;
  v14[3] = &unk_2645EEC10;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __97__HKSignedClinicalDataStore_fetchSignedClinicalDataGroupBackingMedicalRecord_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __97__HKSignedClinicalDataStore_fetchSignedClinicalDataGroupBackingMedicalRecord_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSignedClinicalDataGroupBackingMedicalRecord:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __97__HKSignedClinicalDataStore_fetchSignedClinicalDataGroupBackingMedicalRecord_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteSignedClinicalDataRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__HKSignedClinicalDataStore_deleteSignedClinicalDataRecord_completion___block_invoke;
  v12[3] = &unk_2645EEC38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__HKSignedClinicalDataStore_deleteSignedClinicalDataRecord_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __71__HKSignedClinicalDataStore_deleteSignedClinicalDataRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteSignedClinicalDataRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __71__HKSignedClinicalDataStore_deleteSignedClinicalDataRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reverifySignatureForRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  id v8 = self;
  v22 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke;
  v18[3] = &unk_2645EEC88;
  v18[4] = v8;
  id v19 = v7;
  v20 = v21;
  id v9 = (void *)MEMORY[0x223C90C60](v18);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_3;
  v15[3] = &unk_2645EEC38;
  id v16 = v6;
  id v17 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_4;
  v12[3] = &unk_2645EECB0;
  id v10 = v17;
  id v14 = v10;
  id v11 = v16;
  id v13 = v11;
  [(HKSignedClinicalDataStore *)v8 _fetchServerProxyWithHandler:v15 errorHandler:v12];

  _Block_object_dispose(v21, 8);
}

void __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_2;
  block[3] = &unk_2645EEC60;
  id v9 = *(id *)(a1 + 40);
  char v16 = a2;
  id v12 = v7;
  id v13 = v9;
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = a3;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

uint64_t __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_reverifySignatureForRecord:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  (*(void (**)(uint64_t, void, uint64_t, id))(v2 + 16))(v2, 0, [v3 signatureStatus], v4);
}

- (void)reextractSignedClinicalDataRecordsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__HKSignedClinicalDataStore_reextractSignedClinicalDataRecordsForAccountWithIdentifier_completion___block_invoke;
  v12[3] = &unk_2645EEC38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __99__HKSignedClinicalDataStore_reextractSignedClinicalDataRecordsForAccountWithIdentifier_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __99__HKSignedClinicalDataStore_reextractSignedClinicalDataRecordsForAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_reextractSignedClinicalDataRecordsForAccountWithIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __99__HKSignedClinicalDataStore_reextractSignedClinicalDataRecordsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCurrentRegistryIssuerContentVersionWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__HKSignedClinicalDataStore_fetchCurrentRegistryIssuerContentVersionWithCompletion___block_invoke;
  v8[3] = &unk_2645EECD8;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__HKSignedClinicalDataStore_fetchCurrentRegistryIssuerContentVersionWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __84__HKSignedClinicalDataStore_fetchCurrentRegistryIssuerContentVersionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCurrentRegistryIssuerContentVersionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __84__HKSignedClinicalDataStore_fetchCurrentRegistryIssuerContentVersionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRegistryIssuerContentVersion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__HKSignedClinicalDataStore_setRegistryIssuerContentVersion_completion___block_invoke;
  v12[3] = &unk_2645EEC38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HKSignedClinicalDataStore_setRegistryIssuerContentVersion_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __72__HKSignedClinicalDataStore_setRegistryIssuerContentVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setRegistryIssuerContentVersion:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __72__HKSignedClinicalDataStore_setRegistryIssuerContentVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertOrReplaceIssuerRegistryEntries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__HKSignedClinicalDataStore_insertOrReplaceIssuerRegistryEntries_completion___block_invoke;
  v12[3] = &unk_2645EEC38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__HKSignedClinicalDataStore_insertOrReplaceIssuerRegistryEntries_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __77__HKSignedClinicalDataStore_insertOrReplaceIssuerRegistryEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertOrReplaceIssuerRegistryEntries:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __77__HKSignedClinicalDataStore_insertOrReplaceIssuerRegistryEntries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCurrentRegistryPublicKeyContentVersionWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__HKSignedClinicalDataStore_fetchCurrentRegistryPublicKeyContentVersionWithCompletion___block_invoke;
  v8[3] = &unk_2645EECD8;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__HKSignedClinicalDataStore_fetchCurrentRegistryPublicKeyContentVersionWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __87__HKSignedClinicalDataStore_fetchCurrentRegistryPublicKeyContentVersionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCurrentRegistryPublicKeyContentVersionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __87__HKSignedClinicalDataStore_fetchCurrentRegistryPublicKeyContentVersionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRegistryPublicKeyContentVersion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HKSignedClinicalDataStore_setRegistryPublicKeyContentVersion_completion___block_invoke;
  v12[3] = &unk_2645EEC38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__HKSignedClinicalDataStore_setRegistryPublicKeyContentVersion_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __75__HKSignedClinicalDataStore_setRegistryPublicKeyContentVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setRegistryPublicKeyContentVersion:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __75__HKSignedClinicalDataStore_setRegistryPublicKeyContentVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertOrReplacePublicKeyEntries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__HKSignedClinicalDataStore_insertOrReplacePublicKeyEntries_completion___block_invoke;
  v12[3] = &unk_2645EEC38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HKSignedClinicalDataStore_insertOrReplacePublicKeyEntries_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __72__HKSignedClinicalDataStore_insertOrReplacePublicKeyEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertOrReplacePublicKeyEntries:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __72__HKSignedClinicalDataStore_insertOrReplacePublicKeyEntries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPublicKeyWithKeyID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__HKSignedClinicalDataStore_fetchPublicKeyWithKeyID_completion___block_invoke;
  v13[3] = &unk_2645EEC38;
  id v14 = v6;
  id v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HKSignedClinicalDataStore_fetchPublicKeyWithKeyID_completion___block_invoke_2;
  v10[3] = &unk_2645EED00;
  id v11 = v14;
  id v12 = v15;
  id v8 = v15;
  id v9 = v14;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v13 errorHandler:v10];
}

uint64_t __64__HKSignedClinicalDataStore_fetchPublicKeyWithKeyID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchPublicKeyWithKeyID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __64__HKSignedClinicalDataStore_fetchPublicKeyWithKeyID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HKSignedClinicalDataRegistryPublicKeyFetchResult alloc] initWithKeyID:*(void *)(a1 + 32) outcome:4 jwkData:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPublicKeyEntriesWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__HKSignedClinicalDataStore_fetchPublicKeyEntriesWithCompletion___block_invoke;
  v8[3] = &unk_2645EECD8;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__HKSignedClinicalDataStore_fetchPublicKeyEntriesWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __65__HKSignedClinicalDataStore_fetchPublicKeyEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchPublicKeyEntriesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __65__HKSignedClinicalDataStore_fetchPublicKeyEntriesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePublicKeyEntriesWithKeyIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__HKSignedClinicalDataStore_removePublicKeyEntriesWithKeyIDs_completion___block_invoke;
  v12[3] = &unk_2645EEC38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__HKSignedClinicalDataStore_removePublicKeyEntriesWithKeyIDs_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __73__HKSignedClinicalDataStore_removePublicKeyEntriesWithKeyIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removePublicKeyEntriesWithKeyIDs:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __73__HKSignedClinicalDataStore_removePublicKeyEntriesWithKeyIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueDoubleObjectHandlerWithCompletion:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__HKSignedClinicalDataStore_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke;
  v10[3] = &unk_2645EED28;
  unint64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__HKSignedClinicalDataStore_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke_2;
  v8[3] = &unk_2645EE630;
  id v9 = v11;
  id v7 = v11;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v10 errorHandler:v8];
}

uint64_t __81__HKSignedClinicalDataStore_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadIssuerRegistryWithOptions:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __81__HKSignedClinicalDataStore_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueDoubleObjectHandlerWithCompletion:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__HKSignedClinicalDataStore_triggerDownloadPublicKeysWithOptions_completion___block_invoke;
  v10[3] = &unk_2645EED28;
  unint64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__HKSignedClinicalDataStore_triggerDownloadPublicKeysWithOptions_completion___block_invoke_2;
  v8[3] = &unk_2645EE630;
  id v9 = v11;
  id v7 = v11;
  [(HKSignedClinicalDataStore *)self _fetchServerProxyWithHandler:v10 errorHandler:v8];
}

uint64_t __77__HKSignedClinicalDataStore_triggerDownloadPublicKeysWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadPublicKeysWithOptions:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __77__HKSignedClinicalDataStore_triggerDownloadPublicKeysWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(HKSignedClinicalDataStore *)self logPrefix];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_221D38000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ connection invalidated", (uint8_t *)&v6, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end