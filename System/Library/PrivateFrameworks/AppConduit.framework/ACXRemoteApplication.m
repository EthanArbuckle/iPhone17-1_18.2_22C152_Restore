@interface ACXRemoteApplication
+ (BOOL)supportsSecureCoding;
+ (id)localizedInfoPlistKeysLoadAnywhere;
+ (id)localizedInfoPlistKeysLoadAppOnly;
- (ACXRemoteApplication)init;
- (ACXRemoteApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (ACXRemoteApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (ACXRemoteApplication)initWithCoder:(id)a3;
- (ACXRemoteApplication)initWithSerializedDictionary:(id)a3;
- (BOOL)hasClockfaces;
- (BOOL)hasComplication;
- (BOOL)isBetaApp;
- (BOOL)isCompatibleWithCPUType:(int)a3 subtype:(int)a4;
- (BOOL)isCompatibleWithOSVersion:(id)a3;
- (BOOL)isLocallyAvailable;
- (BOOL)isProfileValidated;
- (BOOL)isRuntimeCompatibleWithOSVersion:(id)a3;
- (BOOL)isSystemApp;
- (BOOL)isTheSameAppAs:(id)a3;
- (MIStoreMetadata)storeMetadata;
- (NSArray)architectureSlices;
- (NSArray)backgroundModes;
- (NSArray)intentsRestrictedWhileLocked;
- (NSArray)intentsSupported;
- (NSArray)supportedComplicationFamilies;
- (NSArray)uiBackgroundModes;
- (NSArray)userActivityTypes;
- (NSDictionary)requiredCapabilities;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)companionAppBundleID;
- (NSString)complicationPrincipalClass;
- (NSString)minimumOSVersion;
- (NSString)sdkVersion;
- (NSString)teamID;
- (NSString)watchKitAppExecutableHash;
- (NSString)watchKitAppExtensionBundleID;
- (NSString)watchKitVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)counterpartIdentifiers;
- (id)description;
- (id)initForTesting;
- (id)serialize;
- (unint64_t)applicationMode;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationMode:(unint64_t)a3;
- (void)setArchitectureSlices:(id)a3;
- (void)setBackgroundModes:(id)a3;
- (void)setBundleShortVersion:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCompanionAppBundleID:(id)a3;
- (void)setComplicationPrincipalClass:(id)a3;
- (void)setHasClockfaces:(BOOL)a3;
- (void)setIntentsRestrictedWhileLocked:(id)a3;
- (void)setIntentsSupported:(id)a3;
- (void)setIsBetaApp:(BOOL)a3;
- (void)setIsLocallyAvailable:(BOOL)a3;
- (void)setIsProfileValidated:(BOOL)a3;
- (void)setMinimumOSVersion:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setSdkVersion:(id)a3;
- (void)setStoreMetadata:(id)a3;
- (void)setSupportedComplicationFamilies:(id)a3;
- (void)setTeamID:(id)a3;
- (void)setUiBackgroundModes:(id)a3;
- (void)setUserActivityTypes:(id)a3;
- (void)setWatchKitAppExecutableHash:(id)a3;
- (void)setWatchKitAppExtensionBundleID:(id)a3;
- (void)setWatchKitVersion:(id)a3;
@end

@implementation ACXRemoteApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)localizedInfoPlistKeysLoadAppOnly
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ACXRemoteApplication;
  v2 = objc_msgSendSuper2(&v6, sel_localizedInfoPlistKeysLoadAppOnly);
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1D008], *MEMORY[0x1E4F1CC48], *MEMORY[0x1E4F1CC70], 0);
  v4 = [v2 setByAddingObjectsFromSet:v3];

  return v4;
}

+ (id)localizedInfoPlistKeysLoadAnywhere
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ACXRemoteApplication;
  v2 = objc_msgSendSuper2(&v6, sel_localizedInfoPlistKeysLoadAnywhere);
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"NSLocationAlwaysUsageDescription", @"NSLocationWhenInUseUsageDescription", @"NSLocationAlwaysAndWhenInUseUsageDescription", @"NSHealthUpdateUsageDescription", @"NSHealthShareUsageDescription", @"NSHealthClinicalHealthRecordsShareUsageDescription", @"NSHealthResearchStudyUsageDescription", @"NSHealthCDARequestUsageDescription", 0);
  v4 = [v2 setByAddingObjectsFromSet:v3];

  return v4;
}

- (ACXRemoteApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)ACXRemoteApplication;
  v5 = [(ACXSyncedApplication *)&v75 initWithCoder:v4];
  objc_super v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  v74.receiver = v5;
  v74.super_class = (Class)ACXRemoteApplication;
  v7 = [(ACXSyncedApplication *)&v74 _rawApplicationName];

  if (!v7)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_15;
    }
LABEL_14:
    MOLogWrite();
LABEL_15:
    v72 = 0;
    goto LABEL_16;
  }
  v6->_isBetaApp = [v4 decodeBoolForKey:@"isBetaApp"];
  v6->_isProfileValidated = [v4 decodeBoolForKey:@"isProfileValidated"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationMode"];
  v6->_applicationMode = [v8 unsignedIntegerValue];

  if (![v4 containsValueForKey:@"companionAppBundleID"]) {
    goto LABEL_10;
  }
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionAppBundleID"];
  companionAppBundleID = v6->_companionAppBundleID;
  v6->_companionAppBundleID = (NSString *)v9;

  if (([v4 containsValueForKey:@"watchKitVersion"] & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchKitVersion"];
  watchKitVersion = v6->_watchKitVersion;
  v6->_watchKitVersion = (NSString *)v11;

  if (([v4 containsValueForKey:@"teamID"] & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamID"];
  teamID = v6->_teamID;
  v6->_teamID = (NSString *)v13;

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"complicationPrincipalClass"];
  complicationPrincipalClass = v6->_complicationPrincipalClass;
  v6->_complicationPrincipalClass = (NSString *)v15;

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"supportedComplicationFamilies"];
  supportedComplicationFamilies = v6->_supportedComplicationFamilies;
  v6->_supportedComplicationFamilies = (NSArray *)v20;

  if (([v4 containsValueForKey:@"watchKitAppExtensionBundleID"] & 1) == 0)
  {
LABEL_10:
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchKitAppExtensionBundleID"];
  watchKitAppExtensionBundleID = v6->_watchKitAppExtensionBundleID;
  v6->_watchKitAppExtensionBundleID = (NSString *)v22;

  uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
  bundleVersion = v6->_bundleVersion;
  v6->_bundleVersion = (NSString *)v24;

  uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleShortVersion"];
  bundleShortVersion = v6->_bundleShortVersion;
  v6->_bundleShortVersion = (NSString *)v26;

  uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumOSVersion"];
  minimumOSVersion = v6->_minimumOSVersion;
  v6->_minimumOSVersion = (NSString *)v28;

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"intentsRestrictedWhileLocked"];
  intentsRestrictedWhileLocked = v6->_intentsRestrictedWhileLocked;
  v6->_intentsRestrictedWhileLocked = (NSArray *)v33;

  v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"intentsSupported"];
  intentsSupported = v6->_intentsSupported;
  v6->_intentsSupported = (NSArray *)v38;

  v40 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  v43 = objc_msgSend(v40, "setWithObjects:", v41, v42, objc_opt_class(), 0);
  uint64_t v44 = [v4 decodeObjectOfClasses:v43 forKey:@"requiredCapabilities"];
  requiredCapabilities = v6->_requiredCapabilities;
  v6->_requiredCapabilities = (NSDictionary *)v44;

  v46 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v47 = objc_opt_class();
  v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"architectureSlices"];
  architectureSlices = v6->_architectureSlices;
  v6->_architectureSlices = (NSArray *)v49;

  uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchKitAppExecutableHash"];
  watchKitAppExecutableHash = v6->_watchKitAppExecutableHash;
  v6->_watchKitAppExecutableHash = (NSString *)v51;

  v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  v55 = objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  uint64_t v56 = [v4 decodeObjectOfClasses:v55 forKey:@"userActivityTypes"];
  userActivityTypes = v6->_userActivityTypes;
  v6->_userActivityTypes = (NSArray *)v56;

  v6->_isLocallyAvailable = [v4 decodeBoolForKey:@"isLocallyAvailable"];
  uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeMetadata"];
  storeMetadata = v6->_storeMetadata;
  v6->_storeMetadata = (MIStoreMetadata *)v58;

  uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sdkVersion"];
  sdkVersion = v6->_sdkVersion;
  v6->_sdkVersion = (NSString *)v60;

  v62 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v63 = objc_opt_class();
  v64 = objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
  uint64_t v65 = [v4 decodeObjectOfClasses:v64 forKey:@"backgroundModes"];
  backgroundModes = v6->_backgroundModes;
  v6->_backgroundModes = (NSArray *)v65;

  v67 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v68 = objc_opt_class();
  v69 = objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0);
  uint64_t v70 = [v4 decodeObjectOfClasses:v69 forKey:@"uiBackgroundModes"];
  uiBackgroundModes = v6->_uiBackgroundModes;
  v6->_uiBackgroundModes = (NSArray *)v70;

LABEL_8:
  v72 = v6;
LABEL_16:

  return v72;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)ACXRemoteApplication;
  return [(ACXSyncedApplication *)&v3 initForTesting];
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACXRemoteApplication;
  id v4 = a3;
  [(ACXSyncedApplication *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBetaApp, @"isBetaApp", v6.receiver, v6.super_class);
  [v4 encodeBool:self->_isProfileValidated forKey:@"isProfileValidated"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_applicationMode];
  [v4 encodeObject:v5 forKey:@"applicationMode"];

  [v4 encodeObject:self->_companionAppBundleID forKey:@"companionAppBundleID"];
  [v4 encodeObject:self->_watchKitVersion forKey:@"watchKitVersion"];
  [v4 encodeObject:self->_teamID forKey:@"teamID"];
  [v4 encodeObject:self->_complicationPrincipalClass forKey:@"complicationPrincipalClass"];
  [v4 encodeObject:self->_supportedComplicationFamilies forKey:@"supportedComplicationFamilies"];
  [v4 encodeObject:self->_watchKitAppExtensionBundleID forKey:@"watchKitAppExtensionBundleID"];
  [v4 encodeObject:self->_bundleVersion forKey:@"bundleVersion"];
  [v4 encodeObject:self->_bundleShortVersion forKey:@"bundleShortVersion"];
  [v4 encodeObject:self->_minimumOSVersion forKey:@"minimumOSVersion"];
  [v4 encodeObject:self->_intentsRestrictedWhileLocked forKey:@"intentsRestrictedWhileLocked"];
  [v4 encodeObject:self->_intentsSupported forKey:@"intentsSupported"];
  [v4 encodeObject:self->_requiredCapabilities forKey:@"requiredCapabilities"];
  [v4 encodeObject:self->_architectureSlices forKey:@"architectureSlices"];
  [v4 encodeObject:self->_watchKitAppExecutableHash forKey:@"watchKitAppExecutableHash"];
  [v4 encodeObject:self->_userActivityTypes forKey:@"userActivityTypes"];
  [v4 encodeBool:self->_isLocallyAvailable forKey:@"isLocallyAvailable"];
  [v4 encodeObject:self->_storeMetadata forKey:@"storeMetadata"];
  [v4 encodeObject:self->_sdkVersion forKey:@"sdkVersion"];
  [v4 encodeObject:self->_backgroundModes forKey:@"backgroundModes"];
  [v4 encodeObject:self->_uiBackgroundModes forKey:@"uiBackgroundModes"];
}

- (ACXRemoteApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACXRemoteApplication;
  return [(ACXSyncedApplication *)&v3 init];
}

- (ACXRemoteApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACXRemoteApplication;
  v10 = [(ACXSyncedApplication *)&v13 initWithApplicationRecord:v8 databaseUUID:v9 sequenceNumber:a5];
  if (v10)
  {
    uint64_t v11 = [v8 bundleIdentifier];
    [(ACXSyncedApplication *)v10 setBundleIdentifier:v11];

    [(ACXSyncedApplication *)v10 setDatabaseUUID:v9];
    [(ACXSyncedApplication *)v10 setSequenceNumber:a5];
    -[ACXSyncedApplication setSupportsAlwaysOnDisplay:](v10, "setSupportsAlwaysOnDisplay:", [v8 supportsAlwaysOnDisplay]);
    -[ACXSyncedApplication setDefaultsToPrivateAlwaysOnDisplayTreatment:](v10, "setDefaultsToPrivateAlwaysOnDisplayTreatment:", [v8 defaultsToPrivateAlwaysOnDisplayTreatment]);
    -[ACXSyncedApplication setIsEligibleForWatchAppInstall:](v10, "setIsEligibleForWatchAppInstall:", [v8 isEligibleForWatchAppInstall]);
  }

  return v10;
}

- (ACXRemoteApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ACXRemoteApplication;
  return [(ACXSyncedApplication *)&v6 initWithBundleID:a3 databaseUUID:a4 sequenceNumber:a5];
}

- (ACXRemoteApplication)initWithSerializedDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v80.receiver = self;
    v80.super_class = (Class)ACXRemoteApplication;
    self = [(ACXSyncedApplication *)&v80 initWithSerializedDictionary:v4];

    if (!self)
    {
LABEL_124:
      self = self;
      id v9 = self;
      goto LABEL_125;
    }
    v79.receiver = self;
    v79.super_class = (Class)ACXRemoteApplication;
    v5 = [(ACXSyncedApplication *)&v79 _rawApplicationName];

    if (v5)
    {
      objc_super v6 = [v4 objectForKeyedSubscript:@"WKBetaAppKey"];
      objc_opt_class();
      id v7 = v6;
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }

      if (v8) {
        self->_isBetaApp = [v8 BOOLValue];
      }

      v10 = [v4 objectForKeyedSubscript:@"applicationMode"];
      objc_opt_class();
      id v11 = v10;
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }

      if (v12) {
        self->_applicationMode = [v12 unsignedIntegerValue];
      }

      objc_super v13 = [v4 objectForKeyedSubscript:@"validatedByProfile"];
      objc_opt_class();
      id v14 = v13;
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }

      if (v15) {
        self->_isProfileValidated = [v15 BOOLValue];
      }

      v16 = [v4 objectForKeyedSubscript:@"SPContainerAppBundleId"];
      objc_opt_class();
      id v17 = v16;
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }

      if (v18) {
        objc_storeStrong((id *)&self->_companionAppBundleID, v18);
      }

      v19 = [v4 objectForKeyedSubscript:@"WKWatchKitVersion"];
      objc_opt_class();
      id v20 = v19;
      if (objc_opt_isKindOfClass()) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }

      if (v21) {
        objc_storeStrong((id *)&self->_watchKitVersion, v21);
      }

      uint64_t v22 = [v4 objectForKeyedSubscript:@"SPApplicationTeamID"];
      objc_opt_class();
      id v23 = v22;
      if (objc_opt_isKindOfClass()) {
        id v24 = v23;
      }
      else {
        id v24 = 0;
      }

      if (v24) {
        objc_storeStrong((id *)&self->_teamID, v24);
      }

      v25 = [v4 objectForKeyedSubscript:@"CLKComplicationPrincipalClass"];
      objc_opt_class();
      id v26 = v25;
      if (objc_opt_isKindOfClass()) {
        id v27 = v26;
      }
      else {
        id v27 = 0;
      }

      if (v27) {
        objc_storeStrong((id *)&self->_complicationPrincipalClass, v27);
      }

      uint64_t v28 = [v4 objectForKeyedSubscript:@"CLKComplicationSupportedFamilies"];
      objc_opt_class();
      id v29 = v28;
      if (objc_opt_isKindOfClass()) {
        id v30 = v29;
      }
      else {
        id v30 = 0;
      }

      if (v30) {
        objc_storeStrong((id *)&self->_supportedComplicationFamilies, v30);
      }

      uint64_t v31 = [v4 objectForKeyedSubscript:@"SPPluginBundleIdKey"];
      objc_opt_class();
      id v32 = v31;
      if (objc_opt_isKindOfClass()) {
        id v33 = v32;
      }
      else {
        id v33 = 0;
      }

      if (v33) {
        objc_storeStrong((id *)&self->_watchKitAppExtensionBundleID, v33);
      }

      v34 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];
      objc_opt_class();
      id v35 = v34;
      if (objc_opt_isKindOfClass()) {
        id v36 = v35;
      }
      else {
        id v36 = 0;
      }

      if (v36) {
        objc_storeStrong((id *)&self->_bundleVersion, v36);
      }

      v37 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1CC70]];
      objc_opt_class();
      id v38 = v37;
      if (objc_opt_isKindOfClass()) {
        id v39 = v38;
      }
      else {
        id v39 = 0;
      }

      if (v39) {
        objc_storeStrong((id *)&self->_bundleShortVersion, v39);
      }

      v40 = [v4 objectForKeyedSubscript:@"watchKitAppSlices"];
      objc_opt_class();
      id v41 = v40;
      if (objc_opt_isKindOfClass()) {
        id v42 = v41;
      }
      else {
        id v42 = 0;
      }

      if (v42) {
        objc_storeStrong((id *)&self->_architectureSlices, v42);
      }

      v43 = [v4 objectForKeyedSubscript:@"MinimumOSVersion"];
      objc_opt_class();
      id v44 = v43;
      if (objc_opt_isKindOfClass()) {
        id v45 = v44;
      }
      else {
        id v45 = 0;
      }

      if (v45) {
        objc_storeStrong((id *)&self->_minimumOSVersion, v45);
      }

      v46 = [v4 objectForKeyedSubscript:@"IntentsRestrictedWhileLockedAgg"];
      objc_opt_class();
      id v47 = v46;
      if (objc_opt_isKindOfClass()) {
        id v48 = v47;
      }
      else {
        id v48 = 0;
      }

      if (v48) {
        objc_storeStrong((id *)&self->_intentsRestrictedWhileLocked, v48);
      }

      uint64_t v49 = [v4 objectForKeyedSubscript:@"IntentsSupportedAgg"];
      objc_opt_class();
      id v50 = v49;
      if (objc_opt_isKindOfClass()) {
        id v51 = v50;
      }
      else {
        id v51 = 0;
      }

      if (v51) {
        objc_storeStrong((id *)&self->_intentsSupported, v51);
      }

      v52 = [v4 objectForKeyedSubscript:@"UIRequiredDeviceCapabilities"];
      objc_opt_class();
      id v53 = v52;
      if (objc_opt_isKindOfClass()) {
        id v54 = v53;
      }
      else {
        id v54 = 0;
      }

      if (v54) {
        objc_storeStrong((id *)&self->_requiredCapabilities, v54);
      }

      v55 = [v4 objectForKeyedSubscript:@"watchKitAppExecutableHash"];
      objc_opt_class();
      id v56 = v55;
      if (objc_opt_isKindOfClass()) {
        id v57 = v56;
      }
      else {
        id v57 = 0;
      }

      if (v57) {
        objc_storeStrong((id *)&self->_watchKitAppExecutableHash, v57);
      }

      uint64_t v58 = [v4 objectForKeyedSubscript:@"NSUserActivityTypes"];
      objc_opt_class();
      id v59 = v58;
      if (objc_opt_isKindOfClass()) {
        id v60 = v59;
      }
      else {
        id v60 = 0;
      }

      if (v60) {
        objc_storeStrong((id *)&self->_userActivityTypes, v60);
      }

      v61 = [v4 objectForKeyedSubscript:@"isLocallyAvailable"];
      objc_opt_class();
      id v62 = v61;
      if (objc_opt_isKindOfClass()) {
        id v63 = v62;
      }
      else {
        id v63 = 0;
      }

      if (v63) {
        self->_isLocallyAvailable = [v63 BOOLValue];
      }

      v64 = [v4 objectForKeyedSubscript:@"storeMetadata"];
      objc_opt_class();
      id v65 = v64;
      if (objc_opt_isKindOfClass()) {
        id v66 = v65;
      }
      else {
        id v66 = 0;
      }

      if (v66)
      {
        v67 = [MEMORY[0x1E4F78078] metadataFromDictionary:v66];
        storeMetadata = self->_storeMetadata;
        self->_storeMetadata = v67;
      }
      v69 = [v4 objectForKeyedSubscript:@"ACXSDKVersionKey"];
      objc_opt_class();
      id v70 = v69;
      if (objc_opt_isKindOfClass()) {
        id v71 = v70;
      }
      else {
        id v71 = 0;
      }

      if (v71) {
        objc_storeStrong((id *)&self->_sdkVersion, v71);
      }

      v72 = [v4 objectForKeyedSubscript:@"ACXBackgroundModesKey"];
      objc_opt_class();
      id v73 = v72;
      if (objc_opt_isKindOfClass()) {
        id v74 = v73;
      }
      else {
        id v74 = 0;
      }

      if (v74) {
        objc_storeStrong((id *)&self->_backgroundModes, v74);
      }

      objc_super v75 = [v4 objectForKeyedSubscript:@"ACXUIBackgroundModesKey"];
      objc_opt_class();
      id v76 = v75;
      if (objc_opt_isKindOfClass()) {
        id v77 = v76;
      }
      else {
        id v77 = 0;
      }

      if (v77) {
        objc_storeStrong((id *)&self->_uiBackgroundModes, v77);
      }

      goto LABEL_124;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  id v9 = 0;
LABEL_125:

  return v9;
}

- (id)serialize
{
  v37.receiver = self;
  v37.super_class = (Class)ACXRemoteApplication;
  objc_super v3 = [(ACXSyncedApplication *)&v37 serialize];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(ACXSyncedApplication *)self bundleIdentifier];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1CFF8]];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXRemoteApplication isBetaApp](self, "isBetaApp"));
  [v4 setObject:v6 forKeyedSubscript:@"WKBetaAppKey"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ACXRemoteApplication applicationMode](self, "applicationMode"));
  [v4 setObject:v7 forKeyedSubscript:@"applicationMode"];

  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXRemoteApplication isProfileValidated](self, "isProfileValidated"));
  [v4 setObject:v8 forKeyedSubscript:@"validatedByProfile"];

  id v9 = [(ACXRemoteApplication *)self companionAppBundleID];
  [v4 setObject:v9 forKeyedSubscript:@"SPContainerAppBundleId"];

  v10 = [(ACXRemoteApplication *)self watchKitVersion];
  [v4 setObject:v10 forKeyedSubscript:@"WKWatchKitVersion"];

  id v11 = [(ACXRemoteApplication *)self teamID];
  [v4 setObject:v11 forKeyedSubscript:@"SPApplicationTeamID"];

  id v12 = [(ACXRemoteApplication *)self complicationPrincipalClass];
  [v4 setObject:v12 forKeyedSubscript:@"CLKComplicationPrincipalClass"];

  objc_super v13 = [(ACXRemoteApplication *)self supportedComplicationFamilies];
  [v4 setObject:v13 forKeyedSubscript:@"CLKComplicationSupportedFamilies"];

  id v14 = [(ACXRemoteApplication *)self watchKitAppExtensionBundleID];

  if (v14)
  {
    id v15 = [(ACXRemoteApplication *)self watchKitAppExtensionBundleID];
    [v4 setObject:v15 forKeyedSubscript:@"SPPluginBundleIdKey"];
  }
  v16 = [(ACXRemoteApplication *)self bundleVersion];

  if (v16)
  {
    id v17 = [(ACXRemoteApplication *)self bundleVersion];
    [v4 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1D020]];
  }
  id v18 = [(ACXRemoteApplication *)self bundleShortVersion];

  if (v18)
  {
    v19 = [(ACXRemoteApplication *)self bundleShortVersion];
    [v4 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1CC70]];
  }
  id v20 = [(ACXRemoteApplication *)self minimumOSVersion];
  [v4 setObject:v20 forKeyedSubscript:@"MinimumOSVersion"];

  id v21 = [(ACXRemoteApplication *)self intentsRestrictedWhileLocked];
  [v4 setObject:v21 forKeyedSubscript:@"IntentsRestrictedWhileLockedAgg"];

  uint64_t v22 = [(ACXRemoteApplication *)self intentsSupported];
  [v4 setObject:v22 forKeyedSubscript:@"IntentsSupportedAgg"];

  id v23 = [(ACXRemoteApplication *)self requiredCapabilities];
  [v4 setObject:v23 forKeyedSubscript:@"UIRequiredDeviceCapabilities"];

  id v24 = [(ACXRemoteApplication *)self architectureSlices];
  [v4 setObject:v24 forKeyedSubscript:@"watchKitAppSlices"];

  v25 = [(ACXRemoteApplication *)self watchKitAppExecutableHash];
  [v4 setObject:v25 forKeyedSubscript:@"watchKitAppExecutableHash"];

  id v26 = [(ACXRemoteApplication *)self userActivityTypes];
  [v4 setObject:v26 forKeyedSubscript:@"NSUserActivityTypes"];

  id v27 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXRemoteApplication isLocallyAvailable](self, "isLocallyAvailable"));
  [v4 setObject:v27 forKeyedSubscript:@"isLocallyAvailable"];

  uint64_t v28 = [(ACXRemoteApplication *)self storeMetadata];
  id v29 = [v28 dictionaryRepresentation];
  [v4 setObject:v29 forKeyedSubscript:@"storeMetadata"];

  id v30 = [(ACXRemoteApplication *)self sdkVersion];
  [v4 setObject:v30 forKeyedSubscript:@"ACXSDKVersionKey"];

  uint64_t v31 = [(ACXRemoteApplication *)self backgroundModes];

  if (v31)
  {
    id v32 = [(ACXRemoteApplication *)self backgroundModes];
    [v4 setObject:v32 forKeyedSubscript:@"ACXBackgroundModesKey"];
  }
  id v33 = [(ACXRemoteApplication *)self uiBackgroundModes];

  if (v33)
  {
    v34 = [(ACXRemoteApplication *)self uiBackgroundModes];
    [v4 setObject:v34 forKeyedSubscript:@"ACXUIBackgroundModesKey"];
  }
  id v35 = (void *)[v4 copy];

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v64.receiver = self;
  v64.super_class = (Class)ACXRemoteApplication;
  id v4 = [(ACXSyncedApplication *)&v64 copyWithZone:a3];
  if (v4)
  {
    v4[80] = [(ACXRemoteApplication *)self isBetaApp];
    v4[81] = [(ACXRemoteApplication *)self isProfileValidated];
    *((void *)v4 + 11) = [(ACXRemoteApplication *)self applicationMode];
    v5 = [(ACXRemoteApplication *)self companionAppBundleID];
    uint64_t v6 = [v5 copy];
    id v7 = (void *)*((void *)v4 + 17);
    *((void *)v4 + 17) = v6;

    id v8 = [(ACXRemoteApplication *)self watchKitVersion];
    uint64_t v9 = [v8 copy];
    v10 = (void *)*((void *)v4 + 16);
    *((void *)v4 + 16) = v9;

    id v11 = [(ACXRemoteApplication *)self teamID];
    uint64_t v12 = [v11 copy];
    objc_super v13 = (void *)*((void *)v4 + 20);
    *((void *)v4 + 20) = v12;

    id v14 = [(ACXRemoteApplication *)self complicationPrincipalClass];
    uint64_t v15 = [v14 copy];
    v16 = (void *)*((void *)v4 + 21);
    *((void *)v4 + 21) = v15;

    id v17 = [(ACXRemoteApplication *)self supportedComplicationFamilies];
    uint64_t v18 = [v17 copy];
    v19 = (void *)*((void *)v4 + 22);
    *((void *)v4 + 22) = v18;

    id v20 = [(ACXRemoteApplication *)self watchKitAppExtensionBundleID];
    uint64_t v21 = [v20 copy];
    uint64_t v22 = (void *)*((void *)v4 + 19);
    *((void *)v4 + 19) = v21;

    id v23 = [(ACXRemoteApplication *)self bundleVersion];
    uint64_t v24 = [v23 copy];
    v25 = (void *)*((void *)v4 + 12);
    *((void *)v4 + 12) = v24;

    id v26 = [(ACXRemoteApplication *)self bundleShortVersion];
    uint64_t v27 = [v26 copy];
    uint64_t v28 = (void *)*((void *)v4 + 13);
    *((void *)v4 + 13) = v27;

    id v29 = [(ACXRemoteApplication *)self minimumOSVersion];
    uint64_t v30 = [v29 copy];
    uint64_t v31 = (void *)*((void *)v4 + 14);
    *((void *)v4 + 14) = v30;

    id v32 = [(ACXRemoteApplication *)self intentsRestrictedWhileLocked];
    uint64_t v33 = [v32 copy];
    v34 = (void *)*((void *)v4 + 23);
    *((void *)v4 + 23) = v33;

    id v35 = [(ACXRemoteApplication *)self intentsSupported];
    uint64_t v36 = [v35 copy];
    objc_super v37 = (void *)*((void *)v4 + 24);
    *((void *)v4 + 24) = v36;

    id v38 = [(ACXRemoteApplication *)self requiredCapabilities];
    uint64_t v39 = [v38 copy];
    v40 = (void *)*((void *)v4 + 15);
    *((void *)v4 + 15) = v39;

    id v41 = [(ACXRemoteApplication *)self architectureSlices];
    uint64_t v42 = [v41 copy];
    v43 = (void *)*((void *)v4 + 26);
    *((void *)v4 + 26) = v42;

    id v44 = [(ACXRemoteApplication *)self watchKitAppExecutableHash];
    uint64_t v45 = [v44 copy];
    v46 = (void *)*((void *)v4 + 18);
    *((void *)v4 + 18) = v45;

    id v47 = [(ACXRemoteApplication *)self userActivityTypes];
    uint64_t v48 = [v47 copy];
    uint64_t v49 = (void *)*((void *)v4 + 25);
    *((void *)v4 + 25) = v48;

    v4[83] = [(ACXRemoteApplication *)self isLocallyAvailable];
    id v50 = [(ACXRemoteApplication *)self storeMetadata];
    uint64_t v51 = [v50 copy];
    v52 = (void *)*((void *)v4 + 27);
    *((void *)v4 + 27) = v51;

    id v53 = [(ACXRemoteApplication *)self sdkVersion];
    uint64_t v54 = [v53 copy];
    v55 = (void *)*((void *)v4 + 28);
    *((void *)v4 + 28) = v54;

    id v56 = [(ACXRemoteApplication *)self backgroundModes];
    uint64_t v57 = [v56 copy];
    uint64_t v58 = (void *)*((void *)v4 + 29);
    *((void *)v4 + 29) = v57;

    id v59 = [(ACXRemoteApplication *)self uiBackgroundModes];
    uint64_t v60 = [v59 copy];
    v61 = (void *)*((void *)v4 + 30);
    *((void *)v4 + 30) = v60;

    id v62 = v4;
  }

  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ACXSyncedApplication *)self bundleIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@<%p> bundleID=%@>", v5, self, v6];

  return v7;
}

- (BOOL)isSystemApp
{
  return ([(ACXSyncedApplication *)self applicationType] & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)hasComplication
{
  v2 = [(ACXRemoteApplication *)self complicationPrincipalClass];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)counterpartIdentifiers
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ACXRemoteApplication *)self companionAppBundleID];
  v12.receiver = self;
  v12.super_class = (Class)ACXRemoteApplication;
  id v4 = [(ACXSyncedApplication *)&v12 counterpartIdentifiers];
  v5 = v4;
  if (v4) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (v4) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v3 == 0;
    }
    if (!v7)
    {
      v13[0] = v3;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  char v9 = [v4 containsObject:v3];
  if (v9)
  {
LABEL_12:
    id v8 = v5;
    goto LABEL_14;
  }
  id v8 = [v5 arrayByAddingObject:v3];
LABEL_14:
  v10 = v8;

  return v10;
}

- (BOOL)isCompatibleWithOSVersion:(id)a3
{
  id v4 = a3;
  v5 = [(ACXRemoteApplication *)self minimumOSVersion];

  if (v5)
  {
    BOOL v6 = [(ACXRemoteApplication *)self minimumOSVersion];
    BOOL v7 = [v4 compare:v6 options:64] != -1;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)isRuntimeCompatibleWithOSVersion:(id)a3
{
  return 1;
}

- (BOOL)isCompatibleWithCPUType:(int)a3 subtype:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    [(ACXSyncedApplication *)self bundleIdentifier];
    uint64_t v20 = v5;
    v19 = uint64_t v21 = v4;
    MOLogWrite();
  }
  if ([(ACXSyncedApplication *)self applicationType] != 2) {
    return 1;
  }
  BOOL v7 = [(ACXRemoteApplication *)self architectureSlices];

  if (!v7) {
    return 1;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [(ACXRemoteApplication *)self architectureSlices];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [v13 objectAtIndexedSubscript:0];
        if ([v14 intValue] == v5)
        {
          BOOL v15 = 1;
          v16 = [v13 objectAtIndexedSubscript:1];
          int v17 = [v16 intValue];

          if (v17 == v4) {
            goto LABEL_18;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)isTheSameAppAs:(id)a3
{
  id v4 = a3;
  if (![(ACXRemoteApplication *)self isProfileValidated]
    && ([v4 isProfileValidated] & 1) == 0)
  {
    BOOL v6 = [(ACXSyncedApplication *)self externalVersionIdentifier];
    uint64_t v10 = [v4 externalVersionIdentifier];
    BOOL v7 = (void *)v10;
    if (!v6 || !v10)
    {
      objc_super v12 = [(ACXRemoteApplication *)self bundleVersion];
      objc_super v13 = [(ACXRemoteApplication *)self bundleShortVersion];
      id v14 = [v4 bundleVersion];
      BOOL v15 = [v4 bundleShortVersion];
      if (ACXObjectsAreTheSameOrSameNullness(v12, v14) && ACXObjectsAreTheSameOrSameNullness(v13, v15))
      {

        BOOL v9 = 1;
      }
      else
      {

        BOOL v9 = 0;
      }
      goto LABEL_10;
    }
    char v8 = [v6 isEqualToNumber:v10];
LABEL_9:
    BOOL v9 = v8;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v5 = [(ACXRemoteApplication *)self watchKitAppExecutableHash];

  if (v5)
  {
    BOOL v6 = [(ACXRemoteApplication *)self watchKitAppExecutableHash];
    BOOL v7 = [v4 watchKitAppExecutableHash];
    char v8 = ACXObjectsAreTheSameOrSameNullness(v6, v7);
    goto LABEL_9;
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)applicationMode
{
  return self->_applicationMode;
}

- (void)setApplicationMode:(unint64_t)a3
{
  self->_applicationMode = a3;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

- (void)setBundleShortVersion:(id)a3
{
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (void)setMinimumOSVersion:(id)a3
{
}

- (NSDictionary)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (NSString)watchKitVersion
{
  return self->_watchKitVersion;
}

- (void)setWatchKitVersion:(id)a3
{
}

- (NSString)companionAppBundleID
{
  return self->_companionAppBundleID;
}

- (void)setCompanionAppBundleID:(id)a3
{
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
}

- (NSString)watchKitAppExtensionBundleID
{
  return self->_watchKitAppExtensionBundleID;
}

- (void)setWatchKitAppExtensionBundleID:(id)a3
{
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (void)setIsBetaApp:(BOOL)a3
{
  self->_isBetaApp = a3;
}

- (BOOL)isProfileValidated
{
  return self->_isProfileValidated;
}

- (void)setIsProfileValidated:(BOOL)a3
{
  self->_isProfileValidated = a3;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)complicationPrincipalClass
{
  return self->_complicationPrincipalClass;
}

- (void)setComplicationPrincipalClass:(id)a3
{
}

- (NSArray)supportedComplicationFamilies
{
  return self->_supportedComplicationFamilies;
}

- (void)setSupportedComplicationFamilies:(id)a3
{
}

- (BOOL)hasClockfaces
{
  return self->_hasClockfaces;
}

- (void)setHasClockfaces:(BOOL)a3
{
  self->_hasClockfaces = a3;
}

- (NSArray)intentsRestrictedWhileLocked
{
  return self->_intentsRestrictedWhileLocked;
}

- (void)setIntentsRestrictedWhileLocked:(id)a3
{
}

- (NSArray)intentsSupported
{
  return self->_intentsSupported;
}

- (void)setIntentsSupported:(id)a3
{
}

- (NSArray)userActivityTypes
{
  return self->_userActivityTypes;
}

- (void)setUserActivityTypes:(id)a3
{
}

- (NSArray)architectureSlices
{
  return self->_architectureSlices;
}

- (void)setArchitectureSlices:(id)a3
{
}

- (BOOL)isLocallyAvailable
{
  return self->_isLocallyAvailable;
}

- (void)setIsLocallyAvailable:(BOOL)a3
{
  self->_isLocallyAvailable = a3;
}

- (MIStoreMetadata)storeMetadata
{
  return self->_storeMetadata;
}

- (void)setStoreMetadata:(id)a3
{
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (void)setSdkVersion:(id)a3
{
}

- (NSArray)backgroundModes
{
  return self->_backgroundModes;
}

- (void)setBackgroundModes:(id)a3
{
}

- (NSArray)uiBackgroundModes
{
  return self->_uiBackgroundModes;
}

- (void)setUiBackgroundModes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiBackgroundModes, 0);
  objc_storeStrong((id *)&self->_backgroundModes, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_architectureSlices, 0);
  objc_storeStrong((id *)&self->_userActivityTypes, 0);
  objc_storeStrong((id *)&self->_intentsSupported, 0);
  objc_storeStrong((id *)&self->_intentsRestrictedWhileLocked, 0);
  objc_storeStrong((id *)&self->_supportedComplicationFamilies, 0);
  objc_storeStrong((id *)&self->_complicationPrincipalClass, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_watchKitAppExtensionBundleID, 0);
  objc_storeStrong((id *)&self->_watchKitAppExecutableHash, 0);
  objc_storeStrong((id *)&self->_companionAppBundleID, 0);
  objc_storeStrong((id *)&self->_watchKitVersion, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);

  objc_storeStrong((id *)&self->_bundleVersion, 0);
}

@end