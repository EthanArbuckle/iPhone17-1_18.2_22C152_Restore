void sub_12D0(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t vars8;

  v7 = a3;
  v5 = a1;
  v6 = v5;
  if (a2 == 8)
  {
    (*(void (**)(void))(v5[8] + 16))();
  }
  else if (a2 == 2)
  {
    [v5 dequeueEvents];
  }
}

void sub_19C8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (CFNumberIsFloatType((CFNumberRef)v5))
  {
    [v5 doubleValue];
    uint64_t v7 = +[NSNumber numberWithInteger:(int)(v6 * 65535.0)];

    id v5 = (id)v7;
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
}

void sub_23D0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_23F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_240C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_2418(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_2430()
{
  sub_2418(__stack_chk_guard);
  sub_2424();
  sub_23F0(&dword_0, v0, v1, "0x%llx: initWithService failed", v2, v3, v4, v5, v6);
}

void sub_2498()
{
  sub_240C(__stack_chk_guard);
  sub_2424();
  sub_23F0(&dword_0, v0, v1, "0x%llx: Failed to create queue port", v2, v3, v4, v5, v6);
}

void sub_2500()
{
  sub_240C(__stack_chk_guard);
  sub_23B8();
  sub_23D0(&dword_0, v0, v1, "0x%llx: Failed to map memory: 0x%x", v2, v3);
}

void sub_2568()
{
  sub_240C(__stack_chk_guard);
  sub_23B8();
  sub_23D0(&dword_0, v0, v1, "0x%llx: user client open failed: 0x%x", v2, v3);
}

void sub_25D0()
{
  sub_240C(__stack_chk_guard);
  sub_23B8();
  sub_23D0(&dword_0, v0, v1, "0x%llx: IOServiceOpen failed: 0x%x", v2, v3);
}

void sub_2638()
{
  sub_2418(__stack_chk_guard);
  sub_23B8();
  sub_23D0(&dword_0, v0, v1, "0x%llx: Failed to retain service object 0x%x", v2, v3);
}

void sub_26A0()
{
  sub_2418(__stack_chk_guard);
  sub_2424();
  sub_23F0(&dword_0, v0, v1, "0x%llx: serialize fail", v2, v3, v4, v5, v6);
}

void sub_2708()
{
  sub_2418(__stack_chk_guard);
  sub_2424();
  sub_23F0(&dword_0, v0, v1, "0x%llx: Unable to create queue analytics", v2, v3, v4, v5, v6);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

void CFRelease(CFTypeRef cf)
{
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return _IOCFSerialize(object, options);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return _IOConnectMapMemory(connect, memoryType, intoTask, atAddress, ofSize, options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return _IOConnectSetCFProperty(connect, propertyName, property);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return _IOConnectSetNotificationPort(connect, type, port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return _IOConnectUnmapMemory(connect, memoryType, fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return _IODataQueueAllocateNotificationPort();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return _IODataQueueDequeue(dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return _IODataQueuePeek(dataQueue);
}

uint64_t IOHIDAnalyticsEventActivate()
{
  return _IOHIDAnalyticsEventActivate();
}

uint64_t IOHIDAnalyticsEventCancel()
{
  return _IOHIDAnalyticsEventCancel();
}

uint64_t IOHIDAnalyticsHistogramEventCreate()
{
  return _IOHIDAnalyticsHistogramEventCreate();
}

uint64_t IOHIDAnalyticsHistogramEventSetIntegerValue()
{
  return _IOHIDAnalyticsHistogramEventSetIntegerValue();
}

uint64_t IOHIDEventCreateWithBytesInternal()
{
  return _IOHIDEventCreateWithBytesInternal();
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t _IOHIDLogCategory()
{
  return __IOHIDLogCategory();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t dispatch_mach_cancel()
{
  return _dispatch_mach_cancel();
}

uint64_t dispatch_mach_create_f()
{
  return _dispatch_mach_create_f();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return _mach_vm_deallocate(target, address, size);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_dequeueEvents(void *a1, const char *a2, ...)
{
  return [a1 dequeueEvents];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mapMemory(void *a1, const char *a2, ...)
{
  return [a1 mapMemory];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_setupAnalytics(void *a1, const char *a2, ...)
{
  return [a1 setupAnalytics];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unmapMemory(void *a1, const char *a2, ...)
{
  return [a1 unmapMemory];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateUsageAnalytics(void *a1, const char *a2, ...)
{
  return [a1 updateUsageAnalytics];
}

id objc_msgSend_usageCountsDict(void *a1, const char *a2, ...)
{
  return [a1 usageCountsDict];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    objc_storeStrong((id *)&self->_queue, a3);
  uint64_t v7 = a3;
  f = (OS_dispatch_mach *)dispatch_mach_create_f();
  machChannel = self->_machChannel;
  self->_machChannel = f;
}

- (void)activate
{
  IOConnectSetNotificationPort(self->_connect, 0, self->_queuePort, 0);
  machChannel = self->_machChannel;
  uint64_t queuePort = self->_queuePort;
  _dispatch_mach_connect(machChannel, queuePort, 0, 0);
}

- (void)cancel
{
  uint64_t input = 0;
  IOConnectCallScalarMethod(self->_connect, 1u, &input, 1u, 0, 0);
  IOConnectSetNotificationPort(self->_connect, 0, 0, 0);
  [(IOHIDEventServicePlugin *)self unmapMemory];
  IOServiceClose(self->_connect);
  self->_connect = 0;
  dispatch_mach_cancel();
}

- (BOOL)setupAnalytics
{
  v11[0] = @"staticSize";
  uint64_t v3 = +[NSNumber numberWithUnsignedLongLong:self->_sharedMemorySize];
  v11[1] = @"queueType";
  v12[0] = v3;
  v12[1] = @"serviceQueue";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v5 = [v4 mutableCopy];

  CFProperty = (void *)IORegistryEntryCreateCFProperty(self->_service, @"DeviceUsagePairs", kCFAllocatorDefault, 0);
  uint64_t v7 = (void *)IORegistryEntryCreateCFProperty(self->_service, @"Transport", kCFAllocatorDefault, 0);
  if (CFProperty) {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFProperty, @"usagePairs", 3336, 1);
  }
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"transport"];
  }
  id v8 = (void *)IOHIDAnalyticsHistogramEventCreate();
  self->_usageAnalytics = v8;
  if (v8)
  {
    IOHIDAnalyticsEventActivate();
  }
  else
  {
    v10 = _IOHIDLogCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2708();
    }
  }
  return v8 != 0;
}

- (id)usageCountsDict
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = 0;
  usageCounts = self->_usageCounts;
  do
  {
    uint64_t v6 = *usageCounts++;
    uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:v6];
    id v8 = +[NSNumber numberWithUnsignedLong:v4];
    uint64_t v9 = [v8 stringValue];
    [v3 setObject:v7 forKeyedSubscript:v9];

    v4 += 10;
  }
  while (v4 != 110);
  return v3;
}

- (HIDEventDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);
  return (HIDEventDispatcher *)WeakRetained;
}

- (void)setDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_storeStrong((id *)&self->_machChannel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_providerProps, 0);
}

@end