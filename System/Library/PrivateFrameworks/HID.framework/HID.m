void _removalCallback(uint64_t a1, uint64_t a2, char *a3)
{
  int *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  char *v6;
  uint64_t vars8;

  v3 = (int *)MEMORY[0x1E4F2EEE8];
  v4 = *(void *)&a3[*MEMORY[0x1E4F2EEE8] + 112];
  if (v4)
  {
    v5 = *(void (**)(uint64_t))(v4 + 16);
    v6 = a3;
    v5(v4);
    _Block_release(*(const void **)&v6[*v3 + 112]);
    *(void *)&v6[*v3 + 112] = 0;
  }
}

uint64_t __HIDVirtualServiceCopyEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = a1;
  v10 = [v9 delegate];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12 = [NSNumber numberWithUnsignedInt:a4];
    [v11 setObject:v12 forKeyedSubscript:@"EventType"];

    [v11 setObject:a5 forKeyedSubscript:@"MatchingEvent"];
    v13 = [NSNumber numberWithUnsignedInt:a6];
    [v11 setObject:v13 forKeyedSubscript:@"MatchingEventOptions"];

    uint64_t v14 = [v10 copyEventMatching:v11 forService:v9];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void sub_1DB6FEA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __HIDVirtualServiceNotifyCallback(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  id v9 = a1;
  v7 = [v9 delegate];
  v8 = v7;
  if (v7 && (a4 - 3) <= 2) {
    [v7 notification:qword_1DB707CA0[a4 - 3] withProperty:a5 forService:v9];
  }
}

uint64_t __HIDVirtualServiceSetPropertyCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = a1;
  v8 = [v7 delegate];
  id v9 = v8;
  if (v8) {
    uint64_t v10 = [v8 setProperty:a5 forKey:a4 forService:v7];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __HIDVirtualServiceCopyPropertyCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = a1;
  v6 = [v5 delegate];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 propertyForKey:a4 forService:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t _eventCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16))();
}

uint64_t _serviceCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __HIDVirtualServiceSetOutputEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = a1;
  v6 = [v5 delegate];
  id v7 = v6;
  if (v6)
  {
    if ([v6 setOutputEvent:a4 forService:v5]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 3758097084;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __HIDVirtualServiceClientCopyMatchingEventCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = a1;
  v6 = [v5 delegate];
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 copyEventMatching:a4 forService:v5];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

void inputValueCallback(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  v6 = a1;
  IOHIDValueGetElement(a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setValueRef:a4];
  uint64_t v7 = v6[2];

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a3, v8);
}

uint64_t deviceAddedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

uint64_t deviceRemovedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

void inputReportCallback(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (objc_class *)MEMORY[0x1E4F1C9B8];
  v15 = a1;
  id v17 = (id)[[v14 alloc] initWithBytesNoCopy:a6 length:a7 freeWhenDone:0];
  uint64_t v16 = v15[4];

  (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, id))(v16 + 16))(v16, a3, a8, a4, a5, v17);
}

double OUTLINED_FUNCTION_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void asyncReportCallback(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  v12 = (void (**)(id, uint64_t, uint64_t, uint64_t, void))_Block_copy(a1);
  v12[2](v12, a2, a6, a7, a5);
  _Block_release(a1);
}

void inputValueCallback_0(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  id v8 = a1;
  id v5 = IOHIDValueGetElement(a4);
  [v5 setValueRef:a4];
  if (atomic_load((unint64_t *)&v8[*MEMORY[0x1E4F2EED8] + 312]))
  {
    unint64_t v7 = atomic_load((unint64_t *)&v8[*MEMORY[0x1E4F2EED8] + 312]);
    (*(void (**)(unint64_t, void *))(v7 + 16))(v7, v5);
  }
}

void batchInputValueCallback(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  uint64_t v10 = a1;
  id v5 = IOHIDValueGetElement(a4);
  [v5 setValueRef:a4];
  v6 = (int *)MEMORY[0x1E4F2EED8];
  os_unfair_recursive_lock_lock_with_options();
  id v7 = *(id *)&v10[*v6 + 280];
  if ([v5 type] == 5)
  {
    if (atomic_load((unint64_t *)&v10[*v6 + 312]))
    {
      unint64_t v9 = atomic_load((unint64_t *)&v10[*v6 + 312]);
      (*(void (**)(unint64_t, id))(v9 + 16))(v9, v7);
    }
    [v7 removeAllObjects];
  }
  else
  {
    [v7 addObject:v5];
  }
  os_unfair_recursive_lock_unlock();
}

void removalCallback(char *a1)
{
  v1 = (int *)MEMORY[0x1E4F2EED8];
  if (atomic_load((unint64_t *)&a1[*MEMORY[0x1E4F2EED8] + 320]))
  {
    unint64_t v3 = atomic_load((unint64_t *)&a1[*MEMORY[0x1E4F2EED8] + 320]);
    v4 = *(void (**)(unint64_t))(v3 + 16);
    v6 = a1;
    v4(v3);
    id v5 = (const void *)atomic_load((unint64_t *)&v6[*v1 + 320]);
    _Block_release(v5);
    atomic_store(0, (unint64_t *)&v6[*v1 + 320]);
  }
}

void inputReportCallback_0(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v17 = a1;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a6 length:a7 freeWhenDone:0];
  if (atomic_load((unint64_t *)&v17[*MEMORY[0x1E4F2EED8] + 328]))
  {
    unint64_t v16 = atomic_load((unint64_t *)&v17[*MEMORY[0x1E4F2EED8] + 328]);
    (*(void (**)(unint64_t, uint64_t, uint64_t, void, void, void *))(v16 + 16))(v16, a3, a8, a4, a5, v14);
  }
}

uint64_t _resetCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

uint64_t _eventFilterCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t _propertiesChangedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void asyncCommitCallback(const void *a1, uint64_t a2)
{
  v4 = (void (**)(id, void))_Block_copy(a1);
  v4[2](v4, a2);
  _Block_release(a1);
}

uint64_t getReportCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16))();
  uint64_t v7 = *a5;
  if (*a5 >= v8) {
    uint64_t v7 = v8;
  }
  *a5 = v7;
  return result;
}

uint64_t setReportCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFRelease(CFTypeRef cf)
{
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
}

void IOHIDDeviceCancel(IOHIDDeviceRef device)
{
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1F40E8798](device, *(void *)&options);
}

Boolean IOHIDDeviceConformsTo(IOHIDDeviceRef device, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x1F40E87A0](device, *(void *)&usagePage, *(void *)&usage);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x1F40E87A8](device, matching, *(void *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x1F40E87B0](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E87B8](device, key);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x1F40E87C8](device, *(void *)&reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceGetReportWithCallback(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x1F40E87D0](device, *(void *)&reportType, reportID, report, pReportLength, callback, context, timeout);
}

io_service_t IOHIDDeviceGetService(IOHIDDeviceRef device)
{
  return MEMORY[0x1F40E87D8](device);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1F40E87E8](device, *(void *)&options);
}

void IOHIDDeviceRegisterInputReportWithTimeStampCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportWithTimeStampCallback callback, void *context)
{
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
}

void IOHIDDeviceSetCancelHandler(IOHIDDeviceRef device, dispatch_block_t handler)
{
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
}

void IOHIDDeviceSetInputValueMatching(IOHIDDeviceRef device, CFDictionaryRef matching)
{
}

void IOHIDDeviceSetInputValueMatchingMultiple(IOHIDDeviceRef device, CFArrayRef multiple)
{
}

Boolean IOHIDDeviceSetProperty(IOHIDDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1F40E8838](device, key, property);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1F40E8848](device, *(void *)&reportType, reportID, report, reportLength);
}

IOReturn IOHIDDeviceSetReportWithCallback(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x1F40E8850](device, *(void *)&reportType, reportID, report, reportLength, callback, context, timeout);
}

CFArrayRef IOHIDElementGetChildren(IOHIDElementRef element)
{
  return (CFArrayRef)MEMORY[0x1F40E8860](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x1F40E8868](element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x1F40E8870](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x1F40E8878](element);
}

IOHIDElementRef IOHIDElementGetParent(IOHIDElementRef element)
{
  return (IOHIDElementRef)MEMORY[0x1F40E8880](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x1F40E8888](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x1F40E8890](element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return MEMORY[0x1F40E8898](element);
}

uint32_t IOHIDElementGetReportSize(IOHIDElementRef element)
{
  return MEMORY[0x1F40E88A0](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x1F40E88A8](element);
}

uint32_t IOHIDElementGetUnit(IOHIDElementRef element)
{
  return MEMORY[0x1F40E88B8](element);
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return MEMORY[0x1F40E88C0](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x1F40E88C8](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x1F40E88D0](element);
}

uint64_t IOHIDEventConformsTo()
{
  return MEMORY[0x1F40E88E0]();
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x1F40E88E8]();
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x1F40E8908]();
}

uint64_t IOHIDEventCreateWithBytes()
{
  return MEMORY[0x1F40E89A8]();
}

uint64_t IOHIDEventCreateWithData()
{
  return MEMORY[0x1F40E89B0]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventRemoveEvent()
{
  return MEMORY[0x1F40E8A58]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x1F40E8A90]();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x1F40E8AA0]();
}

CFTypeRef IOHIDEventSystemClientCopyProperty(IOHIDEventSystemClientRef client, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E8AB0](client, key);
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1F40E8AB8](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1F40E8AC8]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingCallback()
{
  return MEMORY[0x1F40E8AE0]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1F40E8AF0]();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterCallback()
{
  return MEMORY[0x1F40E8AF8]();
}

uint64_t IOHIDEventSystemClientRegisterPropertyChangedCallback()
{
  return MEMORY[0x1F40E8B08]();
}

uint64_t IOHIDEventSystemClientRegisterResetCallback()
{
  return MEMORY[0x1F40E8B10]();
}

uint64_t IOHIDEventSystemClientSetCancelHandler()
{
  return MEMORY[0x1F40E8B28]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1F40E8B38]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x1F40E8B40]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1F40E8B48](client, key, property);
}

void IOHIDManagerActivate(IOHIDManagerRef manager)
{
}

void IOHIDManagerCancel(IOHIDManagerRef manager)
{
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1F40E8C50](manager, *(void *)&options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x1F40E8C58](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1F40E8C68](allocator, *(void *)&options);
}

CFTypeRef IOHIDManagerGetProperty(IOHIDManagerRef manager, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E8C78](manager, key);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1F40E8C80](manager, *(void *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterInputReportWithTimeStampCallback(IOHIDManagerRef manager, IOHIDReportWithTimeStampCallback callback, void *context)
{
}

void IOHIDManagerRegisterInputValueCallback(IOHIDManagerRef manager, IOHIDValueCallback callback, void *context)
{
}

void IOHIDManagerSetCancelHandler(IOHIDManagerRef manager, dispatch_block_t handler)
{
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

void IOHIDManagerSetDispatchQueue(IOHIDManagerRef manager, dispatch_queue_t queue)
{
}

void IOHIDManagerSetInputValueMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerSetInputValueMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

Boolean IOHIDManagerSetProperty(IOHIDManagerRef manager, CFStringRef key, CFTypeRef value)
{
  return MEMORY[0x1F40E8CF0](manager, key, value);
}

BOOLean_t IOHIDServiceClientConformsTo(IOHIDServiceClientRef service, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x1F40E8D00](service, *(void *)&usagePage, *(void *)&usage);
}

uint64_t IOHIDServiceClientCopyMatchingEvent()
{
  return MEMORY[0x1F40E8D10]();
}

uint64_t IOHIDServiceClientCopyProperties()
{
  return MEMORY[0x1F40E8D18]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E8D20](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x1F40E8D40](service);
}

uint64_t IOHIDServiceClientRegisterRemovalCallback()
{
  return MEMORY[0x1F40E8D58]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1F40E8D60](service, key, property);
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x1F40E8D68]();
}

uint64_t IOHIDServiceCopyMatchingEvent()
{
  return MEMORY[0x1F40E8D70]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x1F40E8D78]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1F40E8D98]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x1F40E8DB0]();
}

uint64_t IOHIDSessionSetProperty()
{
  return MEMORY[0x1F40E8DC0]();
}

void IOHIDTransactionAddElement(IOHIDTransactionRef transaction, IOHIDElementRef element)
{
}

void IOHIDTransactionClear(IOHIDTransactionRef transaction)
{
}

IOReturn IOHIDTransactionCommit(IOHIDTransactionRef transaction)
{
  return MEMORY[0x1F40E8DD8](transaction);
}

IOReturn IOHIDTransactionCommitWithCallback(IOHIDTransactionRef transaction, CFTimeInterval timeout, IOHIDCallback callback, void *context)
{
  return MEMORY[0x1F40E8DE0](transaction, callback, context, timeout);
}

IOHIDTransactionRef IOHIDTransactionCreate(CFAllocatorRef allocator, IOHIDDeviceRef device, IOHIDTransactionDirectionType direction, IOOptionBits options)
{
  return (IOHIDTransactionRef)MEMORY[0x1F40E8DE8](allocator, device, *(void *)&direction, *(void *)&options);
}

IOHIDTransactionDirectionType IOHIDTransactionGetDirection(IOHIDTransactionRef transaction)
{
  return MEMORY[0x1F40E8DF0](transaction);
}

void IOHIDTransactionSetDirection(IOHIDTransactionRef transaction, IOHIDTransactionDirectionType direction)
{
}

void IOHIDUserDeviceActivate(IOHIDUserDeviceRef device)
{
}

void IOHIDUserDeviceCancel(IOHIDUserDeviceRef device)
{
}

CFTypeRef IOHIDUserDeviceCopyProperty(IOHIDUserDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E8E20](device, key);
}

uint64_t IOHIDUserDeviceCopyService()
{
  return MEMORY[0x1F40E8E28]();
}

uint64_t IOHIDUserDeviceCreateWithOptions()
{
  return MEMORY[0x1F40E8E38]();
}

uint64_t IOHIDUserDeviceHandleReport()
{
  return MEMORY[0x1F40E8E40]();
}

IOReturn IOHIDUserDeviceHandleReportWithTimeStamp(IOHIDUserDeviceRef device, uint64_t timestamp, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1F40E8E48](device, timestamp, report, reportLength);
}

uint64_t IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback()
{
  return MEMORY[0x1F40E8E50]();
}

uint64_t IOHIDUserDeviceRegisterSetReportCallback()
{
  return MEMORY[0x1F40E8E58]();
}

void IOHIDUserDeviceSetCancelHandler(IOHIDUserDeviceRef device, dispatch_block_t handler)
{
}

void IOHIDUserDeviceSetDispatchQueue(IOHIDUserDeviceRef device, dispatch_queue_t queue)
{
}

Boolean IOHIDUserDeviceSetProperty(IOHIDUserDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1F40E8E70](device, key, property);
}

IOHIDValueRef IOHIDValueCreateWithBytes(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return (IOHIDValueRef)MEMORY[0x1F40E8E78](allocator, element, timeStamp, bytes, length);
}

IOHIDValueRef IOHIDValueCreateWithIntegerValue(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, CFIndex value)
{
  return (IOHIDValueRef)MEMORY[0x1F40E8E80](allocator, element, timeStamp, value);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x1F40E8E88](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x1F40E8E90](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x1F40E8E98](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x1F40E8EA0](value);
}

double_t IOHIDValueGetScaledValue(IOHIDValueRef value, IOHIDValueScaleType type)
{
  MEMORY[0x1F40E8EA8](value, *(void *)&type);
  return result;
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x1F40E8EB0](value);
}

uint64_t IOHIDVirtualServiceClientCreateWithCallbacks()
{
  return MEMORY[0x1F40E8EB8]();
}

uint64_t IOHIDVirtualServiceClientDispatchEvent()
{
  return MEMORY[0x1F40E8EC0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _IOHIDEventCreate()
{
  return MEMORY[0x1F40E92B0]();
}

uint64_t _IOHIDEventEqual()
{
  return MEMORY[0x1F40E92B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}