@interface CBDisplayModuleHIDiOS
- (BOOL)getNits:(float *)a3;
- (BOOL)handleDisplayBrightnessProperty:(id)a3;
- (BOOL)handleDisplayLinearBrightnessProperty:(id)a3;
- (BOOL)handleDisplayProductIDProperty:(id)a3;
- (BOOL)handleDisplayVendorIDProperty:(id)a3;
- (BOOL)setLinearBrightness:(float)a3;
- (BOOL)setNits:(float)a3;
- (BOOL)setNits:(float)a3 withPeriod:(float)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)setSlider:(float)a3;
- (CBDisplayModuleHIDiOS)initWithDevice:(unsigned int)a3 andQueue:(id)a4;
- (float)getLinearBrightness;
- (float)getNitsForUserBrightness:(float)a3;
- (float)getUserBrightnessForNits:(float)a3;
- (id)copyIdentifiers;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (id)copyPropertyInternalForKey:(id)a3;
- (id)newDisplayBrightnessData;
- (unint64_t)PID;
- (unint64_t)VID;
- (void)dealloc;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation CBDisplayModuleHIDiOS

- (CBDisplayModuleHIDiOS)initWithDevice:(unsigned int)a3 andQueue:(id)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  v102 = (char *)self;
  SEL v101 = a2;
  io_registry_entry_t v100 = a3;
  id v99 = a4;
  if (!a3 || !v99)
  {
    v98 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      inited = init_default_corebrightness_log();
    }
    v98 = inited;
    char v97 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v98;
      os_log_type_t type = v97;
      __os_log_helper_16_0_0(v96);
      _os_log_error_impl(&dword_1BA438000, log, type, "invalid input", v96, 2u);
    }
LABEL_141:

    v102 = 0;
    return 0;
  }
  v95.receiver = v102;
  v95.super_class = (Class)CBDisplayModuleHIDiOS;
  v102 = [(CBDisplayModuleHIDiOS *)&v95 init];
  if (v102)
  {
    *((void *)v102 + 5) = os_log_create("com.apple.CoreBrightness.HIDDisplay", "default");
    *((void *)v102 + 6) = v99;
    dispatch_retain(*((dispatch_object_t *)v102 + 6));
    *((void *)v102 + 14) = dispatch_queue_create("CBDisplayModuleHID - Brightness", 0);
    if (!*((void *)v102 + 14))
    {
      v94 = 0;
      if (*((void *)v102 + 5))
      {
        v48 = *((void *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v47 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v47 = init_default_corebrightness_log();
        }
        v48 = v47;
      }
      v94 = v48;
      char v93 = 16;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v45 = v94;
        os_log_type_t v46 = v93;
        __os_log_helper_16_0_0(v92);
        _os_log_error_impl(&dword_1BA438000, v45, v46, "error: unable to create CBDisplayModuleHID - Brightness queue", v92, 2u);
      }
      goto LABEL_141;
    }
    id v91 = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:@"DISABLE_HID_INTERFACE"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v102[132] = [v91 BOOLValue] & 1;
      os_log_t v90 = 0;
      if (*((void *)v102 + 5))
      {
        v44 = *((void *)v102 + 5);
      }
      else
      {
        uint64_t v43 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v44 = v43;
      }
      os_log_t v90 = v44;
      os_log_type_t v89 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v108, v102[132] & 1);
        _os_log_impl(&dword_1BA438000, v90, v89, "loaded no-HID override from preferences (%d)", v108, 8u);
      }
    }

    id v88 = 0;
    id v88 = (id)IORegistryEntrySearchCFProperty(v100, "IOService", @"ProductID", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2u);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *((void *)v102 + 20) = [v88 unsignedIntegerValue];
    }
    else
    {
      v87 = 0;
      if (*((void *)v102 + 5))
      {
        v42 = *((void *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v41 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v41 = init_default_corebrightness_log();
        }
        v42 = v41;
      }
      v87 = v42;
      os_log_type_t v86 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v39 = v87;
        os_log_type_t v40 = v86;
        __os_log_helper_16_0_0(v85);
        _os_log_error_impl(&dword_1BA438000, v39, v40, "error: failed to retrieve PID", v85, 2u);
      }
    }

    id v84 = 0;
    id v84 = (id)IORegistryEntrySearchCFProperty(v100, "IOService", @"VendorID", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2u);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *((void *)v102 + 19) = [v84 unsignedIntegerValue];
    }
    else
    {
      v83 = 0;
      if (*((void *)v102 + 5))
      {
        v38 = *((void *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v37 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v37 = init_default_corebrightness_log();
        }
        v38 = v37;
      }
      v83 = v38;
      os_log_type_t v82 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v35 = v83;
        os_log_type_t v36 = v82;
        __os_log_helper_16_0_0(v81);
        _os_log_error_impl(&dword_1BA438000, v35, v36, "error: failed to retrieve VID", v81, 2u);
      }
    }

    os_log_t v80 = 0;
    if (*((void *)v102 + 5))
    {
      v34 = *((void *)v102 + 5);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v33 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v33 = init_default_corebrightness_log();
      }
      v34 = v33;
    }
    os_log_t v80 = v34;
    os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v107, *((void *)v102 + 19), *((void *)v102 + 20));
      _os_log_impl(&dword_1BA438000, v80, v79, "VID = %lu | PID = %lu", v107, 0x16u);
    }
    *((void *)v102 + 4) = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v100);
    if (!*((void *)v102 + 4))
    {
      v78 = 0;
      if (*((void *)v102 + 5))
      {
        v32 = *((void *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v31 = init_default_corebrightness_log();
        }
        v32 = v31;
      }
      v78 = v32;
      os_log_type_t v77 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v29 = v78;
        os_log_type_t v30 = v77;
        __os_log_helper_16_0_0(v76);
        _os_log_error_impl(&dword_1BA438000, v29, v30, "error: unable to create IOHIDDevice", v76, 2u);
      }
      goto LABEL_141;
    }
    if (IOHIDDeviceOpen(*((IOHIDDeviceRef *)v102 + 4), 0))
    {
      v75 = 0;
      if (*((void *)v102 + 5))
      {
        v28 = *((void *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v27 = init_default_corebrightness_log();
        }
        v28 = v27;
      }
      v75 = v28;
      os_log_type_t v74 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v25 = v75;
        os_log_type_t v26 = v74;
        __os_log_helper_16_0_0(v73);
        _os_log_error_impl(&dword_1BA438000, v25, v26, "error: unable to open IOHIDDevice", v73, 2u);
      }
      goto LABEL_141;
    }
    id v72 = 0;
    id v72 = (id)IORegistryEntrySearchCFProperty(v100, "IOService", @"kUSBContainerID", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *((void *)v102 + 7) = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v72];
    }

    *((void *)v102 + 10) = IOHIDDeviceCopyMatchingElements(*((IOHIDDeviceRef *)v102 + 4), 0, 0);
    v4 = (void *)*((void *)v102 + 10);
    uint64_t v66 = MEMORY[0x1E4F143A8];
    int v67 = -1073741824;
    int v68 = 0;
    v69 = __49__CBDisplayModuleHIDiOS_initWithDevice_andQueue___block_invoke;
    v70 = &unk_1E62191C8;
    v71 = v102;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:");
    if (!*((void *)v102 + 9))
    {
      os_log_t oslog = 0;
      if (*((void *)v102 + 5))
      {
        v24 = *((void *)v102 + 5);
      }
      else
      {
        uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v24 = v23;
      }
      os_log_t oslog = v24;
      os_log_type_t v64 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v21 = oslog;
        os_log_type_t v22 = v64;
        __os_log_helper_16_0_0(v63);
        _os_log_impl(&dword_1BA438000, v21, v22, "duration element isn't available", v63, 2u);
      }
    }
    if (!*((void *)v102 + 8))
    {
      os_log_t v54 = 0;
      if (*((void *)v102 + 5))
      {
        v12 = *((void *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v11 = init_default_corebrightness_log();
        }
        v12 = v11;
      }
      os_log_t v54 = v12;
      os_log_type_t v53 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v9 = v54;
        os_log_type_t v10 = v53;
        __os_log_helper_16_0_0(v52);
        _os_log_error_impl(&dword_1BA438000, v9, v10, "error: can't find brightness element - abort", v52, 2u);
      }
      goto LABEL_141;
    }
    uint32_t UnitExponent = 0;
    uint32_t UnitExponent = IOHIDElementGetUnitExponent(*((IOHIDElementRef *)v102 + 8));
    *((float *)v102 + 23) = (float)IOHIDElementGetPhysicalMax(*((IOHIDElementRef *)v102 + 8));
    *((float *)v102 + 22) = (float)IOHIDElementGetPhysicalMin(*((IOHIDElementRef *)v102 + 8));
    *((_DWORD *)v102 + 25) = 1120403456;
    if (*((float *)v102 + 23) > 2000.0)
    {
      if (UnitExponent)
      {
        float v5 = scaleForExponent(UnitExponent);
        *((float *)v102 + 25) = v5;
        if (*((float *)v102 + 25) > 0.0)
        {
          *((float *)v102 + 23) = *((float *)v102 + 23) / *((float *)v102 + 25);
          *((float *)v102 + 22) = *((float *)v102 + 22) / *((float *)v102 + 25);
        }
      }
    }
    os_log_t v61 = 0;
    if (*((void *)v102 + 5))
    {
      v20 = *((void *)v102 + 5);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v19 = init_default_corebrightness_log();
      }
      v20 = v19;
    }
    os_log_t v61 = v20;
    os_log_type_t v60 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_4_8_0_8_0_8_0_4_0((uint64_t)v106, COERCE__INT64(*((float *)v102 + 23)), COERCE__INT64(*((float *)v102 + 22)), COERCE__INT64(*((float *)v102 + 25)), UnitExponent);
      _os_log_impl(&dword_1BA438000, v61, v60, "maxNits = %f, minNits = %f, nitsScaler = %f, exponent = %d", v106, 0x26u);
    }
    if (*((float *)v102 + 23) <= 0.0)
    {
      os_log_t v59 = 0;
      if (*((void *)v102 + 5))
      {
        v18 = *((void *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v17 = init_default_corebrightness_log();
        }
        v18 = v17;
      }
      os_log_t v59 = v18;
      os_log_type_t v58 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v105, COERCE__INT64(*((float *)v102 + 23)));
        _os_log_error_impl(&dword_1BA438000, v59, v58, "error: max nits (%f) - defaulting", v105, 0xCu);
      }
      *((_DWORD *)v102 + 26) = 981668463;
    }
    else
    {
      *((float *)v102 + 26) = *((float *)v102 + 22) / *((float *)v102 + 23);
    }
    if (([v102 getNits:v102 + 96] & 1) == 0)
    {
      os_log_t v57 = 0;
      if (*((void *)v102 + 5))
      {
        v16 = *((void *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v15 = init_default_corebrightness_log();
        }
        v16 = v15;
      }
      os_log_t v57 = v16;
      os_log_type_t v56 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v13 = v57;
        os_log_type_t v14 = v56;
        __os_log_helper_16_0_0(v55);
        _os_log_error_impl(&dword_1BA438000, v13, v14, "error: failed to retrieve current nits - defaulting to 150 nits", v55, 2u);
      }
      *((_DWORD *)v102 + 24) = 1125515264;
    }
    if (*((void *)v102 + 5))
    {
      v8 = *((void *)v102 + 5);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v104, COERCE__INT64(*((float *)v102 + 24)), COERCE__INT64(*((float *)v102 + 22)), COERCE__INT64(*((float *)v102 + 23)));
      _os_log_impl(&dword_1BA438000, v8, OS_LOG_TYPE_INFO, "brightness: current=%f min=%f max=%f", v104, 0x20u);
    }
  }
  return (CBDisplayModuleHIDiOS *)v102;
}

CFTypeID __49__CBDisplayModuleHIDiOS_initWithDevice_andQueue___block_invoke(uint64_t a1, void *a2)
{
  CFTypeID v5 = CFGetTypeID(a2);
  CFTypeID TypeID = IOHIDElementGetTypeID();
  CFTypeID result = v5;
  if (v5 == TypeID)
  {
    if (IOHIDElementGetType((IOHIDElementRef)a2) == kIOHIDElementTypeFeature
      && IOHIDElementGetUsage((IOHIDElementRef)a2) == 16
      && (CFTypeID result = IOHIDElementGetUsagePage((IOHIDElementRef)a2), result == 130))
    {
      *(void *)(*(void *)(a1 + 32) + 64) = a2;
    }
    else
    {
      CFTypeID result = IOHIDElementGetType((IOHIDElementRef)a2);
      if (result == 257)
      {
        CFTypeID result = IOHIDElementGetUsage((IOHIDElementRef)a2);
        if (result == 80)
        {
          CFTypeID result = IOHIDElementGetUsagePage((IOHIDElementRef)a2);
          if (result == 15) {
            *(void *)(*(void *)(a1 + 32) + 72) = a2;
          }
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13 = self;
  SEL v12 = a2;
  if (self->_elements)
  {
    memset(__b, 0, sizeof(__b));
    obj = v13->_elements;
    uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v14 count:16];
    if (v8)
    {
      uint64_t v4 = *(void *)__b[2];
      uint64_t v5 = 0;
      unint64_t v6 = v8;
      while (1)
      {
        uint64_t v3 = v5;
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(obj);
        }
        CFTypeRef v11 = 0;
        CFTypeRef v11 = *(CFTypeRef *)(__b[1] + 8 * v5);
        CFTypeID TypeID = IOHIDElementGetTypeID();
        if (TypeID == CFGetTypeID(v11)) {
          _IOHIDElementSetValue();
        }
        ++v5;
        if (v3 + 1 >= v6)
        {
          uint64_t v5 = 0;
          unint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v14 count:16];
          if (!v6) {
            break;
          }
        }
      }
    }
  }
  if (v13->_queue)
  {
    dispatch_release((dispatch_object_t)v13->_queue);
    v13->_queue = 0;
  }
  if (v13->_brightnessUpdateQueue)
  {
    dispatch_release((dispatch_object_t)v13->_brightnessUpdateQueue);
    v13->_brightnessUpdateQueue = 0;
  }
  if (v13->_logHandle)
  {

    v13->_logHandle = 0;
  }
  if (v13->_hidDisplayDevice)
  {
    IOHIDDeviceClose(v13->_hidDisplayDevice, 0);
    CFRelease(v13->_hidDisplayDevice);
    v13->_hidDisplayDevice = 0;
  }

  v9.receiver = v13;
  v9.super_class = (Class)CBDisplayModuleHIDiOS;
  [(CBModule *)&v9 dealloc];
}

- (void)start
{
  v18 = self;
  SEL v17 = a2;
  v16 = 0;
  if (self->_logHandle)
  {
    logHandle = v18->_logHandle;
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
  v16 = logHandle;
  char v15 = 1;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    log = v16;
    os_log_type_t type = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v14, 2u);
  }
  id v13 = [(CBDisplayModuleHIDiOS *)v18 newDisplayBrightnessData];
  if (v13)
  {
    [(CBDisplayModuleHIDiOS *)v18 sendNotificationForKey:@"DisplayBrightness" withValue:v13];
  }
  else
  {
    SEL v12 = 0;
    if (v18->_logHandle)
    {
      uint64_t v5 = v18->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      uint64_t v5 = v4;
    }
    SEL v12 = v5;
    char v11 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v2 = v12;
      os_log_type_t v3 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1BA438000, v2, v3, "failed to create display data structure", v10, 2u);
    }
  }
}

- (void)stop
{
  os_log_type_t v10 = self;
  SEL v9 = a2;
  uint64_t v8 = 0;
  if (self->_logHandle)
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
  uint64_t v8 = logHandle;
  char v7 = 1;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v6, 2u);
  }
}

- (id)newDisplayBrightnessData
{
  v16 = self;
  SEL v15 = a2;
  os_log_type_t v14 = 0;
  id v13 = 0;
  unint64_t v8 = 0x1E4F28000uLL;
  id v2 = objc_alloc(NSNumber);
  SEL v9 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
  *(float *)&double v3 = v16->_currentNits;
  id v13 = (id)[v2 initWithFloat:v3];
  id v12 = 0;
  id v4 = objc_alloc(NSNumber);
  *(float *)&double v5 = v16->_currentNits;
  id v12 = (id)[v4 initWithFloat:v5];
  id v11 = 0;
  id v10 = objc_alloc(NSNumber);
  *(float *)&double v6 = v16->_currentNits;
  [(CBDisplayModuleHIDiOS *)v16 getUserBrightnessForNits:v6];
  id v11 = (id)objc_msgSend(v10, "initWithFloat:");
  if (v13 && v12 && v11) {
    os_log_type_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v11, @"Brightness", v12, @"NitsPhysical", v13, @"Nits", 0);
  }

  return v14;
}

- (id)copyPropertyForKey:(id)a3
{
  return [(CBDisplayModuleHIDiOS *)self copyPropertyInternalForKey:a3];
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v9 = 0;
  if ([a4 isEqualToString:@"DisplayBrightness2"])
  {
    char v9 = [(CBDisplayModuleHIDiOS *)self handleDisplayBrightnessProperty:a3];
  }
  else if ([a4 isEqualToString:@"DISABLE_HID_INTERFACE"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_noHID  = [a3 BOOLValue] & 1;
      if (self->_logHandle)
      {
        logHandle  = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle  = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v14, self->_noHID);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "setting no-HID override to %d", v14, 8u);
      }
      char v9 = +[CBPreferencesHandler storePreferenceForAllUsersForKey:@"DISABLE_HID_INTERFACE" andValue:a3];
    }
  }
  else if ([a4 isEqualToString:@"DisplayBrightnessLinear"])
  {
    char v9 = [(CBDisplayModuleHIDiOS *)self handleDisplayLinearBrightnessProperty:a3];
  }
  else if ([a4 isEqualToString:@"CBDisplayVendorID"])
  {
    char v9 = [(CBDisplayModuleHIDiOS *)self handleDisplayVendorIDProperty:a3];
  }
  else if ([a4 isEqualToString:@"CBDisplayProductID"])
  {
    char v9 = [(CBDisplayModuleHIDiOS *)self handleDisplayProductIDProperty:a3];
  }
  if (self->_logHandle)
  {
    double v6 = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v5 = init_default_corebrightness_log();
    }
    double v6 = v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v13, (uint64_t)a4, (uint64_t)a3, v9 & 1);
    _os_log_debug_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ result=%d", v13, 0x1Cu);
  }
  return v9 & 1;
}

- (BOOL)handleDisplayProductIDProperty:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    self->_displayPID  = [a3 unsignedIntegerValue];
  }
  return 0;
}

- (BOOL)handleDisplayVendorIDProperty:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    self->_displayVID  = [a3 unsignedIntegerValue];
  }
  return 0;
}

- (BOOL)handleDisplayLinearBrightnessProperty:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v6 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    char v6 = -[CBDisplayModuleHIDiOS setLinearBrightness:](self, "setLinearBrightness:");
  }
  if (self->_logHandle)
  {
    logHandle  = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle  = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_4_0((uint64_t)v9, (uint64_t)a3, v6 & 1);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "data=%@ result=%d", v9, 0x12u);
  }
  return v6 & 1;
}

- (BOOL)handleDisplayBrightnessProperty:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v8 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    char v8 = -[CBDisplayModuleHIDiOS setSlider:](self, "setSlider:");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = (void *)[a3 objectForKey:@"Brightness"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 floatValue];
        char v8 = -[CBDisplayModuleHIDiOS setSlider:](self, "setSlider:");
      }
      else
      {
        char v7 = (void *)[a3 objectForKey:@"Nits"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 floatValue];
          char v8 = -[CBDisplayModuleHIDiOS setNits:](self, "setNits:");
        }
      }
    }
  }
  if (self->_logHandle)
  {
    logHandle  = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle  = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_4_0((uint64_t)v11, (uint64_t)a3, v8 & 1);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "data=%@ result=%d", v11, 0x12u);
  }
  return v8 & 1;
}

- (BOOL)setLinearBrightness:(float)a3
{
  *(float *)&double v3 = a3 * self->_maxNits;
  return [(CBDisplayModuleHIDiOS *)self setNits:v3];
}

- (float)getLinearBrightness
{
  if (self->_maxNits <= 0.0) {
    return 0.0;
  }
  else {
    return self->_currentNits / self->_maxNits;
  }
}

- (BOOL)setSlider:(float)a3
{
  if (a3 >= 0.0) {
    double v7 = a3;
  }
  else {
    double v7 = 0.0;
  }
  float v3 = v7;
  if (v3 <= 1.0) {
    double v6 = v3;
  }
  else {
    double v6 = 1.0;
  }
  HIDWORD(v4)  = HIDWORD(v6);
  *(float *)&double v4 = v6;
  [(CBDisplayModuleHIDiOS *)self getNitsForUserBrightness:v4];
  return -[CBDisplayModuleHIDiOS setNits:](self, "setNits:");
}

- (BOOL)setNits:(float)a3 withPeriod:(float)a4
{
  uint64_t v33 = self;
  v32  = a2;
  float v31 = a3;
  float v30 = a4;
  v29  = 1;
  minNits  = 0.0;
  minNits  = self->_minNits;
  float v27 = a3;
  if (minNits >= a3) {
    float v11 = minNits;
  }
  else {
    float v11 = v27;
  }
  float v26 = v11;
  float v31 = v11;
  maxNits  = 0.0;
  maxNits  = v33->_maxNits;
  v24  = v11;
  if (maxNits >= v11) {
    float v10 = v24;
  }
  else {
    float v10 = maxNits;
  }
  float v23 = v10;
  float v31 = v10;
  ++v33->_brighntessUpdateCounter;
  v33->_brightnessUpdateTarget  = v31;
  v33->_currentNits  = v31;
  if (v33->_brighntessUpdateCounter == 1)
  {
    brightnessUpdateQueue  = v33->_brightnessUpdateQueue;
    block  = MEMORY[0x1E4F143A8];
    v16  = -1073741824;
    int v17 = 0;
    v18  = __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke;
    uint64_t v19 = &unk_1E6219538;
    v20  = v33;
    v21  = v30;
    float v22 = v31;
    dispatch_async(brightnessUpdateQueue, &block);
  }
  else
  {
    os_log_t oslog = 0;
    if (v33->_logHandle)
    {
      logHandle  = v33->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle  = inited;
    }
    os_log_t oslog = logHandle;
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log  = oslog;
      os_log_type_t v7 = type;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_1BA438000, log, v7, "dropping previous brightness setting", v12, 2u);
    }
  }
  return v29 & 1;
}

void __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke(uint64_t a1)
{
  uint64_t v37 = a1;
  uint64_t v36 = a1;
  uint64_t v31 = 0;
  v32  = &v31;
  int v33 = 0x20000000;
  v34  = 32;
  v35  = 0;
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block  = MEMORY[0x1E4F143A8];
  int v23 = -1073741824;
  v24  = 0;
  v25  = __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke_2;
  float v26 = &unk_1E62197B8;
  uint64_t v27 = *(void *)(a1 + 32);
  v28  = &v31;
  v29  = *(_DWORD *)(a1 + 40);
  int v30 = *(_DWORD *)(a1 + 44);
  dispatch_sync(v2, &block);
  if (v32[3])
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 132))
    {
      os_log_t oslog = 0;
      if (*(void *)(*(void *)(a1 + 32) + 40))
      {
        os_log_type_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        os_log_type_t v7 = inited;
      }
      os_log_t oslog = v7;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        log  = oslog;
        os_log_type_t v5 = type;
        __os_log_helper_16_0_0(v9);
        _os_log_error_impl(&dword_1BA438000, log, v5, "WORKAROUND: Skipping the nit update in the HID interface - CA is expected to handle this in PQ", v9, 2u);
      }
    }
    else
    {
      v21  = 0;
      v21  = IOHIDTransactionCommit((IOHIDTransactionRef)v32[3]);
      float v3 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      int v13 = -1073741824;
      int v14 = 0;
      uint64_t v15 = __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke_46;
      v16  = &unk_1E6219BA8;
      v18  = v21;
      uint64_t v17 = *(void *)(a1 + 32);
      int v19 = *(_DWORD *)(a1 + 44);
      v20  = *(_DWORD *)(a1 + 40);
      dispatch_sync(v3, &v12);
    }
    CFRelease((CFTypeRef)v32[3]);
  }
  _Block_object_dispose(&v31, 8);
}

void __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke_2(uint64_t a1)
{
  v39  = *MEMORY[0x1E4F143B8];
  v35  = a1;
  v34  = a1;
  if (*(void *)(*(void *)(a1 + 32) + 120))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)  = IOHIDTransactionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(IOHIDDeviceRef *)(*(void *)(a1 + 32) + 32), kIOHIDTransactionDirectionTypeOutput, 0);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      IOHIDTransactionAddElement(*(IOHIDTransactionRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(IOHIDElementRef *)(*(void *)(a1 + 32) + 64));
      int v33 = 0;
      v24  = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      int v23 = *(__IOHIDElement **)(*(void *)(a1 + 32) + 64);
      v1  = mach_absolute_time();
      int v33 = IOHIDValueCreateWithIntegerValue(v24, v23, v1, (uint64_t)(float)(*(float *)(*(void *)(a1 + 32) + 128) * *(float *)(*(void *)(a1 + 32) + 100)));
      if (v33)
      {
        IOHIDTransactionSetValue(*(IOHIDTransactionRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(IOHIDElementRef *)(*(void *)(a1 + 32) + 64), v33, 0);
        CFRelease(v33);
      }
      if (*(void *)(*(void *)(a1 + 32) + 72))
      {
        IOHIDTransactionAddElement(*(IOHIDTransactionRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(IOHIDElementRef *)(*(void *)(a1 + 32) + 72));
        v32  = 0;
        allocator  = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        element  = *(__IOHIDElement **)(*(void *)(a1 + 32) + 72);
        uint64_t v2 = mach_absolute_time();
        v32  = IOHIDValueCreateWithIntegerValue(allocator, element, v2, (uint64_t)(float)(*(float *)(a1 + 48) * 1000.0));
        if (v32)
        {
          IOHIDTransactionSetValue(*(IOHIDTransactionRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(IOHIDElementRef *)(*(void *)(a1 + 32) + 72), v32, 0);
          CFRelease(v32);
        }
      }
      context  = (void *)MEMORY[0x1BA9ECAE0]();
      int v19 = *(_DWORD **)(a1 + 32);
      v18  = NSNumber;
      LODWORD(v3)  = v19[24];
      [v19 getUserBrightnessForNits:v3];
      objc_msgSend(v19, "sendNotificationForKey:withValue:", @"DisplayBrightness2", objc_msgSend(v18, "numberWithFloat:"));
      os_log_t v31 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 40))
      {
        uint64_t v17 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        uint64_t v17 = inited;
      }
      os_log_t v31 = v17;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v38, COERCE__INT64(*(float *)(a1 + 52)), COERCE__INT64(*(float *)(a1 + 48)));
        _os_log_impl(&dword_1BA438000, v31, v30, "nits=%f period=%f", v38, 0x16u);
      }
      uint64_t v15 = (void *)MEMORY[0x1BA9ECAE0]();
      int v13 = *(_DWORD **)(a1 + 32);
      uint64_t v12 = NSNumber;
      LODWORD(v4)  = v13[24];
      [v13 getUserBrightnessForNits:v4];
      objc_msgSend(v13, "sendNotificationForKey:withValue:", @"DisplayBrightness2", objc_msgSend(v12, "numberWithFloat:"));
      v29  = 0;
      v36[0]  = @"Brightness";
      int v14 = NSNumber;
      LODWORD(v5)  = *(_DWORD *)(*(void *)(a1 + 32) + 96);
      [*(id *)(a1 + 32) getUserBrightnessForNits:v5];
      v37[0]  = objc_msgSend(v14, "numberWithFloat:");
      v36[1]  = @"Nits";
      LODWORD(v6)  = *(_DWORD *)(*(void *)(a1 + 32) + 96);
      v37[1]  = [NSNumber numberWithFloat:v6];
      v36[2]  = @"NitsPhysical";
      LODWORD(v7)  = *(_DWORD *)(*(void *)(a1 + 32) + 96);
      v37[2]  = [NSNumber numberWithFloat:v7];
      v29  = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
      [*(id *)(a1 + 32) sendNotificationForKey:@"DisplayBrightness" withValue:v29];
    }
    else
    {
      v28  = 0;
      if (*(void *)(*(void *)(a1 + 32) + 40))
      {
        float v11 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v10 = init_default_corebrightness_log();
        }
        float v11 = v10;
      }
      v28  = v11;
      char v27 = 16;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        char v8 = v28;
        os_log_type_t v9 = v27;
        __os_log_helper_16_0_0(v26);
        _os_log_error_impl(&dword_1BA438000, v8, v9, "error: failed to create transaction", v26, 2u);
      }
    }
  }
  *(void *)(*(void *)(a1 + 32) + 120)  = 0;
}

void __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke_46(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 40))
  {
    if (*(void *)(*(void *)(a1 + 32) + 40))
    {
      uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v2 = inited;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v6, *(_DWORD *)(a1 + 40));
      _os_log_error_impl(&dword_1BA438000, v2, OS_LOG_TYPE_ERROR, "error 0x%x: failed to commit nits", v6, 8u);
    }
  }
  else
  {
    if (*(void *)(*(void *)(a1 + 32) + 40))
    {
      double v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v3 = init_default_corebrightness_log();
      }
      double v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v7, COERCE__INT64(*(float *)(a1 + 44)), COERCE__INT64(*(float *)(a1 + 48)));
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "setting %f nits over %fs", v7, 0x16u);
    }
  }
}

- (BOOL)setNits:(float)a3
{
  return [(CBDisplayModuleHIDiOS *)self setNits:*(double *)&a3 withPeriod:0.0];
}

- (BOOL)getNits:(float *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = self;
  SEL v36 = a2;
  v35  = a3;
  v34  = 0;
  int v33 = 0;
  int v33 = IOHIDTransactionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_hidDisplayDevice, kIOHIDTransactionDirectionTypeInput, 0);
  if (v33)
  {
    IOHIDTransactionAddElement(v33, v37->_brightnessElement);
    v32  = -536870212;
    int v31 = 0;
    do
    {
      v32  = IOHIDTransactionCommit(v33);
      if (v32)
      {
        os_log_t v30 = 0;
        if (v37->_logHandle)
        {
          logHandle  = v37->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          logHandle  = inited;
        }
        os_log_t v30 = logHandle;
        v29  = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v40, v32);
          _os_log_error_impl(&dword_1BA438000, v30, v29, "failed to commit transaction 0x%x", v40, 8u);
        }
        if (v32 != -536850432) {
          ++v31;
        }
        if (v31 < 9)
        {
          v28  = (os_log_t)MEMORY[0x1E4F14500];
          os_log_type_t v27 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_0_1_4_0((uint64_t)v39, v31);
            _os_log_error_impl(&dword_1BA438000, v28, v27, "retrying commit attempt No.%d", v39, 8u);
          }
          usleep(0xC350u);
        }
      }
      else
      {
        int v31 = 9;
      }
    }
    while (v31 < 9);
    Value  = 0;
    Value  = IOHIDTransactionGetValue(v33, v37->_brightnessElement, 0);
    if (Value)
    {
      ScaledValue  = IOHIDValueGetScaledValue(Value, 2u);
      v25  = ScaledValue;
      if (ScaledValue > v37->_maxNits || v25 < v37->_minNits)
      {
        v24  = 0;
        if (v37->_logHandle)
        {
          int v14 = v37->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v13 = init_default_corebrightness_log();
          }
          int v14 = v13;
        }
        v24  = v14;
        os_log_type_t v23 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v38, COERCE__INT64(v25), COERCE__INT64(v37->_minNits), COERCE__INT64(v37->_maxNits));
          _os_log_error_impl(&dword_1BA438000, v24, v23, "error: value (%f) out of bounds (%f-%f)", v38, 0x20u);
        }
      }
      else
      {
        v34  = 1;
        float *v35 = v25;
      }
    }
    else
    {
      float v22 = 0;
      if (v37->_logHandle)
      {
        uint64_t v12 = v37->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v11 = init_default_corebrightness_log();
        }
        uint64_t v12 = v11;
      }
      float v22 = v12;
      v21  = 16;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v9 = v22;
        os_log_type_t v10 = v21;
        __os_log_helper_16_0_0(v20);
        _os_log_error_impl(&dword_1BA438000, v9, v10, "error: invalid value", v20, 2u);
      }
    }
    CFRelease(v33);
  }
  else
  {
    os_log_t oslog = 0;
    if (v37->_logHandle)
    {
      uint64_t v8 = v37->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      uint64_t v8 = v7;
    }
    os_log_t oslog = v8;
    v18  = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v5 = oslog;
      os_log_type_t v6 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_error_impl(&dword_1BA438000, v5, v6, "error: failed to create transaction", v17, 2u);
    }
  }
  return v34 & 1;
}

- (id)copyPropertyInternalForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v18  = 0;
  if ([a3 isEqualToString:@"StatusInfo"])
  {
    id v17 = +[CBStatusInfoHelper copyStatusInfoFor:self];
    if (v17) {
      v18  = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v17, @"CBDisplayModuleHIDiOS", 0);
    }
  }
  else
  {
    if ([a3 isEqualToString:@"DisplayBrightness2"])
    {
      v16  = objc_alloc(NSNumber);
      *(float *)&double v3 = self->_currentNits;
      [(CBDisplayModuleHIDiOS *)self getUserBrightnessForNits:v3];
      v18  = (id)objc_msgSend(v16, "initWithFloat:");
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"DisplayBrightnessLinear"])
    {
      id v15 = objc_alloc(NSNumber);
      [(CBDisplayModuleHIDiOS *)self getLinearBrightness];
      v18  = (id)objc_msgSend(v15, "initWithFloat:");
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"DisplayBrightnessLinearMin"])
    {
      id v4 = objc_alloc(NSNumber);
      *(float *)&double v5 = self->_minLinearBrightness;
      v18  = (id)[v4 initWithFloat:v5];
      goto LABEL_31;
    }
    if (([a3 isEqualToString:@"DisplayNitsKey"] & 1) != 0
      || ([a3 isEqualToString:@"NitsPhysical"] & 1) != 0)
    {
      id v6 = objc_alloc(NSNumber);
      *(float *)&double v7 = self->_currentNits;
      v18  = (id)[v6 initWithFloat:v7];
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"DisplayBrightness"])
    {
      v18  = [(CBDisplayModuleHIDiOS *)self newDisplayBrightnessData];
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"DisplayBrightness2Available"])
    {
      v18  = (id)[objc_alloc(NSNumber) initWithBool:1];
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"DisplayBrightnessMin"])
    {
      id v8 = objc_alloc(NSNumber);
      *(float *)&double v9 = self->_minNits;
      v18  = (id)[v8 initWithFloat:v9];
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"DisplayBrightnessMax"])
    {
      id v10 = objc_alloc(NSNumber);
      *(float *)&double v11 = self->_maxNits;
      v18  = (id)[v10 initWithFloat:v11];
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"kUSBContainerID"]) {
      goto LABEL_23;
    }
    if ([a3 isEqualToString:@"CBDisplayVendorID"])
    {
      v18  = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:self->_displayVID];
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"CBDisplayProductID"])
    {
      v18  = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:self->_displayPID];
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"DisplayUniqueID"])
    {
LABEL_23:
      v18  = (id)[(NSUUID *)self->_containerID copy];
      goto LABEL_31;
    }
    if ([a3 isEqualToString:@"DISABLE_HID_INTERFACE"]) {
      v18  = (id)[objc_alloc(NSNumber) initWithBool:self->_noHID];
    }
  }
LABEL_31:
  if (self->_logHandle)
  {
    logHandle  = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle  = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)a3, (uint64_t)v18);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "key=%@ result=%@", v21, 0x16u);
  }
  return v18;
}

- (id)copyIdentifiers
{
  id v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"DisplayBrightness2", @"DisplayBrightnessLinear", @"DisplayBrightnessLinearMin", @"DisplayNitsKey", @"NitsPhysical", @"DisplayBrightness", @"DisplayBrightness2Available", @"DisplayBrightnessMin", @"DisplayBrightnessMax", @"kUSBContainerID", 0);
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super.super._notificationBlock) {
    (*((void (**)(void))self->super.super._notificationBlock + 2))();
  }
}

- (float)getNitsForUserBrightness:(float)a3
{
  if (a3 <= 1.0) {
    float v6 = a3;
  }
  else {
    float v6 = 1.0;
  }
  if (v6 <= 0.0) {
    float v5 = 0.0;
  }
  else {
    float v5 = v6;
  }
  maxNits  = self->_maxNits;
  return maxNits * powf(maxNits / self->_minNits, v5 - 1.0);
}

- (float)getUserBrightnessForNits:(float)a3
{
  if (self->_maxNits >= a3) {
    maxNits  = a3;
  }
  else {
    maxNits  = self->_maxNits;
  }
  if (self->_minNits >= maxNits) {
    minNits  = self->_minNits;
  }
  else {
    minNits  = maxNits;
  }
  float v6 = logf(self->_maxNits / self->_minNits);
  return (float)(logf(minNits / self->_maxNits) / v6) + 1.0;
}

- (unint64_t)VID
{
  return self->_VID;
}

- (unint64_t)PID
{
  return self->_PID;
}

@end