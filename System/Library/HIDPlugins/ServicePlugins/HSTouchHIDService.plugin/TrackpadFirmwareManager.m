@interface TrackpadFirmwareManager
- (BOOL)builtIn;
- (NSDictionary)debug;
- (NSNumber)criticalErrors;
- (NSNumber)extendedFeatures;
- (NSNumber)productId;
- (NSString)transport;
- (TrackpadFirmwareManager)initWithDevice:(__MTDevice *)a3;
- (__MTDevice)mtDeviceRef;
- (id)mtfwScanRate;
- (int)_setReportIntervalUs:(unsigned __int16)a3;
- (unint64_t)mtDeviceId;
- (void)_dispatchHIDEvent:(id)a3;
- (void)_dispatchReportIntervalChangedEvent:(unsigned __int16)a3;
- (void)_handleGetDebugEvent:(id)a3;
- (void)_handleHSTNotificationEvent:(id)a3;
- (void)_handleResetEvent:(id)a3;
- (void)_sendRegistryPropertiesContinuousRecording;
- (void)_updateDeviceScanRate;
- (void)handleConsume:(id)a3;
- (void)handleSetPropertyEvent:(id)a3;
- (void)registryPropertyForKey:(id)a3;
- (void)setBuiltIn:(BOOL)a3;
- (void)setExtendedFeatures:(id)a3;
- (void)setMtDeviceId:(unint64_t)a3;
- (void)setProductId:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation TrackpadFirmwareManager

- (TrackpadFirmwareManager)initWithDevice:(__MTDevice *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TrackpadFirmwareManager;
  v4 = [(HSStage *)&v9 init];
  productId = v4->_productId;
  v4->_productId = 0;

  v4->_mtDeviceId = 0;
  v4->_mtDeviceRef = a3;
  transport = v4->_transport;
  v4->_transport = 0;

  v4->_builtIn = 0;
  extendedFeatures = v4->_extendedFeatures;
  v4->_extendedFeatures = 0;

  return v4;
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    [(TrackpadFirmwareManager *)self handleSetPropertyEvent:v4];
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      [(TrackpadFirmwareManager *)self _handleResetEvent:v6];
    }
    else
    {
      id v8 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        [(TrackpadFirmwareManager *)self _handleHSTNotificationEvent:v8];
      }
      else
      {
        id v10 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }

        if (v11)
        {
          [(TrackpadFirmwareManager *)self _handleGetDebugEvent:v10];
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)TrackpadFirmwareManager;
          [(HSStage *)&v12 handleConsume:v10];
        }
      }
    }
  }
}

- (void)handleSetPropertyEvent:(id)a3
{
  id v4 = (id *)a3;
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v6 = v4[5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if ([v5 isEqualToString:@"HCRNewFilePath"]) {
    [(TrackpadFirmwareManager *)self _sendRegistryPropertiesContinuousRecording];
  }
  v8.receiver = self;
  v8.super_class = (Class)TrackpadFirmwareManager;
  [(HSStage *)&v8 handleConsume:v4];
}

- (void)_handleResetEvent:(id)a3
{
  id v4 = a3;
  [(TrackpadFirmwareManager *)self _updateDeviceScanRate];
  v5.receiver = self;
  v5.super_class = (Class)TrackpadFirmwareManager;
  [(HSStage *)&v5 handleConsume:v4];
}

- (void)_handleHSTNotificationEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 notification];
  if (v5 <= 0xB && ((1 << v5) & 0x902) != 0) {
    [(TrackpadFirmwareManager *)self _updateDeviceScanRate];
  }
  v7.receiver = self;
  v7.super_class = (Class)TrackpadFirmwareManager;
  [(HSStage *)&v7 handleConsume:v4];
}

- (void)_handleGetDebugEvent:(id)a3
{
  id v4 = a3;
  v4[16] = 1;
  unsigned int v5 = (void *)*((void *)v4 + 3);
  id v6 = [(TrackpadFirmwareManager *)self debug];
  [v5 addObject:v6];

  v7.receiver = self;
  v7.super_class = (Class)TrackpadFirmwareManager;
  [(HSStage *)&v7 handleConsume:v4];
}

- (void)_sendRegistryPropertiesContinuousRecording
{
  kern_return_t v4;
  CFMutableDictionaryRef v5;
  BOOL v6;
  CFDataRef v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;

  properties = 0;
  io_registry_entry_t Service = MTDeviceGetService();
  id v4 = IORegistryEntryCreateCFProperties(Service, &properties, kCFAllocatorDefault, 0);
  unsigned int v5 = properties;
  if (v4) {
    id v6 = 1;
  }
  else {
    id v6 = properties == 0;
  }
  if (!v6)
  {
    objc_super v7 = IOCFSerialize(properties, 1uLL);
    if (v7)
    {
      buf[0] = -1;
      objc_super v8 = objc_opt_new();
      [v8 appendBytes:buf length:1];
      [v8 appendData:v7];
      id v9 = mach_absolute_time();
      id v10 = v8;
      LODWORD(v13) = 0;
      id v11 = +[HIDEvent vendorDefinedEvent:usagePage:usage:version:data:length:options:](HIDEvent, "vendorDefinedEvent:usagePage:usage:version:data:length:options:", v9, 65308, 256, 1, [v10 bytes], objc_msgSend(v10, "length"), v13);
      [(TrackpadFirmwareManager *)self _dispatchHIDEvent:v11];
    }
    else
    {
      objc_super v12 = MTLoggingPlugin();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "[Error] ";
        v17 = 2080;
        v18 = "";
        v19 = 2080;
        v20 = "-[TrackpadFirmwareManager _sendRegistryPropertiesContinuousRecording]";
        _os_log_impl(&def_411C8, v12, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Error serializing registry properties dictionary", buf, 0x20u);
      }
    }
  }
}

- (void)_updateDeviceScanRate
{
  if (_os_feature_enabled_impl())
  {
    id v5 = [(TrackpadFirmwareManager *)self extendedFeatures];
    unsigned int v3 = [v5 unsignedIntValue];

    id v6 = [(TrackpadFirmwareManager *)self transport];
    if (([v6 isEqualToString:@"USB"] & v3) == 1)
    {
      unsigned __int8 v4 = [(TrackpadFirmwareManager *)self builtIn];

      if ((v4 & 1) == 0)
      {
        [(TrackpadFirmwareManager *)self _setReportIntervalUs:15000];
      }
    }
    else
    {
    }
  }
}

- (int)_setReportIntervalUs:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (![(TrackpadFirmwareManager *)self mtDeviceRef])
  {
    objc_super v8 = +[NSAssertionHandler currentHandler];
    id v9 = +[NSString stringWithUTF8String:"IOReturn HSTPipeline::FirmwareUtil::SetReport(MTDeviceRef _Nonnull, const T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::MTScanRate]"];
    [v8 handleFailureInFunction:v9, @"FirmwareUtil.h", 9, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  int v5 = MTDeviceSetReport();
  if (!v5)
  {
    [(TrackpadFirmwareManager *)self mtDeviceRef];
    MTDeviceGetDeviceID();
    id v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v11 = v3;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "Successfully changed the device report rate to %u (deviceID 0x%llX)", buf, 0x12u);
    }

    [(TrackpadFirmwareManager *)self _dispatchReportIntervalChangedEvent:v3];
  }
  return v5;
}

- (void)_dispatchReportIntervalChangedEvent:(unsigned __int16)a3
{
  CFStringRef v22 = @"ReportInterval";
  unsigned __int8 v4 = +[NSNumber numberWithUnsignedShort:a3];
  v23 = v4;
  int v5 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  id v6 = (void *)_mthid_serializePropertiesEvent();
  if (v6)
  {
    uint64_t v7 = mach_absolute_time();
    id v8 = v6;
    LODWORD(v11) = 0;
    id v9 = +[HIDEvent vendorDefinedEvent:usagePage:usage:version:data:length:options:](HIDEvent, "vendorDefinedEvent:usagePage:usage:version:data:length:options:", v7, 65280, 91, 1, [v8 bytes], objc_msgSend(v8, "length"), v11);
    id v10 = MTLoggingPlugin();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = "[Debug] ";
      __int16 v14 = 2080;
      v15 = "";
      __int16 v16 = 2080;
      v17 = "-[TrackpadFirmwareManager _dispatchReportIntervalChangedEvent:]";
      __int16 v18 = 2048;
      unint64_t v19 = [(TrackpadFirmwareManager *)self mtDeviceId];
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl(&def_411C8, v10, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s [0x%llX] Dispatching properties event %@", buf, 0x34u);
    }

    [(TrackpadFirmwareManager *)self _dispatchHIDEvent:v9];
  }
  else
  {
    id v9 = MTLoggingPlugin();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = "[Error] ";
      __int16 v14 = 2080;
      v15 = "";
      __int16 v16 = 2080;
      v17 = "-[TrackpadFirmwareManager _dispatchReportIntervalChangedEvent:]";
      __int16 v18 = 2048;
      unint64_t v19 = [(TrackpadFirmwareManager *)self mtDeviceId];
      _os_log_impl(&def_411C8, v9, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [0x%llX] Failed to serialize report rate update properties dictionary", buf, 0x2Au);
    }
  }
}

- (void)_dispatchHIDEvent:(id)a3
{
  uint64_t v7 = a3;
  if (v7)
  {
    unsigned __int8 v4 = (char **)objc_opt_new();
    std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](v4 + 1, (id *)&v7);
    v6.receiver = self;
    v6.super_class = (Class)TrackpadFirmwareManager;
    [(HSStage *)&v6 handleConsume:v4];

    int v5 = v7;
  }
  else
  {
    int v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v9 = "[Error] ";
      __int16 v10 = 2080;
      uint64_t v11 = "";
      __int16 v12 = 2080;
      uint64_t v13 = "-[TrackpadFirmwareManager _dispatchHIDEvent:]";
      __int16 v14 = 2048;
      unint64_t v15 = [(TrackpadFirmwareManager *)self mtDeviceId];
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [0x%llX] Unable to dispatch nil HID event", buf, 0x2Au);
    }
  }
}

- (void)registryPropertyForKey:(id)a3
{
  unsigned __int8 v4 = (__CFString *)a3;
  [(TrackpadFirmwareManager *)self mtDeviceRef];
  io_registry_entry_t Service = MTDeviceGetService();
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(Service, v4, kCFAllocatorDefault, 0);

  return (void *)CFProperty;
}

- (NSNumber)productId
{
  productId = self->_productId;
  if (!productId)
  {
    unsigned __int8 v4 = [(TrackpadFirmwareManager *)self registryPropertyForKey:@"ProductID"];
    int v5 = self->_productId;
    self->_productId = v4;

    productId = self->_productId;
  }

  return productId;
}

- (unint64_t)mtDeviceId
{
  unint64_t result = self->_mtDeviceId;
  if (!result)
  {
    unsigned __int8 v4 = [(TrackpadFirmwareManager *)self registryPropertyForKey:@"Multitouch ID"];
    self->_mtDeviceId = [v4 unsignedIntValue];

    return self->_mtDeviceId;
  }
  return result;
}

- (NSNumber)criticalErrors
{
  [(TrackpadFirmwareManager *)self mtDeviceRef];
  int CriticalErrors = MTDeviceGetCriticalErrors();
  if (CriticalErrors)
  {
    unsigned __int8 v4 = MTLoggingPlugin();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v8 = "[Error] ";
      __int16 v9 = 2080;
      __int16 v10 = "";
      __int16 v11 = 2080;
      __int16 v12 = "-[TrackpadFirmwareManager criticalErrors]";
      __int16 v13 = 2048;
      unint64_t v14 = [(TrackpadFirmwareManager *)self mtDeviceId];
      __int16 v15 = 1024;
      int v16 = CriticalErrors;
      _os_log_impl(&def_411C8, v4, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [0x%llX] Failed to fetch critical errors with error: 0x%08x", buf, 0x30u);
    }
  }
  id v5 = [objc_alloc((Class)NSNumber) initWithInt:0];

  return (NSNumber *)v5;
}

- (NSString)transport
{
  if (!self->_transport)
  {
    uint64_t v3 = [(TrackpadFirmwareManager *)self registryPropertyForKey:@"Transport"];
    transport = self->_transport;
    self->_transport = v3;

    if ([(NSString *)self->_transport isEqualToString:@"BluetoothLowEnergy"])
    {
      id v5 = self->_transport;
      self->_transport = (NSString *)@"Bluetooth";
    }
  }
  objc_super v6 = self->_transport;

  return v6;
}

- (BOOL)builtIn
{
  if (self->_builtIn) {
    return 1;
  }
  unsigned __int8 v4 = [(TrackpadFirmwareManager *)self registryPropertyForKey:@"Built-In"];
  self->_builtIn = [v4 BOOLValue];

  return self->_builtIn;
}

- (NSNumber)extendedFeatures
{
  extendedFeatures = self->_extendedFeatures;
  if (!extendedFeatures)
  {
    unsigned __int8 v4 = [(TrackpadFirmwareManager *)self registryPropertyForKey:@"ExtendedFeatures"];
    id v5 = self->_extendedFeatures;
    self->_extendedFeatures = v4;

    extendedFeatures = self->_extendedFeatures;
  }

  return extendedFeatures;
}

- (id)mtfwScanRate
{
  if (![(TrackpadFirmwareManager *)self mtDeviceRef])
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    unsigned __int8 v4 = +[NSString stringWithUTF8String:"IOReturn HSTPipeline::FirmwareUtil::GetReport(MTDeviceRef _Nonnull, T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::MTScanRate]"];
    [v3 handleFailureInFunction:v4, @"FirmwareUtil.h", 17, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
  }
  MTDeviceGetReport();

  return 0;
}

- (NSDictionary)debug
{
  uint64_t v3 = objc_opt_new();
  unsigned __int8 v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKeyedSubscript:@"Stage"];

  objc_super v6 = [(TrackpadFirmwareManager *)self productId];
  [v3 setObject:v6 forKeyedSubscript:@"Product"];

  uint64_t v7 = [(TrackpadFirmwareManager *)self criticalErrors];
  [v3 setObject:v7 forKeyedSubscript:@"CriticalErrors"];

  id v8 = +[NSNumber numberWithUnsignedLongLong:[(TrackpadFirmwareManager *)self mtDeviceId]];
  [v3 setObject:v8 forKeyedSubscript:@"MTDeviceID"];

  uint64_t v9 = [(TrackpadFirmwareManager *)self transport];
  __int16 v10 = (void *)v9;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  else {
    CFStringRef v11 = @"Unknown";
  }
  [v3 setObject:v11 forKeyedSubscript:@"Transport"];

  __int16 v12 = +[NSNumber numberWithBool:[(TrackpadFirmwareManager *)self builtIn]];
  [v3 setObject:v12 forKeyedSubscript:@"BuiltIn"];

  __int16 v13 = [(TrackpadFirmwareManager *)self extendedFeatures];
  [v3 setObject:v13 forKeyedSubscript:@"ExtendedFeatures"];

  unint64_t v14 = [(TrackpadFirmwareManager *)self mtfwScanRate];
  [v3 setObject:v14 forKeyedSubscript:@"FWScanRate"];

  id v15 = [v3 copy];

  return (NSDictionary *)v15;
}

- (__MTDevice)mtDeviceRef
{
  return self->_mtDeviceRef;
}

- (void)setProductId:(id)a3
{
}

- (void)setMtDeviceId:(unint64_t)a3
{
  self->_mtDeviceId = a3;
}

- (void)setExtendedFeatures:(id)a3
{
}

- (void)setTransport:(id)a3
{
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_extendedFeatures, 0);

  objc_storeStrong((id *)&self->_productId, 0);
}

@end