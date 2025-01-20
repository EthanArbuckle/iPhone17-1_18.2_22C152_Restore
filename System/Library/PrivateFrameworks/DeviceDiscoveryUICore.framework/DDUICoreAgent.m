@interface DDUICoreAgent
+ (id)sharedInstance;
- (BOOL)started;
- (DDUIEndpointPairingListener)endpointPairingListener;
- (_DDUINotificationManager)notificationManager;
- (void)_handleIncomingContinuityCameraConfirmation:(id)a3;
- (void)_handleIncomingPairingSession:(id)a3 pairingMessage:(id)a4;
- (void)_setupListenerIfNeededWithCompletion:(id)a3;
- (void)_showNotificationForPairingSession:(id)a3 pairingMessage:(id)a4;
- (void)_startOnQueue;
- (void)setEndpointPairingListener:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)start;
@end

@implementation DDUICoreAgent

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__DDUICoreAgent_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __31__DDUICoreAgent_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (void)start
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "Starting up DDUICoreAgent {self: %@}", buf, 0xCu);
  }

  v4 = DDUICorePrimaryQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__DDUICoreAgent_start__block_invoke;
  block[3] = &unk_1E685FA40;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __22__DDUICoreAgent_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startOnQueue];
}

- (void)_startOnQueue
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_started)
  {
    self->_started = 1;
    v3 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "Setup event stream handler {self: %@}", buf, 0xCu);
    }

    v4 = DDUICorePrimaryQueue();
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__DDUICoreAgent__startOnQueue__block_invoke;
    handler[3] = &unk_1E685FA90;
    handler[4] = self;
    xpc_set_event_stream_handler("com.apple.rapport.matching", v4, handler);

    v5 = +[_DDUIRemoteDisplaySessionHandler sharedInstance];
    [v5 activateWithCompletion:&__block_literal_global_0];
  }
}

void __30__DDUICoreAgent__startOnQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__DDUICoreAgent__startOnQueue__block_invoke_2;
  v10[3] = &unk_1E685FA40;
  id v4 = v3;
  id v11 = v4;
  v5 = (void (**)(void))MEMORY[0x1D25DB000](v10);
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14560]);
  if (string)
  {
    if (!strcmp(string, "com.apple.devicediscoveryui.rapportwake"))
    {
      v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __30__DDUICoreAgent__startOnQueue__block_invoke_3;
      v8[3] = &unk_1E685FA68;
      uint64_t v9 = v5;
      [v7 _setupListenerIfNeededWithCompletion:v8];
    }
    else
    {
      v5[2](v5);
    }
  }
}

void __30__DDUICoreAgent__startOnQueue__block_invoke_2(uint64_t a1)
{
  if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "replyRequired"))
  {
    v2 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1CFC71000, v2, OS_LOG_TYPE_DEFAULT, "configureXPC -- sending reply", v4, 2u);
    }

    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply) {
      xpc_dictionary_send_reply();
    }
  }
}

uint64_t __30__DDUICoreAgent__startOnQueue__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setupListenerIfNeededWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->_endpointPairingListener)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
  else
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy_;
    v16[4] = __Block_byref_object_dispose_;
    id v17 = 0;
    id v17 = (id)MEMORY[0x1D25DB000](v4);
    v6 = [DDUIEndpointPairingListener alloc];
    v7 = DDUIEndpointPairingListeningTransportForOptions(-1);
    uint64_t v8 = [(DDUIEndpointPairingListener *)v6 initWithTransport:v7];
    endpointPairingListener = self->_endpointPairingListener;
    self->_endpointPairingListener = v8;

    v10 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_endpointPairingListener;
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1CFC71000, v10, OS_LOG_TYPE_DEFAULT, "setupDDUIListenerIfNeeded, created listener for all available transports {endpointPairingListener: %@}", buf, 0xCu);
    }

    v12 = self->_endpointPairingListener;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke;
    v15[3] = &unk_1E685FAD8;
    v15[4] = v16;
    v13[4] = v16;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke_8;
    v14[3] = &unk_1E685FB00;
    v14[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke_10;
    v13[3] = &unk_1E685FB28;
    [(DDUIEndpointPairingListener *)v12 beginListeningWithErrorHandler:v15 pairingHandler:v14 completion:v13];
    _Block_object_dispose(v16, 8);
  }
}

void __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "setupDDUIListenerIfNeeded, received an error {listenError: %@}", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  if (v6)
  {
    (*(void (**)(void))(v6 + 16))();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v5 + 40);
  }
  else
  {
    v7 = 0;
  }
  *(void *)(v5 + 40) = 0;
}

void __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 remoteDevice];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CFC71000, v7, OS_LOG_TYPE_DEFAULT, "setupDDUIListenerIfNeeded, incoming pairing session {pairInitiateMessage: %@, pairingSession: %@ remoteDevice %@}", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = [v5 sessionType];
  uint64_t v10 = *(void **)(a1 + 32);
  if (v9 == 1) {
    [v10 _handleIncomingContinuityCameraConfirmation:v5];
  }
  else {
    [v10 _handleIncomingPairingSession:v5 pairingMessage:v6];
  }
}

void __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke_10(uint64_t a1)
{
  v2 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1CFC71000, v2, OS_LOG_TYPE_DEFAULT, "setupDDUIListenerIfNeeded, began", v6, 2u);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v3 + 40);
  }
  else
  {
    id v5 = 0;
  }
  *(void *)(v3 + 40) = 0;
}

- (void)_handleIncomingPairingSession:(id)a3 pairingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(DDUICoreAgent *)self notificationManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke;
  v23[3] = &unk_1E685FB50;
  id v24 = v6;
  id v25 = v8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_11;
  v20[3] = &unk_1E685FB78;
  id v9 = v24;
  id v21 = v9;
  id v22 = v25;
  id v10 = v25;
  [v9 activateWithErrorHandler:v23 completionHandler:v20];
  int v11 = [v7 applicationInfo];
  id v12 = [v11 bundleIDPrefixedServiceIdentifier];

  endpointPairingListener = self->_endpointPairingListener;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_13;
  v16[3] = &unk_1E685FBA0;
  id v17 = v9;
  v18 = self;
  id v19 = v7;
  id v14 = v7;
  id v15 = v9;
  [(DDUIEndpointPairingListener *)endpointPairingListener checkIfUserNeedsReconfirmationForSession:v15 withServiceIdentifier:v12 completion:v16];
}

void __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_cold_1();
  }

  id v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) sessionID];
  [v5 cancelMessageWithID:v6];
}

void __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "incoming pairingSession, finished pairing {pairingSession: %@, result %d}", (uint8_t *)&v8, 0x12u);
  }

  if (a2 == 1)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) sessionID];
    [v6 cancelMessageWithID:v7];
  }
}

void __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_13(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 || (a2 & 1) != 0)
  {
    [*(id *)(a1 + 40) _showNotificationForPairingSession:*(void *)(a1 + 32) pairingMessage:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1CFC71000, v6, OS_LOG_TYPE_DEFAULT, "Responding with existing listener UUID %@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [[DDUIPairCompleteMessage alloc] initWithNotificationResult:1 listenerUUID:v5];
    [*(id *)(a1 + 32) pairWithMessage:v7];
  }
}

- (void)_showNotificationForPairingSession:(id)a3 pairingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(DDUICoreAgent *)self notificationManager];
  id v9 = [v7 applicationInfo];
  if (v9)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v10 = [v6 sessionID];
    int v11 = [v6 remoteDevice];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__DDUICoreAgent__showNotificationForPairingSession_pairingMessage___block_invoke;
    v12[3] = &unk_1E685FBF0;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    id v14 = v9;
    [v8 handleApplicationInfo:v14 withID:v10 fromDevice:v11 completionHandler:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __67__DDUICoreAgent__showNotificationForPairingSession_pairingMessage___block_invoke(id *a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (a2 == 1)
  {
    id v6 = (void *)*((void *)WeakRetained + 2);
    id v7 = a1[4];
    int v8 = [a1[5] bundleIDPrefixedServiceIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__DDUICoreAgent__showNotificationForPairingSession_pairingMessage___block_invoke_2;
    v10[3] = &unk_1E685FBC8;
    id v11 = a1[4];
    [v6 createListenerMappingForSession:v7 withServiceIdentifier:v8 completion:v10];
  }
  else
  {
    id v9 = [[DDUIPairCompleteMessage alloc] initWithNotificationResult:a2];
    [a1[4] pairWithMessage:v9];
  }
}

void __67__DDUICoreAgent__showNotificationForPairingSession_pairingMessage___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "Received listener uuid %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [DDUIPairCompleteMessage alloc];
  if (v3)
  {
    uint64_t v6 = 1;
    id v7 = v3;
  }
  else
  {
    uint64_t v6 = 6;
    id v7 = 0;
  }
  int v8 = [(DDUIPairCompleteMessage *)v5 initWithNotificationResult:v6 listenerUUID:v7];
  [*(id *)(a1 + 32) pairWithMessage:v8];
}

- (_DDUINotificationManager)notificationManager
{
  notificationManager = self->_notificationManager;
  if (!notificationManager)
  {
    uint64_t v4 = objc_alloc_init(_DDUINotificationManager);
    id v5 = self->_notificationManager;
    self->_notificationManager = v4;

    notificationManager = self->_notificationManager;
  }
  return notificationManager;
}

- (void)_handleIncomingContinuityCameraConfirmation:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(DDUICoreAgent *)self notificationManager];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke;
  v40[3] = &unk_1E685FB50;
  id v41 = v4;
  id v42 = v5;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_18;
  v37[3] = &unk_1E685FB78;
  id v6 = v41;
  id v38 = v6;
  id v7 = v42;
  id v39 = v7;
  [v6 activateWithErrorHandler:v40 completionHandler:v37];
  int v8 = [v6 incomingMessage];
  int v9 = [v8 objectForKeyedSubscript:@"actionType"];

  if ([v9 unsignedIntValue] == 1)
  {
    id v10 = +[_DDUIRemoteDisplaySessionHandler sharedInstance];
    int v11 = [v10 shouldAutoAcceptCCConfirmation];

    uint64_t v12 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 remoteDevice];
      id v14 = [v13 identifier];
      *(_DWORD *)buf = 138412546;
      v44 = v14;
      __int16 v45 = 1024;
      int v46 = v11;
      _os_log_impl(&dword_1CFC71000, v12, OS_LOG_TYPE_DEFAULT, "Incoming continuity camera confirmation request from: %@, shouldByPassConfirmation: %d", buf, 0x12u);
    }
    if (v11)
    {
      id v15 = +[_DDUIRemoteDisplaySessionHandler sharedInstance];
      v16 = [v6 remoteDevice];
      id v17 = [v16 identifier];
      [v15 enterSessionWithRemoteDeviceID:v17 reason:@"Automatic Accept"];

      v18 = [[DDUIPairCompleteMessage alloc] initWithNotificationResult:1];
      [v6 pairWithMessage:v18];
    }
    else
    {
      v29 = [v6 sessionID];
      v30 = [v6 remoteDevice];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_23;
      v35[3] = &unk_1E685FC18;
      v36 = (DDUIPairCompleteMessage *)v6;
      [v7 handleContinuityCameraConfirmationWithID:v29 fromDevice:v30 completionHandler:v35];

      v18 = v36;
    }
  }
  else if ([v9 unsignedIntValue] == 3)
  {
    v18 = +[_DDUIRemoteDisplaySessionHandler sharedInstance];
    id v19 = [v6 remoteDevice];
    uint64_t v20 = [v19 identifier];
    int v21 = [(DDUIPairCompleteMessage *)v18 shouldByPassConfirmationForRemoteDeviceID:v20];

    id v22 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v6 remoteDevice];
      id v24 = [v23 identifier];
      *(_DWORD *)buf = 138412546;
      v44 = v24;
      __int16 v45 = 1024;
      int v46 = v21;
      _os_log_impl(&dword_1CFC71000, v22, OS_LOG_TYPE_DEFAULT, "Incoming dedicated continuity camera confirmation request from: %@, shouldByPassConfirmation: %d", buf, 0x12u);
    }
    id v25 = [v6 remoteDevice];
    v26 = v25;
    if (v21)
    {
      v27 = [v25 identifier];
      [(DDUIPairCompleteMessage *)v18 enterSessionWithRemoteDeviceID:v27 reason:@"Automatic Dedicated Accept"];

      v28 = [[DDUIPairCompleteMessage alloc] initWithNotificationResult:1];
      [v6 pairWithMessage:v28];
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_27;
      v32[3] = &unk_1E685FB50;
      v33 = (DDUIPairCompleteMessage *)v6;
      v34 = v18;
      [(DDUIPairCompleteMessage *)v34 presentProxCardForDevice:v26 completion:v32];

      v28 = v33;
    }
  }
  else
  {
    v31 = [v6 sessionID];
    [v7 cancelMessageWithID:v31];

    v18 = +[_DDUIRemoteDisplaySessionHandler sharedInstance];
    [(DDUIPairCompleteMessage *)v18 cancelCurrentProxCard];
  }
}

void __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_cold_1();
  }

  id v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) sessionID];
  [v5 cancelMessageWithID:v6];
}

void __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_18(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "incoming pairingSession, finished pairing {pairingSession: %@, result %d}", (uint8_t *)&v8, 0x12u);
  }

  if (a2 == 1)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) sessionID];
    [v6 cancelMessageWithID:v7];
  }
}

void __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_23(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v4 = +[_DDUIRemoteDisplaySessionHandler sharedInstance];
    [v4 saveDedicatedDeviceInformation:0];
  }
  uint64_t v5 = [[DDUIPairCompleteMessage alloc] initWithNotificationResult:a2];
  [*(id *)(a1 + 32) pairWithMessage:v5];
}

void __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) remoteDevice];
      id v7 = [v6 identifier];
      int v18 = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "Dedicated camera request from: %@, declined prox card setup: %@", (uint8_t *)&v18, 0x16u);
    }
    int v8 = [[DDUIPairCompleteMessage alloc] initWithNotificationResult:7];
    uint64_t v9 = a1 + 32;
  }
  else
  {
    if (v5)
    {
      __int16 v10 = [*(id *)(a1 + 32) remoteDevice];
      int v11 = [v10 identifier];
      int v18 = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "Dedicated camera request from: %@, accepted prox card setup", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    uint64_t v9 = a1 + 32;
    id v14 = [v12 remoteDevice];
    id v15 = [v14 identifier];
    [v13 enterSessionWithRemoteDeviceID:v15 reason:@"Prox Card Dedicated Accept"];

    v16 = *(void **)(v9 + 8);
    id v17 = [*(id *)v9 remoteDevice];
    [v16 saveDedicatedDeviceInformation:v17];

    int v8 = [[DDUIPairCompleteMessage alloc] initWithNotificationResult:1];
  }
  [*(id *)v9 pairWithMessage:v8];
}

- (DDUIEndpointPairingListener)endpointPairingListener
{
  return self->_endpointPairingListener;
}

- (void)setEndpointPairingListener:(id)a3
{
}

- (void)setNotificationManager:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_endpointPairingListener, 0);
}

void __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CFC71000, v0, v1, "incoming pairingSession, failed to pair {pairingSession: %@ error %@}");
}

@end