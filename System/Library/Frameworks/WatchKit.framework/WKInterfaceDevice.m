@interface WKInterfaceDevice
+ (id)currentDevice;
- (BOOL)addCachedImage:(id)a3 name:(id)a4;
- (BOOL)addCachedImageWithData:(id)a3 name:(id)a4;
- (BOOL)isBatteryMonitoringEnabled;
- (CGRect)screenBounds;
- (NSDictionary)cachedImages;
- (NSString)deviceLocalizedModel;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)deviceSystemName;
- (NSString)deviceSystemVersion;
- (NSString)localizedModel;
- (NSString)model;
- (NSString)name;
- (NSString)preferredContentSizeCategory;
- (NSString)systemName;
- (NSString)systemVersion;
- (double)screenScale;
- (float)batteryLevel;
- (int64_t)batteryState;
- (int64_t)crownOrientation;
- (int64_t)layoutDirection;
- (int64_t)wristLocation;
- (void)name;
- (void)removeAllCachedImages;
- (void)removeCachedImageWithName:(id)a3;
- (void)setBatteryMonitoringEnabled:(BOOL)a3;
- (void)setDeviceLocalizedModel:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceSystemName:(id)a3;
- (void)setDeviceSystemVersion:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setScreenBounds:(CGRect)a3;
- (void)setScreenScale:(double)a3;
- (void)systemName;
- (void)systemVersion;
@end

@implementation WKInterfaceDevice

+ (id)currentDevice
{
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)currentDevice___currentDevice;

  return v2;
}

void __34__WKInterfaceDevice_currentDevice__block_invoke()
{
  v0 = objc_alloc_init(WKInterfaceDevice);
  v1 = (void *)currentDevice___currentDevice;
  currentDevice___currentDevice = (uint64_t)v0;

  v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  v3 = [v2 getDevices];
  v4 = [v3 firstObject];

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v5 = (void *)getNRDevicePropertyMainScreenWidthSymbolLoc_ptr;
  uint64_t v35 = getNRDevicePropertyMainScreenWidthSymbolLoc_ptr;
  if (!getNRDevicePropertyMainScreenWidthSymbolLoc_ptr)
  {
    v6 = (void *)NanoRegistryLibrary();
    v33[3] = (uint64_t)dlsym(v6, "NRDevicePropertyMainScreenWidth");
    getNRDevicePropertyMainScreenWidthSymbolLoc_ptr = v33[3];
    v5 = (void *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v5) {
    __34__WKInterfaceDevice_currentDevice__block_invoke_cold_1();
  }
  v7 = [v4 valueForProperty:*v5];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v8 = (void *)getNRDevicePropertyMainScreenHeightSymbolLoc_ptr;
  uint64_t v35 = getNRDevicePropertyMainScreenHeightSymbolLoc_ptr;
  if (!getNRDevicePropertyMainScreenHeightSymbolLoc_ptr)
  {
    v9 = (void *)NanoRegistryLibrary();
    v33[3] = (uint64_t)dlsym(v9, "NRDevicePropertyMainScreenHeight");
    getNRDevicePropertyMainScreenHeightSymbolLoc_ptr = v33[3];
    v8 = (void *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v8) {
    __34__WKInterfaceDevice_currentDevice__block_invoke_cold_2();
  }
  v10 = [v4 valueForProperty:*v8];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v11 = (void *)getNRDevicePropertyScreenScaleSymbolLoc_ptr;
  uint64_t v35 = getNRDevicePropertyScreenScaleSymbolLoc_ptr;
  if (!getNRDevicePropertyScreenScaleSymbolLoc_ptr)
  {
    v12 = (void *)NanoRegistryLibrary();
    v33[3] = (uint64_t)dlsym(v12, "NRDevicePropertyScreenScale");
    getNRDevicePropertyScreenScaleSymbolLoc_ptr = v33[3];
    v11 = (void *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v11) {
    __34__WKInterfaceDevice_currentDevice__block_invoke_cold_3();
  }
  v13 = [v4 valueForProperty:*v11];
  v14 = v13;
  if (v13)
  {
    [v13 floatValue];
    double v16 = v15;
  }
  else
  {
    double v16 = 2.0;
  }
  [(id)currentDevice___currentDevice setScreenScale:v16];
  v17 = (double *)MEMORY[0x263F00148];
  if (v7)
  {
    [v7 floatValue];
    double v19 = v18;
    [(id)currentDevice___currentDevice screenScale];
    double v21 = v19 / v20;
  }
  else
  {
    double v21 = 156.0;
  }
  double v22 = *v17;
  double v23 = v17[1];
  double v24 = 195.0;
  if (v10)
  {
    [v10 floatValue];
    double v26 = v25;
    [(id)currentDevice___currentDevice screenScale];
    double v24 = v26 / v27;
  }
  objc_msgSend((id)currentDevice___currentDevice, "setScreenBounds:", v22, v23, v21, v24);
  [(id)currentDevice___currentDevice screenBounds];
  if (v28 < 195.0)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v29 = (void *)getUIContentSizeCategorySmallSymbolLoc_ptr;
    uint64_t v35 = getUIContentSizeCategorySmallSymbolLoc_ptr;
    if (!getUIContentSizeCategorySmallSymbolLoc_ptr)
    {
      v31 = (void *)UIKitLibrary();
      v33[3] = (uint64_t)dlsym(v31, "UIContentSizeCategorySmall");
      getUIContentSizeCategorySmallSymbolLoc_ptr = v33[3];
      v29 = (void *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v29) {
      __34__WKInterfaceDevice_currentDevice__block_invoke_cold_5();
    }
  }
  else
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v29 = (void *)getUIContentSizeCategoryLargeSymbolLoc_ptr;
    uint64_t v35 = getUIContentSizeCategoryLargeSymbolLoc_ptr;
    if (!getUIContentSizeCategoryLargeSymbolLoc_ptr)
    {
      v30 = (void *)UIKitLibrary();
      v33[3] = (uint64_t)dlsym(v30, "UIContentSizeCategoryLarge");
      getUIContentSizeCategoryLargeSymbolLoc_ptr = v33[3];
      v29 = (void *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v29) {
      __34__WKInterfaceDevice_currentDevice__block_invoke_cold_4();
    }
  }
  [(id)currentDevice___currentDevice setPreferredContentSizeCategory:*v29];
}

- (NSString)systemVersion
{
  deviceSystemVersion = self->_deviceSystemVersion;
  if (!deviceSystemVersion)
  {
    v4 = [getNRPairedDeviceRegistryClass() sharedInstance];
    v5 = [v4 getDevices];
    v6 = [v5 firstObject];

    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v7 = (id *)getNRDevicePropertySystemVersionSymbolLoc_ptr;
    uint64_t v16 = getNRDevicePropertySystemVersionSymbolLoc_ptr;
    if (!getNRDevicePropertySystemVersionSymbolLoc_ptr)
    {
      v8 = (void *)NanoRegistryLibrary();
      v14[3] = (uint64_t)dlsym(v8, "NRDevicePropertySystemVersion");
      getNRDevicePropertySystemVersionSymbolLoc_ptr = v14[3];
      v7 = (id *)v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v7) {
      -[WKInterfaceDevice systemVersion]();
    }
    id v9 = *v7;
    v10 = [v6 valueForProperty:v9];
    v11 = self->_deviceSystemVersion;
    self->_deviceSystemVersion = v10;

    deviceSystemVersion = self->_deviceSystemVersion;
  }

  return deviceSystemVersion;
}

- (NSString)name
{
  deviceName = self->_deviceName;
  if (!deviceName)
  {
    v4 = [getNRPairedDeviceRegistryClass() sharedInstance];
    v5 = [v4 getDevices];
    v6 = [v5 firstObject];

    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v7 = (id *)getNRDevicePropertyNameSymbolLoc_ptr;
    uint64_t v16 = getNRDevicePropertyNameSymbolLoc_ptr;
    if (!getNRDevicePropertyNameSymbolLoc_ptr)
    {
      v8 = (void *)NanoRegistryLibrary();
      v14[3] = (uint64_t)dlsym(v8, "NRDevicePropertyName");
      getNRDevicePropertyNameSymbolLoc_ptr = v14[3];
      v7 = (id *)v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v7) {
      -[WKInterfaceDevice name]();
    }
    id v9 = *v7;
    v10 = [v6 valueForProperty:v9];
    v11 = self->_deviceName;
    self->_deviceName = v10;

    deviceName = self->_deviceName;
  }

  return deviceName;
}

- (NSString)model
{
  deviceModel = self->_deviceModel;
  if (!deviceModel)
  {
    v4 = [getNRPairedDeviceRegistryClass() sharedInstance];
    v5 = [v4 getDevices];
    v6 = [v5 firstObject];

    v7 = getNRDevicePropertyLocalizedModel();
    v8 = [v6 valueForProperty:v7];
    id v9 = self->_deviceModel;
    self->_deviceModel = v8;

    deviceModel = self->_deviceModel;
  }

  return deviceModel;
}

- (NSString)localizedModel
{
  deviceLocalizedModel = self->_deviceLocalizedModel;
  if (!deviceLocalizedModel)
  {
    v4 = [getNRPairedDeviceRegistryClass() sharedInstance];
    v5 = [v4 getDevices];
    v6 = [v5 firstObject];

    v7 = getNRDevicePropertyLocalizedModel();
    v8 = [v6 valueForProperty:v7];
    id v9 = self->_deviceLocalizedModel;
    self->_deviceLocalizedModel = v8;

    deviceLocalizedModel = self->_deviceLocalizedModel;
  }

  return deviceLocalizedModel;
}

- (NSString)systemName
{
  deviceSystemName = self->_deviceSystemName;
  if (!deviceSystemName)
  {
    v4 = [getNRPairedDeviceRegistryClass() sharedInstance];
    v5 = [v4 getDevices];
    v6 = [v5 firstObject];

    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    v7 = (id *)getNRDevicePropertySystemNameSymbolLoc_ptr;
    uint64_t v17 = getNRDevicePropertySystemNameSymbolLoc_ptr;
    if (!getNRDevicePropertySystemNameSymbolLoc_ptr)
    {
      v8 = (void *)NanoRegistryLibrary();
      v15[3] = (uint64_t)dlsym(v8, "NRDevicePropertySystemName");
      getNRDevicePropertySystemNameSymbolLoc_ptr = v15[3];
      v7 = (id *)v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v7) {
      -[WKInterfaceDevice systemName]();
    }
    id v9 = *v7;
    v10 = [v6 valueForProperty:v9];
    v11 = self->_deviceSystemName;
    self->_deviceSystemName = v10;

    if ([(NSString *)self->_deviceSystemName isEqualToString:@"Watch OS"])
    {
      v12 = self->_deviceSystemName;
      self->_deviceSystemName = (NSString *)@"watchOS";
    }
    deviceSystemName = self->_deviceSystemName;
  }

  return deviceSystemName;
}

- (BOOL)addCachedImage:(id)a3 name:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = +[SPRemoteInterface SerializablePropertyValue:a3];
    v7 = +[SPCompanionAssetCache sharedInstance];
    v8 = (void *)[v5 copy];
    char v9 = [v7 addImageToPermanentCache:v6 withName:v8];
  }
  else
  {
    v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceDevice addCachedImage:name:]();
    }

    char v9 = 0;
  }

  return v9;
}

- (BOOL)addCachedImageWithData:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = +[SPCompanionAssetCache sharedInstance];
    v8 = (void *)[v5 copy];
    char v9 = (void *)[v6 copy];
    char v10 = [v7 addImageToPermanentCache:v8 withName:v9];
  }
  else
  {
    v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceDevice addCachedImageWithData:name:]();
    }

    char v10 = 0;
  }

  return v10;
}

- (void)removeCachedImageWithName:(id)a3
{
  id v3 = a3;
  id v5 = +[SPCompanionAssetCache sharedInstance];
  v4 = (void *)[v3 copy];

  [v5 removeImageFromPermanentCacheWithName:v4];
}

- (void)removeAllCachedImages
{
  id v2 = +[SPCompanionAssetCache sharedInstance];
  [v2 removeAllImagesFromPermanentCache];
}

- (NSDictionary)cachedImages
{
  id v2 = +[SPCompanionAssetCache sharedInstance];
  id v3 = [v2 cachedImages];

  return (NSDictionary *)v3;
}

- (CGRect)screenBounds
{
  double x = self->_screenBounds.origin.x;
  double y = self->_screenBounds.origin.y;
  double width = self->_screenBounds.size.width;
  double height = self->_screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScreenBounds:(CGRect)a3
{
  self->_screenBounds = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (BOOL)isBatteryMonitoringEnabled
{
  return self->_batteryMonitoringEnabled;
}

- (void)setBatteryMonitoringEnabled:(BOOL)a3
{
  self->_batteryMonitoringEnabled = a3;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (int64_t)batteryState
{
  return self->_batteryState;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)wristLocation
{
  return self->_wristLocation;
}

- (int64_t)crownOrientation
{
  return self->_crownOrientation;
}

- (NSString)deviceSystemVersion
{
  return self->_deviceSystemVersion;
}

- (void)setDeviceSystemVersion:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceLocalizedModel
{
  return self->_deviceLocalizedModel;
}

- (void)setDeviceLocalizedModel:(id)a3
{
}

- (NSString)deviceSystemName
{
  return self->_deviceSystemName;
}

- (void)setDeviceSystemName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSystemName, 0);
  objc_storeStrong((id *)&self->_deviceLocalizedModel, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceSystemVersion, 0);

  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyMainScreenWidth(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 41, @"%s", dlerror());

  __break(1u);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyMainScreenHeight(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 42, @"%s", dlerror());

  __break(1u);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_3()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyScreenScale(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 43, @"%s", dlerror());

  __break(1u);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_4()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getUIContentSizeCategoryLarge(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 35, @"%s", dlerror());

  __break(1u);
}

void __34__WKInterfaceDevice_currentDevice__block_invoke_cold_5()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getUIContentSizeCategorySmall(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 36, @"%s", dlerror());

  __break(1u);
}

- (void)systemVersion
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertySystemVersion(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 44, @"%s", dlerror());

  __break(1u);
}

- (void)name
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 45, @"%s", dlerror());

  __break(1u);
}

- (void)systemName
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertySystemName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WKInterfaceDevice.m", 47, @"%s", dlerror());

  __break(1u);
}

- (void)addCachedImage:name:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  int v2 = 253;
  _os_log_error_impl(&dword_2211F3000, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error: WKInterfaceDevice, addCachedImageWithData - image is nil", v1, 0x12u);
}

- (void)addCachedImageWithData:name:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  int v2 = 269;
  _os_log_error_impl(&dword_2211F3000, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error: WKInterfaceDevice addCachedImageWithData:name: - imageData is nil", v1, 0x12u);
}

@end