@interface HKNanoHostAuthorizationController
- (HKHealthPrivacyHostAuthorizationControllerDelegate)delegate;
- (HKNanoHostAuthorizationController)init;
- (NSXPCConnection)xpcConnection;
- (void)_remoteObjectProxyWithCompletion:(id)a3 errorHandler:(id)a4;
- (void)connectionDidInterrupt;
- (void)connectionDidInvalidate;
- (void)didFinishWithError:(id)a3;
- (void)init;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4;
- (void)setXpcConnection:(id)a3;
- (void)show;
@end

@implementation HKNanoHostAuthorizationController

- (HKNanoHostAuthorizationController)init
{
  v15.receiver = self;
  v15.super_class = (Class)HKNanoHostAuthorizationController;
  v2 = [(HKNanoHostAuthorizationController *)&v15 init];
  if (v2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
      -[HKNanoHostAuthorizationController init]();
    }
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    v4 = (NSXPCConnection *)[v3 initWithMachServiceName:*MEMORY[0x1E4F2A260] options:4096];
    v5 = HKHealthPrivacyHostRemoteViewControllerInterface();
    [(NSXPCConnection *)v4 setExportedInterface:v5];

    [(NSXPCConnection *)v4 setExportedObject:v2];
    v6 = HKHealthPrivacyServiceRemoteAuthorizationViewControllerInterface();
    [(NSXPCConnection *)v4 setRemoteObjectInterface:v6];

    objc_initWeak(&location, v2);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__HKNanoHostAuthorizationController_init__block_invoke;
    v12[3] = &unk_1E6D51C48;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)v4 setInterruptionHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__HKNanoHostAuthorizationController_init__block_invoke_2;
    v10[3] = &unk_1E6D51C48;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)v4 setInvalidationHandler:v10];
    v7 = HKCreateSerialDispatchQueue();
    [(NSXPCConnection *)v4 _setQueue:v7];
    [(NSXPCConnection *)v4 resume];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = v4;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__HKNanoHostAuthorizationController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionDidInterrupt];
}

void __41__HKNanoHostAuthorizationController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionDidInvalidate];
}

- (void)invalidate
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_11(&dword_1E0B26000, v0, v1, "HKNanoHostAuthorizationController: Client invalidated, invalidating XPC connection", v2, v3, v4, v5, v6);
}

- (void)connectionDidInvalidate
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_11(&dword_1E0B26000, v0, v1, "HKNanoHostAuthorizationController: XPC Connection invalidated", v2, v3, v4, v5, v6);
}

- (void)connectionDidInterrupt
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_11(&dword_1E0B26000, v0, v1, "HKNanoHostAuthorizationController: XPC Connection interrupted", v2, v3, v4, v5, v6);
}

- (void)didFinishWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_DEFAULT, "HKNanoHostAuthorizationController: Finished with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint8_t v6 = [(HKNanoHostAuthorizationController *)self delegate];
  [v6 healthPrivacyHostAuthorizationControllerDidFinishWithError:v4];
}

- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke;
  v10[3] = &unk_1E6D546D8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(HKNanoHostAuthorizationController *)self _remoteObjectProxyWithCompletion:v10 errorHandler:&__block_literal_global_58];
}

void __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_cold_1(a1, v4);
  }
  [v3 setRequestRecord:*(void *)(a1 + 32) presentationRequests:*(void *)(a1 + 40)];
}

void __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_282(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  id v3 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
    __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_282_cold_1((uint64_t)v2, v3);
  }
}

- (void)show
{
}

uint64_t __41__HKNanoHostAuthorizationController_show__block_invoke(uint64_t a1, void *a2)
{
  return [a2 show];
}

void __41__HKNanoHostAuthorizationController_show__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  id v3 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
    __41__HKNanoHostAuthorizationController_show__block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (void)_remoteObjectProxyWithCompletion:(id)a3 errorHandler:(id)a4
{
  id v11 = (void (**)(id, void *))a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKNanoHostAuthorizationController.m", 100, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"HKNanoHostAuthorizationController.m", 101, @"Invalid parameter not satisfying: %@", @"errorHandler" object file lineNumber description];

LABEL_3:
  id v8 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:v7];
  v11[2](v11, v8);
}

- (HKHealthPrivacyHostAuthorizationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyHostAuthorizationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)init
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_11(&dword_1E0B26000, v0, v1, "Initializing HKNanoHostAuthorizationController", v2, v3, v4, v5, v6);
}

void __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_DEBUG, "HKNanoHostAuthorizationController: Set record: %@", (uint8_t *)&v3, 0xCu);
}

void __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_282_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "HKNanoHostAuthorizationController: Failed to set request record with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __41__HKNanoHostAuthorizationController_show__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "HKNanoHostAuthorizationController: Failed to show remote authorization alert with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end