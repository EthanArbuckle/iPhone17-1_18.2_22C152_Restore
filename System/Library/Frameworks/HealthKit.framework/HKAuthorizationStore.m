@interface HKAuthorizationStore
+ (id)readTaskIdentifier;
+ (id)resetTaskIdentifier;
+ (id)writeTaskIdentifier;
- (BOOL)validateRecalibrateEstimatesRequestRecord:(id)a3 error:(id *)a4;
- (HKAuthorizationStore)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)fetchAuthorizationContextForPromptSession:(id)a3 error:(id *)a4;
- (id)remoteInterface;
- (void)_fetchReadProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_fetchResetProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_fetchSynchronousReadProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_fetchWriteProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)fetchAuthorizationRecordsForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)fetchAuthorizationRecordsForType:(id)a3 completion:(id)a4;
- (void)fetchAuthorizationStatusesForDocumentType:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)fetchAuthorizationStatusesForSample:(id)a3 completion:(id)a4;
- (void)fetchSourcesRequestingAuthorizationForTypes:(id)a3 completion:(id)a4;
- (void)recalibrateEstimatesForSampleType:(id)a3 effectiveDate:(id)a4 completion:(id)a5;
- (void)resetAllObjectAuthorizationStatusForBundleIdentifier:(id)a3 objectType:(id)a4 completion:(id)a5;
- (void)resetAuthorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)resetAuthorizationStatusesForObjects:(id)a3 completion:(id)a4;
- (void)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7;
- (void)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7;
- (void)setRequestedAuthorizationForBundleIdentifier:(id)a3 shareTypes:(id)a4 readTypes:(id)a5 completion:(id)a6;
@end

@implementation HKAuthorizationStore

- (HKAuthorizationStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HKAuthorizationStore;
  v5 = [(HKAuthorizationStore *)&v28 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() readTaskIdentifier];
    v8 = HKAuthorizationStoreClientInterface();
    v9 = HKAuthorizationStoreReadServerInterface();
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 exportedInterface:v8 remoteInterface:v9 taskUUID:v10];
    readProxyProvider = v5->_readProxyProvider;
    v5->_readProxyProvider = (HKProxyProvider *)v11;

    [(HKProxyProvider *)v5->_readProxyProvider setShouldRetryOnInterruption:0];
    v13 = [HKTaskServerProxyProvider alloc];
    v14 = [(id)objc_opt_class() writeTaskIdentifier];
    v15 = HKAuthorizationStoreClientInterface();
    v16 = HKAuthorizationStoreWriteServerInterface();
    v17 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v18 = [(HKTaskServerProxyProvider *)v13 initWithHealthStore:v4 taskIdentifier:v14 exportedObject:v5 exportedInterface:v15 remoteInterface:v16 taskUUID:v17];
    writeProxyProvider = v5->_writeProxyProvider;
    v5->_writeProxyProvider = (HKProxyProvider *)v18;

    [(HKProxyProvider *)v5->_writeProxyProvider setShouldRetryOnInterruption:0];
    v20 = [HKTaskServerProxyProvider alloc];
    v21 = [(id)objc_opt_class() resetTaskIdentifier];
    v22 = HKAuthorizationStoreClientInterface();
    v23 = HKAuthorizationStoreResetServerInterface();
    v24 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v25 = [(HKTaskServerProxyProvider *)v20 initWithHealthStore:v4 taskIdentifier:v21 exportedObject:v5 exportedInterface:v22 remoteInterface:v23 taskUUID:v24];
    resetProxyProvider = v5->_resetProxyProvider;
    v5->_resetProxyProvider = (HKProxyProvider *)v25;

    [(HKProxyProvider *)v5->_resetProxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)readTaskIdentifier
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@.%@", v4, @"read"];

  return v5;
}

+ (id)writeTaskIdentifier
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@.%@", v4, @"write"];

  return v5;
}

+ (id)resetTaskIdentifier
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@.%@", v4, @"reset"];

  return v5;
}

- (void)_fetchReadProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)_fetchSynchronousReadProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)_fetchWriteProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)_fetchResetProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void)fetchAuthorizationRecordsForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 103, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 104, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [(HKProxyProvider *)self->_readProxyProvider clientQueueObjectHandlerWithCompletion:v9];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__HKAuthorizationStore_fetchAuthorizationRecordsForBundleIdentifier_completion___block_invoke;
  v17[3] = &unk_1E58BFEC0;
  id v18 = v7;
  id v19 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HKAuthorizationStore_fetchAuthorizationRecordsForBundleIdentifier_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v11 = v19;
  id v12 = v7;
  [(HKAuthorizationStore *)self _fetchReadProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __80__HKAuthorizationStore_fetchAuthorizationRecordsForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAuthorizationRecordsForSourceBundleIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __80__HKAuthorizationStore_fetchAuthorizationRecordsForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAuthorizationRecordsForType:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 118, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 119, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [(HKProxyProvider *)self->_readProxyProvider clientQueueObjectHandlerWithCompletion:v9];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__HKAuthorizationStore_fetchAuthorizationRecordsForType_completion___block_invoke;
  v17[3] = &unk_1E58BFEC0;
  id v18 = v7;
  id v19 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__HKAuthorizationStore_fetchAuthorizationRecordsForType_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v11 = v19;
  id v12 = v7;
  [(HKAuthorizationStore *)self _fetchReadProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __68__HKAuthorizationStore_fetchAuthorizationRecordsForType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAuthorizationRecordsForType:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __68__HKAuthorizationStore_fetchAuthorizationRecordsForType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSourcesRequestingAuthorizationForTypes:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 133, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v9 = [(HKProxyProvider *)self->_readProxyProvider clientQueueObjectHandlerWithCompletion:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__HKAuthorizationStore_fetchSourcesRequestingAuthorizationForTypes_completion___block_invoke;
  v15[3] = &unk_1E58BFEC0;
  id v16 = v7;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HKAuthorizationStore_fetchSourcesRequestingAuthorizationForTypes_completion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v10 = v17;
  id v11 = v7;
  [(HKAuthorizationStore *)self _fetchReadProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __79__HKAuthorizationStore_fetchSourcesRequestingAuthorizationForTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSourcesRequestingAuthorizationForTypes:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __79__HKAuthorizationStore_fetchSourcesRequestingAuthorizationForTypes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if ([v13 count])
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_6:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 151, @"Invalid parameter not satisfying: %@", @"authorizationModes != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
LABEL_7:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 152, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];

    goto LABEL_4;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 150, @"Invalid parameter not satisfying: %@", @"[authorizationStatuses count] > 0" object file lineNumber description];

  if (!v14) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v15) {
    goto LABEL_7;
  }
LABEL_4:
  id v17 = [(HKProxyProvider *)self->_writeProxyProvider clientQueueActionHandlerWithCompletion:v16];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __107__HKAuthorizationStore_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke;
  v27[3] = &unk_1E58BFEE8;
  id v28 = v13;
  id v29 = v14;
  id v30 = v15;
  unint64_t v32 = a6;
  id v31 = v17;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __107__HKAuthorizationStore_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke_2;
  v25[3] = &unk_1E58BBD88;
  id v26 = v31;
  id v18 = v31;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  [(HKAuthorizationStore *)self _fetchWriteProxyWithHandler:v27 errorHandler:v25];
}

uint64_t __107__HKAuthorizationStore_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", a1[4], a1[5], a1[6], a1[8], a1[7]);
}

uint64_t __107__HKAuthorizationStore_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRequestedAuthorizationForBundleIdentifier:(id)a3 shareTypes:(id)a4 readTypes:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 172, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  if (![v12 count] && !objc_msgSend(v13, "count")) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must request authorization for at least one data type"];
  }
  id v15 = [(HKProxyProvider *)self->_writeProxyProvider clientQueueActionHandlerWithCompletion:v14];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__HKAuthorizationStore_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke;
  v23[3] = &unk_1E58BFF10;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __101__HKAuthorizationStore_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke_2;
  v21[3] = &unk_1E58BBD88;
  id v22 = v27;
  id v16 = v27;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  [(HKAuthorizationStore *)self _fetchWriteProxyWithHandler:v23 errorHandler:v21];
}

uint64_t __101__HKAuthorizationStore_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setRequestedAuthorizationForBundleIdentifier:shareTypes:readTypes:completion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __101__HKAuthorizationStore_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetAuthorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_resetProxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__HKAuthorizationStore_resetAuthorizationStatusForBundleIdentifier_completion___block_invoke;
  v12[3] = &unk_1E58BFF38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__HKAuthorizationStore_resetAuthorizationStatusForBundleIdentifier_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKAuthorizationStore *)self _fetchResetProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __79__HKAuthorizationStore_resetAuthorizationStatusForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetAuthorizationStatusForBundleIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __79__HKAuthorizationStore_resetAuthorizationStatusForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAuthorizationStatusesForDocumentType:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 209, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 210, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_4;
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 208, @"Invalid parameter not satisfying: %@", @"documentType" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  id v12 = [(HKProxyProvider *)self->_readProxyProvider clientQueueObjectHandlerWithCompletion:v11];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__HKAuthorizationStore_fetchAuthorizationStatusesForDocumentType_bundleIdentifier_completion___block_invoke;
  v21[3] = &unk_1E58BFF60;
  id v22 = v9;
  id v23 = v10;
  id v24 = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__HKAuthorizationStore_fetchAuthorizationStatusesForDocumentType_bundleIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E58BBD88;
  id v20 = v24;
  id v13 = v24;
  id v14 = v10;
  id v15 = v9;
  [(HKAuthorizationStore *)self _fetchReadProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __94__HKAuthorizationStore_fetchAuthorizationStatusesForDocumentType_bundleIdentifier_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAuthorizationStatusesForDocumentType:sourceBundleIdentifier:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __94__HKAuthorizationStore_fetchAuthorizationStatusesForDocumentType_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAuthorizationStatusesForSample:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 226, @"Invalid parameter not satisfying: %@", @"sample" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKAuthorizationStore.m", 227, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = [(HKProxyProvider *)self->_readProxyProvider clientQueueObjectHandlerWithCompletion:v9];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__HKAuthorizationStore_fetchAuthorizationStatusesForSample_completion___block_invoke;
  v17[3] = &unk_1E58BFEC0;
  id v18 = v7;
  id v19 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__HKAuthorizationStore_fetchAuthorizationStatusesForSample_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v11 = v19;
  id v12 = v7;
  [(HKAuthorizationStore *)self _fetchReadProxyWithHandler:v17 errorHandler:v15];
}

void __71__HKAuthorizationStore_fetchAuthorizationStatusesForSample_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 UUID];
  objc_msgSend(v4, "remote_fetchAuthorizationStatusesForSampleUUID:completion:", v5, *(void *)(a1 + 40));
}

uint64_t __71__HKAuthorizationStore_fetchAuthorizationStatusesForSample_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchAuthorizationContextForPromptSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__10;
  id v27 = __Block_byref_object_dispose__10;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__10;
  id v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke;
  v13[3] = &unk_1E58BFFB0;
  id v7 = v6;
  id v14 = v7;
  id v15 = &v23;
  id v16 = &v17;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke_3;
  v12[3] = &unk_1E58BDBD8;
  void v12[4] = &v17;
  [(HKAuthorizationStore *)self _fetchSynchronousReadProxyWithHandler:v13 errorHandler:v12];
  id v8 = (id)v18[5];
  id v9 = v8;
  if (v8)
  {
    if (a4) {
      *a4 = v8;
    }
    else {
      _HKLogDroppedError(v8);
    }
  }

  id v10 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v10;
}

uint64_t __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke_2;
  v4[3] = &unk_1E58BFF88;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchAuthorizationContextForPromptSession:completion:", v2, v4);
}

void __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(HKProxyProvider *)self->_writeProxyProvider clientQueueActionHandlerWithCompletion:a7];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __115__HKAuthorizationStore_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion___block_invoke;
  v24[3] = &unk_1E58BFFD8;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __115__HKAuthorizationStore_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion___block_invoke_2;
  v22[3] = &unk_1E58BBD88;
  id v23 = v29;
  id v17 = v29;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  [(HKAuthorizationStore *)self _fetchWriteProxyWithHandler:v24 errorHandler:v22];
}

uint64_t __115__HKAuthorizationStore_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setObjectAuthorizationStatuses:objectType:bundleIdentifier:sessionIdentifier:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

uint64_t __115__HKAuthorizationStore_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetAuthorizationStatusesForObjects:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_resetProxyProvider clientQueueActionHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HKAuthorizationStore_resetAuthorizationStatusesForObjects_completion___block_invoke;
  v12[3] = &unk_1E58BFF38;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HKAuthorizationStore_resetAuthorizationStatusesForObjects_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKAuthorizationStore *)self _fetchResetProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __72__HKAuthorizationStore_resetAuthorizationStatusesForObjects_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetAuthorizationStatusesForObjects:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __72__HKAuthorizationStore_resetAuthorizationStatusesForObjects_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetAllObjectAuthorizationStatusForBundleIdentifier:(id)a3 objectType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_resetProxyProvider clientQueueActionHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__HKAuthorizationStore_resetAllObjectAuthorizationStatusForBundleIdentifier_objectType_completion___block_invoke;
  v16[3] = &unk_1E58C0000;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__HKAuthorizationStore_resetAllObjectAuthorizationStatusForBundleIdentifier_objectType_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKAuthorizationStore *)self _fetchResetProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __99__HKAuthorizationStore_resetAllObjectAuthorizationStatusForBundleIdentifier_objectType_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetObjectAuthorizationStatusForBundleIdentifier:objectType:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __99__HKAuthorizationStore_resetAllObjectAuthorizationStatusForBundleIdentifier_objectType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)validateRecalibrateEstimatesRequestRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__10;
  id v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke;
  v13[3] = &unk_1E58BFFB0;
  id v7 = v6;
  id v14 = v7;
  id v15 = &v23;
  id v16 = &v17;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke_3;
  v12[3] = &unk_1E58BDBD8;
  void v12[4] = &v17;
  [(HKAuthorizationStore *)self _fetchSynchronousReadProxyWithHandler:v13 errorHandler:v12];
  id v8 = (id)v18[5];
  id v9 = v8;
  if (v8)
  {
    if (a4) {
      *a4 = v8;
    }
    else {
      _HKLogDroppedError(v8);
    }
  }

  char v10 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

uint64_t __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke_2;
  v4[3] = &unk_1E58BE050;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_validateRecalibrateEstimatesRequestRecord:completion:", v2, v4);
}

void __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)recalibrateEstimatesForSampleType:(id)a3 effectiveDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(HKProxyProvider *)self->_resetProxyProvider clientQueueActionHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__HKAuthorizationStore_recalibrateEstimatesForSampleType_effectiveDate_completion___block_invoke;
  v16[3] = &unk_1E58C0000;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__HKAuthorizationStore_recalibrateEstimatesForSampleType_effectiveDate_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKAuthorizationStore *)self _fetchResetProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __83__HKAuthorizationStore_recalibrateEstimatesForSampleType_effectiveDate_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_recalibrateEstimatesForSampleType:effectiveDate:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __83__HKAuthorizationStore_recalibrateEstimatesForSampleType_effectiveDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetProxyProvider, 0);
  objc_storeStrong((id *)&self->_writeProxyProvider, 0);

  objc_storeStrong((id *)&self->_readProxyProvider, 0);
}

@end