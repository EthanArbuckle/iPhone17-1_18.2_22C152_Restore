@interface DOMDevice
- (BOOL)compositeDeviceIsConfigured;
- (BOOL)isAttachedToHub;
- (BOOL)isBillboardDevice;
- (BOOL)isCompositeDevice;
- (BOOL)isHub;
- (BOOL)isThunderboltDevice;
- (BOOL)powerHog;
- (BOOL)shouldMatchDevice;
- (BOOL)tbtAccessoryWithIncompatibleCable;
- (BOOL)tbtAccessoryWithIncompatiblePort;
- (DOMDevice)initWithIOService:(unsigned int)a3 notificationPort:(IONotificationPort *)a4;
- (DOMPersonality)winningDomPersonality;
- (NSDictionary)properties;
- (NSNumber)winningScore;
- (NSString)dialogBodyKey;
- (NSString)dialogTitleKey;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)domDeviceTransaction;
- (id)description;
- (unint64_t)IORegEntryID;
- (unint64_t)winningIORegEntryID;
- (unsigned)io_notification;
- (unsigned)io_service;
- (void)dealloc;
- (void)evaluateScore:(id)a3 fromDomPersonality:(id)a4 withIORegEntryID:(unint64_t)a5;
- (void)handleIONotification:(unsigned int)a3 arg:(void *)a4;
- (void)setDialogBodyKey:(id)a3;
- (void)setDialogTitleKey:(id)a3;
- (void)setDomDeviceTransaction:(id)a3;
- (void)setIORegEntryID:(unint64_t)a3;
- (void)setIo_notification:(unsigned int)a3;
- (void)setIo_service:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setProperties:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWinningDomPersonality:(id)a3;
- (void)setWinningIORegEntryID:(unint64_t)a3;
- (void)setWinningScore:(id)a3;
- (void)updateDeviceProperties;
@end

@implementation DOMDevice

- (DOMDevice)initWithIOService:(unsigned int)a3 notificationPort:(IONotificationPort *)a4
{
  kern_return_t RegistryEntryID;
  int v11;
  id v12;
  uint64_t v13;
  OS_os_transaction *domDeviceTransaction;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  NSString *v18;
  BOOL isBillboardDevice;
  void *v20;
  void *v21;
  unsigned int v22;
  CFTypeRef CFProperty;
  void *v24;
  void *v25;
  unsigned int v26;
  BOOL isThunderboltDevice;
  int v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  int v37;
  BOOL isHub;
  BOOL isAttachedToHub;
  BOOL *p_tbtAccessoryWithIncompatiblePort;
  objc_super v42;
  uint8_t buf[4];
  unsigned char v44[10];
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  char name[136];

  uint64_t v5 = *(void *)&a3;
  v42.receiver = self;
  v42.super_class = (Class)DOMDevice;
  v6 = [(DOMDevice *)&v42 init];
  v7 = (DOMDevice *)v6;
  if (!v6) {
    return v7;
  }
  *((_DWORD *)v6 + 4) = v5;
  *((_WORD *)v6 + 4) = 0;
  *(_WORD *)(v6 + 13) = 0;
  v8 = (void *)*((void *)v6 + 11);
  *((void *)v6 + 11) = 0;

  dialogBodyKey = v7->_dialogBodyKey;
  v7->_dialogBodyKey = 0;

  *(_WORD *)&v7->_tbtAccessoryWithIncompatibleCable = 0;
  if (IOServiceAddInterestNotification(a4, v5, "IOGeneralInterest", (IOServiceInterestCallback)j__objc_msgSend_handleIONotification_arg_, v7, &v7->_io_notification)&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000AE68();
  }
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(v5, &v7->_IORegEntryID);
  if (RegistryEntryID)
  {
    v11 = RegistryEntryID;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000ADB4(v5, v11);
    }
  }
  v12 = +[NSString stringWithFormat:@"com.apple.deviceomatic.transaction.%x", v5];
  [v12 UTF8String];
  v13 = os_transaction_create();
  domDeviceTransaction = v7->_domDeviceTransaction;
  v7->_domDeviceTransaction = (OS_os_transaction *)v13;

  if (IOServiceWaitQuiet(v5, 0) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000AD20();
  }
  v15 = dispatch_queue_create("DOMDevice queue", 0);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v15;

  [(DOMDevice *)v7 updateDeviceProperties];
  memset(name, 0, 128);
  if (IORegistryEntryGetName(v5, name) || !name[0])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000AC8C();
    }
  }
  else
  {
    v17 = +[NSString stringWithUTF8String:name];
    v18 = v7->_name;
    v7->_name = (NSString *)v17;
  }
  v7->_isBillboardDevice = IOObjectConformsTo(v5, "AppleUSBHostBillboardDevice") != 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    isBillboardDevice = v7->_isBillboardDevice;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v44 = isBillboardDevice;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_isBillboardDevice: %d", buf, 8u);
  }
  if (!v7->_isBillboardDevice)
  {
    CFProperty = IORegistryEntryCreateCFProperty(v5, @"kUSBFailedRequestedPower", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v7->_powerHog = 1;
      CFRelease(CFProperty);
    }
    v7->_isHub = sub_100007C08(v5);
    v7->_isAttachedToHub = sub_100007CC0(v5);
    goto LABEL_68;
  }
  v20 = [(DOMDevice *)v7 properties];
  v21 = [v20 objectForKeyedSubscript:@"wSVID"];

  if (v21) {
    v22 = [v21 shortValue];
  }
  else {
    v22 = 0;
  }
  v24 = [(DOMDevice *)v7 properties];
  v25 = [v24 objectForKeyedSubscript:@"dwAlternateModeVdo"];

  if (v25) {
    v26 = [v25 intValue];
  }
  else {
    v26 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v44 = (unsigned __int16)v22;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "svid: 0x%04X", buf, 8u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v44 = v26;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "altModeVdo: 0x%08X", buf, 8u);
  }
  if (v22 == -32633 && (unsigned __int16)v26 == 1) {
    v7->_isThunderboltDevice = 1;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    isThunderboltDevice = v7->_isThunderboltDevice;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v44 = isThunderboltDevice;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_isThunderboltDevice: %d", buf, 8u);
  }
  v28 = MGGetBoolAnswer();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v44 = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hostSupportsThunderbolt:%d", buf, 8u);
  }
  if (v7->_isThunderboltDevice) {
    v29 = v28;
  }
  else {
    v29 = 0;
  }
  if (v29 == 1)
  {
    v30 = [(DOMDevice *)v7 properties];
    v31 = [v30 objectForKeyedSubscript:@"bmConfigured"];

    if (v31) {
      v32 = [v31 charValue];
    }
    else {
      v32 = 0;
    }
    v33 = [(DOMDevice *)v7 properties];
    v34 = [v33 objectForKeyedSubscript:@"BcdVersion"];

    if (v34) {
      v35 = (unsigned __int16)[v34 shortValue];
    }
    else {
      v35 = 0;
    }
    v36 = [(DOMDevice *)v7 properties];
    v25 = [v36 objectForKeyedSubscript:@"bAdditonalFailureInfo"];

    if (v25) {
      v37 = [v25 charValue];
    }
    else {
      v37 = 0;
    }
    v7->_isHub = sub_100007C08(v5);
    v7->_isAttachedToHub = sub_100007CC0(v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v44 = v32;
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)&v44[6] = v35;
      v45 = 1024;
      v46 = v37;
      v47 = 1024;
      v48 = 1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Billboard device properties: bmConfigured: 0x%x, bcdVersion: 0x%x, additionFailureInfo: 0x%x, TBHost: 0x%x", buf, 0x1Au);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      isHub = v7->_isHub;
      isAttachedToHub = v7->_isAttachedToHub;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v44 = isHub;
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)&v44[6] = isAttachedToHub;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "check if hub or attached to hub isHub: %d isAttachedToHub:%d", buf, 0xEu);
    }
    if (v32 == 3)
    {
      if (v35 < 0x120 || (v37 & 1) == 0) {
        goto LABEL_67;
      }
      goto LABEL_65;
    }
    if (v32 == 1)
    {
      p_tbtAccessoryWithIncompatiblePort = &v7->_tbtAccessoryWithIncompatiblePort;
      if (!v7->_isAttachedToHub) {
        p_tbtAccessoryWithIncompatiblePort = &v7->_tbtAccessoryWithIncompatibleCable;
      }
      goto LABEL_66;
    }
    if ((v37 & 3) != 0)
    {
LABEL_65:
      p_tbtAccessoryWithIncompatiblePort = &v7->_powerHog;
LABEL_66:
      *p_tbtAccessoryWithIncompatiblePort = 1;
    }
  }
LABEL_67:

LABEL_68:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "initialized %@", buf, 0xCu);
  }
  return v7;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [(DOMDevice *)self name];
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "tearing down object for %@", buf, 0xCu);
  }
  io_object_t io_notification = self->_io_notification;
  if (io_notification) {
    IOObjectRelease(io_notification);
  }
  io_object_t io_service = self->_io_service;
  if (io_service) {
    IOObjectRelease(io_service);
  }
  domDeviceTransaction = self->_domDeviceTransaction;
  if (domDeviceTransaction)
  {
    self->_domDeviceTransaction = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)DOMDevice;
  [(DOMDevice *)&v7 dealloc];
}

- (void)updateDeviceProperties
{
  CFMutableDictionaryRef properties = 0;
  if (IORegistryEntryCreateCFProperties([(DOMDevice *)self io_service], &properties, kCFAllocatorDefault, 0)&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000AFB0((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);
  }
  CFMutableDictionaryRef v10 = properties;
  [(DOMDevice *)self setProperties:properties];
}

- (void)handleIONotification:(unsigned int)a3 arg:(void *)a4
{
  if (a3 == -536850432)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(DOMDevice *)self name];
      int v11 = 138413058;
      *(void *)v12 = v8;
      *(_WORD *)&v12[8] = 1024;
      *(_DWORD *)&v12[10] = [(DOMDevice *)self io_service];
      __int16 v13 = 2048;
      unint64_t v14 = [(DOMDevice *)self IORegEntryID];
      __int16 v15 = 1024;
      int v16 = -536850432;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ service %d (ID: %lld) received kUSBDeviceCurrentConfiguration (messageType 0x%x)", (uint8_t *)&v11, 0x22u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(DOMDevice *)self properties];
      CFMutableDictionaryRef v10 = sub_100008FF4(v9);
      int v11 = 138412290;
      *(void *)v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "properties:\n%@", (uint8_t *)&v11, 0xCu);
    }
    if ([(DOMDevice *)self compositeDeviceIsConfigured])
    {
      uint64_t v7 = +[DOMAccessoryArbitrator sharedDomAccessoryArbitrator];
      [v7 matchDevice:self];
LABEL_12:
    }
  }
  else
  {
    if (a3 == -536870896)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [(DOMDevice *)self name];
        int v11 = 138413058;
        *(void *)v12 = v6;
        *(_WORD *)&v12[8] = 1024;
        *(_DWORD *)&v12[10] = [(DOMDevice *)self io_service];
        __int16 v13 = 2048;
        unint64_t v14 = [(DOMDevice *)self IORegEntryID];
        __int16 v15 = 1024;
        int v16 = -536870896;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ service %d (ID: %lld) was terminated (messageType 0x%x)", (uint8_t *)&v11, 0x22u);
      }
      uint64_t v7 = +[DOMAccessoryArbitrator sharedDomAccessoryArbitrator];
      [v7 unregisterOffendingDomDevice:self];
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109632;
      *(_DWORD *)v12 = [(DOMDevice *)self io_service];
      *(_WORD *)&v12[4] = 2048;
      *(void *)&v12[6] = [(DOMDevice *)self IORegEntryID];
      __int16 v13 = 1024;
      LODWORD(v14) = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "service %d (ID: %lld) got messageType: 0x%0x", (uint8_t *)&v11, 0x18u);
    }
  }
}

- (id)description
{
  memset(path, 0, 512);
  IORegistryEntryGetPath([(DOMDevice *)self io_service], "IOService", path);
  memset(className, 0, sizeof(className));
  IOObjectGetClass([(DOMDevice *)self io_service], className);
  uint64_t v3 = [(DOMDevice *)self name];
  unint64_t v4 = [(DOMDevice *)self IORegEntryID];
  unint64_t v5 = [(DOMDevice *)self IORegEntryID];
  uint64_t v6 = [(DOMDevice *)self properties];
  uint64_t v7 = sub_100008FF4(v6);
  uint64_t v8 = +[NSString stringWithFormat:@"DOMDevice named: \"%@\", IORegEntryID: %lld (0x%016llx), class: %s, properties: %@", v3, v4, v5, className, v7];

  return v8;
}

- (BOOL)isCompositeDevice
{
  uint64_t v3 = [(DOMDevice *)self properties];
  unint64_t v4 = [v3 valueForKey:@"bDeviceClass"];

  unint64_t v5 = [(DOMDevice *)self properties];
  uint64_t v6 = [v5 valueForKey:@"bDeviceSubclass"];

  BOOL v7 = 0;
  if (v4 && v6)
  {
    if ([v4 integerValue]) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = [v6 integerValue] == 0;
    }
  }

  return v7;
}

- (BOOL)compositeDeviceIsConfigured
{
  [(DOMDevice *)self updateDeviceProperties];
  uint64_t v3 = [(DOMDevice *)self properties];
  unint64_t v4 = [v3 valueForKey:@"kUSBCurrentConfiguration"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)evaluateScore:(id)a3 fromDomPersonality:(id)a4 withIORegEntryID:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    CFMutableDictionaryRef v10 = [(DOMDevice *)self queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000087E8;
    v11[3] = &unk_100010818;
    id v12 = v8;
    __int16 v13 = self;
    id v14 = v9;
    unint64_t v15 = a5;
    dispatch_sync(v10, v11);
  }
}

- (BOOL)shouldMatchDevice
{
  if ([(DOMDevice *)self isHub])
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v3) {
      return result;
    }
    BOOL v5 = [(DOMDevice *)self name];
    int v10 = 138412290;
    int v11 = v5;
    uint64_t v6 = "Ignoring a USB Hub named \"%@\"";
  }
  else
  {
    if ([(DOMDevice *)self isAttachedToHub]
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [(DOMDevice *)self name];
      int v10 = 138412290;
      int v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FYI, \"%@\" is attached to a USB Hub...", (uint8_t *)&v10, 0xCu);
    }
    if (![(DOMDevice *)self isCompositeDevice]
      || [(DOMDevice *)self compositeDeviceIsConfigured])
    {
      if (!+[DOMAccessoryArbitrator isInF5Mode]) {
        return 1;
      }
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v8) {
        return result;
      }
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running in F5 mode - suppressing device matching", (uint8_t *)&v10, 2u);
      return 0;
    }
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v9) {
      return result;
    }
    BOOL v5 = [(DOMDevice *)self name];
    int v10 = 138412290;
    int v11 = v5;
    uint64_t v6 = "deferring match for composite USB device named \"%@\"";
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, 0xCu);

  return 0;
}

- (BOOL)isHub
{
  return self->_isHub;
}

- (BOOL)isAttachedToHub
{
  return self->_isAttachedToHub;
}

- (BOOL)powerHog
{
  return self->_powerHog;
}

- (unint64_t)IORegEntryID
{
  return self->_IORegEntryID;
}

- (void)setIORegEntryID:(unint64_t)a3
{
  self->_IORegEntryID = a3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (OS_os_transaction)domDeviceTransaction
{
  return self->_domDeviceTransaction;
}

- (void)setDomDeviceTransaction:(id)a3
{
}

- (BOOL)tbtAccessoryWithIncompatibleCable
{
  return self->_tbtAccessoryWithIncompatibleCable;
}

- (BOOL)tbtAccessoryWithIncompatiblePort
{
  return self->_tbtAccessoryWithIncompatiblePort;
}

- (BOOL)isBillboardDevice
{
  return self->_isBillboardDevice;
}

- (BOOL)isThunderboltDevice
{
  return self->_isThunderboltDevice;
}

- (unsigned)io_service
{
  return self->_io_service;
}

- (void)setIo_service:(unsigned int)a3
{
  self->_io_object_t io_service = a3;
}

- (DOMPersonality)winningDomPersonality
{
  return self->_winningDomPersonality;
}

- (void)setWinningDomPersonality:(id)a3
{
}

- (unint64_t)winningIORegEntryID
{
  return self->_winningIORegEntryID;
}

- (void)setWinningIORegEntryID:(unint64_t)a3
{
  self->_winningIORegEntryID = a3;
}

- (NSNumber)winningScore
{
  return self->_winningScore;
}

- (void)setWinningScore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unsigned)io_notification
{
  return self->_io_notification;
}

- (void)setIo_notification:(unsigned int)a3
{
  self->_io_object_t io_notification = a3;
}

- (NSString)dialogTitleKey
{
  return self->_dialogTitleKey;
}

- (void)setDialogTitleKey:(id)a3
{
}

- (NSString)dialogBodyKey
{
  return self->_dialogBodyKey;
}

- (void)setDialogBodyKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogBodyKey, 0);
  objc_storeStrong((id *)&self->_dialogTitleKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_winningScore, 0);
  objc_storeStrong((id *)&self->_winningDomPersonality, 0);
  objc_storeStrong((id *)&self->_domDeviceTransaction, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end