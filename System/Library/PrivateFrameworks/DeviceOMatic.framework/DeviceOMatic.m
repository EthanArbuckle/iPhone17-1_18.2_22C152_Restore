uint64_t DOMRegisterForMatching(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __DOMRegisterForMatching_block_invoke;
  v15[3] = &unk_2649DD8E8;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = a1;
  v10 = DOMRegisterForMatching_onceToken;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  if (v10 != -1) {
    dispatch_once(&DOMRegisterForMatching_onceToken, v15);
  }

  return 0;
}

void __DOMRegisterForMatching_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFStringGetCString(*(CFStringRef *)(a1 + 56), buffer, 256, 0x8000100u);
  xpc_connection_t mach_service = xpc_connection_create_mach_service(buffer, *(dispatch_queue_t *)(a1 + 32), 1uLL);
  v3 = (void *)DOMRegisterForMatching_listener;
  DOMRegisterForMatching_listener = (uint64_t)mach_service;

  v4 = (_xpc_connection_s *)DOMRegisterForMatching_listener;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __DOMRegisterForMatching_block_invoke_2;
  handler[3] = &unk_2649DD8C0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume((xpc_connection_t)DOMRegisterForMatching_listener);
}

void __DOMRegisterForMatching_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  logEvent(v3, (uint64_t)"Plugin Main:");
  uint64_t v4 = MEMORY[0x230FA4EF0](v3);
  if (v4 == MEMORY[0x263EF86F0])
  {
    id v6 = v3;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __DOMRegisterForMatching_block_invoke_3;
    handler[3] = &unk_2649DD898;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v8 = v6;
    xpc_connection_set_event_handler((xpc_connection_t)v6, handler);
    xpc_connection_resume((xpc_connection_t)v6);

    v5 = v9;
    goto LABEL_5;
  }
  if (v4 == MEMORY[0x263EF8720])
  {
    errorEvent(v3, (uint64_t)"listener error");
    xpc_connection_cancel((xpc_connection_t)DOMRegisterForMatching_listener);
    v5 = (void *)DOMRegisterForMatching_listener;
    DOMRegisterForMatching_listener = 0;
LABEL_5:
  }
}

void __DOMRegisterForMatching_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  logEvent(v3, (uint64_t)"Plugin Inner:");
  if (v3 == (id)MEMORY[0x263EF86A8]) {
    goto LABEL_52;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E80D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Handling Message", buf, 2u);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  if (MEMORY[0x230FA4EF0](v6) == MEMORY[0x263EF8708])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "_LB_TYPE");
    if (uint64)
    {
      uint64_t v10 = uint64;
      if (uint64 < 4)
      {
        if (uint64 != 2)
        {
          if (uint64 == 1)
          {
            id v46 = v8;
            id v11 = v6;
            v12 = (unsigned int (**)(id, uint64_t, const void *, unsigned char *))v7;
            uint64_t v13 = xpc_dictionary_get_uint64(v11, "_LB_SERVICE_ID");
            *(void *)buf = xpc_dictionary_get_int64(v11, "_LB_PROBE_SCORE");
            v14 = xpc_dictionary_get_value(v11, "_LB_PERSONALITY");
            if (v14 && (uint64_t v15 = _CFXPCCreateCFObjectFromXPCObject()) != 0)
            {
              v16 = (const void *)v15;
              id v42 = v7;
              mach_port_t v17 = *MEMORY[0x263F0EC88];
              CFDictionaryRef v18 = IORegistryEntryIDMatching(v13);
              uint64_t MatchingService = IOServiceGetMatchingService(v17, v18);
              if (MatchingService) {
                BOOL v20 = v12[2](v12, MatchingService, v16, buf) != 0;
              }
              else {
                BOOL v20 = 0;
              }
              xpc_object_t reply = xpc_dictionary_create_reply(v11);
              xpc_dictionary_set_uint64(reply, "_LB_TYPE", 3uLL);
              xpc_dictionary_set_int64(reply, "_LB_PROBE_SCORE", *(int64_t *)buf);
              xpc_dictionary_set_BOOL(reply, "_LB_SUPPORTS", v20);
              xpc_dictionary_get_remote_connection(reply);
              v39 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
              xpc_connection_send_message(v39, reply);

              if (MatchingService) {
                IOObjectRelease(MatchingService);
              }
              CFRelease(v16);

              int v37 = 0;
              id v7 = v42;
            }
            else
            {
              int v37 = 3;
            }

            id v8 = v46;
            goto LABEL_48;
          }
          goto LABEL_47;
        }
        id v21 = v6;
        id v45 = v8;
        uint64_t v22 = xpc_dictionary_get_uint64(v21, "_LB_SERVICE_ID");
        mach_port_t v23 = *MEMORY[0x263F0EC88];
        CFDictionaryRef v24 = IORegistryEntryIDMatching(v22);
        uint64_t v25 = IOServiceGetMatchingService(v23, v24);
        if (!v25)
        {
          v40 = 0;
          v27 = 0;
          int v37 = 2;
          v34 = v45;
LABEL_44:

          goto LABEL_48;
        }
        uint64_t v26 = v25;
        uint64_t v44 = xpc_dictionary_get_value(v21, "_LB_PERSONALITY");
        if (v44 && (CFTypeRef cf = (CFTypeRef)_CFXPCCreateCFObjectFromXPCObject()) != 0)
        {
          v27 = xpc_dictionary_get_value(v21, "_LB_CLAIMED");
          if (v27)
          {
            Mutable = CFArrayCreateMutable(0, 0, 0);
            if (xpc_array_get_count(v27))
            {
              id v41 = v21;
              id v47 = v8;
              id v43 = v7;
              size_t v29 = 0;
              v30 = &_os_log_internal;
              do
              {
                uint64_t v31 = xpc_array_get_uint64(v27, v29);
                CFDictionaryRef v32 = IORegistryEntryIDMatching(v31);
                uint64_t v33 = IOServiceGetMatchingService(v23, v32);
                uint64_t v26 = v33;
                if (v33)
                {
                  CFArrayAppendValue(Mutable, (const void *)v33);
                }
                else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&buf[4] = v31;
                  _os_log_impl(&dword_22E80D000, v30, OS_LOG_TYPE_DEFAULT, "Couldn't create service for id %llx", buf, 0xCu);
                }
                ++v29;
              }
              while (v29 < xpc_array_get_count(v27));
              id v7 = v43;
              id v8 = v47;
              id v21 = v41;
            }
            v34 = v45;
            (*((void (**)(id, uint64_t, CFTypeRef, __CFArray *))v45 + 2))(v45, v26, cf, Mutable);
            if (Mutable)
            {
              if (CFArrayGetCount(Mutable) >= 1)
              {
                CFIndex v35 = 0;
                do
                {
                  io_object_t ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v35);
                  IOObjectRelease(ValueAtIndex);
                  ++v35;
                }
                while (CFArrayGetCount(Mutable) > v35);
              }
              CFRelease(Mutable);
              v34 = v45;
            }
            int v37 = 0;
            if (!v26) {
              goto LABEL_41;
            }
          }
          else
          {
            v34 = v45;
            (*((void (**)(id, uint64_t, CFTypeRef, void))v45 + 2))(v45, v26, cf, 0);
            int v37 = 0;
          }
        }
        else
        {
          v27 = 0;
          CFTypeRef cf = 0;
          int v37 = 3;
          v34 = v45;
        }
        IOObjectRelease(v26);
LABEL_41:
        if (cf) {
          CFRelease(cf);
        }
        v40 = (void *)v44;
        goto LABEL_44;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v10;
        _os_log_impl(&dword_22E80D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "got weird type from LB: %lld", buf, 0xCu);
      }
    }
  }
LABEL_47:
  int v37 = 1;
LABEL_48:

  if (v37)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __DOMRegisterForMatching_block_invoke_3_cold_1(v37);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
LABEL_52:
}

id NSLocalizedString(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = v2;
  if (!v2)
  {
    uint64_t v4 = 0;
    uint64_t v13 = 0;
    goto LABEL_21;
  }
  uint64_t v4 = [v2 localizations];
  if (!v4) {
    goto LABEL_20;
  }
  v5 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x263EFFE48], @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  id v6 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:v4 forPreferences:v5];
  if (![v6 count])
  {

LABEL_19:
LABEL_20:
    uint64_t v13 = objc_msgSend(v3, "localizedStringForKey:value:table:", v1, v1, @"Localizable", (void)v15);
    goto LABEL_21;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(v3, "localizedStringForKey:value:table:localization:", v1, 0, @"Localizable", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          goto LABEL_16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_16:

  if (!v13) {
    goto LABEL_20;
  }
LABEL_21:

  return v13;
}

uint64_t getLogHandle()
{
  if (getLogHandle_onceToken != -1) {
    dispatch_once(&getLogHandle_onceToken, &__block_literal_global);
  }
  return getLogHandle_gLogHandle;
}

uint64_t __getLogHandle_block_invoke()
{
  uint64_t result = MOLogOpen();
  getLogHandle_gLogHandle = result;
  return result;
}

id stringFromObject(void *a1)
{
  return printObjectToString(a1, 0, 0);
}

id printObjectToString(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
    if (v5) {
      goto LABEL_3;
    }
LABEL_12:
    long long v15 = @"NULL";
LABEL_13:
    [v7 appendString:v15];
    goto LABEL_25;
  }
  if (!v5) {
    goto LABEL_12;
  }
LABEL_3:
  if (![v7 length]
    || (objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v7, "length") - 1),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"\n"],
        v8,
        v9))
  {
    objc_msgSend(v7, "appendFormat:", @"%*s", (2 * a2), &unk_22E810917);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2) {
      uint64_t v10 = @"<dict>\n";
    }
    else {
      uint64_t v10 = @"\n<dict>\n";
    }
    id v11 = (id)printObjectToString(v10, a2, v7);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __printObjectToString_block_invoke;
    v33[3] = &unk_2649DD980;
    int v35 = a2;
    id v12 = v7;
    id v34 = v12;
    [v5 enumerateKeysAndObjectsUsingBlock:v33];
    id v13 = (id)printObjectToString(@"</dict>", a2, v12);
    v14 = v34;
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2) {
      long long v16 = @"<array>\n";
    }
    else {
      long long v16 = @"\n<array>\n";
    }
    id v17 = (id)printObjectToString(v16, a2, v7);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __printObjectToString_block_invoke_2;
    v30[3] = &unk_2649DD9A8;
    int v32 = a2;
    id v18 = v7;
    id v31 = v18;
    [v5 enumerateObjectsUsingBlock:v30];
    id v19 = (id)printObjectToString(@"</array>", a2, v18);
    v14 = v31;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2) {
      uint64_t v20 = @"<set>\n";
    }
    else {
      uint64_t v20 = @"\n<set>\n";
    }
    id v21 = (id)printObjectToString(v20, a2, v7);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __printObjectToString_block_invoke_3;
    v27[3] = &unk_2649DD9D0;
    int v29 = a2;
    id v22 = v7;
    id v28 = v22;
    [v5 enumerateObjectsUsingBlock:v27];
    id v23 = (id)printObjectToString(@"</set>", a2, v22);
    v14 = v28;
    goto LABEL_24;
  }
  CFTypeID v25 = CFGetTypeID(v5);
  if (v25 == CFBooleanGetTypeID())
  {
    if ([v5 BOOLValue]) {
      long long v15 = @"true";
    }
    else {
      long long v15 = @"false";
    }
    goto LABEL_13;
  }
  uint64_t v26 = [v5 description];
  [v7 appendString:v26];

LABEL_25:

  return v7;
}

uint64_t serviceIsAttachedToRemovableDevice(io_object_t a1)
{
  kern_return_t ParentEntry;
  int *v6;
  char *v7;
  void v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[24];
  uint64_t v19;

  id v19 = *MEMORY[0x263EF8340];
  id v12 = 0;
  id v13 = &v12;
  v14 = 0x2020000000;
  long long v15 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  int v9 = (void (*)(void))__serviceIsAttachedToRemovableDevice_block_invoke;
  uint64_t v10 = &unk_2649DD930;
  id v11 = &v12;
  v2 = v8;
  id v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry) {
          break;
        }
        a1 = parent;
        if (!parent) {
          goto LABEL_3;
        }
        ((void (*)(void *, void, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        id v6 = __error();
        id v7 = strerror(*v6);
        serviceIsAttachedToRemovableDevice_cold_1((uint64_t)v7, buf);
      }
    }
  }
LABEL_3:

  uint64_t v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_22E80EDB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void __serviceIsAttachedToRemovableDevice_block_invoke(uint64_t a1, io_registry_entry_t entry, unsigned char *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"removable", 0, 0);
  if (CFProperty)
  {
    id v6 = CFProperty;
    if (CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x263EFFB40]))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

__CFDictionary *propertiesForRegistryEntryID(uint64_t a1)
{
  CFDictionaryRef v1 = IORegistryEntryIDMatching(a1);
  if (v1 && (io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v1)) != 0)
  {
    io_object_t v3 = MatchingService;
    CFMutableDictionaryRef properties = 0;
    uint64_t v4 = 0;
    if (!IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0)) {
      uint64_t v4 = properties;
    }
    IOObjectRelease(v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t getAllChildren(uint64_t a1, __CFDictionary *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (getAllChildren_onceToken != -1) {
    dispatch_once(&getAllChildren_onceToken, &__block_literal_global_15);
  }
  id v6 = (void *)getAllChildren__match;
  if (v5) {
    id v6 = v5;
  }
  CFDictionaryRef v7 = v6;
  io_iterator_t iterator = 0;
  MEMORY[0x230FA4AA0](a1, "IOService", &iterator);
  io_object_t v8 = IOIteratorNext(iterator);
  if (v8)
  {
    io_service_t v9 = v8;
    char v34 = 0;
    uint64_t v10 = &_os_log_internal;
    id v28 = a2;
    id v29 = v5;
    CFDictionaryRef v32 = v7;
    do
    {
      IOServiceWaitQuiet(v9, 0);
      uint64_t entryID = 0;
      IORegistryEntryGetRegistryEntryID(v9, &entryID);
      CFNumberRef cf = CFNumberCreate(0, kCFNumberSInt64Type, &entryID);
      memset(className, 0, 128);
      IOObjectGetClass(v9, className);
      CFStringRef key = CFStringCreateWithFormat(0, 0, @"%s, %lld (0x%016llx)", className, entryID, entryID);
      if (v7)
      {
        matches[0] = 0;
        IOServiceMatchPropertyTable(v9, v7, matches);
        if (matches[0])
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v52 = key;
            _os_log_impl(&dword_22E80D000, v10, OS_LOG_TYPE_DEFAULT, "%@ matches via IOServiceMatchPropertyTable", buf, 0xCu);
          }
          char v34 = 1;
        }
      }
      *(void *)matches = 0;
      IORegistryEntryCreateCFProperties(v9, (CFMutableDictionaryRef *)matches, 0, 0);
      if (a2) {
        CFDictionarySetValue(a2, key, *(const void **)matches);
      }
      if (!((v5 == 0) | v34 & 1))
      {
        io_service_t v30 = v9;
        uint64_t v38 = [v5 count];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        obuint64_t j = v7;
        uint64_t v36 = [(__CFDictionary *)obj countByEnumeratingWithState:&v44 objects:v62 count:16];
        if (v36)
        {
          uint64_t v11 = 0;
          char v34 = 0;
          uint64_t v35 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v45 != v35) {
                objc_enumerationMutation(obj);
              }
              CFDictionaryRef v13 = *(const __CFDictionary **)(*((void *)&v44 + 1) + 8 * i);
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              id v14 = *(id *)matches;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v61 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v37 = i;
                uint64_t v17 = *(void *)v41;
                while (2)
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v41 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    id v19 = *(const void **)(*((void *)&v40 + 1) + 8 * j);
                    if ([(__CFDictionary *)v13 isEqualToString:v19])
                    {
                      uint64_t v20 = v10;
                      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                      {
                        id v21 = [(__CFDictionary *)obj objectForKey:v13];
                        id v22 = [*(id *)matches objectForKey:v19];
                        *(_DWORD *)buf = 134219010;
                        CFStringRef v52 = (CFStringRef)v11;
                        __int16 v53 = 2112;
                        CFDictionaryRef v54 = v13;
                        __int16 v55 = 2112;
                        v56 = v19;
                        __int16 v57 = 2112;
                        v58 = v21;
                        __int16 v59 = 2112;
                        v60 = v22;
                        _os_log_impl(&dword_22E80D000, v20, OS_LOG_TYPE_DEFAULT, "[%lu] comparing keys %@:%@ and values %@:%@", buf, 0x34u);
                      }
                      id v23 = [(__CFDictionary *)obj objectForKey:v13];
                      CFDictionaryRef v24 = [*(id *)matches objectForKey:v19];
                      int v25 = [v23 isEqual:v24];

                      if (v25)
                      {
                        ++v11;
                        uint64_t v10 = v20;
                        if (v11 == v38)
                        {
                          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412802;
                            CFStringRef v52 = key;
                            __int16 v53 = 2112;
                            CFDictionaryRef v54 = v32;
                            __int16 v55 = 2112;
                            v56 = *(const void **)matches;
                            _os_log_impl(&dword_22E80D000, v20, OS_LOG_TYPE_DEFAULT, "%@ MATCHED %@ with %@", buf, 0x20u);
                          }
                          char v34 = 1;
                          uint64_t v11 = v38;
                          goto LABEL_38;
                        }
                      }
                      else
                      {
                        uint64_t v10 = v20;
                      }
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v61 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
LABEL_38:
                uint64_t i = v37;
              }
            }
            uint64_t v36 = [(__CFDictionary *)obj countByEnumeratingWithState:&v44 objects:v62 count:16];
          }
          while (v36);
        }
        else
        {
          char v34 = 0;
        }

        a2 = v28;
        id v5 = v29;
        CFDictionaryRef v7 = v32;
        io_service_t v9 = v30;
      }
      CFRelease(key);
      CFRelease(cf);
      CFRelease(*(CFTypeRef *)matches);
      IOObjectRelease(v9);
      io_service_t v9 = IOIteratorNext(iterator);
    }
    while (v9);
  }
  else
  {
    char v34 = 0;
  }
  IOObjectRelease(iterator);

  return v34 & 1;
}

uint64_t __getAllChildren_block_invoke()
{
  getAllChildren__match = [objc_alloc(MEMORY[0x263EFF9A0]) initWithContentsOfFile:@"/tmp/test.plist"];

  return MEMORY[0x270F9A758]();
}

void printAllChildren(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  getAllChildren(objc_msgSend(v1, "io_service"), Mutable, 0);
  id v4 = printObjectToString(Mutable, 2, v2);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = v1;
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_22E80D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@\nchildren: %@", (uint8_t *)&v5, 0x16u);
  }
  CFRelease(Mutable);
}

void printChildSet(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v13 = a1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = a2;
  uint64_t v15 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v23;
    io_object_t v3 = &_os_log_internal;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v4;
        int v5 = *(void **)(*((void *)&v22 + 1) + 8 * v4);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v28 = v13;
          __int16 v29 = 2112;
          io_service_t v30 = v5;
          _os_log_impl(&dword_22E80D000, v3, OS_LOG_TYPE_DEFAULT, "%@ child %@", buf, 0x16u);
        }
        id v6 = [obj objectForKey:v5];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
                id v12 = [v6 objectForKey:v11];
                *(_DWORD *)buf = 138412546;
                id v28 = v11;
                __int16 v29 = 2112;
                io_service_t v30 = v12;
                _os_log_impl(&dword_22E80D000, v3, OS_LOG_TYPE_DEFAULT, "\tproperty %@: %@", buf, 0x16u);
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v17 + 1;
      }
      while (v17 + 1 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v15);
  }
}

id copyEntryProperties(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef properties = 0;
  memset(v6, 0, 512);
  IORegistryEntryGetNameInPlane(a1, "IOService", name);
  MEMORY[0x230FA4AD0](a1, "IOService", v6);
  IORegistryEntryCreateCFProperties(a1, &properties, 0, 0);
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v2 appendFormat:@"%s:\nPath:\n%s\n%@\n", name, v6, printObjectToString(properties, 0, 0)];

  return v2;
}

const char *stringForXPCType(uint64_t a1)
{
  if (a1 == MEMORY[0x263EF86F0]) {
    return "XPC_TYPE_CONNECTION";
  }
  if (a1 == MEMORY[0x263EF8758]) {
    return "XPC_TYPE_NULL";
  }
  if (a1 == MEMORY[0x263EF86E0]) {
    return "XPC_TYPE_BOOL";
  }
  if (a1 == MEMORY[0x263EF8738]) {
    return "XPC_TYPE_INT64";
  }
  if (a1 == MEMORY[0x263EF87A0]) {
    return "XPC_TYPE_UINT64";
  }
  if (a1 == MEMORY[0x263EF8710]) {
    return "XPC_TYPE_DOUBLE";
  }
  if (a1 == MEMORY[0x263EF8700]) {
    return "XPC_TYPE_DATE";
  }
  if (a1 == MEMORY[0x263EF86F8]) {
    return "XPC_TYPE_DATA";
  }
  if (a1 == MEMORY[0x263EF8798]) {
    return "XPC_TYPE_STRING";
  }
  if (a1 == MEMORY[0x263EF87A8]) {
    return "XPC_TYPE_UUID";
  }
  if (a1 == MEMORY[0x263EF8728]) {
    return "XPC_TYPE_FD";
  }
  if (a1 == MEMORY[0x263EF8790]) {
    return "XPC_TYPE_SHMEM";
  }
  if (a1 == MEMORY[0x263EF86D8]) {
    return "XPC_TYPE_ARRAY";
  }
  if (a1 == MEMORY[0x263EF8708]) {
    return "XPC_TYPE_DICTIONARY";
  }
  if (a1 == MEMORY[0x263EF8720]) {
    return "XPC_TYPE_ERROR";
  }
  return "Unknown type";
}

void errorEvent(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = MEMORY[0x230FA4EF0]();
  int v5 = &_os_log_internal;
  id v6 = &_os_log_internal;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    errorEvent_cold_1(a2, v4, v3);
  }
}

void logEvent(void *a1, uint64_t a2)
{
  id v3 = a1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  uint64_t v7 = __logEvent_block_invoke;
  uint64_t v8 = &unk_2649DD958;
  id v4 = v3;
  id v9 = v4;
  uint64_t v10 = a2;
  int v5 = v6;
  if (getLogHandle_onceToken != -1) {
    dispatch_once(&getLogHandle_onceToken, &__block_literal_global);
  }
  if (getLogHandle_gLogHandle && *(int *)(getLogHandle_gLogHandle + 44) >= 5) {
    v7((uint64_t)v5);
  }
}

void __logEvent_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = MEMORY[0x230FA4EF0](*(void *)(a1 + 32));
  id v3 = &_os_log_internal;
  id v4 = &_os_log_internal;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = stringForXPCType(v2);
    if (v2 == MEMORY[0x263EF8720]) {
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x263EF86B0]);
    }
    else {
      string = (const char *)&unk_22E810917;
    }
    int v8 = 136315650;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = string;
    _os_log_impl(&dword_22E80D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }
}

void __printObjectToString_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = (id)printObjectToString(a2, (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  id v6 = (id)printObjectToString(@" : ", (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  id v7 = (id)printObjectToString(v9, (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  id v8 = (id)printObjectToString(@"\n", (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
}

id __printObjectToString_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = (id)printObjectToString(a2, (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  return (id)printObjectToString(@"\n", (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
}

id __printObjectToString_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = (id)printObjectToString(a2, (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  return (id)printObjectToString(@"\n", (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
}

void __DOMRegisterForMatching_block_invoke_3_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_22E80D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Bad juju: %d", (uint8_t *)v1, 8u);
}

void serviceIsAttachedToRemovableDevice_cold_1(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22E80D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "IORegistryEntryGetParentIterator failed: %s", buf, 0xCu);
}

void errorEvent_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = stringForXPCType(a2);
  if (a2 == MEMORY[0x263EF8720]) {
    string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x263EF86B0]);
  }
  else {
    string = (const char *)&unk_22E810917;
  }
  int v8 = 136315650;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  uint64_t v11 = v6;
  __int16 v12 = 2080;
  id v13 = string;
  _os_log_error_impl(&dword_22E80D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s %s %s", (uint8_t *)&v8, 0x20u);
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

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return MEMORY[0x270EF4800](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return MEMORY[0x270EF4A10](*(void *)&entry, plane, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetPath(io_registry_entry_t entry, const io_name_t plane, io_string_t path)
{
  return MEMORY[0x270EF4A28](*(void *)&entry, plane, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceMatchPropertyTable(io_service_t service, CFDictionaryRef matching, BOOLean_t *matches)
{
  return MEMORY[0x270EF4AC8](*(void *)&service, matching, matches);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x270EF4AF0](*(void *)&service, waitTime);
}

uint64_t MOLogOpen()
{
  return MEMORY[0x270F4B388]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x270EDBD78](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}