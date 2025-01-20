@interface GAXSettings
+ (id)sharedInstance;
- (BOOL)isActiveAppSelfLocked;
- (BOOL)selfLockUnmanaged;
- (BOOL)systemDidRestartDueToLowBattery;
- (BOOL)timeRestrictionHasExpired;
- (GAXSettings)init;
- (NSArray)savedAccessibilityTripleClickOptions;
- (NSArray)userConfiguredAppIDs;
- (NSDate)lastActivationDate;
- (NSDate)lastPasscodeSetDate;
- (NSDictionary)savedAccessibilityFeatures;
- (NSDictionary)userAppProfile;
- (NSDictionary)userGlobalProfile;
- (NSNumber)ECID;
- (NSString)activeAppID;
- (NSString)productBuildVersion;
- (NSString)savedASAMAppIdForLostMode;
- (_GAXSettingsFastStorage)fastStorage;
- (id)description;
- (id)mutableUserAppProfile;
- (id)mutableUserGlobalProfile;
- (int)activeAppOrientation;
- (void)setActiveAppID:(id)a3;
- (void)setActiveAppOrientation:(int)a3;
- (void)setActiveAppSelfLocked:(BOOL)a3;
- (void)setECID:(id)a3;
- (void)setFastStorage:(id)a3;
- (void)setLastActivationDate:(id)a3;
- (void)setLastPasscodeSetDate:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setSavedASAMAppIdForLostMode:(id)a3;
- (void)setSavedAccessibilityFeatures:(id)a3;
- (void)setSavedAccessibilityTripleClickOptions:(id)a3;
- (void)setSelfLockUnmanaged:(BOOL)a3;
- (void)setSystemDidRestartDueToLowBattery:(BOOL)a3;
- (void)setTimeRestrictionHasExpired:(BOOL)a3;
- (void)setUserAppProfile:(id)a3;
- (void)setUserConfiguredAppIDs:(id)a3;
- (void)setUserGlobalProfile:(id)a3;
@end

@implementation GAXSettings

+ (id)sharedInstance
{
  if (qword_56100 != -1) {
    dispatch_once(&qword_56100, &stru_49270);
  }
  v2 = (void *)qword_560F8;

  return v2;
}

- (GAXSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)GAXSettings;
  v2 = [(GAXSettings *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_GAXSettingsFastStorage);
    [(GAXSettings *)v2 setFastStorage:v3];
  }
  return v2;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"GAXSettings:<%p>.\n", self];
  v4 = [(GAXSettings *)self activeAppID];
  objc_super v5 = +[NSNumber numberWithInt:[(GAXSettings *)self activeAppOrientation]];
  v6 = +[NSNumber numberWithBool:[(GAXSettings *)self isActiveAppSelfLocked]];
  v7 = +[NSNumber numberWithBool:[(GAXSettings *)self systemDidRestartDueToLowBattery]];
  [v3 appendFormat:@"\tActive App ID: %@. Orientation:%@. Self-Locked:%@ Low-battery-restart:%@\n", v4, v5, v6, v7];

  v8 = [(GAXSettings *)self ECID];
  v9 = [(GAXSettings *)self productBuildVersion];
  v10 = [(GAXSettings *)self lastActivationDate];
  v11 = [(GAXSettings *)self lastPasscodeSetDate];
  [v3 appendFormat:@"\x1BCID:%@ version:%@ activationDate:%@ passcodeSetDate:%@\n", v8, v9, v10, v11];

  v12 = +[NSNumber numberWithBool:[(GAXSettings *)self timeRestrictionHasExpired]];
  [v3 appendFormat:@"\tTime Restriction expired:%@\n", v12];

  v13 = [(GAXSettings *)self userAppProfile];
  v14 = +[NSNumber numberWithInt:v13 != 0];
  v15 = [(GAXSettings *)self userGlobalProfile];
  v16 = +[NSNumber numberWithInt:v15 != 0];
  [v3 appendFormat:@"\tHas User App Profile:%@. Has User Global Profile:%@\n", v14, v16];

  v17 = +[NSMutableString string];
  v18 = [(GAXSettings *)self userConfiguredAppIDs];
  if ([v18 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v19 = [(GAXSettings *)self userConfiguredAppIDs];
    id v20 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v43;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v43 != v22) {
            objc_enumerationMutation(v19);
          }
          [v17 appendFormat:@"%@, ", *(void *)(*((void *)&v42 + 1) + 8 * i)];
        }
        id v21 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v21);
    }
  }
  else
  {
    [v17 appendString:@"None"];
  }
  [v3 appendFormat:@"\tUser Configured Apps: %@\n", v17];
  v24 = [(GAXSettings *)self savedAccessibilityFeatures];
  v25 = +[NSMutableString string];
  if ([v24 count])
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_B184;
    v40[3] = &unk_49298;
    id v41 = v25;
    [v24 enumerateKeysAndObjectsUsingBlock:v40];
  }
  else
  {
    [v25 appendString:@"None"];
  }
  [v3 appendFormat:@"\tSaved AX Features:%@\n", v25];
  v26 = +[NSMutableString string];
  v27 = [(GAXSettings *)self savedAccessibilityTripleClickOptions];
  if ([v27 count])
  {
    v34 = v18;
    v35 = v3;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v28 = v27;
    id v29 = [v28 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v37;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v28);
          }
          [v26 appendFormat:@"%@, ", *(void *)(*((void *)&v36 + 1) + 8 * (void)j)];
        }
        id v30 = [v28 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v30);
    }

    v18 = v34;
    v3 = v35;
  }
  else
  {
    [v26 appendString:@"None"];
  }
  [v3 appendFormat:@"\tSaved Triple-Click Options: %@\n", v26];

  return v3;
}

- (NSArray)userConfiguredAppIDs
{
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 gaxInternalSettingsUserConfiguredAppIDs];

  return (NSArray *)v3;
}

- (void)setUserConfiguredAppIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsUserConfiguredAppIDs:v3];
}

- (NSDictionary)savedAccessibilityFeatures
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 gaxInternalSettingsSavedAccessibilityFeatures];

  return (NSDictionary *)v3;
}

- (void)setSavedAccessibilityFeatures:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsSavedAccessibilityFeatures:v3];
}

- (NSArray)savedAccessibilityTripleClickOptions
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 gaxInternalSettingsSavedAccessibilityTripleClickOptions];

  return (NSArray *)v3;
}

- (void)setSavedAccessibilityTripleClickOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsSavedAccessibilityTripleClickOptions:v3];
}

- (int)activeAppOrientation
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 gaxInternalSettingsActiveAppOrientation];
  int v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setActiveAppOrientation:(int)a3
{
  id v4 = +[NSNumber numberWithInt:*(void *)&a3];
  id v3 = +[AXSettings sharedInstance];
  [v3 setGaxInternalSettingsActiveAppOrientation:v4];
}

- (NSString)activeAppID
{
  v2 = [(GAXSettings *)self fastStorage];
  id v3 = [v2 activeAppID];

  return (NSString *)v3;
}

- (void)setActiveAppID:(id)a3
{
  id v4 = a3;
  objc_super v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_2A460(self, (uint64_t)v4, v5);
  }

  v6 = [(GAXSettings *)self fastStorage];
  [v6 setActiveAppID:v4];
}

- (NSString)savedASAMAppIdForLostMode
{
  v2 = [(GAXSettings *)self fastStorage];
  id v3 = [v2 savedASAMAppIdForLostMode];

  return (NSString *)v3;
}

- (void)setSavedASAMAppIdForLostMode:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXSettings *)self fastStorage];
  [v5 setSavedASAMAppIdForLostMode:v4];
}

- (BOOL)timeRestrictionHasExpired
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 gaxInternalSettingsTimeRestrictionHasExpired];

  return v3;
}

- (void)setTimeRestrictionHasExpired:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsTimeRestrictionHasExpired:v3];
}

- (BOOL)isActiveAppSelfLocked
{
  v2 = [(GAXSettings *)self fastStorage];
  unsigned __int8 v3 = [v2 isActiveAppSelfLocked];

  return v3;
}

- (void)setActiveAppSelfLocked:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GAXSettings *)self fastStorage];
  [v4 setActiveAppSelfLocked:v3];
}

- (BOOL)selfLockUnmanaged
{
  v2 = [(GAXSettings *)self fastStorage];
  unsigned __int8 v3 = [v2 selfLockUnmanaged];

  return v3;
}

- (void)setSelfLockUnmanaged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GAXSettings *)self fastStorage];
  [v4 setSelfLockUnmanaged:v3];
}

- (BOOL)systemDidRestartDueToLowBattery
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 gaxInternalSettingsSystemDidRestartDueToLowBattery];

  return v3;
}

- (void)setSystemDidRestartDueToLowBattery:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsSystemDidRestartDueToLowBattery:v3];
}

- (NSNumber)ECID
{
  v2 = +[AXSettings sharedInstance];
  BOOL v3 = [v2 gaxInternalSettingsECID];

  return (NSNumber *)v3;
}

- (void)setECID:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsECID:v3];
}

- (NSString)productBuildVersion
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 gaxInternalSettingsProductBuildVersion];

  return (NSString *)v3;
}

- (void)setProductBuildVersion:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsProductBuildVersion:v3];
}

- (NSDate)lastActivationDate
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 gaxInternalSettingsLastActivationDate];

  return (NSDate *)v3;
}

- (void)setLastActivationDate:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsLastActivationDate:v3];
}

- (NSDate)lastPasscodeSetDate
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 gaxInternalSettingsLastPasscodeSetDate];

  return (NSDate *)v3;
}

- (void)setLastPasscodeSetDate:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsLastPasscodeSetDate:v3];
}

- (NSDictionary)userAppProfile
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 gaxInternalSettingsUserAppProfile];

  return (NSDictionary *)v3;
}

- (void)setUserAppProfile:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsUserAppProfile:v3];
}

- (NSDictionary)userGlobalProfile
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 gaxInternalSettingsUserGlobalProfile];

  return (NSDictionary *)v3;
}

- (void)setUserGlobalProfile:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setGaxInternalSettingsUserAppProfile:v3];
}

- (id)mutableUserAppProfile
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(GAXSettings *)self userAppProfile];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_BD70;
  v7[3] = &unk_492C0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (id)mutableUserGlobalProfile
{
  v2 = [(GAXSettings *)self userGlobalProfile];
  id v3 = [v2 mutableCopy];

  if (!v3)
  {
    id v3 = +[NSMutableDictionary dictionary];
  }

  return v3;
}

- (_GAXSettingsFastStorage)fastStorage
{
  return self->_fastStorage;
}

- (void)setFastStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end