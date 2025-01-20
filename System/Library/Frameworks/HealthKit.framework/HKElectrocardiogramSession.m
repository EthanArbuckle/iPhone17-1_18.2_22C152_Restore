@interface HKElectrocardiogramSession
+ (BOOL)isElectrocardiogramSessionAvailable;
+ (id)clientInterface;
+ (id)serverInterface;
- (HKElectrocardiogramSession)init;
- (HKElectrocardiogramSession)initWithHealthStore:(id)a3 configuration:(id)a4;
- (HKElectrocardiogramSessionConfiguration)sessionConfiguration;
- (HKElectrocardiogramSessionDelegate)delegate;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)abortWithCompletion:(id)a3;
- (void)clientRemote_didDetectContactAtDate:(id)a3;
- (void)clientRemote_didDetectEmergencyCallbackModeWithEndDate:(id)a3;
- (void)clientRemote_didEndWithReason:(int64_t)a3 error:(id)a4;
- (void)connectionInterrupted;
- (void)setDelegate:(id)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation HKElectrocardiogramSession

+ (BOOL)isElectrocardiogramSessionAvailable
{
  return MGGetBoolAnswer();
}

- (HKElectrocardiogramSession)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKElectrocardiogramSession)initWithHealthStore:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKElectrocardiogramSession;
  v9 = [(HKElectrocardiogramSession *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_sessionConfiguration, a4);
    v11 = objc_alloc_init(HKElectrocardiogramSessionTaskConfiguration);
    [(HKElectrocardiogramSessionTaskConfiguration *)v11 setSessionConfiguration:v8];
    v12 = [HKTaskServerProxyProvider alloc];
    healthStore = v10->_healthStore;
    v14 = [v8 sessionUUID];
    uint64_t v15 = [(HKTaskServerProxyProvider *)v12 initWithHealthStore:healthStore taskIdentifier:@"HDElectrocardiogramSessionServerIdentifier" exportedObject:v10 taskUUID:v14];
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v15;

    [(HKProxyProvider *)v10->_proxyProvider setShouldRetryOnInterruption:0];
    [(HKTaskServerProxyProvider *)v10->_proxyProvider setTaskConfiguration:v11];
  }
  return v10;
}

- (void)startWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__HKElectrocardiogramSession_startWithCompletion___block_invoke;
  v9[3] = &unk_1E58C4388;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HKElectrocardiogramSession_startWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __50__HKElectrocardiogramSession_startWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __50__HKElectrocardiogramSession_startWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)abortWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__HKElectrocardiogramSession_abortWithCompletion___block_invoke;
  v9[3] = &unk_1E58C4388;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HKElectrocardiogramSession_abortWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __50__HKElectrocardiogramSession_abortWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_abortWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __50__HKElectrocardiogramSession_abortWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_didDetectContactAtDate:(id)a3
{
  id v4 = a3;
  v5 = [(HKHealthStore *)self->_healthStore clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HKElectrocardiogramSession_clientRemote_didDetectContactAtDate___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__HKElectrocardiogramSession_clientRemote_didDetectContactAtDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v4 electrocardiogramSession:*(void *)(a1 + 32) didDetectContactAtDate:*(void *)(a1 + 40)];
  }
}

- (void)clientRemote_didEndWithReason:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(HKHealthStore *)self->_healthStore clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKElectrocardiogramSession_clientRemote_didEndWithReason_error___block_invoke;
  block[3] = &unk_1E58BBBF8;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __66__HKElectrocardiogramSession_clientRemote_didEndWithReason_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  [WeakRetained electrocardiogramSession:a1[4] didEndWithReason:a1[6] error:a1[5]];
}

- (void)clientRemote_didDetectEmergencyCallbackModeWithEndDate:(id)a3
{
  id v4 = a3;
  v5 = [(HKHealthStore *)self->_healthStore clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__HKElectrocardiogramSession_clientRemote_didDetectEmergencyCallbackModeWithEndDate___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __85__HKElectrocardiogramSession_clientRemote_didDetectEmergencyCallbackModeWithEndDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained electrocardiogramSession:*(void *)(a1 + 32) didDetectEmergencyCallbackModeWithEndDate:*(void *)(a1 + 40)];
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED0DB00];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52F10];
}

- (id)exportedInterface
{
  return +[HKElectrocardiogramSession clientInterface];
}

- (id)remoteInterface
{
  return +[HKElectrocardiogramSession serverInterface];
}

- (void)connectionInterrupted
{
  char v3 = [(HKHealthStore *)self->_healthStore clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HKElectrocardiogramSession_connectionInterrupted__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(v3, block);
}

void __51__HKElectrocardiogramSession_connectionInterrupted__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Connection interrupted");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained electrocardiogramSession:*(void *)(a1 + 32) didEndWithReason:0 error:v3];
}

- (HKElectrocardiogramSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (HKElectrocardiogramSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKElectrocardiogramSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end