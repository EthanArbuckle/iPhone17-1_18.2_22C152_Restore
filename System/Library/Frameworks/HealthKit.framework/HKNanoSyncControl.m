@interface HKNanoSyncControl
+ (id)taskIdentifier;
- (HKNanoSyncControl)initWithHealthStore:(id)a3;
- (void)fetchNanoSyncPairedDevicesWithCompletion:(id)a3;
- (void)forceLastChanceNanoSyncWithCompletion:(id)a3;
- (void)forceNanoSyncWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)forceNanoSyncWithPullRequest:(BOOL)a3 completion:(id)a4;
- (void)resetNanoSyncWithCompletion:(id)a3;
- (void)waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation HKNanoSyncControl

- (HKNanoSyncControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKNanoSyncControl;
  v5 = [(HKNanoSyncControl *)&v12 init];
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

- (void)fetchNanoSyncPairedDevicesWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HKNanoSyncControl_fetchNanoSyncPairedDevicesWithCompletion___block_invoke;
  v9[3] = &unk_1E58BD830;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HKNanoSyncControl_fetchNanoSyncPairedDevicesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __62__HKNanoSyncControl_fetchNanoSyncPairedDevicesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchNanoSyncPairedDevicesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __62__HKNanoSyncControl_fetchNanoSyncPairedDevicesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceNanoSyncWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HKNanoSyncControl_forceNanoSyncWithOptions_completion___block_invoke;
  v11[3] = &unk_1E58BD858;
  unint64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HKNanoSyncControl_forceNanoSyncWithOptions_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __57__HKNanoSyncControl_forceNanoSyncWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_forceNanoSyncWithOptions:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __57__HKNanoSyncControl_forceNanoSyncWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceNanoSyncWithPullRequest:(BOOL)a3 completion:(id)a4
{
}

- (void)forceLastChanceNanoSyncWithCompletion:(id)a3
{
}

- (void)resetNanoSyncWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__HKNanoSyncControl_resetNanoSyncWithCompletion___block_invoke;
  v9[3] = &unk_1E58BD830;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HKNanoSyncControl_resetNanoSyncWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __49__HKNanoSyncControl_resetNanoSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetNanoSyncWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __49__HKNanoSyncControl_resetNanoSyncWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "pairingID");
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v11 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__HKNanoSyncControl_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke;
  v17[3] = &unk_1E58BD880;
  id v18 = v8;
  double v20 = a4;
  id v19 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__HKNanoSyncControl_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v13 = v19;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __81__HKNanoSyncControl_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_waitForLastChanceSyncWithDevicePairingID:timeout:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __81__HKNanoSyncControl_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end