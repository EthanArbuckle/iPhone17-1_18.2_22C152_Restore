uint64_t __OSKextAddCompressedFileToMkext(uint64_t a1, const __CFData *a2, CFDataRef theData, int a4, unsigned char *a5)
{
  BOOL v9;
  Bytef *BytePtr;
  CFIndex Length;
  unsigned int v12;
  UInt8 *MutableBytePtr;
  UInt8 *v14;
  UInt8 *v15;
  UInt8 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int total_out;
  unsigned int v28;
  const char *v29;
  char v31;
  CFIndex v32;
  z_stream strm;

  v9 = a4 == 0;
  BytePtr = (Bytef *)CFDataGetBytePtr(theData);
  Length = CFDataGetLength(a2);
  v12 = CFDataGetLength(theData);
  memset(&strm.avail_in, 0, 104);
  *a5 = 0;
  v32 = Length + 8 * v9;
  CFDataSetLength(a2, v32 + v12 + (v12 + 1000) / 0x3E8 + 12);
  MutableBytePtr = CFDataGetMutableBytePtr(a2);
  v14 = MutableBytePtr;
  v15 = &MutableBytePtr[Length];
  if (a4)
  {
    v16 = 0;
  }
  else
  {
    *((_DWORD *)v15 + 1) = bswap32(v12);
    v16 = &MutableBytePtr[Length];
    v15 += 8;
  }
  strm.next_in = BytePtr;
  strm.next_out = v15;
  strm.avail_in = v12;
  strm.avail_out = v12 + (v12 + 1000) / 0x3E8 + 12;
  memset(&strm.zalloc, 0, 24);
  if (deflateInit2_(&strm, -1, 8, 15, 8, 0, "1.2.12", 112))
  {
    OSKextLog(0, 131073, "zlib deflateInit failed.", v17, v18, v19, v20, v21, v31);
LABEL_11:
    CFDataSetLength(a2, Length);
    return 0;
  }
  if (deflate(&strm, 4) > 1)
  {
    OSKextLog(0, 131073, "zlib deflate failed.", v22, v23, v24, v25, v26, v31);
    deflateEnd(&strm);
    goto LABEL_11;
  }
  total_out = strm.total_out;
  if (LODWORD(strm.total_out) >= v12)
  {
    *a5 = 0;
  }
  else
  {
    *a5 = 1;
    if (a4)
    {
      *((_DWORD *)v14 + 8) = bswap32(Length);
      v28 = CFDataGetLength(theData);
      *((_DWORD *)v14 + 9) = bswap32(total_out);
      *((_DWORD *)v14 + 10) = bswap32(v28);
      v29 = "Compressed info dict from %u to %u bytes (%.2f%%).";
    }
    else
    {
      *(_DWORD *)v16 = bswap32(total_out);
      v29 = "Compressed executable from %u to %u bytes (%.2f%%).";
    }
    OSKextLog(a1, 134, v29, v22, v23, v24, v25, v26, v12);
    CFDataSetLength(a2, total_out + v32);
  }
  deflateEnd(&strm);
  return 1;
}

uint64_t __OSKextInitFromMkext(uint64_t a1, CFDictionaryRef theDict, const void *a3, const void *a4)
{
  *(unsigned char *)(a1 + 88) |= 8u;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"_MKEXTBundlePath");
  if (Value)
  {
    CFStringRef v9 = Value;
    CFAllocatorRef v10 = CFGetAllocator((CFTypeRef)a1);
    CFURLRef v11 = CFURLCreateWithFileSystemPath(v10, v9, kCFURLPOSIXPathStyle, 1u);
    *(void *)(a1 + 16) = v11;
    if (!v11) {
      OSKextLog(0, 17, "Memory allocation failure.", v12, v13, v14, v15, v16, v37);
    }
  }
  CFAllocatorRef v17 = CFGetAllocator(theDict);
  *(void *)(a1 + 56) = CFDictionaryCreateMutableCopy(v17, 0, theDict);
  if (!__OSKextCreateMkextInfo(a1))
  {
    OSKextLog(0, 17, "Memory allocation failure.", v18, v19, v20, v21, v22, v37);
    return 0;
  }
  if (a3) {
    **(void **)(a1 + 80) = CFRetain(a3);
  }
  *(void *)(*(void *)(a1 + 80) + 8) = CFRetain(a4);
  if (!__OSKextProcessInfoDictionary(a1, 0, v23, v24, v25, v26, v27, v28)) {
    return 0;
  }

  return __OSKextRecordKext(a1, v29, v30, v31, v32, v33, v34, v35);
}

uint64_t _IOHIDIsSerializable(uint64_t result)
{
  mach_vm_address_t address = 0;
  if (result)
  {
    CFTypeRef v1 = _IOHIDSerialize((CFTypeRef)result, &address);
    if (address) {
      BOOL v2 = v1 == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      return 0;
    }
    else
    {
      mach_vm_deallocate(*MEMORY[0x1E4F14960], address, (mach_vm_size_t)v1);
      return 1;
    }
  }
  return result;
}

uint64_t hid_pthread_attr_init(pthread_attr_t *a1, int a2, int a3)
{
  sched_param v9 = 0;
  uint64_t v6 = pthread_attr_init(a1);
  if (v6
    || (pthread_attr_setschedpolicy(a1, a3), uint64_t v6 = pthread_attr_getschedparam(a1, &v9), v6)
    || (v9.sched_priority = a2, uint64_t v6 = pthread_attr_setschedparam(a1, &v9), v6))
  {
    uint64_t v7 = v6;
    goto LABEL_5;
  }
  uint64_t v7 = pthread_attr_setdetachstate(a1, 1);
  if (v7) {
LABEL_5:
  }
    pthread_attr_destroy(a1);
  return v7;
}

NSObject *hid_dispatch_queue_create(const char *a1, NSObject *a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return hid_dispatch_queue_create_with_context_destructor(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t hid_dispatch_pthread_root_queue_create(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return MEMORY[0x1F40C9D80](a1, a4 | 0x80000000, a2, __hid_queue_callbacks, a3);
}

uint64_t IOHIDServiceFilterCreateWithClass(const __CFAllocator *a1, void *a2, uint64_t a3, const void *a4, int a5)
{
  id v10 = objc_msgSend(a2, sel_getUid("alloc"));
  if (!v10) {
    return 0;
  }
  CFURLRef v11 = v10;
  if (!objc_msgSend(v10, sel_getUid("initWithService:"), a3))
  {
    uint64_t v19 = _IOHIDLogCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      IOHIDServiceFilterCreateWithClass_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    return 0;
  }
  Protocol = objc_getProtocol("HIDServiceFilter");
  if (!Protocol)
  {
    uint64_t v27 = _IOHIDLogCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      IOHIDServiceFilterCreateWithClass_cold_2(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_22;
  }
  if (!class_conformsToProtocol((Class)a2, Protocol))
  {
    uint64_t v35 = _IOHIDLogCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      IOHIDServiceFilterCreateWithClass_cold_3(v35, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_22;
  }
  uint64_t Private = __IOHIDServiceFilterCreatePrivate(a1);
  if (!Private)
  {
LABEL_22:
    CFRelease(v11);
    return 0;
  }
  uint64_t v14 = Private;
  *(void *)(Private + 96) = v11;
  *(void *)(Private + 104) = sel_getUid("propertyForKey:client:");
  *(void *)(v14 + 112) = sel_getUid("setProperty:forKey:client:");
  *(void *)(v14 + 120) = sel_getUid("filterEvent:");
  *(void *)(v14 + 128) = sel_getUid("filterEventMatching:event:forClient:");
  *(void *)(v14 + 136) = sel_getUid("setCancelHandler:");
  *(void *)(v14 + 144) = sel_getUid("activate");
  *(void *)(v14 + 152) = sel_getUid("cancel");
  Uid = sel_getUid("setDispatchQueue:");
  if (class_respondsToSelector((Class)a2, Uid)) {
    *(void *)(v14 + 160) = sel_getUid("setDispatchQueue:");
  }
  uint64_t v16 = sel_getUid("setEventDispatcher:");
  if (class_respondsToSelector((Class)a2, v16)) {
    *(void *)(v14 + 168) = sel_getUid("setEventDispatcher:");
  }
  CFAllocatorRef v17 = sel_getUid("clientNotification:added:");
  if (class_respondsToSelector((Class)a2, v17)) {
    *(void *)(v14 + 176) = sel_getUid("clientNotification:added:");
  }
  *(_DWORD *)(v14 + 40) = a5;
  *(void *)(v14 + 48) = a3;
  *(void *)(v14 + 32) = _IOHIDServiceCopyDispatchQueue(a3);
  *(void *)(v14 + 80) = a4;
  if (a4) {
    CFRetain(a4);
  }
  CFRetain((CFTypeRef)v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __IOHIDServiceFilterCreateWithClass_block_invoke;
  block[3] = &__block_descriptor_tmp_21;
  block[4] = v14;
  *(void *)(v14 + 64) = dispatch_block_create((dispatch_block_flags_t)0, block);
  return v14;
}

void __IOHIDServiceFilterCreateWithClass_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 72) |= 2u;
  uint64_t v3 = *(void *)(v2 + 56);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(*(void *)(v2 + 56));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  CFRelease((CFTypeRef)v2);
}

uint64_t IOHIDServiceFilterGetTypeID()
{
  uint64_t result = __kIOHIDServiceFilterTypeID;
  if (!__kIOHIDServiceFilterTypeID)
  {
    pthread_once(&__systemFilterClientTypeInit_0, (void (*)(void))__IOHIDServiceFilterRegister);
    return __kIOHIDServiceFilterTypeID;
  }
  return result;
}

uint64_t __IOHIDServiceFilterRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOHIDServiceFilterTypeID = result;
  return result;
}

uint64_t IOHIDServiceFilterGetMatchScore(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t IOHIDServiceFilterCompare(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 40);
  int v3 = *(_DWORD *)(a2 + 40);
  BOOL v4 = v2 == v3;
  BOOL v5 = v2 <= v3;
  uint64_t v6 = -1;
  if (v5) {
    uint64_t v6 = 1;
  }
  if (v4) {
    return 0;
  }
  else {
    return v6;
  }
}

uint64_t IOHIDServiceFilterFilterCopyEvent(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 0;
  }
  uint64_t v4 = a1[2];
  if (v4 && (BOOL v5 = *(uint64_t (**)(void))(*(void *)v4 + 48)) != 0
    || (uint64_t v6 = a1[3]) != 0 && (v5 = *(uint64_t (**)(void))(*(void *)v6 + 48)) != 0)
  {
    uint64_t result = v5();
    if (result) {
      return result;
    }
    v8 = _IOHIDEventDebugInfo(a2);
    sched_param v9 = _IOHIDLogCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int Type = IOHIDEventGetType((uint64_t)a2);
      uint64_t SenderID = _IOHIDServiceGetSenderID(a1[6]);
      uint64_t v12 = a1[11];
      v13[0] = 67109890;
      v13[1] = Type;
      __int16 v14 = 2048;
      uint64_t v15 = SenderID;
      __int16 v16 = 2112;
      CFAllocatorRef v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_18B46C000, v9, OS_LOG_TYPE_INFO, "Copy Event filtered type:%d sender:0x%llx eventInfo:(%@) service filter:%@", (uint8_t *)v13, 0x26u);
    }
    CFRelease(v8);
    return 0;
  }
  return (uint64_t)a2;
}

id IOHIDServiceFilterFilterCopyMatchingEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(a1 + 96);
  id v7 = a2;
  if (v6) {
    id v7 = objc_msgSend(v6, *(SEL *)(a1 + 128), a3, a2, a4);
  }
  if (!v7)
  {
    v8 = _IOHIDEventDebugInfo(a2);
    sched_param v9 = _IOHIDLogCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int Type = IOHIDEventGetType((uint64_t)a2);
      uint64_t SenderID = _IOHIDServiceGetSenderID(*(void *)(a1 + 48));
      uint64_t v12 = *(void *)(a1 + 88);
      v14[0] = 67109890;
      v14[1] = Type;
      __int16 v15 = 2048;
      uint64_t v16 = SenderID;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_18B46C000, v9, OS_LOG_TYPE_INFO, "Copy Event filtered type:%d sender:0x%llx eventInfo:(%@) service filter:%@", (uint8_t *)v14, 0x26u);
    }
    CFRelease(v8);
  }
  return v7;
}

uint64_t IOHIDServiceFilterSetOutputEvent(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result)
  {
    int v2 = *(uint64_t (**)(void))(*(void *)result + 104);
    if (v2) {
      return v2();
    }
  }
  return result;
}

uint64_t IOHIDServiceFilterGetStateMask(uint64_t a1)
{
  return *(unsigned int *)(a1 + 72);
}

CFMutableDictionaryRef IOHIDServiceClientCopyProperties(uint64_t *a1, const __CFArray *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 0;
  }
  CFMutableDictionaryRef v6 = Mutable;
  CFMutableArrayRef v7 = CFArrayCreateMutable(v4, 0, MEMORY[0x1E4F1D510]);
  if (!v7)
  {
    CFRelease(v6);
    return 0;
  }
  CFMutableArrayRef v8 = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 0x40000000;
  _DWORD v14[2] = __IOHIDServiceClientCopyProperties_block_invoke;
  v14[3] = &__block_descriptor_tmp_22_0;
  v14[4] = a1;
  v14[5] = v6;
  v14[6] = v7;
  _IOHIDCFArrayApplyBlock(a2, v14);
  if (CFArrayGetCount(v8))
  {
    sched_param v9 = (__CFDictionary *)_IOHIDEventSystemClientCopyPropertiesForService(a1[1], (IOHIDServiceClientRef)a1, v8);
    if (v9)
    {
      CFMutableDictionaryRef v10 = v9;
      context[0] = MEMORY[0x1E4F143A8];
      context[1] = 0x40000000;
      context[2] = __IOHIDServiceClientCopyProperties_block_invoke_2;
      context[3] = &__block_descriptor_tmp_24;
      context[4] = v9;
      _IOHIDCFDictionaryApplyBlock(v6, context);
    }
    else
    {
      CFRetain(v6);
      CFMutableDictionaryRef v10 = v6;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 0x40000000;
    v12[2] = __IOHIDServiceClientCopyProperties_block_invoke_3;
    v12[3] = &__block_descriptor_tmp_25;
    v12[4] = v10;
    v12[5] = a1;
    _IOHIDCFArrayApplyBlock(a2, v12);
  }
  else
  {
    CFRetain(v6);
    CFMutableDictionaryRef v10 = v6;
  }
  if (!CFDictionaryGetCount(v10))
  {
    CFRelease(v10);
    CFMutableDictionaryRef v10 = 0;
  }
  CFRelease(v6);
  CFRelease(v8);
  return v10;
}

void __IOHIDServiceClientCopyProperties_block_invoke(IOHIDServiceClientRef *a1, const __CFString *a2)
{
  os_unfair_recursive_lock_lock_with_options();
  CFStringRef Value = CFDictionaryGetValue(*((CFDictionaryRef *)a1[4] + 12), a2);
  os_unfair_recursive_lock_unlock();
  if (Value)
  {
    if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x1E4F1D260]))
    {
      CFMutableArrayRef v7 = a1[5];
      CFDictionarySetValue(v7, a2, Value);
    }
  }
  else if ((CFEqual(a2, @"PrimaryUsagePage") {
          || CFEqual(a2, @"PrimaryUsage")
  }
          || CFEqual(a2, @"DeviceUsagePairs"))
         && (CFTypeRef v5 = IOHIDServiceClientCopyProperty(a1[4], a2)) != 0)
  {
    CFMutableDictionaryRef v6 = v5;
    CFDictionarySetValue(a1[5], a2, v5);
    CFRelease(v6);
  }
  else
  {
    CFMutableArrayRef v8 = a1[6];
    CFArrayAppendValue(v8, a2);
  }
}

void __IOHIDServiceClientCopyProperties_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
}

uint64_t __IOHIDServiceClientCopyProperties_block_invoke_3(uint64_t a1, const void *a2)
{
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  uint64_t result = CFSetContainsValue((CFSetRef)__serviceKeysSet, a2);
  if (result)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (Value) {
      CFMutableDictionaryRef v6 = Value;
    }
    else {
      CFMutableDictionaryRef v6 = (const void *)*MEMORY[0x1E4F1D260];
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 40) + 96), a2, v6);
    return os_unfair_recursive_lock_unlock();
  }
  return result;
}

uint64_t IOHIDServiceClientCopyMatchingEvent(__IOHIDServiceClient *service, const UInt8 *a2)
{
  return _IOHIDEventSystemClientCopyMatchingEventForService(*((void *)service + 1), service, a2);
}

uint64_t IOHIDServiceClientSetElementValue(__IOHIDServiceClient *service, int a2, int a3, int a4)
{
  return _IOHIDEventSystemClientSetElementValueForService(*((void *)service + 1), service, a2, a3, a4);
}

uint64_t IOHIDServiceClientFastPathCopyEvent(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t result = *(void *)(a1 + 104);
  if (result)
  {
    int v2 = *(void (**)(void))(*(void *)result + 64);
    if (v2)
    {
      v2();
      return v3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t IOHIDServiceClientFastPathCopyProperty(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 104);
  if (v1 && (int v2 = *(uint64_t (**)(void))(*(void *)v1 + 48)) != 0) {
    return v2();
  }
  else {
    return 0;
  }
}

uint64_t IOHIDServiceClientFastPathSetProperty(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 104);
  if (result)
  {
    int v2 = *(uint64_t (**)(void))(*(void *)result + 56);
    if (v2) {
      LOBYTE(result) = v2();
    }
    else {
      LOBYTE(result) = 0;
    }
  }
  return result;
}

uint64_t _IOHIDVirtualServiceClientSetOputputEvent(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[8];
  if (v2 && (uint64_t v3 = *(uint64_t (**)(void, void, void *, uint64_t))(v2 + 40)) != 0) {
    return v3(a1[9], a1[10], a1, a2);
  }
  else {
    return 3758097095;
  }
}

uint64_t _IOHIDVirtualServiceClientCopyMatchingEvent(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[8];
  if (v2 && (uint64_t v3 = *(uint64_t (**)(void, void, void *, uint64_t))(v2 + 48)) != 0) {
    return v3(a1[9], a1[10], a1, a2);
  }
  else {
    return 0;
  }
}

void __NotificationApplier(uint64_t a1, uint64_t a2)
{
}

uint64_t _IOHIDEventSystemConnectionGetDispatchQueue(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t _IOHIDEventSystemConnectionGetReplyPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

__n128 IOHIDEventSystemConnectionGetAuditToken(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __n128 result = *(__n128 *)(a1 + 196);
    long long v3 = *(_OWORD *)(a1 + 212);
    *(__n128 *)a2 = result;
    *(_OWORD *)(a2 + 16) = v3;
  }
  return result;
}

void __IOHIDEventSystemConnectionDispatchEvent_block_invoke(uint64_t a1)
{
  _IOHIDEventSystemConnectionQueueStop(*(void *)(a1 + 32));
  uint64_t v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

uint64_t _IOHIDEventSystemConnectionFilterEvent(mach_port_t *cf, uint64_t a2, uint64_t a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unsigned int v32 = 0;
  if (a2)
  {
    CFAllocatorRef v6 = CFGetAllocator(cf);
    RegistryID = (const void *)IOHIDServiceGetRegistryID(a2);
    CFDataRef v8 = (const __CFData *)_IOHIDCreateBinaryData(v6, RegistryID);
  }
  else
  {
    CFDataRef v8 = 0;
  }
  CFAllocatorRef v9 = CFGetAllocator(cf);
  DataInternal = IOHIDEventCreateDataInternal(v9, a3);
  if (DataInternal)
  {
    CFURLRef v11 = DataInternal;
    CFAllocatorRef v12 = CFGetAllocator(cf);
    CFDataRef v13 = (const __CFData *)_IOHIDCreateBinaryData(v12, v11);
    if (v13)
    {
      CFDataRef v14 = v13;
      uint64_t v31 = a2;
      if (!cf[112])
      {
        os_unfair_recursive_lock_lock_with_options();
        mach_port_t v15 = cf[10];
        uint64_t v16 = (void *)a3;
        if (v8)
        {
          BytePtr = CFDataGetBytePtr(v8);
          int Length = CFDataGetLength(v8);
        }
        else
        {
          BytePtr = 0;
          int Length = 0;
        }
        __int16 v19 = CFDataGetBytePtr(v14);
        int v20 = CFDataGetLength(v14);
        int v21 = iohideventsystem_client_dispatch_event_filter(v15, (uint64_t)BytePtr, Length, (uint64_t)v19, v20, (int *)&v32, 0x10u);
        os_unfair_recursive_lock_unlock();
        if (v21)
        {
          if (v21 == 268451843)
          {
            uint64_t v22 = _IOHIDLogCategory(9u);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = *((void *)cf + 21);
              *(_DWORD *)buf = 136315394;
              uint64_t v34 = v23;
              __int16 v35 = 1024;
              int v36 = 268451843;
              _os_log_impl(&dword_18B46C000, v22, OS_LOG_TYPE_INFO, "%s: iohideventsystem_client_dispatch_event_filter:0x%x", buf, 0x12u);
            }
          }
          else
          {
            uint64_t v24 = _IOHIDLogCategory(9u);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              _IOHIDEventSystemConnectionFilterEvent_cold_1();
            }
          }
          __IOHIDEventSystemConnectionCheckServerStatus(v21, (uint64_t)cf);
        }
        else
        {
          ++cf[73];
        }
        if (v32)
        {
          uint64_t v25 = _IOHIDEventDebugInfo(v16);
          uint64_t v26 = _IOHIDLogCategory(9u);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            uint64_t v27 = *((void *)cf + 21);
            int Type = IOHIDEventGetType((uint64_t)v16);
            uint64_t SenderID = v31;
            if (v31) {
              uint64_t SenderID = _IOHIDServiceGetSenderID(v31);
            }
            *(_DWORD *)buf = 136315906;
            uint64_t v34 = v27;
            __int16 v35 = 1024;
            int v36 = Type;
            __int16 v37 = 2048;
            uint64_t v38 = SenderID;
            __int16 v39 = 2112;
            uint64_t v40 = v25;
            _os_log_impl(&dword_18B46C000, v26, OS_LOG_TYPE_INFO, "%s: Filtered event type:%d sender:%#llx eventInfo:(%@)", buf, 0x26u);
          }
          CFRelease(v25);
        }
      }
      CFRelease(v14);
    }
    CFRelease(v11);
  }
  if (v8) {
    CFRelease(v8);
  }
  return v32;
}

void _IOHIDEventSystemConnectionRegisterEventFilter(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(_DWORD *)(a1 + 260) = a2;
  if (v3) {
    _IOHIDEventSystemRegisterEventFilter(v3, (void *)a1);
  }
}

void _IOHIDEventSystemConnectionUnregisterEventFilter(void *a1)
{
  uint64_t v2 = a1[1];
  if (v2) {
    _IOHIDEventSystemUnregisterEventFilter(v2, a1);
  }
}

uint64_t _IOHIDEventSystemConnectionGetEventFilterPriority(uint64_t a1)
{
  return *(unsigned int *)(a1 + 260);
}

uint64_t _IOHIDEventSystemConnectionEventFilterCompare(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 260);
  int v3 = *(_DWORD *)(a2 + 260);
  BOOL v4 = v2 == v3;
  BOOL v5 = v2 <= v3;
  uint64_t v6 = -1;
  if (v5) {
    uint64_t v6 = 1;
  }
  if (v4) {
    return 0;
  }
  else {
    return v6;
  }
}

uint64_t _IOHIDEventSystemConnectionGetPID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t _IOHIDEventSystemConnectionRegisterPropertyChangedNotification(void *a1, const void *a2)
{
  os_unfair_recursive_lock_lock_with_options();
  CFMutableDictionaryRef Mutable = (__CFSet *)a1[17];
  if (Mutable
    || (CFAllocatorRef v5 = CFGetAllocator(a1), Mutable = CFSetCreateMutable(v5, 0, MEMORY[0x1E4F1D548]), (a1[17] = Mutable) != 0))
  {
    CFSetAddValue(Mutable, a2);
  }

  return os_unfair_recursive_lock_unlock();
}

uint64_t _IOHIDEventSystemConnectionUnregisterPropertyChangedNotification(uint64_t a1, const void *a2)
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v4 = *(__CFSet **)(a1 + 136);
  if (v4) {
    CFSetRemoveValue(v4, a2);
  }

  return os_unfair_recursive_lock_unlock();
}

const char *IOHIDEventSystemConnectionGetTypeString(unsigned int a1)
{
  if (a1 > 4) {
    return "Invalid";
  }
  else {
    return off_1E548AE98[a1];
  }
}

CFMutableDictionaryRef _IOHIDEventSystemConnectionCopyRecord(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFMutableDictionaryRef v4 = Mutable;
  if (Mutable)
  {
    _IOHIDDictionaryAddSInt32(Mutable, @"Type", *(_DWORD *)(a1 + 176));
    _IOHIDDictionaryAddSInt32(v4, @"PID", *(_DWORD *)(a1 + 88));
    CFAllocatorRef v5 = *(const void **)(a1 + 144);
    if (v5) {
      CFDictionarySetValue(v4, @"Caller", v5);
    }
    uint64_t v6 = *(const void **)(a1 + 152);
    if (v6) {
      CFDictionarySetValue(v4, @"ProcessName", v6);
    }
    CFMutableArrayRef v7 = *(const void **)(a1 + 160);
    if (v7) {
      CFDictionarySetValue(v4, @"UUID", v7);
    }
    CFDataRef v8 = *(const void **)(a1 + 184);
    if (v8) {
      CFDictionarySetValue(v4, @"Attributes", v8);
    }
    _IOHIDDictionaryAddSInt32(v4, @"State", *(_DWORD *)(a1 + 264));
    _IOHIDDictionaryAddSInt32(v4, @"DroppedEventCount", *(_DWORD *)(a1 + 296));
    _IOHIDDictionaryAddSInt64(v4, @"DroppedEventMask", *(void *)(a1 + 304));
    _IOHIDDictionaryAddSInt32(v4, @"EventFilteredCount", *(_DWORD *)(a1 + 288));
    _IOHIDDictionaryAddSInt64(v4, @"EventFilterMask", *(void *)(a1 + 280));
    _IOHIDDictionaryAddSInt32(v4, @"EventFilterTimeoutCount", *(_DWORD *)(a1 + 292));
    _IOHIDDictionaryAddSInt32(v4, @"ActivityState", *(_DWORD *)(a1 + 400));
    _IOHIDDictionaryAddSInt32(v4, @"activityStateChangeCount", *(_DWORD *)(a1 + 404));
    _IOHIDDictionaryAddSInt64(v4, @"IdleNotificationTime", *(void *)(a1 + 408));
    if (*(_DWORD *)(a1 + 296))
    {
      CFAllocatorRef v9 = CFGetAllocator((CFTypeRef)a1);
      CFStringRef v10 = _IOHIDCreateTimeString(v9, (time_t *)(a1 + 344));
      if (v10)
      {
        CFStringRef v11 = v10;
        CFDictionarySetValue(v4, @"FirstDroppedEventTime", v10);
        CFRelease(v11);
      }
      CFAllocatorRef v12 = CFGetAllocator((CFTypeRef)a1);
      CFStringRef v13 = _IOHIDCreateTimeString(v12, (time_t *)(a1 + 328));
      if (v13)
      {
        CFStringRef v14 = v13;
        CFDictionarySetValue(v4, @"LastDroppedEventTime", v13);
        CFRelease(v14);
      }
    }
    _IOHIDDictionaryAddSInt64(v4, @"MaxEventLatency", *(void *)(a1 + 360));
    _IOHIDDictionaryAddSInt64(v4, @"MaxPropertyNotificationHandlingTime", *(void *)(a1 + 376));
    CFMutableArrayRef v15 = _IOHIDEventSystemConnectionCopyEventLog((void *)a1);
    if (v15)
    {
      CFMutableArrayRef v16 = v15;
      CFDictionaryAddValue(v4, @"EventLog", v15);
      CFRelease(v16);
    }
    CFMutableDictionaryRef v17 = _IOHIDEventSystemConnectionCopyEventCounts((void *)a1);
    if (v17)
    {
      CFMutableDictionaryRef v18 = v17;
      CFDictionaryAddValue(v4, @"EventTypeCounts", v17);
      CFRelease(v18);
    }
    if (*(void *)(a1 + 432))
    {
      CFAllocatorRef v19 = CFGetAllocator((CFTypeRef)a1);
      CFMutableArrayRef v20 = CFArrayCreateMutable(v19, 50, MEMORY[0x1E4F1D510]);
      if (v20)
      {
        CFMutableArrayRef v21 = v20;
        os_unfair_recursive_lock_lock_with_options();
        CFDataRef v22 = *(const __CFData **)(a1 + 432);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 0x40000000;
        v47[2] = ____IOHIDEventSystemConnectionSerializeActivity_block_invoke;
        v47[3] = &__block_descriptor_tmp_196_0;
        v47[4] = a1;
        _IOHIDSimpleQueueApplyBlock(v22, (uint64_t)v47, (uint64_t)v21);
        os_unfair_recursive_lock_unlock();
        CFDictionaryAddValue(v4, @"ActivityLog", v21);
        CFRelease(v21);
      }
    }
    uint64_t v23 = (const void *)*MEMORY[0x1E4F1CFD0];
    uint64_t v24 = (const void *)*MEMORY[0x1E4F1CFC8];
    if (*(_DWORD *)(a1 + 256)) {
      uint64_t v25 = (const void *)*MEMORY[0x1E4F1CFD0];
    }
    else {
      uint64_t v25 = (const void *)*MEMORY[0x1E4F1CFC8];
    }
    CFDictionarySetValue(v4, @"ProtectedServicesDisabled", v25);
    CFAllocatorRef v26 = CFGetAllocator((CFTypeRef)a1);
    uint64_t v27 = *(unsigned char **)(a1 + 240);
    uint64_t v28 = CFDictionaryCreateMutable(v26, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v28)
    {
      uint64_t v29 = v28;
      if (*v27) {
        uint64_t v30 = v23;
      }
      else {
        uint64_t v30 = v24;
      }
      CFDictionarySetValue(v28, @"com.apple.private.hid.client.admin", v30);
      if ((*v27 & 2) != 0) {
        uint64_t v31 = v23;
      }
      else {
        uint64_t v31 = v24;
      }
      CFDictionarySetValue(v29, @"com.apple.private.hid.client.event-monitor", v31);
      if ((*v27 & 4) != 0) {
        unsigned int v32 = v23;
      }
      else {
        unsigned int v32 = v24;
      }
      CFDictionarySetValue(v29, @"com.apple.private.hid.client.event-filter", v32);
      if ((*v27 & 8) != 0) {
        uint64_t v33 = v23;
      }
      else {
        uint64_t v33 = v24;
      }
      CFDictionarySetValue(v29, @"com.apple.private.hid.client.event-dispatch", v33);
      if ((*v27 & 0x10) != 0) {
        uint64_t v34 = v23;
      }
      else {
        uint64_t v34 = v24;
      }
      CFDictionarySetValue(v29, @"com.apple.private.hid.client.service-protected", v34);
      if ((*v27 & 0x20) != 0) {
        __int16 v35 = v23;
      }
      else {
        __int16 v35 = v24;
      }
      CFDictionarySetValue(v29, @"com.apple.private.hid.client.motion-event-privileged", v35);
      if ((*v27 & 0x40) != 0) {
        int v36 = v23;
      }
      else {
        int v36 = v24;
      }
      CFDictionarySetValue(v29, @"com.apple.private.hid.client.debug-tool", v36);
      CFDictionaryAddValue(v4, @"EventSystemEntitlements", v29);
      CFRelease(v29);
    }
    if (*(void *)(a1 + 248))
    {
      __int16 v37 = (char *)MEMORY[0x18C131B50]();
      CFAllocatorRef v38 = CFGetAllocator((CFTypeRef)a1);
      CFStringRef v39 = CFStringCreateWithCString(v38, v37, 0);
      CFDictionaryAddValue(v4, @"ConnectionEntitlements", v39);
      CFRelease(v39);
      free(v37);
    }
    uint64_t v40 = *(void *)(a1 + 440);
    if (v40)
    {
      id v41 = IOHIDConnectionFilterCopyProperty(v40, @"ConnectionPluginDebug");
      if (v41)
      {
        uint64_t v42 = v41;
        CFDictionaryAddValue(v4, @"ConnectionPluginDebug", v41);
        CFRelease(v42);
      }
      else
      {
        CFDictionaryAddValue(v4, @"ConnectionPluginDebug", &stru_1ED870660);
      }
    }
    uint64_t v43 = *(void *)(a1 + 24);
    if (v43)
    {
      CFMutableDictionaryRef v44 = _IOHIDEventQueueSerializeState(v43);
      if (v44)
      {
        CFMutableDictionaryRef v45 = v44;
        CFDictionarySetValue(v4, @"QueueState", v44);
        CFRelease(v45);
      }
    }
    CFSetGetCount(*(CFSetRef *)(a1 + 80));
  }
  return v4;
}

CFMutableArrayRef _IOHIDEventSystemConnectionCopyEventLog(void *a1)
{
  if (!a1[48]) {
    return 0;
  }
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v2, 10, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    os_unfair_recursive_lock_lock_with_options();
    CFDataRef v4 = (const __CFData *)a1[48];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 0x40000000;
    v6[2] = ___IOHIDEventSystemConnectionCopyEventLog_block_invoke;
    v6[3] = &__block_descriptor_tmp_132;
    v6[4] = a1;
    _IOHIDSimpleQueueApplyBlock(v4, (uint64_t)v6, (uint64_t)Mutable);
    os_unfair_recursive_lock_unlock();
  }
  return Mutable;
}

CFMutableDictionaryRef _IOHIDEventSystemConnectionCopyEventCounts(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    for (uint64_t i = 0; i != 43; ++i)
    {
      if (*(_DWORD *)(a1[49] + 4 * i))
      {
        Name = IOHIDEventTypeGetName(i);
        _IOHIDDictionaryAddSInt32(Mutable, Name, *(_DWORD *)(a1[49] + 4 * i));
      }
    }
    if (!CFDictionaryGetCount(Mutable))
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

uint64_t _IOHIDEventSystemConnectionRecordServiceChanged(uint64_t result)
{
  if (!*(_DWORD *)(result + 448))
  {
    uint64_t v1 = result;
    os_unfair_recursive_lock_lock_with_options();
    iohideventsystem_client_dispatch_service_records_changed(*(_DWORD *)(v1 + 40));
    return os_unfair_recursive_lock_unlock();
  }
  return result;
}

uint64_t _IOHIDEventSystemConnectionRegisterRecordServiceChanged(void *a1)
{
  uint64_t result = a1[1];
  if (result) {
    return _IOHIDEventSystemRegisterRecordServiceChanged(result, a1);
  }
  return result;
}

uint64_t _IOHIDEventSystemConnectionUnregisterRecordServiceChanged(void *a1)
{
  uint64_t result = a1[1];
  if (result) {
    return _IOHIDEventSystemUnregisterRecordServiceChanged(result, a1);
  }
  return result;
}

uint64_t _IOHIDEventSystemConnectionRecordClientChanged(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(result + 448))
  {
    uint64_t v1 = result;
    os_unfair_recursive_lock_lock_with_options();
    int v2 = iohideventsystem_client_dispatch_client_records_changed(*(_DWORD *)(v1 + 40));
    int v3 = v2;
    if ((v2 - 268435459) < 2) {
      goto LABEL_5;
    }
    if (!v2) {
      return os_unfair_recursive_lock_unlock();
    }
    if (v2 == 268451843)
    {
LABEL_5:
      CFDataRef v4 = _IOHIDLogCategory(9u);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(v1 + 168);
        int v7 = 136315394;
        uint64_t v8 = v5;
        __int16 v9 = 1024;
        int v10 = v3;
        _os_log_impl(&dword_18B46C000, v4, OS_LOG_TYPE_INFO, "%s: iohideventsystem_client_dispatch_client_records_changed:0x%x", (uint8_t *)&v7, 0x12u);
      }
    }
    else
    {
      uint64_t v6 = _IOHIDLogCategory(9u);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        _IOHIDEventSystemConnectionRecordClientChanged_cold_1();
      }
    }
    __IOHIDEventSystemConnectionCheckServerStatus(v3, v1);
    return os_unfair_recursive_lock_unlock();
  }
  return result;
}

uint64_t _IOHIDEventSystemConnectionRegisterRecordClientChanged(void *a1)
{
  uint64_t result = a1[1];
  if (result) {
    return _IOHIDEventSystemRegisterRecordClientChanged(result, a1);
  }
  return result;
}

uint64_t _IOHIDEventSystemConnectionUnregisterRecordClientChanged(void *a1)
{
  uint64_t result = a1[1];
  if (result) {
    return _IOHIDEventSystemUnregisterRecordClientChanged(result, a1);
  }
  return result;
}

uint64_t _IOHIDEventSystemConnectionLogEvent(void *a1, uint64_t a2)
{
  v7.tv_sec = 0;
  *(void *)&v7.tv_usec = 0;
  uint64_t Type = IOHIDEventGetType(a2);
  gettimeofday(&v7, 0);
  os_unfair_recursive_lock_lock_with_options();
  CFDataRef v3 = (const __CFData *)a1[48];
  if (v3 || (v4 = CFGetAllocator(a1), CFDataRef v3 = _IOHIDSimpleQueueCreate(v4, 24, 10), (a1[48] = v3) != 0)) {
    _IOHIDSimpleQueueEnqueue(v3, &Type, 1);
  }
  ++*(_DWORD *)(a1[49] + 4 * Type);
  return os_unfair_recursive_lock_unlock();
}

void _IOHIDEventSystemConnectionRemoveVirtualService(uint64_t a1, const void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = _IOHIDLogCategory(9u);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 168);
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    CFStringRef v13 = a2;
    _os_log_impl(&dword_18B46C000, v4, OS_LOG_TYPE_DEFAULT, "%s: HIDVS ID:%llx destroy", buf, 0x16u);
  }
  if (a2)
  {
    CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 272), a2);
    if (Value)
    {
      timeval v7 = Value;
      CFRetain(Value);
      EnumerationQueue = _IOHIDEventSystemGetEnumerationQueue(*(void *)(a1 + 8));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ___IOHIDEventSystemConnectionRemoveVirtualService_block_invoke;
      block[3] = &__block_descriptor_tmp_135;
      block[4] = v7;
      dispatch_async(EnumerationQueue, block);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 272), a2);
    }
  }
}

uint64_t __IOHIDServiceVirtualSetOutputEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 3758097085;
  uint64_t SenderID = _IOHIDServiceGetSenderID(a1);
  unsigned int v19 = -536870212;
  CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a2);
  DataInternal = IOHIDEventCreateDataInternal(v7, a3);
  if (DataInternal)
  {
    __int16 v9 = DataInternal;
    CFAllocatorRef v10 = CFGetAllocator((CFTypeRef)a2);
    CFDataRef v11 = (const __CFData *)_IOHIDCreateBinaryData(v10, v9);
    if (v11)
    {
      CFDataRef v12 = v11;
      if (*(_DWORD *)(a2 + 448))
      {
        LODWORD(v5) = 5;
      }
      else
      {
        mach_port_t v13 = *(_DWORD *)(a2 + 40);
        BytePtr = CFDataGetBytePtr(v11);
        int Length = CFDataGetLength(v12);
        LODWORD(v5) = iohideventsystem_output_event_to_virtual_service(v13, SenderID, (uint64_t)BytePtr, Length, (int *)&v19, 0x20u);
        if (v5)
        {
          CFMutableArrayRef v16 = _IOHIDLogCategory(9u);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = *(void *)(a2 + 168);
            *(_DWORD *)buf = 136315650;
            uint64_t v21 = v17;
            __int16 v22 = 2048;
            uint64_t v23 = SenderID;
            __int16 v24 = 1024;
            int v25 = v5;
            _os_log_impl(&dword_18B46C000, v16, OS_LOG_TYPE_INFO, "%s: HIDVS ID:%llx iohideventsystem_output_event_to_virtual_service:%x", buf, 0x1Cu);
          }
          __IOHIDEventSystemConnectionCheckServerStatus(v5, a2);
        }
      }
      CFRelease(v9);
      CFRelease(v12);
      if (v5) {
        return v5;
      }
      else {
        return v19;
      }
    }
    else
    {
      CFRelease(v9);
    }
  }
  return v5;
}

uint64_t __IOHIDServiceVirtualCopyMatchingEventCallback(uint64_t a1, uint64_t a2, const __CFData *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t SenderID = _IOHIDServiceGetSenderID(a1);
  uint64_t v23 = 0;
  unsigned int v22 = 0;
  if (a3)
  {
    CFAllocatorRef v6 = CFGetAllocator((CFTypeRef)a2);
    CFDataRef v7 = (const __CFData *)_IOHIDCreateBinaryData(v6, a3);
    if (!v7)
    {
      CFMutableArrayRef v20 = _IOHIDLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __IOHIDServiceVirtualCopyMatchingEventCallback_cold_1(v20);
      }
      return 0;
    }
    a3 = v7;
    BytePtr = CFDataGetBytePtr(v7);
    int Length = CFDataGetLength(a3);
  }
  else
  {
    BytePtr = 0;
    int Length = 0;
  }
  if (*(_DWORD *)(a2 + 448)) {
    goto LABEL_10;
  }
  int v10 = iohideventsystem_copy_matching_event_from_virtual_service(*(_DWORD *)(a2 + 40), SenderID, (uint64_t)BytePtr, Length, &v23, &v22, 0x20u);
  if (v10)
  {
    int v11 = v10;
    CFDataRef v12 = _IOHIDLogCategory(9u);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a2 + 168);
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = SenderID;
      __int16 v28 = 1024;
      int v29 = v11;
      _os_log_impl(&dword_18B46C000, v12, OS_LOG_TYPE_INFO, "%s: HIDVS ID:%llx iohideventsystem_copy_matching_event_from_virtual_service:%x", buf, 0x1Cu);
    }
    __IOHIDEventSystemConnectionCheckServerStatus(v11, a2);
LABEL_10:
    uint64_t v14 = 0;
    if (!a3) {
      return v14;
    }
    goto LABEL_14;
  }
  CFMutableArrayRef v15 = v23;
  mach_vm_size_t v16 = v22;
  CFTypeID TypeID = CFDataGetTypeID();
  CFMutableDictionaryRef v18 = _IOHIDUnserializeAndVMDeallocWithTypeID(v15, v16, TypeID);
  if (!v18) {
    goto LABEL_10;
  }
  unsigned int v19 = v18;
  uint64_t v14 = IOHIDEventCreateWithDataInternal(*MEMORY[0x1E4F1CF80], v18);
  CFRelease(v19);
  if (a3) {
LABEL_14:
  }
    CFRelease(a3);
  return v14;
}

char *OUTLINED_FUNCTION_3_2(int a1, mach_error_t error_value, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return mach_error_string(error_value);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t IOHIDEventServerGetTypeID()
{
  uint64_t result = __kIOHIDEventServerTypeID;
  if (!__kIOHIDEventServerTypeID)
  {
    pthread_once(&__serviceTypeInit, (void (*)(void))__IOHIDEventServerRegister);
    return __kIOHIDEventServerTypeID;
  }
  return result;
}

uint64_t __IOHIDEventServerRegister()
{
  notify_register_check("com.apple.iohideventsystem.available", (int *)&__hidSystemToken);
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOHIDEventServerCFTypeID TypeID = result;
  return result;
}

void *IOHIDEventServerCreate(uint64_t a1, uint64_t a2)
{
  if (!__kIOHIDEventServerTypeID) {
    pthread_once(&__serviceTypeInit, (void (*)(void))__IOHIDEventServerRegister);
  }
  Instance = (void *)_CFRuntimeCreateInstance();
  uint64_t v4 = Instance;
  if (Instance)
  {
    Instance[3] = 0;
    Instance[4] = 0;
    Instance[2] = a2;
    __whiteListSet = (uint64_t)CFSetCreate(0, (const void **)__whiteList, 30, MEMORY[0x1E4F1D548]);
  }
  return v4;
}

uint64_t IOHIDEventServerScheduleWithDispatchQueue(uint64_t result, NSObject *a2)
{
  *(void *)(result + 32) = a2;
  if (a2)
  {
    CFDataRef v3 = (uint64_t *)result;
    uint64_t result = *(void *)(result + 24);
    if (result) {
      return IOMIGMachPortScheduleWithDispatchQueue(result, a2);
    }
    mach_port_t sp = 0;
    uint64_t result = bootstrap_check_in(*MEMORY[0x1E4F14638], "com.apple.iohideventsystem", &sp);
    if (!result)
    {
      CFAllocatorRef v4 = CFGetAllocator(v3);
      uint64_t result = (uint64_t)IOMIGMachPortCreate(v4, dword_1ED86F448, sp);
      v3[3] = result;
      if (result)
      {
        IOMIGMachPortRegisterDemuxCallback(result, (uint64_t)__IOHIDEventServerDemuxCallback, (uint64_t)v3);
        unsigned int Port = IOMIGMachPortGetPort(v3[3]);
        IOMIGMachPortCacheAdd(Port, v3);
        notify_post("com.apple.iohideventsystem.available");
        uint64_t result = v3[3];
        if (result) {
          return IOMIGMachPortScheduleWithDispatchQueue(result, a2);
        }
      }
    }
  }
  return result;
}

void IOHIDEventServerUnscheduleFromDispatchQueue(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3 && v3 == a2)
    {
      uint64_t v5 = _IOHIDLog();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18B46C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOHIDEventServerUnschedule", (const char *)&unk_18B51B6F3, buf, 2u);
      }
      dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 32));
      CFAllocatorRef v6 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = __IOHIDEventServerUnscheduleFromDispatchQueue_block_invoke;
      block[3] = &__block_descriptor_tmp_24;
      block[4] = a1;
      dispatch_async_and_wait(v6, block);
      for (uint64_t i = 0; i != 5; ++i)
      {
        CFArrayRef v8 = IOHIDEventSystemCopyConnections(*(CFSetRef **)(a1 + 16), i);
        if (v8)
        {
          CFArrayRef v9 = v8;
          v14.length = CFArrayGetCount(v8);
          v14.location = 0;
          CFArrayApplyFunction(v9, v14, (CFArrayApplierFunction)__IOHIDEventServerKillClientFunction, (void *)a1);
          CFRelease(v9);
        }
      }
      int v10 = *(const void **)(a1 + 24);
      if (v10)
      {
        CFRelease(v10);
        *(void *)(a1 + 24) = 0;
      }
      *(void *)(a1 + 32) = 0;
      int v11 = _IOHIDLog();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18B46C000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOHIDEventServerUnschedule", (const char *)&unk_18B51B6F3, buf, 2u);
      }
    }
  }
}

void __IOHIDEventServerUnscheduleFromDispatchQueue_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2) {
    IOMIGMachPortUnscheduleFromDispatchQueue(v2, *(void *)(v1 + 32));
  }
}

void __IOHIDEventServerKillClientFunction(const void *a1, uint64_t a2)
{
  CFRetain(*(CFTypeRef *)(a2 + 16));
  CFRetain(a1);
  DispatchQueue = _IOHIDEventSystemConnectionGetDispatchQueue((uint64_t)a1);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ____IOHIDEventServerKillClientFunction_block_invoke;
  v5[3] = &__block_descriptor_tmp_98;
  v5[4] = a2;
  v5[5] = a1;
  dispatch_async_and_wait(DispatchQueue, v5);
}

uint64_t _io_hideventsystem_dispatch_event(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  mach_vm_size_t v5 = a3;
  CFTypeID TypeID = CFDataGetTypeID();
  CFDataRef v7 = _IOHIDUnserializeAndVMDeallocWithTypeID(a2, v5, TypeID);
  if (v7)
  {
    CFArrayRef v8 = v7;
    CFArrayRef v9 = IOMIGMachPortCacheCopy(a1);
    if (v9)
    {
      int v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == IOHIDEventSystemConnectionGetTypeID())
      {
        if (IOHIDEventSystemConnectionGetType((uint64_t)v10)
          && (*(unsigned char *)IOHIDEventSystemConnectionGetEntitlements((uint64_t)v10) & 8) == 0)
        {
          CFMutableDictionaryRef v18 = _IOHIDLogCategory(0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            _io_hideventsystem_dispatch_event_cold_1((uint64_t)v10);
          }
        }
        else
        {
          uint64_t System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v10);
          if (System)
          {
            uint64_t v13 = System;
            CFAllocatorRef v14 = CFGetAllocator(v10);
            uint64_t v15 = IOHIDEventCreateWithDataInternal(v14, v8);
            if (v15)
            {
              mach_vm_size_t v16 = (const void *)v15;
              _IOHIDEventSystemConnectionLogEvent(v10, v15);
              _IOHIDEventSystemDispatchEvent(v13, v16);
              CFRelease(v16);
            }
          }
        }
      }
      CFRelease(v10);
    }
    CFRelease(v8);
  }
  return 0;
}

uint64_t _io_hideventsystem_do_client_refresh(unsigned int a1, vm_offset_t *a2, _DWORD *a3)
{
  *a3 = 0;
  mach_vm_size_t v5 = (CFSetRef *)IOMIGMachPortCacheCopy(a1);
  if (v5)
  {
    CFAllocatorRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != IOHIDEventSystemConnectionGetTypeID()) {
      goto LABEL_10;
    }
    if (!_IOHIDEventSystemConnectionGetSystem((uint64_t)v6)) {
      goto LABEL_10;
    }
    CFSetRef v8 = _IOHIDEventSystemConnectionCopyServices(v6);
    if (!v8) {
      goto LABEL_10;
    }
    CFSetRef v9 = v8;
    CFIndex Count = CFSetGetCount(v8);
    CFTypeID v11 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
    if (v11)
    {
      uint64_t v12 = v11;
      CFSetGetValues(v9, v11);
      CFArrayRef v13 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, Count, MEMORY[0x1E4F1D510]);
      CFAllocatorRef v14 = (CFSetRef *)v13;
      if (v13 && (CFArrayRef v15 = _IOHIDCopyServiceClientInfo(v13)) != 0)
      {
        CFArrayRef v16 = v15;
        *a3 = _IOHIDSerialize(v15, a2);
        free(v12);
        CFRelease(v16);
      }
      else
      {
        free(v12);
      }
    }
    else
    {
      CFAllocatorRef v14 = 0;
    }
    CFRelease(v9);
    CFRelease(v6);
    CFAllocatorRef v6 = v14;
    if (v14) {
LABEL_10:
    }
      CFRelease(v6);
  }
  return 0;
}

uint64_t _io_hideventsystem_service_conforms_to(unsigned int a1, UInt8 *bytes, CFIndex length, int a4, int a5, _DWORD *a6)
{
  *a6 = 0;
  CFPropertyListRef v10 = _IOHIDUnserializeAndVMDealloc(bytes, length);
  if (v10)
  {
    CFTypeID v11 = v10;
    uint64_t v12 = IOMIGMachPortCacheCopy(a1);
    if (v12)
    {
      CFArrayRef v13 = v12;
      CFTypeID v14 = CFGetTypeID(v12);
      if (v14 == IOHIDEventSystemConnectionGetTypeID())
      {
        uint64_t System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v13);
        if (System)
        {
          CFArrayRef v16 = IOHIDEventSystemCopyService(System, v11);
          if (v16)
          {
            uint64_t v17 = v16;
            *a6 = IOHIDServiceConformsTo((uint64_t)v16, a4, a5);
            CFRelease(v17);
          }
        }
      }
      CFRelease(v11);
    }
    else
    {
      CFArrayRef v13 = v11;
    }
    CFRelease(v13);
  }
  return 0;
}

uint64_t _io_hideventsystem_copy_matching_event_for_service(unsigned int a1, uint64_t a2, UInt8 *a3, unsigned int a4, vm_offset_t *a5, _DWORD *a6)
{
  uint64_t valuePtr = a2;
  *a6 = 0;
  mach_vm_size_t v10 = a4;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryRef v12 = (const __CFDictionary *)_IOHIDUnserializeAndVMDeallocWithTypeID(a3, v10, TypeID);
  CFNumberRef v13 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  if (v13)
  {
    CFTypeID v14 = IOMIGMachPortCacheCopy(a1);
    CFArrayRef v15 = v14;
    if (v14)
    {
      CFTypeID v16 = CFGetTypeID(v14);
      if (v16 == IOHIDEventSystemConnectionGetTypeID()
        && IOHIDEventSystemConnectionGetType((uint64_t)v15) != 2
        && IOHIDEventSystemConnectionGetType((uint64_t)v15) != 4)
      {
        uint64_t System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v15);
        if (System)
        {
          CFMutableDictionaryRef v18 = IOHIDEventSystemCopyService(System, v13);
          unsigned int v19 = v18;
          if (v18)
          {
            uint64_t v20 = IOHIDServiceCopyMatchingEvent((uint64_t)v18, v12, v15);
            if (v20)
            {
              uint64_t v21 = (const void *)v20;
              CFAllocatorRef v22 = CFGetAllocator(v15);
              DataInternal = IOHIDEventCreateDataInternal(v22, (uint64_t)v21);
              if (DataInternal)
              {
                __int16 v24 = DataInternal;
                *a6 = _IOHIDSerialize(DataInternal, a5);
                CFRelease(v24);
              }
              CFRelease(v21);
            }
          }
          if (v12) {
            goto LABEL_13;
          }
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    CFArrayRef v15 = 0;
  }
  unsigned int v19 = 0;
  if (v12) {
LABEL_13:
  }
    CFRelease(v12);
LABEL_14:
  if (v19) {
    CFRelease(v19);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v15) {
    CFRelease(v15);
  }
  return 0;
}

uint64_t _io_hideventsystem_set_element_value_for_service(unsigned int a1, UInt8 *bytes, CFIndex length, int a4, char a5, int a6, int *a7)
{
  int v12 = -536870212;
  CFPropertyListRef v13 = _IOHIDUnserializeAndVMDealloc(bytes, length);
  if (v13)
  {
    CFTypeID v14 = v13;
    CFArrayRef v15 = IOMIGMachPortCacheCopy(a1);
    if (v15)
    {
      CFTypeID v16 = v15;
      CFTypeID v17 = CFGetTypeID(v15);
      if (v17 == IOHIDEventSystemConnectionGetTypeID())
      {
        uint64_t System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v16);
        if (System)
        {
          unsigned int v19 = IOHIDEventSystemCopyService(System, v14);
          if (v19)
          {
            uint64_t v20 = v19;
            int v12 = IOHIDServiceSetElementValue((uint64_t)v19, a4, a5, a6);
            CFRelease(v20);
          }
        }
      }
      CFRelease(v14);
    }
    else
    {
      CFTypeID v16 = v14;
    }
    CFRelease(v16);
  }
  *a7 = v12;
  return 0;
}

uint64_t _io_hideventsystem_copy_properties_for_service(unsigned int a1, UInt8 *bytes, CFIndex length, UInt8 *a4, unsigned int a5, vm_offset_t *a6, _DWORD *a7, int *a8)
{
  *a7 = 0;
  int v14 = -536870206;
  CFPropertyListRef v15 = _IOHIDUnserializeAndVMDealloc(bytes, length);
  CFTypeID TypeID = CFArrayGetTypeID();
  CFArrayRef v17 = (const __CFArray *)_IOHIDUnserializeAndVMDeallocWithTypeID(a4, a5, TypeID);
  CFArrayRef v18 = v17;
  if (v17 && v15)
  {
    unsigned int v19 = IOMIGMachPortCacheCopy(a1);
    uint64_t v20 = v19;
    if (v19)
    {
      CFTypeID v21 = CFGetTypeID(v19);
      uint64_t v22 = IOHIDEventSystemConnectionGetTypeID();
      if (a6)
      {
        if (v21 == v22)
        {
          uint64_t System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v20);
          if (System)
          {
            __int16 v24 = IOHIDEventSystemCopyService(System, v15);
            if (v24)
            {
              uint64_t v25 = v24;
              CFMutableDictionaryRef v26 = _IOHIDServiceCopyPropertiesForClient((uint64_t)v24, v18, (uint64_t)v20);
              *a7 = _IOHIDSerialize(v26, a6);
              if (v26) {
                CFRelease(v26);
              }
              CFRelease(v18);
              CFRelease(v25);
              int v14 = 0;
              goto LABEL_11;
            }
            int v14 = -536870160;
          }
          else
          {
            int v14 = -536870185;
          }
        }
      }
    }
    goto LABEL_19;
  }
  uint64_t v20 = 0;
  if (v17) {
LABEL_19:
  }
    CFRelease(v18);
  if (v15) {
LABEL_11:
  }
    CFRelease(v15);
  if (v20) {
    CFRelease(v20);
  }
  *a8 = v14;
  return 0;
}

uint64_t _io_hideventsystem_register_property_changed_notification(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  mach_vm_size_t v5 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeID v7 = _IOHIDUnserializeAndVMDeallocWithTypeID(a2, v5, TypeID);
  if (v7)
  {
    CFSetRef v8 = v7;
    CFSetRef v9 = IOMIGMachPortCacheCopy(a1);
    if (v9)
    {
      mach_vm_size_t v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == IOHIDEventSystemConnectionGetTypeID()) {
        _IOHIDEventSystemConnectionRegisterPropertyChangedNotification(v10, v8);
      }
      CFRelease(v10);
    }
    CFRelease(v8);
  }
  return 0;
}

uint64_t _io_hideventsystem_unregister_property_changed_notification(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  mach_vm_size_t v5 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeID v7 = _IOHIDUnserializeAndVMDeallocWithTypeID(a2, v5, TypeID);
  if (v7)
  {
    CFSetRef v8 = v7;
    CFSetRef v9 = IOMIGMachPortCacheCopy(a1);
    if (v9)
    {
      mach_vm_size_t v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == IOHIDEventSystemConnectionGetTypeID()) {
        _IOHIDEventSystemConnectionUnregisterPropertyChangedNotification((uint64_t)v10, v8);
      }
      CFRelease(v10);
    }
    CFRelease(v8);
  }
  return 0;
}

uint64_t _io_hideventsystem_register_event_filter(unsigned int a1, int a2)
{
  uint64_t v3 = IOMIGMachPortCacheCopy(a1);
  if (v3)
  {
    CFAllocatorRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == IOHIDEventSystemConnectionGetTypeID())
    {
      if (IOHIDEventSystemConnectionGetType((uint64_t)v4)
        && (*(unsigned char *)IOHIDEventSystemConnectionGetEntitlements((uint64_t)v4) & 4) == 0)
      {
        CFTypeID v7 = _IOHIDLogCategory(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          _io_hideventsystem_register_event_filter_cold_1((uint64_t)v4);
        }
      }
      else
      {
        _IOHIDEventSystemConnectionRegisterEventFilter((uint64_t)v4, a2);
      }
    }
    CFRelease(v4);
  }
  return 0;
}

uint64_t _io_hideventsystem_unregister_event_filter(unsigned int a1)
{
  uint64_t v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID()) {
      _IOHIDEventSystemConnectionUnregisterEventFilter(v2);
    }
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_register_record_client_changed_notification(unsigned int a1)
{
  uint64_t v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID())
    {
      if (IOHIDEventSystemConnectionGetType((uint64_t)v2))
      {
        CFTypeID v5 = _IOHIDLogCategory(0);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          _io_hideventsystem_register_record_client_changed_notification_cold_1((uint64_t)v2);
        }
      }
      else
      {
        _IOHIDEventSystemConnectionRegisterRecordClientChanged(v2);
      }
    }
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_unregister_record_client_changed_notification(unsigned int a1)
{
  uint64_t v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID()) {
      _IOHIDEventSystemConnectionUnregisterRecordClientChanged(v2);
    }
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_register_record_service_changed_notification(unsigned int a1)
{
  uint64_t v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID())
    {
      if (IOHIDEventSystemConnectionGetType((uint64_t)v2))
      {
        CFTypeID v5 = _IOHIDLogCategory(0);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          _io_hideventsystem_register_record_client_changed_notification_cold_1((uint64_t)v2);
        }
      }
      else
      {
        _IOHIDEventSystemConnectionRegisterRecordServiceChanged(v2);
      }
    }
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_unregister_record_service_changed_notification(unsigned int a1)
{
  uint64_t v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID()) {
      _IOHIDEventSystemConnectionUnregisterRecordServiceChanged(v2);
    }
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_remove_virtual_service(unsigned int a1, const void *a2)
{
  uint64_t v3 = 3758097090;
  CFAllocatorRef v4 = IOMIGMachPortCacheCopy(a1);
  if (v4)
  {
    CFTypeID v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == IOHIDEventSystemConnectionGetTypeID())
    {
      _IOHIDEventSystemConnectionRemoveVirtualService((uint64_t)v5, a2);
      uint64_t v3 = 0;
    }
    CFRelease(v5);
  }
  return v3;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void checkFeatureEnabled()
{
  if (checkFeatureEnabled_onceToken != -1) {
    dispatch_once(&checkFeatureEnabled_onceToken, &__block_literal_global_15);
  }
}

void __checkFeatureEnabled_block_invoke()
{
  PMQueue = getPMQueue();

  dispatch_sync(PMQueue, &__block_literal_global_3);
}

void __checkFeatureEnabled_block_invoke_2()
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", MEMORY[0x1E4F14428], 0);
  if (mach_service)
  {
    uint64_t v1 = mach_service;
    PMQueue = getPMQueue();
    xpc_connection_set_target_queue(v1, PMQueue);
    xpc_connection_set_event_handler(v1, &__block_literal_global_9);
    xpc_connection_resume(v1);
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v3, "assertionFeatureSupported", 1);
    CFAllocatorRef v4 = getPMQueue();
    xpc_connection_send_message_with_reply(v1, v3, v4, &__block_literal_global_14);
    if (v3) {
      xpc_release(v3);
    }
    xpc_release(v1);
  }
  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      __checkFeatureEnabled_block_invoke_2_cold_2();
    }
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v5) {
      __checkFeatureEnabled_block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

void __checkFeatureEnabled_block_invoke_2_11(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x18C131C50](a2) == MEMORY[0x1E4F14590])
  {
    BOOL v3 = xpc_dictionary_get_BOOL(a2, "assertionFeatureSupported");
    uint64_t v4 = assertions_log;
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 67109120;
        BOOL v7 = v3;
        BOOL v5 = v4;
LABEL_7:
        _os_log_impl(&dword_18B46C000, v5, OS_LOG_TYPE_DEFAULT, "Assertion feature: setting gAsyncMode to %d", (uint8_t *)&v6, 8u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 67109120;
      BOOL v7 = v3;
      BOOL v5 = MEMORY[0x1E4F14500];
      goto LABEL_7;
    }
    gAsyncMode = v3;
  }
}

uint64_t IOPMEnableAsyncAssertions()
{
  gAsyncMode = 1;
  return 0;
}

uint64_t IOPMDisableAsyncAssertions()
{
  gAsyncMode = 0;
  return 0;
}

void setupLogging()
{
  if (setupLogging_onceToken != -1) {
    dispatch_once(&setupLogging_onceToken, &__block_literal_global_17);
  }
}

os_log_t __setupLogging_block_invoke()
{
  os_log_t result = os_log_create("com.apple.iokit", "assertions");
  assertions_log = (uint64_t)result;
  return result;
}

void handleAsyncAssertionDisableOverride(int a1)
{
  uint64_t v1 = assertions_log;
  if (a1)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        uint64_t v2 = (uint8_t *)&v12;
        BOOL v3 = v1;
LABEL_10:
        _os_log_impl(&dword_18B46C000, v3, OS_LOG_TYPE_DEFAULT, "gAsyncModeDisableOverride: enable", v2, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v3 = MEMORY[0x1E4F14500];
      uint64_t v2 = buf;
      goto LABEL_10;
    }
    char v5 = 1;
    goto LABEL_15;
  }
  if (!assertions_log)
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    char v5 = 0;
    if (!v8) {
      goto LABEL_15;
    }
    __int16 v9 = 0;
    BOOL v7 = MEMORY[0x1E4F14500];
    int v6 = (uint8_t *)&v9;
LABEL_14:
    _os_log_impl(&dword_18B46C000, v7, OS_LOG_TYPE_DEFAULT, "gAsyncModeDisableOverride: disable", v6, 2u);
    char v5 = 0;
    goto LABEL_15;
  }
  BOOL v4 = os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT);
  char v5 = 0;
  if (v4)
  {
    __int16 v10 = 0;
    int v6 = (uint8_t *)&v10;
    BOOL v7 = v1;
    goto LABEL_14;
  }
LABEL_15:
  gAsyncModeDisableOverride = v5;
}

void __initialSetup_block_invoke(uint64_t a1, int token)
{
  notify_get_state(token, (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  handleAsyncAssertionDisableOverride(v3);
}

void __initialSetup_block_invoke_24()
{
  uint64_t v0 = assertions_log;
  if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v4 = 0;
      uint64_t v1 = (uint8_t *)&v4;
      uint64_t v2 = v0;
LABEL_6:
      _os_log_impl(&dword_18B46C000, v2, OS_LOG_TYPE_DEFAULT, "Re-syncing assertions", v1, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v3 = 0;
    uint64_t v2 = MEMORY[0x1E4F14500];
    uint64_t v1 = (uint8_t *)&v3;
    goto LABEL_6;
  }
  offloadAssertions(1);
}

void __initialSetup_block_invoke_28(uint64_t a1, void *a2)
{
}

void processRemoteMsg(void *a1)
{
  uint64_t v2 = MEMORY[0x18C131C50]();
  if (v2 == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_value(a1, "assertionCheck"))
    {
      processCheckAssertionsMsg(a1);
    }
    else if (xpc_dictionary_get_value(a1, "assertionTimeout"))
    {
      processAssertionTimeout(a1);
    }
    else if (xpc_dictionary_get_value(a1, "assertionUpdateActivity"))
    {
      processAssertionUpdateActivity(a1);
    }
    else if (xpc_dictionary_get_value(a1, "assertionUpdateActives"))
    {
      processCurrentActiveAssertions(a1);
    }
    else if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        processRemoteMsg_cold_2();
      }
    }
    else
    {
      BOOL v27 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v27) {
        processRemoteMsg_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }
  else if (v2 == MEMORY[0x1E4F145A8])
  {
    if (a1 == (void *)MEMORY[0x1E4F14520])
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          processRemoteMsg_cold_4();
        }
      }
      else
      {
        BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v11) {
          processRemoteMsg_cold_3(v11, v12, v13, v14, v15, v16, v17, v18);
        }
      }
      if (gAssertionConnection)
      {
        xpc_release((xpc_object_t)gAssertionConnection);
        gAssertionConnection = 0;
        gAsyncModeSetupDone = 0;
        gCurrentRemoteAssertion = 0;
        gCurrentAssertion = 0;
        gCurrentRemoteAssertionIsCoalesced = 0;
      }
    }
    else if (a1 == (void *)MEMORY[0x1E4F14528])
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          processRemoteMsg_cold_4();
        }
      }
      else
      {
        BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v19) {
          processRemoteMsg_cold_3(v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      if (gAssertionConnection)
      {
        xpc_release((xpc_object_t)gAssertionConnection);
        gAssertionConnection = 0;
        gAsyncModeSetupDone = 0;
      }
    }
    else
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          processRemoteMsg_cold_8();
        }
      }
      else
      {
        BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v3) {
          processRemoteMsg_cold_7(v3, v4, v5, v6, v7, v8, v9, v10);
        }
      }
      gAsyncMode = 0;
    }
  }
}

void __initialSetup_block_invoke_2()
{
  gAssertionsOffloader = 0;
}

BOOL multipleActiveAssertionsExist()
{
  return (int)CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) > 1;
}

BOOL activeAssertions()
{
  return (int)CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) > 0;
}

uint64_t setAsyncAssertionProperties(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = 0;
  uint64_t PMQueue = getPMQueue();
  if (PMQueue)
  {
    uint64_t v7 = PMQueue;
    uint64_t v8 = assertions_log;
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        int v18 = a3;
        __int16 v19 = 2112;
        uint64_t v20 = a1;
        __int16 v21 = 2112;
        uint64_t v22 = a2;
        _os_log_debug_impl(&dword_18B46C000, v8, OS_LOG_TYPE_DEBUG, "setAsyncAssertionProperties for 0x%x %@:%@", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      setAsyncAssertionProperties_cold_1(a1, a2, a3);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 0x40000000;
    v11[2] = __setAsyncAssertionProperties_block_invoke;
    v11[3] = &unk_1E548B1E0;
    int v12 = a3;
    v11[4] = &v13;
    v11[5] = a1;
    v11[6] = a2;
    dispatch_sync(v7, v11);
    uint64_t v9 = *((unsigned int *)v14 + 6);
  }
  else
  {
    uint64_t v9 = 3758097097;
    *((_DWORD *)v14 + 6) = -536870199;
  }
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __setAsyncAssertionProperties_block_invoke(uint64_t a1)
{
  uint64_t v2 = (int *)(a1 + 56);
  BOOL v3 = (const void *)(*(_WORD *)(a1 + 58) & 0x7FFF);
  value = 0;
  int v29 = 0;
  if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)gAssertionsDict, v3, (const void **)&value))
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        __setAsyncAssertionProperties_block_invoke_cold_2();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __setAsyncAssertionProperties_block_invoke_cold_1();
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    int v8 = -536870911;
    goto LABEL_20;
  }
  uint64_t v4 = value;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v4 || CFGetTypeID(v4) != TypeID)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        __setAsyncAssertionProperties_block_invoke_cold_4();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __setAsyncAssertionProperties_block_invoke_cold_3();
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    int v8 = -536870199;
LABEL_20:
    *(_DWORD *)(v7 + 24) = v8;
    return;
  }
  uint64_t v6 = value;
  CFDictionarySetValue((CFMutableDictionaryRef)value, *(const void **)(a1 + 40), *(const void **)(a1 + 48));
  if (CFEqual(*(CFStringRef *)(a1 + 40), @"TimeoutSeconds"))
  {
    if (CFDictionaryContainsKey((CFDictionaryRef)gActiveAssertionsDict, v3))
    {
      removeFromTimedList(*v2);
      insertIntoTimedList(v6);
      goto LABEL_24;
    }
    if (!CFDictionaryContainsKey((CFDictionaryRef)gInactiveAssertionsDict, v3)) {
      goto LABEL_24;
    }
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
        __setAsyncAssertionProperties_block_invoke_cold_6();
      }
    }
    else
    {
      BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v20) {
        __setAsyncAssertionProperties_block_invoke_cold_5(v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    int v28 = 255;
    CFNumberRef v19 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &v28);
LABEL_40:
    CFMutableDictionaryRef Mutable = v19;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = handleAssertionLevel(v19, *(unsigned int *)(a1 + 56), 0);
    CFDictionaryContainsKey((CFDictionaryRef)v6, @"AsyncRemoteAssertionId");
    if (Mutable) {
      goto LABEL_41;
    }
    return;
  }
  if (CFEqual(*(CFStringRef *)(a1 + 40), @"AssertLevel"))
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
        __setAsyncAssertionProperties_block_invoke_cold_8();
      }
    }
    else
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v11) {
        __setAsyncAssertionProperties_block_invoke_cold_7(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    CFNumberRef v19 = (const __CFNumber *)CFRetain(*(CFTypeRef *)(a1 + 48));
    goto LABEL_40;
  }
  if (CFEqual(*(CFStringRef *)(a1 + 40), @"AssertName")) {
    logAsyncAssertionActivity(5u, *v2);
  }
LABEL_24:
  if (CFDictionaryContainsKey((CFDictionaryRef)v6, @"AsyncRemoteAssertionId"))
  {
    CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v6, @"AsyncRemoteAssertionId");
    int v28 = 0;
    CFNumberGetValue(v9, kCFNumberIntType, &v28);
    if (v28 == gCurrentRemoteAssertion)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionarySetValue(Mutable, *(const void **)(a1 + 40), *(const void **)(a1 + 48));
      CFDictionarySetValue(Mutable, @"AsyncRemoteAssertionId", v9);
      sendAsyncAssertionMsg(0, (uint64_t)Mutable, &v29, 0);
LABEL_41:
      CFRelease(Mutable);
    }
  }
}

uint64_t handleAssertionLevel(const __CFNumber *a1, uint64_t a2, char a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr);
  CFStringRef Value = (__CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)gAssertionsDict, (const void *)(WORD1(a2) & 0x7FFF));
  if (Value)
  {
    uint64_t v6 = Value;
    int v7 = CFDictionaryContainsKey((CFDictionaryRef)gActiveAssertionsDict, (const void *)(WORD1(a2) & 0x7FFF));
    int v8 = CFDictionaryContainsKey((CFDictionaryRef)gInactiveAssertionsDict, (const void *)(WORD1(a2) & 0x7FFF));
    if (v7 | v8)
    {
      if (valuePtr)
      {
        if (valuePtr == 255 && v8)
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFDateRef v10 = CFDateCreate(0, Current);
          if (v10)
          {
            CFDateRef v11 = v10;
            CFDictionarySetValue(v6, @"AssertStartWhen", v10);
            CFRelease(v11);
          }
          if (CFDictionaryContainsKey(v6, @"AssertReleaseWhen")) {
            CFDictionaryRemoveValue(v6, @"AssertReleaseWhen");
          }
          CFDictionaryRemoveValue((CFMutableDictionaryRef)gInactiveAssertionsDict, (const void *)(WORD1(a2) & 0x7FFF));
          activateAsyncAssertion(a2, 4);
        }
      }
      else if (v7)
      {
        CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
        CFDateRef v14 = CFDateCreate(0, v13);
        if (v14)
        {
          CFDateRef v15 = v14;
          CFDictionarySetValue(v6, @"AssertReleaseWhen", v14);
          CFRelease(v15);
        }
        CFArrayAppendValue((CFMutableArrayRef)gReleasedAssertionsList, v6);
        CFDictionarySetValue((CFMutableDictionaryRef)gInactiveAssertionsDict, (const void *)(WORD1(a2) & 0x7FFF), v6);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)gActiveAssertionsDict, (const void *)(WORD1(a2) & 0x7FFF));
        if ((a3 & 1) == 0) {
          logAsyncAssertionActivity(3u, a2);
        }
        if ((int)CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) <= 0 && gCurrentAssertion)
        {
          if (assertions_log)
          {
            if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
              handleAssertionLevel_cold_5();
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            handleAssertionLevel_cold_4();
          }
          sendAsyncReleaseMsg(gCurrentRemoteAssertion, 1, gCurrentRemoteAssertionIsCoalesced);
          gCurrentAssertion = 0;
          gCurrentRemoteAssertion = 0;
          gCurrentRemoteAssertionIsCoalesced = 0;
        }
      }
      uint64_t v16 = assertions_log;
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          int v20 = a2;
          __int16 v21 = 1024;
          int v22 = valuePtr;
          __int16 v23 = 2112;
          uint64_t v24 = v6;
          _os_log_debug_impl(&dword_18B46C000, v16, OS_LOG_TYPE_DEBUG, "handleAssertionLevel for 0x%x to %d: %@", buf, 0x18u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        handleAssertionLevel_cold_3(&valuePtr, (uint64_t)v6, a2);
      }
      return 0;
    }
    else
    {
      uint64_t v12 = 3758097084;
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          handleAssertionLevel_cold_7();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        handleAssertionLevel_cold_6();
      }
    }
  }
  else if (assertions_log)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      handleAssertionLevel_cold_2();
    }
  }
  else
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      handleAssertionLevel_cold_1();
    }
  }
  return v12;
}

void clearAssertionLogBuffer()
{
  gAsyncAssertionActivityLog_2 = 0;
  gAsyncAssertionActivityLog_0 = 0;
  if (gAsyncAssertionActivityLog_1) {
    CFArrayRemoveAllValues((CFMutableArrayRef)gAsyncAssertionActivityLog_1);
  }
}

void processCheckAssertionsMsg(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) < 1)
  {
    unsigned int v3 = 0;
  }
  else
  {
    uint64_t PMQueue = getPMQueue();
    dispatch_async(PMQueue, &__block_literal_global_89);
    unsigned int v3 = 1;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  if (reply)
  {
    uint64_t v5 = reply;
    uint64_t uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
    xpc_dictionary_set_uint64(v5, "assertionCheckToken", uint64);
    xpc_dictionary_set_uint64(v5, "assertionCheckCount", v3);
    uint64_t v7 = assertions_log;
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109376;
        unsigned int v19 = v3;
        __int16 v20 = 2048;
        uint64_t v21 = uint64;
        int v8 = v7;
LABEL_13:
        _os_log_impl(&dword_18B46C000, v8, OS_LOG_TYPE_DEFAULT, "Replying to assertion check message with count %d token:%llu\n", (uint8_t *)&v18, 0x12u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109376;
      unsigned int v19 = v3;
      __int16 v20 = 2048;
      uint64_t v21 = uint64;
      int v8 = MEMORY[0x1E4F14500];
      goto LABEL_13;
    }
    remote_connection = xpc_dictionary_get_remote_connection(a1);
    xpc_connection_send_message(remote_connection, v5);
    xpc_release(v5);
    return;
  }
  if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      processCheckAssertionsMsg_cold_2();
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v10) {
      processCheckAssertionsMsg_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void __processCheckAssertionsMsg_block_invoke()
{
  if (gCurrentRemoteAssertion)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        __processCheckAssertionsMsg_block_invoke_cold_2();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __processCheckAssertionsMsg_block_invoke_cold_1();
    }
  }
  offloadAssertions(1);
}

void processAssertionTimeout(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int uint64 = xpc_dictionary_get_uint64(a1, "assertionTimeout");
  int v2 = gCurrentRemoteAssertion;
  uint64_t v3 = assertions_log;
  if (gCurrentRemoteAssertion == uint64)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 67109376;
        int v11 = uint64;
        __int16 v12 = 1024;
        int v13 = gCurrentAssertion;
        uint64_t v4 = v3;
LABEL_10:
        _os_log_impl(&dword_18B46C000, v4, OS_LOG_TYPE_DEFAULT, "Current assertion has been released by powerd gCurrentRemoteAssertion 0x%x gCurrentAssertion 0x%x", (uint8_t *)&v10, 0xEu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109376;
      int v11 = uint64;
      __int16 v12 = 1024;
      int v13 = gCurrentAssertion;
      uint64_t v4 = MEMORY[0x1E4F14500];
      goto LABEL_10;
    }
  }
  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      processAssertionTimeout_cold_12();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    processAssertionTimeout_cold_11();
  }
  uint64_t v5 = (const void *)(HIWORD(gCurrentAssertion) & 0x7FFF);
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)gAssertionsDict, v5);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    removeFromTimedList(gCurrentAssertion);
    if (CFDictionaryContainsKey((CFDictionaryRef)gActiveAssertionsDict, v5))
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
          processAssertionTimeout_cold_10();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        processAssertionTimeout_cold_9();
      }
      CFDictionaryRemoveValue((CFMutableDictionaryRef)gActiveAssertionsDict, v5);
    }
    else if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
        processAssertionTimeout_cold_8();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      processAssertionTimeout_cold_7();
    }
    if (CFDictionaryContainsValue(Value, @"TimeoutAction")) {
      CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(Value, @"TimeoutAction");
    }
    else {
      CFStringRef v8 = @"TimeoutActionTurnOff";
    }
    if (CFStringCompare(v8, @"TimeoutActionRelease", 0))
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
          processAssertionTimeout_cold_6();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        processAssertionTimeout_cold_5();
      }
      CFDictionarySetValue((CFMutableDictionaryRef)gInactiveAssertionsDict, v5, Value);
    }
    else
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
          processAssertionTimeout_cold_4();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        processAssertionTimeout_cold_3();
      }
      CFDictionaryRemoveValue((CFMutableDictionaryRef)gAssertionsDict, v5);
    }
  }
  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
      processAssertionTimeout_cold_2();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    processAssertionTimeout_cold_1();
  }
  if (v2 == uint64)
  {
    gCurrentAssertion = 0;
    gCurrentRemoteAssertion = 0;
    gCurrentRemoteAssertionIsCoalesced = 0;
  }
  uint64_t PMQueue = getPMQueue();
  dispatch_async(PMQueue, &__block_literal_global_104);
}

void __processAssertionTimeout_block_invoke()
{
}

void processAssertionUpdateActivity(void *a1)
{
  uint64_t v2 = assertions_log;
  if (assertions_log)
  {
    if (!os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    __int16 v26 = 0;
    uint64_t v3 = (uint8_t *)&v26;
    uint64_t v4 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    __int16 v25 = 0;
    uint64_t v4 = MEMORY[0x1E4F14500];
    uint64_t v3 = (uint8_t *)&v25;
  }
  _os_log_impl(&dword_18B46C000, v4, OS_LOG_TYPE_DEFAULT, "Powerd has requested assertion activity update", v3, 2u);
LABEL_7:
  if (gAssertionConnection)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      uint64_t v6 = reply;
      uint64_t uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
      xpc_dictionary_set_uint64(v6, "assertionCheckToken", uint64);
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
          processAssertionUpdateActivity_cold_6();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        processAssertionUpdateActivity_cold_5();
      }
      if (gAsyncAssertionActivityLog_2 && CFArrayGetCount((CFArrayRef)gAsyncAssertionActivityLog_1))
      {
        CFStringRef v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v6, "assertionActivityLog", v8);
        if (gAsyncAssertionActivityLog_2 >= 0x19) {
          xpc_dictionary_set_BOOL(v6, "assertionActivityUpdateOverflow", 1);
        }
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v6);
        if (v8) {
          xpc_release(v8);
        }
      }
      else
      {
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v6);
      }
      xpc_release(v6);
      gAsyncAssertionActivityLog_2 = 0;
      gAsyncAssertionActivityLog_0 = 0;
      if (gAsyncAssertionActivityLog_1) {
        CFArrayRemoveAllValues((CFMutableArrayRef)gAsyncAssertionActivityLog_1);
      }
    }
    else if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        processAssertionUpdateActivity_cold_4();
      }
    }
    else
    {
      BOOL v17 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v17) {
        processAssertionUpdateActivity_cold_3(v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      processAssertionUpdateActivity_cold_2();
    }
  }
  else
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v9) {
      processAssertionUpdateActivity_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void processCurrentActiveAssertions(void *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = assertions_log;
  if (assertions_log)
  {
    if (!os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = MEMORY[0x1E4F14500];
  }
  _os_log_impl(&dword_18B46C000, v3, OS_LOG_TYPE_DEFAULT, "Powerd has requested active assertions update", buf, 2u);
LABEL_7:
  if (gAssertionConnection)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      uint64_t v5 = reply;
      uint64_t uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
      xpc_dictionary_set_uint64(v5, "assertionCheckToken", uint64);
      if (gActiveAssertionsDict && CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) >= 1)
      {
        CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
        CFStringRef v8 = 0;
        BOOL v9 = MEMORY[0x1E4F14500];
        do
        {
          *(void *)buf = 0;
          if (CFDictionaryGetValueIfPresent((CFDictionaryRef)gActiveAssertionsDict, v8, (const void **)buf))
          {
            uint64_t v10 = *(const void **)buf;
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (v10 && CFGetTypeID(v10) == TypeID)
            {
              CFArrayAppendValue(Mutable, *(const void **)buf);
            }
            else
            {
              uint64_t v12 = assertions_log;
              if (assertions_log)
              {
                if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)uint64_t v33 = 67109120;
                  int v34 = (int)v8;
                  _os_log_error_impl(&dword_18B46C000, v12, OS_LOG_TYPE_ERROR, "Not a dictianary for 0x%x", v33, 8u);
                }
              }
              else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                processCurrentActiveAssertions_cold_5(v31, (int)v8, v32);
              }
            }
          }
          ++v8;
        }
        while (v8 != (char *)128);
        uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v5, "assertionUpdateActives", v13);
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v5);
        if (v13) {
          xpc_release(v13);
        }
        xpc_release(v5);
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
      else
      {
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v5);
        xpc_release(v5);
      }
    }
    else if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        processAssertionUpdateActivity_cold_4();
      }
    }
    else
    {
      BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v22) {
        processAssertionUpdateActivity_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      processCurrentActiveAssertions_cold_2();
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v14) {
      processCurrentActiveAssertions_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

CFComparisonResult compare_assertion(const __CFDictionary *a1, const __CFDictionary *a2)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"TimeoutTimeStamp");
  CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(a2, @"TimeoutTimeStamp");

  return CFNumberCompare(Value, v4, 0);
}

void __insertIntoTimedList_block_invoke_2()
{
  gAssertionTimer = 0;
}

uint64_t IOPMGetCurrentAsyncActiveAssertions()
{
  if (!gAssertionsDict) {
    return 0;
  }
  if (CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) <= 0) {
    return 0;
  }
  return gActiveAssertionsDict;
}

uint64_t IOPMGetCurrentAsyncReleasedAssertions()
{
  uint64_t result = gReleasedAssertionsList;
  if (gReleasedAssertionsList)
  {
    if (CFArrayGetCount((CFArrayRef)gReleasedAssertionsList) <= 0) {
      return 0;
    }
    else {
      return gReleasedAssertionsList;
    }
  }
  return result;
}

uint64_t IOPMGetCurrentAsyncInactiveAssertions()
{
  uint64_t result = gInactiveAssertionsDict;
  if (gInactiveAssertionsDict)
  {
    if (CFDictionaryGetCount((CFDictionaryRef)gInactiveAssertionsDict) <= 0) {
      return 0;
    }
    else {
      return gInactiveAssertionsDict;
    }
  }
  return result;
}

uint64_t IOPMGetCurrentAsyncTimedAssertions()
{
  uint64_t result = gTimedAssertionsList;
  if (gTimedAssertionsList)
  {
    if (CFArrayGetCount((CFArrayRef)gTimedAssertionsList) <= 0) {
      return 0;
    }
    else {
      return gTimedAssertionsList;
    }
  }
  return result;
}

const void *IOPMGetCurrentAsycnRemoteAssertion()
{
  if (!gCurrentAssertion) {
    return 0;
  }
  uint64_t result = CFDictionaryGetValue((CFDictionaryRef)gAssertionsDict, (const void *)(((unint64_t)gCurrentAssertion >> 16) & 0x7FFF));
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t IOPMCopyActiveAsyncAssertionsByProcess()
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", MEMORY[0x1E4F14428], 0);
  if (!mach_service)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        IOPMCopyActiveAsyncAssertionsByProcess_cold_2();
      }
    }
    else
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v9) {
        IOPSGaugingMitigationGetState_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    return 0;
  }
  uint64_t v1 = mach_service;
  uint64_t PMQueue = getPMQueue();
  xpc_connection_set_target_queue(v1, PMQueue);
  xpc_connection_set_event_handler(v1, &__block_literal_global_165);
  xpc_connection_resume(v1);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        IOPMCopyActiveAsyncAssertionsByProcess_cold_4();
      }
    }
    else
    {
      BOOL v25 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v25) {
        IOPMCopyActiveAsyncAssertionsByProcess_cold_3(v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    return 0;
  }
  CFNumberRef v4 = v3;
  xpc_dictionary_set_BOOL(v3, "assertionActiveAsyncByProcess", 1);
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v1, v4);
  if (MEMORY[0x18C131C50]() != MEMORY[0x1E4F14590])
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        IOPMCopyActiveAsyncAssertionsByProcess_cold_8();
      }
    }
    else
    {
      BOOL v17 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v17) {
        IOPMCopyActiveAsyncAssertionsByProcess_cold_7(v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
LABEL_32:
    uint64_t v6 = 0;
    goto LABEL_33;
  }
  if (!xpc_dictionary_get_value(v5, "assertionActiveAsyncByProcess"))
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
        IOPMCopyActiveAsyncAssertionsByProcess_cold_6();
      }
    }
    else
    {
      BOOL v33 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v33) {
        IOPMCopyActiveAsyncAssertionsByProcess_cold_5(v33, v34, v35, v36, v37, v38, v39, v40);
      }
    }
    goto LABEL_32;
  }
  uint64_t v6 = _CFXPCCreateCFObjectFromXPCObject();
  uint64_t v7 = assertions_log;
  if (assertions_log)
  {
    if (!os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    int v42 = 138412290;
    uint64_t v43 = v6;
    CFStringRef v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    int v42 = 138412290;
    uint64_t v43 = v6;
    CFStringRef v8 = MEMORY[0x1E4F14500];
  }
  _os_log_impl(&dword_18B46C000, v8, OS_LOG_TYPE_DEFAULT, "Received active assertions from powerd %@", (uint8_t *)&v42, 0xCu);
LABEL_33:
  xpc_release(v4);
  if (v5) {
    xpc_release(v5);
  }
  return v6;
}

IOReturn IOPMAssertionCreate(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, IOPMAssertionID *AssertionID)
{
  return IOPMAssertionCreateWithName(AssertionType, AssertionLevel, @"Nameless (via IOPMAssertionCreate)", AssertionID);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  IOReturn result = -536870206;
  if (AssertionType && Name && AssertionID)
  {
    AssertionDescription = createAssertionDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, Timeout);
    if (AssertionDescription)
    {
      uint64_t v12 = AssertionDescription;
      IOReturn v13 = IOPMAssertionCreateWithProperties(AssertionDescription, AssertionID);
      CFRelease(v12);
      return v13;
    }
    else
    {
      return -536870212;
    }
  }
  return result;
}

__CFDictionary *createAssertionDescription(const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, double a7)
{
  double valuePtr = a7;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v15 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, @"AssertName", a2);
    CFDictionarySetValue(v15, @"AssertType", a1);
    if (a3) {
      CFDictionarySetValue(v15, @"Details", a3);
    }
    if (a4) {
      CFDictionarySetValue(v15, @"HumanReadableReason", a4);
    }
    if (a5) {
      CFDictionarySetValue(v15, @"BundlePath", a5);
    }
    if (a7 != 0.0)
    {
      CFNumberRef v16 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
      CFDictionarySetValue(v15, @"TimeoutSeconds", v16);
      CFRelease(v16);
    }
    if (a6) {
      CFDictionarySetValue(v15, @"TimeoutAction", a6);
    }
  }
  return v15;
}

uint64_t IOPMAssertionCreateWithAutoTimeout(const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, IOPMAssertionID *a7, double a8)
{
  uint64_t result = 3758097090;
  if (a1 && a2 && a7)
  {
    AssertionDescription = createAssertionDescription(a1, a2, a3, a4, a5, a6, a8);
    if (AssertionDescription)
    {
      CFDictionaryRef v12 = AssertionDescription;
      CFDictionarySetValue(AssertionDescription, @"AutoTimesout", (const void *)*MEMORY[0x1E4F1CFD0]);
      uint64_t v13 = IOPMAssertionCreateWithProperties(v12, a7);
      CFRelease(v12);
      return v13;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t IOPMAssertionCreateWithResourceList(const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7, IOPMAssertionID *a8, double a9)
{
  uint64_t v9 = 3758097090;
  if (a1)
  {
    if (a2)
    {
      if (a8)
      {
        CFTypeID TypeID = CFArrayGetTypeID();
        if (a7)
        {
          if (CFGetTypeID(a7) == TypeID)
          {
            AssertionDescription = createAssertionDescription(a1, a2, a3, a4, a5, a6, a9);
            if (AssertionDescription)
            {
              CFDictionaryRef v21 = AssertionDescription;
              CFDictionarySetValue(AssertionDescription, @"ResourcesUsed", a7);
              uint64_t v22 = IOPMAssertionCreateWithProperties(v21, a8);
              CFRelease(v21);
              return v22;
            }
            return 3758097084;
          }
        }
      }
    }
  }
  return v9;
}

uint64_t __IOPMAssertionCreateWithProperties_block_invoke()
{
  IOPMAssertionID AssertionID = 0;
  return IOPMAssertionCreateWithProperties((CFDictionaryRef)IOPMAssertionCreateWithProperties_resyncCopy, &AssertionID);
}

void saveBackTrace(__CFDictionary *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, sizeof(v9));
  int v2 = backtrace((void **)v9, 8);
  xpc_object_t v3 = backtrace_symbols((void *const *)v9, v2);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, v2, MEMORY[0x1E4F1D510]);
  xpc_object_t v5 = Mutable;
  if (v3 && Mutable)
  {
    if (v2 >= 1)
    {
      for (CFIndex i = 0; i != v2; ++i)
      {
        CFStringRef v7 = CFStringCreateWithCString(0, v3[i], 0);
        if (v7)
        {
          CFStringRef v8 = v7;
          CFArrayInsertValueAtIndex(v5, i, v7);
          CFRelease(v8);
        }
        else
        {
          CFArrayInsertValueAtIndex(v5, i, @" ");
        }
      }
    }
    CFDictionarySetValue(a1, @"CreatorBacktrace", v5);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    free(v3);
  }
}

uint64_t IOPMPerformBlockWithAssertion(CFDictionaryRef AssertionProperties, uint64_t a2)
{
  IOPMAssertionID AssertionID = 0;
  uint64_t result = 3758097090;
  if (AssertionProperties)
  {
    if (a2)
    {
      uint64_t result = IOPMAssertionCreateWithProperties(AssertionProperties, &AssertionID);
      if (!result)
      {
        (*(void (**)(uint64_t))(a2 + 16))(a2);
        uint64_t result = AssertionID;
        if (AssertionID)
        {
          IOPMAssertionRelease(AssertionID);
          return 0;
        }
      }
    }
  }
  return result;
}

void IOPMAssertionRetain(IOPMAssertionID theAssertion)
{
  int v13 = -536870212;
  int v12 = 0;
  uint64_t v11 = 0;
  int v10 = 0;
  if (theAssertion)
  {
    if (pm_connect_init(&v12)) {
      goto LABEL_3;
    }
    if (theAssertion >= 0x10000 && gAssertionsDict)
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          IOPMAssertionRetain_cold_2();
        }
      }
      else
      {
        BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v2) {
          IOPMAssertionRetain_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
        }
      }
      goto LABEL_3;
    }
    if (io_pm_assertion_retain_release(v12, theAssertion, 1, &v10, (_DWORD *)&v11 + 1, &v11, &v13))
    {
LABEL_3:
      int v13 = -536870199;
      goto LABEL_5;
    }
    entr_act_modify();
  }
  else
  {
    int v13 = -536870206;
  }
LABEL_5:
  if (v12) {
    _pm_disconnect();
  }
}

uint64_t IOPMAssertionSetProcessState(int a1, unsigned int a2)
{
  uint64_t v4 = 3758097084;
  global_queue = dispatch_get_global_queue(0, 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", global_queue, 0);
  if (mach_service)
  {
    uint64_t v7 = mach_service;
    xpc_connection_set_target_queue(mach_service, global_queue);
    xpc_connection_set_event_handler(v7, &__block_literal_global_187);
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      uint64_t v9 = v8;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        IOPMAssertionSetProcessState_cold_2();
      }
      xpc_dictionary_set_uint64(v9, "pid", a1);
      xpc_dictionary_set_uint64(v9, "assertionSetState", a2);
      xpc_connection_resume(v7);
      xpc_connection_send_message(v7, v9);
      xpc_release(v9);
      xpc_release(v7);
      return 0;
    }
    else
    {
      xpc_release(v7);
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v10) {
        sendAsyncReleaseMsg_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  return v4;
}

uint64_t IOPMAssertionSetTimeout(IOPMAssertionID a1, double a2)
{
  int valuePtr = (int)a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (!v3) {
    return 3758097084;
  }
  CFNumberRef v4 = v3;
  uint64_t v5 = IOPMAssertionSetProperty(a1, @"TimeoutSeconds", v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOPMAssertionDeclareNotificationEvent(const __CFString *a1, IOPMAssertionID *a2, CFTimeInterval a3)
{
  uint64_t v6 = 3758097097;
  IOPMAssertionID AssertionID = 0;
  io_registry_entry_t PMRootDomainRef = getPMRootDomainRef();
  if (!PMRootDomainRef) {
    return v6;
  }
  io_registry_entry_t v8 = PMRootDomainRef;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(PMRootDomainRef, @"DesktopMode", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFTypeRef v11 = IORegistryEntryCreateCFProperty(v8, @"AppleClamshellState", v9, 0);
  uint64_t v12 = v11;
  if ((CFTypeRef)*MEMORY[0x1E4F1CFD0] != v11 || *MEMORY[0x1E4F1CFC8] != (void)CFProperty)
  {
    uint64_t v6 = IOPMAssertionCreateWithDescription(@"DisplayWake", a1, 0, 0, 0, a3, @"TimeoutActionRelease", &AssertionID);
    if (a2) {
      *a2 = AssertionID;
    }
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v6 = 3758097112;
  if (v11) {
LABEL_9:
  }
    CFRelease(v12);
LABEL_10:
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v6;
}

uint64_t IOPMAssertionDeclareSystemActivity(const void *a1, int *a2, int *a3)
{
  uint64_t v3 = 3758097090;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(Mutable, @"AssertName", a1);
        uint64_t v3 = IOPMAssertionDeclareSystemActivityWithProperties(Mutable, a2, a3);
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
    }
  }
  return v3;
}

IOReturn IOPMAssertionDeclareUserActivity(CFStringRef AssertionName, IOPMUserActiveType userType, IOPMAssertionID *AssertionID)
{
  mach_port_t v14 = 0;
  IOReturn v15 = -536870212;
  int v13 = 0;
  if (!AssertionName || !AssertionID)
  {
    IOReturn v15 = -536870206;
    goto LABEL_6;
  }
  if (pm_connect_init(&v14))
  {
    IOReturn v15 = -536870199;
    goto LABEL_6;
  }
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"AssertName", AssertionName);
  if (collectBackTrace) {
    saveBackTrace(Mutable);
  }
  CFDataRef Data = CFPropertyListCreateData(0, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Data)
  {
    IOReturn v15 = -536870206;
    if (!Mutable) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
  CFDataRef v9 = Data;
  mach_port_t v10 = v14;
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(v9);
  if (io_pm_declare_user_active(v10, userType, (uint64_t)BytePtr, Length, (int *)AssertionID, &v13, &v15)) {
    IOReturn v15 = -536870199;
  }
  CFRelease(v9);
  if (Mutable) {
LABEL_17:
  }
    CFRelease(Mutable);
LABEL_6:
  if (v14) {
    _pm_disconnect();
  }
  return v15;
}

IOReturn IOPMDeclareNetworkClientActivity(CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  mach_port_t v12 = 0;
  IOReturn v13 = -536870212;
  int v11 = 0;
  if (!AssertionName || !AssertionID)
  {
    IOReturn v13 = -536870206;
    goto LABEL_6;
  }
  if (pm_connect_init(&v12))
  {
    IOReturn v13 = -536870199;
    goto LABEL_6;
  }
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"AssertName", AssertionName);
  if (collectBackTrace) {
    saveBackTrace(Mutable);
  }
  CFDataRef Data = CFPropertyListCreateData(0, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Data)
  {
    IOReturn v13 = -536870206;
    if (!Mutable) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
  CFDataRef v7 = Data;
  mach_port_t v8 = v12;
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(v7);
  if (io_pm_declare_network_client_active(v8, (uint64_t)BytePtr, Length, (int *)AssertionID, &v11, &v13)) {
    IOReturn v13 = -536870199;
  }
  CFRelease(v7);
  if (Mutable) {
LABEL_17:
  }
    CFRelease(Mutable);
LABEL_6:
  if (v12) {
    _pm_disconnect();
  }
  return v13;
}

uint64_t IOPMSetReservePowerMode(int a1)
{
  uint64_t v4 = 0;
  uint64_t result = _pm_connect((_DWORD *)&v4 + 1);
  if (!result)
  {
    if (HIDWORD(v4))
    {
      unsigned int v3 = io_pm_set_value_int(SHIDWORD(v4), 9, a1, &v4);
      _pm_disconnect();
      if (v4) {
        return v4;
      }
      else {
        return v3;
      }
    }
    else
    {
      return 3758097112;
    }
  }
  return result;
}

uint64_t IOPMCopyAssertionsByProcessWithAllocator(CFDictionaryRef *a1, const __CFAllocator *a2)
{
  return _copyAssertionsByProcess(2u, a1, a2);
}

uint64_t _copyAssertionsByProcess(unsigned int a1, CFDictionaryRef *a2, const __CFAllocator *a3)
{
  uint64_t v3 = 3758097090;
  CFTypeRef cf = 0;
  if (a2 && (a1 == 7 || a1 == 2))
  {
    uint64_t v3 = _copyPMServerObject(a1, 0, 0, &cf);
    CFTypeRef v6 = cf;
    if (v3)
    {
      if (cf) {
LABEL_6:
      }
        CFRelease(v6);
    }
    else
    {
      if (!cf) {
        return 0;
      }
      int Count = CFArrayGetCount((CFArrayRef)cf);
      int v8 = Count;
      if (!Count)
      {
        uint64_t v3 = 0;
        goto LABEL_6;
      }
      CFDataRef v9 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      mach_port_t v10 = (const void **)malloc_type_malloc(8 * v8, 0x6004044C4A2DFuLL);
      int v11 = v10;
      if (v9 && v10)
      {
        if (v8 >= 1)
        {
          for (CFIndex i = 0; i != v8; ++i)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v6, i);
            if (ValueAtIndex)
            {
              CFDictionaryRef v14 = ValueAtIndex;
              v9[i] = CFDictionaryGetValue(ValueAtIndex, @"AssertPID");
              v11[i] = CFDictionaryGetValue(v14, @"PerTaskAssertions");
            }
          }
        }
        *a2 = CFDictionaryCreate(a3, v9, v11, v8, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      if (v9) {
        free(v9);
      }
      if (v11) {
        free(v11);
      }
      uint64_t v3 = 0;
      if (v6) {
        goto LABEL_6;
      }
    }
  }
  return v3;
}

IOReturn IOPMCopyAssertionsByProcess(CFDictionaryRef *AssertionsByPID)
{
  return _copyAssertionsByProcess(2u, AssertionsByPID, (const __CFAllocator *)*MEMORY[0x1E4F1CF80]);
}

uint64_t IOPMCopyAssertionsByType(const __CFData *a1, CFPropertyListRef *a2)
{
  if (a2) {
    return _copyPMServerObject(6u, 0, a1, a2);
  }
  else {
    return 3758097090;
  }
}

uint64_t _copyPMServerObject(unsigned int a1, unsigned int a2, const __CFData *a3, CFPropertyListRef *a4)
{
  mach_port_t v16 = 0;
  memset(length, 0, sizeof(length));
  *a4 = 0;
  int v17 = pm_connect_init(&v16);
  if (v17) {
    return 3758097136;
  }
  if (a3 && (CFDataRef Data = CFPropertyListCreateData(0, a3, kCFPropertyListBinaryFormat_v1_0, 0, 0), (a3 = Data) != 0))
  {
    BytePtr = CFDataGetBytePtr(Data);
    int v11 = CFDataGetLength(a3);
  }
  else
  {
    BytePtr = 0;
    int v11 = 0;
  }
  int v12 = io_pm_assertion_copy_details(v16, a2, a1, (uint64_t)BytePtr, v11, &length[1], length, &v17);
  if (!(v12 | v17))
  {
    CFDataRef v13 = CFDataCreate(0, *(const UInt8 **)&length[1], length[0]);
    if (v13)
    {
      CFDataRef v14 = v13;
      *a4 = CFPropertyListCreateWithData(0, v13, 0, 0, 0);
      CFRelease(v14);
    }
    if (*(void *)&length[1] && length[0]) {
      mach_vm_deallocate(*MEMORY[0x1E4F14960], *(mach_vm_address_t *)&length[1], length[0]);
    }
  }
  if (a3) {
    CFRelease(a3);
  }
  uint64_t result = v16;
  if (v16)
  {
    _pm_disconnect();
    return 0;
  }
  return result;
}

uint64_t IOPMCopyInactiveAssertionsByProcess(CFDictionaryRef *a1)
{
  return _copyAssertionsByProcess(7u, a1, (const __CFAllocator *)*MEMORY[0x1E4F1CF80]);
}

CFDictionaryRef IOPMAssertionCopyProperties(IOPMAssertionID theAssertion)
{
  CFDictionaryRef v2 = 0;
  _copyPMServerObject(1u, theAssertion, 0, (CFPropertyListRef *)&v2);
  return v2;
}

IOReturn IOPMCopyAssertionsStatus(CFDictionaryRef *AssertionsStatus)
{
  if (AssertionsStatus) {
    return _copyPMServerObject(3u, 0, 0, (CFPropertyListRef *)AssertionsStatus);
  }
  else {
    return -536870206;
  }
}

uint64_t IOPMCopyDeviceRestartPreventers(__CFArray **a1)
{
  uint64_t v2 = 0;
  CFMutableArrayRef Mutable = 0;
  char v4 = 1;
  uint64_t v5 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  while (1)
  {
    char v6 = v4;
    CFArrayRef theArray = 0;
    uint64_t result = _copyPMServerObject(6u, 0, (const __CFData *)off_1E548B2E0[v2], (CFPropertyListRef *)&theArray);
    if (result) {
      break;
    }
    CFArrayRef v8 = theArray;
    if (theArray)
    {
      if (CFArrayGetCount(theArray) >= 1)
      {
        for (CFIndex i = 0; i < CFArrayGetCount(v8); ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, i);
          CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, @"AllowsDeviceRestart");
          if (!Value || !CFBooleanGetValue(Value))
          {
            if (!Mutable)
            {
              CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, v5);
              if (!Mutable)
              {
                CFRelease(v8);
                goto LABEL_16;
              }
            }
            CFArrayAppendValue(Mutable, ValueAtIndex);
          }
        }
      }
      CFRelease(v8);
    }
    char v4 = 0;
    uint64_t v2 = 1;
    if ((v6 & 1) == 0)
    {
LABEL_16:
      uint64_t result = 0;
      break;
    }
  }
  *a1 = Mutable;
  return result;
}

uint64_t IOPMCopyAssertionActivityLogWithAllocator(CFPropertyListRef *a1, BOOL *a2, const __CFAllocator *a3)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator(a1, a2, &IOPMCopyAssertionActivityLogWithAllocator_refCnt, a3);
}

uint64_t IOPMCopyAssertionActivityUpdateWithAllocator(CFPropertyListRef *a1, BOOL *a2, _DWORD *a3, const __CFAllocator *a4)
{
  unsigned int v15 = -536870199;
  int v16 = 0;
  CFIndex length = 0;
  bytes = 0;
  *a1 = 0;
  _pm_connect((_DWORD *)&length + 1);
  uint64_t result = HIDWORD(length);
  if (HIDWORD(length))
  {
    if (io_pm_assertion_activity_log(SHIDWORD(length), &bytes, &length, a3, &v16, &v15)) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v15 == 0;
    }
    if (v9 && length != 0)
    {
      CFDataRef v11 = CFDataCreateWithBytesNoCopy(0, bytes, length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
      if (v11)
      {
        CFDataRef v12 = v11;
        *a1 = CFPropertyListCreateWithData(a4, v11, 1uLL, 0, 0);
        CFRelease(v12);
      }
      if (a2) {
        *a2 = v16 != 0;
      }
    }
    if (bytes && length) {
      mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)bytes, length);
    }
    if (HIDWORD(length)) {
      _pm_disconnect();
    }
    return v15;
  }
  return result;
}

uint64_t IOPMCopyAssertionActivityLog(CFPropertyListRef *a1, BOOL *a2)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator(a1, a2, &IOPMCopyAssertionActivityLog_refCnt, (const __CFAllocator *)*MEMORY[0x1E4F1CF80]);
}

uint64_t IOPMCopyAssertionActivityUpdate(CFPropertyListRef *a1, BOOL *a2, _DWORD *a3)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator(a1, a2, a3, (const __CFAllocator *)*MEMORY[0x1E4F1CF80]);
}

uint64_t IOPMCopyAssertionActivityUpdateWithCallback(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 3758097084;
  uint64_t result = 3758097090;
  if (a1 && a2 && a3)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", MEMORY[0x1E4F14428], 0);
    if (mach_service)
    {
      BOOL v9 = mach_service;
      uint64_t PMQueue = getPMQueue();
      xpc_connection_set_target_queue(v9, PMQueue);
      xpc_connection_set_event_handler(v9, &__block_literal_global_201);
      xpc_connection_resume(v9);
      xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
      if (v11)
      {
        CFDataRef v12 = v11;
        xpc_dictionary_set_BOOL(v11, "assertionCopyActivityUpdate", 1);
        xpc_dictionary_set_uint64(v12, "assertionActivityUpdateRefCnt", *a1);
        CFDataRef v13 = getPMQueue();
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 0x40000000;
        v30[2] = __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204;
        v30[3] = &unk_1E548B340;
        v30[4] = a3;
        v30[5] = a1;
        v30[6] = a2;
        v30[7] = v9;
        xpc_connection_send_message_with_reply(v9, v12, v13, v30);
        xpc_release(v12);
        uint64_t v4 = 0;
      }
      else if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          IOPMCopyActiveAsyncAssertionsByProcess_cold_4();
        }
      }
      else
      {
        BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v22) {
          IOPMCopyActiveAsyncAssertionsByProcess_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
        }
      }
      xpc_release(v9);
      return v4;
    }
    else
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
          IOPMCopyAssertionActivityUpdateWithCallback_cold_2();
        }
      }
      else
      {
        BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v14) {
          IOPSGaugingMitigationGetState_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }
      return 3758097084;
    }
  }
  return result;
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204(uint64_t a1, void *a2)
{
  if (MEMORY[0x18C131C50](a2) == MEMORY[0x1E4F14590])
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "assertionActivityUpdateData");
    int uint64 = xpc_dictionary_get_uint64(a2, "assertionActivityUpdateRefCnt");
    BOOL v6 = xpc_dictionary_get_BOOL(a2, "assertionActivityUpdateOverflow");
    xpc_object_t v7 = xpc_dictionary_get_value(a2, "assertionActivityUpdateProcessList");
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG))
      {
        __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_4();
        if (!value)
        {
LABEL_16:
          if (assertions_log)
          {
            if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG)) {
              __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_2();
            }
          }
          else
          {
            BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
            if (v18) {
              __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
            }
          }
          uint64_t v16 = 0;
          if (!v7) {
            goto LABEL_22;
          }
          goto LABEL_14;
        }
LABEL_13:
        uint64_t v16 = _CFXPCCreateCFObjectFromXPCObject();
        if (!v7)
        {
LABEL_22:
          uint64_t v17 = 0;
          goto LABEL_23;
        }
LABEL_14:
        uint64_t v17 = _CFXPCCreateCFObjectFromXPCObject();
LABEL_23:
        uint64_t v26 = *(NSObject **)(a1 + 48);
        **(_DWORD **)(a1 + 40) = uint64;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 0x40000000;
        v27[2] = __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_207;
        v27[3] = &unk_1E548B318;
        v27[4] = *(void *)(a1 + 32);
        v27[5] = v16;
        BOOL v28 = v6;
        v27[6] = v17;
        dispatch_async(v26, v27);
        goto LABEL_24;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_3();
      if (!value) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    if (!value) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR)) {
      __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_6();
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v8) {
      __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_5(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
LABEL_24:
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_207(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v2 = (const void *)a1[5];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t IOPMSetAssertionActivityLog(int a1)
{
  uint64_t v4 = 0;
  uint64_t v2 = _pm_connect((_DWORD *)&v4 + 1);
  if (!v2)
  {
    if (HIDWORD(v4))
    {
      uint64_t v2 = io_pm_set_value_int(SHIDWORD(v4), 7, a1, &v4);
      _pm_disconnect();
    }
    else
    {
      return 3758097112;
    }
  }
  return v2;
}

uint64_t IOPMSetAssertionActivityAggregate(int a1)
{
  uint64_t v4 = 0;
  uint64_t v2 = _pm_connect((_DWORD *)&v4 + 1);
  if (!v2)
  {
    if (HIDWORD(v4))
    {
      uint64_t v2 = io_pm_set_value_int(SHIDWORD(v4), 8, a1, &v4);
      _pm_disconnect();
    }
    else
    {
      return 3758097112;
    }
  }
  return v2;
}

CFPropertyListRef IOPMCopyAssertionActivityAggregateWithAllocator(const __CFAllocator *a1)
{
  int v9 = -536870199;
  int v8 = 0;
  memset(length, 0, sizeof(length));
  _pm_connect(&v8);
  if (!v8) {
    return 0;
  }
  int v2 = io_pm_assertion_activity_aggregate(v8, &length[1], length, &v9);
  if (v2 | v9
    || (CFDataRef v3 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x1E4F1CFA0])) == 0)
  {
    CFPropertyListRef v5 = 0;
  }
  else
  {
    CFDataRef v4 = v3;
    CFPropertyListRef v5 = CFPropertyListCreateWithData(a1, v3, 1uLL, 0, 0);
    CFRelease(v4);
  }
  if (*(void *)&length[1] && length[0]) {
    mach_vm_deallocate(*MEMORY[0x1E4F14960], *(mach_vm_address_t *)&length[1], length[0]);
  }
  if (v8) {
    _pm_disconnect();
  }
  return v5;
}

CFPropertyListRef IOPMCopyAssertionActivityAggregate()
{
  return IOPMCopyAssertionActivityAggregateWithAllocator((const __CFAllocator *)*MEMORY[0x1E4F1CF80]);
}

uint64_t IOPMAssertionSetBTCollection(unsigned int a1)
{
  int out_token = 0;
  notify_register_check("com.apple.powermanagement.collectbt", &out_token);
  notify_set_state(out_token, a1);
  notify_post("com.apple.powermanagement.collectbt");
  return notify_cancel(out_token);
}

uint64_t IOPMSetAssertionExceptionLimits(const void *a1)
{
  uint64_t v2 = 3758097090;
  mach_port_t v10 = 0;
  unsigned int v11 = -536870212;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    if (pm_connect_init(&v10))
    {
      unsigned int v11 = -536870199;
    }
    else
    {
      CFDataRef Data = CFPropertyListCreateData(0, a1, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      if (Data)
      {
        CFDataRef v5 = Data;
        mach_port_t v6 = v10;
        BytePtr = CFDataGetBytePtr(Data);
        int Length = CFDataGetLength(v5);
        if (io_pm_set_exception_limits(v6, (uint64_t)BytePtr, Length, (int *)&v11)) {
          unsigned int v11 = -536870199;
        }
        CFRelease(v5);
      }
      else
      {
        unsigned int v11 = -536870206;
      }
    }
    if (v10) {
      _pm_disconnect();
    }
    return v11;
  }
  return v2;
}

void *IOPMScheduleAssertionExceptionNotification(NSObject *a1, uint64_t a2)
{
  CFDataRef v4 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (v4)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = __IOPMScheduleAssertionExceptionNotification_block_invoke;
    handler[3] = &unk_1E548B368;
    handler[4] = a2;
    if (notify_register_dispatch("com.apple.powermanagement.assertionexception", (int *)v4, a1, handler))
    {
      free(v4);
      return 0;
    }
  }
  return v4;
}

uint64_t __IOPMScheduleAssertionExceptionNotification_block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  if (!result) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

void IOPMUnregisterExceptionNotification(int *a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (v2) {
      notify_cancel(v2);
    }
    *a1 = 0;
    free(a1);
  }
}

uint64_t __pm_connect_init_block_invoke(int a1, int token)
{
  return notify_get_state(token, (uint64_t *)&collectBackTrace);
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xEu);
}

void OUTLINED_FUNCTION_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t __IOHIDPlugInInstanceRetain(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t __IOHIDPlugInInstanceRelease(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
}

__CFArray *__IOHIDPlugInLoadBundles(const __CFArray *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (CFArrayGetCount(a1) >= 1)
  {
    CFIndex v4 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%@%@", &stru_1ED870660, ValueAtIndex);
      CFURLRef v7 = CFURLCreateWithFileSystemPath(v2, v6, kCFURLPOSIXPathStyle, 1u);
      CFArrayRef BundlesFromDirectory = CFBundleCreateBundlesFromDirectory(v2, v7, @"plugin");
      if (BundlesFromDirectory)
      {
        CFArrayRef v9 = BundlesFromDirectory;
        uint64_t v10 = _IOHIDLogCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          CFIndex Count = CFArrayGetCount(v9);
          *(_DWORD *)buf = 134218498;
          CFIndex v14 = Count;
          __int16 v15 = 2112;
          CFStringRef v16 = v6;
          __int16 v17 = 2112;
          CFArrayRef v18 = v9;
          _os_log_impl(&dword_18B46C000, v10, OS_LOG_TYPE_DEFAULT, "Loaded %ld HID plugins (%@) %@", buf, 0x20u);
        }
        v20.CFIndex length = CFArrayGetCount(v9);
        v20.location = 0;
        CFArrayAppendArray(Mutable, v9, v20);
        CFRelease(v9);
      }
      CFRelease(v6);
      CFRelease(v7);
      ++v4;
    }
    while (v4 < CFArrayGetCount(a1));
  }
  CFRelease(&stru_1ED870660);
  return Mutable;
}

uint64_t _IOHIDLoadSessionFilterBundles()
{
  if (_IOHIDLoadSessionFilterBundles_onceToken != -1) {
    dispatch_once(&_IOHIDLoadSessionFilterBundles_onceToken, &__block_literal_global_13);
  }
  return __hidSessionFilterBundles;
}

uint64_t _IOHIDLoadServicePluginBundles()
{
  if (_IOHIDLoadServicePluginBundles_onceToken != -1) {
    dispatch_once(&_IOHIDLoadServicePluginBundles_onceToken, &__block_literal_global_45);
  }
  return __hidServicePluginBundles;
}

uint64_t __IOHIDPlugInInstanceCacheApplier(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
}

void _IOHIDPlugInInstanceCacheClear()
{
  if (__hidPlugInInstanceCache)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)__hidPlugInInstanceCache, (CFDictionaryApplierFunction)__IOHIDPlugInInstanceCacheApplier, 0);
    uint64_t v0 = (__CFDictionary *)__hidPlugInInstanceCache;
    CFDictionaryRemoveAllValues(v0);
  }
}

BOOL _IOHIDPlugInInstanceCacheIsEmpty()
{
  return !__hidPlugInInstanceCache || CFDictionaryGetCount((CFDictionaryRef)__hidPlugInInstanceCache) == 0;
}

uint64_t IODPControllerGetTypeID()
{
  uint64_t result = __kIODPControllerTypeID;
  if (!__kIODPControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_0, (void (*)(void))__IODPControllerRegister);
    return __kIODPControllerTypeID;
  }
  return result;
}

uint64_t __IODPControllerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIODPControllerCFTypeID TypeID = result;
  return result;
}

uint64_t IODPControllerCreate(uint64_t a1)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPController", (uint64_t (*)(void, uint64_t))IODPControllerCreateWithService, 0, 0, -1);
  }
  else {
    return 0;
  }
}

uint64_t IODPControllerCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPController", (uint64_t (*)(void, uint64_t))IODPControllerCreateWithService, 0, a2, -1);
  }
  else {
    return 0;
  }
}

uint64_t IODPControllerCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IODPController")) {
    return 0;
  }
  if (!__kIODPControllerTypeID) {
    pthread_once(&__controllerTypeInit_0, (void (*)(void))__IODPControllerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v5 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*(_DWORD *)(v5 + 16), *MEMORY[0x1E4F14960], 0x44504354u, (io_connect_t *)(v5 + 20)))
    {
      CFStringRef v6 = IOAVControllerCreateWithService(a1, a2);
      *(void *)(v5 + 24) = v6;
      if (v6)
      {
        int valuePtr = 0;
        CFTypeRef v7 = IOAVControllerCopyProperty((uint64_t)v6, @"Location");
        if (v7)
        {
          int v8 = v7;
          if (CFEqual(v7, @"Embedded")) {
            *(_DWORD *)(v5 + 32) = 1;
          }
          CFRelease(v8);
        }
        CFNumberRef v9 = (const __CFNumber *)IOAVControllerCopyProperty(*(void *)(v5 + 24), @"MinLaneCount");
        if (v9)
        {
          CFNumberRef v10 = v9;
          CFTypeID TypeID = CFNumberGetTypeID();
          if (TypeID == CFGetTypeID(v10)) {
            CFNumberGetValue(v10, kCFNumberIntType, (void *)(v5 + 40));
          }
          CFRelease(v10);
        }
        CFNumberRef v12 = (const __CFNumber *)IOAVControllerCopyProperty(*(void *)(v5 + 24), @"MaxLaneCount");
        if (v12)
        {
          CFNumberRef v13 = v12;
          CFTypeID v14 = CFNumberGetTypeID();
          if (v14 == CFGetTypeID(v13)) {
            CFNumberGetValue(v13, kCFNumberIntType, (void *)(v5 + 44));
          }
          CFRelease(v13);
        }
        CFNumberRef v15 = (const __CFNumber *)IOAVControllerCopyProperty(*(void *)(v5 + 24), @"MinLinkRate");
        if (v15)
        {
          CFNumberRef v16 = v15;
          CFTypeID v17 = CFNumberGetTypeID();
          if (v17 == CFGetTypeID(v16))
          {
            CFNumberGetValue(v16, kCFNumberIntType, &valuePtr);
            *(unsigned char *)(v5 + 36) = valuePtr;
          }
          CFRelease(v16);
        }
        CFNumberRef v18 = (const __CFNumber *)IOAVControllerCopyProperty(*(void *)(v5 + 24), @"MaxLinkRate");
        if (v18)
        {
          CFNumberRef v19 = v18;
          CFTypeID v20 = CFNumberGetTypeID();
          if (v20 == CFGetTypeID(v19))
          {
            CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
            *(unsigned char *)(v5 + 37) = valuePtr;
          }
          CFRelease(v19);
        }
      }
      return v5;
    }
    CFRelease((CFTypeRef)v5);
    return 0;
  }
  return v5;
}

uint64_t IODPControllerGetAVController(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IODPControllerSetScramblingInhibited(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetSupportsEnhancedMode(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 1u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetSupportsDownspread(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetLaneCount(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerGetMinLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t IODPControllerSetMinLaneCount(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  uint64_t result = IOConnectCallMethod(v4, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (!result) {
    *(_DWORD *)(a1 + 40) = a2;
  }
  return result;
}

uint64_t IODPControllerGetMaxLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t IODPControllerSetMaxLaneCount(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  uint64_t result = IOConnectCallMethod(v4, 5u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (!result) {
    *(_DWORD *)(a1 + 44) = a2;
  }
  return result;
}

uint64_t IODPControllerSetLinkRate(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 6u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerGetMinLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 36);
}

uint64_t IODPControllerSetMinLinkRate(uint64_t a1, unsigned int a2)
{
  char v2 = a2;
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  uint64_t result = IOConnectCallMethod(v4, 7u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (!result) {
    *(unsigned char *)(a1 + 36) = v2;
  }
  return result;
}

uint64_t IODPControllerGetMaxLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 37);
}

uint64_t IODPControllerSetMaxLinkRate(uint64_t a1, unsigned int a2)
{
  char v2 = a2;
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  uint64_t result = IOConnectCallMethod(v4, 8u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (!result) {
    *(unsigned char *)(a1 + 37) = v2;
  }
  return result;
}

uint64_t IODPControllerSetDriveSettings(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  input[3] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, input, 3u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetQualityPattern(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 9u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetSecureAuxFilter(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xBu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t __IODPControllerFree(uint64_t a1)
{
  mach_port_t v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  io_connect_t v3 = *(_DWORD *)(a1 + 20);
  if (v3) {
    IOServiceClose(v3);
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result)
  {
    return IOObjectRelease(result);
  }
  return result;
}

uint64_t IODPDeviceGetTypeID()
{
  uint64_t result = __kIODPDeviceTypeID;
  if (!__kIODPDeviceTypeID)
  {
    pthread_once(&__deviceTypeInit_0, (void (*)(void))__IODPDeviceRegister);
    return __kIODPDeviceTypeID;
  }
  return result;
}

uint64_t __IODPDeviceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIODPDeviceCFTypeID TypeID = result;
  return result;
}

uint64_t IODPDeviceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPDevice", (uint64_t (*)(void, uint64_t))IODPDeviceCreateWithService, 0, 0, -1);
  }
  else {
    return 0;
  }
}

uint64_t IODPDeviceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPDevice", (uint64_t (*)(void, uint64_t))IODPDeviceCreateWithService, 0, a2, -1);
  }
  else {
    return 0;
  }
}

_OWORD *IODPDeviceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IODPDevice")) {
    return 0;
  }
  if (!__kIODPDeviceTypeID) {
    pthread_once(&__deviceTypeInit_0, (void (*)(void))__IODPDeviceRegister);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  uint64_t v5 = Instance;
  if (Instance)
  {
    Instance[2] = 0u;
    Instance[3] = 0u;
    Instance[1] = 0u;
    *((_DWORD *)Instance + 4) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*((_DWORD *)v5 + 4), *MEMORY[0x1E4F14960], 0x44504456u, (io_connect_t *)v5 + 5))
    {
      CFStringRef v6 = IOAVDeviceCreateWithService(a1, *((_DWORD *)v5 + 4));
      *((void *)v5 + 3) = v6;
      if (v6)
      {
        int valuePtr = 0;
        CFTypeRef v7 = IOAVDeviceCopyProperty((uint64_t)v6, @"Location");
        if (v7)
        {
          int v8 = v7;
          if (CFEqual(v7, @"Embedded")) {
            *((_DWORD *)v5 + 8) = 1;
          }
          CFRelease(v8);
        }
        CFDictionaryRef v9 = (const __CFDictionary *)IOAVDeviceCopyProperty(*((void *)v5 + 3), @"Revision");
        if (v9)
        {
          CFDictionaryRef v10 = v9;
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"Major");
          if (Value) {
            CFNumberGetValue(Value, kCFNumberIntType, (char *)v5 + 36);
          }
          CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"Minor");
          if (v12) {
            CFNumberGetValue(v12, kCFNumberIntType, (char *)v5 + 40);
          }
          CFRelease(v10);
        }
        CFNumberRef v13 = (const __CFNumber *)IOAVDeviceCopyProperty(*((void *)v5 + 3), @"MaxLaneCount");
        if (v13)
        {
          CFNumberRef v14 = v13;
          CFNumberGetValue(v13, kCFNumberIntType, (char *)v5 + 44);
          CFRelease(v14);
        }
        CFNumberRef v15 = (const __CFNumber *)IOAVDeviceCopyProperty(*((void *)v5 + 3), @"MaxLinkRate");
        if (v15)
        {
          CFNumberRef v16 = v15;
          CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
          *((unsigned char *)v5 + 48) = valuePtr;
          CFRelease(v16);
        }
        CFTypeRef v17 = IOAVDeviceCopyProperty(*((void *)v5 + 3), @"SupportsEnhancedMode");
        CFNumberRef v18 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
        if (v17)
        {
          CFNumberRef v19 = v17;
          *((unsigned char *)v5 + 49) = CFEqual(v17, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
          CFRelease(v19);
        }
        CFTypeRef v20 = IOAVDeviceCopyProperty(*((void *)v5 + 3), @"SupportsDownspread");
        if (v20)
        {
          uint64_t v21 = v20;
          *((unsigned char *)v5 + 50) = CFEqual(v20, *v18) != 0;
          CFRelease(v21);
        }
      }
      return v5;
    }
    CFRelease(v5);
    return 0;
  }
  return v5;
}

uint64_t IODPDeviceGetController(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 56);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      uint64_t result = IODPControllerCreateWithService(*MEMORY[0x1E4F1CF80], parent);
      *(void *)(a1 + 56) = result;
    }
    else
    {
      return *(void *)(a1 + 56);
    }
  }
  return result;
}

uint64_t IODPDeviceGetAVDevice(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IODPDeviceGetRevisionMajor(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

uint64_t IODPDeviceGetRevisionMinor(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t IODPDeviceGetMaxLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t IODPDeviceGetMaxLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t IODPDeviceGetSupportsEnhancedMode(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 49);
}

uint64_t IODPDeviceGetSupportsDownspread(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 50);
}

uint64_t IODPDeviceReadDPCD(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  if (a4 >= 0x1000) {
    size_t v4 = 4096;
  }
  else {
    size_t v4 = a4;
  }
  size_t v6 = v4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, input, 1u, 0, 0, 0, 0, outputStruct, &v6);
}

uint64_t IODPDeviceWriteDPCD(uint64_t a1, unsigned int a2, void *inputStruct, unsigned int a4)
{
  input[1] = *MEMORY[0x1E4F143B8];
  if (a4 >= 0x1000) {
    size_t v4 = 4096;
  }
  else {
    size_t v4 = a4;
  }
  mach_port_t v5 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v5, 1u, input, 1u, inputStruct, v4, 0, 0, 0, 0);
}

uint64_t IODPDeviceGetLinkTrainingData(uint64_t a1, void *outputStruct)
{
  size_t v3 = 116;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IODPDeviceGetSymbolErrorCount(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t output = 0;
  input[0] = a2;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 3u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (!result) {
    *a3 = output;
  }
  return result;
}

uint64_t IODPDeviceSetUpdateMode(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPDeviceSetUpdated(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 5u, input, 1u, 0, 0, 0, 0, 0, 0);
}

void __IODPDeviceFree(uint64_t a1)
{
  mach_port_t v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  io_connect_t v3 = *(_DWORD *)(a1 + 20);
  if (v3) {
    IOServiceClose(v3);
  }
  io_object_t v4 = *(_DWORD *)(a1 + 16);
  if (v4) {
    IOObjectRelease(v4);
  }
  mach_port_t v5 = *(const void **)(a1 + 56);
  if (v5)
  {
    CFRelease(v5);
  }
}

uint64_t IODPServiceGetTypeID()
{
  uint64_t result = __kIODPServiceTypeID;
  if (!__kIODPServiceTypeID)
  {
    pthread_once(&__serviceTypeInit_0, (void (*)(void))__IODPServiceRegister);
    return __kIODPServiceTypeID;
  }
  return result;
}

uint64_t __IODPServiceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIODPServiceCFTypeID TypeID = result;
  return result;
}

uint64_t IODPServiceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPService", (uint64_t (*)(void, uint64_t))IODPServiceCreateWithService, 0, 0, -1);
  }
  else {
    return 0;
  }
}

uint64_t IODPServiceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPService", (uint64_t (*)(void, uint64_t))IODPServiceCreateWithService, 0, a2, -1);
  }
  else {
    return 0;
  }
}

void *IODPServiceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IODPService")) {
    return 0;
  }
  if (!__kIODPServiceTypeID) {
    pthread_once(&__serviceTypeInit_0, (void (*)(void))__IODPServiceRegister);
  }
  uint64_t Instance = (void *)_CFRuntimeCreateInstance();
  mach_port_t v5 = Instance;
  if (Instance)
  {
    Instance[2] = 0;
    Instance[3] = 0;
    Instance[4] = 0;
    *((_DWORD *)Instance + 4) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*((_DWORD *)v5 + 4), *MEMORY[0x1E4F14960], 0x44505356u, (io_connect_t *)v5 + 5))
    {
      v5[3] = IOAVServiceCreateWithService(a1, *((_DWORD *)v5 + 4));
      return v5;
    }
    CFRelease(v5);
    return 0;
  }
  return v5;
}

_OWORD *IODPServiceGetDevice(uint64_t a1)
{
  uint64_t result = *(_OWORD **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      return *(_OWORD **)(a1 + 32);
    }
    else
    {
      uint64_t result = IODPDeviceCreateWithService(*MEMORY[0x1E4F1CF80], parent);
      *(void *)(a1 + 32) = result;
    }
  }
  return result;
}

uint64_t IODPServiceGetAVService(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t IODPServiceGetSinkCount(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IODPServiceRetrainLink(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPServiceGetSymbolErrorCount(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t output = 0;
  input[0] = a2;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (!result) {
    *a3 = output;
  }
  return result;
}

void __IODPServiceFree(uint64_t a1)
{
  mach_port_t v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  io_connect_t v3 = *(_DWORD *)(a1 + 20);
  if (v3) {
    IOServiceClose(v3);
  }
  io_object_t v4 = *(_DWORD *)(a1 + 16);
  if (v4) {
    IOObjectRelease(v4);
  }
  mach_port_t v5 = *(const void **)(a1 + 32);
  if (v5)
  {
    CFRelease(v5);
  }
}

__CFString *IODPCreateStringWithLinkTrainingData(const __CFAllocator *a1, uint64_t a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  size_t v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Link Training Data:\n\n");
    int v19 = a3;
    int v7 = a3 + 1;
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Lane Count:    %d\n", *(unsigned int *)(a2 + 8));
    uint64_t v8 = IODPLinkRateScalar(*(unsigned __int8 *)(a2 + 12));
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Link Rate:     %llu bps\n", v8);
    if (*(unsigned char *)(a2 + 1)) {
      CFDictionaryRef v9 = "YES";
    }
    else {
      CFDictionaryRef v9 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"Enhanced Mode: %s\n", v9);
    if (*(unsigned char *)(a2 + 2)) {
      CFDictionaryRef v10 = "YES";
    }
    else {
      CFDictionaryRef v10 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"Downspread:    %s\n", v10);
    if (*(unsigned char *)(a2 + 3)) {
      unsigned int v11 = "YES";
    }
    else {
      unsigned int v11 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"Fast:          %s\n", v11);
    if (*(unsigned char *)(a2 + 5)) {
      CFNumberRef v12 = "YES";
    }
    else {
      CFNumberRef v12 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"FEC:           %s\n", v12);
    if (*(unsigned char *)(a2 + 6)) {
      CFNumberRef v13 = "YES";
    }
    else {
      CFNumberRef v13 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(v6, v7, @"PSR:           %s\n", v13);
    if (*(_DWORD *)(a2 + 8))
    {
      unint64_t v14 = 0;
      int v15 = a3 + 2;
      CFNumberRef v16 = (unsigned int *)(a2 + 28);
      do
      {
        _IOAVStringAppendIndendationAndFormat(v6, v7, @"Lane %d:\n\n", v14);
        _IOAVStringAppendIndendationAndFormat(v6, v15, @"Swing Voltage: %d\n", *(v16 - 1));
        unsigned int v17 = *v16;
        v16 += 3;
        _IOAVStringAppendIndendationAndFormat(v6, v15, @"Pre-emphasis:  %d\n", v17);
        _IOAVStringAppendIndendationAndFormat(v6, v7, @"\n");
        ++v14;
      }
      while (v14 < *(unsigned int *)(a2 + 8));
    }
    _IOAVStringAppendIndendationAndFormat(v6, v19, @"\n");
  }
  return v6;
}

uint64_t IOAVAudioInterfaceGetTypeID()
{
  uint64_t result = __kIOAVAudioInterfaceTypeID;
  if (!__kIOAVAudioInterfaceTypeID)
  {
    pthread_once(&__interfaceTypeInit_0, (void (*)(void))__IOAVAudioInterfaceRegister);
    return __kIOAVAudioInterfaceTypeID;
  }
  return result;
}

uint64_t __IOAVAudioInterfaceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVAudioInterfaceCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVAudioInterfaceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVAudioInterface", (uint64_t (*)(void, uint64_t))IOAVAudioInterfaceCreateWithService, 0, 2u, -1);
  }
  else {
    return 0;
  }
}

io_connect_t *IOAVAudioInterfaceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVAudioInterface")) {
    return 0;
  }
  if (!__kIOAVAudioInterfaceTypeID) {
    pthread_once(&__interfaceTypeInit_0, (void (*)(void))__IOAVAudioInterfaceRegister);
  }
  uint64_t Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  io_object_t v4 = Instance;
  if (Instance)
  {
    *((void *)Instance + 2) = 0;
    *((void *)Instance + 3) = 0;
    mach_port_t v5 = Instance + 4;
    *((void *)Instance + 4) = 0;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E4F14960], 0, v4 + 5))
    {
      int v7 = v4;
      io_object_t v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, @"Location", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      int v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVAudioInterfaceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
}

io_connect_t *IOAVAudioInterfaceGetService(uint64_t a1)
{
  uint64_t result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      uint64_t result = IOAVServiceCreateWithService(*MEMORY[0x1E4F1CF80], parent);
      *(void *)(a1 + 32) = result;
    }
    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }
  return result;
}

uint64_t IOAVAudioInterfaceSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

CFArrayRef IOAVAudioInterfaceCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0)) {
    return 0;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVAudioInterfaceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVAudioInterfaceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

CFTypeRef IOAVAudioInterfaceCopyElements(uint64_t a1)
{
  CFTypeRef cf = 0;
  int v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 5u, &cf);
  CFTypeRef result = 0;
  if (v1) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = cf == 0;
  }
  if (!v3)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFArrayGetTypeID()) {
      return cf;
    }
    else {
      return 0;
    }
  }
  return result;
}

CFTypeRef IOAVAudioInterfaceCopyChannelLayoutElements(uint64_t a1)
{
  CFTypeRef cf = 0;
  int v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 6u, &cf);
  CFTypeRef result = 0;
  if (v1) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = cf == 0;
  }
  if (!v3)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFArrayGetTypeID()) {
      return cf;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOAVAudioInterfaceGetLinkData(uint64_t a1, void *outputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = 0;
  size_t v3 = 32;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVAudioInterfaceGetLinkDataWithSource(uint64_t a1, void *outputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  size_t v4 = 32;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t IOAVAudioInterfaceStartLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 3u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceStopLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 4u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 3u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 4u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceCopyDiagnosticsString()
{
  return 0;
}

void __IOAVAudioInterfaceFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 16);
  if (v3) {
    IOObjectRelease(v3);
  }
  size_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t IOAVControllerGetTypeID()
{
  uint64_t result = __kIOAVControllerTypeID;
  if (!__kIOAVControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_1, (void (*)(void))__IOAVControllerRegister);
    return __kIOAVControllerTypeID;
  }
  return result;
}

uint64_t __IOAVControllerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVControllerCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVControllerCreate(uint64_t a1)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVController", (uint64_t (*)(void, uint64_t))IOAVControllerCreateWithService, 0, 0, -1);
  }
  else {
    return 0;
  }
}

uint64_t IOAVControllerCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVController", (uint64_t (*)(void, uint64_t))IOAVControllerCreateWithService, 0, a2, -1);
  }
  else {
    return 0;
  }
}

io_connect_t *IOAVControllerCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVController")) {
    return 0;
  }
  if (!__kIOAVControllerTypeID) {
    pthread_once(&__controllerTypeInit_1, (void (*)(void))__IOAVControllerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  size_t v4 = (io_connect_t *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    *(void *)(Instance + 24) = 0;
    mach_port_t v5 = (io_service_t *)(Instance + 16);
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E4F14960], 0, v4 + 5))
    {
      int v7 = v4;
      size_t v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, @"Location", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      int v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVControllerCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
}

CFArrayRef IOAVControllerCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0)) {
    return 0;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVControllerSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVControllerGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVControllerGetPower(uint64_t a1, BOOL *a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xBu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!result) {
    *a2 = output[0] != 0;
  }
  return result;
}

uint64_t IOAVControllerSetPower(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 6u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetEventLogSize(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetProtectionType()
{
  return 3758097095;
}

uint64_t IOAVControllerForceHotPlugDetect(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 7u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerCopyDiagnosticsString()
{
  return 0;
}

uint64_t IOAVControllerSetVirtualDeviceMode(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 8u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerWakeDisplay(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSleepDisplay(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerGetCRCData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  size_t v4 = 16;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xCu, input, 1u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t __IOAVControllerFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result)
  {
    return IOObjectRelease(result);
  }
  return result;
}

uint64_t IOAVDeviceGetTypeID()
{
  uint64_t result = __kIOAVDeviceTypeID;
  if (!__kIOAVDeviceTypeID)
  {
    pthread_once(&__deviceTypeInit_1, (void (*)(void))__IOAVDeviceRegister);
    return __kIOAVDeviceTypeID;
  }
  return result;
}

uint64_t __IOAVDeviceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVDeviceCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVDeviceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVDevice", (uint64_t (*)(void, uint64_t))IOAVDeviceCreateWithService, 0, 0, -1);
  }
  else {
    return 0;
  }
}

uint64_t IOAVDeviceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVDevice", (uint64_t (*)(void, uint64_t))IOAVDeviceCreateWithService, 0, a2, -1);
  }
  else {
    return 0;
  }
}

io_connect_t *IOAVDeviceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVDevice")) {
    return 0;
  }
  if (!__kIOAVDeviceTypeID) {
    pthread_once(&__deviceTypeInit_1, (void (*)(void))__IOAVDeviceRegister);
  }
  uint64_t Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  size_t v4 = Instance;
  if (Instance)
  {
    *((void *)Instance + 2) = 0;
    *((void *)Instance + 3) = 0;
    mach_port_t v5 = Instance + 4;
    *((void *)Instance + 4) = 0;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E4F14960], 0, v4 + 5))
    {
      int v7 = v4;
      size_t v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, @"Location", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      int v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVDeviceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
}

io_connect_t *IOAVDeviceGetController(uint64_t a1)
{
  uint64_t result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      uint64_t result = IOAVControllerCreateWithService(*MEMORY[0x1E4F1CF80], parent);
      *(void *)(a1 + 32) = result;
    }
    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }
  return result;
}

uint64_t IOAVDeviceSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceSetEventLogSize(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0, 0, 0, 0, 0, 0, 0, 0);
}

CFArrayRef IOAVDeviceCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0)) {
    return 0;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVDeviceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVDeviceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVDeviceReadI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *outputStruct, unsigned int a5)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  size_t v6 = a5;
  if (a5 <= 0x1000) {
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0, 0, 0, 0, outputStruct, &v6);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOAVDeviceWriteI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *inputStruct, size_t inputStructCnt)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  if (inputStructCnt <= 0x1000) {
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 7u, input, 2u, inputStruct, inputStructCnt, 0, 0, 0, 0);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOAVDeviceGetLinkData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  size_t v4 = 272;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 8u, input, 1u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t IOAVDeviceGetProtectionStatus(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IOAVDeviceCopyDiagnosticsString()
{
  return 0;
}

void __IOAVDeviceFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 16);
  if (v3) {
    IOObjectRelease(v3);
  }
  size_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t IOAVDisplayMemoryGetTypeID()
{
  uint64_t result = __kIOAVDisplayMemoryTypeID;
  if (!__kIOAVDisplayMemoryTypeID)
  {
    pthread_once(&__serviceTypeInit_1, (void (*)(void))__IOAVDisplayMemoryRegister);
    return __kIOAVDisplayMemoryTypeID;
  }
  return result;
}

uint64_t __IOAVDisplayMemoryRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVDisplayMemoryCFTypeID TypeID = result;
  return result;
}

io_service_t *IOAVDisplayMemoryCreateWithName(uint64_t a1, const void *a2)
{
  size_t v4 = IOServiceMatching("IOAVDisplayMemory");
  if (!v4) {
    return 0;
  }
  CFDictionaryRef v5 = v4;
  CFDictionarySetValue(v4, @"IONameMatch", a2);
  io_registry_entry_t MatchingService = IOServiceGetMatchingService(0, v5);
  if (!MatchingService) {
    return 0;
  }
  io_object_t v7 = MatchingService;
  uint64_t v8 = IOAVDisplayMemoryCreateWithService(a1, MatchingService);
  IOObjectRelease(v7);
  return v8;
}

io_service_t *IOAVDisplayMemoryCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVDisplayMemory")) {
    return 0;
  }
  if (!__kIOAVDisplayMemoryTypeID) {
    pthread_once(&__serviceTypeInit_1, (void (*)(void))__IOAVDisplayMemoryRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  size_t v4 = (io_service_t *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(v4[4], *MEMORY[0x1E4F14960], 0, v4 + 5))
    {
      CFRelease(v4);
      return 0;
    }
  }
  return v4;
}

uint64_t IOAVDisplayMemoryRead(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  size_t v5 = a4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, input, 1u, 0, 0, 0, 0, outputStruct, &v5);
}

uint64_t IOAVDisplayMemoryWrite(uint64_t a1, unsigned int a2, void *inputStruct, size_t inputStructCnt)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v4, 1u, input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t __IOAVDisplayMemoryFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result)
  {
    return IOObjectRelease(result);
  }
  return result;
}

void _IOAVStringAppendIndendationAndFormat(CFMutableStringRef theString, int a2, CFStringRef format, ...)
{
  va_start(va, format);
  if (a2)
  {
    int v5 = a2;
    do
    {
      CFStringAppend(theString, @"    ");
      --v5;
    }
    while (v5);
  }
  CFStringAppendFormatAndArguments(theString, 0, format, va);
}

__CFString *IOAVCreateDiagnosticsString(const __CFAllocator *a1)
{
  return IOAVCreateDiagnosticsStringWithLocation(a1, 0);
}

__CFString *IOAVCreateDiagnosticsStringWithLocation(const __CFAllocator *a1, unsigned int a2)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    uint64_t v5 = IOAVControllerCreateWithLocation((uint64_t)a1, a2);
    if (v5)
    {
      size_t v6 = (const void *)v5;
      CFStringRef v7 = (const __CFString *)IOAVControllerCopyDiagnosticsString();
      if (v7)
      {
        CFStringRef v8 = v7;
        CFStringAppend(Mutable, v7);
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    uint64_t v9 = IOAVDeviceCreateWithLocation((uint64_t)a1, a2);
    if (v9)
    {
      CFDictionaryRef v10 = (const void *)v9;
      CFStringRef v11 = (const __CFString *)IOAVDeviceCopyDiagnosticsString();
      if (v11)
      {
        CFStringRef v12 = v11;
        CFStringAppend(Mutable, v11);
        CFRelease(v12);
      }
      CFRelease(v10);
    }
    uint64_t v13 = IOAVServiceCreate((uint64_t)a1);
    if (v13)
    {
      unint64_t v14 = (const void *)v13;
      CFStringRef v15 = (const __CFString *)IOAVServiceCopyDiagnosticsString();
      if (v15)
      {
        CFStringRef v16 = v15;
        CFStringAppend(Mutable, v15);
        CFRelease(v16);
      }
      CFRelease(v14);
    }
    uint64_t v17 = IOAVAudioInterfaceCreate((uint64_t)a1);
    if (v17)
    {
      CFNumberRef v18 = (const void *)v17;
      CFStringRef v19 = (const __CFString *)IOAVAudioInterfaceCopyDiagnosticsString();
      if (v19)
      {
        CFStringRef v20 = v19;
        CFStringAppend(Mutable, v19);
        CFRelease(v20);
      }
      CFRelease(v18);
    }
    uint64_t v21 = IOAVVideoInterfaceCreate((uint64_t)a1);
    if (v21)
    {
      uint64_t v22 = (const void *)v21;
      CFStringRef v23 = (const __CFString *)IOAVVideoInterfaceCopyDiagnosticsString();
      if (v23)
      {
        CFStringRef v24 = v23;
        CFStringAppend(Mutable, v23);
        CFRelease(v24);
      }
      CFRelease(v22);
    }
  }
  return Mutable;
}

__CFDictionary *IOAVCreateDiagnosticsReference(const __CFAllocator *a1)
{
  return IOAVCreateDiagnosticsReferenceWithLocation(a1, 0);
}

__CFDictionary *IOAVCreateDiagnosticsReferenceWithLocation(const __CFAllocator *a1, unsigned int a2)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    uint64_t v5 = IOAVControllerCreateWithLocation((uint64_t)a1, a2);
    if (v5)
    {
      size_t v6 = (const void *)v5;
      CFArrayRef v7 = IOAVControllerCopyProperties(v5);
      if (v7)
      {
        CFArrayRef v8 = v7;
        CFDictionarySetValue(Mutable, @"IOAVController", v7);
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    uint64_t v9 = IOAVDeviceCreateWithLocation((uint64_t)a1, a2);
    if (v9)
    {
      CFDictionaryRef v10 = (const void *)v9;
      CFArrayRef v11 = IOAVDeviceCopyProperties(v9);
      if (v11)
      {
        CFArrayRef v12 = v11;
        CFDictionarySetValue(Mutable, @"IOAVDevice", v11);
        CFRelease(v12);
      }
      CFRelease(v10);
    }
    uint64_t v13 = IOAVServiceCreate((uint64_t)a1);
    if (v13)
    {
      unint64_t v14 = (const void *)v13;
      CFArrayRef v15 = IOAVServiceCopyProperties(v13);
      if (v15)
      {
        CFArrayRef v16 = v15;
        CFDictionarySetValue(Mutable, @"IOAVService", v15);
        CFRelease(v16);
      }
      CFRelease(v14);
    }
    uint64_t v17 = IOAVAudioInterfaceCreate((uint64_t)a1);
    if (v17)
    {
      CFNumberRef v18 = (const void *)v17;
      CFArrayRef v19 = IOAVAudioInterfaceCopyProperties(v17);
      if (v19)
      {
        CFArrayRef v20 = v19;
        CFDictionarySetValue(Mutable, @"IOAVAudioInterface", v19);
        CFRelease(v20);
      }
      CFRelease(v18);
    }
    uint64_t v21 = IOAVVideoInterfaceCreate((uint64_t)a1);
    if (v21)
    {
      uint64_t v22 = (const void *)v21;
      CFArrayRef v23 = IOAVVideoInterfaceCopyProperties(v21);
      if (v23)
      {
        CFArrayRef v24 = v23;
        CFDictionarySetValue(Mutable, @"IOAVVideoInterface", v23);
        CFRelease(v24);
      }
      CFRelease(v22);
    }
    uint64_t v25 = IOAVControlInterfaceCreate((uint64_t)a1);
    if (v25)
    {
      uint64_t v26 = (const void *)v25;
      CFArrayRef v27 = IOAVControlInterfaceCopyProperties(v25);
      if (v27)
      {
        CFArrayRef v28 = v27;
        CFDictionarySetValue(Mutable, @"IOAVControlInterface", v27);
        CFRelease(v28);
      }
      CFRelease(v26);
    }
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithVideoLinkData(const __CFAllocator *a1, unsigned __int8 *a2, int a3, char a4)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  uint64_t v9 = Mutable;
  if (Mutable)
  {
    if (a4)
    {
      int v10 = *((_DWORD *)a2 + 10);
      double v11 = (double)*((int *)a2 + 24) * 0.0000152587891;
      uint64_t v12 = *((unsigned int *)a2 + 12);
      uint64_t v13 = *((unsigned int *)a2 + 20);
      uint64_t v14 = *((unsigned int *)a2 + 2);
      CFArrayRef v15 = IOAVVideoColorDynamicRangeString(*((_DWORD *)a2 + 4));
      CFArrayRef v16 = IOAVVideoPixelEncodingString(*((_DWORD *)a2 + 3));
      CFArrayRef v28 = IOAVVideoColorimetryString(*((_DWORD *)a2 + 5));
      uint64_t v29 = IOAVVideoColorEOTFString(*((_DWORD *)a2 + 6));
      uint64_t v17 = 105;
      if ((v10 & 1) == 0) {
        uint64_t v17 = 112;
      }
      CFStringAppendFormat(v9, 0, @"%dx%d%c %.3f Hz, %dbpc %s Range %s, %s colorimetry, %s EOTF", v12, v13, v17, *(void *)&v11, v14, v15, v16, v28, v29);
      if (*(_WORD *)(a2 + 1))
      {
        if (*((_WORD *)a2 + 63)) {
          CFStringRef v19 = @", DSC (%f bpp, passthrough)";
        }
        else {
          CFStringRef v19 = @", DSC (%f bpp, decompress)";
        }
        LOWORD(v18) = *((_WORD *)a2 + 62);
        CFStringAppendFormat(v9, 0, v19, (double)v18 * 0.0625);
      }
    }
    else
    {
      _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Video Link Data:\n\n");
      CFArrayRef v20 = IOAVCreateStringWithVideoTimingData(a1, (_DWORD *)a2 + 10, a3 + 1);
      if (v20)
      {
        uint64_t v21 = v20;
        CFStringAppend(v9, v20);
        CFRelease(v21);
      }
      uint64_t v22 = IOAVCreateStringWithVideoColorData(a1, (unsigned int *)a2 + 2, a3 + 1);
      if (v22)
      {
        CFArrayRef v24 = v22;
        CFStringAppend(v9, v22);
        CFRelease(v24);
      }
      if (*(_WORD *)(a2 + 1))
      {
        if (*((_WORD *)a2 + 63)) {
          CFStringRef v25 = @"DSC:          YES (%f bpp, passthrough)\n";
        }
        else {
          CFStringRef v25 = @"DSC:          YES (%f bpp, decompress)\n";
        }
        LOWORD(v23) = *((_WORD *)a2 + 62);
        _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, v25, (double)v23 * 0.0625);
      }
      else
      {
        _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, @"DSC:          NO\n");
      }
      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, @"Link ID:      %u\n", *((_DWORD *)a2 + 30) & 0xFFF);
      uint64_t v26 = IOAVVideoLinkModeString(*a2);
      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, @"Link Mode:    %s\n", v26);
      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, @"Test Mode:    %d\n", *((unsigned int *)a2 + 1));
      _IOAVStringAppendIndendationAndFormat(v9, a3, @"\n");
    }
  }
  return v9;
}

__CFString *IOAVCreateStringWithVideoTimingData(const __CFAllocator *a1, _DWORD *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  uint64_t PixelClock = IOAVVideoTimingGetPixelClock(a2, 0);
  if (Mutable)
  {
    uint64_t v7 = PixelClock;
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Timing Attributes:\n");
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Horizontal:    Total: %5u Active: %5u FrontPorch: %4u SyncWidth: %3u BackPorch: %3u SyncPolarity: %u PixelRepetition: %u SyncRate: %10.6f kHz\n", a2[1], a2[2], a2[5], a2[3], a2[4], a2[7], a2[8], (double)(int)a2[6] * 0.0000152587891);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Vertical:      Total: %5u Active: %5u FrontPorch: %4u SyncWidth: %3u BackPorch: %3u SyncPolarity: %u PixelRepetition: %u SyncRate: %10.6f Hz\n", a2[9], a2[10], a2[13], a2[11], a2[12], a2[15], a2[16], (double)(int)a2[14] * 0.0000152587891);
    if (*a2) {
      CFArrayRef v8 = "YES";
    }
    else {
      CFArrayRef v8 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Interlaced:    %s\n", v8);
    if ((*a2 & 2) != 0) {
      uint64_t v9 = "YES";
    }
    else {
      uint64_t v9 = "NO";
    }
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Split:         %s\n", v9);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Pixel Clock:   %f Mhz (%u Hz)\n", (double)v7 / 1000000.0, v7);
    int v10 = IOAVVideoScanInformationString(a2[19]);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Scan Type:     %s\n", v10);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"\n");
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithVideoColorData(const __CFAllocator *a1, unsigned int *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  size_t v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Color Attributes:\n");
    uint64_t v7 = *a2;
    CFArrayRef v8 = IOAVVideoPixelEncodingString(a2[1]);
    uint64_t v9 = IOAVVideoColorDynamicRangeString(a2[2]);
    int v10 = IOAVVideoColorimetryString(a2[3]);
    double v11 = IOAVVideoColorEOTFString(a2[4]);
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Depth: [%d bpc] Encoding: [%s] Range: [%s] Colorimetry: [%s] EOTF: [%s] DSC: [%s]\n", v7, v8, v9, v10, v11, IOAVCreateStringWithVideoColorData_dscMethods[a2[5] & 3]);
    _IOAVStringAppendIndendationAndFormat(v6, a3, @"\n");
  }
  return v6;
}

__CFString *IOAVCreateStringWithAudioLinkData(const __CFAllocator *a1, unsigned int *a2, int a3, char a4)
{
  return __IOAVCreateStringWithAudioLinkData(a1, a2, a3, 1, a4);
}

__CFString *__IOAVCreateStringWithAudioLinkData(const __CFAllocator *a1, unsigned int *a2, int a3, int a4, char a5)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  double v11 = Mutable;
  if (Mutable)
  {
    if (a5)
    {
      LODWORD(v10) = a2[3];
      unsigned int v12 = *a2;
      uint64_t v13 = a2[1];
      uint64_t v14 = a2[2];
      double v15 = (double)v10 / 1000.0;
      CFArrayRef v16 = IOAVAudioFormatString(v12);
      CFStringAppendFormat(v11, 0, @"%g kHz %dch %d-bit %s", *(void *)&v15, v13, v14, v16);
    }
    else
    {
      uint64_t v22 = 0;
      memset(&v21, 0, 32);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Audio Link Data:\n");
      uint64_t v17 = IOAVAudioFormatString(*a2);
      _IOAVStringAppendIndendationAndFormat(v11, a3 + 1, @"Format: %s Channels: %d SampleSize: %d SampleRate: %d hz\n", v17, a2[1], a2[2], a2[3]);
      if (a4)
      {
        _IOAVStringAppendIndendationAndFormat(v11, a3 + 1, @"Layout:\n");
        IOAVAudioGetChannelLayoutData(a2[5], &v21);
        if (v21.n128_u32[0])
        {
          unint64_t v18 = 0;
          do
          {
            CFStringRef v19 = IOAVAudioSpeakerString(v21.n128_u32[v18 + 2]);
            _IOAVStringAppendIndendationAndFormat(v11, a3 + 2, @"Channel %d: %s\n", v18++, v19);
          }
          while (v18 < v21.n128_u32[0]);
        }
      }
      _IOAVStringAppendIndendationAndFormat(v11, a3, @"\n");
    }
  }
  return v11;
}

__CFString *IOAVCreateStringWithAudioChannelLayoutData(const __CFAllocator *a1, unsigned int *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  size_t v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"Audio Channel Layout Data:\n\n");
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Total Channels: %d Active Channels: %d\n", *a2, a2[1]);
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, @"Layout:\n");
    if (*a2)
    {
      unint64_t v7 = 0;
      do
      {
        CFArrayRef v8 = IOAVAudioSpeakerString(a2[v7 + 2]);
        _IOAVStringAppendIndendationAndFormat(v6, a3 + 2, @"Channel %d: %s\n", v7++, v8);
      }
      while (v7 < *a2);
    }
    _IOAVStringAppendIndendationAndFormat(v6, a3, @"\n");
  }
  return v6;
}

CFDictionaryRef _IOAVElementListGetElementIDAtIndex(const __CFArray *a1, CFIndex a2)
{
  CFDictionaryRef result = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, a2);
  if (result)
  {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"ID");
  }
  return result;
}

__CFString *_IOAVCreateStringOfColorIDs(const __CFAllocator *a1, CFDictionaryRef theDict, void *key, int a4, uint64_t (*a5)(const __CFArray *, uint64_t))
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, key);
  if (!Value) {
    return 0;
  }
  CFArrayRef v11 = Value;
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount(v11);
    if (Count)
    {
      uint64_t v14 = Count;
      CFArrayRef v15 = (const __CFArray *)CFDictionaryGetValue(theDict, @"UnsafeColorElementIDs");
      CFArrayRef theArray = v15;
      if (v15) {
        CFIndex v16 = CFArrayGetCount(v15);
      }
      else {
        CFIndex v16 = 0;
      }
      _IOAVStringAppendIndendationAndFormat(Mutable, a4, @"%@:", key);
      if (v14 >= 1)
      {
        uint64_t v17 = 0;
        int v18 = a4 + 1;
        do
        {
          uint64_t valuePtr = 0;
          uint64_t v19 = v17 + 1;
          if ((v17 & 0xF) == 0 && v19 < v14)
          {
            CFStringAppend(Mutable, @"\n");
            _IOAVStringAppendIndendationAndFormat(Mutable, v18, &stru_1ED870660);
          }
          CFNumberRef v20 = (const __CFNumber *)a5(v11, v17);
          if (v20)
          {
            CFNumberRef v21 = v20;
            CFTypeID v22 = CFGetTypeID(v20);
            if (v22 == CFNumberGetTypeID())
            {
              CFNumberGetValue(v21, kCFNumberSInt64Type, &valuePtr);
              uint64_t v23 = valuePtr;
              if (v16)
              {
                v28.location = 0;
                v28.CFIndex length = v16;
                if (CFArrayContainsValue(theArray, v28, v21)) {
                  uint64_t v24 = 42;
                }
                else {
                  uint64_t v24 = 32;
                }
              }
              else
              {
                uint64_t v24 = 32;
              }
              CFStringAppendFormat(Mutable, 0, @"%3lld%c ", v23, v24);
            }
          }
          uint64_t v17 = v19;
        }
        while (v14 != v19);
      }
      CFStringAppend(Mutable, @"\n");
    }
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithElement(const __CFAllocator *a1, const __CFDictionary *a2, int a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"ElementType");
    if (Value)
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      uint64_t v8 = (a3 + 1);
      uint64_t v9 = IOAVElementTypeString(valuePtr);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s Element\n", v9);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"------------------------\n");
      if (a2)
      {
        *(void *)buffer = 0;
        CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(a2, @"ID");
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberSInt64Type, buffer);
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %lld\n", "ID", *(void *)buffer);
        }
        *(void *)buffer = 0;
        CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Score");
        if (v11)
        {
          CFNumberGetValue(v11, kCFNumberSInt64Type, buffer);
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %lld\n", "Score", *(void *)buffer);
        }
        unsigned int v12 = CFDictionaryGetValue(a2, @"IsVirtual");
        uint64_t v13 = (const void **)MEMORY[0x1E4F1CFD0];
        if (v12)
        {
          if (v12 == (const void *)*MEMORY[0x1E4F1CFD0]) {
            uint64_t v14 = "YES";
          }
          else {
            uint64_t v14 = "NO";
          }
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "IsVirtual", v14);
        }
        CFArrayRef v15 = CFDictionaryGetValue(a2, @"IsPreferred");
        if (v15)
        {
          if (v15 == *v13) {
            CFIndex v16 = "YES";
          }
          else {
            CFIndex v16 = "NO";
          }
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "IsPreferred", v16);
        }
        uint64_t v17 = CFDictionaryGetValue(a2, @"IsPromoted");
        if (v17)
        {
          if (v17 == *v13) {
            int v18 = "YES";
          }
          else {
            int v18 = "NO";
          }
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "IsPromoted", v18);
        }
      }
      switch(valuePtr)
      {
        case 0u:
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          *(_OWORD *)buffer = 0u;
          CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(a2, @"ElementData");
          if (v19)
          {
            v78.location = 0;
            v78.CFIndex length = 80;
            CFDataGetBytes(v19, v78, buffer);
            CFNumberRef v20 = IOAVCreateStringWithVideoTimingData(a1, buffer, a3 + 1);
            if (a2)
            {
              LODWORD(v68) = 0;
              CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(a2, @"StandardType");
              if (v21)
              {
                CFNumberGetValue(v21, kCFNumberSInt32Type, &v68);
                CFTypeID v22 = IOAVStandardTypeString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "StandardType", v22);
              }
              LODWORD(v68) = 0;
              CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(a2, @"TimingType");
              if (v23)
              {
                CFNumberGetValue(v23, kCFNumberSInt32Type, &v68);
                uint64_t v24 = IOAVVideoTimingTypeString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "TimingType", v24);
              }
              LODWORD(v68) = 0;
              CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(a2, @"TimingStandard");
              if (v25)
              {
                CFNumberGetValue(v25, kCFNumberSInt32Type, &v68);
                uint64_t v26 = IOAVVideoTimingStandardString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "TimingStandard", v26);
              }
              uint64_t v68 = 0;
              CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(a2, @"CEAShortID");
              if (v27)
              {
                CFNumberGetValue(v27, kCFNumberSInt64Type, &v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %lld\n", "CEAShortID", v68);
              }
              LODWORD(v68) = 0;
              CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(a2, @"AspectRatio");
              if (v28)
              {
                CFNumberGetValue(v28, kCFNumberSInt32Type, &v68);
                uint64_t v29 = IOAVVideoAspectRatioString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "AspectRatio", v29);
              }
              uint64_t v68 = 0;
              CFNumberRef v30 = (const __CFNumber *)CFDictionaryGetValue(a2, @"PreciseAspectRatio");
              if (v30)
              {
                CFNumberGetValue(v30, kCFNumberSInt64Type, &v68);
                LOWORD(v31) = v68;
                if (v68 < 0) {
                  uint64_t v31 = -v68;
                }
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %lld.%0*lld\n", "PreciseAspectRatio", v68 / 0x10000, 3, (1000 * (unint64_t)(unsigned __int16)v31) >> 16);
              }
            }
            _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s:\n", "ValidPixelEncodings");
            CFNumberRef v32 = (const __CFNumber *)CFDictionaryGetValue(a2, @"ValidPixelEncodings");
            if (v32)
            {
              LODWORD(v68) = 0;
              CFNumberGetValue(v32, kCFNumberIntType, &v68);
              unsigned int v33 = 0;
              int v34 = a3 + 2;
              do
              {
                if ((v68 >> v33))
                {
                  uint64_t v35 = IOAVVideoPixelEncodingString(v33);
                  _IOAVStringAppendIndendationAndFormat(Mutable, v34, @"%s\n", v35);
                }
                ++v33;
              }
              while (v33 != 15);
            }
            uint64_t v36 = _IOAVCreateStringOfColorIDs(a1, a2, @"ColorModes", v8, (uint64_t (*)(const __CFArray *, uint64_t))_IOAVElementListGetElementIDAtIndex);
            if (v36)
            {
              uint64_t v37 = v36;
              CFStringAppend(Mutable, v36);
              CFRelease(v37);
            }
            uint64_t v38 = _IOAVCreateStringOfColorIDs(a1, a2, @"DSCRequiredColorElementIDs", v8, MEMORY[0x1E4F1C1E8]);
            if (v38)
            {
              uint64_t v39 = v38;
              CFStringAppend(Mutable, v38);
              CFRelease(v39);
            }
            if (v20)
            {
              CFStringAppend(Mutable, v20);
              CFRelease(v20);
            }
            uint64_t v40 = CFDictionaryGetValue(a2, @"DownstreamFormat");
            if (v40)
            {
              id v41 = v40;
              _IOAVStringAppendIndendationAndFormat(Mutable, v8, @"%s:\n\n", "DownstreamFormat");
              CFStringRef v42 = (const __CFString *)IOAVCreateStringWithElement(a1, v41, v8);
              if (v42)
              {
                CFStringRef v43 = v42;
                CFStringAppend(Mutable, v42);
                CFRelease(v43);
              }
            }
            uint64_t v44 = CFDictionaryGetValue(a2, @"UpstreamFormat");
            if (v44)
            {
              CFMutableDictionaryRef v45 = v44;
              v46 = "UpstreamFormat";
              goto LABEL_63;
            }
          }
          break;
        case 1u:
          *(_OWORD *)buffer = 0u;
          long long v73 = 0u;
          if (a2)
          {
            LODWORD(v68) = 0;
            CFNumberRef v47 = (const __CFNumber *)CFDictionaryGetValue(a2, @"StandardType");
            if (v47)
            {
              CFNumberGetValue(v47, kCFNumberSInt32Type, &v68);
              v48 = IOAVStandardTypeString(v68);
              _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: %s\n", "StandardType", v48);
            }
          }
          CFDataRef v49 = (const __CFData *)CFDictionaryGetValue(a2, @"ElementData");
          if (v49)
          {
            v79.location = 0;
            v79.CFIndex length = 32;
            CFDataGetBytes(v49, v79, buffer);
            v50 = IOAVCreateStringWithVideoColorData(a1, (unsigned int *)buffer, a3 + 1);
            if (v50)
            {
              v51 = v50;
              CFStringAppend(Mutable, v50);
              CFRelease(v51);
              v52 = CFDictionaryGetValue(a2, @"DownstreamFormat");
              if (v52)
              {
                CFMutableDictionaryRef v45 = v52;
                v46 = "DownstreamFormat";
LABEL_63:
                _IOAVStringAppendIndendationAndFormat(Mutable, v8, @"%s:\n\n", v46);
                v53 = (__CFString *)IOAVCreateStringWithElement(a1, v45, v8);
                goto LABEL_82;
              }
            }
          }
          break;
        case 2u:
          *(_OWORD *)buffer = 0u;
          long long v73 = 0u;
          unsigned int v69 = 0;
          unsigned int v70 = 0;
          CFDataRef v54 = (const __CFData *)CFDictionaryGetValue(a2, @"ElementData");
          if (v54)
          {
            v80.location = 0;
            v80.CFIndex length = 32;
            CFDataGetBytes(v54, v80, buffer);
            v55 = __IOAVCreateStringWithAudioLinkData(a1, (unsigned int *)buffer, a3 + 1, 0, 0);
            CFArrayRef v56 = (const __CFArray *)CFDictionaryGetValue(a2, @"AudioChannelLayoutElements");
            if (v56)
            {
              CFArrayRef v57 = v56;
              CFIndex Count = CFArrayGetCount(v56);
              if (Count)
              {
                uint64_t v59 = Count;
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"%s: ", "AudioChannelLayoutElements");
                if (v59 >= 1)
                {
                  for (CFIndex i = 0; i != v59; ++i)
                  {
                    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v57, i);
                    uint64_t v68 = 0;
                    if (ValueAtIndex)
                    {
                      CFNumberRef v62 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"ID");
                      if (v62)
                      {
                        CFNumberGetValue(v62, kCFNumberSInt64Type, &v68);
                        _IOAVStringAppendIndendationAndFormat(Mutable, 1, @"%lld ", v68);
                      }
                    }
                  }
                }
                CFStringAppend(Mutable, @"\n");
              }
            }
            CFNumberRef v63 = (const __CFNumber *)CFDictionaryGetValue(a2, @"StreamSampleRate");
            if (v63) {
              CFNumberGetValue(v63, kCFNumberIntType, &v70);
            }
            CFNumberRef v64 = (const __CFNumber *)CFDictionaryGetValue(a2, @"MaxChannelCount");
            if (v64) {
              CFNumberGetValue(v64, kCFNumberIntType, &v69);
            }
            _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, @"Audio Stream Data:\n");
            v65 = IOAVAudioFormatString(*(unsigned int *)buffer);
            _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 2, @"Format: %s Channels: %d SampleSize: %d SampleRate: %d hz\n", v65, v69, *(unsigned int *)&buffer[8], v70);
            if (v55) {
              goto LABEL_86;
            }
          }
          break;
        case 3u:
          *(void *)&long long v74 = 0;
          *(_OWORD *)buffer = 0u;
          long long v73 = 0u;
          CFDataRef v66 = (const __CFData *)CFDictionaryGetValue(a2, @"ElementData");
          if (v66)
          {
            v81.location = 0;
            v81.CFIndex length = 40;
            CFDataGetBytes(v66, v81, buffer);
            v53 = IOAVCreateStringWithAudioChannelLayoutData(a1, (unsigned int *)buffer, a3 + 1);
LABEL_82:
            v55 = v53;
            if (v53)
            {
LABEL_86:
              CFStringAppend(Mutable, v55);
              CFStringAppend(Mutable, @"\n");
              CFRelease(v55);
            }
          }
          break;
        default:
          CFShow(a2);
          break;
      }
    }
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithElements(const __CFAllocator *a1, const __CFArray *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      for (CFIndex i = 0; i != v8; ++i)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, i);
        if (ValueAtIndex)
        {
          CFDictionaryRef v11 = ValueAtIndex;
          CFTypeID v12 = CFGetTypeID(ValueAtIndex);
          if (v12 == CFDictionaryGetTypeID())
          {
            uint64_t v13 = IOAVCreateStringWithElement(a1, v11, a3);
            if (v13)
            {
              uint64_t v14 = v13;
              CFStringAppend(Mutable, v13);
              CFRelease(v14);
            }
          }
        }
      }
    }
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithData(const __CFAllocator *a1, const __CFData *a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    unsigned int Length = CFDataGetLength(a2);
    unsigned int v7 = Length;
    if (Length)
    {
      uint64_t v8 = 0;
      unsigned int v9 = Length;
      do
      {
        if (v9 >= 0x10uLL) {
          uint64_t v10 = 16;
        }
        else {
          uint64_t v10 = v9;
        }
        uint64_t v11 = v8;
        if (v7 - v8 >= 0x10) {
          int v12 = 16;
        }
        else {
          int v12 = v7 - v8;
        }
        _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"%08x: ", v8);
        if (v12)
        {
          uint64_t v13 = v11;
          do
          {
            BytePtr = CFDataGetBytePtr(a2);
            _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"%02x ", BytePtr[v13++]);
            --v10;
          }
          while (v10);
        }
        _IOAVStringAppendIndendationAndFormat(Mutable, a3, @"\n");
        uint64_t v8 = (v11 + 16);
        v9 -= 16;
      }
      while (v8 < v7);
    }
  }
  return Mutable;
}

CFArrayRef IOAVPropertyListCreateWithCFProperties(const __CFAllocator *a1, const void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 0;
  }
  if (IOAVPropertyListCreateWithCFProperties_onceToken != -1) {
    dispatch_once(&IOAVPropertyListCreateWithCFProperties_onceToken, &__block_literal_global_17);
  }
  CFTypeID v4 = CFGetTypeID(a2);
  if (v4 != IOAVPropertyListCreateWithCFProperties_BOOLeanTypeID
    && v4 != IOAVPropertyListCreateWithCFProperties_numberTypeID
    && v4 != IOAVPropertyListCreateWithCFProperties_stringTypeID
    && v4 != IOAVPropertyListCreateWithCFProperties_dateTypeID
    && v4 != IOAVPropertyListCreateWithCFProperties_dataTypeID)
  {
    if (v4 == IOAVPropertyListCreateWithCFProperties_arrayTypeID)
    {
      uint64_t v10 = (const void **)v43;
      bzero(v43, 0x400uLL);
      unint64_t Count = CFArrayGetCount((CFArrayRef)a2);
      CFIndex v12 = Count;
      if (Count < 0x81 || (uint64_t v10 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL)) != 0)
      {
        v46.location = 0;
        v46.CFIndex length = v12;
        CFArrayGetValues((CFArrayRef)a2, v46, v10);
        if (v12 < 1)
        {
LABEL_41:
          CFArrayRef v16 = (const __CFArray *)CFRetain(a2);
        }
        else
        {
          uint64_t v13 = 0;
          char v14 = 0;
          do
          {
            uint64_t v15 = IOAVPropertyListCreateWithCFProperties(a1, v10[v13]);
            if (!v15)
            {
              if (v13)
              {
                for (uint64_t i = 0; i != v13; ++i)
                  CFRelease(v10[i]);
              }
              goto LABEL_78;
            }
            v14 |= v15 != (void)v10[v13];
            v10[v13++] = (const void *)v15;
          }
          while (v12 != v13);
          if ((v14 & 1) == 0) {
            goto LABEL_41;
          }
          CFArrayRef v16 = CFArrayCreate(a1, v10, v12, MEMORY[0x1E4F1D510]);
        }
        CFArrayRef v27 = v16;
        if (v12 >= 1)
        {
          CFNumberRef v28 = v10;
          do
          {
            uint64_t v29 = *v28++;
            CFRelease(v29);
            --v12;
          }
          while (v12);
        }
LABEL_79:
        if (v10 == (const void **)v43) {
          return v27;
        }
        uint64_t v40 = v10;
LABEL_81:
        free(v40);
        return v27;
      }
    }
    else if (v4 == IOAVPropertyListCreateWithCFProperties_dictionaryTypeID)
    {
      uint64_t v17 = v43;
      bzero(v43, 0x400uLL);
      int v18 = (const void **)v42;
      bzero(v42, 0x400uLL);
      unint64_t v19 = CFDictionaryGetCount((CFDictionaryRef)a2);
      CFIndex v20 = v19;
      if (v19 >= 0x81)
      {
        CFNumberRef v21 = malloc_type_malloc(8 * v19, 0xC0040B8AA526DuLL);
        if (!v21) {
          return 0;
        }
        uint64_t v17 = v21;
        CFTypeID v22 = (const void **)malloc_type_malloc(8 * v20, 0xC0040B8AA526DuLL);
        if (!v22)
        {
          free(v17);
          return 0;
        }
        int v18 = v22;
      }
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, (const void **)v17, v18);
      if (v20 < 1)
      {
LABEL_60:
        CFArrayRef v26 = (const __CFArray *)CFRetain(a2);
LABEL_61:
        CFArrayRef v27 = v26;
        if (v20 >= 1)
        {
          uint64_t v37 = v18;
          do
          {
            uint64_t v38 = *v37++;
            CFRelease(v38);
            --v20;
          }
          while (v20);
        }
        if (v17 != v43) {
          free(v17);
        }
        if (v18 == (const void **)v42) {
          return v27;
        }
LABEL_73:
        uint64_t v40 = v18;
        goto LABEL_81;
      }
      uint64_t v23 = 0;
      char v24 = 0;
      while (1)
      {
        uint64_t v25 = IOAVPropertyListCreateWithCFProperties(a1, v18[v23]);
        if (!v25) {
          break;
        }
        v24 |= v25 != (void)v18[v23];
        v18[v23++] = (const void *)v25;
        if (v20 == v23)
        {
          if ((v24 & 1) == 0) {
            goto LABEL_60;
          }
          CFArrayRef v26 = CFDictionaryCreate(a1, (const void **)v17, v18, v20, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          goto LABEL_61;
        }
      }
      if (v23)
      {
        for (uint64_t j = 0; j != v23; ++j)
          CFRelease(v18[j]);
      }
      if (v18 != (const void **)v42)
      {
        free(v17);
        CFArrayRef v27 = 0;
        goto LABEL_73;
      }
    }
    else if (v4 == IOAVPropertyListCreateWithCFProperties_setTypeID)
    {
      uint64_t v10 = (const void **)v43;
      bzero(v43, 0x400uLL);
      unint64_t v30 = CFSetGetCount((CFSetRef)a2);
      CFIndex v31 = v30;
      if (v30 < 0x81 || (uint64_t v10 = (const void **)malloc_type_malloc(8 * v30, 0x80040B8603338uLL)) != 0)
      {
        CFSetGetValues((CFSetRef)a2, v10);
        if (v31 < 1)
        {
          CFArrayRef v27 = CFArrayCreate(a1, v10, v31, MEMORY[0x1E4F1D510]);
        }
        else
        {
          uint64_t v32 = 0;
          while (1)
          {
            uint64_t v33 = IOAVPropertyListCreateWithCFProperties(a1, v10[v32]);
            if (!v33) {
              break;
            }
            v10[v32++] = (const void *)v33;
            if (v31 == v32)
            {
              CFArrayRef v27 = CFArrayCreate(a1, v10, v31, MEMORY[0x1E4F1D510]);
              int v34 = v10;
              do
              {
                uint64_t v35 = *v34++;
                CFRelease(v35);
                --v31;
              }
              while (v31);
              goto LABEL_79;
            }
          }
          if (v32)
          {
            for (uint64_t k = 0; k != v32; ++k)
              CFRelease(v10[k]);
          }
LABEL_78:
          CFArrayRef v27 = 0;
        }
        goto LABEL_79;
      }
    }
    return 0;
  }

  return (CFArrayRef)CFRetain(a2);
}

CFTypeID __IOAVPropertyListCreateWithCFProperties_block_invoke()
{
  IOAVPropertyListCreateWithCFProperties_BOOLeanCFTypeID TypeID = CFBooleanGetTypeID();
  IOAVPropertyListCreateWithCFProperties_numberCFTypeID TypeID = CFNumberGetTypeID();
  IOAVPropertyListCreateWithCFProperties_stringCFTypeID TypeID = CFStringGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dateCFTypeID TypeID = CFDateGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dataCFTypeID TypeID = CFDataGetTypeID();
  IOAVPropertyListCreateWithCFProperties_arrayCFTypeID TypeID = CFArrayGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dictionaryCFTypeID TypeID = CFDictionaryGetTypeID();
  CFTypeID result = CFSetGetTypeID();
  IOAVPropertyListCreateWithCFProperties_setCFTypeID TypeID = result;
  return result;
}

BOOL IOAVObjectConformsTo(io_registry_entry_t a1, uint64_t a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%s%s", a2, "UserInterfaceSupported");
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, v4, v3, 0);
  if (CFProperty)
  {
    BOOL v7 = CFProperty == (CFTypeRef)*MEMORY[0x1E4F1CFD0];
    CFRelease(CFProperty);
  }
  else
  {
    BOOL v7 = 0;
  }
  CFRelease(v5);
  return v7;
}

uint64_t IOAVConnectCallCopyMethod(mach_port_t a1, uint32_t a2, CFTypeRef *a3)
{
  size_t v5 = -3;
  outputStruct = 0;
  if (!a3) {
    return 3758097090;
  }
  uint64_t result = IOConnectCallMethod(a1, a2, 0, 0, 0, 0, 0, 0, &outputStruct, &v5);
  if (result)
  {
    *a3 = 0;
  }
  else
  {
    *a3 = IOCFUnserializeBinary(outputStruct, v5, 0, 0, 0);
    mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)outputStruct, v5);
    if (*a3) {
      return 0;
    }
    else {
      return 3758097085;
    }
  }
  return result;
}

uint64_t IOAVConnectCallSetMethod(mach_port_t a1, uint32_t a2, CFTypeRef object)
{
  CFDataRef v5 = IOCFSerialize(object, 1uLL);
  if (!v5) {
    return 3758097090;
  }
  CFDataRef v6 = v5;
  BytePtr = CFDataGetBytePtr(v5);
  size_t Length = CFDataGetLength(v6);
  uint64_t v9 = IOConnectCallMethod(a1, a2, 0, 0, BytePtr, Length, 0, 0, 0, 0);
  CFRelease(v6);
  return v9;
}

uint64_t IOAVServiceGetTypeID()
{
  uint64_t result = __kIOAVServiceTypeID;
  if (!__kIOAVServiceTypeID)
  {
    pthread_once(&__serviceTypeInit_2, (void (*)(void))__IOAVServiceRegister);
    return __kIOAVServiceTypeID;
  }
  return result;
}

uint64_t __IOAVServiceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVServiceCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVServiceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVService", (uint64_t (*)(void, uint64_t))IOAVServiceCreateWithService, 0, 0, -1);
  }
  else {
    return 0;
  }
}

uint64_t IOAVServiceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVService", (uint64_t (*)(void, uint64_t))IOAVServiceCreateWithService, 0, a2, -1);
  }
  else {
    return 0;
  }
}

io_connect_t *IOAVServiceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVService")) {
    return 0;
  }
  if (!__kIOAVServiceTypeID) {
    pthread_once(&__serviceTypeInit_2, (void (*)(void))__IOAVServiceRegister);
  }
  uint64_t Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  CFStringRef v4 = Instance;
  if (Instance)
  {
    *((void *)Instance + 2) = 0;
    *((void *)Instance + 3) = 0;
    CFDataRef v5 = Instance + 4;
    *((void *)Instance + 4) = 0;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E4F14960], 0, v4 + 5))
    {
      BOOL v7 = v4;
      CFStringRef v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, @"Location", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      BOOL v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVServiceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
}

io_connect_t *IOAVServiceGetDevice(uint64_t a1)
{
  uint64_t result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      return *(io_connect_t **)(a1 + 32);
    }
    else
    {
      uint64_t result = IOAVDeviceCreateWithService(*MEMORY[0x1E4F1CF80], parent);
      *(void *)(a1 + 32) = result;
    }
  }
  return result;
}

uint64_t IOAVServiceSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetEventLogSize(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0, 0, 0, 0, 0, 0, 0, 0);
}

CFArrayRef IOAVServiceCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0)) {
    return 0;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVServiceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVServiceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVServiceGetPower(uint64_t a1, BOOL *a2)
{
  uint64_t v2 = 3758097084;
  if (!a2) {
    return 3758097090;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), @"Power", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty)
  {
    CFDataRef v5 = CFProperty;
    *a2 = CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
    CFRelease(v5);
    return 0;
  }
  return v2;
}

uint64_t IOAVServiceSetVirtualEDIDMode(uint64_t a1, unsigned int a2, CFDataRef theData)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    size_t Length = CFDataGetLength(theData);
  }
  else
  {
    BytePtr = 0;
    size_t Length = 0;
  }
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x17u, input, 1u, BytePtr, Length, 0, 0, 0, 0);
}

uint64_t IOAVServiceCopyEDID(uint64_t a1, CFTypeRef *a2)
{
  if (!a2) {
    return 3758097090;
  }
  CFTypeRef cf = 0;
  uint64_t v3 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0x1Au, &cf);
  if (!cf || (CFTypeID v4 = CFGetTypeID(cf), v4 != CFDataGetTypeID()))
  {
    *a2 = 0;
    return 3758097097;
  }
  CFTypeRef v5 = cf;
  *a2 = cf;
  if (!v5) {
    return 3758097097;
  }
  return v3;
}

uint64_t IOAVServiceCopyPhysicalAddress(uint64_t a1, CFTypeRef *a2)
{
  if (!a2) {
    return 3758097090;
  }
  CFTypeRef cf = 0;
  uint64_t v3 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0x1Fu, &cf);
  if (!cf || (CFTypeID v4 = CFGetTypeID(cf), v4 != CFDataGetTypeID()))
  {
    *a2 = 0;
    return 3758097097;
  }
  CFTypeRef v5 = cf;
  *a2 = cf;
  if (!v5) {
    return 3758097097;
  }
  return v3;
}

uint64_t IOAVServiceGetLinkData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = 0;
  size_t v4 = 272;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t IOAVServiceGetLinkDataWithSource(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a4;
  size_t v5 = 272;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0, 0, 0, 0, outputStruct, &v5);
}

uint64_t IOAVServiceGetFRLLinkData(uint64_t a1, void *outputStruct)
{
  size_t v3 = 8;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 7u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceGetFRLCharacterErrorCounts(uint64_t a1, void *outputStruct)
{
  size_t v3 = 16;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 8u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceRetrainFRL(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetFRLMaxRate(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xAu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetFRLMinRate(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xBu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceGetFRLMaxRate(uint64_t a1, void *outputStruct)
{
  size_t v3 = 4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xCu, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceGetFRLMinRate(uint64_t a1, void *outputStruct)
{
  size_t v3 = 4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xDu, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceSetFRLRecovery(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xEu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceStartLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 0xFu, input, 1u, inputStruct, 0x110uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0xFu, input, 1u, inputStruct, 0x110uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStopLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 0x10u, input, 1u, inputStruct, 0x110uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x10u, input, 1u, inputStruct, 0x110uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStartInfoFrame(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 0x11u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStartInfoFrameWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x11u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStopInfoFrame(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 0x12u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStopInfoFrameWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x12u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetHDRStaticMetadata(uint64_t a1, const void *a2)
{
  if (a2) {
    mach_port_t v2 = a2;
  }
  else {
    mach_port_t v2 = (const void *)*MEMORY[0x1E4F1CFC8];
  }
  return IOAVConnectCallSetMethod(*(_DWORD *)(a1 + 20), 0x1Eu, v2);
}

uint64_t IOAVServiceGetContentProtectionCapabilities(uint64_t a1, void *outputStruct)
{
  size_t v3 = 8;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x13u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceGetChosenContentProtection(uint64_t a1, void *outputStruct)
{
  size_t v3 = 8;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x14u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceGetProtectionStatus(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x15u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IOAVServiceGetEncryptionStatus(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x20u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IOAVServiceSetContentProtectionCapabilities(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x1Cu, 0, 0, inputStruct, 8uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetContentProtectionPolicyOptions(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x1Du, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetContentProtectionSupportEnabled(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0x1Bu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceGetHDCPAuthenticatedContentType(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x16u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!result) {
    *a2 = output[0];
  }
  return result;
}

uint64_t IOAVServiceCopyDiagnosticsString()
{
  return 0;
}

uint64_t IOAVServiceReadI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *outputStruct, unsigned int a5)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  size_t v6 = a5;
  if (a5 <= 0x1000) {
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x18u, input, 2u, 0, 0, 0, 0, outputStruct, &v6);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOAVServiceWriteI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *inputStruct, size_t inputStructCnt)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  if (inputStructCnt <= 0x1000) {
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x19u, input, 2u, inputStruct, inputStructCnt, 0, 0, 0, 0);
  }
  else {
    return 3758097090;
  }
}

void __IOAVServiceFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 16);
  if (v3) {
    IOObjectRelease(v3);
  }
  size_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t IOAVVideoInterfaceGetTypeID()
{
  uint64_t result = __kIOAVVideoInterfaceTypeID;
  if (!__kIOAVVideoInterfaceTypeID)
  {
    pthread_once(&__interfaceTypeInit_1, (void (*)(void))__IOAVVideoInterfaceRegister);
    return __kIOAVVideoInterfaceTypeID;
  }
  return result;
}

uint64_t __IOAVVideoInterfaceRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOAVVideoInterfaceCFTypeID TypeID = result;
  return result;
}

uint64_t IOAVVideoInterfaceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVVideoInterface", (uint64_t (*)(void, uint64_t))IOAVVideoInterfaceCreateWithService, 0, 0, -1);
  }
  else {
    return 0;
  }
}

uint64_t IOAVVideoInterfaceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E4F1CF80] == a1) {
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVVideoInterface", (uint64_t (*)(void, uint64_t))IOAVVideoInterfaceCreateWithService, 0, a2, -1);
  }
  else {
    return 0;
  }
}

io_connect_t *IOAVVideoInterfaceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVVideoInterface")) {
    return 0;
  }
  if (!__kIOAVVideoInterfaceTypeID) {
    pthread_once(&__interfaceTypeInit_1, (void (*)(void))__IOAVVideoInterfaceRegister);
  }
  uint64_t Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  size_t v4 = Instance;
  if (Instance)
  {
    *((void *)Instance + 2) = 0;
    *((void *)Instance + 3) = 0;
    size_t v5 = Instance + 4;
    *((void *)Instance + 4) = 0;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E4F14960], 0, v4 + 5))
    {
      BOOL v7 = v4;
      size_t v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFTypeRef CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, @"Location", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      BOOL v7 = CFProperty;
      if (CFEqual(CFProperty, @"Embedded")) {
        v4[6] = 1;
      }
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVVideoInterfaceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
}

io_connect_t *IOAVVideoInterfaceGetService(uint64_t a1)
{
  uint64_t result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      uint64_t result = IOAVServiceCreateWithService(*MEMORY[0x1E4F1CF80], parent);
      *(void *)(a1 + 32) = result;
    }
    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }
  return result;
}

CFTypeRef IOAVVideoInterfaceCopyDisplayAttributes(uint64_t a1)
{
  CFTypeRef cf = 0;
  int v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0xDu, &cf);
  CFTypeRef result = 0;
  if (v1) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = cf == 0;
  }
  if (!v3)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID()) {
      return cf;
    }
    else {
      return 0;
    }
  }
  return result;
}

CFArrayRef IOAVVideoInterfaceCopyProperties(uint64_t a1)
{
  CFMutableDictionaryRef properties = 0;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0)) {
    return 0;
  }
  CFArrayRef v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVVideoInterfaceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVVideoInterfaceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

CFTypeRef IOAVVideoInterfaceCopyTimingElements(uint64_t a1)
{
  CFTypeRef cf = 0;
  int v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0xBu, &cf);
  CFTypeRef result = 0;
  if (v1) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = cf == 0;
  }
  if (!v3)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFArrayGetTypeID()) {
      return cf;
    }
    else {
      return 0;
    }
  }
  return result;
}

CFTypeRef IOAVVideoInterfaceCopyColorElements(uint64_t a1)
{
  CFTypeRef cf = 0;
  int v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0xCu, &cf);
  CFTypeRef result = 0;
  if (v1) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = cf == 0;
  }
  if (!v3)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFArrayGetTypeID()) {
      return cf;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOAVVideoInterfaceSetLogLevel(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceGetLinkData(uint64_t a1, void *outputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = 0;
  size_t v3 = 256;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVVideoInterfaceGetLinkDataWithSource(uint64_t a1, void *outputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  size_t v4 = 256;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t IOAVVideoInterfaceStartLink(uint64_t a1, void *inputStruct)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 3u, input, 1u, inputStruct, 0x100uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 3u, input, 1u, inputStruct, 0x100uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceStartLinkWithModes(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a4;
  uint64_t input[3] = a5;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, input, 4u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceStopLink(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 4u, input, 1u, inputStruct, 0x100uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceUpdateLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0xEu, input, 1u, inputStruct, 0x100uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetRotation(uint64_t a1, float a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = (int)(float)((float)(a2 * 65536.0) + 0.5);
  return IOConnectCallMethod(v2, 7u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetColorDitherRemoval(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 8u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetBounds(uint64_t a1, uint64_t a2, uint64_t a3)
{
  inputStruct[0] = a2;
  inputStruct[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetScreenVirtualTemperature(uint64_t a1, float a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  input[0] = (int)(float)((float)(a2 * 65536.0) + 0.5);
  return IOConnectCallMethod(v2, 0xAu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceCopyDiagnosticsString()
{
  return 0;
}

void __IOAVVideoInterfaceFree(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    IOServiceClose(v2);
  }
  io_object_t v3 = *(_DWORD *)(a1 + 16);
  if (v3) {
    IOObjectRelease(v3);
  }
  size_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t __IOUSBDeviceDescriptionRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOUSBDeviceDescriptionCFTypeID TypeID = result;
  return result;
}

uint64_t IOUSBDevicDeviceDescriptionGetTypeID()
{
  uint64_t result = __kIOUSBDeviceDescriptionTypeID;
  if (!__kIOUSBDeviceDescriptionTypeID)
  {
    pthread_once(&__deviceDescriptionTypeInit, (void (*)(void))__IOUSBDeviceDescriptionRegister);
    return __kIOUSBDeviceDescriptionTypeID;
  }
  return result;
}

uint64_t IOUSBDeviceDescriptionCreate(const __CFAllocator *a1)
{
  if (!__kIOUSBDeviceDescriptionTypeID) {
    pthread_once(&__deviceDescriptionTypeInit, (void (*)(void))__IOUSBDeviceDescriptionRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    *(void *)(Instance + 24) = 0;
    *(void *)(Instance + 16) = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    *(void *)(v3 + 24) = a1;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E4F1D510]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 16), @"ConfigurationDescriptors", Mutable);
    CFRelease(Mutable);
  }
  return v3;
}

CFTypeRef IOUSBDeviceDescriptionCreateFromController(const __CFAllocator *a1, uint64_t a2)
{
  io_registry_entry_t Service = IOUSBDeviceControllerGetService(a2);
  CFTypeRef result = IORegistryEntryCreateCFProperty(Service, @"DeviceDescription", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (result)
  {
    size_t v5 = result;
    uint64_t v6 = __IOUSBDeviceDescriptionCreateFromDictionary(a1, result);
    CFRelease(v5);
    return (CFTypeRef)v6;
  }
  return result;
}

uint64_t __IOUSBDeviceDescriptionCreateFromDictionary(const __CFAllocator *a1, const void *a2)
{
  uint64_t v3 = IOUSBDeviceDescriptionCreate(a1);
  uint64_t v4 = v3;
  if (v3)
  {
    size_t v5 = *(const void **)(v3 + 16);
    if (v5 != a2)
    {
      CFRelease(v5);
      *(void *)(v4 + 16) = CFRetain(a2);
    }
  }
  return v4;
}

uint64_t IOUSBDeviceDescriptionCreateFromDefaults(const __CFAllocator *a1)
{
  CFTypeRef cf = 0;
  uint64_t v2 = 0;
  if (IOUSBDeviceControllerCreate(*MEMORY[0x1E4F1CF80], (uint64_t *)&cf)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = cf == 0;
  }
  if (!v3)
  {
    io_registry_entry_t Service = IOUSBDeviceControllerGetService((uint64_t)cf);
    uint64_t v2 = __IOUSBDeviceDescriptionCreate(a1, Service, 0);
    CFRelease(cf);
  }
  return v2;
}

uint64_t IOUSBDeviceDescriptionCreateFromDefaultsAndController(const __CFAllocator *a1, uint64_t a2)
{
  io_registry_entry_t Service = IOUSBDeviceControllerGetService(a2);

  return __IOUSBDeviceDescriptionCreate(a1, Service, 0);
}

uint64_t __IOUSBDeviceDescriptionCreate(const __CFAllocator *a1, io_registry_entry_t a2, const void *a3)
{
  uint64_t result = __IOUSBDeviceDescriptionCreateFromFile(a1, @"/System/Library/AppleUSBDevice/USBDeviceConfigurationOverride.plist", a2, a3);
  if (!result)
  {
    return __IOUSBDeviceDescriptionCreateFromFile(a1, @"/System/Library/AppleUSBDevice/USBDeviceConfiguration.plist", a2, a3);
  }
  return result;
}

uint64_t IOUSBDeviceDescriptionCreateWithType(const __CFAllocator *a1, const void *a2)
{
  CFTypeRef cf = 0;
  uint64_t v4 = 0;
  if (IOUSBDeviceControllerCreate(*MEMORY[0x1E4F1CF80], (uint64_t *)&cf)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = cf == 0;
  }
  if (!v5)
  {
    uint64_t v4 = __IOUSBDeviceDescriptionCreate(a1, (io_registry_entry_t)cf, a2);
    CFRelease(cf);
  }
  return v4;
}

uint64_t _IOUSBDeviceDescriptionGetInfo(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t IOUSBDeviceDescriptionGetClass(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, @"deviceClass");
}

CFNumberRef __IOUSBDeviceGetIntProperty(uint64_t a1, const void *a2)
{
  unsigned int valuePtr = 0;
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

void IOUSBDeviceDescriptionSetClass(uint64_t a1, char a2)
{
  char valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"deviceClass", v3);
  CFRelease(v3);
}

void IOUSBDeviceDescriptionSetSubClass(uint64_t a1, char a2)
{
  char valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"deviceSubClass", v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetSubClass(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, @"deviceSubClass");
}

void IOUSBDeviceDescriptionSetProtocol(uint64_t a1, char a2)
{
  char valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"deviceProtocol", v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetProtocol(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, @"deviceProtocol");
}

uint64_t IOUSBDeviceDescriptionGetVendorID(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"vendorID");
}

void IOUSBDeviceDescriptionSetVendorID(uint64_t a1, __int16 a2)
{
  __int16 valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberShortType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"vendorID", v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetProductID(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"productID");
}

void IOUSBDeviceDescriptionSetProductID(uint64_t a1, __int16 a2)
{
  __int16 valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberShortType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"productID", v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetVersion(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"deviceID");
}

const void *IOUSBDeviceDescriptionGetManufacturerString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"manufacturerString");
}

const void *IOUSBDeviceDescriptionGetProductString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"productString");
}

const void *IOUSBDeviceDescriptionGetSerialString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"serialNumber");
}

void IOUSBDeviceDescriptionSetSerialString(uint64_t a1, void *value)
{
}

void IOUSBDeviceDescriptionRemoveAllConfigurations(uint64_t a1)
{
  CFNumberRef Value = (__CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");

  CFArrayRemoveAllValues(Value);
}

uint64_t IOUSBDeviceDescriptionGetMatchingConfiguration(uint64_t a1, const __CFArray *a2)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  if (!result) {
    return result;
  }
  CFArrayRef v4 = (const __CFArray *)result;
  uint64_t result = CFArrayGetCount((CFArrayRef)result);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  if (result < 1) {
    return 0;
  }
  uint64_t v6 = 0;
  CFIndex v7 = 0;
  uint64_t v8 = (const void *)*MEMORY[0x1E4F1CFD0];
  uint64_t v9 = @"DefaultConfiguration";
  CFTypeID v22 = (const void *)*MEMORY[0x1E4F1CFD0];
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
    if (!ValueAtIndex) {
      goto LABEL_20;
    }
    CFDictionaryRef v11 = ValueAtIndex;
    uint64_t v6 = CFDictionaryGetValue(ValueAtIndex, v9) == v8 ? (v7 + 1) : v6;
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v11, @"Interfaces");
    if (!Value) {
      goto LABEL_20;
    }
    CFArrayRef v13 = Value;
    CFIndex Count = CFArrayGetCount(Value);
    if (!a2) {
      goto LABEL_20;
    }
    CFIndex v15 = Count;
    if (!Count) {
      goto LABEL_20;
    }
    CFIndex v16 = CFArrayGetCount(a2);
    if (!v16) {
      goto LABEL_20;
    }
    CFIndex v17 = v16;
    if (v16 < 1) {
      goto LABEL_23;
    }
    int v18 = v9;
    unint64_t v19 = CFArrayGetValueAtIndex(a2, 0);
    v23.location = 0;
    v23.CFIndex length = v15;
    if (CFArrayGetFirstIndexOfValue(v13, v23, v19) != -1) {
      break;
    }
LABEL_19:
    uint64_t v9 = v18;
    uint64_t v8 = v22;
LABEL_20:
    if (++v7 == v5) {
      return v6;
    }
  }
  CFIndex v20 = 1;
  while (v17 != v20)
  {
    CFNumberRef v21 = CFArrayGetValueAtIndex(a2, v20);
    v24.location = 0;
    v24.CFIndex length = v15;
    ++v20;
    if (CFArrayGetFirstIndexOfValue(v13, v24, v21) == -1)
    {
      if (v20 - 1 >= v17) {
        break;
      }
      goto LABEL_19;
    }
  }
LABEL_23:
  uint64_t result = (v7 + 1);
  if (v7 == -1) {
    return v6;
  }
  return result;
}

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(uint64_t a1, const void *a2)
{
  CFArrayRef Value = (__CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"AllowMultipleCreates", (const void *)*MEMORY[0x1E4F1CFD0]);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(*(CFAllocatorRef *)(a1 + 24), 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFMutableArrayRef v6 = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 24), 0, MEMORY[0x1E4F1D510]);
  CFDictionaryAddValue(Mutable, @"Interfaces", v6);
  CFRelease(v6);
  if (a2) {
    CFDictionaryAddValue(Mutable, @"Description", a2);
  }
  CFArrayAppendValue(Value, Mutable);
  CFRelease(Mutable);
  return CFArrayGetCount(Value) - 1;
}

void IOUSBDeviceDescriptionSetAllowOverride(uint64_t a1, int a2)
{
  uint64_t v2 = *(__CFDictionary **)(a1 + 16);
  CFNumberRef v3 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    CFNumberRef v3 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  CFDictionarySetValue(v2, @"AllowMultipleCreates", *v3);
}

uint64_t IOUSBDeviceDescriptionAppendConfiguration(uint64_t a1, const void *a2, char a3, char a4)
{
  char valuePtr = a3;
  char v12 = a4;
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  uint64_t appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, a2);
  CFDictionaryRef ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(Value, (int)appended);
  CFNumberRef v9 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionaryAddValue(ValueAtIndex, @"Attributes", v9);
  CFRelease(v9);
  CFNumberRef v10 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &v12);
  CFDictionaryAddValue(ValueAtIndex, @"MaxPower", v10);
  CFRelease(v10);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithInterface(uint64_t a1, const void *a2)
{
  uint64_t appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, a2);
  IOUSBDeviceDescriptionAppendInterfaceToConfiguration(a1, appended, a2);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendInterfaceToConfiguration(uint64_t a1, int a2, const void *a3)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, a2);
  if (!ValueAtIndex) {
    return 0xFFFFFFFFLL;
  }
  CFIndex v7 = (__CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Interfaces");
  CFArrayAppendValue(v7, a3);
  return CFArrayGetCount(v7) - 1;
}

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithInterfaces(uint64_t a1, const __CFArray *a2)
{
  CFStringRef v4 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, @"+");
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v5 = v4;
  uint64_t appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, v4);
  IOUSBDeviceDescriptionAppendInterfacesToConfiguration(a1, appended, a2);
  CFRelease(v5);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendInterfacesToConfiguration(uint64_t a1, int a2, const __CFArray *a3)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, a2);
  if (!ValueAtIndex) {
    return 0xFFFFFFFFLL;
  }
  CFIndex v7 = (__CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Interfaces");
  v9.CFIndex length = CFArrayGetCount(a3);
  v9.location = 0;
  CFArrayAppendArray(v7, a3, v9);
  return CFArrayGetCount(v7) - 1;
}

uint64_t IOUSBDeviceDescriptionCreateWithConfigurationInterfaces(const __CFAllocator *a1, const __CFArray *a2)
{
  uint64_t v3 = IOUSBDeviceDescriptionCreate(a1);
  CFIndex Count = CFArrayGetCount(a2);
  if (v3)
  {
    CFIndex v5 = Count;
    if (Count >= 1)
    {
      CFIndex v6 = 0;
      do
      {
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(a2, v6);
        IOUSBDeviceDescriptionAppendConfigurationWithInterfaces(v3, ValueAtIndex);
        ++v6;
      }
      while (v5 != v6);
    }
  }
  return v3;
}

__CFArray *IOUSBDeviceDescriptionCopyInterfaces(uint64_t a1)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"ConfigurationDescriptors");
  uint64_t Count = CFArrayGetCount(Value);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 24), Count, MEMORY[0x1E4F1D510]);
  if (Mutable && Count >= 1)
  {
    CFIndex v5 = 0;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v5);
      CFArrayRef v7 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Interfaces");
      CFArrayRef Copy = CFArrayCreateCopy(*(CFAllocatorRef *)(a1 + 24), v7);
      if (!Copy) {
        break;
      }
      CFArrayRef v9 = Copy;
      CFArrayAppendValue(Mutable, Copy);
      CFRelease(v9);
      if (Count == ++v5) {
        return Mutable;
      }
    }
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

BOOL IOUSBDeviceDescriptionGetAllowOverride(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AllowMultipleCreates") == (const void *)*MEMORY[0x1E4F1CFD0];
}

void IOUSBDeviceDescriptionSetUDIDString(uint64_t a1, void *value)
{
}

void __IOUSBDeviceDescriptionRelease(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 16);
  if (v1) {
    CFRelease(v1);
  }
}

CFStringRef __IOUSBDeviceDescriptionSerializeDebug(uint64_t a1)
{
  uint64_t IntProperty = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"productID");
  uint64_t v3 = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"vendorID");
  uint64_t v4 = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, @"deviceID");
  uint64_t v5 = __IOUSBDeviceGetIntProperty(a1, @"deviceClass");
  uint64_t v6 = __IOUSBDeviceGetIntProperty(a1, @"deviceSubClass");
  uint64_t v7 = __IOUSBDeviceGetIntProperty(a1, @"deviceProtocol");
  CFArrayRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"manufacturerString");
  CFArrayRef v9 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"productString");
  CFNumberRef v10 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"serialNumber");
  return CFStringCreateWithFormat(0, 0, @"IOUSBDeviceDescription: pid/vid/ver=%04x/%04x/%d class/sub/prot=%d/%d/%d Mfg:%@ Prod:%@ Ser:%@\n%@", IntProperty, v3, v4, v5, v6, v7, Value, v9, v10, *(void *)(a1 + 16));
}

uint64_t __IOUSBDeviceDescriptionCreateFromFile(const __CFAllocator *a1, const __CFString *a2, io_registry_entry_t a3, const void *a4)
{
  CFURLRef v7 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
  if (v7)
  {
    CFURLRef v8 = v7;
    resourceCFDataRef Data = 0;
    SInt32 errorCode = 0;
    CFURLCreateDataAndPropertiesFromResource(a1, v7, &resourceData, 0, 0, &errorCode);
    if (!resourceData)
    {
      uint64_t v14 = 0;
LABEL_25:
      CFRelease(v8);
      return v14;
    }
    CFPropertyListRef v9 = CFPropertyListCreateFromXMLData(a1, resourceData, 2uLL, 0);
    if (!v9)
    {
      uint64_t v14 = 0;
LABEL_24:
      CFRelease(resourceData);
      goto LABEL_25;
    }
    CFNumberRef v10 = v9;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (a3
      && (char v12 = (__CFDictionary *)IORegistryEntryCreateCFProperty(a3, @"DefaultDeviceDescription", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0)) != 0)
    {
      CFMutableDictionaryRef v13 = v12;
      if (!a4)
      {
LABEL_16:
        CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a3, @"ConfigurationType", v11, 0);
        if (CFProperty)
        {
          a4 = CFProperty;
          goto LABEL_18;
        }
LABEL_27:
        uint64_t v14 = 0;
LABEL_22:
        CFRelease(v13);
        goto LABEL_23;
      }
    }
    else
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (!Mutable)
      {
        uint64_t v14 = 0;
LABEL_23:
        CFRelease(v10);
        goto LABEL_24;
      }
      CFMutableDictionaryRef v13 = Mutable;
      if (!a4)
      {
        if (!a3) {
          goto LABEL_27;
        }
        goto LABEL_16;
      }
    }
    CFRetain(a4);
LABEL_18:
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v10, @"configurations");
    int v18 = CFDictionaryGetValue(Value, a4);
    if (v18)
    {
      CFDictionarySetValue(v13, @"ConfigurationDescriptors", v18);
      uint64_t v14 = __IOUSBDeviceDescriptionCreateFromDictionary(0, v13);
    }
    else
    {
      uint64_t v14 = 0;
    }
    CFRelease(a4);
    goto LABEL_22;
  }
  return 0;
}

uint64_t IOUSBDeviceControllerGetTypeID()
{
  uint64_t result = __kIOUSBDeviceControllerTypeID;
  if (!__kIOUSBDeviceControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_2, (void (*)(void))__IOUSBDeviceControllerRegister);
    return __kIOUSBDeviceControllerTypeID;
  }
  return result;
}

uint64_t __IOUSBDeviceControllerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIOUSBDeviceControllerCFTypeID TypeID = result;
  return result;
}

uint64_t IOUSBDeviceControllerCreate(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = 3758097085;
  int v5 = -60;
  while (1)
  {
    CFDictionaryRef v6 = IOServiceMatching("IOUSBDeviceController");
    if (!v6) {
      break;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(0, v6);
    if (MatchingService)
    {
      io_object_t v9 = MatchingService;
      uint64_t v4 = IOUSBDeviceControllerCreateWithService(a1, MatchingService, a2);
      IOObjectRelease(v9);
      return v4;
    }
    usleep(0x7A120u);
    if (__CFADD__(v5++, 1)) {
      return 3758097136;
    }
  }
  return v4;
}

uint64_t IOUSBDeviceControllerCreateWithService(uint64_t a1, io_object_t a2, uint64_t *a3)
{
  if (!__kIOUSBDeviceControllerTypeID) {
    pthread_once(&__controllerTypeInit_2, (void (*)(void))__IOUSBDeviceControllerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 3758097085;
  }
  uint64_t v6 = Instance;
  *(void *)(Instance + 16) = 0;
  *(_DWORD *)(Instance + 16) = a2;
  IOObjectRetain(a2);
  uint64_t result = 0;
  *a3 = v6;
  return result;
}

uint64_t IOUSBDeviceControllerGoOffAndOnBus(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (!v3) {
    return 3758097085;
  }
  CFNumberRef v4 = v3;
  uint64_t v5 = IOUSBDeviceControllerSendCommand(a1, @"GoOffAndOnBus", v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOUSBDeviceControllerSendCommand(uint64_t a1, const void *a2, const void *a3)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 3758097085;
  }
  CFURLRef v7 = Mutable;
  CFDictionarySetValue(Mutable, @"USBDeviceCommand", a2);
  if (a3) {
    CFDictionarySetValue(v7, @"USBDeviceCommandParameter", a3);
  }
  uint64_t v8 = IORegistryEntrySetCFProperties(*(_DWORD *)(a1 + 16), v7);
  CFRelease(v7);
  return v8;
}

uint64_t IOUSBDeviceControllerForceOffBus(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = @"ForceOffBusEnable";
  }
  else {
    uint64_t v2 = @"ForceOffBusDisable";
  }
  return IOUSBDeviceControllerSendCommand(a1, v2, 0);
}

uint64_t IOUSBDeviceControllerSetPreferredConfiguration(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (!v3) {
    return 3758097090;
  }
  CFNumberRef v4 = v3;
  uint64_t v5 = IOUSBDeviceControllerSendCommand(a1, @"SetDevicePreferredConfiguration", v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOUSBDeviceControllerCreateDefaultDescription(uint64_t a1, const __CFAllocator *a2)
{
  return IOUSBDeviceDescriptionCreateFromDefaultsAndController(a2, a1);
}

uint64_t IOUSBDeviceControllerGetService(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t IOUSBDeviceControllerSetDescription(uint64_t a1, uint64_t a2)
{
  Info = (const void *)_IOUSBDeviceDescriptionGetInfo(a2);

  return IOUSBDeviceControllerSendCommand(a1, @"SetDeviceDescription", Info);
}

uint64_t __IOUSBDeviceControllerRelease(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result) {
    uint64_t result = IOObjectRelease(result);
  }
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t IOHIDAnalyticsEventSetStringValueForField()
{
  if (setStringValueForFieldFuncPtr) {
    return setStringValueForFieldFuncPtr();
  }
  return result;
}

uint64_t IOHIDAnalyticsEventAddField()
{
  if (addFieldFuncPtr) {
    return addFieldFuncPtr();
  }
  return result;
}

void *____loadFramework_block_invoke_0()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/HIDAnalytics.framework/HIDAnalytics", 1);
  __loadFramework_haHandle_0 = (uint64_t)result;
  if (result)
  {
    createEventFuncPtr = dlsym(result, "HIDAnalyticsEventCreate");
    if (__loadFramework_haHandle_0)
    {
      addHistogramFieldFuncPtr = (uint64_t (*)(void, void, void, void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventAddHistogramField");
      if (__loadFramework_haHandle_0)
      {
        addFieldFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventAddField");
        if (__loadFramework_haHandle_0)
        {
          setIntegerValueForFieldFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventSetIntegerValueForField");
          if (__loadFramework_haHandle_0)
          {
            setStringValueForFieldFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventSetStringValueForField");
            if (__loadFramework_haHandle_0)
            {
              activateEventFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventActivate");
              if (__loadFramework_haHandle_0)
              {
                int v1 = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventCancel");
                uint64_t result = (void *)__loadFramework_haHandle_0;
                cancelEventFuncPtr = v1;
                if (__loadFramework_haHandle_0)
                {
                  uint64_t v2 = dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsHistogramEventCreate");
                  uint64_t result = (void *)__loadFramework_haHandle_0;
                  createHistogramEventFuncPtr = v2;
                  if (__loadFramework_haHandle_0) {
                    uint64_t result = dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsHistogramEventSetIntegerValue");
                  }
                  goto LABEL_18;
                }
LABEL_17:
                createHistogramEventFuncPtr = 0;
LABEL_18:
                setHistogramIntegerValueFuncPtr = (uint64_t (*)(void))result;
                return result;
              }
LABEL_16:
              uint64_t result = 0;
              cancelEventFuncPtr = 0;
              goto LABEL_17;
            }
LABEL_15:
            activateEventFuncPtr = 0;
            goto LABEL_16;
          }
LABEL_14:
          setStringValueForFieldFuncPtr = 0;
          goto LABEL_15;
        }
LABEL_13:
        setIntegerValueForFieldFuncPtr = 0;
        goto LABEL_14;
      }
    }
    else
    {
      addHistogramFieldFuncPtr = 0;
    }
    addFieldFuncPtr = 0;
    goto LABEL_13;
  }
  return result;
}

uint64_t io_pm_get_value_int(int a1, int a2, _DWORD *a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x11D2800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73100)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t io_pm_set_value_int(int a1, int a2, int a3, _DWORD *a4)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  *(_DWORD *)&rcv_name[32] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v11 = 5395;
  *(void *)&rcv_name[12] = 0x11D2900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&v11, 3162115, 0x28u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73101)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v8 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a4 = *(_DWORD *)&rcv_name[32];
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t io_pm_force_active_settings(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x11D2A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 73102)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t io_pm_schedule_repeat_event(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1E4F14068];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x11D2C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (msg.msgh_id == 73104)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_cancel_repeat_events(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x11D2D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 73105)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  return v6;
}

uint64_t io_pm_last_wake_time(int a1, void *a2, _DWORD *a3, void *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v26 = 0;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  *(_OWORD *)&rcv_name_12[4] = 0u;
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v18 = 5395;
  *(void *)rcv_name_12 = 0x11D2E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v18);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)&v18, 3162115, 0x18u, 0x58u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 73106)
      {
        if ((v18 & 0x80000000) == 0)
        {
          if (rcv_name == 36)
          {
            uint64_t v14 = 4294966996;
            if (*(_DWORD *)&rcv_name_12[16])
            {
              if (rcv_name_4) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = *(unsigned int *)&rcv_name_12[16];
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v14 = 4294966996;
        if (*(_DWORD *)&rcv_name_12[8] == 2 && rcv_name == 80 && !rcv_name_4 && BYTE3(v23) == 1 && BYTE3(v24) == 1)
        {
          int v15 = DWORD1(v23);
          if (DWORD1(v23) == v25)
          {
            int v16 = DWORD1(v24);
            if (DWORD1(v24) == DWORD1(v25))
            {
              uint64_t v14 = 0;
              *a2 = *(void *)&rcv_name_12[12];
              *a3 = v15;
              *a4 = *((void *)&v23 + 1);
              *a5 = v16;
              *a6 = DWORD2(v25);
              return v14;
            }
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v18);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t io_pm_assertion_copy_details(mach_port_t a1, unsigned int a2, unsigned int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  msg.msgh_id = 0;
  uint64_t v22 = 0;
  long long v23 = 0u;
  *(_OWORD *)&msg.msgh_size = 0u;
  int v18 = 1;
  uint64_t v19 = a4;
  int v20 = 16777472;
  int v21 = a5;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  *(void *)&long long v23 = __PAIR64__(a3, a2);
  DWORD2(v23) = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x11D3200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&msg, 3162115, 0x40u, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (msg.msgh_id == 73110)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v14 = 4294966996;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0;
            *a6 = v19;
            *a7 = v15;
            *a8 = DWORD1(v23);
            return v14;
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t io_pm_declare_user_active(mach_port_t a1, int a2, uint64_t a3, int a4, int *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v18 = 1;
  uint64_t v19 = a3;
  int v20 = 16777472;
  int v21 = a4;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  int v23 = a2;
  int v24 = a4;
  int v25 = *a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x11D3400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 3162115, 0x40u, 0x38u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (msg.msgh_id == 73112)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 48)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v13 = HIDWORD(v19);
              if (!HIDWORD(v19))
              {
                int v16 = v21;
                *a5 = v20;
                *a6 = v16;
                *a7 = v22;
                return v13;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = HIDWORD(v19) == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = HIDWORD(v19);
            }
            goto LABEL_22;
          }
        }
        uint64_t v13 = 4294966996;
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  return v13;
}

uint64_t io_pm_declare_network_client_active(mach_port_t a1, uint64_t a2, int a3, int *a4, _DWORD *a5, _DWORD *a6)
{
  int v18 = 1;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  int v10 = *a4;
  int v23 = a3;
  int v24 = v10;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v17.msgh_bits = 2147489043;
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(void *)&v17.msgh_voucher_port = 0x11D3500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v17);
    mach_port_t special_reply_port = v17.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&v17, 3162115, 0x3Cu, 0x38u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (v17.msgh_id == 73113)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 48)
          {
            if (!v17.msgh_remote_port)
            {
              uint64_t v13 = HIDWORD(v19);
              if (!HIDWORD(v19))
              {
                int v16 = v21;
                *a4 = v20;
                *a5 = v16;
                *a6 = v22;
                return v13;
              }
              goto LABEL_22;
            }
          }
          else if (v17.msgh_size == 36)
          {
            if (v17.msgh_remote_port) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = HIDWORD(v19) == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = HIDWORD(v19);
            }
            goto LABEL_22;
          }
        }
        uint64_t v13 = 4294966996;
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v17);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  return v13;
}

uint64_t io_pm_get_uuid(int a1, int a2, char *a3, _DWORD *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, 476);
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v15 = 5395;
  *(void *)&rcv_name[12] = 0x11D3600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v15);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)&v15, 3162115, 0x24u, 0x438u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73114)
      {
        if ((v15 & 0x80000000) == 0)
        {
          if ((*(_DWORD *)rcv_name - 1073) <= 0xFFFFFBFE)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (!v10 && *(_DWORD *)rcv_name == 36) {
              uint64_t v9 = *(unsigned int *)&rcv_name[28];
            }
            else {
              uint64_t v9 = 4294966996;
            }
            goto LABEL_24;
          }
          if (!*(_DWORD *)&rcv_name[4])
          {
            uint64_t v9 = *(unsigned int *)&rcv_name[28];
            if (*(_DWORD *)&rcv_name[28]) {
              goto LABEL_24;
            }
            if (DWORD1(v17[0]) <= 0x400)
            {
              uint64_t v9 = 4294966996;
              if ((*(_DWORD *)rcv_name - 48) >= DWORD1(v17[0]))
              {
                unsigned int v13 = (DWORD1(v17[0]) + 3) & 0xFFFFFFFC;
                if (*(_DWORD *)rcv_name == v13 + 48)
                {
                  BOOL v14 = &rcv_name[v13 - 4];
                  mig_strncpy(a3, (const char *)v17 + 8, 1024);
                  uint64_t v9 = 0;
                  *a4 = *((_DWORD *)v14 + 11);
                  return v9;
                }
              }
              goto LABEL_24;
            }
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v15);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_connection_create(mach_port_name_t a1, const char *a2, int a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(v20, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v19 = 0u;
  *((void *)&v19 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v9 = mig_strncpy_zerofill((char *)v20 + 8, a2, 1024);
  }
  else {
    int v9 = mig_strncpy((char *)v20 + 8, a2, 1024);
  }
  LODWORD(v20[0]) = 0;
  DWORD1(v20[0]) = v9;
  uint64_t v10 = (v9 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v11 = v10 + 44;
  *(_DWORD *)((char *)v20 + v10 + 8) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v19 = 0x11D3700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v11, 0x34u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (DWORD1(v19) == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (DWORD1(v19) == 73115)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 44)
          {
            if (!rcv_name[2])
            {
              uint64_t v14 = LODWORD(v20[0]);
              if (!LODWORD(v20[0]))
              {
                int v17 = DWORD2(v20[0]);
                *a4 = DWORD1(v20[0]);
                *a5 = v17;
                return v14;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v15 = 1;
            }
            else {
              BOOL v15 = LODWORD(v20[0]) == 0;
            }
            if (v15) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = LODWORD(v20[0]);
            }
            goto LABEL_25;
          }
        }
        uint64_t v14 = 4294966996;
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t io_pm_connection_schedule_notification(int a1, int a2, int a3, int a4, int *a5)
{
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a3;
  int v13 = 1245184;
  uint64_t v14 = *MEMORY[0x1E4F14068];
  int v15 = a2;
  int v16 = a4;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = -2147478253;
  *(void *)&msg[16] = 0x11D3800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73116)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 40)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v9 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a5 = v13;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = *(_DWORD *)&msg[32] == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_connection_release(int a1, int a2, _DWORD *a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&mach_port_name_t rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x11D3900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73117)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t io_pm_connection_acknowledge_event(mach_port_t a1, int a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v14 = 1;
  uint64_t v15 = a4;
  int v16 = 16777472;
  int v17 = a5;
  uint64_t v18 = *MEMORY[0x1E4F14068];
  int v19 = a2;
  int v20 = a3;
  int v21 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x11D3A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3162115, 0x40u, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 73118)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t io_ps_new_pspowersource(int a1, _DWORD *a2, _DWORD *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D3B00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73119)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v11 = DWORD1(v13);
                *a2 = v13;
                *a3 = v11;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&msg[32] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t io_ps_update_pspowersource(mach_port_t a1, int a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v13 = 1;
  uint64_t v14 = a3;
  int v15 = 16777472;
  int v16 = a4;
  uint64_t v17 = *MEMORY[0x1E4F14068];
  int v18 = a2;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x11D3C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (msg.msgh_id == 73120)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_ps_release_pspowersource(int a1, int a2)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D3D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_special_reply_port();
      return v5;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 73121)
    {
      uint64_t v5 = 4294966996;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        uint64_t v5 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32]) {
          return v5;
        }
      }
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v5;
}

uint64_t io_pm_hid_event_report_activity(int a1, int a2, _DWORD *a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&mach_port_name_t rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x11D3F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73123)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t io_pm_hid_event_copy_history(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D4000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x44u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73124)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
        {
          int v11 = DWORD1(v14);
          if (DWORD1(v14) == v15)
          {
            uint64_t v10 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v11;
            *a4 = DWORD1(v15);
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t io_pm_set_debug_flags(int a1, int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v15 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v15) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D4100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x34u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73125)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v10 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v13 = DWORD1(v15);
                *a4 = v15;
                *a5 = v13;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = *(_DWORD *)&msg[32] == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t io_pm_set_bt_wake_interval(int a1, int a2, _DWORD *a3, _DWORD *a4)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D4200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73126)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v9 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v12 = DWORD1(v14);
                *a3 = v14;
                *a4 = v12;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = *(_DWORD *)&msg[32] == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_set_dw_linger_interval(int a1, int a2, _DWORD *a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&mach_port_name_t rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x11D4300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73127)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t io_pm_change_sa_assertion_behavior(int a1, int a2, _DWORD *a3, _DWORD *a4)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D4400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73128)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v9 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v12 = DWORD1(v14);
                *a3 = v14;
                *a4 = v12;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = *(_DWORD *)&msg[32] == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_set_sleepservice_wake_time_cap(int a1, int a2, _DWORD *a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&mach_port_name_t rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x11D4500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73129)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t io_pm_get_capability_bits(int a1, _DWORD *a2, _DWORD *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D4600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73130)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v11 = DWORD1(v13);
                *a2 = v13;
                *a3 = v11;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&msg[32] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t io_pm_ctl_assertion_type(mach_port_name_t a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v16 = 0u;
  *((void *)&v16 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v17 + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v17 + 8, a2, 1024);
  }
  LODWORD(v17[0]) = 0;
  DWORD1(v17[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v9 = v8 + 44;
  *(_DWORD *)((char *)v17 + v8 + 8) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v16 = 0x11D4700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v9, 0x30u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (DWORD1(v16) == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (DWORD1(v16) == 73131)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v12 = LODWORD(v17[0]);
              if (!LODWORD(v17[0]))
              {
                *a4 = DWORD1(v17[0]);
                return v12;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = LODWORD(v17[0]) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = LODWORD(v17[0]);
            }
            goto LABEL_25;
          }
        }
        uint64_t v12 = 4294966996;
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t io_pm_assertion_notify(mach_port_name_t a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v16 = 0u;
  *((void *)&v16 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v17 + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v17 + 8, a2, 1024);
  }
  LODWORD(v17[0]) = 0;
  DWORD1(v17[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v9 = v8 + 44;
  *(_DWORD *)((char *)v17 + v8 + 8) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v16 = 0x11D4800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v9, 0x30u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (DWORD1(v16) == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (DWORD1(v16) == 73132)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v12 = LODWORD(v17[0]);
              if (!LODWORD(v17[0]))
              {
                *a4 = DWORD1(v17[0]);
                return v12;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = LODWORD(v17[0]) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = LODWORD(v17[0]);
            }
            goto LABEL_25;
          }
        }
        uint64_t v12 = 4294966996;
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t io_pm_assertion_activity_log(int a1, void *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&msg[20] = 0u;
  long long v19 = 0u;
  uint64_t v21 = 0;
  long long v20 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = *a4;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D4900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x4Cu, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73133)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v14 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v14 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 68 && !*(_DWORD *)&msg[8] && BYTE3(v19) == 1)
        {
          int v15 = DWORD1(v19);
          if (DWORD1(v19) == v20)
          {
            uint64_t v14 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v15;
            int v16 = DWORD2(v20);
            *a4 = DWORD1(v20);
            *a5 = v16;
            *a6 = HIDWORD(v20);
            return v14;
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t io_pm_assertion_activity_aggregate(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x11D4A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x44u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73134)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_24;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
        {
          int v11 = DWORD1(v14);
          if (DWORD1(v14) == v15)
          {
            uint64_t v10 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v11;
            *a4 = DWORD1(v15);
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t io_pm_set_exception_limits(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x11D4B00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 73135)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t io_hideventsystem_do_client_refresh(int a1, void *a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(&msg_16[4], 0, 44);
  int msg_4 = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int msg_8 = a1;
  mach_port_name_t msg_12 = special_reply_port;
  int msg = 5395;
  *(void *)msg_16 = 0x1117400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = msg_12;
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 70104)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            uint64_t v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8) {
                uint64_t v8 = 4294966996;
              }
              else {
                uint64_t v8 = *(unsigned int *)&msg_16[16];
              }
            }
          }
          else
          {
            uint64_t v8 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          int v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            uint64_t v8 = 0;
            *a2 = *(void *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg_12);
    }
    goto LABEL_27;
  }
  return v8;
}

uint64_t io_hideventsystem_dispatch_event(int a1, uint64_t a2, int a3, mach_msg_timeout_t timeout)
{
  uint64_t v8 = a2;
  int v9 = 16777472;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  *(void *)int msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18B50C690;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 17, 0x38u, 0, 0, timeout, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v5;
}

uint64_t io_hideventsystem_service_conforms_to(mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int *a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v14 = 1;
  uint64_t v15 = a2;
  int v16 = 16777472;
  int v17 = a3;
  uint64_t v18 = *MEMORY[0x1E4F14068];
  int v19 = a3;
  int v20 = a4;
  int v21 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1117600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3162115, 0x40u, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 70106)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_25;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_25;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    goto LABEL_25;
  }
  return v10;
}

uint64_t io_hideventsystem_copy_matching_event_for_service(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, _DWORD *a6)
{
  int v15 = 1;
  uint64_t v16 = a3;
  int v17 = 16777472;
  int v18 = a4;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  uint64_t v20 = a2;
  int v21 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v14.msgh_bits = 2147489043;
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = special_reply_port;
  *(void *)&v14.msgh_voucher_port = 0x1117800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v14);
    mach_port_t special_reply_port = v14.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&v14, 3162115, 0x40u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (v14.msgh_id == 70108)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 36)
          {
            uint64_t v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (v14.msgh_remote_port) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v11 = 4294966996;
        if (v15 == 1 && *(void *)&v14.msgh_size == 56 && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == v20)
          {
            uint64_t v11 = 0;
            *a5 = v16;
            *a6 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v14.msgh_local_port);
    }
    goto LABEL_26;
  }
  return v11;
}

uint64_t io_hideventsystem_set_element_value_for_service(mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int *a7)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v15 = 1;
  uint64_t v16 = a2;
  int v17 = 16777472;
  int v18 = a3;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  int v20 = a3;
  int v21 = a4;
  int v22 = a5;
  int v23 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v14.msgh_bits = 2147489043;
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = special_reply_port;
  *(void *)&v14.msgh_voucher_port = 0x1117900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v14);
    mach_port_t special_reply_port = v14.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&v14, 3162115, 0x44u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (v14.msgh_id == 70109)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 40)
          {
            if (!v14.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_25;
            }
          }
          else if (v14.msgh_size == 36)
          {
            if (v14.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_25;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v14.msgh_local_port);
    }
    goto LABEL_25;
  }
  return v11;
}

uint64_t io_hideventsystem_copy_properties_for_service(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  int v18 = 2;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 16777472;
  int v24 = a5;
  uint64_t v25 = *MEMORY[0x1E4F14068];
  int v26 = a3;
  int v27 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v17.msgh_bits = 2147489043;
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(void *)&v17.msgh_voucher_port = 0x1117C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v17);
    mach_port_t special_reply_port = v17.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&v17, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (v17.msgh_id == 70112)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 36)
          {
            uint64_t v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (v17.msgh_remote_port) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v14 = 4294966996;
        if (v18 == 1 && *(void *)&v17.msgh_size == 60 && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v14 - 268435459) <= 1)
  {
    if ((v17.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v17.msgh_local_port);
    }
    goto LABEL_26;
  }
  return v14;
}

uint64_t io_hideventsystem_register_property_changed_notification(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18B50C6A0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t io_hideventsystem_unregister_property_changed_notification(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18B50C6B0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t io_hideventsystem_register_event_filter(mach_port_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  int v6 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70020;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t io_hideventsystem_unregister_event_filter(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x1118500000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_register_record_client_changed_notification(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x1118600000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_unregister_record_client_changed_notification(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x1118700000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_register_record_service_changed_notification(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x1118800000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_unregister_record_service_changed_notification(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x1118900000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_remove_virtual_service(mach_port_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  uint64_t v6 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70027;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t iohideventsystem_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 70029) >= 0xFFFFFFE3) {
    return (uint64_t)*(&_iohideventsystem_subsystem + 5 * (v1 - 70000) + 5);
  }
  else {
    return 0;
  }
}

_DWORD *_Xio_hideventsystem_do_client_refresh(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)_io_hideventsystem_do_client_refresh(result[3], (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_dispatch_event(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(unsigned char *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        uint64_t result = _io_hideventsystem_dispatch_event(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    int v4 = -300;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xio_hideventsystem_service_conforms_to(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  uint64_t result = _io_hideventsystem_service_conforms_to(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 56), *(_DWORD *)(result + 60), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _Xio_hideventsystem_copy_matching_event_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    int v3 = -300;
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _io_hideventsystem_copy_matching_event_for_service(*(_DWORD *)(result + 12), *(void *)(result + 52), *(UInt8 **)(result + 28), *(_DWORD *)(result + 40), (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_set_element_value_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 68)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  uint64_t result = _io_hideventsystem_set_element_value_for_service(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 56), *(_DWORD *)(result + 60), *(_DWORD *)(result + 64), (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _Xio_hideventsystem_copy_properties_for_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }
  if (*(unsigned char *)(result + 39) != 1
    || *(unsigned char *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    int v3 = -300;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _io_hideventsystem_copy_properties_for_service(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), *(unsigned int *)(result + 40), *(UInt8 **)(result + 44), *(_DWORD *)(result + 56), (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52), (int *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_register_property_changed_notification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(unsigned char *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        uint64_t result = _io_hideventsystem_register_property_changed_notification(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    int v4 = -300;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xio_hideventsystem_unregister_property_changed_notification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(unsigned char *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        uint64_t result = _io_hideventsystem_unregister_property_changed_notification(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    int v4 = -300;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_Xio_hideventsystem_register_event_filter(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_register_event_filter(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_unregister_event_filter(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_unregister_event_filter(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_register_record_client_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_register_record_client_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_unregister_record_client_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_unregister_record_client_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_register_record_service_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_register_record_service_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_unregister_record_service_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_io_hideventsystem_unregister_record_service_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _Xio_hideventsystem_remove_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = _io_hideventsystem_remove_virtual_service(*(_DWORD *)(result + 12), *(const void **)(result + 32));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t iohideventsystem_client_dispatch_properties_changed(mach_port_t a1, uint64_t a2, int a3, mach_msg_timeout_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v11 = 1;
  uint64_t v12 = a2;
  int v13 = 16777472;
  int v14 = a3;
  uint64_t v15 = *MEMORY[0x1E4F14068];
  int v16 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v10.msgh_bits = 2147489043;
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  *(void *)&v10.msgh_voucher_port = 0x124FA00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v10, 3162515, 0x38u, 0x2Cu, special_reply_port, a4, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0) {
    goto LABEL_13;
  }
  if (v7)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v8 - 268435459) > 1) {
      return v8;
    }
    if ((v10.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v10.msgh_local_port);
    }
LABEL_18:
    mach_msg_destroy(&v10);
    return v8;
  }
  if (v10.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
    goto LABEL_18;
  }
  if (v10.msgh_id != 75102)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_18;
  }
  uint64_t v8 = 4294966996;
  if ((v10.msgh_bits & 0x80000000) != 0) {
    goto LABEL_18;
  }
  if (*(void *)&v10.msgh_size != 36) {
    goto LABEL_18;
  }
  uint64_t v8 = HIDWORD(v12);
  if (HIDWORD(v12)) {
    goto LABEL_18;
  }
  return v8;
}

uint64_t iohideventsystem_client_dispatch_event_filter(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6, mach_msg_timeout_t a7)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 16777472;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 16777472;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x124FB00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&msg, 3162515, 0x4Cu, 0x30u, special_reply_port, a7, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (msg.msgh_id == 75103)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a6 = v18;
                return v12;
              }
              goto LABEL_25;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v17) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
            goto LABEL_25;
          }
        }
        uint64_t v12 = 4294966996;
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    goto LABEL_25;
  }
  return v12;
}

uint64_t iohideventsystem_client_dispatch_client_records_changed(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x124FC00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 129, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t iohideventsystem_client_dispatch_service_records_changed(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x124FD00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 129, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t iohideventsystem_copy_matching_event_from_virtual_service(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, _DWORD *a6, mach_msg_timeout_t a7)
{
  int v17 = 1;
  uint64_t v18 = a3;
  int v19 = 16777472;
  int v20 = a4;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  uint64_t v22 = a2;
  int v23 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v16.msgh_bits = 2147489043;
  v16.msgh_remote_port = a1;
  v16.msgh_local_port = special_reply_port;
  *(void *)&v16.msgh_voucher_port = 0x1250200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v16);
    mach_port_t special_reply_port = v16.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&v16, 3162515, 0x40u, 0x40u, special_reply_port, a7, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (v16.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (v16.msgh_id == 75110)
      {
        if ((v16.msgh_bits & 0x80000000) == 0)
        {
          if (v16.msgh_size == 36)
          {
            uint64_t v13 = 4294966996;
            if (HIDWORD(v18))
            {
              if (v16.msgh_remote_port) {
                uint64_t v13 = 4294966996;
              }
              else {
                uint64_t v13 = HIDWORD(v18);
              }
            }
          }
          else
          {
            uint64_t v13 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v13 = 4294966996;
        if (v17 == 1 && *(void *)&v16.msgh_size == 56 && HIBYTE(v19) == 1)
        {
          int v14 = v20;
          if (v20 == v22)
          {
            uint64_t v13 = 0;
            *a5 = v18;
            *a6 = v14;
            return v13;
          }
        }
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v16);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((v16.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v16.msgh_local_port);
    }
    goto LABEL_26;
  }
  return v13;
}

uint64_t iohideventsystem_output_event_to_virtual_service(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, int *a5, mach_msg_timeout_t a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v15 = 1;
  uint64_t v16 = a3;
  int v17 = 16777472;
  int v18 = a4;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  uint64_t v20 = a2;
  int v21 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1250300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&msg, 3162515, 0x40u, 0x30u, special_reply_port, a6, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (msg.msgh_id == 75111)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a5 = v17;
                return v11;
              }
              goto LABEL_25;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_25;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    goto LABEL_25;
  }
  return v11;
}

uint64_t iohideventsystem_client_refresh(mach_port_t a1, int a2)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x1250400000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, a2 | 1, 0x18u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t iohideventsystem_client_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 75013) >= 0xFFFFFFF3) {
    return (uint64_t)*(&_iohideventsystem_client_subsystem + 5 * (v1 - 75000) + 5);
  }
  else {
    return 0;
  }
}

uint64_t _Xiohideventsystem_client_dispatch_properties_changed(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v4 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_9;
  }
  if (*(unsigned char *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_8;
  }
  uint64_t result = _iohideventsystem_client_dispatch_properties_changed(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _Xiohideventsystem_client_dispatch_event_filter(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_12;
  }
  if (*(unsigned char *)(result + 39) != 1
    || *(unsigned char *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }
  uint64_t result = _iohideventsystem_client_dispatch_event_filter(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_12:
  *(void *)(a2 + 24) = v5;
  return result;
}

_DWORD *_Xiohideventsystem_client_dispatch_client_records_changed(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_iohideventsystem_client_dispatch_client_records_changed(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_Xiohideventsystem_client_dispatch_service_records_changed(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_iohideventsystem_client_dispatch_service_records_changed(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _Xiohideventsystem_copy_matching_event_from_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    int v3 = -300;
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = _iohideventsystem_copy_matching_event_from_virtual_service(*(_DWORD *)(result + 12), *(const void **)(result + 52), *(UInt8 **)(result + 28), *(_DWORD *)(result + 40), (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xiohideventsystem_output_event_to_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 60)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  uint64_t result = _iohideventsystem_output_event_to_virtual_service(*(_DWORD *)(result + 12), *(const void **)(result + 52), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v4;
  return result;
}

_DWORD *_Xiohideventsystem_client_refresh(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_iohideventsystem_client_refresh(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t io_iterator_reset(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF300000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_matching_services(unsigned int a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 480);
  *(_OWORD *)reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xAF400000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_property(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xAF500000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_iterator_enter_entry(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF700000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_iterator_exit_entry(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF800000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_properties(unsigned int a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAFB00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_connect_add_client(unsigned int a1, int a2)
{
  uint64_t v9 = 0x13000000000000;
  int v7 = 1;
  int v8 = a2;
  int v10 = 0;
  *(void *)&v6.msgh_bits = 0x2880001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB0400000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB0D00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_object_get_retain_count(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0E00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_busy_state(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0F00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_wait_quiet(unsigned int a1, uint64_t a2)
{
  int v9 = 0;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  uint64_t v8 = a2;
  *(void *)&v6.msgh_bits = 0x2800001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1000000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_create_iterator(unsigned int a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(v16, 0, 140);
  *(_OWORD *)reply_port = 0u;
  long long v15 = 0u;
  *((void *)&v15 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v16 + 8, a2, 128);
  }
  else {
    int v7 = mig_strncpy((char *)v16 + 8, a2, 128);
  }
  LODWORD(v16[0]) = 0;
  DWORD1(v16[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  mach_port_t v9 = v8 + 44;
  *(_DWORD *)((char *)v16 + v8 + 8) = a3;
  mach_port_t v10 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v9;
  *(void *)&reply_port[2] = __PAIR64__(v10, a1);
  *(void *)&long long v15 = 0xB1100000000;
  uint64_t v11 = mach_msg2_internal();
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!v11)
    {
      if (DWORD1(v15) == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (DWORD1(v15) == 2933)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v12 = 4294966996;
          if (DWORD2(v15) == 1 && reply_port[1] == 40 && !reply_port[2] && WORD3(v16[0]) << 16 == 1114112)
          {
            uint64_t v12 = 0;
            *a4 = HIDWORD(v15);
            return v12;
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v12 = 4294966996;
          if (LODWORD(v16[0]))
          {
            if (reply_port[2]) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = LODWORD(v16[0]);
            }
          }
        }
        else
        {
          uint64_t v12 = 4294966996;
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v12;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v12;
}

uint64_t io_iterator_is_valid(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB1200000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_catalog_send_data(unsigned int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v8 = 1;
  uint64_t v9 = a3;
  int v10 = 16777472;
  int v11 = a4;
  uint64_t v12 = *MEMORY[0x1E4F14068];
  int v13 = a2;
  int v14 = a4;
  *(void *)&v7.msgh_bits = 0x3C80001513;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB1400000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy(&v7);
  }
  return v5;
}

uint64_t io_catalog_terminate(unsigned int a1, int a2, char *src)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(v10, 0, 140);
  *(_OWORD *)reply_port = 0u;
  long long v9 = 0u;
  *((void *)&v9 + 1) = *MEMORY[0x1E4F14068];
  LODWORD(v10[0]) = a2;
  if (MEMORY[0x1E4F149B0]) {
    int v4 = mig_strncpy_zerofill((char *)v10 + 12, src, 128);
  }
  else {
    int v4 = mig_strncpy((char *)v10 + 12, src, 128);
  }
  DWORD1(v10[0]) = 0;
  DWORD2(v10[0]) = v4;
  reply_port[0] = 5395;
  reply_port[1] = ((v4 + 3) & 0xFFFFFFFC) + 44;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v9 = 0xB1500000000;
  uint64_t v5 = mach_msg2_internal();
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v5)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v6 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v6;
}

uint64_t io_catalog_get_data(unsigned int a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  int v11 = 0;
  uint64_t v10 = 0;
  uint64_t v6 = *MEMORY[0x1E4F14068];
  int v7 = a2;
  *(void *)&v5.msgh_bits = 0x2400001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB1600000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) <= 0xE && ((1 << (v2 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  else if (v2)
  {
    mig_dealloc_reply_port(v5.msgh_local_port);
  }
  else
  {
    uint64_t v3 = 4294966995;
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t io_catalog_get_gen_count(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB1700000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_catalog_module_loaded(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB1800000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_catalog_reset(unsigned int a1, int a2)
{
  uint64_t v9 = 0;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1900000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_service_request_probe(unsigned int a1, int a2)
{
  uint64_t v9 = 0;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1A00000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_get_name_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB1B00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_match_property_table(unsigned int a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 480);
  *(_OWORD *)reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB1C00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_connect_get_notification_semaphore(unsigned int a1, int a2)
{
  int v10 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2400000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_get_location_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB2600000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_property_recursively(unsigned int a1, const char *a2, const char *a3, int a4, void *a5, _DWORD *a6)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  memset(v27, 0, sizeof(v27));
  *(_OWORD *)reply_port = 0u;
  *((void *)&v27[0] + 1) = *MEMORY[0x1E4F14068];
  uint64_t v11 = MEMORY[0x1E4F149B0];
  if (MEMORY[0x1E4F149B0]) {
    int v12 = mig_strncpy_zerofill((char *)&v27[1] + 8, a2, 128);
  }
  else {
    int v12 = mig_strncpy((char *)&v27[1] + 8, a2, 128);
  }
  LODWORD(v27[1]) = 0;
  DWORD1(v27[1]) = v12;
  uint64_t v13 = (v12 + 3) & 0xFFFFFFFC;
  int v14 = v13 + 52;
  uint64_t v15 = (char *)reply_port + v13;
  uint64_t v16 = v15 - 128;
  uint64_t v17 = v15 + 48;
  if (v11) {
    int v18 = mig_strncpy_zerofill(v17, a3, 128);
  }
  else {
    int v18 = mig_strncpy(v17, a3, 128);
  }
  *((_DWORD *)v16 + 42) = 0;
  *((_DWORD *)v16 + 43) = v18;
  uint64_t v19 = (v18 + 3) & 0xFFFFFFFC;
  mach_port_t v20 = v14 + v19;
  *(_DWORD *)&v16[v19 + 176] = a4;
  mach_port_t v21 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v20;
  *(void *)&reply_port[2] = __PAIR64__(v21, a1);
  *(void *)&v27[0] = 0xB2700000000;
  uint64_t v22 = mach_msg2_internal();
  uint64_t v23 = v22;
  if ((v22 - 268435458) <= 0xE && ((1 << (v22 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!v22)
    {
      if (DWORD1(v27[0]) == 71)
      {
        uint64_t v23 = 4294966988;
      }
      else if (DWORD1(v27[0]) == 2955)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v23 = 4294966996;
          if (DWORD2(v27[0]) == 1 && reply_port[1] == 56 && !reply_port[2] && BYTE7(v27[1]) == 1)
          {
            int v24 = DWORD2(v27[1]);
            if (DWORD2(v27[1]) == DWORD1(v28))
            {
              uint64_t v23 = 0;
              *a5 = *(void *)((char *)v27 + 12);
              *a6 = v24;
              return v23;
            }
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v23 = 4294966996;
          if (LODWORD(v27[1]))
          {
            if (reply_port[2]) {
              uint64_t v23 = 4294966996;
            }
            else {
              uint64_t v23 = LODWORD(v27[1]);
            }
          }
        }
        else
        {
          uint64_t v23 = 4294966996;
        }
      }
      else
      {
        uint64_t v23 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v23;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v23;
}

uint64_t io_service_get_state(unsigned int a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB2800000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_matching_services_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  int v13 = 0;
  *(void *)&v6.msgh_bits = 0x3880001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2900000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_service_match_property_table_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2A00000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_object_get_superclass(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB2C00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_object_get_bundle_identifier(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB2D00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_connect_unmap_memory_from_task(unsigned int a1, int a2, int a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v8 = 1;
  int v9 = a3;
  uint64_t v10 = 0x13000000000000;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a2;
  uint64_t v13 = a4;
  *(void *)&v7.msgh_bits = 0x3C80001513;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB3000000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy(&v7);
  }
  return v5;
}

uint64_t io_service_add_notification(unsigned int a1, const char *a2, const char *a3, int a4, const void *a5, unsigned int a6, _DWORD *a7)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  memset(v28, 0, 448);
  long long v26 = 0u;
  long long v27 = 0u;
  memset(&reply_port, 0, sizeof(reply_port));
  int v24 = 1;
  int v25 = a4;
  DWORD1(v26) = 1310720;
  *((void *)&v26 + 1) = *MEMORY[0x1E4F14068];
  uint64_t v12 = MEMORY[0x1E4F149B0];
  if (MEMORY[0x1E4F149B0]) {
    int v13 = mig_strncpy_zerofill((char *)&v27 + 8, a2, 128);
  }
  else {
    int v13 = mig_strncpy((char *)&v27 + 8, a2, 128);
  }
  LODWORD(v27) = 0;
  DWORD1(v27) = v13;
  uint64_t v14 = (v13 + 3) & 0xFFFFFFFC;
  uint64_t v15 = (char *)&reply_port + v14 - 128;
  uint64_t v16 = (char *)v28 + v14;
  if (v12) {
    int v17 = mig_strncpy_zerofill(v16, a3, 512);
  }
  else {
    int v17 = mig_strncpy(v16, a3, 512);
  }
  *((_DWORD *)v15 + 46) = 0;
  *((_DWORD *)v15 + 47) = v17;
  if (a6 > 8) {
    return 4294966989;
  }
  uint64_t v19 = (v17 + 3) & 0xFFFFFFFC;
  memcpy(&v15[v19 + 196], a5, 8 * a6);
  *(_DWORD *)&v15[v19 + 192] = a6;
  mach_port_t v20 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.msgh_size = v14 + 8 * a6 + v19 + 68;
  *(void *)&reply_port.msgh_remote_port = __PAIR64__(v20, a1);
  *(void *)&reply_port.msgh_voucher_port = 0xB3400000000;
  uint64_t v21 = mach_msg2_internal();
  uint64_t v18 = v21;
  if ((v21 - 268435458) <= 0xE && ((1 << (v21 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!v21)
    {
      if (reply_port.msgh_id == 71)
      {
        uint64_t v18 = 4294966988;
      }
      else if (reply_port.msgh_id == 2968)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v18 = 4294966996;
          if (v24 == 1 && reply_port.msgh_size == 40 && !reply_port.msgh_remote_port && WORD3(v26) << 16 == 1114112)
          {
            uint64_t v18 = 0;
            *a7 = v25;
            return v18;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          uint64_t v18 = 4294966996;
          if (v26)
          {
            if (reply_port.msgh_remote_port) {
              uint64_t v18 = 4294966996;
            }
            else {
              uint64_t v18 = v26;
            }
          }
        }
        else
        {
          uint64_t v18 = 4294966996;
        }
      }
      else
      {
        uint64_t v18 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v18;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v18;
}

uint64_t io_service_add_notification_ool(unsigned int a1, const char *a2, uint64_t a3, int a4, int a5, const void *a6, unsigned int a7, _DWORD *a8, _DWORD *a9)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  memset(v30, 0, sizeof(v30));
  memset(&reply_port, 0, sizeof(reply_port));
  int v24 = 2;
  uint64_t v25 = a3;
  int v26 = 0x1000000;
  int v27 = a4;
  int v28 = a5;
  DWORD1(v29) = 1310720;
  *((void *)&v29 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v14 = mig_strncpy_zerofill((char *)v30 + 8, a2, 128);
  }
  else {
    int v14 = mig_strncpy((char *)v30 + 8, a2, 128);
  }
  LODWORD(v30[0]) = 0;
  DWORD1(v30[0]) = v14;
  uint64_t v15 = (v14 + 3) & 0xFFFFFFFC;
  uint64_t v16 = (char *)&reply_port + v15;
  *(_DWORD *)((char *)v30 + v15 + 8) = a4;
  if (a7 > 8) {
    return 4294966989;
  }
  uint64_t v18 = v16 - 128;
  memcpy(v16 + 80, a6, 8 * a7);
  *((_DWORD *)v18 + 51) = a7;
  mach_port_t v19 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.msgh_size = v15 + 8 * a7 + 80;
  *(void *)&reply_port.msgh_remote_port = __PAIR64__(v19, a1);
  *(void *)&reply_port.msgh_voucher_port = 0xB3600000000;
  uint64_t v20 = mach_msg2_internal();
  uint64_t v17 = v20;
  if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!v20)
    {
      if (reply_port.msgh_id == 71)
      {
        uint64_t v17 = 4294966988;
      }
      else if (reply_port.msgh_id == 2970)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v17 = 4294966996;
          if (v24 == 1 && reply_port.msgh_size == 52 && !reply_port.msgh_remote_port && HIWORD(v26) << 16 == 1114112)
          {
            uint64_t v17 = 0;
            int v21 = v25;
            *a8 = v29;
            *a9 = v21;
            return v17;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          uint64_t v17 = 4294966996;
          if (HIDWORD(v25))
          {
            if (reply_port.msgh_remote_port) {
              uint64_t v17 = 4294966996;
            }
            else {
              uint64_t v17 = HIDWORD(v25);
            }
          }
        }
        else
        {
          uint64_t v17 = 4294966996;
        }
      }
      else
      {
        uint64_t v17 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v17;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v17;
}

uint64_t io_service_get_matching_service(unsigned int a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 480);
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB3900000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_get_matching_service_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  int v12 = a3;
  int v13 = 0;
  *(void *)&v6.msgh_bits = 0x3880001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB3A00000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_service_get_authorization_id(unsigned int a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v9 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3B00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_set_authorization_id(unsigned int a1, uint64_t a2)
{
  int v9 = 0;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  uint64_t v8 = a2;
  *(void *)&v6.msgh_bits = 0x2800001513;
  *(void *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB3C00000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_get_properties_bin(unsigned int a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3E00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_property_bin(unsigned int a1, const char *a2, const char *a3, int a4, void *a5, _DWORD *a6)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  memset(v27, 0, sizeof(v27));
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  *((void *)&v27[0] + 1) = *MEMORY[0x1E4F14068];
  uint64_t v11 = MEMORY[0x1E4F149B0];
  if (MEMORY[0x1E4F149B0]) {
    int v12 = mig_strncpy_zerofill((char *)&v27[1] + 8, a2, 128);
  }
  else {
    int v12 = mig_strncpy((char *)&v27[1] + 8, a2, 128);
  }
  LODWORD(v27[1]) = 0;
  DWORD1(v27[1]) = v12;
  uint64_t v13 = (v12 + 3) & 0xFFFFFFFC;
  int v14 = v13 + 52;
  uint64_t v15 = (char *)reply_port + v13;
  uint64_t v16 = v15 - 128;
  uint64_t v17 = v15 + 48;
  if (v11) {
    int v18 = mig_strncpy_zerofill(v17, a3, 128);
  }
  else {
    int v18 = mig_strncpy(v17, a3, 128);
  }
  *((_DWORD *)v16 + 42) = 0;
  *((_DWORD *)v16 + 43) = v18;
  uint64_t v19 = (v18 + 3) & 0xFFFFFFFC;
  mach_port_t v20 = v14 + v19;
  *(_DWORD *)&v16[v19 + 176] = a4;
  mach_port_t v21 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v20;
  *(void *)&reply_port[2] = __PAIR64__(v21, a1);
  *(void *)&v27[0] = 0xB3F00000000;
  uint64_t v22 = mach_msg2_internal();
  uint64_t v23 = v22;
  if ((v22 - 268435458) <= 0xE && ((1 << (v22 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!v22)
    {
      if (DWORD1(v27[0]) == 71)
      {
        uint64_t v23 = 4294966988;
      }
      else if (DWORD1(v27[0]) == 2979)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v23 = 4294966996;
          if (DWORD2(v27[0]) == 1 && reply_port[1] == 56 && !reply_port[2] && BYTE7(v27[1]) == 1)
          {
            int v24 = DWORD2(v27[1]);
            if (DWORD2(v27[1]) == DWORD1(v28))
            {
              uint64_t v23 = 0;
              *a5 = *(void *)((char *)v27 + 12);
              *a6 = v24;
              return v23;
            }
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v23 = 4294966996;
          if (LODWORD(v27[1]))
          {
            if (reply_port[2]) {
              uint64_t v23 = 4294966996;
            }
            else {
              uint64_t v23 = LODWORD(v27[1]);
            }
          }
        }
        else
        {
          uint64_t v23 = 4294966996;
        }
      }
      else
      {
        uint64_t v23 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v23;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v23;
}

uint64_t io_service_match_property_table_bin()
{
  unsigned int v0 = MEMORY[0x1F4188790]();
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (v1 > 0x1000) {
    return 4294966989;
  }
  unsigned int v3 = v1;
  unsigned int v4 = v0;
  __memcpy_chk();
  LODWORD(v9) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 36;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), v4);
  *(void *)&long long v8 = 0xB4200000000;
  uint64_t v5 = mach_msg2_internal();
  uint64_t v2 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v5)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v2 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_path_ool()
{
  unsigned int v1 = MEMORY[0x1F4188790]();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, 480);
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v7 = 0u;
  *((void *)&v7 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v2 = mig_strncpy_zerofill((char *)v8 + 8, v0, 128);
  }
  else {
    int v2 = mig_strncpy((char *)v8 + 8, v0, 128);
  }
  LODWORD(v8[0]) = 0;
  DWORD1(v8[0]) = v2;
  reply_port[0] = 5395;
  reply_port[1] = ((v2 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), v1);
  *(void *)&long long v7 = 0xB4500000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v4;
}

uint64_t io_registry_entry_from_path_ool()
{
  unsigned int v0 = MEMORY[0x1F4188790]();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unsigned int v7 = v6;
  unsigned int v8 = v0;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  *(_OWORD *)&v22[8] = 0u;
  memset(&reply_port, 0, sizeof(reply_port));
  int v19 = 1;
  uint64_t v20 = v9;
  int v21 = 0x1000000;
  *(void *)long long v22 = v6;
  *(void *)&v22[4] = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v10 = mig_strncpy_zerofill(&v22[20], v1, 4096);
  }
  else {
    int v10 = mig_strncpy(&v22[20], v1, 4096);
  }
  *(_DWORD *)&v22[12] = 0;
  *(_DWORD *)&v22[16] = v10;
  uint64_t v11 = (v10 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v12 = v11 + 64;
  *(_DWORD *)&v22[v11 + 20] = v7;
  mach_port_t v13 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.msgh_size = v12;
  *(void *)&reply_port.msgh_remote_port = __PAIR64__(v13, v8);
  *(void *)&reply_port.msgh_voucher_port = 0xB4600000000;
  uint64_t v14 = mach_msg2_internal();
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!v14)
    {
      if (reply_port.msgh_id == 71)
      {
        uint64_t v15 = 4294966988;
      }
      else if (reply_port.msgh_id == 2986)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996;
          if (v19 == 1 && reply_port.msgh_size == 52 && !reply_port.msgh_remote_port && HIWORD(v21) << 16 == 1114112)
          {
            uint64_t v15 = 0;
            int v16 = v20;
            *uint64_t v5 = *(_DWORD *)&v22[8];
            *uint64_t v3 = v16;
            return v15;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          uint64_t v15 = 4294966996;
          if (HIDWORD(v20))
          {
            if (reply_port.msgh_remote_port) {
              uint64_t v15 = 4294966996;
            }
            else {
              uint64_t v15 = HIDWORD(v20);
            }
          }
        }
        else
        {
          uint64_t v15 = 4294966996;
        }
      }
      else
      {
        uint64_t v15 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v15;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v15;
}

uint64_t io_device_tree_entry_exists_with_name(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB4700000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_wait_quiet_with_options(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1E4F14068];
  uint64_t v9 = a2;
  int v10 = a3;
  *(void *)&v7.msgh_bits = 0x2C00001513;
  *(void *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB4A00000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
    }
    else
    {
      uint64_t v4 = 4294966995;
      mach_msg_destroy(&v7);
    }
  }
  else
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  return v4;
}

uint64_t DisplayID::checksum(DisplayID *this, unint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = 0;
    unsigned __int8 v3 = 0;
    do
      v3 += *((unsigned char *)this + v2++);
    while (a2 > v2);
  }
  else
  {
    return 0;
  }
  return v3;
}

BOOL IOAVRecoverableError(int a1)
{
  return a1 != -536870208 && a1 != -536870173 && a1 != 0;
}

const char *IOAVCommandString(int a1)
{
  if ((a1 - 1) > 0x11) {
    return "Unknown";
  }
  else {
    return off_1E548B610[a1 - 1];
  }
}

const char *IOAVEventLogEventTypeString(unsigned int a1)
{
  if (a1 > 9) {
    return "Unknown";
  }
  else {
    return off_1E548B6A0[a1];
  }
}

const char *IOAVAudioFormatString(unsigned int a1)
{
  if (a1 > 0x14) {
    return "Unknown";
  }
  else {
    return off_1E548B6F0[a1];
  }
}

uint64_t IOAVAudioSampleSizeEnum(int a1)
{
  if (a1 == 20) {
    int v1 = 2;
  }
  else {
    int v1 = 0;
  }
  if (a1 == 24) {
    unsigned int v2 = 3;
  }
  else {
    unsigned int v2 = v1;
  }
  if (a1 == 16) {
    return 1;
  }
  else {
    return v2;
  }
}

uint64_t IOAVAudioSampleSizeScalar(int a1)
{
  if ((a1 - 1) >= 3) {
    return 0;
  }
  else {
    return (4 * (a1 - 1) + 16);
  }
}

uint64_t IOAVAudioSampleRateEnum(int a1)
{
  if (a1 > 255999)
  {
    if (a1 <= 705599)
    {
      if (a1 > 383999)
      {
        if (a1 == 384000) {
          return 12;
        }
        if (a1 == 512000) {
          return 13;
        }
      }
      else
      {
        if (a1 == 256000) {
          return 10;
        }
        if (a1 == 352800) {
          return 11;
        }
      }
    }
    else if (a1 < 1024000)
    {
      if (a1 == 705600) {
        return 14;
      }
      if (a1 == 768000) {
        return 15;
      }
    }
    else
    {
      switch(a1)
      {
        case 1024000:
          return 16;
        case 1411200:
          return 17;
        case 1536000:
          return 18;
      }
    }
  }
  else if (a1 <= 88199)
  {
    if (a1 > 47999)
    {
      if (a1 == 48000) {
        return 3;
      }
      if (a1 == 64000) {
        return 4;
      }
    }
    else
    {
      if (a1 == 32000) {
        return 1;
      }
      if (a1 == 44100) {
        return 2;
      }
    }
  }
  else if (a1 <= 127999)
  {
    if (a1 == 88200) {
      return 5;
    }
    if (a1 == 96000) {
      return 6;
    }
  }
  else
  {
    switch(a1)
    {
      case 128000:
        return 7;
      case 176400:
        return 8;
      case 192000:
        return 9;
    }
  }
  return 0;
}

uint64_t IOAVAudioSampleRateScalar(unsigned int a1)
{
  if (a1 > 0x12) {
    return 0;
  }
  else {
    return IOAVAudioSampleRateScalar::s_scalar_rates[a1];
  }
}

uint64_t IOAVAudioLinkSampleRateForFormat(int a1, unsigned int a2)
{
  if ((a1 - 16) >= 5)
  {
    if ((a1 - 13) <= 2) {
      return 4 * a2;
    }
    else {
      return a2;
    }
  }
  else
  {
    uint64_t v2 = (int)IOAVAudioSampleRateEnum(a2) - 2;
    if (v2 > 7) {
      return 0;
    }
    else {
      return dword_18B51A304[v2];
    }
  }
}

uint64_t IOAVHDMIAudioClockRegenerationDataForLink(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = IOAVAudioSampleRateEnum(*(_DWORD *)(a2 + 12));
  unsigned int v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    int v5 = *(_DWORD *)(a1 + 72);
    unint64_t v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5) {
      LODWORD(v6) = v6 / (v5 + 1);
    }
    unsigned int v4 = v6 >> (*(unsigned char *)(a1 + 40) & 1);
  }
  uint64_t v7 = 0;
  uint64_t v8 = (char *)&IOAVHDMIAudioClockRegenerationDataForLink::s_acr_table + 16 * v3;
  while (*(_DWORD *)(a1 + 8) != IOAVHDMIAudioClockRegenerationDataForLink::s_depth_table[v7])
  {
    ++v7;
    v8 += 4320;
    if (v7 == 4) {
      return 0;
    }
  }
  if ((v7 & 0xFFFFFFFC) != 0) {
    return 0;
  }
  for (uint64_t i = 0; i != 14; ++i)
  {
    if (v4 == IOAVHDMIAudioClockRegenerationDataForLink::s_pixel_clock_table[i]) {
      break;
    }
  }
  return *(void *)&v8[288 * i - 16];
}

uint64_t IOAVVideoTimingGetPixelClock(_DWORD *a1, unsigned int *a2)
{
  uint64_t result = a1[17];
  if (result)
  {
    if (!a2) {
      return result;
    }
    goto LABEL_3;
  }
  int v4 = *a1 & 1;
  int v5 = a1[8];
  unint64_t v6 = (a1[9] * (unint64_t)a1[1] * (int)a1[14]) >> 16;
  if (v5) {
    LODWORD(v6) = v6 / (v5 + 1);
  }
  uint64_t result = v6 >> v4;
  if (a2) {
LABEL_3:
  }
    *a2 = result / 0xC8;
  return result;
}

const char *IOAVAudioSpeakerString(unsigned int a1)
{
  if (a1 > 0x11) {
    return "Unknown";
  }
  else {
    return off_1E548B798[a1];
  }
}

uint64_t IOAVAudioGetSpeakerAllocationMask(unsigned int a1)
{
  if (a1 > 0x31) {
    return 0;
  }
  else {
    return IOAVAudioGetSpeakerAllocationMask::sSpeakerAllocations[a1];
  }
}

__n128 IOAVAudioGetChannelLayoutData(unsigned int a1, __n128 *a2)
{
  if (a1 <= 0x31)
  {
    uint64_t v2 = (__n128 *)((char *)&IOAVAudioGetChannelLayoutData::sChannelMap + 40 * a1);
    *a2 = *v2;
    __n128 result = v2[1];
    a2[1] = result;
    a2[2].n128_u64[0] = v2[2].n128_u64[0];
  }
  return result;
}

uint64_t IOAVAudioGetChannelAllocationDefault(int a1)
{
  if ((a1 - 9) >= 0xFFFFFFF9) {
    return dword_18B51177C[a1 - 2];
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t IOAVAudioGetChannelAllocation(void *__s2)
{
  uint64_t v2 = 0;
  for (uint64_t i = &IOAVAudioGetChannelLayoutData::sChannelMap; ; uint64_t i = (long long *)((char *)i + 40))
  {
    long long v4 = i[1];
    v6[0] = *i;
    v6[1] = v4;
    uint64_t v7 = *((void *)i + 4);
    if (!memcmp(v6, __s2, 0x28uLL)) {
      break;
    }
    if (++v2 == 50) {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t IOAVAudioLinkGetBitRate(_DWORD *a1)
{
  return (a1[2] * a1[3] * a1[1]);
}

uint64_t IOAVAudioLinkIsIEC61937(_DWORD *a1)
{
  return (*a1 < 0x15u) & (0x1FF5FCu >> *a1);
}

uint64_t IOAVAudioLinkGetHDMIAudioPacketType(int *a1)
{
  int v1 = *a1;
  BOOL v2 = *a1 > 0x14 || ((1 << *a1) & 0x1FF5FC) == 0;
  if (!v2 && (a1[2] * a1[3] * a1[1]) > 0x5DC000) {
    return 1;
  }
  if (v1 == 9) {
    return 3;
  }
  return 4 * (v1 == 11);
}

uint64_t IOAVAudioLinkGetMaxStreamChannelCount(int *a1)
{
  int v1 = *a1;
  if ((*a1 - 13) < 8) {
    return 8;
  }
  if (v1 == 1) {
    return a1[1];
  }
  if (v1 == 2) {
    return 6;
  }
  return 0;
}

uint64_t IOAVAudioLinkGetMaxStreamSampleRate(_DWORD *a1)
{
  unsigned int v1 = a1[3];
  if ((*a1 - 13) >= 8) {
    return v1;
  }
  else {
    return v1 >> 2;
  }
}

const char *IOAVVideoAspectRatioString(int a1)
{
  if ((a1 - 1) > 0x10) {
    return "Unknown";
  }
  else {
    return off_1E548B828[a1 - 1];
  }
}

const char *IOAVVideoLinkModeString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_1E548B8B0[(char)a1];
  }
}

uint64_t IOAVVideoColorBitDepth(int a1)
{
  if ((a1 - 6) > 0xA) {
    return 1;
  }
  else {
    return dword_18B51A324[a1 - 6];
  }
}

uint64_t IOAVVideoColorBitDepthScalar(unsigned int a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return dword_18B51A350[a1];
  }
}

uint64_t IOAVVideoColorBitDepthMinimumForEOTF(int a1)
{
  return 2 * ((a1 & 0xFFFFFFFE) == 2);
}

BOOL IOAVVideoColorBitDepthIsSupported(unsigned int a1, int a2)
{
  BOOL v2 = a1 < 6;
  if (a2 != 1) {
    BOOL v2 = 0;
  }
  if (a2) {
    return v2;
  }
  else {
    return a1 < 5;
  }
}

const char *IOAVVideoAxisString(int a1)
{
  unsigned int v1 = "Unknown";
  if (a1 == 1) {
    unsigned int v1 = "Vertical";
  }
  if (a1) {
    return v1;
  }
  else {
    return "Horizontal";
  }
}

const char *IOAVVideoPixelEncodingString(unsigned int a1)
{
  if (a1 > 0xE) {
    return "Unknown";
  }
  else {
    return off_1E548B8D0[a1];
  }
}

const char *IOAVVideoColorDynamicRangeString(int a1)
{
  unsigned int v1 = "Unknown";
  if (a1 == 1) {
    unsigned int v1 = "Limited";
  }
  if (a1) {
    return v1;
  }
  else {
    return "Full";
  }
}

const char *IOAVVideoColorEOTFString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_1E548B948[a1];
  }
}

const char *IOAVVideoColorimetryString(unsigned int a1)
{
  if (a1 > 0x10) {
    return "Unknown";
  }
  else {
    return off_1E548B968[a1];
  }
}

BOOL IOAVVideoColorimetryIsValid(unsigned int a1, int a2, int a3)
{
  if (a1 <= 9 && ((1 << a1) & 0x2C0) != 0 && a3 < 2) {
    return 0;
  }
  switch(a2)
  {
    case 0:
      BOOL v4 = a1 - 9 >= 8;
      return !v4;
    case 1:
    case 2:
    case 3:
    case 6:
    case 7:
      BOOL v4 = a1 >= 8;
      return !v4;
    case 4:
    case 5:
      if (a1 >= 0xF) {
        return 0;
      }
      else {
        return (0x4102u >> a1) & 1;
      }
    case 8:
    case 9:
    case 10:
    case 11:
      BOOL v6 = a1 == 7;
      goto LABEL_18;
    case 12:
      BOOL v6 = a1 == 9;
LABEL_18:
      BOOL result = v6;
      break;
    default:
      return 0;
  }
  return result;
}

const char *IOAVLocationString(int a1)
{
  unsigned int v1 = "Unknown";
  if (a1 == 1) {
    unsigned int v1 = "Embedded";
  }
  if (a1) {
    return v1;
  }
  else {
    return "External";
  }
}

const char *IOAVLinkTypeString(int a1)
{
  unsigned int v1 = "Unknown";
  if (!a1) {
    unsigned int v1 = "Audio";
  }
  if (a1 == 1) {
    return "Video";
  }
  else {
    return v1;
  }
}

const char *IOAVLinkSourceString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_1E548B9F0[(char)a1];
  }
}

const char *IOAVInfoFrameTypeString(char a1)
{
  unint64_t v1 = a1 ^ 0xFFFFFFFFFFFFFF80;
  if (v1 > 7) {
    return "Unknown";
  }
  else {
    return off_1E548BA18[v1];
  }
}

const char *IOAVElementTypeString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_1E548BA58[a1];
  }
}

const char *IOAVVideoTimingStandardString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_1E548BA80[a1];
  }
}

const char *IOAVVideoScanInformationString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_1E548BAA8[a1];
  }
}

const char *IOAVStandardTypeString(int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return IOAVStandardTypeString::sStrings[a1];
  }
}

const char *IOAVVideoTimingTypeString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return IOAVVideoTimingTypeString::sStrings[a1];
  }
}

const char *IOAVTransportString(unsigned int a1)
{
  if (a1 > 4) {
    return "Other";
  }
  else {
    return IOAVTransportString::sStrings[a1];
  }
}

const char *IOAVProtectionStatusString(unsigned int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return IOAVProtectionStatusString::sStrings[a1];
  }
}

const char *IOAVEncryptionStatusString(unsigned int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return IOAVEncryptionStatusString::sStrings[a1];
  }
}

const char *IOAVContentProtectionTypeString(unsigned int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return IOAVContentProtectionTypeString::sStrings[a1];
  }
}

const char *IOAVContentProtectionProtocolString(uint64_t a1)
{
  unint64_t v1 = "Unknown";
  if (HIDWORD(a1) == 2) {
    unint64_t v1 = "HDCP2";
  }
  if (HIDWORD(a1) == 1) {
    unint64_t v1 = "HDCP1";
  }
  BOOL v2 = "Unknown";
  if (a1 == 2) {
    BOOL v2 = "DPCP";
  }
  if (a1 != 1) {
    unint64_t v1 = v2;
  }
  if (a1) {
    return v1;
  }
  else {
    return "None";
  }
}

uint64_t IOAVGetVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  if (IOAVGetCEAVideoTimingData(a1, a2, a3, a4, a5)
    || (__IOAVGetStandardVideoTimingData(1, a1, a2, a3, a4, a5, 1) & 1) != 0
    || (__IOAVGetStandardVideoTimingData(3, a1, a2, a3, a4, a5, 1) & 1) != 0)
  {
    return 1;
  }

  return __IOAVGetStandardVideoTimingData(2, a1, a2, a3, a4, a5, 1);
}

BOOL IOAVGetCEAVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  unsigned int v6 = IOAVGetCEAVideoShortID(a1, a2, a3, a4);
  if (v6 <= 0x7E
    && (uint64_t v7 = &IOAVGetVideoTimingTable::sCEATimingData[5 * v6],
        *(_OWORD *)a5 = *v7,
        *(_OWORD *)(a5 + 16) = v7[1],
        *(_OWORD *)(a5 + 32) = v7[2],
        *(_OWORD *)(a5 + 48) = v7[3],
        *(_OWORD *)(a5 + 64) = v7[4],
        *(_DWORD *)(a5 + 4))
    && *(_DWORD *)(a5 + 36))
  {
    return *(_DWORD *)(a5 + 56) != 0;
  }
  else
  {
    return 0;
  }
}

uint64_t IOAVGetDMTVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  return __IOAVGetStandardVideoTimingData(1, a1, a2, a3, a4, a6, a5);
}

uint64_t IOAVGetCVTVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  return __IOAVGetStandardVideoTimingData(3, a1, a2, a3, a4, a6, a5);
}

uint64_t IOAVGetGTFVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  return __IOAVGetStandardVideoTimingData(2, a1, a2, a3, a4, a5, 1);
}

uint64_t IOAVGetVideoTimingTable(signed int a1, _DWORD *a2)
{
  if (a1 > 4)
  {
    int v2 = 0;
    uint64_t result = 0;
  }
  else
  {
    int v2 = dword_18B51A368[a1];
    uint64_t result = *((void *)&off_1E548BAC8 + a1);
  }
  *a2 = v2;
  return result;
}

uint64_t IOAVVideoTimingGetSyncRateRounded(uint64_t a1, unsigned int a2)
{
  return (*(_DWORD *)(a1 + 32 * a2 + 24) + 0x8000) & 0xFFFF0000;
}

BOOL IOAVVideoTimingIsVideoOptimized(uint64_t a1)
{
  int v1 = (*(_DWORD *)(a1 + 56) + 0x8000) % 392823;
  unsigned int v3 = v1 - 0x8000;
  BOOL v2 = v1 - 0x8000 < 0;
  unsigned int v4 = 0x8000 - v1;
  if (!v2) {
    unsigned int v4 = v3;
  }
  return v4 < 0x28F;
}

uint64_t IOAVVideoTimingVideoOptimizedDelta(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56) + 0x8000;
  unsigned int v2 = 0x8000 - v1 % 392823;
  if (v1 % 392823 - 0x8000 >= 0) {
    unsigned int v2 = v1 % 392823 - 0x8000;
  }
  int v3 = v1 % 393216;
  int v5 = v3 - 0x8000;
  BOOL v4 = v3 - 0x8000 < 0;
  unsigned int v6 = 0x8000 - v3;
  if (!v4) {
    unsigned int v6 = v5;
  }
  if (v2 >= v6) {
    return v6;
  }
  else {
    return v2;
  }
}

uint64_t IOAVGetVideoTimingDataByID(int a1, unsigned int a2, long long *a3)
{
  if (a1 == 1)
  {
    int v5 = &IOAVGetVideoTimingTable::sDMTTimingData;
    unsigned int v6 = 89;
  }
  else
  {
    if (a1 != 4) {
      return 0;
    }
    int v5 = IOAVGetVideoTimingTable::sCEATimingData;
    unsigned int v6 = 127;
  }
  if (v6 <= a2) {
    return 0;
  }
  bzero(v9, 0x50uLL);
  uint64_t v7 = &v5[5 * a2];
  uint64_t result = memcmp(v9, v7, 0x50uLL);
  if (result)
  {
    a3[1] = v7[1];
    a3[2] = v7[2];
    a3[3] = v7[3];
    a3[4] = v7[4];
    *a3 = *v7;
    return 1;
  }
  return result;
}

uint64_t __IOAVGetStandardVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7)
{
  mach_port_t v13 = &IOAVGetVideoTimingTable::sNonstandardDetailedTimingData;
  int v14 = 1;
  unsigned int v15 = 57;
  switch(a1)
  {
    case 0:
      break;
    case 1:
      mach_port_t v13 = &IOAVGetVideoTimingTable::sDMTTimingData;
      unsigned int v15 = 89;
      break;
    case 2:
      mach_port_t v13 = &IOAVGetVideoTimingTable::sGTFTimingData;
      unsigned int v15 = 50;
      break;
    case 3:
      mach_port_t v13 = &IOAVGetVideoTimingTable::sCVTTimingData;
      unsigned int v15 = 114;
      break;
    case 4:
      mach_port_t v13 = IOAVGetVideoTimingTable::sCEATimingData;
      unsigned int v15 = 127;
      break;
    default:
      unsigned int v15 = 0;
      int v14 = 0;
      mach_port_t v13 = 0;
      break;
  }
  uint64_t result = 0;
  if (a2 && a3 && a4 && a7 && v14)
  {
    unsigned int v17 = (a4 + 0x8000) & 0xFFFF0000;
    if (v15 <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v15;
    }
    while (((*(unsigned char *)v13 & 1) == 0) == a5
         || *((_DWORD *)v13 + 2) != a2
         || *((_DWORD *)v13 + 10) != a3
         || *((_DWORD *)v13 + 14) != v17
         || a7 != -1 && IOAVVideoTimingGetBlankingStyle((uint64_t)v13) != a7)
    {
      v13 += 5;
      if (!--v18) {
        return 0;
      }
    }
    long long v19 = v13[1];
    long long v20 = v13[2];
    long long v21 = v13[4];
    *(_OWORD *)(a6 + 48) = v13[3];
    long long v22 = *v13;
    *(_OWORD *)(a6 + 64) = v21;
    *(_OWORD *)(a6 + 16) = v19;
    *(_OWORD *)(a6 + 32) = v20;
    *(_OWORD *)a6 = v22;
    *(_DWORD *)(a6 + 56) = a4;
    return 1;
  }
  return result;
}

uint64_t IOAVVideoTimingGetBlankingStyle(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 28);
  int v2 = *(_DWORD *)(a1 + 60);
  if ((v1 != 0) == (v2 != 0)) {
    return 1;
  }
  unsigned int v3 = *(unsigned __int16 *)(a1 + 44);
  if (!v1)
  {
    int v5 = v3 & 0xFFF8;
    return v2 && v5 == 0;
  }
  if (v2) {
    return 0;
  }
  if (v3 < 3) {
    return 1;
  }
  if (v3 != 3 && v3 < 8) {
    return 2;
  }
  if (v3 != 8) {
    return 0;
  }
  return 3;
}

BOOL IOAVGetCEAVideoTimingDataWithShortID(unsigned int a1, int a2, uint64_t a3)
{
  if (a1 > 0x7E) {
    return 0;
  }
  unsigned int v3 = &IOAVGetVideoTimingTable::sCEATimingData[5 * a1];
  *(_OWORD *)a3 = *v3;
  *(_OWORD *)(a3 + 16) = v3[1];
  *(_OWORD *)(a3 + 32) = v3[2];
  *(_OWORD *)(a3 + 48) = v3[3];
  *(_OWORD *)(a3 + 64) = v3[4];
  if (!*(_DWORD *)(a3 + 4) || !*(_DWORD *)(a3 + 36)) {
    return 0;
  }
  int v4 = *(_DWORD *)(a3 + 56);
  BOOL result = v4 != 0;
  if (v4 && a2)
  {
    int v6 = v4 + 0x8000;
    unsigned int v7 = 0x8000 - v6 % 392823;
    if (v6 % 392823 - 0x8000 >= 0) {
      unsigned int v7 = v6 % 392823 - 0x8000;
    }
    if (v7 <= 0x28E)
    {
      *(_DWORD *)(a3 + 56) = v6 & 0xFFFF0000;
      *(_DWORD *)(a3 + 68) = ((1001 * (unint64_t)*(unsigned int *)(a3 + 68) + 500)
                            * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64;
    }
    return 1;
  }
  return result;
}

uint64_t IOAVGetCEAVideoShortID(int a1, int a2, int a3, int a4)
{
  uint64_t v4 = 0;
  long long v13 = 0u;
  long long v15 = 0u;
  memset(v16, 0, sizeof(v16));
  DWORD1(v13) = a1;
  DWORD1(v15) = a2;
  *(_DWORD *)&v16[4] = a3;
  int v12 = a4;
  uint64_t v5 = 17;
  long long v14 = 0u;
  uint64_t v6 = ((uint64_t)(a1 << 16) << 16) / (a2 << 16);
  unsigned int v7 = IOAVVideoActiveFormatAspectRatio::arRef;
  do
  {
    int v8 = *v7;
    v7 += 2;
    unsigned int v9 = v8 - v6;
    if (v8 - (int)v6 < 0) {
      unsigned int v9 = -v9;
    }
    int v10 = IOAVVideoActiveFormatAspectRatio::arRef[2 * v5] - v6;
    if (v10 < 0) {
      int v10 = v6 - IOAVVideoActiveFormatAspectRatio::arRef[2 * v5];
    }
    if (v9 < v10) {
      uint64_t v5 = v4;
    }
    ++v4;
  }
  while (v4 != 18);
  *(_DWORD *)&v16[20] = IOAVVideoActiveFormatAspectRatio::arRef[2 * v5 + 1];
  return __IOAVGetCEAVideoShortIDWithData(&v12, 1);
}

uint64_t IOAVGetCEAVideoShortIDWithData(_DWORD *a1)
{
  return __IOAVGetCEAVideoShortIDWithData(a1, 0);
}

uint64_t __IOAVGetCEAVideoShortIDWithData(_DWORD *__s2, int a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = IOAVGetVideoTimingTable::sCEATimingData;
  do
  {
    long long v6 = v5[3];
    long long v10 = v5[2];
    long long v11 = v6;
    long long v7 = v5[1];
    v9[0] = *v5;
    v9[1] = v7;
    long long v12 = v5[4];
    if (DWORD1(v9[0]) && DWORD1(v10) && DWORD2(v11))
    {
      if (a2)
      {
        if (((LODWORD(v9[0]) ^ *__s2) & 1) == 0
          && __s2[18] == DWORD2(v12)
          && __s2[2] == DWORD2(v9[0])
          && __s2[10] == DWORD2(v10)
          && ((DWORD2(v11) + 0x8000) ^ (__s2[14] + 0x8000)) < 0x10000)
        {
          return v4;
        }
      }
      else if (!memcmp(v9, __s2, 0x50uLL))
      {
        return v4;
      }
    }
    ++v4;
    v5 += 5;
  }
  while (v4 != 127);
  return 0;
}

uint64_t IOAVGetCEAVideoShortIDWithDataActive(_DWORD *a1)
{
  return __IOAVGetCEAVideoShortIDWithData(a1, 1);
}

uint64_t IOAVVideoActiveFormatAspectRatio(int a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = 17;
  unsigned int v3 = IOAVVideoActiveFormatAspectRatio::arRef;
  do
  {
    int v4 = *v3;
    v3 += 2;
    unsigned int v5 = v4 - a1;
    if (v4 - a1 < 0) {
      unsigned int v5 = -v5;
    }
    int v6 = IOAVVideoActiveFormatAspectRatio::arRef[2 * v2] - a1;
    if (v6 < 0) {
      int v6 = a1 - IOAVVideoActiveFormatAspectRatio::arRef[2 * v2];
    }
    if (v5 < v6) {
      uint64_t v2 = v1;
    }
    ++v1;
  }
  while (v1 != 18);
  return IOAVVideoActiveFormatAspectRatio::arRef[2 * v2 + 1];
}

BOOL IOAVTransportSupportsCEA(int a1)
{
  return !a1 || a1 == 3;
}

BOOL IOAVTransportSupportsRGBOnly(int a1)
{
  if (a1) {
    BOOL v1 = a1 == 3;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

uint64_t IOAVVideoTimingGetITSource(uint64_t a1)
{
  uint64_t v1 = 0;
  while (*(_DWORD *)(a1 + 40) != IOAVVideoTimingGetITSource::sITResolutions[v1 + 1]
       || *(_DWORD *)(a1 + 8) != IOAVVideoTimingGetITSource::sITResolutions[v1])
  {
    v1 += 3;
    if (v1 == 147) {
      return 0;
    }
  }
  return IOAVVideoTimingGetITSource::sITResolutions[v1 + 2];
}

BOOL IOAVEDIDIsStandard(void *a1)
{
  return *a1 == IOAVEDIDIsStandard::sEDIDStandardHeader;
}

uint64_t IOAVInfoFrameGetChecksum(unsigned char *a1)
{
  unint64_t v1 = a1[2];
  char v2 = a1[1] + *a1 + v1 + a1[3];
  return (v2 + DisplayID::checksum((DisplayID *)(a1 + 4), v1));
}

uint64_t IOAVGetSPDInfoFrame@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 11) = 0;
  *(void *)(a2 + 3) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 19) = 0;
  *(_WORD *)a2 = 387;
  *(unsigned char *)(a2 + 2) = 25;
  *(void *)(a2 + 4) = *(void *)a1;
  *(_OWORD *)(a2 + 12) = *(_OWORD *)(a1 + 8);
  *(unsigned char *)(a2 + 28) = *(_DWORD *)(a1 + 24);
  uint64_t result = DisplayID::checksum((DisplayID *)(a2 + 4), 0x19uLL);
  *(unsigned char *)(a2 + 3) = 99 - result;
  return result;
}

uint64_t IOAVVideoTimingGetActivePixelClock(_DWORD *a1)
{
  int v1 = a1[8];
  unint64_t v2 = (a1[10] * (unint64_t)a1[2] * (int)a1[14]) >> 16;
  if (v1) {
    LODWORD(v2) = v2 / (v1 + 1);
  }
  return v2 >> (*a1 & 1);
}

unint64_t IOAVVideoGetPixelClockTolerance(unsigned int a1)
{
  return a1 / 0xC8uLL;
}

uint64_t IOAVVideoColorBitsPerPixel(_DWORD *a1, unsigned int a2, const char *a3, const char *a4)
{
  int v4 = a1[1];
  uint64_t result = 24;
  switch(v4)
  {
    case 0:
    case 3:
    case 11:
    case 12:
      uint64_t result = (3 * *a1);
      break;
    case 1:
      uint64_t result = (3 * *a1) >> 1;
      break;
    case 2:
      uint64_t result = (2 * *a1);
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 13:
    case 14:
      return result;
    default:
      __IOAVAbort((const char *)0x18, a2, a3, a4);
  }
  return result;
}

void __IOAVAbort(const char *a1, unsigned int a2, const char *a3, const char *a4)
{
}

uint64_t IOAVVideoColorMinimumBitsPerPixelDSC(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 4);
  if (v1 > 0xC) {
    return 0xFFFFLL;
  }
  else {
    return word_18B51A37C[v1];
  }
}

uint64_t IOAVDSCModeForPixelEncoding(unsigned int a1)
{
  if (a1 > 0xC) {
    return 0;
  }
  else {
    return dword_18B51A398[a1];
  }
}

uint64_t IOAVDSCCapabilitiesGetMaxSlicesPerLine(uint64_t a1)
{
  if (*(_WORD *)(a1 + 10) && (uint64_t v1 = __clz(*(unsigned __int16 *)(a1 + 10)) ^ 0x1FLL, v1 <= 9)) {
    return byte_18B51A3CC[v1];
  }
  else {
    return 0;
  }
}

uint64_t IOAVDSCSlicesPerLineScalar(unsigned int a1)
{
  if (a1 > 9) {
    return 0;
  }
  else {
    return byte_18B51A3CC[(char)a1];
  }
}

uint64_t IOAVDSCCapabilitiesGetPeakPixelRateForMode(uint64_t a1, int a2)
{
  if ((a2 - 3) < 2)
  {
    unint64_t v2 = (unsigned int *)(a1 + 20);
    return *v2;
  }
  if ((a2 - 1) <= 1)
  {
    unint64_t v2 = (unsigned int *)(a1 + 16);
    return *v2;
  }
  return 0;
}

BOOL IOAVVideoLinkIsDolbyVision(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12);
  unsigned int v2 = v1 & 0xFFFFFFFE;
  unsigned int v3 = v1 - 8;
  return v2 == 4 || v3 < 5;
}

BOOL IOAVVideoPixelEncodingIsDolbyVision(int a1)
{
  return (a1 & 0xFFFFFFFE) == 4 || (a1 - 8) < 5;
}

BOOL IOAVVideoPixelEncodingIsLLDolbyVision(int a1)
{
  return (a1 - 8) < 5;
}

BOOL IOAVVideoLinkRequiresHDMIScrambling(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  return IOAVHDMICharacterRate(a1, a2, a3, a4) > 0x1443FD00;
}

unint64_t IOAVHDMICharacterRate(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    int v5 = *(_DWORD *)(a1 + 72);
    unint64_t v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5) {
      LODWORD(v6) = v6 / (v5 + 1);
    }
    unsigned int v4 = v6 >> (*(unsigned char *)(a1 + 40) & 1);
  }
  long long v7 = *(_OWORD *)(a1 + 24);
  v9[0] = *(_OWORD *)(a1 + 8);
  v9[1] = v7;
  return IOAVVideoColorBitsPerPixel(v9, a2, a3, a4) * (unint64_t)v4 / 0x18;
}

uint64_t IOAVHDMIClockRate(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  unsigned int v5 = IOAVHDMICharacterRate(a1, a2, a3, a4);
  if (v5 <= 0x1443FD00) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = 4;
  }
  if (v6 >= a2) {
    unsigned int v6 = a2;
  }
  return v5 / v6;
}

unint64_t IOAVVideoLinkBandwidth(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    int v5 = *(_DWORD *)(a1 + 72);
    unint64_t v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5) {
      LODWORD(v6) = v6 / (v5 + 1);
    }
    unsigned int v4 = v6 >> (*(unsigned char *)(a1 + 40) & 1);
  }
  long long v7 = *(_OWORD *)(a1 + 24);
  v9[0] = *(_OWORD *)(a1 + 8);
  v9[1] = v7;
  return IOAVVideoColorBitsPerPixel(v9, a2, a3, a4) * (unint64_t)v4;
}

uint64_t IOAVHDMIFRLBandwidth(unsigned int a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return qword_18B51A3D8[a1];
  }
}

uint64_t IOAVHDMIFRLBitRateScalar(unsigned int a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return qword_18B51A410[a1];
  }
}

uint64_t IOAVHDMIFRLCharacterRate(unsigned int a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return dword_18B51A448[a1];
  }
}

const char *IOAVHDMIFRLRateString(unsigned int a1)
{
  if (a1 > 6) {
    return "? Gbps (Unknown FRL rate)";
  }
  else {
    return off_1E548BAF0[a1];
  }
}

const char *IODPCommandString(int a1)
{
  if (a1 == 32) {
    return "TrainLink";
  }
  if (a1 == 33) {
    return "RetrainLink";
  }
  return IOAVCommandString(a1);
}

const char *IODPEventLogEventTypeString(unsigned int a1)
{
  if (a1 == 32) {
    return "Link Training Command";
  }
  else {
    return IOAVEventLogEventTypeString(a1);
  }
}

const char *IODPTrainingPatternName(unsigned int a1)
{
  if (a1 > 7) {
    return "Unknown";
  }
  else {
    return off_1E548BB40[a1];
  }
}

const char *IODPQualityPatternName(unsigned int a1)
{
  if (a1 > 7) {
    return "Unknown";
  }
  else {
    return off_1E548BB80[a1];
  }
}

uint64_t IODPLinkRateIsStandard(unsigned int a1)
{
  return (a1 < 0x1F) & (0x40100440u >> a1);
}

uint64_t IODPLinkRateIsUHBR(char a1)
{
  return ((a1 + 127) < 4u) & (0xBu >> ((a1 + 127) & 0xF));
}

uint64_t IODPLinkBitRateIsUHBR(uint64_t a1)
{
  BOOL v1 = a1 == 13500000000 || a1 == 20000000000;
  return a1 == 10000000000 || v1;
}

uint64_t IODPTrainingPatternLength(int a1)
{
  if ((a1 - 1) > 6) {
    return 0;
  }
  else {
    return dword_18B51A480[a1 - 1];
  }
}

uint64_t IODPLinkSymbolRate(unsigned int a1)
{
  uint64_t v1 = 27000000 * a1;
  if (a1 == 29) {
    uint64_t v1 = 799200000;
  }
  if (a1 == 21) {
    return 568800000;
  }
  else {
    return v1;
  }
}

unint64_t IODPLinkSymbolClockForLinkBitRate(unint64_t a1)
{
  if (a1 == 10000000000 || a1 == 20000000000 || a1 == 13500000000) {
    return a1 >> 5;
  }
  else {
    return a1 / 0xA;
  }
}

uint64_t IODPLinkBitRateForLinkSymbolClock(uint64_t a1)
{
  return 10 * a1;
}

uint64_t IODPLinkRateScalar(int a1)
{
  if (a1 <= 128)
  {
    if (a1 == 21) {
      return 5688000000;
    }
    if (a1 == 29) {
      return 7992000000;
    }
  }
  else
  {
    switch(a1)
    {
      case 129:
        return 10000000000;
      case 132:
        return 13500000000;
      case 130:
        return 20000000000;
    }
  }
  return 270000000 * a1;
}

uint64_t IODPLinkRateEnum(uint64_t a1)
{
  if (a1 <= 0x2540BE3FFLL)
  {
    if (a1 == 5688000000)
    {
      LOBYTE(v1) = 21;
      return v1;
    }
    if (a1 == 7992000000)
    {
      LOBYTE(v1) = 29;
      return v1;
    }
    return ((unint64_t)(((a1 / 0xAuLL + 13500000) * (unsigned __int128)0x13E254E465D72C1BuLL) >> 64) >> 21);
  }
  if (a1 == 10000000000)
  {
    LOBYTE(v1) = -127;
    return v1;
  }
  if (a1 == 13500000000)
  {
    LOBYTE(v1) = -124;
    return v1;
  }
  if (a1 != 20000000000) {
    return ((unint64_t)(((a1 / 0xAuLL + 13500000) * (unsigned __int128)0x13E254E465D72C1BuLL) >> 64) >> 21);
  }
  LOBYTE(v1) = -126;
  return v1;
}

BOOL IODPDriveSettingsEqual(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    if (*(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4))
    {
      BOOL v3 = 0;
      unsigned int v4 = (int *)(a2 + 16);
      int v5 = (int *)(a1 + 16);
      unint64_t v6 = 1;
      do
      {
        if (*(v5 - 2) != *(v4 - 2)) {
          break;
        }
        BOOL v3 = v6 >= a3;
        if (a3 == v6) {
          break;
        }
        int v8 = *v4;
        v4 += 3;
        int v7 = v8;
        int v9 = *v5;
        v5 += 3;
        ++v6;
      }
      while (v9 == v7);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 1;
  }
  return v3;
}

BOOL IODPDriveSettingsAreValid(unint64_t a1, int a2)
{
  return SHIDWORD(a1) <= 3 && a2 <= 3 && IODPDriveSettingsAreValid::sValidAdjustments[4 * HIDWORD(a1) + a2] != 0;
}

unint64_t IODPConstrainedDriveSettings(unint64_t a1, uint64_t a2)
{
  unint64_t v2 = HIDWORD(a1);
  if (SHIDWORD(a1) >= 3) {
    LODWORD(v2) = 3;
  }
  if ((int)a2 >= 3) {
    a2 = 3;
  }
  else {
    a2 = a2;
  }
  unint64_t result = (a1 | ((unint64_t)v2 << 32)) + 0x100000000;
  uint64_t v4 = 4 * v2;
  do
  {
    result -= 0x100000000;
    if (!v4) {
      break;
    }
    int v5 = IODPDriveSettingsAreValid::sValidAdjustments[a2 + v4];
    v4 -= 4;
  }
  while (!v5);
  return result;
}

uint64_t IODPConstrainDriveSettings(uint64_t result, unsigned int a2)
{
  if (a2)
  {
    uint64_t v2 = 0;
    uint64_t v3 = a2;
    do
    {
      uint64_t v4 = result + 12 * v2;
      LODWORD(v5) = *(_DWORD *)(v4 + 8);
      uint64_t v6 = HIDWORD(*(void *)v4);
      if ((int)v6 >= 3) {
        LODWORD(v6) = 3;
      }
      if ((int)v5 >= 3) {
        uint64_t v5 = 3;
      }
      else {
        uint64_t v5 = v5;
      }
      unint64_t v7 = (*(void *)v4 | ((unint64_t)v6 << 32)) + 0x100000000;
      uint64_t v8 = 4 * v6;
      do
      {
        v7 -= 0x100000000;
        if (!v8) {
          break;
        }
        int v9 = IODPDriveSettingsAreValid::sValidAdjustments[v5 + v8];
        v8 -= 4;
      }
      while (!v9);
      *(void *)uint64_t v4 = v7;
      *(_DWORD *)(v4 + 8) = v5;
      ++v2;
    }
    while (v2 != v3);
  }
  return result;
}

uint64_t IODPUnifiedDriveSettings(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    int32x2_t v3 = 0;
    uint64_t v4 = (void *)(a1 + 4);
    do
    {
      int32x2_t v5 = *(int32x2_t *)v4;
      uint64_t v4 = (void *)((char *)v4 + 12);
      int32x2_t v3 = vmax_s32(v5, v3);
      --v2;
    }
    while (v2);
  }
  else
  {
    int32x2_t v3 = 0;
  }
  if (v3.i32[0] >= 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = v3.u32[0];
  }
  if (v3.i32[1] >= 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v3.u32[1];
  }
  uint64_t result = (v6 << 32) + 0x100000000;
  uint64_t v9 = 4 * v6;
  do
  {
    result -= 0x100000000;
    if (!v9) {
      break;
    }
    int v10 = IODPDriveSettingsAreValid::sValidAdjustments[v7 + v9];
    v9 -= 4;
  }
  while (!v10);
  return result;
}

unint64_t IODPStreamClockHz(unsigned int a1, unsigned int a2, unsigned int a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = 568800000;
  uint64_t v4 = 27000000 * a1;
  if (a1 == 29) {
    uint64_t v4 = 799200000;
  }
  if (a1 != 21) {
    uint64_t v3 = v4;
  }
  return v3 * (unint64_t)a2 / a3;
}

unint64_t IODPCalculateM(unint64_t result, uint64_t a2, unsigned int a3)
{
  if (result) {
    return 10 * a2 * (unint64_t)a3 / result;
  }
  return result;
}

unint64_t IODPLinkBandwidth(unsigned int a1, unint64_t a2)
{
  if (a2 == 10000000000 || a2 == 20000000000 || a2 == 13500000000) {
    return 1568768 * a2 * a1 / 0x18C063;
  }
  else {
    return 8 * a1 * (a2 / 0xA);
  }
}

unint64_t IODPVideoBandwidth(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int PixelClock = IOAVVideoTimingGetPixelClock((_DWORD *)(a1 + 40), 0);
  if (*(_WORD *)(a1 + 1))
  {
    unsigned __int16 v7 = *(_WORD *)(a1 + 124);
  }
  else
  {
    long long v6 = *(_OWORD *)(a1 + 24);
    v9[0] = *(_OWORD *)(a1 + 8);
    v9[1] = v6;
    unsigned __int16 v7 = 16 * IOAVVideoColorBitsPerPixel(v9, v2, v3, v4);
  }
  return (v7 * (unint64_t)PixelClock + 15) >> 4;
}

unint64_t IODPLinkRateRequiredForVideoBandwidth(uint64_t a1, unsigned int a2)
{
  return (a2 - 1 + 10 * ((unint64_t)(a1 + 7) >> 3)) / a2;
}

uint64_t IODPVideoLinkMainStreamAttributeData@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, char a4@<W3>, int a5@<W4>, BOOL *a6@<X5>, uint64_t a7@<X8>)
{
  unsigned int v14 = 0;
  int v15 = *(unsigned __int8 *)(a1 + 8);
  *a6 = 0;
  switch(*(_DWORD *)(a1 + 12))
  {
    case 0:
    case 0xC:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0xA:
        case 0x10:
          unsigned int v14 = 2 * (*(_DWORD *)(a1 + 16) == 1);
          break;
        case 0xB:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 13;
          break;
        case 0xC:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 12;
          break;
        case 0xD:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 3;
          break;
        case 0xE:
        case 0xF:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 14;
          break;
        default:
          goto LABEL_9;
      }
      break;
    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          unsigned int v14 = 6;
          break;
        case 1:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          unsigned int v14 = 7;
          break;
        case 2:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 4;
          break;
        case 3:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 5;
          break;
        default:
          goto LABEL_9;
      }
      break;
    case 3:
    case 0xB:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          unsigned int v14 = 10;
          break;
        case 1:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          unsigned int v14 = 11;
          break;
        case 2:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 8;
          break;
        case 3:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          unsigned int v14 = 9;
          break;
        default:
LABEL_9:
          unsigned int v14 = 0;
          *a6 = 1;
          break;
      }
      break;
    case 5:
    case 7:
    case 0xA:
      unsigned int v14 = 0;
      int v15 = 8;
      break;
    default:
      break;
  }
  uint64_t result = IOAVVideoColorBitDepth(v15);
  int v17 = *(_DWORD *)(a1 + 40);
  __int16 v18 = (v17 & 1) != 0 && (*(unsigned char *)(a1 + 76) & 1) == 0;
  char v19 = v17 & 1;
  if (a5 && *a6) {
    v18 |= 0x40u;
  }
  *(int8x8_t *)a7 = vbsl_s8((int8x8_t)0xFF000000FF000000, *(int8x8_t *)a7, (int8x8_t)__PAIR64__(a3, a2));
  unint64_t v20 = *(unsigned __int16 *)(a1 + 44) | (*(_DWORD *)(a1 + 76) >> v19 << 16) | ((unint64_t)(unsigned __int16)*(_DWORD *)(a1 + 56) << 32) | ((unint64_t)*(unsigned __int16 *)(a1 + 88) << 48);
  unint64_t v21 = (*(_DWORD *)(a1 + 68) == 0) | ((unint64_t)*(unsigned int *)(a7 + 22) << 48) | (2
                                                                                            * (*(_DWORD *)(a1 + 52) & 0x7FFFLL)) | ((unint64_t)(*(_DWORD *)(a1 + 100) == 0) << 16) | ((unint64_t)(*(_DWORD *)(a1 + 84) & 0x7FFF) << 17) | ((unint64_t)*(unsigned int *)(a1 + 48) << 32);
  unsigned __int16 v22 = *(_WORD *)(a1 + 80);
  *(_WORD *)(a7 + 24) = (v14 >> 1) & 6 | a4 & 0xE7 | (8 * ((v14 & 2) != 0)) & 0xEF | (16 * (v14 & 1)) | (32 * result) | (v18 << 8);
  *(void *)(a7 + 8) = v20;
  *(void *)(a7 + 16) = v21 & 0xFFFFFFFFFFFFLL | ((unint64_t)v22 << 48);
  return result;
}

__n128 IODPInfoFrameSDP@<Q0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *(unsigned char *)a2 | 0x80;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(unsigned char *)(a3 + 1) = v3;
  *(unsigned char *)(a3 + 3) = 4 * a1;
  *(_DWORD *)(a3 + 32) = 0;
  if (a1 >= 19) {
    char v4 = 29;
  }
  else {
    char v4 = 27;
  }
  *(unsigned char *)(a3 + 2) = v4;
  if (a1 == 19)
  {
    *(_WORD *)(a3 + 4) = *(_WORD *)(a2 + 1);
    uint64_t v5 = a3 + 6;
  }
  else
  {
    uint64_t v5 = a3 + 4;
  }
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a2 + 4);
  __n128 result = *(__n128 *)(a2 + 16);
  *(__n128 *)(v5 + 12) = result;
  return result;
}

_DWORD *IODPVideoLinkVideoStreamConfigurationSDP@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 20) = 0u;
  *(_OWORD *)(a2 + 4) = 0u;
  int v3 = result[3];
  int v2 = result[4];
  *(_DWORD *)a2 = 319096576;
  int v4 = result[2];
  int v5 = 0;
  char v6 = -127;
  char v7 = 1;
  switch(v3)
  {
    case 0:
    case 12:
      switch(result[5])
      {
        case 9:
          char v8 = 6;
          goto LABEL_33;
        case 0xA:
          goto LABEL_34;
        case 0xB:
          char v8 = 2;
          goto LABEL_33;
        case 0xC:
          char v8 = 1;
          goto LABEL_33;
        case 0xD:
          char v8 = 3;
          goto LABEL_33;
        case 0xE:
        case 0xF:
          char v8 = 4;
          goto LABEL_33;
        default:
          char v8 = 5;
          goto LABEL_33;
      }
    case 1:
      *(unsigned char *)(a2 + 20) = 48;
      switch(result[5])
      {
        case 1:
          char v8 = 49;
          goto LABEL_33;
        case 2:
          char v8 = 50;
          goto LABEL_33;
        case 3:
          char v8 = 51;
          goto LABEL_33;
        case 4:
          char v8 = 52;
          goto LABEL_33;
        case 5:
          char v8 = 53;
          goto LABEL_33;
        case 6:
          char v8 = 54;
          goto LABEL_33;
        case 7:
          char v8 = 55;
          goto LABEL_33;
        default:
          goto LABEL_34;
      }
    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
    case 13:
    case 14:
      *(unsigned char *)(a2 + 20) = 32;
      switch(result[5])
      {
        case 1:
          char v8 = 33;
          goto LABEL_33;
        case 2:
          char v8 = 34;
          goto LABEL_33;
        case 3:
          char v8 = 35;
          goto LABEL_33;
        case 4:
          char v8 = 36;
          goto LABEL_33;
        case 5:
          char v8 = 37;
          goto LABEL_33;
        case 6:
          char v8 = 38;
          goto LABEL_33;
        case 7:
          char v8 = 39;
          goto LABEL_33;
        default:
          goto LABEL_34;
      }
    case 3:
    case 11:
      *(unsigned char *)(a2 + 20) = 16;
      switch(result[5])
      {
        case 1:
          char v8 = 17;
          goto LABEL_33;
        case 2:
          char v8 = 18;
          goto LABEL_33;
        case 3:
          char v8 = 19;
          goto LABEL_33;
        case 4:
          char v8 = 20;
          goto LABEL_33;
        case 5:
          char v8 = 21;
          goto LABEL_33;
        case 6:
          char v8 = 22;
          goto LABEL_33;
        case 7:
          char v8 = 23;
LABEL_33:
          *(unsigned char *)(a2 + 20) = v8;
          break;
        default:
          goto LABEL_34;
      }
      break;
    case 5:
    case 7:
    case 10:
LABEL_40:
      *(unsigned char *)(a2 + 21) = v7;
      char v10 = v6;
      int v2 = v5;
LABEL_41:
      if (v2 == 1) {
        *(unsigned char *)(a2 + 21) = v10;
      }
      return result;
    default:
      break;
  }
LABEL_34:
  int v9 = v4;
  char v10 = 0x80;
  int v11 = v9 - 8;
  char v6 = -127;
  char v7 = 1;
  int v5 = v2;
  switch(v11)
  {
    case 0:
      goto LABEL_40;
    case 1:
      char v6 = -123;
      char v7 = 5;
      goto LABEL_39;
    case 2:
      char v6 = -126;
      char v7 = 2;
      goto LABEL_39;
    case 4:
      char v6 = -125;
      char v7 = 3;
      goto LABEL_39;
    case 8:
      char v6 = -124;
      char v7 = 4;
LABEL_39:
      int v5 = v2;
      goto LABEL_40;
    default:
      goto LABEL_41;
  }
}

uint64_t IODPCompareLinkTrainingData(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 10000000000;
  uint64_t v3 = 5688000000;
  unsigned int v4 = *(unsigned __int8 *)(a1 + 12);
  if (v4 <= 0x80)
  {
    uint64_t v5 = 5688000000;
    if (v4 == 21) {
      goto LABEL_11;
    }
    if (v4 == 29)
    {
      uint64_t v5 = 7992000000;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v5 = 10000000000;
    switch(v4)
    {
      case 0x81u:
        goto LABEL_11;
      case 0x84u:
        uint64_t v5 = 13500000000;
        goto LABEL_11;
      case 0x82u:
        uint64_t v5 = 20000000000;
        goto LABEL_11;
    }
  }
  uint64_t v5 = 270000000 * *(unsigned __int8 *)(a1 + 12);
LABEL_11:
  unsigned int v6 = *(unsigned __int8 *)(a2 + 12);
  if (v6 > 0x80)
  {
    switch(v6)
    {
      case 0x81u:
        goto LABEL_22;
      case 0x84u:
        uint64_t v2 = 13500000000;
        goto LABEL_22;
      case 0x82u:
        uint64_t v2 = 20000000000;
        goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (v6 != 21)
  {
    if (v6 != 29)
    {
LABEL_20:
      uint64_t v3 = 270000000 * *(unsigned __int8 *)(a2 + 12);
      goto LABEL_21;
    }
    uint64_t v3 = 7992000000;
  }
LABEL_21:
  uint64_t v2 = v3;
LABEL_22:
  unint64_t v7 = v5 * *(unsigned int *)(a1 + 8);
  unint64_t v8 = v2 * *(unsigned int *)(a2 + 8);
  BOOL v9 = v7 > v8;
  if (v7 >= v8) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = -1;
  }
  if (v9) {
    return 1;
  }
  else {
    return v10;
  }
}

const char *IODPDeviceTypeString(unsigned int a1)
{
  if (a1 > 2) {
    return "Sink";
  }
  else {
    return IODPDeviceTypeString::sStrings[a1];
  }
}

BOOL IODPAudioCodingType(_DWORD *a1)
{
  return IOAVAudioLinkIsIEC61937(a1) && (unint64_t)IOAVAudioLinkGetBitRate(a1) > 0x5DC000;
}

void getTagString_cold_1()
{
}

void IOCFSerialize_cold_1()
{
}

void IOCFSerialize_cold_2()
{
}

void IOCFSerialize_cold_3()
{
}

void IOCFSerialize_cold_4()
{
}

void IOCFSerialize_cold_5()
{
}

void IOCFSerialize_cold_6()
{
}

void IOCFSerialize_cold_7()
{
}

void IOCFSerialize_cold_8()
{
}

void IOCFSerialize_cold_9()
{
}

void DoIdrefScan_cold_1()
{
}

void DoCFSerialize_cold_1()
{
}

void IOCFUnserializeBinary_cold_1()
{
}

void addStartTag_cold_1()
{
}

void IONotificationPortSetImportanceReceiver_cold_1()
{
  __assert_rtn("IONotificationPortSetImportanceReceiver", "IOKitLib.c", 968, "kr == KERN_SUCCESS");
}

void IOPMSetEnergyModePreference_cold_1()
{
  *(_WORD *)unsigned int v0 = 0;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create dictionary to send message\n", v0, 2u);
}

void IOHIDSessionFilterCreateWithClass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDSessionFilterCreateWithClass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDSessionFilterCreateWithClass_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDSessionFilterGetPropertyForClient_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "%@ is not serializable", (uint8_t *)&v2, 0xCu);
}

void IOHIDCopyHIDParameterFromEventSystem_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = -536870184;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Fail to get parameter with status 0x%x", (uint8_t *)v1, 8u);
}

void IOHIDSetHIDParameterToEventSystem_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "Fail to set parameter with status 0x%x", (uint8_t *)v2, 8u);
}

void IOHIDSetCursorEnable_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Set cursor enable failed:0x%x", v2, v3, v4, v5, v6);
}

void IOHIDSetCursorBounds_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Set cursor bounds failed:0x%x", v2, v3, v4, v5, v6);
}

void IOHIDSetOnScreenCursorBounds_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Set on screen cursor bounds failed:0x%x", v2, v3, v4, v5, v6);
}

void _IOHIDSetFixedMouseLocation_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_18B46C000, v0, OS_LOG_TYPE_DEBUG, "Set fixed mouse location failed:0x%x", v1, 8u);
}

void IOHIDSetStateForSelector_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "IORegistryEntrySetCFProperty Failed for kIOHIDActivityUserIdleKey with err : 0x%x", v2, v3, v4, v5, v6);
}

void IOHIDSetStateForSelector_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "IOConnectGetService Failed with err : 0x%x", v2, v3, v4, v5, v6);
}

void IOHIDSetModifierLockState_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create event system client", v2, v3, v4, v5, v6);
}

void ____loadTCCFramework_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Could not load TCC", v2, v3, v4, v5, v6);
}

void ____loadTCCFramework_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Could not find TCC symbol \"TCCAccessPreflight\"", v2, v3, v4, v5, v6);
}

void ____loadTCCFramework_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Could not find TCC symbol \"TCCAccessRequest\"", v2, v3, v4, v5, v6);
}

void ____loadTCCFramework_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Could not find TCC symbol \"TCCAccessCheckAuditToken\"", v2, v3, v4, v5, v6);
}

void IOPSCopyExternalPowerAdapterDetails_cold_1()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create connection\n", v0, 2u);
}

void IOPSCopyExternalPowerAdapterDetails_cold_2()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create message\n", v0, 2u);
}

void __IOPSCopyExternalPowerAdapterDetails_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Event handler is called %@\n", (uint8_t *)&v1, 0xCu);
}

void IOPSGaugingMitigationGetState_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPSGaugingMitigationGetState_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPSGaugingMitigationGetState_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Event handler is called %@\n", v1, v2, v3, v4, v5);
}

void __IOPSSetBatteryDateOfFirstUse_block_invoke_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Event handler is called %@\n", v0, 0xCu);
}

void getPMQueue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void getUserActiveValidDict_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPMUnregisterNotification_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendUserActivityMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendUserActivityMsg_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processUserActivityMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processUserActivityMsg_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMLogWakeProgress_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v2 = 1024;
  int v3 = v0;
  _os_log_debug_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Wake progress from %d. data: 0x%x\n", v1, 0xEu);
}

void _conveyMachPortToPowerd_cold_1(int *a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to send mach port for IOPMConnection id 0x%x. rc:0x%x\n", (uint8_t *)v3, 0xEu);
}

void __IOPMConnectionCreate_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Failed to register for reconnecting with powerd. rc:0x%x", v1, v2, v3, v4, v5);
}

void _connectionCreate_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Failed to create IOPMConnection. rc:0x%x\n", v1, v2, v3, v4, v5);
}

void _connectionCreate_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Failed to send IOPMConnection request. rc:0x%x\n", v1, v2, v3, v4, v5);
}

void copyBatteryData_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPMCopyCurrentScheduledWake_block_invoke_157_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __copyBatteryData_block_invoke_189_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDDeviceReleasePrivate_cold_1(void *a1, _OWORD *a2, unsigned int *a3)
{
}

void IOHIDDeviceCreate_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "QueryInterface(kIOHIDDeviceDeviceInterfaceID):0x%x", (uint8_t *)v2, 8u);
}

void IOHIDDeviceCreate_cold_2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "IOCreatePlugInInterfaceForService:0x%x for serviceID:%#llx", (uint8_t *)v4, 0x12u);
}

void IOHIDDeviceCreate_cold_3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "IOObjectRetain:0x%x", (uint8_t *)v2, 8u);
}

void __IOHIDDeviceSetupAsyncSupport_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDDeviceSetupAsyncSupport_cold_2(void *a1, _OWORD *a2)
{
}

void __IOHIDDeviceSetupAsyncSupport_cold_3()
{
}

void IOHIDDeviceSetCancelHandler_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDDeviceRegisterRemovalCallback_cold_1()
{
}

void _IOHIDLogCategory_cold_1()
{
}

void _IOHIDObjectRetainCount_cold_1(void *a1, _OWORD *a2)
{
}

void _IOHIDObjectRetainCount_cold_2(void *a1, _OWORD *a2)
{
}

void _IOHIDObjectRetainCount_cold_3(void *a1, _OWORD *a2)
{
}

void IOHIDManagerSetDeviceMatching_cold_1()
{
}

void __IOHIDManagerSetDeviceMatching_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification:0x%x", (uint8_t *)v2, 8u);
}

void IOHIDManagerSetDispatchQueue_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0_1();
  _os_crash_msg();
  __break(1u);
}

void IOHIDManagerSetCancelHandler_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0_1();
  _os_crash_msg();
  __break(1u);
}

void __IOHIDManagerExtRelease_cold_1(void *a1, _OWORD *a2, unsigned int *a3)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  atomic_load(a3);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void IOHIDQueueScheduleWithRunLoop_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDQueueSetupAsyncSupport_cold_1()
{
}

void IOHIDQueueSetCancelHandler_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDQueueRegisterValueAvailableCallback_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "called with a NULL callback", v1, 2u);
}

void IOHIDQueueRegisterValueAvailableCallback_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "unable to create dictionary", v1, 2u);
}

void IOHIDQueueRegisterValueAvailableCallback_cold_3()
{
}

void _IOHIDEventSetAttachment_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Unable to create event attachment storage", v1, 2u);
}

void __IOHIDEventCreateWithBytesHelper_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109632;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = 16;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Failed to create event at index=%d , eventDataSize: %u < sizeof(IOHIDEventData): %lu", (uint8_t *)v3, 0x18u);
}

void IOHIDEventGetPolicy_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "unexpected policy request %llu", (uint8_t *)&v2, 0xCu);
}

void __IOHIDEventDataAppendEventData_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = 0;
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "insufficient buffer data available, size: %ld, length: %ld", (uint8_t *)&v2, 0x16u);
}

void __IOHIDEventDataAppendEventData_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "no event->parent->eventData", v1, 2u);
}

void IOHIDConnectionFilterCreate_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "IOHIDConnectionFilterCreate failed to find symbol %@ for bundle %@", (uint8_t *)&v3, 0x16u);
}

void IOHIDConnectionFilterCreate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDConnectionFilterCreate_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDConnectionFilterCreate_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOHIDEventSystemRegister_cold_1()
{
  __assert_rtn("__IOHIDEventSystemRegister", "IOHIDEventSystem.c", 245, "kIOHIDServerConnectionRootQueue = hid_dispatch_pthread_root_queue_create(\"IOHIDEvent Server Connection - Root\", &attribute, NULL, 2)");
}

void __IOHIDEventSystemRegister_cold_2()
{
}

void IOHIDEventSystemCreate_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_18B46C000, log, OS_LOG_TYPE_FAULT, "IOHIDEventSystemCreate error", v1, 2u);
}

void IOHIDEventSystemOpen_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_18B46C000, log, OS_LOG_TYPE_FAULT, "IOHIDEventSystemOpen error", v1, 2u);
}

void IOHIDEventSystemOpen_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Failed to create server dipatch queue", v1, 2u);
}

void __IOHIDEventSystemClientInitReplyPort_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Unable to allocate client reply port", v2, v3, v4, v5, v6);
}

void __IOHIDEventSystemClientInitReplyPort_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Unable to allocate set client reply port attributes", v2, v3, v4, v5, v6);
}

void __IOHIDEventSystemClientInitReplyPort_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Unable to allocate acquire client reply port attributes", v2, v3, v4, v5, v6);
}

void __IOHIDEventSystemClientTerminationCallback_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "IOHIDEventSystemServer died. Reestablishing connection.", v2, v3, v4, v5, v6);
}

void IOHIDEventSystemClient_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "API will be deprecated soon.  Please use IOHIDEventSystemClientCreate.", v2, v3, v4, v5, v6);
}

void __IOHIDEventSystemClientRefresh_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Unable to open %#x", v2, v3, v4, v5, v6);
}

void __IOHIDEventSystemClientRefresh_cold_2(mach_error_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  mach_error_string(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_18B46C000, a2, v3, "mach_port_deallocate(server_port) %s", v4);
}

void __IOHIDEventSystemClientRefresh_cold_3()
{
  __assert_rtn("__IOHIDEventSystemClientRefresh", "IOHIDEventSystemClient.c", 579, "kern_result == KERN_SUCCESS");
}

void __IOHIDEventSystemClientRefresh_cold_4(mach_error_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  mach_error_string(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_18B46C000, a2, v3, "mach_port_deallocate(bootstrap_port) %s", v4);
}

void __IOHIDEventSystemClientRefresh_cold_5(kern_return_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_18B46C000, a2, v3, "bootstrap_look_up2 failed: %s", v4);
}

void __IOHIDEventSystemClientRefresh_cold_6(kern_return_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_18B46C000, a2, v3, "bootstrap_look_up_per_user failed: %s", v4);
}

void __IOHIDEventSystemClientRefresh_cold_7(int *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2080;
  uint64_t v6 = xpc_strerror();
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid failed: %d - %s", (uint8_t *)v4, 0x12u);
}

void __IOHIDEventSystemClientSetupAsyncSupport_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Unable to create event queue via hidd: (%08x)", v2, v3, v4, v5, v6);
}

void __IOHIDEventSystemClientSetupAsyncSupport_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Failed to register for server availability: %d", v2, v3, v4, v5, v6);
}

void __IOHIDEventSystemClientStartQueue_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "io_hideventsystem_queue_start:%#x", v2, v3, v4, v5, v6);
}

void IOHIDEventSystemClientSetDispatchQueue_cold_1()
{
}

void IOHIDEventSystemClientRegisterEventCallback_cold_1()
{
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Bad arguments", v2, v3, v4, v5, v6);
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Invalid type", v2, v3, v4, v5, v6);
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Bad matching dict", v2, v3, v4, v5, v6);
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Bad matching event", v2, v3, v4, v5, v6);
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "_IOHIDCreateBinaryData fail", v2, v3, v4, v5, v6);
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "CFDictionaryCreateMutableCopy fail", v2, v3, v4, v5, v6);
}

void IOHIDVirtualServiceClientCreateWithCallbacks_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Client must be scheduled with dispatch queue or runloop", v2, v3, v4, v5, v6);
}

void IOHIDVirtualServiceClientCreateWithCallbacks_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "io_hideventsystem_create_virtual_service :%x", v2, v3, v4, v5, v6);
}

void IOHIDVirtualServiceClientRemove_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "io_hideventsystem_remove_virtual_service:%x", v2, v3, v4, v5, v6);
}

void IOHIDVirtualServiceClientDispatchEvent_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Unable to serialize event", v2, v3, v4, v5, v6);
}

void IOHIDVirtualServiceClientDispatchEvent_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "io_hideventsystem_dispatch_event_for_virtual_service:%x", v2, v3, v4, v5, v6);
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "HIDVS (id:%llx) invalid parameters", v2, v3, v4, v5, v6);
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "HIDVS (id:%llx) client does not exist", v2, v3, v4, v5, v6);
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_3()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "Virtual service (id: %llx) does not exist", v2, v3, v4, v5, v6);
}

void _iohideventsystem_client_dispatch_virtual_service_set_property_cold_3()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "HIDVS (id:%llx) invalid property key", v2, v3, v4, v5, v6);
}

void _iohideventsystem_client_dispatch_virtual_service_set_property_cold_4()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "HIDVS (id:%llx) does not exist", v2, v3, v4, v5, v6);
}

void _iohideventsystem_output_event_to_virtual_service_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "HIDVS (id: %llx) invalid event data", v2, v3, v4, v5, v6);
}

void _iohideventsystem_output_event_to_virtual_service_cold_2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "HIDVS (id: %llx) does not exist", v2, v3, v4, v5, v6);
}

void IOHIDNotificationInvalidate_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0_1();
  _os_crash_msg();
  __break(1u);
}

void IOHIDNotificationInvalidate_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0_1();
  _os_crash_msg();
  __break(1u);
}

void __IOHIDServiceCreateAndCopyConnectionCache_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDServiceCreateAndCopyConnectionCache_cold_2(void *a1, _OWORD *a2)
{
}

void __IOHIDServiceInit_cold_1(CFNumberRef *a1, NSObject *a2)
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CFNumberGetValue(*a1, kCFNumberSInt64Type, v3);
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "[%#llx] Invalid entitlements property, expected Array or String", (uint8_t *)v3, 0xCu);
}

void __IOHIDServiceInit_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_18B46C000, v1, OS_LOG_TYPE_ERROR, "0x%llx: IOServiceAddInterestNotification 0x%x", v2, 0x12u);
}

void __IOHIDServiceInit_cold_3(void *a1, _OWORD *a2)
{
}

void __IOHIDServiceInit_cold_4(void *a1, _OWORD *a2)
{
}

void _IOHIDServiceCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDServiceCreate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDServiceCreate_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDServiceCreate_cold_4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "Unable to retain service: 0x%x", (uint8_t *)v2, 8u);
}

void _IOHIDServiceOpen_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_18B46C000, v0, OS_LOG_TYPE_ERROR, "0x%llx: Failed to open service", v1, 0xCu);
}

void __IOHIDServiceHandleCancelTimerTimeout_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_fault_impl(&dword_18B46C000, v2, OS_LOG_TYPE_FAULT, "Service plugin %@: %@ never called cancel handler for service: %@", v3, 0x20u);
}

void __IOHIDServiceHandleCancelTimerTimeout_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "Service: %@ cancellation timer timed out", (uint8_t *)&v2, 0xCu);
}

void IOHIDServiceConformsTo_cold_1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2080;
  uint64_t v4 = "DeviceUsagePairs";
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_18B46C000, v1, OS_LOG_TYPE_ERROR, "0x%llx: IOHIDService property %s incorrect type: %@", v2, 0x20u);
}

void __IOHIDServiceConformsToFunction_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  __int16 v3 = "DeviceUsagePairs";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "Entry of IOHIDService property %s incorrect type: %@", (uint8_t *)&v2, 0x16u);
}

void __IOHIDServiceQueueWillExecute_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDServiceQueueDidExecute_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDSessionCreate_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDSessionCreate_cold_2(void *a1, _OWORD *a2)
{
}

void IOHIDSessionCreate_cold_3(void *a1, _OWORD *a2)
{
}

void __IOHIDSessionCreate_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDSessionCreate_block_invoke_cold_4(void *a1, _OWORD *a2)
{
}

void __IOHIDSessionClose_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_18B46C000, log, OS_LOG_TYPE_DEBUG, "IOHIDSession close completed", v1, 2u);
}

void _IOHIDSessionCopyPropertyForClient_cold_2(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t RegistryID = IOHIDServiceGetRegistryID(a2);
  *(_DWORD *)a1 = 138412290;
  *a3 = RegistryID;
  _os_log_error_impl(&dword_18B46C000, a4, OS_LOG_TYPE_ERROR, "CopyServiceRecords deep copy failed. Service record for %@ is not serializable.", a1, 0xCu);
}

void IOHIDEventQueueCreate_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Unable to create analytics description", v1, 2u);
}

void IOHIDEventQueueCreate_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Unable to map event queue: (%08x)", v2, v3, v4, v5, v6);
}

void IOHIDEventQueueCreate_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "unable to make mach memory entry. (%08x)", v2, v3, v4, v5, v6);
}

void __IOHIDEventQueueCreatePrivate_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Unable to allocate queue object via _CFRuntimeCreateInstance", v1, 2u);
}

void IOHIDEventQueueCreateWithVM_cold_1(unsigned int a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Invalid ptr=%p size=%d.", (uint8_t *)&v3, 0x12u);
}

void IOHIDEventQueueNotify_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "IOHIDEventQueueNotify:%#x", v2, v3, v4, v5, v6);
}

void IOHIDEventQueueDequeueCopy_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDUserDeviceCreateWithOptions_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  int v2 = 134217984;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_18B46C000, v1, OS_LOG_TYPE_ERROR, "0x%llx: IOHIDResource not found", (uint8_t *)&v2, 0xCu);
}

void IOHIDUserDeviceCreateWithOptions_cold_2()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "0x%llx: __IOHIDUserDeviceStartDevice:0x%x", v2, v3);
}

void IOHIDUserDeviceCreateWithOptions_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "0x%llx: Unable to create analytics description", (uint8_t *)&v3, 0xCu);
}

void IOHIDUserDeviceCreateWithOptions_cold_4()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "0x%llx: IOServiceOpen:0x%x", v2, v3);
}

void IOHIDUserDeviceScheduleWithRunLoop_cold_1(void *a1, _OWORD *a2)
{
}

void __IOHIDUserDeviceSetupAsyncSupport_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "0x%llx: IOConnectMapMemory:0x%x", v2, v3);
}

void IOHIDUserDeviceSetCancelHandler_cold_1(void *a1, _OWORD *a2)
{
}

void IOHIDUserDeviceRegisterGetReportBlock_cold_1()
{
}

void IOHIDUserDeviceRegisterSetReportBlock_cold_1()
{
}

void IOHIDUserDeviceHandleReportWithTimeStamp_cold_1()
{
  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "0x%llx: kIOHIDResourceDeviceUserClientMethodHandleReport:%x", v2, v3);
}

void __IOMIGMachPortRelease_cold_1(mach_error_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = mach_error_string(a1);
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "__IOMIGMachPortRelease mach_port_mod_refs:%s", (uint8_t *)&v3, 0xCu);
}

void _IOHIDCreateBinaryData_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18B46C000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize CFObject: %@", (uint8_t *)&v3, 0xCu);
}

void IOHIDServiceFilterCreateWithClass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceFilterCreateWithClass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceFilterCreateWithClass_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceFilterCopyPropertyForClient_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "%@ is not serializable. result: %@", (uint8_t *)&v3, 0x16u);
}

void IOHIDServiceClientCopyDescription_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "Failed to get DeviceUsagePairs: %@", v2, v3, v4, v5, v6);
}

void IOHIDServiceClientCopyDescription_cold_2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "Invalid BatchInterval: %@", v2, v3, v4, v5, v6);
}

void IOHIDServiceClientCopyDescription_cold_3()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "Invalid SampleInterval: %@", v2, v3, v4, v5, v6);
}

void IOHIDServiceClientCopyDescription_cold_4()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "Invalid ReportInterval: %@", v2, v3, v4, v5, v6);
}

void IOHIDServiceClientCopyDescription_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceClientFastPathInit_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "IORegistryEntryIDMatching:NULL", v1, 2u);
}

void IOHIDServiceClientFastPathInit_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Can not locate kernel service", v1, 2u);
}

void IOHIDServiceClientFastPathInit_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceClientFastPathInit_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOHIDServiceClientFastPathInit_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_1(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_3_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_18B46C000, v8, v9, "%s: mach_port_deallocate(reply_port):%s", v10, v11, v12, v13, v15);
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_2(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_3_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_18B46C000, v8, v9, "%s: mach_port_deallocate(unusedNotify):%s", v10, v11, v12, v13, v15);
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_3(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_3_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_18B46C000, v8, v9, "%s: mach_port_allocate(sendPossiblePort):%s", v10, v11, v12, v13, v15);
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_4(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_3_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_18B46C000, v8, v9, "%s: mach_port_deallocate(notifyPort):%s", v10, v11, v12, v13, v15);
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_5(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_3_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_18B46C000, v8, v9, "%s: mach_port_request_notification(MACH_PORT_NULL):%s", v10, v11, v12, v13, v15);
}

void _IOHIDEventSystemConnectionCreate_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Unknown client type: %d pid:%d", (uint8_t *)v3, 0xEu);
}

void _IOHIDEventSystemConnectionCreate_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_0(&dword_18B46C000, v0, v1, "%s: %@ is missing the '%s' entitlement");
}

void _IOHIDEventSystemConnectionScheduleAsync_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "%s: Unable to create DISPATCH_SOURCE_TYPE_MACH_SEND for reply port", v2, v3, v4, v5, v6);
}

void IOHIDEventSystemConnectionDispatchEvent_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  int v1 = *(_DWORD *)(v0 + 300);
  int v4 = 136315394;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v1;
  _os_log_error_impl(&dword_18B46C000, v3, OS_LOG_TYPE_ERROR, "%s: Event enqueue dropped:%d consecutive events", (uint8_t *)&v4, 0x12u);
}

void _IOHIDEventSystemConnectionQueueStop_cold_1(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_3_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_18B46C000, v8, v9, "%s: mach_port_deallocate(oldNotify):%s", v10, v11, v12, v13, v15);
}

void _IOHIDEventSystemConnectionQueueStop_cold_2(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_3_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_18B46C000, v8, v9, "%s: mach_port_request_notification(notify):%s", v10, v11, v12, v13, v15);
}

void _IOHIDEventSystemConnectionFilterEvent_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "%s: iohideventsystem_client_dispatch_event_filter:0x%x", v2, v3);
}

void _IOHIDEventSystemConnectionAddServices_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "%s: iohideventsystem_client_dispatch_notification_results:0x%x", v2, v3);
}

void _IOHIDEventSystemConnectionRemoveService_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "%s: iohideventsystem_client_dispatch_service_removal:0x%x", v2, v3);
}

void _IOHIDEventSystemConnectionPropertyChanged_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "%s: iohideventsystem_client_dispatch_properties_changed:0x%x", v2, v3);
}

void _IOHIDEventSystemConnectionRecordClientChanged_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_18B46C000, v0, v1, "%s: iohideventsystem_client_dispatch_client_records_changed:0x%x", v2, v3);
}

void _IOHIDEventSystemConnectionSetProperty_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "%s: Unable to create activity timer", v2, v3, v4, v5, v6);
}

void _IOHIDEventSystemConnectionSetProperty_cold_2()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18B46C000, v0, v1, "%s: Unable create activity notification", v2, v3, v4, v5, v6);
}

void __IOHIDServiceVirtualCopyPropertyCallback_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_0(&dword_18B46C000, v0, v1, "%s: HIDVS ID:%llx Invalid parameters: key:%@");
}

void __IOHIDServiceVirtualCopyMatchingEventCallback_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_18B46C000, log, OS_LOG_TYPE_ERROR, "Unable to serialize matching data", v1, 2u);
}

void _io_hideventsystem_dispatch_event_cold_1(uint64_t a1)
{
  _IOHIDEventSystemConnectionGetPID(a1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_18B46C000, v1, v2, "Error: the client with pid %d is missing the '%s' entitlement.", v3, v4, v5, v6, v7);
}

void _io_hideventsystem_register_event_filter_cold_1(uint64_t a1)
{
  _IOHIDEventSystemConnectionGetPID(a1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_18B46C000, v1, v2, "Error: the client with pid %d is missing the '%s' entitlement.", v3, v4, v5, v6, v7);
}

void _io_hideventsystem_register_record_client_changed_notification_cold_1(uint64_t a1)
{
  _IOHIDEventSystemConnectionGetPID(a1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_18B46C000, v1, v2, "Error: the client with pid %d is missing the '%s' entitlement.", v3, v4, v5, v6, v7);
}

void __checkFeatureEnabled_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __checkFeatureEnabled_block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create gAssertionConnection\n", v2, v3, v4, v5, v6);
}

void initialSetup_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void initialSetup_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create gAssertionsDict", v2, v3, v4, v5, v6);
}

void initialSetup_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Failed to register for reconnect with powerd 0x%x", v1, v2, v3, v4, v5);
}

void initialSetup_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Failed to register for reconnect with powerd 0x%x", v2, v3, v4, v5, v6);
}

void initialSetup_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void initialSetup_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void offloadAssertions_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Not a dictinary for 0x%x", buf, 8u);
}

void offloadAssertions_cold_2(uint8_t *buf, uint64_t *a2, void *a3)
{
  uint64_t v3 = *a2;
  *(_DWORD *)buf = 138412290;
  *a3 = v3;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create the remoteID to CF for id %@\n", buf, 0xCu);
}

void offloadAssertions_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "offloadAssertions called with gCurrentRemoteAssertion 0x%x", v1, v2, v3, v4, v5);
}

void offloadAssertions_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "offloadAssertions called with gCurrentRemoteAssertion 0x%x", v2, v3, v4, v5, v6);
}

void offloadAssertions_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void offloadAssertions_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_18B46C000, v0, v1, "No current assertion. Sending all activity till now", v2, v3, v4, v5, v6);
}

void offloadAssertions_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void offloadAssertions_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_18B46C000, v0, v1, "offloadAssertions fired", v2, v3, v4, v5, v6);
}

void processRemoteMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processRemoteMsg_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Unexpected message from async assertions connections\n", v2, v3, v4, v5, v6);
}

void processRemoteMsg_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processRemoteMsg_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "powerd released our connection", v2, v3, v4, v5, v6);
}

void processRemoteMsg_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processRemoteMsg_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Irrecoverable error for assertion creation\n", v2, v3, v4, v5, v6);
}

void activateAsyncAssertion_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Assertion 0x%x not found to activate", v1, v2, v3, v4, v5);
}

void activateAsyncAssertion_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Assertion 0x%x not found to activate", v2, v3, v4, v5, v6);
}

void logAsyncAssertionActivity_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "logAsyncAssertionActivity: unable to find assertion with id 0x%x", v1, v2, v3, v4, v5);
}

void logAsyncAssertionActivity_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "logAsyncAssertionActivity: unable to find assertion with id 0x%x", v2, v3, v4, v5, v6);
}

void insertIntoTimedList_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Setting assertion timeout to fire in %d secs for timeout_ts %llu", v1);
}

void insertIntoTimedList_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_18B46C000, v0, (uint64_t)v0, "Setting assertion timeout to fire in %d secs for timeout_ts %llu", v1);
}

void insertIntoTimedList_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void insertIntoTimedList_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_18B46C000, v0, v1, "Suspending timer", v2, v3, v4, v5, v6);
}

void createAsyncAssertion_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void createAsyncAssertion_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_18B46C000, v0, v1, "createAsyncAssertion: async mode disabled due to SmartPowerNap", v2, v3, v4, v5, v6);
}

void __createAsyncAssertion_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Assertion index 0x%x already exists", v1, v2, v3, v4, v5);
}

void __createAsyncAssertion_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Assertion index 0x%x already exists", v2, v3, v4, v5, v6);
}

void __createAsyncAssertion_block_invoke_cold_3(int **a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = **a1;
  CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict);
  v4[0] = 67109634;
  v4[1] = v3;
  OUTLINED_FUNCTION_12();
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Async assertion created with 0x%x, length %ld, %@\n", (uint8_t *)v4, 0x1Cu);
}

void __createAsyncAssertion_block_invoke_cold_4(int **a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v5 = **a1;
  CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict);
  v6[0] = 67109634;
  v6[1] = v5;
  OUTLINED_FUNCTION_12();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_18B46C000, a3, OS_LOG_TYPE_DEBUG, "Async assertion created with 0x%x, length %ld, %@\n", (uint8_t *)v6, 0x1Cu);
}

void __createAsyncAssertion_block_invoke_cold_5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_17(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Initial level is off for 0x%x: %@", v1);
}

void __createAsyncAssertion_block_invoke_cold_6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_17(&dword_18B46C000, v0, (uint64_t)v0, "Initial level is off for 0x%x: %@", v1);
}

void __createAsyncAssertion_block_invoke_cold_7()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Setting async client assertion id to 0x%x", v1, v2, v3, v4, v5);
}

void __createAsyncAssertion_block_invoke_cold_8()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "Setting async client assertion id to 0x%x", v2, v3, v4, v5, v6);
}

void _releaseAsycnAssertion_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "_releaseAsyncAssertion: Failed to get the assertion details for id:0x%x\n", v1, v2, v3, v4, v5);
}

void _releaseAsycnAssertion_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "_releaseAsyncAssertion: Failed to get the assertion details for id:0x%x\n", v2, v3, v4, v5, v6);
}

void _releaseAsycnAssertion_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Releasing assertion locally id 0x%x", v1, v2, v3, v4, v5);
}

void _releaseAsycnAssertion_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "Releasing assertion locally id 0x%x", v2, v3, v4, v5, v6);
}

void _releaseAsycnAssertion_cold_5(int a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = gReleasedAssertionsList;
  CFArrayGetCount((CFArrayRef)gReleasedAssertionsList);
  OUTLINED_FUNCTION_18();
  int v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Released assertion id gCurrentRemoteAssertion: 0x%x: 0x%x.Logging everything to powerd %@ %ld", v4, 0x22u);
}

void _releaseAsycnAssertion_cold_6(int a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = gReleasedAssertionsList;
  CFArrayGetCount((CFArrayRef)gReleasedAssertionsList);
  OUTLINED_FUNCTION_18();
  int v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  _os_log_debug_impl(&dword_18B46C000, a2, OS_LOG_TYPE_DEBUG, "Released assertion id gCurrentRemoteAssertion: 0x%x: 0x%x.Logging everything to powerd %@ %ld", v6, 0x22u);
}

void removeFromTimedList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Removing 0x%x from TimedList", v1, v2, v3, v4, v5);
}

void removeFromTimedList_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "Removing 0x%x from TimedList", v2, v3, v4, v5, v6);
}

void sendAsyncReleaseMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncReleaseMsg_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create xpc msg object\n", v2, v3, v4, v5, v6);
}

void sendAsyncReleaseMsg_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncReleaseMsg_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "No connection to powerd", v2, v3, v4, v5, v6);
}

void sendAsyncReleaseMsg_cold_5()
{
  CFArrayGetCount((CFArrayRef)gAsyncAssertionActivityLog_1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Logging all %ld activity to powerd\n", v1, v2, v3, v4, v5);
}

void sendAsyncReleaseMsg_cold_6()
{
  CFArrayGetCount((CFArrayRef)gAsyncAssertionActivityLog_1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_20(&dword_18B46C000, v0, v1, "Logging all %ld activity to powerd\n", v2, v3, v4, v5, v6);
}

void sendAsyncReleaseMsg_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Sending Assertion release message for assertion Id 0x%x\n", v1, v2, v3, v4, v5);
}

void sendAsyncReleaseMsg_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "Sending Assertion release message for assertion Id 0x%x\n", v2, v3, v4, v5, v6);
}

void setAsyncAssertionProperties_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109634;
  v3[1] = a3;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "setAsyncAssertionProperties for 0x%x %@:%@", (uint8_t *)v3, 0x1Cu);
}

void __setAsyncAssertionProperties_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "setAsyncAssertionProperties: Failed to get the assertion details for id:0x%x\n", v1, v2, v3, v4, v5);
}

void __setAsyncAssertionProperties_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "setAsyncAssertionProperties: Failed to get the assertion details for id:0x%x\n", v2, v3, v4, v5, v6);
}

void __setAsyncAssertionProperties_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Unexpected data type in gAssertionsDict for id:0x%x\n", v1, v2, v3, v4, v5);
}

void __setAsyncAssertionProperties_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Unexpected data type in gAssertionsDict for id:0x%x\n", v2, v3, v4, v5, v6);
}

void __setAsyncAssertionProperties_block_invoke_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __setAsyncAssertionProperties_block_invoke_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_18B46C000, v0, v1, "level_change->true through kIOPMAssertionTimeoutKey write on an inactive assertion.", v2, v3, v4, v5, v6);
}

void __setAsyncAssertionProperties_block_invoke_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __setAsyncAssertionProperties_block_invoke_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_18B46C000, v0, v1, "level_change through kIOPMAssertionLevelKey write.", v2, v3, v4, v5, v6);
}

void handleAssertionLevel_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "handleAssertionLevel: unable to find assertion with id 0x%x", v1, v2, v3, v4, v5);
}

void handleAssertionLevel_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "handleAssertionLevel: unable to find assertion with id 0x%x", v2, v3, v4, v5, v6);
}

void handleAssertionLevel_cold_3(int *a1, uint64_t a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a3;
  __int16 v5 = 1024;
  int v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "handleAssertionLevel for 0x%x to %d: %@", (uint8_t *)v4, 0x18u);
}

void handleAssertionLevel_cold_4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "handleAssertionTurnOff: Released assertion id 0x%x", v1, v2, v3, v4, v5);
}

void handleAssertionLevel_cold_5()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "handleAssertionTurnOff: Released assertion id 0x%x", v2, v3, v4, v5, v6);
}

void handleAssertionLevel_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Assertion 0x%x is neither active nor turned off", v1, v2, v3, v4, v5);
}

void handleAssertionLevel_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Assertion 0x%x is neither active nor turned off", v2, v3, v4, v5, v6);
}

void sendAsyncAssertionMsg_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncAssertionMsg_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to convert CF dictionary to xpc object\n", v2, v3, v4, v5, v6);
}

void sendAsyncAssertionMsg_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncAssertionMsg_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "sendAsyncAssertionMsg failed: powerd xpc connection interrupted", v2, v3, v4, v5, v6);
}

void sendAsyncAssertionMsg_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncAssertionMsg_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "sendAsyncAssertionMsg failed: powerd xpc connection invalid", v2, v3, v4, v5, v6);
}

void sendAsyncAssertionMsg_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sendAsyncAssertionMsg_cold_12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "No assertion dictionary or logging data to send", v2, v3, v4, v5, v6);
}

void processCheckAssertionsMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processCheckAssertionsMsg_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create xpc reply object\n", v2, v3, v4, v5, v6);
}

void __processCheckAssertionsMsg_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Received processCheckAssertionMsg with active assertion 0x%x", v1, v2, v3, v4, v5);
}

void __processCheckAssertionsMsg_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, v0, v1, "Received processCheckAssertionMsg with active assertion 0x%x", v2, v3, v4, v5, v6);
}

void processAssertionTimeout_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Assertion 0x%x has already been released", v1, v2, v3, v4, v5);
}

void processAssertionTimeout_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "Assertion 0x%x has already been released", v2, v3, v4, v5, v6);
}

void processAssertionTimeout_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "processAssertionTimeout: Removing idx:%d id:0x%x", v1);
}

void processAssertionTimeout_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_18B46C000, v0, (uint64_t)v0, "processAssertionTimeout: Removing idx:%d id:0x%x", v1);
}

void processAssertionTimeout_cold_5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "processAssertionTimeout: Turning off assertion idx:%d id:0x%x", v1);
}

void processAssertionTimeout_cold_6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_18B46C000, v0, (uint64_t)v0, "processAssertionTimeout: Turning off assertion idx:%d id:0x%x", v1);
}

void processAssertionTimeout_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "processAssertionTimeout: Not found in gActiveAssertionsDict: 0x%x", v1, v2, v3, v4, v5);
}

void processAssertionTimeout_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "processAssertionTimeout: Not found in gActiveAssertionsDict: 0x%x", v2, v3, v4, v5, v6);
}

void processAssertionTimeout_cold_9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "processAssertionTimeout: Removing from gActiveAssertionsDict: 0x%x", v1, v2, v3, v4, v5);
}

void processAssertionTimeout_cold_10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "processAssertionTimeout: Removing from gActiveAssertionsDict: 0x%x", v2, v3, v4, v5, v6);
}

void processAssertionTimeout_cold_11()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Received a release not for gCurrentRemoteAssertion:0x%x. Received 0x%x", v0, 0xEu);
}

void processAssertionTimeout_cold_12()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_18B46C000, v0, OS_LOG_TYPE_ERROR, "Received a release not for gCurrentRemoteAssertion:0x%x. Received 0x%x", v1, 0xEu);
}

void processAssertionUpdateActivity_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processAssertionUpdateActivity_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "processAssertionUpdateActivity: No gAssertionConnection", v2, v3, v4, v5, v6);
}

void processAssertionUpdateActivity_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processAssertionUpdateActivity_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create xpc reply object", v2, v3, v4, v5, v6);
}

void processAssertionUpdateActivity_cold_5()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "processAssertionUpdateActivity unread-count %d", v1, v2, v3, v4, v5);
}

void processAssertionUpdateActivity_cold_6()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_18B46C000, v0, v1, "processAssertionUpdateActivity unread-count %d", v2, v3, v4, v5, v6);
}

void processCurrentActiveAssertions_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void processCurrentActiveAssertions_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "processCurrentActiveAssertions: No gAssertionConnection", v2, v3, v4, v5, v6);
}

void processCurrentActiveAssertions_cold_5(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Not a dictianary for 0x%x", buf, 8u);
}

void handleAssertionTimeout_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "handleAssertionTimeout: Setting assertion timeout to fire in %llu secs", v1, v2, v3, v4, v5);
}

void handleAssertionTimeout_cold_2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_18B46C000, v0, v1, "handleAssertionTimeout: Setting assertion timeout to fire in %llu secs", v2, v3, v4, v5, v6);
}

void handleAssertionTimeout_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handleAssertionTimeout_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_18B46C000, v0, v1, "Resuming timer", v2, v3, v4, v5, v6);
}

void handleAssertionTimeout_cold_7(uint8_t *buf, int *a2, _DWORD *a3)
{
  int v3 = *a2;
  *(_DWORD *)buf = 67109120;
  *a3 = v3;
  _os_log_error_impl(&dword_18B46C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to release assertion 0x%x on timeout", buf, 8u);
}

void handleAssertionTimeout_cold_8()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "handleAssertionTimeout fired %llu", v1, v2, v3, v4, v5);
}

void handleAssertionTimeout_cold_9()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_18B46C000, v0, v1, "handleAssertionTimeout fired %llu", v2, v3, v4, v5, v6);
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create connection\n", v2, v3, v4, v5, v6);
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create dictionary to send message", v2, v3, v4, v5, v6);
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "No assertions by process", v2, v3, v4, v5, v6);
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Received an error in response to IOPMCopyActiveAsyncAssertionsByProcess", v2, v3, v4, v5, v6);
}

void IOPMAssertionCreateWithName_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionCreateWithProperties_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionCreateWithProperties_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionCreateWithProperties_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "IOPMAssertionCreateWithProperties: io_pm_assertion_create failed with error 0x%x", v1, v2, v3, v4, v5);
}

void IOPMAssertionCreateWithProperties_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "IOPMAssertionCreateWithProperties: Call to io_pm_assertion_create failed with kernel error 0x%x", v1, v2, v3, v4, v5);
}

void IOPMAssertionCreateWithProperties_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionCreateWithProperties_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionRetain_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOPMAssertionRetain_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Assertion retain not supported in async mode\n", v2, v3, v4, v5, v6);
}

void IOPMAssertionSetProcessState_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Setting Assertion State for PID %d to %d\n", v1);
}

void IOPMCopyAssertionActivityUpdateWithCallback_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Failed to create connection\n", v2, v3, v4, v5, v6);
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_18B46C000, v0, v1, "No AssertionActivity in xpc reply", v2, v3, v4, v5, v6);
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_18B46C000, MEMORY[0x1E4F14500], v0, "Received assertion activity update refcnt %u overflow %d", v1);
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_18B46C000, v0, (uint64_t)v0, "Received assertion activity update refcnt %u overflow %d", v1);
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_204_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18B46C000, v0, v1, "Received an error in response to copy assertion activity", v2, v3, v4, v5, v6);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1F40D70D8](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D7128](allocator, ptr, newsize, hint);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C0](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7440](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7470](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFArrayRef CFBundleCreateBundlesFromDirectory(CFAllocatorRef allocator, CFURLRef directoryURL, CFStringRef bundleType)
{
  return (CFArrayRef)MEMORY[0x1F40D7530](allocator, directoryURL, bundleType);
}

void *__cdecl CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName)
{
  return (void *)MEMORY[0x1F40D7548](bundle, symbolName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFPlugInRef CFBundleGetPlugIn(CFBundleRef bundle)
{
  return (CFPlugInRef)MEMORY[0x1F40D75B8](bundle);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1F40D7690](allocator, identifier);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78D0](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1F40D7970](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C58](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D7C60](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C68](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1F40D7C78](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1F40D7D78](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1F40D7DF8](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

CFPlugInRef CFPlugInCreate(CFAllocatorRef allocator, CFURLRef plugInURL)
{
  return (CFPlugInRef)MEMORY[0x1F40D7E40](allocator, plugInURL);
}

CFArrayRef CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUIDRef typeUUID, CFPlugInRef plugIn)
{
  return (CFArrayRef)MEMORY[0x1F40D7E50](typeUUID, plugIn);
}

CFBundleRef CFPlugInGetBundle(CFPlugInRef plugIn)
{
  return (CFBundleRef)MEMORY[0x1F40D7E68](plugIn);
}

void *__cdecl CFPlugInInstanceCreate(CFAllocatorRef allocator, CFUUIDRef factoryUUID, CFUUIDRef typeUUID)
{
  return (void *)MEMORY[0x1F40D7E70](allocator, factoryUUID, typeUUID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags mutabilityOption, CFPropertyListFormat *format, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F38](allocator, stream, streamLength, mutabilityOption, format, errorString);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F40](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

CFDataRef CFPropertyListCreateXMLData(CFAllocatorRef allocator, CFPropertyListRef propertyList)
{
  return (CFDataRef)MEMORY[0x1F40D7F60](allocator, propertyList);
}

CFIndex CFPropertyListWriteToStream(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFStringRef *errorString)
{
  return MEMORY[0x1F40D7F78](propertyList, stream, format, errorString);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FB0](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
}

CFTypeID CFRunLoopSourceGetTypeID(void)
{
  return MEMORY[0x1F40D8150]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

CFTypeID CFRunLoopTimerGetTypeID(void)
{
  return MEMORY[0x1F40D81B8]();
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1F40D8208](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8218](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1F40D8230]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFShow(CFTypeRef obj)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8290](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1F40D8298](allocator, *(void *)&sock, callBackTypes, callout, context);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1F40D83E0](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8708](allocator, ti);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8770](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8798](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D87F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8808](allocator, url);
}

Boolean CFURLCreateDataAndPropertiesFromResource(CFAllocatorRef alloc, CFURLRef url, CFDataRef *resourceData, CFDictionaryRef *properties, CFArrayRef desiredProperties, SInt32 *errorCode)
{
  return MEMORY[0x1F40D8828](alloc, url, resourceData, properties, desiredProperties, errorCode);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFTypeRef CFURLCreatePropertyFromResource(CFAllocatorRef alloc, CFURLRef url, CFStringRef property, SInt32 *errorCode)
{
  return (CFTypeRef)MEMORY[0x1F40D8858](alloc, url, property, errorCode);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1F40D8938](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1F40D8948](url, error);
}

Boolean CFURLWriteDataAndPropertiesToResource(CFURLRef url, CFDataRef dataToWrite, CFDictionaryRef propertiesToWrite, SInt32 *errorCode)
{
  return MEMORY[0x1F40D8980](url, dataToWrite, propertiesToWrite, errorCode);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1F40D89D0](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D8A90](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AA0](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

fat_arch *__cdecl NXFindBestFatArch(cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch *fat_archs, uint32_t nfat_archs)
{
  return (fat_arch *)MEMORY[0x1F40C99C0](*(void *)&cputype, *(void *)&cpusubtype, fat_archs, *(void *)&nfat_archs);
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return (const NXArchInfo *)MEMORY[0x1F40C99C8](*(void *)&cputype, *(void *)&cpusubtype);
}

const NXArchInfo *__cdecl NXGetArchInfoFromName(const char *name)
{
  return (const NXArchInfo *)MEMORY[0x1F40C99D0](name);
}

const NXArchInfo *NXGetLocalArchInfo(void)
{
  return (const NXArchInfo *)MEMORY[0x1F40C99D8]();
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1F40C99E8](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyExecutableURLInDirectory()
{
  return MEMORY[0x1F40D8BB8]();
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1F40D8BE8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeGetClassWithTypeID()
{
  return MEMORY[0x1F40D90D8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1F40D9440]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1F40C9C98](a1, a2, *(void *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _dispatch_workloop_set_observer_hooks_4IOHID()
{
  return MEMORY[0x1F40C9DA8]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

uint64_t _os_nospin_lock_trylock()
{
  return MEMORY[0x1F40CA018]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x1F40CA408](client, msg, *(void *)&level, format);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1F40CA518](a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA538](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1F40CA550]();
}

uint64_t bootstrap_look_up_per_user()
{
  return MEMORY[0x1F40CA558]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1F40CA568](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814E0](cls, protocol);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x1F4181580](cls, sel);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1F40CBB38]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1F40CBB40]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1F40CBB48]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x1F40CBB50]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1F40CBB68]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1F40CBBE8](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t entr_act_begin()
{
  return MEMORY[0x1F417F600]();
}

uint64_t entr_act_end()
{
  return MEMORY[0x1F417F608]();
}

uint64_t entr_act_modify()
{
  return MEMORY[0x1F417F610]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1F40CC408](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x1F4182C20](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1F4182C30](*(void *)&fd, mode);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x1F4182CA0](file, buf, *(void *)&len);
}

kern_return_t host_get_io_main(host_t host, io_main_t *io_main)
{
  return MEMORY[0x1F40CC5F8](*(void *)&host, io_main);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CC658](a1, *(void *)&a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CD8](strm, version, *(void *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

kern_return_t kext_request(host_priv_t host_priv, uint32_t user_log_flags, vm_offset_t request_data, mach_msg_type_number_t request_dataCnt, vm_offset_t *response_data, mach_msg_type_number_t *response_dataCnt, vm_offset_t *log_data, mach_msg_type_number_t *log_dataCnt, kern_return_t *op_result)
{
  return MEMORY[0x1F40CC720](*(void *)&host_priv, *(void *)&user_log_flags, request_data, *(void *)&request_dataCnt, response_data, response_dataCnt, log_data, log_dataCnt);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1F40CC958](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

uint64_t mach_msg2_internal()
{
  return MEMORY[0x1F40CC978]();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1F40CC9E0](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1F40CC9F0](*(void *)&task, *(void *)&name, *(void *)&right, refs);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40CCA28](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40CCA80](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1F40CCD60]();
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1F40CCD78]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

void mig_reply_setup(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD90](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD98](dest, src, *(void *)&len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x1F40CD070](name, notify_port, *(void *)&flags, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1F4181750](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return MEMORY[0x1F40CD910](a1, a2, a3);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1F40CD920](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1F40CD950](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD958](a1, *(void *)&a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDCB8](*(void *)&a1, a2, a3, *(void *)&a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t rootless_check_trusted()
{
  return MEMORY[0x1F40CDDA0]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1F4181B30](str);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDF30](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1A8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CE238](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

void swap_load_command(load_command *lc, NXByteOrder target_byte_order)
{
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
}

void swap_segment_command(segment_command *sg, NXByteOrder target_byte_order)
{
}

void swap_segment_command_64(segment_command_64 *sg, NXByteOrder target_byte_order)
{
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1F40CE460](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1F40CE480](*(void *)&target_tport, *(void *)&pid, tn);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1F40CE5C0](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1F40CE620](a1, a2);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE680](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1F40CE6E8](*(void *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

void warnx(const char *a1, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE50](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}