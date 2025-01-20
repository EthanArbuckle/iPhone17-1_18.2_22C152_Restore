@interface CBConnection
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (BOOL)_processReadStatus;
- (BOOL)_runConnectStart;
- (BOOL)_runSetupChannel;
- (BOOL)_setupIOAndReturnError:(id *)a3;
- (BOOL)_startConnectingAndReturnError:(id *)a3;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (BOOL)updateWithXPCSubscriberInfo:(id)a3;
- (CBConnection)init;
- (CBConnection)initWithXPCEventRepresentation:(id)a3 error:(id *)a4;
- (CBConnection)initWithXPCObject:(id)a3 error:(id *)a4;
- (CBDevice)peerDevice;
- (CBDevice)remoteDevice;
- (CBL2CAPChannel)l2capChannel;
- (CBServer)server;
- (NSArray)serviceUUIDs;
- (NSArray)useCaseClientIDs;
- (NSString)clientBundleID;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcListenerEndpoint;
- (double)connectTimeoutSeconds;
- (double)connectedTime;
- (id)_ensureXPCStarted;
- (id)bluetoothStateChangedHandler;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)pairingCompletedHandler;
- (id)pairingPromptHandler;
- (id)serverInvalidationHandler;
- (id)xpcForwardMessageReceiveHandler;
- (id)xpcSendEventHandler;
- (int64_t)bluetoothState;
- (int64_t)clientUseCase;
- (int64_t)connectionLatency;
- (int64_t)connectionScanDutyCycle;
- (unsigned)blePSM;
- (unsigned)clientID;
- (unsigned)connectionFlags;
- (unsigned)internalFlags;
- (unsigned)serviceFlags;
- (unsigned)useCase;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_activateXPCCompleted:(id)a3;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_completeReadRequest:(id)a3 error:(id)a4;
- (void)_completeWriteRequest:(id)a3 error:(id)a4;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_pairWithOOBData:(id)a3;
- (void)_pairingGenerateOOBDataWithCompletionHandler:(id)a3;
- (void)_pairingPerformActionBLE:(int)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)_pairingPerformActionClassic:(int)a3 completionHandler:(id)a4;
- (void)_pairingPerformActionClassic:(int)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)_pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)_prepareReadRequest:(id)a3;
- (void)_processReads:(BOOL)a3;
- (void)_processWrites;
- (void)_reportError:(id)a3;
- (void)_run;
- (void)_xpcReceivedMessage:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)disconnectWithCompletion:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)invalidate;
- (void)pairWithOOBData:(id)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)pairingGenerateOOBDataWithCompletionHandler:(id)a3;
- (void)pairingPerformAction:(int)a3 completionHandler:(id)a4;
- (void)pairingPerformAction:(int)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)readWithCBReadRequest:(id)a3;
- (void)readWithRequest:(id)a3;
- (void)setBlePSM:(unsigned __int16)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setClientUseCase:(int64_t)a3;
- (void)setConnectTimeoutSeconds:(double)a3;
- (void)setConnectedTime:(double)a3;
- (void)setConnectionFlags:(unsigned int)a3;
- (void)setConnectionLatency:(int64_t)a3;
- (void)setConnectionScanDutyCycle:(int64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setL2capChannel:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPairingCompletedHandler:(id)a3;
- (void)setPairingPromptHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setServer:(id)a3;
- (void)setServerInvalidationHandler:(id)a3;
- (void)setServiceFlags:(unsigned int)a3;
- (void)setServiceUUIDs:(id)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)setUseCaseClientIDs:(id)a3;
- (void)setXpcForwardMessageReceiveHandler:(id)a3;
- (void)setXpcListenerEndpoint:(id)a3;
- (void)setXpcSendEventHandler:(id)a3;
- (void)writeEndOfDataWithCompletion:(id)a3;
- (void)writeWithCBWriteRequest:(id)a3;
- (void)writeWithRequest:(id)a3;
- (void)xpcForwardMessage:(id)a3;
- (void)xpcReceivedForwardedEvent:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
- (void)xpcReceivedPairingCompleted:(id)a3;
- (void)xpcReceivedPairingPrompt:(id)a3;
@end

@implementation CBConnection

- (CBConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)CBConnection;
  v2 = [(CBConnection *)&v5 init];
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    v2->_connectionLatency = -99;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CBConnection;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v4 = (CBConnection *)CUFatalErrorF();
    [(CBConnection *)v4 initWithXPCObject:v6 error:v7];
  }
  else
  {
    ucat = self->_ucat;
    if (ucat)
    {
      if ((ucat->var3 & 0x40000) != 0)
      {
        LogCategory_Remove();
        self->_ucat = 0;
      }
    }
    v8.receiver = self;
    v8.super_class = (Class)CBConnection;
    [(CBConnection *)&v8 dealloc];
  }
}

- (CBConnection)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = [(CBConnection *)self init];
  if (!v13)
  {
    if (!a4) {
      goto LABEL_35;
    }
    v23 = "CBConnection init failed";
LABEL_34:
    CBErrorF(-6756, (uint64_t)v23, v7, v8, v9, v10, v11, v12, v24);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (!a4) {
      goto LABEL_35;
    }
    v23 = "XPC non-dict";
    goto LABEL_34;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v13->_clientID = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_35;
  }
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_connectionFlags = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_35;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_35;
  }
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_internalFlags = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_35;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_35;
  }
  int v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v13->_blePSM = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_35;
  }
  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v13->_serviceFlags = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_35;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_35;
  }
  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v13->_socketFD = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_35;
  }
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_useCase = 0;
    goto LABEL_27;
  }
  if (v20 == 5)
  {
LABEL_35:
    v21 = 0;
    goto LABEL_29;
  }
LABEL_27:
  if (!CUXPCDecodeNSArrayOfNSString()) {
    goto LABEL_35;
  }
  v21 = v13;
LABEL_29:

  return v21;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  uint64_t clientID = self->_clientID;
  xpc_object_t xdict = v4;
  if (clientID) {
    xpc_dictionary_set_uint64(v4, "cid", clientID);
  }
  uint64_t connectionFlags = self->_connectionFlags;
  if (connectionFlags) {
    xpc_dictionary_set_uint64(xdict, "CnFl", connectionFlags);
  }
  double connectTimeoutSeconds = self->_connectTimeoutSeconds;
  if (connectTimeoutSeconds != 0.0) {
    xpc_dictionary_set_double(xdict, "cnTO", connectTimeoutSeconds);
  }
  uint64_t internalFlags = self->_internalFlags;
  if (internalFlags) {
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  }
  CUXPCEncodeObject();
  if (self->_blePSM) {
    xpc_dictionary_set_uint64(xdict, "psm", self->_blePSM);
  }
  uint64_t serviceFlags = self->_serviceFlags;
  if (serviceFlags) {
    xpc_dictionary_set_uint64(xdict, "svFl", serviceFlags);
  }
  CUXPCEncodeObject();
  int64_t socketFD = self->_socketFD;
  if (socketFD) {
    xpc_dictionary_set_int64(xdict, "sFD", socketFD);
  }
  uint64_t useCase = self->_useCase;
  if (useCase) {
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  }
  CUXPCEncodeNSArrayOfNSString();
}

- (NSString)description
{
  blePeerUUID = self->_blePeerUUID;
  if (blePeerUUID)
  {
    id v4 = blePeerUUID;
  }
  else
  {
    SEL v5 = [(CBL2CAPChannel *)self->_l2capChannel peer];
    id v6 = [v5 identifier];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = v6;
    }
    else
    {
      uint64_t v8 = [(CBDevice *)self->_peerDevice identifier];
    }
    id v4 = v8;
  }
  NSAppendPrintF_safe();
  id v9 = 0;
  uint64_t v10 = v9;
  if (self->_blePSM)
  {
    v37 = v9;
    NSAppendPrintF_safe();
    id v11 = v37;

    uint64_t v10 = v11;
  }
  if (self->_connectionFlags)
  {
    v32 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v12 = v10;

    uint64_t v10 = v12;
  }
  int64_t connectionLatency = self->_connectionLatency;
  if (connectionLatency != -99)
  {
    CBCentralManagerConnectionLatencyToString(connectionLatency);
    NSAppendPrintF_safe();
    id v14 = v10;

    uint64_t v10 = v14;
  }
  if (self->_serviceFlags)
  {
    v33 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v15 = v10;

    uint64_t v10 = v15;
  }
  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
  {
    v34 = remoteDevice;
    NSAppendPrintF_safe();
    id v17 = v10;

    uint64_t v10 = v17;
  }
  if (self->_connectTimeoutSeconds != 0.0)
  {
    NSAppendPrintF_safe();
    id v18 = v10;

    uint64_t v10 = v18;
  }
  serviceUUIDs = self->_serviceUUIDs;
  if (serviceUUIDs)
  {
    int v20 = serviceUUIDs;
    v35 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v21 = v10;

    uint64_t v10 = v21;
  }
  if (self->_socketFD)
  {
    NSAppendPrintF_safe();
    id v22 = v10;

    uint64_t v10 = v22;
  }
  if (self->_useCase)
  {
    NSAppendPrintF_safe();
    id v24 = v10;

    uint64_t v10 = v24;
  }
  useCaseClientIDs = self->_useCaseClientIDs;
  if (useCaseClientIDs)
  {
    v26 = useCaseClientIDs;
    v36 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v27 = v10;

    uint64_t v10 = v27;
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_queue_get_label(dispatchQueue);
    v29 = dispatchQueue;
    NSAppendPrintF_safe();
    id v30 = v10;

    uint64_t v10 = v30;
  }

  return (NSString *)v10;
}

- (CBConnection)initWithXPCEventRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = [(CBConnection *)self init];
  if (!v13)
  {
    if (a4)
    {
      v26 = "CBConnection init failed";
LABEL_20:
      CBErrorF(-6756, (uint64_t)v26, v7, v8, v9, v10, v11, v12, v34);
      id v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_23:
    id v24 = 0;
    goto LABEL_15;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      v26 = "XPC non-dict";
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  string = xpc_dictionary_get_string(v6, "deviceID");
  if (string)
  {
    id v15 = string;
    id v16 = objc_alloc(MEMORY[0x1E4F29128]);
    id v17 = [NSString stringWithUTF8String:v15];
    uint64_t v18 = [v16 initWithUUIDString:v17];
    blePeerUUID = v13->_blePeerUUID;
    v13->_blePeerUUID = (NSUUID *)v18;

    if (!v13->_blePeerUUID)
    {
      if (a4)
      {
        id v27 = [NSString stringWithUTF8String:v15];
        CBErrorF(-6705, (uint64_t)"Bad peer ID: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_23;
    }
  }
  int64_t int64 = xpc_dictionary_get_int64(v6, "psm");
  if (int64) {
    v13->_blePSM = int64;
  }
  uint64_t v21 = xpc_dictionary_get_value(v6, "socketFD");
  id v22 = (void *)v21;
  if (v21)
  {
    if (MEMORY[0x1AD1120E0](v21) == MEMORY[0x1E4F145B0])
    {
      v13->_int64_t socketFD = xpc_fd_dup(v22);
    }
    else
    {
      int var0 = v13->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
  }
  id v24 = v13;

LABEL_15:
  return v24;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CBConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5E32278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __39__CBConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__CBConnection__activateWithCompletion___block_invoke;
  v14[3] = &unk_1E5E31360;
  id v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void))MEMORY[0x1AD111AA0](v14);
  if (!self->_activateCalled && !self->_invalidateCalled)
  {
    self->_activateCalled = 1;
    uint64_t v7 = (void *)MEMORY[0x1AD111AA0](v5);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = v7;

    if (self->_bluetoothStateChangedHandler) {
      self->_internalFlags |= 1u;
    }
    if (self->_pairingCompletedHandler) {
      self->_internalFlags |= 0x100u;
    }
    if (self->_pairingPromptHandler) {
      self->_internalFlags |= 0x100u;
    }
    if ((self->_connectionFlags & 0x100) != 0)
    {
      BOOL v9 = 0;
      if (self->_remoteDevice) {
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v9 = self->_serviceFlags != 0;
      if (self->_remoteDevice) {
        goto LABEL_17;
      }
    }
    if (!v9)
    {
      id v13 = 0;
      [(CBConnection *)self activateDirectAndReturnError:&v13];
      id v10 = v13;
      if (v10)
      {
        id v11 = self->_activateCompletion;
        self->_id activateCompletion = 0;

        (*((void (**)(id, id))v5 + 2))(v5, v10);
      }
      goto LABEL_16;
    }
LABEL_17:
    [(CBConnection *)self _activateXPCStart:0];
    goto LABEL_18;
  }
  uint64_t v12 = NSErrorF_safe();
  id v10 = (id)v18[5];
  v18[5] = v12;
LABEL_16:

LABEL_18:
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __40__CBConnection__activateWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 152);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  id v46 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __45__CBConnection_activateDirectAndReturnError___block_invoke;
  v40[3] = &unk_1E5E314A0;
  v40[4] = self;
  v40[5] = &v41;
  v40[6] = a3;
  id v5 = (void (**)(void))MEMORY[0x1AD111AA0](v40, a2);
  l2capChannel = self->_l2capChannel;
  if (l2capChannel)
  {
    uint64_t v7 = [(CBL2CAPChannel *)l2capChannel peer];
    id v8 = [v7 identifier];
    blePeerUUID = self->_blePeerUUID;
    self->_blePeerUUID = v8;

    self->_uint64_t blePSM = [(CBL2CAPChannel *)self->_l2capChannel PSM];
    if (self->_peerDevice)
    {
      int var0 = self->_ucat->var0;
      if (var0 > 30) {
        goto LABEL_15;
      }
    }
    else
    {
      id v16 = objc_alloc_init(CBDevice);
      uint64_t v17 = [(NSUUID *)self->_blePeerUUID UUIDString];
      [(CBDevice *)v16 setIdentifier:v17];

      peerDevice = self->_peerDevice;
      self->_peerDevice = v16;

      int var0 = self->_ucat->var0;
      if (var0 > 30)
      {
LABEL_15:
        uint64_t v19 = (id *)(v42 + 5);
        id obj = (id)v42[5];
        BOOL v20 = -[CBConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &obj, v35, blePSM);
        objc_storeStrong(v19, obj);
        if (!v20)
        {
          BOOL v28 = 0;
          goto LABEL_23;
        }
        writeRequests = (NSMutableArray *)MEMORY[0x1AD111AA0](self->_activateCompletion);
        id activateCompletion = self->_activateCompletion;
        self->_id activateCompletion = 0;

        if (writeRequests) {
          ((void (*)(NSMutableArray *, void))writeRequests[2].super.super.isa)(writeRequests, 0);
        }
        goto LABEL_21;
      }
    }
    if (var0 != -1 || _LogCategory_Initialize())
    {
      v35 = self->_blePeerUUID;
      uint64_t blePSM = self->_blePSM;
      LogPrintF_safe();
    }
    goto LABEL_15;
  }
  id v11 = self->_peerDevice;
  if (!v11)
  {
    uint64_t v31 = NSErrorF_safe();
    BOOL v28 = 0;
    writeRequests = (NSMutableArray *)v42[5];
    v42[5] = v31;
    goto LABEL_22;
  }
  writeRequests = (NSMutableArray *)v11;
  id v13 = [(CBDevice *)v11 identifier];
  if (!v13)
  {
    uint64_t v32 = NSErrorF_safe();
    uint64_t v33 = (void *)v42[5];
    v42[5] = v32;

    BOOL v28 = 0;
    goto LABEL_22;
  }
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
  if (!v14)
  {
    uint64_t v34 = NSErrorF_safe();
    id v24 = (id)v42[5];
    v42[5] = v34;
LABEL_30:

    BOOL v28 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&self->_blePeerUUID, v14);
  int v15 = self->_ucat->var0;
  if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
  {
    v35 = self->_blePeerUUID;
    uint64_t blePSM = self->_blePSM;
    LogPrintF_safe();
  }
  id v38 = 0;
  BOOL v22 = -[CBConnection _startConnectingAndReturnError:](self, "_startConnectingAndReturnError:", &v38, v35, blePSM);
  id v23 = v38;
  id v24 = v23;
  if (!v22)
  {
    int v30 = self->_ucat->var0;
    if (v30 <= 90 && (v30 != -1 || _LogCategory_Initialize()))
    {
      v36 = CUPrintNSError();
      LogPrintF_safe();
    }
    if (a3)
    {
      id v24 = v24;
      *a3 = v24;
    }
    goto LABEL_30;
  }

LABEL_21:
  v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  readRequests = self->_readRequests;
  self->_readRequests = v25;

  id v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  writeRequests = self->_writeRequests;
  self->_writeRequests = v27;
  BOOL v28 = 1;
LABEL_22:

LABEL_23:
  v5[2](v5);

  _Block_object_dispose(&v41, 8);
  return v28;
}

void __45__CBConnection_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int v2 = **(_DWORD **)(*(void *)(a1 + 32) + 152);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      int v3 = CUPrintNSError();
      LogPrintF_safe();
    }
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
  }
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
  [(CBConnection *)self encodeWithXPCObject:v5];
  xpc_dictionary_set_string(v5, "mTyp", "CnxA");
  id v6 = [(CBConnection *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __34__CBConnection__activateXPCStart___block_invoke;
  handler[3] = &unk_1E5E31608;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);
}

uint64_t __34__CBConnection__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCCompleted:(id)a3
{
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded();
  int var0 = self->_ucat->var0;
  id v11 = (id)v4;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v10 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v6 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v6)
  {
    ((void (**)(void, id))v6)[2](v6, v11);
  }
  else
  {
    uint64_t v8 = MEMORY[0x1AD111AA0](self->_errorHandler);
    BOOL v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v11);
    }
  }
}

- (void)disconnectWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CBConnection_disconnectWithCompletion___block_invoke;
  v7[3] = &unk_1E5E32278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __41__CBConnection_disconnectWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) encodeWithXPCObject:v2];
  xpc_dictionary_set_string(v2, "mTyp", "CnxD");
  int v3 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 208);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __41__CBConnection_disconnectWithCompletion___block_invoke_2;
  handler[3] = &unk_1E5E32250;
  id v6 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

void __41__CBConnection_disconnectWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  id v4 = self->_xpcCnx;
  if (!v4)
  {
    xpc_object_t v5 = self->_xpcListenerEndpoint;
    id v6 = v5;
    if (v5)
    {
      mach_service = xpc_connection_create_from_endpoint(v5);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)self->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__CBConnection__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5E31630;
    v9[4] = self;
    id v4 = mach_service;
    id v10 = v4;
    xpc_connection_set_event_handler(v4, v9);
    xpc_connection_activate(v4);
  }

  return v4;
}

void *__33__CBConnection__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[20] == *(void *)(a1 + 40)) {
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
    xpc_object_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    self->_bluetoothState = 1;
    id v6 = (void (**)(void))MEMORY[0x1AD111AA0](self->_bluetoothStateChangedHandler);
    if (v6)
    {
      uint64_t v7 = v6;
      v6[2]();
      id v6 = v7;
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CBConnection_invalidate__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CBConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    connectTimeoutTimer = self->_connectTimeoutTimer;
    if (connectTimeoutTimer)
    {
      xpc_object_t v5 = connectTimeoutTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_connectTimeoutTimer;
      self->_connectTimeoutTimer = 0;
    }
    if (self->_peripheral)
    {
      self->_guardConnected = 0;
      -[CBCentralManager cancelPeripheralConnection:](self->_centralManager, "cancelPeripheralConnection:");
    }
    [(CBCentralManager *)self->_centralManager setDelegate:0];
    centralManager = self->_centralManager;
    self->_centralManager = 0;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    [(CBPeripheral *)self->_peripheral setDelegate:0];
    peripheral = self->_peripheral;
    self->_peripheral = 0;

    id v10 = NSErrorF_safe();
    [(CBConnection *)self _reportError:v10];

    readSource = self->_readSource;
    if (readSource)
    {
      dispatch_source_cancel(readSource);
      if (self->_readSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_readSource);
        self->_readSuspended = 0;
      }
      uint64_t v12 = self->_readSource;
      self->_readSource = 0;
    }
    writeSource = self->_writeSource;
    if (writeSource)
    {
      dispatch_source_cancel(writeSource);
      if (self->_writeSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_writeSource);
        self->_writeSuspended = 0;
      }
      id v14 = self->_writeSource;
      self->_writeSource = 0;
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx) {
      xpc_connection_cancel(xpcCnx);
    }
    [(CBConnection *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone
    && !self->_readSource
    && !self->_writeSource
    && !self->_readRequestCurrent
    && ![(NSMutableArray *)self->_readRequests count]
    && !self->_writeRequestCurrent
    && ![(NSMutableArray *)self->_writeRequests count]
    && !self->_xpcCnx)
  {
    int v15 = (void (**)(void))MEMORY[0x1AD111AA0](self->_invalidationHandler);
    int v3 = (void (**)(void))MEMORY[0x1AD111AA0](self->_serverInvalidationHandler);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id pairingCompletedHandler = self->_pairingCompletedHandler;
    self->_id pairingCompletedHandler = 0;

    id pairingPromptHandler = self->_pairingPromptHandler;
    self->_id pairingPromptHandler = 0;

    id serverInvalidationHandler = self->_serverInvalidationHandler;
    self->_id serverInvalidationHandler = 0;

    id xpcForwardMessageReceiveHandler = self->_xpcForwardMessageReceiveHandler;
    self->_id xpcForwardMessageReceiveHandler = 0;

    id xpcSendEventHandler = self->_xpcSendEventHandler;
    self->_id xpcSendEventHandler = 0;

    if (v15) {
      v15[2]();
    }
    if (v3) {
      v3[2](v3);
    }
    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (BOOL)updateWithXPCSubscriberInfo:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = v4;
  if (!v4 || MEMORY[0x1AD1120E0](v4) != MEMORY[0x1E4F14590])
  {
    BOOL v11 = 0;
    goto LABEL_14;
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  id v6 = xpc_dictionary_get_array(v5, "serviceUUIDs");
  uint64_t v7 = v6;
  if (v6)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __44__CBConnection_updateWithXPCSubscriberInfo___block_invoke;
    applier[3] = &unk_1E5E33AE0;
    applier[4] = &v17;
    xpc_array_apply(v6, applier);
  }
  serviceUUIDs = self->_serviceUUIDs;
  BOOL v9 = (NSArray *)(id)v18[5];
  id v10 = serviceUUIDs;
  BOOL v11 = v9 != v10;
  if (v9 == v10)
  {

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v12 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_11;
  }
  char v13 = [(NSArray *)v9 isEqual:v10];

  if ((v13 & 1) == 0)
  {
LABEL_11:
    id v14 = (NSArray *)(id)v18[5];
    BOOL v9 = self->_serviceUUIDs;
    self->_serviceUUIDs = v14;
    goto LABEL_12;
  }
  BOOL v11 = 0;
LABEL_13:

  _Block_object_dispose(&v17, 8);
LABEL_14:

  return v11;
}

uint64_t __44__CBConnection_updateWithXPCSubscriberInfo___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    xpc_object_t v5 = (void *)[[NSString alloc] initWithUTF8String:string_ptr];
    if (v5)
    {
      id v6 = [[CBUUID alloc] initWithString:v5 safe:1];
      if (v6)
      {
        uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        if (!v7)
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
          id v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;

          uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        }
        [v7 addObject:v6];
      }
    }
  }
  return 1;
}

- (void)xpcForwardMessage:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CBConnection_xpcForwardMessage___block_invoke;
  v7[3] = &unk_1E5E31068;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __34__CBConnection_xpcForwardMessage___block_invoke(uint64_t a1)
{
  xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kCBMsgId");
  int v2 = **(_DWORD **)(*(void *)(a1 + 40) + 152);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 40) encodeWithXPCObject:xdict];
  xpc_dictionary_set_string(xdict, "mTyp", "CnxF");
  xpc_dictionary_set_value(xdict, "fwdM", *(xpc_object_t *)(a1 + 32));
  uint64_t v3 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 40) + 384));
  id v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, xpc_object_t))(v3 + 16))(v3, xdict);
  }
  else
  {
    xpc_object_t v5 = [*(id *)(a1 + 40) _ensureXPCStarted];
    xpc_connection_send_message(v5, xdict);
  }
}

- (void)xpcReceivedForwardedEvent:(id)a3
{
  id v4 = xpc_dictionary_get_value(a3, "fwdM");
  id v10 = v4;
  if (v4)
  {
    xpc_dictionary_get_int64(v4, "kCBMsgId");
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v6 = MEMORY[0x1AD111AA0](self->_xpcForwardMessageReceiveHandler);
    uint64_t v7 = (void *)v6;
    if (v6)
    {
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v10);
    }
    else
    {
      int v9 = self->_ucat->var0;
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
  }
  else
  {
    int v8 = self->_ucat->var0;
    if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v24 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v24, v6))
    {
      id v22 = CUPrintXPC();
      LogPrintF_safe();

      id v4 = v24;
    }
  }
  if (MEMORY[0x1AD1120E0](v4) == MEMORY[0x1E4F14590])
  {
    [(CBConnection *)self _xpcReceivedMessage:v24];
    goto LABEL_26;
  }
  if (v24 == (id)MEMORY[0x1E4F14520])
  {
    [(CBConnection *)self _interrupted];
    goto LABEL_26;
  }
  if (v24 != (id)MEMORY[0x1E4F14528])
  {
    uint64_t v7 = CUXPCDecodeNSErrorIfNeeded();
    id v14 = v7;
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
      CBErrorF(-6700, (uint64_t)"XPC event error", v8, v9, v10, v11, v12, v13, (uint64_t)v22);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      int v16 = self->_ucat->var0;
      if (v16 > 90)
      {
LABEL_21:
        uint64_t v19 = MEMORY[0x1AD111AA0](self->_errorHandler);
        BOOL v20 = (void *)v19;
        if (v19) {
          (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);
        }

        goto LABEL_26;
      }
    }
    if (v16 != -1 || _LogCategory_Initialize())
    {
      uint64_t v18 = CUPrintNSError();
      id v23 = CUPrintXPC();
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
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

  [(CBConnection *)self _invalidated];
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
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  xpc_object_t v5 = string;
  if (!strcmp(string, "CnxF"))
  {
    [(CBConnection *)self xpcReceivedForwardedEvent:v9];
    uint64_t v8 = v9;
  }
  else if (!strcmp(v5, "PrCm"))
  {
    [(CBConnection *)self xpcReceivedPairingCompleted:v9];
    uint64_t v8 = v9;
  }
  else
  {
    if (strcmp(v5, "PrPm"))
    {
      int v6 = self->_ucat->var0;
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize())) {
LABEL_10:
      }
        LogPrintF_safe();
LABEL_11:
      uint64_t v8 = v9;
      goto LABEL_13;
    }
    [(CBConnection *)self xpcReceivedPairingPrompt:v9];
    uint64_t v8 = v9;
  }
LABEL_13:
}

- (void)xpcReceivedPairingCompleted:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    objc_opt_class();
    CUXPCDecodeObject();
    id v5 = 0;
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    int v6 = self->_ucat->var0;
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)xpcReceivedPairingPrompt:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    objc_opt_class();
    CUXPCDecodeObject();
    id v5 = 0;
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = CUPrintNSError();
      LogPrintF_safe();
    }
    goto LABEL_4;
  }
  int v7 = self->_ucat->var0;
  if (v7 > 90 || v7 == -1 && !_LogCategory_Initialize())
  {
LABEL_4:

    return;
  }
  LogPrintF_safe();
}

- (BOOL)_startConnectingAndReturnError:(id *)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!self->_blePeerUUID)
  {
    if (a3) {
      goto LABEL_12;
    }
    return 0;
  }
  id v5 = [CBCentralManager alloc];
  dispatchQueue = self->_dispatchQueue;
  BOOL v20 = @"kCBManagerNeedsRestrictedStateOperation";
  v21[0] = MEMORY[0x1E4F1CC38];
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v8 = [(CBCentralManager *)v5 initWithDelegate:self queue:dispatchQueue options:v7];
  centralManager = self->_centralManager;
  self->_centralManager = v8;

  uint64_t v10 = self->_centralManager;
  if (!v10)
  {
    if (a3)
    {
LABEL_12:
      NSErrorF_safe();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v17;
      return result;
    }
    return 0;
  }
  if ((self->_connectionFlags & 0x80) != 0 || (unsigned int internalFlags = self->_internalFlags, (internalFlags & 0x100) != 0))
  {
    uint64_t v12 = [(CBManager *)v10 sharedPairingAgent];
    [v12 setDelegate:self];

    unsigned int internalFlags = self->_internalFlags;
  }
  if ((internalFlags & 0x20) != 0)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__CBConnection__startConnectingAndReturnError___block_invoke;
    v19[3] = &unk_1E5E31608;
    v19[4] = self;
    uint64_t v13 = (void *)MEMORY[0x1AD111AA0](v19);
    id xpcForwardMessageReceiveHandler = self->_xpcForwardMessageReceiveHandler;
    self->_id xpcForwardMessageReceiveHandler = v13;

    id v15 = self->_centralManager;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__CBConnection__startConnectingAndReturnError___block_invoke_2;
    v18[3] = &unk_1E5E31608;
    v18[4] = self;
    [(CBManager *)v15 setWHBMsgReplyHandler:v18];
  }
  [(CBConnection *)self _run];
  return 1;
}

void __47__CBConnection__startConnectingAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 152);
  id v9 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      uint64_t v8 = *(void *)(v4 + 24);
      LogPrintF_safe();
      id v3 = v9;
      uint64_t v4 = *(void *)(a1 + 32);
      goto LABEL_6;
    }
    int v6 = _LogCategory_Initialize();
    uint64_t v4 = *(void *)(a1 + 32);
    if (v6)
    {
      id v3 = v9;
      goto LABEL_3;
    }
    id v3 = v9;
  }
LABEL_6:
  objc_msgSend(*(id *)(v4 + 32), "didReceiveForwardedMessageForCBManager:", v3, v7, v8);
}

uint64_t __47__CBConnection__startConnectingAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcForwardMessage:a2];
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5 = [(CBL2CAPChannel *)self->_l2capChannel socketFD];
  if (v5 < 0)
  {
    if (a3) {
      goto LABEL_11;
    }
    return 0;
  }
  unsigned int v6 = v5;
  self->_int64_t socketFD = v5;
  int v21 = 1;
  if (setsockopt(v5, 0xFFFF, 4130, &v21, 4u) && (!*__error() || *__error()))
  {
    if (a3) {
      goto LABEL_11;
    }
    return 0;
  }
  if (SocketSetNonBlocking())
  {
    if (a3) {
      goto LABEL_11;
    }
    return 0;
  }
  id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], v6, 0, (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v7;

  id v9 = self->_readSource;
  if (!v9)
  {
    if (!a3) {
      return 0;
    }
LABEL_11:
    NSErrorF_safe();
    BOOL v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v14;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __39__CBConnection__setupIOAndReturnError___block_invoke;
  handler[3] = &unk_1E5E31248;
  void handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  uint64_t v10 = self->_readSource;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_2;
  v19[3] = &unk_1E5E31248;
  v19[4] = self;
  dispatch_source_set_cancel_handler(v10, v19);
  dispatch_resume((dispatch_object_t)self->_readSource);
  uint64_t v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144B0], v6, 0, (dispatch_queue_t)self->_dispatchQueue);
  writeSource = self->_writeSource;
  self->_writeSource = v11;

  uint64_t v13 = self->_writeSource;
  BOOL v14 = v13 != 0;
  if (v13)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_3;
    v18[3] = &unk_1E5E31248;
    v18[4] = self;
    dispatch_source_set_event_handler(v13, v18);
    id v15 = self->_writeSource;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __39__CBConnection__setupIOAndReturnError___block_invoke_4;
    v17[3] = &unk_1E5E31248;
    v17[4] = self;
    dispatch_source_set_cancel_handler(v15, v17);
    self->_writeSuspended = 1;
  }
  else if (a3)
  {
    NSErrorF_safe();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads:1];
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites];
}

uint64_t __39__CBConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_reportError:(id)a3
{
  id v10 = a3;
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v9 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  self->_state = 3;
  int v5 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v5)
  {
    ((void (**)(void, id))v5)[2](v5, v10);
  }
  else
  {
    id v7 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_errorHandler);
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    if (v7) {
      ((void (**)(void, id))v7)[2](v7, v10);
    }
  }
  -[CBConnection _abortReadsWithError:](self, "_abortReadsWithError:", v10, v9);
  [(CBConnection *)self _abortWritesWithError:v10];
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      int state = self->_state;
      switch(state)
      {
        case 0:
          self->_int state = 10;
          if (state != 10) {
            goto LABEL_35;
          }
          return;
        case 10:
          CBManagerState v4 = [(CBManager *)self->_centralManager state];
          if (v4 == 10 || v4 == CBManagerStatePoweredOn) {
            goto LABEL_27;
          }
          goto LABEL_34;
        case 11:
          if (![(CBConnection *)self _runConnectStart]) {
            goto LABEL_34;
          }
          goto LABEL_27;
        case 12:
          if (!self->_guardConnected) {
            goto LABEL_34;
          }
          self->_int state = 13;
          if (state == 13) {
            return;
          }
          goto LABEL_35;
        case 13:
          self->_connectedTime = CFAbsoluteTimeGetCurrent();
          goto LABEL_27;
        case 14:
          if (self->_blePSM)
          {
            -[CBPeripheral openL2CAPChannel:](self->_peripheral, "openL2CAPChannel:");
LABEL_27:
            int v6 = self->_state + 1;
            self->_int state = v6;
            if (v6 == state) {
              return;
            }
          }
          else
          {
            self->_int state = 18;
            if (state == 18) {
              return;
            }
          }
LABEL_35:
          int var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          break;
        case 15:
          if (!self->_l2capChannel) {
            goto LABEL_34;
          }
          self->_int state = 16;
          if (state == 16) {
            return;
          }
          goto LABEL_35;
        case 16:
          self->_int state = 17;
          if (state == 17) {
            return;
          }
          goto LABEL_35;
        case 17:
          if ([(CBConnection *)self _runSetupChannel]) {
            goto LABEL_27;
          }
          goto LABEL_34;
        case 18:
          id v7 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion, a2);
          id activateCompletion = self->_activateCompletion;
          self->_id activateCompletion = 0;

          if (v7) {
            v7[2](v7, 0);
          }
          if (self->_blePSM)
          {
            [(CBConnection *)self _processReads:0];
            [(CBConnection *)self _processWrites];
          }

          goto LABEL_34;
        default:
LABEL_34:
          if (self->_state != state) {
            goto LABEL_35;
          }
          return;
      }
    }
  }
}

- (BOOL)_runConnectStart
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = self->_blePeerUUID;
  centralManager = self->_centralManager;
  v22[0] = v3;
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  int v6 = [(CBCentralManager *)centralManager retrievePeripheralsWithIdentifiers:v5];

  id v7 = [v6 firstObject];
  if (v7)
  {
    objc_storeStrong((id *)&self->_peripheral, v7);
    [(CBPeripheral *)self->_peripheral setDelegate:self];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = v8;
    clientBundleID = self->_clientBundleID;
    if (clientBundleID) {
      [v8 setObject:clientBundleID forKeyedSubscript:@"kCBConnectOptionClientBundleID"];
    }
    if (self->_clientUseCase)
    {
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v9 setObject:v11 forKeyedSubscript:@"kCBOptionUsecase"];
    }
    if (self->_useCase)
    {
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [v9 setObject:v12 forKeyedSubscript:@"kCBOptionUsecase"];
    }
    if ((self->_connectionFlags & 0x40) != 0) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kCBConnectOptionDoNoDisconnectOnEncryptionFailure"];
    }
    uint64_t v13 = [NSNumber numberWithInteger:self->_connectionScanDutyCycle];
    [v9 setObject:v13 forKeyedSubscript:@"kCBConnectOptionConnectionScanDutyCycle"];

    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v20 = uint64_t v19 = v3;
      LogPrintF_safe();
    }
    -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", v7, v9, v19, v20);
    if (self->_connectTimeoutSeconds > 0.0)
    {
      id v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      connectTimeoutTimer = self->_connectTimeoutTimer;
      self->_connectTimeoutTimer = v15;
      id v17 = v15;

      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __32__CBConnection__runConnectStart__block_invoke;
      handler[3] = &unk_1E5E31068;
      void handler[4] = v17;
      void handler[5] = self;
      dispatch_source_set_event_handler(v17, handler);
      CUDispatchTimerSet();
      dispatch_activate(v17);
    }
  }
  else
  {
    id v9 = NSErrorF_safe();
    -[CBConnection _reportError:](self, "_reportError:", v9, v3);
  }

  return v7 != 0;
}

void __32__CBConnection__runConnectStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8 = *(void **)(a1 + 32);
  if (v8 == *(void **)(*(void *)(a1 + 40) + 40))
  {
    if (v8)
    {
      id v10 = v8;
      dispatch_source_cancel(v10);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;
    }
    uint64_t v13 = *(void **)(a1 + 40);
    CBErrorF(-6722, (uint64_t)"Connect timeout", a3, a4, a5, a6, a7, a8, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v13 _reportError:v15];
  }
}

- (BOOL)_runSetupChannel
{
  id v6 = 0;
  BOOL v3 = [(CBConnection *)self _setupIOAndReturnError:&v6];
  id v4 = v6;
  if (!v3) {
    [(CBConnection *)self _reportError:v4];
  }

  return v3;
}

- (void)pairingGenerateOOBDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CBConnection_pairingGenerateOOBDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E32278;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __60__CBConnection_pairingGenerateOOBDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairingGenerateOOBDataWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_pairingGenerateOOBDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__3;
  v57 = __Block_byref_object_dispose__3;
  id v58 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke;
  v50[3] = &unk_1E5E31360;
  v52 = &v53;
  v50[4] = self;
  id v5 = v4;
  id v51 = v5;
  uint64_t v12 = (void (**)(void))MEMORY[0x1AD111AA0](v50);
  if (self->_invalidateCalled)
  {
    uint64_t v42 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v6, v7, v8, v9, v10, v11, v46);
LABEL_20:
    BOOL v20 = (CBPeripheral *)v54[5];
    v54[5] = v42;
    goto LABEL_17;
  }
  peripheral = self->_peripheral;
  if (peripheral)
  {
    BOOL v20 = peripheral;
    goto LABEL_5;
  }
  BOOL v20 = [(CBL2CAPChannel *)self->_l2capChannel peer];
  if (!v20)
  {
    uint64_t v42 = CBErrorF(-6705, (uint64_t)"No peer", v14, v15, v16, v17, v18, v19, v46);
    goto LABEL_20;
  }
LABEL_5:
  centralManager = self->_centralManager;
  if (centralManager)
  {
    id v22 = [(CBManager *)centralManager sharedPairingAgent];
    uint64_t v29 = v22;
    if (v22)
    {
      v36 = [v22 retrieveOOBDataForPeer:v20];
      if (v36)
      {
        objc_storeStrong((id *)&self->_pairingOOBData, v36);
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          id v38 = [(CBPeer *)v20 identifier];
          v47 = CUPrintNSDataHex();
          LogPrintF_safe();
        }
        (*((void (**)(id, void *, void))v5 + 2))(v5, v36, 0);
      }
      else
      {
        uint64_t v44 = CBErrorF(-6700, (uint64_t)"Generate OOB data failed", v30, v31, v32, v33, v34, v35, v46);
        v45 = (void *)v54[5];
        v54[5] = v44;
      }
    }
    else
    {
      uint64_t v43 = CBErrorF(-6705, (uint64_t)"No pairing agent", v23, v24, v25, v26, v27, v28, v46);
      v36 = (void *)v54[5];
      v54[5] = v43;
    }
  }
  else
  {
    server = self->_server;
    if (server)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke_2;
      v48[3] = &unk_1E5E33B08;
      v48[4] = self;
      id v49 = v5;
      [(CBServer *)server pairingGenerateOOBDataForPeer:v20 completionHandler:v48];
    }
    else
    {
      uint64_t v40 = CBErrorF(-6700, (uint64_t)"No central or server", v14, v15, v16, v17, v18, v19, v46);
      uint64_t v41 = (void *)v54[5];
      v54[5] = v40;
    }
  }
LABEL_17:

  v12[2](v12);
  _Block_object_dispose(&v53, 8);
}

uint64_t __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 152);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

void __61__CBConnection__pairingGenerateOOBDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7 && !v6) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CBConnection_pairingSetOOBEnabled_completionHandler___block_invoke;
  block[3] = &unk_1E5E33B30;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __55__CBConnection_pairingSetOOBEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairingSetOOBEnabled:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_pairingSetOOBEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  id v49 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __56__CBConnection__pairingSetOOBEnabled_completionHandler___block_invoke;
  v40[3] = &unk_1E5E33B58;
  uint64_t v42 = &v44;
  v40[4] = self;
  BOOL v43 = v4;
  id v7 = v6;
  id v41 = v7;
  uint64_t v14 = (void (**)(void))MEMORY[0x1AD111AA0](v40);
  if (self->_invalidateCalled)
  {
    uint64_t v36 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v8, v9, v10, v11, v12, v13, v39);
    id v22 = (CBPeripheral *)v45[5];
    v45[5] = v36;
    goto LABEL_17;
  }
  peripheral = self->_peripheral;
  if (peripheral)
  {
    id v22 = peripheral;
  }
  else
  {
    id v22 = [(CBL2CAPChannel *)self->_l2capChannel peer];
    if (!v22)
    {
      uint64_t v35 = CBErrorF(-6705, (uint64_t)"No peer", v16, v17, v18, v19, v20, v21, v39);
      id v22 = 0;
      goto LABEL_13;
    }
  }
  centralManager = self->_centralManager;
  if (centralManager)
  {
    uint64_t v24 = [(CBManager *)centralManager sharedPairingAgent];
    uint64_t v31 = v24;
    if (v24)
    {
      [v24 setDelegate:self];
      [v31 setOOBPairingEnabled:1 forPeer:v22];
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v33 = [(CBPeer *)v22 identifier];
        LogPrintF_safe();
      }
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    else
    {
      uint64_t v37 = CBErrorF(-6705, (uint64_t)"No pairing agent", v25, v26, v27, v28, v29, v30, v39);
      id v38 = (void *)v45[5];
      v45[5] = v37;
    }
    goto LABEL_16;
  }
  server = self->_server;
  if (!server)
  {
    uint64_t v35 = CBErrorF(-6700, (uint64_t)"No central or server", v16, v17, v18, v19, v20, v21, v39);
LABEL_13:
    uint64_t v31 = (void *)v45[5];
    v45[5] = v35;
LABEL_16:

    goto LABEL_17;
  }
  [(CBServer *)server pairingSetOOBEnabled:v4 peer:v22 completionHandler:v7];
LABEL_17:

  v14[2](v14);
  _Block_object_dispose(&v44, 8);
}

uint64_t __56__CBConnection__pairingSetOOBEnabled_completionHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 152);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF_safe();
    }
    BOOL v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)pairingPerformAction:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CBConnection_pairingPerformAction_completionHandler___block_invoke;
  block[3] = &unk_1E5E321B8;
  block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __55__CBConnection_pairingPerformAction_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 49))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    CBErrorF(-71148, (uint64_t)"Use after invalidate", a3, a4, a5, a6, a7, a8, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v16);
  }
  else
  {
    uint64_t v10 = *(unsigned int *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 40);
    if (*(void *)(v9 + 32))
    {
      uint64_t v12 = MEMORY[0x1E4F1CC08];
      [(id)v9 _pairingPerformActionBLE:v10 withOptions:v12 completionHandler:v11];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 40);
      objc_msgSend((id)v9, "_pairingPerformActionClassic:completionHandler:", v10, v13, v11);
    }
  }
}

- (void)pairingPerformAction:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__CBConnection_pairingPerformAction_withOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E5E33B80;
  id v14 = v8;
  id v15 = v9;
  int v16 = a3;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(dispatchQueue, v13);
}

void __67__CBConnection_pairingPerformAction_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 49))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    CBErrorF(-71148, (uint64_t)"Use after invalidate", a3, a4, a5, a6, a7, a8, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v15);
  }
  else
  {
    uint64_t v10 = *(unsigned int *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    if (*(void *)(v9 + 32))
    {
      [(id)v9 _pairingPerformActionBLE:v10 withOptions:v11 completionHandler:v12];
    }
    else
    {
      [(id)v9 _pairingPerformActionClassic:v10 withOptions:v11 completionHandler:v12];
    }
  }
}

- (void)_pairingPerformActionBLE:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  id v58 = __Block_byref_object_dispose__3;
  id v59 = 0;
  uint64_t v46 = MEMORY[0x1E4F143A8];
  uint64_t v47 = 3221225472;
  v48 = __71__CBConnection__pairingPerformActionBLE_withOptions_completionHandler___block_invoke;
  id v49 = &unk_1E5E33BA8;
  v52 = &v54;
  v50 = self;
  int v53 = a3;
  id v10 = v9;
  id v51 = v10;
  uint64_t v11 = (void (**)(void))MEMORY[0x1AD111AA0](&v46);
  uint64_t v18 = [(CBManager *)self->_centralManager sharedPairingAgent];
  if (v18)
  {
    uint64_t v25 = self->_peripheral;
    if (v25)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v27 = [(CBPeer *)v25 identifier];
        uint64_t v28 = (void *)v27;
        if (a3 > 3) {
          uint64_t v29 = "?";
        }
        else {
          uint64_t v29 = off_1E5E33C88[a3];
        }
        uint64_t v44 = v27;
        v45 = v29;
        LogPrintF_safe();
      }
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([v8 count])
      {
        uint64_t v37 = NSNumber;
        id v38 = [v8 objectForKeyedSubscript:@"kCBMsgArgPairingPasskey"];
        uint64_t v39 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "integerValue"));
        [v30 setObject:v39 forKeyedSubscript:@"kCBMsgArgPairingPasskey"];
      }
      if ((a3 - 1) > 2)
      {
        uint64_t v40 = CBErrorF(-6705, (uint64_t)"Bad pairing action", v31, v32, v33, v34, v35, v36, v44);
        id v41 = (void *)v55[5];
        v55[5] = v40;
      }
      else
      {
        objc_msgSend(v18, "respondToPairingRequest:type:accept:data:", v25, self->_pairingType, (((_BYTE)a3 - 1) & 7) == 0, v30, v44, v45, v46, v47, v48, v49, v50);
        if (v10) {
          (*((void (**)(id, void))v10 + 2))(v10, 0);
        }
      }
    }
    else
    {
      uint64_t v43 = CBErrorF(-6705, (uint64_t)"No peripheral", v19, v20, v21, v22, v23, v24, v44);
      id v30 = (id)v55[5];
      v55[5] = v43;
    }
  }
  else
  {
    uint64_t v42 = CBErrorF(-6705, (uint64_t)"No pairing agent", v12, v13, v14, v15, v16, v17, v44);
    uint64_t v25 = (CBPeripheral *)v55[5];
    v55[5] = v42;
  }

  v11[2](v11);
  _Block_object_dispose(&v54, 8);
}

void *__71__CBConnection__pairingPerformActionBLE_withOptions_completionHandler___block_invoke(void *result)
{
  if (!*(void *)(*(void *)(result[6] + 8) + 40)) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = result[4];
  int v3 = **(_DWORD **)(v2 + 152);
  if (v3 <= 90)
  {
    if (v3 != -1)
    {
LABEL_4:
      BOOL v4 = [*(id *)(v2 + 304) identifier];
      id v6 = CUPrintNSError();
      LogPrintF_safe();

      uint64_t result = (void *)v1[5];
      if (!result) {
        return result;
      }
      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t v2 = v1[4];
      goto LABEL_4;
    }
  }
  uint64_t result = (void *)v1[5];
  if (!result) {
    return result;
  }
LABEL_7:
  id v5 = (uint64_t (*)(void))result[2];

  return (void *)v5();
}

- (void)_pairingPerformActionClassic:(int)a3 completionHandler:(id)a4
{
  uint64_t v12 = (void (**)(id, void *))a4;
  if (a3 == 1)
  {
    uint64_t v15 = 0;
  }
  else
  {
    if (a3 == 3)
    {
      uint64_t v13 = "User canceled pairing";
      int v14 = -6723;
    }
    else
    {
      if (a3 != 2)
      {
        uint64_t v15 = CBErrorF(-6705, (uint64_t)"Bad pairing action", v6, v7, v8, v9, v10, v11, v20);
        v12[2](v12, v15);
        goto LABEL_10;
      }
      uint64_t v13 = "User rejected pairing";
      int v14 = -71146;
    }
    uint64_t v15 = CBErrorF(v14, (uint64_t)v13, v6, v7, v8, v9, v10, v11, v20);
  }
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "mTyp", "CnPC");
  uint64_t v17 = objc_alloc_init(CBPairingInfo);
  [(CBPairingInfo *)v17 setDevice:self->_peerDevice];
  [(CBPairingInfo *)v17 setError:v15];
  CUXPCEncodeObject();
  uint64_t v18 = [(CBConnection *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __63__CBConnection__pairingPerformActionClassic_completionHandler___block_invoke;
  handler[3] = &unk_1E5E32250;
  uint64_t v22 = v12;
  xpc_connection_send_message_with_reply(v18, v16, dispatchQueue, handler);

LABEL_10:
}

void __63__CBConnection__pairingPerformActionClassic_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_pairingPerformActionClassic:(int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  uint64_t v15 = (void (**)(id, void *))a5;
  if (a3 == 1)
  {
    uint64_t v18 = 0;
  }
  else
  {
    if (a3 == 3)
    {
      xpc_object_t v16 = "User canceled pairing";
      int v17 = -6723;
    }
    else
    {
      if (a3 != 2)
      {
        uint64_t v18 = CBErrorF(-6705, (uint64_t)"Bad pairing action", v9, v10, v11, v12, v13, v14, v24);
        v15[2](v15, v18);
        goto LABEL_12;
      }
      xpc_object_t v16 = "User rejected pairing";
      int v17 = -71146;
    }
    uint64_t v18 = CBErrorF(v17, (uint64_t)v16, v9, v10, v11, v12, v13, v14, v24);
  }
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v19, "mTyp", "CnPC");
  uint64_t v20 = objc_alloc_init(CBPairingInfo);
  [(CBPairingInfo *)v20 setDevice:self->_peerDevice];
  [(CBPairingInfo *)v20 setError:v18];
  if (v8)
  {
    uint64_t v21 = [v8 objectForKeyedSubscript:@"kCBMsgArgPairingPasskey"];
    [(CBPairingInfo *)v20 setPin:v21];
  }
  CUXPCEncodeObject();
  uint64_t v22 = [(CBConnection *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __75__CBConnection__pairingPerformActionClassic_withOptions_completionHandler___block_invoke;
  handler[3] = &unk_1E5E32250;
  uint64_t v26 = v15;
  xpc_connection_send_message_with_reply(v22, v19, dispatchQueue, handler);

LABEL_12:
}

void __75__CBConnection__pairingPerformActionClassic_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)pairWithOOBData:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CBConnection_pairWithOOBData___block_invoke;
  v7[3] = &unk_1E5E31068;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __32__CBConnection_pairWithOOBData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairWithOOBData:*(void *)(a1 + 40)];
}

- (void)_pairWithOOBData:(id)a3
{
  id v5 = a3;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__3;
  id v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __33__CBConnection__pairWithOOBData___block_invoke;
  v36[3] = &unk_1E5E31388;
  v36[4] = self;
  v36[5] = &v37;
  uint64_t v12 = (void (**)(void))MEMORY[0x1AD111AA0](v36);
  if (self->_invalidateCalled)
  {
    uint64_t v30 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v6, v7, v8, v9, v10, v11, v34);
    xpc_object_t v19 = (CBPeripheral *)v38[5];
    v38[5] = v30;
  }
  else
  {
    xpc_object_t v19 = self->_peripheral;
    if (v19)
    {
      uint64_t v20 = [(CBManager *)self->_centralManager sharedPairingAgent];
      uint64_t v27 = v20;
      if (v20)
      {
        [v20 setDelegate:self];
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v29 = [(CBPeer *)v19 identifier];
          uint64_t v35 = CUPrintNSDataHex();
          LogPrintF_safe();
        }
        objc_storeStrong((id *)&self->_pairingOOBData, a3);
        [v27 pairPeer:v19];
      }
      else
      {
        uint64_t v32 = CBErrorF(-6705, (uint64_t)"No pairing agent", v21, v22, v23, v24, v25, v26, v34);
        uint64_t v33 = (void *)v38[5];
        v38[5] = v32;
      }
    }
    else
    {
      uint64_t v31 = CBErrorF(-6705, (uint64_t)"No peer", v13, v14, v15, v16, v17, v18, v34);
      uint64_t v27 = (void *)v38[5];
      v38[5] = v31;
    }
  }
  v12[2](v12);

  _Block_object_dispose(&v37, 8);
}

void __33__CBConnection__pairWithOOBData___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int v1 = **(_DWORD **)(*(void *)(a1 + 32) + 152);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
  }
}

- (void)readWithCBReadRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CBConnection_readWithCBReadRequest___block_invoke;
  v7[3] = &unk_1E5E31068;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __38__CBConnection_readWithCBReadRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 49))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorF_safe();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeReadRequest:v3 error:v5];
  }
  else
  {
    [*(id *)(v2 + 104) addObject:*(void *)(a1 + 40)];
    id v4 = *(_DWORD **)(a1 + 32);
    if ((v4[28] & 0x80000000) == 0)
    {
      [v4 _processReads:0];
    }
  }
}

- (void)_processReads:(BOOL)a3
{
  BOOL v28 = a3;
  int v4 = 0;
  p_readRequestCurrent = &self->_readRequestCurrent;
  id v6 = &OBJC_IVAR___CBReadRequest__length;
  uint64_t v29 = &self->_readRequestCurrent;
  while (1)
  {
    uint64_t v7 = *p_readRequestCurrent;
    if (!v7) {
      break;
    }
LABEL_5:
    uint64_t v9 = *(uint64_t *)((char *)&v7->super.isa + *v6);
    id obj = v7;
    [(CBReadRequest *)v7 minLength];
    [(CBReadRequest *)obj maxLength];
    int Data = SocketReadDataEx();
    int var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t socketFD = self->_socketFD;
      uint64_t v12 = [(CBReadRequest *)obj minLength];
      uint64_t v13 = [(CBReadRequest *)obj maxLength];
      uint64_t v14 = v6;
      uint64_t v15 = *(uint64_t *)((char *)&obj->super.isa + *v6);
      CUPrintErrorCode();
      uint64_t v27 = v26 = v15;
      id v6 = v14;
      uint64_t v24 = v13;
      uint64_t v25 = v9;
      uint64_t v22 = socketFD;
      uint64_t v23 = v12;
      LogPrintF_safe();

      p_readRequestCurrent = v29;
    }
    if (Data)
    {
      if (Data == 35)
      {
        if (self->_readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
      else
      {
        xpc_object_t v19 = NSErrorF_safe();
        [(CBConnection *)self _abortReadsWithError:v19];
      }
      uint64_t v20 = obj;
      goto LABEL_18;
    }
    uint64_t v16 = *(uint64_t *)((char *)&obj->super.isa + *v6);
    uint64_t v17 = [(CBReadRequest *)obj bufferData];
    [v17 setLength:v16];

    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    [(CBConnection *)self _completeReadRequest:obj error:0];
    if (++v4 == 4)
    {
      if (self->_readSuspended)
      {
        self->_readSuspended = 0;
        readSource = self->_readSource;
        dispatch_resume(readSource);
      }
      return;
    }
  }
  uint64_t v8 = [(NSMutableArray *)self->_readRequests firstObject];
  if (v8)
  {
    obja = (CBReadRequest *)v8;
    [(NSMutableArray *)self->_readRequests removeObjectAtIndex:0];
    [(CBConnection *)self _prepareReadRequest:obja];
    objc_storeStrong((id *)p_readRequestCurrent, obja);
    uint64_t v7 = obja;
    goto LABEL_5;
  }
  if (v28)
  {
    if (v4)
    {
      if (!self->_readSuspended) {
        goto LABEL_35;
      }
LABEL_34:
      self->_readSuspended = 0;
      dispatch_resume((dispatch_object_t)self->_readSource);
      uint64_t v20 = 0;
      goto LABEL_18;
    }
    if ([(CBConnection *)self _processReadStatus])
    {
      if (!self->_readSuspended)
      {
        self->_readSuspended = 1;
        dispatch_suspend((dispatch_object_t)self->_readSource);
        uint64_t v20 = 0;
        goto LABEL_18;
      }
      goto LABEL_35;
    }
    if (self->_readSuspended) {
      goto LABEL_34;
    }
  }
LABEL_35:
  uint64_t v20 = 0;
LABEL_18:
}

- (void)_prepareReadRequest:(id)a3
{
  uint64_t v11 = a3;
  int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v11, "maxLength"));
  [v11 setBufferData:v4];

  id v5 = [v11 bufferData];
  v11[1] = [v5 mutableBytes];

  id v6 = [v11 bufferData];
  [v11 setData:v6];

  v11[3] = 0;
  uint64_t v7 = (void *)v11[2];
  v11[2] = 0;

  int var0 = self->_ucat->var0;
  if (var0 <= 9)
  {
    uint64_t v9 = v11;
    if (var0 != -1) {
      goto LABEL_3;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t v9 = v11;
LABEL_3:
      [v9 minLength];
      [v11 maxLength];
      LogPrintF_safe();
      uint64_t v10 = v11;
      goto LABEL_5;
    }
  }
  uint64_t v10 = v11;

LABEL_5:
}

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_readRequestCurrent || [(NSMutableArray *)self->_readRequests count])
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  id v6 = self->_readRequestCurrent;
  if (v6)
  {
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    [(CBConnection *)self _completeReadRequest:v6 error:v4];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_readRequests;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v6;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v6 = (CBReadRequest *)*(id *)(*((void *)&v18 + 1) + 8 * v12);

        [(CBConnection *)self _completeReadRequest:v6 error:v4];
        ++v12;
        uint64_t v13 = v6;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_readRequests removeAllObjects];
  readSource = self->_readSource;
  if (readSource && !self->_readSuspended)
  {
    self->_readSuspended = 1;
    dispatch_suspend(readSource);
  }
  uint64_t v15 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_errorHandler);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  if (v15) {
    ((void (**)(void, id))v15)[2](v15, v4);
  }
  [(CBConnection *)self _invalidated];
}

- (BOOL)_processReadStatus
{
  do
  {
    char v12 = 0;
    ssize_t v3 = recv(self->_socketFD, &v12, 1uLL, 2);
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (!v3)
      {
        uint64_t v9 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_errorHandler);
        id errorHandler = self->_errorHandler;
        self->_id errorHandler = 0;

        if (v9)
        {
          uint64_t v11 = NSErrorF_safe();
          ((void (**)(void, void *))v9)[2](v9, v11);
        }
        return 1;
      }
      return 1;
    }
    if (!*__error()) {
      goto LABEL_9;
    }
    int v4 = *__error();
  }
  while (v4 == 4);
  if (!v4) {
    return 1;
  }
  if (v4 == 35) {
    return 0;
  }
LABEL_9:
  id v6 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_errorHandler);
  id v7 = self->_errorHandler;
  self->_id errorHandler = 0;

  if (v6)
  {
    uint64_t v8 = NSErrorF_safe();
    ((void (**)(void, void *))v6)[2](v6, v8);
  }
  return 1;
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  char v12 = a3;
  id v6 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 9)
  {
    uint64_t v8 = v12;
    if (var0 != -1)
    {
LABEL_3:
      [v8 length];
      uint64_t v11 = CUPrintNSError();
      LogPrintF_safe();

      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t v8 = v12;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v9 = (void *)v12[2];
  v12[2] = v6;

  uint64_t v10 = [v12 completion];
  [v12 setCompletion:0];
  if (v10) {
    v10[2](v10);
  }
}

- (void)writeWithCBWriteRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__CBConnection_writeWithCBWriteRequest___block_invoke;
  v7[3] = &unk_1E5E31068;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __40__CBConnection_writeWithCBWriteRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 49))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorF_safe();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeWriteRequest:v3 error:v5];
  }
  else
  {
    [*(id *)(v2 + 144) addObject:*(void *)(a1 + 40)];
    id v4 = *(_DWORD **)(a1 + 32);
    if ((v4[28] & 0x80000000) == 0)
    {
      [v4 _processWrites];
    }
  }
}

- (void)writeEndOfDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CBWriteRequest);
  [(CBWriteRequest *)v5 setEndOfData:1];
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __45__CBConnection_writeEndOfDataWithCompletion___block_invoke;
    uint64_t v9 = &unk_1E5E310B8;
    uint64_t v10 = v5;
    id v11 = v4;
    [(CBWriteRequest *)v5 setCompletion:&v6];
  }
  -[CBConnection writeWithCBWriteRequest:](self, "writeWithCBWriteRequest:", v5, v6, v7, v8, v9);
}

void __45__CBConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_processWrites
{
  p_writeRequestCurrent = &self->_writeRequestCurrent;
  id v4 = &OBJC_IVAR___CBWriteRequest__ion;
  int v5 = 4;
  uint64_t v23 = &self->_writeRequestCurrent;
  do
  {
    id v8 = *p_writeRequestCurrent;
    if (!v8)
    {
      uint64_t v15 = [(NSMutableArray *)self->_writeRequests firstObject];
      if (!v15)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        id v8 = 0;
        goto LABEL_35;
      }
      id v8 = (CBWriteRequest *)v15;
      [(NSMutableArray *)self->_writeRequests removeObjectAtIndex:0];
      id v24 = 0;
      [(CBConnection *)self _prepareWriteRequest:v8 error:&v24];
      id v16 = v24;
      if (v16)
      {
        uint64_t v6 = v16;
        goto LABEL_4;
      }
      objc_storeStrong((id *)p_writeRequestCurrent, v8);
    }
    uint64_t v9 = *(unsigned int *)((char *)&v8->super.isa + *v4);
    int v10 = SocketWriteData();
    int var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      char v12 = v4;
      uint64_t v13 = *(unsigned int *)((char *)&v8->super.isa + *v4);
      uint64_t socketFD = self->_socketFD;
      CUPrintErrorCode();
      v22 = uint64_t v21 = v13;
      id v4 = v12;
      uint64_t v19 = socketFD;
      uint64_t v20 = v9;
      LogPrintF_safe();

      p_writeRequestCurrent = v23;
    }
    if (v10)
    {
      if (v10 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }
      else
      {
        long long v18 = NSErrorF_safe();
        [(CBConnection *)self _abortWritesWithError:v18];
      }
LABEL_35:

      return;
    }
    if (![(CBWriteRequest *)v8 endOfData]) {
      goto LABEL_2;
    }
    int v17 = self->_ucat->var0;
    if (v17 <= 9 && (v17 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = self->_socketFD;
      LogPrintF_safe();
    }
    if (shutdown(self->_socketFD, 1) && (!*__error() || *__error()))
    {
      uint64_t v6 = NSErrorF_safe();
    }
    else
    {
LABEL_2:
      uint64_t v6 = 0;
    }
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

LABEL_4:
    -[CBConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v8, v6, v19, v20, v21, v22);

    --v5;
  }
  while (v5);
  if (self->_writeSuspended)
  {
    self->_writeSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_writeSource);
  }
}

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v5 = (char *)a3;
  uint64_t v6 = [v5 dataArray];
  unint64_t v7 = [v6 count];
  if (v7 >= 0x11)
  {
    if (a4)
    {
      NSErrorF_safe();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v8 = v5 + 16;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v34 + 1) + 8 * i);
          *(void *)id v8 = [v14 bytes];
          *((void *)v8 + 1) = [v14 length];
          v8 += 16;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v11);
    }

    *((void *)v5 + 34) = v5 + 16;
    *((_DWORD *)v5 + 70) = (unint64_t)(v8 - v5 - 16) >> 4;
    *((void *)v5 + 36) = 0;
    uint64_t v15 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = 0;

    if (gLogCategory_CBConnection <= 9 && (gLogCategory_CBConnection != -1 || _LogCategory_Initialize()))
    {
      int v16 = *((_DWORD *)v5 + 70);
      if (v16)
      {
        uint64_t v17 = *((void *)v5 + 34);
        unint64_t v18 = (v16 - 1) & 0xFFFFFFFFFFFFFFFLL;
        if (v18 >= 4)
        {
          unint64_t v21 = v18 + 1;
          uint64_t v22 = v21 & 3;
          if ((v21 & 3) == 0) {
            uint64_t v22 = 4;
          }
          unint64_t v23 = v21 - v22;
          uint64_t v20 = v17 + 16 * v23;
          id v24 = (const double *)(v17 + 40);
          int64x2_t v25 = 0uLL;
          int64x2_t v26 = 0uLL;
          do
          {
            uint64_t v27 = v24 - 4;
            unsigned long long v28 = (unsigned __int128)vld2q_f64(v27);
            unsigned long long v29 = (unsigned __int128)vld2q_f64(v24);
            int64x2_t v25 = vaddq_s64((int64x2_t)v28, v25);
            int64x2_t v26 = vaddq_s64((int64x2_t)v29, v26);
            v24 += 8;
            v23 -= 4;
          }
          while (v23);
          uint64_t v19 = vaddvq_s64(vaddq_s64(v26, v25));
        }
        else
        {
          uint64_t v19 = 0;
          uint64_t v20 = *((void *)v5 + 34);
        }
        uint64_t v30 = v17 + 16 * v16;
        do
        {
          v19 += *(void *)(v20 + 8);
          v20 += 16;
        }
        while (v20 != v30);
      }
      int var0 = self->_ucat->var0;
      if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
  }

  return v7 < 0x11;
}

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_writeRequestCurrent || [(NSMutableArray *)self->_writeRequests count])
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  uint64_t v6 = self->_writeRequestCurrent;
  if (v6)
  {
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

    [(CBConnection *)self _completeWriteRequest:v6 error:v4];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_writeRequests;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v6;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v6 = (CBWriteRequest *)*(id *)(*((void *)&v18 + 1) + 8 * v12);

        [(CBConnection *)self _completeWriteRequest:v6 error:v4];
        ++v12;
        uint64_t v13 = v6;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_writeRequests removeAllObjects];
  writeSource = self->_writeSource;
  if (writeSource && !self->_writeSuspended)
  {
    self->_writeSuspended = 1;
    dispatch_suspend(writeSource);
  }
  uint64_t v15 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_errorHandler);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  if (v15) {
    ((void (**)(void, id))v15)[2](v15, v4);
  }
  [(CBConnection *)self _invalidated];
}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  uint64_t v11 = a3;
  id v6 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = CUPrintNSError();
    LogPrintF_safe();
  }
  id v8 = (void *)v11[1];
  v11[1] = v6;

  uint64_t v9 = [v11 completion];
  [v11 setCompletion:0];
  if (v9) {
    v9[2](v9);
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
LABEL_2:
    id v4 = v8;
  }
  else
  {
    uint64_t v5 = [v8 state];
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    switch(v5)
    {
      case 1:
      case 4:
        unint64_t v7 = NSErrorF_safe();
        [(CBConnection *)self _reportError:v7];

        id v4 = v8;
        break;
      case 5:
      case 10:
        [(CBConnection *)self _run];
        id v4 = v8;
        break;
      default:
        goto LABEL_2;
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    unint64_t v7 = [v6 identifier];
    blePeerUUID = self->_blePeerUUID;
    uint64_t v9 = v7;
    uint64_t v10 = blePeerUUID;
    if (v9 != v10)
    {
      uint64_t v11 = v10;
      if ((v9 == 0) != (v10 != 0))
      {
        char v12 = [(NSUUID *)v9 isEqual:v10];

        if (v12)
        {
          int var0 = self->_ucat->var0;
          if (var0 > 30) {
            goto LABEL_15;
          }
          goto LABEL_8;
        }
      }
      else
      {
      }
      int v14 = self->_ucat->var0;
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      goto LABEL_26;
    }

    int var0 = self->_ucat->var0;
    if (var0 > 30)
    {
LABEL_15:
      connectTimeoutTimer = self->_connectTimeoutTimer;
      if (connectTimeoutTimer)
      {
        int v16 = connectTimeoutTimer;
        dispatch_source_cancel(v16);
        uint64_t v17 = self->_connectTimeoutTimer;
        self->_connectTimeoutTimer = 0;
      }
      int64_t connectionLatency = self->_connectionLatency;
      if (connectionLatency != -99)
      {
        int v19 = self->_ucat->var0;
        if (v19 <= 30
          && (v19 != -1 || (int v20 = _LogCategory_Initialize(), connectionLatency = self->_connectionLatency, v20)))
        {
          uint64_t v23 = CBCentralManagerConnectionLatencyToString(connectionLatency);
          LogPrintF_safe();
          objc_msgSend(v24, "setDesiredConnectionLatency:forPeripheral:", self->_connectionLatency, v6, v9, v23);
        }
        else
        {
          objc_msgSend(v24, "setDesiredConnectionLatency:forPeripheral:", connectionLatency, v6, v21, v22);
        }
      }
      self->_guardConnected = 1;
      [(CBConnection *)self _run];
LABEL_26:

      goto LABEL_27;
    }
LABEL_8:
    if (var0 != -1 || _LogCategory_Initialize())
    {
      long long v21 = v9;
      LogPrintF_safe();
    }
    goto LABEL_15;
  }
LABEL_27:
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v19 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    id v8 = [v19 identifier];
    blePeerUUID = self->_blePeerUUID;
    uint64_t v10 = v8;
    uint64_t v11 = blePeerUUID;
    if (v10 != v11)
    {
      char v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        char v13 = [(NSUUID *)v10 isEqual:v11];

        if (v13)
        {
          int var0 = self->_ucat->var0;
          if (var0 > 90)
          {
LABEL_15:
            if (v7)
            {
              [(CBConnection *)self _reportError:v7];
            }
            else
            {
              int v16 = NSErrorF_safe();
              [(CBConnection *)self _reportError:v16];
            }
LABEL_19:

            goto LABEL_20;
          }
LABEL_8:
          if (var0 != -1 || _LogCategory_Initialize())
          {
            uint64_t v17 = CUPrintNSError();
            LogPrintF_safe();
          }
          goto LABEL_15;
        }
      }
      else
      {
      }
      int v15 = self->_ucat->var0;
      if (v15 <= 60 && (v15 != -1 || _LogCategory_Initialize()))
      {
        long long v18 = CUPrintNSError();
        LogPrintF_safe();
      }
      goto LABEL_19;
    }

    int var0 = self->_ucat->var0;
    if (var0 > 90) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
LABEL_20:
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v10 = a4;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v50 = v10;
  char v12 = [v10 identifier];
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = __Block_byref_object_copy__3;
  id v59 = __Block_byref_object_dispose__3;
  id v60 = 0;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __64__CBConnection_pairingAgent_peerDidRequestPairing_type_passkey___block_invoke;
  v51[3] = &unk_1E5E33BD0;
  v51[4] = self;
  v51[5] = v12;
  int v53 = &v55;
  int64_t v54 = a5;
  id v13 = v11;
  id v52 = v13;
  int v14 = (void (**)(void))MEMORY[0x1AD111AA0](v51);
  int v15 = [(CBPeer *)self->_peripheral identifier];
  int v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    long long v18 = [(CBL2CAPChannel *)self->_l2capChannel peer];
    id v17 = [v18 identifier];
  }
  if (([v12 isEqual:v17] & 1) == 0)
  {
    uint64_t v44 = CBErrorF(-6727, (uint64_t)"peer not found", v19, v20, v21, v22, v23, v24, v45);
    uint64_t v31 = (NSData *)v56[5];
    v56[5] = v44;
    goto LABEL_47;
  }
  uint64_t v31 = self->_pairingOOBData;
  int var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_16;
      }
      if ((unint64_t)a5 <= 5)
      {
LABEL_8:
        uint64_t v33 = off_1E5E33D00[a5];
        if (v31)
        {
LABEL_9:
          CUPrintNSDataHex();
          long long v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
LABEL_13:
        long long v34 = @"nil";
LABEL_14:
        uint64_t v47 = v13;
        v48 = v34;
        uint64_t v45 = (uint64_t)v12;
        uint64_t v46 = v33;
        LogPrintF_safe();
        if (v31) {

        }
        goto LABEL_16;
      }
    }
    else if ((unint64_t)a5 <= 5)
    {
      goto LABEL_8;
    }
    uint64_t v33 = "?";
    if (v31) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
LABEL_16:
  self->_pairingType = a5;
  if (a5)
  {
    if (a5 == 5)
    {
      if (v31)
      {
        int v35 = self->_ucat->var0;
        if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSDataHex();
          v47 = uint64_t v46 = "OOB";
          uint64_t v45 = (uint64_t)v12;
          LogPrintF_safe();
        }
        v63 = @"kCBMsgArgPairingData";
        v64[0] = v31;
        objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1, v45, v46, v47, v48);
        long long v36 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        [v49 respondToPairingRequest:v50 type:5 accept:1 data:v36];
        goto LABEL_44;
      }
      uint64_t v41 = CBErrorF(-6745, (uint64_t)"No OOB data", v25, v26, v27, v28, v29, v30, v45);
LABEL_34:
      long long v36 = (void (**)(void, void))v56[5];
      v56[5] = v41;
LABEL_44:

      goto LABEL_47;
    }
    if ((unint64_t)a5 > 4 || ((1 << a5) & 0x16) == 0)
    {
      uint64_t v41 = CBErrorF(-6735, (uint64_t)"Unsupported pairing type", v25, v26, v27, v28, v29, v30, v45);
      goto LABEL_34;
    }
    id v38 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_pairingPromptHandler);
    if (v38)
    {
      uint64_t v39 = objc_alloc_init(CBPairingInfo);
      [(CBPairingInfo *)v39 setDevice:self->_peerDevice];
      [(CBPairingInfo *)v39 setPairingType:a5];
      if (log10((double)(int)[v13 intValue]) < 4.0) {
        objc_msgSend(NSString, "stringWithFormat:", @"%04d", objc_msgSend(v13, "intValue"));
      }
      else {
      id v42 = objc_msgSend(NSString, "stringWithFormat:", @"%06d", objc_msgSend(v13, "intValue"));
      }
      [(CBPairingInfo *)v39 setPin:v42];

      ((void (**)(void, CBPairingInfo *))v38)[2](v38, v39);
    }

    if (a5 == 1 && (self->_connectionFlags & 0x200) != 0)
    {
      int v43 = self->_ucat->var0;
      if (v43 <= 30 && (v43 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v45 = (uint64_t)v12;
        uint64_t v46 = "Display";
        LogPrintF_safe();
      }
      if (v13)
      {
        v61 = @"kCBMsgArgPairingPasskey";
        id v62 = v13;
        long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      }
      else
      {
        long long v36 = (void (**)(void, void))MEMORY[0x1E4F1CC08];
      }
      objc_msgSend(v49, "respondToPairingRequest:type:accept:data:", v50, 1, 1, v36, v45, v46, v47, v48);
      goto LABEL_44;
    }
  }
  else
  {
    if ((self->_connectionFlags & 0x80) == 0)
    {
      long long v36 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_pairingPromptHandler);
      if (v36)
      {
        long long v37 = objc_alloc_init(CBPairingInfo);
        [(CBPairingInfo *)v37 setDevice:self->_peerDevice];
        [(CBPairingInfo *)v37 setPairingType:0];
        ((void (**)(void, CBPairingInfo *))v36)[2](v36, v37);
      }
      goto LABEL_44;
    }
    int v40 = self->_ucat->var0;
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      objc_msgSend(v49, "respondToPairingRequest:type:accept:data:", v50, 0, 1, MEMORY[0x1E4F1CC08], v12, "JustWorks", v47, v48);
    }
    else
    {
      objc_msgSend(v49, "respondToPairingRequest:type:accept:data:", v50, 0, 1, MEMORY[0x1E4F1CC08], v45, v46, v47, v48);
    }
  }
LABEL_47:

  v14[2](v14);
  _Block_object_dispose(&v55, 8);
}

void __64__CBConnection_pairingAgent_peerDidRequestPairing_type_passkey___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    int v1 = **(_DWORD **)(*(void *)(a1 + 32) + 152);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      id v2 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  id v17 = [v6 identifier];

  id v7 = [(CBPeer *)self->_peripheral identifier];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = [(CBL2CAPChannel *)self->_l2capChannel peer];
    id v9 = [v10 identifier];
  }
  char v11 = [v17 isEqual:v9];
  int var0 = self->_ucat->var0;
  if (v11)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    pairingOOBint Data = self->_pairingOOBData;
    self->_pairingOOBint Data = 0;

    int v14 = (void (**)(void, void, void))MEMORY[0x1AD111AA0](self->_pairingCompletedHandler);
    if (v14)
    {
      int v15 = self->_peerDevice;
      if (!v15)
      {
        int v15 = objc_alloc_init(CBDevice);
        int v16 = [v17 UUIDString];
        [(CBDevice *)v15 setIdentifier:v16];
      }
      ((void (**)(void, CBDevice *, void))v14)[2](v14, v15, 0);
    }
  }
  else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v21 = a5;
  dispatchQueue = self->_dispatchQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  id v9 = [v8 identifier];

  id v10 = [(CBPeer *)self->_peripheral identifier];
  char v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = [(CBL2CAPChannel *)self->_l2capChannel peer];
    id v12 = [v13 identifier];
  }
  char v14 = [v9 isEqual:v12];
  int var0 = self->_ucat->var0;
  if (v14)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v20 = CUPrintNSError();
      LogPrintF_safe();
    }
    pairingOOBint Data = self->_pairingOOBData;
    self->_pairingOOBint Data = 0;

    id v17 = (void (**)(void, void, void))MEMORY[0x1AD111AA0](self->_pairingCompletedHandler);
    if (v17)
    {
      long long v18 = self->_peerDevice;
      if (!v18)
      {
        long long v18 = objc_alloc_init(CBDevice);
        uint64_t v19 = [v9 UUIDString];
        [(CBDevice *)v18 setIdentifier:v19];
      }
      ((void (**)(void, CBDevice *, id))v17)[2](v17, v18, v21);
    }
  }
  else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  id v13 = [v6 identifier];

  id v7 = [(CBPeer *)self->_peripheral identifier];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = [(CBL2CAPChannel *)self->_l2capChannel peer];
    id v9 = [v10 identifier];
  }
  char v11 = [v13 isEqual:v9];
  int var0 = self->_ucat->var0;
  if (v11)
  {
    if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_9;
    }
LABEL_7:
    LogPrintF_safe();
    goto LABEL_9;
  }
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
    goto LABEL_7;
  }
LABEL_9:
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_25;
  }
  if (!self->_l2capChannel)
  {
    id v12 = [v28 identifier];
    blePeerUUID = self->_blePeerUUID;
    char v14 = v12;
    int v15 = blePeerUUID;
    if (v14 == v15)
    {
    }
    else
    {
      int v16 = v15;
      if ((v14 == 0) == (v15 != 0))
      {

LABEL_18:
        int var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          char v11 = [v28 identifier];
          uint64_t v27 = CUPrintNSError();
          LogPrintF_safe();

          goto LABEL_24;
        }
        goto LABEL_25;
      }
      char v17 = [(NSUUID *)v14 isEqual:v15];

      if ((v17 & 1) == 0) {
        goto LABEL_18;
      }
    }
    int v18 = self->_ucat->var0;
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v26 = uint64_t v25 = v8;
      LogPrintF_safe();
    }
    if (v9)
    {
      char v11 = NSErrorNestedF();
      [(CBConnection *)self _reportError:v11];
      goto LABEL_24;
    }
    id v20 = v8;
    char v11 = v20;
    if (!v20)
    {
      uint64_t v23 = NSErrorF_safe();
      [(CBConnection *)self _reportError:v23];

      goto LABEL_24;
    }
    if ([v20 PSM] == self->_blePSM)
    {
      objc_storeStrong((id *)&self->_l2capChannel, a4);
      int v21 = self->_ucat->var0;
      if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v22 = objc_msgSend(v11, "peer", v25, v26);
        uint64_t v25 = [v22 identifier];
        uint64_t v26 = [v11 PSM];
        LogPrintF_safe();
      }
      [(CBConnection *)self _run];
      goto LABEL_24;
    }
    int v24 = self->_ucat->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize())
    {
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v11, "PSM", v25, v26);
LABEL_6:
    LogPrintF_safe();
    goto LABEL_24;
  }
  int v10 = self->_ucat->var0;
  if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize()))
  {
    char v11 = CUPrintNSError();
    goto LABEL_6;
  }
LABEL_25:
}

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CBReadRequest);
  -[CBReadRequest setMinLength:](v5, "setMinLength:", [v4 minLength]);
  -[CBReadRequest setMaxLength:](v5, "setMaxLength:", [v4 maxLength]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __32__CBConnection_readWithRequest___block_invoke;
  int v10 = &unk_1E5E31068;
  id v11 = v4;
  id v12 = v5;
  id v6 = v4;
  [(CBReadRequest *)v5 setCompletion:&v7];
  -[CBConnection readWithCBReadRequest:](self, "readWithCBReadRequest:", v5, v7, v8, v9, v10);
}

void __32__CBConnection_readWithRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) data];
  [*(id *)(a1 + 32) setData:v2];

  uint64_t v3 = [*(id *)(a1 + 40) error];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (int)*MEMORY[0x1E4F5E240];
  id v6 = *(void **)(v4 + v5);
  *(void *)(v4 + v5) = v3;

  uint64_t v7 = [*(id *)(a1 + 40) length];
  *(void *)(*(void *)(a1 + 32) + (int)*MEMORY[0x1E4F5E248]) = v7;
  uint64_t v9 = [*(id *)(a1 + 32) completion];
  [*(id *)(a1 + 32) setCompletion:0];
  uint64_t v8 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
    uint64_t v8 = (void *)v9;
  }
}

- (void)writeWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CBWriteRequest);
  id v6 = [v4 dataArray];
  [(CBWriteRequest *)v5 setDataArray:v6];

  -[CBWriteRequest setEndOfData:](v5, "setEndOfData:", [v4 endOfData]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __33__CBConnection_writeWithRequest___block_invoke;
  id v11 = &unk_1E5E31068;
  id v12 = v4;
  id v13 = v5;
  id v7 = v4;
  [(CBWriteRequest *)v5 setCompletion:&v8];
  -[CBConnection writeWithCBWriteRequest:](self, "writeWithCBWriteRequest:", v5, v8, v9, v10, v11);
}

void __33__CBConnection_writeWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) error];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (int)*MEMORY[0x1E4F5E250];
  uint64_t v5 = *(void **)(v3 + v4);
  *(void *)(v3 + v4) = v2;

  uint64_t v7 = [*(id *)(a1 + 32) completion];
  [*(id *)(a1 + 32) setCompletion:0];
  id v6 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
    id v6 = (void *)v7;
  }
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
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

- (id)pairingCompletedHandler
{
  return self->_pairingCompletedHandler;
}

- (void)setPairingCompletedHandler:(id)a3
{
}

- (id)pairingPromptHandler
{
  return self->_pairingPromptHandler;
}

- (void)setPairingPromptHandler:(id)a3
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

- (unsigned)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unsigned int)a3
{
  self->_uint64_t useCase = a3;
}

- (NSArray)useCaseClientIDs
{
  return self->_useCaseClientIDs;
}

- (void)setUseCaseClientIDs:(id)a3
{
}

- (unsigned)blePSM
{
  return self->_blePSM;
}

- (void)setBlePSM:(unsigned __int16)a3
{
  self->_uint64_t blePSM = a3;
}

- (unsigned)connectionFlags
{
  return self->_connectionFlags;
}

- (void)setConnectionFlags:(unsigned int)a3
{
  self->_uint64_t connectionFlags = a3;
}

- (int64_t)connectionLatency
{
  return self->_connectionLatency;
}

- (void)setConnectionLatency:(int64_t)a3
{
  self->_int64_t connectionLatency = a3;
}

- (int64_t)connectionScanDutyCycle
{
  return self->_connectionScanDutyCycle;
}

- (void)setConnectionScanDutyCycle:(int64_t)a3
{
  self->_connectionScanDutyCycle = a3;
}

- (double)connectTimeoutSeconds
{
  return self->_connectTimeoutSeconds;
}

- (void)setConnectTimeoutSeconds:(double)a3
{
  self->_double connectTimeoutSeconds = a3;
}

- (CBDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (unsigned)serviceFlags
{
  return self->_serviceFlags;
}

- (void)setServiceFlags:(unsigned int)a3
{
  self->_uint64_t serviceFlags = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (int64_t)clientUseCase
{
  return self->_clientUseCase;
}

- (void)setClientUseCase:(int64_t)a3
{
  self->_clientUseCase = a3;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (double)connectedTime
{
  return self->_connectedTime;
}

- (void)setConnectedTime:(double)a3
{
  self->_connectedTime = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_unsigned int internalFlags = a3;
}

- (CBL2CAPChannel)l2capChannel
{
  return self->_l2capChannel;
}

- (void)setL2capChannel:(id)a3
{
}

- (CBServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (id)serverInvalidationHandler
{
  return self->_serverInvalidationHandler;
}

- (void)setServerInvalidationHandler:(id)a3
{
}

- (NSArray)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (void)setServiceUUIDs:(id)a3
{
}

- (id)xpcForwardMessageReceiveHandler
{
  return self->_xpcForwardMessageReceiveHandler;
}

- (void)setXpcForwardMessageReceiveHandler:(id)a3
{
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (id)xpcSendEventHandler
{
  return self->_xpcSendEventHandler;
}

- (void)setXpcSendEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_xpcSendEventHandler, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong(&self->_xpcForwardMessageReceiveHandler, 0);
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
  objc_storeStrong(&self->_serverInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_useCaseClientIDs, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_pairingPromptHandler, 0);
  objc_storeStrong(&self->_pairingCompletedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_pairingOOBData, 0);
  objc_storeStrong((id *)&self->_connectTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_blePeerUUID, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end