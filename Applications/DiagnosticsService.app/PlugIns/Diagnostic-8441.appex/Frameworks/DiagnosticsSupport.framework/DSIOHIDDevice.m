@interface DSIOHIDDevice
+ (id)deviceMatchingAccessories:(id)a3;
+ (id)deviceMatchingAccessories:(id)a3 identifierMask:(unint64_t)a4;
+ (id)deviceWithAccessory:(unint64_t)a3;
+ (id)deviceWithAccessory:(unint64_t)a3 identifierMask:(unint64_t)a4;
- (BOOL)reportWithID:(int64_t)a3 reportType:(int)a4 object:(char *)a5 length:(int64_t *)a6;
- (DSIOHIDDevice)initWithDeviceIdentifiers:(id)a3 identifierMask:(unint64_t)a4;
- (id)_sharedSerialQueue;
- (id)serialNumber;
- (id)stringFromHIDReport:(int64_t)a3;
- (unint64_t)deviceModel;
- (void)dealloc;
- (void)serialNumber;
@end

@implementation DSIOHIDDevice

+ (id)deviceWithAccessory:(unint64_t)a3
{
  return +[DSIOHIDDevice deviceWithAccessory:a3 identifierMask:-1];
}

+ (id)deviceWithAccessory:(unint64_t)a3 identifierMask:(unint64_t)a4
{
  v6 = +[DSIODeviceIdentifier identifierForAccessoryModel:a3];
  id v7 = objc_alloc((Class)a1);
  v11 = v6;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];
  id v9 = [v7 initWithDeviceIdentifiers:v8 identifierMask:a4];

  return v9;
}

+ (id)deviceMatchingAccessories:(id)a3
{
  return +[DSIOHIDDevice deviceMatchingAccessories:a3 identifierMask:-1];
}

+ (id)deviceMatchingAccessories:(id)a3 identifierMask:(unint64_t)a4
{
  v16 = (objc_class *)a1;
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [DSIODeviceIdentifier identifierForAccessoryModel:[v11 intValue]];
        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          v13 = DiagnosticLogHandleForCategory(6);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "Identifier not found for accessory %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  id v14 = [[v16 alloc] initWithDeviceIdentifiers:v5 identifierMask:a4];

  return v14;
}

- (DSIOHIDDevice)initWithDeviceIdentifiers:(id)a3 identifierMask:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)DSIOHIDDevice;
  id v7 = [(DSIOHIDDevice *)&v41 init];
  if (!v7)
  {
LABEL_36:
    v30 = v7;
    goto LABEL_40;
  }
  id v8 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
  v35 = v7;
  v7->_manager = v8;
  IOHIDManagerOpen(v8, 0);
  uint64_t v9 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v34 = v6;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v38;
  do
  {
    v13 = 0;
    do
    {
      if (*(void *)v38 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v13);
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      if (v4)
      {
        long long v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 usagePage]);
        [v15 setObject:v18 forKeyedSubscript:@"DeviceUsagePage"];

        if ((v4 & 2) == 0)
        {
LABEL_9:
          if ((v4 & 4) == 0) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
      else if ((v4 & 2) == 0)
      {
        goto LABEL_9;
      }
      long long v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 usage]);
      [v15 setObject:v19 forKeyedSubscript:@"DeviceUsage"];

      if ((v4 & 4) == 0)
      {
LABEL_10:
        if ((v4 & 8) == 0) {
          goto LABEL_12;
        }
LABEL_11:
        v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 productID]);
        [v15 setObject:v16 forKeyedSubscript:@"ProductID"];

        goto LABEL_12;
      }
LABEL_16:
      long long v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 vendorID]);
      [v15 setObject:v20 forKeyedSubscript:@"VendorID"];

      if ((v4 & 8) != 0) {
        goto LABEL_11;
      }
LABEL_12:
      id v17 = [v15 copy];
      [v9 addObject:v17];

      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    id v21 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    id v11 = v21;
  }
  while (v21);
LABEL_19:

  id v7 = v35;
  manager = v35->_manager;
  if (!manager)
  {
    v24 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:]();
    }
    id v6 = v34;
    goto LABEL_33;
  }
  IOHIDManagerSetDeviceMatchingMultiple(manager, (CFArrayRef)v9);
  CFSetRef v23 = IOHIDManagerCopyDevices(v35->_manager);
  id v6 = v34;
  if (!v23)
  {
LABEL_34:
    if (!v35->_device)
    {
      v24 = DiagnosticLogHandleForCategory(6);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = obj;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Could not find accessory matching identifiers: %@", buf, 0xCu);
      }
      goto LABEL_39;
    }

    goto LABEL_36;
  }
  v24 = v23;
  if ((unint64_t)[(__CFSet *)v23 count] >= 2)
  {
    v25 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.4((uint64_t)obj, (uint64_t)v24, v25);
    }
  }
  v26 = (__IOHIDDevice *)[v24 anyObject];
  v35->_device = v26;
  if (!v26)
  {
LABEL_33:

    goto LABEL_34;
  }
  IOReturn v27 = IOHIDDeviceOpen(v26, 0);
  if (v27)
  {
    int v28 = v27;
    v29 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:](v28, v29);
    }
    goto LABEL_29;
  }
  v32 = +[DSIODeviceIdentifier identifierForIOHIDDevice:v35->_device];
  if (v32)
  {
    v33 = v32;
    v35->_deviceModel = (unint64_t)[v32 accessoryModel];

    goto LABEL_33;
  }
  v29 = DiagnosticLogHandleForCategory(6);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:]();
  }
LABEL_29:

LABEL_39:
  v30 = 0;
LABEL_40:

  return v30;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Unable to close device.", v2, v3, v4, v5, v6);
}

- (id)serialNumber
{
  CFTypeRef Property = IOHIDDeviceGetProperty(self->_device, @"SerialNumber");
  if (Property)
  {
    uint64_t v3 = (void *)Property;
    CFTypeID v4 = CFGetTypeID(Property);
    if (v4 == CFStringGetTypeID())
    {
      id v5 = v3;
      goto LABEL_13;
    }
    CFTypeID v7 = CFGetTypeID(v3);
    if (v7 == CFNumberGetTypeID())
    {
      id v5 = +[NSString stringWithFormat:@"%@", v3];
      goto LABEL_13;
    }
    id v8 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(DSIOHIDDevice *)v3 serialNumber];
    }
  }
  else
  {
    uint8_t v6 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DSIOHIDDevice serialNumber]();
    }
  }
  id v5 = 0;
LABEL_13:

  return v5;
}

- (id)stringFromHIDReport:(int64_t)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  objc_initWeak(&location, self);
  id v5 = [(DSIOHIDDevice *)self _sharedSerialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __37__DSIOHIDDevice_stringFromHIDReport___block_invoke;
  v8[3] = &unk_181A0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  v8[4] = &v11;
  dispatch_sync(v5, v8);

  id v6 = (id)v12[5];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __37__DSIOHIDDevice_stringFromHIDReport___block_invoke(uint64_t a1)
{
  char v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFIndex pReportLength = 129;
  *(_OWORD *)report = 0u;
  long long v9 = 0u;
  WeakRetained = (IOHIDDeviceRef *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained
    && IOHIDDeviceGetReport(WeakRetained[2], kIOHIDReportTypeFeature, *(void *)(a1 + 48), report, &pReportLength))
  {
    CFTypeID v4 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37__DSIOHIDDevice_stringFromHIDReport___block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = [objc_alloc((Class)NSString) initWithBytes:&report[1] length:strnlen((const char *)&report[1], 0x80uLL) encoding:4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    CFTypeID v4 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (BOOL)reportWithID:(int64_t)a3 reportType:(int)a4 object:(char *)a5 length:(int64_t *)a6
{
  objc_initWeak(&location, self);
  uint64_t v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x2020000000;
  int v20 = 0;
  long long v11 = [(DSIOHIDDevice *)self _sharedSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __55__DSIOHIDDevice_reportWithID_reportType_object_length___block_invoke;
  block[3] = &unk_181C8;
  objc_copyWeak(v16, &location);
  int v17 = a4;
  block[4] = &v18;
  v16[1] = (id)a3;
  v16[2] = a5;
  v16[3] = a6;
  dispatch_sync(v11, block);

  if (*(_DWORD *)(v19[0] + 24))
  {
    long long v12 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DSIOHIDDevice reportWithID:reportType:object:length:]((uint64_t)v19, v12);
    }

    char v13 = *(_DWORD *)(v19[0] + 24) == 0;
  }
  else
  {
    char v13 = 1;
  }
  objc_destroyWeak(v16);
  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);
  return v13;
}

void __55__DSIOHIDDevice_reportWithID_reportType_object_length___block_invoke(uint64_t a1)
{
  WeakRetained = (IOHIDDeviceRef *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOHIDDeviceGetReport(WeakRetained[2], *(IOHIDReportType *)(a1 + 72), *(void *)(a1 + 48), *(uint8_t **)(a1 + 56), *(CFIndex **)(a1 + 64));
    WeakRetained = v3;
  }
}

- (id)_sharedSerialQueue
{
  if (_sharedSerialQueue_onceToken != -1) {
    dispatch_once(&_sharedSerialQueue_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)_sharedSerialQueue_serialQueue;

  return v2;
}

void __35__DSIOHIDDevice__sharedSerialQueue__block_invoke(id a1)
{
  _sharedSerialQueue_serialQueue = (uint64_t)dispatch_queue_create("DSIOHIDDevice report", 0);

  _objc_release_x1();
}

- (unint64_t)deviceModel
{
  return self->_deviceModel;
}

- (void)initWithDeviceIdentifiers:identifierMask:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Cannot open IOHIDManager.", v2, v3, v4, v5, v6);
}

- (void)initWithDeviceIdentifiers:identifierMask:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "identifierForIOHIDDevice unexpectedly returned nil", v2, v3, v4, v5, v6);
}

- (void)initWithDeviceIdentifiers:(int)a1 identifierMask:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to open IOHIDDevice %d", (uint8_t *)v2, 8u);
}

- (void)initWithDeviceIdentifiers:(os_log_t)log identifierMask:.cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Multiple devices found when matching identifiers (%@) to devices (%@); using one",
    (uint8_t *)&v3,
    0x16u);
}

- (void)serialNumber
{
  int v3 = 134217984;
  CFTypeID v4 = CFGetTypeID(a1);
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to parse serial number with type = %lu.", (uint8_t *)&v3, 0xCu);
}

void __37__DSIOHIDDevice_stringFromHIDReport___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Unable to retieve HID report.", v2, v3, v4, v5, v6);
}

- (void)reportWithID:(uint64_t)a1 reportType:(NSObject *)a2 object:length:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to retieve HID report. Status code: %d", (uint8_t *)v3, 8u);
}

@end