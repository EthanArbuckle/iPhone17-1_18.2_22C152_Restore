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
  block[2] = sub_1000014A0;
  block[3] = &unk_100004218;
  block[4] = a1;
  if (qword_100008A10 != -1) {
    dispatch_once(&qword_100008A10, block);
  }
  v2 = (void *)qword_100008A18;

  return v2;
}

+ (id)getIOregData:(const char *)a3 property:(__CFString *)a4 length:(int)a5 optionalKey:(const __CFString *)a6
{
  CFMutableDictionaryRef v9 = IOServiceMatching(a3);
  if (!v9)
  {
    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100002684();
    }
    goto LABEL_14;
  }
  v10 = v9;
  if (a6)
  {
    keys = (void *)a6;
    CFDictionaryRef v11 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v10, @"IONameMatch", v11);
    CFRelease(v11);
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v10);
  if (!MatchingService)
  {
    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000026EC();
    }
LABEL_14:

    v17 = 0;
    goto LABEL_27;
  }
  io_object_t v13 = MatchingService;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, a4, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDataRef v15 = CFProperty;
    CFTypeID v16 = CFGetTypeID(CFProperty);
    if (v16 == CFDataGetTypeID())
    {
      v17 = +[NSData dataWithBytes:CFDataGetBytePtr(v15) length:a5];
      v18 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000027BC();
      }
    }
    else
    {
      CFTypeID v21 = CFGetTypeID(v15);
      CFTypeID TypeID = CFStringGetTypeID();
      v23 = DiagnosticLogHandleForCategory();
      v24 = v23;
      if (v21 == TypeID)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_1000027F0();
        }

        v17 = [(__CFData *)v15 dataUsingEncoding:4];
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100002824();
        }

        v17 = 0;
      }
    }
    CFRelease(v15);
  }
  else
  {
    v20 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100002754();
    }

    v17 = 0;
  }
  IOObjectRelease(v13);
LABEL_27:

  return v17;
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
  CFDataRef v15 = [a1 getMatchingDict:v14 property:v13 optionalKey:v12 optionalClassValidator:v11];

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
  CFDataRef v15 = [a1 getMatchingDict:v14 property:v13 optionalKey:v12 optionalClassValidator:v11];

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
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR)) {
      sub_100002858();
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
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000028C0();
      }

      CFTypeID v16 = 0;
      goto LABEL_26;
    }
    CFDataRef v13 = CFProperty;
    CFTypeID v14 = CFGetTypeID(CFProperty);
    if (v14 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v13);
      CFTypeID v16 = +[NSData dataWithBytes:BytePtr length:CFDataGetLength(v13)];
      v17 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1000027BC();
      }
    }
    else
    {
      CFTypeID v20 = CFGetTypeID(v13);
      if (v20 == CFStringGetTypeID())
      {
        CFTypeID v21 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          sub_1000027F0();
        }

        CFTypeID v16 = [(__CFData *)v13 dataUsingEncoding:4];
        goto LABEL_25;
      }
      CFTypeID v22 = CFGetTypeID(v13);
      if (v22 == CFBooleanGetTypeID())
      {
        Boolean Value = CFBooleanGetValue(v13);
        CFTypeID v16 = +[NSData dataWithBytes:&Value length:1];
        v17 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_1000028F4();
        }
      }
      else
      {
        CFTypeID v23 = CFGetTypeID(v13);
        if (v23 != CFNumberGetTypeID() || CFNumberIsFloatType(v13))
        {
          v24 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_100002824();
          }

          CFTypeID v16 = 0;
          goto LABEL_25;
        }
        uint64_t v26 = 0;
        CFNumberGetValue(v13, kCFNumberNSIntegerType, &v26);
        CFTypeID v16 = +[NSData dataWithBytes:&v26 length:8];
        v17 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_100002928();
        }
      }
    }

LABEL_25:
    CFRelease(v13);
LABEL_26:
    IOObjectRelease(v11);
    goto LABEL_27;
  }
  v18 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10000288C();
  }

  CFTypeID v16 = 0;
LABEL_27:

  return v16;
}

+ (id)getIOServicePropertiesWithMatchingDictionary:(id)a3
{
  kern_return_t v6;
  NSObject *v7;
  CFMutableDictionaryRef v8;
  id v9;
  CFMutableDictionaryRef properties;
  uint64_t vars8;

  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (!MatchingService)
  {
    id v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000295C();
    }
    goto LABEL_7;
  }
  io_object_t v5 = MatchingService;
  properties = 0;
  v6 = IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0);
  IOObjectRelease(v5);
  if (v6)
  {
    id v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000029C4();
    }
LABEL_7:

    id v8 = 0;
    goto LABEL_9;
  }
  id v8 = properties;
LABEL_9:
  CFDictionaryRef v9 = [(__CFDictionary *)v8 copy];

  return v9;
}

@end