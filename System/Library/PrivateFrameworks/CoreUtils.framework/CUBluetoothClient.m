@interface CUBluetoothClient
- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4;
- (CUBluetoothClient)init;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)_createCUBluetoothDeviceWithBTDevice:(BTDeviceImpl *)a3;
- (id)_internalDispatchQueue;
- (id)bluetoothAddressChangedHandler;
- (id)bluetoothStateChangedHandler;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceConnectedHandler;
- (id)deviceDisconnectedHandler;
- (id)deviceEventHandler;
- (id)devicePairedHandler;
- (id)deviceUnpairedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)bluetoothState;
- (unsigned)flags;
- (unsigned)requiredServices;
- (unsigned)statusFlags;
- (void)_btAccessoryNameChanged:(BTDeviceImpl *)a3;
- (void)_btAccessoryPlacementChanged:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4;
- (void)_btAccessoryStreamStateChanged:(int)a3 device:(BTDeviceImpl *)a4;
- (void)_btEnsureStarted;
- (void)_btEnsureStopped;
- (void)_externalInvokeBlock:(id)a3;
- (void)_findDeviceByAddress:(id)a3 completion:(id)a4;
- (void)_handleBluetoothAddressChanged;
- (void)_handleConnectedDevicesInit;
- (void)_handleDeviceConnected:(BTDeviceImpl *)a3;
- (void)_handleDeviceDisconnected:(BTDeviceImpl *)a3 reason:(int)a4;
- (void)_handleDeviceEvent:(unsigned int)a3 device:(BTDeviceImpl *)a4;
- (void)_handlePairingStatusChanged;
- (void)_invalidated;
- (void)_processFindDeviceRequests;
- (void)_setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6;
- (void)activate;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)findDeviceByAddress:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)setBluetoothAddressChangedHandler:(id)a3;
- (void)setBluetoothState:(int)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setDeviceConnectedHandler:(id)a3;
- (void)setDeviceDisconnectedHandler:(id)a3;
- (void)setDeviceEventHandler:(id)a3;
- (void)setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6;
- (void)setDevicePairedHandler:(id)a3;
- (void)setDeviceUnpairedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRequiredServices:(unsigned int)a3;
- (void)setStatusFlags:(unsigned int)a3;
- (void)updateDevice:(id)a3 btDevice:(BTDeviceImpl *)a4;
- (void)updateStatusFlags;
@end

@implementation CUBluetoothClient

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_deviceUnpairedHandler, 0);
  objc_storeStrong(&self->_devicePairedHandler, 0);
  objc_storeStrong(&self->_deviceEventHandler, 0);
  objc_storeStrong(&self->_deviceDisconnectedHandler, 0);
  objc_storeStrong(&self->_deviceConnectedHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothAddressChangedHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_findDeviceRequests, 0);
  objc_storeStrong((id *)&self->_btPairedDevices, 0);
  objc_storeStrong((id *)&self->_btConnectedDevices, 0);
  objc_storeStrong((id *)&self->_btLocalDeviceAddr, 0);
  objc_storeStrong((id *)&self->_btPeripheralManager, 0);
  objc_storeStrong((id *)&self->_btCentralManager, 0);
  objc_storeStrong((id *)&self->_btAdvertisingAddress, 0);
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

- (void)setDeviceUnpairedHandler:(id)a3
{
}

- (id)deviceUnpairedHandler
{
  return self->_deviceUnpairedHandler;
}

- (void)setDevicePairedHandler:(id)a3
{
}

- (id)devicePairedHandler
{
  return self->_devicePairedHandler;
}

- (void)setDeviceEventHandler:(id)a3
{
}

- (id)deviceEventHandler
{
  return self->_deviceEventHandler;
}

- (void)setDeviceDisconnectedHandler:(id)a3
{
}

- (id)deviceDisconnectedHandler
{
  return self->_deviceDisconnectedHandler;
}

- (void)setDeviceConnectedHandler:(id)a3
{
}

- (id)deviceConnectedHandler
{
  return self->_deviceConnectedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothAddressChangedHandler:(id)a3
{
}

- (id)bluetoothAddressChangedHandler
{
  return self->_bluetoothAddressChangedHandler;
}

- (void)setStatusFlags:(unsigned int)a3
{
  self->_statusFlags = a3;
}

- (void)setRequiredServices:(unsigned int)a3
{
  self->_requiredServices = a3;
}

- (unsigned)requiredServices
{
  return self->_requiredServices;
}

- (NSString)label
{
  return self->_label;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setBluetoothState:(int)a3
{
  self->_bluetoothState = a3;
}

- (int)bluetoothState
{
  return self->_bluetoothState;
}

- (void)updateStatusFlags
{
  uint64_t statusFlags = self->_statusFlags;
  self->_uint64_t statusFlags = 0;
  btConnectedDevices = self->_btConnectedDevices;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__CUBluetoothClient_updateStatusFlags__block_invoke;
  v12[3] = &unk_1E55BDC10;
  v12[4] = self;
  [(NSMutableDictionary *)btConnectedDevices enumerateKeysAndObjectsUsingBlock:v12];
  btPairedDevices = self->_btPairedDevices;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__CUBluetoothClient_updateStatusFlags__block_invoke_2;
  v11[3] = &unk_1E55BDC10;
  v11[4] = self;
  [(NSMutableDictionary *)btPairedDevices enumerateKeysAndObjectsUsingBlock:v11];
  if (self->_statusFlags != statusFlags)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient updateStatusFlags]", 0x1Eu, (uint64_t)"Status flags changed: %#{flags} -> %#{flags}\n", v6, v7, v8, v9, statusFlags);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
}

void __38__CUBluetoothClient_updateStatusFlags__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  char v4 = [v7 deviceFlags];
  if (v4) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244) |= 8u;
  }
  if ((v4 & 4) != 0) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244) |= 0x10u;
  }
  if ([v7 supportsAACPService]) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244) |= 4u;
  }
  int v5 = [v7 primaryPlacement];
  if (v5 == 1 || v5 == 4 || (int v6 = [v7 secondaryPlacement], v6 == 4) || v6 == 1) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244) |= 1u;
  }
}

uint64_t __38__CUBluetoothClient_updateStatusFlags__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 supportsAACPService];
  if (result) {
    *(_DWORD *)(*(void *)(a1 + 32) + 244) |= 2u;
  }
  return result;
}

- (void)updateDevice:(id)a3 btDevice:(BTDeviceImpl *)a4
{
  v121[32] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v113 = 0;
  p_btAccessoryManager = (uint64_t *)&self->_btAccessoryManager;
  if (!self->_btAccessoryManager)
  {
    int Default = softLinkBTAccessoryManagerGetDefault((uint64_t)self->_btSession, (uint64_t)&self->_btAccessoryManager);
    if (Default)
    {
      int v31 = Default;
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 != -1)
        {
LABEL_23:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetDefault failed: %#m\n", v27, v28, v29, v30, (v31 + 310000));
          goto LABEL_2;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
        {
          ucat = self->_ucat;
          goto LABEL_23;
        }
      }
    }
  }
LABEL_2:
  int v8 = [v6 address];
  if (!softLinkBTAccessoryManagerReadDeviceVersionInfo(v8, (int)&v120, 32, (int)&v119, 128, (int)v118, 128, (int)v117, 128, (uint64_t)v116, 128, (uint64_t)v115, 128, (uint64_t)v114, 128))
  {
    uint64_t v9 = [NSString stringWithUTF8String:v118];
    [v6 setManufacturer:v9];

    v10 = [NSString stringWithUTF8String:v117];
    [v6 setModelNumber:v10];
  }
  if (*p_btAccessoryManager)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:8000];
    v121[0] = 0;
    uint64_t v12 = *p_btAccessoryManager;
    id v13 = v11;
    uint64_t v14 = [v13 mutableBytes];
    uint64_t v15 = [v13 length];
    if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetAccessoryInfo[0])(v12, (uint64_t)a4, v14, (uint64_t)v121, v15)&& v121[0])
    {
      objc_msgSend(v13, "setLength:");
      v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [v16 objectForKeyedSubscript:@"AACPVersionInfo"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v17 count] >= 0xB)
        {
          v18 = [v17 objectAtIndexedSubscript:10];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 setFirmwareVersion:v18];
          }
        }
      }
    }
  }
  unsigned int v112 = 0;
  int v19 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceGetConnectedServices_2035[0])((uint64_t)a4, (uint64_t)&v112);
  if (v19)
  {
    int v24 = v19;
    v25 = self->_ucat;
    if (v25->var0 > 60) {
      goto LABEL_26;
    }
    if (v25->var0 != -1) {
      goto LABEL_19;
    }
    if (_LogCategory_Initialize((uint64_t)v25, 0x3Cu))
    {
      v25 = self->_ucat;
LABEL_19:
      LogPrintF((uint64_t)v25, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTDeviceGetConnectedServices failed: %#m\n", v20, v21, v22, v23, (v24 + 310000));
    }
  }
  else
  {
    [v6 setConnectedServices:v112];
  }
LABEL_26:
  uint64_t v33 = *p_btAccessoryManager;
  if (!*p_btAccessoryManager) {
    goto LABEL_33;
  }
  LODWORD(v121[0]) = 0;
  int v34 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetDeviceColor[0])(v33, (uint64_t)a4, (uint64_t)v121);
  if (v34)
  {
    int v39 = v34;
    v40 = self->_ucat;
    if (v40->var0 > 60) {
      goto LABEL_33;
    }
    if (v40->var0 != -1) {
      goto LABEL_30;
    }
    if (_LogCategory_Initialize((uint64_t)v40, 0x3Cu))
    {
      v40 = self->_ucat;
LABEL_30:
      LogPrintF((uint64_t)v40, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetDeviceColor failed: %#m\n", v35, v36, v37, v38, (v39 + 310000));
    }
  }
  else
  {
    [v6 setColorCode:LODWORD(v121[0])];
  }
LABEL_33:
  unsigned int v111 = 0;
  softLinkBTDeviceGetDeviceType((uint64_t)a4, (uint64_t)&v111);
  [v6 setDeviceType:v111];
  if (v111 == 17 || v111 == 22) {
    int v42 = 4;
  }
  else {
    int v42 = 0;
  }
  uint64_t v43 = *p_btAccessoryManager;
  if (*p_btAccessoryManager)
  {
    int v113 = 0;
    int v44 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability[0])(v43, (uint64_t)a4, 1, (uint64_t)&v113);
    if (v44)
    {
      int v49 = v44;
      v50 = self->_ucat;
      if (v50->var0 > 60) {
        goto LABEL_47;
      }
      if (v50->var0 != -1) {
        goto LABEL_43;
      }
      if (_LogCategory_Initialize((uint64_t)v50, 0x3Cu))
      {
        v50 = self->_ucat;
LABEL_43:
        LogPrintF((uint64_t)v50, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetFeatureCapability in-ear detect failed: %#m\n", v45, v46, v47, v48, (v49 + 310000));
      }
    }
    else if (v113)
    {
      v42 |= 0x80u;
    }
  }
LABEL_47:
  int v113 = 0;
  int MagicPairingStatus = softLinkBTDeviceGetMagicPairingStatus((uint64_t)a4, (uint64_t)&v113);
  if (MagicPairingStatus)
  {
    int v56 = MagicPairingStatus;
    v57 = self->_ucat;
    if (v57->var0 > 60) {
      goto LABEL_53;
    }
    if (v57->var0 != -1) {
      goto LABEL_50;
    }
    if (_LogCategory_Initialize((uint64_t)v57, 0x3Cu))
    {
      v57 = self->_ucat;
LABEL_50:
      LogPrintF((uint64_t)v57, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTDeviceGetMagicPairingStatus failed: %#m\n", v52, v53, v54, v55, (v56 + 310000));
    }
  }
  else
  {
    [v6 setMagicPaired:v113 != 0];
  }
LABEL_53:
  LOBYTE(v121[0]) = 0;
  int Name = softLinkBTDeviceGetName((uint64_t)a4, (uint64_t)v121, 256);
  if (Name)
  {
    int v63 = Name;
    v64 = self->_ucat;
    if (v64->var0 > 60) {
      goto LABEL_59;
    }
    if (v64->var0 != -1) {
      goto LABEL_56;
    }
    if (_LogCategory_Initialize((uint64_t)v64, 0x3Cu))
    {
      v64 = self->_ucat;
LABEL_56:
      LogPrintF((uint64_t)v64, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTDeviceGetName failed: %#m\n", v59, v60, v61, v62, (v63 + 310000));
    }
  }
  else
  {
    v65 = [NSString stringWithUTF8String:v121];
    [v6 setName:v65];
  }
LABEL_59:
  uint64_t v66 = *p_btAccessoryManager;
  if (!*p_btAccessoryManager) {
    goto LABEL_82;
  }
  int v110 = 0;
  int v67 = softLinkBTAccessoryManagerGetInEarDetectionEnable(v66, (uint64_t)a4, (uint64_t)&v110);
  if (v67)
  {
    int v72 = v67;
    v73 = self->_ucat;
    if (v73->var0 <= 60)
    {
      if (v73->var0 != -1)
      {
LABEL_63:
        LogPrintF((uint64_t)v73, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetInEarDetectionEnable failed: %#m\n", v68, v69, v70, v71, (v72 + 310000));
        goto LABEL_65;
      }
      if (_LogCategory_Initialize((uint64_t)v73, 0x3Cu))
      {
        v73 = self->_ucat;
        goto LABEL_63;
      }
    }
  }
LABEL_65:
  uint64_t v109 = 0x300000003;
  if (!v110)
  {
LABEL_74:
    uint64_t v81 = 7;
    goto LABEL_76;
  }
  int v74 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetInEarStatus[0])(*p_btAccessoryManager, (uint64_t)a4, (uint64_t)&v109 + 4, (uint64_t)&v109);
  if (v74)
  {
    int v79 = v74;
    v80 = self->_ucat;
    if (v80->var0 <= 60)
    {
      if (v80->var0 != -1)
      {
LABEL_69:
        LogPrintF((uint64_t)v80, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetInEarStatus failed: %#m\n", v75, v76, v77, v78, (v79 + 310000));
        goto LABEL_71;
      }
      if (_LogCategory_Initialize((uint64_t)v80, 0x3Cu))
      {
        v80 = self->_ucat;
        goto LABEL_69;
      }
    }
  }
LABEL_71:
  if (!v110) {
    goto LABEL_74;
  }
  if (HIDWORD(v109) > 0xD) {
    uint64_t v81 = 0;
  }
  else {
    uint64_t v81 = dword_18E417514[HIDWORD(v109)];
  }
LABEL_76:
  [v6 setPrimaryPlacement:v81];
  if (v110)
  {
    if (v109 > 0xD) {
      uint64_t v82 = 0;
    }
    else {
      uint64_t v82 = dword_18E417514[v109];
    }
  }
  else
  {
    uint64_t v82 = 7;
  }
  [v6 setSecondaryPlacement:v82];
LABEL_82:
  int v110 = 0;
  uint64_t v109 = 0;
  unsigned int v108 = 0;
  if (!softLinkBTDeviceGetDeviceId((uint64_t)a4, (uint64_t)&v110, (uint64_t)&v109 + 4, (uint64_t)&v109, (uint64_t)&v108))
  {
    [v6 setProductIdentifier:v109];
    [v6 setVersionID:v108];
  }
  uint64_t v83 = *p_btAccessoryManager;
  if (*p_btAccessoryManager)
  {
    int v113 = 0;
    int v84 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability[0])(v83, (uint64_t)a4, 26, (uint64_t)&v113);
    if (v84)
    {
      int v89 = v84;
      v90 = self->_ucat;
      if (v90->var0 <= 60)
      {
        if (v90->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v90, 0x3Cu)) {
            goto LABEL_92;
          }
          v90 = self->_ucat;
        }
        LogPrintF((uint64_t)v90, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetFeatureCapability software volume failed: %#m\n", v85, v86, v87, v88, (v89 + 310000));
      }
LABEL_92:
      int v113 = 0;
      goto LABEL_93;
    }
    if (v113) {
      v42 |= 8u;
    }
  }
LABEL_93:
  unsigned int v107 = 0;
  if (!softLinkBTDeviceGetSupportedServices((uint64_t)a4, (uint64_t)&v107)) {
    [v6 setSupportsAACPService:(v107 >> 19) & 1];
  }
  if ([v6 supportsAACPService]) {
    LODWORD(v91) = v42 | 2;
  }
  else {
    LODWORD(v91) = v42;
  }
  int v113 = 0;
  softLinkBTDeviceIsTemporaryPaired((uint64_t)a4, (uint64_t)&v113);
  if (v113) {
    uint64_t v91 = v91 | 0x10;
  }
  else {
    uint64_t v91 = v91;
  }
  uint64_t v92 = *p_btAccessoryManager;
  if (*p_btAccessoryManager)
  {
    int v113 = 0;
    int v93 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability[0])(v92, (uint64_t)a4, 32, (uint64_t)&v113);
    if (v93)
    {
      int v98 = v93;
      v99 = self->_ucat;
      if (v99->var0 > 60) {
        goto LABEL_109;
      }
      if (v99->var0 != -1) {
        goto LABEL_105;
      }
      if (_LogCategory_Initialize((uint64_t)v99, 0x3Cu))
      {
        v99 = self->_ucat;
LABEL_105:
        LogPrintF((uint64_t)v99, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetFeatureCapability tipi failed: %#m\n", v94, v95, v96, v97, (v98 + 310000));
      }
    }
    else if (v113)
    {
      uint64_t v91 = v91 | 0x20;
    }
  }
LABEL_109:
  int v113 = 0;
  if (MobileBluetoothLibrary_sOnce_2045 != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce_2045, &__block_literal_global_636);
  }
  if (MobileBluetoothLibrary_sLib_2046
    && dlsym((void *)MobileBluetoothLibrary_sLib_2046, "BTDeviceIsWirelessSplitterSupported"))
  {
    int IsWirelessSplitterSupported = softLinkBTDeviceIsWirelessSplitterSupported((uint64_t)a4, (uint64_t)&v113);
    if (IsWirelessSplitterSupported)
    {
      int v105 = IsWirelessSplitterSupported;
      v106 = self->_ucat;
      if (v106->var0 <= 60)
      {
        if (v106->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v106, 0x3Cu)) {
            goto LABEL_119;
          }
          v106 = self->_ucat;
        }
        LogPrintF((uint64_t)v106, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTDeviceIsWS failed: %#m\n", v101, v102, v103, v104, (v105 + 310000));
      }
    }
    else
    {
      uint64_t v91 = v91 | (v113 != 0);
    }
  }
LABEL_119:
  [v6 setDeviceFlags:v91];
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  ucat = self->_ucat;
  id v13 = v4;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
      id v4 = v13;
      if (!v12) {
        goto LABEL_9;
      }
      ucat = self->_ucat;
    }
    unint64_t v6 = [v4 state];
    if (v6 > 0xA) {
      v11 = "?";
    }
    else {
      v11 = off_1E55BDD88[v6];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient peripheralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth state changed: peripheral, %s\n", v7, v8, v9, v10, (uint64_t)v11);
  }
LABEL_9:
  if (self->_btSessionStarted) {
    [(CUBluetoothClient *)self _btEnsureStarted];
  }
  MEMORY[0x1F41817F8]();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (!objc_msgSend(a3, "isEqualToString:", @"advertisingAddress", a4, a5, a6)) {
    return;
  }
  uint64_t v7 = [(CBPeripheralManager *)self->_btPeripheralManager advertisingAddress];
  id v14 = (id)[v7 copy];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      if ([v14 length] == 6) {
        uint64_t v13 = [v14 bytes];
      }
      else {
        uint64_t v13 = 0;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient observeValueForKeyPath:ofObject:change:context:]", 0x1Eu, (uint64_t)"Bluetooth advertising address: %.6a\n", v9, v10, v11, v12, v13);
      goto LABEL_11;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
LABEL_11:
  [(CUBluetoothClient *)self _handleBluetoothAddressChanged];
}

- (void)_handlePairingStatusChanged
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  unint64_t v86 = 0;
  uint64_t v3 = 256;
  uint64_t v4 = 5;
  do
  {
    int v5 = malloc_type_malloc(8 * v3, 0x2004093837F09uLL);
    if (!v5)
    {
      NSErrorWithOSStatusF(4294960568, (uint64_t)"Malloc paired device array failed (%zu bytes)", v6, v7, v8, v9, v10, v11, v3);
      goto LABEL_57;
    }
    uint64_t v12 = v5;
    int v13 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetPairedDevices)((uint64_t)self->_btLocalDevice, (uint64_t)v5, (uint64_t)&v86, v3);
    if (!v13)
    {
      [(NSMutableDictionary *)self->_btPairedDevices enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2061];
      if (v86)
      {
        unint64_t v26 = 0;
        p_vtable = &OBJC_METACLASS___CUBluetoothDevice.vtable;
        do
        {
          uint64_t v28 = v12[v26];
          v88[0] = 0;
          int v29 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))p_vtable[426])(v28, (uint64_t)v88, 32);
          if (!v29)
          {
            uint64_t v36 = [NSString stringWithUTF8String:v88];
            uint64_t v37 = [(NSMutableDictionary *)self->_btPairedDevices objectForKeyedSubscript:v36];
            if (v37)
            {
              uint64_t v38 = v37;
              [(CUBluetoothDevice *)v37 setPresent:1];
LABEL_35:

              goto LABEL_36;
            }
            uint64_t v38 = objc_alloc_init(CUBluetoothDevice);
            int v39 = [(CBCentralManager *)self->_btCentralManager retrievePeripheralWithAddress:v36];
            v40 = [v39 identifier];
            [(CUBluetoothDevice *)v38 setIdentifier:v40];

            unsigned __int16 v85 = 0;
            unsigned int v84 = 0;
            if (!softLinkBTDeviceAddressFromString((uint64_t)v88, (uint64_t)&v84))
            {
              unint64_t v73 = v73 & 0xFFFF000000000000 | v84 | ((unint64_t)v85 << 32);
              -[CUBluetoothDevice setAddress:](v38, "setAddress:");
            }
            [(CUBluetoothDevice *)v38 setAddressString:v36];
            [(CUBluetoothDevice *)v38 setPresent:1];
            [(CUBluetoothClient *)self updateDevice:v38 btDevice:v28];
            btPairedDevices = self->_btPairedDevices;
            if (!btPairedDevices)
            {
              int v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              uint64_t v43 = self->_btPairedDevices;
              self->_btPairedDevices = v42;

              btPairedDevices = self->_btPairedDevices;
            }
            [(NSMutableDictionary *)btPairedDevices setObject:v38 forKeyedSubscript:v36];
            ucat = self->_ucat;
            if (ucat->var0 <= 30)
            {
              if (ucat->var0 != -1) {
                goto LABEL_25;
              }
              if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
              {
                ucat = self->_ucat;
LABEL_25:
                LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x1Eu, (uint64_t)"Found %@\n", v44, v45, v46, v47, (uint64_t)v38);
              }
            }
            [(CUBluetoothClient *)self updateStatusFlags];
            if (self->_btPairedDevicesInitialized || (self->_flags & 1) != 0)
            {
              int v49 = _Block_copy(self->_devicePairedHandler);
              v50 = v49;
              if (v49)
              {
                v81[0] = MEMORY[0x1E4F143A8];
                v81[1] = 3221225472;
                v81[2] = __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_2;
                v81[3] = &unk_1E55BF148;
                uint64_t v83 = v49;
                uint64_t v82 = v38;
                [(CUBluetoothClient *)self _externalInvokeBlock:v81];
              }
            }

            p_vtable = (void **)(&OBJC_METACLASS___CUBluetoothDevice + 24);
            goto LABEL_35;
          }
          int v34 = v29;
          uint64_t v35 = self->_ucat;
          if (v35->var0 <= 60)
          {
            if (v35->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v35, 0x3Cu)) {
                goto LABEL_36;
              }
              uint64_t v35 = self->_ucat;
            }
            LogPrintF((uint64_t)v35, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x3Cu, (uint64_t)"### BTDeviceGetAddressString failed: %#m\n", v30, v31, v32, v33, (v34 + 310000));
          }
LABEL_36:
          ++v26;
        }
        while (v26 < v86);
      }
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      v51 = [(NSMutableDictionary *)self->_btPairedDevices allKeys];
      uint64_t v52 = [v51 countByEnumeratingWithState:&v77 objects:v87 count:16];
      if (!v52) {
        goto LABEL_56;
      }
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v78;
LABEL_41:
      uint64_t v55 = 0;
      while (1)
      {
        if (*(void *)v78 != v54) {
          objc_enumerationMutation(v51);
        }
        uint64_t v56 = *(void *)(*((void *)&v77 + 1) + 8 * v55);
        v57 = [(NSMutableDictionary *)self->_btPairedDevices objectForKeyedSubscript:v56];
        if ([v57 present]) {
          goto LABEL_52;
        }
        [(NSMutableDictionary *)self->_btPairedDevices setObject:0 forKeyedSubscript:v56];
        uint64_t v62 = self->_ucat;
        if (v62->var0 <= 30)
        {
          if (v62->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v62, 0x1Eu)) {
              goto LABEL_49;
            }
            uint64_t v62 = self->_ucat;
          }
          LogPrintF((uint64_t)v62, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x1Eu, (uint64_t)"Lost %@\n", v58, v59, v60, v61, (uint64_t)v57);
        }
LABEL_49:
        [(CUBluetoothClient *)self updateStatusFlags];
        int v63 = _Block_copy(self->_deviceUnpairedHandler);
        v64 = v63;
        if (v63)
        {
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_3;
          v74[3] = &unk_1E55BF148;
          uint64_t v76 = v63;
          id v75 = v57;
          [(CUBluetoothClient *)self _externalInvokeBlock:v74];
        }
LABEL_52:

        if (v53 == ++v55)
        {
          uint64_t v65 = [v51 countByEnumeratingWithState:&v77 objects:v87 count:16];
          uint64_t v53 = v65;
          if (!v65)
          {
LABEL_56:

            self->_btPairedDevicesInitialized = 1;
            free(v12);
            uint64_t v66 = 0;
            goto LABEL_62;
          }
          goto LABEL_41;
        }
      }
    }
    uint64_t v18 = (v13 + 310000);
    int v19 = self->_ucat;
    if (v19->var0 > 60) {
      goto LABEL_8;
    }
    if (v19->var0 != -1) {
      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)v19, 0x3Cu))
    {
      int v19 = self->_ucat;
LABEL_6:
      LogPrintF((uint64_t)v19, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x3Cu, (uint64_t)"### BTLocalDeviceGetPairedDevices failed: %#m\n", v14, v15, v16, v17, v18);
    }
LABEL_8:
    free(v12);
    v3 *= 2;
    --v4;
  }
  while (v4);
  NSErrorWithOSStatusF(v18, (uint64_t)"Get paired devices failed", v20, v21, v22, v23, v24, v25, v72);
  uint64_t v66 = LABEL_57:;
  if (v66)
  {
    uint64_t v71 = self->_ucat;
    if (v71->var0 <= 60)
    {
      if (v71->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v71, 0x3Cu)) {
          goto LABEL_62;
        }
        uint64_t v71 = self->_ucat;
      }
      LogPrintF((uint64_t)v71, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x3Cu, (uint64_t)"### Handle pairing status change failed: %{error}\n", v67, v68, v69, v70, (uint64_t)v66);
    }
  }
LABEL_62:
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setPresent:0];
}

- (void)_handleDeviceEvent:(unsigned int)a3 device:(BTDeviceImpl *)a4
{
  uint64_t v7 = _Block_copy(self->_deviceEventHandler);
  if (v7)
  {
    uint64_t v8 = [(CUBluetoothClient *)self _createCUBluetoothDeviceWithBTDevice:a4];
    if (!v8)
    {
LABEL_8:

      goto LABEL_9;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
          goto LABEL_7;
        }
        ucat = self->_ucat;
      }
      BTServiceSpecificEventToString_2094(a3);
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleDeviceEvent:device:]", 0x1Eu, (uint64_t)"Device event: %@, event %s\n", v10, v11, v12, v13, (uint64_t)v8);
    }
LABEL_7:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__CUBluetoothClient__handleDeviceEvent_device___block_invoke;
    v14[3] = &unk_1E55BE3A0;
    v14[4] = v8;
    v14[5] = v7;
    unsigned int v15 = a3;
    [(CUBluetoothClient *)self _externalInvokeBlock:v14];
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __47__CUBluetoothClient__handleDeviceEvent_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

- (void)_handleDeviceDisconnected:(BTDeviceImpl *)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v33 = 0;
  int v7 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceGetConnectedServices_2035[0])((uint64_t)a3, (uint64_t)&v33);
  if (v7)
  {
    int v12 = v7;
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleDeviceDisconnected:reason:]", 0x3Cu, (uint64_t)"### BTDeviceGetConnectedServices failed: %#m\n", v8, v9, v10, v11, (v12 + 310000));
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
LABEL_6:
  if (v33) {
    return;
  }
  v34[0] = 0;
  int v14 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_2062[0])((uint64_t)a3, (uint64_t)v34, 32);
  if (!v14)
  {
    uint64_t v21 = [NSString stringWithUTF8String:v34];
    unint64_t v26 = [(NSMutableDictionary *)self->_btConnectedDevices objectForKeyedSubscript:v21];
    if (!v26)
    {
LABEL_24:

      return;
    }
    uint64_t v27 = self->_ucat;
    if (v27->var0 <= 30)
    {
      if (v27->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v27, 0x1Eu)) {
          goto LABEL_19;
        }
        uint64_t v27 = self->_ucat;
      }
      LogPrintF((uint64_t)v27, (uint64_t)"-[CUBluetoothClient _handleDeviceDisconnected:reason:]", 0x1Eu, (uint64_t)"Device disconnected: %@, reason %#m\n", v22, v23, v24, v25, (uint64_t)v26);
    }
LABEL_19:
    [(NSMutableDictionary *)self->_btConnectedDevices setObject:0 forKeyedSubscript:v21];
    if (![v26 disconnectReason]) {
      [v26 setDisconnectReason:v4];
    }
    [(CUBluetoothClient *)self updateStatusFlags];
    uint64_t v28 = _Block_copy(self->_deviceDisconnectedHandler);
    int v29 = v28;
    if (v28)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __54__CUBluetoothClient__handleDeviceDisconnected_reason___block_invoke;
      v30[3] = &unk_1E55BF148;
      uint64_t v32 = v28;
      id v31 = v26;
      [(CUBluetoothClient *)self _externalInvokeBlock:v30];
    }
    goto LABEL_24;
  }
  int v19 = v14;
  uint64_t v20 = self->_ucat;
  if (v20->var0 <= 60)
  {
    if (v20->var0 != -1)
    {
LABEL_11:
      LogPrintF((uint64_t)v20, (uint64_t)"-[CUBluetoothClient _handleDeviceDisconnected:reason:]", 0x3Cu, (uint64_t)"### BTDeviceGetAddressString failed: %#m\n", v15, v16, v17, v18, (v19 + 310000));
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v20, 0x3Cu))
    {
      uint64_t v20 = self->_ucat;
      goto LABEL_11;
    }
  }
}

uint64_t __54__CUBluetoothClient__handleDeviceDisconnected_reason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleDeviceConnected:(BTDeviceImpl *)a3
{
  uint64_t v4 = [(CUBluetoothClient *)self _createCUBluetoothDeviceWithBTDevice:a3];
  int v5 = [v4 addressString];
  if (!v5) {
    goto LABEL_15;
  }
  if ((self->_flags & 0x100) == 0)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_btConnectedDevices objectForKeyedSubscript:v5];

    if (v6) {
      goto LABEL_15;
    }
  }
  int v7 = [(NSMutableDictionary *)self->_btConnectedDevices objectForKeyedSubscript:v5];
  int v12 = v7;
  if (v7) {
    objc_msgSend(v4, "setStreamState:", objc_msgSend(v7, "streamState"));
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_10;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleDeviceConnected:]", 0x1Eu, (uint64_t)"Device connected: %@\n", v8, v9, v10, v11, (uint64_t)v4);
  }
LABEL_10:
  btConnectedDevices = self->_btConnectedDevices;
  if (!btConnectedDevices)
  {
    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v16 = self->_btConnectedDevices;
    self->_btConnectedDevices = v15;

    btConnectedDevices = self->_btConnectedDevices;
  }
  [(NSMutableDictionary *)btConnectedDevices setObject:v4 forKeyedSubscript:v5];
  [(CUBluetoothClient *)self updateStatusFlags];
  uint64_t v17 = _Block_copy(self->_deviceConnectedHandler);
  uint64_t v18 = v17;
  if (v17)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__CUBluetoothClient__handleDeviceConnected___block_invoke;
    v19[3] = &unk_1E55BF148;
    uint64_t v21 = v17;
    id v20 = v4;
    [(CUBluetoothClient *)self _externalInvokeBlock:v19];
  }
LABEL_15:
}

uint64_t __44__CUBluetoothClient__handleDeviceConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleConnectedDevicesInit
{
  if (!self->_btLocalDevice) {
    return;
  }
  unint64_t v54 = 0;
  int v3 = 5;
  uint64_t v4 = 256;
  do
  {
    int v5 = malloc_type_malloc(8 * v4, 0x2004093837F09uLL);
    if (!v5)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90) {
        return;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x5Au, (uint64_t)"### Malloc connected device array failed (%zu bytes)", v6, v7, v8, v9, v4);
      return;
    }
    uint64_t v10 = v5;
    int v11 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetConnectedDevices)((uint64_t)self->_btLocalDevice, (uint64_t)v5, (uint64_t)&v54, v4);
    if (!v11)
    {
      if (!v54)
      {
LABEL_49:
        free(v10);
        return;
      }
      uint64_t v23 = 0;
      while (1)
      {
        uint64_t v24 = *((void *)v10 + v23);
        if (!self->_requiredServices)
        {
LABEL_27:
          int v39 = [(CUBluetoothClient *)self _createCUBluetoothDeviceWithBTDevice:v24];
          if (v39)
          {
            v40 = self->_ucat;
            if (v40->var0 <= 30)
            {
              if (v40->var0 != -1) {
                goto LABEL_30;
              }
              if (_LogCategory_Initialize((uint64_t)v40, 0x1Eu))
              {
                v40 = self->_ucat;
LABEL_30:
                LogPrintF((uint64_t)v40, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x1Eu, (uint64_t)"Connected device: %@\n", v35, v36, v37, v38, (uint64_t)v39);
              }
            }
            int v42 = [v39 addressString];
            if (v42)
            {
              btConnectedDevices = self->_btConnectedDevices;
              if (!btConnectedDevices)
              {
                uint64_t v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
                uint64_t v45 = self->_btConnectedDevices;
                self->_btConnectedDevices = v44;

                btConnectedDevices = self->_btConnectedDevices;
              }
              [(NSMutableDictionary *)btConnectedDevices setObject:v39 forKeyedSubscript:v42];
              [(CUBluetoothClient *)self updateStatusFlags];
              uint64_t v46 = _Block_copy(self->_deviceConnectedHandler);
              uint64_t v47 = v46;
              if (v46)
              {
                v50[0] = MEMORY[0x1E4F143A8];
                v50[1] = 3221225472;
                v50[2] = __48__CUBluetoothClient__handleConnectedDevicesInit__block_invoke;
                v50[3] = &unk_1E55BF148;
                uint64_t v52 = v46;
                id v51 = v39;
                [(CUBluetoothClient *)self _externalInvokeBlock:v50];
              }
            }
          }
          goto LABEL_43;
        }
        int v53 = 0;
        int v25 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceGetConnectedServices_2035[0])(v24, (uint64_t)&v53);
        uint64_t v30 = (v25 + 310000);
        if (v25 && v30 != 0)
        {
          uint64_t v32 = self->_ucat;
          if (v32->var0 <= 90)
          {
            if (v32->var0 != -1) {
              goto LABEL_24;
            }
            if (_LogCategory_Initialize((uint64_t)v32, 0x5Au)) {
              break;
            }
          }
        }
LABEL_26:
        int v33 = v53;
        unsigned int requiredServices = self->_requiredServices;
        if ((requiredServices & ~v53) == 0) {
          goto LABEL_27;
        }
        v41 = self->_ucat;
        if (v41->var0 <= 30)
        {
          if (v41->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v41, 0x1Eu)) {
              goto LABEL_43;
            }
            v41 = self->_ucat;
            unsigned int requiredServices = self->_requiredServices;
            int v33 = v53;
          }
          LogPrintF((uint64_t)v41, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x1Eu, (uint64_t)"BTService connect ignoring due to missing services: %#{flags}\n", v26, v27, v28, v29, requiredServices & ~v33);
        }
LABEL_43:
        if (++v23 >= v54) {
          goto LABEL_49;
        }
      }
      uint64_t v32 = self->_ucat;
LABEL_24:
      LogPrintF((uint64_t)v32, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x5Au, (uint64_t)"### BTDeviceGetConnectedServices failed: initial, %#m\n", v26, v27, v28, v29, v30);
      goto LABEL_26;
    }
    int v16 = v11;
    uint64_t v17 = self->_ucat;
    if (v17->var0 > 60) {
      goto LABEL_9;
    }
    if (v17->var0 != -1) {
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)v17, 0x3Cu))
    {
      uint64_t v17 = self->_ucat;
LABEL_7:
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x3Cu, (uint64_t)"### BTLocalDeviceGetPairedDevices failed: %#m\n", v12, v13, v14, v15, (v16 + 310000));
    }
LABEL_9:
    free(v10);
    v4 *= 2;
    --v3;
  }
  while (v3);
  uint64_t v48 = self->_ucat;
  if (v48->var0 <= 90)
  {
    if (v48->var0 != -1) {
      goto LABEL_52;
    }
    if (_LogCategory_Initialize((uint64_t)v48, 0x5Au))
    {
      uint64_t v48 = self->_ucat;
LABEL_52:
      LogPrintF((uint64_t)v48, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x5Au, (uint64_t)"### Get connected devices failed (too many)", v18, v19, v20, v21, v49);
    }
  }
}

uint64_t __48__CUBluetoothClient__handleConnectedDevicesInit__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleBluetoothAddressChanged
{
  int v3 = [(CBPeripheralManager *)self->_btPeripheralManager advertisingAddress];
  uint64_t v4 = (void *)[v3 copy];

  if ([v4 length] == 6
    && (v5 = v4, uint64_t v6 = [(NSData *)v5 bytes],
                                         *(_DWORD *)v6 | *(unsigned __int16 *)(v6 + 4))
    || (int v5 = self->_btLocalDeviceAddr, v4, [(NSData *)v5 length] == 6)
    && (v5 = v5, uint64_t v7 = [(NSData *)v5 bytes],
                                         *(_DWORD *)v7 | *(unsigned __int16 *)(v7 + 4)))
  {
    if (([(NSData *)self->_btAdvertisingAddress isEqual:v5] & 1) == 0)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
            goto LABEL_14;
          }
          ucat = self->_ucat;
        }
        if ([(NSData *)v5 length] == 6) {
          uint64_t v13 = [(NSData *)v5 bytes];
        }
        else {
          uint64_t v13 = 0;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleBluetoothAddressChanged]", 0x1Eu, (uint64_t)"Bluetooth address changed: %.6a\n", v9, v10, v11, v12, v13);
      }
LABEL_14:
      objc_storeStrong((id *)&self->_btAdvertisingAddress, v5);
      uint64_t v14 = _Block_copy(self->_bluetoothAddressChangedHandler);
      uint64_t v15 = v14;
      if (v14)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __51__CUBluetoothClient__handleBluetoothAddressChanged__block_invoke;
        v16[3] = &unk_1E55BF148;
        uint64_t v18 = v14;
        uint64_t v17 = v5;
        [(CUBluetoothClient *)self _externalInvokeBlock:v16];
      }
    }
  }
}

uint64_t __51__CUBluetoothClient__handleBluetoothAddressChanged__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_createCUBluetoothDeviceWithBTDevice:(BTDeviceImpl *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v5 = objc_alloc_init(CUBluetoothDevice);
  v26[0] = 0;
  int v6 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_2062[0])((uint64_t)a3, (uint64_t)v26, 32);
  if (!v6)
  {
    uint64_t v13 = [NSString stringWithUTF8String:v26];
    [(CUBluetoothDevice *)v5 setAddressString:v13];
    unsigned __int16 v25 = 0;
    unsigned int v24 = 0;
    int v14 = softLinkBTDeviceAddressFromString((uint64_t)v26, (uint64_t)&v24);
    if (v14)
    {
      int v19 = v14;
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
            goto LABEL_13;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:]", 0x3Cu, (uint64_t)"### BTDeviceAddressFromString failed: %#m\n", v15, v16, v17, v18, (v19 + 310000));
      }
    }
    else
    {
      [(CUBluetoothDevice *)v5 setAddress:v24 | ((unint64_t)v25 << 32)];
      uint64_t v21 = [(CBCentralManager *)self->_btCentralManager retrievePeripheralWithAddress:v13];
      uint64_t v22 = [v21 identifier];
      [(CUBluetoothDevice *)v5 setIdentifier:v22];
    }
LABEL_13:

    goto LABEL_14;
  }
  int v11 = v6;
  uint64_t v12 = self->_ucat;
  if (v12->var0 > 60) {
    goto LABEL_14;
  }
  if (v12->var0 != -1) {
    goto LABEL_4;
  }
  if (_LogCategory_Initialize((uint64_t)v12, 0x3Cu))
  {
    uint64_t v12 = self->_ucat;
LABEL_4:
    LogPrintF((uint64_t)v12, (uint64_t)"-[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:]", 0x3Cu, (uint64_t)"### BTDeviceGetAddressString failed: %#m\n", v7, v8, v9, v10, (v11 + 310000));
  }
LABEL_14:
  [(CUBluetoothDevice *)v5 setPresent:1];
  [(CUBluetoothClient *)self updateDevice:v5 btDevice:a3];
  return v5;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 1) > 9) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = dword_18E4174EC[v4 - 1];
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_12;
      }
      ucat = self->_ucat;
    }
    if (v9 > 0xA) {
      int v11 = "?";
    }
    else {
      int v11 = off_1E55BDD88[v9];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient centralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth state changed: central, %s\n", v5, v6, v7, v8, (uint64_t)v11);
  }
LABEL_12:
  self->_bluetoothState = v9;
  uint64_t v12 = _Block_copy(self->_bluetoothStateChangedHandler);
  if (v12) {
    [(CUBluetoothClient *)self _externalInvokeBlock:v12];
  }
  if (self->_btSessionStarted) {
    [(CUBluetoothClient *)self _btEnsureStarted];
  }
  MEMORY[0x1F41817F8]();
}

- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  id v6 = a3;
  uint64_t v7 = (char *)[v6 UTF8String];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_21;
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"Bad device ID UTF-8: '%@'", v8, v9, v10, v11, v12, (uint64_t)v6);
    goto LABEL_24;
  }
  uint64_t v13 = v7;
  long long v37 = 0uLL;
  if (!StringToUUIDEx(v7, 0xFFFFFFFFFFFFFFFFLL, 0, 0, &v37, v10, v11, v12))
  {
    int v24 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier_2110[0])((uint64_t)self->_btSession, (uint64_t)&v37, (uint64_t)&v36);
    if (v24 == -310000) {
      uint64_t v30 = 4294960596;
    }
    else {
      uint64_t v30 = (v24 + 310000);
    }
    if (!v24) {
      goto LABEL_14;
    }
    if (!a4) {
      goto LABEL_21;
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], v30, (uint64_t)"BTDeviceFromIdentifier failed", v25, v26, v27, v28, v29, v33);
LABEL_24:
    id v31 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  __int16 v35 = 0;
  int v34 = 0;
  uint64_t v14 = TextToHardwareAddress(v13, 0xFFFFFFFFFFFFFFFFLL, 6, &v34);
  if (v14)
  {
    if (a4)
    {
      uint64_t v21 = v14;
      uint64_t v22 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v33 = (uint64_t)v13;
      uint64_t v23 = "Bad device ID format: '%s'";
      goto LABEL_20;
    }
LABEL_21:
    id v31 = 0;
    goto LABEL_15;
  }
  int v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromAddress_2113[0])((uint64_t)self->_btSession, (uint64_t)&v34, (uint64_t)&v36);
  if (v20 == -310000) {
    uint64_t v21 = 4294960596;
  }
  else {
    uint64_t v21 = (v20 + 310000);
  }
  if (v20)
  {
    if (a4)
    {
      uint64_t v22 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v23 = "BTDeviceFromAddress failed";
LABEL_20:
      NSErrorF_safe(v22, v21, (uint64_t)v23, v15, v16, v17, v18, v19, v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_14:
  id v31 = v36;
LABEL_15:

  return v31;
}

- (void)_btAccessoryPlacementChanged:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  int v57 = 0;
  int v7 = softLinkBTAccessoryManagerGetInEarDetectionEnable((uint64_t)a3, (uint64_t)a4, (uint64_t)&v57);
  if (v7)
  {
    int v12 = v7;
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
          goto LABEL_11;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x3Cu, (uint64_t)"### Placement changed: BTAccessoryManagerGetInEarDetectionEnable failed: %#m\n", v8, v9, v10, v11, (v12 + 310000));
    }
LABEL_11:
    int v57 = 0;
    goto LABEL_12;
  }
  unsigned int v55 = 3;
  unsigned int v56 = 3;
  if (v57)
  {
    int v14 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetInEarStatus[0])((uint64_t)a3, (uint64_t)a4, (uint64_t)&v56, (uint64_t)&v55);
    if (v14)
    {
      int v19 = v14;
      int v20 = self->_ucat;
      if (v20->var0 <= 60)
      {
        if (v20->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v20, 0x3Cu)) {
            goto LABEL_12;
          }
          int v20 = self->_ucat;
        }
        LogPrintF((uint64_t)v20, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x3Cu, (uint64_t)"### Placement changed: BTAccessoryManagerGetInEarStatus failed: %#m\n", v15, v16, v17, v18, (v19 + 310000));
      }
LABEL_12:
      unsigned int v55 = 3;
      unsigned int v56 = 3;
    }
  }
  v58[0] = 0;
  int v21 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_2062[0])((uint64_t)a4, (uint64_t)v58, 32);
  if (!v21)
  {
    uint64_t v26 = [NSString stringWithUTF8String:v58];
    uint64_t v27 = [(NSMutableDictionary *)self->_btConnectedDevices objectForKeyedSubscript:v26];
    uint64_t v32 = v27;
    if (!v27)
    {
      id v51 = self->_ucat;
      if (v51->var0 <= 30)
      {
        if (v51->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v51, 0x1Eu)) {
            goto LABEL_41;
          }
          id v51 = self->_ucat;
        }
        LogPrintF((uint64_t)v51, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x1Eu, (uint64_t)"Placement changed: Lookup device failed: %@\n", v28, v29, v30, v31, (uint64_t)v26);
      }
      goto LABEL_41;
    }
    int v33 = [v27 primaryPlacement];
    if (v57)
    {
      if (v56 > 0xD) {
        uint64_t v34 = 0;
      }
      else {
        uint64_t v34 = dword_18E417514[v56];
      }
    }
    else
    {
      uint64_t v34 = 7;
    }
    int v35 = [v32 secondaryPlacement];
    if (v57)
    {
      if (v55 > 0xD) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = dword_18E417514[v55];
      }
    }
    else
    {
      uint64_t v40 = 7;
    }
    if (v34 == v33 && v40 == v35)
    {
      v41 = self->_ucat;
      if (v41->var0 <= 10)
      {
        if (v41->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v41, 0xAu)) {
            goto LABEL_41;
          }
          v41 = self->_ucat;
        }
        LogPrintF((uint64_t)v41, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0xAu, (uint64_t)"Placement unchanged: %@\n", v36, v37, v38, v39, (uint64_t)v32);
      }
LABEL_41:

      return;
    }
    [v32 setPrimaryPlacement:v34];
    [v32 setSecondaryPlacement:v40];
    [(CUBluetoothClient *)self updateStatusFlags];
    uint64_t v46 = self->_ucat;
    if (v46->var0 <= 30)
    {
      if (v46->var0 != -1) {
        goto LABEL_37;
      }
      if (_LogCategory_Initialize((uint64_t)v46, 0x1Eu))
      {
        uint64_t v46 = self->_ucat;
LABEL_37:
        LogPrintF((uint64_t)v46, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x1Eu, (uint64_t)"Placement changed: %@, P %s -> %s, S %s -> %s\n", v42, v43, v44, v45, (uint64_t)v32);
      }
    }
    uint64_t v47 = _Block_copy(self->_deviceConnectedHandler);
    uint64_t v48 = v47;
    if (v47)
    {
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __57__CUBluetoothClient__btAccessoryPlacementChanged_device___block_invoke;
      v52[3] = &unk_1E55BF148;
      unint64_t v54 = v47;
      id v53 = v32;
      [(CUBluetoothClient *)self _externalInvokeBlock:v52];
    }
    goto LABEL_41;
  }
  int v49 = v21;
  v50 = self->_ucat;
  if (v50->var0 <= 60)
  {
    if (v50->var0 != -1)
    {
LABEL_47:
      LogPrintF((uint64_t)v50, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x3Cu, (uint64_t)"### Placement changed: BTDeviceGetAddressString failed: %#m\n", v22, v23, v24, v25, (v49 + 310000));
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v50, 0x3Cu))
    {
      v50 = self->_ucat;
      goto LABEL_47;
    }
  }
}

uint64_t __57__CUBluetoothClient__btAccessoryPlacementChanged_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_btAccessoryStreamStateChanged:(int)a3 device:(BTDeviceImpl *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ((self->_flags & 0x40) != 0)
  {
    uint64_t v4 = *(void *)&a3;
    v36[0] = 0;
    int v6 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_2062[0])((uint64_t)a4, (uint64_t)v36, 32);
    if (!v6)
    {
      uint64_t v11 = [NSString stringWithUTF8String:v36];
      int v12 = [(NSMutableDictionary *)self->_btConnectedDevices objectForKeyedSubscript:v11];
      uint64_t v17 = v12;
      if (!v12)
      {
        ucat = self->_ucat;
        if (ucat->var0 <= 30)
        {
          if (ucat->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
              goto LABEL_19;
            }
            ucat = self->_ucat;
          }
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]", 0x1Eu, (uint64_t)"Stream state changed: Lookup device failed: %@\n", v13, v14, v15, v16, (uint64_t)v11);
        }
        goto LABEL_19;
      }
      if ([v12 streamState] == v4)
      {
        uint64_t v22 = self->_ucat;
        if (v22->var0 <= 10)
        {
          if (v22->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v22, 0xAu)) {
              goto LABEL_19;
            }
            uint64_t v22 = self->_ucat;
          }
          LogPrintF((uint64_t)v22, (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]", 0xAu, (uint64_t)"Stream state unchanged: %@\n", v18, v19, v20, v21, (uint64_t)v17);
        }
LABEL_19:

        return;
      }
      [v17 setStreamState:v4];
      uint64_t v27 = self->_ucat;
      if (v27->var0 <= 30)
      {
        if (v27->var0 != -1) {
          goto LABEL_15;
        }
        if (_LogCategory_Initialize((uint64_t)v27, 0x1Eu))
        {
          uint64_t v27 = self->_ucat;
LABEL_15:
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]", 0x1Eu, (uint64_t)"Stream state changed: %@, %s -> %s\n", v23, v24, v25, v26, (uint64_t)v17);
        }
      }
      uint64_t v28 = _Block_copy(self->_deviceConnectedHandler);
      uint64_t v29 = v28;
      if (v28)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __59__CUBluetoothClient__btAccessoryStreamStateChanged_device___block_invoke;
        v33[3] = &unk_1E55BF148;
        int v35 = v28;
        id v34 = v17;
        [(CUBluetoothClient *)self _externalInvokeBlock:v33];
      }
      goto LABEL_19;
    }
    int v30 = v6;
    uint64_t v31 = self->_ucat;
    if (v31->var0 <= 60)
    {
      if (v31->var0 != -1)
      {
LABEL_23:
        LogPrintF((uint64_t)v31, (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]", 0x3Cu, (uint64_t)"### Stream state changed: BTDeviceGetAddressString failed: %#m\n", v7, v8, v9, v10, (v30 + 310000));
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v31, 0x3Cu))
      {
        uint64_t v31 = self->_ucat;
        goto LABEL_23;
      }
    }
  }
}

uint64_t __59__CUBluetoothClient__btAccessoryStreamStateChanged_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_btAccessoryNameChanged:(BTDeviceImpl *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ((self->_flags & 0x40) != 0)
  {
    v43[0] = 0;
    int v5 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_2062[0])((uint64_t)a3, (uint64_t)v43, 32);
    if (!v5)
    {
      uint64_t v10 = [NSString stringWithUTF8String:v43];
      uint64_t v11 = [(NSMutableDictionary *)self->_btConnectedDevices objectForKeyedSubscript:v10];
      uint64_t v16 = v11;
      if (!v11)
      {
        ucat = self->_ucat;
        if (ucat->var0 <= 30)
        {
          if (ucat->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
              goto LABEL_25;
            }
            ucat = self->_ucat;
          }
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]", 0x1Eu, (uint64_t)"Name state changed: Lookup device failed: %@\n", v12, v13, v14, v15, (uint64_t)v10);
        }
LABEL_25:

        return;
      }
      id v17 = [v11 name];
      v42[0] = 0;
      if (softLinkBTDeviceGetName((uint64_t)a3, (uint64_t)v42, 256))
      {
        id v18 = v17;
LABEL_6:

        id v23 = v17;
        goto LABEL_7;
      }
      uint64_t v25 = [NSString stringWithUTF8String:v42];

      id v23 = v25;
      id v26 = v17;
      if (v23 == v26) {
        goto LABEL_6;
      }
      uint64_t v27 = v26;
      if ((v26 != 0) != (v23 == 0))
      {
        char v28 = [v23 isEqual:v26];

        if (v28)
        {
LABEL_7:
          uint64_t v24 = self->_ucat;
          if (v24->var0 <= 10)
          {
            if (v24->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v24, 0xAu)) {
                goto LABEL_24;
              }
              uint64_t v24 = self->_ucat;
            }
            LogPrintF((uint64_t)v24, (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]", 0xAu, (uint64_t)"Name unchanged: %@\n", v19, v20, v21, v22, (uint64_t)v16);
          }
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
      }
      [v16 setName:v23];
      int v33 = self->_ucat;
      if (v33->var0 <= 30)
      {
        if (v33->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v33, 0x1Eu)) {
            goto LABEL_21;
          }
          int v33 = self->_ucat;
        }
        LogPrintF((uint64_t)v33, (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]", 0x1Eu, (uint64_t)"Name changed: %@, %@ -> %@\n", v29, v30, v31, v32, (uint64_t)v16);
      }
LABEL_21:
      id v34 = _Block_copy(self->_deviceConnectedHandler);
      int v35 = v34;
      if (v34)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __45__CUBluetoothClient__btAccessoryNameChanged___block_invoke;
        v39[3] = &unk_1E55BF148;
        v41 = v34;
        id v40 = v16;
        [(CUBluetoothClient *)self _externalInvokeBlock:v39];
      }
      goto LABEL_24;
    }
    int v36 = v5;
    uint64_t v37 = self->_ucat;
    if (v37->var0 <= 60)
    {
      if (v37->var0 != -1)
      {
LABEL_29:
        LogPrintF((uint64_t)v37, (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]", 0x3Cu, (uint64_t)"### Name state changed: BTDeviceGetAddressString failed: %#m\n", v6, v7, v8, v9, (v36 + 310000));
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v37, 0x3Cu))
      {
        uint64_t v37 = self->_ucat;
        goto LABEL_29;
      }
    }
  }
}

uint64_t __45__CUBluetoothClient__btAccessoryNameChanged___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_btEnsureStopped
{
  if (!self->_invalidateCalled)
  {
    self->_uint64_t statusFlags = 0;
    uint64_t v7 = _Block_copy(self->_deviceDisconnectedHandler);
    btConnectedDevices = self->_btConnectedDevices;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __37__CUBluetoothClient__btEnsureStopped__block_invoke;
    v29[3] = &unk_1E55BDBC8;
    v29[4] = self;
    v29[5] = v7;
    [(NSMutableDictionary *)btConnectedDevices enumerateKeysAndObjectsUsingBlock:v29];
  }
  if (!self->_btAccessoryEventsRegistered) {
    goto LABEL_13;
  }
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTAccessoryManagerRemoveCallbacks\n", v2, v3, v4, v5, v28);
  }
LABEL_8:
  self->_btAccessoryEventsRegistered = 0;
  int v10 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTAccessoryManagerRemoveCallbacks[0])((uint64_t)self->_btAccessoryManager, (uint64_t)&self->_btAccessoryCallbacks);
  if (v10)
  {
    int v11 = v10;
    uint64_t v12 = self->_ucat;
    if (v12->var0 <= 60)
    {
      if (v12->var0 != -1)
      {
LABEL_11:
        LogPrintF((uint64_t)v12, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x3Cu, (uint64_t)"### BTAccessoryManagerRemoveCallbacks failed: %#m\n", v2, v3, v4, v5, (v11 + 310000));
        goto LABEL_13;
      }
      if (_LogCategory_Initialize((uint64_t)v12, 0x3Cu))
      {
        uint64_t v12 = self->_ucat;
        goto LABEL_11;
      }
    }
  }
LABEL_13:
  if (!self->_btLocalDeviceCallbacksRegistered) {
    goto LABEL_19;
  }
  uint64_t v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x1Eu)) {
        goto LABEL_18;
      }
      uint64_t v13 = self->_ucat;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTLocalDeviceRemoveCallbacks\n", v2, v3, v4, v5, v28);
  }
LABEL_18:
  ((void (*)(uint64_t, uint64_t))softLinkBTLocalDeviceRemoveCallbacks[0])((uint64_t)self->_btLocalDevice, (uint64_t)&self->_btLocalDeviceCallbacks);
  self->_btLocalDeviceCallbacksRegistered = 0;
LABEL_19:
  if (!self->_btPairingAgentStarted) {
    goto LABEL_25;
  }
  uint64_t v14 = self->_ucat;
  if (v14->var0 <= 30)
  {
    if (v14->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v14, 0x1Eu)) {
        goto LABEL_24;
      }
      uint64_t v14 = self->_ucat;
    }
    LogPrintF((uint64_t)v14, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTPairingAgentStop\n", v2, v3, v4, v5, v28);
  }
LABEL_24:
  ((void (*)(uint64_t))softLinkBTPairingAgentStop[0])((uint64_t)self->_btPairingAgent);
  self->_btPairingAgentStarted = 0;
LABEL_25:
  if (!self->_btPairingAgent) {
    goto LABEL_31;
  }
  uint64_t v15 = self->_ucat;
  if (v15->var0 <= 30)
  {
    if (v15->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v15, 0x1Eu)) {
        goto LABEL_30;
      }
      uint64_t v15 = self->_ucat;
    }
    LogPrintF((uint64_t)v15, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTPairingAgentDestroy\n", v2, v3, v4, v5, v28);
  }
LABEL_30:
  ((void (*)(uint64_t))softLinkBTPairingAgentDestroy[0])((uint64_t)&self->_btPairingAgent);
  self->_btPairingAgent = 0;
LABEL_31:
  if (!self->_btSessionAddedServiceCallback) {
    goto LABEL_39;
  }
  if (self->_btSession)
  {
    uint64_t v16 = self->_ucat;
    if (v16->var0 <= 30)
    {
      if (v16->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v16, 0x1Eu)) {
          goto LABEL_37;
        }
        uint64_t v16 = self->_ucat;
      }
      LogPrintF((uint64_t)v16, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTServiceRemoveCallbacks\n", v2, v3, v4, v5, v28);
    }
LABEL_37:
    ((void (*)(uint64_t, uint64_t))softLinkBTServiceRemoveCallbacks_2140[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler_2148);
  }
  self->_btSessionAddedServiceCallback = 0;
LABEL_39:
  if (!self->_btSession) {
    goto LABEL_45;
  }
  id v17 = self->_ucat;
  if (v17->var0 <= 30)
  {
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0x1Eu)) {
        goto LABEL_44;
      }
      id v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTSession detach\n", v2, v3, v4, v5, v28);
  }
LABEL_44:
  ((void (*)(uint64_t))softLinkBTSessionDetachWithQueue_2142[0])((uint64_t)&self->_btSession);
  self->_btSession = 0;
LABEL_45:
  self->_btSessionStarted = 0;
  btLocalDeviceAddr = self->_btLocalDeviceAddr;
  self->_btLocalDevice = 0;
  self->_btLocalDeviceAddr = 0;

  self->_btAccessoryManager = 0;
  if (!self->_btPeripheralManager) {
    goto LABEL_53;
  }
  id v23 = self->_ucat;
  if (v23->var0 <= 30)
  {
    if (v23->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v23, 0x1Eu)) {
        goto LABEL_50;
      }
      id v23 = self->_ucat;
    }
    LogPrintF((uint64_t)v23, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"CBPeripheralManager stop\n", v19, v20, v21, v22, v28);
  }
LABEL_50:
  btPeripheralManager = self->_btPeripheralManager;
  if (self->_bluetoothAddressChangedHandler)
  {
    [(CBPeripheralManager *)btPeripheralManager removeObserver:self forKeyPath:@"advertisingAddress" context:0];
    btPeripheralManager = self->_btPeripheralManager;
  }
  [(CBPeripheralManager *)btPeripheralManager setDelegate:0];
  uint64_t v25 = self->_btPeripheralManager;
  self->_btPeripheralManager = 0;

LABEL_53:
  btPairedDevices = self->_btPairedDevices;
  self->_btPairedDevices = 0;

  self->_btPairedDevicesInitialized = 0;
  uint64_t v27 = self->_btConnectedDevices;
  self->_btConnectedDevices = 0;
}

void __37__CUBluetoothClient__btEnsureStopped__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 setDisconnectReason:4294896145];
  uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 224);
  if (*v9 <= 30)
  {
    if (*v9 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v9, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]_block_invoke", 0x1Eu, (uint64_t)"Device disconnected: %@\n", v5, v6, v7, v8, (uint64_t)v4);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)v9, 0x1Eu))
    {
      uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 224);
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    int v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__CUBluetoothClient__btEnsureStopped__block_invoke_2;
    v12[3] = &unk_1E55BF148;
    uint64_t v14 = v10;
    id v13 = v4;
    [v11 _externalInvokeBlock:v12];
  }
}

uint64_t __37__CUBluetoothClient__btEnsureStopped__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_btEnsureStarted
{
  v81[1] = *MEMORY[0x1E4F143B8];
  if (!self->_btCentralManagerNeeded || self->_btCentralManager) {
    goto LABEL_11;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_7;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"CBCentralManager start\n", v2, v3, v4, v5, v71);
  }
LABEL_7:
  if ((self->_flags & 0x20) != 0)
  {
    uint64_t v12 = getCBCentralManagerOptionShowPowerAlertKey[0]();
    long long v80 = v12;
    v81[0] = MEMORY[0x1E4F1CC28];
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1];

    id v13 = objc_alloc((Class)getCBCentralManagerClass_2152[0]());
    uint64_t v14 = [(CUBluetoothClient *)self _internalDispatchQueue];
    uint64_t v15 = (CBCentralManager *)[v13 initWithDelegate:self queue:v14 options:v9];
    btCentralManager = self->_btCentralManager;
    self->_btCentralManager = v15;
  }
  else
  {
    id v8 = objc_alloc((Class)getCBCentralManagerClass_2152[0]());
    uint64_t v9 = [(CUBluetoothClient *)self _internalDispatchQueue];
    uint64_t v10 = (CBCentralManager *)[v8 initWithDelegate:self queue:v9];
    int v11 = self->_btCentralManager;
    self->_btCentralManager = v10;
  }
LABEL_11:
  if (!self->_btPeripheralManagerNeeded || self->_btPeripheralManager) {
    goto LABEL_22;
  }
  id v17 = self->_ucat;
  if (v17->var0 <= 30)
  {
    if (v17->var0 != -1)
    {
LABEL_15:
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"CBPeripheralManager start\n", v2, v3, v4, v5, v71);
      goto LABEL_17;
    }
    if (_LogCategory_Initialize((uint64_t)v17, 0x1Eu))
    {
      id v17 = self->_ucat;
      goto LABEL_15;
    }
  }
LABEL_17:
  if ((self->_flags & 0x20) != 0)
  {
    uint64_t v22 = getCBPeripheralManagerOptionShowPowerAlertKey[0]();
    long long v78 = v22;
    uint64_t v79 = MEMORY[0x1E4F1CC28];
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];

    id v23 = objc_alloc((Class)getCBPeripheralManagerClass_2154[0]());
    uint64_t v21 = [(CUBluetoothClient *)self _internalDispatchQueue];
    uint64_t v24 = (CBPeripheralManager *)[v23 initWithDelegate:self queue:v21 options:v19];
    btPeripheralManager = self->_btPeripheralManager;
    self->_btPeripheralManager = v24;
  }
  else
  {
    id v18 = objc_alloc((Class)getCBPeripheralManagerClass_2154[0]());
    uint64_t v19 = [(CUBluetoothClient *)self _internalDispatchQueue];
    uint64_t v20 = (CBPeripheralManager *)[v18 initWithDelegate:self queue:v19];
    uint64_t v21 = self->_btPeripheralManager;
    self->_btPeripheralManager = v20;
  }

  if (self->_bluetoothAddressChangedHandler)
  {
    [(CBPeripheralManager *)self->_btPeripheralManager addObserver:self forKeyPath:@"advertisingAddress" options:0 context:0];
    [(CUBluetoothClient *)self _handleBluetoothAddressChanged];
  }
LABEL_22:
  if (!self->_btSessionNeeded || self->_btSessionAttaching || self->_btSession) {
    goto LABEL_25;
  }
  uint64_t v28 = self->_ucat;
  if (v28->var0 <= 30)
  {
    if (v28->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v28, 0x1Eu)) {
        goto LABEL_77;
      }
      uint64_t v28 = self->_ucat;
    }
    LogPrintF((uint64_t)v28, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTSession attach\n", v2, v3, v4, v5, v71);
  }
LABEL_77:
  int v74 = _btSessionEventCallback_2179;
  int v49 = self;

  var4 = self->_ucat->var4;
  id v51 = [(CUBluetoothClient *)v49 _internalDispatchQueue];
  int v52 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue_2157[0])((uint64_t)var4, (uint64_t)&v74, (uint64_t)v49, v51);

  if (v52)
  {
    CFRelease(v49);
    uint64_t v53 = (v52 + 310000);
    unint64_t v54 = "BTSessionAttachWithQueue failed";
    goto LABEL_79;
  }
  self->_btSessionAttaching = 1;
  v49->_btSessionStarted = 1;
LABEL_25:
  btSession = self->_btSession;
  if (!btSession) {
    goto LABEL_39;
  }
  if (self->_btConnectionEventsNeeded && !self->_btSessionAddedServiceCallback)
  {
    uint64_t v27 = self->_ucat;
    if (v27->var0 > 30) {
      goto LABEL_35;
    }
    if (v27->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v27, 0x1Eu))
      {
LABEL_35:
        int v29 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTServiceAddCallbacks_2160[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler_2148, (uint64_t)self);
        if (!v29)
        {
          self->_btSessionAddedServiceCallback = 1;
          btSession = self->_btSession;
          if (!btSession) {
            goto LABEL_39;
          }
          goto LABEL_37;
        }
        int v69 = v29;
        uint64_t v70 = self->_ucat;
        if (v70->var0 <= 60)
        {
          if (v70->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v70, 0x3Cu)) {
              goto LABEL_93;
            }
            uint64_t v70 = self->_ucat;
          }
          LogPrintF((uint64_t)v70, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTSession add service callbacks failed: %#m\n", v2, v3, v4, v5, (v69 + 310000));
        }
LABEL_93:
        uint64_t v59 = 0;
        goto LABEL_94;
      }
      uint64_t v27 = self->_ucat;
    }
    LogPrintF((uint64_t)v27, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTServiceAddCallbacks\n", v2, v3, v4, v5, v71);
    goto LABEL_35;
  }
LABEL_37:
  if (!self->_btLocalDevice)
  {
    int Default = softLinkBTLocalDeviceGetDefault((uint64_t)btSession, (uint64_t)&self->_btLocalDevice);
    if (Default)
    {
      uint64_t v53 = (Default + 310000);
      unint64_t v54 = "BTLocalDeviceGetDefault failed";
      goto LABEL_79;
    }
  }
LABEL_39:
  if (self->_btLocalDeviceAddrNeeded)
  {
    btLocalDevice = self->_btLocalDevice;
    if (btLocalDevice)
    {
      if (!self->_btLocalDeviceAddr)
      {
        LOBYTE(v74) = 0;
        int v34 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetAddressString[0])((uint64_t)btLocalDevice, (uint64_t)&v74, 32);
        if (v34)
        {
          uint64_t v53 = (v34 + 310000);
          unint64_t v54 = "BTLocalDeviceGetAddressString failed";
          goto LABEL_79;
        }
        __int16 v73 = 0;
        int v72 = 0;
        int v35 = softLinkBTDeviceAddressFromString((uint64_t)&v74, (uint64_t)&v72);
        if (v35)
        {
          uint64_t v53 = (v35 + 310000);
          unint64_t v54 = "BTDeviceAddressFromString failed";
          goto LABEL_79;
        }
        int v36 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v72 length:6];
        btLocalDeviceAddr = self->_btLocalDeviceAddr;
        self->_btLocalDeviceAddr = v36;

        uint64_t v38 = self->_ucat;
        if (v38->var0 <= 30)
        {
          if (v38->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v38, 0x1Eu)) {
              goto LABEL_48;
            }
            uint64_t v38 = self->_ucat;
          }
          LogPrintF((uint64_t)v38, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"Bluetooth local address: %.6a\n", v2, v3, v4, v5, (uint64_t)&v72);
        }
      }
    }
  }
LABEL_48:
  if (!self->_btLocalDeviceCallbacksNeeded || self->_btLocalDeviceCallbacksRegistered || !self->_btLocalDevice) {
    goto LABEL_50;
  }
  id v40 = self->_ucat;
  if (v40->var0 <= 30)
  {
    if (v40->var0 != -1)
    {
LABEL_59:
      LogPrintF((uint64_t)v40, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTLocalDeviceAddCallbacks\n", v2, v3, v4, v5, v71);
      goto LABEL_71;
    }
    if (_LogCategory_Initialize((uint64_t)v40, 0x1Eu))
    {
      id v40 = self->_ucat;
      goto LABEL_59;
    }
  }
LABEL_71:
  self->_btLocalDeviceCallbacks.statusEvent = _btLocalDeviceStatusCallback;
  int v46 = softLinkBTLocalDeviceAddCallbacks((uint64_t)self->_btLocalDevice, (uint64_t)&self->_btLocalDeviceCallbacks, (uint64_t)self);
  if (v46)
  {
    int v47 = v46;
    uint64_t v48 = self->_ucat;
    if (v48->var0 <= 60)
    {
      if (v48->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v48, 0x3Cu)) {
          goto LABEL_50;
        }
        uint64_t v48 = self->_ucat;
      }
      LogPrintF((uint64_t)v48, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTLocalDeviceAddCallbacks failed: %#m\n", v2, v3, v4, v5, (v47 + 310000));
    }
  }
  else
  {
    self->_btLocalDeviceCallbacksRegistered = 1;
    [(CUBluetoothClient *)self _handlePairingStatusChanged];
  }
LABEL_50:
  if (!self->_btPairingAgentNeeded || self->_btPairingAgent || !self->_btSession)
  {
LABEL_63:
    if (!self->_btAccessoryEventsNeeded) {
      goto LABEL_89;
    }
    uint64_t v42 = self->_btSession;
    if (!v42) {
      goto LABEL_89;
    }
    if (self->_btAccessoryManager) {
      goto LABEL_88;
    }
    int v43 = softLinkBTAccessoryManagerGetDefault((uint64_t)v42, (uint64_t)&self->_btAccessoryManager);
    if (v43)
    {
      int v44 = v43;
      uint64_t v45 = self->_ucat;
      if (v45->var0 <= 60)
      {
        if (v45->var0 != -1)
        {
LABEL_69:
          LogPrintF((uint64_t)v45, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetDefault failed: %#m\n", v2, v3, v4, v5, (v44 + 310000));
          goto LABEL_87;
        }
        if (_LogCategory_Initialize((uint64_t)v45, 0x3Cu))
        {
          uint64_t v45 = self->_ucat;
          goto LABEL_69;
        }
      }
    }
LABEL_87:
    if (!self->_btAccessoryManager) {
      goto LABEL_89;
    }
LABEL_88:
    if (self->_btAccessoryEventsRegistered) {
      goto LABEL_89;
    }
    uint64_t v61 = self->_ucat;
    if (v61->var0 <= 30)
    {
      if (v61->var0 != -1)
      {
LABEL_100:
        LogPrintF((uint64_t)v61, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTAccessoryManagerAddCallbacks\n", v2, v3, v4, v5, v71);
        goto LABEL_102;
      }
      if (_LogCategory_Initialize((uint64_t)v61, 0x1Eu))
      {
        uint64_t v61 = self->_ucat;
        goto LABEL_100;
      }
    }
LABEL_102:
    self->_btAccessoryCallbacks.accessorySetupCommand = 0;
    self->_btAccessoryCallbacks.accessoryRelayMsgRecv = 0;
    self->_btAccessoryCallbacks.accessoryCommandStatus = 0;
    self->_btAccessoryCallbacks.accessoryEvent = _btAccessoryEventCallback;
    int v62 = softLinkBTAccessoryManagerAddCallbacks((uint64_t)self->_btAccessoryManager, (uint64_t)&self->_btAccessoryCallbacks, (uint64_t)self);
    if (v62)
    {
      int v67 = v62;
      uint64_t v68 = self->_ucat;
      if (v68->var0 > 60) {
        goto LABEL_89;
      }
      if (v68->var0 != -1) {
        goto LABEL_105;
      }
      if (_LogCategory_Initialize((uint64_t)v68, 0x3Cu))
      {
        uint64_t v68 = self->_ucat;
LABEL_105:
        LogPrintF((uint64_t)v68, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTAccessoryManagerAddCallbacks failed: %#m\n", v63, v64, v65, v66, (v67 + 310000));
      }
    }
    else
    {
      self->_btAccessoryEventsRegistered = 1;
    }
LABEL_89:
    if (self->_btConnectionEventsNeeded
      && !self->_btConnectionDevicesInitialized
      && self->_btLocalDevice
      && [(CBCentralManager *)self->_btCentralManager state] == 5)
    {
      [(CUBluetoothClient *)self _handleConnectedDevicesInit];
      self->_btConnectionDevicesInitialized = 1;
    }
    if (self->_btSession) {
      [(CUBluetoothClient *)self _processFindDeviceRequests];
    }
    goto LABEL_93;
  }
  uint64_t v39 = self->_ucat;
  if (v39->var0 > 30) {
    goto LABEL_61;
  }
  if (v39->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v39, 0x1Eu)) {
      goto LABEL_61;
    }
    uint64_t v39 = self->_ucat;
  }
  LogPrintF((uint64_t)v39, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTPairingAgent start\n", v2, v3, v4, v5, v71);
LABEL_61:
  uint64_t v77 = 0;
  long long v75 = 0u;
  long long v76 = 0u;
  int v74 = _btPairingAgentStatusCallback;
  int v41 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTPairingAgentCreate[0])((uint64_t)self->_btSession, (uint64_t)&v74, (uint64_t)self, (uint64_t)&self->_btPairingAgent);
  if (v41)
  {
    unint64_t v54 = "BTPairingAgentCreate failed";
  }
  else
  {
    int v41 = ((uint64_t (*)(uint64_t))softLinkBTPairingAgentStart[0])((uint64_t)self->_btPairingAgent);
    if (!v41) {
      goto LABEL_63;
    }
    unint64_t v54 = "BTPairingAgentStart failed";
  }
  uint64_t v53 = (v41 + 310000);
LABEL_79:
  uint64_t v59 = NSErrorWithOSStatusF(v53, (uint64_t)v54, v31, v32, v2, v3, v4, v5, v71);
  if (v59)
  {
    uint64_t v60 = self->_ucat;
    if (v60->var0 <= 60)
    {
      if (v60->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v60, 0x3Cu)) {
          goto LABEL_94;
        }
        uint64_t v60 = self->_ucat;
      }
      LogPrintF((uint64_t)v60, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTSession start failed: %{error}\n", v55, v56, v57, v58, (uint64_t)v59);
    }
  }
LABEL_94:
}

- (void)_setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6
{
  uint64_t v19 = (void (**)(id, void *))a6;
  uint64_t v16 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960561, (uint64_t)"Not supported on this platform", v7, v8, v9, v10, v11, v18);
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _setDeviceFlags:mask:deviceID:completion:]", 0x5Au, (uint64_t)"### setDeviceFlags failed: %{error}", v12, v13, v14, v15, (uint64_t)v16);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v19[2](v19, v16);
}

- (void)setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(CUBluetoothClient *)self _internalDispatchQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__CUBluetoothClient_setDeviceFlags_mask_deviceID_completion___block_invoke;
  v15[3] = &unk_1E55BE6D0;
  unsigned int v18 = a3;
  unsigned int v19 = a4;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

uint64_t __61__CUBluetoothClient_setDeviceFlags_mask_deviceID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDeviceFlags:*(unsigned int *)(a1 + 56) mask:*(unsigned int *)(a1 + 60) deviceID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_processFindDeviceRequests
{
  v69[2] = *MEMORY[0x1E4F143B8];
  while (1)
  {
    uint64_t v3 = [(NSMutableArray *)self->_findDeviceRequests firstObject];
    if (!v3) {
      break;
    }
    uint64_t v4 = (void *)v3;
    [(NSMutableArray *)self->_findDeviceRequests removeObjectAtIndex:0];
    if (self->_invalidateCalled)
    {
      uint64_t v5 = [v4 completion];
      NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", v6, v7, v8, v9, v10, v11, v59);
      uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0, v12);
      goto LABEL_16;
    }
    uint64_t v13 = [v4 address];
    int v66 = v13;
    __int16 v67 = WORD2(v13);
    uint64_t v21 = NSPrintF((uint64_t)"%.6a", v14, v15, v16, v17, v18, v19, v20, (uint64_t)&v66);
    uint64_t v22 = [(CBCentralManager *)self->_btCentralManager retrievePeripheralWithAddress:v21];
    if (v22)
    {
      uint64_t v12 = (void (**)(void, void, void))v22;
      uint64_t v5 = (void (**)(void, void, void))v21;
    }
    else
    {
      uint64_t v23 = [v4 address];
      int v64 = v23;
      __int16 v65 = WORD2(v23);
      NSPrintF((uint64_t)"Random %.6a", v24, v25, v26, v27, v28, v29, v30, (uint64_t)&v64);
      uint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

      uint64_t v31 = [(CBCentralManager *)self->_btCentralManager retrievePeripheralWithAddress:v5];
      if (!v31)
      {
        uint64_t v12 = [v4 completion];
        NSErrorWithOSStatusF(4294960569, (uint64_t)"Peripheral not found", v44, v45, v46, v47, v48, v49, v59);
        uint64_t v32 = (CUBluetoothDevice *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void, CUBluetoothDevice *))v12)[2](v12, 0, v32);
        goto LABEL_15;
      }
      uint64_t v12 = (void (**)(void, void, void))v31;
    }
    uint64_t v32 = objc_alloc_init(CUBluetoothDevice);
    int v33 = [v12 identifier];
    [(CUBluetoothDevice *)v32 setIdentifier:v33];
    v69[0] = 0;
    v69[1] = 0;
    [v33 getUUIDBytes:v69];
    uint64_t v63 = 0;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier_2110[0])((uint64_t)self->_btSession, (uint64_t)v69, (uint64_t)&v63))
    {
      id v40 = [v4 completion];
      uint64_t v41 = 4294960588;
      uint64_t v42 = "BTDevice not found";
    }
    else
    {
      v68[0] = 0;
      if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_2062[0])(v63, (uint64_t)v68, 32))
      {
        v50 = [NSString stringWithUTF8String:v68];
        [(CUBluetoothDevice *)v32 setAddressString:v50];

        unsigned __int16 v62 = 0;
        unsigned int v61 = 0;
        if (softLinkBTDeviceAddressFromString((uint64_t)v68, (uint64_t)&v61))
        {
          id v51 = [v4 completion];
          uint64_t v58 = NSErrorWithOSStatusF(4294960535, (uint64_t)"Get address failed", v52, v53, v54, v55, v56, v57, v59);
          ((void (**)(void, void, void *))v51)[2](v51, 0, v58);
        }
        else
        {
          unint64_t v60 = v60 & 0xFFFF000000000000 | v61 | ((unint64_t)v62 << 32);
          -[CUBluetoothDevice setAddress:](v32, "setAddress:");
          [(CUBluetoothClient *)self updateDevice:v32 btDevice:v63];
          id v51 = [v4 completion];
          ((void (**)(void, CUBluetoothDevice *, void))v51)[2](v51, v32, 0);
        }

        goto LABEL_14;
      }
      id v40 = [v4 completion];
      uint64_t v41 = 4294960535;
      uint64_t v42 = "Get address string failed";
    }
    int v43 = NSErrorWithOSStatusF(v41, (uint64_t)v42, v34, v35, v36, v37, v38, v39, v59);
    ((void (**)(void, void, void *))v40)[2](v40, 0, v43);

LABEL_14:
LABEL_15:

LABEL_16:
  }
}

- (void)_findDeviceByAddress:(id)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)a3.var0;
  id v6 = a4;
  uint64_t v10 = objc_alloc_init(CUBluetoothFindDeviceRequest);
  [(CUBluetoothFindDeviceRequest *)v10 setAddress:v4 & 0xFFFFFFFFFFFFLL];
  [(CUBluetoothFindDeviceRequest *)v10 setCompletion:v6];

  findDeviceRequests = self->_findDeviceRequests;
  if (!findDeviceRequests)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = self->_findDeviceRequests;
    self->_findDeviceRequests = v8;

    findDeviceRequests = self->_findDeviceRequests;
  }
  [(NSMutableArray *)findDeviceRequests addObject:v10];
  self->_btCentralManagerNeeded = 1;
  self->_btSessionNeeded = 1;
  [(CUBluetoothClient *)self _btEnsureStarted];
}

- (void)findDeviceByAddress:(id)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)a3.var0;
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CUBluetoothClient_findDeviceByAddress_completion___block_invoke;
  block[3] = &unk_1E55BDBA0;
  int v11 = v4;
  __int16 v12 = WORD2(v4);
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __52__CUBluetoothClient_findDeviceByAddress_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findDeviceByAddress:*(unsigned int *)(a1 + 48) | ((unint64_t)*(unsigned __int16 *)(a1 + 52) << 32) completion:*(void *)(a1 + 40)];
}

- (void)_invalidated
{
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x32u)) {
          goto LABEL_7;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v2, v3, v4, v5, v22);
    }
  }
LABEL_7:
  if (self->_btPeripheralManager || self->_btPairingAgent || self->_btSession) {
    return;
  }
  id bluetoothAddressChangedHandler = self->_bluetoothAddressChangedHandler;
  self->_id bluetoothAddressChangedHandler = 0;

  id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_id bluetoothStateChangedHandler = 0;

  id deviceConnectedHandler = self->_deviceConnectedHandler;
  self->_id deviceConnectedHandler = 0;

  id deviceDisconnectedHandler = self->_deviceDisconnectedHandler;
  self->_id deviceDisconnectedHandler = 0;

  id deviceEventHandler = self->_deviceEventHandler;
  self->_id deviceEventHandler = 0;

  id devicePairedHandler = self->_devicePairedHandler;
  self->_id devicePairedHandler = 0;

  id deviceUnpairedHandler = self->_deviceUnpairedHandler;
  self->_id deviceUnpairedHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  uint64_t v23 = _Block_copy(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  if (v23) {
    [(CUBluetoothClient *)self _externalInvokeBlock:v23];
  }
  self->_invalidateDone = 1;
  uint64_t v21 = (uint64_t)self->_ucat;
  if (*(int *)v21 > 10) {
    goto LABEL_17;
  }
  if (*(_DWORD *)v21 == -1)
  {
    uint64_t v21 = _LogCategory_Initialize(v21, 0xAu);
    if (!v21) {
      goto LABEL_17;
    }
    uint64_t v21 = (uint64_t)self->_ucat;
  }
  uint64_t v21 = LogPrintF(v21, (uint64_t)"-[CUBluetoothClient _invalidated]", 0xAu, (uint64_t)"Invalidated\n", v17, v18, v19, v20, v22);
LABEL_17:
  MEMORY[0x1F4181820](v21);
}

- (void)invalidate
{
  uint64_t v3 = [(CUBluetoothClient *)self _internalDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CUBluetoothClient_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__CUBluetoothClient_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 216)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 216) = 1;
  id v10 = *(void **)(result + 32);
  int v11 = (int *)v10[28];
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      id v10 = *(void **)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      int v11 = (int *)v10[28];
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUBluetoothClient invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v14);
    id v10 = *(void **)(v9 + 32);
  }
LABEL_6:
  [v10 _processFindDeviceRequests];
  [*(id *)(v9 + 32) _btEnsureStopped];
  uint64_t v13 = *(void **)(v9 + 32);
  return [v13 _invalidated];
}

- (id)_internalDispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_externalInvokeBlock:(id)a3
{
  block = (void (**)(void))a3;
  uint64_t v4 = [(CUBluetoothClient *)self _internalDispatchQueue];
  dispatchQueue = self->_dispatchQueue;

  if (v4 == dispatchQueue) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)self->_dispatchQueue, block);
  }
}

- (void)activate
{
  uint64_t v3 = [(CUBluetoothClient *)self _internalDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CUBluetoothClient_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __29__CUBluetoothClient_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(int **)(v9 + 224);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUBluetoothClient activate]_block_invoke", 0x1Eu, (uint64_t)"Activate: %#{flags}, RS %#{flags}\n", a5, a6, a7, a8, *(unsigned int *)(v9 + 236));
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize(*(void *)(v9 + 224), 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      id v10 = *(int **)(v9 + 224);
      goto LABEL_3;
    }
  }
LABEL_5:
  if (*(void *)(v9 + 264))
  {
    *(unsigned char *)(v9 + 40) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
  }
  if (*(void *)(v9 + 272))
  {
    *(unsigned char *)(v9 + 24) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
  }
  int v12 = *(_DWORD *)(v9 + 236);
  if ((v12 & 0x18) != 0 || *(void *)(v9 + 280) || *(void *)(v9 + 288))
  {
    *(unsigned char *)(v9 + 24) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 160) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 106) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
  }
  if (*(void *)(v9 + 304) || *(void *)(v9 + 312))
  {
    *(unsigned char *)(v9 + 160) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 106) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
  }
  int v13 = *(_DWORD *)(v9 + 236);
  if ((v13 & 2) != 0)
  {
    *(unsigned char *)(v9 + 24) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 106) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = *(_DWORD *)(v9 + 236);
    if ((v13 & 4) == 0)
    {
LABEL_18:
      if ((v13 & 0x40) == 0) {
        goto LABEL_19;
      }
      goto LABEL_26;
    }
  }
  else if ((v13 & 4) == 0)
  {
    goto LABEL_18;
  }
  *(unsigned char *)(v9 + 24) = 1;
  uint64_t v9 = *(void *)(a1 + 32);
  if ((*(_DWORD *)(v9 + 236) & 0x40) == 0)
  {
LABEL_19:
    if ((v12 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_26:
  *(unsigned char *)(v9 + 80) = 1;
  uint64_t v9 = *(void *)(a1 + 32);
  if ((v12 & 8) != 0)
  {
LABEL_20:
    *(unsigned char *)(v9 + 80) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
  }
LABEL_21:
  return [(id)v9 _btEnsureStarted];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CBA68;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v14 = 0;
  uint64_t bluetoothState = self->_bluetoothState;
  if (bluetoothState > 0xA) {
    id v5 = "?";
  }
  else {
    id v5 = off_1E55BDD88[bluetoothState];
  }
  [(NSMutableDictionary *)self->_btConnectedDevices count];
  [(NSMutableDictionary *)self->_btPairedDevices count];
  NSAppendPrintF(&v14, (uint64_t)"CUBluetoothClient: BT %s, Connected %d, FL %#{flags}, Paired %d, SF %#{flags}", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  uint64_t v12 = v14;
  return v12;
}

- (NSString)description
{
  return (NSString *)[(CUBluetoothClient *)self descriptionWithLevel:50];
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
  v4.super_class = (Class)CUBluetoothClient;
  [(CUBluetoothClient *)&v4 dealloc];
}

- (CUBluetoothClient)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUBluetoothClient;
  uint64_t v2 = [(CUBluetoothClient *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBluetoothClient;
  }
  return v2;
}

@end