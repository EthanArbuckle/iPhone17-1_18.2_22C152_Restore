@interface HKActiveWatchRemoteFeatureAvailabilityDataSource
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_operatingSystemVersionForOSVersion:(SEL)a3;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)iOSVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchAtrialFibrillationDetectionVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchOSVersion;
- (HKActiveWatchRemoteFeatureAvailabilityDataSource)init;
- (NRPairedDeviceRegistry)pairedDeviceRegistry;
- (NSString)onboardingCountryCode;
- (id)_activeWatch;
- (id)currentDeviceClass;
- (id)iOSBuildVersion;
- (id)watchBuildType;
- (id)watchModelNumber;
- (id)watchOSBuildVersion;
- (id)watchProductType;
- (id)watchRegion;
- (id)watchRegionInfo;
- (void)iOSVersion;
- (void)setOnboardingCountryCode:(id)a3;
- (void)setPairedDeviceRegistry:(id)a3;
- (void)watchAtrialFibrillationDetectionVersion;
- (void)watchBuildType;
- (void)watchModelNumber;
- (void)watchOSVersion;
- (void)watchProductType;
- (void)watchRegion;
- (void)watchRegionInfo;
@end

@implementation HKActiveWatchRemoteFeatureAvailabilityDataSource

- (HKActiveWatchRemoteFeatureAvailabilityDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKActiveWatchRemoteFeatureAvailabilityDataSource;
  v2 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getNRPairedDeviceRegistryClass_softClass_2;
    uint64_t v13 = getNRPairedDeviceRegistryClass_softClass_2;
    if (!getNRPairedDeviceRegistryClass_softClass_2)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getNRPairedDeviceRegistryClass_block_invoke_2;
      v9[3] = &unk_1E58BD760;
      v9[4] = &v10;
      __getNRPairedDeviceRegistryClass_block_invoke_2((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [v4 sharedInstance];
    pairedDeviceRegistry = v2->_pairedDeviceRegistry;
    v2->_pairedDeviceRegistry = (NRPairedDeviceRegistry *)v5;
  }
  return v2;
}

- (id)_activeWatch
{
  v2 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self pairedDeviceRegistry];
  v3 = [v2 getActivePairedDevice];

  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)iOSVersion
{
  uint64_t v5 = +[_HKBehavior sharedBehavior];
  int v6 = [v5 isCompanionCapable];

  if (v6)
  {
    return +[_HKBehavior currentOSVersionStruct];
  }
  else
  {
    objc_super v8 = +[_HKBehavior sharedBehavior];
    int v9 = [v8 isAppleWatch];

    if (v9
      && ([(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      v11 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v12 = (id *)getNRDevicePropertySystemVersionSymbolLoc_ptr_0;
      v22 = (void *)getNRDevicePropertySystemVersionSymbolLoc_ptr_0;
      if (!getNRDevicePropertySystemVersionSymbolLoc_ptr_0)
      {
        uint64_t v13 = (void *)NanoRegistryLibrary_2();
        v20[3] = (uint64_t)dlsym(v13, "NRDevicePropertySystemVersion");
        getNRDevicePropertySystemVersionSymbolLoc_ptr_0 = v20[3];
        uint64_t v12 = (id *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v12) {
        -[HKActiveWatchRemoteFeatureAvailabilityDataSource iOSVersion]();
      }
      id v14 = *v12;
      id v15 = [v11 valueForProperty:v14];
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      v16 = (uint64_t (*)(id))getNRRawVersionFromStringSymbolLoc_ptr_0;
      v22 = getNRRawVersionFromStringSymbolLoc_ptr_0;
      if (!getNRRawVersionFromStringSymbolLoc_ptr_0)
      {
        v17 = (void *)NanoRegistryLibrary_2();
        v20[3] = (uint64_t)dlsym(v17, "NRRawVersionFromString");
        getNRRawVersionFromStringSymbolLoc_ptr_0 = (_UNKNOWN *)v20[3];
        v16 = (uint64_t (*)(id))v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v16) {
        -[HKActiveWatchRemoteFeatureAvailabilityDataSource iOSVersion]();
      }
      uint64_t v18 = v16(v15);

      return [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _operatingSystemVersionForOSVersion:v18];
    }
    else
    {
      *(_OWORD *)&retstr->var0 = HKNSOperatingSystemVersionUnknown;
      retstr->var2 = 0;
    }
  }
  return result;
}

- (id)iOSBuildVersion
{
  v3 = +[_HKBehavior sharedBehavior];
  int v4 = [v3 isCompanionCapable];

  if (v4)
  {
    uint64_t v5 = +[_HKBehavior currentOSBuild];
  }
  else
  {
    int v6 = +[_HKBehavior sharedBehavior];
    int v7 = [v6 isAppleWatch];

    if (v7
      && ([(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch],
          objc_super v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      int v9 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
      uint64_t v10 = getNRDevicePropertySystemBuildVersion();
      uint64_t v5 = [v9 valueForProperty:v10];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchOSVersion
{
  uint64_t v5 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    objc_super v8 = (uint64_t (*)(id))getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    id v15 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
    {
      int v9 = (void *)NanoRegistryLibrary_2();
      v13[3] = (uint64_t)dlsym(v9, "NRWatchOSVersionForRemoteDevice");
      getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = (_UNKNOWN *)v13[3];
      objc_super v8 = (uint64_t (*)(id))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v8) {
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchOSVersion]();
    }
    uint64_t v10 = v8(v7);

    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
    [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _operatingSystemVersionForOSVersion:v10];
  }
  else
  {
    *(_OWORD *)&retstr->var0 = HKNSOperatingSystemVersionUnknown;
    retstr->var2 = 0;
  }

  return result;
}

- (id)watchRegion
{
  v2 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
  if (v2)
  {
    uint64_t v7 = 0;
    objc_super v8 = &v7;
    uint64_t v9 = 0x2020000000;
    v3 = (void *)getNRDevicePropertyRegionCodeSymbolLoc_ptr;
    uint64_t v10 = getNRDevicePropertyRegionCodeSymbolLoc_ptr;
    if (!getNRDevicePropertyRegionCodeSymbolLoc_ptr)
    {
      int v4 = (void *)NanoRegistryLibrary_2();
      v8[3] = (uint64_t)dlsym(v4, "NRDevicePropertyRegionCode");
      getNRDevicePropertyRegionCodeSymbolLoc_ptr = v8[3];
      v3 = (void *)v8[3];
    }
    _Block_object_dispose(&v7, 8);
    if (!v3) {
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchRegion]();
    }
    uint64_t v5 = [v2 valueForProperty:*v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)watchRegionInfo
{
  v2 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
  if (v2)
  {
    uint64_t v7 = 0;
    objc_super v8 = &v7;
    uint64_t v9 = 0x2020000000;
    v3 = (void *)getNRDevicePropertyRegionInfoSymbolLoc_ptr_0;
    uint64_t v10 = getNRDevicePropertyRegionInfoSymbolLoc_ptr_0;
    if (!getNRDevicePropertyRegionInfoSymbolLoc_ptr_0)
    {
      int v4 = (void *)NanoRegistryLibrary_2();
      v8[3] = (uint64_t)dlsym(v4, "NRDevicePropertyRegionInfo");
      getNRDevicePropertyRegionInfoSymbolLoc_ptr_0 = v8[3];
      v3 = (void *)v8[3];
    }
    _Block_object_dispose(&v7, 8);
    if (!v3) {
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchRegionInfo]();
    }
    uint64_t v5 = [v2 valueForProperty:*v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)watchModelNumber
{
  v2 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v3 = (void *)getNRDevicePropertyModelNumberSymbolLoc_ptr_0;
  uint64_t v10 = getNRDevicePropertyModelNumberSymbolLoc_ptr_0;
  if (!getNRDevicePropertyModelNumberSymbolLoc_ptr_0)
  {
    int v4 = (void *)NanoRegistryLibrary_2();
    v8[3] = (uint64_t)dlsym(v4, "NRDevicePropertyModelNumber");
    getNRDevicePropertyModelNumberSymbolLoc_ptr_0 = v8[3];
    v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchModelNumber]();
  }
  uint64_t v5 = [v2 valueForProperty:*v3];

  return v5;
}

- (id)watchBuildType
{
  v2 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v3 = (void *)getNRDevicePropertyBuildTypeSymbolLoc_ptr;
  uint64_t v10 = getNRDevicePropertyBuildTypeSymbolLoc_ptr;
  if (!getNRDevicePropertyBuildTypeSymbolLoc_ptr)
  {
    int v4 = (void *)NanoRegistryLibrary_2();
    v8[3] = (uint64_t)dlsym(v4, "NRDevicePropertyBuildType");
    getNRDevicePropertyBuildTypeSymbolLoc_ptr = v8[3];
    v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchBuildType]();
  }
  uint64_t v5 = [v2 valueForProperty:*v3];

  return v5;
}

- (id)watchProductType
{
  v2 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v3 = (void *)getNRDevicePropertyProductTypeSymbolLoc_ptr_0;
  uint64_t v10 = getNRDevicePropertyProductTypeSymbolLoc_ptr_0;
  if (!getNRDevicePropertyProductTypeSymbolLoc_ptr_0)
  {
    int v4 = (void *)NanoRegistryLibrary_2();
    v8[3] = (uint64_t)dlsym(v4, "NRDevicePropertyProductType");
    getNRDevicePropertyProductTypeSymbolLoc_ptr_0 = v8[3];
    v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchProductType]();
  }
  uint64_t v5 = [v2 valueForProperty:*v3];

  return v5;
}

- (id)watchOSBuildVersion
{
  v2 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
  v3 = getNRDevicePropertySystemBuildVersion();
  int v4 = [v2 valueForProperty:v3];

  return v4;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchAtrialFibrillationDetectionVersion
{
  uint64_t v5 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
  if (v5)
  {
    int v6 = [(HKActiveWatchRemoteFeatureAvailabilityDataSource *)self _activeWatch];
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v7 = (void *)getNRDevicePropertyBackgroundAtrialFibrillationVersionSymbolLoc_ptr;
    uint64_t v14 = getNRDevicePropertyBackgroundAtrialFibrillationVersionSymbolLoc_ptr;
    if (!getNRDevicePropertyBackgroundAtrialFibrillationVersionSymbolLoc_ptr)
    {
      objc_super v8 = (void *)NanoRegistryLibrary_2();
      v12[3] = (uint64_t)dlsym(v8, "NRDevicePropertyBackgroundAtrialFibrillationVersion");
      getNRDevicePropertyBackgroundAtrialFibrillationVersionSymbolLoc_ptr = v12[3];
      uint64_t v7 = (void *)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v7) {
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchAtrialFibrillationDetectionVersion]();
    }
    uint64_t v9 = [v6 valueForProperty:*v7];

    HKSemanticVersionFromString(retstr, v9);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = HKSemanticVersionUnknown;
    retstr->var2 = 0;
  }

  return result;
}

- (id)currentDeviceClass
{
  v2 = +[_HKBehavior sharedBehavior];
  v3 = [v2 currentDeviceClass];

  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_operatingSystemVersionForOSVersion:(SEL)a3
{
  retstr->var0 = HIWORD(a4);
  retstr->var1 = BYTE1(a4);
  retstr->var2 = a4;
  return self;
}

- (NSString)onboardingCountryCode
{
  return self->_onboardingCountryCode;
}

- (void)setOnboardingCountryCode:(id)a3
{
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);

  objc_storeStrong((id *)&self->_onboardingCountryCode, 0);
}

- (void)iOSVersion
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"uint32_t getNRRawVersionFromString(NSString *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKActiveWatchRemoteFeatureAvailabilityDataSource.m", 37, @"%s", dlerror());

  __break(1u);
}

- (void)watchOSVersion
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"uint32_t getNRWatchOSVersionForRemoteDevice(NRDevice *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKActiveWatchRemoteFeatureAvailabilityDataSource.m", 38, @"%s", dlerror());

  __break(1u);
}

- (void)watchRegion
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyRegionCode(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKActiveWatchRemoteFeatureAvailabilityDataSource.m", 31, @"%s", dlerror());

  __break(1u);
}

- (void)watchRegionInfo
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyRegionInfo(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKActiveWatchRemoteFeatureAvailabilityDataSource.m", 32, @"%s", dlerror());

  __break(1u);
}

- (void)watchModelNumber
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyModelNumber(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKActiveWatchRemoteFeatureAvailabilityDataSource.m", 29, @"%s", dlerror());

  __break(1u);
}

- (void)watchBuildType
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyBuildType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKActiveWatchRemoteFeatureAvailabilityDataSource.m", 28, @"%s", dlerror());

  __break(1u);
}

- (void)watchProductType
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyProductType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKActiveWatchRemoteFeatureAvailabilityDataSource.m", 30, @"%s", dlerror());

  __break(1u);
}

- (void)watchAtrialFibrillationDetectionVersion
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyBackgroundAtrialFibrillationVersion(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKActiveWatchRemoteFeatureAvailabilityDataSource.m", 35, @"%s", dlerror());

  __break(1u);
}

@end