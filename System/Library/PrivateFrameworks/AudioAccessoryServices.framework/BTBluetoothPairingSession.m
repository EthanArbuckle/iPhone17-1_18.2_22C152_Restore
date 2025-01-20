@interface BTBluetoothPairingSession
- (BOOL)aggregate;
- (BOOL)connectOnly;
- (BOOL)disconnectOnly;
- (BOOL)guestMode;
- (BOOL)guestPermanent;
- (BOOL)softwareVolume;
- (BOOL)userNotInContacts;
- (BTBluetoothPairingSession)init;
- (NSData)guestKey;
- (NSString)deviceAddress;
- (NSString)guestAddress;
- (NSString)name;
- (OS_dispatch_queue)dispatchQueue;
- (id)completionHandler;
- (int)_btEnsureStarted;
- (unsigned)deviceVersion;
- (void)_activate;
- (void)_btDeletePairingAndRetry;
- (void)_btEnsureStopped;
- (void)_completed:(int)a3;
- (void)_invalidate;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setAggregate:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConnectOnly:(BOOL)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDisconnectOnly:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setGuestAddress:(id)a3;
- (void)setGuestKey:(id)a3;
- (void)setGuestMode:(BOOL)a3;
- (void)setGuestPermanent:(BOOL)a3;
- (void)setUserNotInContacts:(BOOL)a3;
@end

@implementation BTBluetoothPairingSession

- (BTBluetoothPairingSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)BTBluetoothPairingSession;
  v2 = [(BTBluetoothPairingSession *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3->_ucat = (LogCategory *)&gLogCategory_BTBluetoothPairingSession;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_btSession)
  {
    FatalErrorF();
    goto LABEL_6;
  }
  if (self->_btSessionAttaching)
  {
LABEL_6:
    FatalErrorF();
    goto LABEL_7;
  }
  if (!self->_completionHandler)
  {
    v4.receiver = self;
    v4.super_class = (Class)BTBluetoothPairingSession;
    [(BTBluetoothPairingSession *)&v4 dealloc];
    return;
  }
LABEL_7:
  v2 = (BTBluetoothPairingSession *)FatalErrorF();
  [(BTBluetoothPairingSession *)v2 activate];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__BTBluetoothPairingSession_activate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__BTBluetoothPairingSession_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    objc_super v4 = "yes";
    if (self->_guestMode) {
      objc_super v5 = "yes";
    }
    else {
      objc_super v5 = "no";
    }
    if (self->_disconnectOnly) {
      v6 = "yes";
    }
    else {
      v6 = "no";
    }
    if (!self->_userNotInContacts) {
      objc_super v4 = "no";
    }
    v20 = v6;
    v21 = v4;
    guestAddress = self->_guestAddress;
    v19 = v5;
    deviceAddress = self->_deviceAddress;
    LogPrintF();
  }
  self->_startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_transaction)
  {
    v7 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v7;

    if (!self->_transaction)
    {
      int v9 = self->_ucat->var0;
      if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  if (self->_timeoutTimer)
  {
LABEL_22:
    v13 = (WPClient *)[objc_alloc(getWPClientClass()) initWithQueue:self->_dispatchQueue machName:0];
    wpClient = self->_wpClient;
    self->_wpClient = v13;

    [(WPClient *)self->_wpClient disableScanning];
    uint64_t v15 = [(BTBluetoothPairingSession *)self _btEnsureStarted];
    if (!v15) {
      return;
    }
    goto LABEL_23;
  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v10;

  v12 = self->_timeoutTimer;
  if (v12)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __38__BTBluetoothPairingSession__activate__block_invoke;
    handler[3] = &unk_26523F8D0;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    goto LABEL_22;
  }
  int v16 = self->_ucat->var0;
  if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v15 = 4294960567;
LABEL_23:
  -[BTBluetoothPairingSession _completed:](self, "_completed:", v15, deviceAddress, guestAddress, v19, v20, v21);
}

uint64_t __38__BTBluetoothPairingSession__activate__block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[17];
  if (v3 <= 60)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }

  return [v2 _completed:4294960574];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__BTBluetoothPairingSession_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__BTBluetoothPairingSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_invalidateCalled = 1;

  [(BTBluetoothPairingSession *)self _completed:4294960573];
}

- (void)_completed:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v27[1] = *MEMORY[0x263EF8340];
  [(BTBluetoothPairingSession *)self _btEnsureStopped];
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v6 = retryTimer;
    dispatch_source_cancel(v6);
    v7 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    int v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    v10 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  [(WPClient *)self->_wpClient invalidate];
  wpClient = self->_wpClient;
  self->_wpClient = 0;

  if (self->_completionHandler)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v25 = v3;
      double v24 = CFAbsoluteTimeGetCurrent() - self->_startTime;
      LogPrintF();
    }
    completionHandler = (void (**)(id, void *))self->_completionHandler;
    if (v3)
    {
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08410];
      uint64_t v16 = (int)v3;
      uint64_t v26 = *MEMORY[0x263F08320];
      uint64_t v17 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v18 = (void *)v17;
      v19 = @"?";
      if (v17) {
        v19 = (__CFString *)v17;
      }
      v27[0] = v19;
      v20 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, *(void *)&v24, v25);
      v21 = [v14 errorWithDomain:v15 code:v16 userInfo:v20];
      completionHandler[2](completionHandler, v21);
    }
    else
    {
      completionHandler[2](self->_completionHandler, 0);
    }
    id v22 = self->_completionHandler;
    self->_completionHandler = 0;
  }
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (int)_btEnsureStarted
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  self->_btStarted = 1;
  if (!self->_btSessionAttaching && !self->_btSession)
  {
    *(void *)&v68[0] = 0;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(void *)&v68[0] = _btSessionEventHandler;
    v19 = self;
    int v20 = softLinkBTSessionAttachWithQueue((uint64_t)self->_ucat->var4, (uint64_t)v68, (uint64_t)v19, v19->_dispatchQueue);
    if (v20)
    {
      int v21 = v20;
      CFRelease(v19);
      uint64_t v22 = (v21 + 310000);
      int v23 = self->_ucat->var0;
      if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_49;
      }
      unint64_t v64 = (v21 + 310000);
      goto LABEL_168;
    }
    self->_btSessionAttaching = 1;
  }
  if (!self->_btSessionAddedServiceCallback && self->_btSession)
  {
    int v3 = self->_ucat->var0;
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v5 = softLinkBTServiceAddCallbacks((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler, (uint64_t)self);
    if (v5)
    {
      uint64_t v22 = (v5 + 310000);
      int v54 = self->_ucat->var0;
      if (v54 <= 60 && (v54 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v64 = v22;
        LogPrintF();
      }
      goto LABEL_49;
    }
    self->_btSessionAddedServiceCallback = 1;
  }
  p_btDevice = (uint64_t *)&self->_btDevice;
  if (self->_btDevice || !self->_btSession) {
    goto LABEL_15;
  }
  int v9 = self->_ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    WORD2(v68[0]) = 0;
    LODWORD(v68[0]) = 0;
    uint64_t v11 = [(NSString *)deviceAddress UTF8String];
    int v12 = softLinkBTDeviceAddressFromString(v11, (uint64_t)v68);
    if (v12)
    {
      uint64_t v22 = (v12 + 310000);
      int v56 = self->_ucat->var0;
      if (v56 > 60 || v56 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_49;
      }
      unint64_t v64 = (unint64_t)self->_deviceAddress;
      goto LABEL_168;
    }
    int v13 = softLinkBTDeviceFromAddress((uint64_t)self->_btSession, (uint64_t)v68, (uint64_t)&self->_btDevice);
    if (v13)
    {
      uint64_t v22 = (v13 + 310000);
      int v57 = self->_ucat->var0;
      if (v57 > 60 || v57 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_49;
      }
      unint64_t v64 = (unint64_t)self->_deviceAddress;
      NSUInteger v65 = v22;
      goto LABEL_168;
    }
    int AddressString = softLinkBTDeviceGetAddressString((uint64_t)self->_btDevice, (uint64_t)self->_btAddrStr, 32);
    if (AddressString)
    {
      uint64_t v22 = (AddressString + 310000);
      int v58 = self->_ucat->var0;
      if (v58 > 60 || v58 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_49;
      }
      unint64_t v64 = (unint64_t)self->_deviceAddress;
      NSUInteger v65 = v22;
      goto LABEL_168;
    }
    guestAddress = self->_guestAddress;
    if (guestAddress)
    {
      int v16 = self->_ucat->var0;
      if (v16 > 30) {
        goto LABEL_15;
      }
      if (v16 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_15;
        }
        guestAddress = self->_guestAddress;
      }
      unint64_t v64 = (unint64_t)self->_deviceAddress;
      NSUInteger v65 = (NSUInteger)guestAddress;
    }
    else
    {
      int v66 = 0;
      int PairingStatus = softLinkBTDeviceGetPairingStatus((uint64_t)self->_btDevice, (uint64_t)&v66);
      ucat = self->_ucat;
      if (PairingStatus)
      {
        if (ucat->var0 > 60) {
          goto LABEL_15;
        }
        if (ucat->var0 != -1 || (int v25 = _LogCategory_Initialize(), ucat = self->_ucat, v25))
        {
          unint64_t v64 = (PairingStatus + 310000);
          LogPrintF();
          ucat = self->_ucat;
        }
      }
      if (ucat->var0 > 30 || ucat->var0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_15;
      }
      if (v66) {
        uint64_t v26 = "already paired";
      }
      else {
        uint64_t v26 = "not paired";
      }
      unint64_t v64 = (unint64_t)self->_deviceAddress;
      NSUInteger v65 = (NSUInteger)v26;
    }
    LogPrintF();
LABEL_15:
    if (!self->_connectOnly
      && !self->_disconnectOnly
      && !self->_guestAddress
      && !self->_btPairingAgent
      && self->_btSession)
    {
      long long v7 = 0uLL;
      long long v69 = 0u;
      memset(v68, 0, sizeof(v68));
      int v8 = self->_ucat->var0;
      if (v8 <= 30)
      {
        if (v8 != -1 || (v27 = _LogCategory_Initialize(), long long v7 = 0uLL, v27))
        {
          LogPrintF();
          long long v7 = 0uLL;
        }
      }
      long long v69 = 0uLL;
      *(_OWORD *)((char *)v68 + 8) = v7;
      *(void *)&v68[0] = _btPairingAgentStatusHandler;
      *((void *)&v68[1] + 1) = _btPairingAgentUserConfirmationHandler;
      int v28 = softLinkBTPairingAgentCreate((uint64_t)self->_btSession, (uint64_t)v68, (uint64_t)self, (uint64_t)&self->_btPairingAgent);
      if (v28)
      {
        uint64_t v22 = (v28 + 310000);
        int v62 = self->_ucat->var0;
        if (v62 <= 60 && (v62 != -1 || _LogCategory_Initialize()))
        {
          unint64_t v64 = v22;
          goto LABEL_168;
        }
        goto LABEL_49;
      }
      int v29 = self->_ucat->var0;
      if (v29 <= 30 && (v29 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int v30 = softLinkBTPairingAgentStart((uint64_t)self->_btPairingAgent);
      if (v30)
      {
        uint64_t v22 = (v30 + 310000);
        int v63 = self->_ucat->var0;
        if (v63 <= 60 && (v63 != -1 || _LogCategory_Initialize()))
        {
          unint64_t v64 = v22;
          goto LABEL_168;
        }
        goto LABEL_49;
      }
    }
    if (!*p_btDevice)
    {
LABEL_148:
      LODWORD(v22) = 0;
      return v22;
    }
    if ((self->_btConfigured || !self->_guestAddress)
      && (self->_btConnecting || !self->_btPairingAgentStarted && !self->_connectOnly))
    {
      if (self->_btDisconnected || !self->_disconnectOnly) {
        goto LABEL_148;
      }
      int v31 = self->_ucat->var0;
      if (v31 <= 30 && (v31 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v42 = softLinkBTDeviceDisconnect(*p_btDevice);
      if (v42)
      {
        v43 = (NSString *)v42;
        int v44 = self->_ucat->var0;
        if (v44 <= 60 && (v44 != -1 || _LogCategory_Initialize()))
        {
          unint64_t v64 = (unint64_t)v43;
          NSUInteger v65 = (v43 + 310000);
          LogPrintF();
        }
      }
      self->_btDisconnected = 1;
      goto LABEL_147;
    }
    if (!self->_guestAddress) {
      goto LABEL_225;
    }
    if (MobileBluetoothLibrary_sOnce != -1) {
      dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
    }
    if (!MobileBluetoothLibrary_sLib || !dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConfigureLinkKey"))
    {
      if (!self->_guestMode) {
        goto LABEL_226;
      }
LABEL_225:
      if (MobileBluetoothLibrary_sOnce != -1) {
        dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
      }
      if (MobileBluetoothLibrary_sLib
        && dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConnectServicesWithParameters"))
      {
        int v35 = self->_ucat->var0;
        if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize()))
        {
          if (self->_guestPermanent) {
            v36 = "yes";
          }
          else {
            v36 = "no";
          }
          NSUInteger v37 = [(NSData *)self->_guestKey length];
          unint64_t v64 = (unint64_t)v36;
          NSUInteger v65 = v37;
          LogPrintF();
        }
        v68[0] = 0uLL;
        if ([(NSData *)self->_guestKey length] == 16)
        {
          v68[0] = *(_OWORD *)[(NSData *)self->_guestKey bytes];
          if (self->_guestPermanent)
          {
            uint64_t v49 = 16;
          }
          else if (self->_userNotInContacts)
          {
            uint64_t v49 = 4;
          }
          else
          {
            uint64_t v49 = 2;
          }
        }
        else if (self->_guestPermanent)
        {
          uint64_t v49 = 16;
        }
        else
        {
          uint64_t v49 = 1;
        }
        int v50 = softLinkBTDeviceConnectServicesWithParameters(*p_btDevice, 4294959103, v49, (uint64_t)v68);
        if (v50)
        {
          uint64_t v22 = (v50 + 310000);
          int v51 = self->_ucat->var0;
          if (v51 > 60 || v51 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_49;
          }
          unint64_t v64 = v22;
          goto LABEL_168;
        }
      }
      else
      {
        if (!self->_aggregate) {
          goto LABEL_111;
        }
LABEL_226:
        if (MobileBluetoothLibrary_sOnce != -1) {
          dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
        }
        if (MobileBluetoothLibrary_sLib
          && dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConnectServicesWithParameters"))
        {
          int v38 = self->_ucat->var0;
          if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          v68[0] = 0uLL;
          int v52 = softLinkBTDeviceConnectServicesWithParameters(*p_btDevice, 4294959103, 0, (uint64_t)v68);
          if (v52)
          {
            uint64_t v22 = (v52 + 310000);
            int v61 = self->_ucat->var0;
            if (v61 <= 60 && (v61 != -1 || _LogCategory_Initialize()))
            {
              unint64_t v64 = v22;
              goto LABEL_168;
            }
            goto LABEL_49;
          }
        }
        else
        {
LABEL_111:
          int v39 = self->_ucat->var0;
          if (v39 <= 30 && (v39 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          int v40 = softLinkBTDeviceConnectServices(*p_btDevice, 4294959103);
          if (v40)
          {
            uint64_t v22 = (v40 + 310000);
            int v41 = self->_ucat->var0;
            if (v41 > 60 || v41 == -1 && !_LogCategory_Initialize()) {
              goto LABEL_49;
            }
            unint64_t v64 = v22;
            goto LABEL_168;
          }
        }
      }
      LODWORD(v22) = 0;
      self->_btConnecting = 1;
      return v22;
    }
    int v32 = self->_ucat->var0;
    if (v32 <= 30 && (v32 != -1 || _LogCategory_Initialize()))
    {
      v33 = self->_guestAddress;
      NSUInteger v34 = [(NSData *)self->_guestKey length];
      unint64_t v64 = (unint64_t)v33;
      NSUInteger v65 = v34;
      LogPrintF();
    }
    v68[0] = 0uLL;
    if ([(NSData *)self->_guestKey length] == 16)
    {
      v68[0] = *(_OWORD *)[(NSData *)self->_guestKey bytes];
      uint64_t v45 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v45 = 0;
    }
    __int16 v67 = 0;
    int v66 = 0;
    v46 = [(NSString *)self->_guestAddress UTF8String];
    int v47 = softLinkBTDeviceAddressFromString((uint64_t)v46, (uint64_t)&v66);
    if (!v47)
    {
      int v48 = softLinkBTDeviceConfigureLinkKey(*p_btDevice, (uint64_t)&v66, (uint64_t)v68, v45);
      if (!v48)
      {
        self->_btConfigured = 1;
LABEL_147:
        -[BTBluetoothPairingSession _completed:](self, "_completed:", 0, v64, v65);
        goto LABEL_148;
      }
      uint64_t v22 = (v48 + 310000);
      int v60 = self->_ucat->var0;
      if (v60 <= 60 && (v60 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v64 = v22;
        goto LABEL_168;
      }
LABEL_49:
      if (!v22) {
        return v22;
      }
      goto LABEL_50;
    }
    uint64_t v22 = (v47 + 310000);
    int v59 = self->_ucat->var0;
    if (v59 > 60 || v59 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_49;
    }
    unint64_t v64 = (unint64_t)self->_guestAddress;
LABEL_168:
    LogPrintF();
    goto LABEL_49;
  }
  int v55 = self->_ucat->var0;
  if (v55 <= 60 && (v55 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v22 = 4294960551;
LABEL_50:
  int v24 = self->_ucat->var0;
  if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v64 = v22;
    LogPrintF();
  }
  -[BTBluetoothPairingSession _completed:](self, "_completed:", v22, v64, v65);
  return v22;
}

- (void)_btEnsureStopped
{
  if (self->_btConnecting)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    softLinkBTPairingAgentCancelPairing((uint64_t)self->_btPairingAgent);
    self->_btConnecting = 0;
  }
  if (self->_btPairingAgentStarted)
  {
    int v4 = self->_ucat->var0;
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    softLinkBTPairingAgentStop((uint64_t)self->_btPairingAgent);
    self->_btPairingAgentStarted = 0;
  }
  if (self->_btPairingAgent)
  {
    int v5 = self->_ucat->var0;
    if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    softLinkBTPairingAgentDestroy((uint64_t)&self->_btPairingAgent);
    self->_btPairingAgent = 0;
  }
  if (self->_btSessionAddedServiceCallback)
  {
    if (self->_btSession)
    {
      int v6 = self->_ucat->var0;
      if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      softLinkBTServiceRemoveCallbacks((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler);
    }
    self->_btSessionAddedServiceCallback = 0;
  }
  if (self->_btSession)
  {
    int v7 = self->_ucat->var0;
    if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    softLinkBTSessionDetachWithQueue((uint64_t)&self->_btSession);
    self->_btSession = 0;
  }
  self->_btDevice = 0;
  self->_btStarted = 0;
}

- (void)_btDeletePairingAndRetry
{
  unsigned int retryCount = self->_retryCount;
  if (retryCount >= 3)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
LABEL_46:
      LogPrintF();
      return;
    }
    return;
  }
  uint64_t v5 = retryCount + 1;
  self->_unsigned int retryCount = v5;
  int v6 = self->_ucat->var0;
  if (v6 <= 50)
  {
    if (v6 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_11;
      }
      uint64_t v5 = self->_retryCount;
    }
    uint64_t v20 = v5;
    LogPrintF();
  }
LABEL_11:
  int v7 = softLinkBTPairingAgentDeletePairedDevice((uint64_t)self->_btPairingAgent, (uint64_t)self->_btDevice);
  if (v7)
  {
    int v8 = v7;
    int v9 = self->_ucat->var0;
    if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v20 = (v8 + 310000);
      LogPrintF();
    }
  }
  if (self->_timeoutTimer)
  {
    int v10 = self->_ucat->var0;
    if (v10 <= 50 && (v10 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v20 = 15;
      LogPrintF();
    }
    CUDispatchTimerSet();
  }
  int v11 = self->_ucat->var0;
  if (self->_btSession)
  {
    if (v11 <= 50 && (v11 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(BTBluetoothPairingSession *)self _btEnsureStopped];
  }
  else if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v12 = self->_ucat->var0;
  if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v14 = retryTimer;
    dispatch_source_cancel(v14);
    uint64_t v15 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  int v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  uint64_t v17 = self->_retryTimer;
  self->_retryTimer = v16;

  v18 = self->_retryTimer;
  if (v18)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __53__BTBluetoothPairingSession__btDeletePairingAndRetry__block_invoke;
    handler[3] = &unk_26523F8D0;
    handler[4] = self;
    dispatch_source_set_event_handler(v18, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
  else
  {
    int v19 = self->_ucat->var0;
    if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_46;
    }
  }
}

uint64_t __53__BTBluetoothPairingSession__btDeletePairingAndRetry__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  if (v2)
  {
    int v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = **(_DWORD **)(v6 + 136);
  if (*(void *)(v6 + 80))
  {
    if (v7 <= 30)
    {
      if (v7 != -1 || (int v8 = _LogCategory_Initialize(), v6 = *(void *)(a1 + 32), v8))
      {
        LogPrintF();
        uint64_t v6 = *(void *)(a1 + 32);
      }
    }
    *(unsigned char *)(v6 + 96) = 1;
    int v9 = *(void **)(a1 + 32);
    return [v9 _btEnsureStopped];
  }
  else
  {
    if (v7 <= 30)
    {
      if (v7 != -1 || (int v11 = _LogCategory_Initialize(), v6 = *(void *)(a1 + 32), v11))
      {
        LogPrintF();
        uint64_t v6 = *(void *)(a1 + 32);
      }
    }
    *(unsigned char *)(v6 + 96) = 0;
    int v12 = *(void **)(a1 + 32);
    return [v12 _btEnsureStarted];
  }
}

- (BOOL)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(BOOL)a3
{
  self->_aggregate = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)connectOnly
{
  return self->_connectOnly;
}

- (void)setConnectOnly:(BOOL)a3
{
  self->_connectOnly = a3;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (unsigned)deviceVersion
{
  return self->_deviceVersion;
}

- (BOOL)disconnectOnly
{
  return self->_disconnectOnly;
}

- (void)setDisconnectOnly:(BOOL)a3
{
  self->_disconnectOnly = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)guestAddress
{
  return self->_guestAddress;
}

- (void)setGuestAddress:(id)a3
{
}

- (NSData)guestKey
{
  return self->_guestKey;
}

- (void)setGuestKey:(id)a3
{
}

- (BOOL)guestMode
{
  return self->_guestMode;
}

- (void)setGuestMode:(BOOL)a3
{
  self->_guestMode = a3;
}

- (BOOL)guestPermanent
{
  return self->_guestPermanent;
}

- (void)setGuestPermanent:(BOOL)a3
{
  self->_guestPermanent = a3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)softwareVolume
{
  return self->_softwareVolume;
}

- (BOOL)userNotInContacts
{
  return self->_userNotInContacts;
}

- (void)setUserNotInContacts:(BOOL)a3
{
  self->_userNotInContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guestKey, 0);
  objc_storeStrong((id *)&self->_guestAddress, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_wpClient, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);

  objc_storeStrong((id *)&self->_retryTimer, 0);
}

@end