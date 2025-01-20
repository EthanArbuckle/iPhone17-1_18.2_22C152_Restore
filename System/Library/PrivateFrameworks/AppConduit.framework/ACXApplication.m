@interface ACXApplication
+ (BOOL)_isIndeterminateMISError:(int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)gizmoApplicationsFromCompanionAppRecord:(id)a3 databaseUUID:(id)a4 startingSequenceNumber:(unint64_t)a5;
+ (int)_systemTrustsApplicationWithBundleURL:(id)a3;
- (ACXApplication)init;
- (ACXApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (ACXApplication)initWithApplicationRecord:(id)a3 gizmoBundleIdentifier:(id)a4 databaseUUID:(id)a5 sequenceNumber:(unint64_t)a6;
- (ACXApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (ACXApplication)initWithCoder:(id)a3;
- (ACXApplication)initWithSerializedDictionary:(id)a3;
- (ACXApplication)initWithSerializedDictionary:(id)a3 reevaluatingTrust:(BOOL)a4;
- (ACXApplicationStatus)deviceStatus;
- (BOOL)isEmbeddedPlaceholder;
- (BOOL)isLocallyAvailable;
- (BOOL)isPurchasedReDownload;
- (BOOL)isTrusted;
- (NSArray)clockFaceExtensionPaths;
- (NSString)companionAppName;
- (NSString)sourceAppIdentifier;
- (NSURL)companionAppURL;
- (NSURL)watchAppURL;
- (id)_URLOfFirstItemWithExtension:(id)a3 inDirectory:(id)a4;
- (id)_URLsOfExtensionsInBundleURL:(id)a3 mayNotExist:(BOOL)a4;
- (id)_infoPlistForPluginBundle:(id)a3;
- (id)_mostCurrentWKAppURLInCompanionAppRecord:(id)a3 isPlaceholder:(BOOL *)a4;
- (id)_parseArchitectureSlicesForWatchKitAppExecutableURL:(id)a3;
- (id)_storeMetadataWithError:(id *)a3;
- (id)_watchKitApplicationNameFromWKAppInfoPlist:(id)a3 containerRecord:(id)a4;
- (id)appWithReevaluatedTrust;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForTesting;
- (id)serialize;
- (id)serializeAsRemoteApplication;
- (unint64_t)autoInstallOverride;
- (unint64_t)lsSequenceNumber;
- (void)_evaluateTrustInfoForReevaluation:(BOOL)a3;
- (void)_populateStoreMetadata;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceStatus:(id)a3;
- (void)setIsTrusted:(BOOL)a3;
@end

@implementation ACXApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACXApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ACXApplication;
  v5 = [(ACXRemoteApplication *)&v27 initWithCoder:v4];
  if (!v5) {
    goto LABEL_6;
  }
  if (![v4 containsValueForKey:@"watchAppURL"]) {
    goto LABEL_8;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchAppURL"];
  uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  watchAppURL = v5->_watchAppURL;
  v5->_watchAppURL = (NSURL *)v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsSequenceNumber"];
  v5->_lsSequenceNumber = [v9 unsignedIntegerValue];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"clockFaceExtensionPaths"];
  clockFaceExtensionPaths = v5->_clockFaceExtensionPaths;
  v5->_clockFaceExtensionPaths = (NSArray *)v13;

  v5->_isTrusted = [v4 decodeBoolForKey:@"isTrusted"];
  if (([v4 containsValueForKey:@"companionAppURL"] & 1) == 0)
  {
LABEL_8:
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_10;
    }
LABEL_9:
    MOLogWrite();
LABEL_10:
    v25 = 0;
    goto LABEL_11;
  }
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionAppURL"];
  uint64_t v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
  companionAppURL = v5->_companionAppURL;
  v5->_companionAppURL = (NSURL *)v16;

  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppIdentifier"];
  sourceAppIdentifier = v5->_sourceAppIdentifier;
  v5->_sourceAppIdentifier = (NSString *)v18;

  if (([v4 containsValueForKey:@"companionAppName"] & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionAppName"];
  companionAppName = v5->_companionAppName;
  v5->_companionAppName = (NSString *)v20;

  v5->_isPurchasedReDownload = [v4 decodeBoolForKey:@"isPurchasedReDownload"];
  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoInstallOverride"];
  v5->_autoInstallOverride = [v22 unsignedIntegerValue];

  v5->_isEmbeddedPlaceholder = [v4 decodeBoolForKey:@"isEmbeddedPlaceholder"];
  uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceStatus"];
  deviceStatus = v5->_deviceStatus;
  v5->_deviceStatus = (ACXApplicationStatus *)v23;

LABEL_6:
  v25 = v5;
LABEL_11:

  return v25;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)ACXApplication;
  return [(ACXRemoteApplication *)&v3 initForTesting];
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ACXApplication;
  id v4 = a3;
  [(ACXRemoteApplication *)&v9 encodeWithCoder:v4];
  v5 = [(NSURL *)self->_watchAppURL absoluteString];
  [v4 encodeObject:v5 forKey:@"watchAppURL"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_lsSequenceNumber];
  [v4 encodeObject:v6 forKey:@"lsSequenceNumber"];

  [v4 encodeObject:self->_clockFaceExtensionPaths forKey:@"clockFaceExtensionPaths"];
  [v4 encodeBool:self->_isTrusted forKey:@"isTrusted"];
  uint64_t v7 = [(NSURL *)self->_companionAppURL absoluteString];
  [v4 encodeObject:v7 forKey:@"companionAppURL"];

  [v4 encodeObject:self->_sourceAppIdentifier forKey:@"sourceAppIdentifier"];
  [v4 encodeObject:self->_companionAppName forKey:@"companionAppName"];
  [v4 encodeBool:self->_isPurchasedReDownload forKey:@"isPurchasedReDownload"];
  v8 = [NSNumber numberWithUnsignedInteger:self->_autoInstallOverride];
  [v4 encodeObject:v8 forKey:@"autoInstallOverride"];

  [v4 encodeBool:self->_isEmbeddedPlaceholder forKey:@"isEmbeddedPlaceholder"];
  [v4 encodeObject:self->_deviceStatus forKey:@"deviceStatus"];
}

- (ACXApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACXApplication;
  return [(ACXRemoteApplication *)&v3 init];
}

- (ACXApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ACXApplication;
  return [(ACXRemoteApplication *)&v6 initWithBundleID:a3 databaseUUID:a4 sequenceNumber:a5];
}

- (ACXApplication)initWithSerializedDictionary:(id)a3
{
  return [(ACXApplication *)self initWithSerializedDictionary:a3 reevaluatingTrust:0];
}

- (ACXApplication)initWithSerializedDictionary:(id)a3 reevaluatingTrust:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ACXApplication;
  uint64_t v7 = [(ACXRemoteApplication *)&v42 initWithSerializedDictionary:v6];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"LSSequenceNumber"];
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (!v10) {
      goto LABEL_60;
    }
    v7->_lsSequenceNumber = [v10 unsignedIntegerValue];

    uint64_t v11 = [v6 objectForKeyedSubscript:@"watchAppURLString"];
    objc_opt_class();
    id v12 = v11;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
      if (v14) {
        goto LABEL_15;
      }
    }
    else if (![(ACXRemoteApplication *)v7 isSystemApp])
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_37;
      }
LABEL_36:
      MOLogWrite();
LABEL_37:

LABEL_63:
      v40 = 0;
      goto LABEL_64;
    }
    if (![(ACXRemoteApplication *)v7 isSystemApp]) {
      goto LABEL_34;
    }
    uint64_t v14 = 0;
LABEL_15:
    watchAppURL = v7->_watchAppURL;
    v7->_watchAppURL = (NSURL *)v14;

    uint64_t v16 = [v6 objectForKeyedSubscript:@"ACXClockfaceExtensionPaths"];
    objc_opt_class();
    id v17 = v16;
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    if (v18) {
      objc_storeStrong((id *)&v7->_clockFaceExtensionPaths, v18);
    }

    v19 = [v6 objectForKeyedSubscript:@"isTrusted"];
    objc_opt_class();
    id v20 = v19;
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    if (!v21) {
      goto LABEL_60;
    }
    v7->_isTrusted = [v21 BOOLValue];

    v22 = [v6 objectForKeyedSubscript:@"companionAppURLString"];
    objc_opt_class();
    id v23 = v22;
    if (objc_opt_isKindOfClass()) {
      id v13 = v23;
    }
    else {
      id v13 = 0;
    }

    if (!v13)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_63;
      }
LABEL_62:
      MOLogWrite();
      goto LABEL_63;
    }
    uint64_t v24 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
    if (v24)
    {
      companionAppURL = v7->_companionAppURL;
      v7->_companionAppURL = (NSURL *)v24;

      v26 = [v6 objectForKeyedSubscript:@"sourceAppIdentifier"];
      objc_opt_class();
      id v27 = v26;
      if (objc_opt_isKindOfClass()) {
        id v28 = v27;
      }
      else {
        id v28 = 0;
      }

      if (v28) {
        objc_storeStrong((id *)&v7->_sourceAppIdentifier, v28);
      }

      v29 = [v6 objectForKeyedSubscript:@"companionAppName"];
      objc_opt_class();
      id v30 = v29;
      if (objc_opt_isKindOfClass()) {
        v31 = (NSString *)v30;
      }
      else {
        v31 = 0;
      }

      if (v31)
      {
        companionAppName = v7->_companionAppName;
        v7->_companionAppName = v31;

        v33 = [v6 objectForKeyedSubscript:@"isPurchaseReDownload"];
        objc_opt_class();
        id v34 = v33;
        if (objc_opt_isKindOfClass()) {
          id v35 = v34;
        }
        else {
          id v35 = 0;
        }

        if (v35)
        {
          v7->_isPurchasedReDownload = [v35 BOOLValue];
        }
        else if (![(ACXRemoteApplication *)v7 isSystemApp])
        {
          goto LABEL_60;
        }

        v36 = [v6 objectForKeyedSubscript:@"autoInstallOverride"];
        objc_opt_class();
        v37 = _ACXValidateObject(v36);

        if (v37) {
          v7->_autoInstallOverride = [v37 unsignedIntegerValue];
        }

        v38 = [v6 objectForKeyedSubscript:@"isPlaceholder"];
        objc_opt_class();
        v39 = _ACXValidateObject(v38);

        if (v39)
        {
          v7->_isEmbeddedPlaceholder = [v39 BOOLValue];

          if (v4) {
            [(ACXApplication *)v7 _evaluateTrustInfoForReevaluation:1];
          }
          goto LABEL_59;
        }
      }
LABEL_60:
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_63;
      }
      goto LABEL_62;
    }
LABEL_34:
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_59:
  v40 = v7;
LABEL_64:

  return v40;
}

- (id)serialize
{
  v19.receiver = self;
  v19.super_class = (Class)ACXApplication;
  objc_super v3 = [(ACXRemoteApplication *)&v19 serialize];
  BOOL v4 = (void *)[v3 mutableCopy];

  v5 = [(ACXApplication *)self watchAppURL];
  id v6 = [v5 absoluteString];
  [v4 setObject:v6 forKeyedSubscript:@"watchAppURLString"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ACXApplication lsSequenceNumber](self, "lsSequenceNumber"));
  [v4 setObject:v7 forKeyedSubscript:@"LSSequenceNumber"];

  v8 = [(ACXApplication *)self clockFaceExtensionPaths];
  [v4 setObject:v8 forKeyedSubscript:@"ACXClockfaceExtensionPaths"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXApplication isTrusted](self, "isTrusted"));
  [v4 setObject:v9 forKeyedSubscript:@"isTrusted"];

  id v10 = [(ACXApplication *)self companionAppURL];
  uint64_t v11 = [v10 absoluteString];
  [v4 setObject:v11 forKeyedSubscript:@"companionAppURLString"];

  id v12 = [(ACXApplication *)self sourceAppIdentifier];
  [v4 setObject:v12 forKeyedSubscript:@"sourceAppIdentifier"];

  id v13 = [(ACXApplication *)self companionAppName];
  [v4 setObject:v13 forKeyedSubscript:@"companionAppName"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXApplication isPurchasedReDownload](self, "isPurchasedReDownload"));
  [v4 setObject:v14 forKeyedSubscript:@"isPurchaseReDownload"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ACXApplication autoInstallOverride](self, "autoInstallOverride"));
  [v4 setObject:v15 forKeyedSubscript:@"autoInstallOverride"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ACXApplication isEmbeddedPlaceholder](self, "isEmbeddedPlaceholder"));
  [v4 setObject:v16 forKeyedSubscript:@"isPlaceholder"];

  id v17 = (void *)[v4 copy];

  return v17;
}

- (id)serializeAsRemoteApplication
{
  v4.receiver = self;
  v4.super_class = (Class)ACXApplication;
  v2 = [(ACXRemoteApplication *)&v4 serialize];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v25.receiver = self;
  v25.super_class = (Class)ACXApplication;
  objc_super v4 = [(ACXRemoteApplication *)&v25 copyWithZone:a3];
  if (v4)
  {
    v5 = [(ACXApplication *)self watchAppURL];
    uint64_t v6 = [v5 copy];
    uint64_t v7 = (void *)v4[32];
    v4[32] = v6;

    v4[33] = [(ACXApplication *)self lsSequenceNumber];
    v8 = [(ACXApplication *)self clockFaceExtensionPaths];
    uint64_t v9 = [v8 copy];
    id v10 = (void *)v4[34];
    v4[34] = v9;

    *((unsigned char *)v4 + 248) = [(ACXApplication *)self isTrusted];
    uint64_t v11 = [(ACXApplication *)self companionAppURL];
    uint64_t v12 = [v11 copy];
    id v13 = (void *)v4[35];
    v4[35] = v12;

    uint64_t v14 = [(ACXApplication *)self sourceAppIdentifier];
    uint64_t v15 = [v14 copy];
    uint64_t v16 = (void *)v4[37];
    v4[37] = v15;

    id v17 = [(ACXApplication *)self companionAppName];
    uint64_t v18 = [v17 copy];
    objc_super v19 = (void *)v4[36];
    v4[36] = v18;

    *((unsigned char *)v4 + 249) = [(ACXApplication *)self isPurchasedReDownload];
    v4[39] = [(ACXApplication *)self autoInstallOverride];
    *((unsigned char *)v4 + 250) = [(ACXApplication *)self isEmbeddedPlaceholder];
    id v20 = [(ACXApplication *)self deviceStatus];
    uint64_t v21 = [v20 copy];
    v22 = (void *)v4[38];
    v4[38] = v21;

    id v23 = v4;
  }

  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ACXSyncedApplication *)self bundleIdentifier];
  uint64_t v7 = [(ACXApplication *)self watchAppURL];
  v8 = [v7 path];
  uint64_t v9 = [v3 stringWithFormat:@"<%@<%p> bundleID=%@ path=%@>", v5, self, v6, v8];

  return v9;
}

- (BOOL)isLocallyAvailable
{
  return 1;
}

- (id)_parseArchitectureSlicesForWatchKitAppExecutableURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_super v4 = objc_opt_new();
    id v5 = v3;
    uint64_t v6 = (const char *)[v5 fileSystemRepresentation];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __70__ACXApplication__parseArchitectureSlicesForWatchKitAppExecutableURL___block_invoke;
    uint64_t v14 = &unk_1E6CC6F50;
    id v7 = v4;
    id v15 = v7;
    if ((parse_macho_iterate_slices(v6, (uint64_t)&v11) & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      id v10 = v5;
      MOLogWrite();
    }
    v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __70__ACXApplication__parseArchitectureSlicesForWatchKitAppExecutableURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(unsigned int *)(a3 + 4);
  uint64_t v4 = *(unsigned int *)(a3 + 8);
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    uint64_t v11 = *(unsigned int *)(a3 + 4);
    uint64_t v12 = *(unsigned int *)(a3 + 8);
    MOLogWrite();
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", v5, v11, v12);
  v13[0] = v7;
  v8 = [NSNumber numberWithInt:v4];
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v6 addObject:v9];

  return 1;
}

- (void)_populateStoreMetadata
{
  if ([(ACXSyncedApplication *)self isDeletable]
    || [(ACXSyncedApplication *)self applicationType] == 2)
  {
    id v11 = 0;
    id v3 = [(ACXApplication *)self _storeMetadataWithError:&v11];
    id v4 = v11;
    uint64_t v5 = v4;
    if (v3)
    {
      [(ACXRemoteApplication *)self setStoreMetadata:v3];
LABEL_13:

      return;
    }
    uint64_t v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    v8 = [v7 domain];
    if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v9 = [v7 code];

      if (v9 == 260)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v10 = [(ACXSyncedApplication *)self bundleIdentifier];
      MOLogWrite();
    }
    goto LABEL_12;
  }
}

+ (id)gizmoApplicationsFromCompanionAppRecord:(id)a3 databaseUUID:(id)a4 startingSequenceNumber:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = objc_opt_new();
    id v10 = [v7 counterpartIdentifiers];
    id v11 = v10;
    if (v10 && [v10 count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v20 = v11;
      id obj = v11;
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = [objc_alloc((Class)objc_opt_class()) initWithApplicationRecord:v7 gizmoBundleIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * i) databaseUUID:v8 sequenceNumber:a5 + i];
            if (!v16)
            {

              uint64_t v18 = 0;
              id v11 = v20;
              goto LABEL_21;
            }
            id v17 = (void *)v16;
            [v9 addObject:v16];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          a5 += i;
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v11 = v20;
    }
    else
    {
      uint64_t v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithApplicationRecord:v7 gizmoBundleIdentifier:0 databaseUUID:v8 sequenceNumber:a5];
      if (!v18)
      {
LABEL_21:

        goto LABEL_22;
      }
      [v9 addObject:v18];
    }
    uint64_t v18 = objc_msgSend(v9, "copy", v20);
    goto LABEL_21;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v18 = 0;
LABEL_22:

  return v18;
}

- (ACXApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  return [(ACXApplication *)self initWithApplicationRecord:a3 gizmoBundleIdentifier:0 databaseUUID:a4 sequenceNumber:a5];
}

- (ACXApplication)initWithApplicationRecord:(id)a3 gizmoBundleIdentifier:(id)a4 databaseUUID:(id)a5 sequenceNumber:(unint64_t)a6
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v164 = a4;
  v198.receiver = self;
  v198.super_class = (Class)ACXApplication;
  v165 = v9;
  id v163 = a5;
  id v10 = -[ACXRemoteApplication initWithApplicationRecord:databaseUUID:sequenceNumber:](&v198, sel_initWithApplicationRecord_databaseUUID_sequenceNumber_, v9);

  if (!v10) {
    goto LABEL_259;
  }
  if (v9)
  {
    if ([v9 isPlaceholder])
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_30;
      }
      goto LABEL_6;
    }
    v160 = [v9 bundleIdentifier];
    id v11 = [v9 applicationState];
    char v12 = [v11 isInstalled];

    if ((v12 & 1) == 0)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }

      goto LABEL_30;
    }
    v154 = [v9 compatibilityObject];
    if ([v154 compatibilityState])
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    if (objc_msgSend(v9, "ACX_shouldBeTrackedByAppConduit"))
    {
      if (v160)
      {
        v152 = [v9 typeForInstallMachinery];
        if ([v152 isEqualToString:*MEMORY[0x1E4F22390]])
        {
          uint64_t v13 = 2;
        }
        else
        {
          if (([v152 isEqualToString:*MEMORY[0x1E4F22380]] & 1) == 0)
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
              goto LABEL_257;
            }
            goto LABEL_78;
          }
          uint64_t v13 = 1;
        }
        [(ACXSyncedApplication *)v10 setApplicationType:v13];
        -[ACXRemoteApplication setIsProfileValidated:](v10, "setIsProfileValidated:", [v9 isProfileValidated]);
        [(ACXRemoteApplication *)v10 setCompanionAppBundleID:v160];
        -[ACXRemoteApplication setIsBetaApp:](v10, "setIsBetaApp:", [v9 isBeta]);
        -[ACXSyncedApplication setIsDeletable:](v10, "setIsDeletable:", [v9 isDeletable]);
        id v15 = [v9 iTunesMetadata];
        uint64_t v16 = [v15 sourceApp];
        sourceAppIdentifier = v10->_sourceAppIdentifier;
        v10->_sourceAppIdentifier = (NSString *)v16;

        uint64_t v18 = [v9 URL];
        companionAppURL = v10->_companionAppURL;
        v10->_companionAppURL = (NSURL *)v18;

        if (!v10->_companionAppURL)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_257;
          }
          goto LABEL_78;
        }
        uint64_t v20 = [(id)objc_opt_class() localizedAppNameFromRecord:v9];
        companionAppName = v10->_companionAppName;
        v10->_companionAppName = (NSString *)v20;

        if (!v10->_companionAppName)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_257;
          }
          goto LABEL_78;
        }
        v10->_lsSequenceNumber = [v9 sequenceNumber];
        if ([(ACXRemoteApplication *)v10 isSystemApp])
        {
          if (v164 && [v164 length])
          {
            [(ACXSyncedApplication *)v10 setBundleIdentifier:v164];
            long long v22 = [v9 counterpartIdentifiers];
            if ([v22 containsObject:v164])
            {
              [(ACXApplication *)v10 setIsTrusted:1];
              long long v23 = [(id)objc_opt_class() localizedAppNameFromRecord:v9];
              [(ACXSyncedApplication *)v10 setApplicationName:v23];

              long long v24 = objc_msgSend(v9, "ACX_watchKitAppExtensionBundleID");
              if (v24)
              {
                [(ACXRemoteApplication *)v10 setWatchKitAppExtensionBundleID:v24];
                [(ACXRemoteApplication *)v10 setWatchKitVersion:@"2.0"];
                [(ACXRemoteApplication *)v10 setTeamID:&stru_1F38AAC80];
              }
              [(ACXRemoteApplication *)v10 setApplicationMode:0];

              goto LABEL_258;
            }
            v53 = [v22 componentsJoinedByString:@","];
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
              MOLogWrite();
            }

            goto LABEL_257;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_257;
          }
LABEL_78:
          MOLogWrite();
          goto LABEL_257;
        }
        BOOL v197 = 0;
        id v149 = [(ACXApplication *)v10 _mostCurrentWKAppURLInCompanionAppRecord:v9 isPlaceholder:&v197];
        if (!v149)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
            MOLogWrite();
          }
          goto LABEL_257;
        }
        v10->_isEmbeddedPlaceholder = v197;
        long long v25 = [(ACXApplication *)v10 _URLsOfExtensionsInBundleURL:v149 mayNotExist:0];
        v166 = objc_opt_new();
        long long v195 = 0u;
        long long v196 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        id obj = v25;
        uint64_t v161 = [obj countByEnumeratingWithState:&v193 objects:v204 count:16];
        if (v161)
        {
          int v26 = 0;
          id v157 = *(id *)v194;
          do
          {
            for (uint64_t i = 0; i != v161; ++i)
            {
              if (*(id *)v194 != v157) {
                objc_enumerationMutation(obj);
              }
              uint64_t v28 = *(void *)(*((void *)&v193 + 1) + 8 * i);
              v29 = [(ACXApplication *)v10 _infoPlistForPluginBundle:v28];
              if (v29)
              {
                [v166 setObject:v29 forKeyedSubscript:v28];
                id v30 = [v29 objectForKeyedSubscript:@"NSExtension"];
                v31 = [v30 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];

                if ([v31 isEqualToString:@"com.apple.watchkit"])
                {
                  v32 = [(ACXApplication *)v10 _URLsOfExtensionsInBundleURL:v28 mayNotExist:1];
                  id v155 = v32;
                  v33 = v32;
                  if (v32)
                  {
                    uint64_t v34 = [v32 count];
                    v33 = v155;
                    if (v34)
                    {
                      long long v191 = 0u;
                      long long v192 = 0u;
                      long long v189 = 0u;
                      long long v190 = 0u;
                      id v35 = v155;
                      uint64_t v36 = [v35 countByEnumeratingWithState:&v189 objects:v203 count:16];
                      if (v36)
                      {
                        uint64_t v37 = *(void *)v190;
                        do
                        {
                          for (uint64_t j = 0; j != v36; ++j)
                          {
                            if (*(void *)v190 != v37) {
                              objc_enumerationMutation(v35);
                            }
                            uint64_t v39 = *(void *)(*((void *)&v189 + 1) + 8 * j);
                            v40 = [(ACXApplication *)v10 _infoPlistForPluginBundle:v39];
                            if (v40) {
                              [v166 setObject:v40 forKeyedSubscript:v39];
                            }
                          }
                          uint64_t v36 = [v35 countByEnumeratingWithState:&v189 objects:v203 count:16];
                        }
                        while (v36);
                      }

                      v33 = v155;
                    }
                  }

                  int v26 = 1;
                }
              }
            }
            uint64_t v161 = [obj countByEnumeratingWithState:&v193 objects:v204 count:16];
          }
          while (v161);
        }
        else
        {
          int v26 = 0;
        }

        uint64_t v41 = *MEMORY[0x1E4F1D020];
        uint64_t v42 = *MEMORY[0x1E4F1CC70];
        uint64_t v146 = *MEMORY[0x1E4F1CFF8];
        id v158 = (id)*MEMORY[0x1E4F1CFF0];
        v145 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1D020], *MEMORY[0x1E4F1CC70], *MEMORY[0x1E4F1CC48], *MEMORY[0x1E4F1D008], *MEMORY[0x1E4F1CFF0], @"MinimumOSVersion", @"UIRequiredDeviceCapabilities", @"NSUserActivityTypes", @"WKRunsIndependentlyOfCompanionApp", @"WKApplication", 0);
        v43 = ACXLoadInfoPlist(v149, v145);
        id v148 = v43;
        if (v43)
        {
          if ([v43 count])
          {
            v44 = [v148 objectForKeyedSubscript:v146];
            objc_opt_class();
            v144 = _ACXValidateObject(v44);

            if (v144)
            {
              v45 = [v148 objectForKeyedSubscript:@"WKApplication"];
              int v46 = ACXBooleanValue(v45, 0);

              if ((v46 | v26))
              {
                [(ACXSyncedApplication *)v10 setBundleIdentifier:v144];
                v47 = [v148 objectForKeyedSubscript:v41];
                objc_opt_class();
                v48 = _ACXValidateObject(v47);
                [(ACXRemoteApplication *)v10 setBundleVersion:v48];

                v49 = [v148 objectForKeyedSubscript:v42];
                objc_opt_class();
                v50 = _ACXValidateObject(v49);
                [(ACXRemoteApplication *)v10 setBundleShortVersion:v50];

                v51 = [(ACXApplication *)v10 _watchKitApplicationNameFromWKAppInfoPlist:v148 containerRecord:v165];
                [(ACXSyncedApplication *)v10 setApplicationName:v51];

                [(ACXApplication *)v10 _evaluateTrustInfoForReevaluation:0];
                uint64_t v188 = 0;
                v138 = MobileInstallationCopyAppMetadata();
                id v140 = 0;
                if (v138)
                {
                  if (!v197)
                  {
                    v52 = [v138 watchKitAppExecutableHash];
                    [(ACXRemoteApplication *)v10 setWatchKitAppExecutableHash:v52];
                  }
                  v10->_autoInstallOverride = [v138 autoInstallOverride];
                }
                else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                {
                  v128 = v160;
                  id v134 = v140;
                  MOLogWrite();
                }
                v55 = objc_msgSend(v148, "objectForKeyedSubscript:", @"MinimumOSVersion", v128, v134);
                objc_opt_class();
                v56 = _ACXValidateObject(v55);
                [(ACXRemoteApplication *)v10 setMinimumOSVersion:v56];

                v57 = [v165 iTunesMetadata];
                v10->_isPurchasedReDownload = [v57 isPurchasedRedownload];

                v137 = [v148 objectForKeyedSubscript:@"UIRequiredDeviceCapabilities"];
                if (!v137)
                {
LABEL_130:
                  [(ACXRemoteApplication *)v10 setWatchKitVersion:@"2.0"];
                  v66 = [v165 teamIdentifier];
                  [(ACXRemoteApplication *)v10 setTeamID:v66];

                  v67 = [(ACXRemoteApplication *)v10 teamID];
                  if (!v67
                    || ([(ACXRemoteApplication *)v10 teamID],
                        v68 = objc_claimAutoreleasedReturnValue(),
                        int v69 = [v68 isEqualToString:@"0000000000"],
                        v68,
                        v67,
                        v69))
                  {
                    [(ACXRemoteApplication *)v10 setTeamID:&stru_1F38AAC80];
                  }
                  objc_storeStrong((id *)&v10->_watchAppURL, v149);
                  if (v197) {
                    goto LABEL_141;
                  }
                  v70 = [v148 objectForKeyedSubscript:v158];
                  objc_opt_class();
                  v71 = _ACXValidateObject(v70);

                  if (v71)
                  {
                    v72 = [v149 URLByAppendingPathComponent:v71 isDirectory:0];
                    v73 = [(ACXApplication *)v10 _parseArchitectureSlicesForWatchKitAppExecutableURL:v72];
                    [(ACXRemoteApplication *)v10 setArchitectureSlices:v73];
                  }
                  else
                  {
                    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
                      goto LABEL_140;
                    }
                    v72 = [v149 path];
                    v129 = v72;
                    MOLogWrite();
                  }

LABEL_140:
LABEL_141:
                  v74 = objc_msgSend(v148, "objectForKeyedSubscript:", @"NSUserActivityTypes", v129);
                  objc_opt_class();
                  v139 = _ACXValidateObject(v74);

                  if (v139)
                  {
                    objc_opt_class();
                    if (ACXArrayContainsOnlyClass(v139))
                    {
                      [(ACXRemoteApplication *)v10 setUserActivityTypes:v139];
                    }
                    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                    {
                      v130 = [v149 path];
                      MOLogWrite();
                    }
                  }
                  v75 = objc_msgSend(v148, "objectForKeyedSubscript:", @"WKRunsIndependentlyOfCompanionApp", v130);
                  objc_opt_class();
                  v136 = _ACXValidateObject(v75);

                  if (v136 && ([v136 BOOLValue] & 1) != 0) {
                    uint64_t v76 = 2;
                  }
                  else {
                    uint64_t v76 = 1;
                  }
                  [(ACXRemoteApplication *)v10 setApplicationMode:v76];
                  v141 = objc_opt_new();
                  long long v177 = 0u;
                  long long v178 = 0u;
                  long long v175 = 0u;
                  long long v176 = 0u;
                  id v156 = v166;
                  uint64_t v151 = [v156 countByEnumeratingWithState:&v175 objects:v201 count:16];
                  if (v151)
                  {
                    v147 = 0;
                    uint64_t v150 = *(void *)v176;
LABEL_153:
                    uint64_t v77 = 0;
                    while (1)
                    {
                      if (*(void *)v176 != v150) {
                        objc_enumerationMutation(v156);
                      }
                      v78 = *(void **)(*((void *)&v175 + 1) + 8 * v77);
                      v162 = objc_msgSend(v156, "objectForKeyedSubscript:", v78, v131);
                      v79 = [v162 objectForKeyedSubscript:@"NSExtension"];
                      objc_opt_class();
                      v80 = _ACXValidateObject(v79);

                      if (v80) {
                        break;
                      }
                      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
                        goto LABEL_195;
                      }
                      v80 = [v78 path];
                      v131 = v80;
                      MOLogWrite();
LABEL_194:

LABEL_195:
                      if (++v77 == v151)
                      {
                        uint64_t v120 = [v156 countByEnumeratingWithState:&v175 objects:v201 count:16];
                        uint64_t v151 = v120;
                        if (v120) {
                          goto LABEL_153;
                        }
                        goto LABEL_249;
                      }
                    }
                    v81 = [v80 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
                    objc_opt_class();
                    _ACXValidateObject(v81);
                    id v159 = (id)objc_claimAutoreleasedReturnValue();

                    v82 = v159;
                    if (v159)
                    {
                      if ([v159 isEqualToString:@"com.apple.watchkit"])
                      {
                        id v83 = v78;

                        v84 = [v162 objectForKeyedSubscript:@"CLKComplicationPrincipalClass"];
                        if (v84)
                        {
                          objc_opt_class();
                          v85 = _ACXValidateObject(v84);
                          BOOL v86 = v85 == 0;

                          if (v86)
                          {
                            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                            {
                              v131 = v160;
                              v135 = v84;
                              MOLogWrite();
                            }

                            v84 = 0;
                          }
                        }
                        v87 = objc_msgSend(v162, "objectForKeyedSubscript:", @"CLKComplicationSupportedFamilies", v131, v135);
                        if (v87)
                        {
                          objc_opt_class();
                          v88 = _ACXValidateObject(v87);
                          if (!v88
                            || (objc_opt_class(), char v89 = ACXArrayContainsOnlyClass(v87),
                                                  v88,
                                                  (v89 & 1) == 0))
                          {
                            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                            {
                              v132 = v160;
                              v135 = v87;
                              MOLogWrite();
                            }

                            v87 = 0;
                          }
                        }
                        if (v84) {
                          [(ACXRemoteApplication *)v10 setComplicationPrincipalClass:v84];
                        }
                        if (v87) {
                          [(ACXRemoteApplication *)v10 setSupportedComplicationFamilies:v87];
                        }
                        v90 = objc_msgSend(v162, "objectForKeyedSubscript:", v146, v132);
                        objc_opt_class();
                        v91 = _ACXValidateObject(v90);

                        if (!v91)
                        {
                          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                          {
                            v133 = [v83 path];
                            MOLogWrite();
                          }
                          int v54 = 1;
                          goto LABEL_252;
                        }
                        [(ACXRemoteApplication *)v10 setWatchKitAppExtensionBundleID:v91];
                        v92 = [v162 objectForKeyedSubscript:@"WKRunsIndependentlyOfCompanionApp"];
                        objc_opt_class();
                        v93 = _ACXValidateObject(v92);

                        if (v93 && ([v93 BOOLValue] & 1) != 0) {
                          uint64_t v94 = 2;
                        }
                        else {
                          uint64_t v94 = 1;
                        }
                        [(ACXRemoteApplication *)v10 setApplicationMode:v94];

                        v147 = v83;
                        goto LABEL_191;
                      }
                      if ([v159 isEqualToString:@"com.apple.clockface"])
                      {
                        uint64_t v95 = [v78 path];
                        v84 = (void *)v95;
                        if (v95)
                        {
                          [v141 addObject:v95];
                          v84 = (void *)v95;
                        }
                        goto LABEL_191;
                      }
                      if (![v159 isEqualToString:@"com.apple.intents-service"]) {
                        goto LABEL_192;
                      }
                      v96 = [v80 objectForKeyedSubscript:@"NSExtensionAttributes"];
                      objc_opt_class();
                      v143 = _ACXValidateObject(v96);

                      if (v143)
                      {
                        v97 = [v143 objectForKeyedSubscript:@"IntentsSupported"];
                        objc_opt_class();
                        v142 = _ACXValidateObject(v97);

                        if (v142)
                        {
                          objc_opt_class();
                          if ((ACXArrayContainsOnlyClass(v142) & 1) == 0)
                          {
                            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                            {
                              v131 = [v78 path];
                              MOLogWrite();
                            }
LABEL_241:
                            v84 = v143;
                            goto LABEL_191;
                          }
                          if ([v142 count])
                          {
                            v98 = [(ACXRemoteApplication *)v10 intentsSupported];
                            BOOL v99 = v98 == 0;

                            if (v99)
                            {
                              [(ACXRemoteApplication *)v10 setIntentsSupported:v142];
                            }
                            else
                            {
                              v100 = [(ACXRemoteApplication *)v10 intentsSupported];
                              v101 = (void *)[v100 mutableCopy];

                              long long v173 = 0u;
                              long long v174 = 0u;
                              long long v171 = 0u;
                              long long v172 = 0u;
                              id v102 = v142;
                              uint64_t v103 = [v102 countByEnumeratingWithState:&v171 objects:v200 count:16];
                              if (v103)
                              {
                                uint64_t v104 = *(void *)v172;
                                do
                                {
                                  for (uint64_t k = 0; k != v103; ++k)
                                  {
                                    if (*(void *)v172 != v104) {
                                      objc_enumerationMutation(v102);
                                    }
                                    uint64_t v106 = *(void *)(*((void *)&v171 + 1) + 8 * k);
                                    if (([v101 containsObject:v106] & 1) == 0) {
                                      [v101 addObject:v106];
                                    }
                                  }
                                  uint64_t v103 = [v102 countByEnumeratingWithState:&v171 objects:v200 count:16];
                                }
                                while (v103);
                              }

                              v107 = (void *)[v101 copy];
                              [(ACXRemoteApplication *)v10 setIntentsSupported:v107];
                            }
                          }
                        }
                        v108 = [v143 objectForKeyedSubscript:@"IntentsRestrictedWhileLocked"];
                        objc_opt_class();
                        v109 = _ACXValidateObject(v108);

                        if (v109)
                        {
                          objc_opt_class();
                          if ((ACXArrayContainsOnlyClass(v109) & 1) == 0)
                          {
                            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                            {
                              v131 = [v78 path];
                              MOLogWrite();
                            }
                            goto LABEL_194;
                          }
                          if ([v109 count])
                          {
                            v110 = [(ACXRemoteApplication *)v10 intentsRestrictedWhileLocked];
                            BOOL v111 = v110 == 0;

                            if (v111)
                            {
                              [(ACXRemoteApplication *)v10 setIntentsRestrictedWhileLocked:v109];
                            }
                            else
                            {
                              v112 = [(ACXRemoteApplication *)v10 intentsRestrictedWhileLocked];
                              v113 = (void *)[v112 mutableCopy];

                              long long v169 = 0u;
                              long long v170 = 0u;
                              long long v167 = 0u;
                              long long v168 = 0u;
                              id v114 = v109;
                              uint64_t v115 = [v114 countByEnumeratingWithState:&v167 objects:v199 count:16];
                              if (v115)
                              {
                                uint64_t v116 = *(void *)v168;
                                do
                                {
                                  for (uint64_t m = 0; m != v115; ++m)
                                  {
                                    if (*(void *)v168 != v116) {
                                      objc_enumerationMutation(v114);
                                    }
                                    uint64_t v118 = *(void *)(*((void *)&v167 + 1) + 8 * m);
                                    if (([v113 containsObject:v118] & 1) == 0) {
                                      [v113 addObject:v118];
                                    }
                                  }
                                  uint64_t v115 = [v114 countByEnumeratingWithState:&v167 objects:v199 count:16];
                                }
                                while (v115);
                              }

                              v119 = (void *)[v113 copy];
                              [(ACXRemoteApplication *)v10 setIntentsRestrictedWhileLocked:v119];
                            }
                          }
                        }

                        goto LABEL_241;
                      }
                      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
                        goto LABEL_192;
                      }
                    }
                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_193;
                    }
                    v84 = [v78 path];
                    v131 = v84;
                    MOLogWrite();
LABEL_191:

LABEL_192:
                    v82 = v159;
LABEL_193:

                    goto LABEL_194;
                  }
                  v147 = 0;
LABEL_249:

                  uint64_t v121 = [v141 copy];
                  clockFaceExtensionPaths = v10->_clockFaceExtensionPaths;
                  v10->_clockFaceExtensionPaths = (NSArray *)v121;

                  v123 = [(ACXApplication *)v10 clockFaceExtensionPaths];
                  BOOL v124 = [v123 count] == 0;

                  if (!v124) {
                    [(ACXRemoteApplication *)v10 setHasClockfaces:1];
                  }
                  v125 = [(id)objc_opt_class() buildLocalizedInfoPlistStringsDictForAppBundleURL:v10->_watchAppURL watchKitExtensionURL:v147];
                  [(ACXSyncedApplication *)v10 setLocalizedInfoPlistStrings:v125];

                  v126 = objc_msgSend(v165, "ACX_externalVersionIdentifier");
                  [(ACXSyncedApplication *)v10 setExternalVersionIdentifier:v126];

                  [(ACXApplication *)v10 _populateStoreMetadata];
                  int v54 = 0;
                  id v83 = v147;
LABEL_252:

                  goto LABEL_253;
                }
                objc_opt_class();
                v58 = _ACXValidateObject(v137);
                if (v58)
                {
                  objc_opt_class();
                  if (!ACXArrayContainsOnlyClass(v58))
                  {
LABEL_129:

                    goto LABEL_130;
                  }
                  v59 = objc_opt_new();
                  long long v186 = 0u;
                  long long v187 = 0u;
                  long long v184 = 0u;
                  long long v185 = 0u;
                  id v60 = v58;
                  uint64_t v61 = [v60 countByEnumeratingWithState:&v184 objects:v202 count:16];
                  if (v61)
                  {
                    uint64_t v62 = *(void *)v185;
                    uint64_t v63 = MEMORY[0x1E4F1CC38];
                    do
                    {
                      for (uint64_t n = 0; n != v61; ++n)
                      {
                        if (*(void *)v185 != v62) {
                          objc_enumerationMutation(v60);
                        }
                        [v59 setObject:v63 forKeyedSubscript:*(void *)(*((void *)&v184 + 1) + 8 * n)];
                      }
                      uint64_t v61 = [v60 countByEnumeratingWithState:&v184 objects:v202 count:16];
                    }
                    while (v61);
                  }

                  [(ACXRemoteApplication *)v10 setRequiredCapabilities:v59];
                }
                else
                {
                  objc_opt_class();
                  v65 = _ACXValidateObject(v137);
                  v59 = v65;
                  if (v65)
                  {
                    uint64_t v180 = 0;
                    v181 = &v180;
                    uint64_t v182 = 0x2020000000;
                    char v183 = 1;
                    v179[0] = MEMORY[0x1E4F143A8];
                    v179[1] = 3221225472;
                    v179[2] = __94__ACXApplication_initWithApplicationRecord_gizmoBundleIdentifier_databaseUUID_sequenceNumber___block_invoke;
                    v179[3] = &unk_1E6CC6F78;
                    v179[4] = &v180;
                    [v65 enumerateKeysAndObjectsUsingBlock:v179];
                    if (*((unsigned char *)v181 + 24)) {
                      [(ACXRemoteApplication *)v10 setRequiredCapabilities:v59];
                    }
                    _Block_object_dispose(&v180, 8);
                  }
                }

                goto LABEL_129;
              }
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
LABEL_106:
                id v140 = [v149 path];
                MOLogWrite();
                int v54 = 1;
LABEL_253:

                goto LABEL_254;
              }
            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              goto LABEL_106;
            }
LABEL_107:
            int v54 = 1;
LABEL_254:

            goto LABEL_255;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            int v54 = 1;
LABEL_255:
            v43 = v148;
LABEL_256:

            if (!v54)
            {
LABEL_258:

LABEL_259:
              uint64_t v14 = v10;
              goto LABEL_260;
            }
LABEL_257:

            goto LABEL_30;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          int v54 = 1;
          goto LABEL_256;
        }
        v144 = [v149 path];
        MOLogWrite();
        goto LABEL_107;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_29;
      }
    }
    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
      goto LABEL_29;
    }
LABEL_28:
    MOLogWrite();
LABEL_29:

    goto LABEL_30;
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
    goto LABEL_30;
  }
LABEL_6:
  MOLogWrite();
LABEL_30:
  uint64_t v14 = 0;
LABEL_260:

  return v14;
}

void __94__ACXApplication_initWithApplicationRecord_gizmoBundleIdentifier_databaseUUID_sequenceNumber___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  id v11 = v7;
  if (objc_opt_isKindOfClass())
  {
    if (v11)
    {
      objc_opt_class();
      id v9 = v8;
      id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;

      if (v10) {
        goto LABEL_7;
      }
    }
  }
  else
  {
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  *a4 = 1;
LABEL_7:
}

- (void)_evaluateTrustInfoForReevaluation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ACXRemoteApplication *)self isProfileValidated])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(ACXApplication *)self companionAppURL];
    int v7 = [v5 _systemTrustsApplicationWithBundleURL:v6];

    if (v3 && v7 == 2) {
      return;
    }
    BOOL v8 = v7 == 1;
  }
  else
  {
    BOOL v8 = 1;
  }

  [(ACXApplication *)self setIsTrusted:v8];
}

- (id)appWithReevaluatedTrust
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(ACXRemoteApplication *)self companionAppBundleID];
  id v12 = 0;
  uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v12];
  id v6 = v12;

  if (v5)
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    BOOL v8 = [(ACXSyncedApplication *)self bundleIdentifier];
    id v9 = [(ACXSyncedApplication *)self databaseUUID];
    id v10 = objc_msgSend(v7, "initWithApplicationRecord:gizmoBundleIdentifier:databaseUUID:sequenceNumber:", v5, v8, v9, -[ACXSyncedApplication sequenceNumber](self, "sequenceNumber"));

LABEL_6:
    goto LABEL_7;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    BOOL v8 = [(ACXRemoteApplication *)self companionAppBundleID];
    MOLogWrite();
    id v10 = 0;
    goto LABEL_6;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

+ (BOOL)_isIndeterminateMISError:(int)a3
{
  if (a3) {
    BOOL v3 = a3 == -402620405;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3 && (a3 + 402620379) > 1;
}

+ (int)_systemTrustsApplicationWithBundleURL:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4FBA7C0];
  v15[0] = *MEMORY[0x1E4FBA7E0];
  v15[1] = v5;
  v16[0] = MEMORY[0x1E4F1CC38];
  v16[1] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v7 = [v4 path];
  uint64_t v8 = MISValidateSignature();

  if (v8)
  {
    id v9 = (void *)MISCopyErrorStringForErrorCode();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v4 path];
      uint64_t v13 = v8;
      id v12 = v14 = v9;
      MOLogWrite();
    }
    if (objc_msgSend(a1, "_isIndeterminateMISError:", v8, v12, v13, v14)) {
      int v10 = 2;
    }
    else {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 1;
  }

  return v10;
}

- (id)_infoPlistForPluginBundle:(id)a3
{
  id v3 = a3;
  if (_infoPlistForPluginBundle__onceToken != -1) {
    dispatch_once(&_infoPlistForPluginBundle__onceToken, &__block_literal_global);
  }
  id v4 = ACXLoadInfoPlist(v3, (void *)_infoPlistForPluginBundle__keysToLoad);
  uint64_t v5 = v4;
  if (!v4)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  if (![v4 count])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
LABEL_12:
      id v8 = [v3 path];
      MOLogWrite();
      goto LABEL_13;
    }
LABEL_18:
    id v9 = 0;
    goto LABEL_31;
  }
  id v6 = [v5 objectForKeyedSubscript:@"NSExtension"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    int v10 = [v8 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
    objc_opt_class();
    id v11 = v10;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if (v12)
    {
      id v9 = v5;
LABEL_29:

      goto LABEL_30;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v14 = [v3 path];
      MOLogWrite();
    }
LABEL_28:
    id v9 = 0;
    goto LABEL_29;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v12 = [v3 path];
    MOLogWrite();
    goto LABEL_28;
  }
LABEL_13:
  id v9 = 0;
LABEL_30:

LABEL_31:

  return v9;
}

uint64_t __44__ACXApplication__infoPlistForPluginBundle___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1CFF8], @"CLKComplicationPrincipalClass", @"CLKComplicationSupportedFamilies", @"NSExtension", @"WKRunsIndependentlyOfCompanionApp", 0);
  uint64_t v1 = _infoPlistForPluginBundle__keysToLoad;
  _infoPlistForPluginBundle__keysToLoad = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_URLOfFirstItemWithExtension:(id)a3 inDirectory:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v23 = 0;
  id v8 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:5 error:&v23];
  id v9 = v23;

  if (v8)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v8;
    id v11 = (id)[v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      id v18 = v9;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v15 = [v14 pathExtension];
          char v16 = [v15 isEqualToString:v5];

          if (v16)
          {
            id v11 = v14;
            goto LABEL_12;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_12:
      id v9 = v18;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_mostCurrentWKAppURLInCompanionAppRecord:(id)a3 isPlaceholder:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [v6 URL];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 URLByAppendingPathComponent:@"Watch" isDirectory:1];
    uint64_t v10 = [(ACXApplication *)self _URLOfFirstItemWithExtension:@"app" inDirectory:v9];
    if (v10)
    {
      id v11 = (void *)v10;
      if (a4) {
        *a4 = 0;
      }
    }
    else
    {
      uint64_t v12 = [v8 URLByAppendingPathComponent:@"com.apple.WatchPlaceholder" isDirectory:1];
      uint64_t v13 = [(ACXApplication *)self _URLOfFirstItemWithExtension:@"app" inDirectory:v12];
      id v11 = (void *)v13;
      if (a4 && v13) {
        *a4 = 1;
      }
    }
    goto LABEL_12;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v9 = [v6 bundleIdentifier];
    MOLogWrite();
    id v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (id)_URLsOfExtensionsInBundleURL:(id)a3 mayNotExist:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 URLByAppendingPathComponent:@"PlugIns" isDirectory:1];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  id v7 = [v6 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:5 error:&v14];
  id v8 = v14;

  if (v7)
  {
LABEL_10:
    id v11 = v7;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_7;
  }
  id v9 = [v8 domain];
  if (([v9 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) == 0)
  {

    goto LABEL_7;
  }
  uint64_t v10 = [v8 code];

  if (v10 != 260)
  {
LABEL_7:
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v13 = [v5 path];
      MOLogWrite();
    }
    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

- (id)_watchKitApplicationNameFromWKAppInfoPlist:(id)a3 containerRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1CC48]];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = (__CFString *)v8;
  }
  else {
    id v9 = 0;
  }

  if (!v9)
  {
    uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1D008]];
    objc_opt_class();
    id v11 = v10;
    id v9 = (objc_opt_isKindOfClass() & 1) != 0 ? (__CFString *)v11 : 0;

    if (!v9)
    {
      uint64_t v12 = [v6 localizedShortName];
      if (v12) {
        id v9 = (__CFString *)v12;
      }
      else {
        id v9 = @"Unknown Name";
      }
    }
  }

  return v9;
}

- (id)_storeMetadataWithError:(id *)a3
{
  BOOL v4 = [(ACXApplication *)self companionAppURL];
  id v5 = [v4 URLByDeletingLastPathComponent];
  id v6 = [v5 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0];

  id v11 = 0;
  id v7 = [MEMORY[0x1E4F78078] metadataFromPlistAtURL:v6 error:&v11];
  id v8 = v11;
  id v9 = v8;
  if (a3 && !v7) {
    *a3 = v8;
  }

  return v7;
}

- (NSURL)watchAppURL
{
  return self->_watchAppURL;
}

- (unint64_t)lsSequenceNumber
{
  return self->_lsSequenceNumber;
}

- (NSArray)clockFaceExtensionPaths
{
  return self->_clockFaceExtensionPaths;
}

- (BOOL)isTrusted
{
  return self->_isTrusted;
}

- (void)setIsTrusted:(BOOL)a3
{
  self->_isTrusted = a3;
}

- (NSURL)companionAppURL
{
  return self->_companionAppURL;
}

- (NSString)companionAppName
{
  return self->_companionAppName;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (BOOL)isPurchasedReDownload
{
  return self->_isPurchasedReDownload;
}

- (BOOL)isEmbeddedPlaceholder
{
  return self->_isEmbeddedPlaceholder;
}

- (ACXApplicationStatus)deviceStatus
{
  return self->_deviceStatus;
}

- (void)setDeviceStatus:(id)a3
{
}

- (unint64_t)autoInstallOverride
{
  return self->_autoInstallOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceStatus, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_companionAppName, 0);
  objc_storeStrong((id *)&self->_companionAppURL, 0);
  objc_storeStrong((id *)&self->_clockFaceExtensionPaths, 0);

  objc_storeStrong((id *)&self->_watchAppURL, 0);
}

@end