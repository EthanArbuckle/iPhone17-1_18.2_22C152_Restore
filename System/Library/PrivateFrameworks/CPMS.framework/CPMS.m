void sub_1DB92D1E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PPMCallbackHandler(void *a1, uint64_t a2, int a3, unint64_t a4)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (a3 != -528318201 && a3 != -528318206) {
    return;
  }
  id v6 = a1;
  if (a3 != -528318201)
  {
    if (a3 == -528318206)
    {
      v7 = (void *)MEMORY[0x1E0194B40]();
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v8 = [v6 clientSet];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v85 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        v11 = v7;
        unint64_t v12 = HIBYTE(a4);
        uint64_t v13 = *(void *)v70;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v70 != v13) {
              objc_enumerationMutation(v8);
            }
            v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            if (v12 == objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", objc_msgSend(v15, "clientId")))
            {
              v22 = [v15 getCurrentPower];
              v23 = v22[2]();
              v16 = (void *)[v23 copy];

              v24 = +[CPMSAgent log];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
                PPMCallbackHandler_cold_2(v15, v24);
              }

              uint64_t v25 = 0;
              *(void *)&inputStruct[9] = 0;
              *(void *)&inputStruct[2] = 0;
              inputStruct[0] = v12;
              inputStruct[1] = 3;
              v26 = &inputStruct[3];
              do
              {
                v27 = [v6 PPMIndexToCPMSPowerTimeScale:(char)v25];
                v28 = [v16 valueForKey:v27];
                if (v28)
                {
                  v29 = [v16 objectForKeyedSubscript:v27];
                }
                else
                {
                  v29 = 0;
                }

                *((unsigned char *)v26 - 1) = v25;
                _DWORD *v26 = [v29 unsignedIntValue];
                v26 = (_DWORD *)((char *)v26 + 5);

                ++v25;
              }
              while (v25 != 3);
              if (IOConnectCallStructMethod([v6 connect], 0x21u, inputStruct, 0x11uLL, 0, 0))
              {
                v30 = +[CPMSAgent log];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                  PPMCallbackHandler_cold_1();
                }
              }
              v7 = v11;
              goto LABEL_80;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v69 objects:v85 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        v7 = v11;
      }
      goto LABEL_81;
    }
    goto LABEL_82;
  }
  v7 = (void *)MEMORY[0x1E0194B40]();
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v16 = [v6 clientSet];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v84 count:16];
  if (!v17) {
    goto LABEL_80;
  }
  uint64_t v18 = v17;
  v62 = v7;
  uint64_t v19 = *(void *)v66;
LABEL_16:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v66 != v19) {
      objc_enumerationMutation(v16);
    }
    v21 = *(void **)(*((void *)&v65 + 1) + 8 * v20);
    if (HIBYTE(a4) == objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", objc_msgSend(v21, "clientId")))break; {
    if (v18 == ++v20)
    }
    {
      uint64_t v18 = [v16 countByEnumeratingWithState:&v65 objects:v84 count:16];
      if (!v18) {
        goto LABEL_80;
      }
      goto LABEL_16;
    }
  }
  v31 = +[CPMSAgent log];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    uint64_t v32 = [v21 clientId];
    *(_DWORD *)inputStruct = 134218496;
    *(void *)&inputStruct[4] = v32;
    *(_WORD *)&inputStruct[12] = 1024;
    *(_DWORD *)&inputStruct[14] = -528318201;
    __int16 v79 = 2048;
    unint64_t v80 = a4;
    _os_log_impl(&dword_1DB92B000, v31, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %llu msg type 0x%x, msg 0x%016llx\n", inputStruct, 0x1Cu);
  }

  bzero(inputStruct, 0x610uLL);
  uint64_t input = HIBYTE(a4);
  size_t v64 = 1552;
  if (IOConnectCallMethod([v6 connect], 0x1Du, &input, 1u, 0, 0, 0, 0, inputStruct, &v64))
  {
    v33 = +[CPMSAgent log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      PPMCallbackHandler_cold_4(v21);
    }
    goto LABEL_77;
  }
  if (!v81)
  {
    if ((a4 & 8) == 0) {
      goto LABEL_58;
    }
    goto LABEL_61;
  }
  unint64_t v34 = 0;
  v35 = v82;
  char v36 = 1;
  do
  {
    int v37 = *v35;
    if (((a4 >> *v35) & 1) == 0) {
      goto LABEL_53;
    }
    uint64_t v38 = *(unsigned int *)(v35 + 1);
    if (v37 == 2)
    {
      v39 = [NSNumber numberWithUnsignedInt:v38];
      v40 = v8;
      v41 = v39;
      v42 = @"cpms_ts_1000";
    }
    else if (v37 == 1)
    {
      v39 = [NSNumber numberWithUnsignedInt:v38];
      v40 = v8;
      v41 = v39;
      v42 = @"cpms_ts_100";
    }
    else
    {
      if (*v35)
      {
        v39 = +[CPMSAgent log];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v43 = [v21 clientId];
          int v44 = *v35;
          *(_DWORD *)buf = 134218240;
          uint64_t v74 = v43;
          __int16 v75 = 1024;
          LODWORD(v76) = v44;
          _os_log_error_impl(&dword_1DB92B000, v39, OS_LOG_TYPE_ERROR, "<Error> CPMS clientId %lu timescale %d", buf, 0x12u);
        }
        goto LABEL_52;
      }
      v39 = [NSNumber numberWithUnsignedInt:v38];
      v40 = v8;
      v41 = v39;
      v42 = @"cpms_ts_i";
    }
    [v40 setObject:v41 forKeyedSubscript:v42];
LABEL_52:

    char v36 = 0;
LABEL_53:
    ++v34;
    v35 += 5;
  }
  while (v34 < v81);
  if ((a4 & 8) != 0)
  {
LABEL_61:
    if (v83 >= 1)
    {
      for (uint64_t j = 0; j < v83; ++j)
      {
        v47 = &v82[16 * j + 213];
        uint64_t v49 = *((void *)v47 + 1);
        v48 = v47 + 8;
        if (v49)
        {
          v50 = v77;
          for (uint64_t k = 56; k != -8; k -= 8)
          {
            uint64_t v52 = *v48 >> k;
            if ((_BYTE)v52) {
              *v50++ = v52;
            }
          }
          unsigned char *v50 = 0;
          v53 = [NSString stringWithFormat:@"%@.%s", @"cpms_ts_thermal", v77];
          v54 = +[CPMSAgent log];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            uint64_t v55 = [v21 clientId];
            *(_DWORD *)buf = 134218242;
            uint64_t v74 = v55;
            __int16 v75 = 2112;
            id v76 = v53;
            _os_log_impl(&dword_1DB92B000, v54, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %lu, adding budget for %@", buf, 0x16u);
          }

          v56 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&v82[16 * j + 217]];
          [v8 setObject:v56 forKeyedSubscript:v53];
        }
        else
        {
          v57 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&v82[16 * j + 217]];
          [v8 setObject:v57 forKeyedSubscript:@"cpms_ts_thermal"];
        }
      }
    }
    goto LABEL_73;
  }
  if ((v36 & 1) == 0) {
    goto LABEL_73;
  }
LABEL_58:
  v45 = +[CPMSAgent log];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    PPMCallbackHandler_cold_3(v21);
  }

LABEL_73:
  v33 = +[CPMSAgent log];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    uint64_t v58 = [v21 clientId];
    *(_DWORD *)buf = 134218242;
    uint64_t v74 = v58;
    __int16 v75 = 2112;
    id v76 = v8;
    _os_log_impl(&dword_1DB92B000, v33, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %lu, budget dictionary %@", buf, 0x16u);
  }
  v7 = v62;
LABEL_77:

  v59 = +[CPMSAgent log];
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    uint64_t v60 = [v21 clientId];
    *(_DWORD *)buf = 134217984;
    uint64_t v74 = v60;
    _os_log_impl(&dword_1DB92B000, v59, OS_LOG_TYPE_INFO, "<Info> Sending budget notification for CPMS clientId %lu", buf, 0xCu);
  }

  v61 = [v21 notificationCallback];
  ((void (**)(void, id))v61)[2](v61, v8);

LABEL_80:
LABEL_81:

LABEL_82:
}

void sub_1DB92E710(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double OUTLINED_FUNCTION_0(void *a1, _OWORD *a2)
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

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return _os_log_send_and_compose_impl();
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL OUTLINED_FUNCTION_6()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, void *a2)
{
  return [a2 count];
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t openIOConnectObjectForApplePPM(io_service_t *a1, io_connect_t *a2)
{
  kern_return_t v6;
  NSObject *v8;
  int v9;

  if (a1 && a2)
  {
    CFDictionaryRef v4 = IOServiceMatching("ApplePPM");
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v4);
    *a1 = MatchingService;
    if (MatchingService)
    {
      uint64_t v6 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, a2);
      if (!v6) {
        return 1;
      }
      uint64_t v9 = v6;
      id v8 = +[CPMSStateReader log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        openIOConnectObjectForApplePPM_cold_3(v9, v8);
      }
    }
    else
    {
      id v8 = +[CPMSStateReader log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        openIOConnectObjectForApplePPM_cold_2();
      }
    }
  }
  else
  {
    id v8 = +[CPMSStateReader log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      openIOConnectObjectForApplePPM_cold_1();
    }
  }

  closeIOConnectObjectForApplePPM((unint64_t)a1, a2);
  return 0;
}

unint64_t closeIOConnectObjectForApplePPM(unint64_t result, _DWORD *a2)
{
  uint64_t v2 = (_DWORD *)result;
  if (a2)
  {
    double result = *a2;
    if (result)
    {
      double result = IOObjectRelease(result);
      *a2 = 0;
    }
  }
  if (v2)
  {
    double result = *v2;
    if (result)
    {
      double result = IOObjectRelease(result);
      *uint64_t v2 = 0;
    }
  }
  return result;
}

void PPMCallbackHandler_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1DB92B000, v0, v1, "<Error> set client current power consumption call failed with err 0x%08x\n", v2, v3, v4, v5, v6);
}

void PPMCallbackHandler_cold_2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 clientId];
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1DB92B000, a2, OS_LOG_TYPE_DEBUG, "<Debug> Getting current power consumption for CPMS clientId %lu\n", v3, 0xCu);
}

void PPMCallbackHandler_cold_3(void *a1)
{
  [a1 clientId];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15(&dword_1DB92B000, v1, v2, "<Error> CPMS clientId %lu, unsupported timescalesAvailable 0x%x", v3, v4, v5, v6, v7);
}

void PPMCallbackHandler_cold_4(void *a1)
{
  [a1 clientId];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15(&dword_1DB92B000, v1, v2, "<Error> CPMS clientId %lu ret 0x%08x", v3, v4, v5, v6, v7);
}

void openIOConnectObjectForApplePPM_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> NULL arguments passed in to function", v2, v3, v4, v5, v6);
}

void openIOConnectObjectForApplePPM_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DB92B000, v0, v1, "<Error> no matching service found", v2, v3, v4, v5, v6);
}

void openIOConnectObjectForApplePPM_cold_3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB92B000, a2, OS_LOG_TYPE_ERROR, "<Error> failed to open service (0x%08x)", (uint8_t *)v2, 8u);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86D8](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}