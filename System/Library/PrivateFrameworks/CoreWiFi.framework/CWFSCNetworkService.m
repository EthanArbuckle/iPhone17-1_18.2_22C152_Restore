@interface CWFSCNetworkService
- (BOOL)__refreshServiceID;
- (BOOL)__updateServiceID;
- (BOOL)isMonitoringEvents;
- (BOOL)refreshServiceID;
- (CWFSCNetworkService)init;
- (CWFSCNetworkService)initWithInterfaceName:(id)a3;
- (NSString)interfaceName;
- (NSString)serviceID;
- (id)DHCPLeaseExpirationTimestamp;
- (id)DHCPLeaseStartTimestamp;
- (id)DHCPServerID;
- (id)DHCPv6ServerID;
- (id)DNSDomainName;
- (id)DNSServerAddresses;
- (id)IPv4ARPResolvedHardwareAddress;
- (id)IPv4ARPResolvedIPAddress;
- (id)IPv4Addresses;
- (id)IPv4ConfigMethod;
- (id)IPv4NetworkSignature;
- (id)IPv4Router;
- (id)IPv4SubnetMasks;
- (id)IPv6Addresses;
- (id)IPv6ConfigMethod;
- (id)IPv6NetworkSignature;
- (id)IPv6Router;
- (id)__DHCPInfo;
- (id)__DHCPStateConfig;
- (id)__DHCPv6StateConfig;
- (id)__DNSSetupConfig;
- (id)__DNSStateConfig;
- (id)__IPv4SetupConfig;
- (id)__IPv4StateConfig;
- (id)__IPv6SetupConfig;
- (id)__IPv6StateConfig;
- (id)__proxiesSetupConfig;
- (id)__serviceStateConfig;
- (id)eventHandler;
- (id)serviceName;
- (void)__refreshNotificationKeys;
- (void)dealloc;
- (void)restartEventMonitoring;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFSCNetworkService

- (CWFSCNetworkService)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CWFSCNetworkService;
  v5 = [(CWFSCNetworkService *)&v28 init];
  v10 = v5;
  v11 = 0;
  if (v4 && v5)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v6, v7, v8, v9);
    interfaceName = v10->_interfaceName;
    v10->_interfaceName = (NSString *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.corewifi.SC-service-mutex", v14);
    mutexQueue = v10->_mutexQueue;
    v10->_mutexQueue = (OS_dispatch_queue *)v15;

    if (!v10->_mutexQueue) {
      goto LABEL_10;
    }
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.corewifi.SC-service-event", v17);
    eventQueue = v10->_eventQueue;
    v10->_eventQueue = (OS_dispatch_queue *)v18;

    if (!v10->_eventQueue) {
      goto LABEL_10;
    }
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    SCPreferencesRef v21 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.corewifi.SC-service", 0);
    v10->_prefsRef = v21;
    if (!v21) {
      goto LABEL_10;
    }
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = v10;
    SCDynamicStoreRef v22 = SCDynamicStoreCreate(v20, @"com.apple.corewifi.SC-service", (SCDynamicStoreCallBack)sub_1B4FB46D0, &context);
    v10->_storeRef = v22;
    if (v22 && SCDynamicStoreSetDisconnectCallBack())
    {
      v23 = v10->_mutexQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B4FB4ABC;
      block[3] = &unk_1E60BB768;
      v11 = v10;
      v26 = v11;
      dispatch_async(v23, block);
      v10 = v26;
    }
    else
    {
LABEL_10:
      v11 = 0;
    }
  }

  return v11;
}

- (CWFSCNetworkService)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"-[CWFSCNetworkService init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  prefsRef = self->_prefsRef;
  if (prefsRef) {
    CFRelease(prefsRef);
  }
  v5.receiver = self;
  v5.super_class = (Class)CWFSCNetworkService;
  [(CWFSCNetworkService *)&v5 dealloc];
}

- (BOOL)__updateServiceID
{
  SCPreferencesSynchronize(self->_prefsRef);
  v3 = SCNetworkSetCopyCurrent(self->_prefsRef);
  if (v3)
  {
    uint64_t v8 = v3;
    CFArrayRef v9 = SCNetworkSetCopyServices(v3);
    if (v9)
    {
      CFArrayRef v10 = v9;
      cf = v8;
      CFArrayRef ServiceOrder = SCNetworkSetGetServiceOrder(v8);
      if (ServiceOrder && (CFArrayRef v12 = ServiceOrder, CFArrayGetCount(ServiceOrder) >= 1))
      {
        v45 = 0;
        CFIndex v13 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v12, v13);
          if (ValueAtIndex && (dispatch_queue_t v15 = ValueAtIndex, CFArrayGetCount(v10) >= 1))
          {
            CFIndex v16 = 0;
            do
            {
              v17 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v10, v16);
              dispatch_queue_t v18 = v17;
              if (v17)
              {
                CFStringRef ServiceID = SCNetworkServiceGetServiceID(v17);
                if (!ServiceID) {
                  goto LABEL_20;
                }
                CFAllocatorRef v20 = (__CFString *)ServiceID;
                CFStringRef Name = SCNetworkServiceGetName(v18);
                if (!Name) {
                  goto LABEL_20;
                }
                SCDynamicStoreRef v22 = (__CFString *)Name;
                if (!CFEqual(v20, v15)) {
                  goto LABEL_20;
                }
                Interface = SCNetworkServiceGetInterface(v18);
                if (!Interface) {
                  goto LABEL_20;
                }
                do
                {
                  v24 = Interface;
                  Interface = SCNetworkInterfaceGetInterface(Interface);
                }
                while (Interface);
                if (SCNetworkInterfaceGetInterfaceType(v24)
                  && (BSDCFStringRef Name = SCNetworkInterfaceGetBSDName(v24)) != 0
                  && CFEqual(BSDName, self->_interfaceName)
                  && SCNetworkServiceGetEnabled(v18))
                {
                  dispatch_queue_t v18 = (const __SCNetworkService *)objc_msgSend_copy(v20, v26, v27, v28, v29, cf);
                  uint64_t v34 = objc_msgSend_copy(v22, v30, v31, v32, v33);

                  v45 = (void *)v34;
                }
                else
                {
LABEL_20:
                  dispatch_queue_t v18 = 0;
                }
              }
              ++v16;
            }
            while (CFArrayGetCount(v10) > v16 && !v18);
          }
          else
          {
            dispatch_queue_t v18 = 0;
          }
          ++v13;
        }
        while (CFArrayGetCount(v12) > v13 && !v18);
      }
      else
      {
        dispatch_queue_t v18 = 0;
        v45 = 0;
      }
      CFRelease(cf);
      v35 = (NSString *)v45;
    }
    else
    {
      dispatch_queue_t v18 = 0;
      v35 = 0;
      CFArrayRef v10 = v8;
    }
    CFRelease(v10);
  }
  else
  {
    dispatch_queue_t v18 = 0;
    v35 = 0;
  }
  v36 = self->_serviceID;
  if (v36 == (NSString *)v18 || v18 && v36 && (objc_msgSend_isEqual_(v36, v4, (uint64_t)v18, v6, v7) & 1) != 0)
  {
    BOOL v37 = 0;
  }
  else
  {
    v38 = (NSString *)objc_msgSend_copy(v18, v4, v5, v6, v7, cf);
    v39 = self->_serviceID;
    self->_serviceID = v38;

    BOOL v37 = 1;
  }
  serviceCFStringRef Name = self->_serviceName;
  if (serviceName != v35
    && (!serviceName || !v35 || (objc_msgSend_isEqual_(serviceName, v4, (uint64_t)v35, v6, v7) & 1) == 0))
  {
    v41 = (NSString *)objc_msgSend_copy(v35, v4, v5, v6, v7, cf);
    v42 = self->_serviceName;
    self->_serviceCFStringRef Name = v41;
  }
  return v37;
}

- (void)__refreshNotificationKeys
{
  v23[5] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], (CFStringRef)*MEMORY[0x1E4F41AB8], 0);
  if (NetworkServiceEntity)
  {
    CFStringRef v8 = NetworkServiceEntity;
    CFStringRef serviceID = (const __CFString *)self->_serviceID;
    if (serviceID)
    {
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F41AC8];
      CFStringRef v11 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, (CFStringRef)*MEMORY[0x1E4F41AC8], serviceID, (CFStringRef)*MEMORY[0x1E4F41B10]);
      if (!v11)
      {
        CFAllocatorRef v20 = 0;
LABEL_20:
        CFRelease(v8);

        return;
      }
      CFStringRef v12 = v11;
      CFStringRef v13 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, (CFStringRef)*MEMORY[0x1E4F41B18]);
      if (!v13)
      {
        CFAllocatorRef v20 = 0;
        CFStringRef v19 = 0;
        CFStringRef v15 = 0;
        CFStringRef v14 = 0;
        goto LABEL_11;
      }
      CFStringRef v14 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, (CFStringRef)*MEMORY[0x1E4F41B00]);
      if (!v14)
      {
        CFAllocatorRef v20 = 0;
        CFStringRef v19 = 0;
        CFStringRef v15 = 0;
        goto LABEL_11;
      }
      CFStringRef v15 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, (CFStringRef)*MEMORY[0x1E4F41B08]);
      if (!v15)
      {
        CFAllocatorRef v20 = 0;
        CFStringRef v19 = 0;
        goto LABEL_11;
      }
      CFStringRef v16 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, 0);
      CFStringRef v19 = v16;
      if (!v16)
      {
        CFAllocatorRef v20 = 0;
        goto LABEL_11;
      }
      v23[0] = v12;
      v23[1] = v13;
      v23[2] = v14;
      v23[3] = v15;
      v23[4] = v16;
      CFAllocatorRef v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)v23, 5, v18);
    }
    else
    {
      CFStringRef v12 = 0;
      CFStringRef v13 = 0;
      CFStringRef v14 = 0;
      CFStringRef v15 = 0;
      CFStringRef v19 = 0;
      CFAllocatorRef v20 = 0;
    }
    storeRef = self->_storeRef;
    objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v5, (uint64_t)v8, v6, v7);
    CFArrayRef v22 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    SCDynamicStoreSetNotificationKeys(storeRef, (CFArrayRef)v20, v22);

    if (!v12)
    {
LABEL_12:
      if (v13) {
        CFRelease(v13);
      }
      if (v14) {
        CFRelease(v14);
      }
      if (v15) {
        CFRelease(v15);
      }
      if (v19) {
        CFRelease(v19);
      }
      goto LABEL_20;
    }
LABEL_11:
    CFRelease(v12);
    goto LABEL_12;
  }
}

- (BOOL)__refreshServiceID
{
  int updated = objc_msgSend___updateServiceID(self, a2, v2, v3, v4);
  if (updated) {
    objc_msgSend___refreshNotificationKeys(self, v6, v7, v8, v9);
  }
  return updated;
}

- (BOOL)refreshServiceID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB514C;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)restartEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB5210;
  block[3] = &unk_1E60BB768;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)startEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB52DC;
  block[3] = &unk_1E60BB768;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FB53AC;
  block[3] = &unk_1E60BB768;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB54C8;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__IPv4StateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], serviceID, (CFStringRef)*MEMORY[0x1E4F41B10])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__DHCPStateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], serviceID, (CFStringRef)*MEMORY[0x1E4F41B00])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__IPv6StateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], serviceID, (CFStringRef)*MEMORY[0x1E4F41B18])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__DHCPv6StateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], serviceID, @"DHCPv6")) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__IPv4SetupConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], serviceID, (CFStringRef)*MEMORY[0x1E4F41B10])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__IPv6SetupConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], serviceID, (CFStringRef)*MEMORY[0x1E4F41B18])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__DNSStateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], serviceID, (CFStringRef)*MEMORY[0x1E4F41B08])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__DNSSetupConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], serviceID, (CFStringRef)*MEMORY[0x1E4F41B08])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__proxiesSetupConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], serviceID, (CFStringRef)*MEMORY[0x1E4F41B40])) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)__serviceStateConfig
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], serviceID, 0)) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      CFStringRef v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  return v12;
}

- (id)IPv4ARPResolvedHardwareAddress
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB5CEC;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = CWFCorrectEthernetAddressString((void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4ARPResolvedIPAddress
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB5EA4;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4Router
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB605C;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4Addresses
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB6214;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4SubnetMasks
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB63CC;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6Router
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB6584;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6Addresses
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB673C;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6ConfigMethod
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB68F4;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4ConfigMethod
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB6A64;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DNSDomainName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB6BD4;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DNSServerAddresses
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB6D8C;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSString)serviceID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB6F44;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)serviceName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB7090;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)__DHCPInfo
{
  CFStringRef serviceID = (const __CFString *)self->_serviceID;
  if (serviceID && (CFDictionaryRef v3 = SCDynamicStoreCopyDHCPInfo(self->_storeRef, serviceID)) != 0)
  {
    CFDictionaryRef v7 = v3;
    uint64_t v8 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v3, v5, v6);
    CFRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)DHCPLeaseStartTimestamp
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB724C;
  v5[3] = &unk_1E60BC6B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPLeaseExpirationTimestamp
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB73BC;
  v5[3] = &unk_1E60BC6B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4NetworkSignature
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB752C;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6NetworkSignature
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB7698;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPServerID
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB7804;
  v5[3] = &unk_1E60BC6B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPv6ServerID
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C5C;
  uint64_t v10 = sub_1B4F51BDC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4FB7978;
  v5[3] = &unk_1E60BC6B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end