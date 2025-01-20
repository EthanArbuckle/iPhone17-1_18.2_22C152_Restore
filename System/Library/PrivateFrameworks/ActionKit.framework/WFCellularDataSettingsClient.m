@interface WFCellularDataSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (WFCellularDataSettingsClient)initWithServerConnection:(__CTServerConnection *)a3;
- (__CTServerConnection)connection;
- (void)dealloc;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFCellularDataSettingsClient

- (__CTServerConnection)connection
{
  return self->_connection;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void *))a4;
  connection = self->_connection;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v8 = (uint64_t (*)(__CTServerConnection *, BOOL))get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr;
  v19 = get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr;
  if (!get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_block_invoke;
    v21 = &unk_264E5EC88;
    v22 = &v16;
    v9 = CoreTelephonyLibrary_48700();
    v10 = dlsym(v9, "_CTServerConnectionSetCellularDataIsEnabled");
    *(void *)(v22[1] + 24) = v10;
    get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr = *(_UNKNOWN **)(v22[1] + 24);
    v8 = (uint64_t (*)(__CTServerConnection *, BOOL))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "CTError WF_CTServerConnectionSetCellularDataIsEnabled(CTServerConnectionRef, Boolean)");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFCellularDataSettingsClient.m", 21, @"%s", dlerror());

    __break(1u);
  }
  uint64_t v11 = v8(connection, v4);
  v12 = WFNSErrorFromCTError(v11);
  if (v12)
  {
    v6[2](v6, v12);
  }
  else
  {
    v13 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFCellularDataSettingsClient setState:completionHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_23C364000, v13, OS_LOG_TYPE_INFO, "%s Set Cellular Data state to %d", buf, 0x12u);
    }

    v6[2](v6, 0);
  }
}

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void, void *))a3;
  unsigned __int8 v15 = 0;
  connection = self->_connection;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v6 = (uint64_t (*)(__CTServerConnection *, unsigned __int8 *))get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr;
  v19 = get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr;
  if (!get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_block_invoke;
    v21 = &unk_264E5EC88;
    v22 = &v16;
    v7 = CoreTelephonyLibrary_48700();
    v8 = dlsym(v7, "_CTServerConnectionGetCellularDataIsEnabled");
    *(void *)(v22[1] + 24) = v8;
    get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr = *(_UNKNOWN **)(v22[1] + 24);
    v6 = (uint64_t (*)(__CTServerConnection *, unsigned __int8 *))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v6)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "CTError WF_CTServerConnectionGetCellularDataIsEnabled(CTServerConnectionRef, Boolean *)");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"WFCellularDataSettingsClient.m", 20, @"%s", dlerror());

    __break(1u);
  }
  uint64_t v9 = v6(connection, &v15);
  v10 = WFNSErrorFromCTError(v9);
  if (v10)
  {
    v4[2](v4, 0, v10);
  }
  else
  {
    int v11 = v15;
    v12 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFCellularDataSettingsClient getStateWithCompletionHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11 == 1;
      _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_INFO, "%s Retrieved Cellular Data state: %d", buf, 0x12u);
    }

    ((void (**)(id, BOOL, void *))v4)[2](v4, v11 == 1, 0);
  }
}

- (void)dealloc
{
  CFRelease(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)WFCellularDataSettingsClient;
  [(WFCellularDataSettingsClient *)&v3 dealloc];
}

- (WFCellularDataSettingsClient)initWithServerConnection:(__CTServerConnection *)a3
{
  if (!a3)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFCellularDataSettingsClient.m", 55, @"Invalid parameter not satisfying: %@", @"serverConnection" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)WFCellularDataSettingsClient;
  v5 = [(WFCellularDataSettingsClient *)&v10 init];
  if (v5)
  {
    v5->_connection = (__CTServerConnection *)CFRetain(a3);
    v6 = v5;
  }

  return v5;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void))a3;
  v12[0] = 0;
  long long v13 = 0u;
  uint64_t v14 = 0;
  v12[1] = a1;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v5 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr_48742;
  uint64_t v23 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr_48742;
  if (!get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr_48742)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __get_CTServerConnectionCreateWithIdentifierSymbolLoc_block_invoke_48743;
    uint64_t v18 = &unk_264E5EC88;
    v19 = &v20;
    v6 = CoreTelephonyLibrary_48700();
    v21[3] = (uint64_t)dlsym(v6, "_CTServerConnectionCreateWithIdentifier");
    get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr_48742 = *(_UNKNOWN **)(v19[1] + 24);
    v5 = (void *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (v5)
  {
    uint64_t v7 = ((uint64_t (*)(void, __CFString *, uint64_t (*)(), void *))v5)(*MEMORY[0x263EFFB08], @"com.apple.shortcuts", WFCoreTelephonyConnectionCallbackStub_48745, v12);
    if (v7)
    {
      v8 = (const void *)v7;
      uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithServerConnection:v7];
      CFRelease(v8);
      v4[2](v4, v9, 0);
    }
    else
    {
      uint64_t v9 = WFSettingsClientError();
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v9);
    }
  }
  else
  {
    objc_super v10 = [MEMORY[0x263F08690] currentHandler];
    int v11 = objc_msgSend(NSString, "stringWithUTF8String:", "CTServerConnectionRef WF_CTServerConnectionCreateWithIdentifier(CFAllocatorRef, CFStringRef, CTServerConnectionCallback, _CTServerConnectionContext *)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"WFCellularDataSettingsClient.m", 19, @"%s", dlerror());

    __break(1u);
  }
}

@end