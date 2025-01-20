@interface _HMCameraUserSettings
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)areActivityZonesIncludedForSignificantEventDetection;
- (BOOL)isCameraManuallyDisabled;
- (BOOL)isEqual:(id)a3;
- (HMCameraUserNotificationSettings)notificationSettings;
- (NSArray)attributeDescriptions;
- (NSSet)activityZones;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)UUID;
- (_HMCameraUserSettings)initWithCoder:(id)a3;
- (_HMCameraUserSettings)initWithUUID:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)accessModeAtHome;
- (unint64_t)accessModeNotAtHome;
- (unint64_t)currentAccessMode;
- (unint64_t)hash;
- (unint64_t)recordingEventTriggers;
- (unint64_t)supportedFeatures;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessModeAtHome:(unint64_t)a3;
- (void)setAccessModeNotAtHome:(unint64_t)a3;
- (void)setActivityZones:(id)a3;
- (void)setActivityZonesIncludedForSignificantEventDetection:(BOOL)a3;
- (void)setCameraManuallyDisabled:(BOOL)a3;
- (void)setCurrentAccessMode:(unint64_t)a3;
- (void)setNotificationSettings:(id)a3;
- (void)setRecordingEventTriggers:(unint64_t)a3;
- (void)setSupportedFeatures:(unint64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation _HMCameraUserSettings

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(_HMCameraUserSettings *)self UUID];
  [v7 encodeObject:v4 forKey:@"hmcus.id"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings supportedFeatures](self, "supportedFeatures"), @"hmcus.sf");
  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings accessModeAtHome](self, "accessModeAtHome"), @"hmcus.ah");
  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings accessModeNotAtHome](self, "accessModeNotAtHome"), @"hmcus.nah");
  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings currentAccessMode](self, "currentAccessMode"), @"hmcus.cam");
  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings recordingEventTriggers](self, "recordingEventTriggers"), @"hmcus.rtc");
  objc_msgSend(v7, "encodeBool:forKey:", -[_HMCameraUserSettings isCameraManuallyDisabled](self, "isCameraManuallyDisabled"), @"hmcus.cmd");
  v5 = [(_HMCameraUserSettings *)self notificationSettings];
  [v7 encodeObject:v5 forKey:@"hmcus.ns"];

  v6 = [(_HMCameraUserSettings *)self activityZones];
  [v7 encodeObject:v6 forKey:@"hmcus.az"];

  objc_msgSend(v7, "encodeBool:forKey:", -[_HMCameraUserSettings areActivityZonesIncludedForSignificantEventDetection](self, "areActivityZonesIncludedForSignificantEventDetection"), @"hmcus.azifsed");
}

- (HMCameraUserNotificationSettings)notificationSettings
{
  return (HMCameraUserNotificationSettings *)objc_getProperty(self, a2, 64, 1);
}

- (_HMCameraUserSettings)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hmcus.id"];
  if (v5)
  {
    v6 = [(_HMCameraUserSettings *)self initWithUUID:v5];
    -[_HMCameraUserSettings setSupportedFeatures:](v6, "setSupportedFeatures:", [v4 decodeIntegerForKey:@"hmcus.sf"]);
    -[_HMCameraUserSettings setAccessModeAtHome:](v6, "setAccessModeAtHome:", [v4 decodeIntegerForKey:@"hmcus.ah"]);
    -[_HMCameraUserSettings setAccessModeNotAtHome:](v6, "setAccessModeNotAtHome:", [v4 decodeIntegerForKey:@"hmcus.nah"]);
    -[_HMCameraUserSettings setCurrentAccessMode:](v6, "setCurrentAccessMode:", [v4 decodeIntegerForKey:@"hmcus.cam"]);
    -[_HMCameraUserSettings setRecordingEventTriggers:](v6, "setRecordingEventTriggers:", [v4 decodeIntegerForKey:@"hmcus.rtc"]);
    -[_HMCameraUserSettings setCameraManuallyDisabled:](v6, "setCameraManuallyDisabled:", [v4 decodeBoolForKey:@"hmcus.cmd"]);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hmcus.ns"];
    [(_HMCameraUserSettings *)v6 setNotificationSettings:v7];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v10 = objc_msgSend(v8, "setWithArray:", v9, v18[0]);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"hmcus.az"];
    [(_HMCameraUserSettings *)v6 setActivityZones:v11];

    -[_HMCameraUserSettings setActivityZonesIncludedForSignificantEventDetection:](v6, "setActivityZonesIncludedForSignificantEventDetection:", [v4 decodeBoolForKey:@"hmcus.azifsed"]);
    v12 = v6;
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)setSupportedFeatures:(unint64_t)a3
{
  self->_supportedFeatures = a3;
}

- (void)setRecordingEventTriggers:(unint64_t)a3
{
  self->_recordingEventTriggers = a3;
}

- (void)setNotificationSettings:(id)a3
{
}

- (void)setCurrentAccessMode:(unint64_t)a3
{
  self->_currentAccessMode = a3;
}

- (void)setCameraManuallyDisabled:(BOOL)a3
{
  self->_cameraManuallyDisabled = a3;
}

- (void)setActivityZonesIncludedForSignificantEventDetection:(BOOL)a3
{
  self->_activityZonesIncludedForSignificantEventDetection = a3;
}

- (void)setActivityZones:(id)a3
{
}

- (void)setAccessModeNotAtHome:(unint64_t)a3
{
  self->_accessModeNotAtHome = a3;
}

- (void)setAccessModeAtHome:(unint64_t)a3
{
  self->_accessModeAtHome = a3;
}

- (_HMCameraUserSettings)initWithUUID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HMCameraUserSettings;
  v6 = [(_HMCameraUserSettings *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    v7->_accessModeAtHome = 0;
    v7->_accessModeNotAtHome = 0;
    v7->_currentAccessMode = 0;
    v8 = objc_alloc_init(HMCameraUserNotificationSettings);
    notificationSettings = v7->_notificationSettings;
    v7->_notificationSettings = v8;

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    activityZones = v7->_activityZones;
    v7->_activityZones = (NSSet *)v10;
  }
  return v7;
}

- (BOOL)isCameraManuallyDisabled
{
  return self->_cameraManuallyDisabled;
}

- (unint64_t)recordingEventTriggers
{
  return self->_recordingEventTriggers;
}

- (BOOL)areActivityZonesIncludedForSignificantEventDetection
{
  return self->_activityZonesIncludedForSignificantEventDetection;
}

- (NSSet)activityZones
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)accessModeNotAtHome
{
  return self->_accessModeNotAtHome;
}

- (unint64_t)accessModeAtHome
{
  return self->_accessModeAtHome;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)currentAccessMode
{
  return self->_currentAccessMode;
}

- (unint64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityZones, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setUUID:(id)a3
{
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v35 = [(_HMCameraUserSettings *)self supportedFeatures];
  id v5 = NSPrintF();
  v6 = objc_msgSend(v4, "initWithName:value:", @"Features", v5, v35, &unk_19D47BA72);
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(_HMCameraUserSettings *)self isCameraManuallyDisabled];
  v8 = HMFBooleanToString();
  v9 = (void *)[v7 initWithName:@"Manually Disabled" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(_HMCameraUserSettings *)self notificationSettings];
  v12 = (void *)[v10 initWithName:@"Notification Settings" value:v11];
  [v3 addObject:v12];

  if (([(_HMCameraUserSettings *)self supportedFeatures] & 2) != 0)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
    v14 = NSString;
    v15 = HMCameraAccessModeAsString([(_HMCameraUserSettings *)self currentAccessMode]);
    v16 = HMCameraAccessModeAsString([(_HMCameraUserSettings *)self accessModeAtHome]);
    v17 = HMCameraAccessModeAsString([(_HMCameraUserSettings *)self accessModeNotAtHome]);
    v18 = [v14 stringWithFormat:@"<Current: %@> <Home: %@> <Away: %@>", v15, v16, v17];
    v19 = (void *)[v13 initWithName:@"Access Modes" value:v18];
    [v3 addObject:v19];

    id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
    unint64_t v36 = [(_HMCameraUserSettings *)self recordingEventTriggers];
    __int16 v21 = NSPrintF();
    uint64_t v22 = objc_msgSend(v20, "initWithName:value:", @"Recording Triggers", v21, v36, &unk_19D47BA40);
    [v3 addObject:v22];

    uint64_t v23 = [(_HMCameraUserSettings *)self activityZones];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F653F8]);
      v26 = [(_HMCameraUserSettings *)self activityZones];
      v27 = [v26 allObjects];
      v28 = [v27 componentsJoinedByString:@","];
      v29 = (void *)[v25 initWithName:@"Activity Zones" value:v28];
      [v3 addObject:v29];

      id v30 = objc_alloc(MEMORY[0x1E4F653F8]);
      [(_HMCameraUserSettings *)self areActivityZonesIncludedForSignificantEventDetection];
      v31 = HMFBooleanToString();
      v32 = (void *)[v30 initWithName:@"Activity Zones Included" value:v31];
      [v3 addObject:v32];
    }
  }
  v33 = (void *)[v3 copy];

  return (NSArray *)v33;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [_HMMutableCameraUserSettings alloc];
  id v5 = [(_HMCameraUserSettings *)self UUID];
  v6 = [(_HMCameraUserSettings *)v4 initWithUUID:v5];

  [(_HMCameraUserSettings *)v6 setSupportedFeatures:[(_HMCameraUserSettings *)self supportedFeatures]];
  [(_HMCameraUserSettings *)v6 setAccessModeAtHome:[(_HMCameraUserSettings *)self accessModeAtHome]];
  [(_HMCameraUserSettings *)v6 setAccessModeNotAtHome:[(_HMCameraUserSettings *)self accessModeNotAtHome]];
  [(_HMCameraUserSettings *)v6 setCurrentAccessMode:[(_HMCameraUserSettings *)self currentAccessMode]];
  [(_HMCameraUserSettings *)v6 setRecordingEventTriggers:[(_HMCameraUserSettings *)self recordingEventTriggers]];
  [(_HMCameraUserSettings *)v6 setCameraManuallyDisabled:[(_HMCameraUserSettings *)self isCameraManuallyDisabled]];
  id v7 = [(_HMCameraUserSettings *)self notificationSettings];
  [(_HMCameraUserSettings *)v6 setNotificationSettings:v7];

  v8 = [(_HMCameraUserSettings *)self activityZones];
  [(_HMCameraUserSettings *)v6 setActivityZones:v8];

  [(_HMCameraUserSettings *)v6 setActivityZonesIncludedForSignificantEventDetection:[(_HMCameraUserSettings *)self areActivityZonesIncludedForSignificantEventDetection]];
  return v6;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  v2 = [(_HMCameraUserSettings *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (unint64_t v7 = [(_HMCameraUserSettings *)self supportedFeatures],
        v7 == [v6 supportedFeatures])
    && (unint64_t v8 = [(_HMCameraUserSettings *)self accessModeAtHome],
        v8 == [v6 accessModeAtHome])
    && (unint64_t v9 = [(_HMCameraUserSettings *)self accessModeNotAtHome],
        v9 == [v6 accessModeNotAtHome])
    && (unint64_t v10 = [(_HMCameraUserSettings *)self currentAccessMode],
        v10 == [v6 currentAccessMode])
    && (unint64_t v11 = [(_HMCameraUserSettings *)self recordingEventTriggers],
        v11 == [v6 recordingEventTriggers])
    && (int v12 = [(_HMCameraUserSettings *)self isCameraManuallyDisabled],
        v12 == [v6 isCameraManuallyDisabled]))
  {
    v15 = [(_HMCameraUserSettings *)self notificationSettings];
    v16 = [v6 notificationSettings];
    if ([v15 isEqual:v16])
    {
      v17 = [(_HMCameraUserSettings *)self activityZones];
      v18 = [v6 activityZones];
      if ([v17 isEqualToSet:v18])
      {
        BOOL v19 = [(_HMCameraUserSettings *)self areActivityZonesIncludedForSignificantEventDetection];
        int v13 = v19 ^ [v6 areActivityZonesIncludedForSignificantEventDetection] ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

@end