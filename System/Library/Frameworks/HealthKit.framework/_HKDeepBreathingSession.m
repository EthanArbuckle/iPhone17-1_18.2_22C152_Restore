@interface _HKDeepBreathingSession
+ (id)taskIdentifier;
- (BOOL)_isServerAttached;
- (BOOL)_queue_isServerAttached;
- (NSString)description;
- (_HKDeepBreathingSession)initWithHealthStore:(id)a3 configuration:(id)a4;
- (_HKDeepBreathingSessionConfiguration)sessionConfiguration;
- (_HKDeepBreathingSessionDelegate)delegate;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)serverState;
- (void)_connectionDidEncounterError:(id)a3;
- (void)_queue_alertDelegateDidEncounterError:(id)a3;
- (void)_queue_alertDelegateDidReceiveHeartRate:(double)a3;
- (void)_queue_deactivate;
- (void)_queue_transitionToServerState:(int64_t)a3;
- (void)clientRemote_sessionDidReceiveError:(id)a3;
- (void)clientRemote_sessionDidReceiveHeartRate:(double)a3;
- (void)connectionInvalidated;
- (void)endSessionWithEndReason:(int64_t)a3;
- (void)fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startGuiding;
- (void)startSessionWithStartDate:(id)a3 completion:(id)a4;
@end

@implementation _HKDeepBreathingSession

- (_HKDeepBreathingSession)initWithHealthStore:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_HKDeepBreathingSession;
  v8 = [(_HKDeepBreathingSession *)&v20 init];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = HKCreateSerialDispatchQueue(v8, @"queue");
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = HKCreateSerialDispatchQueue(v9, @"client");
    clientQueue = v9->_clientQueue;
    v9->_clientQueue = (OS_dispatch_queue *)v12;

    v14 = [HKTaskServerProxyProvider alloc];
    v15 = [(id)objc_opt_class() taskIdentifier];
    v16 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v17 = [(HKTaskServerProxyProvider *)v14 initWithHealthStore:v6 taskIdentifier:v15 exportedObject:v9 taskUUID:v16];
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = (HKTaskServerProxyProvider *)v17;

    [(HKProxyProvider *)v9->_proxyProvider setShouldRetryOnInterruption:0];
    [(HKTaskServerProxyProvider *)v9->_proxyProvider setTaskConfiguration:v7];
    v9->_serverState = 2;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_HKDeepBreathingSession *)self sessionConfiguration];
  id v6 = [v3 stringWithFormat:@"<%@:%p, configuration:%@>", v4, self, v5];

  return (NSString *)v6;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED10AE0];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53030];
}

- (void)connectionInvalidated
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___HKDeepBreathingSession_connectionInvalidated__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startSessionWithStartDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke;
  aBlock[3] = &unk_1E58BE3B0;
  aBlock[4] = self;
  id v19 = v7;
  id v8 = v7;
  v9 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_3;
  v14[3] = &unk_1E58C49E8;
  id v15 = v6;
  v16 = self;
  id v17 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_18;
  v12[3] = &unk_1E58BBD88;
  id v13 = v17;
  id v10 = v17;
  id v11 = v6;
  [(_HKDeepBreathingSession *)self fetchProxyWithHandler:v14 errorHandler:v12];
}

- (void)startGuiding
{
}

- (void)endSessionWithEndReason:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51___HKDeepBreathingSession_endSessionWithEndReason___block_invoke;
  v3[3] = &__block_descriptor_40_e41_v16__0____HKDeepBreathingSessionServer__8l;
  v3[4] = a3;
  [(_HKDeepBreathingSession *)self fetchProxyWithHandler:v3 errorHandler:&__block_literal_global_23_0];
}

- (void)fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v9 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([(_HKDeepBreathingSession *)self _isServerAttached])
  {
    [(HKProxyProvider *)self->_proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"requested server proxy while server is not attached (%ld)", -[_HKDeepBreathingSession serverState](self, "serverState""));
    v7[2](v7, v8);
  }
}

- (void)_queue_deactivate
{
  [(_HKDeepBreathingSession *)self _queue_transitionToServerState:1];
  proxyProvider = self->_proxyProvider;

  [(HKProxyProvider *)proxyProvider invalidate];
}

- (_HKDeepBreathingSessionConfiguration)sessionConfiguration
{
  return (_HKDeepBreathingSessionConfiguration *)[(HKTaskServerProxyProvider *)self->_proxyProvider taskConfiguration];
}

- (int64_t)serverState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___HKDeepBreathingSession_serverState__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_queue_transitionToServerState:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v6 = HKLogDeepBreathing;
  if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    int64_t serverState = self->_serverState;
    int v9 = 134218240;
    int64_t v10 = serverState;
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "transitioning server state (%ld -> %ld)", (uint8_t *)&v9, 0x16u);
  }
  if (a3 == 3 && self->_serverState != 2)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_HKDeepBreathingSession.m" lineNumber:154 description:@"cannot move from detached -> started"];
  }
  self->_int64_t serverState = a3;
}

- (void)_connectionDidEncounterError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___HKDeepBreathingSession__connectionDidEncounterError___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)_isServerAttached
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44___HKDeepBreathingSession__isServerAttached__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_queue_isServerAttached
{
  return self->_serverState != 1;
}

- (void)clientRemote_sessionDidReceiveHeartRate:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67___HKDeepBreathingSession_clientRemote_sessionDidReceiveHeartRate___block_invoke;
  v4[3] = &unk_1E58BD9D0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)clientRemote_sessionDidReceiveError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___HKDeepBreathingSession_clientRemote_sessionDidReceiveError___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_queue_alertDelegateDidReceiveHeartRate:(double)a3
{
  objc_copyWeak(&to, (id *)&self->_delegate);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67___HKDeepBreathingSession__queue_alertDelegateDidReceiveHeartRate___block_invoke;
  v5[3] = &unk_1E58C4A50;
  objc_copyWeak(v6, &to);
  v5[4] = self;
  v6[1] = *(id *)&a3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&to);
}

- (void)_queue_alertDelegateDidEncounterError:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __65___HKDeepBreathingSession__queue_alertDelegateDidEncounterError___block_invoke;
  v6[3] = &unk_1E58C4A78;
  objc_copyWeak(&v8, &to);
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&to);
}

- (_HKDeepBreathingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HKDeepBreathingSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end