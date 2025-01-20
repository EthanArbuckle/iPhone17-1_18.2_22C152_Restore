@interface HKNanoRegistryDeviceUtility
+ (BOOL)isDeviceSeries4:(id)a3;
+ (NSString)activePairedDeviceHousingColor;
+ (NSString)activePairedDeviceModelNumber;
+ (NSString)activePairedDeviceRegionInfo;
+ (id)activeNonFamilySetupDevice;
+ (id)activePairedDeviceProductType;
+ (id)activePairedDeviceSystemBuildVersion;
+ (id)deviceHousingColor:(id)a3;
+ (id)electrocardiogramV2AvailableRegionsForDevice:(id)a3;
+ (id)modelNumberForDevice:(id)a3;
+ (id)productTypeForDevice:(id)a3;
+ (id)regionInfoForDevice:(id)a3;
+ (id)systemBuildVersionForDevice:(id)a3;
+ (unsigned)systemVersionForDevice:(id)a3;
@end

@implementation HKNanoRegistryDeviceUtility

+ (unsigned)systemVersionForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v4 = (id *)getNRDevicePropertySystemVersionSymbolLoc_ptr;
  v15 = (void *)getNRDevicePropertySystemVersionSymbolLoc_ptr;
  if (!getNRDevicePropertySystemVersionSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v13[3] = (uint64_t)dlsym(v5, "NRDevicePropertySystemVersion");
    getNRDevicePropertySystemVersionSymbolLoc_ptr = v13[3];
    v4 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v4) {
    +[HKNanoRegistryDeviceUtility systemVersionForDevice:]();
  }
  id v6 = *v4;
  id v7 = [v3 valueForProperty:v6];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v8 = (uint64_t (*)(id))getNRRawVersionFromStringSymbolLoc_ptr;
  v15 = getNRRawVersionFromStringSymbolLoc_ptr;
  if (!getNRRawVersionFromStringSymbolLoc_ptr)
  {
    v9 = (void *)NanoRegistryLibrary_1();
    v13[3] = (uint64_t)dlsym(v9, "NRRawVersionFromString");
    getNRRawVersionFromStringSymbolLoc_ptr = (_UNKNOWN *)v13[3];
    v8 = (uint64_t (*)(id))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v8) {
    +[HKNanoRegistryDeviceUtility systemVersionForDevice:]();
  }
  unsigned int v10 = v8(v7);

  return v10;
}

+ (id)modelNumberForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v4 = (void *)getNRDevicePropertyModelNumberSymbolLoc_ptr;
  uint64_t v11 = getNRDevicePropertyModelNumberSymbolLoc_ptr;
  if (!getNRDevicePropertyModelNumberSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v9[3] = (uint64_t)dlsym(v5, "NRDevicePropertyModelNumber");
    getNRDevicePropertyModelNumberSymbolLoc_ptr = v9[3];
    v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    +[HKNanoRegistryDeviceUtility modelNumberForDevice:]();
  }
  id v6 = [v3 valueForProperty:*v4];

  return v6;
}

+ (id)productTypeForDevice:(id)a3
{
  id v3 = a3;
  v4 = getNRDevicePropertyProductType();
  v5 = [v3 valueForProperty:v4];

  return v5;
}

+ (id)regionInfoForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v4 = (void *)getNRDevicePropertyRegionInfoSymbolLoc_ptr;
  uint64_t v11 = getNRDevicePropertyRegionInfoSymbolLoc_ptr;
  if (!getNRDevicePropertyRegionInfoSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v9[3] = (uint64_t)dlsym(v5, "NRDevicePropertyRegionInfo");
    getNRDevicePropertyRegionInfoSymbolLoc_ptr = v9[3];
    v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    +[HKNanoRegistryDeviceUtility regionInfoForDevice:]();
  }
  id v6 = [v3 valueForProperty:*v4];

  return v6;
}

+ (id)systemBuildVersionForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v4 = (void *)getNRDevicePropertySystemBuildVersionSymbolLoc_ptr;
  uint64_t v11 = getNRDevicePropertySystemBuildVersionSymbolLoc_ptr;
  if (!getNRDevicePropertySystemBuildVersionSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v9[3] = (uint64_t)dlsym(v5, "NRDevicePropertySystemBuildVersion");
    getNRDevicePropertySystemBuildVersionSymbolLoc_ptr = v9[3];
    v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    +[HKNanoRegistryDeviceUtility systemBuildVersionForDevice:]();
  }
  id v6 = [v3 valueForProperty:*v4];

  return v6;
}

+ (id)deviceHousingColor:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v4 = (void *)getNRDevicePropertyDeviceHousingColorSymbolLoc_ptr;
  uint64_t v11 = getNRDevicePropertyDeviceHousingColorSymbolLoc_ptr;
  if (!getNRDevicePropertyDeviceHousingColorSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v9[3] = (uint64_t)dlsym(v5, "NRDevicePropertyDeviceHousingColor");
    getNRDevicePropertyDeviceHousingColorSymbolLoc_ptr = v9[3];
    v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    +[HKNanoRegistryDeviceUtility deviceHousingColor:]();
  }
  id v6 = [v3 valueForProperty:*v4];

  return v6;
}

+ (NSString)activePairedDeviceModelNumber
{
  id v3 = [a1 activeNonFamilySetupDevice];
  v4 = [a1 modelNumberForDevice:v3];

  return (NSString *)v4;
}

+ (id)activePairedDeviceSystemBuildVersion
{
  id v3 = [a1 activeNonFamilySetupDevice];
  v4 = [a1 systemBuildVersionForDevice:v3];

  return v4;
}

+ (id)activePairedDeviceProductType
{
  id v3 = [a1 activeNonFamilySetupDevice];
  v4 = [a1 productTypeForDevice:v3];

  return v4;
}

+ (NSString)activePairedDeviceRegionInfo
{
  id v3 = [a1 activeNonFamilySetupDevice];
  v4 = [a1 regionInfoForDevice:v3];

  return (NSString *)v4;
}

+ (NSString)activePairedDeviceHousingColor
{
  id v3 = [a1 activeNonFamilySetupDevice];
  v4 = [a1 deviceHousingColor:v3];

  return (NSString *)v4;
}

+ (id)electrocardiogramV2AvailableRegionsForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v4 = (void *)getNRDevicePropertyElectrocardiogramV2AvailableRegionsSymbolLoc_ptr;
  uint64_t v11 = getNRDevicePropertyElectrocardiogramV2AvailableRegionsSymbolLoc_ptr;
  if (!getNRDevicePropertyElectrocardiogramV2AvailableRegionsSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v9[3] = (uint64_t)dlsym(v5, "NRDevicePropertyElectrocardiogramV2AvailableRegions");
    getNRDevicePropertyElectrocardiogramV2AvailableRegionsSymbolLoc_ptr = v9[3];
    v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    +[HKNanoRegistryDeviceUtility electrocardiogramV2AvailableRegionsForDevice:]();
  }
  id v6 = [v3 valueForProperty:*v4];

  return v6;
}

+ (BOOL)isDeviceSeries4:(id)a3
{
  id v3 = a3;
  v4 = getNRDevicePropertyProductType();
  v5 = [v3 valueForProperty:v4];

  LOBYTE(v3) = [v5 hasPrefix:@"Watch4,"];
  return (char)v3;
}

+ (id)activeNonFamilySetupDevice
{
  v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  id v3 = [getNRPairedDeviceRegistryClass() activeDeviceSelectorBlock];
  v4 = [v2 getDevicesMatching:v3];
  v5 = [v4 firstObject];

  return v5;
}

+ (void)systemVersionForDevice:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertySystemVersion(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKNanoRegistryDeviceUtility.m", 31, @"%s", dlerror());

  __break(1u);
}

+ (void)systemVersionForDevice:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"uint32_t getNRRawVersionFromString(NSString *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKNanoRegistryDeviceUtility.m", 22, @"%s", dlerror());

  __break(1u);
}

+ (void)modelNumberForDevice:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyModelNumber(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKNanoRegistryDeviceUtility.m", 27, @"%s", dlerror());

  __break(1u);
}

+ (void)regionInfoForDevice:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyRegionInfo(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKNanoRegistryDeviceUtility.m", 29, @"%s", dlerror());

  __break(1u);
}

+ (void)systemBuildVersionForDevice:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertySystemBuildVersion(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKNanoRegistryDeviceUtility.m", 30, @"%s", dlerror());

  __break(1u);
}

+ (void)deviceHousingColor:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyDeviceHousingColor(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKNanoRegistryDeviceUtility.m", 26, @"%s", dlerror());

  __break(1u);
}

+ (void)electrocardiogramV2AvailableRegionsForDevice:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyElectrocardiogramV2AvailableRegions(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKNanoRegistryDeviceUtility.m", 25, @"%s", dlerror());

  __break(1u);
}

@end