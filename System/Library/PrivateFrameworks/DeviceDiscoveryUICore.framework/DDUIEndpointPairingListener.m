@interface DDUIEndpointPairingListener
- (DDUIEndpointPairingListener)initWithTransport:(id)a3;
- (DDUIEndpointPairingListeningTransport)transport;
- (void)beginListeningWithErrorHandler:(id)a3 pairingHandler:(id)a4 completion:(id)a5;
- (void)checkIfUserNeedsReconfirmationForSession:(id)a3 withServiceIdentifier:(id)a4 completion:(id)a5;
- (void)createListenerMappingForSession:(id)a3 withServiceIdentifier:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setTransport:(id)a3;
@end

@implementation DDUIEndpointPairingListener

- (DDUIEndpointPairingListener)initWithTransport:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DDUIEndpointPairingListener;
  v6 = [(DDUIEndpointPairingListener *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transport, a3);
    v8 = _DDUICoreLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1CFC71000, v8, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingListener init] {self: %p, transport: %@}", buf, 0x16u);
    }
  }
  return v7;
}

- (void)beginListeningWithErrorHandler:(id)a3 pairingHandler:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _DDUICoreLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x1D25DB000](v10);
    __int16 v13 = (void *)MEMORY[0x1D25DB000](v9);
    id v14 = (void *)MEMORY[0x1D25DB000](v10);
    *(_DWORD *)buf = 134218754;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v12;
    __int16 v29 = 2112;
    v30 = v13;
    __int16 v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_1CFC71000, v11, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingListener beginning {self: %p, errorHandler: %@, pairingHandler: %@, completion: %@}", buf, 0x2Au);
  }
  transport = self->_transport;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __88__DDUIEndpointPairingListener_beginListeningWithErrorHandler_pairingHandler_completion___block_invoke;
  v23[3] = &unk_1E685FCB8;
  id v24 = v9;
  id v16 = v9;
  [(DDUIEndpointPairingListeningTransport *)transport setupListeningForSessionsWithHandler:v23];
  v17 = self->_transport;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __88__DDUIEndpointPairingListener_beginListeningWithErrorHandler_pairingHandler_completion___block_invoke_2;
  v20[3] = &unk_1E685FCE0;
  v20[4] = self;
  id v21 = v8;
  id v22 = v10;
  id v18 = v10;
  id v19 = v8;
  [(DDUIEndpointPairingListeningTransport *)v17 activateForDeviceTypes:0xFFFFFFFFLL withCompletion:v20];
}

void __88__DDUIEndpointPairingListener_beginListeningWithErrorHandler_pairingHandler_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  id v10 = [[DDUIEndpointPairingSession alloc] initWithTransportSession:v8 mode:1];

  [(DDUIEndpointPairingSession *)v10 setSessionType:a4];
  [(DDUIEndpointPairingSession *)v10 setIncomingMessage:v7];
  id v9 = [(DDUIEndpointPairingSession *)v10 processInitialMessage:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__DDUIEndpointPairingListener_beginListeningWithErrorHandler_pairingHandler_completion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _DDUICoreLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = a1[4];
      int v8 = 134218242;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingListener failed to activate {self: %p, inError: %@}", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = a1[4];
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingListener activated {self: %p}", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)checkIfUserNeedsReconfirmationForSession:(id)a3 withServiceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  transport = self->_transport;
  id v10 = a4;
  id v11 = [a3 remoteDevice];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__DDUIEndpointPairingListener_checkIfUserNeedsReconfirmationForSession_withServiceIdentifier_completion___block_invoke;
  v13[3] = &unk_1E685FD08;
  id v14 = v8;
  id v12 = v8;
  [(DDUIEndpointPairingListeningTransport *)transport shouldReauthenticateDevice:v11 forServiceIdentifier:v10 completion:v13];
}

void __105__DDUIEndpointPairingListener_checkIfUserNeedsReconfirmationForSession_withServiceIdentifier_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _DDUICoreLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"No";
    if (a2) {
      uint64_t v7 = @"Yes";
    }
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1CFC71000, v6, OS_LOG_TYPE_DEFAULT, "Should reauthenticate user session? %@ Found listenerID %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createListenerMappingForSession:(id)a3 withServiceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  transport = self->_transport;
  id v10 = a4;
  id v11 = [a3 remoteDevice];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__DDUIEndpointPairingListener_createListenerMappingForSession_withServiceIdentifier_completion___block_invoke;
  v13[3] = &unk_1E685FD30;
  id v14 = v8;
  id v12 = v8;
  [(DDUIEndpointPairingListeningTransport *)transport createListenerMappingForDevice:v11 forServiceIdentifier:v10 completion:v13];
}

uint64_t __96__DDUIEndpointPairingListener_createListenerMappingForSession_withServiceIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _DDUICoreLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = self;
    _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingListener invalidating {self: %p}", (uint8_t *)&v4, 0xCu);
  }

  [(DDUIEndpointPairingListeningTransport *)self->_transport invalidate];
}

- (DDUIEndpointPairingListeningTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end