uint64_t start()
{
  void *v0;

  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100010610);
  CFRunLoopRun();
  return 0;
}

void sub_100003158(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    v4 = string;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received %s", (uint8_t *)&v14, 0xCu);
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v2, "IOMatchLaunchServiceID");
    CFDictionaryRef v6 = IORegistryEntryIDMatching(uint64);
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (MatchingService)
    {
      uint64_t v8 = MatchingService;
      v9 = +[NSString stringWithUTF8String:v4];
      v10 = +[NSString stringWithFormat:@"com.apple.device-o-matic.overcurrent"];
      unsigned int v11 = [v9 isEqualToString:v10];

      v12 = +[DOMAccessoryArbitrator sharedDomAccessoryArbitrator];
      v13 = v12;
      if (v11) {
        [v12 overcurrentCondition:v8];
      }
      else {
        [v12 deviceArrived:v8];
      }
    }
  }
}

void sub_100003800(id a1, OS_xpc_object *a2)
{
}

void sub_100003AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003B20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003B30(uint64_t a1)
{
}

void sub_100003B38(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10000A364(v3, (uint64_t)"sendreply handler");
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_uint64(v3, "_LB_TYPE") == 3)
    {
      if (xpc_dictionary_get_BOOL(v3, "_LB_SUPPORTS"))
      {
        uint64_t v4 = +[NSNumber numberWithLongLong:xpc_dictionary_get_int64(v3, "_LB_PROBE_SCORE")];
        uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
        CFDictionaryRef v6 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v4;

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v7 = [*(id *)(a1 + 32) xpcName];
          int v9 = 138412546;
          uint64_t uint64 = (uint64_t)v7;
          __int16 v11 = 2048;
          int64 = (const char *)xpc_dictionary_get_int64(v3, "_LB_PROBE_SCORE");
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ probe returned: %lld", (uint8_t *)&v9, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [*(id *)(a1 + 32) xpcName];
        int v9 = 138412802;
        uint64_t uint64 = (uint64_t)v8;
        __int16 v11 = 2080;
        int64 = "_LB_SUPPORTS";
        __int16 v13 = 2112;
        id v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ returned %s false in response dict: %@", (uint8_t *)&v9, 0x20u);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t uint64 = xpc_dictionary_get_uint64(v3, "_LB_TYPE");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got unexpected ipc type: %llu", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000A730(v3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000438C(id a1)
{
  qword_100014FF0 = objc_alloc_init(DOMAccessoryArbitrator);

  _objc_release_x1();
}

id sub_100004580(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addMatchJobServiceNamed:0 info:a2 jobType:2];
}

uint64_t sub_100004DFC()
{
  if (qword_100015010 != -1) {
    dispatch_once(&qword_100015010, &stru_1000107F0);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_100014FE8) {
      v0 = "TRUE";
    }
    else {
      v0 = "FALSE";
    }
    int v2 = 136315138;
    id v3 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "returning %s", (uint8_t *)&v2, 0xCu);
  }
  return byte_100014FE8;
}

void sub_100004EE4(uint64_t a1)
{
  id v2 = +[DOMAccessoryArbitrator sharedDomAccessoryArbitrator];
  [v2 userDismissedNotification:a1];
}

void sub_10000521C(uint64_t a1)
{
  id v2 = +[DOMAccessoryArbitrator sharedDomAccessoryArbitrator];
  [v2 userDismissedOvercurrentNotification:a1];
}

void sub_100005348(uint64_t a1)
{
  [*(id *)(a1 + 32) displayDialog];
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_source_cancel(v2);
}

id sub_100005438(void *a1, io_iterator_t iterator)
{
  for (io_iterator_t i = iterator; ; io_iterator_t i = iterator)
  {
    io_object_t v5 = IOIteratorNext(i);
    if (!v5) {
      break;
    }
    IOObjectRelease(v5);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFDictionaryRef v6 = [a1 name];
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "kicking %@!", (uint8_t *)&v8, 0xCu);
  }
  return [a1 kick];
}

id sub_1000055A4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [a4 name];
    int v9 = 138412546;
    uint64_t v10 = a3;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got a notification:%@ for job %@!", (uint8_t *)&v9, 0x16u);
  }
  return [a2 kick];
}

void sub_100005A60(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFDictionaryRef v6 = [*(id *)(a1 + 32) personalities];
      v7 = [[DOMPersonality alloc] initWithPersonality:v5 personalityName:v8 serviceName:*(void *)(a1 + 40)];
      [v6 addObject:v7];
    }
  }
}

void sub_100005E08(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"Disabled"];
  if (!v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v4 BOOLValue] & 1) == 0)
  {
    id v5 = [v3 objectForKey:@"MachServices"];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_100005F1C;
        v6[3] = &unk_100010738;
        v6[4] = *(void *)(a1 + 32);
        [v5 enumerateKeysAndObjectsUsingBlock:v6];
      }
    }
  }
}

void sub_100005F1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v8 = -1;
    v7 = [*(id *)(a1 + 32) jobType:v6 jobType:&v8];
    if (v7) {
      [*(id *)(a1 + 32) addMatchJobServiceNamed:v5 info:v7 jobType:v8];
    }
  }
}

void sub_10000609C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOLean_t matches = 0;
  io_service_t v4 = *(_DWORD *)(a1 + 48);
  CFDictionaryRef v5 = [v3 personalityDict];
  IOServiceMatchPropertyTable(v4, v5, &matches);

  if (matches)
  {
    uint64_t entryID = 0;
    IORegistryEntryGetRegistryEntryID(*(_DWORD *)(a1 + 48), &entryID);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 personalityName];
      v7 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, ">>>>>>> Probing personality \"%@\" for device \"%@\"", buf, 0x16u);
    }
    unsigned int v8 = *(NSObject **)(a1 + 40);
    int v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006260;
    block[3] = &unk_100010760;
    id v11 = v3;
    uint64_t v13 = entryID;
    id v12 = *(id *)(a1 + 32);
    dispatch_group_async(v8, v9, block);
  }
}

id sub_100006260(uint64_t a1)
{
  return [*(id *)(a1 + 32) probeIORegEntryID:*(void *)(a1 + 48) forDomDevice:*(void *)(a1 + 40)];
}

void sub_1000068CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

uint64_t sub_100006918(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006928(uint64_t a1)
{
}

void sub_100006930(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v2 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    io_service_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  CFMutableDictionaryRef properties = 0;
  memset(name, 0, 128);
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 40), &properties, 0, 0) || !properties)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000AB10((int *)(a1 + 40));
    }
  }
  else
  {
    if (IORegistryEntryGetName(*(_DWORD *)(a1 + 40), name))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000AA8C((int *)(a1 + 40));
      }
    }
    else
    {
      CFDictionaryRef v5 = properties;
      id v6 = +[NSString stringWithUTF8String:name];
      CFDictionaryAddValue(v5, @"IORegistryEntryName", v6);
    }
    v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    CFMutableDictionaryRef v8 = properties;
    int v9 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    [v7 setObject:v8 forKey:v9];

    CFRelease(properties);
  }
}

void sub_100007070(int a1, io_registry_entry_t entry, int a3)
{
  if (a3 == -536870608)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, @"OvercurrentCount", kCFAllocatorDefault, 0);
    if (!CFProperty)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        id v6 = "IOServiceOvercurrentMatchingCallback";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: No longer overcurrent. Release dialog", (uint8_t *)&v5, 0xCu);
      }
      io_service_t v4 = +[DOMAccessoryArbitrator sharedDomAccessoryArbitrator];
      [v4 releaseOverCurrentDialog];
    }
  }
}

void sub_1000071B4(id a1)
{
  CFBooleanRef v1 = (const __CFBoolean *)CFPreferencesCopyValue(@"StoreDemoMode", @"com.apple.demo-settings", @"mobile", kCFPreferencesAnyHost);
  if (v1)
  {
    CFBooleanRef v2 = v1;
    BOOL v3 = CFBooleanGetValue(v1) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 67109120;
    unsigned int v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StoreDemoMode: %d", (uint8_t *)&v7, 8u);
  }
  if (v3)
  {
    io_service_t v4 = (void *)CFPreferencesCopyValue(@"FProgramNumber", @"com.apple.demo-settings", @"mobile", kCFPreferencesAnyHost);
    if (v4)
    {
      int v5 = v4;
      if ([v4 intValue] == 5) {
        byte_100015008 = 1;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v6 = [v5 intValue];
        int v7 = 67109120;
        unsigned int v8 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FProgramNumber: %d", (uint8_t *)&v7, 8u);
      }
    }
  }
}

void sub_1000073DC(id a1)
{
  CFBooleanRef v1 = (const __CFBoolean *)CFPreferencesCopyValue(@"DISABLE_DIALOGS", @"com.apple.mobile.device_o_matic", @"mobile", kCFPreferencesCurrentHost);
  if (v1)
  {
    CFBooleanRef v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID())
    {
      int Value = CFBooleanGetValue(v2);
      byte_100014FE8 = Value == 0;
      if (!Value)
      {
        BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v5) {
          sub_10000AC10(v5, v6, v7, v8, v9, v10, v11, v12);
        }
      }
    }
    CFRelease(v2);
  }
}

void sub_10000747C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007498(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL sub_100007C08(io_registry_entry_t a1)
{
  int valuePtr = -1;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"bDeviceClass", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFTypeID v3 = CFGetTypeID(CFProperty);
    if (v3 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v2, kCFNumberIntType, &valuePtr);
      BOOL v4 = valuePtr == 9;
    }
    else
    {
      BOOL v4 = 0;
    }
    CFRelease(v2);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000AEE8();
    }
    return 0;
  }
  return v4;
}

uint64_t sub_100007CC0(io_registry_entry_t a1)
{
  io_iterator_t iterator = 0;
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID(a1, &entryID);
  if (!IORegistryEntryCreateIterator(a1, "IOService", 3u, &iterator))
  {
    uint64_t v2 = 0;
    CFAllocatorRef v3 = kCFAllocatorDefault;
    CFStringRef v4 = @"IOUSBDevice";
    CFStringRef v5 = @"bDeviceClass";
    uint64_t v6 = &_os_log_default;
    while (1)
    {
      io_object_t v7 = IOIteratorNext(iterator);
      if (!v7) {
        goto LABEL_24;
      }
      io_object_t v8 = v7;
      uint64_t v9 = (__CFString *)IOObjectCopyClass(v7);
      CFMutableDictionaryRef properties = 0;
      if (([(__CFString *)v9 isEqualToString:v4] & 1) == 0)
      {
        if (!IORegistryEntryCreateCFProperties(v8, &properties, v3, 0))
        {
          CFMutableDictionaryRef v26 = properties;
          uint64_t v13 = [(__CFDictionary *)properties valueForKey:v5];
          if (v13)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              +[NSNumber numberWithInt:9];
              CFAllocatorRef v14 = v3;
              CFStringRef v15 = v4;
              v16 = v6;
              uint64_t v17 = v2;
              v19 = CFStringRef v18 = v5;
              unsigned int v20 = [v13 isEqual:v19];

              CFStringRef v5 = v18;
              uint64_t v2 = v17;
              uint64_t v6 = v16;
              CFStringRef v4 = v15;
              CFAllocatorRef v3 = v14;
              if (v20)
              {
                IOObjectRelease(v8);
                if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We are hanging off a hub, bub.", buf, 2u);
                }
                uint64_t v2 = 1;
                int v12 = 6;
                goto LABEL_20;
              }
            }
            else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              v21 = objc_opt_class();
              id v25 = v21;
              v22 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v31 = (char *)v21;
              __int16 v32 = 2112;
              v33 = v22;
              id v23 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "got object class %@, expected %@", buf, 0x16u);
            }
          }
          IOObjectRelease(v8);
          int v12 = 0;
LABEL_20:

          goto LABEL_9;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = __error();
          uint64_t v11 = strerror(*v10);
          *(_DWORD *)buf = 136315138;
          v31 = v11;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed: %s", buf, 0xCu);
        }
      }
      int v12 = 5;
LABEL_9:

      if (v12 == 6) {
        goto LABEL_24;
      }
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000AF30();
  }
  LOBYTE(v2) = 0;
LABEL_24:
  IOObjectRelease(iterator);
  return v2 & 1;
}

void sub_1000087E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) longLongValue];
  CFAllocatorRef v3 = [*(id *)(a1 + 40) winningScore];
  id v4 = [v3 longLongValue];

  if ((uint64_t)v2 >= (uint64_t)v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = [*(id *)(a1 + 48) personalityName];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      io_object_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "New winner: personality: %@, score: %@", (uint8_t *)&v7, 0x16u);
    }
    [*(id *)(a1 + 40) setWinningScore:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setWinningDomPersonality:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setWinningIORegEntryID:*(void *)(a1 + 56)];
  }
}

id sub_100008CE0(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle mainBundle];
  CFAllocatorRef v3 = v2;
  if (!v2)
  {
    id v4 = 0;
    uint64_t v13 = 0;
    goto LABEL_21;
  }
  id v4 = [v2 localizations];
  if (!v4) {
    goto LABEL_20;
  }
  CFStringRef v5 = (void *)CFPreferencesCopyValue(@"AppleLanguages", kCFPreferencesAnyApplication, @"mobile", kCFPreferencesAnyHost);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v6 = +[NSBundle preferredLocalizationsFromArray:v4 forPreferences:v5];
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
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (io_iterator_t i = 0; i != v9; io_iterator_t i = (char *)i + 1)
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
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
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

uint64_t sub_100008F08()
{
  if (qword_100015020 != -1) {
    dispatch_once(&qword_100015020, &stru_100010838);
  }
  return qword_100015018;
}

void sub_100008F4C(id a1)
{
  uint64_t v1 = MOLogOpen();
  if (v1)
  {
    snprintf(__str, 0x400uLL, "/var/mobile/Library/Logs/Device-O-Matic/%s.log", "com.apple.mobile.device_o_matic");
    MOLogEnableDiskLogging();
  }
  qword_100015018 = v1;
}

id sub_100008FF4(void *a1)
{
  return sub_100009000(a1, 0, 0);
}

id sub_100009000(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableString);
    if (v5) {
      goto LABEL_3;
    }
LABEL_12:
    CFStringRef v15 = @"NULL";
LABEL_13:
    [v7 appendString:v15];
    goto LABEL_25;
  }
  if (!v5) {
    goto LABEL_12;
  }
LABEL_3:
  if (![v7 length]
    || (objc_msgSend(v7, "substringFromIndex:", (char *)objc_msgSend(v7, "length") - 1),
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isEqualToString:@"\n"],
        v8,
        v9))
  {
    objc_msgSend(v7, "appendFormat:", @"%*s", (2 * a2), &unk_10000DA1D);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2) {
      CFStringRef v10 = @"<dict>\n";
    }
    else {
      CFStringRef v10 = @"\n<dict>\n";
    }
    id v11 = (id)sub_100009000(v10, a2, v7);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000A568;
    v33[3] = &unk_1000108D0;
    int v35 = a2;
    id v12 = v7;
    id v34 = v12;
    [v5 enumerateKeysAndObjectsUsingBlock:v33];
    id v13 = (id)sub_100009000(@"</dict>", a2, v12);
    CFAllocatorRef v14 = v34;
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2) {
      CFStringRef v16 = @"<array>\n";
    }
    else {
      CFStringRef v16 = @"\n<array>\n";
    }
    id v17 = (id)sub_100009000(v16, a2, v7);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000A628;
    v30[3] = &unk_1000108F8;
    int v32 = a2;
    id v18 = v7;
    id v31 = v18;
    [v5 enumerateObjectsUsingBlock:v30];
    id v19 = (id)sub_100009000(@"</array>", a2, v18);
    CFAllocatorRef v14 = v31;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2) {
      CFStringRef v20 = @"<set>\n";
    }
    else {
      CFStringRef v20 = @"\n<set>\n";
    }
    id v21 = (id)sub_100009000(v20, a2, v7);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000A688;
    v27[3] = &unk_100010920;
    int v29 = a2;
    id v22 = v7;
    id v28 = v22;
    [v5 enumerateObjectsUsingBlock:v27];
    id v23 = (id)sub_100009000(@"</set>", a2, v22);
    CFAllocatorRef v14 = v28;
    goto LABEL_24;
  }
  CFTypeID v25 = CFGetTypeID(v5);
  if (v25 == CFBooleanGetTypeID())
  {
    if ([v5 BOOLValue]) {
      CFStringRef v15 = @"true";
    }
    else {
      CFStringRef v15 = @"false";
    }
    goto LABEL_13;
  }
  CFMutableDictionaryRef v26 = [v5 description];
  [v7 appendString:v26];

LABEL_25:

  return v7;
}

uint64_t sub_1000093C4(io_registry_entry_t a1)
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

  id v12 = 0;
  id v13 = &v12;
  CFAllocatorRef v14 = 0x2020000000;
  CFStringRef v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  unsigned int v9 = (void (*)(void))sub_100009584;
  CFStringRef v10 = &unk_100010860;
  id v11 = &v12;
  id v2 = v8;
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
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v6 = __error();
        id v7 = strerror(*v6);
        sub_10000B028((uint64_t)v7, buf);
      }
    }
  }
LABEL_3:

  uint64_t v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_100009560(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void sub_100009584(uint64_t a1, io_registry_entry_t entry, unsigned char *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"removable", 0, 0);
  if (CFProperty)
  {
    id v6 = CFProperty;
    if (CFEqual(CFProperty, kCFBooleanTrue))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

__CFDictionary *sub_100009620(uint64_t a1)
{
  CFDictionaryRef v1 = IORegistryEntryIDMatching(a1);
  if (v1 && (io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1)) != 0)
  {
    io_object_t v3 = MatchingService;
    CFMutableDictionaryRef properties = 0;
    id v4 = 0;
    if (!IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0)) {
      id v4 = properties;
    }
    IOObjectRelease(v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t sub_1000096B4(io_registry_entry_t a1, __CFDictionary *a2, void *a3)
{
  id v5 = a3;
  if (qword_100015030 != -1) {
    dispatch_once(&qword_100015030, &stru_100010880);
  }
  id v6 = (void *)qword_100015028;
  if (v5) {
    id v6 = v5;
  }
  CFDictionaryRef v7 = v6;
  io_iterator_t iterator = 0;
  IORegistryEntryGetChildIterator(a1, "IOService", &iterator);
  io_object_t v8 = IOIteratorNext(iterator);
  if (v8)
  {
    io_service_t v9 = v8;
    char v34 = 0;
    CFStringRef v10 = &_os_log_default;
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
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ matches via IOServiceMatchPropertyTable", buf, 0xCu);
          }
          char v34 = 1;
        }
      }
      *(void *)BOOLean_t matches = 0;
      IORegistryEntryCreateCFProperties(v9, (CFMutableDictionaryRef *)matches, 0, 0);
      if (a2) {
        CFDictionarySetValue(a2, key, *(const void **)matches);
      }
      if (!((v5 == 0) | v34 & 1))
      {
        io_service_t v30 = v9;
        CFStringRef v38 = (const __CFString *)[v5 count];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        CFDictionaryRef obj = v7;
        id v36 = [(__CFDictionary *)obj countByEnumeratingWithState:&v44 objects:v62 count:16];
        if (v36)
        {
          CFStringRef v11 = 0;
          char v34 = 0;
          uint64_t v35 = *(void *)v45;
          do
          {
            for (io_iterator_t i = 0; i != v36; io_iterator_t i = (char *)i + 1)
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
              id v15 = [v14 countByEnumeratingWithState:&v40 objects:v61 count:16];
              if (v15)
              {
                id v16 = v15;
                v37 = i;
                uint64_t v17 = *(void *)v41;
                while (2)
                {
                  for (j = 0; j != v16; j = (char *)j + 1)
                  {
                    if (*(void *)v41 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    id v19 = *(const void **)(*((void *)&v40 + 1) + 8 * (void)j);
                    if ([(__CFDictionary *)v13 isEqualToString:v19])
                    {
                      CFStringRef v20 = v10;
                      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                      {
                        id v21 = [(__CFDictionary *)obj objectForKey:v13];
                        id v22 = [*(id *)matches objectForKey:v19];
                        *(_DWORD *)buf = 134219010;
                        CFStringRef v52 = v11;
                        __int16 v53 = 2112;
                        CFDictionaryRef v54 = v13;
                        __int16 v55 = 2112;
                        v56 = v19;
                        __int16 v57 = 2112;
                        v58 = v21;
                        __int16 v59 = 2112;
                        v60 = v22;
                        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%lu] comparing keys %@:%@ and values %@:%@", buf, 0x34u);
                      }
                      id v23 = [(__CFDictionary *)obj objectForKey:v13];
                      v24 = [*(id *)matches objectForKey:v19];
                      unsigned int v25 = [v23 isEqual:v24];

                      if (v25)
                      {
                        CFStringRef v11 = (const __CFString *)((char *)v11 + 1);
                        CFStringRef v10 = v20;
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
                            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ MATCHED %@ with %@", buf, 0x20u);
                          }
                          char v34 = 1;
                          CFStringRef v11 = v38;
                          goto LABEL_38;
                        }
                      }
                      else
                      {
                        CFStringRef v10 = v20;
                      }
                    }
                  }
                  id v16 = [v14 countByEnumeratingWithState:&v40 objects:v61 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
LABEL_38:
                io_iterator_t i = v37;
              }
            }
            id v36 = [(__CFDictionary *)obj countByEnumeratingWithState:&v44 objects:v62 count:16];
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

void sub_100009C1C(id a1)
{
  qword_100015028 = (uint64_t)[objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:@"/tmp/test.plist"];

  _objc_release_x1();
}

void sub_100009C64(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableString);
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  sub_1000096B4((io_registry_entry_t)objc_msgSend(v1, "io_service"), Mutable, 0);
  id v4 = sub_100009000(Mutable, 2, v2);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = v1;
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\nchildren: %@", (uint8_t *)&v5, 0x16u);
  }
  CFRelease(Mutable);
}

void sub_100009D88(void *a1, void *a2)
{
  id v12 = a1;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a2;
  id v14 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v3;
        id v4 = *(void **)(*((void *)&v21 + 1) + 8 * v3);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v27 = v12;
          __int16 v28 = 2112;
          id v29 = v4;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ child %@", buf, 0x16u);
        }
        int v5 = [obj objectForKey:v4];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v18;
          do
          {
            for (io_iterator_t i = 0; i != v7; io_iterator_t i = (char *)i + 1)
            {
              if (*(void *)v18 != v8) {
                objc_enumerationMutation(v5);
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
                CFStringRef v11 = [v5 objectForKey:v10];
                *(_DWORD *)buf = 138412546;
                id v27 = v10;
                __int16 v28 = 2112;
                id v29 = v11;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\tproperty %@: %@", buf, 0x16u);
              }
            }
            id v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v16 + 1;
      }
      while ((id)(v16 + 1) != v14);
      id v14 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v14);
  }
}

id sub_10000A008(io_registry_entry_t a1)
{
  CFMutableDictionaryRef properties = 0;
  memset(path, 0, 512);
  IORegistryEntryGetNameInPlane(a1, "IOService", name);
  IORegistryEntryGetPath(a1, "IOService", path);
  IORegistryEntryCreateCFProperties(a1, &properties, 0, 0);
  id v2 = objc_alloc_init((Class)NSMutableString);
  [v2 appendFormat:@"%s:\nPath:\n%s\n%@\n", name, path, sub_100009000(properties, 0, 0)];

  return v2;
}

const char *sub_10000A140(void *a1)
{
  if (a1 == &_xpc_type_connection) {
    return "XPC_TYPE_CONNECTION";
  }
  if (a1 == &_xpc_type_null) {
    return "XPC_TYPE_NULL";
  }
  if (a1 == &_xpc_type_BOOL) {
    return "XPC_TYPE_BOOL";
  }
  if (a1 == &_xpc_type_int64) {
    return "XPC_TYPE_INT64";
  }
  if (a1 == &_xpc_type_uint64) {
    return "XPC_TYPE_UINT64";
  }
  if (a1 == &_xpc_type_double) {
    return "XPC_TYPE_DOUBLE";
  }
  if (a1 == &_xpc_type_date) {
    return "XPC_TYPE_DATE";
  }
  if (a1 == &_xpc_type_data) {
    return "XPC_TYPE_DATA";
  }
  if (a1 == &_xpc_type_string) {
    return "XPC_TYPE_STRING";
  }
  if (a1 == &_xpc_type_uuid) {
    return "XPC_TYPE_UUID";
  }
  if (a1 == &_xpc_type_fd) {
    return "XPC_TYPE_FD";
  }
  if (a1 == &_xpc_type_shmem) {
    return "XPC_TYPE_SHMEM";
  }
  if (a1 == &_xpc_type_array) {
    return "XPC_TYPE_ARRAY";
  }
  if (a1 == &_xpc_type_dictionary) {
    return "XPC_TYPE_DICTIONARY";
  }
  if (a1 == &_xpc_type_error) {
    return "XPC_TYPE_ERROR";
  }
  return "Unknown type";
}

void sub_10000A2EC(void *a1, uint64_t a2)
{
  id v3 = a1;
  xpc_type_t type = xpc_get_type(v3);
  id v5 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000B074(a2, type, v3);
  }
}

void sub_10000A364(void *a1, uint64_t a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  id v6 = sub_10000A44C;
  id v7 = &unk_1000108A8;
  id v3 = a1;
  id v8 = v3;
  uint64_t v9 = a2;
  id v4 = v5;
  if (qword_100015020 != -1) {
    dispatch_once(&qword_100015020, &stru_100010838);
  }
  if (qword_100015018 && *(int *)(qword_100015018 + 44) >= 5) {
    v6((uint64_t)v4);
  }
}

void sub_10000A44C(uint64_t a1)
{
  xpc_type_t type = xpc_get_type(*(xpc_object_t *)(a1 + 32));
  id v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = sub_10000A140(type);
    if (type == (xpc_type_t)&_xpc_type_error) {
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), _xpc_error_key_description);
    }
    else {
      string = (const char *)&unk_10000DA1D;
    }
    int v7 = 136315650;
    uint64_t v8 = v4;
    __int16 v9 = 2080;
    CFStringRef v10 = v5;
    __int16 v11 = 2080;
    id v12 = string;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }
}

void sub_10000A568(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = (id)sub_100009000(a2, (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  id v6 = (id)sub_100009000(@" : ", (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  id v7 = (id)sub_100009000(v9, (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  id v8 = (id)sub_100009000(@"\n", (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
}

id sub_10000A628(uint64_t a1, uint64_t a2)
{
  id v3 = (id)sub_100009000(a2, (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  return (id)sub_100009000(@"\n", (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
}

id sub_10000A688(uint64_t a1, uint64_t a2)
{
  id v3 = (id)sub_100009000(a2, (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
  return (id)sub_100009000(@"\n", (*(_DWORD *)(a1 + 40) + 1), *(void *)(a1 + 32));
}

void sub_10000A6E8()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "unable to get xpcName C string", v0, 2u);
}

void sub_10000A730(void *a1)
{
  xpc_type_t type = xpc_get_type(a1);
  int v3 = 136315394;
  uint64_t v4 = sub_10000A140(type);
  __int16 v5 = 2080;
  string = xpc_dictionary_get_string(a1, "XPCErrorDescription");
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Got unexpected stuff from xpc: %s : %s", (uint8_t *)&v3, 0x16u);
}

void sub_10000A7E4()
{
  v0 = __error();
  strerror(*v0);
  sub_1000074B4();
  sub_10000747C((void *)&_mh_execute_header, &_os_log_default, v1, "IONotificationPortCreate failed: %s", v2, v3, v4, v5, v6);
}

void sub_10000A860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A914()
{
  sub_1000074B4();
  sub_10000747C((void *)&_mh_execute_header, &_os_log_default, v0, "CFMessagePortCreateRemote failed for serviceName: %@", v1, v2, v3, v4, v5);
}

void sub_10000A984()
{
  sub_1000074B4();
  sub_10000747C((void *)&_mh_execute_header, &_os_log_default, v0, "NO JOB TYPE for service name: %@", v1, v2, v3, v4, v5);
}

void sub_10000A9F4(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Scanned plist: %@", buf, 0xCu);
}

void sub_10000AA40(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "IORegistryEntryGetChildIterator failed: %s", buf, 0xCu);
}

void sub_10000AA8C(int *a1)
{
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get registry name for child: %u", (uint8_t *)v2, 8u);
}

void sub_10000AB10(int *a1)
{
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create property dictionary for child: %u", (uint8_t *)v2, 8u);
}

void sub_10000AB94()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000074B4();
  sub_10000747C((void *)&_mh_execute_header, &_os_log_default, v1, "IOServiceAddInterestNotification failed: %s", v2, v3, v4, v5, v6);
}

void sub_10000AC10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AC8C()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100008CC8();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName failed for io_service %u : %s", v1, 0x12u);
}

void sub_10000AD20()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100008CC8();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "IOServiceWaitQuiet error %d:%s", v1, 0x12u);
}

void sub_10000ADB4(int a1, int a2)
{
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  v6[0] = 67109634;
  v6[1] = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  __int16 v9 = 2080;
  CFStringRef v10 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "unable to get IO Registry Entry ID for service: 0x%08x, error: %d : %s", (uint8_t *)v6, 0x18u);
}

void sub_10000AE68()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000747C((void *)&_mh_execute_header, &_os_log_default, v1, "IOServiceAddInterestNotification failed: %s", v2, v3, v4, v5, 2u);
}

void sub_10000AEE8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not create the device class property for the USB device", v0, 2u);
}

void sub_10000AF30()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000747C((void *)&_mh_execute_header, &_os_log_default, v1, "IORegistryEntryGetChildIterator failed: %s", v2, v3, v4, v5, 2u);
}

void sub_10000AFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B028(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "IORegistryEntryGetParentIterator failed: %s", buf, 0xCu);
}

void sub_10000B074(uint64_t a1, void *a2, void *a3)
{
  uint8_t v6 = sub_10000A140(a2);
  if (a2 == &_xpc_type_error) {
    string = xpc_dictionary_get_string(a3, _xpc_error_key_description);
  }
  else {
    string = (const char *)&unk_10000DA1D;
  }
  int v8 = 136315650;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  __int16 v11 = v6;
  __int16 v12 = 2080;
  uint64_t v13 = string;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s %s %s", (uint8_t *)&v8, 0x20u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name)
{
  return _CFMessagePortCreateRemote(allocator, name);
}

SInt32 CFMessagePortSendRequest(CFMessagePortRef remote, SInt32 msgid, CFDataRef data, CFTimeInterval sendTimeout, CFTimeInterval rcvTimeout, CFStringRef replyMode, CFDataRef *returnData)
{
  return _CFMessagePortSendRequest(remote, msgid, data, sendTimeout, rcvTimeout, replyMode, returnData);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return _CFUserNotificationUpdate(userNotification, timeout, flags, dictionary);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return _IOIteratorIsValid(iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
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

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return _IOObjectGetClass(object, className);
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

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return _IORegistryEntryGetNameInPlane(entry, plane, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetPath(io_registry_entry_t entry, const io_name_t plane, io_string_t path)
{
  return _IORegistryEntryGetPath(entry, plane, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceMatchPropertyTable(io_service_t service, CFDictionaryRef matching, BOOLean_t *matches)
{
  return _IOServiceMatchPropertyTable(service, matching, matches);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return _IOServiceWaitQuiet(service, waitTime);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MOLogEnableDiskLogging()
{
  return _MOLogEnableDiskLogging();
}

uint64_t MOLogOpen()
{
  return _MOLogOpen();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
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

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
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
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_IORegEntryID(void *a1, const char *a2, ...)
{
  return [a1 IORegEntryID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_compositeDeviceIsConfigured(void *a1, const char *a2, ...)
{
  return [a1 compositeDeviceIsConfigured];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createUserNotificationDict(void *a1, const char *a2, ...)
{
  return [a1 createUserNotificationDict];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dialogBodyKey(void *a1, const char *a2, ...)
{
  return [a1 dialogBodyKey];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayDialog(void *a1, const char *a2, ...)
{
  return [a1 displayDialog];
}

id objc_msgSend_displayOverCurrentDialog(void *a1, const char *a2, ...)
{
  return [a1 displayOverCurrentDialog];
}

id objc_msgSend_iOSDeviceThreshold(void *a1, const char *a2, ...)
{
  return [a1 iOSDeviceThreshold];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_ioNotificationPort(void *a1, const char *a2, ...)
{
  return [a1 ioNotificationPort];
}

id objc_msgSend_isAttachedToHub(void *a1, const char *a2, ...)
{
  return [a1 isAttachedToHub];
}

id objc_msgSend_isBillboardDevice(void *a1, const char *a2, ...)
{
  return [a1 isBillboardDevice];
}

id objc_msgSend_isCompositeDevice(void *a1, const char *a2, ...)
{
  return [a1 isCompositeDevice];
}

id objc_msgSend_isHub(void *a1, const char *a2, ...)
{
  return [a1 isHub];
}

id objc_msgSend_isInF5Mode(void *a1, const char *a2, ...)
{
  return [a1 isInF5Mode];
}

id objc_msgSend_isThunderboltDevice(void *a1, const char *a2, ...)
{
  return [a1 isThunderboltDevice];
}

id objc_msgSend_jobType(void *a1, const char *a2, ...)
{
  return [a1 jobType];
}

id objc_msgSend_kick(void *a1, const char *a2, ...)
{
  return [a1 kick];
}

id objc_msgSend_kickMe(void *a1, const char *a2, ...)
{
  return [a1 kickMe];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_makeXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 makeXPCConnection];
}

id objc_msgSend_msgID(void *a1, const char *a2, ...)
{
  return [a1 msgID];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notificationName(void *a1, const char *a2, ...)
{
  return [a1 notificationName];
}

id objc_msgSend_personalities(void *a1, const char *a2, ...)
{
  return [a1 personalities];
}

id objc_msgSend_personalityDict(void *a1, const char *a2, ...)
{
  return [a1 personalityDict];
}

id objc_msgSend_personalityName(void *a1, const char *a2, ...)
{
  return [a1 personalityName];
}

id objc_msgSend_powerHog(void *a1, const char *a2, ...)
{
  return [a1 powerHog];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_releaseOverCurrentDialog(void *a1, const char *a2, ...)
{
  return [a1 releaseOverCurrentDialog];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_require9Pin(void *a1, const char *a2, ...)
{
  return [a1 require9Pin];
}

id objc_msgSend_scheduleDialog(void *a1, const char *a2, ...)
{
  return [a1 scheduleDialog];
}

id objc_msgSend_sharedDomAccessoryArbitrator(void *a1, const char *a2, ...)
{
  return [a1 sharedDomAccessoryArbitrator];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_shouldMatchDevice(void *a1, const char *a2, ...)
{
  return [a1 shouldMatchDevice];
}

id objc_msgSend_staticProbeScore(void *a1, const char *a2, ...)
{
  return [a1 staticProbeScore];
}

id objc_msgSend_tbtAccessoryWithIncompatibleCable(void *a1, const char *a2, ...)
{
  return [a1 tbtAccessoryWithIncompatibleCable];
}

id objc_msgSend_tbtAccessoryWithIncompatiblePort(void *a1, const char *a2, ...)
{
  return [a1 tbtAccessoryWithIncompatiblePort];
}

id objc_msgSend_testAgainstDeviceThreshold(void *a1, const char *a2, ...)
{
  return [a1 testAgainstDeviceThreshold];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateDeviceProperties(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceProperties];
}

id objc_msgSend_winningDomPersonality(void *a1, const char *a2, ...)
{
  return [a1 winningDomPersonality];
}

id objc_msgSend_winningIORegEntryID(void *a1, const char *a2, ...)
{
  return [a1 winningIORegEntryID];
}

id objc_msgSend_winningScore(void *a1, const char *a2, ...)
{
  return [a1 winningScore];
}

id objc_msgSend_xpcName(void *a1, const char *a2, ...)
{
  return [a1 xpcName];
}