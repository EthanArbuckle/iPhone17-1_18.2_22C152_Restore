@interface CBDigitizerFilter
+ (CBDigitizerFilterTouchProperties)loadTouchProperties:(SEL)a3;
- (BOOL)isActive;
- (BOOL)isObstructed;
- (BOOL)isObstructedIgnoreActive;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBDigitizerFilter)initWithALSNode:(id)a3 andLogCategory:(const char *)a4;
- (id)filterEvent:(id)a3;
- (id)handleALSEvent:(id)a3;
- (id)handleDigitizerEvent:(id)a3;
- (id)newHospotForLocationX:(float)a3 andY:(float)a4;
- (id)newHotspot;
- (id)newHotspotForOrientation;
- (int)orientation;
- (void)dealloc;
- (void)overrideHotspotWithCenterX:(float)a3 andCenterY:(float)a4;
- (void)setIsActive:(BOOL)a3;
- (void)setTriggered:(int64_t)a3 forHotspot:(id)a4;
@end

@implementation CBDigitizerFilter

- (id)filterEvent:(id)a3
{
  int v4 = [a3 eventType];
  if (v4 == 11) {
    return [(CBDigitizerFilter *)self handleDigitizerEvent:a3];
  }
  if (v4 == 12) {
    return [(CBDigitizerFilter *)self handleALSEvent:a3];
  }
  return a3;
}

- (id)handleALSEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([a3 firstALSSample] & 1) == 0)
    {
      int v9 = [(CBDigitizerHotspot *)self->_hotspot orientation];
      if (v9 == [a3 orientation])
      {
        hotspot = self->_hotspot;
        [a3 timestamp];
        if (-[CBDigitizerHotspot isClearedAt:](hotspot, "isClearedAt:")) {
          [(CBDigitizerFilter *)self setTriggered:0 forHotspot:self->_hotspot];
        }
        if ([(CBDigitizerHotspot *)self->_hotspot triggered]
          && [(CBDigitizerFilter *)self isActive])
        {
          if (self->super._logHandle)
          {
            logHandle = self->super._logHandle;
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
            int v5 = [a3 orientation];
            [a3 timestamp];
            __os_log_helper_16_2_3_4_0_8_0_8_64((uint64_t)v12, v5, COERCE__INT64(v3), (uint64_t)self->_hotspot);
            _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Hotspot for ALS %d: timestamp = %.2f marked as obstucted hotspot = [%@]", v12, 0x1Cu);
          }
          [a3 setObstructed:1];
        }
      }
    }
  }
  return a3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v11 = 0;
  if ([a4 isEqual:@"AutoBrightnessTouchEnabled"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[CBDigitizerFilter setIsActive:](self, "setIsActive:", [a3 BOOLValue] & 1);
      char v11 = 1;
    }
  }
  else if ([a4 isEqual:@"AutoBrightnessTouchDelay"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a4 floatValue];
      float v10 = v4;
      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
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
        [(CBDigitizerHotspot *)self->_hotspot touchTriggerDelay];
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v15, COERCE__INT64(v6), COERCE__INT64(v10));
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Changing delay=%f to %f", v15, 0x16u);
      }
      *(float *)&double v5 = v10;
      [(CBDigitizerHotspot *)self->_hotspot setTouchTriggerDelay:v5];
      char v11 = 1;
    }
  }
  return v11 & 1;
}

- (id)handleDigitizerEvent:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v44 = self;
  SEL v43 = a2;
  id v42 = a3;
  if (!self->_firstDigitizerEvent)
  {
    v41 = 0;
    if (v44->super._logHandle)
    {
      logHandle = v44->super._logHandle;
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
    v41 = logHandle;
    char v40 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v41;
      os_log_type_t type = v40;
      __os_log_helper_16_0_0(v39);
      _os_log_debug_impl(&dword_1BA438000, log, type, "First digitizer event -> load touch properties", v39, 2u);
    }
    p_props = &v44->_props;
    +[CBDigitizerFilter loadTouchProperties:](CBDigitizerFilter, "loadTouchProperties:", [v42 service]);
    *(_OWORD *)&p_props->digitizerWidth = v37;
    p_props->touchHotSpotSquared = v38;
    if (!v44->_hotspot)
    {
      uint64_t v3 = [(CBDigitizerFilter *)v44 newHotspotForOrientation];
      v44->_hotspot = (CBDigitizerHotspot *)v3;
    }
    v44->_firstDigitizerEvent = 1;
  }
  v36 = (void *)[v42 copyChildren];
  if (!v36)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
    v36 = objc_msgSend(v4, "initWithObjects:", v42, 0);
  }
  if (v36)
  {
    char v35 = 0;
    for (int i = 0; i < (unint64_t)[v36 count]; ++i)
    {
      [v36 objectAtIndexedSubscript:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v33 = objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "integerValueForKey:", 720905) != 0;
        objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720896);
        float v32 = v5;
        objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720897);
        float v31 = v32 * v44->_props.digitizerWidth;
        float v30 = v6 * v44->_props.digitizerHeight;
        [(CBDigitizerHotspot *)v44->_hotspot center_X];
        float v29 = v7 - v31;
        [(CBDigitizerHotspot *)v44->_hotspot center_Y];
        float v28 = (float)((float)(v8 - v30) * (float)(v8 - v30)) + (float)(v29 * v29);
        if (v44->super._logHandle)
        {
          v22 = v44->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v21 = init_default_corebrightness_log();
          }
          v22 = v21;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720904);
          *(double *)&uint64_t v16 = v10;
          objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720917);
          *(double *)&uint64_t v17 = v11;
          objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720916);
          *(double *)&uint64_t v18 = v12;
          int v19 = [(CBDigitizerHotspot *)v44->_hotspot orientation];
          BOOL v20 = 0;
          if (v28 < v44->_props.touchHotSpotSquared) {
            BOOL v20 = v33;
          }
          uint64_t v13 = "";
          if (!v20) {
            uint64_t v13 = "un";
          }
          __os_log_helper_16_2_8_8_0_8_0_8_0_8_0_8_0_4_0_4_0_8_32((uint64_t)v45, COERCE__INT64(v31), COERCE__INT64(v30), v16, v17, v18, v33, v19, (uint64_t)v13);
          _os_log_debug_impl(&dword_1BA438000, v22, OS_LOG_TYPE_DEBUG, "Multitouch event - X: %f, Y: %f, range: %f, minor r: %f, major r: %f, touch: %d, ALS[%d] obstruction %sdetected", v45, 0x4Au);
        }
        *(float *)&double v9 = v28;
        if (v28 < v44->_props.touchHotSpotSquared && v33)
        {
          char v35 = 1;
          -[CBDigitizerFilter setTriggered:forHotspot:](v44, "setTriggered:forHotspot:", 1, v44->_hotspot, v9);
          break;
        }
      }
    }
    if ((v35 & 1) == 0 && [(CBDigitizerHotspot *)v44->_hotspot triggered] == 1)
    {
      [(CBDigitizerFilter *)v44 setTriggered:2 forHotspot:v44->_hotspot];
      hotspot = v44->_hotspot;
      [v42 timestamp];
      -[CBDigitizerHotspot setTouchReleaseTime:](hotspot, "setTouchReleaseTime:");
    }
  }

  return v42;
}

- (BOOL)isObstructed
{
  BOOL v3 = 0;
  if ([(CBDigitizerFilter *)self isActive]) {
    return [(CBDigitizerFilter *)self isObstructedIgnoreActive];
  }
  return v3;
}

- (BOOL)isObstructedIgnoreActive
{
  return [(CBDigitizerHotspot *)self->_hotspot triggered] != 0;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (CBDigitizerFilter)initWithALSNode:(id)a3 andLogCategory:(const char *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = self;
  SEL v20 = a2;
  id v19 = a3;
  uint64_t v18 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CBDigitizerFilter;
  uint64_t v21 = [(CBFilter *)&v17 init];
  if (v21)
  {
    os_log_t v4 = os_log_create("com.apple.CoreBrightness.CBDigitizerFilter", v18);
    v21->super._logHandle = (OS_os_log *)v4;
    int v5 = [v19 orientation];
    v21->_orientation = v5;
    uint64_t v6 = [v19 digitizerFilterWindow];
    v21->_behavior = v6;
    if (v21->super._logHandle)
    {
      logHandle = v21->super._logHandle;
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
      __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v19);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Creating digitizer filter for ALS [%@]", v22, 0xCu);
    }
    v21->_hotspot = 0;
    v21->_isActive = 1;
    if ([v19 overrideHotspot])
    {
      uint64_t v13 = v21;
      objc_msgSend((id)objc_msgSend(v19, "overrideHotspot"), "x");
      int v14 = v7;
      objc_msgSend((id)objc_msgSend(v19, "overrideHotspot"), "y");
      LODWORD(v9) = v8;
      LODWORD(v10) = v14;
      uint64_t v11 = [(CBDigitizerFilter *)v13 newHospotForLocationX:v10 andY:v9];
      v21->_hotspot = (CBDigitizerHotspot *)v11;
    }
    v21->_firstDigitizerEvent = 0;
  }
  return v21;
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBDigitizerFilter;
  [(CBFilter *)&v2 dealloc];
}

- (void)setIsActive:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
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
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v7, self->_isActive, v5);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Changing active=%d to %d", v7, 0xEu);
  }
  self->_isActive = v5;
}

- (void)overrideHotspotWithCenterX:(float)a3 andCenterY:(float)a4
{
  *(float *)&double v4 = a3;
  *(float *)&double v5 = a4;
  self->_hotspot = (CBDigitizerHotspot *)[(CBDigitizerFilter *)self newHospotForLocationX:v4 andY:v5];
}

+ (CBDigitizerFilterTouchProperties)loadTouchProperties:(SEL)a3
{
  id v35 = a2;
  SEL v34 = a3;
  IOHIDServiceClientRef v33 = a4;
  uint64_t v32 = 0;
  *(void *)&retstr->digitizerWidth = 0;
  *(void *)&retstr->deviceCenterX = 0;
  retstr->touchHotSpotSquared = 0.0;
  char v31 = 0;
  CFTypeRef v30 = IOHIDServiceClientCopyProperty(v33, @"SurfaceDimensions");
  if (v30)
  {
    CFTypeID v18 = CFGetTypeID(v30);
    if (v18 == CFDictionaryGetTypeID())
    {
      int valuePtr = 0;
      char v28 = 0;
      char v27 = 0;
      CFTypeRef Value = CFDictionaryGetValue((CFDictionaryRef)v30, @"Width");
      if (Value)
      {
        CFTypeID v17 = CFGetTypeID(Value);
        if (v17 == CFNumberGetTypeID())
        {
          CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
          if (valuePtr == 0x80000000) {
            double v16 = NAN;
          }
          else {
            double v16 = (double)valuePtr / 65536.0;
          }
          float v4 = v16 * 100.0;
          retstr->digitizerWidth = v4;
          char v28 = 1;
        }
      }
      int v25 = 0;
      v24 = CFDictionaryGetValue((CFDictionaryRef)v30, @"Height");
      if (v24)
      {
        CFTypeID v15 = CFGetTypeID(v24);
        if (v15 == CFNumberGetTypeID())
        {
          CFNumberGetValue((CFNumberRef)v24, kCFNumberSInt32Type, &v25);
          if (v25 == 0x80000000) {
            double v14 = NAN;
          }
          else {
            double v14 = (double)v25 / 65536.0;
          }
          float v5 = v14 * 100.0;
          retstr->digitizerHeight = v5;
          char v27 = 1;
        }
      }
      if (v28 & 1) != 0 && (v27) {
        char v31 = 1;
      }
    }
  }
  result = (CBDigitizerFilterTouchProperties *)IOHIDServiceClientGetRegistryID(v33);
  if (result && (v31 & 1) == 0) {
    result = (CBDigitizerFilterTouchProperties *)CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &v32);
  }
  if (v32)
  {
    mach_port_t mainPort = *MEMORY[0x1E4F2EEF0];
    CFDictionaryRef v7 = IORegistryEntryIDMatching(v32);
    io_service_t MatchingService = IOServiceGetMatchingService(mainPort, v7);
    uint64_t v13 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"Sensor Surface Width", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    result = (CBDigitizerFilterTouchProperties *)IORegistryEntryCreateCFProperty(MatchingService, @"Sensor Surface Height", *v13, 0);
    cf = result;
    if (CFProperty)
    {
      uint64_t v11 = (CBDigitizerFilterTouchProperties *)CFGetTypeID(CFProperty);
      CFTypeID TypeID = CFNumberGetTypeID();
      result = v11;
      if (v11 == (CBDigitizerFilterTouchProperties *)TypeID)
      {
        if (cf)
        {
          double v10 = (CBDigitizerFilterTouchProperties *)CFGetTypeID(cf);
          CFTypeID v9 = CFNumberGetTypeID();
          result = v10;
          if (v10 == (CBDigitizerFilterTouchProperties *)v9)
          {
            CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberFloatType, retstr);
            result = (CBDigitizerFilterTouchProperties *)CFNumberGetValue((CFNumberRef)cf, kCFNumberFloatType, &retstr->digitizerHeight);
            char v31 = 1;
          }
        }
      }
    }
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  if (v31)
  {
    retstr->deviceCenterX = retstr->digitizerWidth / 2.0;
    retstr->deviceCenterY = retstr->digitizerHeight / 2.0;
    if (retstr->digitizerWidth * 0.001 <= 10.0) {
      float v20 = 1.27;
    }
    else {
      float v20 = 2.54;
    }
    retstr->touchHotSpotSquared = (float)((float)(v20 * 1000.0) * v20) * 1000.0;
  }
  return result;
}

- (id)newHotspot
{
  if (self->_behavior == 1) {
    return objc_alloc_init(CBDigitizerHotspotTTF);
  }
  else {
    return objc_alloc_init(CBDigitizerHotspot);
  }
}

- (id)newHospotForLocationX:(float)a3 andY:(float)a4
{
  id v7 = [(CBDigitizerFilter *)self newHotspot];
  *(float *)&double v4 = a3;
  objc_msgSend(v7, "setCenter_X:", v4);
  *(float *)&double v5 = a4;
  objc_msgSend(v7, "setCenter_Y:", v5);
  [v7 setOrientation:self->_orientation];
  return v7;
}

- (id)newHotspotForOrientation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v21 = [(CBDigitizerFilter *)self newHotspot];
  [v21 setOrientation:self->_orientation];
  unsigned int orientation = self->_orientation;
  BOOL v4 = orientation > 1;
  uint64_t v5 = orientation - 1;
  if (v4)
  {
    uint64_t v7 = v5;
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = v5;
    char v6 = 0;
  }
  if ((v6 & 1) == 0)
  {
    switch(v7)
    {
      case 0:
        break;
      case 1:
        *(float *)&double v2 = self->_props.deviceCenterX;
        objc_msgSend(v21, "setCenter_X:", v2);
        *(float *)&double v9 = self->_props.digitizerHeight;
        objc_msgSend(v21, "setCenter_Y:", v9);
        goto LABEL_14;
      case 2:
        *(float *)&double v2 = self->_props.digitizerWidth;
        objc_msgSend(v21, "setCenter_X:", v2);
        *(float *)&double v8 = self->_props.deviceCenterY;
        objc_msgSend(v21, "setCenter_Y:", v8);
        goto LABEL_14;
      case 3:
        objc_msgSend(v21, "setCenter_X:", 0.0);
        *(float *)&double v10 = self->_props.deviceCenterY;
        objc_msgSend(v21, "setCenter_Y:", v10);
        goto LABEL_14;
      case 4:
        *(float *)&double v2 = self->_props.digitizerWidth;
        objc_msgSend(v21, "setCenter_X:", v2);
        objc_msgSend(v21, "setCenter_Y:", 0.0);
        goto LABEL_14;
      case 5:
        objc_msgSend(v21, "setCenter_X:");
        LODWORD(v11) = 0;
        objc_msgSend(v21, "setCenter_Y:", v11);
        goto LABEL_14;
      case 6:
        *(float *)&double v2 = self->_props.digitizerWidth;
        objc_msgSend(v21, "setCenter_X:", v2);
        *(float *)&double v12 = self->_props.digitizerHeight;
        objc_msgSend(v21, "setCenter_Y:", v12);
        goto LABEL_14;
      case 7:
        objc_msgSend(v21, "setCenter_X:", 0.0);
        *(float *)&double v13 = self->_props.digitizerHeight;
        objc_msgSend(v21, "setCenter_Y:", v13);
        goto LABEL_14;
      default:
        JUMPOUT(0);
    }
  }
  *(float *)&double v2 = self->_props.deviceCenterX;
  objc_msgSend(v21, "setCenter_X:", v2);
  objc_msgSend(v21, "setCenter_Y:", 0.0);
LABEL_14:
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
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
    int v17 = [v21 orientation];
    objc_msgSend(v21, "center_X");
    *(double *)&uint64_t v18 = v14;
    objc_msgSend(v21, "center_Y");
    __os_log_helper_16_0_3_4_0_8_0_8_0((uint64_t)v23, v17, v18, COERCE__INT64(v15));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Hotspot for ALS %d: centerX %f centerY %f", v23, 0x1Cu);
  }
  return v21;
}

- (void)setTriggered:(int64_t)a3 forHotspot:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 != [a4 triggered])
  {
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
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
      __os_log_helper_16_2_4_4_0_4_0_8_32_8_32((uint64_t)v13, [a4 orientation], -[CBDigitizerFilter isActive](self, "isActive"), (uint64_t)(&kTouchStateStr)[objc_msgSend(a4, "triggered")], (uint64_t)(&kTouchStateStr)[a3]);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Hotspot for ALS %d: active = %d changed = %s to %s", v13, 0x22u);
    }
    [a4 setTriggered:a3];
    if (!a3)
    {
      [a4 touchTriggerDelay];
      +[CBAnalytics touchOcclusionElapsedDelay:](CBAnalytics, "touchOcclusionElapsedDelay:");
    }
    if ([(CBDigitizerFilter *)self isActive])
    {
      context = (void *)MEMORY[0x1BA9ECAE0]();
      id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v4 = [NSNumber numberWithInt:self->_orientation];
      double v9 = objc_msgSend(v5, "initWithObjectsAndKeys:", v4, @"TouchOrientation", objc_msgSend(NSNumber, "numberWithBool:", -[CBDigitizerFilter isObstructed](self, "isObstructed")), @"TouchIsObstucted", 0);
      [(CBFilter *)self sendNotificationForKey:@"TouchStateChanged" andValue:v9];
    }
  }
}

- (int)orientation
{
  return self->_orientation;
}

@end