@interface _HKFitnessMachineConnection
+ (id)taskIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKDevice)deviceForFinalWorkout;
- (NSString)description;
- (NSUUID)uuid;
- (_HKFitnessMachine)fitnessMachine;
- (_HKFitnessMachineConnection)initWithHealthStore:(id)a3;
- (_HKFitnessMachineConnectionDelegate)delegate;
- (id)_init;
- (id)currentSessionConfiguration;
- (unint64_t)connectionState;
- (unint64_t)hash;
- (unint64_t)machineState;
- (void)_clientQueue_deliverFailedWithError:(id)a3;
- (void)_connectionInterruptedWithError:(id)a3;
- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_registerClient;
- (void)_simulateDisconnect;
- (void)clientRemote_deliverConnectionChangedToState:(unint64_t)a3 fromState:(unint64_t)a4 fitnessMachineSessionUUID:(id)a5 error:(id)a6;
- (void)clientRemote_deliverDetectedNFC:(id)a3;
- (void)clientRemote_deliverFailedWithError:(id)a3;
- (void)clientRemote_deliverMachineChangedToState:(unint64_t)a3 fromState:(unint64_t)a4 fitnessMachineSessionUUID:(id)a5 date:(id)a6;
- (void)clientRemote_deliverMachineInformationUpdated:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)end;
- (void)endWithFitnessMachineSessionUUID:(id)a3;
- (void)markClientReady;
- (void)setDelegate:(id)a3;
@end

@implementation _HKFitnessMachineConnection

- (_HKFitnessMachineConnection)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKFitnessMachineConnection;
  v5 = [(_HKFitnessMachineConnection *)&v17 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    objc_initWeak(&location, v5);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51___HKFitnessMachineConnection_initWithHealthStore___block_invoke;
    v14[3] = &unk_1E58BE428;
    objc_copyWeak(&v15, &location);
    [(HKProxyProvider *)v5->_proxyProvider setAutomaticProxyReconnectionHandler:v14];
    v5->_machineState = 0;
    v5->_connectionState = 0;
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v5->_lock;
    v5->_lock = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_HKFitnessMachineConnection;
  return [(_HKFitnessMachineConnection *)&v3 init];
}

- (NSUUID)uuid
{
  return [(HKTaskServerProxyProvider *)self->_proxyProvider taskUUID];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(_HKFitnessMachineConnection *)self _registerClient];
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)connectionInterrupted
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"connection interrupted");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(_HKFitnessMachineConnection *)self _connectionInterruptedWithError:v3];
}

- (void)connectionInvalidated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection invalidated", (uint8_t *)&v4, 0xCu);
  }
  [(_HKFitnessMachineConnection *)self connectionInterrupted];
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (unint64_t)hash
{
  v2 = [(_HKFitnessMachineConnection *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(_HKFitnessMachineConnection *)self uuid];
    uint64_t v6 = [v4 uuid];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___HKFitnessMachineConnection_description__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  [(NSLock *)lock hk_withLock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)markClientReady
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46___HKFitnessMachineConnection_markClientReady__block_invoke_2;
  v2[3] = &unk_1E58BBCC0;
  v2[4] = self;
  [(_HKFitnessMachineConnection *)self _fetchProxyWithHandler:&__block_literal_global_66 errorHandler:v2];
}

- (void)_registerClient
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v7 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "Registering Client. Fitness machine connection %@", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46___HKFitnessMachineConnection__registerClient__block_invoke;
  v5[3] = &unk_1E58C4410;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46___HKFitnessMachineConnection__registerClient__block_invoke_2;
  v4[3] = &unk_1E58BBCC0;
  v4[4] = self;
  [(_HKFitnessMachineConnection *)self _fetchProxyWithHandler:v5 errorHandler:v4];
}

- (void)end
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "End fitness machine connection %@", buf, 0xCu);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34___HKFitnessMachineConnection_end__block_invoke_2;
  v4[3] = &unk_1E58BBCC0;
  v4[4] = self;
  [(_HKFitnessMachineConnection *)self _fetchProxyWithHandler:&__block_literal_global_19 errorHandler:v4];
}

- (void)endWithFitnessMachineSessionUUID:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64___HKFitnessMachineConnection_endWithFitnessMachineSessionUUID___block_invoke;
  v7[3] = &unk_1E58C4410;
  id v8 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___HKFitnessMachineConnection_endWithFitnessMachineSessionUUID___block_invoke_2;
  v6[3] = &unk_1E58BBCC0;
  v6[4] = self;
  id v5 = v4;
  [(_HKFitnessMachineConnection *)self _fetchProxyWithHandler:v7 errorHandler:v6];
}

- (id)currentSessionConfiguration
{
  id v3 = objc_alloc_init(_HKFitnessMachineSessionConfiguration);
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58___HKFitnessMachineConnection_currentSessionConfiguration__block_invoke;
  v8[3] = &unk_1E58BBBD0;
  id v5 = v3;
  uint64_t v9 = v5;
  v10 = self;
  [(NSLock *)lock hk_withLock:v8];
  uint64_t v6 = v5;

  return v6;
}

- (HKDevice)deviceForFinalWorkout
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52___HKFitnessMachineConnection_deviceForFinalWorkout__block_invoke;
  v5[3] = &unk_1E58BBBA8;
  v5[4] = self;
  void v5[5] = &v6;
  [(NSLock *)lock hk_withLock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKDevice *)v3;
}

- (_HKFitnessMachine)fitnessMachine
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_fitnessMachine;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (void)clientRemote_deliverDetectedNFC:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63___HKFitnessMachineConnection_clientRemote_deliverDetectedNFC___block_invoke;
  v11[3] = &unk_1E58BBBD0;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  [(NSLock *)lock hk_withLock:v11];
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63___HKFitnessMachineConnection_clientRemote_deliverDetectedNFC___block_invoke_2;
  v9[3] = &unk_1E58BBBD0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)clientRemote_deliverMachineInformationUpdated:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77___HKFitnessMachineConnection_clientRemote_deliverMachineInformationUpdated___block_invoke;
  v11[3] = &unk_1E58BBBD0;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  [(NSLock *)lock hk_withLock:v11];
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77___HKFitnessMachineConnection_clientRemote_deliverMachineInformationUpdated___block_invoke_2;
  v9[3] = &unk_1E58BBBD0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)clientRemote_deliverMachineChangedToState:(unint64_t)a3 fromState:(unint64_t)a4 fitnessMachineSessionUUID:(id)a5 date:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  lock = self->_lock;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __114___HKFitnessMachineConnection_clientRemote_deliverMachineChangedToState_fromState_fitnessMachineSessionUUID_date___block_invoke;
  v21[3] = &unk_1E58BD9D0;
  v21[4] = self;
  v21[5] = a3;
  [(NSLock *)lock hk_withLock:v21];
  v13 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114___HKFitnessMachineConnection_clientRemote_deliverMachineChangedToState_fromState_fitnessMachineSessionUUID_date___block_invoke_2;
  block[3] = &unk_1E58C4438;
  unint64_t v19 = a3;
  unint64_t v20 = a4;
  block[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v13, block);
}

- (void)clientRemote_deliverConnectionChangedToState:(unint64_t)a3 fromState:(unint64_t)a4 fitnessMachineSessionUUID:(id)a5 error:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__28;
  v27[4] = __Block_byref_object_dispose__28;
  id v28 = 0;
  lock = self->_lock;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke;
  v23[3] = &unk_1E58C4460;
  v23[4] = self;
  unint64_t v26 = a3;
  id v13 = v10;
  id v24 = v13;
  v25 = v27;
  [(NSLock *)lock hk_withLock:v23];
  id v14 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke_31;
  v17[3] = &unk_1E58C4488;
  unint64_t v21 = a3;
  unint64_t v22 = a4;
  v17[4] = self;
  id v18 = v13;
  id v19 = v11;
  unint64_t v20 = v27;
  id v15 = v11;
  id v16 = v13;
  dispatch_async(v14, v17);

  _Block_object_dispose(v27, 8);
}

- (void)clientRemote_deliverFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67___HKFitnessMachineConnection_clientRemote_deliverFailedWithError___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_simulateDisconnect
{
}

- (void)_clientQueue_deliverFailedWithError:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 fitnessMachineConnection:self failedWithError:v9];
    }
  }
}

- (void)_connectionInterruptedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___HKFitnessMachineConnection__connectionInterruptedWithError___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (unint64_t)machineState
{
  return self->_machineState;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (_HKFitnessMachineConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HKFitnessMachineConnectionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_deviceForFinalWorkout, 0);
  objc_storeStrong((id *)&self->_fitnessMachine, 0);
  objc_storeStrong((id *)&self->_currentSessionUUID, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end