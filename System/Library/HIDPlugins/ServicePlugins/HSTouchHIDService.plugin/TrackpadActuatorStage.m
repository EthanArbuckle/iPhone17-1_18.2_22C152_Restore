@interface TrackpadActuatorStage
- (BOOL)setFirmwareClicks:(int)a3 silentClick:(BOOL)a4;
- (OS_dispatch_queue)queue;
- (TrackpadActuatorStage)initWithDevice:(__MTDevice *)a3;
- (int)_openActuatorDevice;
- (unsigned)getActuationOptions:(int)a3 silentClick:(BOOL)a4;
- (void)_handleActuationEvent:(id)a3;
- (void)_handleCancelEvent:(id)a3;
- (void)_handleGetDebugEvent:(id)a3;
- (void)_handleHSTNotificationEvent:(id)a3;
- (void)_handleHostStateEvent:(id)a3;
- (void)_handleSetPropertyEvent:(id)a3;
- (void)_handleTPSettings:(id)a3;
- (void)_openActuatorDevice;
- (void)_updateHostClickControl;
- (void)dealloc;
- (void)handleActMatching:(unsigned int)a3;
- (void)handleConsume:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TrackpadActuatorStage

- (TrackpadActuatorStage)initWithDevice:(__MTDevice *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TrackpadActuatorStage;
  v7 = [(HSStage *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_mtDevice = a3;
    v7->_actDevice = 0;
    v7->_actuatorEntryID = 0;
    v7->_actuationsEnabled = 0;
    [(TrackpadActuatorStage *)v7 _openActuatorDevice];
    v8->_lastClickStrengthOptions = 0;
    v8->_actuatorMatchedNotifierPortRef = 0;
    v8->_actuatorMatchedIterator = 0;
    v8->_displayState = 0;
    MTDeviceSupportsSilentClick();
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    [(MouseBridge *)v4 dealloc];
  }
  v5.receiver = self;
  v5.super_class = (Class)TrackpadActuatorStage;
  [(HSStage *)&v5 dealloc];
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_continuous_time();
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7) {
    [(TrackpadActuatorStage *)self _handleActuationEvent:v6];
  }
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
    [(TrackpadActuatorStage *)self _handleTPSettings:v8];
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
      [(TrackpadActuatorStage *)self _handleHSTNotificationEvent:v10];
    }
    else
    {
      id v12 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }

      if (v13)
      {
        [(TrackpadActuatorStage *)self _handleSetPropertyEvent:v12];
      }
      else
      {
        id v14 = v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }

        if (v15)
        {
          [(TrackpadActuatorStage *)self _handleCancelEvent:v14];
        }
        else
        {
          v16 = HSUtil::DynamicCast<HSTGetDebugStateEvent>(v14);

          if (v16)
          {
            [(TrackpadActuatorStage *)self _handleGetDebugEvent:v14];
          }
          else
          {
            v17 = HSUtil::DynamicCast<HSTHostStateEvent>(v14);

            if (v17)
            {
              [(TrackpadActuatorStage *)self _handleHostStateEvent:v14];
            }
            else
            {
              v20.receiver = self;
              v20.super_class = (Class)TrackpadActuatorStage;
              [(HSStage *)&v20 handleConsume:v14];
            }
          }
        }
      }
    }
  }
  v18 = MTLoggingPlugin();
  if (os_signpost_enabled(v18))
  {
    ClassName = object_getClassName(v8);
    *(_DWORD *)buf = 134349314;
    uint64_t v22 = v5;
    __int16 v23 = 2080;
    v24 = ClassName;
    _os_signpost_emit_with_name_impl(&def_411C8, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TrackpadActuatorStage", "%{public, signpost.description:begin_time}llu event=%s", buf, 0x16u);
  }
}

- (void)_handleCancelEvent:(id)a3
{
  id v4 = a3;
  io_object_t actuatorMatchedIterator = self->_actuatorMatchedIterator;
  if (actuatorMatchedIterator)
  {
    IOObjectRelease(actuatorMatchedIterator);
    self->_io_object_t actuatorMatchedIterator = 0;
  }
  actuatorMatchedNotifierPortRef = self->_actuatorMatchedNotifierPortRef;
  if (actuatorMatchedNotifierPortRef)
  {
    IONotificationPortDestroy(actuatorMatchedNotifierPortRef);
    self->_actuatorMatchedNotifierPortRef = 0;
  }
  self->_mtDevice = 0;
  self->_actDevice = 0;
  v7.receiver = self;
  v7.super_class = (Class)TrackpadActuatorStage;
  [(HSStage *)&v7 handleConsume:v4];
}

- (void)_handleActuationEvent:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (self->_actuationsEnabled)
  {
    kdebug_trace();
    [(TrackpadActuatorStage *)self getActuationOptions:v4[3] silentClick:self->_silentClickEnabled];
    MTActuatorActuate();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Actuations disabled - Dropping actuation event", v5, 2u);
  }
}

- (void)_handleTPSettings:(id)a3
{
  id v4 = (char *)a3;
  id v8 = v4;
  unsigned int v5 = *(_DWORD *)(v4 + 43);
  if (v5 >= 3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  BOOL v7 = self->_supportsSilentClick && *(_DWORD *)(v4 + 51) == 0;
  self->_silentClickEnabled = v7;
  -[TrackpadActuatorStage setFirmwareClicks:silentClick:](self, "setFirmwareClicks:silentClick:", v6);
}

- (void)_handleHSTNotificationEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 notification];
  if (v5 <= 10)
  {
    if (v5 != 1 && v5 != 8) {
      goto LABEL_9;
    }
LABEL_8:
    [(TrackpadActuatorStage *)self _updateHostClickControl];
    goto LABEL_9;
  }
  if (v5 == 11) {
    goto LABEL_8;
  }
  if (v5 == 13) {
    self->_actuationsEnabled = MTActuatorGetSystemActuationsEnabled();
  }
LABEL_9:
  v6.receiver = self;
  v6.super_class = (Class)TrackpadActuatorStage;
  [(HSStage *)&v6 handleConsume:v4];
}

- (void)_handleSetPropertyEvent:(id)a3
{
  id v12 = (char *)a3;
  id v4 = *((id *)v12 + 5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  objc_super v6 = v12 + 16;
  int v7 = v12[39];
  if (v7 < 0)
  {
    if (*((void *)v12 + 3) != 16) {
      goto LABEL_20;
    }
    objc_super v6 = (void *)*v6;
  }
  else if (v7 != 16)
  {
    goto LABEL_20;
  }
  id v9 = (void *)*v6;
  uint64_t v8 = v6[1];
  if (v9 == (void *)0x634164616F6C6552 && v8 == 0x736E6F6974617574)
  {
    BOOL v11 = !self->_actDevice || v5 == 0;
    if (!v11 && [v5 BOOLValue]) {
      MTActuatorLoadActuations();
    }
  }
LABEL_20:
}

- (void)_handleGetDebugEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TrackpadActuatorStage _handleGetDebugEvent:]");
    [v13 handleFailureInFunction:v14, @"TrackpadActuatorStage.mm", 198, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  uint64_t SystemActuationsEnabled = MTActuatorGetSystemActuationsEnabled();
  v16[0] = @"Stage";
  objc_super v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  v17[0] = v7;
  v16[1] = @"SilentClickSupported";
  uint64_t v8 = +[NSNumber numberWithBool:self->_supportsSilentClick];
  v17[1] = v8;
  v16[2] = @"SilentClickEnabled";
  id v9 = +[NSNumber numberWithBool:self->_silentClickEnabled];
  v17[2] = v9;
  v16[3] = @"FirmwareHostClickMode";
  id v10 = +[NSNumber numberWithBool:SystemActuationsEnabled];
  v17[3] = v10;
  v16[4] = @"DisplayState";
  BOOL v11 = +[NSNumber numberWithUnsignedChar:self->_displayState];
  v17[4] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];

  *((unsigned char *)v4 + 16) = 1;
  [*((id *)v4 + 3) addObject:v12];
  v15.receiver = self;
  v15.super_class = (Class)TrackpadActuatorStage;
  [(HSStage *)&v15 handleConsume:v4];
}

- (void)_handleHostStateEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 displayOff]) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
    if (self->_displayState != v6)
    {
      self->_displayState = v6;
      [(TrackpadActuatorStage *)self _updateHostClickControl];
    }
  }
  else
  {
    uint64_t v9 = 0;
    MTDeviceGetDeviceID();
    int v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = v9;
      _os_log_impl(&def_411C8, v7, OS_LOG_TYPE_ERROR, "Received nil host state event (deviceID 0x%llX)", buf, 0xCu);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)TrackpadActuatorStage;
  [(HSStage *)&v8 handleConsume:v5];
}

- (void)_updateHostClickControl
{
  if (self->_displayState == 1)
  {
    MTDeviceGetDeviceID();
    v3 = MTLoggingPlugin();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v9 = 0;
      _os_log_impl(&def_411C8, v3, OS_LOG_TYPE_DEFAULT, "Handing off host click control (deviceID 0x%llX)", buf, 0xCu);
    }

    int v4 = MTActuatorHandoffHostClickControl();
    if (!v4) {
      return;
    }
LABEL_9:
    MTDeviceGetDeviceID();
    int v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 displayState = self->_displayState;
      *(_DWORD *)buf = 16777984;
      LOBYTE(v9[0]) = displayState;
      *(_WORD *)((char *)v9 + 1) = 1024;
      *(_DWORD *)((char *)v9 + 3) = v4;
      *(_WORD *)((char *)&v9[1] + 3) = 2048;
      *(void *)((char *)&v9[2] + 1) = 0;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_ERROR, "Failed to update host click control displayState=%hhu status=0x%08X (deviceID 0x%llX)", buf, 0x15u);
    }

    return;
  }
  MTDeviceGetDeviceID();
  id v5 = MTLoggingPlugin();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v9 = 0;
    _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "Reclaiming host click control (deviceID 0x%llX)", buf, 0xCu);
  }

  int v4 = MTActuatorReclaimHostClickControl();
  if (v4) {
    goto LABEL_9;
  }
}

- (int)_openActuatorDevice
{
  self->_actDevice = (__MTActuator *)MTDeviceGetMTActuator();
  io_registry_entry_t Service = MTActuatorGetService();
  IORegistryEntryGetRegistryEntryID(Service, &self->_actuatorEntryID);
  int v4 = MTActuatorOpen();
  if (v4)
  {
    id v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(TrackpadActuatorStage *)v4 _openActuatorDevice];
    }
  }
  self->_actuationsEnabled = MTActuatorGetSystemActuationsEnabled();
  [(TrackpadActuatorStage *)self _updateHostClickControl];
  return v4;
}

- (unsigned)getActuationOptions:(int)a3 silentClick:(BOOL)a4
{
  if (a3 > 2) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = dword_11102C[a3];
  }
  if (a4) {
    return v4 | 8;
  }
  else {
    return v4;
  }
}

- (BOOL)setFirmwareClicks:(int)a3 silentClick:(BOOL)a4
{
  unsigned int v5 = [(TrackpadActuatorStage *)self getActuationOptions:*(void *)&a3 silentClick:a4];
  if (v5 != self->_lastClickStrengthOptions)
  {
    self->_lastClickStrengthOptions = v5;
    MTActuatorSetFirmwareClicks();
  }
  return 1;
}

- (void)handleActMatching:(unsigned int)a3
{
  io_object_t v5 = IOIteratorNext(a3);
  if (v5)
  {
    io_registry_entry_t v6 = v5;
    char v7 = 0;
    do
    {
      *(void *)uint64_t v11 = 0;
      if (!IORegistryEntryGetRegistryEntryID(v6, (uint64_t *)v11)) {
        v7 |= *(void *)v11 == self->_actuatorEntryID;
      }
      IOObjectRelease(v6);
      io_registry_entry_t v6 = IOIteratorNext(a3);
    }
    while (v6);
    if (v7) {
      goto LABEL_15;
    }
  }
  if (!self->_mtDevice)
  {
LABEL_15:
    objc_super v8 = MTLoggingPlugin();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[TrackpadActuatorStage handleActMatching:]((uint64_t)self, v8);
    }
  }
  else
  {
    if (self->_actDevice)
    {
      MTActuatorClose();
      CFRelease(self->_actDevice);
      self->_mtDevice->var4 = 0;
      self->_actDevice = 0;
    }
    [(TrackpadActuatorStage *)self _openActuatorDevice];
    objc_super v8 = MTLoggingPlugin();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t actuatorEntryID = self->_actuatorEntryID;
      if (self->_actuationsEnabled) {
        id v10 = "YES";
      }
      else {
        id v10 = "NO";
      }
      *(_DWORD *)uint64_t v11 = 134218242;
      *(void *)&v11[4] = actuatorEntryID;
      __int16 v12 = 2080;
      id v13 = v10;
      _os_log_impl(&def_411C8, v8, OS_LOG_TYPE_DEFAULT, "Actuator matched - 0x%08llx, actuations enabled : %s", v11, 0x16u);
    }
  }
}

- (void)setQueue:(id)a3
{
  unsigned int v4 = a3;
  if (v4)
  {
    if (MTDeviceSupportsActuation())
    {
      io_object_t v5 = IONotificationPortCreate(kIOMainPortDefault);
      self->_actuatorMatchedNotifierPortRef = v5;
      if (v5)
      {
        uint64_t valuePtr = 0;
        MTDeviceGetDeviceID();
        CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        objc_super v8 = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        uint64_t v9 = v8;
        if (v6 && Mutable && v8)
        {
          CFDictionarySetValue(v8, @"Multitouch Actuator ID", v6);
          CFDictionarySetValue(Mutable, @"IOPropertyMatch", v9);
          CFRetain(Mutable);
          if (IOServiceAddMatchingNotification(self->_actuatorMatchedNotifierPortRef, "IOServiceFirstMatch", Mutable, (IOServiceMatchingCallback)actMatchedCallback, self, &self->_actuatorMatchedIterator))
          {
            id v10 = MTLoggingPlugin();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              -[TrackpadActuatorStage setQueue:](v10);
            }
          }
          else
          {
            [(TrackpadActuatorStage *)self handleActMatching:self->_actuatorMatchedIterator];
          }
        }
        IONotificationPortSetDispatchQueue(self->_actuatorMatchedNotifierPortRef, v4);
        if (v6) {
          CFRelease(v6);
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
        if (v9) {
          CFRelease(v9);
        }
      }
    }
  }
  else
  {
    dispatch_assert_queue_not_V2(0);
    actuatorMatchedNotifierPortRef = self->_actuatorMatchedNotifierPortRef;
    if (actuatorMatchedNotifierPortRef)
    {
      IONotificationPortDestroy(actuatorMatchedNotifierPortRef);
      self->_actuatorMatchedNotifierPortRef = 0;
    }
  }
  queue = self->_queue;
  self->_queue = (OS_dispatch_queue *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

- (void)_openActuatorDevice
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&def_411C8, a2, OS_LOG_TYPE_ERROR, "Failed to open actuator - 0x%08x", (uint8_t *)v2, 8u);
}

- (void)handleActMatching:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 136);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&def_411C8, a2, OS_LOG_TYPE_DEBUG, "Skip actuator setup - 0x%08llx", (uint8_t *)&v3, 0xCu);
}

- (void)setQueue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&def_411C8, log, OS_LOG_TYPE_ERROR, "Failed to add actuator matching notification", v1, 2u);
}

@end