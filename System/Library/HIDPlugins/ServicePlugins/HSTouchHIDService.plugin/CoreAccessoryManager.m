@interface CoreAccessoryManager
- (CoreAccessoryManager)init;
- (NSDictionary)debugDictionary;
- (OS_dispatch_queue)queue;
- (id)coreAccessoryServiceInfoFromProperties:(id)a3;
- (void)accessoryConnectionInfoFromTransport:(id)a3 connection:(int *)a4 transport:(int *)a5;
- (void)dealloc;
- (void)deregisterForDeviceManagementMatching;
- (void)handleDeviceManagementMatching:(unsigned int)a3;
- (void)handleProperty:(id)a3 value:(id)a4;
- (void)publishCoreAccessoryService:(id)a3;
- (void)registerForDeviceManagementMatching;
- (void)setQueue:(id)a3;
- (void)unpublishCoreAccessoryService;
@end

@implementation CoreAccessoryManager

- (CoreAccessoryManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CoreAccessoryManager;
  v2 = [(CoreAccessoryManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    serialNumber = v2->_serialNumber;
    v2->_serialNumber = 0;

    driverFirmwareVersion = v3->_driverFirmwareVersion;
    v3->_driverFirmwareVersion = 0;

    connectionUUID = v3->_connectionUUID;
    v3->_connectionUUID = 0;

    publishedAccessoryInfo = v3->_publishedAccessoryInfo;
    v3->_publishedAccessoryInfo = 0;

    v3->_dmMatchedNotifierPortRef = 0;
    v3->_dmMatchedIterator = 0;
    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  v3 = MTLoggingPlugin();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 136315906;
    v8 = "";
    __int16 v9 = 2080;
    objc_super v10 = "";
    __int16 v11 = 2080;
    v12 = "-[CoreAccessoryManager dealloc]";
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_impl(&def_411C8, v3, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s ~%@", buf, 0x2Au);
  }
  [(CoreAccessoryManager *)self unpublishCoreAccessoryService];
  [(CoreAccessoryManager *)self deregisterForDeviceManagementMatching];
  v6.receiver = self;
  v6.super_class = (Class)CoreAccessoryManager;
  [(CoreAccessoryManager *)&v6 dealloc];
}

- (void)handleProperty:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 isEqualToString:@"SerialNumber"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      if (v7 && ![(NSString *)self->_serialNumber isEqualToString:v7])
      {
        objc_storeStrong((id *)&self->_serialNumber, a4);
        [(CoreAccessoryManager *)self registerForDeviceManagementMatching];
      }
LABEL_11:

      goto LABEL_12;
    }
  }
  if ([v9 isEqualToString:@"bcdVersion"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      if (v8 && ![(NSNumber *)self->_driverFirmwareVersion isEqualToNumber:v8])
      {
        objc_storeStrong((id *)&self->_driverFirmwareVersion, a4);
        [(CoreAccessoryManager *)self registerForDeviceManagementMatching];
      }
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (void)registerForDeviceManagementMatching
{
  kern_return_t v9;
  NSObject *v10;
  NSString *v11;
  uint64_t dmMatchedIterator;
  NSObject *v13;
  NSString *v14;
  NSObject *v15;
  NSString *v16;
  IONotificationPort *dmMatchedNotifierPortRef;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  kern_return_t v28;
  __int16 v29;
  uint64_t v30;
  CFStringRef v31;
  NSString *v32;
  void v33[2];
  void v34[2];

  if (self->_serialNumber)
  {
    if (self->_driverFirmwareVersion)
    {
      v3 = [(CoreAccessoryManager *)self queue];

      if (v3)
      {
        v4 = MTLoggingPlugin();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          serialNumber = self->_serialNumber;
          v19 = 136315906;
          v20 = "[Debug] ";
          v21 = 2080;
          v22 = "";
          v23 = 2080;
          v24 = "-[CoreAccessoryManager registerForDeviceManagementMatching]";
          v25 = 2114;
          v26 = serialNumber;
          _os_log_impl(&def_411C8, v4, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s [%{public}@] Registering for device mangement matching notifications", (uint8_t *)&v19, 0x2Au);
        }

        if (self->_dmMatchedIterator || self->_dmMatchedNotifierPortRef) {
          [(CoreAccessoryManager *)self deregisterForDeviceManagementMatching];
        }
        v31 = @"SerialNumber";
        v32 = self->_serialNumber;
        v33[0] = @"IOPropertyMatch";
        id v6 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v33[1] = @"IONameMatch";
        v34[0] = v6;
        v34[1] = @"AppleDeviceManagementHIDEventService";
        id v7 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

        id v8 = IONotificationPortCreate(kIOMainPortDefault);
        self->_dmMatchedNotifierPortRef = v8;
        if (v8)
        {
          id v9 = IOServiceAddMatchingNotification(v8, "IOServiceFirstMatch", (CFDictionaryRef)v7, (IOServiceMatchingCallback)_dmMatchedCallback, self, &self->_dmMatchedIterator);
          if (v9 || !self->_dmMatchedIterator)
          {
            objc_super v10 = MTLoggingPlugin();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              __int16 v11 = self->_serialNumber;
              dmMatchedIterator = self->_dmMatchedIterator;
              v19 = 136316418;
              v20 = "[Error] ";
              v21 = 2080;
              v22 = "";
              v23 = 2080;
              v24 = "-[CoreAccessoryManager registerForDeviceManagementMatching]";
              v25 = 2114;
              v26 = v11;
              v27 = 1024;
              v28 = v9;
              v29 = 2048;
              v30 = dmMatchedIterator;
              _os_log_impl(&def_411C8, v10, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [%{public}@] Failed to create notification port: 0x%08x (deviceIterator: 0x%08jx)", (uint8_t *)&v19, 0x3Au);
            }

            IONotificationPortDestroy(self->_dmMatchedNotifierPortRef);
            self->_dmMatchedNotifierPortRef = 0;
          }
          else
          {
            v15 = MTLoggingPlugin();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v16 = self->_serialNumber;
              v19 = 136315906;
              v20 = "[Debug] ";
              v21 = 2080;
              v22 = "";
              v23 = 2080;
              v24 = "-[CoreAccessoryManager registerForDeviceManagementMatching]";
              v25 = 2114;
              v26 = v16;
              _os_log_impl(&def_411C8, v15, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s [%{public}@] Successfully registered for device mangement matching notifications", (uint8_t *)&v19, 0x2Au);
            }

            [(CoreAccessoryManager *)self handleDeviceManagementMatching:self->_dmMatchedIterator];
            dmMatchedNotifierPortRef = self->_dmMatchedNotifierPortRef;
            v18 = [(CoreAccessoryManager *)self queue];
            IONotificationPortSetDispatchQueue(dmMatchedNotifierPortRef, v18);
          }
        }
        else
        {
          __int16 v13 = MTLoggingPlugin();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = self->_serialNumber;
            v19 = 136315906;
            v20 = "[Error] ";
            v21 = 2080;
            v22 = "";
            v23 = 2080;
            v24 = "-[CoreAccessoryManager registerForDeviceManagementMatching]";
            v25 = 2114;
            v26 = v14;
            _os_log_impl(&def_411C8, v13, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [%{public}@] Failed to create notification port for device", (uint8_t *)&v19, 0x2Au);
          }
        }
      }
    }
  }
}

- (void)deregisterForDeviceManagementMatching
{
  v3 = MTLoggingPlugin();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    serialNumber = self->_serialNumber;
    int v7 = 136315906;
    id v8 = "[Debug] ";
    __int16 v9 = 2080;
    objc_super v10 = "";
    __int16 v11 = 2080;
    v12 = "-[CoreAccessoryManager deregisterForDeviceManagementMatching]";
    __int16 v13 = 2114;
    v14 = serialNumber;
    _os_log_impl(&def_411C8, v3, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s [%{public}@] enter", (uint8_t *)&v7, 0x2Au);
  }

  io_object_t dmMatchedIterator = self->_dmMatchedIterator;
  if (dmMatchedIterator)
  {
    IOObjectRelease(dmMatchedIterator);
    self->_io_object_t dmMatchedIterator = 0;
  }
  dmMatchedNotifierPortRef = self->_dmMatchedNotifierPortRef;
  if (dmMatchedNotifierPortRef)
  {
    IONotificationPortDestroy(dmMatchedNotifierPortRef);
    self->_dmMatchedNotifierPortRef = 0;
  }
}

- (void)handleDeviceManagementMatching:(unsigned int)a3
{
  kern_return_t v10;
  CFMutableDictionaryRef v11;
  NSObject *v12;
  NSString *v13;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  NSString *v22;

  io_object_t v5 = IOIteratorNext(a3);
  if (v5)
  {
    io_registry_entry_t v6 = v5;
    unsigned int v7 = 0;
    do
    {
      if (v7 >= 2)
      {
        id v8 = MTLoggingPlugin();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          serialNumber = self->_serialNumber;
          *(_DWORD *)buf = 136315906;
          v16 = "[Error] ";
          v17 = 2080;
          v18 = "";
          v19 = 2080;
          v20 = "-[CoreAccessoryManager handleDeviceManagementMatching:]";
          v21 = 2114;
          v22 = serialNumber;
          _os_log_impl(&def_411C8, v8, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [%{public}@] Found multiple device management services expected only one", buf, 0x2Au);
        }
      }
      properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
      objc_super v10 = IORegistryEntryCreateCFProperties(v6, &properties, kCFAllocatorDefault, 0);
      __int16 v11 = properties;
      if (v10 || !properties)
      {
        v12 = MTLoggingPlugin();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          __int16 v13 = self->_serialNumber;
          *(_DWORD *)buf = 136315906;
          v16 = "[Error] ";
          v17 = 2080;
          v18 = "";
          v19 = 2080;
          v20 = "-[CoreAccessoryManager handleDeviceManagementMatching:]";
          v21 = 2114;
          v22 = v13;
          _os_log_impl(&def_411C8, v12, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [%{public}@] Failed to retrieve the properties from device management service", buf, 0x2Au);
        }
      }
      else
      {
        [(CoreAccessoryManager *)self publishCoreAccessoryService:properties];
      }
      IOObjectRelease(v6);

      io_registry_entry_t v6 = IOIteratorNext(a3);
      ++v7;
    }
    while (v6);
  }
}

- (void)publishCoreAccessoryService:(id)a3
{
  id v4 = a3;
  if (self->_connectionUUID)
  {
    io_object_t v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      serialNumber = self->_serialNumber;
      *(_DWORD *)buf = 136315906;
      v25 = "[Debug] ";
      __int16 v26 = 2080;
      v27 = "";
      __int16 v28 = 2080;
      v29 = "-[CoreAccessoryManager publishCoreAccessoryService:]";
      __int16 v30 = 2114;
      v31 = serialNumber;
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s [%{public}@] Existing device has already been published - Unpublishing previous device first", buf, 0x2Au);
    }

    [(CoreAccessoryManager *)self unpublishCoreAccessoryService];
  }
  unsigned int v22 = -1431655766;
  unsigned int v23 = -1431655766;
  unsigned int v7 = [v4 objectForKeyedSubscript:@"Transport"];
  [(CoreAccessoryManager *)self accessoryConnectionInfoFromTransport:v7 connection:&v23 transport:&v22];

  id v8 = +[ACCTransportClient sharedClient];
  __int16 v9 = [v8 createConnectionWithType:v23 andIdentifier:self->_serialNumber];

  if (v9)
  {
    objc_super v10 = +[ACCTransportClient sharedClient];
    __int16 v11 = [v10 createEndpointWithTransportType:v22 andProtocol:1 andIdentifier:0 andDataOutHandler:0 forConnectionWithUUID:v9 publishConnection:0];

    if (v11)
    {
      v12 = [(CoreAccessoryManager *)self coreAccessoryServiceInfoFromProperties:v4];
      __int16 v13 = +[ACCTransportClient sharedClient];
      [v13 setAccessoryInfo:v12 forEndpointWithUUID:v11];

      v14 = +[ACCTransportClient sharedClient];
      [v14 publishConnectionWithUUID:v9];

      v15 = [v12 copy];
      publishedAccessoryInfo = self->_publishedAccessoryInfo;
      self->_publishedAccessoryInfo = v15;

      objc_storeStrong((id *)&self->_connectionUUID, v9);
      v17 = MTLoggingPlugin();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_serialNumber;
        v19 = [v12 objectForKeyedSubscript:kACCInfo_Name];
        *(_DWORD *)buf = 136316418;
        v25 = "";
        __int16 v26 = 2080;
        v27 = "";
        __int16 v28 = 2080;
        v29 = "-[CoreAccessoryManager publishCoreAccessoryService:]";
        __int16 v30 = 2114;
        v31 = v18;
        __int16 v32 = 2114;
        v33 = v19;
        __int16 v34 = 2114;
        v35 = v9;
        _os_log_impl(&def_411C8, v17, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s [%{public}@] Published device %{public}@ with connection UUID %{public}@", buf, 0x3Eu);
      }
    }
    else
    {
      v12 = MTLoggingPlugin();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v21 = self->_serialNumber;
        *(_DWORD *)buf = 136315906;
        v25 = "[Error] ";
        __int16 v26 = 2080;
        v27 = "";
        __int16 v28 = 2080;
        v29 = "-[CoreAccessoryManager publishCoreAccessoryService:]";
        __int16 v30 = 2114;
        v31 = v21;
        _os_log_impl(&def_411C8, v12, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [%{public}@] Could not create CoreAccessory endpoint", buf, 0x2Au);
      }
    }
  }
  else
  {
    __int16 v11 = MTLoggingPlugin();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_serialNumber;
      *(_DWORD *)buf = 136315906;
      v25 = "[Error] ";
      __int16 v26 = 2080;
      v27 = "";
      __int16 v28 = 2080;
      v29 = "-[CoreAccessoryManager publishCoreAccessoryService:]";
      __int16 v30 = 2114;
      v31 = v20;
      _os_log_impl(&def_411C8, v11, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [%{public}@] Could not create CoreAccessory connection", buf, 0x2Au);
    }
  }
}

- (void)unpublishCoreAccessoryService
{
  if (self->_connectionUUID)
  {
    v3 = MTLoggingPlugin();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serialNumber = self->_serialNumber;
      connectionUUID = self->_connectionUUID;
      int v8 = 136316162;
      __int16 v9 = "";
      __int16 v10 = 2080;
      __int16 v11 = "";
      __int16 v12 = 2080;
      __int16 v13 = "-[CoreAccessoryManager unpublishCoreAccessoryService]";
      __int16 v14 = 2114;
      v15 = serialNumber;
      __int16 v16 = 2114;
      v17 = connectionUUID;
      _os_log_impl(&def_411C8, v3, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s [%{public}@] Unpublishing device with connection UUID %{public}@", (uint8_t *)&v8, 0x34u);
    }

    io_registry_entry_t v6 = +[ACCTransportClient sharedClient];
    [v6 destroyConnectionWithUUID:self->_connectionUUID];

    unsigned int v7 = self->_connectionUUID;
    self->_connectionUUID = 0;
  }
}

- (id)coreAccessoryServiceInfoFromProperties:(id)a3
{
  id v20 = a3;
  id v4 = [v20 mutableCopy];
  unsigned int v22 = [v4 objectForKeyedSubscript:@"MTFW Version"];
  if (!v22 || ![v22 intValue])
  {
    driverFirmwareVersion = self->_driverFirmwareVersion;
    if (!driverFirmwareVersion)
    {
      io_registry_entry_t v6 = MTLoggingPlugin();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        serialNumber = self->_serialNumber;
        *(_DWORD *)buf = 136315906;
        v35 = "[Error] ";
        __int16 v36 = 2080;
        v37 = "";
        __int16 v38 = 2080;
        v39 = "-[CoreAccessoryManager coreAccessoryServiceInfoFromProperties:]";
        __int16 v40 = 2114;
        v41 = serialNumber;
        _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [%{public}@] Failed to determine MTFW version", buf, 0x2Au);
      }

      driverFirmwareVersion = (NSNumber *)&off_149A90;
    }
    [v4 setObject:driverFirmwareVersion forKeyedSubscript:@"MTFW Version"];
  }
  unsigned int v23 = [v4 objectForKeyedSubscript:@"SerialNumber"];
  v24 = [v4 objectForKeyedSubscript:@"Product"];
  v25 = [v4 objectForKeyedSubscript:@"Manufacturer"];
  int v8 = [v4 objectForKeyedSubscript:@"HardwareID"];
  v21 = v8;
  if (v8)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%04X", [v8 unsignedIntegerValue]);
    __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v26 = &stru_145420;
  }
  __int16 v9 = +[NSMutableString stringWithCapacity:20];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = [&off_14A1C0 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(&off_14A1C0);
        }
        __int16 v13 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        if (v13)
        {
          if ([v9 length]) {
            [v9 appendString:@"."];
          }
          __int16 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%04X", [v13 unsignedIntegerValue]);
          [v9 appendString:v14];
        }
      }
      id v10 = [&off_14A1C0 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v10);
  }
  CFStringRef v15 = v24;
  if (!v24) {
    CFStringRef v15 = &stru_145420;
  }
  v31[0] = kACCInfo_Name;
  v31[1] = kACCInfo_Manufacturer;
  CFStringRef v16 = @"Apple Inc.";
  if (v25) {
    CFStringRef v16 = v25;
  }
  v32[0] = v15;
  v32[1] = v16;
  CFStringRef v17 = v23;
  if (!v23) {
    CFStringRef v17 = &stru_145420;
  }
  v31[2] = kACCInfo_SerialNumber;
  v31[3] = kACCInfo_FirmwareVersionActive;
  v32[2] = v17;
  v32[3] = v9;
  v31[4] = kACCInfo_HardwareVersion;
  v31[5] = kACCInfo_Model;
  v32[4] = v26;
  v32[5] = &stru_145420;
  v18 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:6];

  return v18;
}

- (void)accessoryConnectionInfoFromTransport:(id)a3 connection:(int *)a4 transport:(int *)a5
{
  id v10 = a3;
  if ([v10 isEqualToString:@"AID"])
  {
    int v7 = 7;
    int v8 = 3;
  }
  else if ([v10 isEqualToString:@"USB"])
  {
    int v7 = 0;
    int v8 = 6;
  }
  else
  {
    unsigned int v9 = [v10 isEqualToString:@"Bluetooth"];
    if (v9) {
      int v8 = 2;
    }
    else {
      int v8 = 11;
    }
    if (v9) {
      int v7 = 2;
    }
    else {
      int v7 = 17;
    }
  }
  *a4 = v8;
  *a5 = v7;
}

- (void)setQueue:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    io_registry_entry_t v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"CoreAccessoryManager.mm", 356, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_queue, a3);
  [(CoreAccessoryManager *)self registerForDeviceManagementMatching];
}

- (NSDictionary)debugDictionary
{
  v3 = objc_opt_new();
  id v4 = v3;
  if (self->_serialNumber) {
    CFStringRef serialNumber = (const __CFString *)self->_serialNumber;
  }
  else {
    CFStringRef serialNumber = @"Unknown";
  }
  [v3 setObject:serialNumber forKeyedSubscript:@"SerialNumber"];
  io_registry_entry_t v6 = @"None";
  if (self->_driverFirmwareVersion) {
    driverFirmwareVersion = self->_driverFirmwareVersion;
  }
  else {
    driverFirmwareVersion = (NSNumber *)@"None";
  }
  [v4 setObject:driverFirmwareVersion forKeyedSubscript:@"MultitouchDriverFirmwareVersion"];
  if (self->_connectionUUID) {
    CFStringRef connectionUUID = (const __CFString *)self->_connectionUUID;
  }
  else {
    CFStringRef connectionUUID = @"None";
  }
  [v4 setObject:connectionUUID forKeyedSubscript:@"ConnectionUUID"];
  publishedAccessoryInfo = self->_publishedAccessoryInfo;
  if (publishedAccessoryInfo) {
    io_registry_entry_t v6 = (__CFString *)[(NSDictionary *)publishedAccessoryInfo copy];
  }
  [v4 setObject:v6 forKeyedSubscript:@"PublishedAccessoryInfo"];
  if (publishedAccessoryInfo) {

  }
  id v10 = [v4 copy];

  return (NSDictionary *)v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_publishedAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_driverFirmwareVersion, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end