@interface CARSetupHeadUnitPairingPrompt
- (BOOL)wantsToPresentHeadUnitPairing;
- (CARSetupHeadUnitPairingPrompt)initWithKeyIdentifier:(id)a3;
- (CARSetupHeadUnitPairingPromptDelegate)delegate;
- (NSString)keyIdentifier;
- (NSXPCConnection)connection;
- (id)headUnitPairingPromptViewController;
- (void)_handleConnectionReset;
- (void)_handleDidFinishWithResult:(BOOL)a3;
- (void)_mainQueue_delegateDidFinishWithResult:(BOOL)a3;
- (void)_servicePerform:(id)a3;
- (void)_setupConnection;
- (void)_synchronous_servicePerform:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)presentHeadUnitPairingPrompt;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CARSetupHeadUnitPairingPrompt

- (CARSetupHeadUnitPairingPrompt)initWithKeyIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARSetupHeadUnitPairingPrompt;
  v6 = [(CARSetupHeadUnitPairingPrompt *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyIdentifier, a3);
    [(CARSetupHeadUnitPairingPrompt *)v7 _setupConnection];
  }

  return v7;
}

- (void)dealloc
{
  [(CARSetupHeadUnitPairingPrompt *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CARSetupHeadUnitPairingPrompt;
  [(CARSetupHeadUnitPairingPrompt *)&v3 dealloc];
}

- (BOOL)wantsToPresentHeadUnitPairing
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke;
  v4[3] = &unk_265276EC0;
  v4[4] = self;
  v4[5] = &v5;
  [(CARSetupHeadUnitPairingPrompt *)self _synchronous_servicePerform:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 keyIdentifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke_2;
  v6[3] = &unk_265276E98;
  v6[4] = *(void *)(a1 + 40);
  [v4 wantsToPresentHeadUnitPairingPromptForKeyIdentifier:v5 completion:v6];
}

void __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
    v6 = CARSetupLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      int v8 = 138412290;
      objc_super v9 = v7;
      _os_log_impl(&dword_249B58000, v6, OS_LOG_TYPE_DEFAULT, "wantsToPresentHeadUnitPairing: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v6 = CARSetupLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke_2_cold_1();
    }
  }
}

- (id)headUnitPairingPromptViewController
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__CARSetupHeadUnitPairingPrompt_headUnitPairingPromptViewController__block_invoke;
  v4[3] = &unk_265276EE8;
  objc_copyWeak(&v5, &location);
  char v2 = +[CARSetupPrompts connectPromptWithBluetoothOnlyOption:0 wirelessEnablement:0 responseHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __68__CARSetupHeadUnitPairingPrompt_headUnitPairingPromptViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidFinishWithResult:a2];
}

- (void)presentHeadUnitPairingPrompt
{
  objc_super v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249B58000, v3, OS_LOG_TYPE_INFO, "calling presentHeadUnitPairingPrompt", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke;
  v4[3] = &unk_265276F60;
  void v4[4] = self;
  [(CARSetupHeadUnitPairingPrompt *)self _servicePerform:v4];
}

void __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 keyIdentifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke_2;
  v6[3] = &unk_265276F38;
  v6[4] = *(void *)(a1 + 32);
  [v4 presentHeadUnitPairingPromptForKeyIdentifier:v5 completion:v6];
}

void __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_249B58000, v6, OS_LOG_TYPE_DEFAULT, "presentHeadUnitPairingPrompt completed: %{public}@ error: %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke_9;
  v8[3] = &unk_265276F10;
  v8[4] = *(void *)(a1 + 32);
  char v9 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __61__CARSetupHeadUnitPairingPrompt_presentHeadUnitPairingPrompt__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_delegateDidFinishWithResult:", *(unsigned __int8 *)(a1 + 40));
}

- (void)invalidate
{
  objc_super v3 = [(CARSetupHeadUnitPairingPrompt *)self connection];
  [v3 invalidate];

  [(CARSetupHeadUnitPairingPrompt *)self setConnection:0];
}

- (void)_setupConnection
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.carkit.headUnitPairingPrompt.service" options:4096];
  id v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDCEE08];
  [v3 setRemoteObjectInterface:v4];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke;
  v7[3] = &unk_265276F88;
  objc_copyWeak(&v8, &location);
  [v3 setInterruptionHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_66;
  v5[3] = &unk_265276F88;
  objc_copyWeak(&v6, &location);
  [v3 setInvalidationHandler:v5];
  [v3 resume];
  [(CARSetupHeadUnitPairingPrompt *)self setConnection:v3];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke(uint64_t a1)
{
  char v2 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionReset];
}

void __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_66(uint64_t a1)
{
  char v2 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_66_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)_servicePerform:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(CARSetupHeadUnitPairingPrompt *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_0];

  v4[2](v4, v6);
}

void __49__CARSetupHeadUnitPairingPrompt__servicePerform___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__CARSetupHeadUnitPairingPrompt__servicePerform___block_invoke_cold_1();
  }
}

- (void)_synchronous_servicePerform:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(CARSetupHeadUnitPairingPrompt *)self connection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_69];

  v4[2](v4, v6);
}

void __61__CARSetupHeadUnitPairingPrompt__synchronous_servicePerform___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__CARSetupHeadUnitPairingPrompt__servicePerform___block_invoke_cold_1();
  }
}

- (void)_handleConnectionReset
{
}

- (void)_handleDidFinishWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"declined";
    if (v3) {
      id v6 = @"accepted";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_249B58000, v5, OS_LOG_TYPE_DEFAULT, "head unit pairing prompt was %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke;
  v7[3] = &unk_265276FF0;
  BOOL v8 = v3;
  void v7[4] = self;
  [(CARSetupHeadUnitPairingPrompt *)self _synchronous_servicePerform:v7];
  [(CARSetupHeadUnitPairingPrompt *)self _mainQueue_delegateDidFinishWithResult:v3];
}

void __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 keyIdentifier];
  [v4 handleReceivedResponse:v2 forKeyIdentifier:v5 completion:&__block_literal_global_77];
}

void __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = CARSetupLogForCategory(0);
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_249B58000, v6, OS_LOG_TYPE_INFO, "head unit pairing service handled the response", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke_2_cold_1();
  }
}

- (void)_mainQueue_delegateDidFinishWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v5 = [(CARSetupHeadUnitPairingPrompt *)self delegate];
  if (v5)
  {
    id v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 headUnitPairingPrompt:self didFinishWithResult:v3];
    }
  }
  MEMORY[0x270F9A790]();
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (CARSetupHeadUnitPairingPromptDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CARSetupHeadUnitPairingPromptDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

void __62__CARSetupHeadUnitPairingPrompt_wantsToPresentHeadUnitPairing__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B58000, v0, v1, "error from wantsToPresentHeadUnitPairing: %@", v2, v3, v4, v5, v6);
}

void __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_249B58000, log, OS_LOG_TYPE_ERROR, "CarKit head unit pairing prompt service was interrupted", v1, 2u);
}

void __49__CARSetupHeadUnitPairingPrompt__setupConnection__block_invoke_66_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_249B58000, log, OS_LOG_TYPE_ERROR, "CarKit head unit pairing prompt service was invalidated", v1, 2u);
}

void __49__CARSetupHeadUnitPairingPrompt__servicePerform___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B58000, v0, v1, "error calling CarKit head unit pairing prompt service: %@", v2, v3, v4, v5, v6);
}

void __60__CARSetupHeadUnitPairingPrompt__handleDidFinishWithResult___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B58000, v0, v1, "head unit pairing service failed to handle the response, error: %@", v2, v3, v4, v5, v6);
}

@end