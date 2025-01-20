@interface HPSProductUtils
+ (BOOL)isAirPods:(id)a3;
+ (BOOL)isAppleHeadphone:(id)a3;
+ (BOOL)isBeatsNonWx:(id)a3;
+ (BOOL)isFeatureSupported:(int)a3 byDevice:(id)a4;
+ (BOOL)isFeatureSupported:(int)a3 byProductId:(unsigned int)a4;
+ (BOOL)isRealityDevice;
+ (id)getProductSpecificString:(unsigned int)a3 descriptionKey:(id)a4;
@end

@implementation HPSProductUtils

+ (id)getProductSpecificString:(unsigned int)a3 descriptionKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  switch(a3)
  {
    case 0x200Au:
    case 0x201Fu:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-b515";
      goto LABEL_15;
    case 0x2011u:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B507";
      goto LABEL_15;
    case 0x2012u:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B494";
      goto LABEL_15;
    case 0x2013u:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B688";
      goto LABEL_15;
    case 0x2014u:
    case 0x2024u:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B698";
      goto LABEL_15;
    case 0x2016u:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B607";
      goto LABEL_15;
    case 0x2017u:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B453";
      goto LABEL_15;
    case 0x201Au:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B487";
      goto LABEL_15;
    case 0x201Du:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B498-v2";
      goto LABEL_15;
    case 0x2026u:
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"DeviceConfig-B463";
LABEL_15:
      v10 = [v6 localizedStringForKey:v5 value:&stru_26F119DA8 table:v8];

      break;
    default:
      v9 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[HPSProductUtils getProductSpecificString:descriptionKey:]((uint64_t)v5, a3, v9);
      }

      v10 = &stru_26F119DA8;
      break;
  }
  v11 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109634;
    v13[1] = a3;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_23D3D5000, v11, OS_LOG_TYPE_DEFAULT, "HPSProductUtils: getProductSpecificString called with pid %d and descKey %@ value %@", (uint8_t *)v13, 0x1Cu);
  }

  return v10;
}

+ (BOOL)isAppleHeadphone:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    BOOL v5 = ([v3 isAppleAudioDevice] & 1) != 0 || objc_msgSend(v4, "productId") == 8209;
    int v15 = [v4 productId] == 8214 || v5;
    BOOL v14 = v15 != 0;
  }
  else
  {
    v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[HPSProductUtils isAppleHeadphone:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)isAirPods:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    int v5 = [v3 productId];
    unsigned int v6 = ((v5 - 8194) < 0x23) & (0x420063101uLL >> (v5 - 2));
    uint64_t v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67109376;
      v16[1] = v6;
      __int16 v17 = 1024;
      int v18 = [v4 productId];
      _os_log_impl(&dword_23D3D5000, v7, OS_LOG_TYPE_DEFAULT, "HPSProductUtils: isAirPods:%i productID:%i", (uint8_t *)v16, 0xEu);
    }
  }
  else
  {
    uint64_t v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[HPSProductUtils isAirPods:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isBeatsNonWx:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    int v5 = [v3 productId];
    int v6 = [v4 productId];
    int v7 = [v4 productId];
    BOOL v10 = v5 == 8209 || v6 == 8214 || v7 == 8230;
  }
  else
  {
    uint64_t v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[HPSProductUtils isBeatsNonWx:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)isFeatureSupported:(int)a3 byDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [a4 productId];
  if (v4 > 1) {
    return 0;
  }
  return [a1 isFeatureSupported:v4 byProductId:v6];
}

+ (BOOL)isFeatureSupported:(int)a3 byProductId:(unsigned int)a4
{
  unint64_t v4 = (0x1C6B37FF01uLL >> (a4 - 2)) & 1;
  if (a4 - 8194 >= 0x25) {
    LOBYTE(v4) = 0;
  }
  unsigned int v5 = (0x14630611u >> (a4 - 10)) & 1;
  if (a4 - 8202 >= 0x1D) {
    LOBYTE(v5) = 0;
  }
  if (a3) {
    LOBYTE(v5) = 0;
  }
  if (a3 == 1) {
    return v4;
  }
  else {
    return v5;
  }
}

+ (BOOL)isRealityDevice
{
  v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"RealityDevice"];

  return v3;
}

+ (void)getProductSpecificString:(os_log_t)log descriptionKey:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23D3D5000, log, OS_LOG_TYPE_ERROR, "HPSProductUtils: getProductSpecificString called with invalid pid %d and (or) descKey %@", (uint8_t *)v3, 0x12u);
}

+ (void)isAppleHeadphone:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isAirPods:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isBeatsNonWx:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end