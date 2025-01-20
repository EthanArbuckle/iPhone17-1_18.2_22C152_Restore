@interface BCSNFCReaderConnection
- (BCSNFCReaderConnection)init;
- (BOOL)_enableNFC;
- (BOOL)_isNFCEnabled;
- (BOOL)_needsRadioEnabledCheck;
- (int64_t)_hardwareSupportState;
- (void)_enableNFC;
- (void)_isNFCEnabled;
- (void)checkHardwareSupportStateWithCompletionHandler:(id)a3;
- (void)checkNFCEnabledWithCompletionHandler:(id)a3;
- (void)disconnect;
- (void)enableNFCWithCompletionHandler:(id)a3;
- (void)startReaderWithDelegate:(id)a3 errorHandler:(id)a4 interruptionHandler:(id)a5;
- (void)stopReaderWithErrorHandler:(id)a3;
@end

@implementation BCSNFCReaderConnection

- (void)checkHardwareSupportStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__BCSNFCReaderConnection_checkHardwareSupportStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_26468AE68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopReaderWithErrorHandler:(id)a3
{
}

uint64_t __73__BCSNFCReaderConnection_checkHardwareSupportStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __73__BCSNFCReaderConnection_checkHardwareSupportStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _hardwareSupportState];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__BCSNFCReaderConnection_checkHardwareSupportStateWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_26468B308;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

- (int64_t)_hardwareSupportState
{
  uint64_t v2 = [getNFHardwareManagerClass_0() sharedHardwareManager];
  id v7 = 0;
  int v3 = [v2 queryHardwareSupport:&v7];
  id v4 = v7;

  int64_t v5 = 0;
  if (!v4)
  {
    if ((v3 - 1) > 2) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = qword_223045460[v3 - 1];
    }
  }

  return v5;
}

- (BCSNFCReaderConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)BCSNFCReaderConnection;
  uint64_t v2 = [(BCSNFCReaderConnection *)&v8 init];
  if (v2)
  {
    int v3 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.BarcodeSupport.BCSNFCReaderConnection", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = v2;
  }

  return v2;
}

- (void)checkNFCEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__BCSNFCReaderConnection_checkNFCEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_26468AE68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__BCSNFCReaderConnection_checkNFCEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _isNFCEnabled];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__BCSNFCReaderConnection_checkNFCEnabledWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_26468B2E0;
  id v4 = *(id *)(a1 + 40);
  char v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __63__BCSNFCReaderConnection_checkNFCEnabledWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_isNFCEnabled
{
  if (![(BCSNFCReaderConnection *)self _needsRadioEnabledCheck]) {
    return 1;
  }
  char v8 = 0;
  char v2 = [getNFHardwareManagerClass_0() sharedHardwareManager];
  int v3 = [v2 getRadioEnabledSetting:&v8];

  if (v3)
  {
    if (readerConnectionLog_onceToken != -1) {
      dispatch_once(&readerConnectionLog_onceToken, &__block_literal_global_54);
    }
    id v4 = (void *)readerConnectionLog_log;
    if (os_log_type_enabled((os_log_t)readerConnectionLog_log, OS_LOG_TYPE_ERROR)) {
      [(BCSNFCReaderConnection *)v4 _isNFCEnabled];
    }
  }
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v8 == 0;
  }
  BOOL v6 = !v5;

  return v6;
}

- (BOOL)_needsRadioEnabledCheck
{
  if (_needsRadioEnabledCheck_onceToken != -1) {
    dispatch_once(&_needsRadioEnabledCheck_onceToken, &__block_literal_global_1);
  }
  return _needsRadioEnabledCheck_deviceRegionIsChina;
}

void __49__BCSNFCReaderConnection__needsRadioEnabledCheck__block_invoke()
{
  CFStringRef v0 = (const __CFString *)MGGetStringAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    _needsRadioEnabledCheck_deviceRegionIsChina = CFEqual(v0, @"CH");
    CFRelease(v1);
  }
}

- (void)enableNFCWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__BCSNFCReaderConnection_enableNFCWithCompletionHandler___block_invoke;
  v7[3] = &unk_26468AE68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__BCSNFCReaderConnection_enableNFCWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _enableNFC];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__BCSNFCReaderConnection_enableNFCWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_26468B2E0;
  id v4 = *(id *)(a1 + 40);
  char v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __57__BCSNFCReaderConnection_enableNFCWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_enableNFC
{
  char v2 = [getNFHardwareManagerClass_0() sharedHardwareManager];
  int v3 = [v2 setRadioEnabledSetting:1];

  if (v3)
  {
    if (readerConnectionLog_onceToken != -1) {
      dispatch_once(&readerConnectionLog_onceToken, &__block_literal_global_54);
    }
    id v4 = (void *)readerConnectionLog_log;
    if (os_log_type_enabled((os_log_t)readerConnectionLog_log, OS_LOG_TYPE_ERROR)) {
      [(BCSNFCReaderConnection *)v4 _enableNFC];
    }
  }

  return v3 == 0;
}

- (void)startReaderWithDelegate:(id)a3 errorHandler:(id)a4 interruptionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_notificationServiceConnection)
  {
    if (readerConnectionLog_onceToken != -1) {
      dispatch_once(&readerConnectionLog_onceToken, &__block_literal_global_54);
    }
    v11 = readerConnectionLog_log;
    if (os_log_type_enabled((os_log_t)readerConnectionLog_log, OS_LOG_TYPE_ERROR)) {
      -[BCSNFCReaderConnection startReaderWithDelegate:errorHandler:interruptionHandler:](v11);
    }
  }
  v12 = objc_alloc_init(BCSNotificationServiceConnection);
  notificationServiceConnection = self->_notificationServiceConnection;
  self->_notificationServiceConnection = v12;

  [(BCSNotificationServiceConnection *)self->_notificationServiceConnection setInterruptionHandler:v10];
  [(BCSNotificationServiceConnection *)self->_notificationServiceConnection startNFCReaderWithDelegate:v8 errorHandler:v9];
}

- (void)disconnect
{
  self->_notificationServiceConnection = 0;
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationServiceConnection, 0);
}

- (void)_isNFCEnabled
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_1(&dword_223007000, v5, v6, "Get radio enabled error: %@", v7, v8, v9, v10, 2u);
}

- (void)_enableNFC
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_1(&dword_223007000, v5, v6, "Failed to enable radio: %@", v7, v8, v9, v10, 2u);
}

- (void)startReaderWithDelegate:(os_log_t)log errorHandler:interruptionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)CFStringRef v1 = 0;
  _os_log_error_impl(&dword_223007000, log, OS_LOG_TYPE_ERROR, "Notification service connection is non-nil when starting reader", v1, 2u);
}

@end