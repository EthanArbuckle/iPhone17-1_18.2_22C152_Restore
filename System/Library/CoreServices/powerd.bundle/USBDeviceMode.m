@interface USBDeviceMode
+ (id)sharedInstance;
- (BOOL)isACPowered;
- (BOOL)isDeviceMode;
- (BOOL)powerassertion;
- (BOOL)readBootArgOverride;
- (BOOL)start;
- (BOOL)startMatchingNotifications;
- (IONotificationPort)ioNotificationPort;
- (NSMutableDictionary)dataRole;
- (NSMutableDictionary)transportNotifiers;
- (OS_dispatch_queue)queue;
- (ResourceHint)usbDeviceModeResourceHint;
- (USBDeviceMode)init;
- (unsigned)ioServiceAddedIterator;
- (unsigned)powerassertionID;
- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
- (void)_handleServiceAdded:(unsigned int)a3;
- (void)acquirePowerAssertion;
- (void)dealloc;
- (void)evaluatePowerAssertion;
- (void)registerForPowerSourceUpdates;
- (void)releasePowerAssertion;
- (void)setDataRole:(id)a3;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIoServiceAddedIterator:(unsigned int)a3;
- (void)setIsACPowered:(BOOL)a3;
- (void)setPowerassertion:(BOOL)a3;
- (void)setPowerassertionID:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setTransportNotifiers:(id)a3;
- (void)setUsbDeviceModeResourceHint:(id)a3;
- (void)stopMatchingNotifications;
@end

@implementation USBDeviceMode

+ (id)sharedInstance
{
  if (qword_1000A4F00 != -1) {
    dispatch_once(&qword_1000A4F00, &stru_100092CA0);
  }
  v2 = (void *)qword_1000A4EF8;

  return v2;
}

- (USBDeviceMode)init
{
  v13.receiver = self;
  v13.super_class = (Class)USBDeviceMode;
  v2 = [(USBDeviceMode *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.powerd.usbdevicemode", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_ioNotificationPort = 0;
    v2->_ioServiceAddedIterator = 0;
    uint64_t v6 = +[NSMutableDictionary dictionary];
    transportNotifiers = v2->_transportNotifiers;
    v2->_transportNotifiers = (NSMutableDictionary *)v6;

    os_log_t v8 = os_log_create("com.apple.powerd", "usbdevicemode");
    v9 = (void *)qword_1000A45E8;
    qword_1000A45E8 = (uint64_t)v8;

    v2->_powerassertionID = 0;
    v2->_powerassertion = 0;
    uint64_t v10 = +[NSMutableDictionary dictionary];
    dataRole = v2->_dataRole;
    v2->_dataRole = (NSMutableDictionary *)v10;

    v2->_isACPowered = IOPSDrawingUnlimitedPower();
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)qword_1000A45E8;
  if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deallocating %@...", buf, 0xCu);
  }
  [(USBDeviceMode *)self stopMatchingNotifications];
  v7.receiver = self;
  v7.super_class = (Class)USBDeviceMode;
  [(USBDeviceMode *)&v7 dealloc];
}

- (BOOL)start
{
  unsigned int v3 = [(USBDeviceMode *)self readBootArgOverride];
  if (v3)
  {
    dispatch_queue_t v4 = qword_1000A45E8;
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Boot arg enable-acsleep is set. Not preventing idle sleep for usb device mode", v6, 2u);
    }
  }
  else
  {
    [(USBDeviceMode *)self startMatchingNotifications];
    [(USBDeviceMode *)self registerForPowerSourceUpdates];
  }
  return v3 ^ 1;
}

- (void)registerForPowerSourceUpdates
{
  v2 = self;
  int out_token = 0;
  unsigned int v3 = [(USBDeviceMode *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100053188;
  v5[3] = &unk_1000911C0;
  v5[4] = v2;
  LODWORD(v2) = notify_register_dispatch("com.apple.system.powersources.source", &out_token, v3, v5);

  if (v2)
  {
    dispatch_queue_t v4 = qword_1000A45E8;
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_ERROR)) {
      sub_10006C2AC(v4);
    }
  }
}

- (BOOL)readBootArgOverride
{
  if (os_parse_boot_arg_int())
  {
    v2 = qword_1000A45E8;
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "enable-acsleep bootarg override %lld", buf, 0xCu);
    }
  }
  return 0;
}

- (BOOL)startMatchingNotifications
{
  kern_return_t v9;
  uint8_t v11[16];

  unsigned int v3 = qword_1000A45E8;
  if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Adding transport matching notifications", v11, 2u);
  }
  [(USBDeviceMode *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
  dispatch_queue_t v4 = [(USBDeviceMode *)self ioNotificationPort];
  uint64_t v5 = [(USBDeviceMode *)self queue];
  IONotificationPortSetDispatchQueue(v4, v5);

  CFMutableDictionaryRef v6 = IOServiceMatching("IOPortTransportStateUSB");
  [(__CFDictionary *)v6 setObject:&off_10009AAB0 forKey:@"IOPropertyMatch"];
  objc_super v7 = [(USBDeviceMode *)self ioNotificationPort];
  CFDictionaryRef v8 = v6;
  v9 = IOServiceAddMatchingNotification(v7, "IOServiceMatched", v8, (IOServiceMatchingCallback)sub_100053498, self, &self->_ioServiceAddedIterator);
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_ERROR)) {
      sub_10006C2F0();
    }
  }
  else
  {
    sub_100053498(self, [(USBDeviceMode *)self ioServiceAddedIterator]);
  }

  return v9 == 0;
}

- (void)stopMatchingNotifications
{
  unsigned int v3 = qword_1000A45E8;
  if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing transport matching notifications...", v4, 2u);
  }
  if ([(USBDeviceMode *)self ioServiceAddedIterator]) {
    IOObjectRelease([(USBDeviceMode *)self ioServiceAddedIterator]);
  }
  if ([(USBDeviceMode *)self ioNotificationPort]) {
    IONotificationPortDestroy([(USBDeviceMode *)self ioNotificationPort]);
  }
}

- (void)_handleServiceAdded:(unsigned int)a3
{
  uint64_t v5 = qword_1000A45E8;
  if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Service matching notification callback fired!", buf, 2u);
  }
  uint64_t entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_ERROR)) {
      sub_10006C43C();
    }
    goto LABEL_17;
  }
  CFMutableDictionaryRef v6 = [(USBDeviceMode *)self transportNotifiers];
  objc_super v7 = +[NSNumber numberWithUnsignedLongLong:entryID];
  CFDictionaryRef v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v19 = qword_1000A45E8;
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_ERROR)) {
      sub_10006C3C0((uint64_t *)&entryID, v19);
    }
LABEL_17:
    CFProperty = 0;
    goto LABEL_12;
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"TransportDescription", kCFAllocatorDefault, 0);
  uint64_t v10 = qword_1000A45E8;
  if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = CFProperty;
    __int16 v24 = 2048;
    uint64_t v25 = entryID;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding transport interest notifications for %@ (registryEntryID: %llu)", buf, 0x16u);
  }
  io_object_t notification = 0;
  if (IOServiceAddInterestNotification([(USBDeviceMode *)self ioNotificationPort], a3, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000538F4, self, &notification))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_ERROR)) {
      sub_10006C358();
    }
  }
  else
  {
    v11 = [(USBDeviceMode *)self transportNotifiers];
    v12 = +[NSNumber numberWithUnsignedInt:notification];
    objc_super v13 = +[NSNumber numberWithUnsignedLongLong:entryID];
    [v11 setObject:v12 forKey:v13];

    CFTypeRef v14 = IORegistryEntryCreateCFProperty(a3, @"DataRole", kCFAllocatorDefault, 0);
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [(USBDeviceMode *)self dataRole];
      v17 = +[NSNumber numberWithUnsignedLongLong:entryID];
      [v16 setObject:v15 forKey:v17];

      v18 = qword_1000A45E8;
      if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = entryID;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Initial datarole %@ for registryID %llu", buf, 0x16u);
      }
      [(USBDeviceMode *)self evaluatePowerAssertion];
    }
  }
LABEL_12:
}

- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  uint64_t entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_ERROR)) {
      sub_10006C43C();
    }
    CFProperty = 0;
  }
  else
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"TransportDescription", kCFAllocatorDefault, 0);
    v9 = qword_1000A45E8;
    if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v32 = a4;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = CFProperty;
      *(_WORD *)&v32[14] = 2048;
      *(void *)&v32[16] = entryID;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Transport message arrived! (messageType: 0x%08x, transportDescription: %@, registryEntryID: %llu)", buf, 0x1Cu);
    }
    if (a4 == -536870896)
    {
      v18 = qword_1000A45E8;
      if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v32 = -536870896;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = CFProperty;
        *(_WORD *)&v32[14] = 2048;
        *(void *)&v32[16] = entryID;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Transport terminated! (messageType: 0x%08x, transportDescription: %@, registryEntryID: %llu)", buf, 0x1Cu);
      }
      v19 = [(USBDeviceMode *)self transportNotifiers];
      v20 = +[NSNumber numberWithUnsignedLongLong:entryID];
      v21 = [v19 objectForKeyedSubscript:v20];

      if (v21)
      {
        v22 = [(USBDeviceMode *)self transportNotifiers];
        v23 = +[NSNumber numberWithUnsignedLongLong:entryID];
        [v22 removeObjectForKey:v23];

        __int16 v24 = [(USBDeviceMode *)self dataRole];
        uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:entryID];
        [v24 removeObjectForKey:v25];

        v26 = (void *)qword_1000A45E8;
        if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          v28 = [(USBDeviceMode *)self dataRole];
          *(_DWORD *)buf = 138412290;
          *(void *)v32 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Current date roles %@", buf, 0xCu);
        }
        io_object_t v29 = [v21 unsignedIntValue];
        if (v29) {
          IOObjectRelease(v29);
        }
        [(USBDeviceMode *)self releasePowerAssertion];
      }
    }
    else if (a4 == -536870608)
    {
      uint64_t v10 = (void *)IORegistryEntryCreateCFProperty(a3, @"DataRole", kCFAllocatorDefault, 0);
      if (v10)
      {
        v11 = [(USBDeviceMode *)self dataRole];
        v12 = +[NSNumber numberWithUnsignedLongLong:entryID];
        [v11 setObject:v10 forKey:v12];

        objc_super v13 = (void *)qword_1000A45E8;
        if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
        {
          CFTypeRef v14 = v13;
          v15 = [(USBDeviceMode *)self dataRole];
          *(_DWORD *)buf = 138412290;
          *(void *)v32 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current date roles %@", buf, 0xCu);
        }
        v16 = (void *)IORegistryEntryCreateCFProperty(a3, @"DataRoleDescription", kCFAllocatorDefault, 0);
        v17 = qword_1000A45E8;
        if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v32 = v10;
          *(_WORD *)&v32[8] = 2112;
          *(void *)&v32[10] = v16;
          *(_WORD *)&v32[18] = 2048;
          *(void *)&v32[20] = entryID;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "messageType: kIOMessageServicePropertyChange dataRole: %@ [%@] for registryID: %llu", buf, 0x20u);
        }
        [(USBDeviceMode *)self evaluatePowerAssertion];
      }
    }
  }
}

- (void)acquirePowerAssertion
{
  unsigned int v3 = sub_10005C968();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053E7C;
  block[3] = &unk_1000911E8;
  block[4] = self;
  dispatch_async(v3, block);

  dispatch_queue_t v4 = qword_1000A45E8;
  if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFDictionaryRef v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating USBDeviceMode resource hint", v8, 2u);
  }
  usbDeviceModeResourceHint = self->_usbDeviceModeResourceHint;
  if (usbDeviceModeResourceHint)
  {
    [usbDeviceModeResourceHint updateState:1];
  }
  else
  {
    CFMutableDictionaryRef v6 = (ResourceHint *)[objc_alloc((Class)ResourceHint) initWithResourceType:8 andState:1];
    objc_super v7 = self->_usbDeviceModeResourceHint;
    self->_usbDeviceModeResourceHint = v6;
  }
}

- (void)releasePowerAssertion
{
  unsigned int v3 = sub_10005C968();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000540A8;
  block[3] = &unk_1000911E8;
  block[4] = self;
  dispatch_async(v3, block);

  dispatch_queue_t v4 = qword_1000A45E8;
  if (os_log_type_enabled((os_log_t)qword_1000A45E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFMutableDictionaryRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing USBDeviceMode resource hint", v6, 2u);
  }
  usbDeviceModeResourceHint = self->_usbDeviceModeResourceHint;
  if (usbDeviceModeResourceHint) {
    [usbDeviceModeResourceHint updateState:0];
  }
}

- (BOOL)isDeviceMode
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v3 = [(USBDeviceMode *)self dataRole];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(USBDeviceMode *)self dataRole];
        v11 = [v10 objectForKeyedSubscript:v9];
        BOOL v12 = [v11 intValue] == 1;

        v6 |= v12;
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (void)evaluatePowerAssertion
{
  if ([(USBDeviceMode *)self isDeviceMode] && [(USBDeviceMode *)self isACPowered])
  {
    [(USBDeviceMode *)self acquirePowerAssertion];
  }
  else
  {
    [(USBDeviceMode *)self releasePowerAssertion];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIoNotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (unsigned)ioServiceAddedIterator
{
  return self->_ioServiceAddedIterator;
}

- (void)setIoServiceAddedIterator:(unsigned int)a3
{
  self->_ioServiceAddedIterator = a3;
}

- (NSMutableDictionary)transportNotifiers
{
  return self->_transportNotifiers;
}

- (void)setTransportNotifiers:(id)a3
{
}

- (unsigned)powerassertionID
{
  return self->_powerassertionID;
}

- (void)setPowerassertionID:(unsigned int)a3
{
  self->_powerassertionID = a3;
}

- (BOOL)powerassertion
{
  return self->_powerassertion;
}

- (void)setPowerassertion:(BOOL)a3
{
  self->_powerassertion = a3;
}

- (NSMutableDictionary)dataRole
{
  return self->_dataRole;
}

- (void)setDataRole:(id)a3
{
}

- (BOOL)isACPowered
{
  return self->_isACPowered;
}

- (void)setIsACPowered:(BOOL)a3
{
  self->_isACPowered = a3;
}

- (ResourceHint)usbDeviceModeResourceHint
{
  return self->_usbDeviceModeResourceHint;
}

- (void)setUsbDeviceModeResourceHint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usbDeviceModeResourceHint, 0);
  objc_storeStrong((id *)&self->_dataRole, 0);
  objc_storeStrong((id *)&self->_transportNotifiers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end