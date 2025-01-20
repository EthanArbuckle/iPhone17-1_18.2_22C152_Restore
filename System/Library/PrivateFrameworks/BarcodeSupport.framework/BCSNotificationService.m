@interface BCSNotificationService
- (BCSNotificationService)initWithConnection:(id)a3;
- (void)_cancelNotificationsForCodeType:(int64_t)a3;
- (void)_didReceiveNotificationResponse:(id)a3;
- (void)cancelNotificationsForCodeType:(int64_t)a3;
- (void)didReceiveNotificationResponse:(id)a3;
- (void)notifyParsedCodeWithData:(id)a3 codePayload:(id)a4 shouldReplacePreviousNotifications:(BOOL)a5 reply:(id)a6;
- (void)startNFCReaderWithDelegate:(id)a3;
- (void)stopNFCReader;
@end

@implementation BCSNotificationService

- (BCSNotificationService)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSNotificationService;
  v6 = [(BCSNotificationService *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)notifyParsedCodeWithData:(id)a3 codePayload:(id)a4 shouldReplacePreviousNotifications:(BOOL)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[BCSNotificationService notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:reply:]();
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke;
  v15[3] = &unk_26468B748;
  id v16 = v11;
  id v17 = v12;
  v15[4] = self;
  BOOL v18 = a5;
  id v13 = v11;
  id v14 = v12;
  +[BCSAction getActionWithData:v10 codePayload:v13 completionHandler:v15];
}

void __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2;
  block[3] = &unk_26468B720;
  id v9 = v3;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v12 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  char v13 = *(unsigned char *)(a1 + 56);
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2_cold_2();
    }
    v2 = (void *)MEMORY[0x263F01888];
    id v3 = *(void **)(*(void *)(a1 + 40) + 16);
    if (v3) {
      [v3 auditToken];
    }
    else {
      memset(v14, 0, sizeof(v14));
    }
    id v13 = 0;
    v6 = [v2 bundleProxyWithAuditToken:v14 error:&v13];
    id v5 = v13;
    id v7 = +[BCSAnalyticsLogger sharedLogger];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v6 bundleIdentifier];
    [v7 logBarcodeDetectedEventForAction:v8 fromBundleID:v9];

    uint64_t v10 = [*(id *)(a1 + 48) codeType];
    if (*(unsigned char *)(a1 + 64)) {
      [*(id *)(a1 + 40) _cancelNotificationsForCodeType:v10];
    }
    id v11 = +[BCSNotification notificationForAction:*(void *)(a1 + 32)];
    objc_msgSend(v11, "setRequestingProcessID:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "processIdentifier"));
    id v12 = +[BCSNotificationManager sharedManager];
    [v12 scheduleNotification:v11 codeType:v10];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2_cold_1();
    }
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:4 userInfo:0];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v5, 0);
  }
}

- (void)cancelNotificationsForCodeType:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__BCSNotificationService_cancelNotificationsForCodeType___block_invoke;
  v3[3] = &unk_26468B770;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __57__BCSNotificationService_cancelNotificationsForCodeType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelNotificationsForCodeType:*(void *)(a1 + 40)];
}

- (void)_cancelNotificationsForCodeType:(int64_t)a3
{
  uint64_t v4 = [(NSXPCConnection *)self->_connection processIdentifier];
  id v5 = +[BCSNotificationManager sharedManager];
  [v5 withdrawNotificationsWithProcessID:v4 codeType:a3];
}

- (void)didReceiveNotificationResponse:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__BCSNotificationService_didReceiveNotificationResponse___block_invoke;
  v6[3] = &unk_26468B498;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __57__BCSNotificationService_didReceiveNotificationResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveNotificationResponse:*(void *)(a1 + 40)];
}

- (void)_didReceiveNotificationResponse:(id)a3
{
  id v3 = a3;
  id v4 = +[BCSNotificationManager sharedManager];
  [v4 didReceiveNotificationResponse:v3];
}

- (void)startNFCReaderWithDelegate:(id)a3
{
  nfcReader = self->_nfcReader;
  if (!nfcReader)
  {
    id v5 = a3;
    v6 = [[BCSNFCReader alloc] initWithDelegate:v5];

    id v7 = self->_nfcReader;
    self->_nfcReader = v6;

    [(BCSNFCReader *)self->_nfcReader setNotificationService:self];
    nfcReader = self->_nfcReader;
  }
  [(BCSNFCReader *)nfcReader startReading];
}

- (void)stopNFCReader
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nfcReader, 0);
}

- (void)notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:reply:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BarcodeNotificationService: Received parsed barcode data.", v0, 2u);
}

void __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNotificationService: Detected QR code is not actionable", v0, 2u);
}

void __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 138412290;
  uint64_t v1 = objc_opt_class();
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSNotificationService: Detected QR code has resolved to action of class %@", (uint8_t *)&v0, 0xCu);
}

@end