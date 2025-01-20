uint64_t sendAneSignal(const __CFString *a1, const void *a2)
{
  return setAneHint(a1, a2, 0);
}

uint64_t setAneHint(const __CFString *a1, const void *a2, CFMutableDictionaryRef *a3)
{
  kern_return_t v23;
  int v24;
  int v25;
  const void *Value;
  const void *v27;
  __CFDictionary *v28;
  __CFString *v29;
  const void *v30;
  const void *v31;
  CFAllocatorRef v33;
  io_iterator_t existing;
  char v35;
  unsigned char v36[15];
  char v37;
  unsigned char v38[15];
  char v39;
  unsigned char v40[11];
  io_registry_entry_t entry;
  CFMutableDictionaryRef properties;
  io_connect_t connect;
  uint8_t buf[4];
  _DWORD v45[3];
  uint8_t v46[4];
  _DWORD v47[3];
  uint64_t v48;

  v48 = *MEMORY[0x263EF8340];
  CFDictionaryRef v6 = IOServiceMatching("ANEClientHints");
  if (!v6)
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    uint64_t v7 = 3758097085;
    if (v8) {
      setAneHint(v8, v9, v10);
    }
    return v7;
  }
  existing = 0;
  if (IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v6, &existing))
  {
    uint64_t v7 = 3758097136;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      setAneHint();
    }
    return v7;
  }
  if (!existing)
  {
    uint64_t v7 = 3758097136;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      setAneHint();
    }
    return v7;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v12 = (task_port_t *)MEMORY[0x263EF8960];
  v33 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    io_service_t v13 = IOIteratorNext(existing);
    if (!v13)
    {
      uint64_t v7 = 0;
      goto LABEL_46;
    }
    io_object_t v14 = v13;
    connect = 0;
    uint64_t v15 = IOServiceOpen(v13, *v12, 0, &connect);
    if (v15) {
      break;
    }
    uint64_t v16 = IOConnectSetCFProperty(connect, a1, a2);
    uint64_t v7 = v16;
    if (a3 && !v16)
    {
      v17 = a2;
      v18 = v12;
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      properties = 0;
      entry = 0;
      int v21 = MEMORY[0x24C5487D0](connect, &entry);
      if (v21)
      {
        int v22 = v21;
        v12 = v18;
        a2 = v17;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          setAneHint(v46, v22, v47);
        }
        goto LABEL_19;
      }
      v23 = IORegistryEntryCreateCFProperties(entry, &properties, v11, 0);
      if (v23)
      {
        v24 = v23;
        v12 = v18;
        a2 = v17;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          setAneHint(buf, v24, v45);
        }
        goto LABEL_19;
      }
      if (strncmp(CStringPtr, "ANEHintClientSessionStart", 0x1AuLL))
      {
        v25 = strncmp(CStringPtr, "ANEHintClientSessionInfo", 0x19uLL);
        v12 = v18;
        a2 = v17;
        if (!v25)
        {
          Value = CFDictionaryGetValue(properties, @"ANEClientSessionStatus");
          if (!Value)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              setAneHint(&v35, v36);
            }
            goto LABEL_19;
          }
          v27 = Value;
          v28 = Mutable;
          v29 = @"ANEClientSessionStatus";
LABEL_35:
          CFDictionarySetValue(v28, v29, v27);
        }
LABEL_19:
        *a3 = Mutable;
        if (properties) {
          CFRelease(properties);
        }
        CFAllocatorRef v11 = v33;
        if (entry) {
          IOObjectRelease(entry);
        }
        goto LABEL_23;
      }
      v30 = CFDictionaryGetValue(properties, @"ANEClientTotalPages");
      if (v30)
      {
        CFDictionarySetValue(Mutable, @"ANEClientTotalPages", v30);
        v12 = v18;
      }
      else
      {
        v12 = v18;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          setAneHint(&v39, v40);
        }
      }
      v31 = CFDictionaryGetValue(properties, @"ANEClientResidentPages");
      a2 = v17;
      if (!v31)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          setAneHint(&v37, v38);
        }
        goto LABEL_19;
      }
      v27 = v31;
      v28 = Mutable;
      v29 = @"ANEClientResidentPages";
      goto LABEL_35;
    }
LABEL_23:
    IOServiceClose(connect);
    IOObjectRelease(v14);
    a3 = 0;
    if (v7) {
      goto LABEL_44;
    }
  }
  uint64_t v7 = v15;
  IOObjectRelease(v14);
LABEL_44:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    setAneHint();
  }
LABEL_46:
  IOObjectRelease(existing);
  return v7;
}

id sendAneSessionSignal(const __CFString *a1, const void *a2)
{
  id v4 = 0;
  setAneHint(a1, a2, (CFMutableDictionaryRef *)&v4);
  id v2 = v4;
  return v2;
}

unsigned char *OUTLINED_FUNCTION_0(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void setAneHint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2(&dword_246D51000, &_os_log_internal, a3, "Failed to create matching dictionary for class ANEClientHints\n", v3);
}

void setAneHint()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  v1 = "IOReturn setAneHint(CFStringRef, CFTypeRef, CFTypeRef *)";
  _os_log_error_impl(&dword_246D51000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:IOService ANEClientHints not found.", (uint8_t *)&v0, 0xCu);
}

{
  int v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_246D51000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:Sending hint failed: status=0x%x\n", (uint8_t *)v0, 0x12u);
}

{
  int v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_246D51000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Couldn't get matching services for ANEClientHints: status=0x%x", (uint8_t *)v0, 0x12u);
}

void setAneHint(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_2(&dword_246D51000, &_os_log_internal, v2, "cannot find kANEHintClientResidentPages from hintProperty\n", v3);
}

{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_2(&dword_246D51000, &_os_log_internal, v2, "cannot find kANEHintClientTotalPages from hintProperty\n", v3);
}

{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_2(&dword_246D51000, &_os_log_internal, v2, "cannot find kANEHintClientSessionStatus from hintProperty\n", v3);
}

void setAneHint(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_246D51000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to get hintProperty from hintsUserClient\n res: 0x%x", buf, 8u);
}

{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_246D51000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to get hintsUserClient IOService instance res: 0x%x\n", buf, 8u);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

kern_return_t IOConnectGetService(io_connect_t connect, io_service_t *service)
{
  return MEMORY[0x270EF3F48](*(void *)&connect, service);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF3F70](*(void *)&connect, propertyName, property);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}