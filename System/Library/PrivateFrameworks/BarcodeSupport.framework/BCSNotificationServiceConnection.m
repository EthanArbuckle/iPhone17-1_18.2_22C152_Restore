@interface BCSNotificationServiceConnection
- (NSXPCConnection)serviceConnection;
- (id)interruptionHandler;
- (void)cancelNotificationsForCodeType:(int64_t)a3;
- (void)dealloc;
- (void)didReceiveNotificationResponse:(id)a3;
- (void)notifyParsedCodeWithData:(id)a3 codePayload:(id)a4 shouldReplacePreviousNotifications:(BOOL)a5 withReply:(id)a6;
- (void)setInterruptionHandler:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)startNFCReaderWithDelegate:(id)a3 errorHandler:(id)a4;
- (void)stopNFCReaderWithErrorHandler:(id)a3;
@end

@implementation BCSNotificationServiceConnection

- (void)notifyParsedCodeWithData:(id)a3 codePayload:(id)a4 shouldReplacePreviousNotifications:(BOOL)a5 withReply:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(BCSNotificationServiceConnection *)self serviceConnection];
  v13 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_5];
  [v13 notifyParsedCodeWithData:v12 codePayload:v11 shouldReplacePreviousNotifications:v6 reply:v10];
}

void __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(a2);
  }
}

- (void)cancelNotificationsForCodeType:(int64_t)a3
{
  id v5 = [(BCSNotificationServiceConnection *)self serviceConnection];
  v4 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_3];
  [v4 cancelNotificationsForCodeType:a3];
}

void __67__BCSNotificationServiceConnection_cancelNotificationsForCodeType___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(a2);
  }
}

- (void)didReceiveNotificationResponse:(id)a3
{
  id v4 = a3;
  id v6 = [(BCSNotificationServiceConnection *)self serviceConnection];
  id v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_5];
  [v5 didReceiveNotificationResponse:v4];
}

void __67__BCSNotificationServiceConnection_didReceiveNotificationResponse___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(a2);
  }
}

- (void)startNFCReaderWithDelegate:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(BCSNotificationServiceConnection *)self serviceConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__BCSNotificationServiceConnection_startNFCReaderWithDelegate_errorHandler___block_invoke;
  v11[3] = &unk_26468B388;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 startNFCReaderWithDelegate:v7];
}

void __76__BCSNotificationServiceConnection_startNFCReaderWithDelegate_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(v3);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (void)stopNFCReaderWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(BCSNotificationServiceConnection *)self serviceConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__BCSNotificationServiceConnection_stopNFCReaderWithErrorHandler___block_invoke;
  v8[3] = &unk_26468B388;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 stopNFCReader];
}

void __66__BCSNotificationServiceConnection_stopNFCReaderWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(v3);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_serviceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BCSNotificationServiceConnection;
  [(BCSNotificationServiceConnection *)&v3 dealloc];
}

- (void)setInterruptionHandler:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x223CAD0D0]();
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = v4;

  [(NSXPCConnection *)self->_serviceConnection setInterruptionHandler:v6];
}

- (NSXPCConnection)serviceConnection
{
  serviceConnection = self->_serviceConnection;
  if (serviceConnection)
  {
    objc_super v3 = serviceConnection;
  }
  else
  {
    id v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.BarcodeSupport.BarcodeNotificationService" options:4096];
    id v6 = self->_serviceConnection;
    self->_serviceConnection = v5;

    id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D616098];
    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D61CBF0];
    [v7 setInterface:v8 forSelector:sel_startNFCReaderWithDelegate_ argumentIndex:0 ofReply:0];

    [(NSXPCConnection *)self->_serviceConnection setRemoteObjectInterface:v7];
    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __53__BCSNotificationServiceConnection_serviceConnection__block_invoke;
    v13 = &unk_26468B110;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)self->_serviceConnection setInvalidationHandler:&v10];
    -[NSXPCConnection setInterruptionHandler:](self->_serviceConnection, "setInterruptionHandler:", self->_interruptionHandler, v10, v11, v12, v13);
    [(NSXPCConnection *)self->_serviceConnection resume];
    objc_super v3 = self->_serviceConnection;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __53__BCSNotificationServiceConnection_serviceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setServiceConnection:0];
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
}

void __118__BCSNotificationServiceConnection_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_withReply___block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "Cannot connect to remote service with error: %{public}@", v3, v4, v5, v6, v7);
}

@end