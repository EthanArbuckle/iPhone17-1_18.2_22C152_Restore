@interface ITIdleTimerStateClient
- (BOOL)handleIdleEvent:(id)a3 usingConfigurationWithIdentifier:(id)a4;
- (BOOL)isIdleTimerServiceAvailable;
- (ITIdleTimerStateClient)initWithDelegate:(id)a3;
- (void)_access_addIdleTimerConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5;
- (void)_access_removeIdleTimerConfiguration:(id)a3 forReason:(id)a4;
- (void)_connectionInterrupted;
- (void)addIdleTimerConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5;
- (void)isIdleTimerServiceAvailable;
- (void)removeIdleTimerConfiguration:(id)a3 forReason:(id)a4;
@end

@implementation ITIdleTimerStateClient

- (void)addIdleTimerConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  p_accessLock = &self->_accessLock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  id v12 = 0;
  [(ITIdleTimerStateClient *)self _access_addIdleTimerConfiguration:v10 forReason:v9 error:&v12];

  id v11 = v12;
  os_unfair_lock_unlock(p_accessLock);
  if (a5 && v11) {
    *a5 = v11;
  }
}

- (void)_access_addIdleTimerConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  p_accessLock = &self->_accessLock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_assert_owner(p_accessLock);
  id v11 = [(BSServiceConnection *)self->_connection remoteTarget];
  id v14 = 0;
  [v11 addIdleTimerServiceConfiguration:v10 forReason:v9 error:&v14];

  id v12 = v14;
  if (v12)
  {
    v13 = ITLogIdleTimer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ITIdleTimerStateClient _access_addIdleTimerConfiguration:forReason:error:]();
    }

    if (a5) {
      *a5 = v12;
    }
  }
}

- (ITIdleTimerStateClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ITIdleTimerStateClient;
  v5 = [(ITIdleTimerStateClient *)&v17 init];
  p_isa = (id *)&v5->super.isa;
  if (!v5) {
    goto LABEL_4;
  }
  v5->_accessLock._os_unfair_lock_opaque = 0;
  v5->_access_serviceAvailability = 0;
  objc_storeWeak((id *)&v5->_delegate, v4);
  uint64_t v7 = [MEMORY[0x263F2B9C0] endpointForMachName:@"com.apple.frontboard.systemappservices" service:@"com.apple.idletimer-service" instance:0];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v7];
    id v10 = p_isa[3];
    p_isa[3] = (id)v9;

    id v11 = p_isa[3];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__ITIdleTimerStateClient_initWithDelegate___block_invoke;
    v15[3] = &unk_264133268;
    v16 = p_isa;
    [v11 configureConnection:v15];
    [p_isa[3] activate];

LABEL_4:
    id v12 = p_isa;
    goto LABEL_8;
  }
  v13 = ITLogIdleTimer();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ITIdleTimerStateClient initWithDelegate:]();
  }

  id v12 = 0;
LABEL_8:

  return v12;
}

void __43__ITIdleTimerStateClient_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F29C88];
  id v4 = a2;
  v5 = [v3 protocolForProtocol:&unk_26C290BA0];
  v6 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C2907F8];
  uint64_t v7 = [MEMORY[0x263F2B9E8] interfaceWithServer:v6 client:v5];
  [v4 setInterface:v7];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  v8 = [MEMORY[0x263F2B9F0] utility];
  [v4 setServiceQuality:v8];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_2;
  v11[3] = &unk_264133240;
  id v12 = *(id *)(a1 + 32);
  [v4 setInterruptionHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_56;
  v9[3] = &unk_264133240;
  id v10 = *(id *)(a1 + 32);
  [v4 setInvalidationHandler:v9];
}

uint64_t __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_2(uint64_t a1)
{
  v2 = ITLogIdleTimer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_2_cold_1(v2);
  }

  return [*(id *)(a1 + 32) _connectionInterrupted];
}

void __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_56(uint64_t a1)
{
  v2 = ITLogIdleTimer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_56_cold_1(v2);
  }

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(a1 + 32) + 16) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

- (BOOL)isIdleTimerServiceAvailable
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  unint64_t access_serviceAvailability = self->_access_serviceAvailability;
  if (access_serviceAvailability == 2)
  {
    LOBYTE(v5) = 1;
  }
  else if (access_serviceAvailability == 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = [(BSServiceConnection *)self->_connection remoteTarget];
    id v10 = 0;
    int v5 = [v6 isIdleTimerServiceAvailableWithError:&v10];
    id v7 = v10;

    if (v7)
    {
      v8 = ITLogIdleTimer();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ITIdleTimerStateClient isIdleTimerServiceAvailable]();
      }

      LOBYTE(v5) = 0;
    }
    else if (v5)
    {
      self->_unint64_t access_serviceAvailability = 2;
      LOBYTE(v5) = 1;
    }
    else
    {
      self->_unint64_t access_serviceAvailability = 1;
    }
  }
  os_unfair_lock_unlock(p_accessLock);
  return v5;
}

- (void)removeIdleTimerConfiguration:(id)a3 forReason:(id)a4
{
  p_accessLock = &self->_accessLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(ITIdleTimerStateClient *)self _access_removeIdleTimerConfiguration:v8 forReason:v7];

  os_unfair_lock_unlock(p_accessLock);
}

- (BOOL)handleIdleEvent:(id)a3 usingConfigurationWithIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 unsignedIntegerValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = [WeakRetained handleIdleEvent:v7 usingConfigurationWithIdentifier:v6];

  return v7;
}

- (void)_connectionInterrupted
{
  [(BSServiceConnection *)self->_connection activate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained resendIdleTimerAssertions];
}

- (void)_access_removeIdleTimerConfiguration:(id)a3 forReason:(id)a4
{
  p_accessLock = &self->_accessLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(p_accessLock);
  uint64_t v9 = [(BSServiceConnection *)self->_connection remoteTarget];
  id v12 = 0;
  [v9 removeIdleTimerServiceConfiguration:v8 forReason:v7 error:&v12];

  id v10 = v12;
  if (v10)
  {
    id v11 = ITLogIdleTimer();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ITIdleTimerStateClient _access_removeIdleTimerConfiguration:forReason:]();
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithDelegate:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_210665000, v1, OS_LOG_TYPE_ERROR, "cannot get endpoint for mach service: %{public}@ (on behalf of BSService name: %{public}@)", v2, 0x16u);
}

void __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_210665000, log, OS_LOG_TYPE_ERROR, "ITIdleTimerStateClient connection interrupted.", v1, 2u);
}

void __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_56_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_210665000, log, OS_LOG_TYPE_ERROR, "ITIdleTimerStateClient connection invalidated.", v1, 2u);
}

- (void)isIdleTimerServiceAvailable
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_210665000, v0, v1, "Error requesting idle timer services availability: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_access_removeIdleTimerConfiguration:forReason:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_210665000, v0, v1, "Error removing idle timer configuration: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_access_addIdleTimerConfiguration:forReason:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_210665000, v0, v1, "Error adding idle timer configuration: %{public}@", v2, v3, v4, v5, v6);
}

@end