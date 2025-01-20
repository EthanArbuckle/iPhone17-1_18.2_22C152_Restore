@interface WFPersonalHotspotSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (NETRBClient)client;
- (WFPersonalHotspotSettingsClient)initWithClient:(NETRBClient *)a3;
- (void)dealloc;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setClient:(NETRBClient *)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFPersonalHotspotSettingsClient

- (void)setClient:(NETRBClient *)a3
{
  self->_client = a3;
}

- (NETRBClient)client
{
  return self->_client;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void *))a4;
  if (v4) {
    uint64_t v7 = 1023;
  }
  else {
    uint64_t v7 = 1022;
  }
  v8 = [(WFPersonalHotspotSettingsClient *)self client];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v9 = (unsigned int (*)(NETRBClient *, uint64_t))get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr;
  v20 = get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr;
  if (!get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_NETRBClientSetGlobalServiceStateSymbolLoc_block_invoke;
    v22 = &unk_264E5EC88;
    v23 = &v17;
    v10 = NetrbLibrary();
    v11 = dlsym(v10, "_NETRBClientSetGlobalServiceState");
    *(void *)(v23[1] + 24) = v11;
    get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr = *(_UNKNOWN **)(v23[1] + 24);
    v9 = (unsigned int (*)(NETRBClient *, uint64_t))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v9)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool soft_NETRBClientSetGlobalServiceState(NETRBClientRef, netrbState)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"WFPersonalHotspotSettingsClient.m", 23, @"%s", dlerror());

    __break(1u);
  }
  if (!v9(v8, v7)) {
    goto LABEL_18;
  }
  v12 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[WFPersonalHotspotSettingsClient setState:completionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_INFO, "%s Setting Personal Hotspot state to %d", buf, 0x12u);
  }

  if (!WiFiManagerClientCreate()) {
    goto LABEL_18;
  }
  WiFiManagerClientSetMISDiscoveryState();
  if ((((WiFiManagerClientGetMISDiscoveryState() == 0) ^ v4) & 1) == 0)
  {
    v14 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFPersonalHotspotSettingsClient setState:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      _os_log_impl(&dword_23C364000, v14, OS_LOG_TYPE_ERROR, "%s Failed to set hotspot status with error %@", buf, 0x16u);
    }

LABEL_18:
    v13 = WFSettingsClientError();
    goto LABEL_19;
  }
  v13 = 0;
LABEL_19:
  v6[2](v6, v13);
}

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, BOOL, void))a3;
  int v12 = 0;
  int v13 = 1020;
  v5 = [(WFPersonalHotspotSettingsClient *)self client];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v6 = (void (*)(NETRBClient *, int *, int *))get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr;
  uint64_t v17 = get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr;
  if (!get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_NETRBClientGetGlobalServiceStateSymbolLoc_block_invoke;
    uint64_t v19 = &unk_264E5EC88;
    v20 = &v14;
    uint64_t v7 = NetrbLibrary();
    v8 = dlsym(v7, "_NETRBClientGetGlobalServiceState");
    *(void *)(v20[1] + 24) = v8;
    get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr = *(_UNKNOWN **)(v20[1] + 24);
    v6 = (void (*)(NETRBClient *, int *, int *))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    v11 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool soft_NETRBClientGetGlobalServiceState(NETRBClientRef, netrbStateRef, netrbReasonRef)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"WFPersonalHotspotSettingsClient.m", 22, @"%s", dlerror());

    __break(1u);
  }
  v6(v5, &v13, &v12);
  v9 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[WFPersonalHotspotSettingsClient getStateWithCompletionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
    _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s Retrieved Personal Hotspot state: %d", buf, 0x12u);
  }

  v4[2](v4, v13 == 1023, 0);
}

- (void)dealloc
{
  v3 = [(WFPersonalHotspotSettingsClient *)self client];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  BOOL v4 = (void (*)(NETRBClient *))get_NETRBClientDestroySymbolLoc_ptr;
  uint64_t v17 = get_NETRBClientDestroySymbolLoc_ptr;
  if (!get_NETRBClientDestroySymbolLoc_ptr)
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __get_NETRBClientDestroySymbolLoc_block_invoke;
    int v12 = &unk_264E5EC88;
    int v13 = &v14;
    v5 = NetrbLibrary();
    v15[3] = (uint64_t)dlsym(v5, "_NETRBClientDestroy");
    get_NETRBClientDestroySymbolLoc_ptr = *(_UNKNOWN **)(v13[1] + 24);
    BOOL v4 = (void (*)(NETRBClient *))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (v4)
  {
    v4(v3);
    v8.receiver = self;
    v8.super_class = (Class)WFPersonalHotspotSettingsClient;
    [(WFPersonalHotspotSettingsClient *)&v8 dealloc];
  }
  else
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"_Bool soft_NETRBClientDestroy(NETRBClientRef)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"WFPersonalHotspotSettingsClient.m", 21, @"%s", dlerror());

    __break(1u);
  }
}

- (WFPersonalHotspotSettingsClient)initWithClient:(NETRBClient *)a3
{
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFPersonalHotspotSettingsClient.m", 70, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)WFPersonalHotspotSettingsClient;
  v5 = [(WFPersonalHotspotSettingsClient *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_client = a3;
    uint64_t v7 = v5;
  }

  return v6;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void))a3;
  v5 = [MEMORY[0x263F85258] currentDevice];
  char v6 = [v5 hasCapability:*MEMORY[0x263F85670]];

  if ((v6 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v7 = get_NETRBClientCreateSymbolLoc_ptr;
  uint64_t v16 = get_NETRBClientCreateSymbolLoc_ptr;
  if (!get_NETRBClientCreateSymbolLoc_ptr)
  {
    objc_super v8 = NetrbLibrary();
    v14[3] = (uint64_t)dlsym(v8, "_NETRBClientCreate");
    get_NETRBClientCreateSymbolLoc_ptr = (_UNKNOWN *)v14[3];
    uint64_t v7 = (void *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (v7)
  {
    uint64_t v9 = ((uint64_t (*)(void, void, void))v7)(0, 0, 0);
    if (v9)
    {
      uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithClient:v9];
      v4[2](v4, v10, 0);
LABEL_8:

      return;
    }
LABEL_7:
    uint64_t v10 = WFSettingsClientError();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v10);
    goto LABEL_8;
  }
  objc_super v11 = [MEMORY[0x263F08690] currentHandler];
  int v12 = objc_msgSend(NSString, "stringWithUTF8String:", "NETRBClientRef soft_NETRBClientCreate(__strong dispatch_queue_t, __strong NETRBEventHandler, __strong xpc_object_t)");
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFPersonalHotspotSettingsClient.m", 20, @"%s", dlerror());

  __break(1u);
}

@end