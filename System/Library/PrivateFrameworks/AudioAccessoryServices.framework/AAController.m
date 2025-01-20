@interface AAController
- (AAController)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)conversationDetectMessageHandler;
- (id)description;
- (id)deviceInfoChangeHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)multimodalContextMessageHandler;
- (id)pmeConfigMessageHandler;
- (unsigned)clientID;
- (unsigned)coreBluetoothInternalFlag;
- (void)_activate;
- (void)_activateXPC:(BOOL)a3;
- (void)_activateXPCCompleted:(id)a3;
- (void)_conversationDetectMessageReceived:(id)a3 fromDevice:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_multimodalContextMessageReceived:(id)a3 fromDevice:(id)a4;
- (void)_pmeConfigDataReceived:(id)a3 fromDevice:(id)a4;
- (void)_sendAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 destinationIdentifier:(id)a5 completionHandler:(id)a6;
- (void)_sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_xpcReceivedAccessoryEvent:(id)a3;
- (void)_xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendGetTipiTableMessageToDestinationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)sendMultimodalContextMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendPMEConfigData:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setClientID:(unsigned int)a3;
- (void)setConversationDetectMessageHandler:(id)a3;
- (void)setCoreBluetoothInternalFlag:(unsigned int)a3;
- (void)setDeviceInfoChangeHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMultimodalContextMessageHandler:(id)a3;
- (void)setPmeConfigMessageHandler:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation AAController

- (AAController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAController;
  v2 = [(AAController *)&v5 init];
  if (v2)
  {
    v2->_clientID = AAXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v2->_coreBluetoothInternalFlag = 0x2000;
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

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
    uint64_t v6 = MEMORY[0x24C581450](v4);
    id activateCompletion = v5->_activateCompletion;
    v5->_id activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__AAController_activateWithCompletion___block_invoke;
    block[3] = &unk_26523F8D0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __39__AAController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController <= 90 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v3 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v3) {
      ((void (**)(void, id))v3)[2](v3, v5);
    }
  }
  else
  {
    [(AAController *)self _activateXPC:0];
  }
}

- (void)_activateXPC:(BOOL)a3
{
  if (a3)
  {
    if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (gLogCategory_AAController <= 30 {
         && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = v4;
  uint64_t coreBluetoothInternalFlag = self->_coreBluetoothInternalFlag;
  if (coreBluetoothInternalFlag) {
    xpc_dictionary_set_uint64(v4, "intF", coreBluetoothInternalFlag);
  }
  xpc_dictionary_set_string(v5, "mTyp", "CtrA");
  v7 = [(AAController *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __29__AAController__activateXPC___block_invoke;
  handler[3] = &unk_26523FA58;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v7, v5, dispatchQueue, handler);
}

uint64_t __29__AAController__activateXPC___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4 = a3;
  id v5 = CUXPCDecodeNSErrorIfNeeded();
  if (v5)
  {
    if (gLogCategory_AAController <= 90 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    {
      v11 = CUPrintNSError();
      LogPrintF();
    }
    v7 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v7) {
      ((void (**)(void, void *))v7)[2](v7, v5);
    }
  }
  else
  {
    xpc_dictionary_get_array(v4, "aaDD");
    uint64_t v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __38__AAController__activateXPCCompleted___block_invoke;
      applier[3] = &unk_26523FA80;
      applier[4] = self;
      xpc_array_apply(v6, applier);
    }
    if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v9 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
    id v10 = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v9) {
      v9[2](v9, 0);
    }
  }
}

BOOL __38__AAController__activateXPCCompleted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x24C581450](*(void *)(*(void *)(a1 + 32) + 56));
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }

  return v6 != 0;
}

- (id)_ensureXPCStarted
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcCnx;
  if (!v2->_xpcCnx)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)v2->_dispatchQueue, 0);

    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __33__AAController__ensureXPCStarted__block_invoke;
    v6[3] = &unk_26523FAA8;
    v3 = mach_service;
    v7 = v3;
    v8 = v2;
    xpc_connection_set_event_handler(v3, v6);
    xpc_connection_activate(v3);
  }
  objc_sync_exit(v2);

  return v3;
}

void *__33__AAController__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[4]) {
    return (void *)[result xpcReceivedMessage:a2];
  }
  return result;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = MEMORY[0x24C581450](self->_interruptionHandler);
    id v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    if (self->_activateCalled)
    {
      [(AAController *)self _activateXPC:1];
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__AAController_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__AAController_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = *(id *)(v2 + 32);
    objc_sync_enter(v3);
    id v4 = (_xpc_connection_s *)*(id *)(*(void *)(v2 + 32) + 32);
    uint64_t v5 = v4;
    if (v4) {
      xpc_connection_cancel(v4);
    }

    objc_sync_exit(v3);
    uint64_t v6 = *(void **)(v2 + 32);
    return [v6 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      id conversationDetectMessageHandler = v3->_conversationDetectMessageHandler;
      v3->_id conversationDetectMessageHandler = 0;

      id deviceInfoChangeHandler = v3->_deviceInfoChangeHandler;
      v3->_id deviceInfoChangeHandler = 0;

      id multimodalContextMessageHandler = v3->_multimodalContextMessageHandler;
      v3->_id multimodalContextMessageHandler = 0;

      id pmeConfigMessageHandler = v3->_pmeConfigMessageHandler;
      v3->_id pmeConfigMessageHandler = 0;

      id interruptionHandler = v3->_interruptionHandler;
      v3->_id interruptionHandler = 0;

      uint64_t v13 = MEMORY[0x24C581450](v3->_invalidationHandler);
      id invalidationHandler = v3->_invalidationHandler;
      v3->_id invalidationHandler = 0;

      uint64_t v12 = v13;
      if (v13)
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t))(v13 + 16))(v13);
        uint64_t v12 = v13;
      }
      self->_invalidateDone = 1;
      if (gLogCategory_AAController <= 30)
      {
        if (gLogCategory_AAController != -1 || (uint64_t v11 = _LogCategory_Initialize(), v12 = v13, v11))
        {
          uint64_t v11 = LogPrintF();
          uint64_t v12 = v13;
        }
      }
      MEMORY[0x270F9A758](v11, v12);
    }
  }
}

- (void)sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__AAController_sendConversationDetectMessage_destinationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26523FAD0;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __86__AAController_sendConversationDetectMessage_destinationIdentifier_completionHandler___block_invoke(void *a1)
{
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];

  return [v2 _sendAccessoryEventMessage:v4 eventType:2 destinationIdentifier:v3 completionHandler:v5];
}

- (void)sendMultimodalContextMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__AAController_sendMultimodalContextMessage_destinationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26523FAD0;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __85__AAController_sendMultimodalContextMessage_destinationIdentifier_completionHandler___block_invoke(void *a1)
{
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];

  return [v2 _sendAccessoryEventMessage:v4 eventType:4 destinationIdentifier:v3 completionHandler:v5];
}

- (void)sendPMEConfigData:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__AAController_sendPMEConfigData_destinationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26523FAD0;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __74__AAController_sendPMEConfigData_destinationIdentifier_completionHandler___block_invoke(void *a1)
{
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];

  return [v2 _sendAccessoryEventMessage:v4 eventType:5 destinationIdentifier:v3 completionHandler:v5];
}

- (void)sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__AAController_sendDeviceConfig_destinationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26523FAD0;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __73__AAController_sendDeviceConfig_destinationIdentifier_completionHandler___block_invoke(void *a1)
{
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];

  return [v2 _sendDeviceConfig:v4 destinationIdentifier:v3 completionHandler:v5];
}

- (void)sendGetTipiTableMessageToDestinationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__AAController_sendGetTipiTableMessageToDestinationIdentifier_completionHandler___block_invoke;
  block[3] = &unk_26523FAF8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __81__AAController_sendGetTipiTableMessageToDestinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = [@"Send getTipiTable message" dataUsingEncoding:4];
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:", v3, 6, *(void *)(a1 + 32), *(void *)(a1 + 48), v2);
}

- (void)_sendAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 destinationIdentifier:(id)a5 completionHandler:(id)a6
{
  unsigned int v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize()) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (!v11)
  {
    NSErrorF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize()) {
      goto LABEL_16;
    }
LABEL_15:
    v28 = CUPrintNSError();
    LogPrintF();

LABEL_16:
    v12[2](v12, v13);
    goto LABEL_17;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFEF20]);
  [v13 setIdentifier:v11];
  [v13 dictionaryRepresentation];
  id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "mTyp", "SnAE");
  xpc_dictionary_set_uint64(v15, "acET", v8);
  if (v10)
  {
    id v16 = v10;
    id v17 = v15;
    id v18 = v16;
    uint64_t v19 = [v18 bytes];
    v20 = "";
    if (v19) {
      v20 = (const char *)v19;
    }
    bytes = v20;
    id v21 = v10;
    id v22 = v13;
    v23 = v14;
    uint64_t v24 = [v18 length];

    size_t v25 = v24;
    id v14 = v23;
    id v13 = v22;
    id v10 = v21;
    xpc_dictionary_set_data(v17, "acMd", bytes, v25);
  }
  xpc_dictionary_set_value(v15, "dstD", v14);
  v26 = [(AAController *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __93__AAController__sendAccessoryEventMessage_eventType_destinationIdentifier_completionHandler___block_invoke;
  handler[3] = &unk_26523FB20;
  v31 = v12;
  xpc_connection_send_message_with_reply(v26, v15, dispatchQueue, handler);

LABEL_17:
}

void __93__AAController__sendAccessoryEventMessage_eventType_destinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
    goto LABEL_4;
  }
  if (!v9)
  {
    NSErrorF();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
LABEL_4:
    id v12 = CUPrintNSError();
    LogPrintF();

LABEL_11:
    v10[2](v10, v11);
    goto LABEL_12;
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFEF20]);
  [v11 setIdentifier:v9];
  [v11 dictionaryRepresentation];
  id v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "mTyp", "SnAC");
  xpc_dictionary_set_value(v14, "acMd", v8);
  xpc_dictionary_set_value(v14, "dstD", v13);
  xpc_object_t v15 = [(AAController *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __74__AAController__sendDeviceConfig_destinationIdentifier_completionHandler___block_invoke;
  handler[3] = &unk_26523FB20;
  id v18 = v10;
  xpc_connection_send_message_with_reply(v15, v14, dispatchQueue, handler);

LABEL_12:
}

void __74__AAController__sendDeviceConfig_destinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (gLogCategory_AAController <= 10)
  {
    if (gLogCategory_AAController != -1 || (int v5 = _LogCategory_Initialize(), v4 = v15, v5))
    {
      id v13 = CUPrintXPC();
      LogPrintF();

      id v4 = v15;
    }
  }
  if (MEMORY[0x24C581700](v4) == MEMORY[0x263EF8708])
  {
    [(AAController *)self _xpcReceivedMessage:v15];
  }
  else if (v15 == (id)MEMORY[0x263EF86A0])
  {
    [(AAController *)self _interrupted];
  }
  else if (v15 == (id)MEMORY[0x263EF86A8])
  {
    if (!self->_invalidateCalled
      && gLogCategory_AAController <= 90
      && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    {
      xpc_connection_copy_invalidation_reason();
      LogPrintF();
    }
    id v11 = self;
    objc_sync_enter(v11);
    xpcCnx = v11->_xpcCnx;
    v11->_xpcCnx = 0;

    objc_sync_exit(v11);
    [(AAController *)v11 _invalidated];
  }
  else
  {
    id v6 = CUXPCDecodeNSErrorIfNeeded();
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      NSErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v8;

    if (gLogCategory_AAController <= 90 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    {
      id v10 = CUPrintNSError();
      xpc_object_t v14 = CUPrintXPC();
      LogPrintF();
    }
  }
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v6 = a3;
  string = xpc_dictionary_get_string(v6, "mTyp");
  if (!string)
  {
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize()) {
      goto LABEL_15;
    }
LABEL_9:
    LogPrintF();
    goto LABEL_15;
  }
  int v5 = string;
  if (!strcmp(string, "AcRc"))
  {
    [(AAController *)self _xpcReceivedAccessoryEvent:v6];
    goto LABEL_15;
  }
  if (!strcmp(v5, "AcIC"))
  {
    [(AAController *)self _xpcReceivedAudioAccessoryDeviceInfoChange:v6];
    goto LABEL_15;
  }
  if (gLogCategory_AAController <= 10 && (gLogCategory_AAController != -1 || _LogCategory_Initialize())) {
    goto LABEL_9;
  }
LABEL_15:
}

- (void)_xpcReceivedAccessoryEvent:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy_;
  xpc_object_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__AAController__xpcReceivedAccessoryEvent___block_invoke;
  v9[3] = &unk_26523FB48;
  v9[4] = &v10;
  id v4 = (void (**)(void))MEMORY[0x24C581450](v9);
  if (MEMORY[0x24C581700](v3) == MEMORY[0x263EF8708])
  {
    objc_opt_class();
    CUXPCDecodeObject();
    id v5 = 0;
    id v8 = CUPrintNSError();
    uint64_t v6 = NSPrintF_safe();
    id v7 = (void *)v11[5];
    v11[5] = v6;
  }
  else
  {
    id v5 = (id)v11[5];
    v11[5] = @"non-dict message";
  }

  v4[2](v4);
  _Block_object_dispose(&v10, 8);
}

uint64_t __43__AAController__xpcReceivedAccessoryEvent___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

- (void)_xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__AAController__xpcReceivedAudioAccessoryDeviceInfoChange___block_invoke;
  v11[3] = &unk_26523FB48;
  v11[4] = &v12;
  id v5 = (void (**)(void))MEMORY[0x24C581450](v11);
  uint64_t v6 = MEMORY[0x24C581700](v4);
  uint64_t v7 = MEMORY[0x263EF8708];
  if (v6 == MEMORY[0x263EF8708])
  {
    id v8 = xpc_dictionary_get_value(v4, "aaID");
    if (MEMORY[0x24C581700]() == v7)
    {
      uint64_t v9 = MEMORY[0x24C581450](self->_deviceInfoChangeHandler);
      uint64_t v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
      }
    }
    else
    {
      uint64_t v10 = (void *)v13[5];
      v13[5] = @"missing key for AADeviceInfo";
    }
  }
  else
  {
    id v8 = (void *)v13[5];
    v13[5] = @"non-dict message";
  }

  v5[2](v5);
  _Block_object_dispose(&v12, 8);
}

uint64_t __59__AAController__xpcReceivedAudioAccessoryDeviceInfoChange___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

- (void)_conversationDetectMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__AAController__conversationDetectMessageReceived_fromDevice___block_invoke;
  v15[3] = &unk_26523FB48;
  void v15[4] = &v16;
  id v8 = (void (**)(void))MEMORY[0x24C581450](v15);
  if (gLogCategory_AAController <= 10 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = CUPrintNSDataHex();
    LogPrintF();
  }
  uint64_t v9 = (void (**)(void, void, void))MEMORY[0x24C581450](self->_conversationDetectMessageHandler);
  if (v9)
  {
    uint64_t v10 = [v7 identifier];
    if (v10)
    {
      ((void (**)(void, void *, id))v9)[2](v9, v10, v6);
    }
    else
    {
      id v13 = CUPrintNSError();
      uint64_t v11 = NSPrintF_safe();
      uint64_t v12 = (void *)v17[5];
      v17[5] = v11;
    }
  }

  v8[2](v8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __62__AAController__conversationDetectMessageReceived_fromDevice___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

- (void)_multimodalContextMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__AAController__multimodalContextMessageReceived_fromDevice___block_invoke;
  v15[3] = &unk_26523FB48;
  void v15[4] = &v16;
  id v8 = (void (**)(void))MEMORY[0x24C581450](v15);
  if (gLogCategory_AAController <= 10 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = CUPrintNSDataHex();
    LogPrintF();
  }
  uint64_t v9 = (void (**)(void, void, void))MEMORY[0x24C581450](self->_multimodalContextMessageHandler);
  if (v9)
  {
    uint64_t v10 = [v7 identifier];
    if (v10)
    {
      ((void (**)(void, void *, id))v9)[2](v9, v10, v6);
    }
    else
    {
      id v13 = CUPrintNSError();
      uint64_t v11 = NSPrintF_safe();
      uint64_t v12 = (void *)v17[5];
      v17[5] = v11;
    }
  }

  v8[2](v8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __61__AAController__multimodalContextMessageReceived_fromDevice___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

- (void)_pmeConfigDataReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__AAController__pmeConfigDataReceived_fromDevice___block_invoke;
  v15[3] = &unk_26523FB48;
  void v15[4] = &v16;
  id v8 = (void (**)(void))MEMORY[0x24C581450](v15);
  if (gLogCategory_AAController <= 10 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = CUPrintNSDataHex();
    LogPrintF();
  }
  uint64_t v9 = (void (**)(void, void, void))MEMORY[0x24C581450](self->_pmeConfigMessageHandler);
  if (v9)
  {
    uint64_t v10 = [v7 identifier];
    if (v10)
    {
      ((void (**)(void, void *, id))v9)[2](v9, v10, v6);
    }
    else
    {
      id v13 = CUPrintNSError();
      uint64_t v11 = NSPrintF_safe();
      uint64_t v12 = (void *)v17[5];
      v17[5] = v11;
    }
  }

  v8[2](v8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __50__AAController__pmeConfigDataReceived_fromDevice___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

- (id)conversationDetectMessageHandler
{
  return self->_conversationDetectMessageHandler;
}

- (void)setConversationDetectMessageHandler:(id)a3
{
}

- (id)deviceInfoChangeHandler
{
  return self->_deviceInfoChangeHandler;
}

- (void)setDeviceInfoChangeHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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

- (id)multimodalContextMessageHandler
{
  return self->_multimodalContextMessageHandler;
}

- (void)setMultimodalContextMessageHandler:(id)a3
{
}

- (id)pmeConfigMessageHandler
{
  return self->_pmeConfigMessageHandler;
}

- (void)setPmeConfigMessageHandler:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (unsigned)coreBluetoothInternalFlag
{
  return self->_coreBluetoothInternalFlag;
}

- (void)setCoreBluetoothInternalFlag:(unsigned int)a3
{
  self->_uint64_t coreBluetoothInternalFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pmeConfigMessageHandler, 0);
  objc_storeStrong(&self->_multimodalContextMessageHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceInfoChangeHandler, 0);
  objc_storeStrong(&self->_conversationDetectMessageHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end