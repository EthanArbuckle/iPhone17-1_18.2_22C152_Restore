@interface HeimCredDecoder
+ (id)allowedClasses;
+ (id)copyCF2NS:(void *)a3;
+ (id)copyUnarchiveObjectWithFileSecureEncoding:(id)a3;
+ (void)archiveRootObject:(id)a3 toFile:(id)a4;
+ (void)copyNS2CF:(id)a3;
- (id)allowedClasses;
@end

@implementation HeimCredDecoder

+ (void)copyNS2CF:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = [location[0] copy];
      id v16 = 0;
      objc_storeStrong(&v16, v7);
      id v6 = v16;
      objc_storeStrong(&v16, 0);
      v15 = v6;

      int v13 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)&v12.byte0 = 0;
        *(void *)&v12.byte8 = 0;
        objc_msgSend(location[0], "getUUIDBytes:");
        if (uuid_compare(&v12.byte0, byte_100028E90))
        {
          if (uuid_compare(&v12.byte0, byte_100028EA0)) {
            v15 = CFUUIDCreateFromUUIDBytes(0, v12);
          }
          else {
            v15 = kCFBooleanTrue;
          }
          int v13 = 1;
        }
        else
        {
          v15 = kCFBooleanFalse;
          int v13 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [location[0] count];
          Mutable = CFArrayCreateMutable(0, (CFIndex)v10, &kCFTypeArrayCallBacks);
          if (Mutable)
          {
            for (uint64_t i = 0; i < (uint64_t)v10; ++i)
            {
              id v4 = [location[0] objectAtIndex:i];
              v5 = +[HeimCredDecoder copyNS2CF:](HeimCredDecoder, "copyNS2CF:");

              if (v5)
              {
                CFArrayAppendValue(Mutable, v5);
                CFRelease(v5);
              }
            }
            v15 = Mutable;
            int v13 = 1;
          }
          else
          {
            v15 = 0;
            int v13 = 1;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFMutableDictionaryRef v8 = CFDictionaryCreateMutable(0, (CFIndex)[location[0] count], &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            if (v8)
            {
              objc_msgSend(location[0], "enumerateKeysAndObjectsUsingBlock:");
              v15 = v8;
            }
            else
            {
              v15 = 0;
            }
            int v13 = 1;
          }
          else
          {
            v15 = 0;
            int v13 = 1;
          }
        }
      }
    }
  }
  else
  {
    v15 = 0;
    int v13 = 1;
  }
  objc_storeStrong(location, 0);
  return v15;
}

+ (id)copyCF2NS:(void *)a3
{
  id v15 = a1;
  SEL v14 = a2;
  int v13 = (__CFString *)a3;
  if (!a3) {
    return 0;
  }
  CFTypeID v12 = CFGetTypeID(v13);
  if (v12 == CFBooleanGetTypeID())
  {
    if (CFBooleanGetValue((CFBooleanRef)v13)) {
      return [objc_alloc((Class)NSUUID) initWithUUIDBytes:byte_100028EA0];
    }
    else {
      return [objc_alloc((Class)NSUUID) initWithUUIDBytes:byte_100028E90];
    }
  }
  else if (v12 == CFStringGetTypeID())
  {
    return (id)(id)(id)CFStringCreateCopy(0, v13);
  }
  else if (v12 == CFDataGetTypeID())
  {
    return CFDataCreateCopy(0, (CFDataRef)v13);
  }
  else if (v12 == CFNumberGetTypeID() || v12 == CFDateGetTypeID())
  {
    return v13;
  }
  else if (v12 == CFUUIDGetTypeID())
  {
    CFUUIDBytes v11 = (CFUUIDBytes)0;
    CFUUIDBytes v11 = CFUUIDGetUUIDBytes((CFUUIDRef)v13);
    return [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v11];
  }
  else if (v12 == CFArrayGetTypeID())
  {
    CFIndex i = 0;
    CFIndex Count = CFArrayGetCount((CFArrayRef)v13);
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:Count];
    if (v8)
    {
      for (CFIndex i = 0; i < Count; ++i)
      {
        id location = +[HeimCredDecoder copyCF2NS:CFArrayGetValueAtIndex((CFArrayRef)v13, i)];
        if (location) {
          [v8 addObject:location];
        }
        objc_storeStrong(&location, 0);
      }
      id v16 = v8;
      int v7 = 1;
    }
    else
    {
      id v16 = 0;
      int v7 = 1;
    }
    objc_storeStrong(&v8, 0);
  }
  else if (v12 == CFDictionaryGetTypeID())
  {
    CFIndex v5 = CFDictionaryGetCount((CFDictionaryRef)v13);
    context = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v5];
    if (context)
    {
      CFDictionaryApplyFunction((CFDictionaryRef)v13, (CFDictionaryApplierFunction)sub_10001A4E0, context);
      id v16 = context;
    }
    else
    {
      id v16 = 0;
    }
    int v7 = 1;
    objc_storeStrong(&context, 0);
  }
  else
  {
    return 0;
  }
  return v16;
}

+ (id)copyUnarchiveObjectWithFileSecureEncoding:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  id v11 = +[NSData dataWithContentsOfFile:location[0] options:1 error:0];
  if (v11)
  {
    id v3 = (id)off_100028EF0(v11);
    id v4 = v12;
    id v12 = v3;

    if (v12)
    {
      id v9 = [[HeimCredDecoder alloc] initForReadingFromData:v12 error:0];
      if (v9)
      {
        id v6 = +[HeimCredDecoder allowedClasses];
        id v8 = objc_msgSend(v9, "decodeObjectOfClasses:forKey:");

        [v9 finishDecoding];
        id v14 = v8;
        int v10 = 1;
        objc_storeStrong(&v8, 0);
      }
      else
      {
        id v14 = 0;
        int v10 = 1;
      }
      objc_storeStrong(&v9, 0);
    }
    else
    {
      id v14 = 0;
      int v10 = 1;
    }
  }
  else
  {
    id v14 = 0;
    int v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v14;
}

+ (void)archiveRootObject:(id)a3 toFile:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  id v33 = sub_10001120C();
  char v32 = 1;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO))
  {
    log = v33;
    os_log_type_t type = v32;
    sub_100003CE0(v31);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Save credentials to disk", v31, 2u);
  }
  objc_storeStrong(&v33, 0);
  id v30 = 0;
  id v28 = 0;
  id v11 = +[NSKeyedArchiver archivedDataWithRootObject:location[0] requiringSecureCoding:1 error:&v28];
  objc_storeStrong(&v30, v28);
  id v29 = v11;
  if (v11)
  {
    id v24 = (id)off_100028EE8(v29);
    if (v24)
    {
      NSFileAttributeKey v36 = NSFilePosixPermissions;
      v37 = &off_100026390;
      id v20 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v6 = +[NSFileManager defaultManager];
      unsigned __int8 v7 = [(NSFileManager *)v6 createFileAtPath:v34 contents:v24 attributes:v20];

      char v19 = v7 & 1;
      if ((v7 & 1) == 0)
      {
        os_log_t oslog = (os_log_t)sub_10001120C();
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          id v4 = oslog;
          os_log_type_t v5 = v17;
          sub_100003CE0(v16);
          _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "Error writing credentials to disk", v16, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v20, 0);
      int v25 = 0;
    }
    else
    {
      id v23 = sub_10001120C();
      char v22 = 16;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        id v9 = v23;
        os_log_type_t v10 = v22;
        sub_100003CE0(v21);
        _os_log_error_impl((void *)&_mh_execute_header, v9, v10, "Failed to wrap credentials", v21, 2u);
      }
      objc_storeStrong(&v23, 0);
      id v8 = +[NSFileManager defaultManager];
      [(NSFileManager *)v8 removeItemAtPath:v34 error:0];

      int v25 = 1;
    }
    objc_storeStrong(&v24, 0);
  }
  else
  {
    id v27 = sub_10001120C();
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      sub_10001AC60((uint64_t)v38, (uint64_t)v30);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v27, v26, "Failed to archive credentials: %{public}@", v38, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    int v25 = 1;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  if (!v25) {
    int v25 = 0;
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
}

- (id)allowedClasses
{
  return +[HeimCredDecoder allowedClasses];
}

+ (id)allowedClasses
{
  os_log_type_t v5 = (dispatch_once_t *)&unk_100029078;
  id location = 0;
  objc_storeStrong(&location, &stru_1000251F0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100029080;

  return v2;
}

@end