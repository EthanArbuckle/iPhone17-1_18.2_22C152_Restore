@interface CWFSCNetworkConfiguration
- (BOOL)__isIEEE80211NetworkInterfaceName:(id)a3;
- (BOOL)isMonitoringEvents;
- (CWFSCNetworkConfiguration)init;
- (id)DNSDomainName;
- (id)DNSSearchDomains;
- (id)DNSServerAddresses;
- (id)IEEE80211NetworkInterfacesNames;
- (id)IPv4Addresses;
- (id)IPv4InterfaceName;
- (id)IPv4Router;
- (id)IPv4ServiceID;
- (id)IPv4ServiceName;
- (id)IPv4SubnetMasks;
- (id)IPv6Addresses;
- (id)IPv6InterfaceName;
- (id)IPv6PrefixLengths;
- (id)IPv6Router;
- (id)IPv6ServiceID;
- (id)IPv6ServiceName;
- (id)__DNSGlobalStateConfig;
- (id)__IPv4GlobalStateConfig;
- (id)__IPv4SetupConfigForServiceID:(id)a3;
- (id)__IPv4StateConfigForServiceID:(id)a3;
- (id)__IPv6GlobalStateConfig;
- (id)__IPv6SetupConfigForServiceID:(id)a3;
- (id)__IPv6StateConfigForServiceID:(id)a3;
- (id)__nameForServiceWithID:(id)a3;
- (id)__networkInterfaceStateConfig;
- (id)eventHandler;
- (id)networkInterfaceNames;
- (void)__startEventMonitoring;
- (void)dealloc;
- (void)restartEventMonitoring;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFSCNetworkConfiguration

- (CWFSCNetworkConfiguration)init
{
  v12.receiver = self;
  v12.super_class = (Class)CWFSCNetworkConfiguration;
  v2 = [(CWFSCNetworkConfiguration *)&v12 init];
  if (!v2) {
    goto LABEL_6;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corewifi.SC-global-mutex", v3);
  mutexQueue = v2->_mutexQueue;
  v2->_mutexQueue = (OS_dispatch_queue *)v4;

  if (!v2->_mutexQueue) {
    goto LABEL_6;
  }
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.corewifi.SC-global-event", v6);
  eventQueue = v2->_eventQueue;
  v2->_eventQueue = (OS_dispatch_queue *)v7;

  if (!v2->_eventQueue
    || (v11.version = 0,
        memset(&v11.retain, 0, 24),
        v11.info = v2,
        SCDynamicStoreRef v9 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.corewifi.SC-global", (SCDynamicStoreCallBack)sub_1B5003958, &v11), (v2->_storeRef = v9) == 0)|| !SCDynamicStoreSetDisconnectCallBack())
  {
LABEL_6:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)CWFSCNetworkConfiguration;
  [(CWFSCNetworkConfiguration *)&v4 dealloc];
}

- (void)__startEventMonitoring
{
  v20[1] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F41AC8];
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
  if (!NetworkGlobalEntity) {
    goto LABEL_16;
  }
  CFStringRef v6 = NetworkGlobalEntity;
  CFStringRef v7 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, v4, (CFStringRef)*MEMORY[0x1E4F41B18]);
  if (!v7)
  {
    CFRelease(v6);
LABEL_16:
    CFArrayRef v18 = 0;
    CFArrayRef v15 = 0;
    goto LABEL_14;
  }
  CFStringRef v8 = v7;
  CFStringRef v9 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, v4, (CFStringRef)*MEMORY[0x1E4F41B08]);
  if (!v9)
  {
    CFStringRef v10 = 0;
    goto LABEL_18;
  }
  CFStringRef v10 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, v4, (CFStringRef)*MEMORY[0x1E4F41B00]);
  if (!v10)
  {
LABEL_18:
    CFStringRef v14 = 0;
    goto LABEL_19;
  }
  CFStringRef NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(v3, v4);
  CFStringRef v14 = NetworkInterface;
  if (NetworkInterface)
  {
    v20[0] = NetworkInterface;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v20, 1, v13);
    CFArrayRef v15 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v19[1] = v8;
    v19[2] = v9;
    v19[3] = v10;
    v19[4] = *MEMORY[0x1E4F41AC0];
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v19, 5, v17);
    CFArrayRef v18 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    if (SCDynamicStoreSetNotificationKeys(self->_storeRef, v15, v18)) {
      SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_eventQueue);
    }
    goto LABEL_8;
  }
LABEL_19:
  CFArrayRef v15 = 0;
  CFArrayRef v18 = 0;
LABEL_8:
  CFRelease(v6);
  CFRelease(v8);
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v14) {
    CFRelease(v14);
  }
LABEL_14:
}

- (void)restartEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5003EC8;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)startEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5003F88;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5004054;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0;
  CFStringRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B5004170;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__IPv4StateConfigForServiceID:(id)a3
{
  CFStringRef v4 = (__CFString *)a3;
  if (v4
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], v4, (CFStringRef)*MEMORY[0x1E4F41B10])) != 0)
  {
    CFStringRef v6 = NetworkServiceEntity;
    CFStringRef v7 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v7)
    {
      objc_super v12 = v7;
      uint64_t v13 = objc_msgSend_copy(v7, v8, v9, v10, v11);
      CFRelease(v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)__IPv6StateConfigForServiceID:(id)a3
{
  CFStringRef v4 = (__CFString *)a3;
  if (v4
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], v4, (CFStringRef)*MEMORY[0x1E4F41B18])) != 0)
  {
    CFStringRef v6 = NetworkServiceEntity;
    CFStringRef v7 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v7)
    {
      objc_super v12 = v7;
      uint64_t v13 = objc_msgSend_copy(v7, v8, v9, v10, v11);
      CFRelease(v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)__IPv4SetupConfigForServiceID:(id)a3
{
  CFStringRef v4 = (__CFString *)a3;
  if (v4
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], v4, (CFStringRef)*MEMORY[0x1E4F41B10])) != 0)
  {
    CFStringRef v6 = NetworkServiceEntity;
    CFStringRef v7 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v7)
    {
      objc_super v12 = v7;
      uint64_t v13 = objc_msgSend_copy(v7, v8, v9, v10, v11);
      CFRelease(v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)__IPv6SetupConfigForServiceID:(id)a3
{
  CFStringRef v4 = (__CFString *)a3;
  if (v4
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], v4, (CFStringRef)*MEMORY[0x1E4F41B18])) != 0)
  {
    CFStringRef v6 = NetworkServiceEntity;
    CFStringRef v7 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v7)
    {
      objc_super v12 = v7;
      uint64_t v13 = objc_msgSend_copy(v7, v8, v9, v10, v11);
      CFRelease(v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)__IPv4GlobalStateConfig
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
  if (NetworkGlobalEntity)
  {
    CFStringRef v4 = NetworkGlobalEntity;
    v5 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkGlobalEntity);
    if (v5)
    {
      uint64_t v10 = v5;
      uint64_t v11 = objc_msgSend_copy(v5, v6, v7, v8, v9);
      CFRelease(v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)__IPv6GlobalStateConfig
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B18]);
  if (NetworkGlobalEntity)
  {
    CFStringRef v4 = NetworkGlobalEntity;
    v5 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkGlobalEntity);
    if (v5)
    {
      uint64_t v10 = v5;
      uint64_t v11 = objc_msgSend_copy(v5, v6, v7, v8, v9);
      CFRelease(v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)__DNSGlobalStateConfig
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B08]);
  if (NetworkGlobalEntity)
  {
    CFStringRef v4 = NetworkGlobalEntity;
    v5 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkGlobalEntity);
    if (v5)
    {
      uint64_t v10 = v5;
      uint64_t v11 = objc_msgSend_copy(v5, v6, v7, v8, v9);
      CFRelease(v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)__nameForServiceWithID:(id)a3
{
  char v3 = (__CFString *)a3;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v9 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v5, v6, v7, v8);
  objc_msgSend_processName(v9, v10, v11, v12, v13);
  CFStringRef v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFArrayRef v15 = SCPreferencesCreate(v4, v14, 0);

  if (v15)
  {
    v16 = SCNetworkServiceCopy(v15, v3);
    if (v16)
    {
      uint64_t v17 = v16;
      Name = (__CFString *)SCNetworkServiceGetName(v16);
      if (Name) {
        v23 = objc_msgSend_copy(Name, v19, v20, v21, v22);
      }
      else {
        v23 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      v23 = 0;
      uint64_t v17 = v15;
    }
    CFRelease(v17);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)IPv4InterfaceName
{
  v5 = objc_msgSend___IPv4GlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41AD8], v7, v8);

  return v9;
}

- (id)IPv4ServiceID
{
  v5 = objc_msgSend___IPv4GlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41AE0], v7, v8);

  return v9;
}

- (id)IPv4ServiceName
{
  uint64_t v6 = objc_msgSend_IPv4ServiceID(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend___nameForServiceWithID_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (id)IPv4Addresses
{
  uint64_t v6 = objc_msgSend_IPv4ServiceID(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend___IPv4StateConfigForServiceID_(self, v7, (uint64_t)v6, v8, v9);
  uint64_t v11 = *MEMORY[0x1E4F41C60];
  CFArrayRef v15 = objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x1E4F41C60], v13, v14);

  if (!v15)
  {
    v19 = objc_msgSend___IPv4SetupConfigForServiceID_(self, v16, (uint64_t)v6, v17, v18);
    CFArrayRef v15 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v11, v21, v22);
  }
  return v15;
}

- (id)IPv4Router
{
  v5 = objc_msgSend___IPv4GlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41CA8], v7, v8);

  return v9;
}

- (id)IPv4SubnetMasks
{
  v5 = objc_msgSend___IPv4GlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41CB0], v7, v8);

  return v9;
}

- (id)IPv6InterfaceName
{
  v5 = objc_msgSend___IPv6GlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41AD8], v7, v8);

  return v9;
}

- (id)IPv6ServiceID
{
  v5 = objc_msgSend___IPv6GlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41AE0], v7, v8);

  return v9;
}

- (id)IPv6Addresses
{
  uint64_t v6 = objc_msgSend_IPv6ServiceID(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend___IPv6StateConfigForServiceID_(self, v7, (uint64_t)v6, v8, v9);
  uint64_t v11 = *MEMORY[0x1E4F41CC0];
  CFArrayRef v15 = objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x1E4F41CC0], v13, v14);

  if (!v15)
  {
    v19 = objc_msgSend___IPv6SetupConfigForServiceID_(self, v16, (uint64_t)v6, v17, v18);
    CFArrayRef v15 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v11, v21, v22);
  }
  return v15;
}

- (id)IPv6ServiceName
{
  uint64_t v6 = objc_msgSend_IPv6ServiceID(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend___nameForServiceWithID_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (id)IPv6Router
{
  v5 = objc_msgSend___IPv6GlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41D10], v7, v8);

  return v9;
}

- (id)IPv6PrefixLengths
{
  v5 = objc_msgSend___IPv6GlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41CE8], v7, v8);

  return v9;
}

- (id)DNSServerAddresses
{
  v5 = objc_msgSend___DNSGlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41BC0], v7, v8);

  return v9;
}

- (id)DNSDomainName
{
  v5 = objc_msgSend___DNSGlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41BB0], v7, v8);

  return v9;
}

- (id)DNSSearchDomains
{
  v5 = objc_msgSend___DNSGlobalStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41BB8], v7, v8);

  return v9;
}

- (id)__networkInterfaceStateConfig
{
  CFStringRef NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8]);
  if (NetworkInterface)
  {
    CFStringRef v4 = NetworkInterface;
    v5 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterface);
    if (v5)
    {
      uint64_t v10 = v5;
      uint64_t v11 = objc_msgSend_copy(v5, v6, v7, v8, v9);
      CFRelease(v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)networkInterfaceNames
{
  v5 = objc_msgSend___networkInterfaceStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41AD0], v7, v8);

  return v9;
}

- (BOOL)__isIEEE80211NetworkInterfaceName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = v3;
  memset(v20, 0, 44);
  v19[0] = 0;
  v19[1] = 0;
  if (v3
    && objc_msgSend_length(v3, v4, v5, v6, v7)
    && (unint64_t)objc_msgSend_length(v8, v9, v10, v11, v12) <= 0x10
    && (int v13 = socket(2, 2, 0), v13 != -1))
  {
    int v15 = v13;
    objc_msgSend_getCString_maxLength_encoding_(v8, v14, (uint64_t)v19, 16, 30);
    if (LOBYTE(v19[0]))
    {
      __strlcpy_chk();
      if (ioctl(v15, 0xC02C6938uLL, v20)) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = (v20[1] & 0xE0) == 128;
      }
      BOOL v17 = v16;
    }
    else
    {
      BOOL v17 = 0;
    }
    close(v15);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)IEEE80211NetworkInterfacesNames
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = objc_msgSend_networkInterfaceNames(self, a2, v2, v3, v4, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    int v13 = 0;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend___isIEEE80211NetworkInterfaceName_(self, v9, v16, v10, v11))
        {
          if (!v13)
          {
            int v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v17, v10, v11);
          }
          objc_msgSend_addObject_(v13, v9, v16, v10, v11);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v12);
  }
  else
  {
    int v13 = 0;
  }

  uint64_t v22 = objc_msgSend_copy(v13, v18, v19, v20, v21);
  return v22;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end