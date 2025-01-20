@interface DMTSharingBroadcastPrimitives
- (BOOL)isActivated;
- (BOOL)isInvalidated;
- (BOOL)isPaired;
- (CATSharingDevice)remoteDevice;
- (DMTSharingBroadcastPrimitives)initWithLoggingIdentifier:(id)a3;
- (NSMutableArray)receivedObjectQueue;
- (OS_dispatch_queue)broadcastCallbackQueue;
- (SFService)sharingService;
- (id)dismissPinHandler;
- (id)invalidationHandler;
- (id)messageReceivedHandler;
- (id)sessionPairedHandler;
- (id)showPinHandler;
- (void)activateWithCompletion:(id)a3;
- (void)addDependencyHandlers;
- (void)deactivate;
- (void)invalidateWithError:(id)a3;
- (void)removeDependencyHandlers:(BOOL)a3;
- (void)sendMessageToPairedDevice:(id)a3;
- (void)serviceReceivedObjectQueue;
- (void)setActivated:(BOOL)a3;
- (void)setDismissPinHandler:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessageReceivedHandler:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setSessionPairedHandler:(id)a3;
- (void)setShowPinHandler:(id)a3;
- (void)updateRemoteDeviceWithSession:(id)a3;
@end

@implementation DMTSharingBroadcastPrimitives

- (DMTSharingBroadcastPrimitives)initWithLoggingIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMTSharingBroadcastPrimitives;
  v5 = [(DMTSharingBroadcastPrimitives *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.devicemanagementtools.broadcast", 0);
    broadcastCallbackQueue = v5->_broadcastCallbackQueue;
    v5->_broadcastCallbackQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    receivedObjectQueue = v5->_receivedObjectQueue;
    v5->_receivedObjectQueue = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    sharingService = v5->_sharingService;
    v5->_sharingService = (SFService *)v10;

    [(SFService *)v5->_sharingService setLabel:v4];
    [(SFService *)v5->_sharingService setIdentifier:*MEMORY[0x263F6C380]];
    [(SFService *)v5->_sharingService setDeviceActionType:21];
    [(SFService *)v5->_sharingService setNeedsSetup:1];
    [(SFService *)v5->_sharingService setDispatchQueue:v5->_broadcastCallbackQueue];
  }

  return v5;
}

- (void)setMessageReceivedHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x230F7E770]();
  id messageReceivedHandler = self->_messageReceivedHandler;
  self->_id messageReceivedHandler = v5;

  if (self->_messageReceivedHandler)
  {
    objc_initWeak(&location, self);
    v7 = [(DMTSharingBroadcastPrimitives *)self broadcastCallbackQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__DMTSharingBroadcastPrimitives_setMessageReceivedHandler___block_invoke;
    v8[3] = &unk_2649A9C30;
    objc_copyWeak(&v9, &location);
    dispatch_async(v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __59__DMTSharingBroadcastPrimitives_setMessageReceivedHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained serviceReceivedObjectQueue];
    id WeakRetained = v2;
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  [(DMTSharingBroadcastPrimitives *)self addDependencyHandlers];
  objc_initWeak(&location, self);
  v5 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__DMTSharingBroadcastPrimitives_activateWithCompletion___block_invoke;
  v7[3] = &unk_2649A9C08;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 activateWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__DMTSharingBroadcastPrimitives_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained setActivated:v4 == 0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)deactivate
{
  id v2 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v2 invalidate];
}

- (void)sendMessageToPairedDevice:(id)a3
{
  id v4 = a3;
  v5 = [(DMTSharingBroadcastPrimitives *)self remoteDevice];

  if (v5)
  {
    id v6 = [(DMTSharingBroadcastPrimitives *)self sharingService];
    v7 = [(DMTSharingBroadcastPrimitives *)self remoteDevice];
    id v8 = [v7 identifier];
    [v6 sendToPeer:v8 flags:1 object:v4];
  }
  else
  {
    id v9 = _DMTLogGeneral_1();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DMTSharingBroadcastPrimitives sendMessageToPairedDevice:]();
    }
  }
}

- (void)addDependencyHandlers
{
  objc_initWeak(location, self);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke;
  v28[3] = &unk_2649A9C30;
  objc_copyWeak(&v29, location);
  v3 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v3 setInvalidationHandler:v28];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2;
  v26[3] = &unk_2649A9C30;
  objc_copyWeak(&v27, location);
  id v4 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v4 setInterruptionHandler:v26];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_5;
  v24[3] = &unk_2649A9BE0;
  objc_copyWeak(&v25, location);
  v5 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v5 setErrorHandler:v24];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_6;
  v22[3] = &unk_2649A9D08;
  objc_copyWeak(&v23, location);
  id v6 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v6 setShowPINHandlerEx:v22];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2_8;
  v20[3] = &unk_2649A9C30;
  objc_copyWeak(&v21, location);
  v7 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v7 setHidePINHandler:v20];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_3;
  v18[3] = &unk_2649A9D30;
  objc_copyWeak(&v19, location);
  id v8 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v8 setSessionStartedHandler:v18];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_10;
  v16[3] = &unk_2649A9D30;
  objc_copyWeak(&v17, location);
  id v9 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v9 setSessionSecuredHandler:v16];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11;
  v14[3] = &unk_2649A9D58;
  objc_copyWeak(&v15, location);
  uint64_t v10 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v10 setSessionEndedHandler:v14];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_13;
  v12[3] = &unk_2649A9D80;
  objc_copyWeak(&v13, location);
  v11 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v11 setReceivedObjectHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = DMTErrorWithCodeAndUserInfo(30, 0);
    [WeakRetained invalidateWithError:v1];
  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = _DMTLogGeneral_1();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2_cold_1();
    }

    if ([WeakRetained isInvalidated])
    {
      v3 = _DMTLogGeneral_1();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_INFO, "Interrupted after invalidation, no-op", v4, 2u);
      }
    }
    else
    {
      v3 = DMTErrorWithCodeAndUserInfo(31, 0);
      [WeakRetained invalidateWithError:v3];
    }
  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = _DMTLogGeneral_1();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_5_cold_1((uint64_t)WeakRetained, (uint64_t)v3, v5);
    }
  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained showPinHandler];
    v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    }
  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained dismissPinHandler];
    id v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }

    id WeakRetained = v4;
  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = _DMTLogGeneral_1();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_3_cold_1(v3);
    }

    [WeakRetained updateRemoteDeviceWithSession:v3];
  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained broadcastCallbackQueue];
    MEMORY[0x230F7E320]();

    v7 = _DMTLogGeneral_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_10_cold_1(v3);
    }

    [v5 setPaired:1];
    [v5 updateRemoteDeviceWithSession:v3];
    uint64_t v8 = [v5 sessionPairedHandler];
    id v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }
    [v5 serviceReceivedObjectQueue];
  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    int v9 = [WeakRetained isInvalidated];
    uint64_t v10 = _DMTLogGeneral_1();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11) {
        __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11_cold_1();
      }
LABEL_5:

      goto LABEL_11;
    }
    if (v11) {
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11_cold_2(v5, (uint64_t)v6, v10);
    }

    [v8 setRemoteDevice:0];
    if ([v8 isPaired])
    {
      if (v6)
      {
        [v8 invalidateWithError:v6];
        goto LABEL_11;
      }
      uint64_t v10 = DMTErrorWithCodeAndUserInfo(91, 0);
      [v8 invalidateWithError:v10];
      goto LABEL_5;
    }
  }
LABEL_11:
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = [WeakRetained broadcastCallbackQueue];
    MEMORY[0x230F7E320]();

    [v9 updateRemoteDeviceWithSession:v6];
    BOOL v11 = _DMTLogGeneral_1();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_22D3D6000, v11, OS_LOG_TYPE_INFO, "Received object: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    v12 = [v9 receivedObjectQueue];
    [v12 addObject:v7];

    [v9 serviceReceivedObjectQueue];
  }
}

- (void)removeDependencyHandlers:(BOOL)a3
{
  id v5 = [(DMTSharingBroadcastPrimitives *)self broadcastCallbackQueue];
  MEMORY[0x230F7E320]();

  id v6 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v6 setSessionStartedHandler:0];

  id v7 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v7 setShowPINHandler:0];

  uint64_t v8 = [(DMTSharingBroadcastPrimitives *)self sharingService];
  [v8 setSessionSecuredHandler:0];

  if (!a3)
  {
    int v9 = [(DMTSharingBroadcastPrimitives *)self sharingService];
    [v9 setInvalidationHandler:0];

    uint64_t v10 = [(DMTSharingBroadcastPrimitives *)self sharingService];
    [v10 setInterruptionHandler:0];

    BOOL v11 = [(DMTSharingBroadcastPrimitives *)self sharingService];
    [v11 setHidePINHandler:0];

    v12 = [(DMTSharingBroadcastPrimitives *)self sharingService];
    [v12 setSessionEndedHandler:0];

    id v13 = [(DMTSharingBroadcastPrimitives *)self sharingService];
    [v13 setReceivedObjectHandler:0];
  }
}

- (void)invalidateWithError:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _DMTLogGeneral_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[DMTSharingBroadcastPrimitives invalidateWithError:]();
  }

  id v6 = [(DMTSharingBroadcastPrimitives *)self broadcastCallbackQueue];
  MEMORY[0x230F7E320]();

  [(DMTSharingBroadcastPrimitives *)self setInvalidated:1];
  id v7 = [(DMTSharingBroadcastPrimitives *)self invalidationHandler];
  if (v7)
  {
    uint64_t v10 = *MEMORY[0x263F08608];
    v11[0] = v4;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v9 = DMTErrorWithCodeAndUserInfo(30, v8);
    ((void (**)(void, void *))v7)[2](v7, v9);
  }
  [(DMTSharingBroadcastPrimitives *)self removeDependencyHandlers:0];
}

- (void)updateRemoteDeviceWithSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DMTSharingBroadcastPrimitives *)self broadcastCallbackQueue];
  MEMORY[0x230F7E320]();

  id v6 = [v4 peerDevice];

  if (v6) {
    id v7 = [[DMTSharingDevice alloc] initWithDevice:v6];
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = _DMTLogGeneral_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DMTSharingBroadcastPrimitives updateRemoteDeviceWithSession:]();
  }

  [(DMTSharingBroadcastPrimitives *)self performSelectorOnMainThread:sel_setRemoteDevice_ withObject:v7 waitUntilDone:0];
}

- (void)serviceReceivedObjectQueue
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D3D6000, v0, v1, "Not Servicing ReceivedObject Queue because we are not yet paired", v2, v3, v4, v5, v6);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)showPinHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setShowPinHandler:(id)a3
{
}

- (id)dismissPinHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDismissPinHandler:(id)a3
{
}

- (id)sessionPairedHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionPairedHandler:(id)a3
{
}

- (id)messageReceivedHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (CATSharingDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (OS_dispatch_queue)broadcastCallbackQueue
{
  return self->_broadcastCallbackQueue;
}

- (NSMutableArray)receivedObjectQueue
{
  return self->_receivedObjectQueue;
}

- (SFService)sharingService
{
  return self->_sharingService;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingService, 0);
  objc_storeStrong((id *)&self->_receivedObjectQueue, 0);
  objc_storeStrong((id *)&self->_broadcastCallbackQueue, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong(&self->_messageReceivedHandler, 0);
  objc_storeStrong(&self->_sessionPairedHandler, 0);
  objc_storeStrong(&self->_dismissPinHandler, 0);
  objc_storeStrong(&self->_showPinHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

- (void)sendMessageToPairedDevice:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_ERROR, "Remove device is nil while trying to send message, bailing", v1, 2u);
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_ERROR, "[DMT] Sharing service interrupted", v1, 2u);
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_5_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_22D3D6000, a3, OS_LOG_TYPE_ERROR, "%{public}@, sharing error: %{public}@", v6, 0x16u);
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_3_cold_1(void *a1)
{
  uint64_t v1 = [a1 peerDevice];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 UUIDString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v4, v5, "Session Started for %{public}@.", v6, v7, v8, v9, v10);
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_10_cold_1(void *a1)
{
  uint64_t v1 = [a1 peerDevice];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 UUIDString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v4, v5, "Session Secured for %{public}@.", v6, v7, v8, v9, v10);
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D3D6000, v0, v1, "Session ended after invalidation, no-op", v2, v3, v4, v5, v6);
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 peerDevice];
  uint64_t v5 = [v4 identifier];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_22D3D6000, a3, OS_LOG_TYPE_DEBUG, "Session Ended for %{public}@, due to: %{public}@", v6, 0x16u);
}

- (void)invalidateWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_ERROR, "[DMT] Primitives invalidated with error: %{public}@", v1, 0xCu);
}

- (void)updateRemoteDeviceWithSession:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_DEBUG, "Updating remoteDevice with %{public}@", v1, 0xCu);
}

@end