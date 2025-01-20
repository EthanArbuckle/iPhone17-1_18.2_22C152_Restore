@interface CUBLEAdvertiser
- (CUBLEAdvertiser)init;
- (NSData)appleManufacturerData;
- (NSData)lgBTAddress;
- (NSData)lgDeviceID;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)_advertiseParameters;
- (id)_advertiseParametersSummary:(id)a3;
- (id)invalidationHandler;
- (unsigned)advertiseFlags;
- (void)_advertiseParametersAddLGWake:(id)a3;
- (void)_advertiseParametersAddOSR;
- (void)_ensureStarted;
- (void)_ensureStopped;
- (void)_invalidate;
- (void)_invalidated;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)setAdvertiseFlags:(unsigned int)a3;
- (void)setAppleManufacturerData:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLgBTAddress:(id)a3;
- (void)setLgDeviceID:(id)a3;
@end

@implementation CUBLEAdvertiser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_lgDeviceID, 0);
  objc_storeStrong((id *)&self->_lgBTAddress, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_appleManufacturerData, 0);
  objc_storeStrong((id *)&self->_retrier, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_advertiseParametersCurrent, 0);
}

- (NSString)label
{
  return self->_label;
}

- (NSData)lgDeviceID
{
  return self->_lgDeviceID;
}

- (NSData)lgBTAddress
{
  return self->_lgBTAddress;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (unsigned)advertiseFlags
{
  return self->_advertiseFlags;
}

- (NSData)appleManufacturerData
{
  return self->_appleManufacturerData;
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (!v6)
  {
    if (var0 > 30) {
      goto LABEL_12;
    }
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_12;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser peripheralManagerDidStartAdvertising:error:]", 0x1Eu, (uint64_t)"Advertiser started\n", v7, v8, v9, v10, v13);
    goto LABEL_12;
  }
  if (var0 <= 90)
  {
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
        goto LABEL_9;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser peripheralManagerDidStartAdvertising:error:]", 0x5Au, (uint64_t)"### Advertiser start failed: %{error}\n", v7, v8, v9, v10, (uint64_t)v6);
  }
LABEL_9:
  if (([v14 isAdvertising] & 1) == 0) {
    self->_startAdvertisingCalled = 0;
  }
  [(CURetrier *)self->_retrier failed];
LABEL_12:
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unint64_t v6 = [v5 state];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_9;
      }
      ucat = self->_ucat;
    }
    if (v6 > 0xA) {
      v12 = "?";
    }
    else {
      v12 = off_1E55BDD88[v6];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser peripheralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth advertiser state changed: %s\n", v7, v8, v9, v10, (uint64_t)v12);
  }
LABEL_9:
  if (v6 == 1 || v6 == 4)
  {
    self->_startAdvertisingCalled = 0;
  }
  else if (v6 == 5)
  {
    [(CUBLEAdvertiser *)self _ensureStarted];
  }
}

- (id)_advertiseParametersSummary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  id v4 = (id)getCBAdvertisementDataAppleMfgData[0]();
  CFTypeID TypeID = CFDataGetTypeID();
  unint64_t v6 = CFDictionaryGetTypedValue(v3, v4, TypeID, 0);
  uint64_t v7 = v6;
  if (v6)
  {
    CFMutableStringRef v64 = 0;
    id v8 = v6;
    uint64_t v9 = [v8 bytes];
    [v8 length];
    NSAppendPrintF(&v64, (uint64_t)"AMD <%H>", v10, v11, v12, v13, v14, v15, v9);
    v16 = v64;
  }
  else
  {
    v16 = 0;
  }

  CFTypeID v17 = CFDataGetTypeID();
  v18 = CFDictionaryGetTypedValue(v3, @"kCBAdvDataManufacturerDataInternal", v17, 0);
  v19 = v18;
  if (v18)
  {
    CFMutableStringRef v63 = v16;
    id v20 = v18;
    uint64_t v21 = [v20 bytes];
    [v20 length];
    NSAppendPrintF(&v63, (uint64_t)"Mfr <%H>", v22, v23, v24, v25, v26, v27, v21);
    v28 = v63;

    v16 = v28;
  }

  CFTypeID v29 = CFDataGetTypeID();
  v30 = CFDictionaryGetTypedValue(v3, @"kCBAdvDataNonAppleMfgData", v29, 0);
  v31 = v30;
  if (v30)
  {
    CFMutableStringRef v62 = v16;
    id v32 = v30;
    uint64_t v33 = [v32 bytes];
    [v32 length];
    NSAppendPrintF(&v62, (uint64_t)"Mfr <%H>", v34, v35, v36, v37, v38, v39, v33);
    v40 = v62;

    v16 = v40;
  }

  id v41 = (id)getCBAdvertisementDataIsConnectable[0]();
  if (CFDictionaryGetInt64(v3, v41, 0))
  {
    CFMutableStringRef v61 = v16;
    NSAppendPrintF(&v61, (uint64_t)", Cnx", v42, v43, v44, v45, v46, v47, v59);
    v48 = v61;

    v16 = v48;
  }
  if (CFDictionaryGetInt64(v3, @"kCBAdvDataIsExtended", 0))
  {
    CFMutableStringRef v60 = v16;
    NSAppendPrintF(&v60, (uint64_t)", Extended", v49, v50, v51, v52, v53, v54, v59);
    v55 = v60;

    v16 = v55;
  }
  if (v16) {
    v56 = v16;
  }
  else {
    v56 = @"?";
  }
  v57 = v56;

  return v57;
}

- (void)_advertiseParametersAddOSR
{
  __int16 v6 = 5952;
  char v7 = 1;
  if (GestaltGetDeviceClass_sOnce != -1) {
    dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13498);
  }
  char v3 = 6;
  switch(GestaltGetDeviceClass_deviceClass)
  {
    case 1:
      char v3 = 1;
      break;
    case 2:
      char v3 = 2;
      break;
    case 3:
      char v3 = 3;
      break;
    case 4:
      break;
    case 6:
      char v3 = 7;
      break;
    case 7:
      char v3 = 4;
      break;
    default:
      char v3 = 0;
      break;
  }
  char v8 = v3;
  id v4 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v6 length:4];
  appleManufacturerData = self->_appleManufacturerData;
  self->_appleManufacturerData = v4;
}

- (void)_advertiseParametersAddLGWake:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  __int16 v7 = 196;
  [v5 appendBytes:&v7 length:2];
  __int16 v6 = self->_lgDeviceID;
  if ([(NSData *)v6 length] == 6)
  {
    [v5 appendData:v6];
    __int16 v7 = 7;
    [v5 appendBytes:&v7 length:2];
    [v4 setObject:v5 forKeyedSubscript:@"kCBAdvDataManufacturerDataInternal"];
    [v4 setObject:v5 forKeyedSubscript:@"kCBAdvDataNonAppleMfgData"];
  }
}

- (id)_advertiseParameters
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = self;
  objc_sync_enter(v4);
  if ([(NSData *)v4->_lgDeviceID length] == 6) {
    [(CUBLEAdvertiser *)v4 _advertiseParametersAddLGWake:v3];
  }
  if ((v4->_advertiseFlags & 8) != 0) {
    [(CUBLEAdvertiser *)v4 _advertiseParametersAddOSR];
  }
  id v5 = v4->_appleManufacturerData;
  size_t v6 = [(NSData *)v5 length];
  if (v6 - 1 <= 0x19)
  {
    MEMORY[0x1F4188790]();
    __int16 v7 = (char *)v15 - ((v6 + 19) & 0xFFFFFFFFFFFFFFF0);
    *__int16 v7 = v6 + 3;
    *(_WORD *)(v7 + 1) = 19711;
    v7[3] = 0;
    memcpy(v7 + 4, [(NSData *)v5 bytes], v6);
    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:v6 + 4];
    uint64_t v9 = getCBAdvertisementDataAppleMfgData[0]();
    [v3 setObject:v8 forKeyedSubscript:v9];
  }
  unsigned int advertiseFlags = v4->_advertiseFlags;
  uint64_t v11 = getCBAdvertisementDataIsConnectable[0]();
  if ((advertiseFlags & 2) != 0) {
    uint64_t v12 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v12 forKeyedSubscript:v11];

  if ((v4->_advertiseFlags & 4) != 0) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kCBAdvDataIsExtended"];
  }
  uint64_t v13 = getCBManagerIsPrivilegedDaemonKey[0]();
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v13];

  objc_sync_exit(v4);
  return v3;
}

- (void)_ensureStopped
{
  retrier = self->_retrier;
  if (retrier)
  {
    [(CURetrier *)retrier invalidateDirect];
    char v8 = self->_retrier;
    self->_retrier = 0;
  }
  self->_changesPending = 0;
  if (self->_startAdvertisingCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_8;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser _ensureStopped]", 0x1Eu, (uint64_t)"Advertising stop\n", v2, v3, v4, v5, v12);
    }
LABEL_8:
    self->_startAdvertisingCalled = 0;
    [(CBPeripheralManager *)self->_peripheralManager stopAdvertising];
  }
  peripheralManager = self->_peripheralManager;
  if (peripheralManager)
  {
    [(CBPeripheralManager *)peripheralManager setDelegate:0];
    uint64_t v11 = self->_peripheralManager;
    self->_peripheralManager = 0;
  }
}

- (void)_ensureStarted
{
  peripheralManager = self->_peripheralManager;
  if (peripheralManager)
  {
    uint64_t v4 = [(CBPeripheralManager *)peripheralManager state];
    if (v4 != 5)
    {
      unint64_t v9 = v4;
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        return;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      if (v9 > 0xA) {
        uint64_t v11 = "?";
      }
      else {
        uint64_t v11 = off_1E55BDD18[v9];
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0x1Eu, (uint64_t)"Deferring until Bluetooth powered: %s\n", v5, v6, v7, v8, (uint64_t)v11);
      return;
    }
LABEL_9:
    if (!self->_retrier)
    {
      v19 = objc_alloc_init(CURetrier);
      retrier = self->_retrier;
      self->_retrier = v19;

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __33__CUBLEAdvertiser__ensureStarted__block_invoke;
      v48[3] = &unk_1E55BFC18;
      v48[4] = self;
      [(CURetrier *)self->_retrier setActionHandler:v48];
      [(CURetrier *)self->_retrier setDispatchQueue:self->_dispatchQueue];
      [(CURetrier *)self->_retrier setStartTime:CFAbsoluteTimeGetCurrent()];
    }
    if (self->_startAdvertisingCalled)
    {
      if (!self->_changesPending) {
        return;
      }
      uint64_t v21 = [(CUBLEAdvertiser *)self _advertiseParameters];
      advertiseParametersCurrent = self->_advertiseParametersCurrent;
      uint64_t v23 = v21;
      uint64_t v24 = advertiseParametersCurrent;
      if (v23 == v24)
      {

        self->_changesPending = 0;
      }
      else
      {
        uint64_t v25 = v24;
        if ((v23 == 0) == (v24 != 0))
        {

          self->_changesPending = 0;
          goto LABEL_32;
        }
        char v26 = [(NSDictionary *)v23 isEqual:v24];

        self->_changesPending = 0;
        if ((v26 & 1) == 0)
        {
LABEL_32:
          v40 = self->_ucat;
          if (v40->var0 <= 30)
          {
            if (v40->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
                goto LABEL_44;
              }
              v40 = self->_ucat;
            }
            id v41 = [(CUBLEAdvertiser *)self _advertiseParametersSummary:v23];
            LogPrintF((uint64_t)v40, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0x1Eu, (uint64_t)"Advertiser update: %@\n", v42, v43, v44, v45, (uint64_t)v41);
          }
LABEL_44:
          objc_storeStrong((id *)&self->_advertiseParametersCurrent, v21);
          [(CBPeripheralManager *)self->_peripheralManager stopAdvertising];
          goto LABEL_45;
        }
      }
      uint64_t v39 = self->_ucat;
      if (v39->var0 <= 10)
      {
        if (v39->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v39, 0xAu)) {
            goto LABEL_46;
          }
          uint64_t v39 = self->_ucat;
        }
        LogPrintF((uint64_t)v39, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0xAu, (uint64_t)"Advertiser no changes\n", v27, v28, v29, v30, v47);
      }
LABEL_46:

      return;
    }
    v31 = [(CUBLEAdvertiser *)self _advertiseParameters];
    id v32 = self->_ucat;
    if (v32->var0 <= 30)
    {
      if (v32->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
          goto LABEL_38;
        }
        id v32 = self->_ucat;
      }
      uint64_t v33 = [(CUBLEAdvertiser *)self _advertiseParametersSummary:v31];
      LogPrintF((uint64_t)v32, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0x1Eu, (uint64_t)"Advertiser start: %@\n", v34, v35, v36, v37, (uint64_t)v33);
    }
LABEL_38:
    uint64_t v46 = self->_advertiseParametersCurrent;
    self->_advertiseParametersCurrent = v31;
    uint64_t v23 = v31;

    self->_changesPending = 0;
    self->_startAdvertisingCalled = 1;
LABEL_45:
    [(CBPeripheralManager *)self->_peripheralManager startAdvertising:v23];
    goto LABEL_46;
  }
  uint64_t v12 = (CBPeripheralManager *)[objc_alloc((Class)getCBPeripheralManagerClass[0]()) initWithDelegate:self queue:self->_dispatchQueue];
  uint64_t v13 = self->_peripheralManager;
  self->_peripheralManager = v12;

  v18 = self->_peripheralManager;
  if (v18)
  {
    if ([(CBPeripheralManager *)v18 state] != 5) {
      return;
    }
    goto LABEL_9;
  }
  uint64_t v38 = self->_ucat;
  if (v38->var0 > 90) {
    return;
  }
  if (v38->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v38, 0x5Au)) {
      return;
    }
    uint64_t v38 = self->_ucat;
  }
  LogPrintF((uint64_t)v38, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0x5Au, (uint64_t)"### Create CBPeripheralManager failed\n", v14, v15, v16, v17, v50);
}

uint64_t __33__CUBLEAdvertiser__ensureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureStarted];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      id v4 = self->_invalidationHandler;
    }
    else
    {
      id v4 = 0;
    }
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v5, v6, v7, v8, v11);
    }
  }
}

- (void)_invalidate
{
  [(CUBLEAdvertiser *)self _ensureStopped];
  [(CUBLEAdvertiser *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CUBLEAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__CUBLEAdvertiser_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 25)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 25) = 1;
  uint64_t v10 = *(void **)(result + 32);
  uint64_t v11 = (int *)v10[7];
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void **)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = (int *)v10[7];
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUBLEAdvertiser invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v13);
    uint64_t v10 = *(void **)(v9 + 32);
  }
LABEL_6:
  return [v10 _invalidate];
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CUBLEAdvertiser_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

uint64_t __27__CUBLEAdvertiser_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (int *)v9[7];
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUBLEAdvertiser activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
      uint64_t v9 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = (int *)v9[7];
      goto LABEL_3;
    }
  }
LABEL_5:
  return [v9 _ensureStarted];
}

- (void)setLgDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  lgDeviceID = v6->_lgDeviceID;
  uint64_t v8 = v5;
  uint64_t v9 = lgDeviceID;
  if (v8 == v9)
  {
  }
  else
  {
    uint64_t v10 = v9;
    if ((v8 == 0) != (v9 != 0))
    {
      char v11 = [(NSData *)v8 isEqual:v9];

      if (v11) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&v6->_lgDeviceID, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = v6->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__CUBLEAdvertiser_setLgDeviceID___block_invoke;
      block[3] = &unk_1E55BFC18;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_9:
  objc_sync_exit(v6);
}

uint64_t __33__CUBLEAdvertiser_setLgDeviceID___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  return [*(id *)(a1 + 32) _ensureStarted];
}

- (void)setLgBTAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  lgBTAddress = v6->_lgBTAddress;
  uint64_t v8 = v5;
  uint64_t v9 = lgBTAddress;
  if (v8 == v9)
  {
  }
  else
  {
    uint64_t v10 = v9;
    if ((v8 == 0) != (v9 != 0))
    {
      char v11 = [(NSData *)v8 isEqual:v9];

      if (v11) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&v6->_lgBTAddress, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = v6->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __34__CUBLEAdvertiser_setLgBTAddress___block_invoke;
      block[3] = &unk_1E55BFC18;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_9:
  objc_sync_exit(v6);
}

uint64_t __34__CUBLEAdvertiser_setLgBTAddress___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  return [*(id *)(a1 + 32) _ensureStarted];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC338;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)setAppleManufacturerData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  appleManufacturerData = v6->_appleManufacturerData;
  uint64_t v8 = v5;
  uint64_t v9 = appleManufacturerData;
  if (v8 == v9)
  {
  }
  else
  {
    uint64_t v10 = v9;
    if ((v8 == 0) != (v9 != 0))
    {
      char v11 = [(NSData *)v8 isEqual:v9];

      if (v11) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&v6->_appleManufacturerData, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = v6->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__CUBLEAdvertiser_setAppleManufacturerData___block_invoke;
      block[3] = &unk_1E55BFC18;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_9:
  objc_sync_exit(v6);
}

uint64_t __44__CUBLEAdvertiser_setAppleManufacturerData___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  return [*(id *)(a1 + 32) _ensureStarted];
}

- (void)setAdvertiseFlags:(unsigned int)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_advertiseFlags != a3)
  {
    v4->_unsigned int advertiseFlags = a3;
    if (v4->_activateCalled)
    {
      dispatchQueue = v4->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__CUBLEAdvertiser_setAdvertiseFlags___block_invoke;
      block[3] = &unk_1E55BFC18;
      block[4] = v4;
      dispatch_async(dispatchQueue, block);
    }
  }
  objc_sync_exit(v4);
}

uint64_t __37__CUBLEAdvertiser_setAdvertiseFlags___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  return [*(id *)(a1 + 32) _ensureStarted];
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUBLEAdvertiser;
  [(CUBLEAdvertiser *)&v4 dealloc];
}

- (CUBLEAdvertiser)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUBLEAdvertiser;
  uint64_t v2 = [(CUBLEAdvertiser *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUBLEAdvertiser;
    objc_super v4 = v3;
  }

  return v3;
}

@end