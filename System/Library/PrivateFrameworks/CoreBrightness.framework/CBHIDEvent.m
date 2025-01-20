@interface CBHIDEvent
+ (id)newEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4;
- (CBHIDEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4;
- (NSArray)copyChildren;
- (NSNumber)serviceRegistryID;
- (__IOHIDEvent)event;
- (__IOHIDServiceClient)service;
- (float)floatValueForKey:(unsigned int)a3;
- (float)timestamp;
- (int)integerValueForKey:(unsigned int)a3;
- (unsigned)eventType;
- (void)dealloc;
- (void)setEvent:(__IOHIDEvent *)a3;
- (void)setService:(__IOHIDServiceClient *)a3;
@end

@implementation CBHIDEvent

- (unsigned)eventType
{
  return IOHIDEventGetType();
}

- (float)timestamp
{
  return (double)(unint64_t)IOHIDEventGetTimeStamp() * self->_sMachTimebaseFactor;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_event) {
    CFRelease(v4->_event);
  }
  if (v4->_service) {
    CFRelease(v4->_service);
  }

  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBHIDEvent;
  [(CBHIDEvent *)&v2 dealloc];
}

- (float)floatValueForKey:(unsigned int)a3
{
  IOHIDEventGetFloatValue();
  return v3;
}

- (int)integerValueForKey:(unsigned int)a3
{
  return IOHIDEventGetIntegerValue();
}

- (NSArray)copyChildren
{
  v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    for (int i = 0; i < CFArrayGetCount(Children); ++i)
    {
      id v3 = +[CBHIDEvent newEvent:CFArrayGetValueAtIndex(Children, i) andService:self->_service];
      [(NSArray *)v6 addObject:v3];
    }
  }
  return v6;
}

- (__IOHIDServiceClient)service
{
  return self->_service;
}

+ (id)newEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4
{
  if (IOHIDEventGetType() == 12) {
    return [[CBALSEvent alloc] initWithHIDEvent:a3 andService:a4];
  }
  else {
    return [[CBHIDEvent alloc] initWithHIDEvent:a3 andService:a4];
  }
}

- (CBHIDEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4
{
  v37 = self;
  SEL v36 = a2;
  v35 = a3;
  v34 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CBHIDEvent;
  v37 = [(CBHIDEvent *)&v33 init];
  if (!v37) {
    return v37;
  }
  os_log_t v4 = os_log_create("com.apple.CoreBrightness.CBHIDEvent", "default");
  v37->_logHandle = (OS_os_log *)v4;
  if (!v35)
  {
    v32 = 0;
    if (v37->_logHandle)
    {
      logHandle = v37->_logHandle;
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
    v32 = logHandle;
    char v31 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v32;
      os_log_type_t type = v31;
      __os_log_helper_16_0_0(v30);
      _os_log_error_impl(&dword_1BA438000, log, type, "error: invalid HID event", v30, 2u);
    }
    goto LABEL_36;
  }
  CFRetain(v35);
  v37->_event = v35;
  if (!v34)
  {
    v29 = 0;
    if (v37->_logHandle)
    {
      v17 = v37->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v16 = init_default_corebrightness_log();
      }
      v17 = v16;
    }
    v29 = v17;
    char v28 = 16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v14 = v29;
      os_log_type_t v15 = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_error_impl(&dword_1BA438000, v14, v15, "error: invalid HID service", v27, 2u);
    }
    goto LABEL_36;
  }
  CFRetain(v34);
  v37->_service = v34;
  id RegistryID = (id)IOHIDServiceClientGetRegistryID(v34);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v25 = 0;
    if (v37->_logHandle)
    {
      v13 = v37->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v12 = init_default_corebrightness_log();
      }
      v13 = v12;
    }
    v25 = v13;
    char v24 = 16;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v10 = v25;
      os_log_type_t v11 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_error_impl(&dword_1BA438000, v10, v11, "error: invalid service registry ID", v23, 2u);
    }
LABEL_36:

    v37 = 0;
    return 0;
  }
  uint64_t v6 = [RegistryID copy];
  v37->_serviceid RegistryID = (NSNumber *)v6;
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v8) = info.denom;
  LODWORD(v7) = info.numer;
  v37->_sMachTimebaseFactor = (double)v7 / (double)v8 * 0.000000001;
  return v37;
}

- (NSNumber)serviceRegistryID
{
  return self->_serviceRegistryID;
}

- (__IOHIDEvent)event
{
  return self->_event;
}

- (void)setEvent:(__IOHIDEvent *)a3
{
  self->_event = a3;
}

- (void)setService:(__IOHIDServiceClient *)a3
{
  self->_service = a3;
}

@end