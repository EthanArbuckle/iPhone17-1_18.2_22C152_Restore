@interface HMServiceClient
+ (BOOL)supportsSecureCoding;
- (HMServiceClient)init;
- (HMServiceClient)initWithCoder:(id)a3;
- (NSArray)invalidAudiograms;
- (NSArray)validAudiograms;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)audiogramsAvailableHandler;
- (id)description;
- (id)deviceDiagnosticRecordFoundHandler;
- (id)deviceRecordChangedHandler;
- (id)fetchHearingModeDeviceRecordForIdentifier:(id)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)clientID;
- (unsigned)internalFlags;
- (void)_activate;
- (void)_interrupted;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)clientHMAvailableAudiograms:(id)a3 invalidAudiograms:(id)a4 error:(id)a5;
- (void)clientHMDeviceDiagnosticRecordFound:(id)a3;
- (void)clientHMDeviceRecordChanged:(id)a3;
- (void)clientHMDeviceRecordLost:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5;
- (void)invalidate;
- (void)modifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)occlusionIndicationShownForDeviceAddress:(id)a3 featureID:(int)a4 type:(int)a5 action:(int)a6;
- (void)setAudiogramsAvailableHandler:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDeviceDiagnosticRecordFoundHandler:(id)a3;
- (void)setDeviceRecordChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)triggerFetchAudiogramsWithCompletion:(id)a3;
- (void)triggerOnDemandDiagnosticCheckForDeviceIdentifier:(id)a3 completion:(id)a4;
@end

@implementation HMServiceClient

- (void)setInvalidationHandler:(id)a3
{
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void)setDeviceRecordChangedHandler:(id)a3
{
}

- (void)setAudiogramsAvailableHandler:(id)a3
{
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HMServiceClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_265361020;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (HMServiceClient)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMServiceClient *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clientID = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_internalFlags = 0;
    }
    id v6 = v5;
  }

  return v5;
}

- (void)clientHMAvailableAudiograms:(id)a3 invalidAudiograms:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = self;
  objc_sync_enter(v11);
  objc_storeStrong((id *)&v11->_validAudiograms, a3);
  objc_storeStrong((id *)&v11->_invalidAudiograms, a4);
  objc_sync_exit(v11);

  if (gLogCategory_HMServiceClient <= 90
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  audiogramsAvailableHandler = (void (**)(id, NSArray *, NSArray *, id))v11->_audiogramsAvailableHandler;
  if (audiogramsAvailableHandler) {
    audiogramsAvailableHandler[2](audiogramsAvailableHandler, v11->_validAudiograms, v11->_invalidAudiograms, v10);
  }
}

- (HMServiceClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)HMServiceClient;
  id v2 = [(HMServiceClient *)&v5 init];
  if (v2)
  {
    v2->_clientID = HMXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3 = v2;
  }

  return v2;
}

- (void)_activate
{
  if (self->_deviceDiagnosticRecordFoundHandler) {
    self->_internalFlags |= 1u;
  }
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HMServiceClient <= 90
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = (void (**)(void, void))MEMORY[0x253398200](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v3) {
      ((void (**)(void, id))v3)[2](v3, v9);
    }
  }
  else
  {
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t clientID = self->_clientID;
      LogPrintF();
    }
    objc_super v5 = [(HMServiceClient *)self _ensureXPCStarted];
    if (v5)
    {
      [(HMServiceClient *)self _reportError:v5];
    }
    else
    {
      xpcCnx = self->_xpcCnx;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __28__HMServiceClient__activate__block_invoke;
      v11[3] = &unk_265361478;
      v11[4] = self;
      v7 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v11];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __28__HMServiceClient__activate__block_invoke_2;
      v10[3] = &unk_265361478;
      v10[4] = self;
      [v7 clientActivate:self completion:v10];
    }
  }
}

- (id)_ensureXPCStarted
{
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270216978];
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  [v3 setClasses:v6 forSelector:sel_clientHMAvailableAudiograms_invalidAudiograms_error_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v6 forSelector:sel_clientHMAvailableAudiograms_invalidAudiograms_error_ argumentIndex:1 ofReply:0];
  if (!self->_xpcCnx)
  {
    v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.HearingModeService" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v7;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v3];
    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __36__HMServiceClient__ensureXPCStarted__block_invoke;
    v12[3] = &unk_265360FF8;
    v12[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__HMServiceClient__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_265360FF8;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v11];
    id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2702169D8];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t clientID = self->_clientID;
  id v7 = v4;
  if (clientID)
  {
    [v4 encodeInt64:clientID forKey:@"cid"];
    id v4 = v7;
  }
  uint64_t internalFlags = self->_internalFlags;
  if (internalFlags)
  {
    [v7 encodeInt64:internalFlags forKey:@"inf"];
    id v4 = v7;
  }
}

void __42__HMServiceClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    NSErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HMServiceClient <= 90
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    *(unsigned char *)(v2 + 8) = 1;
    uint64_t v3 = MEMORY[0x253398200](*(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v6 = *(void **)(a1 + 32);
    [v6 _activate];
  }
}

void __28__HMServiceClient__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (v5 = _LogCategory_Initialize(), id v4 = v10, v5))
      {
        id v9 = v4;
        LogPrintF();
        id v4 = v10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v9);
  }
  else
  {
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = (void (**)(void, void))MEMORY[0x253398200](*(void *)(*(void *)(a1 + 32) + 16));
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = 0;

    if (v6) {
      v6[2](v6, 0);
    }
  }
}

- (NSArray)validAudiograms
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_validAudiograms;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)invalidAudiograms
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_invalidAudiograms;
  objc_sync_exit(v2);

  return v3;
}

void __28__HMServiceClient__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_HMServiceClient <= 90)
  {
    if (gLogCategory_HMServiceClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);
}

uint64_t __36__HMServiceClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __36__HMServiceClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  int v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_HMServiceClient <= 50
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = NSErrorF();
  [(HMServiceClient *)self _reportError:v3];

  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    id v6 = (void (*)(void))*((void *)interruptionHandler + 2);
    v6();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HMServiceClient_invalidate__block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__HMServiceClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 25)
      && gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 40);
    if (v4)
    {
      [v4 invalidate];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    id v8 = (void (**)(id, void *))MEMORY[0x253398200](*(void *)(v3 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;

    if (v8)
    {
      uint64_t v7 = NSErrorF();
      v8[2](v8, v7);
    }
    [*(id *)(a1 + 32) _invalidated];
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_HMServiceClient <= 50
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v14 = (void (**)(id, void *))MEMORY[0x253398200](self->_activateCompletion, a2);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0;

      if (v14)
      {
        int v4 = NSErrorF();
        v14[2](v14, v4);
      }
      id audiogramsAvailableHandler = self->_audiogramsAvailableHandler;
      self->_id audiogramsAvailableHandler = 0;

      id deviceRecordChangedHandler = self->_deviceRecordChangedHandler;
      self->_id deviceRecordChangedHandler = 0;

      id interruptionHandler = self->_interruptionHandler;
      self->_id interruptionHandler = 0;

      invalidAudiograms = self->_invalidAudiograms;
      self->_invalidAudiograms = 0;

      validAudiograms = self->_validAudiograms;
      self->_validAudiograms = 0;

      id v10 = (void (**)(void))MEMORY[0x253398200](self->_invalidationHandler);
      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      if (v10) {
        v10[2](v10);
      }
      [(NSMutableDictionary *)self->_recordMap removeAllObjects];
      recordMap = self->_recordMap;
      self->_recordMap = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_HMServiceClient <= 10
        && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_reportError:(id)a3
{
  id v6 = a3;
  if (gLogCategory_HMServiceClient <= 90
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v4 = (void (**)(void, void))MEMORY[0x253398200](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v6);
  }
}

- (id)fetchHearingModeDeviceRecordForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_recordMap objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (gLogCategory_HMServiceClient <= 30
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v6;
}

- (void)fetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__HMServiceClient_fetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke;
  v13[3] = &unk_2653614F0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  int v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(dispatchQueue, v13);
}

void __80__HMServiceClient_fetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[24])
  {
    NSErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HMServiceClient <= 90
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
  }
  else
  {
    uint64_t v3 = [v2 _ensureXPCStarted];
    if (v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (gLogCategory_HMServiceClient <= 30
        && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v4 = *(void **)(*(void *)(a1 + 32) + 40);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __80__HMServiceClient_fetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke_2;
      v11[3] = &unk_2653614A0;
      id v12 = *(id *)(a1 + 48);
      uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v11];
      uint64_t v6 = *(unsigned int *)(a1 + 56);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __80__HMServiceClient_fetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke_3;
      v9[3] = &unk_2653614C8;
      uint64_t v7 = *(void *)(a1 + 40);
      id v10 = *(id *)(a1 + 48);
      [v5 clientFetchOcclusionResultForDeviceIdentifier:v7 featureID:v6 completion:v9];
    }
  }
}

uint64_t __80__HMServiceClient_fetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__HMServiceClient_fetchOcclusionResultForDeviceIdentifier_featureID_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4
    && gLogCategory_HMServiceClient <= 90
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (void)modifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke;
  v15[3] = &unk_265361518;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

void __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v3 = NSErrorF();
    id v14 = (id)v3;
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = (uint64_t)v14, v4))
      {
        LogPrintF();
        uint64_t v3 = (uint64_t)v14;
      }
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v3);
  }
  else
  {
    if (gLogCategory_HMServiceClient <= 30)
    {
      if (gLogCategory_HMServiceClient != -1 || (v5 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v5))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v11 = *(unsigned int *)(v2 + 64);
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    uint64_t v6 = objc_msgSend((id)v2, "_ensureXPCStarted", v11, v12, v13);
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 40);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke_2;
      v17[3] = &unk_2653614A0;
      id v18 = *(id *)(a1 + 56);
      id v8 = [v7 remoteObjectProxyWithErrorHandler:v17];
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke_3;
      v15[3] = &unk_2653614A0;
      id v16 = *(id *)(a1 + 56);
      [v8 clientModifyDeviceConfig:v9 identifier:v10 completion:v15];
    }
  }
}

uint64_t __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (gLogCategory_HMServiceClient <= 90)
  {
    if (gLogCategory_HMServiceClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
    {
      LogPrintF();
      id v3 = v7;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    id v3 = v7;
  }
  return MEMORY[0x270F9A758](v5, v3);
}

uint64_t __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    id v3 = v7;
  }
  return MEMORY[0x270F9A758](v5, v3);
}

- (void)occlusionIndicationShownForDeviceAddress:(id)a3 featureID:(int)a4 type:(int)a5 action:(int)a6
{
  id v10 = a3;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__HMServiceClient_occlusionIndicationShownForDeviceAddress_featureID_type_action___block_invoke;
  v13[3] = &unk_265361540;
  v13[4] = self;
  id v14 = v10;
  int v15 = a4;
  int v16 = a5;
  int v17 = a6;
  id v12 = v10;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __82__HMServiceClient_occlusionIndicationShownForDeviceAddress_featureID_type_action___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[24])
  {
    uint64_t v3 = NSErrorF();
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v3 = [v2 _ensureXPCStarted];
    uint64_t v4 = v3;
    if (!v3)
    {
      uint64_t v7 = 0;
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
      [v5 clientSetOcclusionIndicationShownForDeviceAddress:*(void *)(a1 + 40) featureID:*(unsigned int *)(a1 + 48) type:*(unsigned int *)(a1 + 52) action:*(unsigned int *)(a1 + 56)];

      goto LABEL_10;
    }
  }
  if (gLogCategory_HMServiceClient <= 90)
  {
    uint64_t v7 = v4;
    if (gLogCategory_HMServiceClient != -1 || (v3 = _LogCategory_Initialize(), uint64_t v4 = v7, v3))
    {
      uint64_t v3 = LogPrintF();
LABEL_10:
      uint64_t v4 = v7;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)triggerFetchAudiogramsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMServiceClient_triggerFetchAudiogramsWithCompletion___block_invoke;
  v7[3] = &unk_265361020;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __56__HMServiceClient_triggerFetchAudiogramsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[24])
  {
    uint64_t v3 = NSErrorF();
    id v9 = (id)v3;
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (int v5 = _LogCategory_Initialize(), v3 = (uint64_t)v9, v5))
      {
        LogPrintF();
        uint64_t v3 = (uint64_t)v9;
      }
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
  }
  else
  {
    id v4 = [v2 _ensureXPCStarted];
    if (v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (gLogCategory_HMServiceClient <= 30
        && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v6 = *(void **)(*(void *)(a1 + 32) + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __56__HMServiceClient_triggerFetchAudiogramsWithCompletion___block_invoke_2;
      v12[3] = &unk_2653614A0;
      id v13 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v12];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__HMServiceClient_triggerFetchAudiogramsWithCompletion___block_invoke_3;
      v10[3] = &unk_2653614A0;
      uint64_t v8 = *(void *)(a1 + 32);
      id v11 = *(id *)(a1 + 40);
      [v7 clientTriggerFetchAudiograms:v8 completion:v10];
    }
  }
}

uint64_t __56__HMServiceClient_triggerFetchAudiogramsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__HMServiceClient_triggerFetchAudiogramsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3
    && gLogCategory_HMServiceClient <= 90
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (void)triggerOnDemandDiagnosticCheckForDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke;
  block[3] = &unk_265361568;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[24])
  {
    uint64_t v3 = NSErrorF();
    id v9 = (id)v3;
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (int v5 = _LogCategory_Initialize(), v3 = (uint64_t)v9, v5))
      {
        LogPrintF();
        uint64_t v3 = (uint64_t)v9;
      }
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3);
  }
  else
  {
    id v4 = [v2 _ensureXPCStarted];
    if (v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (gLogCategory_HMServiceClient <= 30
        && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v6 = *(void **)(*(void *)(a1 + 32) + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke_2;
      v12[3] = &unk_2653614A0;
      id v13 = *(id *)(a1 + 48);
      id v7 = [v6 remoteObjectProxyWithErrorHandler:v12];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke_3;
      v10[3] = &unk_2653614A0;
      uint64_t v8 = *(void *)(a1 + 40);
      id v11 = *(id *)(a1 + 48);
      [v7 clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier:v8 completion:v10];
    }
  }
}

uint64_t __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    id v3 = v7;
  }
  return MEMORY[0x270F9A758](v5, v3);
}

- (void)clientHMDeviceRecordChanged:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v9 bluetoothUUID];
  if (v5)
  {
    recordMap = v4->_recordMap;
    if (!recordMap)
    {
      id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v8 = v4->_recordMap;
      v4->_recordMap = v7;

      recordMap = v4->_recordMap;
    }
    [(NSMutableDictionary *)recordMap setObject:v9 forKeyedSubscript:v5];

    objc_sync_exit(v4);
    if (v4->_deviceRecordChangedHandler)
    {
      if (gLogCategory_HMServiceClient <= 30
        && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, id))v4->_deviceRecordChangedHandler + 2))(v4->_deviceRecordChangedHandler, v9);
    }
    else if (gLogCategory_HMServiceClient <= 10 {
           && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)clientHMDeviceRecordLost:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v6 bluetoothUUID];
  if (v5)
  {
    [(NSMutableDictionary *)v4->_recordMap setObject:0 forKeyedSubscript:v5];

    objc_sync_exit(v4);
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)clientHMDeviceDiagnosticRecordFound:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiagnosticRecordFoundHandler)
  {
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, id))self->_deviceDiagnosticRecordFoundHandler + 2))(self->_deviceDiagnosticRecordFoundHandler, v4);
  }
  else if (gLogCategory_HMServiceClient <= 10 {
         && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (id)audiogramsAvailableHandler
{
  return self->_audiogramsAvailableHandler;
}

- (id)deviceRecordChangedHandler
{
  return self->_deviceRecordChangedHandler;
}

- (id)deviceDiagnosticRecordFoundHandler
{
  return self->_deviceDiagnosticRecordFoundHandler;
}

- (void)setDeviceDiagnosticRecordFoundHandler:(id)a3
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

- (void)setInternalFlags:(unsigned int)a3
{
  self->_uint64_t internalFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceDiagnosticRecordFoundHandler, 0);
  objc_storeStrong(&self->_deviceRecordChangedHandler, 0);
  objc_storeStrong(&self->_audiogramsAvailableHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_validAudiograms, 0);
  objc_storeStrong((id *)&self->_invalidAudiograms, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_recordMap, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end