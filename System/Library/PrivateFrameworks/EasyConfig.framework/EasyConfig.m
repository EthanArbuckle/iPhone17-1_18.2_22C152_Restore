uint64_t _pairSetupPromptForSetupCode(int a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void v12[5];
  int v13;
  int v14;

  v5 = a3;
  v6 = (void *)*((void *)v5 + 15);
  if (v6)
  {
    v7 = v6;
    dispatch_source_cancel(v7);
    v8 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = 0;
  }
  if (*((void *)v5 + 21))
  {
    *((CFAbsoluteTime *)v5 + 51) = CFAbsoluteTimeGetCurrent();
    v9 = *((void *)v5 + 2);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___pairSetupPromptForSetupCode_block_invoke;
    v12[3] = &unk_26452D6E8;
    v12[4] = v5;
    v13 = a1;
    v14 = a2;
    dispatch_async(v9, v12);
    v10 = 0;
  }
  else
  {
    v10 = 4294960551;
  }

  return v10;
}

uint64_t ___pairSetupPromptForSetupCode_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 168);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
  }
  return result;
}

uint64_t EasyConfigLogControl()
{
  return MEMORY[0x270F243E0]();
}

__CFDictionary *EasyConfigCreateDictionaryFromTLV(uint64_t a1, uint64_t a2, int *a3)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    v5 = Mutable;
    while (1)
    {
      if (TLV8GetNext())
      {
        int v10 = 0;
        v8 = v5;
        v5 = 0;
        goto LABEL_7;
      }
      CFStringRef v6 = CFStringCreateWithBytes(0, 0, 0, 0x8000100u, 0);
      if (!v6) {
        break;
      }
      CFStringRef v7 = v6;
      CFDictionarySetValue(v5, @"adminPassword", v6);
      CFRelease(v7);
    }
    v8 = 0;
    int v10 = -6742;
LABEL_7:
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    v8 = 0;
    int v10 = -6728;
  }
  if (a3) {
    *a3 = v10;
  }
  return v8;
}

uint64_t EasyConfigCreateTLVfromDictionary(const __CFDictionary *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(context, 0, 512);
  DataBuffer_Init();
  int v7 = 0;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_EasyConfigCreateTLVfromDictionaryApplier, context);
  if (!v7) {
    int v7 = DataBuffer_Detach();
  }
  DataBuffer_Free();
  if (a3) {
    *a3 = v7;
  }
  return 0;
}

uint64_t _EasyConfigCreateTLVfromDictionaryApplier(uint64_t result, const __CFString *cf, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a3 + 568))
  {
    v5 = (const void *)result;
    CFTypeID v6 = CFGetTypeID(cf);
    if (CFEqual(v5, @"adminPassword")
      || CFEqual(v5, @"bundleSeedID")
      || CFEqual(v5, @"countryCode")
      || CFEqual(v5, @"firmwareRevision")
      || CFEqual(v5, @"hardwareRevision")
      || CFEqual(v5, @"indoorOutdoorMode")
      || CFEqual(v5, @"language")
      || CFEqual(v5, @"manufacturer")
      || CFEqual(v5, @"model")
      || CFEqual(v5, @"name")
      || CFEqual(v5, @"operationType")
      || CFEqual(v5, @"playPassword")
      || CFEqual(v5, @"serialNumber")
      || CFEqual(v5, @"wifiEAPTLSCert")
      || CFEqual(v5, @"wifiPSK")
      || CFEqual(v5, @"wifiRouterCert")
      || CFEqual(v5, @"wifiSSID"))
    {
      if (v6 == CFStringGetTypeID())
      {
        buffer[0] = 0;
        if (!CFStringGetCString(cf, buffer, 256, 0x8000100u))
        {
LABEL_44:
          uint64_t result = 4294960559;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      if (v6 == CFDataGetTypeID())
      {
        CFDataGetBytePtr((CFDataRef)cf);
        CFDataGetLength((CFDataRef)cf);
LABEL_26:
        uint64_t result = DataBuffer_AppendIE();
LABEL_27:
        *(_DWORD *)(a3 + 568) = result;
        return result;
      }
      if (v6 == CFNumberGetTypeID())
      {
        *(void *)buffer = 0;
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, buffer);
        if (*(void *)buffer > 0xFFuLL)
        {
          uint64_t result = 4294960586;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      if ((int)*MEMORY[0x263F38640] <= 50 && (*MEMORY[0x263F38640] != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
LABEL_33:
      uint64_t result = 4294960540;
      goto LABEL_27;
    }
    if (CFEqual(v5, @"mfiProtocols"))
    {
      if (v6 != CFArrayGetTypeID()) {
        goto LABEL_33;
      }
      CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        CFIndex v9 = 0;
        while (1)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)cf, v9);
          CFTypeID v11 = CFGetTypeID(ValueAtIndex);
          if (v11 != CFStringGetTypeID()) {
            goto LABEL_33;
          }
          buffer[0] = 0;
          if (!CFStringGetCString(ValueAtIndex, buffer, 256, 0x8000100u)) {
            goto LABEL_44;
          }
          uint64_t result = DataBuffer_AppendIE();
          if (!result && v8 != ++v9) {
            continue;
          }
          goto LABEL_27;
        }
      }
    }
    else if ((int)*MEMORY[0x263F38640] <= 50)
    {
      if (*MEMORY[0x263F38640] == -1)
      {
        uint64_t result = _LogCategory_Initialize();
        if (!result) {
          goto LABEL_27;
        }
      }
      LogPrintF();
    }
    uint64_t result = 0;
    goto LABEL_27;
  }
  return result;
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x270F23CA8]();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return MEMORY[0x270F23CB0]();
}

uint64_t BonjourBrowser_SetEventHandlerBlock()
{
  return MEMORY[0x270F23CB8]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x270F23CC0]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x270F23CC8]();
}

uint64_t BonjourDevice_GetDNSName()
{
  return MEMORY[0x270F23CD0]();
}

uint64_t BonjourDevice_GetDeviceID()
{
  return MEMORY[0x270F23CD8]();
}

uint64_t BonjourDevice_GetInt64()
{
  return MEMORY[0x270F23CE0]();
}

uint64_t BonjourDevice_Reconfirm()
{
  return MEMORY[0x270F23CE8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

uint64_t CFCreateWithPlistBytes()
{
  return MEMORY[0x270F23D28]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetHardwareAddress()
{
  return MEMORY[0x270F23D68]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x270F23DA8]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t DataBuffer_AppendIE()
{
  return MEMORY[0x270F24110]();
}

uint64_t DataBuffer_Detach()
{
  return MEMORY[0x270F24120]();
}

uint64_t DataBuffer_Free()
{
  return MEMORY[0x270F24128]();
}

uint64_t DataBuffer_Init()
{
  return MEMORY[0x270F24130]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x270F24148]();
}

uint64_t HTTPClientCreate()
{
  return MEMORY[0x270F24220]();
}

uint64_t HTTPClientInvalidate()
{
  return MEMORY[0x270F24240]();
}

uint64_t HTTPClientSendMessage()
{
  return MEMORY[0x270F24248]();
}

uint64_t HTTPClientSetDestination()
{
  return MEMORY[0x270F24260]();
}

uint64_t HTTPClientSetDispatchQueue()
{
  return MEMORY[0x270F24268]();
}

uint64_t HTTPClientSetFlags()
{
  return MEMORY[0x270F24270]();
}

uint64_t HTTPClientSetLogging()
{
  return MEMORY[0x270F24278]();
}

uint64_t HTTPClientSetTransportDelegate()
{
  return MEMORY[0x270F24288]();
}

uint64_t HTTPHeader_InitRequest()
{
  return MEMORY[0x270F242C8]();
}

uint64_t HTTPHeader_InitRequestF()
{
  return MEMORY[0x270F242D0]();
}

uint64_t HTTPHeader_SetField()
{
  return MEMORY[0x270F242E8]();
}

uint64_t HTTPMessageCreate()
{
  return MEMORY[0x270F24300]();
}

uint64_t HTTPMessageSetBody()
{
  return MEMORY[0x270F24318]();
}

uint64_t HTTPMessageSetBodyLength()
{
  return MEMORY[0x270F24320]();
}

uint64_t HTTPMessageSetCompletionBlock()
{
  return MEMORY[0x270F24328]();
}

uint64_t IEGetVendorSpecific()
{
  return MEMORY[0x270F243A8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t MFiSAP_Create()
{
  return MEMORY[0x270F24418]();
}

uint64_t MFiSAP_Decrypt()
{
  return MEMORY[0x270F24420]();
}

uint64_t MFiSAP_Delete()
{
  return MEMORY[0x270F24428]();
}

uint64_t MFiSAP_Encrypt()
{
  return MEMORY[0x270F24430]();
}

uint64_t MFiSAP_Exchange()
{
  return MEMORY[0x270F24438]();
}

uint64_t NetTransportChaCha20Poly1305Configure()
{
  return MEMORY[0x270F24570]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x270F245C0]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x270F245D0]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x270F245D8]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x270F245E8]();
}

uint64_t PairingSessionSetKeychainInfo()
{
  return MEMORY[0x270F245F0]();
}

uint64_t PairingSessionSetLogging()
{
  return MEMORY[0x270F245F8]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x270F24600]();
}

uint64_t TLV8Get()
{
  return MEMORY[0x270F24778]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x270F24780]();
}

uint64_t TLVParseSInt64()
{
  return MEMORY[0x270F24798]();
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x270ED7CC8](txtLen, txtRecord, key, valueLen);
}

uint64_t TextToSourceVersion()
{
  return MEMORY[0x270F247C8]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}