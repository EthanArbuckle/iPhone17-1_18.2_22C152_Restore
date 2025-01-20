@interface DMTCatalystSharingBackedDeviceSession
+ (id)failureTypeForPairingError:(id)a3;
- (BOOL)isInvalidated;
- (BOOL)isPaired;
- (BOOL)isReady;
- (CATSharingDevice)remoteDevice;
- (DMTCatalystSharingBackedDeviceSession)initWithDevice:(id)a3;
- (OS_dispatch_queue)sessionQueue;
- (SFSession)session;
- (id)deviceSessionErrorHandler;
- (id)deviceSessionInvalidatedHandler;
- (id)deviceSessionReadyHandler;
- (id)messageReceivedHandler;
- (id)pinPromptHandler;
- (void)activate;
- (void)addPrimitiveHandlers;
- (void)beginPairWithCompletion:(id)a3;
- (void)deactivate;
- (void)invalidateWithError:(id)a3;
- (void)removePrimitiveHandlers;
- (void)sendMessage:(id)a3;
- (void)setDeviceSessionErrorHandler:(id)a3;
- (void)setDeviceSessionInvalidatedHandler:(id)a3;
- (void)setDeviceSessionReadyHandler:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setMessageReceivedHandler:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPinPromptHandler:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)tryPairingPIN:(id)a3;
- (void)verifyPairing:(id)a3;
@end

@implementation DMTCatalystSharingBackedDeviceSession

- (DMTCatalystSharingBackedDeviceSession)initWithDevice:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMTCatalystSharingBackedDeviceSession;
  v6 = [(DMTCatalystSharingBackedDeviceSession *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteDevice, a3);
    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [(CATSharingDevice *)v7->_remoteDevice identifier];
    v12 = [v11 UUIDString];
    v13 = [v8 stringWithFormat:@"%@.%@", v10, v12];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    sessionQueue = v7->_sessionQueue;
    v7->_sessionQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_opt_new();
    session = v7->_session;
    v7->_session = (SFSession *)v17;

    v19 = [(DMTCatalystSharingBackedDeviceSession *)v7 device];
    v20 = [v19 underlyingDevice];
    [(SFSession *)v7->_session setPeerDevice:v20];

    [(SFSession *)v7->_session setServiceIdentifier:*MEMORY[0x263F6C380]];
    [(SFSession *)v7->_session setDispatchQueue:v7->_sessionQueue];
  }
  return v7;
}

- (void)activate
{
  [(DMTCatalystSharingBackedDeviceSession *)self addPrimitiveHandlers];
  objc_initWeak(&location, self);
  v3 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__DMTCatalystSharingBackedDeviceSession_activate__block_invoke;
  v4[3] = &unk_2649A9BE0;
  objc_copyWeak(&v5, &location);
  [v3 activateWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__DMTCatalystSharingBackedDeviceSession_activate__block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!v3)
    {
      uint64_t v7 = _DMTLogGeneral_4();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
        __49__DMTCatalystSharingBackedDeviceSession_activate__block_invoke_cold_1((uint64_t)v5, v7);
      }
      goto LABEL_7;
    }
    [WeakRetained setInvalidated:1];
    v6 = [v5 deviceSessionInvalidatedHandler];

    if (v6)
    {
      uint64_t v7 = [v5 deviceSessionInvalidatedHandler];
      uint64_t v10 = *MEMORY[0x263F08608];
      v11[0] = v3;
      v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      v9 = DMTErrorWithCodeAndUserInfo(20, v8);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

LABEL_7:
    }
  }
}

- (void)deactivate
{
  id v2 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v2 invalidate];
}

- (void)beginPairWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(DMTCatalystSharingBackedDeviceSession *)self isInvalidated]
    && [(DMTCatalystSharingBackedDeviceSession *)self isReady])
  {
    objc_initWeak(&location, self);
    id v5 = [(DMTCatalystSharingBackedDeviceSession *)self session];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__DMTCatalystSharingBackedDeviceSession_beginPairWithCompletion___block_invoke;
    v6[3] = &unk_2649A9C08;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [v5 pairSetupWithFlags:8 completion:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __65__DMTCatalystSharingBackedDeviceSession_beginPairWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = +[DMTCatalystSharingBackedDeviceSession failureTypeForPairingError:v3];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
    else
    {
      id v7 = _DMTLogGeneral_4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __65__DMTCatalystSharingBackedDeviceSession_beginPairWithCompletion___block_invoke_cold_1((uint64_t)WeakRetained, v7);
      }

      [WeakRetained setPaired:1];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)verifyPairing:(id)a3
{
  id v4 = a3;
  if (![(DMTCatalystSharingBackedDeviceSession *)self isInvalidated]
    && [(DMTCatalystSharingBackedDeviceSession *)self isReady])
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [(DMTCatalystSharingBackedDeviceSession *)self session];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__DMTCatalystSharingBackedDeviceSession_verifyPairing___block_invoke;
    v6[3] = &unk_2649A9C08;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [v5 pairVerifyWithFlags:8 completion:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__DMTCatalystSharingBackedDeviceSession_verifyPairing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = _DMTLogGeneral_4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __55__DMTCatalystSharingBackedDeviceSession_verifyPairing___block_invoke_cold_1((uint64_t)v3, v6);
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      [WeakRetained setPaired:1];
      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v7();
  }
}

- (void)tryPairingPIN:(id)a3
{
  id v6 = a3;
  if (![(DMTCatalystSharingBackedDeviceSession *)self isInvalidated]
    && [(DMTCatalystSharingBackedDeviceSession *)self isReady])
  {
    id v4 = [(DMTCatalystSharingBackedDeviceSession *)self session];
    uint64_t v5 = (void *)[v6 copy];
    [v4 pairSetupTryPIN:v5];
  }
}

- (void)sendMessage:(id)a3
{
  id v5 = a3;
  if (![(DMTCatalystSharingBackedDeviceSession *)self isInvalidated]
    && [(DMTCatalystSharingBackedDeviceSession *)self isReady])
  {
    id v4 = [(DMTCatalystSharingBackedDeviceSession *)self session];
    [v4 sendWithFlags:1 object:v5];
  }
}

- (void)addPrimitiveHandlers
{
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke;
  v19[3] = &unk_2649A9C30;
  objc_copyWeak(&v20, &location);
  id v3 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v3 setSessionStartedHandler:v19];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_2;
  v17[3] = &unk_2649A9C30;
  objc_copyWeak(&v18, &location);
  id v4 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v4 setInvalidationHandler:v17];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_3;
  v15[3] = &unk_2649A9C30;
  objc_copyWeak(&v16, &location);
  id v5 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v5 setInterruptionHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_9;
  v13[3] = &unk_2649A9EA0;
  objc_copyWeak(&v14, &location);
  id v6 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v6 setPromptForPINHandler:v13];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_2_11;
  v11[3] = &unk_2649A9BE0;
  objc_copyWeak(&v12, &location);
  id v7 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v7 setErrorHandler:v11];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_3_12;
  v9[3] = &unk_2649A9EC8;
  objc_copyWeak(&v10, &location);
  id v8 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v8 setReceivedObjectHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setReady:1];
    uint64_t v2 = [v4 deviceSessionReadyHandler];
    id v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }

    id WeakRetained = v4;
  }
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = DMTErrorWithCodeAndUserInfo(20, 0);
    [WeakRetained invalidateWithError:v1];
  }
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained isInvalidated])
    {
      id v3 = _DMTLogGeneral_4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_INFO, "Interrupted after invalidation, no-op", v4, 2u);
      }
    }
    else
    {
      id v3 = DMTErrorWithCodeAndUserInfo(21, 0);
      [v2 invalidateWithError:v3];
    }
  }
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_9(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    uint64_t v5 = [WeakRetained pinPromptHandler];
    id v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v7, a3);
    }

    id WeakRetained = v7;
  }
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_2_11(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained deviceSessionErrorHandler];
    id v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
    }
  }
}

void __61__DMTCatalystSharingBackedDeviceSession_addPrimitiveHandlers__block_invoke_3_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained messageReceivedHandler];
    if (([v5 isInvalidated] & 1) == 0 && v6) {
      ((void (**)(void, id))v6)[2](v6, v7);
    }
  }
}

- (void)removePrimitiveHandlers
{
  id v3 = [(DMTCatalystSharingBackedDeviceSession *)self sessionQueue];
  MEMORY[0x230F7E320]();

  id v4 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v4 setSessionStartedHandler:0];

  uint64_t v5 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v5 setInvalidationHandler:0];

  id v6 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v6 setInterruptionHandler:0];

  id v7 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v7 setPromptForPINHandler:0];

  id v8 = [(DMTCatalystSharingBackedDeviceSession *)self session];
  [v8 setErrorHandler:0];
}

- (void)invalidateWithError:(id)a3
{
  id v4 = [(DMTCatalystSharingBackedDeviceSession *)self sessionQueue];
  MEMORY[0x230F7E320]();

  [(DMTCatalystSharingBackedDeviceSession *)self setInvalidated:1];
  [(DMTCatalystSharingBackedDeviceSession *)self setReady:0];
  [(DMTCatalystSharingBackedDeviceSession *)self removePrimitiveHandlers];
  uint64_t v5 = [(DMTCatalystSharingBackedDeviceSession *)self deviceSessionInvalidatedHandler];

  if (v5)
  {
    id v7 = [(DMTCatalystSharingBackedDeviceSession *)self deviceSessionInvalidatedHandler];
    id v6 = DMTErrorWithCodeAndUserInfo(20, 0);
    v7[2](v7, v6);
  }
}

+ (id)failureTypeForPairingError:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F317F8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithUnderlyingError:v4];

  return v5;
}

- (CATSharingDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (id)deviceSessionInvalidatedHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceSessionInvalidatedHandler:(id)a3
{
}

- (id)deviceSessionReadyHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceSessionReadyHandler:(id)a3
{
}

- (id)deviceSessionErrorHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceSessionErrorHandler:(id)a3
{
}

- (id)pinPromptHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPinPromptHandler:(id)a3
{
}

- (id)messageReceivedHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageReceivedHandler:(id)a3
{
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (SFSession)session
{
  return self->_session;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong(&self->_messageReceivedHandler, 0);
  objc_storeStrong(&self->_pinPromptHandler, 0);
  objc_storeStrong(&self->_deviceSessionErrorHandler, 0);
  objc_storeStrong(&self->_deviceSessionReadyHandler, 0);
  objc_storeStrong(&self->_deviceSessionInvalidatedHandler, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
}

void __49__DMTCatalystSharingBackedDeviceSession_activate__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ activated successfully", (uint8_t *)&v2, 0xCu);
}

void __65__DMTCatalystSharingBackedDeviceSession_beginPairWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ paired successfully", (uint8_t *)&v2, 0xCu);
}

void __55__DMTCatalystSharingBackedDeviceSession_verifyPairing___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_ERROR, "Not already paired: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end