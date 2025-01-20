@interface CBALSNode
- (BOOL)conformsToHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)getDigitizerFilterWindow;
- (BOOL)getSupportsFloatLuxValue;
- (BOOL)getUseProxForOcclusion;
- (BOOL)handleALSEvent:(id)a3;
- (BOOL)isColorSupported;
- (BOOL)supportsFloatLux;
- (BOOL)useProxForOcclusion;
- (CBALSEvent)currentALSEvent;
- (CBALSHotspotLocation)overrideHotspot;
- (CBALSNode)initWithALSServiceClient:(__IOHIDServiceClient *)a3;
- (__IOHIDEvent)copyEvent;
- (__IOHIDServiceClient)alsService;
- (id)copyALSEvent;
- (id)copyALSEventWithinTimeout:(float)a3;
- (id)copyHotspotLocation;
- (id)description;
- (int)fastIntegrationTime;
- (int)orientation;
- (int)placement;
- (int)sensorType;
- (int)slowIntegrationTime;
- (int)superFastIntegrationTime;
- (int64_t)digitizerFilterWindow;
- (void)dealloc;
- (void)initALSProperties;
- (void)setCurrentALSEvent:(id)a3;
- (void)setReportInterval:(int)a3;
@end

@implementation CBALSNode

- (BOOL)handleALSEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v6 = 0;
  if (a3 && (__IOHIDServiceClient *)[a3 service] == self->_alsService)
  {
    if (self->_currentALSEvent) {

    }
    else {
      [a3 setFirstALSSample:1];
    }
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)a3);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "%@", v9, 0xCu);
    }
    self->_currentALSEvent = (CBALSEvent *)a3;
    char v6 = 1;
  }
  return v6 & 1;
}

- (BOOL)supportsFloatLux
{
  return self->_supportsFloatLux;
}

- (int)orientation
{
  return self->_orientation;
}

- (__IOHIDServiceClient)alsService
{
  return self->_alsService;
}

- (CBALSNode)initWithALSServiceClient:(__IOHIDServiceClient *)a3
{
  v19 = self;
  SEL v18 = a2;
  v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CBALSNode;
  v19 = [(CBALSNode *)&v16 init];
  if (v19)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBALSNode", "default");
    v19->_logHandle = (OS_os_log *)v3;
    if (!v19->_logHandle)
    {
      v15 = 0;
      uint64_t v10 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v15 = v10;
      char v14 = 16;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        log = v15;
        os_log_type_t type = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v13, 2u);
      }
    }
    v19->_alsService = v17;
    CFRetain(v19->_alsService);
    v19->_alsIOService = 0;
    uint64_t valuePtr = 0;
    CFNumberRef number = (const __CFNumber *)IOHIDServiceClientGetRegistryID(v19->_alsService);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
      if (valuePtr)
      {
        mach_port_t mainPort = *MEMORY[0x1E4F2EEF0];
        CFDictionaryRef v4 = IORegistryEntryIDMatching(valuePtr);
        io_service_t MatchingService = IOServiceGetMatchingService(mainPort, v4);
        v19->_alsIOService = MatchingService;
      }
    }
    [(CBALSNode *)v19 initALSProperties];
  }
  return v19;
}

- (void)initALSProperties
{
  v56 = self;
  SEL v55 = a2;
  self->_orientation = 0;
  v56->_placement = 0;
  v56->_sensorType = 0;
  v56->_superFastIntegrationTime = 99000;
  v56->_fastIntegrationTime = 100000;
  v56->_slowIntegrationTime = 250000;
  v56->_colorSupport = 0;
  CFNumberRef v54 = 0;
  CFNumberRef v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, @"Orientation");
  if (v54 && (CFTypeID v35 = CFGetTypeID(v54), v35 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_orientation);
  }
  else
  {
    v53 = 0;
    if (v56->_logHandle)
    {
      logHandle = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    v53 = logHandle;
    char v52 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      v31 = v53;
      os_log_type_t v32 = v52;
      __os_log_helper_16_0_0(v51);
      _os_log_error_impl(&dword_1BA438000, v31, v32, "Failed to load ALS orientation.", v51, 2u);
    }
  }
  if (v54) {
    CFRelease(v54);
  }
  CFNumberRef v54 = 0;
  CFNumberRef v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, @"Placement");
  if (v54 && (CFTypeID v30 = CFGetTypeID(v54), v30 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_placement);
  }
  else
  {
    v50 = 0;
    if (v56->_logHandle)
    {
      v29 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v28 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v28 = init_default_corebrightness_log();
      }
      v29 = v28;
    }
    v50 = v29;
    char v49 = 16;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      log = v50;
      os_log_type_t type = v49;
      __os_log_helper_16_0_0(v48);
      _os_log_error_impl(&dword_1BA438000, log, type, "Failed to load ALS placement.", v48, 2u);
    }
  }
  if (v54) {
    CFRelease(v54);
  }
  CFNumberRef v54 = 0;
  CFNumberRef v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, @"ALSSensorType");
  if (v54 && (CFTypeID v25 = CFGetTypeID(v54), v25 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_sensorType);
  }
  else
  {
    v47 = 0;
    if (v56->_logHandle)
    {
      v24 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v23 = init_default_corebrightness_log();
      }
      v24 = v23;
    }
    v47 = v24;
    char v46 = 16;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v21 = v47;
      os_log_type_t v22 = v46;
      __os_log_helper_16_0_0(v45);
      _os_log_error_impl(&dword_1BA438000, v21, v22, "Failed to load ALS sensor type.", v45, 2u);
    }
  }
  if (v54) {
    CFRelease(v54);
  }
  CFNumberRef v54 = 0;
  CFNumberRef v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, @"ALSFastIntegrationTime");
  if (v54 && (CFTypeID v20 = CFGetTypeID(v54), v20 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_fastIntegrationTime);
  }
  else
  {
    v44 = 0;
    if (v56->_logHandle)
    {
      v19 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v18 = init_default_corebrightness_log();
      }
      v19 = v18;
    }
    v44 = v19;
    char v43 = 16;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_super v16 = v44;
      os_log_type_t v17 = v43;
      __os_log_helper_16_0_0(v42);
      _os_log_error_impl(&dword_1BA438000, v16, v17, "Failed to load ALS fast integration time.", v42, 2u);
    }
  }
  if (v54) {
    CFRelease(v54);
  }
  CFNumberRef v54 = 0;
  CFNumberRef v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, @"ALSSuperFastIntegrationTime");
  if (v54 && (CFTypeID v15 = CFGetTypeID(v54), v15 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_superFastIntegrationTime);
  }
  else
  {
    v41 = 0;
    if (v56->_logHandle)
    {
      char v14 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v13 = init_default_corebrightness_log();
      }
      char v14 = v13;
    }
    v41 = v14;
    char v40 = 16;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v11 = v41;
      os_log_type_t v12 = v40;
      __os_log_helper_16_0_0(v39);
      _os_log_error_impl(&dword_1BA438000, v11, v12, "Failed to load ALS super fast integration time.", v39, 2u);
    }
  }
  if (v54) {
    CFRelease(v54);
  }
  CFNumberRef v54 = 0;
  CFNumberRef v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, @"ALSSlowIntegrationTime");
  if (v54 && (CFTypeID v10 = CFGetTypeID(v54), v10 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_slowIntegrationTime);
  }
  else
  {
    v38 = 0;
    if (v56->_logHandle)
    {
      v9 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v8 = init_default_corebrightness_log();
      }
      v9 = v8;
    }
    v38 = v9;
    char v37 = 16;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v6 = v38;
      os_log_type_t v7 = v37;
      __os_log_helper_16_0_0(v36);
      _os_log_error_impl(&dword_1BA438000, v6, v7, "Failed to load ALS slow integration time.", v36, 2u);
    }
  }
  if (v54) {
    CFRelease(v54);
  }
  CFNumberRef v54 = 0;
  uint64_t v2 = [(CBALSNode *)v56 copyHotspotLocation];
  v56->_overrideHotspot = (CBALSHotspotLocation *)v2;
  BOOL v3 = [(CBALSNode *)v56 getUseProxForOcclusion];
  v56->_useProxForOcclusion = v3;
  BOOL v4 = [(CBALSNode *)v56 getDigitizerFilterWindow];
  v56->_digitizerFilterWindow = v4;
  BOOL v5 = [(CBALSNode *)v56 getSupportsFloatLuxValue];
  v56->_supportsFloatLux = v5;
  [(CBALSNode *)v56 isColorSupported];
}

- (BOOL)isColorSupported
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFTypeID v10 = self;
  SEL v9 = a2;
  if (CBU_IsR2RSupported())
  {
    v10->_colorSupport = 1;
  }
  else
  {
    CFNumberRef v8 = 0;
    CFNumberRef v8 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v10->_alsService, @"crgb");
    if (v8)
    {
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v8))
      {
        int valuePtr = 0;
        CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
        v10->_colorSupport = valuePtr != 0;
      }
    }
    if (v8) {
      CFRelease(v8);
    }
  }
  if (v10->_logHandle)
  {
    logHandle = v10->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    if (v10->_colorSupport) {
      uint64_t v2 = "";
    }
    else {
      uint64_t v2 = "NOT";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)v2);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "ALS Color support is %s available", v11, 0xCu);
  }
  return v10->_colorSupport;
}

- (BOOL)getUseProxForOcclusion
{
  char v6 = self;
  SEL v5 = a2;
  BOOL v4 = 1;
  if (self->_alsIOService)
  {
    int v3 = 0;
    if (load_int_from_edt(v6->_alsIOService, @"use-prox-for-occlusion", &v3)) {
      return v3 != 0;
    }
  }
  return v4;
}

- (BOOL)getSupportsFloatLuxValue
{
  char v6 = self;
  SEL v5 = a2;
  BOOL v4 = 0;
  if (self->_alsIOService)
  {
    int v3 = 0;
    if (load_int_from_edt(v6->_alsIOService, @"supports-float-lux", &v3)) {
      return v3 != 0;
    }
  }
  return v4;
}

- (BOOL)getDigitizerFilterWindow
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFNumberRef v8 = self;
  SEL v7 = a2;
  uint64_t v6 = 0;
  if (self->_alsIOService)
  {
    unsigned int v5 = 0x7FFFFFFF;
    if (load_int_from_edt(v8->_alsIOService, @"digitizer-filter-window-type", &v5))
    {
      if (v5 > 1)
      {
        if (v8->_logHandle)
        {
          logHandle = v8->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v9, v5);
          _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "%d", v9, 8u);
        }
      }
      else
      {
        uint64_t v6 = (int)v5;
      }
    }
  }
  return v6 != 0;
}

- (void)dealloc
{
  BOOL v4 = self;
  SEL v3 = a2;

  if (v4->_alsService) {
    CFRelease(v4->_alsService);
  }
  if (v4->_alsIOService) {
    IOObjectRelease(v4->_alsIOService);
  }
  if (v4->_overrideHotspot) {

  }
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBALSNode;
  [(CBALSNode *)&v2 dealloc];
}

- (id)copyHotspotLocation
{
  SEL v7 = 0;
  if (self->_alsIOService)
  {
    float fixed_float_from_edt = load_fixed_float_from_edt(self->_alsIOService, @"hotspot-center-x");
    float v5 = load_fixed_float_from_edt(self->_alsIOService, @"hotspot-center-y");
    SEL v7 = objc_alloc_init(CBALSHotspotLocation);
    *(float *)&double v2 = fixed_float_from_edt;
    [(CBALSHotspotLocation *)v7 setX:v2];
    *(float *)&double v3 = v5;
    [(CBALSHotspotLocation *)v7 setY:v3];
  }
  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"orientation:%d placement:%d useProx:%d digitizerFilterType:%d hotspot:[%@]", self->_orientation, self->_placement, -[CBALSNode useProxForOcclusion](self, "useProxForOcclusion"), -[CBALSNode digitizerFilterWindow](self, "digitizerFilterWindow"), -[CBALSNode overrideHotspot](self, "overrideHotspot")];
}

- (BOOL)conformsToHIDServiceClient:(__IOHIDServiceClient *)a3
{
  return a3 == self->_alsService;
}

- (__IOHIDEvent)copyEvent
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  if (self->_colorSupport)
  {
    memset(&v10[15], 0, 0xA9uLL);
    mach_absolute_time();
    CFTypeRef cf = (CFTypeRef)IOHIDEventCreateVendorDefinedEvent();
    if (!cf) {
      return 0;
    }
  }
  uint64_t v6 = (__IOHIDEvent *)IOHIDServiceClientCopyEvent();
  if (cf) {
    CFRelease(cf);
  }
  float v5 = [[CBALSEvent alloc] initWithHIDEvent:v6 andNode:self];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v10, (uint64_t)v5);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Copied ALS: %{public}@", v10, 0xCu);
  }

  return v6;
}

- (id)copyALSEvent
{
  CFTypeRef cf = [(CBALSNode *)self copyEvent];
  if (!cf) {
    return 0;
  }
  double v3 = [[CBALSEvent alloc] initWithHIDEvent:cf andNode:self];
  CFRelease(cf);
  return v3;
}

- (id)copyALSEventWithinTimeout:(float)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [(CBALSNode *)self copyEvent];
  if (!v10) {
    return 0;
  }
  SEL v9 = [[CBALSEvent alloc] initWithHIDEvent:v10 andNode:self];
  CFRelease(v10);
  float v8 = mach_time_now_in_seconds();
  [(CBHIDEvent *)v9 timestamp];
  if (fabs((float)(v3 - v8)) >= a3)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      [(CBHIDEvent *)v9 timestamp];
      __os_log_helper_16_0_1_8_0((uint64_t)v14, COERCE__INT64(fabs((float)(v4 - v8))));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Copied ALS event is stale (%f secs).", v14, 0xCu);
    }

    return 0;
  }
  return v9;
}

- (void)setReportInterval:(int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  float v8 = self;
  SEL v7 = a2;
  int valuePtr = a3;
  if (self->_logHandle)
  {
    logHandle = v8->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_4_0_8_64((uint64_t)v9, valuePtr, (uint64_t)v8);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Setting report interval to %d for ALS: %@", v9, 0x12u);
  }
  CFNumberRef property = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (property)
  {
    IOHIDServiceClientSetProperty(v8->_alsService, @"ReportInterval", property);
    CFRelease(property);
  }
}

- (CBALSEvent)currentALSEvent
{
  return self->_currentALSEvent;
}

- (void)setCurrentALSEvent:(id)a3
{
}

- (int)placement
{
  return self->_placement;
}

- (int)sensorType
{
  return self->_sensorType;
}

- (int)superFastIntegrationTime
{
  return self->_superFastIntegrationTime;
}

- (int)fastIntegrationTime
{
  return self->_fastIntegrationTime;
}

- (int)slowIntegrationTime
{
  return self->_slowIntegrationTime;
}

- (CBALSHotspotLocation)overrideHotspot
{
  return self->_overrideHotspot;
}

- (BOOL)useProxForOcclusion
{
  return self->_useProxForOcclusion;
}

- (int64_t)digitizerFilterWindow
{
  return self->_digitizerFilterWindow;
}

@end