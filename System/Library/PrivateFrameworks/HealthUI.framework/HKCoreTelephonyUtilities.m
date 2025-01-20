@interface HKCoreTelephonyUtilities
- (BOOL)isEmergencyServicePhoneNumber:(id)a3;
- (HKCoreTelephonyUtilities)init;
- (OS_dispatch_queue)ctServerQueue;
- (__CTServerConnection)ctServerConnection;
- (void)ctServerConnection;
- (void)dealloc;
- (void)setCtServerQueue:(id)a3;
@end

@implementation HKCoreTelephonyUtilities

- (HKCoreTelephonyUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKCoreTelephonyUtilities;
  v2 = [(HKCoreTelephonyUtilities *)&v6 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    ctServerQueue = v2->_ctServerQueue;
    v2->_ctServerQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection) {
    CFRelease(ctServerConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)HKCoreTelephonyUtilities;
  [(HKCoreTelephonyUtilities *)&v4 dealloc];
}

- (BOOL)isEmergencyServicePhoneNumber:(id)a3
{
  id v4 = a3;
  char v12 = 0;
  v5 = [(HKCoreTelephonyUtilities *)self ctServerConnection];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  objc_super v6 = (uint64_t (*)(__CTServerConnection *, id, char *))get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr;
  v21 = get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr;
  if (!get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __get_CTServerConnectionIsEmergencyNumberSymbolLoc_block_invoke;
    v16 = &unk_1E6D514F8;
    v17 = &v18;
    v7 = (void *)CoreTelephonyLibrary();
    v19[3] = (uint64_t)dlsym(v7, "_CTServerConnectionIsEmergencyNumber");
    get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
    objc_super v6 = (uint64_t (*)(__CTServerConnection *, id, char *))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v6) {
    -[HKCoreTelephonyUtilities isEmergencyServicePhoneNumber:]();
  }
  uint64_t v8 = v6(v5, v4, &v12);
  if (v8)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      [(HKCoreTelephonyUtilities *)v8 isEmergencyServicePhoneNumber:v9];
    }
  }
  BOOL v10 = v12 != 0;

  return v10;
}

- (__CTServerConnection)ctServerConnection
{
  ctServerConnection = self->_ctServerConnection;
  if (!ctServerConnection)
  {
    uint64_t v11 = 0;
    char v12 = &v11;
    uint64_t v13 = 0x2020000000;
    id v4 = (void (*)(__CFString *))get_CTServerConnectionAddIdentifierExceptionSymbolLoc_ptr;
    uint64_t v14 = get_CTServerConnectionAddIdentifierExceptionSymbolLoc_ptr;
    if (!get_CTServerConnectionAddIdentifierExceptionSymbolLoc_ptr)
    {
      v5 = (void *)CoreTelephonyLibrary();
      v12[3] = (uint64_t)dlsym(v5, "_CTServerConnectionAddIdentifierException");
      get_CTServerConnectionAddIdentifierExceptionSymbolLoc_ptr = (_UNKNOWN *)v12[3];
      id v4 = (void (*)(__CFString *))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v4) {
      -[HKCoreTelephonyUtilities ctServerConnection]();
    }
    v4(@"com.apple.HealthUI.medicalID.ctserver");
    objc_super v6 = self->_ctServerQueue;
    uint64_t v11 = 0;
    char v12 = &v11;
    uint64_t v13 = 0x2020000000;
    v7 = (uint64_t (*)(void, __CFString *, OS_dispatch_queue *, void *))get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr;
    uint64_t v14 = get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr;
    if (!get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr)
    {
      uint64_t v8 = (void *)CoreTelephonyLibrary();
      v12[3] = (uint64_t)dlsym(v8, "_CTServerConnectionCreateOnTargetQueue");
      get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr = (_UNKNOWN *)v12[3];
      v7 = (uint64_t (*)(void, __CFString *, OS_dispatch_queue *, void *))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v7) {
      -[HKCoreTelephonyUtilities ctServerConnection]();
    }
    ctServerConnection = (__CTServerConnection *)v7(*MEMORY[0x1E4F1CF80], @"com.apple.HealthUI.medicalID.ctserver", v6, &__block_literal_global_37);

    self->_ctServerConnection = ctServerConnection;
    if (!ctServerConnection)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
        -[HKCoreTelephonyUtilities ctServerConnection](v9);
      }
      return self->_ctServerConnection;
    }
  }
  return ctServerConnection;
}

void __46__HKCoreTelephonyUtilities_ctServerConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
    __46__HKCoreTelephonyUtilities_ctServerConnection__block_invoke_cold_1(a2, a3, v5);
  }
}

- (OS_dispatch_queue)ctServerQueue
{
  return self->_ctServerQueue;
}

- (void)setCtServerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)isEmergencyServicePhoneNumber:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CTError HKCTServerConnectionIsEmergencyNumber(CTServerConnectionRef, CFStringRef, Boolean *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKCoreTelephonyUtilities.m", 17, @"%s", dlerror());

  __break(1u);
}

- (void)isEmergencyServicePhoneNumber:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  id v4 = "-[HKCoreTelephonyUtilities isEmergencyServicePhoneNumber:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "%s - error from _CTServerConnectionIsEmergencyNumber; domain:%d, error:%d",
    (uint8_t *)&v3,
    0x18u);
}

- (void)ctServerConnection
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[HKCoreTelephonyUtilities ctServerConnection]";
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "%s - unable to create sCTServerConnectionRef", (uint8_t *)&v1, 0xCu);
}

void __46__HKCoreTelephonyUtilities_ctServerConnection__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  id v4 = "-[HKCoreTelephonyUtilities ctServerConnection]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "%s notification:%@ info:%@", (uint8_t *)&v3, 0x20u);
}

@end