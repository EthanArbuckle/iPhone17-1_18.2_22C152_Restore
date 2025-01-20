@interface CBHIDService
- (BOOL)builtIn;
- (BOOL)conformsToHIDService:(__IOHIDServiceClient *)a3;
- (BOOL)conformsToUsagePage:(unint64_t)a3 andUsage:(unint64_t)a4;
- (BOOL)setPropertyForKey:(id)a3 withValue:(id)a4;
- (BOOL)updateEventData;
- (CBHIDService)init;
- (CBHIDService)initWithHIDServiceClient:(__IOHIDServiceClient *)a3 andIdentifier:(id)a4;
- (__IOHIDEvent)event;
- (__IOHIDServiceClient)service;
- (id)copyPropertyForKey:(id)a3;
- (unint64_t)registryID;
- (void)dealloc;
- (void)setEvent:(__IOHIDEvent *)a3;
@end

@implementation CBHIDService

- (CBHIDService)init
{
  return 0;
}

- (CBHIDService)initWithHIDServiceClient:(__IOHIDServiceClient *)a3 andIdentifier:(id)a4
{
  v23 = self;
  SEL v22 = a2;
  v21 = a3;
  id v20 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CBHIDService;
  v23 = [(CBHIDService *)&v19 init];
  if (v23)
  {
    v23->_service = v21;
    CFRetain(v23->_service);
    id RegistryID = 0;
    id RegistryID = (id)IOHIDServiceClientGetRegistryID(v23->_service);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [RegistryID unsignedIntegerValue];
      v23->_registryID = v4;
    }
    id v17 = 0;
    if (v20)
    {
      id v17 = (id)[v20 copy];
    }
    else
    {
      id v5 = [NSString alloc];
      id v17 = (id)objc_msgSend(v5, "initWithFormat:", @"com.apple.CBHIDService.%lu", v23->_registryID);
    }
    if (v17)
    {
      os_log_t v6 = os_log_create((const char *)[v17 cStringUsingEncoding:1], "default");
      v23->_logHandle = (OS_os_log *)v6;

      id v17 = 0;
    }
    else
    {
      os_log_t v7 = os_log_create("com.apple.CBHIDService", "default");
      v23->_logHandle = (OS_os_log *)v7;
    }
    if (!v23->_logHandle)
    {
      v16 = 0;
      v12 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v16 = v12;
      char v15 = 16;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        log = v16;
        os_log_type_t type = v15;
        __os_log_helper_16_0_0(v14);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v14, 2u);
      }
    }
    id v13 = (id)IOHIDServiceClientCopyProperty(v23->_service, @"Built-In");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = [v13 BOOLValue];
      v23->_builtIn = v8 & 1;
    }
  }
  return v23;
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  if (self->_event) {
    CFRelease(v4->_event);
  }
  if (v4->_logHandle) {

  }
  CFRelease(v4->_service);
  v2.receiver = v4;
  v2.super_class = (Class)CBHIDService;
  [(CBHIDService *)&v2 dealloc];
}

- (BOOL)conformsToUsagePage:(unint64_t)a3 andUsage:(unint64_t)a4
{
  return IOHIDServiceClientConformsTo(self->_service, a3, a4) != 0;
}

- (BOOL)conformsToHIDService:(__IOHIDServiceClient *)a3
{
  return a3 == self->_service;
}

- (id)copyPropertyForKey:(id)a3
{
  return (id)IOHIDServiceClientCopyProperty(self->_service, (CFStringRef)a3);
}

- (BOOL)setPropertyForKey:(id)a3 withValue:(id)a4
{
  return IOHIDServiceClientSetProperty(self->_service, (CFStringRef)a3, a4) != 0;
}

- (void)setEvent:(__IOHIDEvent *)a3
{
  if (self->_event) {
    CFRelease(self->_event);
  }
  self->_event = a3;
  CFRetain(self->_event);
}

- (__IOHIDEvent)event
{
  return self->_event;
}

- (BOOL)updateEventData
{
  return 0;
}

- (__IOHIDServiceClient)service
{
  return self->_service;
}

- (unint64_t)registryID
{
  return self->_registryID;
}

- (BOOL)builtIn
{
  return self->_builtIn;
}

@end