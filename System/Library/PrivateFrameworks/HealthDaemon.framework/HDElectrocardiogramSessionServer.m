@interface HDElectrocardiogramSessionServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDElectrocardiogramSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)remote_abortWithCompletion:(id)a3;
- (void)remote_startWithCompletion:(id)a3;
@end

@implementation HDElectrocardiogramSessionServer

- (HDElectrocardiogramSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDElectrocardiogramSessionServer;
  v11 = [(HDStandardTaskServer *)&v17 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = HKCreateSerialDispatchQueue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [v10 sessionConfiguration];
    sessionConfiguration = v11->_sessionConfiguration;
    v11->_sessionConfiguration = (HKElectrocardiogramSessionConfiguration *)v14;
  }
  return v11;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2B9D0];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  v6 = [a3 sessionConfiguration];

  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"Session configuration is nil");
  }
  return v6 != 0;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AFA8] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AFA8] clientInterface];
}

- (void)connectionInvalidated
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HDElectrocardiogramSessionServer_connectionInvalidated__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connectionInterrupted
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HDElectrocardiogramSessionServer_connectionInterrupted__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)remote_startWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HDElectrocardiogramSessionServer_remote_startWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__HDElectrocardiogramSessionServer_remote_startWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void (**)(id, void, void *))*(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 48));
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      *(_DWORD *)buf = 138543362;
      id v11 = (id)objc_opt_class();
      id v5 = v11;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session start", buf, 0xCu);
    }
    uint64_t v6 = *(void *)(v1 + 56);
    if (v6)
    {
      v7 = @"Not Started";
      if (v6 == 1) {
        v7 = @"Started";
      }
      if (v6 == 2) {
        id v8 = @"Ended";
      }
      else {
        id v8 = v7;
      }
      v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Cannot start session in state: %@", v8);
      v2[2](v2, 0, v9);
    }
    else
    {
      *(void *)(v1 + 56) = 1;
      v2[2](v2, 1, 0);
    }
  }
}

- (void)remote_abortWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HDElectrocardiogramSessionServer_remote_abortWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__HDElectrocardiogramSessionServer_remote_abortWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void (**)(id, uint64_t, void))*(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 48));
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      *(_DWORD *)buf = 138543362;
      id v11 = (id)objc_opt_class();
      id v5 = v11;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session abort", buf, 0xCu);
    }
    uint64_t v6 = *(void *)(v1 + 56);
    if (v6 == 1)
    {
      *(void *)(v1 + 56) = 2;
      v7 = [(id)v1 remoteObjectProxyWithErrorHandler:&__block_literal_global_304];
      objc_msgSend(v7, "clientRemote_didEndWithReason:error:", 2, 0);

      v2[2](v2, 1, 0);
    }
    else
    {
      id v8 = @"Not Started";
      if (v6 == 2) {
        id v8 = @"Ended";
      }
      v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Cannot abort session in state: %@", v8);
      ((void (**)(id, uint64_t, void *))v2)[2](v2, 0, v9);
    }
  }
}

void __81__HDElectrocardiogramSessionServer__queue_notifyClientDidEndWithEndReason_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "Error notifiying ECG Session client of session end: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
}

@end