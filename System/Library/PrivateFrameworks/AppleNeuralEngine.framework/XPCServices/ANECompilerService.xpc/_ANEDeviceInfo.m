@interface _ANEDeviceInfo
+ (BOOL)hasANE;
+ (BOOL)isBoolBootArgSetTrue:(id)a3;
+ (BOOL)isExcessivePowerDrainWhenIdle;
+ (BOOL)isInternalBuild;
+ (BOOL)isVirtualMachine;
+ (BOOL)precompiledModelChecksDisabled;
+ (id)aneArchitectureType;
+ (id)aneSubType;
+ (id)aneSubTypeProductVariant;
+ (id)aneSubTypeVariant;
+ (id)bootArgs;
+ (id)buildVersion;
+ (id)productName;
+ (int64_t)aneBoardType;
+ (unsigned)numANECores;
+ (unsigned)numANEs;
@end

@implementation _ANEDeviceInfo

+ (BOOL)isInternalBuild
{
  if (qword_100057DF0 != -1) {
    dispatch_once(&qword_100057DF0, &stru_10004CBB0);
  }
  return byte_100057DE8;
}

+ (BOOL)isVirtualMachine
{
  if (qword_100057E00 != -1) {
    dispatch_once(&qword_100057E00, &stru_10004CBD0);
  }
  return byte_100057DF8;
}

+ (BOOL)hasANE
{
  v2 = +[_ANEVirtualClient sharedConnection];

  if (!v2)
  {
    if (+[_ANEDeviceInfo isVirtualMachine])
    {
      if (qword_100057E10 == -1) {
        return byte_100057E08;
      }
      v5 = &stru_10004CBF0;
    }
    else
    {
      if (qword_100057E10 == -1) {
        return byte_100057E08;
      }
      v5 = &stru_10004CC10;
    }
    dispatch_once(&qword_100057E10, v5);
    return byte_100057E08;
  }
  v3 = +[_ANEVirtualClient sharedConnection];
  byte_100057E08 = [v3 hasANE];

  return byte_100057E08;
}

+ (id)aneArchitectureType
{
  v2 = +[_ANEVirtualClient sharedConnection];

  if (v2)
  {
    v3 = +[_ANEVirtualClient sharedConnection];
    uint64_t v4 = [v3 aneArchitectureTypeStr];
    v5 = (void *)qword_100057E18;
    qword_100057E18 = v4;
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine])
    {
      id v6 = 0;
      goto LABEL_8;
    }
    if (qword_100057E20 != -1) {
      dispatch_once(&qword_100057E20, &stru_10004CC30);
    }
  }
  id v6 = (id)qword_100057E18;
LABEL_8:
  return v6;
}

+ (int64_t)aneBoardType
{
  v2 = +[_ANEVirtualClient sharedConnection];

  if (v2)
  {
    v3 = +[_ANEVirtualClient sharedConnection];
    qword_100057E28 = (uint64_t)[v3 aneBoardtype];
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine]) {
      return 1;
    }
    if (qword_100057E30 != -1) {
      dispatch_once(&qword_100057E30, &stru_10004CC50);
    }
  }
  return qword_100057E28;
}

+ (id)aneSubType
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001BA24;
  v18[3] = &unk_10004CC70;
  v18[4] = a2;
  v3 = objc_retainBlock(v18);
  id v4 = [a1 aneBoardType];
  v5 = +[_ANELog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100031A08((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  v12 = +[_ANEVirtualClient sharedConnection];

  if (v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BCE4;
    block[3] = &unk_10004CC98;
    v16 = v3;
    id v17 = v4;
    if (qword_100057E40 != -1) {
      dispatch_once(&qword_100057E40, block);
    }
  }
  else
  {
    ((void (*)(void *, id))v3[2])(v3, v4);
  }
  id v13 = (id)qword_100057E38;

  return v13;
}

+ (BOOL)isExcessivePowerDrainWhenIdle
{
  return [a1 aneBoardType] == (id)96;
}

+ (id)aneSubTypeVariant
{
  v2 = (char *)[a1 aneBoardType];
  v3 = +[_ANELog framework];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100031A08((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = +[_ANEVirtualClient sharedConnection];

  if (v10)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001BE9C;
    v17[3] = &unk_10004CC98;
    v18 = &stru_10004CCD8;
    v19 = v2;
    if (qword_100057E50 != -1) {
      dispatch_once(&qword_100057E50, v17);
    }
    uint64_t v11 = v18;
  }
  else
  {
    *((void *)&v13 + 1) = v2;
    *(void *)&long long v13 = v2 - 64;
    unint64_t v12 = v13 >> 4;
    if (v12 > 0xD) {
      CFStringRef v14 = &stru_10004D218;
    }
    else {
      CFStringRef v14 = off_10004CDB8[v12];
    }
    uint64_t v11 = (Block_layout *)qword_100057E48;
    qword_100057E48 = (uint64_t)v14;
  }

  v15 = (void *)qword_100057E48;
  return v15;
}

+ (id)aneSubTypeProductVariant
{
  id v2 = [a1 aneBoardType];
  v3 = +[_ANELog framework];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100031A08((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = +[_ANEVirtualClient sharedConnection];

  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001BFF4;
    v14[3] = &unk_10004CC98;
    v15 = &stru_10004CCF8;
    id v16 = v2;
    if (qword_100057E60 != -1) {
      dispatch_once(&qword_100057E60, v14);
    }
    uint64_t v11 = v15;
  }
  else
  {
    uint64_t v11 = (Block_layout *)qword_100057E58;
    qword_100057E58 = (uint64_t)&stru_10004D218;
  }

  unint64_t v12 = (void *)qword_100057E58;
  return v12;
}

+ (id)buildVersion
{
  if (qword_100057E70 != -1) {
    dispatch_once(&qword_100057E70, &stru_10004CD18);
  }
  id v2 = (void *)qword_100057E68;
  return v2;
}

+ (id)productName
{
  if (qword_100057E80 != -1) {
    dispatch_once(&qword_100057E80, &stru_10004CD38);
  }
  id v2 = (void *)qword_100057E78;
  return v2;
}

+ (id)bootArgs
{
  id v2 = malloc_type_calloc(1uLL, 0x400uLL, 0x94C61774uLL);
  size_t v5 = 1023;
  if (sysctlbyname("kern.bootargs", v2, &v5, 0, 0))
  {
    v3 = &stru_10004D218;
  }
  else
  {
    v2[1023] = 0;
    v3 = +[NSString stringWithFormat:@"%s", v2];
  }
  free(v2);
  return v3;
}

+ (BOOL)isBoolBootArgSetTrue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_ANEDeviceInfo bootArgs];
  if ([v4 rangeOfString:v3] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@=0", v3];
    BOOL v5 = [v4 rangeOfString:v6] == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

+ (BOOL)precompiledModelChecksDisabled
{
  id v3 = [a1 bootArgs];
  unsigned int v4 = [v3 containsString:@"enforceModelSignatureChecks=0"];
  if (v4)
  {
    BOOL v5 = NSStringFromSelector(a2);
    NSLog(@"%@: boot-args has %@ - allow any path for Pre-compiled models", v5, @"enforceModelSignatureChecks=0");
  }
  return v4;
}

+ (unsigned)numANEs
{
  if (!+[_ANEDeviceInfo hasANE])
  {
    uint64_t v7 = NSStringFromSelector(a2);
    NSLog(@"%@: [_ANEDeviceInfo numANEs] No ANEs found on system", v7);

    return 0;
  }
  unsigned int valuePtr = 1;
  CFDictionaryRef v3 = IOServiceMatching("H1xANELoadBalancer");
  if (v3 && (io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3)) != 0)
  {
    io_object_t v5 = MatchingService;
    CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, @"DeviceProperties", kCFAllocatorDefault, 0);
    IOObjectRelease(v5);
  }
  else
  {
    CFDictionaryRef CFProperty = 0;
  }
  CFDictionaryRef v9 = IOServiceMatching("H11ANEIn");
  if (v9 && (io_service_t v10 = IOServiceGetMatchingService(kIOMainPortDefault, v9)) != 0)
  {
    io_object_t v11 = v10;
    CFDictionaryRef v12 = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v10, @"DeviceProperties", kCFAllocatorDefault, 0);
    IOObjectRelease(v11);
    if (CFProperty) {
      CFMutableDictionaryRef MutableCopy = CFProperty;
    }
    else {
      CFMutableDictionaryRef MutableCopy = v12;
    }
    if (CFProperty && v12)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, CFProperty);
      CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)sub_10001D8A8, MutableCopy);
      CFRelease(CFProperty);
      CFRelease(v12);
    }
    if (MutableCopy) {
      goto LABEL_16;
    }
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = CFProperty;
    if (CFProperty)
    {
LABEL_16:
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(MutableCopy, @"ANEDevicePropertyNumANEs");
      if (Value)
      {
        CFNumberRef v15 = Value;
        CFTypeID v16 = CFGetTypeID(Value);
        if (v16 == CFNumberGetTypeID() && !CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
        {
          id v17 = +[_ANELog framework];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            sub_100031B2C();
          }
        }
      }
      if (!valuePtr)
      {
        v18 = +[_ANELog framework];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_100031AE8();
        }

        unsigned int valuePtr = 1;
      }
      CFRelease(MutableCopy);
      return valuePtr;
    }
  }
  v19 = +[_ANELog framework];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@: [_ANEDeviceInfo numANEs] Properties not found, default to 1 ANE", buf, 0xCu);
  }
  return 1;
}

+ (unsigned)numANECores
{
  CFDictionaryRef v3 = +[_ANEDeviceInfo aneSubType];
  unsigned int v4 = +[_ANEDeviceInfo numANEs];
  if (([v3 isEqual:@"h11"] & 1) != 0
    || ([v3 isEqual:@"h12"] & 1) != 0)
  {
    int v5 = 8;
  }
  else
  {
    if (([v3 isEqual:@"m9"] & 1) == 0)
    {
      if (([v3 isEqual:@"h13"] & 1) != 0
        || ([v3 isEqual:@"h14"] & 1) != 0
        || ([v3 isEqual:@"h15"] & 1) != 0
        || ([v3 isEqual:@"h16"] & 1) != 0)
      {
        int v5 = 16;
        goto LABEL_4;
      }
      if ([v3 isEqual:@"m11"])
      {
        int v5 = 4;
        goto LABEL_4;
      }
      uint64_t v7 = +[_ANELog framework];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100031B70();
      }
    }
    int v5 = 2;
  }
LABEL_4:

  return v5 * v4;
}

@end