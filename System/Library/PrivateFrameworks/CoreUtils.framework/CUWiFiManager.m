@interface CUWiFiManager
- (BOOL)degradeOnAnyTrafficUnavailable;
- (BOOL)infraDisabled;
- (BOOL)wakeOnWirelessEnabled;
- (CUWiFiManager)init;
- (NSArray)trafficPeers;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)trafficFlagsUnavailableUpdatedHandler;
- (id)wifiStateChangedHandler;
- (int)_wifiStateUncached;
- (int)wifiState;
- (unsigned)_wifiFlagsUncached;
- (unsigned)controlFlags;
- (unsigned)trafficFlagsUnavailable;
- (unsigned)wifiFlags;
- (void)_activateSafeInvokeBlock:(id)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)_update;
- (void)_updateInfraDisabled;
- (void)_updateTrafficPeerStatusMonitor;
- (void)_updateTrafficPeerStatusUpdated:(id)a3 isAvailable:(BOOL)a4 error:(id)a5;
- (void)_updateTrafficPeers;
- (void)_updateTrafficPeersWithService:(unsigned int)a3;
- (void)_updateWakeOnWireless;
- (void)_updateWiFiState;
- (void)_wifiAutoJoinNotification:(id)a3;
- (void)_wifiEnsureStarted;
- (void)_wifiEnsureStopped;
- (void)_wifiStateChanged;
- (void)activate;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performUpdate:(id)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDegradeOnAnyTrafficUnavailable:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInfraDisabled:(BOOL)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTrafficFlagsUnavailableUpdatedHandler:(id)a3;
- (void)setTrafficPeers:(id)a3;
- (void)setWakeOnWirelessEnabled:(BOOL)a3;
- (void)setWifiStateChangedHandler:(id)a3;
@end

@implementation CUWiFiManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wifiStateChangedHandler, 0);
  objc_storeStrong(&self->_trafficFlagsUnavailableUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_trafficPeers, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiP2PStateServices, 0);
  objc_storeStrong((id *)&self->_wifiP2PStateMonitor, 0);
  objc_storeStrong((id *)&self->_wifiRetrier, 0);
  objc_storeStrong((id *)&self->_trafficPeersCurrent, 0);
}

- (void)setWifiStateChangedHandler:(id)a3
{
}

- (id)wifiStateChangedHandler
{
  return self->_wifiStateChangedHandler;
}

- (int)wifiState
{
  return self->_wifiState;
}

- (unsigned)wifiFlags
{
  return self->_wifiFlags;
}

- (BOOL)wakeOnWirelessEnabled
{
  return self->_wakeOnWirelessEnabled;
}

- (void)setDegradeOnAnyTrafficUnavailable:(BOOL)a3
{
  self->_degradeOnAnyTrafficUnavailable = a3;
}

- (BOOL)degradeOnAnyTrafficUnavailable
{
  return self->_degradeOnAnyTrafficUnavailable;
}

- (void)setTrafficFlagsUnavailableUpdatedHandler:(id)a3
{
}

- (id)trafficFlagsUnavailableUpdatedHandler
{
  return self->_trafficFlagsUnavailableUpdatedHandler;
}

- (unsigned)trafficFlagsUnavailable
{
  return self->_trafficFlagsUnavailable;
}

- (NSArray)trafficPeers
{
  return self->_trafficPeers;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (BOOL)infraDisabled
{
  return self->_infraDisabled;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)_wifiStateChanged
{
  unsigned int v3 = [(CUWiFiManager *)self _wifiFlagsUncached];
  int v8 = [(CUWiFiManager *)self _wifiStateUncached];
  int wifiState = self->_wifiState;
  if (__PAIR64__(v8, v3) == *(void *)&self->_wifiFlags)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 10) {
      return;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0xAu)) {
        return;
      }
      ucat = self->_ucat;
    }
    if (v8 <= 19)
    {
      if (!v8)
      {
        v11 = "Unknown";
        goto LABEL_40;
      }
      if (v8 == 10)
      {
        v11 = "Off";
        goto LABEL_40;
      }
    }
    else
    {
      switch(v8)
      {
        case 20:
          v11 = "NotConnected";
          goto LABEL_40;
        case 30:
          v11 = "Connecting";
          goto LABEL_40;
        case 40:
          v11 = "Connected";
LABEL_40:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _wifiStateChanged]", 0xAu, (uint64_t)"WiFi state changed: %s, %#{flags}\n", v4, v5, v6, v7, (uint64_t)v11);
          return;
      }
    }
    v11 = "?";
    goto LABEL_40;
  }
  v12 = self->_ucat;
  if (v12->var0 <= 30)
  {
    if (v12->var0 != -1) {
      goto LABEL_11;
    }
    if (_LogCategory_Initialize((uint64_t)v12, 0x1Eu))
    {
      v12 = self->_ucat;
      int wifiState = self->_wifiState;
LABEL_11:
      if (wifiState <= 19)
      {
        if (!wifiState)
        {
          v13 = "Unknown";
          goto LABEL_27;
        }
        if (wifiState == 10)
        {
          v13 = "Off";
          goto LABEL_27;
        }
      }
      else
      {
        switch(wifiState)
        {
          case 20:
            v13 = "NotConnected";
            goto LABEL_27;
          case 30:
            v13 = "Connecting";
            goto LABEL_27;
          case 40:
            v13 = "Connected";
LABEL_27:
            LogPrintF((uint64_t)v12, (uint64_t)"-[CUWiFiManager _wifiStateChanged]", 0x1Eu, (uint64_t)"WiFi state changed: %s -> %s, %#{flags}\n", v4, v5, v6, v7, (uint64_t)v13);
            goto LABEL_28;
        }
      }
      v13 = "?";
      goto LABEL_27;
    }
  }
LABEL_28:
  self->_wifiFlags = v3;
  self->_int wifiState = v8;
  v14 = (void (**)(void))_Block_copy(self->_wifiStateChangedHandler);
  if (v14)
  {
    v15 = v14;
    v14[2]();
    v14 = v15;
  }
}

- (int)_wifiStateUncached
{
  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    if (WiFiManagerClientGetPower())
    {
      if (self->_wifiDevice && (uint64_t v4 = (const void *)WiFiDeviceClientCopyCurrentNetwork()) != 0)
      {
        CFRelease(v4);
        LODWORD(wifiManager) = 40;
      }
      else
      {
        LODWORD(wifiManager) = 20;
      }
    }
    else
    {
      LODWORD(wifiManager) = 10;
    }
  }
  return (int)wifiManager;
}

- (unsigned)_wifiFlagsUncached
{
  unsigned int v2 = self->_wifiCriticalState << 8;
  if (self->_wifiDevice)
  {
    uint64_t v3 = WiFiDeviceClientCopyCurrentNetwork();
    if (v3)
    {
      uint64_t v4 = (const void *)v3;
      unsigned int AuthFlags = WiFiNetworkGetAuthFlags();
      v2 |= (AuthFlags == 0) | (__rbit32(AuthFlags) >> 27) & 0x1A;
      if (WiFiNetworkIsCaptive()) {
        v2 |= 4u;
      }
      if (WiFiNetworkGetOperatingBand() == 2) {
        v2 |= 0x200u;
      }
      CFRelease(v4);
    }
    WiFiDeviceClientCopyHostedNetworks();
  }
  return v2;
}

- (void)_wifiAutoJoinNotification:(id)a3
{
  CFDictionaryRef v26 = (const __CFDictionary *)a3;
  uint64_t v4 = (const void *)*MEMORY[0x1E4F78BF0];
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t v6 = CFDictionaryGetTypedValue(v26, v4, TypeID, 0);
  unsigned int v7 = [(CUWiFiManager *)self _wifiFlagsUncached];
  int v12 = [(CUWiFiManager *)self _wifiStateUncached];
  ucat = self->_ucat;
  if (ucat->var0 > 9) {
    goto LABEL_6;
  }
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 9u)) {
      goto LABEL_6;
    }
    ucat = self->_ucat;
  }
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _wifiAutoJoinNotification:]", 9u, (uint64_t)"WiFi AutoJoin notification: %@, %s, %#{flags}\n", v8, v9, v10, v11, (uint64_t)v6);
LABEL_6:
  if ([v6 isEqual:*MEMORY[0x1E4F78BD8]]) {
    int v14 = 30;
  }
  else {
    int v14 = v12;
  }
  if (v14 == self->_wifiState && v7 == self->_wifiFlags) {
    goto LABEL_34;
  }
  v15 = [(__CFDictionary *)v26 objectForKeyedSubscript:*MEMORY[0x1E4F78BD0]];

  if (v15) {
    SSID = (void *)WiFiNetworkGetSSID();
  }
  else {
    SSID = 0;
  }
  id v21 = SSID;
  v22 = self->_ucat;
  if (v22->var0 <= 30)
  {
    if (v22->var0 != -1) {
      goto LABEL_16;
    }
    if (_LogCategory_Initialize((uint64_t)v22, 0x1Eu))
    {
      v22 = self->_ucat;
LABEL_16:
      int wifiState = self->_wifiState;
      if (wifiState <= 19)
      {
        if (!wifiState)
        {
          v24 = "Unknown";
          goto LABEL_30;
        }
        if (wifiState == 10)
        {
          v24 = "Off";
          goto LABEL_30;
        }
      }
      else
      {
        switch(wifiState)
        {
          case 20:
            v24 = "NotConnected";
            goto LABEL_30;
          case 30:
            v24 = "Connecting";
            goto LABEL_30;
          case 40:
            v24 = "Connected";
LABEL_30:
            LogPrintF((uint64_t)v22, (uint64_t)"-[CUWiFiManager _wifiAutoJoinNotification:]", 0x1Eu, (uint64_t)"WiFi state changed: %s -> %s, %#{flags} %?''@\n", v17, v18, v19, v20, (uint64_t)v24);
            goto LABEL_31;
        }
      }
      v24 = "?";
      goto LABEL_30;
    }
  }
LABEL_31:
  self->_wifiFlags = v7;
  self->_int wifiState = v14;
  wifiStateChangedHandler = (void (**)(void))self->_wifiStateChangedHandler;
  if (wifiStateChangedHandler) {
    wifiStateChangedHandler[2]();
  }

LABEL_34:
}

- (void)_wifiEnsureStopped
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_wifiDevice && [(NSArray *)self->_trafficPeersCurrent count])
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_7;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_7:
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v13 = self->_trafficPeersCurrent;
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          int v16 = 0;
          uint64_t v17 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v13);
              }
              v16 |= [*(id *)(*((void *)&v32 + 1) + 8 * i) trafficFlags];
            }
            uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v15);
        }
        else
        {
          int v16 = 0;
        }

        trafficPeers = self->_trafficPeers;
        self->_trafficPeers = 0;

        if ((v16 & 0x100) != 0)
        {
          [(CUWiFiManager *)self _updateTrafficPeersWithService:256];
          if ((v16 & 0x400) == 0)
          {
LABEL_18:
            if ((v16 & 0x1000) == 0) {
              goto LABEL_19;
            }
            goto LABEL_32;
          }
        }
        else if ((v16 & 0x400) == 0)
        {
          goto LABEL_18;
        }
        [(CUWiFiManager *)self _updateTrafficPeersWithService:1024];
        if ((v16 & 0x1000) == 0)
        {
LABEL_19:
          if ((v16 & 0x2000) == 0) {
            goto LABEL_20;
          }
          goto LABEL_33;
        }
LABEL_32:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:4096];
        if ((v16 & 0x2000) == 0)
        {
LABEL_20:
          if ((v16 & 0x8000) == 0) {
            goto LABEL_21;
          }
          goto LABEL_34;
        }
LABEL_33:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:0x2000];
        if ((v16 & 0x8000) == 0)
        {
LABEL_21:
          if ((v16 & 0x200) == 0) {
            goto LABEL_22;
          }
          goto LABEL_35;
        }
LABEL_34:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:0x8000];
        if ((v16 & 0x200) == 0)
        {
LABEL_22:
          if ((v16 & 0x4000) == 0) {
            goto LABEL_23;
          }
          goto LABEL_36;
        }
LABEL_35:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:512];
        if ((v16 & 0x4000) == 0)
        {
LABEL_23:
          if ((v16 & 0x10000) == 0)
          {
LABEL_25:
            trafficPeersCurrent = self->_trafficPeersCurrent;
            self->_trafficPeersCurrent = 0;

            goto LABEL_26;
          }
LABEL_24:
          [(CUWiFiManager *)self _updateTrafficPeersWithService:0x10000];
          goto LABEL_25;
        }
LABEL_36:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:0x4000];
        if ((v16 & 0x10000) == 0) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      ucat = self->_ucat;
    }
    uint64_t v8 = [(NSArray *)self->_trafficPeersCurrent count];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"Traffic registration stop: %d peers\n", v9, v10, v11, v12, v8);
    goto LABEL_7;
  }
LABEL_26:
  if (!self->_wifiCriticalSetup) {
    goto LABEL_42;
  }
  id v21 = self->_ucat;
  if (v21->var0 <= 30)
  {
    if (v21->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v21, 0x1Eu)) {
        goto LABEL_39;
      }
      id v21 = self->_ucat;
    }
    LogPrintF((uint64_t)v21, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFiDeviceClient critical monitor stopped\n", v2, v3, v4, v5, v31);
  }
LABEL_39:
  if (self->_wifiDevice) {
    WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback();
  }
  *(_WORD *)&self->_wifiCriticalSetup = 0;
LABEL_42:
  if (!self->_wifiStateMonitorSetup) {
    goto LABEL_47;
  }
  WiFiDeviceClientRegisterAutoJoinNotificationCallback();
  WiFiDeviceClientRegisterHostApStateChangedCallback();
  WiFiDeviceClientRegisterPowerCallback();
  self->_wifiStateMonitorSetup = 0;
  self->_wifiFlags = 0;
  self->_int wifiState = 0;
  v22 = self->_ucat;
  if (v22->var0 > 30) {
    goto LABEL_47;
  }
  if (v22->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v22, 0x1Eu)) {
      goto LABEL_47;
    }
    v22 = self->_ucat;
  }
  LogPrintF((uint64_t)v22, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFi state monitor stopped\n", v2, v3, v4, v5, v31);
LABEL_47:
  if (self->_wifiDeviceSetup)
  {
    WiFiDeviceClientRegisterRemovalCallback();
    wifiDevice = self->_wifiDevice;
    if (wifiDevice) {
      CFRelease(wifiDevice);
    }
    self->_wifiDevice = 0;
    self->_wifiDeviceSetup = 0;
    v24 = self->_ucat;
    if (v24->var0 <= 30)
    {
      if (v24->var0 != -1)
      {
LABEL_52:
        LogPrintF((uint64_t)v24, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFiDeviceClient stopped\n", v2, v3, v4, v5, v31);
        goto LABEL_54;
      }
      if (_LogCategory_Initialize((uint64_t)v24, 0x1Eu))
      {
        v24 = self->_ucat;
        goto LABEL_52;
      }
    }
  }
LABEL_54:
  self->_wifiAutoJoinDisabled = 0;
  wifiNetworkDisabled = self->_wifiNetworkDisabled;
  if (wifiNetworkDisabled)
  {
    CFRelease(wifiNetworkDisabled);
    self->_wifiNetworkDisabled = 0;
  }
  self->_wifiManagerSetup = 0;
  if (self->_wifiManager)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterServerRestartCallback();
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
    CFDictionaryRef v26 = self->_ucat;
    if (v26->var0 <= 30)
    {
      if (v26->var0 != -1)
      {
LABEL_59:
        LogPrintF((uint64_t)v26, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFiManagerClient stopped\n", v2, v3, v4, v5, v31);
        goto LABEL_61;
      }
      if (_LogCategory_Initialize((uint64_t)v26, 0x1Eu))
      {
        CFDictionaryRef v26 = self->_ucat;
        goto LABEL_59;
      }
    }
  }
LABEL_61:
  if (self->_wifiRetrier)
  {
    v27 = self->_ucat;
    if (v27->var0 <= 30)
    {
      if (v27->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v27, 0x1Eu)) {
          goto LABEL_66;
        }
        v27 = self->_ucat;
      }
      LogPrintF((uint64_t)v27, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFi monitoring stopped\n", v2, v3, v4, v5, v31);
    }
LABEL_66:
    [(CURetrier *)self->_wifiRetrier invalidateDirect];
    wifiRetrier = self->_wifiRetrier;
    self->_wifiRetrier = 0;
  }
  [(WiFiP2PAWDLStateMonitor *)self->_wifiP2PStateMonitor endMonitoring];
  wifiP2PStateMonitor = self->_wifiP2PStateMonitor;
  self->_wifiP2PStateMonitor = 0;

  wifiP2PStateServices = self->_wifiP2PStateServices;
  self->_wifiP2PStateServices = 0;
}

- (void)_wifiEnsureStarted
{
  if (!self->_wifiRetrier)
  {
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFi start monitoring\n", v2, v3, v4, v5, v37);
    }
LABEL_6:
    uint64_t v8 = objc_alloc_init(CURetrier);
    wifiRetrier = self->_wifiRetrier;
    self->_wifiRetrier = v8;

    [(CURetrier *)self->_wifiRetrier setDispatchQueue:self->_dispatchQueue];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __35__CUWiFiManager__wifiEnsureStarted__block_invoke;
    v38[3] = &unk_1E55BFC18;
    v38[4] = self;
    [(CURetrier *)self->_wifiRetrier setActionHandler:v38];
    [(CURetrier *)self->_wifiRetrier setStartTime:CFAbsoluteTimeGetCurrent()];
  }
  if (self->_wifiManager) {
    goto LABEL_14;
  }
  uint64_t v10 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->_wifiManager = v10;
  if (v10) {
    goto LABEL_14;
  }
  uint64_t v11 = self->_ucat;
  if (v11->var0 <= 60)
  {
    if (v11->var0 != -1)
    {
LABEL_11:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x3Cu, (uint64_t)"### WiFiManagerClientCreate failed\n", v2, v3, v4, v5, v37);
      goto LABEL_13;
    }
    if (_LogCategory_Initialize((uint64_t)v11, 0x3Cu))
    {
      uint64_t v11 = self->_ucat;
      goto LABEL_11;
    }
  }
LABEL_13:
  if (!self->_wifiManager) {
    goto LABEL_24;
  }
LABEL_14:
  if (self->_wifiDevice) {
    goto LABEL_24;
  }
  CFArrayRef v12 = (const __CFArray *)WiFiManagerClientCopyDevices();
  CFArrayRef v13 = v12;
  if (!v12 || CFArrayGetCount(v12) < 1)
  {
    uint64_t v15 = self->_ucat;
    if (v15->var0 > 60) {
      goto LABEL_22;
    }
    if (v15->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v15, 0x3Cu))
      {
LABEL_22:
        if (!v13) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      uint64_t v15 = self->_ucat;
    }
    LogPrintF((uint64_t)v15, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x3Cu, (uint64_t)"### WiFiManagerClientCopyDevices failed: %@\n", v2, v3, v4, v5, (uint64_t)v13);
    goto LABEL_22;
  }
  ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v13, 0);
  self->_wifiDevice = ValueAtIndex;
  CFRetain(ValueAtIndex);
LABEL_23:
  CFRelease(v13);
LABEL_24:
  if ((self->_controlFlags & 0x100) != 0)
  {
    if (!self->_wifiDevice || self->_wifiCriticalSetup) {
      goto LABEL_40;
    }
    uint64_t v17 = self->_ucat;
    if (v17->var0 <= 30)
    {
      if (v17->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v17, 0x1Eu)) {
          goto LABEL_39;
        }
        uint64_t v17 = self->_ucat;
      }
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFiDeviceClient critical monitor started\n", v2, v3, v4, v5, v37);
    }
LABEL_39:
    WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback();
    self->_wifiCriticalSetup = 1;
    goto LABEL_40;
  }
  if (!self->_wifiCriticalSetup) {
    goto LABEL_40;
  }
  int v16 = self->_ucat;
  if (v16->var0 > 30) {
    goto LABEL_35;
  }
  if (v16->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v16, 0x1Eu)) {
      goto LABEL_35;
    }
    int v16 = self->_ucat;
  }
  LogPrintF((uint64_t)v16, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFiDeviceClient critical monitor stopped\n", v2, v3, v4, v5, v37);
LABEL_35:
  if (self->_wifiDevice) {
    WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback();
  }
  *(_WORD *)&self->_wifiCriticalSetup = 0;
LABEL_40:
  if (self->_wifiManager)
  {
    if (!self->_wifiManagerSetup)
    {
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      WiFiManagerClientRegisterServerRestartCallback();
      self->_wifiManagerSetup = 1;
      v22 = self->_ucat;
      if (v22->var0 <= 30)
      {
        if (v22->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v22, 0x1Eu)) {
            goto LABEL_46;
          }
          v22 = self->_ucat;
        }
        LogPrintF((uint64_t)v22, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFiManagerClient started\n", v18, v19, v20, v21, v37);
      }
    }
  }
LABEL_46:
  if (self->_wifiDevice)
  {
    if (!self->_wifiDeviceSetup)
    {
      WiFiDeviceClientRegisterRemovalCallback();
      self->_wifiDeviceSetup = 1;
      v27 = self->_ucat;
      if (v27->var0 <= 30)
      {
        if (v27->var0 != -1)
        {
LABEL_50:
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFiDeviceClient started\n", v23, v24, v25, v26, v37);
          goto LABEL_52;
        }
        if (_LogCategory_Initialize((uint64_t)v27, 0x1Eu))
        {
          v27 = self->_ucat;
          goto LABEL_50;
        }
      }
    }
  }
LABEL_52:
  id wifiStateChangedHandler = self->_wifiStateChangedHandler;
  if (!self->_wifiDeviceSetup)
  {
    if (wifiStateChangedHandler) {
      goto LABEL_80;
    }
    goto LABEL_63;
  }
  if (!wifiStateChangedHandler)
  {
LABEL_63:
    if (!self->_wifiStateMonitorSetup) {
      goto LABEL_80;
    }
    WiFiDeviceClientRegisterAutoJoinNotificationCallback();
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegisterPowerCallback();
    self->_wifiStateMonitorSetup = 0;
    self->_int wifiState = 0;
    long long v34 = self->_ucat;
    if (v34->var0 > 30) {
      goto LABEL_80;
    }
    if (v34->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v34, 0x1Eu)) {
        goto LABEL_80;
      }
      long long v34 = self->_ucat;
    }
    v36 = "WiFi state monitor stopped\n";
    goto LABEL_79;
  }
  if (self->_wifiStateMonitorSetup) {
    goto LABEL_80;
  }
  WiFiDeviceClientRegisterAutoJoinNotificationCallback();
  WiFiDeviceClientRegisterHostApStateChangedCallback();
  WiFiDeviceClientRegisterPowerCallback();
  self->_wifiStateMonitorSetup = 1;
  self->_wifiFlags = [(CUWiFiManager *)self _wifiFlagsUncached];
  int wifiState = [(CUWiFiManager *)self _wifiStateUncached];
  self->_int wifiState = wifiState;
  long long v34 = self->_ucat;
  if (v34->var0 > 30) {
    goto LABEL_80;
  }
  if (v34->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v34, 0x1Eu)) {
      goto LABEL_80;
    }
    long long v34 = self->_ucat;
    int wifiState = self->_wifiState;
  }
  if (wifiState <= 19)
  {
    if (!wifiState)
    {
      long long v35 = "Unknown";
      goto LABEL_78;
    }
    if (wifiState == 10)
    {
      long long v35 = "Off";
      goto LABEL_78;
    }
LABEL_77:
    long long v35 = "?";
    goto LABEL_78;
  }
  if (wifiState == 20)
  {
    long long v35 = "NotConnected";
    goto LABEL_78;
  }
  if (wifiState == 30)
  {
    long long v35 = "Connecting";
    goto LABEL_78;
  }
  if (wifiState != 40) {
    goto LABEL_77;
  }
  long long v35 = "Connected";
LABEL_78:
  uint64_t v37 = (uint64_t)v35;
  v36 = "WiFi state monitor started, %s, %#{flags}\n";
LABEL_79:
  LogPrintF((uint64_t)v34, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)v36, v29, v30, v31, v32, v37);
LABEL_80:
  if (!self->_wifiDeviceSetup) {
    [(CURetrier *)self->_wifiRetrier failed];
  }
}

uint64_t __35__CUWiFiManager__wifiEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_updateWiFiState
{
  uint64_t wifiFlags = self->_wifiFlags;
  int lastTrafficRegistrationErrorCode = self->_lastTrafficRegistrationErrorCode;
  BOOL degradeOnAnyTrafficUnavailable = self->_degradeOnAnyTrafficUnavailable;
  if (self->_degradeOnAnyTrafficUnavailable) {
    BOOL degradeOnAnyTrafficUnavailable = self->_trafficFlagsUnavailable != 0;
  }
  self->_trafficPeerDegraded = degradeOnAnyTrafficUnavailable;
  if ((lastTrafficRegistrationErrorCode == 100 || lastTrafficRegistrationErrorCode == 0)
    && !degradeOnAnyTrafficUnavailable)
  {
    int v12 = wifiFlags & 0xFFFFFFBF;
  }
  else
  {
    int v12 = wifiFlags | 0x40;
  }
  unsigned int v13 = v12 & 0xFFFFFF7F | ((lastTrafficRegistrationErrorCode == 100) << 7);
  if (v13 != wifiFlags)
  {
    self->_uint64_t wifiFlags = v13;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_17;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateWiFiState]", 0x1Eu, (uint64_t)"Flags changed: %#{flags} -> %#{flags}\n", v2, v3, v4, v5, wifiFlags);
    }
LABEL_17:
    uint64_t v15 = (void (**)(void))_Block_copy(self->_wifiStateChangedHandler);
    if (v15)
    {
      int v16 = v15;
      v15[2]();
      uint64_t v15 = v16;
    }
  }
}

- (void)_updateWakeOnWireless
{
  if (self->_wifiManager && self->_wakeOnWirelessEnabledChanged)
  {
    BOOL wakeOnWirelessEnabled = self->_wakeOnWirelessEnabled;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        if (wakeOnWirelessEnabled) {
          uint64_t v9 = "no";
        }
        else {
          uint64_t v9 = "yes";
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateWakeOnWireless]", 0x1Eu, (uint64_t)"WakeOnWireless: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v9);
        goto LABEL_10;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
LABEL_10:
    WiFiManagerClientSetWoWState();
    self->_wakeOnWirelessEnabledChanged = 0;
  }
}

- (void)_updateTrafficPeerStatusUpdated:(id)a3 isAvailable:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = getAWDLTrafficRegistrationServiceAirPlay[0]();
  id v66 = v8;
  id v11 = v10;
  if (v11 == v66)
  {

    goto LABEL_6;
  }
  if ((v66 == 0) == (v11 != 0))
  {

    goto LABEL_8;
  }
  char v12 = [v66 isEqual:v11];

  if (v12)
  {
LABEL_6:
    int v20 = 256;
    goto LABEL_58;
  }
LABEL_8:
  uint64_t v21 = getAWDLTrafficRegistrationServiceSidecar[0]();
  id v22 = v66;
  id v23 = v21;
  if (v23 == v22)
  {

    goto LABEL_13;
  }
  uint64_t v24 = v23;
  if ((v66 == 0) == (v23 != 0))
  {

    goto LABEL_15;
  }
  char v25 = [v22 isEqual:v23];

  if (v25)
  {
LABEL_13:
    int v20 = 512;
    goto LABEL_58;
  }
LABEL_15:
  uint64_t v26 = getAWDLTrafficRegistrationServiceDeviceToDeviceMigration[0]();
  id v27 = v22;
  id v28 = v26;
  if (v28 == v27)
  {

    goto LABEL_20;
  }
  uint64_t v29 = v28;
  if ((v66 == 0) == (v28 != 0))
  {

    goto LABEL_22;
  }
  char v30 = [v27 isEqual:v28];

  if (v30)
  {
LABEL_20:
    int v20 = 1024;
    goto LABEL_58;
  }
LABEL_22:
  uint64_t v31 = getAWDLTrafficRegistrationServiceUniversalControl[0]();
  id v32 = v27;
  id v33 = v31;
  if (v33 == v32)
  {

    goto LABEL_27;
  }
  long long v34 = v33;
  if ((v66 == 0) == (v33 != 0))
  {

    goto LABEL_29;
  }
  char v35 = [v32 isEqual:v33];

  if (v35)
  {
LABEL_27:
    int v20 = 4096;
    goto LABEL_58;
  }
LABEL_29:
  v36 = getAWDLTrafficRegistrationServiceMPRemoteCamera[0]();
  id v37 = v32;
  id v38 = v36;
  if (v38 == v37)
  {

    goto LABEL_34;
  }
  v39 = v38;
  if ((v66 == 0) == (v38 != 0))
  {

    goto LABEL_36;
  }
  char v40 = [v37 isEqual:v38];

  if (v40)
  {
LABEL_34:
    int v20 = 0x2000;
    goto LABEL_58;
  }
LABEL_36:
  v41 = getAWDLTrafficRegistrationServiceRemoteCamera[0]();
  id v42 = v37;
  id v43 = v41;
  if (v43 == v42)
  {

    goto LABEL_41;
  }
  v44 = v43;
  if ((v66 == 0) == (v43 != 0))
  {

    goto LABEL_43;
  }
  char v45 = [v42 isEqual:v43];

  if (v45)
  {
LABEL_41:
    int v20 = 0x4000;
    goto LABEL_58;
  }
LABEL_43:
  v46 = getAWDLTrafficRegistrationServiceTVRemoteCamera[0]();
  id v47 = v42;
  id v48 = v46;
  if (v48 == v47)
  {

    goto LABEL_48;
  }
  v49 = v48;
  if ((v66 == 0) == (v48 != 0))
  {

    goto LABEL_50;
  }
  char v50 = [v47 isEqual:v48];

  if (v50)
  {
LABEL_48:
    int v20 = 0x8000;
    goto LABEL_58;
  }
LABEL_50:
  v51 = getAWDLTrafficRegistrationServiceRemoteScreen[0]();
  id v52 = v47;
  id v53 = v51;
  if (v53 == v52)
  {

    goto LABEL_55;
  }
  v54 = v53;
  if ((v66 == 0) != (v53 != 0))
  {
    int v55 = [v52 isEqual:v53];

    if (!v55) {
      goto LABEL_57;
    }
LABEL_55:
    int v20 = 0x10000;
    goto LABEL_58;
  }

LABEL_57:
  int v20 = 0;
LABEL_58:
  unsigned int trafficFlagsUnavailable = self->_trafficFlagsUnavailable;
  int v57 = trafficFlagsUnavailable | v20;
  unsigned int v58 = trafficFlagsUnavailable & ~v20;
  if (!v6) {
    unsigned int v58 = v57;
  }
  self->_unsigned int trafficFlagsUnavailable = v58;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_62:
      v65 = NSPrintF((uint64_t)"%{error}", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v9);
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeerStatusUpdated:isAvailable:error:]", 0x1Eu, (uint64_t)"P2P state monitor update: service=%@, isAvailable=%s, error=%@, trafficFlags=0x%X", v60, v61, v62, v63, (uint64_t)v66);

      goto LABEL_64;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_62;
    }
  }
LABEL_64:
  if (self->_trafficFlagsUnavailable != trafficFlagsUnavailable)
  {
    trafficFlagsUnavailableUpdatedHandler = (void (**)(void))self->_trafficFlagsUnavailableUpdatedHandler;
    if (trafficFlagsUnavailableUpdatedHandler) {
      trafficFlagsUnavailableUpdatedHandler[2]();
    }
    [(CUWiFiManager *)self _updateWiFiState];
  }
}

- (void)_updateTrafficPeerStatusMonitor
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (self->_trafficFlagsUnavailableUpdatedHandler || self->_degradeOnAnyTrafficUnavailable)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v2 = self->_trafficPeersCurrent;
    id v3 = 0;
    uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v80 != v5) {
            objc_enumerationMutation(v2);
          }
          unsigned int v7 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if (!v3) {
            id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          int v8 = [v7 trafficFlags];
          if ((v8 & 0x100) != 0)
          {
            uint64_t v9 = getAWDLTrafficRegistrationServiceAirPlay[0]();
            uint64_t v10 = (void *)v9;
            if (v9) {
              id v11 = (__CFString *)v9;
            }
            else {
              id v11 = &stru_1EDD2ACE8;
            }
            [v3 addObject:v11];
          }
          if ((v8 & 0x200) != 0)
          {
            uint64_t v12 = getAWDLTrafficRegistrationServiceSidecar[0]();
            uint64_t v13 = (void *)v12;
            if (v12) {
              uint64_t v14 = (__CFString *)v12;
            }
            else {
              uint64_t v14 = &stru_1EDD2ACE8;
            }
            [v3 addObject:v14];
          }
          if ((v8 & 0x400) != 0)
          {
            uint64_t v15 = getAWDLTrafficRegistrationServiceDeviceToDeviceMigration[0]();
            uint64_t v16 = (void *)v15;
            if (v15) {
              uint64_t v17 = (__CFString *)v15;
            }
            else {
              uint64_t v17 = &stru_1EDD2ACE8;
            }
            [v3 addObject:v17];
          }
          if ((v8 & 0x1000) != 0)
          {
            uint64_t v18 = getAWDLTrafficRegistrationServiceUniversalControl[0]();
            uint64_t v19 = (void *)v18;
            if (v18) {
              int v20 = (__CFString *)v18;
            }
            else {
              int v20 = &stru_1EDD2ACE8;
            }
            [v3 addObject:v20];
          }
          if ((v8 & 0x2000) != 0)
          {
            uint64_t v21 = getAWDLTrafficRegistrationServiceMPRemoteCamera[0]();
            id v22 = (void *)v21;
            if (v21) {
              id v23 = (__CFString *)v21;
            }
            else {
              id v23 = &stru_1EDD2ACE8;
            }
            [v3 addObject:v23];
          }
          if ((v8 & 0x4000) != 0)
          {
            uint64_t v24 = getAWDLTrafficRegistrationServiceRemoteCamera[0]();
            char v25 = (void *)v24;
            if (v24) {
              uint64_t v26 = (__CFString *)v24;
            }
            else {
              uint64_t v26 = &stru_1EDD2ACE8;
            }
            [v3 addObject:v26];
          }
          if ((v8 & 0x8000) != 0)
          {
            uint64_t v27 = getAWDLTrafficRegistrationServiceTVRemoteCamera[0]();
            id v28 = (void *)v27;
            if (v27) {
              uint64_t v29 = (__CFString *)v27;
            }
            else {
              uint64_t v29 = &stru_1EDD2ACE8;
            }
            [v3 addObject:v29];
          }
          if ((v8 & 0x10000) != 0)
          {
            uint64_t v30 = getAWDLTrafficRegistrationServiceRemoteScreen[0]();
            uint64_t v31 = (void *)v30;
            if (v30) {
              id v32 = (__CFString *)v30;
            }
            else {
              id v32 = &stru_1EDD2ACE8;
            }
            [v3 addObject:v32];
          }
        }
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v4);
    }

    if ([v3 count])
    {
      wifiP2PStateServices = self->_wifiP2PStateServices;
      id v38 = (NSSet *)v3;
      v39 = wifiP2PStateServices;
      if (v38 != v39)
      {
        char v40 = v39;
        if ((v38 == 0) != (v39 != 0))
        {
          char v41 = [(NSSet *)v38 isEqual:v39];

          v49 = self;
          if (v41) {
            goto LABEL_81;
          }
        }
        else
        {

          v49 = self;
        }
        ucat = v49->_ucat;
        if (ucat->var0 > 30) {
          goto LABEL_67;
        }
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v49->_ucat, 0x1Eu)) {
            goto LABEL_67;
          }
          ucat = self->_ucat;
        }
        id v52 = NSPrintF((uint64_t)"%##@", v42, v43, v44, v45, v46, v47, v48, (uint64_t)v38);
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeerStatusMonitor]", 0x1Eu, (uint64_t)"P2P state monitor start: services=%@", v53, v54, v55, v56, (uint64_t)v52);

LABEL_67:
        objc_storeStrong((id *)&self->_wifiP2PStateServices, v3);
        [(WiFiP2PAWDLStateMonitor *)self->_wifiP2PStateMonitor endMonitoring];
        wifiP2PStateMonitor = self->_wifiP2PStateMonitor;
        self->_wifiP2PStateMonitor = 0;

        unsigned int v58 = (WiFiP2PAWDLStateMonitor *)objc_alloc_init((Class)getWiFiP2PAWDLStateMonitorClass[0]());
        v59 = self->_wifiP2PStateMonitor;
        self->_wifiP2PStateMonitor = v58;

        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v60 = v38;
        uint64_t v61 = [(NSSet *)v60 countByEnumeratingWithState:&v75 objects:v83 count:16];
        if (v61)
        {
          uint64_t v62 = *(void *)v76;
          do
          {
            for (uint64_t j = 0; j != v61; ++j)
            {
              if (*(void *)v76 != v62) {
                objc_enumerationMutation(v60);
              }
              v64 = *(void **)(*((void *)&v75 + 1) + 8 * j);
              if ([v64 length]) {
                [(WiFiP2PAWDLStateMonitor *)self->_wifiP2PStateMonitor registerAvailabilityUpdatesForService:v64];
              }
            }
            uint64_t v61 = [(NSSet *)v60 countByEnumeratingWithState:&v75 objects:v83 count:16];
          }
          while (v61);
        }

        objc_initWeak(&location, self);
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __48__CUWiFiManager__updateTrafficPeerStatusMonitor__block_invoke;
        v72[3] = &unk_1E55BF0D8;
        objc_copyWeak(&v73, &location);
        [(WiFiP2PAWDLStateMonitor *)self->_wifiP2PStateMonitor setServiceAvailabilityUpdatedHandler:v72];
        [(WiFiP2PAWDLStateMonitor *)self->_wifiP2PStateMonitor beginMonitoring];
        objc_destroyWeak(&v73);
        objc_destroyWeak(&location);
        goto LABEL_80;
      }

LABEL_80:
      v49 = self;
      goto LABEL_81;
    }
    v49 = self;
    if (!self->_wifiP2PStateMonitor)
    {
LABEL_81:
      [(CUWiFiManager *)v49 _updateWiFiState];

      return;
    }
    char v50 = self->_ucat;
    if (v50->var0 <= 30)
    {
      if (v50->var0 != -1)
      {
LABEL_60:
        LogPrintF((uint64_t)v50, (uint64_t)"-[CUWiFiManager _updateTrafficPeerStatusMonitor]", 0x1Eu, (uint64_t)"P2P state monitor stop", v33, v34, v35, v36, v70);
        v49 = self;
        goto LABEL_78;
      }
      BOOL v65 = _LogCategory_Initialize((uint64_t)v50, 0x1Eu);
      v49 = self;
      if (v65)
      {
        char v50 = self->_ucat;
        goto LABEL_60;
      }
    }
LABEL_78:
    p_wifiP2PStateMonitor = (void **)&v49->_wifiP2PStateMonitor;
    [(WiFiP2PAWDLStateMonitor *)v49->_wifiP2PStateMonitor endMonitoring];
    v67 = *p_wifiP2PStateMonitor;
    *p_wifiP2PStateMonitor = 0;

    v68 = self->_wifiP2PStateServices;
    self->_wifiP2PStateServices = 0;

    v49 = self;
    self->_unsigned int trafficFlagsUnavailable = 0;
    trafficFlagsUnavailableUpdatedHandler = (void (**)(void))self->_trafficFlagsUnavailableUpdatedHandler;
    if (trafficFlagsUnavailableUpdatedHandler)
    {
      trafficFlagsUnavailableUpdatedHandler[2]();
      goto LABEL_80;
    }
    goto LABEL_81;
  }
}

void __48__CUWiFiManager__updateTrafficPeerStatusMonitor__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  BOOL v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _updateTrafficPeerStatusUpdated:v8 isAvailable:a3 error:v7];
}

- (void)_updateTrafficPeersWithService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((v3 & 0x100) != 0)
  {
    uint64_t v10 = @"airplay";
    goto LABEL_20;
  }
  if ((v3 & 0x400) != 0)
  {
    uint64_t v10 = @"D2DMigration";
    goto LABEL_20;
  }
  if ((v3 & 0x1000) != 0)
  {
    uint64_t v10 = @"ensemble";
    goto LABEL_20;
  }
  if ((v3 & 0x2000) != 0)
  {
    uint64_t v10 = @"MPRemoteCamera";
    goto LABEL_20;
  }
  if ((v3 & 0x8000) != 0)
  {
    uint64_t v10 = @"TVRemoteCamera";
    goto LABEL_20;
  }
  if ((v3 & 0x200) != 0)
  {
    uint64_t v10 = @"sidecar";
    goto LABEL_20;
  }
  if ((v3 & 0x4000) != 0)
  {
    uint64_t v10 = @"RemoteCamera";
    goto LABEL_20;
  }
  if ((v3 & 0x10000) != 0)
  {
    uint64_t v10 = @"RemoteScreen";
LABEL_20:
    uint64_t v62 = (uint64_t)v10;
    objc_msgSend(v65, "setObject:forKeyedSubscript:");
    id v11 = self->_trafficPeers;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v78 objects:v89 count:16];
    v64 = self;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v79 != v15) {
            objc_enumerationMutation(v11);
          }
          int v17 = [*(id *)(*((void *)&v78 + 1) + 8 * i) trafficFlags];
          if ((v17 & v3) != 0)
          {
            if ((v17 & 4) != 0) {
              int v18 = 9;
            }
            else {
              int v18 = 1;
            }
            uint64_t v14 = v18 & 0xFFFFFFF9 | (2 * (v17 & 3)) | v14;
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v78 objects:v89 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v19 = [NSNumber numberWithUnsignedInt:v14];
    [v65 setObject:v19 forKeyedSubscript:@"TR_SESSION_FLAGS"];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    int v20 = v11;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v75;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v75 != v23) {
            objc_enumerationMutation(v20);
          }
          char v25 = *(void **)(*((void *)&v74 + 1) + 8 * j);
          if (([v25 trafficFlags] & 0x3200) != 0)
          {
            uint64_t v26 = [v25 sessionID];
            if (v26) {
              [v65 setObject:v26 forKeyedSubscript:@"TR_SIDECAR_SESSION_UUID"];
            }
          }
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v74 objects:v88 count:16];
      }
      while (v22);
    }
    uint64_t v63 = v20;

    if (v14) {
      uint64_t v27 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v27 = MEMORY[0x1E4F1CC28];
    }
    [v65 setObject:v27 forKeyedSubscript:@"TR_ACTIVE"];
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v29 = v64->_trafficPeersCurrent;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v70 objects:v87 count:16];
    uint64_t v31 = @"TR_IFNAME";
    id v32 = @"awdl0";
    if (v30)
    {
      uint64_t v33 = v30;
      uint64_t v34 = *(void *)v71;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v71 != v34) {
            objc_enumerationMutation(v29);
          }
          uint64_t v36 = *(void **)(*((void *)&v70 + 1) + 8 * k);
          if (([v36 trafficFlags] & v3) != 0)
          {
            uint64_t v37 = [v36 peerMACAddressData];
            id v38 = (void *)v37;
            if (v37)
            {
              v85[0] = v31;
              v85[1] = @"TR_PEER_ADDRESS";
              v86[0] = v32;
              v86[1] = v37;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
              v39 = v32;
              v41 = char v40 = v31;
              [v28 addObject:v41];

              uint64_t v31 = v40;
              id v32 = v39;
            }
          }
        }
        uint64_t v33 = [(NSArray *)v29 countByEnumeratingWithState:&v70 objects:v87 count:16];
      }
      while (v33);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v42 = v63;
    uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v66 objects:v84 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v67;
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(void *)v67 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void **)(*((void *)&v66 + 1) + 8 * m);
          if (([v47 trafficFlags] & v3) != 0)
          {
            uint64_t v48 = [v47 peerMACAddressData];
            v49 = (void *)v48;
            if (v48)
            {
              v82[0] = v31;
              v82[1] = @"TR_PEER_ADDRESS";
              v83[0] = v32;
              v83[1] = v48;
              char v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
              [v28 addObject:v50];
            }
          }
        }
        uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v66 objects:v84 count:16];
      }
      while (v44);
    }

    [v65 setObject:v28 forKeyedSubscript:@"TR_PEER_CONTEXTS"];
    int v55 = WiFiDeviceClientTrafficRegistration();
    ucat = v64->_ucat;
    int var0 = ucat->var0;
    if (v55)
    {
      if (var0 <= 90)
      {
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v64->_ucat, 0x5Au)) {
            goto LABEL_80;
          }
          ucat = v64->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeersWithService:]", 0x5Au, (uint64_t)"### Traffic register failed: '%@', %#m\n", v51, v52, v53, v54, v62);
      }
    }
    else if (var0 <= 30)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v64->_ucat, 0x1Eu)) {
          goto LABEL_80;
        }
        ucat = v64->_ucat;
      }
      [(NSArray *)v42 count];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeersWithService:]", 0x1Eu, (uint64_t)"Traffic registered: '%@', %d peers\n", v58, v59, v60, v61, v62);
    }
LABEL_80:
    v64->_int lastTrafficRegistrationErrorCode = v55;
    [(CUWiFiManager *)v64 _updateWiFiState];

    goto LABEL_81;
  }
  uint64_t v9 = self->_ucat;
  if (v9->var0 <= 90)
  {
    if (v9->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au)) {
        goto LABEL_81;
      }
      uint64_t v9 = self->_ucat;
    }
    LogPrintF((uint64_t)v9, (uint64_t)"-[CUWiFiManager _updateTrafficPeersWithService:]", 0x5Au, (uint64_t)"### Bad service flag: 0x%X\n", v5, v6, v7, v8, v3);
  }
LABEL_81:
}

- (void)_updateTrafficPeers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_wifiDevice && self->_trafficPeerChanged)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_7;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_7:
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v9 = self->_trafficPeersCurrent;
        uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          int v12 = 0;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v9);
              }
              v12 |= [*(id *)(*((void *)&v25 + 1) + 8 * i) trafficFlags];
            }
            uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v11);
        }
        else
        {
          int v12 = 0;
        }

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v15 = self->_trafficPeers;
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v22 != v18) {
                objc_enumerationMutation(v15);
              }
              v12 |= [*(id *)(*((void *)&v21 + 1) + 8 * j) trafficFlags];
            }
            uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v17);
        }

        if ((v12 & 0x100) != 0)
        {
          [(CUWiFiManager *)self _updateTrafficPeersWithService:256];
          if ((v12 & 0x400) == 0)
          {
LABEL_25:
            if ((v12 & 0x1000) == 0) {
              goto LABEL_26;
            }
            goto LABEL_36;
          }
        }
        else if ((v12 & 0x400) == 0)
        {
          goto LABEL_25;
        }
        [(CUWiFiManager *)self _updateTrafficPeersWithService:1024];
        if ((v12 & 0x1000) == 0)
        {
LABEL_26:
          if ((v12 & 0x2000) == 0) {
            goto LABEL_27;
          }
          goto LABEL_37;
        }
LABEL_36:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:4096];
        if ((v12 & 0x2000) == 0)
        {
LABEL_27:
          if ((v12 & 0x8000) == 0) {
            goto LABEL_28;
          }
          goto LABEL_38;
        }
LABEL_37:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:0x2000];
        if ((v12 & 0x8000) == 0)
        {
LABEL_28:
          if ((v12 & 0x200) == 0) {
            goto LABEL_29;
          }
          goto LABEL_39;
        }
LABEL_38:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:0x8000];
        if ((v12 & 0x200) == 0)
        {
LABEL_29:
          if ((v12 & 0x4000) == 0) {
            goto LABEL_30;
          }
          goto LABEL_40;
        }
LABEL_39:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:512];
        if ((v12 & 0x4000) == 0)
        {
LABEL_30:
          if ((v12 & 0x10000) == 0)
          {
LABEL_32:
            objc_storeStrong((id *)&self->_trafficPeersCurrent, self->_trafficPeers);
            trafficPeers = self->_trafficPeers;
            self->_trafficPeers = 0;

            self->_trafficPeerChanged = 0;
            [(CUWiFiManager *)self _updateTrafficPeerStatusMonitor];
            return;
          }
LABEL_31:
          [(CUWiFiManager *)self _updateTrafficPeersWithService:0x10000];
          goto LABEL_32;
        }
LABEL_40:
        [(CUWiFiManager *)self _updateTrafficPeersWithService:0x4000];
        if ((v12 & 0x10000) == 0) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      ucat = self->_ucat;
    }
    uint64_t v4 = [(NSArray *)self->_trafficPeersCurrent count];
    [(NSArray *)self->_trafficPeers count];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeers]", 0x1Eu, (uint64_t)"Traffic registration update: %d -> %d peers\n", v5, v6, v7, v8, v4);
    goto LABEL_7;
  }
}

- (void)_updateInfraDisabled
{
  if (!self->_wifiManager || !self->_infraDisabledChanged) {
    return;
  }
  BOOL infraDisabled = self->_infraDisabled;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      if (infraDisabled) {
        uint64_t v9 = "no";
      }
      else {
        uint64_t v9 = "yes";
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateInfraDisabled]", 0x1Eu, (uint64_t)"InfraDisabled: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v9);
      goto LABEL_10;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }
LABEL_10:
  if (infraDisabled)
  {
    WiFiManagerClientDisable();
    self->_wifiAutoJoinDisabled = 1;
    if (self->_wifiDevice)
    {
      uint64_t v10 = WiFiDeviceClientCopyCurrentNetwork();
      if (v10)
      {
        uint64_t v11 = (__WiFiNetwork *)v10;
        WiFiManagerClientTemporarilyDisableNetwork();
        wifiNetworkDisabled = self->_wifiNetworkDisabled;
        if (wifiNetworkDisabled) {
          CFRelease(wifiNetworkDisabled);
        }
        self->_wifiNetworkDisabled = v11;
      }
    }
  }
  else
  {
    if (self->_wifiAutoJoinDisabled)
    {
      WiFiManagerClientEnable();
      self->_wifiAutoJoinDisabled = 0;
    }
    if (self->_wifiNetworkDisabled)
    {
      WiFiManagerClientEnableNetwork();
      uint64_t v13 = self->_wifiNetworkDisabled;
      if (v13)
      {
        CFRelease(v13);
        self->_wifiNetworkDisabled = 0;
      }
    }
  }
  self->_infraDisabledChanged = 0;
}

- (void)_update
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  if (!obj->_invalidateCalled)
  {
    [(CUWiFiManager *)obj _wifiEnsureStarted];
    [(CUWiFiManager *)obj _updateInfraDisabled];
    [(CUWiFiManager *)obj _updateTrafficPeers];
    [(CUWiFiManager *)obj _updateWakeOnWireless];
  }
  objc_sync_exit(obj);
}

- (void)performUpdate:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CUWiFiManager_performUpdate___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  uint64_t v5 = (void (**)(void))a3;
  dispatch_async(dispatchQueue, block);
  v5[2](v5);

  uint64_t v6 = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__CUWiFiManager_performUpdate___block_invoke_2;
  v7[3] = &unk_1E55BFC18;
  v7[4] = self;
  dispatch_async(v6, v7);
}

uint64_t __31__CUWiFiManager_performUpdate___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = 1;
  return result;
}

unsigned char *__31__CUWiFiManager_performUpdate___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  result = *(unsigned char **)(a1 + 32);
  if (result[9])
  {
    if (!result[10]) {
      return (unsigned char *)[result _update];
    }
  }
  return result;
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _invalidated]", 0x3Cu, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v18);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2]();
  }
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id v10 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  id trafficFlagsUnavailableUpdatedHandler = self->_trafficFlagsUnavailableUpdatedHandler;
  self->_id trafficFlagsUnavailableUpdatedHandler = 0;

  id wifiStateChangedHandler = self->_wifiStateChangedHandler;
  self->_id wifiStateChangedHandler = 0;

  self->_invalidateDone = 1;
  uint64_t v17 = self->_ucat;
  if (v17->var0 <= 30)
  {
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0x1Eu)) {
        return;
      }
      uint64_t v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CUWiFiManager _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v13, v14, v15, v16, v20);
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CUWiFiManager_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__CUWiFiManager_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 10)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 10) = 1;
  id v10 = *(void **)(result + 32);
  uint64_t v11 = (int *)v10[2];
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      id v10 = *(void **)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = (int *)v10[2];
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUWiFiManager invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v14);
    id v10 = *(void **)(v9 + 32);
  }
LABEL_6:
  [v10 _wifiEnsureStopped];
  uint64_t v13 = *(void **)(v9 + 32);
  return [v13 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    uint64_t v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)_activateSafeInvokeBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__CUWiFiManager__activateSafeInvokeBlock___block_invoke;
    v7[3] = &unk_1E55BF148;
    v7[4] = v5;
    uint64_t v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

unsigned char *__42__CUWiFiManager__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  result = *(unsigned char **)(a1 + 32);
  if (!result[24])
  {
    return (unsigned char *)[result _update];
  }
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__CUWiFiManager_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E55BF148;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __40__CUWiFiManager_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(int **)(v9 + 16);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUWiFiManager activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v14);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      id v10 = *(int **)(v9 + 16);
      goto LABEL_3;
    }
  }
LABEL_5:
  *(unsigned char *)(v9 + 9) = 1;
  [*(id *)(a1 + 32) _update];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(result + 16);
    return v13();
  }
  return result;
}

- (void)activate
{
}

- (void)setWakeOnWirelessEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__CUWiFiManager_setWakeOnWirelessEnabled___block_invoke;
  v3[3] = &unk_1E55BF0B0;
  BOOL v4 = a3;
  v3[4] = self;
  [(CUWiFiManager *)self _activateSafeInvokeBlock:v3];
}

uint64_t __42__CUWiFiManager_setWakeOnWirelessEnabled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 130))
  {
    *(unsigned char *)(v2 + 130) = v1;
    *(unsigned char *)(*(void *)(result + 32) + 127) = 1;
  }
  return result;
}

- (void)setTrafficPeers:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__CUWiFiManager_setTrafficPeers___block_invoke;
  v6[3] = &unk_1E55BF170;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CUWiFiManager *)self _activateSafeInvokeBlock:v6];
}

void __33__CUWiFiManager_setTrafficPeers___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 126) = 1;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CBE58;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)setInfraDisabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__CUWiFiManager_setInfraDisabled___block_invoke;
  v3[3] = &unk_1E55BF0B0;
  BOOL v4 = a3;
  v3[4] = self;
  [(CUWiFiManager *)self _activateSafeInvokeBlock:v3];
}

uint64_t __34__CUWiFiManager_setInfraDisabled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 128))
  {
    *(unsigned char *)(v2 + 128) = v1;
    *(unsigned char *)(*(void *)(result + 32) + 125) = 1;
  }
  return result;
}

- (void)setControlFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__CUWiFiManager_setControlFlags___block_invoke;
  v3[3] = &unk_1E55BF088;
  unsigned int v4 = a3;
  v3[4] = self;
  [(CUWiFiManager *)self _activateSafeInvokeBlock:v3];
}

uint64_t __33__CUWiFiManager_setControlFlags___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 132)) {
    *(_DWORD *)(v2 + 132) = v1;
  }
  return result;
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
  v4.super_class = (Class)CUWiFiManager;
  [(CUWiFiManager *)&v4 dealloc];
}

- (CUWiFiManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUWiFiManager;
  uint64_t v2 = [(CUWiFiManager *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUWiFiManager;
    uint64_t v3 = v2;
  }

  return v2;
}

@end