@interface _GCLogitechRacingWheelDeviceManager
- (NSObject)identifier;
- (_GCDeviceRegistry)deviceRegistry;
- (_GCLogitechRacingWheelDeviceManager)init;
- (void)dealloc;
- (void)init;
- (void)setDeviceRegistry:(id)a3;
@end

@implementation _GCLogitechRacingWheelDeviceManager

- (_GCLogitechRacingWheelDeviceManager)init
{
  v30.receiver = self;
  v30.super_class = (Class)_GCLogitechRacingWheelDeviceManager;
  id v2 = [(_GCLogitechRacingWheelDeviceManager *)&v30 init];
  uint64_t v3 = gc_log_create_device("LogitechRacingWheel");
  v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  dispatch_queue_t v5 = dispatch_queue_create("LogitechRacingWheel.Manager", 0);
  v6 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v5;

  v7 = IONotificationPortCreate(kIOMainPortDefault);
  *((void *)v2 + 3) = v7;
  if (v7)
  {
    IONotificationPortSetDispatchQueue(v7, *((dispatch_queue_t *)v2 + 2));
  }
  else
  {
    v8 = *((void *)v2 + 1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[_GCLogitechRacingWheelDeviceManager init].cold.6(v8);
    }
  }
  if (*((void *)v2 + 3))
  {
    v9 = IOServiceMatching("IOUSBDevice");
    CFDictionarySetValue(v9, @"idVendor", &unk_26BEE2278);
    CFDictionarySetValue(v9, @"idProduct", &unk_26BEE2290);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v9, (IOServiceMatchingCallback)__USBDevicesMatched, v2, (io_iterator_t *)v2 + 8))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT)) {
        -[_GCLogitechRacingWheelDeviceManager init].cold.5();
      }
    }
    else
    {
      v10 = *((void *)v2 + 2);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke;
      block[3] = &unk_26BEC3CA8;
      id v29 = v2;
      dispatch_async(v10, block);
    }
    v11 = IOServiceMatching("IOHIDDevice");
    CFDictionarySetValue(v11, @"VendorID", &unk_26BEE2278);
    CFDictionarySetValue(v11, @"ProductID", &unk_26BEE22A8);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v11, (IOServiceMatchingCallback)__HIDDevicesMatched_0, v2, (io_iterator_t *)v2 + 9))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT)) {
        -[_GCLogitechRacingWheelDeviceManager init].cold.4();
      }
    }
    else
    {
      v12 = *((void *)v2 + 2);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke_21;
      v26[3] = &unk_26BEC3CA8;
      id v27 = v2;
      dispatch_async(v12, v26);
    }
    v13 = IOServiceMatching("IOUSBDevice");
    CFDictionarySetValue(v13, @"idVendor", &unk_26BEE2278);
    CFDictionarySetValue(v13, @"idProduct", &unk_26BEE22C0);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v13, (IOServiceMatchingCallback)__USBDevicesMatched, v2, (io_iterator_t *)v2 + 10))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT)) {
        -[_GCLogitechRacingWheelDeviceManager init]();
      }
    }
    else
    {
      v14 = *((void *)v2 + 2);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke_24;
      v24[3] = &unk_26BEC3CA8;
      id v25 = v2;
      dispatch_async(v14, v24);
    }
    v15 = IOServiceMatching("IOHIDDevice");
    CFDictionarySetValue(v15, @"VendorID", &unk_26BEE2278);
    CFDictionarySetValue(v15, @"ProductID", &unk_26BEE22D8);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)__HIDDevicesMatched_0, v2, (io_iterator_t *)v2 + 11))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT)) {
        -[_GCLogitechRacingWheelDeviceManager init]();
      }
    }
    else
    {
      v16 = *((void *)v2 + 2);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke_27;
      v22[3] = &unk_26BEC3CA8;
      id v23 = v2;
      dispatch_async(v16, v22);
    }
    v17 = IOServiceMatching("IOHIDDevice");
    CFDictionarySetValue(v17, @"VendorID", &unk_26BEE2278);
    CFDictionarySetValue(v17, @"ProductID", &unk_26BEE22F0);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v17, (IOServiceMatchingCallback)__HIDDevicesMatched_0, v2, (io_iterator_t *)v2 + 12))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT)) {
        -[_GCLogitechRacingWheelDeviceManager init]();
      }
    }
    else
    {
      v18 = *((void *)v2 + 2);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke_30;
      v20[3] = &unk_26BEC3CA8;
      id v21 = v2;
      dispatch_async(v18, v20);
    }
  }
  return (_GCLogitechRacingWheelDeviceManager *)v2;
}

- (void)dealloc
{
  io_object_t ioG923USBDeviceIterator = self->_ioG923USBDeviceIterator;
  if (ioG923USBDeviceIterator)
  {
    IOObjectRelease(ioG923USBDeviceIterator);
    self->_io_object_t ioG923USBDeviceIterator = 0;
  }
  io_object_t ioG923HIDDeviceIterator = self->_ioG923HIDDeviceIterator;
  if (ioG923HIDDeviceIterator)
  {
    IOObjectRelease(ioG923HIDDeviceIterator);
    self->_io_object_t ioG923HIDDeviceIterator = 0;
  }
  io_object_t ioG920USBDeviceIterator = self->_ioG920USBDeviceIterator;
  if (ioG920USBDeviceIterator)
  {
    IOObjectRelease(ioG920USBDeviceIterator);
    self->_io_object_t ioG920USBDeviceIterator = 0;
  }
  io_object_t ioG29PS4HIDDeviceIterator = self->_ioG29PS4HIDDeviceIterator;
  if (ioG29PS4HIDDeviceIterator)
  {
    IOObjectRelease(ioG29PS4HIDDeviceIterator);
    self->_io_object_t ioG29PS4HIDDeviceIterator = 0;
  }
  io_object_t ioG29PS3HIDDeviceIterator = self->_ioG29PS3HIDDeviceIterator;
  if (ioG29PS3HIDDeviceIterator)
  {
    IOObjectRelease(ioG29PS3HIDDeviceIterator);
    self->_io_object_t ioG29PS3HIDDeviceIterator = 0;
  }
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)_GCLogitechRacingWheelDeviceManager;
  [(_GCLogitechRacingWheelDeviceManager *)&v9 dealloc];
}

- (NSObject)identifier
{
  return @"LogitechRacingWheelDeviceManager";
}

- (_GCDeviceRegistry)deviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRegistry);

  return (_GCDeviceRegistry *)WeakRetained;
}

- (void)setDeviceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceRegistry);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20AD04000, log, OS_LOG_TYPE_FAULT, "Failed to create IONotificationPort.  Racing wheel runctionality.", v1, 2u);
}

@end