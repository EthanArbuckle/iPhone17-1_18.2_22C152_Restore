@interface HDWatchRemoteFeatureAvailabilityDataSource
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)iOSVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchAtrialFibrillationDetectionVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchOSVersion;
- (HDWatchRemoteFeatureAvailabilityDataSource)initWithDevice:(id)a3;
- (NSString)onboardingCountryCode;
- (id)currentDeviceClass;
- (id)iOSBuildVersion;
- (id)watchBuildType;
- (id)watchModelNumber;
- (id)watchOSBuildVersion;
- (id)watchProductType;
- (id)watchRegion;
- (id)watchRegionInfo;
- (void)setOnboardingCountryCode:(id)a3;
@end

@implementation HDWatchRemoteFeatureAvailabilityDataSource

- (HDWatchRemoteFeatureAvailabilityDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDWatchRemoteFeatureAvailabilityDataSource;
  v6 = [(HDWatchRemoteFeatureAvailabilityDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)iOSVersion
{
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v6 = [v5 isAppleWatch];

  if (v6)
  {
    result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)self->_device;
    if (result)
    {
      v8 = [($9FE6E10C8CE45DBC9A88DFDEA39A390D *)result valueForProperty:*MEMORY[0x1E4F79E60]];
      unsigned int v9 = NRRawVersionFromString();

      retstr->var0 = HIWORD(v9);
      retstr->var1 = BYTE1(v9);
      int64_t v10 = v9;
    }
    else
    {
      uint64_t v12 = MEMORY[0x1E4F2A258];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F2A258];
      int64_t v10 = *(void *)(v12 + 16);
    }
    retstr->var2 = v10;
  }
  else
  {
    v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
    if (v11)
    {
      v13 = v11;
      [v11 currentOSVersionStruct];
      v11 = v13;
    }
    else
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2 = 0;
    }
  }
  return result;
}

- (id)iOSBuildVersion
{
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4)
  {
    if (self) {
      device = self->_device;
    }
    else {
      device = 0;
    }
    int v6 = [(NRDevice *)device valueForProperty:*MEMORY[0x1E4F79E40]];
  }
  else
  {
    v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v6 = [v7 currentOSBuild];
  }

  return v6;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchOSVersion
{
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v6 = [v5 isAppleWatch];

  if (v6)
  {
    result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)NRWatchOSVersionForLocalDevice();
    if (!self)
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2 = 0;
      return result;
    }
  }
  else
  {
    if (!self || (result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)self->_device) == 0)
    {
      uint64_t v9 = MEMORY[0x1E4F2A258];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F2A258];
      int64_t v8 = *(void *)(v9 + 16);
      goto LABEL_8;
    }
    result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)NRWatchOSVersionForRemoteDevice();
  }
  retstr->var0 = result >> 16;
  retstr->var1 = BYTE1(result);
  int64_t v8 = result;
LABEL_8:
  retstr->var2 = v8;
  return result;
}

- (id)watchRegion
{
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v6 = [v5 currentDeviceRegionCode];
  }
  else
  {
    if (self) {
      device = self->_device;
    }
    else {
      device = 0;
    }
    int v6 = [(NRDevice *)device valueForProperty:*MEMORY[0x1E4F79E28]];
  }

  return v6;
}

- (id)watchRegionInfo
{
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v6 = [v5 currentDeviceRegionInfo];
  }
  else
  {
    if (self) {
      device = self->_device;
    }
    else {
      device = 0;
    }
    int v6 = [(NRDevice *)device valueForProperty:*MEMORY[0x1E4F79E30]];
  }

  return v6;
}

- (id)watchModelNumber
{
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4)
  {
    id v5 = (void *)MGGetStringAnswer();
  }
  else
  {
    if (self) {
      device = self->_device;
    }
    else {
      device = 0;
    }
    id v5 = [(NRDevice *)device valueForProperty:*MEMORY[0x1E4F79E00]];
  }

  return v5;
}

- (id)watchBuildType
{
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F2B860] currentDeviceReleaseType];
  }
  else
  {
    if (self) {
      device = self->_device;
    }
    else {
      device = 0;
    }
    id v5 = [(NRDevice *)device valueForProperty:*MEMORY[0x1E4F79D08]];
  }

  return v5;
}

- (id)watchProductType
{
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v6 = [v5 currentDeviceProductType];
  }
  else
  {
    if (self) {
      device = self->_device;
    }
    else {
      device = 0;
    }
    int v6 = [(NRDevice *)device valueForProperty:*MEMORY[0x1E4F79E18]];
  }

  return v6;
}

- (id)watchOSBuildVersion
{
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isAppleWatch];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v6 = [v5 currentOSBuild];
  }
  else
  {
    if (self) {
      device = self->_device;
    }
    else {
      device = 0;
    }
    int v6 = [(NRDevice *)device valueForProperty:*MEMORY[0x1E4F79E40]];
  }

  return v6;
}

- (id)currentDeviceClass
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v3 = [v2 currentDeviceClass];

  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchAtrialFibrillationDetectionVersion
{
  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v6 = [v5 isCompanionCapable];

  if (v6)
  {
    if (self) {
      device = self->_device;
    }
    else {
      device = 0;
    }
    id v10 = [(NRDevice *)device valueForProperty:*MEMORY[0x1E4F79D00]];
    HKNSOperatingSystemVersionFromString();
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F2A9D0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F2A9D0];
    retstr->var2 = *(void *)(v9 + 16);
  }
  return result;
}

- (NSString)onboardingCountryCode
{
  return self->_onboardingCountryCode;
}

- (void)setOnboardingCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_onboardingCountryCode, 0);
}

@end