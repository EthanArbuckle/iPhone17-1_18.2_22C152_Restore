@interface HKSharedSummaryTransactionBuilder
+ (id)clientInterface;
+ (id)serverInterface;
- (HKHealthStore)healthStore;
- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3;
- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3 transactionUUID:(id)a4;
- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3 transactionUUID:(id)a4 allowCommitted:(BOOL)a5;
- (NSUUID)transactionUUID;
- (id)exportedInterface;
- (id)isCommittedWithError:(id *)a3;
- (id)remoteInterface;
- (void)addMetadata:(id)a3 completion:(id)a4;
- (void)addSummaries:(id)a3 completion:(id)a4;
- (void)addedSummariesWithPackage:(id)a3 names:(id)a4 resultsHandler:(id)a5;
- (void)commitAsUrgent:(BOOL)a3 completion:(id)a4;
- (void)commitWithCompletion:(id)a3;
- (void)discardWithCompletion:(id)a3;
- (void)removeAllSummariesWithPackage:(id)a3 completion:(id)a4;
- (void)removeSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5;
- (void)removeSummariesWithUUIDs:(id)a3 completion:(id)a4;
- (void)reuseAllSummariesWithPackage:(id)a3 completion:(id)a4;
- (void)reuseSummaries:(id)a3 completion:(id)a4;
- (void)reuseSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5;
- (void)reuseSummariesWithUUIDs:(id)a3 completion:(id)a4;
@end

@implementation HKSharedSummaryTransactionBuilder

- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3
{
  return [(HKSharedSummaryTransactionBuilder *)self initWithHealthStore:a3 transactionUUID:0];
}

- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3 transactionUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 profileIdentifier];
  BOOL v9 = [v8 type] == 2;

  v10 = [(HKSharedSummaryTransactionBuilder *)self initWithHealthStore:v7 transactionUUID:v6 allowCommitted:v9];
  return v10;
}

- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3 transactionUUID:(id)a4 allowCommitted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HKSharedSummaryTransactionBuilder;
  v10 = [(HKSharedSummaryTransactionBuilder *)&v21 init];
  if (v10)
  {
    if (v9)
    {
      uint64_t v11 = [v9 copy];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    }
    transactionUUID = v10->_transactionUUID;
    v10->_transactionUUID = (NSUUID *)v11;

    objc_storeWeak((id *)&v10->_healthStore, v8);
    v13 = [HKTaskServerProxyProvider alloc];
    v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [(HKTaskServerProxyProvider *)v13 initWithHealthStore:v8 taskIdentifier:@"HKSharedSummaryTransactionBuilderServerIdentifier" exportedObject:v10 taskUUID:v14];
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v15;

    v17 = objc_alloc_init(HKSharedSummaryTransactionBuilderTaskConfiguration);
    [(HKSharedSummaryTransactionBuilderTaskConfiguration *)v17 setTransactionUUID:v10->_transactionUUID];
    [(HKSharedSummaryTransactionBuilderTaskConfiguration *)v17 setAllowCommitted:v5];
    [(HKTaskServerProxyProvider *)v10->_proxyProvider setTaskConfiguration:v17];
    _HKInitializeLogging();
    v18 = HKLogSharing();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(NSUUID *)v10->_transactionUUID UUIDString];
      *(_DWORD *)buf = 138543618;
      v23 = v10;
      __int16 v24 = 2114;
      v25 = v19;
      _os_log_impl(&dword_19C023000, v18, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Created new builder for transaction %{public}@", buf, 0x16u);
    }
  }

  return v10;
}

- (id)isCommittedWithError:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__35;
  v16 = __Block_byref_object_dispose__35;
  id v17 = 0;
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke;
  v11[3] = &unk_1E58C5340;
  v11[4] = &v18;
  v11[5] = &v12;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke_3;
  v10[3] = &unk_1E58BDBD8;
  v10[4] = &v12;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v11 errorHandler:v10];
  BOOL v5 = (void *)v13[5];
  if (v5)
  {
    id v6 = v5;
    id v7 = v6;
    if (a3) {
      *a3 = v6;
    }
    else {
      _HKLogDroppedError(v6);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = [NSNumber numberWithBool:*((unsigned __int8 *)v19 + 24)];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

uint64_t __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke_2;
  v3[3] = &unk_1E58C5318;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getCommitStatusWithCompletion:", v3);
}

void __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)addSummaries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke;
  v13[3] = &unk_1E58C5368;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_3;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

void __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_2;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addSummaries:completion:", v3, v4);
}

uint64_t __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reuseSummaries:(id)a3 completion:(id)a4
{
  proxyProvider = self->_proxyProvider;
  id v7 = a3;
  id v8 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:a4];
  id v9 = objc_msgSend(v7, "hk_map:", &__block_literal_global_84);

  id v10 = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_2;
  v15[3] = &unk_1E58C5368;
  id v16 = v9;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4;
  v13[3] = &unk_1E58BBC48;
  void v13[4] = self;
  id v14 = v17;
  id v11 = v17;
  id v12 = v9;
  [(HKProxyProvider *)v10 fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_3;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_reuseSummariesWithUUIDs:completion:", v3, v4);
}

uint64_t __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reuseSummariesWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HKSharedSummaryTransactionBuilder_reuseSummariesWithUUIDs_completion___block_invoke;
  v13[3] = &unk_1E58C5368;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HKSharedSummaryTransactionBuilder_reuseSummariesWithUUIDs_completion___block_invoke_2;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __72__HKSharedSummaryTransactionBuilder_reuseSummariesWithUUIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_reuseSummariesWithUUIDs:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __72__HKSharedSummaryTransactionBuilder_reuseSummariesWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reuseSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__HKSharedSummaryTransactionBuilder_reuseSummariesWithPackage_names_completion___block_invoke;
  v17[3] = &unk_1E58C53B0;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HKSharedSummaryTransactionBuilder_reuseSummariesWithPackage_names_completion___block_invoke_2;
  v15[3] = &unk_1E58BBC48;
  void v15[4] = self;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __80__HKSharedSummaryTransactionBuilder_reuseSummariesWithPackage_names_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_reuseSummariesWithPackage:names:completion:", a1[4], a1[5], a1[6]);
}

void __80__HKSharedSummaryTransactionBuilder_reuseSummariesWithPackage_names_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reuseAllSummariesWithPackage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__HKSharedSummaryTransactionBuilder_reuseAllSummariesWithPackage_completion___block_invoke;
  v13[3] = &unk_1E58C5368;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HKSharedSummaryTransactionBuilder_reuseAllSummariesWithPackage_completion___block_invoke_2;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __77__HKSharedSummaryTransactionBuilder_reuseAllSummariesWithPackage_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_reuseAllSummariesWithPackage:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __77__HKSharedSummaryTransactionBuilder_reuseAllSummariesWithPackage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke;
  v13[3] = &unk_1E58C5368;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke_2;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_addMetadata:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeSummariesWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke;
  v13[3] = &unk_1E58C5368;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

void __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_2;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_removeSummariesWithUUIDs:completion:", v3, v4);
}

uint64_t __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke;
  v17[3] = &unk_1E58C53B0;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke_3;
  v15[3] = &unk_1E58BBC48;
  void v15[4] = self;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

void __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke_2;
  v5[3] = &unk_1E58BBD38;
  id v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_removeSummariesWithPackage:names:completion:", v3, v4, v5);
}

uint64_t __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeAllSummariesWithPackage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke;
  v13[3] = &unk_1E58C5368;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke_3;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

void __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke_2;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_removeAllSummariesWithPackage:completion:", v3, v4);
}

uint64_t __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)commitAsUrgent:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  _HKInitializeLogging();
  id v7 = HKLogSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NSUUID *)self->_transactionUUID UUIDString];
    id v9 = (void *)v8;
    id v10 = @"NO";
    *(_DWORD *)buf = 138543874;
    id v19 = self;
    __int16 v20 = 2114;
    if (v4) {
      id v10 = @"YES";
    }
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Commiting transaction %{public}@ urgent: %{public}@", buf, 0x20u);
  }
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke;
  v15[3] = &unk_1E58C53D8;
  BOOL v17 = v4;
  id v16 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke_2;
  v13[3] = &unk_1E58BBC48;
  void v13[4] = self;
  id v14 = v16;
  id v12 = v16;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_commitAsUrgent:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

void __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  BOOL v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)commitWithCompletion:(id)a3
{
}

- (void)discardWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  _HKInitializeLogging();
  id v5 = HKLogSharing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSUUID *)self->_transactionUUID UUIDString];
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Discarding transaction %{public}@", buf, 0x16u);
  }
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke;
  v11[3] = &unk_1E58C5400;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_3;
  v9[3] = &unk_1E58BBC48;
  v9[4] = self;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

void __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_2;
  v3[3] = &unk_1E58BBD38;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_discardWithCompletion:", v3);
}

uint64_t __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addedSummariesWithPackage:(id)a3 names:(id)a4 resultsHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke;
  v22[3] = &unk_1E58C5450;
  v22[4] = self;
  id v23 = v10;
  id v11 = (void *)[v22 copy];
  proxyProvider = self->_proxyProvider;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_3;
  v18[3] = &unk_1E58C53B0;
  id v19 = v8;
  id v20 = v9;
  id v21 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_4;
  v16[3] = &unk_1E58BBC48;
  v16[4] = self;
  id v17 = v21;
  id v13 = v21;
  id v14 = v9;
  id v15 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v18 errorHandler:v16];
}

void __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__35;
  v19[4] = __Block_byref_object_dispose__35;
  id v20 = *(id *)(a1 + 32);
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_2;
  block[3] = &unk_1E58C5428;
  id v10 = *(id *)(a1 + 40);
  char v18 = a3;
  id v14 = v7;
  id v15 = v8;
  id v16 = v10;
  id v17 = v19;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);

  _Block_object_dispose(v19, 8);
}

void __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

uint64_t __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_3(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addedSummariesWithPackage:names:resultsHandler:", a1[4], a1[5], a1[6]);
}

void __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_4_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53330];
}

+ (id)serverInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53390];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_remote_addSummaries_completion_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v5 forSelector:sel_remote_addedSummariesWithPackage_names_resultsHandler_ argumentIndex:0 ofReply:1];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_remote_reuseSummariesWithUUIDs_completion_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v8 forSelector:sel_remote_removeSummariesWithUUIDs_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)exportedInterface
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (NSUUID)transactionUUID
{
  return self->_transactionUUID;
}

- (HKHealthStore)healthStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthStore);

  return (HKHealthStore *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_healthStore);
  objc_storeStrong((id *)&self->_transactionUUID, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error adding summaries to transaction %{public}@");
}

void __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error reusing summaries in transaction %{public}@");
}

void __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error adding metadata to transaction %{public}@");
}

void __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error removing summaries from transaction %{public}@");
}

void __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error committing transaction %{public}@");
}

void __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error discarding transaction %{public}@");
}

void __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Error retrieving added summaries %{public}@");
}

@end