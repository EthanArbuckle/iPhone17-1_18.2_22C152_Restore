@interface HKCloudSyncControl
+ (id)taskIdentifier;
- (HKCloudSyncControl)initWithHealthStore:(id)a3;
- (id)defaultChangesSyncRequestForWatch;
- (void)accountConfigurationDidChangeWithCompletion:(id)a3;
- (void)disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3;
- (void)disableCloudSyncAndDeleteAllCloudDataWithProgress:(id)a3 completion:(id)a4;
- (void)disableCloudSyncWithCompletion:(id)a3;
- (void)enableCloudSyncWithCompletion:(id)a3;
- (void)fetchCloudDescriptionWithProgress:(id)a3 completion:(id)a4;
- (void)fetchCloudSyncProgress:(id)a3 completion:(id)a4;
- (void)fetchCloudSyncRequiredWithCompletion:(id)a3;
- (void)fetchCloudSyncStatusWithCompletion:(id)a3;
- (void)forceCloudResetWithProgress:(id)a3 completion:(id)a4;
- (void)forceCloudSyncDataUploadForProfileWithCompletion:(id)a3;
- (void)forceCloudSyncWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)forceCloudSyncWithOptions:(unint64_t)a3 progress:(id)a4 completion:(id)a5;
- (void)forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)oldestSampleStartDateInHealthDatabaseWithCompletion:(id)a3;
- (void)requestDataRefreshWithCompletion:(id)a3;
- (void)syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5;
@end

@implementation HKCloudSyncControl

- (HKCloudSyncControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCloudSyncControl;
  v5 = [(HKCloudSyncControl *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)defaultChangesSyncRequestForWatch
{
  v2 = [HKCloudSyncRequest alloc];
  v3 = [[HKChangesSyncRequest alloc] initWithPush:1 pull:0 lite:1];
  id v4 = [(HKCloudSyncRequest *)v2 initWithChangesSyncRequest:v3];

  return v4;
}

- (void)syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 73, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  objc_super v12 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v11];

  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__HKCloudSyncControl_syncWithRequest_reason_completion___block_invoke;
  v20[3] = &unk_1E58C5168;
  id v21 = v9;
  id v22 = v10;
  id v23 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__HKCloudSyncControl_syncWithRequest_reason_completion___block_invoke_2;
  v18[3] = &unk_1E58BBD88;
  id v19 = v23;
  id v14 = v23;
  id v15 = v10;
  id v16 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v20 errorHandler:v18];
}

uint64_t __56__HKCloudSyncControl_syncWithRequest_reason_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_syncWithRequest:reason:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __56__HKCloudSyncControl_syncWithRequest_reason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 86, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v9];

  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__HKCloudSyncControl_forceCloudSyncWithOptions_reason_completion___block_invoke;
  v16[3] = &unk_1E58C5190;
  unint64_t v18 = a3;
  int64_t v19 = a4;
  id v17 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HKCloudSyncControl_forceCloudSyncWithOptions_reason_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v17;
  id v12 = v17;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v16 errorHandler:v14];
}

id __66__HKCloudSyncControl_forceCloudSyncWithOptions_reason_completion___block_invoke(void *a1, void *a2)
{
  return (id)objc_msgSend(a2, "remote_forceCloudSyncWithOptions:reason:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __66__HKCloudSyncControl_forceCloudSyncWithOptions_reason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)forceCloudSyncDataUploadForProfileWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 103, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__HKCloudSyncControl_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke;
  v12[3] = &unk_1E58C51B8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HKCloudSyncControl_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

id __71__HKCloudSyncControl_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "remote_forceCloudSyncDataUploadForProfileWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __71__HKCloudSyncControl_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCloudSyncRequiredWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HKCloudSyncControl_fetchCloudSyncRequiredWithCompletion___block_invoke;
  v6[3] = &unk_1E58C51E0;
  id v7 = v4;
  id v5 = v4;
  [(HKCloudSyncControl *)self fetchCloudSyncStatusWithCompletion:v6];
}

void __59__HKCloudSyncControl_fetchCloudSyncRequiredWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a6;
  if (v13)
  {
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:v13];
  }
  if (objc_msgSend(v10, "hk_isHealthKitErrorWithCode:", 701)) {
    id v12 = 0;
  }
  else {
    id v12 = v10;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCloudSyncStatusWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 131, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58C5230;
  aBlock[4] = self;
  id v15 = v5;
  v6 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_3;
  v12[3] = &unk_1E58C51B8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_4;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

void __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_2;
  block[3] = &unk_1E58C5208;
  id v15 = *(id *)(a1 + 40);
  char v24 = a2;
  id v20 = v11;
  id v21 = v12;
  char v25 = a5;
  id v22 = v13;
  id v23 = v15;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

uint64_t __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 65), *(void *)(a1 + 48));
}

uint64_t __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCloudSyncStatusWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCloudSyncProgress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 149, @"Invalid parameter not satisfying: %@", @"progressHandler != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 150, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueProgressHandlerWithHandler:v7];

  id v11 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v9];

  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__HKCloudSyncControl_fetchCloudSyncProgress_completion___block_invoke;
  v19[3] = &unk_1E58C5258;
  id v20 = v11;
  id v21 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__HKCloudSyncControl_fetchCloudSyncProgress_completion___block_invoke_2;
  v17[3] = &unk_1E58BBD88;
  id v18 = v20;
  id v13 = v20;
  id v14 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v19 errorHandler:v17];
}

uint64_t __56__HKCloudSyncControl_fetchCloudSyncProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "remote_fetchCloudSyncProgressWithCompletion:", *(void *)(a1 + 32));
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __56__HKCloudSyncControl_fetchCloudSyncProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 progress:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 169, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  id v11 = [(HKProxyProvider *)self->_proxyProvider clientQueueProgressHandlerWithHandler:v9];

  id v12 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__HKCloudSyncControl_forceCloudSyncWithOptions_progress_completion___block_invoke;
  v19[3] = &unk_1E58C5280;
  unint64_t v22 = a3;
  id v20 = v12;
  id v21 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__HKCloudSyncControl_forceCloudSyncWithOptions_progress_completion___block_invoke_2;
  v17[3] = &unk_1E58BBD88;
  id v18 = v20;
  id v14 = v20;
  id v15 = v11;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v19 errorHandler:v17];
}

uint64_t __68__HKCloudSyncControl_forceCloudSyncWithOptions_progress_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "remote_forceCloudSyncWithOptions:reason:completion:", a1[6], 1, a1[4]);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(a1[5] + 16))();
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __68__HKCloudSyncControl_forceCloudSyncWithOptions_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceCloudResetWithProgress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 187, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueProgressHandlerWithHandler:v7];

  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__HKCloudSyncControl_forceCloudResetWithProgress_completion___block_invoke;
  v17[3] = &unk_1E58C5258;
  id v18 = v10;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__HKCloudSyncControl_forceCloudResetWithProgress_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v18;
  id v12 = v18;
  id v13 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __61__HKCloudSyncControl_forceCloudResetWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "remote_forceCloudResetWithCompletion:", *(void *)(a1 + 32));
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __61__HKCloudSyncControl_forceCloudResetWithProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCloudDescriptionWithProgress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 205, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueProgressHandlerWithHandler:v7];

  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueDoubleObjectHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HKCloudSyncControl_fetchCloudDescriptionWithProgress_completion___block_invoke;
  v17[3] = &unk_1E58C5258;
  id v18 = v10;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HKCloudSyncControl_fetchCloudDescriptionWithProgress_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v18;
  id v12 = v18;
  id v13 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __67__HKCloudSyncControl_fetchCloudDescriptionWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "remote_fetchCloudDescriptionWithCompletion:", *(void *)(a1 + 32));
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __67__HKCloudSyncControl_fetchCloudDescriptionWithProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableCloudSyncAndDeleteAllCloudDataWithProgress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 223, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueProgressHandlerWithHandler:v7];

  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v8];

  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithProgress_completion___block_invoke;
  v17[3] = &unk_1E58C5258;
  id v18 = v10;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithProgress_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v18;
  id v12 = v18;
  id v13 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __83__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion:", *(void *)(a1 + 32));
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __83__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableCloudSyncWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 240, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__HKCloudSyncControl_disableCloudSyncWithCompletion___block_invoke;
  v12[3] = &unk_1E58C51B8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__HKCloudSyncControl_disableCloudSyncWithCompletion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __53__HKCloudSyncControl_disableCloudSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_disableCloudSyncWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __53__HKCloudSyncControl_disableCloudSyncWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableCloudSyncWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 253, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__HKCloudSyncControl_enableCloudSyncWithCompletion___block_invoke;
  v12[3] = &unk_1E58C51B8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HKCloudSyncControl_enableCloudSyncWithCompletion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __52__HKCloudSyncControl_enableCloudSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_enableCloudSyncWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __52__HKCloudSyncControl_enableCloudSyncWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 266, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke;
  v12[3] = &unk_1E58C51B8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

id __74__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __74__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accountConfigurationDidChangeWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 278, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HKCloudSyncControl_accountConfigurationDidChangeWithCompletion___block_invoke;
  v12[3] = &unk_1E58C51B8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HKCloudSyncControl_accountConfigurationDidChangeWithCompletion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __66__HKCloudSyncControl_accountConfigurationDidChangeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_accountConfigurationDidChangeWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __66__HKCloudSyncControl_accountConfigurationDidChangeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)oldestSampleStartDateInHealthDatabaseWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKCloudSyncControl.m", 290, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HKCloudSyncControl_oldestSampleStartDateInHealthDatabaseWithCompletion___block_invoke;
  v12[3] = &unk_1E58C51B8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HKCloudSyncControl_oldestSampleStartDateInHealthDatabaseWithCompletion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __74__HKCloudSyncControl_oldestSampleStartDateInHealthDatabaseWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_oldestSampleStartDateInHealthDatabaseWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __74__HKCloudSyncControl_oldestSampleStartDateInHealthDatabaseWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestDataRefreshWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);
  }
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke;
  v14[3] = &unk_1E58C51B8;
  id v15 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke_2;
  v12[3] = &unk_1E58BBC48;
  void v12[4] = self;
  id v13 = v15;
  id v11 = v15;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestDataRefreshWithCompletion:", *(void *)(a1 + 32));
}

void __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

void __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call remote_requestDataRefreshWithCompletion, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end