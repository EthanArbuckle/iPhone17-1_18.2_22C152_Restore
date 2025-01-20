@interface FMDBluetoothExtensionMain
- (FMDBluetoothDeviceDiscovering)discovery;
- (FMDExtAccessoryDelegateProtocol)hostProxy;
- (FMDExtBluetoothDiscoveryFactory)discoveryFactory;
- (FMDExtSoundController)soundController;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)connectionStatusForAccessory:(id)a3 withCompletion:(id)a4;
- (void)fetchAllAccessoriesInfoWithInfo:(id)a3 withCompletion:(id)a4;
- (void)forceConnectToAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5;
- (void)getStyleForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5;
- (void)playSoundForAccessory:(id)a3 info:(id)a4 duration:(double)a5 rampUpDuration:(double)a6 channels:(id)a7 withCompletion:(id)a8;
- (void)safetyAlertForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5;
- (void)setDiscovery:(id)a3;
- (void)setDiscoveryFactory:(id)a3;
- (void)setHostProxy:(id)a3;
- (void)setSoundController:(id)a3;
- (void)startDiscoveryForAccessory:(id)a3 duration:(double)a4 info:(id)a5 withCompletion:(id)a6;
- (void)stopDiscoveryForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5;
- (void)stopSoundForAccessory:(id)a3 info:(id)a4 rampDownDuration:(double)a5 withCompletion:(id)a6;
@end

@implementation FMDBluetoothExtensionMain

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v5 = sub_1000069F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "beginRequestWithExtensionCalled with context %@ and accessory provider = %@", (uint8_t *)&v13, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = sub_1000069F8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      int v13 = 138412290;
      id v14 = v7;
      id v8 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "beginRequestWithExtensionCalled with context %@", (uint8_t *)&v13, 0xCu);
    }
    [v4 setAccessoryProvider:self];
  }
  v9 = [v4 _auxiliaryConnection];
  v10 = [v9 remoteObjectProxy];
  v11 = v10;
  if (v10 && [v10 conformsToProtocol:&OBJC_PROTOCOL___FMDExtAccessoryDelegateProtocol])
  {
    [(FMDBluetoothExtensionMain *)self setHostProxy:v11];
  }
  else
  {
    v12 = sub_1000069F8();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000130E4((uint64_t)v11, v12);
    }
  }
}

- (void)fetchAllAccessoriesInfoWithInfo:(id)a3 withCompletion:(id)a4
{
  v28 = (void (**)(id, void *, void))a4;
  id v4 = +[FMDExtBluetoothManager pairedAppleAccessories];
  v5 = sub_1000069F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth manager paired devices %@", buf, 0xCu);
  }

  id v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v11 = sub_1000069F8();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = [v10 accessoryInfo];
          *(_DWORD *)buf = 138412290;
          id v36 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "bluetoothDevice %@", buf, 0xCu);
        }
        int v13 = [v10 address];
        id v14 = +[FMDExtHelper deviceIDFromAddress:v13];

        __int16 v15 = +[FMDExtHelper deviceTypeFromVendorId:productId:](FMDExtHelper, "deviceTypeFromVendorId:productId:", [v10 vendorId], objc_msgSend(v10, "productId"));
        v16 = [v10 accessoryInfo];
        v17 = [v16 objectForKeyedSubscript:@"AACPVersionInfo"];

        id v18 = objc_alloc_init((Class)FMDExtAccessoryInfo);
        [v18 setAccessoryIdentifier:v14];
        [v18 setAccessoryType:v15];
        v19 = [v10 name];
        [v18 setName:v19];

        [v18 setAdditionalInfo:0];
        v20 = [v10 address];
        [v18 setDeviceDiscoveryId:v20];

        id v21 = [v17 count];
        v22 = sub_1000069F8();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if ((unint64_t)v21 < 0xB)
        {
          if (v23)
          {
            id v25 = [v17 count];
            *(_DWORD *)buf = 134218242;
            id v36 = v25;
            __int16 v37 = 2112;
            v38 = v17;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "findmybluetotthExtension invalid info. Count: %lu, Values: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v23)
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "received valid AACPVersionInfo: %@", buf, 0xCu);
          }

          v24 = +[FMDExtHelper serialNumberFromVersionInfo:v17];
          [v18 setSerialNumbers:v24];

          v22 = [v17 objectAtIndexedSubscript:10];
          [v18 setFirmwareVersion:v22];
        }

        [v30 addObject:v18];
      }
      id v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v7);
  }

  v26 = sub_1000069F8();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v30;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Bluetooth manager paired devices %@", buf, 0xCu);
  }

  v27 = +[NSArray arrayWithArray:v30];
  v28[2](v28, v27, 0);
}

- (void)connectionStatusForAccessory:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, void))a4;
  id v7 = +[FMDExtBluetoothManager pairedAccessoryWithID:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 connected];
    v10 = sub_1000069F8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v8 name];
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      __int16 v17 = 1024;
      int v18 = (int)v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bluetooth accessory %@ connection status = %u", buf, 0x12u);
    }
    v6[2](v6, v9, 0);
  }
  else
  {
    uint64_t v12 = +[NSString stringWithFormat:@"bluetooth accessory with identifier %@ not found", v5];
    int v13 = +[NSError errorWithMessage:v12];
    id v14 = sub_1000069F8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10001315C();
    }

    ((void (**)(id, id, void *))v6)[2](v6, 0, v13);
    id v6 = (void (**)(id, id, void))v12;
  }
}

- (void)forceConnectToAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, BOOL, void))a5;
  v10 = +[FMDExtBluetoothManager pairedAccessoryWithID:v7];
  if (v10)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:@"timeout"];
    double v12 = 0.5;
    if (v11)
    {
      int v13 = (void *)v11;
      id v14 = [v8 objectForKeyedSubscript:@"timeout"];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        v16 = [v8 objectForKeyedSubscript:@"timeout"];
        [v16 doubleValue];
        double v12 = v17;
      }
    }
    uint64_t v18 = [v8 objectForKeyedSubscript:@"retryCount"];
    if (v18
      && (v19 = (void *)v18,
          [v8 objectForKeyedSubscript:@"retryCount"],
          v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = objc_opt_respondsToSelector(),
          v20,
          v19,
          (v21 & 1) != 0))
    {
      v22 = [v8 objectForKeyedSubscript:@"retryCount"];
      int v23 = [v22 intValue];
    }
    else
    {
      int v23 = 10;
    }
    v24 = sub_1000069F8();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v10 name];
      *(_DWORD *)buf = 138412802;
      v39 = v25;
      __int16 v40 = 2048;
      double v41 = v12;
      __int16 v42 = 1024;
      int v43 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Accessory %@ connection timeout = %lf retryCount %d", buf, 0x1Cu);
    }
    v26 = +[FMDExtBluetoothManager currentInstance];
    [v26 connectDevice:v10];

    if (v23 >= 1)
    {
      if ([v10 connected])
      {
        double v27 = 0.0;
        BOOL v28 = 1;
LABEL_21:
        long long v33 = sub_1000069F8();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          long long v34 = [v10 name];
          *(_DWORD *)buf = 138412546;
          v39 = v34;
          __int16 v40 = 2048;
          double v41 = v12 * v27;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Accessory %@ connected after %f", buf, 0x16u);
        }
        v35 = sub_1000069F8();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = [v10 name];
          *(_DWORD *)buf = 138412290;
          v39 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Bluetooth accessory %@ force connection success", buf, 0xCu);
        }
        goto LABEL_28;
      }
      int v32 = 0;
      while (1)
      {
        +[NSThread sleepForTimeInterval:v12];
        if (v23 - 1 == v32) {
          break;
        }
        ++v32;
        if ([v10 connected])
        {
          BOOL v28 = v32 < v23;
          double v27 = (double)v32;
          goto LABEL_21;
        }
      }
    }
    v35 = sub_1000069F8();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v37 = [v10 name];
      *(_DWORD *)buf = 138412290;
      v39 = v37;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Bluetooth accessory %@ force connection failed", buf, 0xCu);
    }
    BOOL v28 = 0;
LABEL_28:

    v9[2](v9, v28, 0);
    goto LABEL_29;
  }
  v29 = +[NSString stringWithFormat:@"bluetooth accessory with identifier %@ not found", v7];
  id v30 = +[NSError errorWithMessage:v29];
  long long v31 = sub_1000069F8();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_1000131D0();
  }

  ((void (**)(id, BOOL, void *))v9)[2](v9, 0, v30);
LABEL_29:
}

- (void)getStyleForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  v10 = +[FMDExtBluetoothManager pairedAccessoryWithID:v7];
  if (!v10)
  {
    double v17 = +[NSString stringWithFormat:@"bluetooth accessory with identifier %@ not found", v7];
    uint64_t v18 = +[NSError errorWithMessage:v17];
    v19 = sub_1000069F8();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100013244();
    }
    goto LABEL_14;
  }
  unsigned int v25 = 0;
  if (+[FMDBluetoothFrameworkBTManagingFactory isAutomationActive])
  {
    uint64_t v11 = [v10 accessoryInfo];
    double v12 = [v11 objectForKeyedSubscript:@"color"];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = [v10 accessoryInfo];
      char v15 = [v14 objectForKeyedSubscript:@"color"];
      unsigned int v25 = [v15 unsignedIntValue];

      uint64_t DeviceColor = 0;
    }
    else
    {
      uint64_t DeviceColor = 1;
    }
  }
  else
  {
    [v10 device];
    +[FMDExtBluetoothManager getAccessoryManager];
    uint64_t DeviceColor = BTAccessoryManagerGetDeviceColor();
  }
  v20 = sub_1000069F8();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    char v21 = [v10 name];
    *(_DWORD *)buf = 138412546;
    double v27 = v21;
    __int16 v28 = 1024;
    unsigned int v29 = v25;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "color for accessory %@ = %u", buf, 0x12u);
  }
  if (DeviceColor)
  {
    v22 = [v10 name];
    double v17 = +[NSString stringWithFormat:@"Failed to get color for accessory %@ with error code %d", v22, DeviceColor];

    uint64_t v18 = +[NSError errorWithMessage:v17];
    v19 = sub_1000069F8();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100013244();
    }
LABEL_14:

    v9[2](v9, 0, v18);
    goto LABEL_15;
  }
  double v17 = +[FMDExtHelper parseStyle:v25 info:v8];
  if (v17)
  {
    ((void (**)(id, void *, void *))v9)[2](v9, v17, 0);
    goto LABEL_16;
  }
  uint64_t v18 = +[NSString stringWithFormat:@"parsing failed %u %@", v25, v8];
  int v23 = +[NSError errorWithMessage:v18];
  v24 = sub_1000069F8();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_1000132B8();
  }

  v9[2](v9, 0, v23);
LABEL_15:

LABEL_16:
}

- (void)safetyAlertForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL, const __CFString *, void))a5;
  id v8 = +[FMDExtBluetoothManager pairedAccessoryWithID:v6];
  id v9 = v8;
  if (v8)
  {
    unsigned int v10 = [v8 inEarDetectEnabled];
    uint64_t v11 = sub_1000069F8();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        char v13 = [v9 name];
        *(_DWORD *)buf = 138412290;
        id v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "In ear detection available for accessory %@", buf, 0xCu);
      }
      int v22 = 3;
      int v23 = 3;
      [v9 inEarStatusPrimary:&v23 secondary:&v22];
      id v14 = sub_1000069F8();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v25 = v6;
        __int16 v26 = 1024;
        int v27 = v23;
        __int16 v28 = 1024;
        int v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "accessory %@ primaryEarStatus %u secondaryEarStatus = %u", buf, 0x18u);
      }

      if (v23 != 3 && v22 != 3) {
        CFStringRef v15 = @"Safe";
      }
      else {
        CFStringRef v15 = @"Unknown";
      }
      if (v23 != 0 && v22 != 0) {
        CFStringRef v16 = v15;
      }
      else {
        CFStringRef v16 = @"InEar";
      }
      BOOL v17 = v23 != 0 && v22 != 0 && v23 != 3 && v22 != 3;
    }
    else
    {
      if (v12)
      {
        char v21 = [v9 name];
        *(_DWORD *)buf = 138412290;
        id v25 = v21;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "In ear detection not available for accessory %@", buf, 0xCu);
      }
      BOOL v17 = 0;
      CFStringRef v16 = @"InEarDetectUnavailable";
    }
    v7[2](v7, v17, v16, 0);
  }
  else
  {
    uint64_t v18 = +[NSString stringWithFormat:@"bluetooth accessory with identifier %@ not found", v6];
    v19 = +[NSError errorWithMessage:v18];
    v20 = sub_1000069F8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10001332C();
    }

    ((void (**)(id, BOOL, const __CFString *, void *))v7)[2](v7, 0, @"Unavailable", v19);
    id v7 = (void (**)(id, BOOL, const __CFString *, void))v18;
  }
}

- (void)startDiscoveryForAccessory:(id)a3 duration:(double)a4 info:(id)a5 withCompletion:(id)a6
{
  id v9 = a3;
  unsigned int v10 = (void (**)(id, void))a6;
  uint64_t v11 = +[FMDExtBluetoothManager pairedAccessoryWithID:v9];
  if (v11)
  {
    BOOL v12 = [(FMDBluetoothExtensionMain *)self discoveryFactory];

    if (!v12)
    {
      char v13 = objc_alloc_init(FMDExtBluetoothDiscoveryFactory);
      [(FMDBluetoothExtensionMain *)self setDiscoveryFactory:v13];

      hostProxy = self->_hostProxy;
      CFStringRef v15 = [(FMDBluetoothExtensionMain *)self discoveryFactory];
      [v15 setDelegate:hostProxy];

      CFStringRef v16 = [(FMDBluetoothExtensionMain *)self discoveryFactory];
      [v16 setAccessoryId:v9];

      BOOL v17 = [v11 address];
      uint64_t v18 = [(FMDBluetoothExtensionMain *)self discoveryFactory];
      [v18 setAddress:v17];
    }
    v19 = [(FMDBluetoothExtensionMain *)self discoveryFactory];
    id v20 = [v19 newDiscovery];
    [(FMDBluetoothExtensionMain *)self setDiscovery:v20];

    char v21 = sub_1000069F8();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v27 = a4;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "starting discovery for %lf", buf, 0xCu);
    }

    int v22 = [(FMDBluetoothExtensionMain *)self discovery];
    [v22 startDiscoveryForDuration:a4];

    v10[2](v10, 0);
  }
  else
  {
    uint64_t v23 = +[NSString stringWithFormat:@"bluetooth accessory with identifier %@ not found", v9];
    v24 = +[NSError errorWithMessage:v23];
    id v25 = sub_100006A90();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000133A0();
    }

    ((void (**)(id, void *))v10)[2](v10, v24);
    unsigned int v10 = (void (**)(id, void))v23;
  }
}

- (void)stopDiscoveryForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  uint64_t v9 = [(FMDBluetoothExtensionMain *)self discoveryFactory];
  if (v9)
  {
    unsigned int v10 = (void *)v9;
    uint64_t v11 = [(FMDBluetoothExtensionMain *)self discovery];

    if (v11)
    {
      BOOL v12 = [(FMDBluetoothExtensionMain *)self discoveryFactory];
      char v13 = [v12 accessoryId];
      unsigned int v14 = [v13 isEqualToString:v7];

      if (v14)
      {
        CFStringRef v15 = [(FMDBluetoothExtensionMain *)self discovery];
        [v15 stopDiscovery];

        [(FMDBluetoothExtensionMain *)self setDiscovery:0];
        [(FMDBluetoothExtensionMain *)self setDiscoveryFactory:0];
      }
      else
      {
        CFStringRef v16 = sub_1000069F8();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100013414((uint64_t)v7, self, v16);
        }
      }
    }
  }
  v8[2](v8, 0);
}

- (void)playSoundForAccessory:(id)a3 info:(id)a4 duration:(double)a5 rampUpDuration:(double)a6 channels:(id)a7 withCompletion:(id)a8
{
  id v13 = a3;
  id v42 = a4;
  id v14 = a7;
  CFStringRef v15 = (void (**)(id, void *))a8;
  CFStringRef v16 = sub_100006A90();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = +[NSDate date];
    *(_DWORD *)buf = 138412546;
    uint64_t v44 = (uint64_t)v17;
    __int16 v45 = 2112;
    v46 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PLAY_SOUND play sound started at %@ by %@", buf, 0x16u);
  }
  uint64_t v18 = +[FMDExtBluetoothManager pairedAccessoryWithID:v13];
  if (v18)
  {
    id v19 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v13];
    id v20 = [v18 address];
    uint64_t v21 = [v42 objectForKeyedSubscript:@"soundFileID"];
    __int16 v40 = (void *)v21;
    if (v21)
    {
      uint64_t v22 = v21;
      id v39 = v14;
      uint64_t v23 = sub_100006A90();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "got soundFileID = %@", buf, 0xCu);
      }

      v24 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
      id v25 = [v24 pathForResource:v22 ofType:@"wav"];
      if (v25)
      {
        uint64_t v26 = +[NSURL fileURLWithPath:v25];
        double v27 = sub_100006A90();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v28 = (FMDBluetoothExtensionMain *)v26;
          uint64_t v44 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "got audioURL = %@", buf, 0xCu);
        }
        else
        {
          __int16 v28 = (FMDBluetoothExtensionMain *)v26;
        }
      }
      else
      {
        double v27 = sub_100006A90();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10001354C((uint64_t)v40, v27);
        }
        __int16 v28 = 0;
      }

      id v14 = v39;
    }
    else
    {
      __int16 v28 = 0;
    }
    id v30 = [v42 objectForKeyedSubscript:@"supportsChangingListeningMode"];
    if (v30)
    {
      long long v31 = v15;
      id v32 = v14;
      long long v33 = [v42 objectForKeyedSubscript:@"supportsChangingListeningMode"];
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        v35 = [v42 objectForKeyedSubscript:@"supportsChangingListeningMode"];
        id v30 = [v35 BOOLValue];
      }
      else
      {
        id v30 = 0;
      }
      id v14 = v32;
      CFStringRef v15 = v31;
    }
    id v36 = [objc_alloc((Class)FMDGenericAudioAccessory) initWithAccessoryId:v19 audioRoutingIdentifier:v20 audioURL:v28 audioAccessoryInfo:0 supportsChangingListeningMode:v30];
    __int16 v37 = sub_100006A90();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = (uint64_t)v14;
      __int16 v45 = 2112;
      v46 = v28;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "play sound with chanels %@ and audio url %@", buf, 0x16u);
    }

    v38 = [(FMDBluetoothExtensionMain *)self soundController];
    [v38 startPlayingSoundForAccessory:v36 duration:v14 rampUpDuration:v15 channels:a5 completion:a6];
  }
  else
  {
    id v19 = +[NSString stringWithFormat:@"bluetooth accessory with identifier %@ not found", v13];
    id v20 = +[NSError errorWithMessage:v19];
    int v29 = sub_100006A90();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000134D8();
    }

    v15[2](v15, v20);
  }
}

- (void)stopSoundForAccessory:(id)a3 info:(id)a4 rampDownDuration:(double)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = (void (**)(id, void *))a6;
  id v13 = sub_100006A90();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = +[NSDate date];
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    __int16 v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "STOP_SOUND stop sound started at %@ %@", buf, 0x16u);
  }
  CFStringRef v15 = +[FMDExtBluetoothManager pairedAccessoryWithID:v10];
  if (v15)
  {
    id v16 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v10];
    BOOL v17 = [v15 address];
    id v18 = [v11 objectForKeyedSubscript:@"supportsChangingListeningMode"];
    if (v18)
    {
      id v19 = [v11 objectForKeyedSubscript:@"supportsChangingListeningMode"];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        uint64_t v21 = [v11 objectForKeyedSubscript:@"supportsChangingListeningMode"];
        id v18 = [v21 BOOLValue];
      }
      else
      {
        id v18 = 0;
      }
    }
    id v23 = [objc_alloc((Class)FMDGenericAudioAccessory) initWithAccessoryId:v16 audioRoutingIdentifier:v17 audioURL:0 audioAccessoryInfo:0 supportsChangingListeningMode:v18];
    v24 = [(FMDBluetoothExtensionMain *)self soundController];
    [v24 stopPlayingSoundForAccessory:v23 rampDownDuration:v12 completion:a5];
  }
  else
  {
    id v16 = +[NSString stringWithFormat:@"bluetooth accessory with identifier %@ not found", v10];
    BOOL v17 = +[NSError errorWithMessage:v16];
    uint64_t v22 = sub_1000069F8();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000135C4();
    }

    v12[2](v12, v17);
  }
}

- (FMDExtSoundController)soundController
{
  soundController = self->_soundController;
  if (!soundController)
  {
    id v4 = objc_alloc_init(FMDExtSoundController);
    id v5 = self->_soundController;
    self->_soundController = v4;

    soundController = self->_soundController;
  }

  return soundController;
}

- (void)setSoundController:(id)a3
{
}

- (FMDExtAccessoryDelegateProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
}

- (FMDExtBluetoothDiscoveryFactory)discoveryFactory
{
  return self->_discoveryFactory;
}

- (void)setDiscoveryFactory:(id)a3
{
}

- (FMDBluetoothDeviceDiscovering)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_discoveryFactory, 0);
  objc_storeStrong((id *)&self->_hostProxy, 0);

  objc_storeStrong((id *)&self->_soundController, 0);
}

@end