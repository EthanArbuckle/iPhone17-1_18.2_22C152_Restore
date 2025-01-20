@interface HKStaticSyncControl
+ (id)taskIdentifier;
- (HKStaticSyncControl)initWithHealthStore:(id)a3;
- (void)runStaticSyncExportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 batchSize:(unint64_t)a6 progressHandler:(id)a7 completion:(id)a8;
- (void)runStaticSyncImportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 progressHandler:(id)a6 completion:(id)a7;
@end

@implementation HKStaticSyncControl

- (HKStaticSyncControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKStaticSyncControl;
  v5 = [(HKStaticSyncControl *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)runStaticSyncExportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 batchSize:(unint64_t)a6 progressHandler:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  proxyProvider = self->_proxyProvider;
  id v17 = a8;
  v18 = [(HKProxyProvider *)proxyProvider clientQueueProgressHandlerWithHandler:a7];
  v19 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v17];

  v20 = self->_proxyProvider;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __111__HKStaticSyncControl_runStaticSyncExportWithOptions_storeIdentifier_URL_batchSize_progressHandler_completion___block_invoke;
  v27[3] = &unk_1E58C27A8;
  id v28 = v14;
  id v29 = v15;
  unint64_t v32 = a3;
  unint64_t v33 = a6;
  id v30 = v19;
  id v31 = v18;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __111__HKStaticSyncControl_runStaticSyncExportWithOptions_storeIdentifier_URL_batchSize_progressHandler_completion___block_invoke_2;
  v25[3] = &unk_1E58BBD88;
  id v26 = v30;
  id v21 = v30;
  id v22 = v18;
  id v23 = v15;
  id v24 = v14;
  [(HKProxyProvider *)v20 fetchProxyWithHandler:v27 errorHandler:v25];
}

uint64_t __111__HKStaticSyncControl_runStaticSyncExportWithOptions_storeIdentifier_URL_batchSize_progressHandler_completion___block_invoke(void *a1, void *a2)
{
  objc_msgSend(a2, "remote_runStaticSyncExportWithOptions:storeIdentifier:URL:batchSize:completion:", a1[8], a1[4], a1[5], a1[9], a1[6]);
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(a1[7] + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __111__HKStaticSyncControl_runStaticSyncExportWithOptions_storeIdentifier_URL_batchSize_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runStaticSyncImportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 progressHandler:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  proxyProvider = self->_proxyProvider;
  id v15 = a7;
  v16 = [(HKProxyProvider *)proxyProvider clientQueueProgressHandlerWithHandler:a6];
  id v17 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v15];

  v18 = self->_proxyProvider;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__HKStaticSyncControl_runStaticSyncImportWithOptions_storeIdentifier_URL_progressHandler_completion___block_invoke;
  v25[3] = &unk_1E58C27D0;
  unint64_t v30 = a3;
  id v26 = v12;
  id v27 = v13;
  id v28 = v17;
  id v29 = v16;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__HKStaticSyncControl_runStaticSyncImportWithOptions_storeIdentifier_URL_progressHandler_completion___block_invoke_2;
  v23[3] = &unk_1E58BBD88;
  id v24 = v28;
  id v19 = v28;
  id v20 = v16;
  id v21 = v13;
  id v22 = v12;
  [(HKProxyProvider *)v18 fetchProxyWithHandler:v25 errorHandler:v23];
}

uint64_t __101__HKStaticSyncControl_runStaticSyncImportWithOptions_storeIdentifier_URL_progressHandler_completion___block_invoke(void *a1, void *a2)
{
  objc_msgSend(a2, "remote_runStaticSyncImportWithOptions:storeIdentifier:URL:completion:", a1[8], a1[4], a1[5], a1[6]);
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(a1[7] + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __101__HKStaticSyncControl_runStaticSyncImportWithOptions_storeIdentifier_URL_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end