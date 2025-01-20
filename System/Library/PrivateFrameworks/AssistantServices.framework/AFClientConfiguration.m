@interface AFClientConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFAccessibilityState)accessibilityState;
- (AFAudioPlaybackRequest)tapToSiriAudioPlaybackRequest;
- (AFAudioPlaybackRequest)twoShotAudioPlaybackRequest;
- (AFClientConfiguration)init;
- (AFClientConfiguration)initWithAccessibilityState:(id)a3 deviceRingerSwitchState:(int64_t)a4 isDeviceInCarDNDMode:(BOOL)a5 isDeviceInStarkMode:(BOOL)a6 supportsCarPlayVehicleData:(BOOL)a7 isDeviceWatchAuthenticated:(BOOL)a8 areAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a9 outputVolume:(float)a10 tapToSiriAudioPlaybackRequest:(id)a11 twoShotAudioPlaybackRequest:(id)a12 deviceSetupFlowBeginDate:(id)a13 deviceSetupFlowEndDate:(id)a14;
- (AFClientConfiguration)initWithBuilder:(id)a3;
- (AFClientConfiguration)initWithCoder:(id)a3;
- (BOOL)areAnnouncementRequestsPermittedByPresentationWhileActive;
- (BOOL)isDeviceInCarDNDMode;
- (BOOL)isDeviceInStarkMode;
- (BOOL)isDeviceWatchAuthenticated;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsCarPlayVehicleData;
- (NSDate)deviceSetupFlowBeginDate;
- (NSDate)deviceSetupFlowEndDate;
- (float)outputVolume;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)deviceRingerSwitchState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFClientConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSetupFlowEndDate, 0);
  objc_storeStrong((id *)&self->_deviceSetupFlowBeginDate, 0);
  objc_storeStrong((id *)&self->_twoShotAudioPlaybackRequest, 0);
  objc_storeStrong((id *)&self->_tapToSiriAudioPlaybackRequest, 0);
  objc_storeStrong((id *)&self->_accessibilityState, 0);
}

- (NSDate)deviceSetupFlowEndDate
{
  return self->_deviceSetupFlowEndDate;
}

- (NSDate)deviceSetupFlowBeginDate
{
  return self->_deviceSetupFlowBeginDate;
}

- (AFAudioPlaybackRequest)twoShotAudioPlaybackRequest
{
  return self->_twoShotAudioPlaybackRequest;
}

- (AFAudioPlaybackRequest)tapToSiriAudioPlaybackRequest
{
  return self->_tapToSiriAudioPlaybackRequest;
}

- (float)outputVolume
{
  return self->_outputVolume;
}

- (BOOL)areAnnouncementRequestsPermittedByPresentationWhileActive
{
  return self->_areAnnouncementRequestsPermittedByPresentationWhileActive;
}

- (BOOL)isDeviceWatchAuthenticated
{
  return self->_isDeviceWatchAuthenticated;
}

- (BOOL)supportsCarPlayVehicleData
{
  return self->_supportsCarPlayVehicleData;
}

- (BOOL)isDeviceInStarkMode
{
  return self->_isDeviceInStarkMode;
}

- (BOOL)isDeviceInCarDNDMode
{
  return self->_isDeviceInCarDNDMode;
}

- (int64_t)deviceRingerSwitchState
{
  return self->_deviceRingerSwitchState;
}

- (AFAccessibilityState)accessibilityState
{
  return self->_accessibilityState;
}

- (void)encodeWithCoder:(id)a3
{
  accessibilityState = self->_accessibilityState;
  id v13 = a3;
  [v13 encodeObject:accessibilityState forKey:@"AFClientConfiguration::accessibilityState"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deviceRingerSwitchState];
  [v13 encodeObject:v5 forKey:@"AFClientConfiguration::deviceRingerSwitchState"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceInCarDNDMode];
  [v13 encodeObject:v6 forKey:@"AFClientConfiguration::isDeviceInCarDNDMode"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceInStarkMode];
  [v13 encodeObject:v7 forKey:@"AFClientConfiguration::isDeviceInStarkMode"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsCarPlayVehicleData];
  [v13 encodeObject:v8 forKey:@"AFClientConfiguration::supportsCarPlayVehicleData"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceWatchAuthenticated];
  [v13 encodeObject:v9 forKey:@"AFClientConfiguration::isDeviceWatchAuthenticated"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_areAnnouncementRequestsPermittedByPresentationWhileActive];
  [v13 encodeObject:v10 forKey:@"AFClientConfiguration::areAnnouncementRequestsPermittedByPresentationWhileActive"];

  *(float *)&double v11 = self->_outputVolume;
  v12 = [MEMORY[0x1E4F28ED0] numberWithFloat:v11];
  [v13 encodeObject:v12 forKey:@"AFClientConfiguration::outputVolume"];

  [v13 encodeObject:self->_tapToSiriAudioPlaybackRequest forKey:@"AFClientConfiguration::tapToSiriAudioPlaybackRequest"];
  [v13 encodeObject:self->_twoShotAudioPlaybackRequest forKey:@"AFClientConfiguration::twoShotAudioPlaybackRequest"];
  [v13 encodeObject:self->_deviceSetupFlowBeginDate forKey:@"AFClientConfiguration::deviceSetupFlowBeginDate"];
  [v13 encodeObject:self->_deviceSetupFlowEndDate forKey:@"AFClientConfiguration::deviceSetupFlowEndDate"];
}

- (AFClientConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::accessibilityState"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::deviceRingerSwitchState"];
  uint64_t v27 = [v5 integerValue];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::isDeviceInCarDNDMode"];
  unsigned int v26 = [v6 BOOLValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::isDeviceInStarkMode"];
  uint64_t v8 = [v7 BOOLValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::supportsCarPlayVehicleData"];
  uint64_t v10 = [v9 BOOLValue];

  double v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::isDeviceWatchAuthenticated"];
  uint64_t v12 = [v11 BOOLValue];

  id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::areAnnouncementRequestsPermittedByPresentationWhileActive"];
  char v14 = [v13 BOOLValue];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::outputVolume"];
  [v15 floatValue];
  int v17 = v16;

  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::tapToSiriAudioPlaybackRequest"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::twoShotAudioPlaybackRequest"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::deviceSetupFlowBeginDate"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientConfiguration::deviceSetupFlowEndDate"];

  LOBYTE(v25) = v14;
  LODWORD(v22) = v17;
  v23 = [(AFClientConfiguration *)self initWithAccessibilityState:v4 deviceRingerSwitchState:v27 isDeviceInCarDNDMode:v26 isDeviceInStarkMode:v8 supportsCarPlayVehicleData:v10 isDeviceWatchAuthenticated:v12 areAnnouncementRequestsPermittedByPresentationWhileActive:v22 outputVolume:v25 tapToSiriAudioPlaybackRequest:v18 twoShotAudioPlaybackRequest:v19 deviceSetupFlowBeginDate:v20 deviceSetupFlowEndDate:v21];

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFClientConfiguration *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t deviceRingerSwitchState = self->_deviceRingerSwitchState;
      if (deviceRingerSwitchState == [(AFClientConfiguration *)v5 deviceRingerSwitchState]
        && (BOOL isDeviceInCarDNDMode = self->_isDeviceInCarDNDMode,
            isDeviceInCarDNDMode == [(AFClientConfiguration *)v5 isDeviceInCarDNDMode])
        && (BOOL isDeviceInStarkMode = self->_isDeviceInStarkMode,
            isDeviceInStarkMode == [(AFClientConfiguration *)v5 isDeviceInStarkMode])
        && (BOOL supportsCarPlayVehicleData = self->_supportsCarPlayVehicleData,
            supportsCarPlayVehicleData == [(AFClientConfiguration *)v5 supportsCarPlayVehicleData])&& (BOOL isDeviceWatchAuthenticated = self->_isDeviceWatchAuthenticated, isDeviceWatchAuthenticated == [(AFClientConfiguration *)v5 isDeviceWatchAuthenticated])&& (areAnnouncementRequestsPermittedByPresentationWhileActive = self->_areAnnouncementRequestsPermittedByPresentationWhileActive, areAnnouncementRequestsPermittedByPresentationWhileActive == [(AFClientConfiguration *)v5 areAnnouncementRequestsPermittedByPresentationWhileActive])&& (outputVolume = self->_outputVolume, [(AFClientConfiguration *)v5 outputVolume], outputVolume == v13))
      {
        int v16 = [(AFClientConfiguration *)v5 accessibilityState];
        accessibilityState = self->_accessibilityState;
        if (accessibilityState == v16 || [(AFAccessibilityState *)accessibilityState isEqual:v16])
        {
          v18 = [(AFClientConfiguration *)v5 tapToSiriAudioPlaybackRequest];
          tapToSiriAudioPlaybackRequest = self->_tapToSiriAudioPlaybackRequest;
          if (tapToSiriAudioPlaybackRequest == v18
            || [(AFAudioPlaybackRequest *)tapToSiriAudioPlaybackRequest isEqual:v18])
          {
            v20 = [(AFClientConfiguration *)v5 twoShotAudioPlaybackRequest];
            twoShotAudioPlaybackRequest = self->_twoShotAudioPlaybackRequest;
            if (twoShotAudioPlaybackRequest == v20
              || [(AFAudioPlaybackRequest *)twoShotAudioPlaybackRequest isEqual:v20])
            {
              double v22 = [(AFClientConfiguration *)v5 deviceSetupFlowBeginDate];
              deviceSetupFlowBeginDate = self->_deviceSetupFlowBeginDate;
              if (deviceSetupFlowBeginDate == v22
                || [(NSDate *)deviceSetupFlowBeginDate isEqual:v22])
              {
                v24 = [(AFClientConfiguration *)v5 deviceSetupFlowEndDate];
                deviceSetupFlowEndDate = self->_deviceSetupFlowEndDate;
                BOOL v14 = deviceSetupFlowEndDate == v24
                   || [(NSDate *)deviceSetupFlowEndDate isEqual:v24];
              }
              else
              {
                BOOL v14 = 0;
              }
            }
            else
            {
              BOOL v14 = 0;
            }
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(AFAccessibilityState *)self->_accessibilityState hash];
  v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deviceRingerSwitchState];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceInCarDNDMode];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceInStarkMode];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsCarPlayVehicleData];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceWatchAuthenticated];
  uint64_t v13 = v11 ^ [v12 hash];
  BOOL v14 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_areAnnouncementRequestsPermittedByPresentationWhileActive];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];
  *(float *)&double v16 = self->_outputVolume;
  int v17 = [MEMORY[0x1E4F28ED0] numberWithFloat:v16];
  uint64_t v18 = [v17 hash];
  unint64_t v19 = v18 ^ [(AFAudioPlaybackRequest *)self->_tapToSiriAudioPlaybackRequest hash];
  unint64_t v20 = v19 ^ [(AFAudioPlaybackRequest *)self->_twoShotAudioPlaybackRequest hash];
  uint64_t v21 = v15 ^ v20 ^ [(NSDate *)self->_deviceSetupFlowBeginDate hash];
  unint64_t v22 = v21 ^ [(NSDate *)self->_deviceSetupFlowEndDate hash];

  return v22;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v18.receiver = self;
  v18.super_class = (Class)AFClientConfiguration;
  uint64_t v5 = [(AFClientConfiguration *)&v18 description];
  accessibilityState = self->_accessibilityState;
  unint64_t deviceRingerSwitchState = self->_deviceRingerSwitchState;
  if (deviceRingerSwitchState > 2) {
    uint64_t v8 = @"(unknown)";
  }
  else {
    uint64_t v8 = off_1E5925DC0[deviceRingerSwitchState];
  }
  uint64_t v9 = v8;
  uint64_t v10 = v9;
  uint64_t v11 = @"YES";
  if (self->_isDeviceInCarDNDMode) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if (self->_isDeviceInStarkMode) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  if (self->_supportsCarPlayVehicleData) {
    BOOL v14 = @"YES";
  }
  else {
    BOOL v14 = @"NO";
  }
  if (self->_isDeviceWatchAuthenticated) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  if (!self->_areAnnouncementRequestsPermittedByPresentationWhileActive) {
    uint64_t v11 = @"NO";
  }
  double v16 = (void *)[v4 initWithFormat:@"%@ {accessibilityState = %@, deviceRingerSwitchState = %@, isDeviceInCarDNDMode = %@, isDeviceInStarkMode = %@, supportsCarPlayVehicleData = %@, isDeviceWatchAuthenticated = %@, areAnnouncementRequestsPermittedByPresentationWhileActive = %@, outputVolume = %f, tapToSiriAudioPlaybackRequest = %@, twoShotAudioPlaybackRequest = %@, deviceSetupFlowBeginDate = %@, deviceSetupFlowEndDate = %@}", v5, accessibilityState, v9, v12, v13, v14, v15, v11, self->_outputVolume, self->_tapToSiriAudioPlaybackRequest, self->_twoShotAudioPlaybackRequest, self->_deviceSetupFlowBeginDate, self->_deviceSetupFlowEndDate];

  return v16;
}

- (id)description
{
  return [(AFClientConfiguration *)self _descriptionWithIndent:0];
}

- (AFClientConfiguration)initWithAccessibilityState:(id)a3 deviceRingerSwitchState:(int64_t)a4 isDeviceInCarDNDMode:(BOOL)a5 isDeviceInStarkMode:(BOOL)a6 supportsCarPlayVehicleData:(BOOL)a7 isDeviceWatchAuthenticated:(BOOL)a8 areAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a9 outputVolume:(float)a10 tapToSiriAudioPlaybackRequest:(id)a11 twoShotAudioPlaybackRequest:(id)a12 deviceSetupFlowBeginDate:(id)a13 deviceSetupFlowEndDate:(id)a14
{
  id v19 = a3;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __348__AFClientConfiguration_initWithAccessibilityState_deviceRingerSwitchState_isDeviceInCarDNDMode_isDeviceInStarkMode_supportsCarPlayVehicleData_isDeviceWatchAuthenticated_areAnnouncementRequestsPermittedByPresentationWhileActive_outputVolume_tapToSiriAudioPlaybackRequest_twoShotAudioPlaybackRequest_deviceSetupFlowBeginDate_deviceSetupFlowEndDate___block_invoke;
  v33[3] = &unk_1E5926E70;
  BOOL v41 = a5;
  BOOL v42 = a6;
  BOOL v43 = a7;
  BOOL v44 = a8;
  BOOL v45 = a9;
  float v40 = a10;
  id v34 = v19;
  id v35 = v20;
  id v36 = v21;
  id v37 = v22;
  id v38 = v23;
  int64_t v39 = a4;
  id v24 = v23;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  v29 = [(AFClientConfiguration *)self initWithBuilder:v33];

  return v29;
}

void __348__AFClientConfiguration_initWithAccessibilityState_deviceRingerSwitchState_isDeviceInCarDNDMode_isDeviceInStarkMode_supportsCarPlayVehicleData_isDeviceWatchAuthenticated_areAnnouncementRequestsPermittedByPresentationWhileActive_outputVolume_tapToSiriAudioPlaybackRequest_twoShotAudioPlaybackRequest_deviceSetupFlowBeginDate_deviceSetupFlowEndDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setAccessibilityState:v3];
  [v5 setDeviceRingerSwitchState:*(void *)(a1 + 72)];
  [v5 setIsDeviceInCarDNDMode:*(unsigned __int8 *)(a1 + 84)];
  [v5 setIsDeviceInStarkMode:*(unsigned __int8 *)(a1 + 85)];
  [v5 setSupportsCarPlayVehicleData:*(unsigned __int8 *)(a1 + 86)];
  [v5 setIsDeviceWatchAuthenticated:*(unsigned __int8 *)(a1 + 87)];
  [v5 setAreAnnouncementRequestsPermittedByPresentationWhileActive:*(unsigned __int8 *)(a1 + 88)];
  LODWORD(v4) = *(_DWORD *)(a1 + 80);
  [v5 setOutputVolume:v4];
  [v5 setTapToSiriAudioPlaybackRequest:*(void *)(a1 + 40)];
  [v5 setTwoShotAudioPlaybackRequest:*(void *)(a1 + 48)];
  [v5 setDeviceSetupFlowBeginDate:*(void *)(a1 + 56)];
  [v5 setDeviceSetupFlowEndDate:*(void *)(a1 + 64)];
}

- (AFClientConfiguration)init
{
  return [(AFClientConfiguration *)self initWithBuilder:0];
}

- (AFClientConfiguration)initWithBuilder:(id)a3
{
  double v4 = (void (**)(id, _AFClientConfigurationMutation *))a3;
  v25.receiver = self;
  v25.super_class = (Class)AFClientConfiguration;
  id v5 = [(AFClientConfiguration *)&v25 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFClientConfigurationMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFClientConfigurationMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_AFClientConfigurationMutation *)v7 getAccessibilityState];
      uint64_t v9 = [v8 copy];
      accessibilityState = v6->_accessibilityState;
      v6->_accessibilityState = (AFAccessibilityState *)v9;

      v6->_unint64_t deviceRingerSwitchState = [(_AFClientConfigurationMutation *)v7 getDeviceRingerSwitchState];
      v6->_BOOL isDeviceInCarDNDMode = [(_AFClientConfigurationMutation *)v7 getIsDeviceInCarDNDMode];
      v6->_BOOL isDeviceInStarkMode = [(_AFClientConfigurationMutation *)v7 getIsDeviceInStarkMode];
      v6->_BOOL supportsCarPlayVehicleData = [(_AFClientConfigurationMutation *)v7 getSupportsCarPlayVehicleData];
      v6->_BOOL isDeviceWatchAuthenticated = [(_AFClientConfigurationMutation *)v7 getIsDeviceWatchAuthenticated];
      v6->_BOOL areAnnouncementRequestsPermittedByPresentationWhileActive = [(_AFClientConfigurationMutation *)v7 getAreAnnouncementRequestsPermittedByPresentationWhileActive];
      [(_AFClientConfigurationMutation *)v7 getOutputVolume];
      v6->_float outputVolume = v11;
      uint64_t v12 = [(_AFClientConfigurationMutation *)v7 getTapToSiriAudioPlaybackRequest];
      uint64_t v13 = [v12 copy];
      tapToSiriAudioPlaybackRequest = v6->_tapToSiriAudioPlaybackRequest;
      v6->_tapToSiriAudioPlaybackRequest = (AFAudioPlaybackRequest *)v13;

      uint64_t v15 = [(_AFClientConfigurationMutation *)v7 getTwoShotAudioPlaybackRequest];
      uint64_t v16 = [v15 copy];
      twoShotAudioPlaybackRequest = v6->_twoShotAudioPlaybackRequest;
      v6->_twoShotAudioPlaybackRequest = (AFAudioPlaybackRequest *)v16;

      objc_super v18 = [(_AFClientConfigurationMutation *)v7 getDeviceSetupFlowBeginDate];
      uint64_t v19 = [v18 copy];
      deviceSetupFlowBeginDate = v6->_deviceSetupFlowBeginDate;
      v6->_deviceSetupFlowBeginDate = (NSDate *)v19;

      id v21 = [(_AFClientConfigurationMutation *)v7 getDeviceSetupFlowEndDate];
      uint64_t v22 = [v21 copy];
      deviceSetupFlowEndDate = v6->_deviceSetupFlowEndDate;
      v6->_deviceSetupFlowEndDate = (NSDate *)v22;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  double v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  double v4 = (void (**)(id, _AFClientConfigurationMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFClientConfigurationMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFClientConfigurationMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(AFClientConfiguration);
      uint64_t v7 = [(_AFClientConfigurationMutation *)v5 getAccessibilityState];
      uint64_t v8 = [v7 copy];
      accessibilityState = v6->_accessibilityState;
      v6->_accessibilityState = (AFAccessibilityState *)v8;

      v6->_unint64_t deviceRingerSwitchState = [(_AFClientConfigurationMutation *)v5 getDeviceRingerSwitchState];
      v6->_BOOL isDeviceInCarDNDMode = [(_AFClientConfigurationMutation *)v5 getIsDeviceInCarDNDMode];
      v6->_BOOL isDeviceInStarkMode = [(_AFClientConfigurationMutation *)v5 getIsDeviceInStarkMode];
      v6->_BOOL supportsCarPlayVehicleData = [(_AFClientConfigurationMutation *)v5 getSupportsCarPlayVehicleData];
      v6->_BOOL isDeviceWatchAuthenticated = [(_AFClientConfigurationMutation *)v5 getIsDeviceWatchAuthenticated];
      v6->_BOOL areAnnouncementRequestsPermittedByPresentationWhileActive = [(_AFClientConfigurationMutation *)v5 getAreAnnouncementRequestsPermittedByPresentationWhileActive];
      [(_AFClientConfigurationMutation *)v5 getOutputVolume];
      v6->_float outputVolume = v10;
      float v11 = [(_AFClientConfigurationMutation *)v5 getTapToSiriAudioPlaybackRequest];
      uint64_t v12 = [v11 copy];
      tapToSiriAudioPlaybackRequest = v6->_tapToSiriAudioPlaybackRequest;
      v6->_tapToSiriAudioPlaybackRequest = (AFAudioPlaybackRequest *)v12;

      BOOL v14 = [(_AFClientConfigurationMutation *)v5 getTwoShotAudioPlaybackRequest];
      uint64_t v15 = [v14 copy];
      twoShotAudioPlaybackRequest = v6->_twoShotAudioPlaybackRequest;
      v6->_twoShotAudioPlaybackRequest = (AFAudioPlaybackRequest *)v15;

      int v17 = [(_AFClientConfigurationMutation *)v5 getDeviceSetupFlowBeginDate];
      uint64_t v18 = [v17 copy];
      deviceSetupFlowBeginDate = v6->_deviceSetupFlowBeginDate;
      v6->_deviceSetupFlowBeginDate = (NSDate *)v18;

      id v20 = [(_AFClientConfigurationMutation *)v5 getDeviceSetupFlowEndDate];
      uint64_t v21 = [v20 copy];
      deviceSetupFlowEndDate = v6->_deviceSetupFlowEndDate;
      v6->_deviceSetupFlowEndDate = (NSDate *)v21;
    }
    else
    {
      v6 = (AFClientConfiguration *)[(AFClientConfiguration *)self copy];
    }
  }
  else
  {
    v6 = (AFClientConfiguration *)[(AFClientConfiguration *)self copy];
  }

  return v6;
}

@end