@interface CBDiscovery
+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 endpoint:(id)a4 error:(id *)a5;
+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 error:(id *)a4;
- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesInternalPtr;
- (BOOL)bleSensorEnableRssiIncreaseScan;
- (BOOL)denyLowPowerModeScans;
- (BOOL)denyScreenLockedScans;
- (BOOL)disabledActive;
- (BOOL)disabledPending;
- (BOOL)discoveryTypesContainTypes:(id *)a3;
- (BOOL)keepAlive;
- (BOOL)needsAdvertisingAddress;
- (BOOL)needsBLEScan;
- (BOOL)needsIdentify;
- (BOOL)updateWithCBDiscovery:(id)a3;
- (CBDevice)remoteDevice;
- (CBDiscovery)init;
- (CBDiscovery)initWithXPCObject:(id)a3 error:(id *)a4;
- (CBSpatialInteractionFilter)spatialInteractionfilter;
- (NSArray)deviceFilter;
- (NSArray)discoveredDevices;
- (NSArray)oobKeys;
- (NSArray)serviceUUIDs;
- (NSArray)typeToRssiThresholds;
- (NSArray)useCaseClientIDs;
- (NSString)appID;
- (NSString)label;
- (NSString)mockID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)testListenerEndpoint;
- (OS_xpc_object)xpcSubscriberRepresentation;
- (char)bleRSSIThresholdHint;
- (char)bleSensorRssiIncreaseScanThreshold;
- (id)_ensureXPCStarted;
- (id)bluetoothStateChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)devicesBufferedHandler;
- (id)errorHandler;
- (id)finishHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)systemOverrideHandler;
- (int)bleScanRate;
- (int)bleScanRateOverride;
- (int)bleScanRateScreenOff;
- (int64_t)bluetoothState;
- (unint64_t)changeFlags;
- (unint64_t)discoveryFlags;
- (unint64_t)extraDiscoveryFlags;
- (unint64_t)updateWithXPCSubscriberInfo:(id)a3;
- (unsigned)bleRSSIThresholdOrder;
- (unsigned)bleSensorIncreaseScanRate;
- (unsigned)bleSensorIncreaseScanTimeout;
- (unsigned)bleSensorTimeoutBetweenIncreaseScan;
- (unsigned)clientID;
- (unsigned)deviceSetupState;
- (unsigned)internalFlags;
- (unsigned)memoryPressureFlags;
- (unsigned)systemOverrideFlags;
- (unsigned)useCase;
- (void)_activate;
- (void)_activateDirectStart;
- (void)_activateXPCCompleted:(id)a3;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_xpcReceivedDeviceFound:(id)a3;
- (void)_xpcReceivedDeviceLost:(id)a3;
- (void)_xpcReceivedDevicesBuffered:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)_xpcReceivedPowerStateChanged:(id)a3;
- (void)_xpcReceivedSystemOverrideChanged:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addDiscoveryType:(int)a3;
- (void)clearDuplicateFilterCache;
- (void)dealloc;
- (void)encodeWithXPCObject:(id)a3;
- (void)finish;
- (void)invalidate;
- (void)removeAllDiscoveryTypes;
- (void)removeDiscoveryType:(int)a3;
- (void)reportMockDeviceFound:(id)a3;
- (void)reportMockDeviceLost:(id)a3;
- (void)setAppID:(id)a3;
- (void)setBleRSSIThresholdHint:(char)a3;
- (void)setBleRSSIThresholdOrder:(unsigned __int8)a3;
- (void)setBleScanRate:(int)a3;
- (void)setBleScanRateOverride:(int)a3;
- (void)setBleScanRateScreenOff:(int)a3;
- (void)setBleSensorEnableRssiIncreaseScan:(BOOL)a3;
- (void)setBleSensorIncreaseScanRate:(unsigned int)a3;
- (void)setBleSensorIncreaseScanTimeout:(unsigned int)a3;
- (void)setBleSensorRssiIncreaseScanThreshold:(char)a3;
- (void)setBleSensorTimeoutBetweenIncreaseScan:(unsigned int)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setChangeFlags:(unint64_t)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDenyLowPowerModeScans:(BOOL)a3;
- (void)setDenyScreenLockedScans:(BOOL)a3;
- (void)setDeviceFilter:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDeviceSetupState:(unsigned __int8)a3;
- (void)setDevicesBufferedHandler:(id)a3;
- (void)setDisabledActive:(BOOL)a3;
- (void)setDisabledPending:(BOOL)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setExtraDiscoveryFlags:(unint64_t)a3;
- (void)setFinishHandler:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setKeepAlive:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMemoryPressureFlags:(unsigned int)a3;
- (void)setMockID:(id)a3;
- (void)setOobKeys:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setServiceUUIDs:(id)a3;
- (void)setSpatialInteractionFilter:(id)a3;
- (void)setSpatialInteractionfilter:(id)a3;
- (void)setSystemOverrideFlags:(unsigned int)a3;
- (void)setSystemOverrideHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)setTypeToRssiThresholds:(id)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)setUseCaseClientIDs:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation CBDiscovery

- (BOOL)disabledActive
{
  return self->_disabledActive;
}

- (unint64_t)extraDiscoveryFlags
{
  return self->_extraDiscoveryFlags;
}

- (BOOL)disabledPending
{
  return self->_disabledPending;
}

- (BOOL)discoveryTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, a3);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (int)bleScanRateOverride
{
  return self->_bleScanRateOverride;
}

- (int)bleScanRate
{
  return self->_bleScanRate;
}

- (void)setDisabledPending:(BOOL)a3
{
  self->_disabledPending = a3;
}

- (NSString)appID
{
  return self->_appID;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesInternalPtr
{
  return ($F9CA75CC5B4E604BACB273E5A2091FCB *)&self->_discoveryTypesInternal;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (NSArray)typeToRssiThresholds
{
  return self->_typeToRssiThresholds;
}

- (NSArray)oobKeys
{
  return self->_oobKeys;
}

void *__32__CBDiscovery__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[7] == *(void *)(a1 + 40)) {
    return (void *)[result xpcReceivedMessage:a2];
  }
  return result;
}

- (void)setExtraDiscoveryFlags:(unint64_t)a3
{
  self->_extraDiscoveryFlags = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (unsigned)deviceSetupState
{
  return self->_deviceSetupState;
}

- (BOOL)denyScreenLockedScans
{
  return self->_denyScreenLockedScans;
}

- (BOOL)denyLowPowerModeScans
{
  return self->_denyLowPowerModeScans;
}

- (char)bleRSSIThresholdHint
{
  return self->_bleRSSIThresholdHint;
}

- (void)_xpcReceivedDeviceLost:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    id v15 = 0;
    v5 = [[CBDevice alloc] initWithXPCObject:v4 error:&v15];
    id v6 = v15;
    if (v5)
    {
      v7 = [(CBDevice *)v5 identifier];
      if (v7)
      {
        v8 = self;
        objc_sync_enter(v8);
        [(NSMutableDictionary *)v8->_deviceMap setObject:0 forKeyedSubscript:v7];
        objc_sync_exit(v8);

        int var0 = v8->_ucat->var0;
        if (var0 <= 15 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        uint64_t v10 = MEMORY[0x1AD111AA0](v8->_deviceLostHandler);
        v11 = (void *)v10;
        if (v10) {
          (*(void (**)(uint64_t, CBDevice *))(v10 + 16))(v10, v5);
        }

        goto LABEL_11;
      }
      int v14 = self->_ucat->var0;
      if (v14 > 90 || v14 == -1 && !_LogCategory_Initialize())
      {
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      int v13 = self->_ucat->var0;
      if (v13 > 90 || v13 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_12;
      }
      v7 = CUPrintNSError();
    }
    LogPrintF_safe();
    goto LABEL_11;
  }
  int v12 = self->_ucat->var0;
  if (v12 <= 90 && (v12 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_13:
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
    [(CBDiscovery *)self _xpcReceivedMessage:v25];
    goto LABEL_26;
  }
  if (v25 == (id)MEMORY[0x1E4F14520])
  {
    [(CBDiscovery *)self _interrupted];
    goto LABEL_26;
  }
  if (v25 != (id)MEMORY[0x1E4F14528])
  {
    v7 = CUXPCDecodeNSErrorIfNeeded();
    int v14 = v7;
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
        v20 = (void *)v19;
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
  [(CBDiscovery *)v21 _invalidated];
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
  v5 = string;
  if (!strcmp(string, "DvFo"))
  {
    [(CBDiscovery *)self _xpcReceivedDeviceFound:v9];
    uint64_t v8 = v9;
  }
  else if (!strcmp(v5, "DvLo"))
  {
    [(CBDiscovery *)self _xpcReceivedDeviceLost:v9];
    uint64_t v8 = v9;
  }
  else if (!strcmp(v5, "DsBf"))
  {
    [(CBDiscovery *)self _xpcReceivedDevicesBuffered:v9];
    uint64_t v8 = v9;
  }
  else if (!strcmp(v5, "PwrC"))
  {
    [(CBDiscovery *)self _xpcReceivedPowerStateChanged:v9];
    uint64_t v8 = v9;
  }
  else
  {
    if (strcmp(v5, "SyOC"))
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
    [(CBDiscovery *)self _xpcReceivedSystemOverrideChanged:v9];
    uint64_t v8 = v9;
  }
LABEL_15:
}

- (void)_xpcReceivedDeviceFound:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    id v18 = 0;
    v5 = [[CBDevice alloc] initWithXPCObject:v4 error:&v18];
    id v6 = v18;
    if (v5)
    {
      v7 = [(CBDevice *)v5 identifier];
      if (v7)
      {
        uint64_t v8 = self;
        objc_sync_enter(v8);
        deviceMap = v8->_deviceMap;
        if (!deviceMap)
        {
          uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v11 = v8->_deviceMap;
          v8->_deviceMap = v10;

          deviceMap = v8->_deviceMap;
        }
        [(NSMutableDictionary *)deviceMap setObject:v5 forKeyedSubscript:v7];
        objc_sync_exit(v8);

        int var0 = v8->_ucat->var0;
        if (var0 <= 15 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        uint64_t v13 = MEMORY[0x1AD111AA0](v8->_deviceFoundHandler);
        int v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t, CBDevice *))(v13 + 16))(v13, v5);
        }

        goto LABEL_13;
      }
      int v17 = self->_ucat->var0;
      if (v17 > 90 || v17 == -1 && !_LogCategory_Initialize())
      {
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      int v16 = self->_ucat->var0;
      if (v16 > 90 || v16 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_14;
      }
      v7 = CUPrintNSError();
    }
    LogPrintF_safe();
    goto LABEL_13;
  }
  int v15 = self->_ucat->var0;
  if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_15:
}

+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 error:(id *)a4
{
  return (id)[a1 devicesWithDiscoveryFlags:a3 endpoint:0 error:a4];
}

- (BOOL)needsIdentify
{
  if ((self->_discoveryFlags & 0x2000201400020108) != 0) {
    return 1;
  }
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  id v4 = CBDiscoveryTypesNeedsIdentify();

  return CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v4);
}

- (id)description
{
  return [(CBDiscovery *)self descriptionWithLevel:50];
}

- (int)bleScanRateScreenOff
{
  return self->_bleScanRateScreenOff;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (BOOL)needsAdvertisingAddress
{
  if ((self->_discoveryFlags & 0x2000000400020108) != 0) {
    return 1;
  }
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  id v4 = CBDiscoveryTypesNeedsAdvertisingAddress();

  return CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v4);
}

- (BOOL)needsBLEScan
{
  if ((self->_discoveryFlags & 0x7CFAA6C5B14FFFFFLL) != 0) {
    return 1;
  }
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  v5 = CBDiscoveryTypesBLEScan();
  if (CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v5)) {
    return 1;
  }
  serviceUUIDs = self->_serviceUUIDs;
  return serviceUUIDs && [(NSArray *)serviceUUIDs count];
}

- (id)descriptionWithLevel:(int)a3
{
  v40[2] = 0;
  NSAppendPrintF_safe();
  id v4 = 0;
  if (self->_discoveryFlags)
  {
    v40[1] = v4;
    v33 = CUPrintFlags64();
    NSAppendPrintF_safe();
    id v5 = v4;

    id v4 = v5;
  }
  v40[0] = v4;
  CBDiscoveryTypesAppendString((uint64_t)v40, (uint64_t)", DsTy", (uint64_t)&self->_discoveryTypesInternal);
  id v6 = v40[0];

  if (self->_bleScanRate)
  {
    NSAppendPrintF_safe();
    id v7 = v6;

    id v6 = v7;
  }
  if (self->_bleScanRateScreenOff)
  {
    NSAppendPrintF_safe();
    id v8 = v6;

    id v6 = v8;
  }
  if (self->_bleScanRateOverride)
  {
    NSAppendPrintF_safe();
    id v9 = v6;

    id v6 = v9;
  }
  if (self->_bleRSSIThresholdHint)
  {
    NSAppendPrintF_safe();
    id v10 = v6;

    id v6 = v10;
  }
  if (self->_bleRSSIThresholdOrder)
  {
    NSAppendPrintF_safe();
    id v11 = v6;

    id v6 = v11;
  }
  deviceFilter = self->_deviceFilter;
  if (deviceFilter)
  {
    uint64_t v13 = deviceFilter;
    v34 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v14 = v6;

    id v6 = v14;
  }
  if (self->_deviceSetupState)
  {
    NSAppendPrintF_safe();
    id v15 = v6;

    id v6 = v15;
  }
  oobKeys = self->_oobKeys;
  if (oobKeys)
  {
    int v17 = oobKeys;
    v35 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v18 = v6;

    id v6 = v18;
  }
  serviceUUIDs = self->_serviceUUIDs;
  if (serviceUUIDs)
  {
    v20 = serviceUUIDs;
    v36 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v21 = v6;

    id v6 = v21;
  }
  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
  {
    v37 = remoteDevice;
    NSAppendPrintF_safe();
    id v23 = v6;

    id v6 = v23;
  }
  unsigned int useCase = self->_useCase;
  if (useCase)
  {
    CBUseCaseToString_0(useCase);
    NSAppendPrintF_safe();
    id v25 = v6;

    id v6 = v25;
  }
  useCaseClientIDs = self->_useCaseClientIDs;
  if (useCaseClientIDs)
  {
    v27 = useCaseClientIDs;
    v38 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v28 = v6;

    id v6 = v28;
  }
  typeToRssiThresholds = self->_typeToRssiThresholds;
  if (typeToRssiThresholds)
  {
    v30 = typeToRssiThresholds;
    v39 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v31 = v6;

    id v6 = v31;
  }

  return v6;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

uint64_t __38__CBDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)setSystemOverrideHandler:(id)a3
{
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)setDevicesBufferedHandler:(id)a3
{
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (void)setAppID:(id)a3
{
}

- (NSArray)deviceFilter
{
  return self->_deviceFilter;
}

uint64_t __33__CBDiscovery__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)setDispatchQueue:(id)a3
{
}

+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 endpoint:(id)a4 error:(id *)a5
{
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "mTyp", "DsGD");
  xpc_dictionary_set_uint64(v8, "dsFl", a3);
  id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v10 = dispatch_queue_create("CBDiscovery-GetDevices", v9);

  id v11 = (_xpc_endpoint_s *)v7;
  uint64_t v12 = v11;
  if (v11)
  {
    mach_service = xpc_connection_create_from_endpoint(v11);
    xpc_connection_set_target_queue(mach_service, v10);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v10, 0);
  }
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_5);
  xpc_connection_activate(mach_service);
  xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(mach_service, v8);
  xpc_connection_cancel(mach_service);
  if (v14)
  {
    id v21 = CUXPCDecodeNSErrorIfNeeded();
    v22 = v21;
    if (v21)
    {
      id v31 = 0;
      if (a5) {
        *a5 = v21;
      }
    }
    else
    {
      v29 = xpc_dictionary_get_array(v14, "devA");
      if (v29)
      {
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__4;
        v44 = __Block_byref_object_dispose__4;
        id v45 = 0;
        id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x3032000000;
        v37 = __Block_byref_object_copy__4;
        v38 = __Block_byref_object_dispose__4;
        id v39 = 0;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = (uint64_t)__56__CBDiscovery_devicesWithDiscoveryFlags_endpoint_error___block_invoke_2;
        v33[3] = (uint64_t)&unk_1E5E33EF0;
        v33[4] = (uint64_t)&v34;
        v33[5] = (uint64_t)&v40;
        xpc_array_apply(v29, v33);
        v30 = (void *)v35[5];
        if (v30)
        {
          id v31 = 0;
          if (a5) {
            *a5 = v30;
          }
        }
        else
        {
          id v31 = (id)v41[5];
        }
        _Block_object_dispose(&v34, 8);

        _Block_object_dispose(&v40, 8);
      }
      else if (a5)
      {
        CBErrorF(-6700, (uint64_t)"No devices", v23, v24, v25, v26, v27, v28, v33[0]);
        id v31 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v31 = 0;
      }
    }
  }
  else if (a5)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v15, v16, v17, v18, v19, v20, v33[0]);
    id v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (void)_activate
{
  id v21 = self->_mockID;
  if (v21)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    CBMockAddOrUpdateDiscovery(v21, self);
    uint64_t v12 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v12) {
      v12[2](v12, 0);
    }
LABEL_30:

    goto LABEL_31;
  }
  if (self->_bluetoothStateChangedHandler) {
    self->_internalFlags |= 1u;
  }
  if (self->_testListenerEndpoint) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = gCBDaemonServer == 0;
  }
  BOOL v11 = !v10;
  self->_direct = v11;
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Activate after invalidate", v3, v4, v5, v6, v7, v8, v19);
    uint64_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    int v13 = self->_ucat->var0;
    if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v20 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v15 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id v16 = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v15)
    {
      v15[2](v15, v12);
    }
    else
    {
      uint64_t v17 = MEMORY[0x1AD111AA0](self->_errorHandler);
      uint64_t v18 = (void *)v17;
      if (v17) {
        (*(void (**)(uint64_t, void))(v17 + 16))(v17, v12);
      }
    }
    goto LABEL_30;
  }
  if (v11) {
    [(CBDiscovery *)self _activateDirectStart];
  }
  else {
    [(CBDiscovery *)self _activateXPCStart:0];
  }
LABEL_31:
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
  [(CBDiscovery *)self encodeWithXPCObject:v5];
  xpc_dictionary_set_string(v5, "mTyp", "DscA");
  uint64_t v6 = [(CBDiscovery *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __33__CBDiscovery__activateXPCStart___block_invoke;
  handler[3] = &unk_1E5E31608;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = v4;
  if (self->_bleRSSIThresholdOrder) {
    xpc_dictionary_set_uint64(v4, "blRO", self->_bleRSSIThresholdOrder);
  }
  if (self->_bleRSSIThresholdHint) {
    xpc_dictionary_set_int64(xdict, "blRT", self->_bleRSSIThresholdHint);
  }
  int64_t bleScanRate = self->_bleScanRate;
  if (bleScanRate) {
    xpc_dictionary_set_int64(xdict, "blSR", bleScanRate);
  }
  int64_t bleScanRateScreenOff = self->_bleScanRateScreenOff;
  if (bleScanRateScreenOff) {
    xpc_dictionary_set_int64(xdict, "blSO", bleScanRateScreenOff);
  }
  uint64_t clientID = self->_clientID;
  if (clientID) {
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  }
  CUXPCEncodeNSArrayOfNSString();
  uint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags) {
    xpc_dictionary_set_uint64(xdict, "dsFl", discoveryFlags);
  }
  if (*(_DWORD *)self->_discoveryTypesInternal.bitArray | self->_discoveryTypesInternal.bitArray[4]) {
    size_t v9 = 5;
  }
  else {
    size_t v9 = 1;
  }
  xpc_dictionary_set_data(xdict, "dsTy", &self->_discoveryTypesInternal, v9);
  uint64_t internalFlags = self->_internalFlags;
  if (internalFlags) {
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  }
  CUXPCEncodeNSArrayOfObjects();
  CUXPCEncodeNSArrayOfObjects();
  CUXPCEncodeObject();
  uint64_t useCase = self->_useCase;
  if (useCase) {
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  }
  CUXPCEncodeNSArrayOfNSString();
  if (self->_bleSensorRssiIncreaseScanThreshold) {
    xpc_dictionary_set_int64(xdict, "bsIT", self->_bleSensorRssiIncreaseScanThreshold);
  }
  if (self->_bleSensorEnableRssiIncreaseScan) {
    xpc_dictionary_set_BOOL(xdict, "bsEI", 1);
  }
  uint64_t bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
  if (bleSensorIncreaseScanRate) {
    xpc_dictionary_set_uint64(xdict, "bsIS", bleSensorIncreaseScanRate);
  }
  uint64_t bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
  if (bleSensorIncreaseScanTimeout) {
    xpc_dictionary_set_uint64(xdict, "bsTO", bleSensorIncreaseScanTimeout);
  }
  uint64_t bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
  if (bleSensorTimeoutBetweenIncreaseScan) {
    xpc_dictionary_set_uint64(xdict, "bsBT", bleSensorTimeoutBetweenIncreaseScan);
  }
  CUXPCEncodeObject();
  CUXPCEncodeNSArrayOfObjects();
}

- (id)_ensureXPCStarted
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_xpcCnx;
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
    v8[2] = __32__CBDiscovery__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E5E31630;
    v8[4] = v2;
    uint64_t v3 = mach_service;
    size_t v9 = v3;
    xpc_connection_set_event_handler(v3, v8);
    xpc_connection_activate(v3);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setUseCase:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__CBDiscovery_setUseCase___block_invoke;
  v3[3] = &unk_1E5E31568;
  unsigned int v4 = a3;
  v3[4] = self;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v3];
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__CBDiscovery_setDiscoveryFlags___block_invoke;
  v3[3] = &unk_1E5E31590;
  v3[4] = self;
  void v3[5] = a3;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v3];
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  unsigned int v4 = (uint64_t (**)(void))a3;
  xpc_object_t v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__CBDiscovery__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E5E31248;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

BOOL __33__CBDiscovery_setDiscoveryFlags___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 240);
  if (v1 != v3) {
    *(void *)(v2 + 240) = v1;
  }
  return v1 != v3;
}

BOOL __26__CBDiscovery_setUseCase___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 80);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 80) = v1;
  }
  return v1 != v3;
}

- (CBDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)CBDiscovery;
  uint64_t v2 = [(CBDiscovery *)&v5 init];
  if (v2)
  {
    v2->_uint64_t clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBDiscovery;
    int v3 = v2;
  }

  return v2;
}

- (CBDiscovery)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v13 = [(CBDiscovery *)self init];
  if (!v13)
  {
    if (!a4) {
      goto LABEL_76;
    }
    uint64_t v34 = "CBDiscovery init failed";
LABEL_75:
    CBErrorF(-6756, (uint64_t)v34, v7, v8, v9, v10, v11, v12, v35);
    v32 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_70;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (!a4) {
      goto LABEL_76;
    }
    uint64_t v34 = "XPC non-dict";
    goto LABEL_75;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v13->_bleRSSIThresholdOrder = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_76;
  }
  int v15 = CUXPCDecodeSInt64RangedEx();
  if (v15 == 6)
  {
    v13->_bleRSSIThresholdHint = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_76;
  }
  int v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v13->_int64_t bleScanRate = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_76;
  }
  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v13->_int64_t bleScanRateScreenOff = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_76;
  }
  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v13->_uint64_t clientID = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_76;
  }
  if (!CUXPCDecodeNSArrayOfNSString()) {
    goto LABEL_76;
  }
  int v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v13->_uint64_t discoveryFlags = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_76;
  }
  if (!CBXPCDecodeDiscoveryTypes(v6, "dsTy", &v13->_discoveryTypesInternal)) {
    goto LABEL_76;
  }
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_uint64_t internalFlags = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_76;
  }
  objc_opt_class();
  p_oobKeys = (id *)&v13->_oobKeys;
  if (!CUXPCDecodeNSArrayOfClass()) {
    goto LABEL_76;
  }
  if (*p_oobKeys)
  {
    if ([*p_oobKeys count])
    {
      if (!v13->_discoveryFlags)
      {
        int var0 = v13->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
      }
    }
  }
  objc_opt_class();
  p_serviceUUIDs = (id *)&v13->_serviceUUIDs;
  if (!CUXPCDecodeNSArrayOfClass()) {
    goto LABEL_76;
  }
  if (*p_serviceUUIDs)
  {
    if ([*p_serviceUUIDs count])
    {
      if (!v13->_discoveryFlags)
      {
        int v24 = v13->_ucat->var0;
        if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
      }
    }
  }
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_76;
  }
  int v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 == 6)
  {
    v13->_uint64_t useCase = 0;
  }
  else if (v25 == 5)
  {
    goto LABEL_76;
  }
  if (!CUXPCDecodeNSArrayOfNSString()) {
    goto LABEL_76;
  }
  int v26 = CUXPCDecodeSInt64RangedEx();
  if (v26 == 6)
  {
    v13->_bleSensorRssiIncreaseScanThreshold = 0;
  }
  else if (v26 == 5)
  {
    goto LABEL_76;
  }
  if (!CUXPCDecodeBool()) {
    goto LABEL_76;
  }
  v13->_bleSensorEnableRssiIncreaseScan = 1;
  int v27 = CUXPCDecodeUInt64RangedEx();
  if (v27 == 6)
  {
    v13->_uint64_t bleSensorIncreaseScanRate = 0;
  }
  else if (v27 == 5)
  {
    goto LABEL_76;
  }
  int v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v13->_uint64_t bleSensorIncreaseScanTimeout = 0;
  }
  else if (v28 == 5)
  {
    goto LABEL_76;
  }
  int v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 != 6)
  {
    if (v29 != 5) {
      goto LABEL_60;
    }
LABEL_76:
    v32 = 0;
    goto LABEL_70;
  }
  v13->_uint64_t bleSensorTimeoutBetweenIncreaseScan = 0;
LABEL_60:
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_76;
  }
  objc_opt_class();
  p_typeToRssiThresholds = (id *)&v13->_typeToRssiThresholds;
  if (!CUXPCDecodeNSArrayOfClass()) {
    goto LABEL_76;
  }
  if (*p_typeToRssiThresholds)
  {
    if ([*p_typeToRssiThresholds count])
    {
      if (((char)v13->_discoveryTypesInternal.bitArray[3] & 0x80000000) == 0)
      {
        int v31 = v13->_ucat->var0;
        if (v31 <= 60 && (v31 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
      }
    }
  }
  v32 = v13;
LABEL_70:

  return v32;
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
    block[2] = __38__CBDiscovery_activateWithCompletion___block_invoke;
    block[3] = &unk_1E5E31248;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  id v39 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke;
  v33[3] = &unk_1E5E31388;
  v33[4] = self;
  v33[5] = &v34;
  objc_super v5 = (void (**)(void))MEMORY[0x1AD111AA0](v33);
  uint64_t v6 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v7 = (void *)v35[5];
  v35[5] = v6;

  if (!v35[5])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(v4, "pwrS");
    uint64_t v8 = xpc_dictionary_get_array(v4, "devA");
    uint64_t v9 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v27 = 0;
    int v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__4;
    int v31 = __Block_byref_object_dispose__4;
    id v32 = 0;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    int v24 = __Block_byref_object_copy__4;
    int v25 = __Block_byref_object_dispose__4;
    id v26 = 0;
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke_2;
    applier[3] = &unk_1E5E33EF0;
    applier[4] = &v21;
    applier[5] = &v27;
    xpc_array_apply(v8, applier);
    uint64_t v10 = (void *)v22[5];
    if (v10)
    {
      int v17 = v35;
      id v18 = v10;
      uint64_t v11 = (CBDiscovery *)v17[5];
      v17[5] = (uint64_t)v18;
    }
    else
    {
      uint64_t v11 = self;
      objc_sync_enter(v11);
      objc_storeStrong((id *)&v11->_deviceMap, (id)v28[5]);
      objc_sync_exit(v11);
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

    if (!v10)
    {
LABEL_6:
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        [(NSMutableDictionary *)self->_deviceMap count];
        LogPrintF_safe();
      }
      int v13 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0;

      if (v13) {
        v13[2](v13, 0);
      }
      int v15 = (void *)MEMORY[0x1AD111AA0](self->_deviceFoundHandler);
      if (v15)
      {
        deviceMap = self->_deviceMap;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke_3;
        v19[3] = &unk_1E5E33EC8;
        v19[4] = self;
        v19[5] = v15;
        [(NSMutableDictionary *)deviceMap enumerateKeysAndObjectsUsingBlock:v19];
      }
    }
  }
  v5[2](v5);

  _Block_object_dispose(&v34, 8);
}

void __37__CBDiscovery__activateXPCCompleted___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 48);
    if (v3 <= 90)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
      {
        uint64_t v9 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    uint64_t v10 = (void (**)(id, void))MEMORY[0x1AD111AA0](*(void *)(v2 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;

    if (v10)
    {
      v10[2](v10, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
    else
    {
      uint64_t v7 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 168));
      uint64_t v8 = (void *)v7;
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      }
    }
  }
}

- (void)dealloc
{
  int v3 = self->_mockID;
  int v4 = v3;
  if (v3) {
    CBMockRemoveDiscovery(v3, self);
  }
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CBDiscovery;
  [(CBDiscovery *)&v6 dealloc];
}

- (void)setBleScanRate:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__CBDiscovery_setBleScanRate___block_invoke;
  v3[3] = &unk_1E5E31568;
  int v4 = a3;
  v3[4] = self;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v3];
}

BOOL __30__CBDiscovery_setBleScanRate___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 84);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 84) = v1;
  }
  return v1 != v3;
}

- (void)setBleScanRateScreenOff:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CBDiscovery_setBleScanRateScreenOff___block_invoke;
  v3[3] = &unk_1E5E31568;
  int v4 = a3;
  v3[4] = self;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v3];
}

BOOL __39__CBDiscovery_setBleScanRateScreenOff___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 92);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 92) = v1;
  }
  return v1 != v3;
}

- (void)setDeviceFilter:(id)a3
{
  int v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__CBDiscovery_setDeviceFilter___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v6];
}

BOOL __31__CBDiscovery_setDeviceFilter___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 232);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    objc_super v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 232);
    *(void *)(v10 + 232) = v11;
  }

  return v5;
}

- (void)addDiscoveryType:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CBDiscovery_addDiscoveryType___block_invoke;
  v3[3] = &unk_1E5E31568;
  v3[4] = self;
  int v4 = a3;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v3];
}

uint64_t __32__CBDiscovery_addDiscoveryType___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  uint64_t result = 1;
  if ((v2 - 34) >= 0xFFFFFFDF)
  {
    uint64_t v4 = *(void *)(a1 + 32) + 41;
    unint64_t v5 = (v2 - 1);
    int v6 = 1 << (-(char)v2 & 7);
    unint64_t v7 = v5 >> 3;
    int v8 = *(unsigned __int8 *)(v4 + (v5 >> 3));
    uint64_t result = 0;
    if ((v6 & v8) == 0)
    {
      *(unsigned char *)(v4 + v7) = v8 | v6;
      return 1;
    }
  }
  return result;
}

- (void)clearDuplicateFilterCache
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CBDiscovery_clearDuplicateFilterCache__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __40__CBDiscovery_clearDuplicateFilterCache__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 46) && (*(unsigned char *)(v1 + 43) & 0x20) != 0 && *(_DWORD *)(v1 + 80) == 524290)
  {
    id v3 = (void *)gCBDaemonServer;
    if (gCBDaemonServer)
    {
      objc_msgSend(v3, "clearDuplicateFilterCache:");
    }
    else
    {
      xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
      [*(id *)(a1 + 32) encodeWithXPCObject:xdict];
      xpc_dictionary_set_string(xdict, "mTyp", "DsCD");
      uint64_t v4 = [*(id *)(a1 + 32) _ensureXPCStarted];
      xpc_connection_send_message(v4, xdict);
    }
  }
}

- (void)removeDiscoveryType:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__CBDiscovery_removeDiscoveryType___block_invoke;
  v3[3] = &unk_1E5E31568;
  v3[4] = self;
  int v4 = a3;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v3];
}

uint64_t __35__CBDiscovery_removeDiscoveryType___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  if ((v1 - 34) < 0xFFFFFFDF) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 32) + 41;
  unint64_t v3 = (v1 - 1);
  int v4 = 1 << (-(char)v1 & 7);
  unint64_t v5 = v3 >> 3;
  int v6 = *(unsigned __int8 *)(v2 + (v3 >> 3));
  if ((v4 & v6) == 0) {
    return 0;
  }
  *(unsigned char *)(v2 + v5) = v6 & ~(_BYTE)v4;
  return 1;
}

- (void)removeAllDiscoveryTypes
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__CBDiscovery_removeAllDiscoveryTypes__block_invoke;
  v2[3] = &unk_1E5E33E50;
  v2[4] = self;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v2];
}

BOOL __38__CBDiscovery_removeAllDiscoveryTypes__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v1 + 41);
  uint64_t v2 = v1 + 41;
  int v4 = v3 | *(unsigned __int8 *)(v2 + 4);
  if (v4)
  {
    *(unsigned char *)(v2 + 4) = 0;
    *(_DWORD *)uint64_t v2 = 0;
  }
  return v4 != 0;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setOobKeys:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__CBDiscovery_setOobKeys___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v6];
}

BOOL __26__CBDiscovery_setOobKeys___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 264);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    int v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 264);
    *(void *)(v10 + 264) = v11;
  }

  return v5;
}

- (void)setServiceUUIDs:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__CBDiscovery_setServiceUUIDs___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v6];
}

BOOL __31__CBDiscovery_setServiceUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 272);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    int v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 272);
    *(void *)(v10 + 272) = v11;
  }

  return v5;
}

- (void)setSpatialInteractionFilter:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CBDiscovery_setSpatialInteractionFilter___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v6];
}

BOOL __43__CBDiscovery_setSpatialInteractionFilter___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 304);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    int v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 304);
    *(void *)(v10 + 304) = v11;
  }

  return v5;
}

- (void)setTypeToRssiThresholds:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CBDiscovery_setTypeToRssiThresholds___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v6];
}

BOOL __39__CBDiscovery_setTypeToRssiThresholds___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 280);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    int v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 280);
    *(void *)(v10 + 280) = v11;
  }

  return v5;
}

- (void)setUseCaseClientIDs:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__CBDiscovery_setUseCaseClientIDs___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBDiscovery *)self _updateIfNeededWithBlock:v6];
}

BOOL __35__CBDiscovery_setUseCaseClientIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 216);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    int v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 216);
    *(void *)(v10 + 216) = v11;
  }

  return v5;
}

- (BOOL)updateWithCBDiscovery:(id)a3
{
  id v4 = (char *)a3;
  int v5 = [v4 bleRSSIThresholdOrder];
  int bleRSSIThresholdOrder = self->_bleRSSIThresholdOrder;
  BOOL v7 = v5 != bleRSSIThresholdOrder;
  if (v5 == bleRSSIThresholdOrder)
  {
    id v9 = 0;
    char v12 = [v4 bleRSSIThresholdHint];
    uint64_t bleRSSIThresholdHint = self->_bleRSSIThresholdHint;
    if (v12 == self->_bleRSSIThresholdHint) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v8 = CUPrintFlags32();
  [v4 bleRSSIThresholdOrder];
  v127 = CUPrintFlags32();
  CUAppendF();
  id v9 = 0;

  self->_int bleRSSIThresholdOrder = objc_msgSend(v4, "bleRSSIThresholdOrder", v8, v127);
  char v10 = [v4 bleRSSIThresholdHint];
  uint64_t bleRSSIThresholdHint = self->_bleRSSIThresholdHint;
  if (v10 != self->_bleRSSIThresholdHint)
  {
LABEL_5:
    uint64_t v117 = bleRSSIThresholdHint;
    uint64_t v128 = (int)[v4 bleRSSIThresholdHint];
    CUAppendF();
    id v13 = v9;

    self->_uint64_t bleRSSIThresholdHint = objc_msgSend(v4, "bleRSSIThresholdHint", v117, v128);
    BOOL v7 = 1;
    id v9 = v13;
  }
LABEL_6:
  int v14 = [v4 bleScanRate];
  int bleScanRate = self->_bleScanRate;
  if (v14 == bleScanRate)
  {
    int v16 = [v4 bleScanRateScreenOff];
    int bleScanRateScreenOff = self->_bleScanRateScreenOff;
    if (v16 == bleScanRateScreenOff) {
      goto LABEL_47;
    }
    goto LABEL_28;
  }
  id v18 = "Default";
  switch(bleScanRate)
  {
    case 0:
      break;
    case 10:
      id v18 = "Periodic";
      break;
    case 20:
      id v18 = "Background";
      break;
    case 30:
      id v18 = "Low";
      break;
    case 35:
      id v18 = "MediumLow";
      break;
    case 40:
      id v18 = "Medium";
      break;
    case 50:
      id v18 = "High";
      break;
    case 60:
      id v18 = "Max";
      break;
    default:
      id v18 = "?";
      break;
  }
  int v19 = [v4 bleScanRate];
  int v20 = "Default";
  switch(v19)
  {
    case 0:
      break;
    case 10:
      int v20 = "Periodic";
      break;
    case 20:
      int v20 = "Background";
      break;
    case 30:
      int v20 = "Low";
      break;
    case 35:
      int v20 = "MediumLow";
      break;
    case 40:
      int v20 = "Medium";
      break;
    case 50:
      int v20 = "High";
      break;
    case 60:
      int v20 = "Max";
      break;
    default:
      int v20 = "?";
      break;
  }
  v129 = v20;
  CUAppendF();
  id v21 = v9;

  self->_int bleScanRate = objc_msgSend(v4, "bleScanRate", v18, v129);
  BOOL v7 = 1;
  id v9 = v21;
  int v22 = [v4 bleScanRateScreenOff];
  int bleScanRateScreenOff = self->_bleScanRateScreenOff;
  if (v22 != bleScanRateScreenOff)
  {
LABEL_28:
    uint64_t v23 = "Default";
    switch(bleScanRateScreenOff)
    {
      case 0:
        break;
      case 10:
        uint64_t v23 = "Periodic";
        break;
      case 20:
        uint64_t v23 = "Background";
        break;
      case 30:
        uint64_t v23 = "Low";
        break;
      case 35:
        uint64_t v23 = "MediumLow";
        break;
      case 40:
        uint64_t v23 = "Medium";
        break;
      case 50:
        uint64_t v23 = "High";
        break;
      case 60:
        uint64_t v23 = "Max";
        break;
      default:
        uint64_t v23 = "?";
        break;
    }
    int v24 = [v4 bleScanRateScreenOff];
    int v25 = "Default";
    switch(v24)
    {
      case 0:
        break;
      case 10:
        int v25 = "Periodic";
        break;
      case 20:
        int v25 = "Background";
        break;
      case 30:
        int v25 = "Low";
        break;
      case 35:
        int v25 = "MediumLow";
        break;
      case 40:
        int v25 = "Medium";
        break;
      case 50:
        int v25 = "High";
        break;
      case 60:
        int v25 = "Max";
        break;
      default:
        int v25 = "?";
        break;
    }
    v130 = v25;
    CUAppendF();
    id v26 = v9;

    self->_int bleScanRateScreenOff = objc_msgSend(v4, "bleScanRateScreenOff", v23, v130);
    BOOL v7 = 1;
    id v9 = v26;
  }
LABEL_47:
  uint64_t v27 = [v4 deviceFilter];
  deviceFilter = self->_deviceFilter;
  uint64_t v29 = v27;
  v30 = deviceFilter;
  if (v29 == v30)
  {
  }
  else
  {
    int v31 = v30;
    if ((v29 == 0) != (v30 != 0))
    {
      char v32 = [(NSArray *)v29 isEqual:v30];

      if (v32)
      {
        if ([v4 discoveryFlags] == self->_discoveryFlags) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }
    else
    {
    }
    id v45 = CUPrintNSObjectOneLine();
    v46 = [v4 deviceFilter];
    v133 = CUPrintNSObjectOneLine();
    CUAppendF();
    id v47 = v9;

    objc_msgSend(v4, "deviceFilter", v45, v133);
    v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = self->_deviceFilter;
    self->_deviceFilter = v48;
    BOOL v7 = 1;
    id v9 = v47;
  }

  if ([v4 discoveryFlags] != self->_discoveryFlags)
  {
LABEL_51:
    v33 = CUPrintFlags64();
    [v4 discoveryFlags];
    v131 = CUPrintFlags64();
    CUAppendF();
    id v34 = v9;

    self->_uint64_t discoveryFlags = objc_msgSend(v4, "discoveryFlags", v33, v131);
    BOOL v7 = 1;
    id v9 = v34;
  }
LABEL_52:
  if (*(_DWORD *)(v4 + 41) != *(_DWORD *)self->_discoveryTypesInternal.bitArray
    || v4[45] != self->_discoveryTypesInternal.bitArray[4])
  {
    uint64_t v36 = CBDiscoveryTypesToString((uint64_t)&self->_discoveryTypesInternal);
    CBDiscoveryTypesToString((uint64_t)(v4 + 41));
    v126 = v116 = v36;
    CUAppendF();
    id v37 = v9;

    int v38 = *(_DWORD *)(v4 + 41);
    self->_discoveryTypesInternal.bitArray[4] = v4[45];
    *(_DWORD *)self->_discoveryTypesInternal.bitArray = v38;
    BOOL v7 = 1;
    id v9 = v37;
  }
  id v39 = objc_msgSend(v4, "oobKeys", v116, v126);
  oobKeys = self->_oobKeys;
  v41 = v39;
  uint64_t v42 = oobKeys;
  if (v41 == v42)
  {

LABEL_69:
    goto LABEL_70;
  }
  v43 = v42;
  if ((v41 == 0) == (v42 != 0))
  {

    goto LABEL_68;
  }
  char v44 = [(NSArray *)v41 isEqual:v42];

  if ((v44 & 1) == 0)
  {
LABEL_68:
    v49 = CUPrintNSObjectOneLine();
    v50 = [v4 oobKeys];
    v134 = CUPrintNSObjectOneLine();
    CUAppendF();
    id v51 = v9;

    objc_msgSend(v4, "oobKeys", v49, v134);
    v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v41 = self->_oobKeys;
    self->_oobKeys = v52;
    BOOL v7 = 1;
    id v9 = v51;
    goto LABEL_69;
  }
LABEL_70:
  v53 = [v4 serviceUUIDs];
  serviceUUIDs = self->_serviceUUIDs;
  v55 = v53;
  v56 = serviceUUIDs;
  if (v55 == v56)
  {
  }
  else
  {
    v57 = v56;
    if ((v55 == 0) != (v56 != 0))
    {
      char v58 = [(NSArray *)v55 isEqual:v56];

      if (v58)
      {
        unsigned int v59 = [v4 useCase];
        unsigned int useCase = self->_useCase;
        if (v59 == useCase) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
    }
    else
    {
    }
    v93 = CUPrintNSObjectOneLine();
    v94 = [v4 serviceUUIDs];
    v138 = CUPrintNSObjectOneLine();
    CUAppendF();
    id v95 = v9;

    objc_msgSend(v4, "serviceUUIDs", v93, v138);
    v96 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v55 = self->_serviceUUIDs;
    self->_serviceUUIDs = v96;
    BOOL v7 = 1;
    id v9 = v95;
  }

  unsigned int v59 = [v4 useCase];
  unsigned int useCase = self->_useCase;
  if (v59 != useCase)
  {
LABEL_74:
    v118 = CBUseCaseToString_0(useCase);
    v132 = CBUseCaseToString_0(v59);
    CUAppendF();
    id v61 = v9;

    self->_unsigned int useCase = v59;
    BOOL v7 = 1;
    id v9 = v61;
  }
LABEL_75:
  v62 = objc_msgSend(v4, "useCaseClientIDs", v118, v132);
  useCaseClientIDs = self->_useCaseClientIDs;
  v64 = v62;
  v65 = useCaseClientIDs;
  if (v64 == v65)
  {

    v92 = v64;
  }
  else
  {
    v66 = v65;
    if ((v64 == 0) != (v65 != 0))
    {
      char v67 = [(NSArray *)v64 isEqual:v65];

      if (v67)
      {
        char v68 = [v4 bleSensorRssiIncreaseScanThreshold];
        uint64_t bleSensorRssiIncreaseScanThreshold = self->_bleSensorRssiIncreaseScanThreshold;
        if (v68 == self->_bleSensorRssiIncreaseScanThreshold) {
          goto LABEL_79;
        }
        goto LABEL_104;
      }
    }
    else
    {
    }
    v97 = CUPrintNSObjectOneLine();
    CUPrintNSObjectOneLine();
    v135 = v119 = v97;
    CUAppendF();
    id v98 = v9;

    v99 = v64;
    v92 = self->_useCaseClientIDs;
    self->_useCaseClientIDs = v99;
    BOOL v7 = 1;
    id v9 = v98;
  }

  char v100 = [v4 bleSensorRssiIncreaseScanThreshold];
  uint64_t bleSensorRssiIncreaseScanThreshold = self->_bleSensorRssiIncreaseScanThreshold;
  if (v100 == self->_bleSensorRssiIncreaseScanThreshold)
  {
LABEL_79:
    int v70 = objc_msgSend(v4, "bleSensorEnableRssiIncreaseScan", v119, v135);
    BOOL bleSensorEnableRssiIncreaseScan = self->_bleSensorEnableRssiIncreaseScan;
    if (bleSensorEnableRssiIncreaseScan == v70) {
      goto LABEL_80;
    }
    goto LABEL_105;
  }
LABEL_104:
  int v101 = objc_msgSend(v4, "bleSensorRssiIncreaseScanThreshold", v119, v135);
  uint64_t v122 = bleSensorRssiIncreaseScanThreshold;
  uint64_t v139 = v101;
  CUAppendF();
  id v102 = v9;

  self->_uint64_t bleSensorRssiIncreaseScanThreshold = objc_msgSend(v4, "bleSensorRssiIncreaseScanThreshold", v122, v139);
  BOOL v7 = 1;
  id v9 = v102;
  int v103 = [v4 bleSensorEnableRssiIncreaseScan];
  BOOL bleSensorEnableRssiIncreaseScan = self->_bleSensorEnableRssiIncreaseScan;
  if (bleSensorEnableRssiIncreaseScan == v103)
  {
LABEL_80:
    int v72 = [v4 bleSensorIncreaseScanRate];
    uint64_t bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
    if (v72 == bleSensorIncreaseScanRate) {
      goto LABEL_81;
    }
    goto LABEL_106;
  }
LABEL_105:
  BOOL v123 = bleSensorEnableRssiIncreaseScan;
  uint64_t v140 = [v4 bleSensorEnableRssiIncreaseScan];
  CUAppendF();
  id v104 = v9;

  self->_BOOL bleSensorEnableRssiIncreaseScan = objc_msgSend(v4, "bleSensorEnableRssiIncreaseScan", v123, v140);
  BOOL v7 = 1;
  id v9 = v104;
  int v105 = [v4 bleSensorIncreaseScanRate];
  uint64_t bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
  if (v105 == bleSensorIncreaseScanRate)
  {
LABEL_81:
    int v74 = [v4 bleSensorIncreaseScanTimeout];
    uint64_t bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
    if (v74 == bleSensorIncreaseScanTimeout) {
      goto LABEL_82;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v124 = bleSensorIncreaseScanRate;
  uint64_t v141 = [v4 bleSensorIncreaseScanRate];
  CUAppendF();
  id v106 = v9;

  self->_uint64_t bleSensorIncreaseScanRate = objc_msgSend(v4, "bleSensorIncreaseScanRate", v124, v141);
  BOOL v7 = 1;
  id v9 = v106;
  int v107 = [v4 bleSensorIncreaseScanTimeout];
  uint64_t bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
  if (v107 == bleSensorIncreaseScanTimeout)
  {
LABEL_82:
    int v76 = [v4 bleSensorTimeoutBetweenIncreaseScan];
    uint64_t bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
    if (v76 == bleSensorTimeoutBetweenIncreaseScan) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_107:
  uint64_t v125 = bleSensorIncreaseScanTimeout;
  uint64_t v142 = [v4 bleSensorIncreaseScanTimeout];
  CUAppendF();
  id v108 = v9;

  self->_uint64_t bleSensorIncreaseScanTimeout = objc_msgSend(v4, "bleSensorIncreaseScanTimeout", v125, v142);
  BOOL v7 = 1;
  id v9 = v108;
  int v109 = [v4 bleSensorTimeoutBetweenIncreaseScan];
  uint64_t bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
  if (v109 != bleSensorTimeoutBetweenIncreaseScan)
  {
LABEL_83:
    uint64_t v120 = bleSensorTimeoutBetweenIncreaseScan;
    uint64_t v136 = [v4 bleSensorTimeoutBetweenIncreaseScan];
    CUAppendF();
    id v78 = v9;

    self->_uint64_t bleSensorTimeoutBetweenIncreaseScan = objc_msgSend(v4, "bleSensorTimeoutBetweenIncreaseScan", v120, v136);
    BOOL v7 = 1;
    id v9 = v78;
  }
LABEL_84:
  v79 = [v4 typeToRssiThresholds];
  typeToRssiThresholds = self->_typeToRssiThresholds;

  if (v79 != typeToRssiThresholds)
  {
    v81 = self->_typeToRssiThresholds;
    [v4 typeToRssiThresholds];
    v137 = v121 = v81;
    CUAppendF();
    id v82 = v9;

    objc_msgSend(v4, "typeToRssiThresholds", v121, v137);
    v83 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v84 = self->_typeToRssiThresholds;
    self->_typeToRssiThresholds = v83;

    BOOL v7 = 1;
    id v9 = v82;
  }
  v85 = [v4 spatialInteractionfilter];
  spatialInteractionfilter = self->_spatialInteractionfilter;
  v87 = v85;
  v88 = spatialInteractionfilter;
  if (v87 == v88)
  {

    int var0 = self->_ucat->var0;
    if (v9) {
      goto LABEL_90;
    }
LABEL_111:
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_113;
    }
    goto LABEL_117;
  }
  v89 = v88;
  if ((v87 == 0) == (v88 != 0))
  {

LABEL_110:
    v110 = CUPrintNSObjectOneLine();
    v111 = [v4 spatialInteractionfilter];
    v143 = CUPrintNSObjectOneLine();
    CUAppendF();
    id v112 = v9;

    objc_msgSend(v4, "spatialInteractionfilter", v110, v143);
    v113 = (CBSpatialInteractionFilter *)objc_claimAutoreleasedReturnValue();
    v114 = self->_spatialInteractionfilter;
    self->_spatialInteractionfilter = v113;
    BOOL v7 = 1;
    id v9 = v112;

    int var0 = self->_ucat->var0;
    if (v112) {
      goto LABEL_90;
    }
    goto LABEL_111;
  }
  BOOL v90 = [(CBSpatialInteractionFilter *)v87 isEqual:v88];

  if (!v90) {
    goto LABEL_110;
  }
  int var0 = self->_ucat->var0;
  if (!v9) {
    goto LABEL_111;
  }
LABEL_90:
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_113:
  }
    LogPrintF_safe();
LABEL_117:

  return v7;
}

- (unint64_t)updateWithXPCSubscriberInfo:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!v4 || MEMORY[0x1AD1120E0](v4) != MEMORY[0x1E4F14590])
  {
    unint64_t v7 = 0;
    goto LABEL_147;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "bleRSSIThresholdOrder");
  if (uint64 == self->_bleRSSIThresholdOrder)
  {
    unint64_t v7 = 0;
  }
  else
  {
    self->_int bleRSSIThresholdOrder = uint64;
    unint64_t v7 = 0x80000000000;
  }
  int64_t int64 = xpc_dictionary_get_int64(v5, "bleRSSIThresholdHint");
  uint64_t v9 = 127;
  if (int64 < 127) {
    uint64_t v9 = int64;
  }
  if (v9 <= -128) {
    uint64_t v9 = -128;
  }
  if (v9 != self->_bleRSSIThresholdHint)
  {
    self->_uint64_t bleRSSIThresholdHint = v9;
    unint64_t v7 = 0x80000000000;
  }
  id v78 = 0;
  CUXPCDecodeNSArrayOfNSString();
  deviceFilter = self->_deviceFilter;
  id v11 = (NSArray *)0;
  char v12 = deviceFilter;
  if (v11 == v12)
  {

LABEL_19:
    goto LABEL_20;
  }
  id v13 = v12;
  if ((v11 == 0) == (v12 != 0))
  {

    goto LABEL_18;
  }
  char v14 = [(NSArray *)v11 isEqual:v12];

  if ((v14 & 1) == 0)
  {
LABEL_18:
    int v15 = (NSArray *)[v78 copy];
    id v11 = self->_deviceFilter;
    self->_deviceFilter = v15;
    unint64_t v7 = 0x80000000000;
    goto LABEL_19;
  }
LABEL_20:
  string = xpc_dictionary_get_string(v5, "bleScanRate");
  int v17 = xpc_dictionary_get_string(v5, "bleScanRateScreenOff");
  id v18 = v17;
  p_int bleScanRateScreenOff = &self->_bleScanRateScreenOff;
  if (!string)
  {
    if (!v17) {
      goto LABEL_81;
    }
    if (!strcmp(v17, "Default"))
    {
      *p_int bleScanRateScreenOff = 0;
      unint64_t v7 = 0x80000000000;
      if (strcmp(v18, "Periodic"))
      {
LABEL_41:
        if (strcmp(v18, "Background")) {
          goto LABEL_42;
        }
        goto LABEL_73;
      }
    }
    else if (strcmp(v18, "Periodic"))
    {
      goto LABEL_41;
    }
    *p_int bleScanRateScreenOff = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Background"))
    {
LABEL_42:
      if (strcmp(v18, "Low")) {
        goto LABEL_43;
      }
      goto LABEL_74;
    }
LABEL_73:
    *p_int bleScanRateScreenOff = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Low"))
    {
LABEL_43:
      if (strcmp(v18, "MediumLow")) {
        goto LABEL_44;
      }
      goto LABEL_75;
    }
LABEL_74:
    *p_int bleScanRateScreenOff = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "MediumLow"))
    {
LABEL_44:
      if (strcmp(v18, "Medium")) {
        goto LABEL_45;
      }
      goto LABEL_76;
    }
LABEL_75:
    *p_int bleScanRateScreenOff = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Medium"))
    {
LABEL_45:
      if (strcmp(v18, "High")) {
        goto LABEL_79;
      }
LABEL_77:
      *p_int bleScanRateScreenOff = 50;
      goto LABEL_78;
    }
LABEL_76:
    *p_int bleScanRateScreenOff = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "High")) {
      goto LABEL_79;
    }
    goto LABEL_77;
  }
  p_int bleScanRate = &self->_bleScanRate;
  int v21 = strcmp(string, "Default");
  if (v18)
  {
    if (v21)
    {
      if (strcmp(v18, "Default")) {
        goto LABEL_24;
      }
    }
    else
    {
      *p_int bleScanRate = 0;
      unint64_t v7 = 0x80000000000;
      if (strcmp(v18, "Default"))
      {
LABEL_24:
        if (strcmp(string, "Periodic")) {
          goto LABEL_25;
        }
        goto LABEL_58;
      }
    }
    *p_int bleScanRateScreenOff = 0;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Periodic"))
    {
LABEL_25:
      if (strcmp(v18, "Periodic")) {
        goto LABEL_26;
      }
      goto LABEL_59;
    }
LABEL_58:
    *p_int bleScanRate = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Periodic"))
    {
LABEL_26:
      if (strcmp(string, "Background")) {
        goto LABEL_27;
      }
      goto LABEL_60;
    }
LABEL_59:
    *p_int bleScanRateScreenOff = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Background"))
    {
LABEL_27:
      if (strcmp(v18, "Background")) {
        goto LABEL_28;
      }
      goto LABEL_61;
    }
LABEL_60:
    *p_int bleScanRate = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Background"))
    {
LABEL_28:
      if (strcmp(string, "Low")) {
        goto LABEL_29;
      }
      goto LABEL_62;
    }
LABEL_61:
    *p_int bleScanRateScreenOff = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Low"))
    {
LABEL_29:
      if (strcmp(v18, "Low")) {
        goto LABEL_30;
      }
      goto LABEL_63;
    }
LABEL_62:
    *p_int bleScanRate = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Low"))
    {
LABEL_30:
      if (strcmp(string, "MediumLow")) {
        goto LABEL_31;
      }
      goto LABEL_64;
    }
LABEL_63:
    *p_int bleScanRateScreenOff = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "MediumLow"))
    {
LABEL_31:
      if (strcmp(v18, "MediumLow")) {
        goto LABEL_32;
      }
      goto LABEL_65;
    }
LABEL_64:
    *p_int bleScanRate = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "MediumLow"))
    {
LABEL_32:
      if (strcmp(string, "Medium")) {
        goto LABEL_33;
      }
      goto LABEL_66;
    }
LABEL_65:
    *p_int bleScanRateScreenOff = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Medium"))
    {
LABEL_33:
      if (strcmp(v18, "Medium")) {
        goto LABEL_34;
      }
      goto LABEL_67;
    }
LABEL_66:
    *p_int bleScanRate = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Medium"))
    {
LABEL_34:
      if (strcmp(string, "High")) {
        goto LABEL_35;
      }
      goto LABEL_68;
    }
LABEL_67:
    *p_int bleScanRateScreenOff = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "High"))
    {
LABEL_35:
      if (strcmp(v18, "High")) {
        goto LABEL_36;
      }
      goto LABEL_69;
    }
LABEL_68:
    *p_int bleScanRate = 50;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "High"))
    {
LABEL_36:
      if (strcmp(string, "Max")) {
        goto LABEL_79;
      }
LABEL_70:
      *p_int bleScanRate = 60;
LABEL_78:
      v7 |= 0x80000000000uLL;
LABEL_79:
      if (strcmp(v18, "Max")) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }
LABEL_69:
    *p_int bleScanRateScreenOff = 50;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Max")) {
      goto LABEL_79;
    }
    goto LABEL_70;
  }
  if (v21)
  {
    if (strcmp(string, "Periodic")) {
      goto LABEL_49;
    }
  }
  else
  {
    *p_int bleScanRate = 0;
    unint64_t v7 = 0x80000000000;
    if (strcmp(string, "Periodic"))
    {
LABEL_49:
      if (strcmp(string, "Background")) {
        goto LABEL_50;
      }
      goto LABEL_150;
    }
  }
  *p_int bleScanRate = 10;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Background"))
  {
LABEL_50:
    if (strcmp(string, "Low")) {
      goto LABEL_51;
    }
    goto LABEL_151;
  }
LABEL_150:
  *p_int bleScanRate = 20;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Low"))
  {
LABEL_51:
    if (strcmp(string, "MediumLow")) {
      goto LABEL_52;
    }
    goto LABEL_152;
  }
LABEL_151:
  *p_int bleScanRate = 30;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "MediumLow"))
  {
LABEL_52:
    if (strcmp(string, "Medium")) {
      goto LABEL_53;
    }
    goto LABEL_153;
  }
LABEL_152:
  *p_int bleScanRate = 35;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Medium"))
  {
LABEL_53:
    if (strcmp(string, "High")) {
      goto LABEL_54;
    }
    goto LABEL_154;
  }
LABEL_153:
  *p_int bleScanRate = 40;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "High"))
  {
LABEL_54:
    p_int bleScanRateScreenOff = &self->_bleScanRate;
    if (strcmp(string, "Max")) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
LABEL_154:
  *p_int bleScanRate = 50;
  v7 |= 0x80000000000uLL;
  p_int bleScanRateScreenOff = &self->_bleScanRate;
  if (!strcmp(string, "Max"))
  {
LABEL_80:
    *p_int bleScanRateScreenOff = 60;
    v7 |= 0x80000000000uLL;
  }
LABEL_81:
  unint64_t discoveryFlags = self->_discoveryFlags;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  uint64_t v23 = xpc_dictionary_get_array(v5, "discoveryFlags");
  int v24 = v23;
  if (v23)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke;
    applier[3] = &unk_1E5E33E78;
    applier[4] = self;
    applier[5] = &v74;
    xpc_array_apply(v23, applier);
  }
  unint64_t v25 = v75[3];
  if (v25 != discoveryFlags)
  {
    self->_unint64_t discoveryFlags = v25;
    v7 |= 0x800000000uLL;
  }
  uint64_t v67 = 0;
  char v68 = &v67;
  uint64_t v69 = 0x2810000000;
  int v70 = &unk_1ABAA9A43;
  int v71 = 0;
  char v72 = 0;
  id v26 = xpc_dictionary_get_array(v5, "discoveryTypes");
  uint64_t v27 = v26;
  if (v26)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke_2;
    v66[3] = &unk_1E5E33AE0;
    v66[4] = &v67;
    xpc_array_apply(v26, v66);
  }

  if (*((_DWORD *)v68 + 8) != *(_DWORD *)self->_discoveryTypesInternal.bitArray
    || *((unsigned __int8 *)v68 + 36) != self->_discoveryTypesInternal.bitArray[4])
  {
    int v29 = *((_DWORD *)v68 + 8);
    self->_discoveryTypesInternal.bitArray[4] = *((unsigned char *)v68 + 36);
    *(_DWORD *)self->_discoveryTypesInternal.bitArray = v29;
    v7 |= 0x800000000uLL;
  }
  BOOL v30 = xpc_dictionary_get_BOOL(v5, "keepAlive");
  if (self->_keepAlive != v30)
  {
    self->_keepAlive = v30;
    v7 |= 0x80000000000uLL;
  }
  int v31 = xpc_dictionary_get_string(v5, "memoryPressure");
  if (v31) {
    char v32 = v31;
  }
  else {
    char v32 = "";
  }
  if (!strcmp(v32, "warn"))
  {
    unsigned int v33 = 2;
    if (self->_memoryPressureFlags != 2)
    {
LABEL_102:
      self->_memoryPressureFlags = v33;
      v7 |= 0x80000000000uLL;
    }
  }
  else
  {
    if (!strcmp(v32, "critical")) {
      unsigned int v33 = 6;
    }
    else {
      unsigned int v33 = 0;
    }
    if (v33 != self->_memoryPressureFlags) {
      goto LABEL_102;
    }
  }
  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  oobKeys = self->_oobKeys;
  uint64_t v35 = (NSArray *)0;
  uint64_t v36 = oobKeys;
  if (v35 == v36)
  {

    goto LABEL_112;
  }
  id v37 = v36;
  if ((v35 == 0) == (v36 != 0))
  {

    goto LABEL_111;
  }
  char v38 = [(NSArray *)v35 isEqual:v36];

  if ((v38 & 1) == 0)
  {
LABEL_111:
    id v39 = (NSArray *)[0 copy];
    uint64_t v40 = self->_oobKeys;
    self->_oobKeys = v39;

    v7 |= 0x80000000000uLL;
  }
LABEL_112:
  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  serviceUUIDs = self->_serviceUUIDs;
  uint64_t v42 = (NSArray *)0;
  v43 = serviceUUIDs;
  if (v42 == v43)
  {

    goto LABEL_119;
  }
  char v44 = v43;
  if ((v42 == 0) == (v43 != 0))
  {

    goto LABEL_118;
  }
  char v45 = [(NSArray *)v42 isEqual:v43];

  if ((v45 & 1) == 0)
  {
LABEL_118:
    v46 = (NSArray *)[0 copy];
    id v47 = self->_serviceUUIDs;
    self->_serviceUUIDs = v46;

    v7 |= 0x80000000000uLL;
  }
LABEL_119:
  int64_t v48 = xpc_dictionary_get_int64(v5, "bleSensorRssiIncreaseScanThreshold");
  uint64_t v49 = 127;
  if (v48 < 127) {
    uint64_t v49 = v48;
  }
  if (v49 <= -128) {
    uint64_t v49 = -128;
  }
  if (v49 != self->_bleSensorRssiIncreaseScanThreshold)
  {
    self->_uint64_t bleSensorRssiIncreaseScanThreshold = v49;
    v7 |= 0x80000000000uLL;
  }
  int64_t v50 = xpc_dictionary_get_int64(v5, "bleSensorEnableRssiIncreaseScan");
  if (v50 != self->_bleSensorEnableRssiIncreaseScan)
  {
    self->_BOOL bleSensorEnableRssiIncreaseScan = v50 != 0;
    v7 |= 0x80000000000uLL;
  }
  int64_t v51 = xpc_dictionary_get_int64(v5, "bleSensorIncreaseScanRate");
  if (v51 != self->_bleSensorIncreaseScanRate)
  {
    self->_uint64_t bleSensorIncreaseScanRate = v51;
    v7 |= 0x80000000000uLL;
  }
  int64_t v52 = xpc_dictionary_get_int64(v5, "bleSensorIncreaseScanTimeout");
  if (v52 != self->_bleSensorIncreaseScanTimeout)
  {
    self->_uint64_t bleSensorIncreaseScanTimeout = v52;
    v7 |= 0x80000000000uLL;
  }
  int64_t v53 = xpc_dictionary_get_int64(v5, "bleSensorTimeoutBetweenIncreaseScan");
  if (v53 != self->_bleSensorTimeoutBetweenIncreaseScan)
  {
    self->_uint64_t bleSensorTimeoutBetweenIncreaseScan = v53;
    v7 |= 0x80000000000uLL;
  }
  BOOL v54 = xpc_dictionary_get_BOOL(v5, "denyLowPowerModeScans");
  if (self->_denyLowPowerModeScans != v54)
  {
    self->_denyLowPowerModeScans = v54;
    v7 |= 0x80000000000uLL;
  }
  BOOL v55 = xpc_dictionary_get_BOOL(v5, "denyScreenLockedScans");
  if (self->_denyScreenLockedScans != v55)
  {
    self->_denyScreenLockedScans = v55;
    v7 |= 0x80000000000uLL;
  }
  uint64_t v56 = xpc_dictionary_get_uint64(v5, "deviceSetupState");
  if (v56 != self->_deviceSetupState)
  {
    self->_deviceSetupState = v56;
    v7 |= 0x80000000000uLL;
  }
  v65 = 0;
  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  typeToRssiThresholds = self->_typeToRssiThresholds;
  char v58 = (NSArray *)0;
  unsigned int v59 = typeToRssiThresholds;
  if (v58 == v59)
  {
  }
  else
  {
    v60 = v59;
    if ((v58 == 0) != (v59 != 0))
    {
      char v61 = [(NSArray *)v58 isEqual:v59];

      if (v61) {
        goto LABEL_146;
      }
    }
    else
    {
    }
    v62 = (NSArray *)objc_msgSend(0, "copy", 0);
    v63 = self->_typeToRssiThresholds;
    self->_typeToRssiThresholds = v62;

    v7 |= 0x80000000000uLL;
  }
LABEL_146:

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v74, 8);

LABEL_147:
  return v7;
}

uint64_t __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr) {
    return 1;
  }
  int v5 = string_ptr;
  if (!strcmp(string_ptr, "ApplePay"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1uLL;
    return 1;
  }
  if (!strcmp(v5, "AppleTVSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 2uLL;
    return 1;
  }
  else if (!strcmp(v5, "AppSignIn"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 4uLL;
    return 1;
  }
  else if (!strcmp(v5, "BLEAdvertisementData"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x40000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "BLEPresent"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x20000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "CNJ"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x10000000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "CompanionAuthentication"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x10000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "CompanionLink"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 8uLL;
    return 1;
  }
  else if (!strcmp(v5, "HomePodSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x10uLL;
    return 1;
  }
  else if (!strcmp(v5, "iOSSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x20uLL;
    return 1;
  }
  else if (!strcmp(v5, "NearbyAction"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x80000uLL;
    return 1;
  }
  else if (!strcmp(v5, "NearbyInfo"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x40uLL;
    return 1;
  }
  else if (!strcmp(v5, "OSR"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x800000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "PassiveRSSI"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x100000uLL;
    return 1;
  }
  else if (!strcmp(v5, "ProxControl"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x200000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "ProxRepair"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x200uLL;
    return 1;
  }
  else if (!strcmp(v5, "RemoteDisplay"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x100uLL;
    return 1;
  }
  else if (!strcmp(v5, "RemotePairing"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x20000uLL;
    return 1;
  }
  else if (!strcmp(v5, "ShareAudio"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x400uLL;
    return 1;
  }
  else if (!strcmp(v5, "SIMTransfer"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x4000000000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "TVLatencySetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x800uLL;
    return 1;
  }
  else if (!strcmp(v5, "WatchSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x20000000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "WHASetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x1000uLL;
    return 1;
  }
  else if (!strcmp(v5, "WiFiPassword"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x2000uLL;
    return 1;
  }
  else if (!strcmp(v5, "WxSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x4000uLL;
    return 1;
  }
  else if (!strcmp(v5, "WxStatus"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x8000uLL;
    return 1;
  }
  else if (!strcmp(v5, "ObjectSetup"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x10000uLL;
    return 1;
  }
  else if (!strcmp(v5, "Connections"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x200000uLL;
    return 1;
  }
  else if (!strcmp(v5, "Pairing"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x800000uLL;
    return 1;
  }
  else
  {
    if (strcmp(v5, "ScreenOff"))
    {
      int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 48);
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
        return 1;
      }
      return 1;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x2000000uLL;
    return 1;
  }
}

uint64_t __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke_2(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    int v5 = CBDiscoveryTypeFromCString(string_ptr);
    if ((v5 - 34) >= 0xFFFFFFDF)
    {
      unint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8) + ((unint64_t)(v5 - 1) >> 3);
      *(unsigned char *)(v6 + 32) |= 1 << (-(char)v5 & 7);
    }
  }
  return 1;
}

- (OS_xpc_object)xpcSubscriberRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = v3;
  if (self->_bleRSSIThresholdOrder) {
    xpc_dictionary_set_uint64(v3, "bleRSSIThresholdOrder", self->_bleRSSIThresholdOrder);
  }
  if (self->_bleRSSIThresholdHint) {
    xpc_dictionary_set_int64(v4, "bleRSSIThresholdHint", self->_bleRSSIThresholdHint);
  }
  int v5 = self->_deviceFilter;
  if (v5) {
    CUXPCEncodeNSArrayOfNSString();
  }

  unint64_t v6 = "Periodic";
  switch(self->_bleScanRate)
  {
    case 0:
      break;
    case 0xA:
      goto LABEL_15;
    case 0x14:
      unint64_t v6 = "Background";
      goto LABEL_15;
    case 0x1E:
      unint64_t v6 = "Low";
      goto LABEL_15;
    case 0x23:
      unint64_t v6 = "MediumLow";
      goto LABEL_15;
    case 0x28:
      unint64_t v6 = "Medium";
      goto LABEL_15;
    case 0x32:
      unint64_t v6 = "High";
      goto LABEL_15;
    case 0x3C:
      unint64_t v6 = "Max";
      goto LABEL_15;
    default:
      unint64_t v6 = "?";
LABEL_15:
      xpc_dictionary_set_string(v4, "bleScanRate", v6);
      break;
  }
  unint64_t v7 = "Periodic";
  switch(self->_bleScanRateScreenOff)
  {
    case 0:
      goto LABEL_25;
    case 0xA:
      goto LABEL_24;
    case 0x14:
      unint64_t v7 = "Background";
      goto LABEL_24;
    case 0x1E:
      unint64_t v7 = "Low";
      goto LABEL_24;
    case 0x23:
      unint64_t v7 = "MediumLow";
      goto LABEL_24;
    case 0x28:
      unint64_t v7 = "Medium";
      goto LABEL_24;
    case 0x32:
      unint64_t v7 = "High";
      goto LABEL_24;
    case 0x3C:
      unint64_t v7 = "Max";
      goto LABEL_24;
    default:
      unint64_t v7 = "?";
LABEL_24:
      xpc_dictionary_set_string(v4, "bleScanRateScreenOff", v7);
LABEL_25:
      unint64_t discoveryFlags = self->_discoveryFlags;
      if (!discoveryFlags) {
        goto LABEL_55;
      }
      xpc_object_t v9 = xpc_array_create(0, 0);
      char v10 = v9;
      if (discoveryFlags)
      {
        xpc_array_set_string(v9, 0xFFFFFFFFFFFFFFFFLL, "ApplePay");
        if ((discoveryFlags & 2) == 0)
        {
LABEL_28:
          if ((discoveryFlags & 4) == 0) {
            goto LABEL_29;
          }
          goto LABEL_99;
        }
      }
      else if ((discoveryFlags & 2) == 0)
      {
        goto LABEL_28;
      }
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "AppleTVSetup");
      if ((discoveryFlags & 4) == 0)
      {
LABEL_29:
        if ((discoveryFlags & 0x20000000) == 0) {
          goto LABEL_30;
        }
        goto LABEL_100;
      }
LABEL_99:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "AppSignIn");
      if ((discoveryFlags & 0x20000000) == 0)
      {
LABEL_30:
        if ((discoveryFlags & 0x10000000000000) == 0) {
          goto LABEL_31;
        }
        goto LABEL_101;
      }
LABEL_100:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "BLEPresent");
      if ((discoveryFlags & 0x10000000000000) == 0)
      {
LABEL_31:
        if ((discoveryFlags & 0x10000000) == 0) {
          goto LABEL_32;
        }
        goto LABEL_102;
      }
LABEL_101:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CNJ");
      if ((discoveryFlags & 0x10000000) == 0)
      {
LABEL_32:
        if ((discoveryFlags & 8) == 0) {
          goto LABEL_33;
        }
        goto LABEL_103;
      }
LABEL_102:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CompanionAuthentication");
      if ((discoveryFlags & 8) == 0)
      {
LABEL_33:
        if ((discoveryFlags & 0x10) == 0) {
          goto LABEL_34;
        }
        goto LABEL_104;
      }
LABEL_103:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CompanionLink");
      if ((discoveryFlags & 0x10) == 0)
      {
LABEL_34:
        if ((discoveryFlags & 0x20) == 0) {
          goto LABEL_35;
        }
        goto LABEL_105;
      }
LABEL_104:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "HomePodSetup");
      if ((discoveryFlags & 0x20) == 0)
      {
LABEL_35:
        if ((discoveryFlags & 0x80000) == 0) {
          goto LABEL_36;
        }
        goto LABEL_106;
      }
LABEL_105:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "iOSSetup");
      if ((discoveryFlags & 0x80000) == 0)
      {
LABEL_36:
        if ((discoveryFlags & 0x40) == 0) {
          goto LABEL_37;
        }
        goto LABEL_107;
      }
LABEL_106:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NearbyAction");
      if ((discoveryFlags & 0x40) == 0)
      {
LABEL_37:
        if ((discoveryFlags & 0x800000000000) == 0) {
          goto LABEL_38;
        }
        goto LABEL_108;
      }
LABEL_107:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NearbyInfo");
      if ((discoveryFlags & 0x800000000000) == 0)
      {
LABEL_38:
        if ((discoveryFlags & 0x100) == 0) {
          goto LABEL_39;
        }
        goto LABEL_109;
      }
LABEL_108:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "OSR");
      if ((discoveryFlags & 0x100) == 0)
      {
LABEL_39:
        if ((discoveryFlags & 0x200000000000) == 0) {
          goto LABEL_40;
        }
        goto LABEL_110;
      }
LABEL_109:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "RemoteDisplay");
      if ((discoveryFlags & 0x200000000000) == 0)
      {
LABEL_40:
        if ((discoveryFlags & 0x200) == 0) {
          goto LABEL_41;
        }
        goto LABEL_111;
      }
LABEL_110:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ProxControl");
      if ((discoveryFlags & 0x200) == 0)
      {
LABEL_41:
        if ((discoveryFlags & 0x400) == 0) {
          goto LABEL_42;
        }
        goto LABEL_112;
      }
LABEL_111:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ProxRepair");
      if ((discoveryFlags & 0x400) == 0)
      {
LABEL_42:
        if ((discoveryFlags & 0x4000000000000000) == 0) {
          goto LABEL_43;
        }
        goto LABEL_113;
      }
LABEL_112:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ShareAudio");
      if ((discoveryFlags & 0x4000000000000000) == 0)
      {
LABEL_43:
        if ((discoveryFlags & 0x800) == 0) {
          goto LABEL_44;
        }
        goto LABEL_114;
      }
LABEL_113:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "SIMTransfer");
      if ((discoveryFlags & 0x800) == 0)
      {
LABEL_44:
        if ((discoveryFlags & 0x20000000000000) == 0) {
          goto LABEL_45;
        }
        goto LABEL_115;
      }
LABEL_114:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "TVLatencySetup");
      if ((discoveryFlags & 0x20000000000000) == 0)
      {
LABEL_45:
        if ((discoveryFlags & 0x1000) == 0) {
          goto LABEL_46;
        }
        goto LABEL_116;
      }
LABEL_115:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WatchSetup");
      if ((discoveryFlags & 0x1000) == 0)
      {
LABEL_46:
        if ((discoveryFlags & 0x2000) == 0) {
          goto LABEL_47;
        }
        goto LABEL_117;
      }
LABEL_116:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WHASetup");
      if ((discoveryFlags & 0x2000) == 0)
      {
LABEL_47:
        if ((discoveryFlags & 0x4000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_118;
      }
LABEL_117:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WiFiPassword");
      if ((discoveryFlags & 0x4000) == 0)
      {
LABEL_48:
        if ((discoveryFlags & 0x8000) == 0) {
          goto LABEL_49;
        }
        goto LABEL_119;
      }
LABEL_118:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WxSetup");
      if ((discoveryFlags & 0x8000) == 0)
      {
LABEL_49:
        if ((discoveryFlags & 0x10000) == 0) {
          goto LABEL_50;
        }
        goto LABEL_120;
      }
LABEL_119:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WxStatus");
      if ((discoveryFlags & 0x10000) == 0)
      {
LABEL_50:
        if ((discoveryFlags & 0x200000) == 0) {
          goto LABEL_51;
        }
        goto LABEL_121;
      }
LABEL_120:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ObjectSetup");
      if ((discoveryFlags & 0x200000) == 0)
      {
LABEL_51:
        if ((discoveryFlags & 0x800000) == 0) {
          goto LABEL_52;
        }
        goto LABEL_122;
      }
LABEL_121:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "Connections");
      if ((discoveryFlags & 0x800000) == 0)
      {
LABEL_52:
        if ((discoveryFlags & 0x2000000) == 0) {
          goto LABEL_54;
        }
        goto LABEL_53;
      }
LABEL_122:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "Pairing");
      if ((discoveryFlags & 0x2000000) != 0) {
LABEL_53:
      }
        xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ScreenOff");
LABEL_54:
      xpc_dictionary_set_value(v4, "discoveryFlags", v10);

LABEL_55:
      id v11 = "AirDrop";
      if ("AirDrop")
      {
        xpc_object_t v12 = 0;
        id v13 = &off_1E5E330E8;
        do
        {
          int v15 = *((_DWORD *)v13 - 4);
          if ((v15 - 34) >= 0xFFFFFFDF
            && ((self->_discoveryTypesInternal.bitArray[(unint64_t)(v15 - 1) >> 3] >> (-(char)v15 & 7)) & 1) != 0)
          {
            if (!v12) {
              xpc_object_t v12 = xpc_array_create(0, 0);
            }
            xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v11);
          }
          char v14 = *v13;
          v13 += 3;
          id v11 = v14;
        }
        while (v14);
        if (v12) {
          xpc_dictionary_set_value(v4, "discoveryTypes", v12);
        }
        if (self->_keepAlive) {
          goto LABEL_66;
        }
      }
      else
      {
        xpc_object_t v12 = 0;
        if (self->_keepAlive) {
LABEL_66:
        }
          xpc_dictionary_set_BOOL(v4, "keepAlive", 1);
      }
      unsigned int memoryPressureFlags = self->_memoryPressureFlags;
      if ((memoryPressureFlags & 6) != 0)
      {
        if ((memoryPressureFlags & 4) != 0) {
          int v17 = "critical";
        }
        else {
          int v17 = "warn";
        }
        xpc_dictionary_set_string(v4, "memoryPressure", v17);
      }
      id v18 = self->_oobKeys;
      if (v18) {
        CUXPCEncodeNSArrayOfObjects();
      }

      int v19 = self->_serviceUUIDs;
      if (v19) {
        CUXPCEncodeNSArrayOfObjects();
      }

      if (self->_bleSensorRssiIncreaseScanThreshold) {
        xpc_dictionary_set_int64(v4, "bleSensorRssiIncreaseScanThreshold", self->_bleSensorRssiIncreaseScanThreshold);
      }
      if (self->_bleSensorEnableRssiIncreaseScan) {
        xpc_dictionary_set_int64(v4, "bleSensorEnableRssiIncreaseScan", 1);
      }
      int64_t bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
      if (bleSensorIncreaseScanRate) {
        xpc_dictionary_set_int64(v4, "bleSensorIncreaseScanRate", bleSensorIncreaseScanRate);
      }
      int64_t bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
      if (bleSensorIncreaseScanTimeout) {
        xpc_dictionary_set_int64(v4, "bleSensorIncreaseScanTimeout", bleSensorIncreaseScanTimeout);
      }
      int64_t bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
      if (bleSensorTimeoutBetweenIncreaseScan) {
        xpc_dictionary_set_int64(v4, "bleSensorTimeoutBetweenIncreaseScan", bleSensorTimeoutBetweenIncreaseScan);
      }
      if (self->_denyLowPowerModeScans) {
        xpc_dictionary_set_BOOL(v4, "denyLowPowerModeScans", 1);
      }
      if (self->_denyScreenLockedScans) {
        xpc_dictionary_set_BOOL(v4, "denyScreenLockedScans", 1);
      }
      if (self->_deviceSetupState) {
        xpc_dictionary_set_uint64(v4, "deviceSetupState", self->_deviceSetupState);
      }
      uint64_t v23 = self->_typeToRssiThresholds;
      if (v23) {
        CUXPCEncodeNSArrayOfObjects();
      }

      id v24 = v4;
      return (OS_xpc_object *)v24;
  }
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
  v5[2] = __35__CBDiscovery__activateDirectStart__block_invoke;
  v5[3] = &unk_1E5E315E0;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBDiscovery:completion:", self, v5, clientID);
}

void __35__CBDiscovery__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 160);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CBDiscovery__activateDirectStart__block_invoke_2;
  v7[3] = &unk_1E5E31068;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __35__CBDiscovery__activateDirectStart__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void (**)(void, void))MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = **(_DWORD **)(v5 + 48);
  if (*(void *)(a1 + 40))
  {
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      int v15 = CUPrintNSError();
      LogPrintF_safe();
    }
    if (v2)
    {
      v2[2](v2, *(void *)(a1 + 40));
    }
    else
    {
      uint64_t v7 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 168));
      id v8 = (void *)v7;
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 40));
      }
    }
    goto LABEL_20;
  }
  if (v6 <= 30)
  {
    if (v6 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_15;
      }
      uint64_t v5 = *(void *)(a1 + 32);
    }
    uint64_t v14 = *(unsigned int *)(v5 + 108);
    LogPrintF_safe();
  }
LABEL_15:
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__4;
  int v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  xpc_object_t v9 = objc_msgSend((id)gCBDaemonServer, "deviceMap", v14);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __35__CBDiscovery__activateDirectStart__block_invoke_147;
  v17[3] = &unk_1E5E33EA0;
  v17[4] = *(void *)(a1 + 32);
  v17[5] = &v18;
  [v9 enumerateKeysAndObjectsUsingBlock:v17];

  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), (id)v19[5]);
  objc_sync_exit(v10);

  if (v2) {
    v2[2](v2, 0);
  }
  id v11 = (void *)MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 136));
  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __35__CBDiscovery__activateDirectStart__block_invoke_2_150;
    v16[3] = &unk_1E5E33EC8;
    v16[4] = v12;
    v16[5] = v11;
    [v13 enumerateKeysAndObjectsUsingBlock:v16];
  }

  _Block_object_dispose(&v18, 8);
LABEL_20:
}

void __35__CBDiscovery__activateDirectStart__block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v5 discoveryTypesContainCBDiscovery:*(void *)(a1 + 32)])
  {
    int v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      xpc_object_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      int v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 setObject:v5 forKeyedSubscript:v10];
  }
}

void __35__CBDiscovery__activateDirectStart__block_invoke_2_150(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 48);
  if (v6 <= 15 && (v6 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

BOOL __37__CBDiscovery__activateXPCCompleted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [CBDevice alloc];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [(CBDevice *)v5 initWithXPCObject:v4 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    uint64_t v14 = [(CBDevice *)v7 identifier];
    BOOL v15 = v14 != 0;
    if (v14)
    {
      int v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v16)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        int v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        int v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      [v16 setObject:v7 forKeyedSubscript:v14];
    }
    else
    {
      uint64_t v21 = CBErrorF(-6708, (uint64_t)"No device ID", v8, v9, v10, v11, v12, v13, v24);
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __37__CBDiscovery__activateXPCCompleted___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 48);
  if (v6 <= 15 && (v6 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (NSArray)discoveredDevices
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_deviceMap;
  id v4 = v3;
  if (v3)
  {
    id v5 = [(NSMutableDictionary *)v3 allValues];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  objc_sync_exit(v2);

  return (NSArray *)v5;
}

- (void)finish
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__CBDiscovery_finish__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __21__CBDiscovery_finish__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 48);
  if (*(unsigned char *)(v2 + 46))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "mTyp", "DscF");
    id v5 = [*(id *)(a1 + 32) _ensureXPCStarted];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 160);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __21__CBDiscovery_finish__block_invoke_2;
    handler[3] = &unk_1E5E31608;
    handler[4] = v6;
    xpc_connection_send_message_with_reply(v5, v4, v7, handler);
  }
}

void __21__CBDiscovery_finish__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    CUXPCDecodeObject();
    id v4 = 0;
  }
  if (v4) {
    int v5 = 90;
  }
  else {
    int v5 = 30;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = **(_DWORD **)(v6 + 48);
  if (v5 >= v7)
  {
    if (v7 != -1 || (v8 = _LogCategory_Initialize(), uint64_t v6 = *(void *)(a1 + 32), v8))
    {
      uint64_t v11 = CUPrintNSError();
      LogPrintF_safe();

      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  uint64_t v9 = MEMORY[0x1AD111AA0](*(void *)(v6 + 248));
  uint64_t v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v4);
  }

  [*(id *)(a1 + 32) _invalidate];
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBDiscovery *)self _lostAllDevices];
    uint64_t v4 = MEMORY[0x1AD111AA0](self->_interruptionHandler);
    int v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    self->_bluetoothState = 1;
    uint64_t v6 = MEMORY[0x1AD111AA0](self->_bluetoothStateChangedHandler);
    int v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }

    [(CBDiscovery *)self _activateXPCStart:1];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CBDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CBDiscovery_invalidate__block_invoke(uint64_t a1)
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
    int v7 = self->_mockID;
    if (v7) {
      CBMockRemoveDiscovery(v7, self);
    }
    if (self->_direct) {
      [(CBDiscovery *)self _invalidateDirect];
    }
    uint64_t v4 = self;
    objc_sync_enter(v4);
    int v5 = v4->_xpcCnx;
    uint64_t v6 = v5;
    if (v5) {
      xpc_connection_cancel(v5);
    }

    objc_sync_exit(v4);
    [(CBDiscovery *)v4 _invalidated];
  }
}

- (void)_invalidateDirect
{
}

void __32__CBDiscovery__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 160);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CBDiscovery__invalidateDirect__block_invoke_2;
  block[3] = &unk_1E5E31248;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __32__CBDiscovery__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct)
  {
    id v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      self->_invalidateCalled = 1;
      uint64_t v16 = MEMORY[0x1AD111AA0](v3->_invalidationHandler);
      id bluetoothStateChangedHandler = v3->_bluetoothStateChangedHandler;
      v3->_id bluetoothStateChangedHandler = 0;

      id deviceFoundHandler = v3->_deviceFoundHandler;
      v3->_id deviceFoundHandler = 0;

      id deviceLostHandler = v3->_deviceLostHandler;
      v3->_id deviceLostHandler = 0;

      id devicesBufferedHandler = v3->_devicesBufferedHandler;
      v3->_id devicesBufferedHandler = 0;

      id errorHandler = v3->_errorHandler;
      v3->_id errorHandler = 0;

      id finishHandler = v3->_finishHandler;
      v3->_id finishHandler = 0;

      id interruptionHandler = v3->_interruptionHandler;
      v3->_id interruptionHandler = 0;

      id invalidationHandler = v3->_invalidationHandler;
      v3->_id invalidationHandler = 0;

      id systemOverrideHandler = v3->_systemOverrideHandler;
      v3->_id systemOverrideHandler = 0;

      uint64_t v14 = v16;
      if (v16)
      {
        (*(void (**)(uint64_t))(v16 + 16))(v16);
        uint64_t v14 = v16;
      }
      self->_invalidateDone = 1;
      p_int var0 = &v3->_ucat->var0;
      if (*p_var0 <= 30 && (*p_var0 != -1 || (p_int var0 = (int *)_LogCategory_Initialize(), v14 = v16, p_var0)))
      {
        p_int var0 = (int *)LogPrintF_safe();
        uint64_t v14 = v16;
      }
      else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
      {
        __break(0xC471u);
      }
      MEMORY[0x1F41817F8](p_var0, v14);
    }
  }
}

- (void)_lostAllDevices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_deviceLostHandler, a2);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  deviceMap = v4->_deviceMap;
  if (v3)
  {
    uint64_t v6 = [(NSMutableDictionary *)deviceMap allValues];
    [(NSMutableDictionary *)v4->_deviceMap removeAllObjects];
    objc_sync_exit(v4);

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          int var0 = v4->_ucat->var0;
          if (var0 <= 15 && (var0 != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          v3[2](v3, v11);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v13 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v8 = v13;
      }
      while (v13);
    }
  }
  else
  {
    [(NSMutableDictionary *)deviceMap removeAllObjects];
    objc_sync_exit(v4);
  }
}

- (void)reportMockDeviceFound:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CBDiscovery_reportMockDeviceFound___block_invoke;
  v7[3] = &unk_1E5E31068;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __37__CBDiscovery_reportMockDeviceFound___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 46))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 48);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 32), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }
    uint64_t result = *(void *)(v1 + 136);
    if (result)
    {
      int v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

- (void)reportMockDeviceLost:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CBDiscovery_reportMockDeviceLost___block_invoke;
  v7[3] = &unk_1E5E31068;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __36__CBDiscovery_reportMockDeviceLost___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 46))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 48);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 32), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }
    uint64_t result = *(void *)(v1 + 144);
    if (result)
    {
      int v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

uint64_t __40__CBDiscovery__updateIfNeededWithBlock___block_invoke(uint64_t a1)
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
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      if (!v2->_direct)
      {
        xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
        [(CBDiscovery *)v2 encodeWithXPCObject:xdict];
        xpc_dictionary_set_string(xdict, "mTyp", "DscU");
        int v5 = [(CBDiscovery *)v2 _ensureXPCStarted];
        xpc_connection_send_message(v5, xdict);
      }
    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)_xpcReceivedDevicesBuffered:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    id v5 = 0;
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintNSError();
      LogPrintF_safe();
    }
    goto LABEL_4;
  }
  int v6 = self->_ucat->var0;
  if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
  {
LABEL_4:

    return;
  }
  LogPrintF_safe();
}

- (void)_xpcReceivedPowerStateChanged:(id)a3
{
  xpc_object_t xdict = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(xdict, "pwrS");
    uint64_t v4 = MEMORY[0x1AD111AA0](self->_bluetoothStateChangedHandler);
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    goto LABEL_5;
  }
  int var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_5:
    int v6 = xdict;
    goto LABEL_7;
  }
  LogPrintF_safe();
  int v6 = xdict;

LABEL_7:
}

- (void)_xpcReceivedSystemOverrideChanged:(id)a3
{
  xpc_object_t xdict = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    self->_bleScanRateOverride = xpc_dictionary_get_int64(xdict, "scRO");
    self->_systemOverrideFlags = xpc_dictionary_get_uint64(xdict, "syOF");
    uint64_t v4 = MEMORY[0x1AD111AA0](self->_systemOverrideHandler);
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    goto LABEL_5;
  }
  int var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_5:
    int v6 = xdict;
    goto LABEL_7;
  }
  LogPrintF_safe();
  int v6 = xdict;

LABEL_7:
}

BOOL __56__CBDiscovery_devicesWithDiscoveryFlags_endpoint_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [CBDevice alloc];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [(CBDevice *)v5 initWithXPCObject:v4 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }

  return v7 != 0;
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (id)devicesBufferedHandler
{
  return self->_devicesBufferedHandler;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
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

- (unsigned)systemOverrideFlags
{
  return self->_systemOverrideFlags;
}

- (void)setSystemOverrideFlags:(unsigned int)a3
{
  self->_systemOverrideFlags = a3;
}

- (id)systemOverrideHandler
{
  return self->_systemOverrideHandler;
}

- (NSArray)useCaseClientIDs
{
  return self->_useCaseClientIDs;
}

- (void)setBleRSSIThresholdHint:(char)a3
{
  self->_uint64_t bleRSSIThresholdHint = a3;
}

- (unsigned)bleRSSIThresholdOrder
{
  return self->_bleRSSIThresholdOrder;
}

- (void)setBleRSSIThresholdOrder:(unsigned __int8)a3
{
  self->_int bleRSSIThresholdOrder = a3;
}

- (void)setBleScanRateOverride:(int)a3
{
  self->_bleScanRateOverride = a3;
}

- (unint64_t)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unint64_t)a3
{
  self->_changeFlags = a3;
}

- (id)finishHandler
{
  return self->_finishHandler;
}

- (void)setFinishHandler:(id)a3
{
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
}

- (NSArray)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (char)bleSensorRssiIncreaseScanThreshold
{
  return self->_bleSensorRssiIncreaseScanThreshold;
}

- (void)setBleSensorRssiIncreaseScanThreshold:(char)a3
{
  self->_uint64_t bleSensorRssiIncreaseScanThreshold = a3;
}

- (BOOL)bleSensorEnableRssiIncreaseScan
{
  return self->_bleSensorEnableRssiIncreaseScan;
}

- (void)setBleSensorEnableRssiIncreaseScan:(BOOL)a3
{
  self->_BOOL bleSensorEnableRssiIncreaseScan = a3;
}

- (unsigned)bleSensorIncreaseScanRate
{
  return self->_bleSensorIncreaseScanRate;
}

- (void)setBleSensorIncreaseScanRate:(unsigned int)a3
{
  self->_int64_t bleSensorIncreaseScanRate = a3;
}

- (unsigned)bleSensorIncreaseScanTimeout
{
  return self->_bleSensorIncreaseScanTimeout;
}

- (void)setBleSensorIncreaseScanTimeout:(unsigned int)a3
{
  self->_int64_t bleSensorIncreaseScanTimeout = a3;
}

- (unsigned)bleSensorTimeoutBetweenIncreaseScan
{
  return self->_bleSensorTimeoutBetweenIncreaseScan;
}

- (void)setBleSensorTimeoutBetweenIncreaseScan:(unsigned int)a3
{
  self->_int64_t bleSensorTimeoutBetweenIncreaseScan = a3;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (void)setDenyLowPowerModeScans:(BOOL)a3
{
  self->_denyLowPowerModeScans = a3;
}

- (void)setDenyScreenLockedScans:(BOOL)a3
{
  self->_denyScreenLockedScans = a3;
}

- (void)setDeviceSetupState:(unsigned __int8)a3
{
  self->_deviceSetupState = a3;
}

- (void)setDisabledActive:(BOOL)a3
{
  self->_disabledActive = a3;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_uint64_t internalFlags = a3;
}

- (BOOL)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(BOOL)a3
{
  self->_keepAlive = a3;
}

- (unsigned)memoryPressureFlags
{
  return self->_memoryPressureFlags;
}

- (void)setMemoryPressureFlags:(unsigned int)a3
{
  self->_unsigned int memoryPressureFlags = a3;
}

- (CBSpatialInteractionFilter)spatialInteractionfilter
{
  return self->_spatialInteractionfilter;
}

- (void)setSpatialInteractionfilter:(id)a3
{
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
  objc_storeStrong((id *)&self->_spatialInteractionfilter, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_typeToRssiThresholds, 0);
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
  objc_storeStrong((id *)&self->_oobKeys, 0);
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong(&self->_finishHandler, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong((id *)&self->_useCaseClientIDs, 0);
  objc_storeStrong(&self->_systemOverrideHandler, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_devicesBufferedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end