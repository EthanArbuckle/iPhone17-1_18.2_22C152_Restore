@interface DASession
+ (BOOL)networkingAllowedWithUUID:(id)a3 error:(id *)a4;
+ (BOOL)processAllowedWithAuditToken:(id *)a3 error:(id *)a4;
+ (BOOL)setDeviceAppAccessInfo:(id)a3 device:(id)a4 session:(id)a5 error:(id *)a6;
+ (BOOL)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 error:(id *)a5;
+ (BOOL)setPartialIPsWithAuditToken:(id *)a3 partialIPs:(id)a4 error:(id *)a5;
+ (BOOL)setState:(int64_t)a3 device:(id)a4 session:(id)a5 error:(id *)a6;
+ (BOOL)setState:(int64_t)a3 device:(id)a4 session:(id)a5 simulateApp:(BOOL)a6 error:(id *)a7;
+ (id)diagnosticShow:(id)a3 endpoint:(id)a4 error:(id *)a5;
+ (id)diagnosticShow:(id)a3 error:(id *)a4;
+ (id)getDevicesWithFlags:(unint64_t)a3 session:(id)a4 error:(id *)a5;
+ (id)getPartialIPsWithAppBundleID:(id)a3 error:(id *)a4;
+ (id)getPartialIPsWithAuditToken:(id *)a3 error:(id *)a4;
- (BOOL)appIsUsingDeviceAccess;
- (DAAppContext)appContext;
- (DASession)init;
- (DASession)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)availableDevices;
- (NSString)bundleID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcCnx;
- (OS_xpc_object)xpcListenerEndpoint;
- (id)_ensureXPCStarted;
- (id)bluetoothAccessInfoAndReturnError:(id *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)eventHandler;
- (unint64_t)deviceFlags;
- (unsigned)clientID;
- (void)_activateStart:(BOOL)a3;
- (void)_activateXPCCompleted:(id)a3;
- (void)_getAuthorizedDevicesCompleted:(id)a3 completionHandler:(id)a4;
- (void)_getBluetoothAccessInfoCompleted:(id)a3 completionHandler:(id)a4;
- (void)_getDevicesCompleted:(id)a3 completionHandler:(id)a4;
- (void)_getPartialIPsCompleted:(id)a3 completionHandler:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_reportEvent:(id)a3;
- (void)_reportEventType:(int64_t)a3;
- (void)_xpcListenerEvent:(id)a3;
- (void)_xpcReceivedDAEvent:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)activate;
- (void)diagnosticShow:(id)a3 completionHandler:(id)a4;
- (void)encodeWithXPCObject:(id)a3;
- (void)getAuthorizedDevices:(id)a3;
- (void)getBluetoothAccessInfoWithCompletionHandler:(id)a3;
- (void)getDevicesWithFlags:(unint64_t)a3 completionHandler:(id)a4;
- (void)getPartialIPsWithAppBundleID:(id)a3 completionHandler:(id)a4;
- (void)getPartialIPsWithAuditToken:(id *)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)modifyDeviceWithIdentifier:(id)a3 settings:(id)a4 completionHandler:(id)a5;
- (void)removeDeviceAccess:(id)a3 completionHandler:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDeviceAppAccessInfo:(id)a3 device:(id)a4 completionHandler:(id)a5;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 completionHandler:(id)a5;
- (void)setPartialIPsWithAuditToken:(id *)a3 partialIPs:(id)a4 completionHandler:(id)a5;
- (void)setState:(int64_t)a3 device:(id)a4 completionHandler:(id)a5;
- (void)setState:(int64_t)a3 device:(id)a4 simulateApp:(BOOL)a5 completionHandler:(id)a6;
- (void)setXpcCnx:(id)a3;
- (void)setXpcListenerEndpoint:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation DASession

- (DASession)init
{
  v7.receiver = self;
  v7.super_class = (Class)DASession;
  v2 = [(DASession *)&v7 init];
  if (v2)
  {
    v2->_clientID = CUXPCGetNextClientID();
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    deviceMap = v2->_deviceMap;
    v2->_deviceMap = (NSMutableDictionary *)v3;

    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v5 = v2;
  }

  return v2;
}

- (DASession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(DASession *)self init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v24 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, v24);
LABEL_13:
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (MEMORY[0x223C529E0](v6) != MEMORY[0x263EF8708])
  {
    if (!a4) {
      goto LABEL_14;
    }
    DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
    goto LABEL_13;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_14;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 != 6)
  {
    if (v14 != 5) {
      goto LABEL_7;
    }
LABEL_14:
    v15 = 0;
    goto LABEL_8;
  }
  v7->_clientID = 0;
LABEL_7:
  v15 = v7;
LABEL_8:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  v4 = [(NSString *)self->_bundleID UTF8String];
  if (v4) {
    xpc_dictionary_set_string(xdict, "bndI", v4);
  }
  uint64_t clientID = self->_clientID;
  if (clientID) {
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  }
}

- (id)description
{
  return [(DASession *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    id v4 = 0;
  }
  CUAppendF();
  v5 = (__CFString *)v4;

  bundleID = self->_bundleID;
  if (bundleID)
  {
    uint64_t v11 = bundleID;
    CUAppendF();
    objc_super v7 = v5;

    v5 = v7;
  }
  uint64_t v8 = &stru_26D120818;
  if (v5) {
    uint64_t v8 = v5;
  }
  uint64_t v9 = v8;

  return v9;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __21__DASession_activate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __21__DASession_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    return [*(id *)(result + 32) _activateStart:0];
  }
  return result;
}

- (void)_activateStart:(BOOL)a3
{
  if (a3)
  {
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  [(DASession *)self encodeWithXPCObject:v4];
  xpc_dictionary_set_uint64(v4, "dvFl", self->_deviceFlags);
  xpc_dictionary_set_string(v4, "mTyp", "SesA");
  v5 = [(DASession *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __28__DASession__activateStart___block_invoke;
  handler[3] = &unk_2645205F0;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v5, v4, dispatchQueue, handler);
}

uint64_t __28__DASession__activateStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  id v34 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__DASession__activateXPCCompleted___block_invoke;
  aBlock[3] = &unk_264520618;
  aBlock[4] = self;
  aBlock[5] = &v29;
  v5 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v6 = CUXPCDecodeNSErrorIfNeeded();
  objc_super v7 = (void *)v30[5];
  v30[5] = v6;

  if (!v30[5])
  {
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      int v14 = self;
      LogPrintF();
    }
    uint64_t v8 = xpc_dictionary_get_array(v4, "devs");
    if (!v8) {
      goto LABEL_10;
    }
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__4;
    uint64_t v20 = __Block_byref_object_dispose__4;
    id v21 = 0;
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __35__DASession__activateXPCCompleted___block_invoke_2;
    applier[3] = &unk_264520930;
    applier[4] = &v16;
    applier[5] = &v22;
    xpc_array_apply(v8, applier);
    uint64_t v9 = (void *)v17[5];
    if (v9)
    {
      uint64_t v12 = v30;
      id v13 = v9;
      uint64_t v10 = (DASession *)v12[5];
      v12[5] = (uint64_t)v13;
    }
    else
    {
      uint64_t v10 = self;
      objc_sync_enter(v10);
      objc_storeStrong((id *)&v10->_deviceMap, (id)v23[5]);
      objc_sync_exit(v10);
    }

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);

    if (!v9)
    {
LABEL_10:
      -[DASession _reportEventType:](self, "_reportEventType:", 10, v14);
      if (xpc_dictionary_get_BOOL(v4, "dvPr"))
      {
        uint64_t v11 = [[DAEventDevicesPresent alloc] initWithPresent:1 devicesMigrated:0];
        [(DASession *)self _reportEvent:v11];
      }
      LOBYTE(v22) = 0;
      CUXPCDecodeBool();
      if ((_BYTE)v22
        && gLogCategory_DASession <= 90
        && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  v5[2](v5);

  _Block_object_dispose(&v29, 8);
}

void __35__DASession__activateXPCCompleted___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v3 = CUPrintNSError();
      LogPrintF();
    }
    v2 = *(void **)(a1 + 32);
    id v4 = [[DAEvent alloc] initWithEventType:10 error:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v2 _reportEvent:v4];
  }
}

BOOL __35__DASession__activateXPCCompleted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [DADevice alloc];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  objc_super v7 = [(DADevice *)v5 initWithXPCObject:v4 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    int v14 = [(DADevice *)v7 identifier];
    BOOL v15 = v14 != 0;
    if (v14)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v7 forKeyedSubscript:v14];
    }
    else
    {
      uint64_t v17 = DAErrorF(350001, (uint64_t)"No device ID", v8, v9, v10, v11, v12, v13, v20);
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (DAAppContext)appContext
{
  p_appContext = &self->_appContext;
  id v4 = self->_appContext;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v6 = self->_xpcListener;
    if (!v6)
    {
      uint64_t v6 = xpc_connection_create(0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_xpcListener, v6);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __23__DASession_appContext__block_invoke;
      handler[3] = &unk_2645205F0;
      handler[4] = self;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_activate(v6);
    }
    xpcEndpoint = self->_xpcEndpoint;
    p_xpcEndpoint = &self->_xpcEndpoint;
    xpc_endpoint_t v9 = xpcEndpoint;
    if (!v9)
    {
      xpc_endpoint_t v9 = xpc_endpoint_create(v6);
      objc_storeStrong((id *)p_xpcEndpoint, v9);
    }
    uint64_t v10 = objc_alloc_init(DAAppContext);
    [(DAAppContext *)v10 setXpcEndpoint:v9];
    objc_storeStrong((id *)p_appContext, v10);
    v5 = v10;
  }

  return v5;
}

uint64_t __23__DASession_appContext__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcListenerEvent:a2];
}

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  id v4 = self->_xpcCnx;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    uint64_t v6 = self->_xpcListenerEndpoint;
    objc_super v7 = v6;
    if (v6)
    {
      mach_service = xpc_connection_create_from_endpoint(v6);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", (dispatch_queue_t)self->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __30__DASession__ensureXPCStarted__block_invoke;
    handler[3] = &unk_2645205F0;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
    v5 = mach_service;
  }

  return v5;
}

uint64_t __30__DASession__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcReceivedMessage:a2];
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v3 = self;
      LogPrintF();
    }
    -[DASession _reportEventType:](self, "_reportEventType:", 60, v3);
    [(DASession *)self _activateStart:1];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__DASession_invalidate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __23__DASession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    *(unsigned char *)(v1 + 32) = 1;
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      LogPrintF();
    }
    uint64_t v3 = (_xpc_connection_s *)*(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v6 = v3;
    if (v3) {
      xpc_connection_cancel(v3);
    }
    id v4 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 48);
    if (v4) {
      xpc_connection_cancel(v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidated", v5);
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx && !self->_xpcListener)
  {
    [(DASession *)self _reportEventType:20];
    id eventHandler = self->_eventHandler;
    self->_id eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (NSArray)availableDevices
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_deviceMap;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(NSMutableDictionary *)v3 allValues];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA68];
  }

  objc_sync_exit(v2);

  return (NSArray *)v5;
}

- (void)removeDeviceAccess:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__DASession_removeDeviceAccess_completionHandler___block_invoke;
  block[3] = &unk_2645206E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __50__DASession_removeDeviceAccess_completionHandler___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "RvAi");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  uint64_t v3 = [a1[4] _ensureXPCStarted];
  id v4 = *((void *)a1[4] + 10);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__DASession_removeDeviceAccess_completionHandler___block_invoke_2;
  v5[3] = &unk_264520668;
  id v6 = a1[5];
  id v7 = a1[6];
  xpc_connection_send_message_with_reply(v3, v2, v4, v5);
}

void __50__DASession_removeDeviceAccess_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  id v5 = (id)v2;
  if (gLogCategory_DASession <= 30)
  {
    if (gLogCategory_DASession != -1 || (int v3 = _LogCategory_Initialize(), v2 = (uint64_t)v5, v3))
    {
      id v4 = CUPrintNSError();
      LogPrintF();

      uint64_t v2 = (uint64_t)v5;
    }
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2);
}

- (void)setDeviceAppAccessInfo:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__DASession_setDeviceAppAccessInfo_device_completionHandler___block_invoke;
  v15[3] = &unk_264520758;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

void __61__DASession_setDeviceAppAccessInfo_device_completionHandler___block_invoke(id *a1)
{
  if (([a1[4] flags] & 8) != 0)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "mTyp", "SAAi");
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    id v9 = [a1[5] _ensureXPCStarted];
    id v10 = *((void *)a1[5] + 10);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __61__DASession_setDeviceAppAccessInfo_device_completionHandler___block_invoke_2;
    handler[3] = &unk_264520668;
    id v15 = a1[6];
    id v16 = a1[7];
    xpc_connection_send_message_with_reply(v9, v8, v10, handler);
  }
  else
  {
    uint64_t v11 = (void (**)(id, id))a1[7];
    DAErrorF(350001, (uint64_t)"Device missing accessory setup flag", v2, v3, v4, v5, v6, v7, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v13);
  }
}

void __61__DASession_setDeviceAppAccessInfo_device_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  id v5 = (id)v2;
  if (gLogCategory_DASession <= 30)
  {
    if (gLogCategory_DASession != -1 || (int v3 = _LogCategory_Initialize(), v2 = (uint64_t)v5, v3))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF();

      uint64_t v2 = (uint64_t)v5;
    }
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2);
}

- (void)getAuthorizedDevices:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__DASession_getAuthorizedDevices___block_invoke;
  v7[3] = &unk_264520508;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __34__DASession_getAuthorizedDevices___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "GADv");
  CUXPCEncodeObject();
  int v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__DASession_getAuthorizedDevices___block_invoke_2;
  v6[3] = &unk_264520668;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

uint64_t __34__DASession_getAuthorizedDevices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getAuthorizedDevicesCompleted:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)_getAuthorizedDevicesCompleted:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__4;
  id v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__DASession__getAuthorizedDevicesCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_264520690;
  id v14 = &v15;
  id v7 = v6;
  id v13 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  id v10 = (void *)v16[5];
  v16[5] = v9;

  if (!v16[5])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = CUPrintNSObjectOneLine();
      LogPrintF();
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  v8[2](v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __62__DASession__getAuthorizedDevicesCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF();
    }
    int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

- (void)getDevicesWithFlags:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DASession_getDevicesWithFlags_completionHandler___block_invoke;
  block[3] = &unk_264520958;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __51__DASession_getDevicesWithFlags_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "GDvs");
  xpc_dictionary_set_uint64(v2, "dvFl", *(void *)(a1 + 48));
  CUXPCEncodeObject();
  int v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__DASession_getDevicesWithFlags_completionHandler___block_invoke_2;
  v6[3] = &unk_264520668;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

uint64_t __51__DASession_getDevicesWithFlags_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getDevicesCompleted:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)_getDevicesCompleted:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__4;
  id v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__DASession__getDevicesCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_264520690;
  id v14 = &v15;
  id v7 = v6;
  id v13 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  id v10 = (void *)v16[5];
  v16[5] = v9;

  if (!v16[5])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      unint64_t v11 = CUPrintNSObjectOneLine();
      LogPrintF();
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  v8[2](v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __52__DASession__getDevicesCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF();
    }
    int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

+ (id)getDevicesWithFlags:(unint64_t)a3 session:(id)a4 error:(id *)a5
{
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "mTyp", "GDvs");
  xpc_dictionary_set_uint64(v8, "dvFl", a3);
  CUXPCEncodeObject();

  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v10 = dispatch_queue_create("DASession-GetInfo", v9);

  mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v10, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_1);
  xpc_connection_activate(mach_service);
  xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(mach_service, v8);
  xpc_connection_cancel(mach_service);
  if (v12)
  {
    id v19 = CUXPCDecodeNSErrorIfNeeded();
    id v20 = v19;
    if (v19)
    {
      *a5 = v19;
      id v21 = (id)MEMORY[0x263EFFA68];
    }
    else
    {
      objc_opt_class();
      CUXPCDecodeNSArrayOfClass();
      id v21 = 0;
    }
  }
  else
  {
    DAErrorF(350000, (uint64_t)"No reply", v13, v14, v15, v16, v17, v18, v23);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = (id)MEMORY[0x263EFFA68];
  }

  return v21;
}

- (void)_getPartialIPsCompleted:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__4;
  id v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__DASession__getPartialIPsCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_264520690;
  uint64_t v14 = &v15;
  id v7 = v6;
  id v13 = v7;
  xpc_object_t v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  id v10 = (void *)v16[5];
  v16[5] = v9;

  if (!v16[5])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      unint64_t v11 = CUPrintNSObjectOneLine();
      LogPrintF();
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  v8[2](v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __55__DASession__getPartialIPsCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF();
    }
    int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

- (void)_reportEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v4 = _Block_copy(self->_eventHandler);
  id v5 = v4;
  if (v4) {
    (*((void (**)(void *, id))v4 + 2))(v4, v6);
  }
}

- (void)_reportEventType:(int64_t)a3
{
  uint64_t v4 = [[DAEvent alloc] initWithEventType:a3];
  [(DASession *)self _reportEvent:v4];
}

- (void)setState:(int64_t)a3 device:(id)a4 completionHandler:(id)a5
{
}

- (void)setState:(int64_t)a3 device:(id)a4 simulateApp:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__DASession_setState_device_simulateApp_completionHandler___block_invoke;
  block[3] = &unk_2645209A8;
  id v16 = v10;
  uint64_t v17 = self;
  BOOL v20 = a5;
  id v18 = v11;
  int64_t v19 = a3;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(dispatchQueue, block);
}

void __59__DASession_setState_device_simulateApp_completionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v10 = DADeviceStateToString(*(void *)(a1 + 56));
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 64);
    uint64_t v9 = v2;
    LogPrintF();
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "mTyp", "SDvS");
  CUXPCEncodeObject();
  xpc_dictionary_set_int64(v3, "dvSt", *(void *)(a1 + 56));
  CUXPCEncodeObject();
  if (*(unsigned char *)(a1 + 64)) {
    xpc_dictionary_set_BOOL(v3, "simA", 1);
  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted", v9, v10, v11);
  uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  id v5 = *(NSObject **)(*(void *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __59__DASession_setState_device_simulateApp_completionHandler___block_invoke_2;
  handler[3] = &unk_264520980;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(void **)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v7;
  xpc_connection_send_message_with_reply(v4, v3, v5, handler);
}

void __59__DASession_setState_device_simulateApp_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = DADeviceStateToString(*(void *)(a1 + 56));
    id v5 = CUPrintNSError();
    LogPrintF();
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6, v2, v3);
}

+ (BOOL)setState:(int64_t)a3 device:(id)a4 session:(id)a5 error:(id *)a6
{
  return [a1 setState:a3 device:a4 session:a5 simulateApp:0 error:a6];
}

+ (BOOL)setState:(int64_t)a3 device:(id)a4 session:(id)a5 simulateApp:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v11 = a4;
  id v12 = a5;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    id v13 = DADeviceStateToString(a3);
    v30 = [v12 bundleID];
    uint64_t v29 = (uint64_t)v11;
    LogPrintF();
  }
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "mTyp", "SDvS");
  CUXPCEncodeObject();
  xpc_dictionary_set_int64(v14, "dvSt", a3);
  CUXPCEncodeObject();
  if (v8) {
    xpc_dictionary_set_BOOL(v14, "simA", 1);
  }
  id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v16 = dispatch_queue_create("DASession-GetInfo", v15);

  mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v16, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_59);
  xpc_connection_activate(mach_service);
  xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(mach_service, v14);
  xpc_connection_cancel(mach_service);
  if (v18)
  {
    v25 = CUXPCDecodeNSErrorIfNeeded();
    v26 = v25;
    BOOL v27 = v25 == 0;
    if (v25 && a7) {
      *a7 = v25;
    }
  }
  else if (a7)
  {
    DAErrorF(350000, (uint64_t)"No reply", v19, v20, v21, v22, v23, v24, v29);
    BOOL v27 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

+ (BOOL)setDeviceAppAccessInfo:(id)a3 device:(id)a4 session:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    id v33 = v9;
    id v35 = v10;
    LogPrintF();
  }
  if ((objc_msgSend(v10, "flags", v33, v35) & 8) != 0)
  {
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "mTyp", "SAAi");
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    uint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v20 = dispatch_queue_create("DASession-GetInfo", v19);

    mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v20, 0);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_62);
    xpc_connection_activate(mach_service);
    xpc_object_t v22 = xpc_connection_send_message_with_reply_sync(mach_service, v18);
    xpc_connection_cancel(mach_service);
    if (v22)
    {
      uint64_t v29 = CUXPCDecodeNSErrorIfNeeded();
      v30 = v29;
      BOOL v31 = v29 == 0;
      if (v29 && a6) {
        *a6 = v29;
      }
    }
    else if (a6)
    {
      DAErrorF(350000, (uint64_t)"No reply", v23, v24, v25, v26, v27, v28, v34);
      BOOL v31 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v31 = 0;
    }
  }
  else if (a6)
  {
    DAErrorF(350001, (uint64_t)"Device missing accessory setup flag", v12, v13, v14, v15, v16, v17, v34);
    BOOL v31 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (id)bluetoothAccessInfoAndReturnError:(id *)a3
{
  if (a3)
  {
    DAErrorF(350002, (uint64_t)"Not implemented yet", (uint64_t)a3, v3, v4, v5, v6, v7, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)getBluetoothAccessInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__DASession_getBluetoothAccessInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_264520508;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __57__DASession_getBluetoothAccessInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "BTIG");
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__DASession_getBluetoothAccessInfoWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_264520668;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

uint64_t __57__DASession_getBluetoothAccessInfoWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getBluetoothAccessInfoCompleted:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)_getBluetoothAccessInfoCompleted:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__4;
  uint64_t v29 = __Block_byref_object_dispose__4;
  id v30 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__DASession__getBluetoothAccessInfoCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_264520690;
  uint64_t v24 = &v25;
  id v7 = v6;
  id v23 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v10 = (void *)v26[5];
  v26[5] = v9;

  if (!v26[5])
  {
    objc_opt_class();
    id v11 = (id *)(v26 + 5);
    id obj = (id)v26[5];
    CUXPCDecodeObject();
    objc_storeStrong(v11, obj);
    if (!v26[5])
    {
      uint64_t v18 = DAErrorF(350004, (uint64_t)"No error, but no info", v12, v13, v14, v15, v16, v17, v20);
      uint64_t v19 = (void *)v26[5];
      v26[5] = v18;
    }
  }
  v8[2](v8);

  _Block_object_dispose(&v25, 8);
}

uint64_t __64__DASession__getBluetoothAccessInfoCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

- (BOOL)appIsUsingDeviceAccess
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F04DE8]) initWithExtensionPointIdentifier:@"com.apple.discovery-extension"];
  [MEMORY[0x263F04DF0] executeQuery:v3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = v3;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "bundleIdentifier", bundleID, v17);
        id v11 = [v10 stringByDeletingPathExtension];

        if (self->_bundleID && (objc_msgSend(v11, "isEqual:") & 1) == 0)
        {
          if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
          {
            bundleID = self->_bundleID;
            uint64_t v17 = v11;
            LogPrintF();
          }
        }
        else
        {
          uint64_t v12 = [v9 entitlementNamed:@"com.apple.developer.media-device-discovery-extension" ofClass:objc_opt_class()];
          char v13 = [v12 BOOLValue];

          if (v13)
          {

            BOOL v14 = 1;
            goto LABEL_22;
          }
          if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
          {
            bundleID = [v9 bundleIdentifier];
            LogPrintF();
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    BOOL v14 = 0;
LABEL_22:
    uint64_t v3 = v18;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)diagnosticShow:(id)a3 error:(id *)a4
{
  return (id)[a1 diagnosticShow:a3 endpoint:0 error:a4];
}

+ (id)diagnosticShow:(id)a3 endpoint:(id)a4 error:(id *)a5
{
  id v6 = a4;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "mTyp", "DgSh");
  id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v9 = dispatch_queue_create("DASession-GetInfo", v8);

  uint64_t v10 = (_xpc_endpoint_s *)v6;
  id v11 = v10;
  if (v10)
  {
    mach_service = xpc_connection_create_from_endpoint(v10);
    xpc_connection_set_target_queue(mach_service, v9);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v9, 0);
  }
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_78);
  xpc_connection_activate(mach_service);
  xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(mach_service, v7);
  xpc_connection_cancel(mach_service);
  if (v13)
  {
    long long v20 = CUXPCDecodeNSErrorIfNeeded();
    long long v21 = v20;
    if (v20)
    {
      uint64_t v29 = 0;
      if (a5) {
        *a5 = v20;
      }
    }
    else
    {
      long long v22 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      uint64_t v29 = v22;
      if (v22)
      {
        id v30 = v22;
      }
      else if (a5)
      {
        DAErrorF(350004, (uint64_t)"Convert reply to CF failed", v23, v24, v25, v26, v27, v28, v32);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else if (a5)
  {
    DAErrorF(350000, (uint64_t)"No reply", v14, v15, v16, v17, v18, v19, v32);
    uint64_t v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

- (void)diagnosticShow:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__DASession_diagnosticShow_completionHandler___block_invoke;
  block[3] = &unk_2645209D0;
  xpc_object_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __46__DASession_diagnosticShow_completionHandler___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "DgSh");
  id v3 = a1[4];
  if (v3)
  {
    id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      xpc_object_t v13 = (void (**)(id, void, void *))a1[6];
      id v14 = DAErrorF(350000, (uint64_t)"Params conversion failed", v5, v6, v7, v8, v9, v10, v15);
      v13[2](v13, 0, v14);

      goto LABEL_5;
    }
    id v11 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);
  }
  id v3 = [a1[5] _ensureXPCStarted];
  id v12 = *((void *)a1[5] + 10);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __46__DASession_diagnosticShow_completionHandler___block_invoke_2;
  handler[3] = &unk_2645206B8;
  id v17 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v12, handler);

LABEL_5:
}

void __46__DASession_diagnosticShow_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = CUXPCDecodeNSErrorIfNeeded();
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v11 = *(void *)(a1 + 32);
    if (v10)
    {
      (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v10, 0);
    }
    else
    {
      id v12 = DAErrorF(350000, (uint64_t)"No error, no response", v4, v5, v6, v7, v8, v9, v13);
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
  }
}

+ (BOOL)networkingAllowedWithUUID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/var/mobile/Library/com.apple.DeviceAccess/DANetworkUUIDs.plist" isDirectory:0];
  id v13 = 0;
  uint64_t v7 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v6 error:&v13];
  id v8 = v13;
  uint64_t v9 = [v5 UUIDString];
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  if (gLogCategory_DASession <= 20 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    id v12 = CUPrintNSError();
    LogPrintF();
  }
  if (a4 && !v10) {
    *a4 = v8;
  }

  return v10 != 0;
}

+ (BOOL)processAllowedWithAuditToken:(id *)a3 error:(id *)a4
{
  id v17 = 0;
  long long v5 = *(_OWORD *)&a3->var0[4];
  v16[0] = *(_OWORD *)a3->var0;
  v16[1] = v5;
  uint64_t v6 = [MEMORY[0x263F01890] bundleRecordForAuditToken:v16 error:&v17];
  id v7 = v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 extensionPointRecord],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 identifier],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:@"com.apple.discovery-extension"],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v6 extensionPointRecord];
      id v13 = [v12 identifier];
      char v11 = [v13 isEqualToString:@"com.apple.accessory-setup-extension"];

      if (!a4) {
        goto LABEL_10;
      }
    }
    else
    {
      char v11 = 0;
      if (!a4) {
        goto LABEL_10;
      }
    }
    if ((v11 & 1) == 0)
    {
      char v11 = 0;
      *a4 = v7;
    }
  }
LABEL_10:
  if (gLogCategory_DASession <= 20 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = CUPrintNSError();
    LogPrintF();
  }
  return v11;
}

+ (id)getPartialIPsWithAppBundleID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v24 = (uint64_t)v5;
    LogPrintF();
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "mTyp", "GIFs");
  id v7 = v6;
  id v8 = v5;
  uint64_t v9 = (const char *)[v8 UTF8String];
  if (v9) {
    xpc_dictionary_set_string(v7, "bndI", v9);
  }

  char v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  char v11 = dispatch_queue_create("DASession-GetInfo", v10);

  mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v11, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_103);
  xpc_connection_activate(mach_service);
  xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(mach_service, v7);
  xpc_connection_cancel(mach_service);
  if (v13)
  {
    long long v20 = CUXPCDecodeNSErrorIfNeeded();
    long long v21 = v20;
    if (v20)
    {
      if (a4) {
        *a4 = v20;
      }
      id v22 = (id)MEMORY[0x263EFFA68];
    }
    else
    {
      objc_opt_class();
      CUXPCDecodeNSArrayOfClass();
      if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v25 = CUPrintNSObjectOneLine();
        LogPrintF();
      }
      id v22 = 0;
    }
  }
  else
  {
    if (a4)
    {
      DAErrorF(350000, (uint64_t)"No reply", v14, v15, v16, v17, v18, v19, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v22 = (id)MEMORY[0x263EFFA68];
  }

  return v22;
}

+ (id)getPartialIPsWithAuditToken:(id *)a3 error:(id *)a4
{
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v13 = 0;
  long long v6 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v6;
  id v7 = [MEMORY[0x263F01890] bundleRecordForAuditToken:v12 error:&v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 bundleIdentifier];
    uint64_t v9 = [v8 stringByDeletingPathExtension];

    char v10 = +[DASession getPartialIPsWithAppBundleID:v9 error:a4];
  }
  else
  {
    char v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

- (void)modifyDeviceWithIdentifier:(id)a3 settings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__DASession_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke;
  v15[3] = &unk_264520780;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __67__DASession_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "MdSt");
  id v3 = *(void **)(a1 + 32);
  id v4 = v2;
  id v5 = (const char *)[v3 UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "id", v5);
  }

  CUXPCEncodeObject();
  CUXPCEncodeObject();
  long long v6 = [*(id *)(a1 + 48) _ensureXPCStarted];
  id v7 = *(NSObject **)(*(void *)(a1 + 48) + 80);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __67__DASession_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke_2;
  handler[3] = &unk_2645206B8;
  id v9 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v6, v4, v7, handler);
}

void __67__DASession_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (BOOL)setPartialIPsWithAuditToken:(id *)a3 partialIPs:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v14 = 0;
  long long v8 = *(_OWORD *)&a3->var0[4];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v8;
  id v9 = [MEMORY[0x263F01890] bundleRecordForAuditToken:v13 error:&v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 bundleIdentifier];
    BOOL v11 = +[DASession setPartialIPsForAppBundleID:v10 partialIPs:v7 error:a5];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    id v27 = v7;
    id v29 = v8;
    LogPrintF();
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "mTyp", "SIFs");
  if (v7)
  {
    id v10 = v9;
    BOOL v11 = (const char *)[v7 UTF8String];
    if (v11) {
      xpc_dictionary_set_string(v10, "bndI", v11);
    }
  }
  if ((unint64_t)objc_msgSend(v8, "count", v27, v29) < 0xB)
  {
    CUXPCEncodeNSArrayOfObjects();
  }
  else
  {
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v12 = objc_msgSend(v8, "subarrayWithRange:", 0, 10);
    CUXPCEncodeNSArrayOfObjects();
  }
  id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v14 = dispatch_queue_create("DASession-GetInfo", v13);

  mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v14, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_114);
  xpc_connection_activate(mach_service);
  xpc_object_t v16 = xpc_connection_send_message_with_reply_sync(mach_service, v9);
  xpc_connection_cancel(mach_service);
  if (v16)
  {
    uint64_t v23 = CUXPCDecodeNSErrorIfNeeded();
    uint64_t v24 = v23;
    BOOL v25 = v23 == 0;
    if (v23 && a5) {
      *a5 = v23;
    }
  }
  else if (a5)
  {
    DAErrorF(350000, (uint64_t)"No reply", v17, v18, v19, v20, v21, v22, v28);
    BOOL v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (void)setPartialIPsWithAuditToken:(id *)a3 partialIPs:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  xpc_object_t v9 = (void (**)(id, void))a5;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v14 = 0;
  long long v10 = *(_OWORD *)&a3->var0[4];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v10;
  BOOL v11 = [MEMORY[0x263F01890] bundleRecordForAuditToken:v13 error:&v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v11 bundleIdentifier];
    [(DASession *)self setPartialIPsForAppBundleID:v12 partialIPs:v8 completionHandler:v9];
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (void)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__DASession_setPartialIPsForAppBundleID_partialIPs_completionHandler___block_invoke;
  v15[3] = &unk_264520780;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __70__DASession_setPartialIPsForAppBundleID_partialIPs_completionHandler___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "SIFs");
  id v3 = a1[4];
  if (v3)
  {
    id v4 = v2;
    id v5 = (const char *)[v3 UTF8String];
    if (v5) {
      xpc_dictionary_set_string(v4, "bndI", v5);
    }
  }
  CUXPCEncodeNSArrayOfObjects();
  long long v6 = [a1[6] _ensureXPCStarted];
  id v7 = *((void *)a1[6] + 10);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__DASession_setPartialIPsForAppBundleID_partialIPs_completionHandler___block_invoke_2;
  v8[3] = &unk_264520668;
  id v9 = a1[4];
  id v10 = a1[7];
  xpc_connection_send_message_with_reply(v6, v2, v7, v8);
}

void __70__DASession_setPartialIPsForAppBundleID_partialIPs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  id v5 = (id)v2;
  if (gLogCategory_DASession <= 30)
  {
    if (gLogCategory_DASession != -1 || (int v3 = _LogCategory_Initialize(), v2 = (uint64_t)v5, v3))
    {
      id v4 = CUPrintNSError();
      LogPrintF();

      uint64_t v2 = (uint64_t)v5;
    }
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2);
}

- (void)getPartialIPsWithAuditToken:(id *)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  xpc_connection_get_audit_token();
  uint64_t v11 = 0;
  long long v7 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v7;
  id v8 = [MEMORY[0x263F01890] bundleRecordForAuditToken:v10 error:&v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 bundleIdentifier];
    [(DASession *)self getPartialIPsWithAppBundleID:v9 completionHandler:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x263EFFA68], 0);
  }
}

- (void)getPartialIPsWithAppBundleID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__DASession_getPartialIPsWithAppBundleID_completionHandler___block_invoke;
  v8[3] = &unk_264520508;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void __60__DASession_getPartialIPsWithAppBundleID_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "GIFs");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  int v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__DASession_getPartialIPsWithAppBundleID_completionHandler___block_invoke_2;
  v6[3] = &unk_264520668;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);
}

uint64_t __60__DASession_getPartialIPsWithAppBundleID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getAuthorizedDevicesCompleted:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)_xpcListenerEvent:(id)a3
{
  id v7 = a3;
  uint64_t v4 = MEMORY[0x223C529E0]();
  if (v4 == MEMORY[0x263EF86F0])
  {
    uint64_t v4 = [(DASession *)self _xpcConnectionAccept:v7];
    goto LABEL_7;
  }
  id v5 = v7;
  if (v7 == (id)MEMORY[0x263EF86A8])
  {
    if (gLogCategory_DASession <= 30)
    {
      if (gLogCategory_DASession != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v7, v4))
      {
        uint64_t v4 = LogPrintF();
        goto LABEL_7;
      }
    }
  }
  else if (gLogCategory_DASession <= 90)
  {
    if (gLogCategory_DASession != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v7, v4))
    {
      id v6 = CUPrintXPC();
      LogPrintF();

LABEL_7:
      id v5 = v7;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (gLogCategory_DASession <= 9)
  {
    if (gLogCategory_DASession != -1 || (v5 = _LogCategory_Initialize(), id v4 = v18, v5))
    {
      CUPrintXPC();
      id v16 = v15 = self;
      LogPrintF();

      id v4 = v18;
    }
  }
  if (MEMORY[0x223C529E0](v4) == MEMORY[0x263EF8708])
  {
    [(DASession *)self _xpcReceivedMessage:v18];
  }
  else if (v18 == (id)MEMORY[0x263EF86A0])
  {
    [(DASession *)self _interrupted];
  }
  else if (v18 == (id)MEMORY[0x263EF86A8])
  {
    if (!self->_invalidateCalled
      && gLogCategory_DASession <= 90
      && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    [(DASession *)self _invalidated];
  }
  else
  {
    long long v12 = DAErrorF(350000, (uint64_t)"XPC event error", v6, v7, v8, v9, v10, v11, (uint64_t)v15);
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      long long v13 = CUPrintNSError();
      id v17 = CUPrintXPC();
      LogPrintF();
    }
  }
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "mTyp");
  if (string)
  {
    if (!strcmp(string, "Evnt"))
    {
      [(DASession *)self _xpcReceivedDAEvent:v5];
    }
    else if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_8;
  }
}

- (void)_xpcReceivedDAEvent:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x223C529E0]() == MEMORY[0x263EF8708])
  {
    id v18 = 0;
    id v5 = +[DAEvent allocInitWithXPCObject:v4 error:&v18];
    id v6 = v18;
    if (!v5)
    {
      if (gLogCategory_DASession > 90 || gLogCategory_DASession == -1 && !_LogCategory_Initialize()) {
        goto LABEL_32;
      }
      id v16 = CUPrintNSError();
      LogPrintF();
      goto LABEL_31;
    }
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      id v17 = v5;
      LogPrintF();
    }
    uint64_t v7 = objc_msgSend(v5, "eventType", v17);
    if (v7 <= 40)
    {
      if (v7 == 15) {
        goto LABEL_29;
      }
      if (v7 != 40)
      {
LABEL_32:

        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_18:
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            long long v12 = [v5 device];
            long long v13 = [v12 identifier];
            if (v13) {
              [(NSMutableDictionary *)self->_deviceMap setObject:v12 forKeyedSubscript:v13];
            }
          }
          goto LABEL_29;
        }
      }
      uint64_t v8 = [v5 device];
      uint64_t v9 = [v8 identifier];
      if (v9)
      {
        deviceMap = self->_deviceMap;
        uint64_t v11 = v8;
LABEL_27:
        [(NSMutableDictionary *)deviceMap setObject:v11 forKeyedSubscript:v9];
      }
    }
    else
    {
      if (v7 != 41)
      {
        if (v7 != 42)
        {
          if (v7 != 50) {
            goto LABEL_32;
          }
          goto LABEL_29;
        }
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_32;
        }
      }
      uint64_t v8 = [v5 device];
      uint64_t v9 = [v8 identifier];
      if (v9)
      {
        deviceMap = self->_deviceMap;
        uint64_t v11 = 0;
        goto LABEL_27;
      }
    }
    char v14 = [v8 flags];

    if ((v14 & 8) != 0)
    {
LABEL_29:
      uint64_t v15 = _Block_copy(self->_eventHandler);
      id v16 = v15;
      if (v15) {
        (*((void (**)(void *, id))v15 + 2))(v15, v5);
      }
LABEL_31:

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_33:
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unint64_t)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unint64_t)a3
{
  self->_deviceFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);

  objc_storeStrong((id *)&self->_appContext, 0);
}

@end