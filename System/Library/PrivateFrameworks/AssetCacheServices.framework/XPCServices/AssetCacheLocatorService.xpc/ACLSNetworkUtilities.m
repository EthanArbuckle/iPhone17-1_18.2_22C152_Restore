@interface ACLSNetworkUtilities
+ (BOOL)areDigestedIdentifiers:(id)a3 equalToCleartextIdentifiers:(id)a4 tag:(unsigned int)a5;
+ (BOOL)hasUsefulUSBEthernetInterface;
+ (BOOL)isAutomaticConfigMethod4:(id)a3;
+ (BOOL)isAutomaticConfigMethod6:(id)a3;
+ (BOOL)isDigestedIdentifier:(id)a3 equalToCleartextIdentifier:(id)a4 tag:(unsigned int)a5;
+ (BOOL)isManualConfigMethod4:(id)a3;
+ (BOOL)isManualConfigMethod6:(id)a3;
+ (BOOL)isShareableInaddr4:(const in_addr *)a3;
+ (BOOL)isShareableInaddr6:(const in6_addr *)a3;
+ (BOOL)isShareableSockaddr4:(const sockaddr_in *)a3;
+ (BOOL)isShareableSockaddr6:(const sockaddr_in6 *)a3;
+ (BOOL)isUsefulInaddr4:(const in_addr *)a3;
+ (BOOL)isUsefulInaddr6:(const in6_addr *)a3;
+ (BOOL)isUsefulSockaddr4:(const sockaddr_in *)a3;
+ (BOOL)isUsefulSockaddr6:(const sockaddr_in6 *)a3;
+ (BOOL)isWiredNetworkInterfaceType:(id)a3;
+ (BOOL)makeLocalAddresses:(id *)a3 andGatewayIdentifiers:(id *)a4 tag:(unsigned int)a5;
+ (double)speedFromEthernetMediaSubType:(id)a3;
+ (id)allActiveNetworkInterfaces;
+ (id)createNetworkInterface:(__SCNetworkInterface *)a3 service:(__SCNetworkService *)a4 configInfo:(id)a5;
+ (id)digestIdentifier:(id)a3 tag:(unsigned int)a4;
+ (id)digestIdentifiers:(id)a3 tag:(unsigned int)a4;
+ (id)netmask4ContainingStartAddress:(id)a3 endAddress:(id)a4;
+ (id)serviceIDFromKey:(id)a3;
+ (id)stringFromInaddr4:(const in_addr *)a3;
+ (id)stringFromInaddr6:(const in6_addr *)a3;
+ (id)stringFromMacAddr:(char *)a3;
+ (id)stringFromSockaddr4:(const sockaddr_in *)a3;
+ (id)stringFromSockaddr6:(const sockaddr_in6 *)a3;
+ (id)stringFromSockaddrDL:(const sockaddr_dl *)a3;
+ (id)stringFromSockaddrStorage:(const sockaddr_storage *)a3;
@end

@implementation ACLSNetworkUtilities

+ (BOOL)hasUsefulUSBEthernetInterface
{
  [a1 allActiveNetworkInterfaces];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if objc_msgSend(v6, "isNCM", (void)v8) && (objc_msgSend(v6, "useful"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

+ (id)netmask4ContainingStartAddress:(id)a3 endAddress:(id)a4
{
  id v5 = a4;
  v17[0] = 0;
  v17[1] = 0;
  v16[0] = 0;
  v16[1] = 0;
  if (inet_pton(2, (const char *)[a3 UTF8String], (char *)v17 + 4) < 1
    || inet_pton(2, (const char *)[v5 UTF8String], (char *)v16 + 4) < 1)
  {
    goto LABEL_8;
  }
  unsigned int v6 = 0;
  unsigned int v7 = bswap32(HIDWORD(v16[0]) ^ HIDWORD(v17[0]));
  unsigned int v8 = 0x80000000;
  do
  {
    unsigned int v9 = v6;
    if (!v8) {
      break;
    }
    v6 |= v8;
    BOOL v10 = (v8 & v7) == 0;
    v8 >>= 1;
  }
  while (v10);
  *(void *)v14 = 0;
  uint64_t v15 = 0;
  unsigned int v13 = bswap32(v9);
  if (inet_ntop(2, &v13, v14, 0x10u))
  {
    long long v11 = +[NSString stringWithUTF8String:v14];
  }
  else
  {
LABEL_8:
    long long v11 = &stru_100035778;
  }

  return v11;
}

+ (id)allActiveNetworkInterfaces
{
  id v3 = objc_opt_new();
  uint64_t v4 = SCPreferencesCreate(0, @"AssetCacheTetherator", 0);
  if (v4)
  {
    v65 = v4;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    CFArrayRef v5 = SCNetworkServiceCopyAll(v4);
    id v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v95 objects:v109 count:16];
    if (!v6) {
      goto LABEL_104;
    }
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v85 = *(void *)v96;
    CFArrayRef v75 = v5;
    v72 = v3;
    while (1)
    {
      unsigned int v9 = 0;
      id v81 = v7;
      do
      {
        if (*(void *)v96 != v85) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(const __SCNetworkService **)(*((void *)&v95 + 1) + 8 * (void)v9);
        long long v11 = SCNetworkServiceGetServiceID(v10);
        if (v11)
        {
          v86 = v11;
          if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
          {
            v12 = +[NSMutableString stringWithFormat:@"service[%d] %@", v8, v11];
          }
          else
          {
            v12 = 0;
          }
          if (!SCNetworkServiceGetEnabled(v10))
          {
            [v12 appendFormat:@", network service disabled %@", v10];
            int v21 = 0;
            BSDName = 0;
            goto LABEL_28;
          }
          Interface = SCNetworkServiceGetInterface(v10);
          [v12 appendFormat:@", if %@", Interface];
          SCNetworkInterfaceRef v14 = SCNetworkInterfaceGetInterface(Interface);
          if (v14)
          {
            while (1)
            {
              uint64_t v15 = v14;
              if (CFEqual(v14, kSCNetworkInterfaceIPv4)) {
                break;
              }
              Interface = v15;
              [v12 appendFormat:@", if %@", v15];
              SCNetworkInterfaceRef v14 = SCNetworkInterfaceGetInterface(v15);
              if (!v14) {
                goto LABEL_17;
              }
            }
          }
          if (Interface)
          {
LABEL_17:
            BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(Interface);
            [v12 appendFormat:@", bn %@", BSDName];
            if (!BSDName) {
              goto LABEL_26;
            }
            CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, BSDName, kSCEntNetLink);
            [v12 appendFormat:@", lk %@", NetworkInterfaceEntity];
            if (NetworkInterfaceEntity)
            {
              BSDName = (__CFString *)SCDynamicStoreCreate(0, @"AssetCacheTetherator", 0, 0);
              [v12 appendFormat:@", ds %d", BSDName != 0];
              if (BSDName)
              {
                CFDictionaryRef v18 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)BSDName, NetworkInterfaceEntity);
                if (v18)
                {
                  store = (const __SCDynamicStore *)BSDName;
                  CFStringRef v74 = NetworkInterfaceEntity;
                  CFDictionaryRef v19 = v18;
                  [v12 appendFormat:@", li %d", CFDictionaryGetCount(v18)];
                  CFDictionaryRef v73 = v19;
                  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v19, kSCPropNetLinkActive);
                  [v12 appendFormat:@", la %@ %d", Value, Value == kCFBooleanTrue];
                  if (Value != kCFBooleanTrue) {
                    goto LABEL_22;
                  }
                  v26 = SCNetworkServiceCopyProtocol(v10, kSCNetworkProtocolTypeIPv4);
                  v82 = v10;
                  if (!v26)
                  {
                    [v12 appendFormat:@", 4p %d", 0xFFFFFFFFLL];
                    goto LABEL_70;
                  }
                  v27 = v26;
                  [v12 appendFormat:@", 4p %d", SCNetworkProtocolGetEnabled(v26)];
                  v28 = SCNetworkProtocolGetConfiguration(v27);
                  v29 = v28;
                  if (!v28)
                  {
                    [v12 appendFormat:@", 4c %d", 0xFFFFFFFFLL];
                    goto LABEL_68;
                  }
                  [v12 appendFormat:@", 4c %d", objc_msgSend(v28, "count")];
                  if (!SCNetworkProtocolGetEnabled(v27)) {
                    goto LABEL_68;
                  }
                  v70 = v27;
                  v30 = [v29 objectForKey:kSCPropNetIPv4ConfigMethod];
                  [v12 appendFormat:@", 4m %@", v30];
                  v68 = v29;
                  if ([a1 isManualConfigMethod4:v30])
                  {
                    v66 = v30;
                    BSDName = [a1 createNetworkInterface:Interface service:v10 configInfo:v29];
                    goto LABEL_67;
                  }
                  if (![a1 isAutomaticConfigMethod4:v30]
                    || (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4), [v12 appendFormat:@", 4g %@", NetworkServiceEntity], !NetworkServiceEntity))
                  {

                    v27 = v70;
                    goto LABEL_68;
                  }
                  v66 = v30;
                  CFArrayRef v32 = SCDynamicStoreCopyKeyList(store, NetworkServiceEntity);
                  long long v91 = 0u;
                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v94 = 0u;
                  CFArrayRef v33 = v32;
                  id v34 = [(__CFArray *)v33 countByEnumeratingWithState:&v91 objects:v108 count:16];
                  if (!v34)
                  {

                    CFArrayRef v43 = v33;
                    goto LABEL_65;
                  }
                  id v35 = v34;
                  CFArrayRef obj = v33;
                  CFStringRef cf = NetworkServiceEntity;
                  id v83 = a1;
                  BSDName = 0;
                  uint64_t v78 = *(void *)v92;
                  do
                  {
                    for (i = 0; i != v35; i = (char *)i + 1)
                    {
                      if (*(void *)v92 != v78) {
                        objc_enumerationMutation(obj);
                      }
                      CFStringRef v37 = *(const __CFString **)(*((void *)&v91 + 1) + 8 * i);
                      v38 = [v83 serviceIDFromKey:v37];
                      if ([v38 isEqualToString:v86])
                      {
                        v39 = (void *)SCDynamicStoreCopyValue(store, v37);
                        v40 = v39;
                        if (v39) {
                          uint64_t v41 = (uint64_t)[v39 count];
                        }
                        else {
                          uint64_t v41 = 0xFFFFFFFFLL;
                        }
                        [v12 appendFormat:@", 4d %d", v41];
                        uint64_t v42 = [v83 createNetworkInterface:Interface service:v82 configInfo:v40];

                        if (!v42) {
                          [v12 appendFormat:@", !4d %@", v40];
                        }

                        BSDName = (__CFString *)v42;
                        BOOL v10 = v82;
                      }
                    }
                    id v35 = [(__CFArray *)obj countByEnumeratingWithState:&v91 objects:v108 count:16];
                  }
                  while (v35);
                  CFArrayRef v43 = obj;

                  a1 = v83;
                  CFStringRef NetworkServiceEntity = cf;
                  if (!BSDName)
                  {
LABEL_65:
                    [v12 appendFormat:@", !4l %@", v43];
                    BSDName = 0;
                  }
                  CFRelease(NetworkServiceEntity);

                  CFArrayRef v5 = v75;
LABEL_67:

                  v29 = v68;
                  v27 = v70;
                  if (!BSDName)
                  {
LABEL_68:
                    [v12 appendFormat:@", !4c %@, !4p %@", v29, v27];
                    BSDName = 0;
                  }
                  CFRelease(v27);

                  id v3 = v72;
                  if (BSDName) {
                    goto LABEL_102;
                  }
LABEL_70:
                  v44 = SCNetworkServiceCopyProtocol(v10, kSCNetworkProtocolTypeIPv6);
                  if (v44)
                  {
                    v45 = v44;
                    [v12 appendFormat:@", 6p %d", SCNetworkProtocolGetEnabled(v44)];
                    v46 = SCNetworkProtocolGetConfiguration(v45);
                    v47 = v46;
                    if (!v46)
                    {
                      [v12 appendFormat:@", 6c %d", 0xFFFFFFFFLL];
                      goto LABEL_100;
                    }
                    [v12 appendFormat:@", 6c %d", objc_msgSend(v46, "count")];
                    if (!SCNetworkProtocolGetEnabled(v45)) {
                      goto LABEL_100;
                    }
                    v48 = [v47 objectForKey:kSCPropNetIPv6ConfigMethod];
                    [v12 appendFormat:@", 6m %@", v48];
                    if ([a1 isManualConfigMethod6:v48])
                    {
                      v69 = v48;
                      v71 = v47;
                      BSDName = [a1 createNetworkInterface:Interface service:v10 configInfo:v47];
                      goto LABEL_99;
                    }
                    if (![a1 isAutomaticConfigMethod6:v48]
                      || (CFStringRef v49 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv6), [v12 appendFormat:@", 6g %@", v49], !v49))
                    {

                      goto LABEL_100;
                    }
                    v69 = v48;
                    v71 = v47;
                    CFStringRef v67 = v49;
                    CFArrayRef v50 = SCDynamicStoreCopyKeyList(store, v49);
                    long long v87 = 0u;
                    long long v88 = 0u;
                    long long v89 = 0u;
                    long long v90 = 0u;
                    CFArrayRef v51 = v50;
                    id v84 = [(__CFArray *)v51 countByEnumeratingWithState:&v87 objects:v107 count:16];
                    if (!v84)
                    {

                      CFArrayRef v60 = v51;
                      goto LABEL_97;
                    }
                    CFArrayRef obja = v51;
                    cfa = v45;
                    BSDName = 0;
                    uint64_t v79 = *(void *)v88;
                    do
                    {
                      for (j = 0; j != v84; j = (char *)j + 1)
                      {
                        if (*(void *)v88 != v79) {
                          objc_enumerationMutation(obja);
                        }
                        CFStringRef v53 = *(const __CFString **)(*((void *)&v87 + 1) + 8 * (void)j);
                        v54 = [a1 serviceIDFromKey:v53];
                        if ([v54 isEqualToString:v86])
                        {
                          v55 = (void *)SCDynamicStoreCopyValue(store, v53);
                          v56 = v55;
                          if (v55) {
                            uint64_t v57 = (uint64_t)[v55 count];
                          }
                          else {
                            uint64_t v57 = 0xFFFFFFFFLL;
                          }
                          [v12 appendFormat:@", 6d %d", v57];
                          id v58 = a1;
                          uint64_t v59 = [a1 createNetworkInterface:Interface service:v82 configInfo:v56];

                          if (!v59) {
                            [v12 appendFormat:@", !6d %@", v56];
                          }

                          BSDName = (__CFString *)v59;
                          a1 = v58;
                          CFArrayRef v5 = v75;
                        }
                      }
                      id v84 = [(__CFArray *)obja countByEnumeratingWithState:&v87 objects:v107 count:16];
                    }
                    while (v84);
                    CFArrayRef v60 = obja;

                    v45 = cfa;
                    if (!BSDName)
                    {
LABEL_97:
                      [v12 appendFormat:@", !6l %@", v60];
                      BSDName = 0;
                    }
                    CFRelease(v67);

LABEL_99:
                    v47 = v71;
                    if (!BSDName)
                    {
LABEL_100:
                      [v12 appendFormat:@", !6c %@, !6p %@", v47, v45];
                      BSDName = 0;
                    }
                    CFRelease(v45);

                    id v3 = v72;
                    if (BSDName)
                    {
LABEL_102:
                      CFRelease(v73);
                      v25 = store;
                      id v7 = v81;
                      CFStringRef NetworkInterfaceEntity = v74;
                      goto LABEL_35;
                    }
                  }
                  else
                  {
                    [v12 appendFormat:@", 6p %d", 0xFFFFFFFFLL];
                  }
LABEL_22:
                  [v12 appendFormat:@", !li %@", v73];
                  CFRelease(v73);
                  CFStringRef NetworkInterfaceEntity = v74;
                  BSDName = (__CFString *)store;
                }
                else
                {
                  [v12 appendFormat:@", li %d", 0xFFFFFFFFLL];
                }
                [v12 appendFormat:@", !ds %@", BSDName];
                v25 = BSDName;
                BSDName = 0;
                id v7 = v81;
LABEL_35:
                CFRelease(v25);
                CFRelease(NetworkInterfaceEntity);
                if (BSDName)
                {
                  [v3 addObject:BSDName];
                  int v21 = 1;
                }
                else
                {
                  int v21 = 0;
                }
LABEL_28:
                v22 = gLogHandle;
                if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
                {
                  v23 = v22;
                  v24 = currentQueueName();
                  *(_DWORD *)buf = 67109890;
                  int v100 = 0;
                  __int16 v101 = 2080;
                  v102 = v24;
                  __int16 v103 = 1024;
                  int v104 = v21;
                  __int16 v105 = 2112;
                  v106 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "#%08x [%s] allActiveNetworkInterfaces %d %@", buf, 0x22u);
                }
                long long v11 = v86;
                goto LABEL_31;
              }
              CFRelease(NetworkInterfaceEntity);
LABEL_26:
              int v21 = 0;
LABEL_27:
              id v7 = v81;
              goto LABEL_28;
            }
          }
          int v21 = 0;
          BSDName = 0;
          goto LABEL_27;
        }
LABEL_31:
        uint64_t v8 = (v8 + 1);

        unsigned int v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v61 = [(__CFArray *)v5 countByEnumeratingWithState:&v95 objects:v109 count:16];
      id v7 = v61;
      if (!v61)
      {
LABEL_104:

        CFRelease(v65);
        break;
      }
    }
  }

  return v3;
}

+ (double)speedFromEthernetMediaSubType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (const char *)[v3 UTF8String];
  if (v4)
  {
    BOOL v10 = 0;
    double v5 = strtod(v4, &v10);
    double v6 = v5;
    BOOL v7 = v5 <= 0.0 || v10 == 0;
    if (!v7 && *v10 == 71) {
      double v6 = v5 * 1000.0;
    }
  }
  else
  {
    [v3 doubleValue];
    double v6 = v8;
  }

  return v6;
}

+ (id)createNetworkInterface:(__SCNetworkInterface *)a3 service:(__SCNetworkService *)a4 configInfo:(id)a5
{
  id v8 = a5;
  unsigned int v9 = objc_opt_new();
  [v9 setBsdName:SCNetworkInterfaceGetBSDName(a3)];
  [v9 setDeviceID:SCNetworkServiceGetServiceID(a4)];
  [v9 setUserReadable:SCNetworkInterfaceGetLocalizedDisplayName(a3)];
  [v9 setInterfaceType:SCNetworkInterfaceGetInterfaceType(a3)];
  BOOL v10 = [v9 interfaceType];
  objc_msgSend(v9, "setWired:", objc_msgSend(a1, "isWiredNetworkInterfaceType:", v10));

  [v9 setLocationID:&off_1000375B0];
  [v9 setIsNCM:0];
  uint64_t IORegistryEntryID = _SCNetworkInterfaceGetIORegistryEntryID();
  if (IORegistryEntryID)
  {
    uint64_t v12 = IORegistryEntryID;
    mainPort[0] = 0;
    if (!IOMainPort(0, mainPort))
    {
      mach_port_t v13 = mainPort[0];
      if (mainPort[0])
      {
        CFDictionaryRef v14 = IORegistryEntryIDMatching(v12);
        io_service_t MatchingService = IOServiceGetMatchingService(v13, v14);
        if (MatchingService)
        {
          io_registry_entry_t v16 = MatchingService;
          CFNumberRef v17 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"locationID", 0, 3u);
          if (v17)
          {
            CFNumberRef v18 = v17;
            io_registry_entry_t valuePtr = 0;
            CFNumberGetValue(v17, kCFNumberSInt32Type, &valuePtr);
            CFDictionaryRef v19 = +[NSNumber numberWithUnsignedInt:valuePtr];
            [v9 setLocationID:v19];

            CFRelease(v18);
          }
          io_registry_entry_t valuePtr = 0;
          if (!IORegistryEntryGetParentEntry(v16, "IOService", &valuePtr) && valuePtr)
          {
            objc_msgSend(v9, "setIsNCM:", IOObjectConformsTo(valuePtr, "AppleUSBDeviceNCMData") != 0);
            IOObjectRelease(valuePtr);
          }
          IOObjectRelease(v16);
        }
        mach_port_deallocate(mach_task_self_, mainPort[0]);
      }
    }
  }
  if ([v9 wired])
  {
    *(void *)mainPort = 0;
    SCNetworkInterfaceCopyMediaOptions(a3, 0, (CFDictionaryRef *)mainPort, 0, 1u);
    if (*(void *)mainPort)
    {
      v20 = CFDictionaryGetValue(*(CFDictionaryRef *)mainPort, kSCPropNetEthernetMediaSubType);
      [a1 speedFromEthernetMediaSubType:v20];
      objc_msgSend(v9, "setSpeed:");
      CFRelease(*(CFTypeRef *)mainPort);
    }
  }
  int v21 = [v8 objectForKey:kSCPropNetIPv4Addresses];
  v22 = [v21 lastObject];

  v23 = [v8 objectForKey:kSCPropNetIPv4SubnetMasks];
  v24 = [v23 lastObject];

  v25 = [v8 objectForKey:kSCPropNetIPv6Addresses];
  v26 = [v25 lastObject];

  v27 = [v8 objectForKey:kSCPropNetIPv6PrefixLength];

  v28 = [v27 lastObject];

  [v9 setShareable:0];
  [v9 setUseful:0];
  if ([v22 length] && objc_msgSend(v24, "length"))
  {
    *(void *)mainPort = 0;
    v35[0] = 0;
    id v29 = v22;
    if (inet_pton(2, (const char *)[v29 UTF8String], &mainPort[1]) < 1) {
      goto LABEL_24;
    }
    [v9 setIpAddress:v29];
    objc_msgSend(v9, "setShareable:", objc_msgSend(a1, "isShareableSockaddr4:", mainPort));
    id v30 = [a1 isUsefulSockaddr4:mainPort];
    goto LABEL_23;
  }
  if ([v26 length])
  {
    if (v28)
    {
      *(void *)mainPort = 0;
      v35[0] = 0;
      int v36 = 0;
      v35[1] = 0;
      id v31 = v26;
      if (inet_pton(30, (const char *)[v31 UTF8String], v35) >= 1)
      {
        [v9 setIpAddress:v31];
        objc_msgSend(v9, "setShareable:", objc_msgSend(a1, "isShareableSockaddr6:", mainPort));
        id v30 = [a1 isUsefulSockaddr6:mainPort];
LABEL_23:
        [v9 setUseful:v30];
      }
    }
  }
LABEL_24:

  return v9;
}

+ (BOOL)isShareableSockaddr4:(const sockaddr_in *)a3
{
  return [a1 isShareableInaddr4:&a3->sin_addr];
}

+ (BOOL)isShareableSockaddr6:(const sockaddr_in6 *)a3
{
  return [a1 isShareableInaddr6:&a3->sin6_addr];
}

+ (BOOL)isShareableInaddr4:(const in_addr *)a3
{
  if (a3->s_addr == 10) {
    return 1;
  }
  unsigned int v3 = bswap32(a3->s_addr);
  if (v3 >> 20 == 2753) {
    return 1;
  }
  unsigned int v5 = v3 & 0xFFFF0000;
  return v5 == -1062731776 || v5 == -1442971648;
}

+ (BOOL)isShareableInaddr6:(const in6_addr *)a3
{
  if (a3->__u6_addr32[0] || a3->__u6_addr32[1]) {
    return 1;
  }
  if (!a3->__u6_addr32[2] && !a3->__u6_addr32[3]) {
    return 0;
  }
  if (a3->__u6_addr32[2]) {
    return 1;
  }
  return a3->__u6_addr32[3] != 0x1000000;
}

+ (BOOL)isUsefulSockaddr4:(const sockaddr_in *)a3
{
  return [a1 isUsefulInaddr4:&a3->sin_addr];
}

+ (BOOL)isUsefulSockaddr6:(const sockaddr_in6 *)a3
{
  return [a1 isUsefulInaddr6:&a3->sin6_addr];
}

+ (BOOL)isUsefulInaddr4:(const in_addr *)a3
{
  BOOL v4 = (unsigned __int16)a3->s_addr != 65193 && a3->s_addr != 127;
  return a3->s_addr && v4;
}

+ (BOOL)isUsefulInaddr6:(const in6_addr *)a3
{
  if (a3->__u6_addr32[0]) {
    return a3->__u6_addr32[0] != 254 || (a3->__u6_addr32[0] & 0xC000) != 0x8000;
  }
  else {
    return a3->__u6_addr32[1]
  }
        || (a3->__u6_addr32[2] || a3->__u6_addr32[3]) && (a3->__u6_addr32[2] || a3->__u6_addr32[3] != 0x1000000);
}

+ (BOOL)isManualConfigMethod4:(id)a3
{
  return [a3 isEqualToString:kSCValNetIPv4ConfigMethodManual];
}

+ (BOOL)isManualConfigMethod6:(id)a3
{
  return [a3 isEqualToString:kSCValNetIPv6ConfigMethodManual];
}

+ (BOOL)isAutomaticConfigMethod4:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kSCValNetIPv4ConfigMethodDHCP, kSCValNetIPv4ConfigMethodINFORM, kSCValNetIPv4ConfigMethodBOOTP, kSCValNetIPv4ConfigMethodPPP, 0);
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

+ (BOOL)isAutomaticConfigMethod6:(id)a3
{
  return [a3 isEqualToString:kSCValNetIPv6ConfigMethodAutomatic];
}

+ (BOOL)isWiredNetworkInterfaceType:(id)a3
{
  id v3 = a3;
  v8[0] = kSCNetworkInterfaceTypeBond;
  v8[1] = kSCNetworkInterfaceTypeEthernet;
  v8[2] = kSCNetworkInterfaceTypeFireWire;
  BOOL v4 = +[NSArray arrayWithObjects:v8 count:3];
  unsigned __int8 v5 = v4;
  if (v3) {
    unsigned __int8 v6 = [v4 containsObject:v3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)serviceIDFromKey:(id)a3
{
  id v3 = +[NSScanner scannerWithString:a3];
  BOOL v4 = +[NSCharacterSet characterSetWithCharactersInString:@"/"];
  unsigned __int8 v5 = 0;
  if ([v3 scanUpToString:@"/Network/Service/" intoString:0])
  {
    unsigned __int8 v5 = 0;
    if ([v3 scanString:@"/Network/Service/" intoString:0])
    {
      id v9 = 0;
      unsigned __int8 v6 = [v3 scanUpToCharactersFromSet:v4 intoString:&v9];
      id v7 = v9;
      unsigned __int8 v5 = v7;
      if ((v6 & 1) == 0)
      {

        unsigned __int8 v5 = 0;
      }
    }
  }

  return v5;
}

+ (id)stringFromInaddr4:(const in_addr *)a3
{
  *(void *)unsigned __int8 v5 = 0;
  uint64_t v6 = 0;
  id v3 = (void *)inet_ntop(2, a3, v5, 0x10u);
  if (v3)
  {
    id v3 = +[NSString stringWithUTF8String:v5];
  }

  return v3;
}

+ (id)stringFromInaddr6:(const in6_addr *)a3
{
  memset(v5, 0, 46);
  id v3 = (void *)inet_ntop(30, a3, (char *)v5, 0x2Eu);
  if (v3)
  {
    id v3 = +[NSString stringWithUTF8String:v5];
  }

  return v3;
}

+ (id)stringFromMacAddr:(char *)a3
{
  return +[NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *a3, a3[1], a3[2], a3[3], a3[4], a3[5]];
}

+ (id)stringFromSockaddr4:(const sockaddr_in *)a3
{
  return [a1 stringFromInaddr4:&a3->sin_addr];
}

+ (id)stringFromSockaddr6:(const sockaddr_in6 *)a3
{
  return [a1 stringFromInaddr6:&a3->sin6_addr];
}

+ (id)stringFromSockaddrDL:(const sockaddr_dl *)a3
{
  if (a3->sdl_type == 6 && a3->sdl_alen == 6)
  {
    BOOL v4 = [a1 stringFromMacAddr:&a3->sdl_data[a3->sdl_nlen]];
  }
  else
  {
    unsigned __int8 v5 = +[NSMutableString stringWithFormat:@"<type=%#x>", a3->sdl_type];
    BOOL v4 = v5;
    if (a3->sdl_nlen) {
      objc_msgSend(v5, "appendFormat:", @"%.*s", a3->sdl_nlen, a3->sdl_data);
    }
    else {
      [v5 appendString:@"<unknown>"];
    }
    if (a3->sdl_alen)
    {
      unint64_t v6 = 0;
      id v7 = &a3->sdl_data[a3->sdl_nlen];
      CFStringRef v8 = @":";
      do
      {
        [v4 appendString:v8];
        objc_msgSend(v4, "appendFormat:", @"%02x", v7[v6++]);
        CFStringRef v8 = @"-";
      }
      while (v6 < a3->sdl_alen);
    }
  }

  return v4;
}

+ (id)stringFromSockaddrStorage:(const sockaddr_storage *)a3
{
  int ss_family = a3->ss_family;
  if (ss_family == 30)
  {
    BOOL v4 = objc_msgSend(a1, "stringFromSockaddr6:");
  }
  else if (ss_family == 18)
  {
    BOOL v4 = objc_msgSend(a1, "stringFromSockaddrDL:");
  }
  else
  {
    if (ss_family == 2) {
      objc_msgSend(a1, "stringFromSockaddr4:");
    }
    else {
    BOOL v4 = +[NSString stringWithFormat:@"(family=%u)", a3->ss_family];
    }
  }

  return v4;
}

+ (BOOL)makeLocalAddresses:(id *)a3 andGatewayIdentifiers:(id *)a4 tag:(unsigned int)a5
{
  CFStringRef v8 = gLogHandle;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
    sub_100023074(a5, v8);
  }

  *(_OWORD *)v127 = xmmword_10002A060;
  uint64_t v128 = 7;
  size_t size = 0;
  id v9 = 0;
  id v10 = 0;
  long long v11 = 0;
  uint64_t v12 = 0;
  if (sysctl(v127, 6u, 0, &size, 0, 0)) {
    goto LABEL_9;
  }
  mach_port_t v13 = (unsigned __int16 *)malloc_type_malloc(size, 0xAC73BC59uLL);
  if (!v13)
  {
    id v9 = 0;
    id v10 = 0;
    long long v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  CFDictionaryRef v14 = v13;
  if (sysctl(v127, 6u, v13, &size, 0, 0))
  {
    id v9 = 0;
    uint64_t v15 = (char *)v14;
    id v10 = 0;
    long long v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  if ((uint64_t)size < 1)
  {
    id v9 = 0;
    id v10 = 0;
    long long v11 = 0;
    uint64_t v12 = 0;
    uint64_t v15 = (char *)v14;
    goto LABEL_7;
  }
  unsigned int v96 = a5;
  char v97 = 0;
  int v21 = 0;
  uint64_t v98 = 0;
  unint64_t v95 = 0;
  unint64_t v22 = (unint64_t)v14 + size;
  long long v94 = v14;
  v23 = v14;
  v99 = a4;
  int v100 = a3;
  do
  {
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v24 = +[NSMutableString stringWithFormat:@"sa_family=%d, rtm_addrs=%#x, rtm_flags=%#x", *((unsigned __int8 *)v23 + 93), *((unsigned int *)v23 + 3), *((unsigned int *)v23 + 2)];
    }
    else
    {
      v24 = 0;
    }
    int v25 = *((unsigned __int8 *)v23 + 93);
    BOOL v26 = v25 == 2 || v25 == 30;
    if (!v26)
    {
      v40 = gLogHandle;
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v59 = v40;
        CFArrayRef v60 = currentQueueName();
        LODWORD(buf[0]) = 67109635;
        HIDWORD(buf[0]) = v96;
        LOWORD(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 2) = v60;
        WORD1(buf[2]) = 2113;
        *(void *)((char *)&buf[2] + 4) = v24;
        _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "#%08x [%s] makeLocalAddresses: %{private}@", (uint8_t *)buf, 0x1Cu);
      }
      goto LABEL_103;
    }
    __int16 v101 = v21;
    v27 = (unsigned __int8 *)(v23 + 46);
    bzero(buf, 0x400uLL);
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    while (((*((_DWORD *)v23 + 3) >> v29) & 1) == 0)
    {
LABEL_43:
      ++v29;
      v28 += 16;
      if (v28 == 128) {
        goto LABEL_47;
      }
    }
    uint64_t v30 = *v27;
    if ((unint64_t)&v27[v30] <= v22 && v30 <= 0x80 && &v27[v30] <= (unsigned __int8 *)v23 + *v23)
    {
      memcpy(&buf[v28], v27, *v27);
      if (v28 == 32) {
        v124[121] = BYTE1(buf[0]);
      }
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
      {
        CFArrayRef v32 = off_100034AB0[v29];
        uint64_t v33 = *v27;
        id v34 = [a1 stringFromSockaddrStorage:&buf[v28]];
        [v24 appendFormat:@", %s=[%u]%@", v32, v33, v34];
      }
      int v35 = *v27;
      uint64_t v36 = ((v35 - 1) & 0xFFFFFFFC) + 4;
      BOOL v26 = v35 == 0;
      uint64_t v37 = 4;
      if (!v26) {
        uint64_t v37 = v36;
      }
      v27 += v37;
      goto LABEL_43;
    }
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
      [v24 appendFormat:@", skipping %s (sa=%p + len=%d = %p, lim=%p, msg=%p)", off_100034AB0[v29], v27, v30, &v27[v30], v22, (char *)v23 + *v23];
    }
LABEL_47:
    v38 = gLogHandle;
    int v21 = v101;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
    {
      v47 = currentQueueName();
      *(_DWORD *)v106 = 67109635;
      unsigned int v107 = v96;
      __int16 v108 = 2080;
      v109 = v47;
      __int16 v110 = 2113;
      *(void *)v111 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v38, OS_LOG_TYPE_DEBUG, "#%08x [%s] makeLocalAddresses: %{private}@", v106, 0x1Cu);
    }

    int v39 = __n_1;
    a4 = v99;
    if (BYTE1(buf[0]) == __n_1)
    {
      a3 = v100;
      if (BYTE1(buf[0]) == 30)
      {
        if (vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(*(int32x4_t *)&buf[1], *(int32x4_t *)&buf[1])))) {
          goto LABEL_103;
        }
        if (vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(v126, v126)))) {
          goto LABEL_61;
        }
        goto LABEL_62;
      }
      if (BYTE1(buf[0]) == 2)
      {
        if (HIDWORD(buf[0])) {
          goto LABEL_103;
        }
        if (!v125) {
          goto LABEL_62;
        }
LABEL_61:
        if (v124[120]) {
          goto LABEL_103;
        }
LABEL_62:
        uint64_t v42 = v98;
        if (v98 >= v95)
        {
          uint64_t v43 = 2 * v95;
          if (!v95) {
            uint64_t v43 = 10;
          }
          unint64_t v95 = v43;
          uint64_t v42 = v98;
          int v21 = (char *)malloc_type_realloc(v101, 272 * v43, 0x10000406C200A1FuLL);
        }
        v44 = &v21[272 * v42];
        *((_OWORD *)v44 + 15) = 0u;
        *((_OWORD *)v44 + 16) = 0u;
        *((_OWORD *)v44 + 13) = 0u;
        *((_OWORD *)v44 + 14) = 0u;
        *((_OWORD *)v44 + 11) = 0u;
        *((_OWORD *)v44 + 12) = 0u;
        *((_OWORD *)v44 + 9) = 0u;
        *((_OWORD *)v44 + 10) = 0u;
        *((_OWORD *)v44 + 7) = 0u;
        *((_OWORD *)v44 + 8) = 0u;
        *((_OWORD *)v44 + 5) = 0u;
        *((_OWORD *)v44 + 6) = 0u;
        *((_OWORD *)v44 + 3) = 0u;
        *((_OWORD *)v44 + 4) = 0u;
        *((_OWORD *)v44 + 1) = 0u;
        *((_OWORD *)v44 + 2) = 0u;
        *(_OWORD *)v44 = 0u;
        *(_DWORD *)v44 = v23[2];
        memcpy(v44 + 136, &__n, __n);
        v45 = gLogHandle;
        if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_DEBUG))
        {
          id v61 = currentQueueName();
          int v62 = *(_DWORD *)v44;
          id v63 = [a1 stringFromSockaddrStorage:v44 + 136];
          *(_DWORD *)v106 = 67110147;
          unsigned int v107 = v96;
          __int16 v108 = 2080;
          v109 = v61;
          a3 = v100;
          __int16 v110 = 2048;
          *(void *)v111 = v42;
          *(_WORD *)&v111[8] = 1024;
          *(_DWORD *)&v111[10] = v62;
          __int16 v112 = 2113;
          id v113 = v63;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v45, OS_LOG_TYPE_DEBUG, "#%08x [%s] makeLocalAddresses: defaultAddresses[%ld]: ifindex=%d gwaddr=%{private}@", v106, 0x2Cu);
        }
        uint64_t v98 = v42 + 1;

        int v39 = __n_1;
      }
      else
      {
        int v39 = BYTE1(buf[0]);
      }
    }
    else
    {
      a3 = v100;
    }
    if ((*((unsigned char *)v23 + 9) & 4) != 0 && v39 == 18)
    {
      v46 = &v124[__n_5];
      if (*(_DWORD *)v46 | *((unsigned __int16 *)v46 + 2))
      {
        if (!(v97 & 1 | (__n_6 != 6)))
        {
          if (*(_DWORD *)v46 ^ 2 | *((unsigned __int16 *)v46 + 2))
          {
            char v97 = 0;
          }
          else
          {
            v48 = gLogHandle;
            if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR))
            {
              v64 = currentQueueName();
              *(_DWORD *)v106 = 67109378;
              unsigned int v107 = v96;
              __int16 v108 = 2080;
              v109 = v64;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v48, OS_LOG_TYPE_ERROR, "#%08x [%s] makeLocalAddresses: denied access to MAC address", v106, 0x12u);
            }

            char v97 = 1;
          }
        }
        if (v98 >= 1)
        {
          for (unint64_t i = 0; &v21[i] < &v21[272 * v98]; i += 272)
          {
            char v50 = v21[i + 270];
            if ((v50 & 2) == 0)
            {
              int v51 = v21[i + 137];
              if (v51 == 2 && BYTE1(buf[0]) == 2)
              {
                if (*(_DWORD *)&v21[i + 140] == HIDWORD(buf[0])) {
                  goto LABEL_100;
                }
              }
              else if (v51 == 30 {
                     && BYTE1(buf[0]) == 30
              }
                     && *(void *)&v21[i + 144] == buf[1]
                     && *(void *)&v21[i + 152] == buf[2])
              {
LABEL_100:
                v55 = &v21[i];
                v56 = &v124[__n_5];
                int v57 = *(_DWORD *)v56;
                *((_WORD *)v55 + 134) = *((_WORD *)v56 + 2);
                *((_DWORD *)v55 + 66) = v57;
                v55[270] = v50 | 2;
                id v58 = gLogHandle;
                if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_DEBUG))
                {
                  v65 = currentQueueName();
                  id v66 = [a1 stringFromMacAddr:v55 + 264];
                  *(_DWORD *)v106 = 67109891;
                  unsigned int v107 = v96;
                  __int16 v108 = 2080;
                  v109 = v65;
                  a3 = v100;
                  __int16 v110 = 1024;
                  *(_DWORD *)v111 = -252645135 * (i >> 4);
                  *(_WORD *)&v111[4] = 2113;
                  *(void *)&v111[6] = v66;
                  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v58, OS_LOG_TYPE_DEBUG, "#%08x [%s] makeLocalAddresses: defaultAddresses[%d]: gwmac=%{private}@", v106, 0x22u);
                }
                break;
              }
            }
          }
        }
      }
    }
LABEL_103:
    v23 = (unsigned __int16 *)((char *)v23 + *v23);
  }
  while ((unint64_t)v23 < v22);
  free(v94);
  v102 = v21;
  if (!v98)
  {
    uint64_t v12 = 0;
    long long v11 = 0;
    id v10 = 0;
    id v9 = 0;
    a5 = v96;
    goto LABEL_170;
  }
  int v104 = 0;
  if (getifaddrs(&v104)) {
    int v104 = 0;
  }
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v67 = v104;
    if (v104)
    {
      long long v68 = 0uLL;
      do
      {
        if (v67->ifa_name && v67->ifa_addr)
        {
          long long v118 = v68;
          long long v119 = v68;
          long long v116 = v68;
          long long v117 = v68;
          *(_OWORD *)&uint8_t buf[4] = v68;
          long long v115 = v68;
          *(_OWORD *)buf = v68;
          *(_OWORD *)&buf[2] = v68;
          __memcpy_chk();
          ifa_name = v67->ifa_name;
          uint64_t ifa_flags = v67->ifa_flags;
          v71 = [a1 stringFromSockaddrStorage:buf];
          v72 = +[NSMutableString stringWithFormat:@"ifa_name=%s, ifa_flags=%#x, ifa_addr=%@", ifa_name, ifa_flags, v71];

          if (v67->ifa_netmask)
          {
            long long v118 = 0u;
            long long v119 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            long long v115 = 0u;
            memset(buf, 0, sizeof(buf));
            __memcpy_chk();
            CFDictionaryRef v73 = [a1 stringFromSockaddrStorage:buf];
            [v72 appendFormat:@", ifa_netmask=%@", v73];
          }
          if (v67->ifa_dstaddr)
          {
            long long v118 = 0u;
            long long v119 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            long long v115 = 0u;
            memset(buf, 0, sizeof(buf));
            __memcpy_chk();
            CFStringRef v74 = [a1 stringFromSockaddrStorage:buf];
            [v72 appendFormat:@", ifa_dstaddr=%@", v74];
          }
          CFArrayRef v75 = gLogHandle;
          if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEBUG))
          {
            v76 = currentQueueName();
            *(_DWORD *)v106 = 67109634;
            unsigned int v107 = v96;
            __int16 v108 = 2080;
            v109 = v76;
            __int16 v110 = 2112;
            *(void *)v111 = v72;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v75, OS_LOG_TYPE_DEBUG, "#%08x [%s] makeLocalAddresses: %@", v106, 0x1Cu);
          }

          long long v68 = 0uLL;
        }
        CFStringRef v67 = v67->ifa_next;
      }
      while (v67);
    }
  }
  v77 = v102;
  uint64_t v78 = &v102[272 * v98];
  if (v98 < 1) {
    goto LABEL_141;
  }
  while (2)
  {
    if ((v77[270] & 2) == 0) {
      goto LABEL_136;
    }
    if (!if_indextoname(*(_DWORD *)v77, (char *)v106)) {
      goto LABEL_136;
    }
    uint64_t v79 = v104;
    if (!v104) {
      goto LABEL_136;
    }
    while (2)
    {
      v80 = v79->ifa_name;
      if (!v80) {
        goto LABEL_135;
      }
      ifa_addr = v79->ifa_addr;
      if (!ifa_addr) {
        goto LABEL_135;
      }
      if (strcmp(v80, (const char *)v106)) {
        goto LABEL_135;
      }
      int sa_family = ifa_addr->sa_family;
      if (sa_family != v77[137]) {
        goto LABEL_135;
      }
      if (sa_family != 30)
      {
        if (sa_family == 2 && ifa_addr->sa_len == 16)
        {
          buf[0] = 0;
          buf[1] = 0;
          __memcpy_chk();
          if ([a1 isUsefulSockaddr4:buf]) {
            break;
          }
        }
        goto LABEL_135;
      }
      if (ifa_addr->sa_len != 28
        || (memset(buf, 0, 28), __memcpy_chk(), ![a1 isUsefulSockaddr6:buf]))
      {
LABEL_135:
        uint64_t v79 = v79->ifa_next;
        if (!v79) {
          goto LABEL_136;
        }
        continue;
      }
      break;
    }
    memcpy(v77 + 8, v79->ifa_addr, v79->ifa_addr->sa_len);
    v77[270] |= 1u;
    id v83 = gLogHandle;
    if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_DEBUG))
    {
      id v84 = currentQueueName();
      id v85 = [a1 stringFromSockaddrStorage:v77 + 8];
      LODWORD(buf[0]) = 67109890;
      HIDWORD(buf[0]) = v96;
      LOWORD(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 2) = v84;
      WORD1(buf[2]) = 1024;
      HIDWORD(buf[2]) = -252645135 * ((unint64_t)(v77 - v102) >> 4);
      LOWORD(buf[3]) = 2112;
      *(void *)((char *)&buf[3] + 2) = v85;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v83, OS_LOG_TYPE_DEBUG, "#%08x [%s] makeLocalAddresses: defaultAddresses[%d]: ifaddr=%@", (uint8_t *)buf, 0x22u);
    }
LABEL_136:
    v77 += 272;
    if (v77 < v78) {
      continue;
    }
    break;
  }
LABEL_141:
  if (v104) {
    freeifaddrs(v104);
  }
  a3 = v100;
  uint64_t v12 = 0;
  long long v11 = 0;
  id v10 = 0;
  id v9 = 0;
  if (v98 < 1)
  {
    a5 = v96;
    a4 = v99;
    goto LABEL_170;
  }
  id v86 = a1;
  long long v87 = v102 + 264;
  while (2)
  {
    if (v87[6])
    {
      int v88 = *(v87 - 255);
      if (v88 == 30)
      {
        if (!v10)
        {
          id v10 = +[NSMutableArray arrayWithCapacity:v98];
          id v86 = a1;
        }
        long long v89 = [v86 stringFromSockaddr6:v87 - 256];
        long long v90 = v10;
LABEL_154:
        [v90 addObject:v89];

        id v86 = a1;
      }
      else if (v88 == 2)
      {
        if (!v9)
        {
          id v9 = +[NSMutableArray arrayWithCapacity:v98];
          id v86 = a1;
        }
        long long v89 = [v86 stringFromSockaddr4:v87 - 256];
        long long v90 = v9;
        goto LABEL_154;
      }
    }
    if ((v87[6] & 2) != 0)
    {
      long long v91 = [v86 stringFromMacAddr:v87];
      if (v11)
      {
        if ([v12 containsObject:v91])
        {
LABEL_161:

          id v86 = a1;
          goto LABEL_162;
        }
      }
      else
      {
        long long v11 = +[NSMutableArray arrayWithCapacity:v98];
        uint64_t v92 = +[NSMutableSet setWithCapacity:v98];

        uint64_t v12 = (void *)v92;
        a3 = v100;
      }
      [v11 addObject:v91];
      [v12 addObject:v91];
      goto LABEL_161;
    }
LABEL_162:
    long long v93 = v87 + 8;
    v87 += 272;
    if (v93 < v78) {
      continue;
    }
    break;
  }
  a5 = v96;
  a4 = v99;
  if (v10)
  {
    if (v9)
    {
      [v9 addObjectsFromArray:v10];
    }
    else
    {
      id v10 = v10;
      id v9 = v10;
    }
  }
LABEL_170:
  uint64_t v15 = v102;
  if (v102) {
LABEL_7:
  }
    free(v15);
LABEL_9:
  if (a3) {
    *a3 = [v9 copy];
  }
  if (a4) {
    *a4 = [v11 copy];
  }
  io_registry_entry_t v16 = gLogHandle;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    CFNumberRef v17 = currentQueueName();
    id v18 = [v11 count];
    LODWORD(buf[0]) = 67110147;
    HIDWORD(buf[0]) = a5;
    LOWORD(buf[1]) = 2080;
    *(void *)((char *)&buf[1] + 2) = v17;
    WORD1(buf[2]) = 2112;
    *(void *)((char *)&buf[2] + 4) = v9;
    WORD2(buf[3]) = 2048;
    *(void *)((char *)&buf[3] + 6) = v18;
    HIWORD(buf[4]) = 2113;
    buf[5] = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_INFO, "#%08x [%s] makeLocalAddresses -> localAddresses=%@ gatewayIdentifiers=[%ld]%{private}@", (uint8_t *)buf, 0x30u);
  }

  if ([v9 count]) {
    BOOL v19 = [v11 count] != 0;
  }
  else {
    BOOL v19 = 0;
  }

  return v19;
}

+ (id)digestIdentifier:(id)a3 tag:(unsigned int)a4
{
  id v5 = a3;
  arc4random_buf(__buf, 0x20uLL);
  id v6 = v5;
  CCHmac(2u, [v6 UTF8String], (size_t)objc_msgSend(v6, "length"), __buf, 0x20uLL, macOut);
  id v7 = +[NSData dataWithBytes:macOut length:32];
  CFStringRef v8 = +[NSData dataWithBytes:__buf length:32];
  id v9 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v9;
    *(_DWORD *)buf = 67111171;
    unsigned int v16 = a4;
    __int16 v17 = 2080;
    id v18 = currentQueueName();
    __int16 v19 = 2113;
    id v20 = v6;
    __int16 v21 = 2112;
    CFStringRef v22 = @"digest";
    __int16 v23 = 1040;
    unsigned int v24 = [v7 length];
    __int16 v25 = 2096;
    id v26 = [v7 bytes];
    __int16 v27 = 2112;
    CFStringRef v28 = @"key";
    __int16 v29 = 1040;
    unsigned int v30 = [v8 length];
    __int16 v31 = 2096;
    id v32 = [v8 bytes];
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#%08x [%s] digestIdentifier:%{private}@ -> %@=%.*P, %@=%.*P", buf, 0x50u);
  }
  v13[0] = @"digest";
  v13[1] = @"key";
  v14[0] = v7;
  v14[1] = v8;
  id v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v10;
}

+ (id)digestIdentifiers:(id)a3 tag:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        mach_port_t v13 = objc_msgSend(a1, "digestIdentifier:tag:", *(void *)(*((void *)&v15 + 1) + 8 * i), v4, (void)v15);
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)isDigestedIdentifier:(id)a3 equalToCleartextIdentifier:(id)a4 tag:(unsigned int)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 objectForKey:@"digest"];
  id v10 = [v8 objectForKey:@"key"];

  if ([v9 length] == (id)32 && objc_msgSend(v10, "length") == (id)32)
  {
    unsigned int v22 = a5;
    id v11 = v7;
    id v12 = [v11 UTF8String];
    id v21 = v11;
    id v13 = [v11 length];
    id v14 = v10;
    CCHmac(2u, v12, (size_t)v13, [v14 bytes], (size_t)objc_msgSend(v14, "length"), macOut);
    id v15 = v9;
    [v15 bytes];
    int v16 = cc_cmp_safe();
    BOOL v17 = v16 == 0;
    long long v18 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
    {
      id v20 = v18;
      *(_DWORD *)buf = 67111427;
      unsigned int v24 = v22;
      __int16 v25 = 2080;
      id v26 = currentQueueName();
      __int16 v27 = 2112;
      CFStringRef v28 = @"digest";
      __int16 v29 = 1040;
      unsigned int v30 = [v15 length];
      __int16 v31 = 2096;
      id v32 = [v15 bytes];
      __int16 v33 = 2112;
      CFStringRef v34 = @"key";
      __int16 v35 = 1040;
      unsigned int v36 = [v14 length];
      __int16 v37 = 2096;
      id v38 = [v14 bytes];
      __int16 v39 = 2113;
      id v40 = v21;
      __int16 v41 = 1024;
      BOOL v42 = v16 == 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "#%08x [%s] isDigestedIdentifier:%@=%.*P,%@=%.*P equalToCleartextIdentifier:%{private}@ -> %{BOOL}d", buf, 0x56u);
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)areDigestedIdentifiers:(id)a3 equalToCleartextIdentifiers:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    long long v18 = v10;
    v19[0] = 67110147;
    v19[1] = v5;
    __int16 v20 = 2080;
    id v21 = currentQueueName();
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2048;
    id v25 = [v9 count];
    __int16 v26 = 2113;
    id v27 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#%08x [%s] areDigestedIdentifiers:%@ equalToCleartextIdentifiers:[%ld]%{private}@", (uint8_t *)v19, 0x30u);
  }
  id v11 = [v8 count];
  if (v11 == [v9 count])
  {
    if ([v8 count])
    {
      unint64_t v12 = 0;
      do
      {
        id v13 = [v8 objectAtIndex:v12];
        id v14 = [v9 objectAtIndex:v12];
        unsigned __int8 v15 = [a1 isDigestedIdentifier:v13 equalToCleartextIdentifier:v14 tag:v5];

        if ((v15 & 1) == 0) {
          break;
        }
        ++v12;
      }
      while (v12 < (unint64_t)[v8 count]);
    }
    else
    {
      unsigned __int8 v15 = 1;
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }
  int v16 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_100023110(v16, v15, v5);
  }

  return v15;
}

@end