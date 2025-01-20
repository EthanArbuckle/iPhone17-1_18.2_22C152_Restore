@interface AXRemoteReceiver
- (AXRemoteReceiver)initWithEventID:(id)a3 delegate:(id)a4;
- (AXRemoteReceiverDelegate)delegate;
- (RPCompanionLinkClient)companionLinkClient;
- (void)setCompanionLinkClient:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AXRemoteReceiver

- (AXRemoteReceiver)initWithEventID:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)AXRemoteReceiver;
  v8 = [(AXRemoteReceiver *)&v32 init];
  v9 = v8;
  if (v8)
  {
    [(AXRemoteReceiver *)v8 setDelegate:v7];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AXRemoteServices.ReceiverQueue", v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_initWeak(&location, v9);
    id v14 = objc_alloc_init(MEMORY[0x263F62B70]);
    [(AXRemoteReceiver *)v9 setCompanionLinkClient:v14];

    v15 = [(AXRemoteReceiver *)v9 companionLinkClient];
    [v15 setAppID:@"com.apple.AXRemoteServices.Receiver"];

    v16 = v9->_queue;
    v17 = [(AXRemoteReceiver *)v9 companionLinkClient];
    [v17 setDispatchQueue:v16];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke;
    v29[3] = &unk_2646E8540;
    objc_copyWeak(&v30, &location);
    v18 = [(AXRemoteReceiver *)v9 companionLinkClient];
    [v18 setDisconnectHandler:v29];

    v19 = [(AXRemoteReceiver *)v9 companionLinkClient];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_3;
    v27[3] = &unk_2646E87D8;
    objc_copyWeak(&v28, &location);
    [v19 activateWithCompletion:v27];

    v20 = [(AXRemoteReceiver *)v9 companionLinkClient];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_5;
    v25[3] = &unk_2646E8800;
    objc_copyWeak(&v26, &location);
    [v20 registerEventID:v6 options:0 handler:v25];

    v21 = [(AXRemoteReceiver *)v9 companionLinkClient];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_7;
    v23[3] = &unk_2646E8828;
    objc_copyWeak(&v24, &location);
    [v21 registerRequestID:@"com.apple.AXRemoteServices.ConnectionSetup" options:0 handler:v23];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke(uint64_t a1)
{
  v2 = ax_remote_connection_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2249E0000, v2, OS_LOG_TYPE_INFO, "link client disconnected", v7, 2u);
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained delegate];
  id v6 = objc_loadWeakRetained(v3);
  [v5 remoteReceiverDidDisconnect:v6];
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = ax_remote_connection_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_2249E0000, v4, OS_LOG_TYPE_INFO, "Activating companion link client with error: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained delegate];
  id v8 = objc_loadWeakRetained(v5);
  [v7 remoteReceiver:v8 didActivateWithError:v3];
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = ax_remote_connection_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_5_cold_1();
  }

  id v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v8);
  id v10 = [WeakRetained delegate];
  id v11 = objc_loadWeakRetained(v8);
  [v10 remoteReceiver:v11 didReceivePayload:v5 withOptions:v6];
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = ax_remote_connection_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_7_cold_1();
  }

  id v11 = [v7 objectForKeyedSubscript:@"isConnecting"];
  uint64_t v12 = [v11 BOOLValue];

  v13 = [v7 objectForKeyedSubscript:@"connectingDeviceName"];
  id v14 = [v7 objectForKeyedSubscript:@"connectingDeviceOptions"];
  v15 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v15);
  v17 = [WeakRetained delegate];
  id v18 = objc_loadWeakRetained(v15);
  v19 = [v17 remoteReceiver:v18 connectingDevice:v13 setupConnection:v12 withOptions:v14];

  (*((void (**)(id, void *, void, void))v9 + 2))(v9, v19, 0, 0);
}

- (AXRemoteReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXRemoteReceiverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2249E0000, v0, v1, "Handling inEvent: %@, inOptions: %@");
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2249E0000, v0, v1, "Handling request: %@, inOptions: %@");
}

@end