@interface DMTSharingBackedRemoteSetupBroadcaster
- (BOOL)isBroadcasting;
- (BOOL)isInvalidated;
- (CATOperationQueue)delegateQueue;
- (CATSharingBroadcastTerminal)terminal;
- (DMTSharingBackedRemoteSetupBroadcaster)initWithPrimitives:(id)a3;
- (NSString)displayedPin;
- (id)pairedTransportHandler;
- (id)showErrorHandler;
- (id)showPinHandler;
- (void)beginObservingTerminal;
- (void)broadcastTerminal:(id)a3 didActivateWithError:(id)a4;
- (void)broadcastTerminal:(id)a3 hasError:(id)a4;
- (void)broadcastTerminal:(id)a3 hasPairedDeviceConnection:(id)a4;
- (void)broadcastTerminal:(id)a3 needsToDisplayPin:(id)a4;
- (void)broadcastTerminal:(id)a3 stoppedWithError:(id)a4;
- (void)broadcastTerminalNeedsToDismissPin:(id)a3;
- (void)dealloc;
- (void)endObservingTerminal;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDisplayedPin:(id)a3;
- (void)setIsBroadcasting:(BOOL)a3;
- (void)setIsInvalidated:(BOOL)a3;
- (void)setPairedTransportHandler:(id)a3;
- (void)setShowErrorHandler:(id)a3;
- (void)setShowPinHandler:(id)a3;
- (void)startBroadcasting;
@end

@implementation DMTSharingBackedRemoteSetupBroadcaster

- (void)dealloc
{
  [(DMTSharingBackedRemoteSetupBroadcaster *)self endObservingTerminal];
  v3.receiver = self;
  v3.super_class = (Class)DMTSharingBackedRemoteSetupBroadcaster;
  [(DMTSharingBackedRemoteSetupBroadcaster *)&v3 dealloc];
}

- (DMTSharingBackedRemoteSetupBroadcaster)initWithPrimitives:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMTSharingBackedRemoteSetupBroadcaster;
  v5 = [(DMTSharingBackedRemoteSetupBroadcaster *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (CATOperationQueue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F317F0]) initWithBroadcastPrimitives:v4 delegate:v5 delegationQueue:v5->_delegateQueue];
    terminal = v5->_terminal;
    v5->_terminal = (CATSharingBroadcastTerminal *)v8;
  }
  return v5;
}

- (void)startBroadcasting
{
}

- (void)invalidate
{
  if ([(DMTSharingBackedRemoteSetupBroadcaster *)self isBroadcasting]
    && ![(DMTSharingBackedRemoteSetupBroadcaster *)self isInvalidated])
  {
    id v3 = [(DMTSharingBackedRemoteSetupBroadcaster *)self terminal];
    [v3 invalidate];
  }
}

- (void)broadcastTerminal:(id)a3 didActivateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _DMTLogGeneral_3();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DMTSharingBackedRemoteSetupBroadcaster broadcastTerminal:didActivateWithError:]();
    }

    [(DMTSharingBackedRemoteSetupBroadcaster *)self performSelectorOnMainThread:sel_invalidateWithError_ withObject:v7 waitUntilDone:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[DMTSharingBackedRemoteSetupBroadcaster broadcastTerminal:didActivateWithError:]();
    }
  }
}

- (void)broadcastTerminal:(id)a3 hasError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasError___block_invoke;
  v7[3] = &unk_2649A9E78;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __69__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasError___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidated] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) showErrorHandler];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) showErrorHandler];
      v3[2](v3, *(void *)(a1 + 40));
    }
  }
}

- (void)broadcastTerminal:(id)a3 stoppedWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_stoppedWithError___block_invoke;
  v7[3] = &unk_2649A9E78;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __77__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_stoppedWithError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInvalidated];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 invalidateWithError:v4];
  }
  return result;
}

- (void)broadcastTerminal:(id)a3 hasPairedDeviceConnection:(id)a4
{
  id v5 = a4;
  id v6 = _DMTLogGeneral_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[DMTSharingBackedRemoteSetupBroadcaster broadcastTerminal:hasPairedDeviceConnection:](v5, v6);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke;
  v8[3] = &unk_2649A9E78;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInvalidated])
  {
    v2 = _DMTLogGeneral_3();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    v2 = [objc_alloc(MEMORY[0x263F31800]) initWithConnection:*(void *)(a1 + 40)];
    v10 = [*(id *)(a1 + 32) pairedTransportHandler];

    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) pairedTransportHandler];
      (*(void (**)(uint64_t, NSObject *))(v11 + 16))(v11, v2);
    }
    else
    {
      uint64_t v11 = _DMTLogGeneral_3();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
        __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

- (void)broadcastTerminal:(id)a3 needsToDisplayPin:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_needsToDisplayPin___block_invoke;
  v7[3] = &unk_2649A9E78;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __78__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_needsToDisplayPin___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidated] & 1) == 0)
  {
    v2 = (void *)[*(id *)(a1 + 40) copy];
    [*(id *)(a1 + 32) setDisplayedPin:v2];

    uint64_t v3 = [*(id *)(a1 + 32) showPinHandler];

    if (v3)
    {
      id v5 = [*(id *)(a1 + 32) showPinHandler];
      uint64_t v4 = [*(id *)(a1 + 32) displayedPin];
      v5[2](v5, v4);
    }
  }
}

- (void)broadcastTerminalNeedsToDismissPin:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminalNeedsToDismissPin___block_invoke;
  block[3] = &unk_2649A9730;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __77__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminalNeedsToDismissPin___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidated] & 1) == 0)
  {
    [*(id *)(a1 + 32) setDisplayedPin:0];
    v2 = [*(id *)(a1 + 32) showPinHandler];

    if (v2)
    {
      uint64_t v3 = [*(id *)(a1 + 32) showPinHandler];
      v3[2](v3, 0);
    }
  }
}

- (void)invalidateWithError:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(DMTSharingBackedRemoteSetupBroadcaster *)self setIsInvalidated:1];
  [(DMTSharingBackedRemoteSetupBroadcaster *)self setDisplayedPin:0];
  id v5 = _DMTLogGeneral_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[DMTSharingBackedRemoteSetupBroadcaster invalidateWithError:]();
  }

  id v6 = [(DMTSharingBackedRemoteSetupBroadcaster *)self showErrorHandler];

  if (v6)
  {
    uint64_t v7 = [(DMTSharingBackedRemoteSetupBroadcaster *)self showErrorHandler];
    uint64_t v10 = *MEMORY[0x263F08608];
    v11[0] = v4;
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = DMTErrorWithCodeAndUserInfo(40, v8);
    ((void (**)(void, void *))v7)[2](v7, v9);
  }
}

- (void)beginObservingTerminal
{
  id v3 = [(DMTSharingBackedRemoteSetupBroadcaster *)self terminal];
  [v3 addObserver:self forKeyPath:@"broadcasting" options:4 context:@"TerminalObservationContext"];
}

- (void)endObservingTerminal
{
  id v3 = [(DMTSharingBackedRemoteSetupBroadcaster *)self terminal];
  [v3 removeObserver:self forKeyPath:@"broadcasting" context:@"TerminalObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"TerminalObservationContext")
  {
    if (objc_msgSend(a3, "isEqualToString:", @"broadcasting", a4, a5))
    {
      uint64_t v7 = [(DMTSharingBackedRemoteSetupBroadcaster *)self terminal];
      int v8 = [v7 isBroadcasting];
      int v9 = [(DMTSharingBackedRemoteSetupBroadcaster *)self isBroadcasting];

      if (v8 != v9)
      {
        id v10 = [(DMTSharingBackedRemoteSetupBroadcaster *)self terminal];
        -[DMTSharingBackedRemoteSetupBroadcaster setIsBroadcasting:](self, "setIsBroadcasting:", [v10 isBroadcasting]);
      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DMTSharingBackedRemoteSetupBroadcaster;
    -[DMTSharingBackedRemoteSetupBroadcaster observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)showPinHandler
{
  return self->_showPinHandler;
}

- (void)setShowPinHandler:(id)a3
{
}

- (id)showErrorHandler
{
  return self->_showErrorHandler;
}

- (void)setShowErrorHandler:(id)a3
{
}

- (id)pairedTransportHandler
{
  return self->_pairedTransportHandler;
}

- (void)setPairedTransportHandler:(id)a3
{
}

- (CATSharingBroadcastTerminal)terminal
{
  return self->_terminal;
}

- (CATOperationQueue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSString)displayedPin
{
  return self->_displayedPin;
}

- (void)setDisplayedPin:(id)a3
{
}

- (BOOL)isBroadcasting
{
  return self->_isBroadcasting;
}

- (void)setIsBroadcasting:(BOOL)a3
{
  self->_isBroadcasting = a3;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedPin, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong(&self->_pairedTransportHandler, 0);
  objc_storeStrong(&self->_showErrorHandler, 0);
  objc_storeStrong(&self->_showPinHandler, 0);
}

- (void)broadcastTerminal:didActivateWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ didActivate", v1, 0xCu);
}

- (void)broadcastTerminal:didActivateWithError:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_ERROR, "Activation of terminal failed, invalidating: %{public}@", v1, 0xCu);
}

- (void)broadcastTerminal:(void *)a1 hasPairedDeviceConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 remoteDevice];
  id v4 = [v3 identifier];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_DEBUG, "Paired connection vended for: %{public}@", v5, 0xCu);
}

void __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)invalidateWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_ERROR, "Broadcaster invalidated due to: %{public}@", v1, 0xCu);
}

@end