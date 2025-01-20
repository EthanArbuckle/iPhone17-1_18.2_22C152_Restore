@interface CUWiFiScanner
- (CUWiFiScanner)init;
- (NSString)label;
- (NSString)ssid;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)errorHandler;
- (id)invalidationHandler;
- (unsigned)changeFlags;
- (unsigned)scanFlags;
- (void)_cleanup;
- (void)_invalidated;
- (void)_scanWiFiFinished:(id)a3 status:(int)a4;
- (void)_scanWiFiProcessResult:(id)a3;
- (void)_scanWiFiStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setScanFlags:(unsigned int)a3;
- (void)setSsid:(id)a3;
- (void)suspend;
@end

@implementation CUWiFiScanner

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setSsid:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setScanFlags:(unsigned int)a3
{
  self->_scanFlags = a3;
}

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (NSString)label
{
  return self->_label;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)_scanWiFiProcessResult:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  int v51 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  CFDictionaryGetHardwareAddress(v4, @"bssid", (char *)&v49, 6uLL, &v51);
  if (v51)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x32u)) {
          goto LABEL_52;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiScanner _scanWiFiProcessResult:]", 0x32u, (uint64_t)"### No BSSID for scan result\n", v5, v6, v7, v8, v45);
    }
LABEL_52:
    v38 = 0;
    v11 = 0;
    id v30 = 0;
    v21 = 0;
    id v26 = 0;
    goto LABEL_47;
  }
  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v49 length:6];
  uint64_t v10 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v9];
  v11 = (CUWiFiDevice *)v10;
  if (!v10) {
    v11 = objc_alloc_init(CUWiFiDevice);
  }
  [(CUWiFiDevice *)v11 setBssid:v9];
  [(CUWiFiDevice *)v11 setRawScanResult:v4];
  if ([(CUWiFiDevice *)v11 present] <= 0) {
    [(CUWiFiDevice *)v11 setPresent:1];
  }
  LOWORD(v53) = 0;
  uint64_t v52 = 0;
  *(_DWORD *)((char *)&v53 + 2) = v49;
  HIWORD(v53) = v50;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v52];
  [(CUWiFiDevice *)v11 setIdentifier:v12];

  CFTypeID TypeID = CFDataGetTypeID();
  v14 = CFDictionaryGetTypedValue(v4, @"ie", TypeID, 0);
  v46 = (void *)v9;
  if (!v14) {
    goto LABEL_12;
  }
  v15 = [(CUWiFiDevice *)v11 ieData];
  id v16 = v14;
  id v17 = v15;
  if (v16 == v17)
  {

    goto LABEL_12;
  }
  v18 = v17;
  if (v17)
  {
    char v19 = [v16 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    uint64_t v20 = 0;
    goto LABEL_15;
  }

LABEL_14:
  [(CUWiFiDevice *)v11 setIeData:v16];
  uint64_t v20 = 1;
LABEL_15:
  v21 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"platformNetwork"];
  if (v21) {
    [(CUWiFiDevice *)v11 setPlatformObject:v21];
  }
  int64_t Int64Ranged = CFDictionaryGetInt64Ranged(v4, @"rssi", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v51);
  if ((Int64Ranged & 0x80000000) != 0 && [(CUWiFiDevice *)v11 rssi] != Int64Ranged)
  {
    [(CUWiFiDevice *)v11 setRssi:Int64Ranged];
    uint64_t v20 = v20 | 2;
  }
  CFTypeID v23 = CFStringGetTypeID();
  v24 = CFDictionaryGetTypedValue(v4, @"ssid", v23, 0);
  v25 = [(CUWiFiDevice *)v11 ssid];
  id v26 = v24;
  id v27 = v25;
  if (v26 == v27)
  {

    goto LABEL_27;
  }
  v28 = v27;
  if ((v26 == 0) == (v27 != 0))
  {

    goto LABEL_26;
  }
  char v29 = [v26 isEqual:v27];

  if ((v29 & 1) == 0)
  {
LABEL_26:
    [(CUWiFiDevice *)v11 setSsid:v26];
    uint64_t v20 = v20 | 4;
  }
LABEL_27:
  id v30 = v14;
  uint64_t v47 = 0;
  v48 = (unsigned __int8 *)[v30 bytes];
  IEGetVendorSpecific(v48, (unint64_t)&v48[[v30 length]], 10502144, &v48, &v47, 0);
  if (v47) {
    uint64_t v20 = [(CUWiFiDevice *)v11 _updateWithDeviceIE:v48 end:&v48[v47]] | v20;
  }
  if (v10)
  {
    unsigned int changeFlags = self->_changeFlags;
    if (changeFlags != -1 && (changeFlags & v20) == 0)
    {
LABEL_46:
      v38 = v46;
      goto LABEL_47;
    }
    v36 = self->_ucat;
    if (v36->var0 <= 30)
    {
      if (v36->var0 != -1)
      {
LABEL_34:
        LogPrintF((uint64_t)v36, (uint64_t)"-[CUWiFiScanner _scanWiFiProcessResult:]", 0x1Eu, (uint64_t)"WiFi scan changed: %@, %#{flags}\n", v31, v32, v33, v34, (uint64_t)v11);
        goto LABEL_44;
      }
      if (_LogCategory_Initialize((uint64_t)v36, 0x1Eu))
      {
        v36 = self->_ucat;
        goto LABEL_34;
      }
    }
LABEL_44:
    deviceChangedHandler = (void (**)(id, CUWiFiDevice *, uint64_t))self->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v11, v20);
    }
    goto LABEL_46;
  }
  v37 = self->_ucat;
  v38 = v46;
  if (v37->var0 <= 30)
  {
    if (v37->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x1Eu)) {
        goto LABEL_39;
      }
      v37 = self->_ucat;
    }
    LogPrintF((uint64_t)v37, (uint64_t)"-[CUWiFiScanner _scanWiFiProcessResult:]", 0x1Eu, (uint64_t)"WiFi scan found: %@\n", v31, v32, v33, v34, (uint64_t)v11);
  }
LABEL_39:
  devices = self->_devices;
  if (!devices)
  {
    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v41 = self->_devices;
    self->_devices = v40;

    devices = self->_devices;
  }
  [(NSMutableDictionary *)devices setObject:v11 forKeyedSubscript:v46];
  deviceFoundHandler = (void (**)(id, CUWiFiDevice *))self->_deviceFoundHandler;
  if (deviceFoundHandler) {
    deviceFoundHandler[2](deviceFoundHandler, v11);
  }
LABEL_47:
}

- (void)_scanWiFiFinished:(id)a3 status:(int)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t v8 = [v6 count];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiScanner _scanWiFiFinished:status:]", 0x1Eu, (uint64_t)"WiFi scan finish: %ld results, status %#m\n", v9, v10, v11, v12, v8);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (self->_invalidateCalled)
  {
    [(CUWiFiScanner *)self _invalidated];
    goto LABEL_39;
  }
  if (self->_suspended) {
    goto LABEL_39;
  }
  if (a4)
  {
    errorHandler = (void (**)(id, void *))self->_errorHandler;
    if (errorHandler)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28760];
      uint64_t v16 = a4;
      uint64_t v60 = *MEMORY[0x1E4F28568];
      uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, a4, 0, 0));
      v18 = (void *)v17;
      char v19 = @"?";
      if (v17) {
        char v19 = (__CFString *)v17;
      }
      v61[0] = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
      v21 = [v14 errorWithDomain:v15 code:v16 userInfo:v20];
      errorHandler[2](errorHandler, v21);
    }
  }
  [(NSMutableDictionary *)self->_devices enumerateKeysAndObjectsUsingBlock:&__block_literal_global_10193];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v22 = v6;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v22);
        }
        [(CUWiFiScanner *)self _scanWiFiProcessResult:*(void *)(*((void *)&v54 + 1) + 8 * i)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v24);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v27 = [(NSMutableDictionary *)self->_devices allKeys];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v51;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v50 + 1) + 8 * v31);
        uint64_t v33 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v32];
        if ((int)[v33 present] <= -2)
        {
          v38 = self->_ucat;
          if (v38->var0 <= 30)
          {
            if (v38->var0 != -1) {
              goto LABEL_28;
            }
            if (_LogCategory_Initialize((uint64_t)v38, 0x1Eu))
            {
              v38 = self->_ucat;
LABEL_28:
              LogPrintF((uint64_t)v38, (uint64_t)"-[CUWiFiScanner _scanWiFiFinished:status:]", 0x1Eu, (uint64_t)"WiFi scan lost: %@\n", v34, v35, v36, v37, (uint64_t)v33);
            }
          }
          [(NSMutableDictionary *)self->_devices removeObjectForKey:v32];
          deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
          if (deviceLostHandler) {
            deviceLostHandler[2](deviceLostHandler, v33);
          }
        }

        ++v31;
      }
      while (v29 != v31);
      uint64_t v40 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
      uint64_t v29 = v40;
    }
    while (v40);
  }

  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    v42 = scanTimer;
    dispatch_source_cancel(v42);
    v43 = self->_scanTimer;
    self->_scanTimer = 0;
  }
  v44 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  uint64_t v45 = self->_scanTimer;
  self->_scanTimer = v44;

  v46 = self->_scanTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__CUWiFiScanner__scanWiFiFinished_status___block_invoke_2;
  handler[3] = &unk_1E55BFC18;
  handler[4] = self;
  dispatch_source_set_event_handler(v46, handler);
  uint64_t v47 = self->_scanTimer;
  dispatch_time_t v48 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v47, v48, 0xFFFFFFFFFFFFFFFFLL, 0x4A817C80uLL);
  dispatch_resume((dispatch_object_t)self->_scanTimer);
LABEL_39:
}

uint64_t __42__CUWiFiScanner__scanWiFiFinished_status___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scanWiFiStart];
}

void __42__CUWiFiScanner__scanWiFiFinished_status___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_msgSend(v3, "setPresent:", objc_msgSend(v3, "present") - 1);
}

- (void)_scanWiFiStart
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = v3;
  unsigned int scanFlags = self->_scanFlags;
  if ((scanFlags & 1) == 0)
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"channel_2pt4GHz"];
    unsigned int scanFlags = self->_scanFlags;
  }
  if ((scanFlags & 2) == 0) {
    [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"channel_5GHz"];
  }
  ssid = self->_ssid;
  if (ssid) {
    [v8 setObject:ssid forKeyedSubscript:@"ssid"];
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_11;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiScanner _scanWiFiStart]", 0x1Eu, (uint64_t)"WiFi scan start\n", v4, v5, v6, v7, v23[0]);
  }
LABEL_11:
  self->_scanning = 1;
  dispatchQueue = self->_dispatchQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = (uint64_t)__31__CUWiFiScanner__scanWiFiStart__block_invoke;
  v23[3] = (uint64_t)&unk_1E55BF100;
  v23[4] = (uint64_t)self;
  int v13 = WiFiScan_b((const __CFDictionary *)v8, dispatchQueue, v23);
  if (v13)
  {
    errorHandler = (void (**)(id, void *))self->_errorHandler;
    if (errorHandler)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28760];
      uint64_t v17 = v13;
      uint64_t v24 = *MEMORY[0x1E4F28568];
      uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v13, 0, 0));
      char v19 = (void *)v18;
      uint64_t v20 = @"?";
      if (v18) {
        uint64_t v20 = (__CFString *)v18;
      }
      v25[0] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      id v22 = [v15 errorWithDomain:v16 code:v17 userInfo:v21];
      errorHandler[2](errorHandler, v22);
    }
  }
}

uint64_t __31__CUWiFiScanner__scanWiFiStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 26) = 0;
  return [*(id *)(a1 + 32) _scanWiFiFinished:a3 status:a2];
}

- (void)resume
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__CUWiFiScanner_resume__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__CUWiFiScanner_resume__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 48);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUWiFiScanner resume]_block_invoke", 0x1Eu, (uint64_t)"Resume\n", a5, a6, a7, a8, v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }
LABEL_5:
  *(unsigned char *)(v9 + 40) = 0;
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 8) && !*(unsigned char *)(result + 26) && !*(void *)(result + 32))
  {
    return [(id)result _scanWiFiStart];
  }
  return result;
}

- (void)suspend
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CUWiFiScanner_suspend__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __24__CUWiFiScanner_suspend__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUWiFiScanner suspend]_block_invoke", 0x1Eu, (uint64_t)"Suspend\n", a5, a6, a7, a8, v16);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 48);
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v12 = *(void **)(v9 + 32);
  if (v12)
  {
    uint64_t v13 = v12;
    dispatch_source_cancel(v13);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 32);
    *(void *)(v14 + 32) = 0;

    uint64_t v9 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v9 + 40) = 1;
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!*(_WORD *)&self->_invalidateDone)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    [(CUWiFiScanner *)self _cleanup];
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiScanner _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v4, v5, v6, v7, v10);
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CUWiFiScanner_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__CUWiFiScanner_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 24)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 24) = 1;
  uint64_t v10 = *(void *)(result + 32);
  if (!*(unsigned char *)(v10 + 25))
  {
    BOOL v11 = *(int **)(v10 + 48);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize(*(void *)(v10 + 48), 0x1Eu);
        uint64_t v10 = *(void *)(v9 + 32);
        if (!v12) {
          goto LABEL_7;
        }
        BOOL v11 = *(int **)(v10 + 48);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUWiFiScanner invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v17);
      uint64_t v10 = *(void *)(v9 + 32);
    }
  }
LABEL_7:
  uint64_t v13 = *(void **)(v10 + 32);
  if (v13)
  {
    uint64_t v14 = v13;
    dispatch_source_cancel(v14);
    uint64_t v15 = *(void *)(v9 + 32);
    uint64_t v16 = *(void **)(v15 + 32);
    *(void *)(v15 + 32) = 0;

    uint64_t v10 = *(void *)(v9 + 32);
  }
  return [(id)v10 _invalidated];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CUWiFiScanner_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CUWiFiScanner_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUWiFiScanner activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v14);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 48);
      goto LABEL_3;
    }
  }
LABEL_5:
  *(unsigned char *)(v9 + 8) = 1;
  BOOL v12 = *(void **)(a1 + 32);
  return [v12 _scanWiFiStart];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CDCD8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)_cleanup
{
  [(NSMutableDictionary *)self->_devices removeAllObjects];
  devices = self->_devices;
  self->_devices = 0;

  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    id v5 = scanTimer;
    dispatch_source_cancel(v5);
    uint64_t v6 = self->_scanTimer;
    self->_scanTimer = 0;
  }
  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0;

  id deviceChangedHandler = self->_deviceChangedHandler;
  self->_id deviceChangedHandler = 0;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled) {
    FatalErrorF((uint64_t)"Dealloc without invalidate", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v10.receiver);
  }
  [(CUWiFiScanner *)self _cleanup];
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CUWiFiScanner;
  [(CUWiFiScanner *)&v10 dealloc];
}

- (CUWiFiScanner)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUWiFiScanner;
  uint64_t v2 = [(CUWiFiScanner *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_unsigned int changeFlags = 5;
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_unsigned int scanFlags = 3;
    v3->_ucat = (LogCategory *)&gLogCategory_CUWiFiScanner;
  }
  return v3;
}

@end