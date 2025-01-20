void sub_221784BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void AOPMatchedCallback(void *a1, io_iterator_t iterator)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = IOIteratorNext(iterator);
  if (!v4)
  {
LABEL_17:
    [a1 updateReadyState];
    return;
  }
  uint64_t v6 = v4;
  *(void *)&long long v5 = 136315394;
  long long v13 = v5;
  v7 = (task_port_t *)MEMORY[0x263EF8960];
  while (1)
  {
    io_connect_t connect = 0;
    v8 = _BRLog_log_0;
    if (!_BRLog_log_0)
    {
      v8 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_0 = (uint64_t)v8;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v13;
      v16 = "void AOPMatchedCallback(void *, io_iterator_t)";
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_debug_impl(&dword_221782000, v8, OS_LOG_TYPE_DEBUG, "%s AOP service added: %u", buf, 0x12u);
    }
    if (objc_msgSend(a1, "service", v13))
    {
      uint64_t v9 = _BRLog_log_0;
      if (!_BRLog_log_0)
      {
        uint64_t v9 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_0 = (uint64_t)v9;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v13;
        v16 = "void AOPMatchedCallback(void *, io_iterator_t)";
        __int16 v17 = 1024;
        int v18 = v6;
        _os_log_error_impl(&dword_221782000, v9, OS_LOG_TYPE_ERROR, "%s Warning: unexpected second AOP Service: %u", buf, 0x12u);
      }
      IOObjectRelease(v6);
      goto LABEL_16;
    }
    [a1 setService:v6];
    if ([a1 fastHaptics]) {
      break;
    }
LABEL_16:
    uint64_t v6 = IOIteratorNext(iterator);
    if (!v6) {
      goto LABEL_17;
    }
  }
  uint64_t v10 = IOServiceOpen(v6, *v7, 0, &connect);
  if (!v10)
  {
    [a1 setConnect:connect];
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  v12 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    v12 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v12;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    AOPMatchedCallback_cold_1(v6, v11, v12);
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

uint64_t serviceAddedCallback(uint64_t a1, void *a2, uint64_t a3)
{
  long long v5 = _BRLog_log_1;
  if (!_BRLog_log_1)
  {
    long long v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_1 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    serviceAddedCallback_cold_1();
  }
  return [a2 serviceAddedHandler:a3];
}

uint64_t serviceRemovedCallback(uint64_t a1, void *a2, uint64_t a3)
{
  long long v5 = _BRLog_log_1;
  if (!_BRLog_log_1)
  {
    long long v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_1 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    serviceRemovedCallback_cold_1();
  }
  return [a2 serviceRemovedHandler:a3];
}

void sub_2217898EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t serviceAddedCallback_0(int a1, void *a2, IOHIDServiceClientRef service)
{
  IOHIDServiceClientGetRegistryID(service);
  long long v5 = _BRLog_log_2;
  if (!_BRLog_log_2)
  {
    long long v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_2 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    serviceAddedCallback_cold_1_0();
  }
  objc_msgSend((id)objc_msgSend(a2, "services"), "addObject:", service);
  IOHIDServiceClientRegisterRemovalCallback();
  return [a2 _setCachedPropertiesOnService:service];
}

void sub_22178B884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void serviceRemovedCallback_0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v5 = objc_msgSend(a2, "services", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if (CFEqual(v10, a3)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
    if (!v10) {
      goto LABEL_16;
    }
    uint64_t v11 = _BRLog_log_2;
    if (!_BRLog_log_2)
    {
      uint64_t v11 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_2 = (uint64_t)v11;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRInterfaceLegacy serviceRemovedHandler:]((__IOHIDServiceClient *)v10, v11);
    }
    objc_msgSend((id)objc_msgSend(a2, "services"), "removeObject:", v10);
  }
  else
  {
LABEL_16:
    v12 = _BRLog_log_2;
    if (!_BRLog_log_2)
    {
      v12 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_2 = (uint64_t)v12;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BRInterfaceLegacy serviceRemovedHandler:]((__IOHIDServiceClient *)a3, v12);
    }
  }
}

void AOPMatchedCallback_cold_1(int a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 136315650;
  *(void *)((char *)&v3 + 4) = "void AOPMatchedCallback(void *, io_iterator_t)";
  LOWORD(v4) = HIWORD(a1);
  HIWORD(v4) = 1024;
  OUTLINED_FUNCTION_1(&dword_221782000, a2, a3, "%s Error: couldn't open AOP Service: %u, code: %d", (const char *)v3, (unint64_t)"void AOPMatchedCallback(void *, io_iterator_t)" >> 32, v4);
}

void serviceAddedCallback_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_221782000, v0, v1, "%s Legacy service added: %p", v2, v3, v4, v5, 2u);
}

void serviceRemovedCallback_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_221782000, v0, v1, "%s Legacy service removed: %p", v2, v3, v4, v5, 2u);
}

void serviceAddedCallback_cold_1_0()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_221782000, v0, OS_LOG_TYPE_DEBUG, "%s Keyboard service added: %@", (uint8_t *)v1, 0x16u);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x270EF4418](client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x270EF4420]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingCallback()
{
  return MEMORY[0x270EF4440]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x270EF4470]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x270EF4490]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x270EF4498]();
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x270EF4660](service);
}

uint64_t IOHIDServiceClientRegisterRemovalCallback()
{
  return MEMORY[0x270EF4670]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x270EF4680](service, key, property);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x270F96010]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}