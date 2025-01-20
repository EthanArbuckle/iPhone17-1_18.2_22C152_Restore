uint64_t _servicesMatched(void *a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v5;

  result = IOIteratorNext(iterator);
  if (result)
  {
    v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while (result);
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t _serviceMatched(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

id convertNSDataToHexString(void *a1)
{
  if (a1)
  {
    unsigned int v3 = 0;
    [a1 getBytes:&v3 length:4];
    a1 = +[NSString stringWithFormat:@"0x%X", v3];
    uint64_t v1 = vars8;
  }
  return a1;
}

id getPropFromReg(CFStringRef key, io_registry_entry_t entry)
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, key, kCFAllocatorDefault, 0);

  return CFProperty;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t _servicesMatched_0(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

id get_kCAEvent_Thunderbolt_Daily()
{
  if (get_kCAEvent_Thunderbolt_Daily_onceToken != -1) {
    dispatch_once(&get_kCAEvent_Thunderbolt_Daily_onceToken, &__block_literal_global);
  }
  v0 = (void *)get_kCAEvent_Thunderbolt_Daily_event;

  return v0;
}

uint64_t _servicesMatched_1(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

CFMutableDictionaryRef copyIORegistryEntryProperties(io_registry_entry_t a1)
{
  kern_return_t v2;
  BOOL v3;
  CFMutableDictionaryRef v4;
  CFMutableDictionaryRef properties;
  uint64_t vars8;

  if (a1)
  {
    properties = 0;
    v2 = IORegistryEntryCreateCFProperties(a1, &properties, kCFAllocatorDefault, 0);
    if (properties) {
      unsigned int v3 = v2 == 0;
    }
    else {
      unsigned int v3 = 0;
    }
    if (v3) {
      v4 = properties;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t _servicesMatched_2(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void *createPayloadFromDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    v6 = +[NSMutableDictionary dictionary];
    if (v6)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v18 = v3;
      id v7 = v3;
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            v13 = [v12 ioProperty];
            v14 = [v5 objectForKeyedSubscript:v13];

            if (!v14)
            {
              v14 = +[NSNull null];
            }
            v15 = [v12 name];
            [v6 setObject:v14 forKeyedSubscript:v15];
          }
          id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v9);
      }

      id v16 = v6;
      id v3 = v18;
    }
  }
  return v6;
}

CFStringRef copyIOObjectClassName(io_object_t a1)
{
  if (a1) {
    return IOObjectCopyClass(a1);
  }
  else {
    return 0;
  }
}

CFTypeRef copyIORegistryEntryProperty(io_registry_entry_t a1, const __CFString *a2)
{
  if (a1 && a2) {
    return IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  }
  else {
    return 0;
  }
}

CFMutableDictionaryRef copyIORegistryEntryProperties_0(io_registry_entry_t a1)
{
  kern_return_t v1;
  BOOL v2;
  CFMutableDictionaryRef properties;

  if (!a1) {
    return 0;
  }
  properties = 0;
  uint64_t v1 = IORegistryEntryCreateCFProperties(a1, &properties, kCFAllocatorDefault, 0);
  if (properties) {
    v2 = v1 == 0;
  }
  else {
    v2 = 0;
  }
  if (v2) {
    return properties;
  }
  else {
    return 0;
  }
}

CFMutableDictionaryRef copyIORegistryEntryParentProperties(io_registry_entry_t a1, const char *a2)
{
  CFMutableDictionaryRef v2 = 0;
  if (a1 && a2)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(a1, a2, &parent)) {
      CFMutableDictionaryRef v2 = 0;
    }
    else {
      CFMutableDictionaryRef v2 = copyIORegistryEntryProperties_0(parent);
    }
    if (parent) {
      IOObjectRelease(parent);
    }
  }
  return v2;
}

void foreachIOObject(io_iterator_t a1, void *a2)
{
  v6 = a2;
  if (a1 && v6)
  {
    do
    {
      uint64_t v3 = IOIteratorNext(a1);
      if (!v3) {
        break;
      }
      io_object_t v4 = v3;
      int v5 = v6[2](v6, v3);
      IOObjectRelease(v4);
    }
    while (v5 == 1);
  }
}

void foreachIORegistryEntryChild(io_registry_entry_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a1)
  {
    if (a2)
    {
      if (v5)
      {
        io_iterator_t iterator = -1431655766;
        if (!IORegistryEntryGetChildIterator(a1, a2, &iterator))
        {
          io_iterator_t v7 = iterator;
          v8[0] = _NSConcreteStackBlock;
          v8[1] = 3221225472;
          v8[2] = __foreachIORegistryEntryChild_block_invoke;
          v8[3] = &unk_207F0;
          id v9 = v6;
          foreachIOObject(v7, v8);
          if (iterator) {
            IOObjectRelease(iterator);
          }
        }
      }
    }
  }
}

uint64_t __foreachIORegistryEntryChild_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void foreachIORegistryEntryParent(io_registry_entry_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a1)
  {
    if (a2)
    {
      if (v5)
      {
        io_iterator_t iterator = -1431655766;
        if (!IORegistryEntryCreateIterator(a1, a2, 3u, &iterator))
        {
          io_iterator_t v7 = iterator;
          v8[0] = _NSConcreteStackBlock;
          v8[1] = 3221225472;
          v8[2] = __foreachIORegistryEntryParent_block_invoke;
          v8[3] = &unk_207F0;
          id v9 = v6;
          foreachIOObject(v7, v8);
          if (iterator) {
            IOObjectRelease(iterator);
          }
        }
      }
    }
  }
}

uint64_t __foreachIORegistryEntryParent_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

CFTypeRef searchIORegistryEntryParentsForProperty(io_registry_entry_t a1, const char *a2, const __CFString *a3)
{
  return IORegistryEntrySearchCFProperty(a1, a2, a3, kCFAllocatorDefault, 3u);
}

id searchIORegistryEntryParentsForPropertyWithLimit(io_registry_entry_t a1, const char *a2, uint64_t a3, int a4)
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __searchIORegistryEntryParentsForPropertyWithLimit_block_invoke;
  v6[3] = &unk_20818;
  int v7 = a4;
  v6[4] = v8;
  v6[5] = &v10;
  v6[6] = a2;
  v6[7] = a3;
  foreachIORegistryEntryParent(a1, a2, v6);
  id v4 = (id)v11[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_AB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

BOOL __searchIORegistryEntryParentsForPropertyWithLimit_block_invoke(uint64_t a1, io_registry_entry_t entry)
{
  if (++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) <= *(_DWORD *)(a1 + 64))
  {
    CFTypeRef v4 = IORegistryEntrySearchCFProperty(entry, *(const char **)(a1 + 48), *(CFStringRef *)(a1 + 56), kCFAllocatorDefault, 2u);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0;
  }
  else
  {
    return 0;
  }
}

BOOL isRegistryEntryIDPresentInIOReg(uint64_t a1)
{
  io_iterator_t existing = 0;
  CFDictionaryRef v1 = IORegistryEntryIDMatching(a1);
  BOOL v2 = 0;
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v1, &existing))
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2020000000;
    int v8 = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __isRegistryEntryIDPresentInIOReg_block_invoke;
    v4[3] = &unk_20840;
    v4[4] = &v5;
    foreachIOObject(existing, v4);
    if (existing) {
      IOObjectRelease(existing);
    }
    BOOL v2 = *((_DWORD *)v6 + 6) != 0;
    _Block_object_dispose(&v5, 8);
  }
  return v2;
}

void sub_AD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __isRegistryEntryIDPresentInIOReg_block_invoke(uint64_t a1)
{
  return 1;
}

BOOL checkIOObjectParentConformsTo(io_registry_entry_t a1, const char *a2, const char *a3)
{
  BOOL v3 = 0;
  if (a1 && a3)
  {
    io_registry_entry_t parent = -1431655766;
    if (IORegistryEntryGetParentEntry(a1, a2, &parent))
    {
      return 0;
    }
    else
    {
      BOOL v3 = IOObjectConformsTo(parent, a3) != 0;
      if (parent) {
        IOObjectRelease(parent);
      }
    }
  }
  return v3;
}

uint64_t _serviceMatched_0(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_CCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void _serviceRemoved(uint64_t a1, io_iterator_t a2)
{
  CFTypeRef v4 = LogIOAnalytics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _serviceRemoved_cold_1();
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = ___serviceRemoved_block_invoke;
  v5[3] = &__block_descriptor_40_e8_i12__0I8l;
  v5[4] = a1;
  foreachIOObject(a2, v5);
}

void _serviceAdded(uint64_t a1, io_iterator_t a2)
{
  CFTypeRef v4 = LogIOAnalytics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _serviceAdded_cold_1();
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = ___serviceAdded_block_invoke;
  v5[3] = &__block_descriptor_40_e8_i12__0I8l;
  v5[4] = a1;
  foreachIOObject(a2, v5);
}

void sub_ECB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_FB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t ___serviceRemoved_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef v4 = (__CFString *)copyIOObjectClassName(a2);
  uint64_t v5 = LogIOAnalytics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    ___serviceRemoved_block_invoke_cold_2();
  }

  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 removedService:a2 withClassName:v4];
  }
  else
  {
    uint64_t v7 = LogIOAnalytics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___serviceRemoved_block_invoke_cold_1();
    }
  }
  return 1;
}

uint64_t ___serviceAdded_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef v4 = (__CFString *)copyIOObjectClassName(a2);
  uint64_t v5 = LogIOAnalytics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    ___serviceAdded_block_invoke_cold_2();
  }

  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 addedService:a2 withClassName:v4];
  }
  else
  {
    uint64_t v7 = LogIOAnalytics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___serviceRemoved_block_invoke_cold_1();
    }
  }
  return 1;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t _serviceMatched_1(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

id get_kCAEvent_USBFW()
{
  if (get_kCAEvent_USBFW_onceToken != -1) {
    dispatch_once(&get_kCAEvent_USBFW_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)get_kCAEvent_USBFW_event;

  return v0;
}

id get_kCAEvent_ThunderboltCounters()
{
  if (get_kCAEvent_ThunderboltCounters_onceToken != -1) {
    dispatch_once(&get_kCAEvent_ThunderboltCounters_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)get_kCAEvent_ThunderboltCounters_event;

  return v0;
}

uint64_t _servicesMatched_3(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

id get_kCAEvent_USB_Device_Daily()
{
  if (get_kCAEvent_USB_Device_Daily_onceToken != -1) {
    dispatch_once(&get_kCAEvent_USB_Device_Daily_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)get_kCAEvent_USB_Device_Daily_event;

  return v0;
}

id get_USBFields(void *a1)
{
  id v1 = a1;
  if (get_USBFields_onceToken != -1) {
    dispatch_once(&get_USBFields_onceToken, &__block_literal_global_65);
  }
  id v2 = (id)get_USBFields_usbFields;
  if (v1)
  {
    BOOL v3 = (void *)get_USBFields_usbFields;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __get_USBFields_block_invoke_2;
    v7[3] = &unk_20670;
    id v8 = v1;
    uint64_t v4 = [v3 indexesOfObjectsPassingTest:v7];
    uint64_t v5 = [(id)get_USBFields_usbFields objectsAtIndexes:v4];

    id v2 = (id)v5;
  }

  return v2;
}

id get_kCAEvent_USB_Interface_Daily()
{
  if (get_kCAEvent_USB_Interface_Daily_onceToken != -1) {
    dispatch_once(&get_kCAEvent_USB_Interface_Daily_onceToken, &__block_literal_global_55);
  }
  v0 = (void *)get_kCAEvent_USB_Interface_Daily_event;

  return v0;
}

uint64_t LogIOAnalytics()
{
  if (LogIOAnalytics_onceToken != -1) {
    dispatch_once(&LogIOAnalytics_onceToken, &__block_literal_global_4);
  }
  return LogIOAnalytics_logIOAnalytics;
}

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v3;
    v6 = (unsigned __int8 *)[v5 bytes];
    id v7 = objc_alloc_init((Class)NSMutableString);
    if ([v5 length])
    {
      unint64_t v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, v6[v8++]);
      while (v8 < (unint64_t)[v5 length]);
    }
    uint64_t v9 = +[NSString stringWithString:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  id v1 = a1;
  id v2 = +[NSCharacterSet characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v3 = [v1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  id v1 = a1;
  id v2 = +[NSCharacterSet characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v3 = [v1 componentsSeparatedByCharactersInSet:v2];

  id v4 = [v3 componentsJoinedByString:&stru_23958];

  return v4;
}

id convertNSStringToNSData(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = +[NSCharacterSet hexadecimalCharacterSet];
    id v3 = [v2 invertedSet];
    id v4 = [v1 componentsSeparatedByCharactersInSet:v3];
    id v5 = [v4 componentsJoinedByString:&stru_23958];

    id v1 = v5;
    v6 = (const char *)[v1 UTF8String];
    size_t v7 = strlen(v6) >> 1;
    unint64_t v8 = malloc_type_malloc(v7, 0x71BB6ACDuLL);
    if (v6 && (unint64_t)[v1 length] >= 2)
    {
      unint64_t v9 = 0;
      int v10 = 0;
      do
      {
        uint64_t v11 = 0;
        __int16 v22 = -21846;
        char v12 = 1;
        do
        {
          char v13 = v12;
          int v14 = v6[v11 | (2 * v10)];
          unsigned int v15 = v14 - 48;
          unsigned int v16 = v14 - 65;
          if ((v14 - 97) >= 6) {
            char v17 = 0;
          }
          else {
            char v17 = v14 - 87;
          }
          char v18 = v14 - 55;
          if (v16 > 5) {
            char v18 = v17;
          }
          if (v15 < 0xA) {
            char v18 = v15;
          }
          *((unsigned char *)&v22 + v11) = v18;
          uint64_t v11 = 1;
          char v12 = 0;
        }
        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        unint64_t v9 = (v10 + 1);
        unint64_t v19 = (unint64_t)[v1 length];
        int v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    long long v20 = +[NSData dataWithBytes:v8 length:v7];
    if (v8) {
      free(v8);
    }
  }
  else
  {
    long long v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, void *a5)
{
  unint64_t v9 = a2;
  int v10 = +[NSMutableSet set];
  unsigned int outCount = 0;
  uint64_t v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  char v12 = v11;
  if (outCount)
  {
    unint64_t v13 = 0;
    p_name = &v11->name;
    do
    {
      if (([a1 instancesRespondToSelector:*p_name] & 1) == 0)
      {
        unsigned int v15 = NSStringFromSelector(*p_name);
        [v10 addObject:v15];
      }
      ++v13;
      p_name += 2;
    }
    while (v13 < outCount);
  }
  free(v12);
  if (outCount && [v10 count])
  {
    uint64_t v16 = 0;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v16 = 1;
  if (a5)
  {
LABEL_11:
    *a5 = +[NSSet setWithSet:v10];
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = a1;
  id v2 = +[NSNull null];
  id v3 = [v1 isEqual:v2];

  return (uint64_t)v3;
}

id NSObjectIfNotNull(void *a1)
{
  id v1 = a1;
  if (isNSObjectNull(v1)) {
    id v2 = 0;
  }
  else {
    id v2 = v1;
  }

  return v2;
}

id isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return [(id)a1 isEqual:a2];
  }
  else {
    return &dword_0 + 1;
  }
}

id castNSObjectToType(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id readJSONFile(uint64_t a1)
{
  if (a1)
  {
    id v1 = +[NSData dataWithContentsOfFile:a1];
    if (v1)
    {
      uint64_t v5 = 0;
      id v2 = +[NSJSONSerialization JSONObjectWithData:v1 options:0 error:&v5];
      id v3 = v2;
      if (!v5)
      {
LABEL_6:

        goto LABEL_8;
      }
    }
    id v3 = 0;
    goto LABEL_6;
  }
  id v3 = 0;
LABEL_8:

  return v3;
}

id writeJSONFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4) {
    goto LABEL_7;
  }
  if (!v3) {
    id v3 = &__NSDictionary0__struct;
  }
  if (+[NSJSONSerialization isValidJSONObject:v3])
  {
    uint64_t v9 = 0;
    uint64_t v5 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:&v9];
    v6 = v5;
    if (v9) {
      id v7 = 0;
    }
    else {
      id v7 = [v5 writeToFile:v4 atomically:1];
    }
  }
  else
  {
LABEL_7:
    id v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0, (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_alloc((Class)NSData);
        id v10 = objc_msgSend(v9, "initWithBase64EncodedString:options:", v8, 0, (void)v12);
        if (v10) {
          [v2 addObject:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t _servicesMatched_4(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceMatched:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void _serviceRemoved_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_0, v0, v1, "Notification: services Terminated", v2, v3, v4, v5, v6);
}

void _serviceAdded_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_0, v0, v1, "Notification: services FirstMatch", v2, v3, v4, v5, v6);
}

void ___serviceRemoved_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Ignoring new service.  Missing notification context.", v2, v3, v4, v5, v6);
}

void ___serviceRemoved_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_0, v0, v1, "Service Terminated: %@", v2, v3, v4, v5, v6);
}

void ___serviceAdded_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_0, v0, v1, "Service FirstMatch: %@", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsIsEventUsed()
{
  return _AnalyticsIsEventUsed();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFRelease(CFTypeRef cf)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return _IOObjectCopyClass(object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetParentIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetParentIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGIsQuestionValid()
{
  return _MGIsQuestionValid();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return _protocol_copyMethodDescriptionList(p, isRequiredMethod, isInstanceMethod, outCount);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__startEventMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _startEventMonitoring];
}

id objc_msgSend__stopEventMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _stopEventMonitoring];
}

id objc_msgSend_analyticsEventsEnabled(void *a1, const char *a2, ...)
{
  return [a1 analyticsEventsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_captureAppleHPMDevices(void *a1, const char *a2, ...)
{
  return [a1 captureAppleHPMDevices];
}

id objc_msgSend_captureIOThunderboltSwitches(void *a1, const char *a2, ...)
{
  return [a1 captureIOThunderboltSwitches];
}

id objc_msgSend_captureIOUSBHostDevices(void *a1, const char *a2, ...)
{
  return [a1 captureIOUSBHostDevices];
}

id objc_msgSend_captureIOUSBHostInterfaces(void *a1, const char *a2, ...)
{
  return [a1 captureIOUSBHostInterfaces];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countAppleRootThunderboltSwitches(void *a1, const char *a2, ...)
{
  return [a1 countAppleRootThunderboltSwitches];
}

id objc_msgSend_dailyHeartbeatFired(void *a1, const char *a2, ...)
{
  return [a1 dailyHeartbeatFired];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_hexadecimalCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 hexadecimalCharacterSet];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_ioNotificationPort(void *a1, const char *a2, ...)
{
  return [a1 ioNotificationPort];
}

id objc_msgSend_ioProperty(void *a1, const char *a2, ...)
{
  return [a1 ioProperty];
}

id objc_msgSend_lazyInit(void *a1, const char *a2, ...)
{
  return [a1 lazyInit];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_monitoring(void *a1, const char *a2, ...)
{
  return [a1 monitoring];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_registerMatchingNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerMatchingNotifications];
}

id objc_msgSend_routerID(void *a1, const char *a2, ...)
{
  return [a1 routerID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setupAnalyticsConfigObserver(void *a1, const char *a2, ...)
{
  return [a1 setupAnalyticsConfigObserver];
}

id objc_msgSend_setupDailyHeartbeat(void *a1, const char *a2, ...)
{
  return [a1 setupDailyHeartbeat];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return [a1 started];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return [a1 teardown];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}