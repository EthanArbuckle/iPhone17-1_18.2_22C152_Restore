@interface CUWACSession
- (CUWACSession)init;
- (CUWiFiDevice)wacDevice;
- (NSDictionary)configuration;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)progressHandler;
- (id)promptForSetupCodeHandler;
- (int)_runEasyConfigPostConfig;
- (int)_runEasyConfigPreConfig;
- (int)_runFinish;
- (int)_runJoinSoftAP;
- (int)_runRestoreOriginalWiFi;
- (int)_runSaveOriginalWiFi;
- (void)_cleanup;
- (void)_progress:(unsigned int)a3 info:(id)a4;
- (void)_run;
- (void)_runEasyConfigPreConfigStart;
- (void)_runEasyConfigProgress:(int)a3 info:(id)a4;
- (void)_runFinishRestored:(int)a3;
- (void)_runJoinSoftAPFinished:(int)a3;
- (void)_runJoinSoftAPStart;
- (void)_runRestoreOriginalWiFiFinished:(int)a3;
- (void)_runRestoreOriginalWiFiStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setConfiguration:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForSetupCodeHandler:(id)a3;
- (void)setWacDevice:(id)a3;
- (void)trySetupCode:(id)a3;
@end

@implementation CUWACSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wacDevice, 0);
  objc_storeStrong(&self->_promptForSetupCodeHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_easyConfigDevice, 0);
  objc_storeStrong((id *)&self->_originalWiFiInfo, 0);
}

- (void)setWacDevice:(id)a3
{
}

- (CUWiFiDevice)wacDevice
{
  return self->_wacDevice;
}

- (void)setPromptForSetupCodeHandler:(id)a3
{
}

- (id)promptForSetupCodeHandler
{
  return self->_promptForSetupCodeHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
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

- (void)setConfiguration:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)_runFinishRestored:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v23[1] = *MEMORY[0x1E4F143B8];
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0;

  if (v3)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
          goto LABEL_9;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runFinishRestored:]", 0x3Cu, (uint64_t)"### Finish restore original WiFi failed: %#m\n", v6, v7, v8, v9, v3);
    }
LABEL_9:
    self->_finishState = 3;
    v22 = @"eo";
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28760];
    uint64_t v13 = (int)v3;
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v3, 0, 0));
    v15 = (void *)v14;
    v16 = @"?";
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v21 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v18 = [v11 errorWithDomain:v12 code:v13 userInfo:v17];
    v23[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(CUWACSession *)self _progress:30 info:v19];

    return;
  }
  [(CUWACSession *)self _progress:20 info:0];
  self->_finishState = 4;
  [(CUWACSession *)self _run];
}

- (int)_runFinish
{
  if (!self->_finishState)
  {
    originalWiFiInfo = self->_originalWiFiInfo;
    if (!originalWiFiInfo)
    {
      uint64_t v7 = self;
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    self->_easyConfigPostConfigState = 1;
    dispatchQueue = self->_dispatchQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __26__CUWACSession__runFinish__block_invoke;
    v9[3] = &unk_1E55BF010;
    v9[4] = self;
    uint64_t v5 = WiFiRestoreNetwork((const __CFDictionary *)originalWiFiInfo, dispatchQueue, v9);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = self;
LABEL_6:
      [(CUWACSession *)v7 _runFinishRestored:v6];
    }
  }
  return self->_finishState;
}

uint64_t __26__CUWACSession__runFinish__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runFinishRestored:a2];
}

- (int)_runEasyConfigPostConfig
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t easyConfigPostConfigState = self->_easyConfigPostConfigState;
  if (easyConfigPostConfigState == 4) {
    return self->_easyConfigPostConfigState;
  }
  if (!easyConfigPostConfigState)
  {
    self->_uint64_t easyConfigPostConfigState = 1;
    [(CUWACSession *)self _progress:160 info:0];
    easyConfigDevice = self->_easyConfigDevice;
    if (easyConfigDevice)
    {
      [(EasyConfigDevice *)easyConfigDevice setPostConfigMetrics:&self->_easyConfigPostConfigMetrics];
      [(EasyConfigDevice *)self->_easyConfigDevice resumePostConfig];
      return self->_easyConfigPostConfigState;
    }
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      goto LABEL_14;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
      {
LABEL_14:
        self->_uint64_t easyConfigPostConfigState = 3;
        v33 = @"eo";
        v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F28760];
        uint64_t v31 = *MEMORY[0x1E4F28568];
        v17 = NSString;
        if (MEMORY[0x1E4F5E2B0] && (uint64_t v18 = CUErrorCodesTableGet(), (v19 = *(const char **)(v18 + 8)) != 0))
        {
          if (*(_DWORD *)v18 != -6762)
          {
            uint64_t v20 = (const char **)(v18 + 24);
            v19 = "";
            while (1)
            {
              v21 = *v20;
              if (!*v20) {
                break;
              }
              int v22 = *((_DWORD *)v20 - 2);
              v20 += 2;
              if (v22 == -6762)
              {
                v19 = v21;
                break;
              }
            }
          }
        }
        else
        {
          v19 = "";
        }
        uint64_t v23 = [v17 stringWithUTF8String:v19];
        v24 = (void *)v23;
        v25 = @"?";
        if (v23) {
          v25 = (__CFString *)v23;
        }
        v32 = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v27 = [v15 errorWithDomain:v16 code:-6762 userInfo:v26];
        v34[0] = v27;
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
        [(CUWACSession *)self _progress:30 info:v28];

        return self->_easyConfigPostConfigState;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runEasyConfigPostConfig]", 0x5Au, (uint64_t)"### No EasyConfigDevice to resume?\n", v8, v9, v10, v11, v30);
    goto LABEL_14;
  }
  uint64_t v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x1Eu)) {
        return self->_easyConfigPostConfigState;
      }
      uint64_t v13 = self->_ucat;
      uint64_t easyConfigPostConfigState = self->_easyConfigPostConfigState;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUWACSession _runEasyConfigPostConfig]", 0x1Eu, (uint64_t)"EasyConfig PostConfig hasn't succeeded yet (%d)\n", v2, v3, v4, v5, easyConfigPostConfigState);
  }
  return self->_easyConfigPostConfigState;
}

- (void)_runRestoreOriginalWiFiFinished:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v23[1] = *MEMORY[0x1E4F143B8];
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0;

  self->_easyConfigPostConfigMetrics.wifiJoinDestinationAPError = v3;
  if (v3)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
          goto LABEL_9;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runRestoreOriginalWiFiFinished:]", 0x3Cu, (uint64_t)"### Restore original WiFi failed: %#m\n", v6, v7, v8, v9, v3);
    }
LABEL_9:
    self->_restoreOriginalWiFiState = 3;
    int v22 = @"eo";
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28760];
    uint64_t v13 = (int)v3;
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v3, 0, 0));
    v15 = (void *)v14;
    uint64_t v16 = @"?";
    if (v14) {
      uint64_t v16 = (__CFString *)v14;
    }
    v21 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v18 = [v11 errorWithDomain:v12 code:v13 userInfo:v17];
    v23[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(CUWACSession *)self _progress:30 info:v19];

    return;
  }
  self->_easyConfigPostConfigMetrics.secondsToGetLinkUpOnDestination = CFAbsoluteTimeGetCurrent()
                                                                     - self->_restoreStartTime;
  [(CUWACSession *)self _progress:140 info:0];
  self->_restoreOriginalWiFiState = 4;
  [(CUWACSession *)self _run];
}

- (void)_runRestoreOriginalWiFiStart
{
  v36[1] = *MEMORY[0x1E4F143B8];
  [(CUWACSession *)self _progress:130 info:0];
  uint64_t v3 = self->_originalWiFiInfo;
  CFDictionaryRef v8 = (const __CFDictionary *)v3;
  if (!v3)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_17;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runRestoreOriginalWiFiStart]", 0x5Au, (uint64_t)"### No original WiFi info to restore\n", v4, v5, v6, v7, v30);
    }
LABEL_17:
    LODWORD(v19) = -6705;
    goto LABEL_18;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v3, @"RSSI");
  if (Value)
  {
    int v32 = 0;
    LODWORD(Value) = CFGetInt64(Value, &v32);
  }
  self->_easyConfigPostConfigMetrics.rssiOfDestinationAP = (int)Value;
  CFStringRef v10 = (const __CFString *)CFDictionaryGetValue(v8, @"SNR");
  if (v10)
  {
    int v32 = 0;
    LODWORD(v10) = CFGetInt64(v10, &v32);
  }
  self->_easyConfigPostConfigMetrics.snrOfDestinationAP = v10;
  CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v8, @"CHANNEL");
  if (v11)
  {
    int v32 = 0;
    LODWORD(v11) = CFGetInt64(v11, &v32);
  }
  self->_easyConfigPostConfigMetrics.channelOfDestinationAP = v11;
  self->_restoreStartTime = CFAbsoluteTimeGetCurrent();
  dispatchQueue = self->_dispatchQueue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __44__CUWACSession__runRestoreOriginalWiFiStart__block_invoke;
  v31[3] = &unk_1E55BF010;
  v31[4] = self;
  uint64_t v13 = WiFiRestoreNetwork(v8, dispatchQueue, v31);
  if (v13)
  {
    uint64_t v19 = v13;
    uint64_t v20 = self->_ucat;
    if (v20->var0 <= 60)
    {
      if (v20->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v20, 0x3Cu)) {
          goto LABEL_18;
        }
        uint64_t v20 = self->_ucat;
      }
      LogPrintF((uint64_t)v20, (uint64_t)"-[CUWACSession _runRestoreOriginalWiFiStart]", 0x3Cu, (uint64_t)"### Restore original WiFi start failed: %#m\n", v14, v15, v16, v17, v19);
    }
LABEL_18:
    self->_restoreOriginalWiFiState = 3;
    v35 = @"eo";
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28760];
    uint64_t v23 = (int)v19;
    uint64_t v33 = *MEMORY[0x1E4F28568];
    uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v19, 0, 0));
    v25 = (void *)v24;
    v26 = @"?";
    if (v24) {
      v26 = (__CFString *)v24;
    }
    v34 = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v28 = [v21 errorWithDomain:v22 code:v23 userInfo:v27];
    v36[0] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    [(CUWACSession *)self _progress:30 info:v29];
  }
}

uint64_t __44__CUWACSession__runRestoreOriginalWiFiStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runRestoreOriginalWiFiFinished:a2];
}

- (int)_runRestoreOriginalWiFi
{
  uint64_t restoreOriginalWiFiState = self->_restoreOriginalWiFiState;
  if (restoreOriginalWiFiState != 4)
  {
    if (restoreOriginalWiFiState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
            return self->_restoreOriginalWiFiState;
          }
          ucat = self->_ucat;
          uint64_t restoreOriginalWiFiState = self->_restoreOriginalWiFiState;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runRestoreOriginalWiFi]", 0x1Eu, (uint64_t)"Restore original WiFi hasn't succeeded yet (%d)\n", v2, v3, v4, v5, restoreOriginalWiFiState);
      }
    }
    else
    {
      self->_uint64_t restoreOriginalWiFiState = 1;
      [(CUWACSession *)self _runRestoreOriginalWiFiStart];
    }
  }
  return self->_restoreOriginalWiFiState;
}

- (void)_runEasyConfigProgress:(int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v29[1] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v10 = (const __CFDictionary *)a4;
  if ((int)v4 <= 39)
  {
    if ((int)v4 > 19)
    {
      if (v4 == 20)
      {
        CFStringRef v11 = self;
        uint64_t v12 = 90;
        goto LABEL_25;
      }
      if (v4 == 30)
      {
        [(CUWACSession *)self _progress:100 info:v10];
        CFStringRef v11 = self;
        uint64_t v12 = 110;
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    if (v4 != 2)
    {
      if (v4 == 10)
      {
        CFStringRef v11 = self;
        uint64_t v12 = 70;
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    id v13 = (id)getEasyConfigKey_ReasonError[0]();
    CFTypeID TypeID = CFErrorGetTypeID();
    uint64_t v19 = CFDictionaryGetTypedValue(v10, v13, TypeID, 0);
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_21:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runEasyConfigProgress:info:]", 0x1Eu, (uint64_t)"EasyConfig final: %{error}\n", v15, v16, v17, v18, (uint64_t)v19);
        goto LABEL_31;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_21;
      }
    }
LABEL_31:
    if (self->_easyConfigPreConfigState == 1)
    {
      if (v19)
      {
        self->_easyConfigPreConfigState = 3;
        v28 = @"eo";
        v29[0] = v19;
        uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v23 = (void **)v29;
        uint64_t v24 = &v28;
LABEL_37:
        v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
        [(CUWACSession *)self _progress:30 info:v25];
      }
    }
    else if (self->_easyConfigPostConfigState == 1)
    {
      if (!v19)
      {
        self->_uint64_t easyConfigPostConfigState = 4;
        [(CUWACSession *)self _run];
        goto LABEL_38;
      }
      self->_uint64_t easyConfigPostConfigState = 3;
      v26 = @"eo";
      v27 = v19;
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v23 = &v27;
      uint64_t v24 = &v26;
      goto LABEL_37;
    }
LABEL_38:

    goto LABEL_26;
  }
  if ((int)v4 <= 59)
  {
    if (v4 == 40)
    {
      [(CUWACSession *)self _progress:120 info:v10];
      if (self->_easyConfigPreConfigState == 1)
      {
        self->_easyConfigPreConfigState = 4;
        [(CUWACSession *)self _run];
      }
      goto LABEL_26;
    }
    if (v4 == 50)
    {
      CFStringRef v11 = self;
      uint64_t v12 = 150;
      goto LABEL_25;
    }
  }
  else
  {
    switch(v4)
    {
      case '<':
        [(CUWACSession *)self _progress:170 info:v10];
        CFStringRef v11 = self;
        uint64_t v12 = 180;
        goto LABEL_25;
      case 'F':
        CFStringRef v11 = self;
        uint64_t v12 = 190;
        goto LABEL_25;
      case 'd':
        CFStringRef v11 = self;
        uint64_t v12 = 200;
LABEL_25:
        [(CUWACSession *)v11 _progress:v12 info:v10];
        goto LABEL_26;
    }
  }
LABEL_27:
  v21 = self->_ucat;
  if (v21->var0 <= 30)
  {
    if (v21->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v21, 0x1Eu)) {
        goto LABEL_26;
      }
      v21 = self->_ucat;
    }
    LogPrintF((uint64_t)v21, (uint64_t)"-[CUWACSession _runEasyConfigProgress:info:]", 0x1Eu, (uint64_t)"EasyConfig unknown event %d %@\n", v6, v7, v8, v9, v4);
  }
LABEL_26:
}

- (void)_runEasyConfigPreConfigStart
{
  v45[1] = *MEMORY[0x1E4F143B8];
  [(CUWACSession *)self _progress:60 info:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = [(CUWiFiDevice *)self->_wacDevice deviceIEDeviceID];
  if (v8)
  {
    uint64_t v9 = getEasyConfigKey_DeviceID[0]();
    [v3 setObject:v8 forKeyedSubscript:v9];

    unsigned int v10 = [(CUWiFiDevice *)self->_wacDevice deviceIEFlags];
    CFStringRef v11 = [NSNumber numberWithUnsignedLongLong:(v10 >> 31) | (((v10 >> 14) & 1) << 17) & 0xFFEBFFFF | (((v10 >> 13) & 1) << 18) & 0xFFEFFFFF | (v10 >> 27) & 4 | (((v10 >> 11) & 1) << 20)];
    uint64_t v12 = getEasyConfigKey_Flags[0]();
    [v3 setObject:v11 forKeyedSubscript:v12];

    id v13 = self->_originalWiFiInfo;
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = (id)[(NSDictionary *)self->_configuration mutableCopy];
      if (!v15) {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      uint64_t v16 = [v14 objectForKeyedSubscript:@"password"];

      if (v16)
      {
        [v15 setObject:v16 forKeyedSubscript:@"wifiPSK"];
        goto LABEL_11;
      }
      ucat = self->_ucat;
      if (ucat->var0 <= 50)
      {
        if (ucat->var0 != -1)
        {
LABEL_9:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runEasyConfigPreConfigStart]", 0x32u, (uint64_t)"### No WiFI password to configure\n", v17, v18, v19, v20, v39);
          goto LABEL_11;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
        {
          ucat = self->_ucat;
          goto LABEL_9;
        }
      }
LABEL_11:
      CFTypeID TypeID = CFStringGetTypeID();
      uint64_t v8 = CFDictionaryGetTypedValue((const __CFDictionary *)v14, @"ssid", TypeID, 0);

      if (v8)
      {
        [v15 setObject:v8 forKeyedSubscript:@"wifiSSID"];
      }
      else
      {
        v27 = self->_ucat;
        if (v27->var0 <= 50)
        {
          if (v27->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v27, 0x32u)) {
              goto LABEL_17;
            }
            v27 = self->_ucat;
          }
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUWACSession _runEasyConfigPreConfigStart]", 0x32u, (uint64_t)"### No WiFI SSID to configure\n", v23, v24, v25, v26, v39);
        }
      }
LABEL_17:
      [(EasyConfigDevice *)self->_easyConfigDevice stop];
      v28 = [(Class)getEasyConfigDeviceClass[0]() deviceWithInfo:v3];
      easyConfigDevice = self->_easyConfigDevice;
      self->_easyConfigDevice = v28;

      [(EasyConfigDevice *)self->_easyConfigDevice setConfiguration:v15];
      [(EasyConfigDevice *)self->_easyConfigDevice setDispatchQueue:self->_dispatchQueue];
      [(EasyConfigDevice *)self->_easyConfigDevice setPausesAfterApply:1];
      [(EasyConfigDevice *)self->_easyConfigDevice setPreConfigMetrics:&self->_easyConfigPreConfigMetrics];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke;
      v41[3] = &unk_1E55BF038;
      v41[4] = self;
      [(EasyConfigDevice *)self->_easyConfigDevice setProgressHandler:v41];
      if (self->_promptForSetupCodeHandler)
      {
        uint64_t v30 = self->_easyConfigDevice;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke_2;
        v40[3] = &unk_1E55BF060;
        v40[4] = self;
        [(EasyConfigDevice *)v30 setPromptForSetupCodeHandler:v40];
      }
      [(EasyConfigDevice *)self->_easyConfigDevice start];
      goto LABEL_20;
    }
    uint64_t v31 = self->_ucat;
    if (v31->var0 <= 90)
    {
      if (v31->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v31, 0x5Au)) {
          goto LABEL_31;
        }
        uint64_t v31 = self->_ucat;
      }
      int v32 = "### No current WiFi info to start EasyConfig\n";
LABEL_27:
      LogPrintF((uint64_t)v31, (uint64_t)"-[CUWACSession _runEasyConfigPreConfigStart]", 0x5Au, (uint64_t)v32, v4, v5, v6, v7, v39);
    }
  }
  else
  {
    uint64_t v31 = self->_ucat;
    if (v31->var0 <= 90)
    {
      if (v31->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v31, 0x5Au)) {
          goto LABEL_31;
        }
        uint64_t v31 = self->_ucat;
      }
      int v32 = "### No deviceID start EasyConfig\n";
      goto LABEL_27;
    }
  }
LABEL_31:
  self->_easyConfigPreConfigState = 3;
  v44 = @"eo";
  uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v34 = *MEMORY[0x1E4F28760];
  uint64_t v42 = *MEMORY[0x1E4F28568];
  uint64_t v35 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, -6705, 0, 0));
  uint64_t v14 = (void *)v35;
  v36 = @"?";
  if (v35) {
    v36 = (__CFString *)v35;
  }
  v43 = v36;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v37 = [v33 errorWithDomain:v34 code:-6705 userInfo:v15];
  v45[0] = v37;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
  [(CUWACSession *)self _progress:30 info:v38];

LABEL_20:
}

uint64_t __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _runEasyConfigProgress:a2 info:a3];
}

uint64_t __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke_2(uint64_t a1)
{
  return 0;
}

- (int)_runEasyConfigPreConfig
{
  uint64_t easyConfigPreConfigState = self->_easyConfigPreConfigState;
  if (easyConfigPreConfigState != 4)
  {
    if (easyConfigPreConfigState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
            return self->_easyConfigPreConfigState;
          }
          ucat = self->_ucat;
          uint64_t easyConfigPreConfigState = self->_easyConfigPreConfigState;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runEasyConfigPreConfig]", 0x1Eu, (uint64_t)"EasyConfig PreConfig hasn't succeeded yet (%d)\n", v2, v3, v4, v5, easyConfigPreConfigState);
      }
    }
    else
    {
      self->_uint64_t easyConfigPreConfigState = 1;
      [(CUWACSession *)self _runEasyConfigPreConfigStart];
    }
  }
  return self->_easyConfigPreConfigState;
}

- (void)_runJoinSoftAPFinished:(int)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  self->_easyConfigPreConfigMetrics.wifiJoinSWAPError = a3;
  if (a3)
  {
    uint64_t v8 = *(void *)&a3;
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
          goto LABEL_9;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runJoinSoftAPFinished:]", 0x3Cu, (uint64_t)"### Join SoftAP start failed: %#m\n", v3, v4, v5, v6, v8);
    }
LABEL_9:
    self->_joinSoftAPState = 3;
    v21 = @"eo";
    unsigned int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28760];
    uint64_t v12 = (int)v8;
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v8, 0, 0));
    uint64_t v14 = (void *)v13;
    id v15 = @"?";
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    uint64_t v20 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v17 = [v10 errorWithDomain:v11 code:v12 userInfo:v16];
    v22[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    [(CUWACSession *)self _progress:30 info:v18];

    return;
  }
  self->_easyConfigPreConfigMetrics.secondsToGetLinkUpOnSWAP = CFAbsoluteTimeGetCurrent() - self->_joinSoftAPStartTime;
  [(CUWACSession *)self _progress:50 info:0];
  self->_joinSoftAPState = 4;
  [(CUWACSession *)self _run];
}

- (void)_runJoinSoftAPStart
{
  v34[1] = *MEMORY[0x1E4F143B8];
  [(CUWACSession *)self _progress:40 info:0];
  CFDictionaryRef v7 = [(CUWiFiDevice *)self->_wacDevice rawScanResult];
  if (!v7)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_15;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runJoinSoftAPStart]", 0x5Au, (uint64_t)"### No scan result to join SoftAP\n", v3, v4, v5, v6, v28);
    }
LABEL_15:
    LODWORD(v17) = -6705;
    goto LABEL_16;
  }
  self->_easyConfigPreConfigMetrics.rssiOfSWAP = [(CUWiFiDevice *)self->_wacDevice rssi];
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v7, @"SNR");
  if (Value)
  {
    int v30 = 0;
    LODWORD(Value) = CFGetInt64(Value, &v30);
  }
  self->_easyConfigPreConfigMetrics.snrOfSWAP = Value;
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(v7, @"CHANNEL");
  if (v9)
  {
    int v30 = 0;
    LODWORD(v9) = CFGetInt64(v9, &v30);
  }
  self->_easyConfigPreConfigMetrics.channelOfSWAP = v9;
  dispatchQueue = self->_dispatchQueue;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __35__CUWACSession__runJoinSoftAPStart__block_invoke;
  v29[3] = &unk_1E55BF010;
  v29[4] = self;
  uint64_t v11 = WiFiJoinNetwork_b(v7, dispatchQueue, v29);
  if (v11)
  {
    uint64_t v17 = v11;
    uint64_t v18 = self->_ucat;
    if (v18->var0 <= 60)
    {
      if (v18->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v18, 0x3Cu)) {
          goto LABEL_16;
        }
        uint64_t v18 = self->_ucat;
      }
      LogPrintF((uint64_t)v18, (uint64_t)"-[CUWACSession _runJoinSoftAPStart]", 0x3Cu, (uint64_t)"### Join SoftAP start failed: %#m\n", v12, v13, v14, v15, v17);
    }
LABEL_16:
    self->_joinSoftAPState = 3;
    uint64_t v33 = @"eo";
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28760];
    uint64_t v21 = (int)v17;
    uint64_t v31 = *MEMORY[0x1E4F28568];
    uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
    uint64_t v23 = (void *)v22;
    uint64_t v24 = @"?";
    if (v22) {
      uint64_t v24 = (__CFString *)v22;
    }
    int v32 = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v26 = [v19 errorWithDomain:v20 code:v21 userInfo:v25];
    v34[0] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    [(CUWACSession *)self _progress:30 info:v27];
  }
}

uint64_t __35__CUWACSession__runJoinSoftAPStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _runJoinSoftAPFinished:a2];
}

- (int)_runJoinSoftAP
{
  uint64_t joinSoftAPState = self->_joinSoftAPState;
  if (joinSoftAPState != 4)
  {
    if (joinSoftAPState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
            return self->_joinSoftAPState;
          }
          ucat = self->_ucat;
          uint64_t joinSoftAPState = self->_joinSoftAPState;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runJoinSoftAP]", 0x1Eu, (uint64_t)"Join SoftAP hasn't succeeded yet (%d)\n", v2, v3, v4, v5, joinSoftAPState);
      }
    }
    else
    {
      self->_uint64_t joinSoftAPState = 1;
      [(CUWACSession *)self _runJoinSoftAPStart];
    }
  }
  return self->_joinSoftAPState;
}

- (int)_runSaveOriginalWiFi
{
  v32[1] = *MEMORY[0x1E4F143B8];
  int result = self->_saveOriginalWiFiState;
  if (result) {
    return result;
  }
  unsigned int v28 = 0;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runSaveOriginalWiFi]", 0x1Eu, (uint64_t)"Saving off current WiFi info\n", v2, v3, v4, v5, v27);
  }
LABEL_6:
  CFStringRef v9 = (NSDictionary *)WiFiCopyCurrentNetworkInfoEx(1, (int *)&v28);
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = v9;

  uint64_t v15 = v28;
  if (self->_originalWiFiInfo && !v28)
  {
    int result = 4;
    self->_saveOriginalWiFiState = 4;
    return result;
  }
  uint64_t v16 = self->_ucat;
  if (v16->var0 > 60) {
    goto LABEL_13;
  }
  if (v16->var0 == -1)
  {
    BOOL v17 = _LogCategory_Initialize((uint64_t)v16, 0x3Cu);
    uint64_t v15 = v28;
    if (!v17) {
      goto LABEL_13;
    }
    uint64_t v16 = self->_ucat;
  }
  LogPrintF((uint64_t)v16, (uint64_t)"-[CUWACSession _runSaveOriginalWiFi]", 0x3Cu, (uint64_t)"### Saving off current WiFi info failed: %#m\n", v11, v12, v13, v14, v15);
  LODWORD(v15) = v28;
LABEL_13:
  self->_saveOriginalWiFiState = 3;
  if (!v15)
  {
    LODWORD(v15) = -6762;
    unsigned int v28 = -6762;
  }
  uint64_t v31 = @"eo";
  uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F28760];
  uint64_t v20 = (int)v15;
  uint64_t v29 = *MEMORY[0x1E4F28568];
  uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v15, 0, 0));
  uint64_t v22 = (void *)v21;
  uint64_t v23 = @"?";
  if (v21) {
    uint64_t v23 = (__CFString *)v21;
  }
  int v30 = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  uint64_t v25 = [v18 errorWithDomain:v19 code:v20 userInfo:v24];
  v32[0] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  [(CUWACSession *)self _progress:30 info:v26];

  return self->_saveOriginalWiFiState;
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    && [(CUWACSession *)self _runSaveOriginalWiFi] == 4
    && [(CUWACSession *)self _runJoinSoftAP] == 4
    && [(CUWACSession *)self _runEasyConfigPreConfig] == 4
    && [(CUWACSession *)self _runRestoreOriginalWiFi] == 4
    && [(CUWACSession *)self _runEasyConfigPostConfig] == 4)
  {
    [(CUWACSession *)self _runFinish];
  }
}

- (void)trySetupCode:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__CUWACSession_trySetupCode___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __29__CUWACSession_trySetupCode___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) trySetupCode:*(void *)(a1 + 40)];
}

- (void)_progress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v14 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_56;
      }
      ucat = self->_ucat;
    }
    if ((int)v4 <= 99)
    {
      if ((int)v4 > 49)
      {
        if ((int)v4 <= 69)
        {
          if (v4 == 50)
          {
            uint64_t v11 = "JoinedSoftAP";
            goto LABEL_55;
          }
          if (v4 == 60)
          {
            uint64_t v11 = "PreConfigStart";
            goto LABEL_55;
          }
        }
        else
        {
          switch(v4)
          {
            case 'F':
              uint64_t v11 = "SearchingPreConfig";
              goto LABEL_55;
            case 'P':
              uint64_t v11 = "FoundPreConfig";
              goto LABEL_55;
            case 'Z':
              uint64_t v11 = "Authenticating";
              goto LABEL_55;
          }
        }
      }
      else if ((int)v4 <= 19)
      {
        if (!v4)
        {
          uint64_t v11 = "Invalid";
          goto LABEL_55;
        }
        if (v4 == 10)
        {
          uint64_t v11 = "Start";
          goto LABEL_55;
        }
      }
      else
      {
        switch(v4)
        {
          case 0x14:
            uint64_t v11 = "Final";
            goto LABEL_55;
          case 0x1E:
            uint64_t v11 = "Error";
            goto LABEL_55;
          case 0x28:
            uint64_t v11 = "JoiningSoftAP";
            goto LABEL_55;
        }
      }
    }
    else if ((int)v4 <= 149)
    {
      if ((int)v4 <= 119)
      {
        if (v4 == 100)
        {
          uint64_t v11 = "Authenticated";
          goto LABEL_55;
        }
        if (v4 == 110)
        {
          uint64_t v11 = "ApplyingConfig";
          goto LABEL_55;
        }
      }
      else
      {
        switch(v4)
        {
          case 0x78:
            uint64_t v11 = "AppliedConfig";
            goto LABEL_55;
          case 0x82:
            uint64_t v11 = "RestoringOriginalWiFi";
            goto LABEL_55;
          case 0x8C:
            uint64_t v11 = "RestoredOriginalWiFi";
            goto LABEL_55;
        }
      }
    }
    else if ((int)v4 > 179)
    {
      switch(v4)
      {
        case 0xB4:
          uint64_t v11 = "CheckingPostConfig";
          goto LABEL_55;
        case 0xBE:
          uint64_t v11 = "CheckedPostConfig";
          goto LABEL_55;
        case 0xC8:
          uint64_t v11 = "ConfigComplete";
          goto LABEL_55;
      }
    }
    else
    {
      switch(v4)
      {
        case 0x96:
          uint64_t v11 = "SearchingPostConfig";
          goto LABEL_55;
        case 0xA0:
          uint64_t v11 = "PostConfigStart";
          goto LABEL_55;
        case 0xAA:
          uint64_t v11 = "FoundPostConfig";
LABEL_55:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _progress:info:]", 0x1Eu, (uint64_t)"Progress: %s %@\n", v6, v7, v8, v9, (uint64_t)v11);
          goto LABEL_56;
      }
    }
    uint64_t v11 = "?";
    goto LABEL_55;
  }
LABEL_56:
  progressHandler = (void (**)(id, void, id))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, v4, v14);
  }
  if (v4 == 20)
  {
    id v13 = self->_progressHandler;
    self->_progressHandler = 0;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CUWACSession_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CUWACSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 9)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 9) = 1;
  unsigned int v10 = *(void **)(result + 32);
  uint64_t v11 = (int *)v10[2];
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      unsigned int v10 = *(void **)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = (int *)v10[2];
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUWACSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v14);
    unsigned int v10 = *(void **)(v9 + 32);
  }
LABEL_6:
  [v10 _runFinish];
  id v13 = *(void **)(v9 + 32);
  return [v13 _cleanup];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CUWACSession_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __24__CUWACSession_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  unsigned int v10 = *(int **)(v9 + 16);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUWACSession activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v14);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      unsigned int v10 = *(int **)(v9 + 16);
      goto LABEL_3;
    }
  }
LABEL_5:
  *(unsigned char *)(v9 + 8) = 1;
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 72) = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) _progress:10 info:0];
  BOOL v12 = *(void **)(a1 + 32);
  return [v12 _run];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CDC68;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)_cleanup
{
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0;

  [(EasyConfigDevice *)self->_easyConfigDevice stop];
  easyConfigDevice = self->_easyConfigDevice;
  self->_easyConfigDevice = 0;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;

  id promptForSetupCodeHandler = self->_promptForSetupCodeHandler;
  self->_id promptForSetupCodeHandler = 0;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled) {
    FatalErrorF((uint64_t)"Dealloc without invalidate", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v10.receiver);
  }
  [(CUWACSession *)self _cleanup];
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CUWACSession;
  [(CUWACSession *)&v10 dealloc];
}

- (CUWACSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUWACSession;
  uint64_t v2 = [(CUWACSession *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUWACSession;
  }
  return v2;
}

@end