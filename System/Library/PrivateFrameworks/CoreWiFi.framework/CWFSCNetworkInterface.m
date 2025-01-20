@interface CWFSCNetworkInterface
- (BOOL)isLinkActive;
- (BOOL)isMonitoringEvents;
- (CWFSCNetworkInterface)init;
- (CWFSCNetworkInterface)initWithInterfaceName:(id)a3;
- (NSString)hardwareAddress;
- (NSString)interfaceName;
- (id)IPv4Addresses;
- (id)IPv4BroadcastAddresses;
- (id)IPv4SubnetMasks;
- (id)IPv6Addresses;
- (id)IPv6Flags;
- (id)IPv6PrefixLengths;
- (id)__IPv4StateConfig;
- (id)__IPv6StateConfig;
- (id)__linkStateConfig;
- (id)__networkInterfaceHardwareAddress;
- (id)airPortSetupConfiguration;
- (id)airPortStateConfiguration;
- (id)eventHandler;
- (void)__startEventMonitoring;
- (void)dealloc;
- (void)restartEventMonitoring;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFSCNetworkInterface

- (CWFSCNetworkInterface)initWithInterfaceName:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CWFSCNetworkInterface;
  v5 = [(CWFSCNetworkInterface *)&v36 init];
  v10 = v5;
  if (!v4 || !v5) {
    goto LABEL_8;
  }
  uint64_t v11 = objc_msgSend_copy(v4, v6, v7, v8, v9);
  interfaceName = v10->_interfaceName;
  v10->_interfaceName = (NSString *)v11;

  v17 = objc_msgSend___networkInterfaceHardwareAddress(v10, v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_copy(v17, v18, v19, v20, v21);
  hardwareAddress = v10->_hardwareAddress;
  v10->_hardwareAddress = (NSString *)v22;

  if (!v10->_hardwareAddress)
  {
    v32 = CWFGetOSLog();
    if (v32)
    {
      v33 = CWFGetOSLog();
    }
    else
    {
      v33 = MEMORY[0x1E4F14500];
      id v34 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v37 = 136446978;
      v38 = "-[CWFSCNetworkInterface initWithInterfaceName:]";
      __int16 v39 = 2082;
      v40 = "CWFSCNetworkInterface.m";
      __int16 v41 = 1024;
      int v42 = 80;
      __int16 v43 = 2114;
      id v44 = v4;
      _os_log_send_and_compose_impl();
    }
  }
  v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v25 = dispatch_queue_create("com.apple.corewifi.SC-interface-mutex", v24);
  mutexQueue = v10->_mutexQueue;
  v10->_mutexQueue = (OS_dispatch_queue *)v25;

  if (!v10->_mutexQueue) {
    goto LABEL_8;
  }
  v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v28 = dispatch_queue_create("com.apple.corewifi.SC-interface-event", v27);
  eventQueue = v10->_eventQueue;
  v10->_eventQueue = (OS_dispatch_queue *)v28;

  if (!v10->_eventQueue
    || (context.version = 0,
        memset(&context.retain, 0, 24),
        context.info = v10,
        SCDynamicStoreRef v30 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.corewifi.SC-interface", (SCDynamicStoreCallBack)sub_1B500D128, &context), (v10->_storeRef = v30) == 0)|| !SCDynamicStoreSetDisconnectCallBack())
  {
LABEL_8:

    v10 = 0;
  }

  return v10;
}

- (CWFSCNetworkInterface)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"-[CWFSCNetworkInterface init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)CWFSCNetworkInterface;
  [(CWFSCNetworkInterface *)&v4 dealloc];
}

- (void)__startEventMonitoring
{
  v12[2] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F41AC8];
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)self->_interfaceName, (CFStringRef)*MEMORY[0x1E4F41B10]);
  if (NetworkInterfaceEntity)
  {
    CFStringRef v6 = NetworkInterfaceEntity;
    CFStringRef v7 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v3, v4, (CFStringRef)self->_interfaceName, (CFStringRef)*MEMORY[0x1E4F41B18]);
    if (v7)
    {
      CFStringRef v10 = v7;
      v12[0] = v6;
      v12[1] = v7;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v12, 2, v9);
      CFArrayRef v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      if (SCDynamicStoreSetNotificationKeys(self->_storeRef, v11, 0)) {
        SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_eventQueue);
      }
      CFRelease(v6);
      CFRelease(v10);
    }
    else
    {
      CFRelease(v6);
    }
  }
}

- (void)restartEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500D660;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)startEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500D720;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500D7EC;
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
  v5[2] = sub_1B500D908;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)airPortStateConfiguration
{
  CFStringRef interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], interfaceName, (CFStringRef)*MEMORY[0x1E4F41AF0])) != 0)
  {
    CFStringRef v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      CFArrayRef v11 = v6;
      v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)airPortSetupConfiguration
{
  CFStringRef interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], interfaceName, (CFStringRef)*MEMORY[0x1E4F41AF0])) != 0)
  {
    CFStringRef v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      CFArrayRef v11 = v6;
      v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__IPv4StateConfig
{
  CFStringRef interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], interfaceName, (CFStringRef)*MEMORY[0x1E4F41B10])) != 0)
  {
    CFStringRef v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      CFArrayRef v11 = v6;
      v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__IPv6StateConfig
{
  CFStringRef interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], interfaceName, (CFStringRef)*MEMORY[0x1E4F41B18])) != 0)
  {
    CFStringRef v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      CFArrayRef v11 = v6;
      v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__linkStateConfig
{
  CFStringRef interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], interfaceName, (CFStringRef)*MEMORY[0x1E4F41B28])) != 0)
  {
    CFStringRef v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      CFArrayRef v11 = v6;
      v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)IPv4Addresses
{
  CFStringRef v5 = objc_msgSend___IPv4StateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41C60], v7, v8);

  return v9;
}

- (id)IPv4BroadcastAddresses
{
  CFStringRef v5 = objc_msgSend___IPv4StateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41C68], v7, v8);

  return v9;
}

- (id)IPv4SubnetMasks
{
  CFStringRef v5 = objc_msgSend___IPv4StateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41CB0], v7, v8);

  return v9;
}

- (id)IPv6Addresses
{
  CFStringRef v5 = objc_msgSend___IPv6StateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41CC0], v7, v8);

  return v9;
}

- (id)IPv6Flags
{
  CFStringRef v5 = objc_msgSend___IPv6StateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41CD8], v7, v8);

  return v9;
}

- (id)IPv6PrefixLengths
{
  CFStringRef v5 = objc_msgSend___IPv6StateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41CE8], v7, v8);

  return v9;
}

- (BOOL)isLinkActive
{
  CFStringRef v5 = objc_msgSend___linkStateConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F41D30], v7, v8);
  char v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

- (id)__networkInterfaceHardwareAddress
{
  CFArrayRef v3 = SCNetworkInterfaceCopyAll();
  if (v3)
  {
    CFArrayRef v4 = v3;
    CFIndex Count = CFArrayGetCount(v3);
    if (Count < 1)
    {
LABEL_8:
      char v14 = 0;
    }
    else
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkInterface *)CFArrayGetValueAtIndex(v4, v7);
        if (ValueAtIndex)
        {
          do
          {
            uint64_t v9 = ValueAtIndex;
            ValueAtIndex = SCNetworkInterfaceGetInterface(ValueAtIndex);
          }
          while (ValueAtIndex);
          BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(v9);
          if (objc_msgSend_isEqualToString_(BSDName, v11, (uint64_t)self->_interfaceName, v12, v13)) {
            break;
          }
        }
        if (++v7 == v6) {
          goto LABEL_8;
        }
      }
      HardwareAddressString = (__CFString *)SCNetworkInterfaceGetHardwareAddressString(v9);
      uint64_t v16 = CWFCorrectEthernetAddressString(HardwareAddressString);
      char v14 = objc_msgSend_copy(v16, v17, v18, v19, v20);
    }
    CFRelease(v4);
  }
  else
  {
    char v14 = 0;
  }
  return v14;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (NSString)hardwareAddress
{
  return self->_hardwareAddress;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_hardwareAddress, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end