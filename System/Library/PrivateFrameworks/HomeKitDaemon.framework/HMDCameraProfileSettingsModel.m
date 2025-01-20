@interface HMDCameraProfileSettingsModel
+ (id)hmbProperties;
- (BOOL)accessModeChangeNotificationEnabled;
- (BOOL)activityZonesIncludedForSignificantEventDetection;
- (BOOL)cameraManuallyDisabled;
- (BOOL)hasAnyNotificationFieldsSet;
- (BOOL)reachabilityEventNotificationEnabled;
- (HMDBulletinBoardNotification)smartBulletinBoardNotification;
- (NSSet)activityZones;
- (int64_t)version;
- (unint64_t)accessModeAtHome;
- (unint64_t)accessModeNotAtHome;
- (unint64_t)currentAccessMode;
- (unint64_t)mostPrivateAccessMode;
- (unint64_t)recordingEventTriggers;
- (void)setAccessModeAtHome:(unint64_t)a3;
- (void)setAccessModeNotAtHome:(unint64_t)a3;
- (void)setActivityZones:(id)a3;
- (void)setActivityZonesIncludedForSignificantEventDetection:(BOOL)a3;
- (void)setCameraManuallyDisabled:(BOOL)a3;
- (void)setCurrentAccessMode:(unint64_t)a3;
- (void)setRecordingEventTriggers:(unint64_t)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation HMDCameraProfileSettingsModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_107155 != -1) {
    dispatch_once(&hmbProperties_onceToken_107155, &__block_literal_global_107156);
  }
  v2 = (void *)hmbProperties__properties_107157;
  return v2;
}

void __46__HMDCameraProfileSettingsModel_hmbProperties__block_invoke()
{
  v28[10] = *MEMORY[0x263EF8340];
  v27[0] = @"versionField";
  v23 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v28[0] = v23;
  v27[1] = @"accessModeAtHomeField";
  v22 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v28[1] = v22;
  v27[2] = @"accessModeNotAtHomeField";
  v21 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v28[2] = v21;
  v27[3] = @"recordingStorageDurationField";
  v20 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v28[3] = v20;
  v27[4] = @"recordingEventTriggersField";
  v19 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v28[4] = v19;
  v27[5] = @"smartBulletinBoardNotificationDataField";
  v0 = (void *)MEMORY[0x263F492C0];
  uint64_t v1 = objc_opt_class();
  v18 = [MEMORY[0x263F492C8] excludeFromCloudStorage];
  v26 = v18;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v16 = [v0 fieldWithClass:v1 options:v17];
  v28[5] = v16;
  v27[6] = @"accessModeChangeNotificationEnabledField";
  v2 = (void *)MEMORY[0x263F492C0];
  uint64_t v3 = objc_opt_class();
  v4 = [MEMORY[0x263F492C8] excludeFromCloudStorage];
  v25 = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  v6 = [v2 fieldWithClass:v3 options:v5];
  v28[6] = v6;
  v27[7] = @"reachabilityEventNotificationEnabledField";
  v7 = (void *)MEMORY[0x263F492C0];
  uint64_t v8 = objc_opt_class();
  v9 = [MEMORY[0x263F492C8] excludeFromCloudStorage];
  v24 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v11 = [v7 fieldWithClass:v8 options:v10];
  v28[7] = v11;
  v27[8] = @"activityZonesField";
  v12 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v28[8] = v12;
  v27[9] = @"activityZonesIncludedForSignificantEventDetectionField";
  v13 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v28[9] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:10];
  v15 = (void *)hmbProperties__properties_107157;
  hmbProperties__properties_107157 = v14;
}

- (void)setCameraManuallyDisabled:(BOOL)a3
{
  self->_cameraManuallyDisabled = a3;
}

- (BOOL)cameraManuallyDisabled
{
  return self->_cameraManuallyDisabled;
}

- (void)setCurrentAccessMode:(unint64_t)a3
{
  self->_currentAccessMode = a3;
}

- (unint64_t)currentAccessMode
{
  return self->_currentAccessMode;
}

- (void)setActivityZonesIncludedForSignificantEventDetection:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HMDCameraProfileSettingsModel *)self setActivityZonesIncludedForSignificantEventDetectionField:v4];
}

- (BOOL)activityZonesIncludedForSignificantEventDetection
{
  v2 = [(HMDCameraProfileSettingsModel *)self activityZonesIncludedForSignificantEventDetectionField];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setActivityZones:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v11 = 0;
  v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  if (v5)
  {
    [(HMDCameraProfileSettingsModel *)self setActivityZonesField:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to encode activity zones: %@", buf, 0x16u);
    }
  }
}

- (NSSet)activityZones
{
  v23[2] = *MEMORY[0x263EF8340];
  char v3 = [(HMDCameraProfileSettingsModel *)self activityZonesField];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08928];
    v5 = (void *)MEMORY[0x263EFFA08];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v7 = [v5 setWithArray:v6];
    uint64_t v8 = [(HMDCameraProfileSettingsModel *)self activityZonesField];
    id v18 = 0;
    v9 = [v4 unarchivedObjectOfClasses:v7 fromData:v8 error:&v18];
    id v10 = v18;

    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v13 = (void *)MEMORY[0x230FBD990]();
      __int16 v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode activity zones: %@", buf, 0x16u);
      }
      id v11 = [MEMORY[0x263EFFA08] set];
    }
    v12 = v11;
  }
  else
  {
    v12 = [MEMORY[0x263EFFA08] set];
  }
  return (NSSet *)v12;
}

- (HMDBulletinBoardNotification)smartBulletinBoardNotification
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v3 = [(HMDCameraProfileSettingsModel *)self smartBulletinBoardNotificationDataField];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08928];
    uint64_t v5 = objc_opt_class();
    id v6 = [(HMDCameraProfileSettingsModel *)self smartBulletinBoardNotificationDataField];
    id v14 = 0;
    char v3 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v14];
    id v7 = v14;

    if (v3)
    {
      id v8 = v3;
    }
    else
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode HMDBulletinBoardNotification: %@", buf, 0x16u);
      }
    }
  }
  return (HMDBulletinBoardNotification *)v3;
}

- (BOOL)reachabilityEventNotificationEnabled
{
  v2 = [(HMDCameraProfileSettingsModel *)self reachabilityEventNotificationEnabledField];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)accessModeChangeNotificationEnabled
{
  v2 = [(HMDCameraProfileSettingsModel *)self accessModeChangeNotificationEnabledField];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setRecordingEventTriggers:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HMDCameraProfileSettingsModel *)self setRecordingEventTriggersField:v4];
}

- (unint64_t)recordingEventTriggers
{
  v2 = [(HMDCameraProfileSettingsModel *)self recordingEventTriggersField];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setAccessModeNotAtHome:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HMDCameraProfileSettingsModel *)self setAccessModeNotAtHomeField:v4];
}

- (unint64_t)accessModeNotAtHome
{
  v2 = [(HMDCameraProfileSettingsModel *)self accessModeNotAtHomeField];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setAccessModeAtHome:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HMDCameraProfileSettingsModel *)self setAccessModeAtHomeField:v4];
}

- (unint64_t)accessModeAtHome
{
  v2 = [(HMDCameraProfileSettingsModel *)self accessModeAtHomeField];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setVersion:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HMDCameraProfileSettingsModel *)self setVersionField:v4];
}

- (int64_t)version
{
  v2 = [(HMDCameraProfileSettingsModel *)self versionField];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (unint64_t)mostPrivateAccessMode
{
  int64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraProfileSettingsModel accessModeAtHome](self, "accessModeAtHome"));
  unint64_t v4 = [&unk_26E474128 indexOfObject:v3];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraProfileSettingsModel accessModeNotAtHome](self, "accessModeNotAtHome"));
  unint64_t v6 = [&unk_26E474128 indexOfObject:v5];

  if (v4 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v4;
  }
  id v8 = [&unk_26E474128 objectAtIndex:v7];
  unint64_t v9 = [v8 unsignedIntegerValue];

  return v9;
}

- (BOOL)hasAnyNotificationFieldsSet
{
  int64_t v3 = [(HMDCameraProfileSettingsModel *)self reachabilityEventNotificationEnabledField];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(HMDCameraProfileSettingsModel *)self accessModeChangeNotificationEnabledField];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      unint64_t v6 = [(HMDCameraProfileSettingsModel *)self smartBulletinBoardNotificationDataField];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

@end