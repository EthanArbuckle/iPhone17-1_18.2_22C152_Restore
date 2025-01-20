@interface ACXSyncedApplication
+ (BOOL)supportsSecureCoding;
+ (id)buildLocalizedInfoPlistStringsDictForAppBundleURL:(id)a3 watchKitExtensionURL:(id)a4;
+ (id)localizedAppNameFromRecord:(id)a3;
+ (id)localizedInfoPlistKeysLoadAnywhere;
+ (id)localizedInfoPlistKeysLoadAppOnly;
- (ACXSyncedApplication)init;
- (ACXSyncedApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (ACXSyncedApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (ACXSyncedApplication)initWithCoder:(id)a3;
- (ACXSyncedApplication)initWithSerializedDictionary:(id)a3;
- (BOOL)defaultsToPrivateAlwaysOnDisplayTreatment;
- (BOOL)isDeletable;
- (BOOL)isEligibleForWatchAppInstall;
- (BOOL)isSystemApp;
- (BOOL)supportsAlwaysOnDisplay;
- (NSArray)counterpartIdentifiers;
- (NSDictionary)localizedInfoPlistStrings;
- (NSNumber)externalVersionIdentifier;
- (NSString)_rawApplicationName;
- (NSString)applicationName;
- (NSString)bundleIdentifier;
- (NSUUID)databaseUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForTesting;
- (id)localizedInfoPlistStringsForKeys:(id)a3 fetchingFirstMatchingLocalizationInList:(id)a4;
- (id)serialize;
- (unint64_t)applicationType;
- (unint64_t)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setApplicationType:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCounterpartIdentifiers:(id)a3;
- (void)setDatabaseUUID:(id)a3;
- (void)setDefaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setIsDeletable:(BOOL)a3;
- (void)setIsEligibleForWatchAppInstall:(BOOL)a3;
- (void)setLocalizedInfoPlistStrings:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setSupportsAlwaysOnDisplay:(BOOL)a3;
@end

@implementation ACXSyncedApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)localizedInfoPlistKeysLoadAppOnly
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1D008], *MEMORY[0x1E4F1CC48], 0);
}

+ (id)localizedInfoPlistKeysLoadAnywhere
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

+ (id)localizedAppNameFromRecord:(id)a3
{
  id v3 = a3;
  v4 = [v3 localizedName];
  if (!v4)
  {
    v4 = [v3 localizedShortName];
    if (!v4)
    {
      v5 = [v3 URL];
      v6 = [v5 URLByDeletingPathExtension];
      uint64_t v7 = [v6 lastPathComponent];

      if (v7) {
        v4 = (__CFString *)v7;
      }
      else {
        v4 = @"Unknown Name";
      }
    }
  }

  return v4;
}

- (ACXSyncedApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ACXSyncedApplication;
  v5 = [(ACXSyncedApplication *)&v29 init];
  if (!v5)
  {
LABEL_15:
    v27 = v5;
    goto LABEL_16;
  }
  if (![v4 containsValueForKey:@"bundleIdentifier"])
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v6;

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"databaseUUID"];
  if (v8)
  {
    v9 = v8;
    objc_storeStrong((id *)&v5->_databaseUUID, v8);
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sequenceNumber"];
    v5->_sequenceNumber = [v10 unsignedIntegerValue];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"counterpartIdentifiers"];
    counterpartIdentifiers = v5->_counterpartIdentifiers;
    v5->_counterpartIdentifiers = (NSArray *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationType"];
    v5->_applicationType = [v16 unsignedIntegerValue];

    v5->_isDeletable = [v4 decodeBoolForKey:@"isDeletable"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"localizedInfoPlistStrings"];
    localizedInfoPlistStrings = v5->_localizedInfoPlistStrings;
    v5->_localizedInfoPlistStrings = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalVersionIdentifier"];
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v24;

    v5->_supportsAlwaysOnDisplay = [v4 decodeBoolForKey:@"supportsAlwaysOnDisplay"];
    v5->_defaultsToPrivateAlwaysOnDisplayTreatment = [v4 decodeBoolForKey:@"defaultsToPrivateAlwaysOnDisplayTreatment"];
    if ([v4 containsValueForKey:@"isEligibleForWatchAppInstall"]) {
      char v26 = [v4 decodeBoolForKey:@"isEligibleForWatchAppInstall"];
    }
    else {
      char v26 = 1;
    }
    v5->_isEligibleForWatchAppInstall = v26;

    goto LABEL_15;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
LABEL_11:
  }
    MOLogWrite();
LABEL_12:
  v27 = 0;
LABEL_16:

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v7 = a3;
  [v7 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v7 encodeObject:self->_databaseUUID forKey:@"databaseUUID"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_sequenceNumber];
  [v7 encodeObject:v5 forKey:@"sequenceNumber"];

  [v7 encodeObject:self->_counterpartIdentifiers forKey:@"counterpartIdentifiers"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_applicationType];
  [v7 encodeObject:v6 forKey:@"applicationType"];

  [v7 encodeBool:self->_isDeletable forKey:@"isDeletable"];
  [v7 encodeObject:self->_applicationName forKey:@"applicationName"];
  [v7 encodeObject:self->_localizedInfoPlistStrings forKey:@"localizedInfoPlistStrings"];
  [v7 encodeObject:self->_externalVersionIdentifier forKey:@"externalVersionIdentifier"];
  [v7 encodeBool:self->_supportsAlwaysOnDisplay forKey:@"supportsAlwaysOnDisplay"];
  [v7 encodeBool:self->_defaultsToPrivateAlwaysOnDisplayTreatment forKey:@"defaultsToPrivateAlwaysOnDisplayTreatment"];
  [v7 encodeBool:self->_isEligibleForWatchAppInstall forKey:@"isEligibleForWatchAppInstall"];
}

- (ACXSyncedApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACXSyncedApplication;
  return [(ACXSyncedApplication *)&v3 init];
}

- (ACXSyncedApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ACXSyncedApplication;
  return [(ACXSyncedApplication *)&v6 init];
}

- (ACXSyncedApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACXSyncedApplication;
  v10 = [(ACXSyncedApplication *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(ACXSyncedApplication *)v10 setBundleIdentifier:v8];
    [(ACXSyncedApplication *)v11 setDatabaseUUID:v9];
    [(ACXSyncedApplication *)v11 setSequenceNumber:a5];
  }

  return v11;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)ACXSyncedApplication;
  return [(ACXSyncedApplication *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = [(ACXSyncedApplication *)self bundleIdentifier];
    uint64_t v6 = [v5 copy];
    id v7 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v6;

    id v8 = [(ACXSyncedApplication *)self databaseUUID];
    uint64_t v9 = [v8 copy];
    v10 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v9;

    *(void *)(v4 + 40) = [(ACXSyncedApplication *)self sequenceNumber];
    v11 = [(ACXSyncedApplication *)self counterpartIdentifiers];
    uint64_t v12 = [v11 copy];
    objc_super v13 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v12;

    *(void *)(v4 + 56) = [(ACXSyncedApplication *)self applicationType];
    *(unsigned char *)(v4 + 8) = [(ACXSyncedApplication *)self isDeletable];
    uint64_t v14 = [(ACXSyncedApplication *)self applicationName];
    uint64_t v15 = [v14 copy];
    v16 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v15;

    uint64_t v17 = [(ACXSyncedApplication *)self localizedInfoPlistStrings];
    uint64_t v18 = [v17 copy];
    v19 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v18;

    uint64_t v20 = [(ACXSyncedApplication *)self externalVersionIdentifier];
    uint64_t v21 = [v20 copy];
    uint64_t v22 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v21;

    *(unsigned char *)(v4 + 9) = [(ACXSyncedApplication *)self supportsAlwaysOnDisplay];
    *(unsigned char *)(v4 + 10) = [(ACXSyncedApplication *)self defaultsToPrivateAlwaysOnDisplayTreatment];
    *(unsigned char *)(v4 + 11) = [(ACXSyncedApplication *)self isEligibleForWatchAppInstall];
    id v23 = (id)v4;
  }

  return (id)v4;
}

- (ACXSyncedApplication)initWithSerializedDictionary:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ACXSyncedApplication;
  v5 = [(ACXSyncedApplication *)&v47 init];
  if (!v5)
  {
LABEL_69:
    uint64_t v21 = v5;
    goto LABEL_70;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = (NSString *)v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v8;

    v10 = [v4 objectForKeyedSubscript:@"DBUUID"];
    objc_opt_class();
    id v11 = v10;
    id v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;

    if (v12)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
      if (!v13)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
          MOLogWrite();
        }

        goto LABEL_24;
      }
      databaseUUID = v5->_databaseUUID;
      v5->_databaseUUID = (NSUUID *)v13;

      uint64_t v15 = [v4 objectForKeyedSubscript:@"sequenceNumber"];
      objc_opt_class();
      id v16 = v15;
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }

      if (v17)
      {
        v5->_sequenceNumber = [v17 unsignedIntegerValue];

        uint64_t v18 = [v4 objectForKeyedSubscript:@"counterpartIdentifiers"];
        objc_opt_class();
        id v19 = v18;
        if (objc_opt_isKindOfClass()) {
          id v20 = v19;
        }
        else {
          id v20 = 0;
        }

        if (v20) {
          objc_storeStrong((id *)&v5->_counterpartIdentifiers, v20);
        }

        uint64_t v22 = [v4 objectForKeyedSubscript:@"applicationType"];
        objc_opt_class();
        id v23 = v22;
        if (objc_opt_isKindOfClass()) {
          id v24 = v23;
        }
        else {
          id v24 = 0;
        }

        if (v24) {
          v5->_applicationType = [v24 unsignedIntegerValue];
        }

        v25 = [v4 objectForKeyedSubscript:@"isDeletable"];
        objc_opt_class();
        id v26 = v25;
        if (objc_opt_isKindOfClass()) {
          id v27 = v26;
        }
        else {
          id v27 = 0;
        }

        if (v27) {
          v5->_isDeletable = [v27 BOOLValue];
        }

        v28 = [v4 objectForKeyedSubscript:@"n"];
        objc_opt_class();
        id v29 = v28;
        if (objc_opt_isKindOfClass()) {
          id v30 = v29;
        }
        else {
          id v30 = 0;
        }

        if (v30) {
          objc_storeStrong((id *)&v5->_applicationName, v30);
        }

        v31 = [v4 objectForKeyedSubscript:@"localizedInfoPlistStrings"];
        objc_opt_class();
        id v32 = v31;
        if (objc_opt_isKindOfClass()) {
          id v33 = v32;
        }
        else {
          id v33 = 0;
        }

        if (v33) {
          objc_storeStrong((id *)&v5->_localizedInfoPlistStrings, v33);
        }

        v34 = [v4 objectForKeyedSubscript:@"ExternalVersionIdentifier"];
        objc_opt_class();
        id v35 = v34;
        if (objc_opt_isKindOfClass()) {
          id v36 = v35;
        }
        else {
          id v36 = 0;
        }

        if (v36) {
          objc_storeStrong((id *)&v5->_externalVersionIdentifier, v36);
        }

        v5->_supportsAlwaysOnDisplay = 1;
        v37 = [v4 objectForKeyedSubscript:@"ACXSupportsAlwaysOnDisplayKey"];
        objc_opt_class();
        id v38 = v37;
        if (objc_opt_isKindOfClass()) {
          id v39 = v38;
        }
        else {
          id v39 = 0;
        }

        if (v39) {
          v5->_supportsAlwaysOnDisplay = [v39 BOOLValue];
        }

        v40 = [v4 objectForKeyedSubscript:@"ACXAppDefaultsToPrivateAlwaysOnDisplayTreatmentKey"];
        objc_opt_class();
        id v41 = v40;
        if (objc_opt_isKindOfClass()) {
          id v42 = v41;
        }
        else {
          id v42 = 0;
        }

        if (v42) {
          v5->_defaultsToPrivateAlwaysOnDisplayTreatment = [v42 BOOLValue];
        }

        v5->_isEligibleForWatchAppInstall = 1;
        v43 = [v4 objectForKeyedSubscript:@"ACXIsEligibleForWatchAppInstallKey"];
        objc_opt_class();
        id v44 = v43;
        if (objc_opt_isKindOfClass()) {
          id v45 = v44;
        }
        else {
          id v45 = 0;
        }

        if (v45) {
          v5->_isEligibleForWatchAppInstall = [v45 BOOLValue];
        }

        goto LABEL_69;
      }
    }
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
LABEL_24:
  uint64_t v21 = 0;
LABEL_70:

  return v21;
}

- (id)serialize
{
  objc_super v3 = objc_opt_new();
  [v3 setObject:self->_bundleIdentifier forKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  id v4 = [(NSUUID *)self->_databaseUUID UUIDString];
  [v3 setObject:v4 forKeyedSubscript:@"DBUUID"];

  v5 = [NSNumber numberWithUnsignedInteger:self->_sequenceNumber];
  [v3 setObject:v5 forKeyedSubscript:@"sequenceNumber"];

  [v3 setObject:self->_counterpartIdentifiers forKeyedSubscript:@"counterpartIdentifiers"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_applicationType];
  [v3 setObject:v6 forKeyedSubscript:@"applicationType"];

  id v7 = [NSNumber numberWithBool:self->_isDeletable];
  [v3 setObject:v7 forKeyedSubscript:@"isDeletable"];

  [v3 setObject:self->_applicationName forKeyedSubscript:@"n"];
  [v3 setObject:self->_localizedInfoPlistStrings forKeyedSubscript:@"localizedInfoPlistStrings"];
  [v3 setObject:self->_externalVersionIdentifier forKeyedSubscript:@"ExternalVersionIdentifier"];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXSyncedApplication supportsAlwaysOnDisplay](self, "supportsAlwaysOnDisplay"));
  [v3 setObject:v8 forKeyedSubscript:@"ACXSupportsAlwaysOnDisplayKey"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXSyncedApplication defaultsToPrivateAlwaysOnDisplayTreatment](self, "defaultsToPrivateAlwaysOnDisplayTreatment"));
  [v3 setObject:v9 forKeyedSubscript:@"ACXAppDefaultsToPrivateAlwaysOnDisplayTreatmentKey"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXSyncedApplication isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall"));
  [v3 setObject:v10 forKeyedSubscript:@"ACXIsEligibleForWatchAppInstallKey"];

  id v11 = (void *)[v3 copy];

  return v11;
}

+ (id)buildLocalizedInfoPlistStringsDictForAppBundleURL:(id)a3 watchKitExtensionURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = [(id)objc_opt_class() localizedInfoPlistKeysLoadAppOnly];
  uint64_t v9 = [(id)objc_opt_class() localizedInfoPlistKeysLoadAnywhere];
  if (v5) {
    _FetchLocalizedKeys(v5, v7, v9);
  }
  v10 = objc_opt_new();
  [v10 unionSet:v9];
  if (v5)
  {
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = [v7 allKeys];
    uint64_t v13 = [v11 setWithArray:v12];
    [v10 minusSet:v13];
  }
  [v10 unionSet:v8];
  _FetchLocalizedKeys(v6, v7, v10);

  uint64_t v14 = (void *)[v7 copy];

  return v14;
}

- (id)localizedInfoPlistStringsForKeys:(id)a3 fetchingFirstMatchingLocalizationInList:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFArrayRef prefArray = (const __CFArray *)a4;
  v31 = objc_opt_new();
  id v29 = self;
  v34 = [(ACXSyncedApplication *)self localizedInfoPlistStrings];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v33 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v11 = objc_msgSend(v34, "objectForKeyedSubscript:", v10, v25, v26);
        id v12 = v11;
        if (v11)
        {
          CFArrayRef v13 = [v11 allKeys];
          CFArrayRef v14 = CFBundleCopyLocalizationsForPreferences(v13, prefArray);
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            [(ACXSyncedApplication *)v29 bundleIdentifier];
            CFArrayRef v27 = prefArray;
            v25 = CFArrayRef v28 = v14;
            CFArrayRef v26 = v13;
            MOLogWrite();
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          CFArrayRef v15 = v14;
          uint64_t v16 = [(__CFArray *)v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v36;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = objc_msgSend(v12, "objectForKeyedSubscript:", *(void *)(*((void *)&v35 + 1) + 8 * j), v25, v26, v27, v28);
                if (v20)
                {
                  uint64_t v22 = (void *)v20;
                  [v31 setObject:v20 forKeyedSubscript:v10];

                  uint64_t v21 = v15;
                  goto LABEL_21;
                }
              }
              uint64_t v17 = [(__CFArray *)v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v21 = [v12 objectForKeyedSubscript:&stru_1F38AAC80];
          if (v21) {
            [v31 setObject:v21 forKeyedSubscript:v10];
          }
LABEL_21:

          goto LABEL_25;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          CFArrayRef v13 = [(ACXSyncedApplication *)v29 bundleIdentifier];
          v25 = v10;
          CFArrayRef v26 = v13;
          MOLogWrite();
LABEL_25:
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v8);
  }

  id v23 = (void *)[v31 copy];

  return v23;
}

- (NSString)_rawApplicationName
{
  return self->_applicationName;
}

- (NSString)applicationName
{
  uint64_t v3 = *MEMORY[0x1E4F1CC48];
  uint64_t v4 = *MEMORY[0x1E4F1D008];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1D008], *MEMORY[0x1E4F1CC48], 0);
  id v6 = [(ACXSyncedApplication *)self localizedInfoPlistStringsForKeys:v5 fetchingFirstMatchingLocalizationInList:0];
  uint64_t v7 = [v6 objectForKeyedSubscript:v3];
  uint64_t v8 = [v6 objectForKeyedSubscript:v4];
  uint64_t v9 = (void *)v8;
  applicationName = v7;
  if (!v7)
  {
    applicationName = (NSString *)v8;
    if (!v8) {
      applicationName = self->_applicationName;
    }
  }
  id v11 = applicationName;

  return v11;
}

- (BOOL)isSystemApp
{
  return [(ACXSyncedApplication *)self applicationType] == 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setApplicationName:(id)a3
{
}

- (NSUUID)databaseUUID
{
  return self->_databaseUUID;
}

- (void)setDatabaseUUID:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (void)setCounterpartIdentifiers:(id)a3
{
}

- (unint64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(unint64_t)a3
{
  self->_applicationType = a3;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)supportsAlwaysOnDisplay
{
  return self->_supportsAlwaysOnDisplay;
}

- (void)setSupportsAlwaysOnDisplay:(BOOL)a3
{
  self->_supportsAlwaysOnDisplay = a3;
}

- (BOOL)defaultsToPrivateAlwaysOnDisplayTreatment
{
  return self->_defaultsToPrivateAlwaysOnDisplayTreatment;
}

- (void)setDefaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a3
{
  self->_defaultsToPrivateAlwaysOnDisplayTreatment = a3;
}

- (BOOL)isEligibleForWatchAppInstall
{
  return self->_isEligibleForWatchAppInstall;
}

- (void)setIsEligibleForWatchAppInstall:(BOOL)a3
{
  self->_isEligibleForWatchAppInstall = a3;
}

- (NSDictionary)localizedInfoPlistStrings
{
  return self->_localizedInfoPlistStrings;
}

- (void)setLocalizedInfoPlistStrings:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedInfoPlistStrings, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end