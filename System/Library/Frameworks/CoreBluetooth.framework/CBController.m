@interface CBController
+ (BOOL)bluetoothModificationAllowed;
+ (BOOL)safeToPowerOffBluetooth;
+ (BOOL)setBluetoothModificationAllowed:(BOOL)a3 error:(id *)a4;
+ (BOOL)systemHasOnlyBluetoothPointingDevices;
+ (BOOL)writePrefKey:(id)a3 value:(id)a4 error:(id *)a5;
+ (id)controllerInfoAndReturnError:(id *)a3;
+ (id)controllerInfoWithEndpoint:(id)a3 error:(id *)a4;
+ (id)performDeviceRequest:(id)a3 device:(id)a4 error:(id *)a5;
+ (id)performDeviceRequest:(id)a3 device:(id)a4 xpcEndpoint:(id)a5 error:(id *)a6;
+ (id)readPrefKeys:(id)a3 error:(id *)a4;
+ (unint64_t)bluetoothPointingDeviceCount;
+ (unint64_t)nonBluetoothPointingDeviceCount;
+ (unint64_t)numberOfPointingDevices;
+ (unsigned)featureFlags;
+ (unsigned)getAllowedToPowerOffBluetoothState;
+ (void)setOfflineAdvertisingParams:(id)a3;
- (BOOL)setLowPowerModeWithReason:(int)a3 error:(id *)a4;
- (CBController)init;
- (CBController)initWithXPCObject:(id)a3 error:(id *)a4;
- (CBDevice)remoteDevice;
- (NSString)appID;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)testListenerEndpoint;
- (id)_ensureXPCStarted;
- (id)bluetoothStateChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)discoverableStateChangedHandler;
- (id)errorHandler;
- (id)inquiryStateChangedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)relayMessageHandler;
- (id)tipiChangedHandler;
- (int)discoverableState;
- (int)inquiryState;
- (int64_t)bluetoothState;
- (unsigned)assertionFlags;
- (unsigned)clientID;
- (unsigned)internalFlags;
- (void)_activate;
- (void)_activateAssertionWithFlagsDirect:(unsigned int)a3 completion:(id)a4;
- (void)_activateAssertionWithFlagsXPC:(unsigned int)a3 completion:(id)a4;
- (void)_activateDirectStart;
- (void)_activateXPCCompleted:(id)a3;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_xpcReceivedDiscoverableStateChanged:(id)a3;
- (void)_xpcReceivedInquiryStateChanged:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)_xpcReceivedPowerStateChanged:(id)a3;
- (void)_xpcReceivedRelayMessage:(id)a3;
- (void)_xpcReceivedTipiChanged:(id)a3;
- (void)activateAssertionWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteDevice:(id)a3 completion:(id)a4;
- (void)diagnosticControl:(id)a3 completion:(id)a4;
- (void)diagnosticLog:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)encodeWithXPCObject:(id)a3;
- (void)getControllerInfoWithCompletion:(id)a3;
- (void)getControllerSettingsWithCompletionHandler:(id)a3;
- (void)getDevicesWithFlags:(unsigned int)a3 completionHandler:(id)a4;
- (void)getPowerStateWithCompletion:(id)a3;
- (void)invalidate;
- (void)modifyControllerSettings:(id)a3 completionHandler:(id)a4;
- (void)modifyDevice:(id)a3 completion:(id)a4;
- (void)modifyDevice:(id)a3 connectionPriorityDevices:(id)a4 timeoutSeconds:(double)a5 completionHandler:(id)a6;
- (void)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 completionHandler:(id)a6;
- (void)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 requestFlags:(unsigned int)a6 completionHandler:(id)a7;
- (void)modifyDevice:(id)a3 settings:(id)a4 completion:(id)a5;
- (void)performDeviceRequest:(id)a3 device:(id)a4 completion:(id)a5;
- (void)resetCBExtensionID:(id)a3 completionHandler:(id)a4;
- (void)sendConversationDetectMessage:(id)a3 device:(id)a4 completionHandler:(id)a5;
- (void)sendRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 destinationDevice:(id)a6 completionHandler:(id)a7;
- (void)sendSmartRoutingInformation:(id)a3 device:(id)a4 completionHandler:(id)a5;
- (void)setAppID:(id)a3;
- (void)setAssertionFlags:(unsigned int)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDiscoverableStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInquiryStateChangedHandler:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLowPowerModeWithReason:(int)a3 completion:(id)a4;
- (void)setPowerState:(int64_t)a3 completion:(id)a4;
- (void)setRelayMessageHandler:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)setTipiChangedHandler:(id)a3;
- (void)updateIdentities:(id)a3 completion:(id)a4;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation CBController

- (unsigned)assertionFlags
{
  return self->_assertionFlags;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

uint64_t __39__CBController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)setInquiryStateChangedHandler:(id)a3
{
}

- (void)setDiscoverableStateChangedHandler:(id)a3
{
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (void)setAppID:(id)a3
{
}

- (id)description
{
  return [(CBController *)self descriptionWithLevel:50];
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

uint64_t __34__CBController__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF_safe();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  [(CBController *)self encodeWithXPCObject:v5];
  xpc_dictionary_set_string(v5, "mTyp", "CtrA");
  v6 = [(CBController *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __34__CBController__activateXPCStart___block_invoke;
  handler[3] = &unk_1E5E31608;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  uint64_t assertionFlags = self->_assertionFlags;
  xpc_object_t xdict = v4;
  if (assertionFlags) {
    xpc_dictionary_set_uint64(v4, "asrF", assertionFlags);
  }
  uint64_t clientID = self->_clientID;
  if (clientID) {
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  }
  uint64_t internalFlags = self->_internalFlags;
  if (internalFlags) {
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  }
  CUXPCEncodeObject();
}

- (id)_ensureXPCStarted
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcCnx;
  if (!v3)
  {
    id v4 = v2->_testListenerEndpoint;
    xpc_object_t v5 = v4;
    if (v4)
    {
      mach_service = xpc_connection_create_from_endpoint(v4);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v2->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)v2->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__CBController__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E5E31630;
    v8[4] = v2;
    v3 = mach_service;
    v9 = v3;
    xpc_connection_set_event_handler(v3, v8);
    xpc_connection_activate(v3);
  }
  objc_sync_exit(v2);

  return v3;
}

- (CBController)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = [(CBController *)self init];
  if (!v13)
  {
    if (!a4) {
      goto LABEL_20;
    }
    v19 = "CBController init failed";
LABEL_19:
    CBErrorF(-6756, (uint64_t)v19, v7, v8, v9, v10, v11, v12, v20);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (!a4) {
      goto LABEL_20;
    }
    v19 = "XPC non-dict";
    goto LABEL_19;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v13->_uint64_t assertionFlags = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_20;
  }
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_uint64_t clientID = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_20;
  }
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_uint64_t internalFlags = 0;
    goto LABEL_12;
  }
  if (v16 == 5)
  {
LABEL_20:
    v17 = 0;
    goto LABEL_14;
  }
LABEL_12:
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_20;
  }
  v17 = v13;
LABEL_14:

  return v17;
}

- (CBController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CBController;
  v2 = [(CBController *)&v5 init];
  if (v2)
  {
    v2->_uint64_t clientID = CBXPCGetNextClientID();
    v2->_direct = gCBDaemonServer != 0;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBController;
    v3 = v2;
  }

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    uint64_t v6 = MEMORY[0x1AD111AA0](v4);
    id activateCompletion = v5->_activateCompletion;
    v5->_id activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__CBController_activateWithCompletion___block_invoke;
    block[3] = &unk_1E5E31248;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF_safe();
  id v4 = 0;
  if (self->_assertionFlags)
  {
    uint64_t v9 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v5 = v4;

    id v4 = v5;
  }
  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
  {
    uint64_t v10 = remoteDevice;
    NSAppendPrintF_safe();
    id v7 = v4;

    id v4 = v7;
  }

  return v4;
}

- (void)_activate
{
  if (self->_bluetoothStateChangedHandler) {
    self->_internalFlags |= 1u;
  }
  if (self->_relayMessageHandler) {
    self->_internalFlags |= 0x40u;
  }
  if (self->_tipiChangedHandler) {
    self->_internalFlags |= 0x200u;
  }
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Activate after invalidate", v2, v3, v4, v5, v6, v7, v14);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      int v15 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v10 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v10)
    {
      ((void (**)(void, id))v10)[2](v10, v16);
    }
    else
    {
      uint64_t v12 = MEMORY[0x1AD111AA0](self->_errorHandler);
      v13 = (void *)v12;
      if (v12) {
        (*(void (**)(uint64_t, id))(v12 + 16))(v12, v16);
      }
    }
  }
  else if (self->_direct)
  {
    [(CBController *)self _activateDirectStart];
  }
  else
  {
    [(CBController *)self _activateXPCStart:0];
  }
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CUXPCDecodeNSErrorIfNeeded();
  if (v5)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v13 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v8 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v8)
    {
      ((void (**)(void, void *))v8)[2](v8, v5);
    }
    else
    {
      uint64_t v10 = MEMORY[0x1AD111AA0](self->_errorHandler);
      uint64_t v11 = (void *)v10;
      if (v10) {
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v5);
      }
    }
  }
  else
  {
    if (CUXPCDecodeSInt64RangedEx() == 6) {
      self->_bluetoothState = 0;
    }
    if (CUXPCDecodeSInt64RangedEx() == 6) {
      self->_discoverableState = 0;
    }
    if (CUXPCDecodeSInt64RangedEx() == 6) {
      self->_inquiryState = 0;
    }
    int v7 = self->_ucat->var0;
    if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v8 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id v12 = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v8) {
      v8[2](v8, 0);
    }
  }
}

+ (BOOL)bluetoothModificationAllowed
{
  return 0;
}

+ (unint64_t)numberOfPointingDevices
{
  return 0;
}

+ (unint64_t)bluetoothPointingDeviceCount
{
  return 0;
}

+ (unint64_t)nonBluetoothPointingDeviceCount
{
  return 0;
}

+ (BOOL)setBluetoothModificationAllowed:(BOOL)a3 error:(id *)a4
{
  if (a4)
  {
    CBErrorF(-6735, (uint64_t)"Not supported on this platform. Use MDM instead.", a3, (uint64_t)a4, v4, v5, v6, v7, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (unsigned)featureFlags
{
  if (qword_1EB479178 != -1) {
    dispatch_once(&qword_1EB479178, &__block_literal_global_0);
  }
  return _MergedGlobals;
}

void __28__CBController_featureFlags__block_invoke()
{
  _MergedGlobals = 1;
}

+ (BOOL)safeToPowerOffBluetooth
{
  return 1;
}

+ (unsigned)getAllowedToPowerOffBluetoothState
{
  return 0;
}

+ (BOOL)systemHasOnlyBluetoothPointingDevices
{
  return 0;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CBController;
  [(CBController *)&v4 dealloc];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)_activateDirectStart
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    LogPrintF_safe();
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__CBController__activateDirectStart__block_invoke;
  v5[3] = &unk_1E5E315E0;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBController:completion:", self, v5, clientID);
}

void __36__CBController__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 88);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CBController__activateDirectStart__block_invoke_2;
  v7[3] = &unk_1E5E31068;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __36__CBController__activateDirectStart__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 40))
  {
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintNSError();
      LogPrintF_safe();
    }
    if (v9)
    {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 40));
    }
    else
    {
      uint64_t v5 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 96));
      id v6 = (void *)v5;
      if (v5) {
        (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 40));
      }
    }
    goto LABEL_17;
  }
  if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  uint64_t v7 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
LABEL_17:
    uint64_t v7 = (void *)v9;
  }
}

void *__33__CBController__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[5] == *(void *)(a1 + 40)) {
    return (void *)[result xpcReceivedMessage:a2];
  }
  return result;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v4 = MEMORY[0x1AD111AA0](self->_interruptionHandler);
    uint64_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    self->_bluetoothState = 1;
    uint64_t v6 = MEMORY[0x1AD111AA0](self->_bluetoothStateChangedHandler);
    uint64_t v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }

    if (self->_activateCalled) {
      [(CBController *)self _activateXPCStart:1];
    }
    if (self->_activateAssertionCalled)
    {
      uint64_t assertionFlags = self->_assertionFlags;
      [(CBController *)self _activateAssertionWithFlagsXPC:assertionFlags completion:0];
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CBController_invalidate__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CBController_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 26))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 26) = 1;
    uint64_t v3 = *(void *)(result + 32);
    int v4 = **(_DWORD **)(v3 + 32);
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(void *)(v2 + 32), v5))
      {
        LogPrintF_safe();
        uint64_t v3 = *(void *)(v2 + 32);
      }
    }
    if (*(unsigned char *)(v3 + 25))
    {
      [(id)v3 _invalidateDirect];
      uint64_t v3 = *(void *)(v2 + 32);
    }
    id v6 = (id)v3;
    objc_sync_enter(v6);
    uint64_t v7 = (_xpc_connection_s *)*(id *)(*(void *)(v2 + 32) + 40);
    id v8 = v7;
    if (v7) {
      xpc_connection_cancel(v7);
    }

    objc_sync_exit(v6);
    uint64_t v9 = *(void **)(v2 + 32);
    return [v9 _invalidated];
  }
  return result;
}

- (void)_invalidateDirect
{
}

void __33__CBController__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CBController__invalidateDirect__block_invoke_2;
  block[3] = &unk_1E5E31248;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __33__CBController__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct)
  {
    uint64_t v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      id bluetoothStateChangedHandler = v3->_bluetoothStateChangedHandler;
      v3->_id bluetoothStateChangedHandler = 0;

      id discoverableStateChangedHandler = v3->_discoverableStateChangedHandler;
      v3->_id discoverableStateChangedHandler = 0;

      id errorHandler = v3->_errorHandler;
      v3->_id errorHandler = 0;

      id inquiryStateChangedHandler = v3->_inquiryStateChangedHandler;
      v3->_id inquiryStateChangedHandler = 0;

      id interruptionHandler = v3->_interruptionHandler;
      v3->_id interruptionHandler = 0;

      uint64_t v15 = MEMORY[0x1AD111AA0](v3->_invalidationHandler);
      id invalidationHandler = v3->_invalidationHandler;
      v3->_id invalidationHandler = 0;

      id relayMessageHandler = v3->_relayMessageHandler;
      v3->_id relayMessageHandler = 0;

      id tipiChangedHandler = v3->_tipiChangedHandler;
      v3->_id tipiChangedHandler = 0;

      uint64_t v13 = v15;
      if (v15)
      {
        (*(void (**)(uint64_t))(v15 + 16))(v15);
        uint64_t v13 = v15;
      }
      self->_invalidateDone = 1;
      p_int var0 = &v3->_ucat->var0;
      if (*p_var0 <= 30 && (*p_var0 != -1 || (p_int var0 = (int *)_LogCategory_Initialize(), v13 = v15, p_var0)))
      {
        p_int var0 = (int *)LogPrintF_safe();
        uint64_t v13 = v15;
      }
      else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
      {
        __break(0xC471u);
      }
      MEMORY[0x1F41817F8](p_var0, v13);
    }
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  int v4 = (uint64_t (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__CBController__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E5E31248;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __41__CBController__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    uint64_t v2 = self;
    objc_sync_enter(v2);
    BOOL changesPending = v2->_changesPending;
    v2->_BOOL changesPending = 0;
    objc_sync_exit(v2);

    int var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize()) {
        return;
      }
    }
    else
    {
      if (var0 > 10 || var0 == -1 && !_LogCategory_Initialize()) {
        return;
      }
    }
    LogPrintF_safe();
  }
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v25 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v25, v6))
    {
      v23 = CUPrintXPC();
      LogPrintF_safe();

      id v4 = v25;
    }
  }
  if (MEMORY[0x1AD1120E0](v4) == MEMORY[0x1E4F14590])
  {
    [(CBController *)self _xpcReceivedMessage:v25];
    goto LABEL_26;
  }
  if (v25 == (id)MEMORY[0x1E4F14520])
  {
    [(CBController *)self _interrupted];
    goto LABEL_26;
  }
  if (v25 != (id)MEMORY[0x1E4F14528])
  {
    uint64_t v7 = CUXPCDecodeNSErrorIfNeeded();
    uint64_t v14 = v7;
    if (v7)
    {
      id v15 = v7;

      int v16 = self->_ucat->var0;
      if (v16 > 90) {
        goto LABEL_21;
      }
    }
    else
    {
      CBErrorF(-6700, (uint64_t)"XPC event error", v8, v9, v10, v11, v12, v13, (uint64_t)v23);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      int v16 = self->_ucat->var0;
      if (v16 > 90)
      {
LABEL_21:
        uint64_t v19 = MEMORY[0x1AD111AA0](self->_errorHandler);
        uint64_t v20 = (void *)v19;
        if (v19) {
          (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);
        }

        goto LABEL_26;
      }
    }
    if (v16 != -1 || _LogCategory_Initialize())
    {
      v18 = CUPrintNSError();
      v24 = CUPrintXPC();
      LogPrintF_safe();
    }
    goto LABEL_21;
  }
  if (!self->_invalidateCalled)
  {
    int v17 = self->_ucat->var0;
    if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  v21 = self;
  objc_sync_enter(v21);
  xpcCnx = v21->_xpcCnx;
  v21->_xpcCnx = 0;

  objc_sync_exit(v21);
  [(CBController *)v21 _invalidated];
LABEL_26:
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v9 = a3;
  string = xpc_dictionary_get_string(v9, "mTyp");
  if (!string)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  int v5 = string;
  if (!strcmp(string, "DscC"))
  {
    [(CBController *)self _xpcReceivedDiscoverableStateChanged:v9];
    uint64_t v8 = v9;
  }
  else if (!strcmp(v5, "InqC"))
  {
    [(CBController *)self _xpcReceivedInquiryStateChanged:v9];
    uint64_t v8 = v9;
  }
  else if (!strcmp(v5, "PwrC"))
  {
    [(CBController *)self _xpcReceivedPowerStateChanged:v9];
    uint64_t v8 = v9;
  }
  else if (!strcmp(v5, "RlMR"))
  {
    [(CBController *)self _xpcReceivedRelayMessage:v9];
    uint64_t v8 = v9;
  }
  else
  {
    if (strcmp(v5, "TpiC"))
    {
      int v6 = self->_ucat->var0;
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize())) {
LABEL_12:
      }
        LogPrintF_safe();
LABEL_13:
      uint64_t v8 = v9;
      goto LABEL_15;
    }
    [(CBController *)self _xpcReceivedTipiChanged:v9];
    uint64_t v8 = v9;
  }
LABEL_15:
}

- (void)_xpcReceivedDiscoverableStateChanged:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    if (CUXPCDecodeSInt64RangedEx() == 6) {
      self->_discoverableState = 0;
    }
    uint64_t v5 = MEMORY[0x1AD111AA0](self->_discoverableStateChangedHandler);
    int v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }

    goto LABEL_7;
  }
  int var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_7:

    return;
  }
  LogPrintF_safe();
}

- (void)_xpcReceivedInquiryStateChanged:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    if (CUXPCDecodeSInt64RangedEx() == 6) {
      self->_inquiryState = 0;
    }
    uint64_t v5 = MEMORY[0x1AD111AA0](self->_inquiryStateChangedHandler);
    int v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }

    goto LABEL_7;
  }
  int var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_7:

    return;
  }
  LogPrintF_safe();
}

- (void)_xpcReceivedPowerStateChanged:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    if (CUXPCDecodeSInt64RangedEx() == 6) {
      self->_bluetoothState = 0;
    }
    uint64_t v5 = MEMORY[0x1AD111AA0](self->_bluetoothStateChangedHandler);
    int v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }

    goto LABEL_7;
  }
  int var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_7:

    return;
  }
  LogPrintF_safe();
}

- (void)_xpcReceivedRelayMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1AD111AA0](self->_relayMessageHandler);
  if (v5)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__1;
    int v16 = __Block_byref_object_dispose__1;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__CBController__xpcReceivedRelayMessage___block_invoke;
    v11[3] = &unk_1E5E31388;
    v11[4] = self;
    v11[5] = &v12;
    int v6 = (void (**)(void))MEMORY[0x1AD111AA0](v11);
    if (MEMORY[0x1AD1120E0](v4) == MEMORY[0x1E4F14590])
    {
      objc_opt_class();
      CUXPCDecodeObject();
      id v7 = 0;
      uint64_t v10 = CUPrintNSError();
      uint64_t v8 = NSPrintF_safe();
      id v9 = (void *)v13[5];
      v13[5] = v8;
    }
    else
    {
      id v7 = (id)v13[5];
      v13[5] = @"non-dict message";
    }

    v6[2](v6);
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __41__CBController__xpcReceivedRelayMessage___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    result = *(void *)(*(void *)(result + 32) + 32);
    if (*(int *)result <= 90)
    {
      if (*(_DWORD *)result != -1) {
        return LogPrintF_safe();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF_safe();
      }
    }
  }
  return result;
}

- (void)_xpcReceivedTipiChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1AD111AA0](self->_tipiChangedHandler);
  if (v5)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__1;
    int v16 = __Block_byref_object_dispose__1;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__CBController__xpcReceivedTipiChanged___block_invoke;
    v11[3] = &unk_1E5E31388;
    v11[4] = self;
    v11[5] = &v12;
    int v6 = (void (**)(void))MEMORY[0x1AD111AA0](v11);
    if (MEMORY[0x1AD1120E0](v4) == MEMORY[0x1E4F14590])
    {
      objc_opt_class();
      CUXPCDecodeObject();
      id v7 = 0;
      uint64_t v10 = CUPrintNSError();
      uint64_t v8 = NSPrintF_safe();
      id v9 = (void *)v13[5];
      v13[5] = v8;
    }
    else
    {
      id v7 = (id)v13[5];
      v13[5] = @"non-dict message";
    }

    v6[2](v6);
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __40__CBController__xpcReceivedTipiChanged___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    result = *(void *)(*(void *)(result + 32) + 32);
    if (*(int *)result <= 90)
    {
      if (*(_DWORD *)result != -1) {
        return LogPrintF_safe();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF_safe();
      }
    }
  }
  return result;
}

- (void)activateAssertionWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CBController_activateAssertionWithFlags_completion___block_invoke;
  block[3] = &unk_1E5E321B8;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __54__CBController_activateAssertionWithFlags_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = *(_DWORD *)(a1 + 48);
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  if (v2[25]) {
    return [v2 _activateAssertionWithFlagsDirect:v4 completion:v3];
  }
  else {
    return [v2 _activateAssertionWithFlagsXPC:v4 completion:v3];
  }
}

- (void)_activateAssertionWithFlagsDirect:(unsigned int)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)gCBDaemonServer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CBController__activateAssertionWithFlagsDirect_completion___block_invoke;
  v8[3] = &unk_1E5E321E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 activateCBController:self completion:v8];
}

void __61__CBController__activateAssertionWithFlagsDirect_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CBController__activateAssertionWithFlagsDirect_completion___block_invoke_2;
  block[3] = &unk_1E5E312E8;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __61__CBController__activateAssertionWithFlagsDirect_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2)
  {
    id v3 = *(void (**)(void))(v2 + 16);
    v3();
  }
  else if (a1[4])
  {
    uint64_t v4 = (void (**)(void, void))MEMORY[0x1AD111AA0](*(void *)(a1[5] + 96));
    if (v4)
    {
      id v5 = v4;
      v4[2](v4, a1[4]);
      uint64_t v4 = (void (**)(void, void))v5;
    }
  }
}

- (void)_activateAssertionWithFlagsXPC:(unsigned int)a3 completion:(id)a4
{
  id v5 = a4;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  [(CBController *)self encodeWithXPCObject:v6];
  xpc_dictionary_set_string(v6, "mTyp", "CtrA");
  id v7 = [(CBController *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CBController__activateAssertionWithFlagsXPC_completion___block_invoke;
  v10[3] = &unk_1E5E32208;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  xpc_connection_send_message_with_reply(v7, v6, dispatchQueue, v10);
}

uint64_t __58__CBController__activateAssertionWithFlagsXPC_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v7 = v2;
    uint64_t v3 = (*(uint64_t (**)(void))(v3 + 16))();
  }
  else
  {
    if (!v2) {
      goto LABEL_8;
    }
    uint64_t v7 = v2;
    uint64_t v4 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 96));
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v7);
    }
  }
  uint64_t v2 = v7;
LABEL_8:

  return MEMORY[0x1F41817F8](v3, v2);
}

+ (id)controllerInfoAndReturnError:(id *)a3
{
  return (id)[a1 controllerInfoWithEndpoint:0 error:a3];
}

+ (id)controllerInfoWithEndpoint:(id)a3 error:(id *)a4
{
  id v5 = a3;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "mTyp", "GCtI");
  uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = dispatch_queue_create("CBController-GetInfo", v7);

  id v9 = (_xpc_endpoint_s *)v5;
  uint64_t v10 = v9;
  if (v9)
  {
    mach_service = xpc_connection_create_from_endpoint(v9);
    xpc_connection_set_target_queue(mach_service, v8);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v8, 0);
  }
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_71);
  xpc_connection_activate(mach_service);
  xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
  xpc_connection_cancel(mach_service);
  if (v12)
  {
    uint64_t v19 = CUXPCDecodeNSErrorIfNeeded();
    if (v19)
    {
      id v29 = v19;
      if (a4)
      {
        id v29 = v19;
        v27 = 0;
        *a4 = v29;
      }
      else
      {
        v27 = 0;
      }
    }
    else
    {
      v26 = xpc_dictionary_get_value(v12, "ctrI");
      if (v26)
      {
        id v33 = 0;
        v27 = [[CBControllerInfo alloc] initWithXPCObject:v26 error:&v33];
        id v28 = v33;
        id v29 = v28;
        if (v27)
        {
          v30 = v27;
        }
        else if (a4)
        {
          *a4 = v28;
        }
      }
      else if (a4)
      {
        CBErrorF(-6762, (uint64_t)"No controller info", v20, v21, v22, v23, v24, v25, v32);
        v27 = 0;
        id v29 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
        id v29 = 0;
      }
    }
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v13, v14, v15, v16, v17, v18, v32);
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)getControllerInfoWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CBController_getControllerInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E5E32278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __48__CBController_getControllerInfoWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "GCtI");
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __48__CBController_getControllerInfoWithCompletion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __48__CBController_getControllerInfoWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v13 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v11 = xpc_dictionary_get_value(v3, "ctrI");
    if (v11)
    {
      id v17 = 0;
      xpc_object_t v12 = [[CBControllerInfo alloc] initWithXPCObject:v11 error:&v17];
      id v13 = v17;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = CBErrorF(-6762, (uint64_t)"No controller info", v5, v6, v7, v8, v9, v10, v16);
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);

      id v13 = 0;
    }
  }
}

- (void)getControllerSettingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CBController_getControllerSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E32278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __59__CBController_getControllerSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "GCtS");
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __59__CBController_getControllerSettingsWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __59__CBController_getControllerSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    xpc_object_t v12 = (void *)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    CUXPCDecodeObject();
    id v5 = 0;
    xpc_object_t v12 = v5;
    uint64_t v13 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    else
    {
      uint64_t v14 = CBErrorF(-6762, (uint64_t)"No settings", v6, v7, v8, v9, v10, v11, 0);
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    }
  }
}

- (void)modifyControllerSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CBController_modifyControllerSettings_completionHandler___block_invoke;
  block[3] = &unk_1E5E322A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __59__CBController_modifyControllerSettings_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "MCtS");
  CUXPCEncodeObject();
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __59__CBController_modifyControllerSettings_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __59__CBController_modifyControllerSettings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)getDevicesWithFlags:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CBController_getDevicesWithFlags_completionHandler___block_invoke;
  block[3] = &unk_1E5E321B8;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __54__CBController_getDevicesWithFlags_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "GtDv");
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  if (v3) {
    xpc_dictionary_set_uint64(v2, "gDvF", v3);
  }
  uint64_t v4 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __54__CBController_getDevicesWithFlags_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v7 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v4, v2, v5, handler);
}

void __54__CBController_getDevicesWithFlags_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v12 = (void *)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    id v5 = 0;
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    else
    {
      uint64_t v14 = CBErrorF(-6762, (uint64_t)"No device array", v6, v7, v8, v9, v10, v11, 0);
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    }
  }
}

+ (id)performDeviceRequest:(id)a3 device:(id)a4 error:(id *)a5
{
  return (id)[a1 performDeviceRequest:a3 device:a4 xpcEndpoint:0 error:a5];
}

+ (id)performDeviceRequest:(id)a3 device:(id)a4 xpcEndpoint:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "mTyp", "PfDR");
  CUXPCEncodeObject();

  CUXPCEncodeObject();
  uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v14 = dispatch_queue_create("CBController-Perform", v13);

  uint64_t v15 = (_xpc_endpoint_s *)v9;
  uint64_t v16 = v15;
  if (v15)
  {
    mach_service = xpc_connection_create_from_endpoint(v15);
    xpc_connection_set_target_queue(mach_service, v14);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v14, 0);
  }
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_89);
  xpc_connection_activate(mach_service);
  xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(mach_service, v12);
  xpc_connection_cancel(mach_service);
  if (v18)
  {
    uint64_t v25 = CUXPCDecodeNSErrorIfNeeded();
    if (v25)
    {
      id v27 = v25;
      if (a6)
      {
        id v27 = v25;
        *a6 = v27;
      }
    }
    else
    {
      objc_opt_class();
      CUXPCDecodeObject();
      id v26 = 0;
      id v27 = v26;
      if (a6) {
        *a6 = v26;
      }
    }
  }
  else if (a6)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v19, v20, v21, v22, v23, v24, v29);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (void)performDeviceRequest:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__CBController_performDeviceRequest_device_completion___block_invoke;
  v15[3] = &unk_1E5E322C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __55__CBController_performDeviceRequest_device_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "PfDR");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __55__CBController_performDeviceRequest_device_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __55__CBController_performDeviceRequest_device_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v13 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v11 = xpc_dictionary_get_value(v3, "dvRs");
    if (v11)
    {
      id v17 = 0;
      id v12 = [[CBDeviceResponse alloc] initWithXPCObject:v11 error:&v17];
      id v13 = v17;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = CBErrorF(-6762, (uint64_t)"No device response", v5, v6, v7, v8, v9, v10, v16);
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);

      id v13 = 0;
    }
  }
}

- (void)deleteDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CBController_deleteDevice_completion___block_invoke;
  block[3] = &unk_1E5E322A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __40__CBController_deleteDevice_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "DltD");
  CUXPCEncodeObject();
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __40__CBController_deleteDevice_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __40__CBController_deleteDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)modifyDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CBController_modifyDevice_completion___block_invoke;
  block[3] = &unk_1E5E322A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __40__CBController_modifyDevice_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "UpDv");
  CUXPCEncodeObject();
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __40__CBController_modifyDevice_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __40__CBController_modifyDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)modifyDevice:(id)a3 connectionPriorityDevices:(id)a4 timeoutSeconds:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__CBController_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler___block_invoke;
  block[3] = &unk_1E5E322F0;
  void block[4] = self;
  id v18 = v10;
  double v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(dispatchQueue, block);
}

void __88__CBController_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "UpDv");
  CUXPCEncodeObject();
  CUXPCEncodeNSArrayOfNSString();
  double v3 = *(double *)(a1 + 64);
  if (v3 != 0.0) {
    xpc_dictionary_set_double(v2, "timO", v3);
  }
  uint64_t v4 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __88__CBController_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v7 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v4, v2, v5, handler);
}

void __88__CBController_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 completionHandler:(id)a6
{
}

- (void)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 requestFlags:(unsigned int)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CBController_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler___block_invoke;
  block[3] = &unk_1E5E32318;
  void block[4] = self;
  id v20 = v12;
  char v24 = a5;
  unsigned int v23 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(dispatchQueue, block);
}

void __93__CBController_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "UpDv");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  if (*(unsigned char *)(a1 + 68)) {
    xpc_dictionary_set_int64(v2, "prSS", *(char *)(a1 + 68));
  }
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  if (v3) {
    xpc_dictionary_set_uint64(v2, "dvRF", v3);
  }
  uint64_t v4 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __93__CBController_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v7 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v4, v2, v5, handler);
}

void __93__CBController_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)modifyDevice:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__CBController_modifyDevice_settings_completion___block_invoke;
  v15[3] = &unk_1E5E322C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __49__CBController_modifyDevice_settings_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "UpDv");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  uint64_t v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __49__CBController_modifyDevice_settings_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __49__CBController_modifyDevice_settings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CBController_diagnosticControl_completion___block_invoke;
  block[3] = &unk_1E5E322A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __45__CBController_diagnosticControl_completion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [a1[4] encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "DiCt");
  id v3 = a1[5];
  if (v3)
  {
    uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      id v13 = (void (**)(id, void, void *))a1[6];
      id v14 = CBErrorF(-6700, (uint64_t)"Params conversion failed", v5, v6, v7, v8, v9, v10, v15);
      v13[2](v13, 0, v14);

      goto LABEL_5;
    }
    id v11 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);
  }
  id v3 = [a1[4] _ensureXPCStarted];
  id v12 = *((void *)a1[4] + 11);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __45__CBController_diagnosticControl_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v17 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v12, handler);

LABEL_5:
}

void __45__CBController_diagnosticControl_completion___block_invoke_2(uint64_t a1, void *a2)
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
      id v12 = CBErrorF(-6700, (uint64_t)"No error, no response", v4, v5, v6, v7, v8, v9, v13);
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
  }
}

- (void)diagnosticLog:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CBController_diagnosticLog_completion___block_invoke;
  block[3] = &unk_1E5E322A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __41__CBController_diagnosticLog_completion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [a1[4] encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "DiLg");
  id v3 = a1[5];
  if (v3)
  {
    uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      id v13 = (void (**)(id, void, void *))a1[6];
      id v14 = CBErrorF(-6700, (uint64_t)"Params conversion failed", v5, v6, v7, v8, v9, v10, v15);
      v13[2](v13, 0, v14);

      goto LABEL_5;
    }
    uint64_t v11 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);
  }
  id v3 = [a1[4] _ensureXPCStarted];
  id v12 = *((void *)a1[4] + 11);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __41__CBController_diagnosticLog_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v17 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v12, handler);

LABEL_5:
}

void __41__CBController_diagnosticLog_completion___block_invoke_2(uint64_t a1, void *a2)
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
      id v12 = CBErrorF(-6700, (uint64_t)"No error, no response", v4, v5, v6, v7, v8, v9, v13);
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
  }
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CBController_diagnosticShow_completion___block_invoke;
  block[3] = &unk_1E5E322A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __42__CBController_diagnosticShow_completion___block_invoke(id *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [a1[4] encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "DiSh");
  id v3 = a1[5];
  if (v3)
  {
    uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      id v13 = (void (**)(id, void, void *))a1[6];
      id v14 = CBErrorF(-6700, (uint64_t)"Params conversion failed", v5, v6, v7, v8, v9, v10, v15);
      v13[2](v13, 0, v14);

      goto LABEL_5;
    }
    uint64_t v11 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);
  }
  id v3 = [a1[4] _ensureXPCStarted];
  id v12 = *((void *)a1[4] + 11);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__CBController_diagnosticShow_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v17 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v12, handler);

LABEL_5:
}

void __42__CBController_diagnosticShow_completion___block_invoke_2(uint64_t a1, void *a2)
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
      id v12 = CBErrorF(-6700, (uint64_t)"No error, no response", v4, v5, v6, v7, v8, v9, v13);
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
  }
}

- (void)setLowPowerModeWithReason:(int)a3 completion:(id)a4
{
  id v6 = a4;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "mTyp", "LpmS");
  xpc_dictionary_set_int64(v7, "ctrP", a3);
  uint64_t v8 = [(CBController *)self _ensureXPCStarted];
  if (gLogCategory_CBController <= 30 && (gLogCategory_CBController != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __53__CBController_setLowPowerModeWithReason_completion___block_invoke;
  handler[3] = &unk_1E5E32250;
  id v12 = v6;
  id v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, handler);
}

void __53__CBController_setLowPowerModeWithReason_completion___block_invoke(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_CBController <= 30 && (gLogCategory_CBController != -1 || _LogCategory_Initialize()))
  {
    xpc_object_t v2 = CUPrintNSError();
    LogPrintF_safe();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)setLowPowerModeWithReason:(int)a3 error:(id *)a4
{
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "mTyp", "LpmS");
  xpc_dictionary_set_int64(v7, "ctrP", a3);
  uint64_t v8 = [(CBController *)self _ensureXPCStarted];
  xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(v8, v7);
  if (v15)
  {
    id v16 = CUXPCDecodeNSErrorIfNeeded();
    id v17 = v16;
    BOOL v18 = v16 == 0;
    if (v16 && a4) {
      *a4 = v16;
    }
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v9, v10, v11, v12, v13, v14, v20);
    BOOL v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (void)setOfflineAdvertisingParams:(id)a3
{
  id v5 = a3;
  id v3 = [(id)gCBDaemonServer stackController];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setOfflineAdvertisingParams:v5];
  }
  else if (gLogCategory_CBController <= 90 {
         && (gLogCategory_CBController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (void)getPowerStateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CBController_getPowerStateWithCompletion___block_invoke;
  v7[3] = &unk_1E5E32278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __44__CBController_getPowerStateWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "PwrG");
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __44__CBController_getPowerStateWithCompletion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __44__CBController_getPowerStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 || (CUXPCDecodeSInt64RangedEx(), (id v4 = 0) != 0))
  {
    id v5 = v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setPowerState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CBController_setPowerState_completion___block_invoke;
  block[3] = &unk_1E5E32340;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __41__CBController_setPowerState_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "PwrS");
  xpc_dictionary_set_int64(v2, "pwrS", *(void *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __41__CBController_setPowerState_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __41__CBController_setPowerState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)readPrefKeys:(id)a3 error:(id *)a4
{
  id v5 = a3;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "mTyp", "RdPf");
  CUXPCEncodeNSArrayOfNSString();

  xpc_object_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = dispatch_queue_create("CBController-ReadPrefs", v7);

  mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v8, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_118);
  xpc_connection_activate(mach_service);
  xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
  xpc_connection_cancel(mach_service);
  if (v10)
  {
    id v17 = CUXPCDecodeNSErrorIfNeeded();
    BOOL v18 = v17;
    if (v17)
    {
      id v33 = 0;
      if (a4) {
        *a4 = v17;
      }
    }
    else
    {
      uint64_t v25 = xpc_dictionary_get_value(v10, "pfVs");
      if (v25)
      {
        id v26 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        id v33 = v26;
        if (v26)
        {
          id v34 = v26;
        }
        else if (a4)
        {
          CBErrorF(-6700, (uint64_t)"Bad XPC prefs", v27, v28, v29, v30, v31, v32, v36);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a4)
      {
        CBErrorF(-6762, (uint64_t)"No XPC prefs", v19, v20, v21, v22, v23, v24, v36);
        id v33 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = 0;
      }
    }
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v11, v12, v13, v14, v15, v16, v36);
    id v33 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

+ (BOOL)writePrefKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "mTyp", "WrPf");
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = (const char *)[v11 UTF8String];

  if (v12) {
    xpc_dictionary_set_string(v10, "pfKy", v12);
  }

  uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v13)
  {
    xpc_dictionary_set_value(v10, "pfVl", v13);
    uint64_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v21 = dispatch_queue_create("CBController-WritePrefs", v20);

    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v21, 0);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_128);
    xpc_connection_activate(mach_service);
    xpc_object_t v23 = xpc_connection_send_message_with_reply_sync(mach_service, v10);
    xpc_connection_cancel(mach_service);
    if (v23)
    {
      uint64_t v30 = CUXPCDecodeNSErrorIfNeeded();
      uint64_t v31 = v30;
      BOOL v32 = v30 == 0;
      if (v30 && a5) {
        *a5 = v30;
      }
    }
    else if (a5)
    {
      CBErrorF(-6700, (uint64_t)"No reply", v24, v25, v26, v27, v28, v29, v34);
      BOOL v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v32 = 0;
    }
  }
  else if (a5)
  {
    CBErrorF(-6756, (uint64_t)"Bad value type", v14, v15, v16, v17, v18, v19, v34);
    BOOL v32 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (void)sendRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 destinationDevice:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatchQueue = self->_dispatchQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99__CBController_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler___block_invoke;
  v21[3] = &unk_1E5E32368;
  unsigned __int8 v27 = a3;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  uint64_t v25 = self;
  id v26 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(dispatchQueue, v21);
}

void __99__CBController_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "SnRM");
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = v3;
    id v5 = v2;
    id v6 = v4;
    uint64_t v7 = [v6 bytes];
    if (v7) {
      id v8 = (const char *)v7;
    }
    else {
      id v8 = "";
    }
    size_t v9 = [v6 length];

    xpc_dictionary_set_data(v5, "rlMD", v8, v9);
  }
  if (*(unsigned char *)(a1 + 72)) {
    xpc_dictionary_set_uint64(v2, "rlMT", *(unsigned __int8 *)(a1 + 72));
  }
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  id v10 = [*(id *)(a1 + 56) _ensureXPCStarted];
  id v11 = *(NSObject **)(*(void *)(a1 + 56) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __99__CBController_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v13 = *(id *)(a1 + 64);
  xpc_connection_send_message_with_reply(v10, v2, v11, handler);
}

void __99__CBController_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)sendSmartRoutingInformation:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__CBController_sendSmartRoutingInformation_device_completionHandler___block_invoke;
  v15[3] = &unk_1E5E322C8;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __69__CBController_sendSmartRoutingInformation_device_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "SnSR");
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = v3;
    id v5 = v2;
    id v6 = v4;
    uint64_t v7 = [v6 bytes];
    if (v7) {
      id v8 = (const char *)v7;
    }
    else {
      id v8 = "";
    }
    size_t v9 = [v6 length];

    xpc_dictionary_set_data(v5, "rlMD", v8, v9);
  }
  CUXPCEncodeObject();
  id v10 = [*(id *)(a1 + 48) _ensureXPCStarted];
  id v11 = *(NSObject **)(*(void *)(a1 + 48) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __69__CBController_sendSmartRoutingInformation_device_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v13 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v10, v2, v11, handler);
}

void __69__CBController_sendSmartRoutingInformation_device_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)sendConversationDetectMessage:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__CBController_sendConversationDetectMessage_device_completionHandler___block_invoke;
  v15[3] = &unk_1E5E322C8;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __71__CBController_sendConversationDetectMessage_device_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "SnCD");
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = v3;
    id v5 = v2;
    id v6 = v4;
    uint64_t v7 = [v6 bytes];
    if (v7) {
      id v8 = (const char *)v7;
    }
    else {
      id v8 = "";
    }
    size_t v9 = [v6 length];

    xpc_dictionary_set_data(v5, "cdMd", v8, v9);
  }
  CUXPCEncodeObject();
  id v10 = [*(id *)(a1 + 48) _ensureXPCStarted];
  id v11 = *(NSObject **)(*(void *)(a1 + 48) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __71__CBController_sendConversationDetectMessage_device_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v13 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v10, v2, v11, handler);
}

void __71__CBController_sendConversationDetectMessage_device_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)resetCBExtensionID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CBController_resetCBExtensionID_completionHandler___block_invoke;
  block[3] = &unk_1E5E322A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __53__CBController_resetCBExtensionID_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "RstE");
  id v3 = *(void **)(a1 + 40);
  id v4 = v2;
  id v5 = (const char *)[v3 UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "id", v5);
  }

  id v6 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __53__CBController_resetCBExtensionID_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v9 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v6, v4, v7, handler);
}

void __53__CBController_resetCBExtensionID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)updateIdentities:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CBController_updateIdentities_completion___block_invoke;
  block[3] = &unk_1E5E322A0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __44__CBController_updateIdentities_completion___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "UpId");
  xpc_object_t v3 = xpc_array_create(0, 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a1[4];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        [v9 encodeWithXPCObject:v10];
        xpc_array_append_value(v3, v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "idtA", v3);
  id v11 = [a1[5] _ensureXPCStarted];
  id v12 = *((void *)a1[5] + 11);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __44__CBController_updateIdentities_completion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v14 = a1[6];
  xpc_connection_send_message_with_reply(v11, v2, v12, handler);
}

void __44__CBController_updateIdentities_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (int)discoverableState
{
  return self->_discoverableState;
}

- (id)discoverableStateChangedHandler
{
  return self->_discoverableStateChangedHandler;
}

- (int)inquiryState
{
  return self->_inquiryState;
}

- (id)inquiryStateChangedHandler
{
  return self->_inquiryStateChangedHandler;
}

- (id)relayMessageHandler
{
  return self->_relayMessageHandler;
}

- (void)setRelayMessageHandler:(id)a3
{
}

- (id)tipiChangedHandler
{
  return self->_tipiChangedHandler;
}

- (void)setTipiChangedHandler:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAssertionFlags:(unsigned int)a3
{
  self->_uint64_t assertionFlags = a3;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_uint64_t internalFlags = a3;
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong(&self->_tipiChangedHandler, 0);
  objc_storeStrong(&self->_relayMessageHandler, 0);
  objc_storeStrong(&self->_inquiryStateChangedHandler, 0);
  objc_storeStrong(&self->_discoverableStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end