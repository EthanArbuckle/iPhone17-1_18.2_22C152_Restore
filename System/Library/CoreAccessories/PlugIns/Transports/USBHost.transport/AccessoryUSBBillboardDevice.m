@interface AccessoryUSBBillboardDevice
+ (unint64_t)getRegistryEntryIDFromService:(unsigned int)a3;
+ (unsigned)parentServiceVidPid:(unsigned int)a3;
- (AccessoryUSBBillboardDevice)initWithService:(unsigned int)a3;
- (NSDictionary)ioregProperties;
- (NSString)identifier;
- (unint64_t)registryEntryID;
- (unsigned)pid;
- (unsigned)vid;
- (void)dismissNotSupportNotification;
- (void)presentNotSupportNotification;
@end

@implementation AccessoryUSBBillboardDevice

- (AccessoryUSBBillboardDevice)initWithService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)AccessoryUSBBillboardDevice;
  v4 = [(AccessoryUSBBillboardDevice *)&v11 init];
  if (v4)
  {
    v4->_registryEntryID = +[AccessoryUSBBillboardDevice getRegistryEntryIDFromService:v3];
    uint64_t v5 = +[AccessoryUSBBillboardDevice parentServiceVidPid:v3];
    HIDWORD(v6) = v5;
    LODWORD(v6) = v5;
    *(_DWORD *)&v4->_vid = v6 >> 16;
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%x", v5);
    uint64_t v8 = acc_userNotifications_generateIdentifier(@"billboard-registry", (uint64_t)v7);
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v8;
  }
  return v4;
}

- (void)presentNotSupportNotification
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = acc_userNotifications_accessoryNotSupported();
  v4 = (void *)[(NSString *)self->_identifier copy];
  [v3 setGroupIdentifier:v4];

  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int vid = self->_vid;
    int pid = self->_pid;
    unint64_t registryEntryID = self->_registryEntryID;
    objc_super v11 = [v3 groupIdentifier];
    int v13 = 136316418;
    v14 = "-[AccessoryUSBBillboardDevice presentNotSupportNotification]";
    __int16 v15 = 1024;
    int v16 = vid;
    __int16 v17 = 1024;
    int v18 = pid;
    __int16 v19 = 2048;
    unint64_t v20 = registryEntryID;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_222C74000, v7, OS_LOG_TYPE_DEFAULT, "%s: vid/pid 0x%X/0x%X, registryID 0x%llx, groupidentifer %@, pAccErrorNotification %@", (uint8_t *)&v13, 0x36u);
  }
  v12 = +[ACCUserNotificationManager sharedManager];
  [v12 presentNotification:v3 completionHandler:0];
}

- (void)dismissNotSupportNotification
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[(NSString *)self->_identifier copy];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int vid = self->_vid;
    int pid = self->_pid;
    unint64_t registryEntryID = self->_registryEntryID;
    int v11 = 136316162;
    v12 = "-[AccessoryUSBBillboardDevice dismissNotSupportNotification]";
    __int16 v13 = 1024;
    int v14 = vid;
    __int16 v15 = 1024;
    int v16 = pid;
    __int16 v17 = 2048;
    unint64_t v18 = registryEntryID;
    __int16 v19 = 2112;
    unint64_t v20 = v3;
    _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEFAULT, "%s: vid/pid 0x%X/0x%X, registryID 0x%llx, groupidentifer %@", (uint8_t *)&v11, 0x2Cu);
  }

  v10 = +[ACCUserNotificationManager sharedManager];
  [v10 dismissNotificationsWithGroupIdentifier:v3];
}

+ (unint64_t)getRegistryEntryIDFromService:(unsigned int)a3
{
  uint64_t entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID)) {
    return 0;
  }
  else {
    return entryID;
  }
}

+ (unsigned)parentServiceVidPid:(unsigned int)a3
{
  kern_return_t ParentEntry;
  __CFString *v5;
  CFAllocatorRef v6;
  void *CFProperty;
  void *v8;
  int v9;
  unsigned int v10;
  NSObject *v11;
  id v12;
  kern_return_t v14;
  NSObject *v15;
  io_registry_entry_t parent;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  io_registry_entry_t v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x263EF8340];
  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(a3, "IOService", &parent);
  if (ParentEntry)
  {
    int v14 = ParentEntry;
    __int16 v15 = logObjectForModule();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      unint64_t v18 = "+[AccessoryUSBBillboardDevice parentServiceVidPid:]";
      __int16 v19 = 1024;
      unint64_t v20 = a3;
      uint64_t v21 = 1024;
      v22 = parent;
      __int16 v23 = 1024;
      LODWORD(v24) = v14;
      _os_log_impl(&dword_222C74000, v15, OS_LOG_TYPE_DEFAULT, "%s: service(%d) parent(%d) not available. (%d)", buf, 0x1Eu);
    }

    v10 = 0;
    CFProperty = 0;
    uint64_t v8 = 0;
    id v5 = 0;
  }
  else
  {
    if (parent)
    {
      id v5 = (__CFString *)IOObjectCopyClass(parent);
      id v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFProperty = (void *)IORegistryEntryCreateCFProperty(parent, @"idVendor", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      uint64_t v8 = (void *)IORegistryEntryCreateCFProperty(parent, @"idProduct", v6, 0);
      IOObjectRelease(parent);
    }
    else
    {
      CFProperty = 0;
      uint64_t v8 = 0;
      id v5 = 0;
    }
    v9 = [CFProperty unsignedShortValue];
    v10 = [v8 unsignedShortValue] | (v9 << 16);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    int v11 = MEMORY[0x263EF8438];
    v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    unint64_t v18 = "+[AccessoryUSBBillboardDevice parentServiceVidPid:]";
    __int16 v19 = 1024;
    unint64_t v20 = a3;
    uint64_t v21 = 1024;
    v22 = parent;
    __int16 v23 = 2112;
    v24 = v5;
    uint64_t v25 = 2112;
    v26 = CFProperty;
    v27 = 2112;
    v28 = v8;
    v29 = 1024;
    v30 = v10;
    _os_log_impl(&dword_222C74000, v11, OS_LOG_TYPE_INFO, "%s: service(%d) parent(%d - %@) vid/pid(%@/%@) vidpid 0X%X", buf, 0x3Cu);
  }

  return v10;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (unsigned)vid
{
  return self->_vid;
}

- (unsigned)pid
{
  return self->_pid;
}

- (NSDictionary)ioregProperties
{
  return self->_ioregProperties;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ioregProperties, 0);
}

@end