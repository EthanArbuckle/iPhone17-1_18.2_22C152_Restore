@interface HDDeepBreathingSessionServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDDeepBreathingSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_queue_deactivate;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)remote_endSessionWithEndReason:(int64_t)a3;
- (void)remote_startGuiding;
- (void)remote_startSessionWithStartDate:(id)a3 completion:(id)a4;
@end

@implementation HDDeepBreathingSessionServer

- (HDDeepBreathingSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDDeepBreathingSessionServer;
  v11 = [(HDStandardTaskServer *)&v17 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = HKCreateSerialDispatchQueue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [v10 copy];
    sessionConfiguration = v11->_sessionConfiguration;
    v11->_sessionConfiguration = (_HKDeepBreathingSessionConfiguration *)v14;
  }
  return v11;
}

- (void)dealloc
{
  [(HKDaemonTransaction *)self->_daemonTransaction invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDDeepBreathingSessionServer;
  [(HDDeepBreathingSessionServer *)&v3 dealloc];
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B8B8] taskIdentifier];
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
  return 1;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E81A0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E8198](self, a2);
}

- (void)connectionInvalidated
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HDDeepBreathingSessionServer_connectionInvalidated__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__HDDeepBreathingSessionServer_connectionInvalidated__block_invoke(uint64_t a1)
{
}

- (void)_queue_deactivate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E4F29F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F20], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v3 = v2;
      int v6 = 138412290;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%@ deactivate", (uint8_t *)&v6, 0xCu);
    }
    if (*(void *)(a1 + 64) == 1)
    {
      *(void *)(a1 + 64) = 2;
      [*(id *)(a1 + 48) invalidate];
      v5 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
  }
}

- (void)remote_startSessionWithStartDate:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, uint64_t, void))a4;
  _HKInitializeLogging();
  v9 = (id *)MEMORY[0x1E4F29F20];
  id v10 = (void *)*MEMORY[0x1E4F29F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F20], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    uint64_t v12 = [(HDStandardTaskServer *)self taskUUID];
    sessionConfiguration = self->_sessionConfiguration;
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    v21 = sessionConfiguration;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "start session %{public}@ with start date: %{public}@, configuration: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v21) = 0;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__HDDeepBreathingSessionServer_remote_startSessionWithStartDate_completion___block_invoke;
  v17[3] = &unk_1E62F6E80;
  v17[4] = self;
  v17[5] = buf;
  dispatch_sync(queue, v17);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    _HKInitializeLogging();
    v15 = *v9;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(a2);
      *(_DWORD *)v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%@ called on server that has already been started. Returning early.", v18, 0xCu);
    }
  }
  v8[2](v8, 1, 0);
  _Block_object_dispose(buf, 8);
}

void __76__HDDeepBreathingSessionServer_remote_startSessionWithStartDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && !*(void *)(v2 + 48))
  {
    uint64_t v3 = +[HKDaemonTransaction transactionWithOwner:v2];
    id v4 = *(void **)(v2 + 48);
    *(void *)(v2 + 48) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 64)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else {
    *(void *)(v2 + 64) = 1;
  }
}

- (void)remote_startGuiding
{
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x1E4F29F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F20], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "start guiding", v3, 2u);
  }
}

- (void)remote_endSessionWithEndReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __63__HDDeepBreathingSessionServer_remote_endSessionWithEndReason___block_invoke;
  v4[3] = &unk_1E62F3198;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __63__HDDeepBreathingSessionServer_remote_endSessionWithEndReason___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    _HKInitializeLogging();
    uint64_t v3 = (os_log_t *)MEMORY[0x1E4F29F20];
    id v4 = (void *)*MEMORY[0x1E4F29F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F20], OS_LOG_TYPE_DEFAULT))
    {
      v5 = NSNumber;
      int v6 = v4;
      id v7 = [v5 numberWithInteger:v2];
      LODWORD(v18) = 138412290;
      *(void *)((char *)&v18 + 4) = v7;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "ending session with endReason=%@", (uint8_t *)&v18, 0xCu);
    }
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableDemoMode", @"com.apple.DeepBreathing", 0);
    int v9 = 0;
    if (([MEMORY[0x1E4F2B860] isRunningStoreDemoMode] & 1) == 0 && !AppBooleanValue)
    {
      id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v11 = [v10 persistentDomainForName:*MEMORY[0x1E4F2BF20]];

      uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2BF30]];
      v13 = v12;
      if (v12) {
        int v9 = [v12 BOOLValue];
      }
      else {
        int v9 = 1;
      }
    }
    _HKInitializeLogging();
    uint64_t v14 = *v3;
    BOOL v15 = os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v15)
      {
        LOWORD(v18) = 0;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "returning fake heartrate for simulator", (uint8_t *)&v18, 2u);
      }
      double v16 = 72.0;
    }
    else
    {
      double v16 = 0.0;
      if (v15)
      {
        LOWORD(v18) = 0;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "not using healthlite, returning no heartrate", (uint8_t *)&v18, 2u);
      }
    }
    *(void *)&long long v18 = MEMORY[0x1E4F143A8];
    *((void *)&v18 + 1) = 3221225472;
    v19 = __77__HDDeepBreathingSessionServer__queue_alertClientSessionDidReceiveHeartRate___block_invoke;
    v20 = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v21 = sel__queue_alertClientSessionDidReceiveHeartRate_;
    objc_super v17 = [v1 remoteObjectProxyWithErrorHandler:&v18];
    objc_msgSend(v17, "clientRemote_sessionDidReceiveHeartRate:", v16);

    -[HDDeepBreathingSessionServer _queue_deactivate]((uint64_t)v1);
  }
}

void __77__HDDeepBreathingSessionServer__queue_alertClientSessionDidReceiveHeartRate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F20], OS_LOG_TYPE_ERROR))
  {
    v5 = *(const char **)(a1 + 32);
    int v6 = v4;
    id v7 = NSStringFromSelector(v5);
    int v8 = 138412546;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "(%@) error fetching client proxy: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_daemonTransaction, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end