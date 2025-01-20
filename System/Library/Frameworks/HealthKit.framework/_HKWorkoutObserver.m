@interface _HKWorkoutObserver
+ (id)clientInterface;
+ (id)serverInterface;
- (HKHealthStore)healthStore;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSUUID)identifier;
- (_HKWorkoutObserver)initWithHealthStore:(id)a3;
- (_HKWorkoutObserverDelegate)delegate;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_lock_startTaskServerIfNeeded;
- (void)_startTaskServerIfNeeded;
- (void)clientRemote_didUpdateWorkoutSnapshot:(id)a3;
- (void)connectionInterrupted;
- (void)currentWorkoutSnapshotWithCompletion:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)waitForAutomaticWorkoutRecoveryWithCompletion:(id)a3;
@end

@implementation _HKWorkoutObserver

- (_HKWorkoutObserver)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_HKWorkoutObserver;
  v6 = [(_HKWorkoutObserver *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v7->_lock;
    v7->_lock = v8;

    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingHandlers = v7->_pendingHandlers;
    v7->_pendingHandlers = v12;

    v14 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v7->_healthStore taskIdentifier:@"_HKWorkoutObserverServerIdentifier" exportedObject:v7 taskUUID:v7->_identifier];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = v14;

    objc_initWeak(&location, v7);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __42___HKWorkoutObserver_initWithHealthStore___block_invoke;
    v20 = &unk_1E58BD8B0;
    objc_copyWeak(&v21, &location);
    [(HKProxyProvider *)v7->_proxyProvider setAutomaticProxyReconnectionHandler:&v17];
    [(_HKWorkoutObserver *)v7 _startTaskServerIfNeeded];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)_HKWorkoutObserver;
  [(_HKWorkoutObserver *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34___HKWorkoutObserver_setDelegate___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSLock *)lock hk_withLock:v7];
}

- (_HKWorkoutObserverDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30___HKWorkoutObserver_delegate__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  [(NSLock *)lock hk_withLock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_HKWorkoutObserverDelegate *)v3;
}

- (void)currentWorkoutSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58BD8D8;
  aBlock[4] = self;
  id v11 = v4;
  id v5 = _Block_copy(aBlock);
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke_3;
  v8[3] = &unk_1E58BB978;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(NSLock *)lock hk_withLock:v8];
}

- (void)waitForAutomaticWorkoutRecoveryWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58BB978;
  aBlock[4] = self;
  id v13 = v4;
  id v5 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_3;
  v10[3] = &unk_1E58BD900;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_4;
  v8[3] = &unk_1E58BBC48;
  v8[4] = self;
  id v9 = v11;
  id v7 = v11;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v10 errorHandler:v8];
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED51DD0];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED51E30];
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (void)connectionInterrupted
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43___HKWorkoutObserver_connectionInterrupted__block_invoke;
  v3[3] = &unk_1E58BBA00;
  v3[4] = self;
  [(NSLock *)lock hk_withLock:v3];
}

- (void)clientRemote_didUpdateWorkoutSnapshot:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__2;
  v19[4] = __Block_byref_object_dispose__2;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  id v18 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60___HKWorkoutObserver_clientRemote_didUpdateWorkoutSnapshot___block_invoke;
  v13[3] = &unk_1E58BD928;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  v15 = v17;
  v16 = v19;
  [(NSLock *)lock hk_withLock:v13];
  id v7 = [(HKHealthStore *)self->_healthStore clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___HKWorkoutObserver_clientRemote_didUpdateWorkoutSnapshot___block_invoke_2;
  block[3] = &unk_1E58BD950;
  id v10 = v6;
  id v11 = v17;
  v12 = v19;
  id v8 = v6;
  dispatch_async(v7, block);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (void)_startTaskServerIfNeeded
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46___HKWorkoutObserver__startTaskServerIfNeeded__block_invoke;
  v3[3] = &unk_1E58BBA00;
  v3[4] = self;
  [(NSLock *)lock hk_withLock:v3];
}

- (void)_lock_startTaskServerIfNeeded
{
  self->_receivedInitialSnapshot = 0;
  latestSnapshot = self->_latestSnapshot;
  self->_latestSnapshot = 0;

  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke_2;
  v5[3] = &unk_1E58BBCC0;
  v5[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_5 errorHandler:v5];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_pendingHandlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestSnapshot, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end