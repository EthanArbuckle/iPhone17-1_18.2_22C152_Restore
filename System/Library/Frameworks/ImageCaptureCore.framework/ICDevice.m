@interface ICDevice
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)autoOpenSession;
- (BOOL)autolaunchDevice;
- (BOOL)canCancelSoftwareInstallation;
- (BOOL)closeSessionPending;
- (BOOL)handleCommandCompletion:(id)a3;
- (BOOL)hasOpenSession;
- (BOOL)isAppleDevice;
- (BOOL)isRemote;
- (BOOL)openSessionPending;
- (BOOL)preferred;
- (BOOL)ready;
- (BOOL)systemReportsEjectable;
- (BOOL)updateProperties:(id)a3;
- (CGImageRef)icon;
- (ICDevice)init;
- (ICDevice)initWithDictionary:(id)a3;
- (ICDeviceManager)deviceManager;
- (ICDeviceType)type;
- (NSArray)capabilities;
- (NSMutableDictionary)userData;
- (NSMutableSet)deviceCapabilities;
- (NSNumber)connectionID;
- (NSNumber)deviceHandle;
- (NSNumber)deviceID;
- (NSNumber)deviceRef;
- (NSNumber)procID;
- (NSString)UUIDString;
- (NSString)autolaunchApplicationPath;
- (NSString)iconPath;
- (NSString)internalUUID;
- (NSString)locationDescription;
- (NSString)modulePath;
- (NSString)moduleVersion;
- (NSString)name;
- (NSString)persistentIDString;
- (NSString)productKind;
- (NSString)serialNumberString;
- (NSString)systemSymbolName;
- (NSString)transportType;
- (NSString)volumePath;
- (double)softwareInstallPercentDone;
- (id)delegate;
- (id)description;
- (id)deviceDelegate;
- (id)valueForUndefinedKey:(id)a3;
- (int)moduleExecutableArchitecture;
- (int)sessionID;
- (int)usbIntefaceClass;
- (int)usbInterfaceProtocol;
- (int)usbInterfaceSubClass;
- (int)usbLocationID;
- (int)usbProductID;
- (int)usbVendorID;
- (int64_t)fwGUID;
- (int64_t)sessionState;
- (void)addCapability:(id)a3;
- (void)cleanupDeviceWithErrorCode:(id)a3 completionBlock:(id)a4;
- (void)imageCaptureEventNotification:(id)a3 completion:(id)a4;
- (void)notifyObservers:(id)a3;
- (void)removeCapabilities;
- (void)removeCapability:(id)a3;
- (void)requestEject;
- (void)requestEjectWithCompletion:(void *)completion;
- (void)setAutoOpenSession:(BOOL)a3;
- (void)setAutolaunchApplicationPath:(NSString *)autolaunchApplicationPath;
- (void)setAutolaunchDevice:(BOOL)a3;
- (void)setCloseSessionPending:(BOOL)a3;
- (void)setConnectionID:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDeviceCapabilities:(id)a3;
- (void)setDeviceDelegate:(id)a3;
- (void)setDeviceHandle:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setDeviceRef:(id)a3;
- (void)setFwGUID:(int64_t)a3;
- (void)setHasOpenSession:(BOOL)a3;
- (void)setIcon:(CGImage *)a3;
- (void)setIconPath:(id)a3;
- (void)setInternalUUID:(id)a3;
- (void)setLocationDescription:(id)a3;
- (void)setModulePath:(id)a3;
- (void)setModuleVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setOpenSessionPending:(BOOL)a3;
- (void)setPersistentIDString:(id)a3;
- (void)setPreferred:(BOOL)a3;
- (void)setProcID:(id)a3;
- (void)setProductKind:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)setSerialNumberString:(id)a3;
- (void)setSessionID:(int)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setSystemReportsEjectable:(BOOL)a3;
- (void)setSystemSymbolName:(id)a3;
- (void)setTransportType:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUUIDString:(id)a3;
- (void)setUsbIntefaceClass:(int)a3;
- (void)setUsbInterfaceProtocol:(int)a3;
- (void)setUsbInterfaceSubClass:(int)a3;
- (void)setUsbLocationID:(int)a3;
- (void)setUsbProductID:(int)a3;
- (void)setUsbVendorID:(int)a3;
- (void)setUserData:(id)a3;
- (void)setVolumePath:(id)a3;
- (void)updateCapabilities:(id)a3;
@end

@implementation ICDevice

- (ICDevice)init
{
  return [(ICDevice *)self initWithDictionary:0];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (ICDevice)initWithDictionary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)ICDevice;
  v5 = [(ICDevice *)&v46 init];
  v6 = v5;
  if (v5)
  {
    v5->_sessionState = -1;
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    userData = v6->_userData;
    v6->_userData = (NSMutableDictionary *)v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"ICADeviceBrowserDeviceRefKey"];
    deviceRef = v6->_deviceRef;
    v6->_deviceRef = (NSNumber *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"ICAConnectionIDKey"];
    connectionID = v6->_connectionID;
    v6->_connectionID = (NSNumber *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"objectID"];
    deviceID = v6->_deviceID;
    v6->_deviceID = (NSNumber *)v13;

    uint64_t v15 = [NSNumber numberWithUnsignedLong:++_sProcID];
    procID = v6->_procID;
    v6->_procID = (NSNumber *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"productKind"];
    productKind = v6->_productKind;
    v6->_productKind = (NSString *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    deviceCapabilities = v6->_deviceCapabilities;
    v6->_deviceCapabilities = (NSMutableSet *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"name"];
    name = v6->_name;
    v6->_name = (NSString *)v21;

    v6->_softwareInstallPercentDone = 0.0;
    v6->_canCancelSoftwareInstallation = 1;
    v23 = 0;
    if (![(ICDevice *)v6 isRemote])
    {
      if ([(ICDevice *)v6 type])
      {
        v23 = [v4 objectForKeyedSubscript:@"capa"];
      }
      else
      {
        v23 = 0;
      }
    }
    [(ICDevice *)v6 updateCapabilities:v23];
    uint64_t v24 = [v4 objectForKeyedSubscript:@"UUIDString"];
    UUIDString = v6->_UUIDString;
    v6->_UUIDString = (NSString *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"persistentIDString"];
    persistentIDString = v6->_persistentIDString;
    v6->_persistentIDString = (NSString *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"ICADeviceSerialNumberString"];
    serialNumberString = v6->_serialNumberString;
    v6->_serialNumberString = (NSString *)v28;

    v30 = [v4 objectForKeyedSubscript:@"ICAAutoLaunchedDevice"];

    if (v30) {
      v6->_autolaunchDevice = 1;
    }
    modulePath = v6->_modulePath;
    v6->_modulePath = (NSString *)@"/System/Library/Image Capture/Devices/PTPCamera.app";

    moduleVersion = v6->_moduleVersion;
    v6->_moduleVersion = (NSString *)@"1.0";

    __ICOSLogCreate();
    v33 = @"ICDevice";
    if ((unint64_t)[@"ICDevice" length] >= 0x15)
    {
      v34 = objc_msgSend(@"ICDevice", "substringWithRange:", 0, 18);
      v33 = [v34 stringByAppendingString:@".."];
    }
    v35 = NSString;
    v36 = [(ICDevice *)v6 deviceRef];
    uint64_t v37 = [v36 intValue];
    v38 = [(ICDevice *)v6 persistentIDString];
    v39 = [v35 stringWithFormat:@" +++ Creating [0x%x]:%@", v37, v38];

    v40 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v41 = v33;
      v42 = v40;
      uint64_t v43 = [(__CFString *)v41 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v48 = v43;
      __int16 v49 = 2114;
      v50 = v39;
      _os_log_impl(&dword_1BEEFF000, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    v44 = v6;
  }
  return v6;
}

- (BOOL)updateProperties:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [v4 objectForKeyedSubscript:@"deviceIconPath"];
  if (v6)
  {
    iconPath = self->_iconPath;
    if (iconPath)
    {
      if ([(NSString *)iconPath isEqualToString:v6]) {
        goto LABEL_6;
      }
      v8 = self->_iconPath;
      self->_iconPath = 0;
    }
    uint64_t v9 = (NSString *)[v6 copy];
    v10 = self->_iconPath;
    self->_iconPath = v9;

    [(ICDevice *)self setIcon:0];
    [v5 addObject:@"icon"];
    [v5 addObject:@"iconPath"];
  }
LABEL_6:
  uint64_t v11 = [v4 objectForKeyedSubscript:@"systemSymbolName"];
  if (v11)
  {
    systemSymbolName = self->_systemSymbolName;
    if (!systemSymbolName)
    {
LABEL_10:
      v14 = (NSString *)[v11 copy];
      uint64_t v15 = self->_systemSymbolName;
      self->_systemSymbolName = v14;

      [v5 addObject:@"icon"];
      [v5 addObject:@"systemSymbolName"];
      goto LABEL_11;
    }
    if (![(NSString *)systemSymbolName isEqualToString:v11])
    {
      uint64_t v13 = self->_systemSymbolName;
      self->_systemSymbolName = 0;

      goto LABEL_10;
    }
  }
LABEL_11:
  if (![(ICDevice *)self isRemote] && ([(ICDevice *)self type] & 1) != 0)
  {
    v16 = [v4 objectForKeyedSubscript:@"capa"];
  }
  else
  {
    v16 = 0;
  }
  [(ICDevice *)self updateCapabilities:v16];
  uint64_t v17 = [v4 objectForKeyedSubscript:@"ICADeviceSerialNumberString"];
  if (v17)
  {
    serialNumberString = self->_serialNumberString;
    if (!serialNumberString
      || ![(NSString *)serialNumberString isEqualToString:v17]
      || !self->_serialNumberString)
    {
      uint64_t v19 = (NSString *)[v17 copy];
      v20 = self->_serialNumberString;
      self->_serialNumberString = v19;

      [v5 addObject:@"serialNumberString"];
    }
  }
  uint64_t v21 = [v4 objectForKeyedSubscript:@"UUIDString"];
  if (v21)
  {
    UUIDString = self->_UUIDString;
    if (!UUIDString || ![(NSString *)UUIDString isEqualToString:v21] || !self->_UUIDString)
    {
      v23 = (NSString *)[v21 copy];
      uint64_t v24 = self->_UUIDString;
      self->_UUIDString = v23;

      [v5 addObject:@"UUIDString"];
    }
  }
  v25 = [v4 objectForKeyedSubscript:@"persistentIDString"];
  if (v25)
  {
    persistentIDString = self->_persistentIDString;
    if (!persistentIDString
      || ![(NSString *)persistentIDString isEqualToString:v25]
      || !self->_persistentIDString)
    {
      v27 = (NSString *)[v25 copy];
      uint64_t v28 = self->_persistentIDString;
      self->_persistentIDString = v27;

      [v5 addObject:@"persistentIDString"];
    }
  }
  BOOL v29 = [v5 count] != 0;

  return v29;
}

- (void)notifyObservers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__ICDevice_notifyObservers___block_invoke;
  v6[3] = &unk_1E63D72D0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  ICPerformBlockOnMainThread(v6);
}

void __28__ICDevice_notifyObservers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "willChangeValueForKey:", v7, (void)v8);
        [*(id *)(a1 + 40) didChangeValueForKey:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setSessionState:(int64_t)a3
{
  if (self->_sessionState != a3)
  {
    self->_sessionState = a3;
    if (a3)
    {
      [(ICDevice *)self willChangeValueForKey:@"hasOpenSession"];
      [(ICDevice *)self didChangeValueForKey:@"hasOpenSession"];
    }
  }
}

- (BOOL)hasOpenSession
{
  return [(ICDevice *)self sessionState] == 1;
}

- (void)setPreferred:(BOOL)a3
{
  self->_preferred = a3;
  [(ICDevice *)self notifyObservers:&unk_1F1A2C610];
}

- (void)setIconPath:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ICDevice *)self iconPath];

  if (v4)
  {
    iconPath = self->_iconPath;
    self->_iconPath = 0;
  }
  v6 = (NSString *)[v8 copy];
  uint64_t v7 = self->_iconPath;
  self->_iconPath = v6;
}

- (CGImageRef)icon
{
  return 0;
}

- (BOOL)isRemote
{
  id v2 = [(ICDevice *)self transportType];
  char v3 = [v2 isEqualToString:@"ICTransportTypeTCPIP"];

  return v3;
}

- (BOOL)isAppleDevice
{
  return [(ICDevice *)self usbVendorID] == 1452;
}

- (id)description
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"class"];
  uint64_t v4 = NSString;
  uint64_t v5 = [(ICDevice *)self delegate];
  v6 = objc_msgSend(v4, "stringWithFormat:", @"<%p>", v5);
  [v3 setObject:v6 forKeyedSubscript:@"delegate"];

  uint64_t v7 = NSString;
  id v8 = [(ICDevice *)self deviceRef];
  long long v9 = objc_msgSend(v7, "stringWithFormat:", @"0x%08x", objc_msgSend(v8, "unsignedIntValue"));
  [v3 setObject:v9 forKeyedSubscript:@"deviceRef"];

  long long v10 = NSString;
  long long v11 = [(ICDevice *)self connectionID];
  v12 = objc_msgSend(v10, "stringWithFormat:", @"0x%08x", objc_msgSend(v11, "unsignedIntValue"));
  [v3 setObject:v12 forKeyedSubscript:@"connectionID"];

  uint64_t v13 = NSString;
  v14 = [(ICDevice *)self deviceID];
  uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", @"0x%08x", objc_msgSend(v14, "unsignedIntValue"));
  [v3 setObject:v15 forKeyedSubscript:@"deviceID"];

  v16 = NSString;
  uint64_t v17 = [(ICDevice *)self name];
  v18 = [v16 stringWithFormat:@"%@", v17];
  [v3 setObject:v18 forKeyedSubscript:@"name"];

  uint64_t v19 = NSString;
  v20 = [(ICDevice *)self locationDescription];
  uint64_t v21 = [v19 stringWithFormat:@"%@", v20];
  [v3 setObject:v21 forKeyedSubscript:@"locationDescription"];

  v22 = NSString;
  v23 = [(ICDevice *)self iconPath];
  uint64_t v24 = [v22 stringWithFormat:@"%@", v23];
  [v3 setObject:v24 forKeyedSubscript:@"iconPath"];

  v25 = objc_msgSend(NSString, "stringWithFormat:", @"0x%08lx", -[ICDevice type](self, "type"));
  [v3 setObject:v25 forKeyedSubscript:@"type"];

  uint64_t v26 = NSString;
  v27 = [(ICDevice *)self UUIDString];
  uint64_t v28 = [v26 stringWithFormat:@"%@", v27];
  [v3 setObject:v28 forKeyedSubscript:@"UUIDString"];

  BOOL v29 = NSString;
  v30 = [(ICDevice *)self persistentIDString];
  v31 = [v29 stringWithFormat:@"%@", v30];
  [v3 setObject:v31 forKeyedSubscript:@"persistentIDString"];

  v32 = [(ICDevice *)self capabilities];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    v34 = [(ICDevice *)self capabilities];
    [v3 setObject:v34 forKeyedSubscript:@"capabilities"];
  }
  v35 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "NO");
  [v3 setObject:v35 forKeyedSubscript:@"shared"];

  v36 = NSString;
  uint64_t v37 = [(ICDevice *)self transportType];
  v38 = [v36 stringWithFormat:@"%@", v37];
  [v3 setObject:v38 forKeyedSubscript:@"transportType"];

  v39 = [(ICDevice *)self transportType];

  if (v39 == @"ICTransportTypeUSB")
  {
    v41 = objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", -[ICDevice usbLocationID](self, "usbLocationID"));
    [v3 setObject:v41 forKeyedSubscript:@"usbLocationID"];

    v42 = objc_msgSend(NSString, "stringWithFormat:", @"0x%04x", -[ICDevice usbProductID](self, "usbProductID"));
    [v3 setObject:v42 forKeyedSubscript:@"usbProductID"];

    uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"0x%04x", -[ICDevice usbVendorID](self, "usbVendorID"));
    [v3 setObject:v43 forKeyedSubscript:@"usbVendorID"];

    v44 = objc_msgSend(NSString, "stringWithFormat:", @"0x%02x", -[ICDevice usbIntefaceClass](self, "usbIntefaceClass"));
    [v3 setObject:v44 forKeyedSubscript:@"usbIntefaceClass"];

    v45 = objc_msgSend(NSString, "stringWithFormat:", @"0x%02x", -[ICDevice usbInterfaceSubClass](self, "usbInterfaceSubClass"));
    [v3 setObject:v45 forKeyedSubscript:@"usbInterfaceSubClass"];

    v40 = objc_msgSend(NSString, "stringWithFormat:", @"0x%02x", -[ICDevice usbInterfaceProtocol](self, "usbInterfaceProtocol"));
    [v3 setObject:v40 forKeyedSubscript:@"usbInterfaceProtocol"];
  }
  else
  {
    v40 = [(ICDevice *)self transportType];
  }

  objc_super v46 = [v3 description];

  return v46;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = delegate;
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __ICOSLogCreate();
  uint64_t v7 = @"Delegate Updated";
  if ((unint64_t)[@"Delegate Updated" length] >= 0x15)
  {
    id v8 = objc_msgSend(@"Delegate Updated", "substringWithRange:", 0, 18);
    uint64_t v7 = [v8 stringByAppendingString:@".."];
  }
  long long v9 = @"< not set >";
  if (v6) {
    long long v9 = v6;
  }
  long long v10 = [NSString stringWithFormat:@"%@", v9];
  long long v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v7;
    uint64_t v13 = v11;
    *(_DWORD *)buf = 136446466;
    uint64_t v15 = [(__CFString *)v12 UTF8String];
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  objc_storeWeak(&self->_deviceDelegate, v4);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_deviceDelegate);

  return WeakRetained;
}

- (void)requestEject
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __24__ICDevice_requestEject__block_invoke;
  v2[3] = &unk_1E63D7280;
  v2[4] = self;
  [(ICDevice *)self requestEjectWithCompletion:v2];
}

void __24__ICDevice_requestEject__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__ICDevice_requestEject__block_invoke_2;
    block[3] = &unk_1E63D7700;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    id v10 = v3;
    ICPerformBlockOnMainThread(block);
  }
}

id __24__ICDevice_requestEject__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), sel_device_didEjectWithError_, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)requestEjectWithCompletion:(void *)completion
{
  id v3 = completion;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICDevice_requestEjectWithCompletion___block_invoke;
  block[3] = &unk_1E63D7728;
  id v6 = v3;
  id v4 = v3;
  ICPerformBlockOnMainThread(block);
}

void __39__ICDevice_requestEjectWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-21346 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)capabilities
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(ICDevice *)self deviceCapabilities];
  id v5 = [v4 allObjects];
  id v6 = [v3 arrayWithArray:v5];

  uint64_t v7 = [(ICDevice *)self modulePath];
  id v8 = [v7 lastPathComponent];
  uint64_t v9 = [v8 stringByDeletingPathExtension];

  if (([v9 isEqualToString:@"PTPCamera"] & 1) != 0
    || [v9 isEqualToString:@"PTPIPCamera"])
  {
    [v6 addObject:@"ICCameraDeviceCanAcceptPTPCommands"];
  }

  return (NSArray *)v6;
}

- (void)addCapability:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(ICDevice *)self capabilities];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v20 + 1) + 8 * v10) isEqualToString:v4])
        {

          goto LABEL_15;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  __ICOSLogCreate();
  long long v11 = @"                   ∆";
  if ((unint64_t)[@"                   ∆" length] >= 0x15)
  {
    v12 = objc_msgSend(@"                   ∆", "substringWithRange:", 0, 18);
    long long v11 = [v12 stringByAppendingString:@".."];
  }
  uint64_t v13 = [NSString stringWithFormat:@"%@", v4];
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v11;
    __int16 v16 = v14;
    uint64_t v17 = [(__CFString *)v15 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1BEEFF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v18 = [(ICDevice *)self deviceCapabilities];
  [v18 addObject:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__ICDevice_addCapability___block_invoke;
  block[3] = &unk_1E63D72A8;
  void block[4] = self;
  ICPerformBlockOnMainThread(block);
LABEL_15:
}

void __26__ICDevice_addCapability___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"capabilities"];
  id v2 = [*(id *)(a1 + 32) delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __26__ICDevice_addCapability___block_invoke_2;
    uint64_t v8 = &unk_1E63D72D0;
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    id v9 = v3;
    uint64_t v10 = v4;
    ICPerformBlockOnMainThread(&v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", @"capabilities", v5, v6, v7, v8);
}

id __26__ICDevice_addCapability___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), sel_cameraDeviceDidChangeCapability_, *(void *)(a1 + 40));
}

- (void)removeCapability:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(ICDevice *)self capabilities];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isEqualToString:v4])
        {
          v12 = [(ICDevice *)self deviceCapabilities];
          [v12 removeObject:v11];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __29__ICDevice_removeCapability___block_invoke;
          block[3] = &unk_1E63D72A8;
          void block[4] = self;
          ICPerformBlockOnMainThread(block);
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

void __29__ICDevice_removeCapability___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"capabilities"];
  id v2 = [*(id *)(a1 + 32) delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __29__ICDevice_removeCapability___block_invoke_2;
    uint64_t v8 = &unk_1E63D72D0;
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    id v9 = v3;
    uint64_t v10 = v4;
    ICPerformBlockOnMainThread(&v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", @"capabilities", v5, v6, v7, v8);
}

id __29__ICDevice_removeCapability___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), sel_cameraDeviceDidChangeCapability_, *(void *)(a1 + 40));
}

- (void)imageCaptureEventNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"ICADeviceBrowserDeviceRefKey"];
  int v9 = [v8 unsignedIntValue];
  uint64_t v10 = [(ICDevice *)self deviceID];
  int v11 = [v10 unsignedIntValue];

  if (v9 == v11)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__ICDevice_imageCaptureEventNotification_completion___block_invoke;
    block[3] = &unk_1E63D7750;
    void block[4] = self;
    id v14 = v6;
    id v15 = v7;
    ICPerformBlockOnMainThread(block);
  }
  else
  {
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9922 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

uint64_t __53__ICDevice_imageCaptureEventNotification_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleImageCaptureEventNotification:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (BOOL)handleCommandCompletion:(id)a3
{
  return 0;
}

- (void)updateCapabilities:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v7) {
      goto LABEL_32;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        int v12 = objc_msgSend(v11, "unsignedIntValue", v17);
        if (v12 > 1701471586)
        {
          if (v12 > 1819238755)
          {
            if (v12 == 1819238756)
            {
              uint64_t v13 = @"ICCameraDeviceCanReceiveFile";
            }
            else
            {
              if (v12 != 1935895659) {
                goto LABEL_30;
              }
              uint64_t v13 = @"ICCameraDeviceCanSyncClock";
            }
          }
          else
          {
            id v14 = @"ICDeviceCanEjectOrDisconnect";
            if (v12 == 1701471587) {
              goto LABEL_28;
            }
            if (v12 != 1751476582)
            {
LABEL_30:
              objc_msgSend(NSString, "stringFromOSType:", objc_msgSend(v11, "unsignedIntValue"));
              id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_27;
            }
            uint64_t v13 = @"ICCameraDeviceSupportsHEIF";
          }
        }
        else if (v12 > 1684368432)
        {
          if (v12 == 1684368433)
          {
            uint64_t v13 = @"ICCameraDeviceCanDeleteOneFile";
          }
          else
          {
            if (v12 != 1684368481) {
              goto LABEL_30;
            }
            uint64_t v13 = @"ICCameraDeviceCanDeleteAllFiles";
          }
        }
        else if (v12 == 1667460658)
        {
          uint64_t v13 = @"ICCameraDeviceCanTakePictureUsingShutterReleaseOnCamera";
        }
        else
        {
          if (v12 != 1667460713) {
            goto LABEL_30;
          }
          uint64_t v13 = @"ICCameraDeviceCanTakePicture";
        }
        id v15 = v13;
LABEL_27:
        id v14 = v15;
LABEL_28:
        [(ICDevice *)self addCapability:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v16 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v8 = v16;
      if (!v16)
      {
LABEL_32:

        uint64_t v5 = v17;
        break;
      }
    }
  }
  if ([(ICDevice *)self systemReportsEjectable]) {
    [(ICDevice *)self addCapability:@"ICDeviceCanEjectOrDisconnect"];
  }
}

- (NSString)autolaunchApplicationPath
{
  autolaunchApplicationPath = self->_autolaunchApplicationPath;
  if (autolaunchApplicationPath)
  {
    id v3 = [(NSString *)autolaunchApplicationPath stringByExpandingTildeInPath];
  }
  else
  {
    id v3 = &stru_1F1A1D6A8;
  }

  return (NSString *)v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqual:@"icon"])
  {
    id v4 = [(ICDevice *)self icon];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)cleanupDeviceWithErrorCode:(id)a3 completionBlock:(id)a4
{
  self->_connectionID = 0;
  MEMORY[0x1F41817F8]();
}

- (void)removeCapabilities
{
  id v2 = [(ICDevice *)self deviceCapabilities];
  [v2 removeAllObjects];
}

- (void)setAutolaunchApplicationPath:(NSString *)autolaunchApplicationPath
{
  self->_autolaunchApplicationPath = (NSString *)[(NSString *)autolaunchApplicationPath copy];

  MEMORY[0x1F41817F8]();
}

- (ICDeviceType)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)productKind
{
  return self->_productKind;
}

- (void)setProductKind:(id)a3
{
}

- (void)setIcon:(CGImage *)a3
{
}

- (NSString)systemSymbolName
{
  return self->_systemSymbolName;
}

- (void)setSystemSymbolName:(id)a3
{
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (NSString)locationDescription
{
  return self->_locationDescription;
}

- (void)setLocationDescription:(id)a3
{
}

- (void)setHasOpenSession:(BOOL)a3
{
  self->_hasOpenSession = a3;
}

- (NSMutableDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
}

- (NSString)modulePath
{
  return self->_modulePath;
}

- (void)setModulePath:(id)a3
{
}

- (NSString)moduleVersion
{
  return self->_moduleVersion;
}

- (void)setModuleVersion:(id)a3
{
}

- (NSString)serialNumberString
{
  return self->_serialNumberString;
}

- (void)setSerialNumberString:(id)a3
{
}

- (int)usbLocationID
{
  return self->_usbLocationID;
}

- (void)setUsbLocationID:(int)a3
{
  self->_usbLocationID = a3;
}

- (int)usbProductID
{
  return self->_usbProductID;
}

- (void)setUsbProductID:(int)a3
{
  self->_usbProductID = a3;
}

- (int)usbVendorID
{
  return self->_usbVendorID;
}

- (void)setUsbVendorID:(int)a3
{
  self->_usbVendorID = a3;
}

- (NSString)persistentIDString
{
  return self->_persistentIDString;
}

- (void)setPersistentIDString:(id)a3
{
}

- (int)moduleExecutableArchitecture
{
  return self->_moduleExecutableArchitecture;
}

- (NSMutableSet)deviceCapabilities
{
  return self->_deviceCapabilities;
}

- (void)setDeviceCapabilities:(id)a3
{
}

- (int)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(int)a3
{
  self->_sessionID = a3;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (ICDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
}

- (id)deviceDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_deviceDelegate);

  return WeakRetained;
}

- (void)setDeviceDelegate:(id)a3
{
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (NSString)internalUUID
{
  return self->_internalUUID;
}

- (void)setInternalUUID:(id)a3
{
}

- (NSNumber)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
}

- (int)usbIntefaceClass
{
  return self->_usbIntefaceClass;
}

- (void)setUsbIntefaceClass:(int)a3
{
  self->_usbIntefaceClass = a3;
}

- (int)usbInterfaceSubClass
{
  return self->_usbInterfaceSubClass;
}

- (void)setUsbInterfaceSubClass:(int)a3
{
  self->_usbInterfaceSubClass = a3;
}

- (int)usbInterfaceProtocol
{
  return self->_usbInterfaceProtocol;
}

- (void)setUsbInterfaceProtocol:(int)a3
{
  self->_usbInterfaceProtocol = a3;
}

- (int64_t)fwGUID
{
  return self->_fwGUID;
}

- (void)setFwGUID:(int64_t)a3
{
  self->_fwGUID = a3;
}

- (BOOL)autolaunchDevice
{
  return self->_autolaunchDevice;
}

- (void)setAutolaunchDevice:(BOOL)a3
{
  self->_autolaunchDevice = a3;
}

- (BOOL)systemReportsEjectable
{
  return self->_systemReportsEjectable;
}

- (void)setSystemReportsEjectable:(BOOL)a3
{
  self->_systemReportsEjectable = a3;
}

- (NSNumber)procID
{
  return self->_procID;
}

- (void)setProcID:(id)a3
{
}

- (NSString)volumePath
{
  return self->_volumePath;
}

- (void)setVolumePath:(id)a3
{
}

- (BOOL)autoOpenSession
{
  return self->_autoOpenSession;
}

- (void)setAutoOpenSession:(BOOL)a3
{
  self->_autoOpenSession = a3;
}

- (BOOL)openSessionPending
{
  return self->_openSessionPending;
}

- (void)setOpenSessionPending:(BOOL)a3
{
  self->_openSessionPending = a3;
}

- (BOOL)closeSessionPending
{
  return self->_closeSessionPending;
}

- (void)setCloseSessionPending:(BOOL)a3
{
  self->_closeSessionPending = a3;
}

- (NSNumber)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
}

- (NSNumber)deviceRef
{
  return self->_deviceRef;
}

- (void)setDeviceRef:(id)a3
{
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (BOOL)preferred
{
  return self->_preferred;
}

- (double)softwareInstallPercentDone
{
  return self->_softwareInstallPercentDone;
}

- (BOOL)canCancelSoftwareInstallation
{
  return self->_canCancelSoftwareInstallation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconPath, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_deviceRef, 0);
  objc_storeStrong((id *)&self->_connectionID, 0);
  objc_storeStrong((id *)&self->_volumePath, 0);
  objc_storeStrong((id *)&self->_procID, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
  objc_storeStrong((id *)&self->_internalUUID, 0);
  objc_destroyWeak(&self->_deviceDelegate);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);
  objc_storeStrong((id *)&self->_persistentIDString, 0);
  objc_storeStrong((id *)&self->_serialNumberString, 0);
  objc_storeStrong((id *)&self->_moduleVersion, 0);
  objc_storeStrong((id *)&self->_modulePath, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_locationDescription, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_systemSymbolName, 0);
  objc_storeStrong((id *)&self->_productKind, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_autolaunchApplicationPath, 0);
}

@end