@interface DAComponentUtil
+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4;
+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4 passingValidator:(id)a5;
+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5;
+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6;
+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5;
+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6;
+ (id)getIOServicePropertiesWithMatchingDictionary:(id)a3;
+ (id)getIOregData:(const char *)a3 property:(__CFString *)a4 length:(int)a5 optionalKey:(const __CFString *)a6;
+ (id)getMatchingDict:(__CFDictionary *)a3 property:(id)a4 optionalKey:(id)a5 optionalClassValidator:(id)a6;
+ (id)sharedInstance;
+ (unsigned)getIOService:(__CFDictionary *)a3 optionalKey:(id)a4 optionalClassValidator:(id)a5;
@end

@implementation DAComponentUtil

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027ECC;
  block[3] = &unk_100084B40;
  block[4] = a1;
  if (qword_1000BE0E8 != -1) {
    dispatch_once(&qword_1000BE0E8, block);
  }
  v2 = (void *)qword_1000BE0F0;

  return v2;
}

+ (id)getIOregData:(const char *)a3 property:(__CFString *)a4 length:(int)a5 optionalKey:(const __CFString *)a6
{
  CFMutableDictionaryRef v10 = IOServiceMatching(a3);
  if (!v10)
  {
    v20 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v18 = 0;
      goto LABEL_26;
    }
    *(_DWORD *)v28 = 136315138;
    *(void *)&v28[4] = a3;
    v21 = "Class %s not found";
LABEL_30:
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, v28, 0xCu);
    goto LABEL_13;
  }
  v11 = v10;
  if (a6)
  {
    *(void *)v28 = a6;
    CFDictionaryRef v12 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)v28, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v11, @"IONameMatch", v12);
    CFRelease(v12);
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
  if (!MatchingService)
  {
    v20 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)v28 = 136315138;
    *(void *)&v28[4] = a3;
    v21 = "IO service for %s not found";
    goto LABEL_30;
  }
  io_object_t v14 = MatchingService;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, a4, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDataRef v16 = CFProperty;
    CFTypeID v17 = CFGetTypeID(CFProperty);
    if (v17 == CFDataGetTypeID())
    {
      v18 = +[NSData dataWithBytes:CFDataGetBytePtr(v16) length:a5];
      v19 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v28 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "   Got CFData", v28, 2u);
      }
    }
    else
    {
      CFTypeID v23 = CFGetTypeID(v16);
      CFTypeID TypeID = CFStringGetTypeID();
      v25 = DiagnosticLogHandleForCategory();
      v26 = v25;
      if (v23 == TypeID)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v28 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "   Got CFString", v28, 2u);
        }

        v18 = [(__CFData *)v16 dataUsingEncoding:4];
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v28 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unsupported type from ioreg", v28, 2u);
        }

        v18 = 0;
      }
    }
    CFRelease(v16);
  }
  else
  {
    v22 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v28 = 138412290;
      *(void *)&v28[4] = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "ioreg entry %@ does not exist", v28, 0xCu);
    }

    v18 = 0;
  }
  IOObjectRelease(v14);
LABEL_26:

  return v18;
}

+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5
{
  return +[DAComponentUtil getIORegistryClass:a3 property:a4 optionalKey:a5 classValidator:0];
}

+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  CFMutableDictionaryRef v14 = IOServiceMatching((const char *)[v10 UTF8String]);
  v15 = [a1 getMatchingDict:v14 property:v13 optionalKey:v12 optionalClassValidator:v11];

  if (v14) {
    CFRelease(v14);
  }

  return v15;
}

+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5
{
  return +[DAComponentUtil getIORegistryName:a3 property:a4 optionalKey:a5 classValidator:0];
}

+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  CFMutableDictionaryRef v14 = IOServiceNameMatching((const char *)[v10 UTF8String]);
  v15 = [a1 getMatchingDict:v14 property:v13 optionalKey:v12 optionalClassValidator:v11];

  if (v14) {
    CFRelease(v14);
  }

  return v15;
}

+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4
{
  return +[DAComponentUtil IORegistryNameExists:a3 optionalKey:a4 passingValidator:0];
}

+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4 passingValidator:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  CFMutableDictionaryRef v10 = IOServiceNameMatching((const char *)[v7 UTF8String]);
  io_object_t v11 = +[DAComponentUtil getIOService:v10 optionalKey:v9 optionalClassValidator:v8];

  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    IOObjectRelease(v11);
  }
  return v11 != 0;
}

+ (unsigned)getIOService:(__CFDictionary *)a3 optionalKey:(id)a4 optionalClassValidator:(id)a5
{
  kern_return_t MatchingServices;
  uint8_t v12[4];
  io_iterator_t existing;
  void *keys;

  id v7 = a4;
  id v8 = (unsigned int (**)(id, __CFDictionary *))a5;
  if (a3)
  {
    CFRetain(a3);
    if (v7)
    {
      keys = (void *)CFStringCreateWithCString(0, (const char *)[v7 UTF8String], 0x8000100u);
      CFDictionaryRef v9 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(a3, @"IONameMatch", v9);
      CFRelease(v9);
      CFRelease(keys);
    }
    existing = 0;
    MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, a3, &existing);
    LODWORD(a3) = 0;
    if (!MatchingServices)
    {
      if (v8)
      {
        do
          a3 = (__CFDictionary *)IOIteratorNext(existing);
        while (a3 && !v8[2](v8, a3));
      }
      else
      {
        LODWORD(a3) = IOIteratorNext(existing);
      }
    }
  }
  else
  {
    DiagnosticLogHandleForCategory();
    a3 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)a3, OS_LOG_TYPE_ERROR, "Class/name not found", v12, 2u);
    }

    LODWORD(a3) = 0;
  }

  return a3;
}

+ (id)getMatchingDict:(__CFDictionary *)a3 property:(id)a4 optionalKey:(id)a5 optionalClassValidator:(id)a6
{
  CFDictionaryRef v9 = (__CFString *)a4;
  io_registry_entry_t v10 = +[DAComponentUtil getIOService:a3 optionalKey:a5 optionalClassValidator:a6];
  if (v10)
  {
    io_object_t v11 = v10;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v10, v9, kCFAllocatorDefault, 0);
    if (!CFProperty)
    {
      v19 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "ioreg entry does not exist", buf, 2u);
      }

      CFDataRef v16 = 0;
      goto LABEL_25;
    }
    CFDataRef v13 = CFProperty;
    CFTypeID v14 = CFGetTypeID(CFProperty);
    if (v14 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v13);
      CFDataRef v16 = +[NSData dataWithBytes:BytePtr length:CFDataGetLength(v13)];
      CFTypeID v17 = DiagnosticLogHandleForCategory();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:

LABEL_24:
        CFRelease(v13);
LABEL_25:
        IOObjectRelease(v11);
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      CFTypeID v23 = "   Got CFData";
    }
    else
    {
      CFTypeID v20 = CFGetTypeID(v13);
      if (v20 == CFStringGetTypeID())
      {
        v21 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "   Got CFString", buf, 2u);
        }

        CFDataRef v16 = [(__CFData *)v13 dataUsingEncoding:4];
        goto LABEL_24;
      }
      CFTypeID v22 = CFGetTypeID(v13);
      if (v22 != CFBooleanGetTypeID())
      {
        CFTypeID v24 = CFGetTypeID(v13);
        if (v24 != CFNumberGetTypeID() || CFNumberIsFloatType(v13))
        {
          v25 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unsupported type from ioreg", buf, 2u);
          }

          CFDataRef v16 = 0;
          goto LABEL_24;
        }
        *(void *)buf = 0;
        CFNumberGetValue(v13, kCFNumberNSIntegerType, buf);
        CFDataRef v16 = +[NSData dataWithBytes:buf length:8];
        CFTypeID v17 = DiagnosticLogHandleForCategory();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        v28[0] = 0;
        CFTypeID v23 = "   Got Float";
        v27 = (uint8_t *)v28;
        goto LABEL_31;
      }
      LOBYTE(v28[0]) = CFBooleanGetValue(v13);
      CFDataRef v16 = +[NSData dataWithBytes:v28 length:1];
      CFTypeID v17 = DiagnosticLogHandleForCategory();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      CFTypeID v23 = "   Got Boolean";
    }
    v27 = buf;
LABEL_31:
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v23, v27, 2u);
    goto LABEL_5;
  }
  v18 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "IO service not found", buf, 2u);
  }

  CFDataRef v16 = 0;
LABEL_26:

  return v16;
}

+ (id)getIOServicePropertiesWithMatchingDictionary:(id)a3
{
  kern_return_t CFProperties;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  unsigned char properties[24];
  uint64_t vars8;

  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (!MatchingService)
  {
    id v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)properties = 138412290;
      *(void *)&properties[4] = v3;
      id v8 = "[ERROR] Could not find the service matched by: %@";
      CFDictionaryRef v9 = properties;
      io_registry_entry_t v10 = v7;
      io_object_t v11 = 12;
      goto LABEL_12;
    }
LABEL_6:

    id v12 = 0;
    goto LABEL_8;
  }
  io_object_t v5 = MatchingService;
  *(void *)properties = 0;
  CFProperties = IORegistryEntryCreateCFProperties(MatchingService, (CFMutableDictionaryRef *)properties, 0, 0);
  IOObjectRelease(v5);
  if (CFProperties)
  {
    id v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      id v8 = "[ERROR] Could not create properties";
      CFDictionaryRef v9 = (uint8_t *)&v15;
      io_registry_entry_t v10 = v7;
      io_object_t v11 = 2;
LABEL_12:
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v8, v9, v11);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  id v12 = *(void **)properties;
LABEL_8:
  CFDataRef v13 = [v12 copy];

  return v13;
}

@end