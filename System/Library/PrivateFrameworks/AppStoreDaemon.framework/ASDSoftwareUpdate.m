@interface ASDSoftwareUpdate
+ (BOOL)supportsSecureCoding;
- (ASDSoftwareUpdate)initWithCoder:(id)a3;
- (ASDSoftwareUpdate)initWithUpdateDictionary:(id)a3;
- (BOOL)autoUpdateEnabled;
- (BOOL)isArcade;
- (BOOL)isDownloaded;
- (BOOL)isIOSBinaryMacOSCompatible;
- (BOOL)isPerDevice;
- (BOOL)isProfileValidated;
- (BOOL)requiresRosetta;
- (BOOL)runsOnAppleSilicon;
- (BOOL)runsOnIntel;
- (NSArray)blockedBy;
- (NSDate)installDate;
- (NSDate)timestamp;
- (NSDictionary)metrics;
- (NSDictionary)rawUpdateDictionary;
- (NSDictionary)updateDictionary;
- (NSNumber)externalVersionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)buyParams;
- (id)copyWithZone:(_NSZone *)a3;
- (id)releaseDate;
- (int64_t)deviceFamilies;
- (int64_t)packageType;
- (int64_t)parentalControlsRank;
- (int64_t)rawUpdateState;
- (int64_t)storeItemIdentifier;
- (int64_t)updateState;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)setBlockedBy:(id)a3;
- (void)setDeviceFamilies:(int64_t)a3;
- (void)setDownloaded:(BOOL)a3;
- (void)setIOSBinaryMacOSCompatible:(BOOL)a3;
- (void)setInstallDate:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setPackageType:(int64_t)a3;
- (void)setPerDevice:(BOOL)a3;
- (void)setProfileValidated:(BOOL)a3;
- (void)setRawUpdateState:(int64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation ASDSoftwareUpdate

- (ASDSoftwareUpdate)initWithUpdateDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSoftwareUpdate;
  v5 = [(ASDSoftwareUpdate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rawUpdateDictionary = v5->_rawUpdateDictionary;
    v5->_rawUpdateDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (NSString)bundleIdentifier
{
  v3 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"bundleId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"bundle-id"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return (NSString *)v5;
}

- (NSString)buyParams
{
  v3 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"buyParams"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"offers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = [v6 valueForKey:@"buyParams"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = [v6 objectForKey:@"action-params"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v7 = 0;
          }

          id v4 = v7;
        }
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  return (NSString *)v4;
}

- (NSNumber)externalVersionIdentifier
{
  id v3 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"externalId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v3;
    id v4 = v3;
    goto LABEL_14;
  }
  id v5 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"offers"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v5 count]) {
    goto LABEL_10;
  }
  uint64_t v6 = [v5 firstObject];
  v7 = [v6 objectForKey:@"version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:

LABEL_10:
    v8 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"versionId"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v8;
      id v4 = v3;
    }
    else
    {
      id v4 = 0;
      id v3 = v8;
    }
    goto LABEL_13;
  }
  id v4 = [v7 objectForKey:@"externalId"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }

LABEL_13:
LABEL_14:

  return (NSNumber *)v4;
}

- (BOOL)isArcade
{
  if (!self) {
    return 0;
  }
  v2 = [(NSDictionary *)self->_rawUpdateDictionary objectForKeyedSubscript:@"isArcade"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (int64_t)parentalControlsRank
{
  v2 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"contentRatingsBySystem"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v2 objectForKey:@"appsApple"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 objectForKey:@"value"];
      if (objc_opt_respondsToSelector()) {
        int64_t v5 = [v4 integerValue];
      }
      else {
        int64_t v5 = 0;
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)releaseDate
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:2];
  [v3 setTimeStyle:0];
  id v4 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"releaseDate"];
  objc_opt_class();
  int64_t v5 = 0;
  if (objc_opt_isKindOfClass())
  {
    if ([v4 length])
    {
      int64_t v5 = [v3 dateFromString:v4];
    }
    else
    {
      int64_t v5 = 0;
    }
  }

  return v5;
}

- (int64_t)storeItemIdentifier
{
  v2 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"id"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSDictionary)updateDictionary
{
  v24[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)[(NSDictionary *)self->_rawUpdateDictionary mutableCopy];
  id v4 = [v3 objectForKey:@"offers"];

  if (!v4)
  {
    int64_t v5 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"buyParams"];
    uint64_t v6 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"displayVersion"];
    v7 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"externalId"];
    uint64_t v8 = [(NSDictionary *)self->_rawUpdateDictionary objectForKey:@"fileSize"];
    objc_super v9 = (void *)v8;
    if (v5 && v6 && v7 && v8)
    {
      v22[0] = @"assets";
      v19[0] = @"flavor";
      v19[1] = @"size";
      v20[0] = @"iosSoftware";
      v20[1] = v8;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      v21 = v16;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      v23[0] = v10;
      v23[1] = v5;
      v22[1] = @"buyParams";
      v22[2] = @"price";
      v11 = [NSNumber numberWithDouble:0.0];
      v23[2] = v11;
      v22[3] = @"version";
      v17[0] = @"display";
      v17[1] = @"externalId";
      v18[0] = v6;
      v18[1] = v7;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      v22[4] = @"type";
      v23[3] = v12;
      v23[4] = @"update";
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
      v24[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

      [v3 setObject:v14 forKey:@"offers"];
    }
  }
  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [+[ASDSoftwareUpdate allocWithZone:](ASDSoftwareUpdate, "allocWithZone:") init];
  v5->_autoUpdateEnabled = self->_autoUpdateEnabled;
  uint64_t v6 = [(NSArray *)self->_blockedBy copyWithZone:a3];
  blockedBy = v5->_blockedBy;
  v5->_blockedBy = (NSArray *)v6;

  v5->_deviceFamilies = self->_deviceFamilies;
  v5->_downloaded = self->_downloaded;
  uint64_t v8 = [(NSDate *)self->_installDate copyWithZone:a3];
  installDate = v5->_installDate;
  v5->_installDate = (NSDate *)v8;

  v5->_iOSBinaryMacOSCompatible = self->_iOSBinaryMacOSCompatible;
  uint64_t v10 = [(NSDictionary *)self->_metrics copyWithZone:a3];
  metrics = v5->_metrics;
  v5->_metrics = (NSDictionary *)v10;

  v5->_packageType = self->_packageType;
  v5->_perDevice = self->_perDevice;
  v5->_profileValidated = self->_profileValidated;
  uint64_t v12 = [(NSDictionary *)self->_rawUpdateDictionary copyWithZone:a3];
  rawUpdateDictionary = v5->_rawUpdateDictionary;
  v5->_rawUpdateDictionary = (NSDictionary *)v12;

  v5->_rawUpdateState = self->_rawUpdateState;
  uint64_t v14 = [(NSDate *)self->_timestamp copyWithZone:a3];
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v14;

  v5->_updateState = self->_updateState;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate autoUpdateEnabled](self, "autoUpdateEnabled"), @"autoUpdateEnabled");
  id v4 = [(ASDSoftwareUpdate *)self blockedBy];
  [v9 encodeObject:v4 forKey:@"blockedBy"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDSoftwareUpdate deviceFamilies](self, "deviceFamilies"), @"deviceFamilies");
  int64_t v5 = [(ASDSoftwareUpdate *)self installDate];
  [v9 encodeObject:v5 forKey:@"installDate"];

  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate isIOSBinaryMacOSCompatible](self, "isIOSBinaryMacOSCompatible"), @"iOSBinaryMacOSCompatible");
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate isDownloaded](self, "isDownloaded"), @"IsDownloaded");
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate isPerDevice](self, "isPerDevice"), @"IsPerDevice");
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDSoftwareUpdate isProfileValidated](self, "isProfileValidated"), @"IsProfileValidated");
  uint64_t v6 = [(ASDSoftwareUpdate *)self metrics];
  [v9 encodeObject:v6 forKey:@"metrics"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDSoftwareUpdate packageType](self, "packageType"), @"packageType");
  v7 = [(ASDSoftwareUpdate *)self rawUpdateDictionary];
  [v9 encodeObject:v7 forKey:@"updateDictionary"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDSoftwareUpdate rawUpdateState](self, "rawUpdateState"), @"rawUpdateState");
  uint64_t v8 = [(ASDSoftwareUpdate *)self timestamp];
  [v9 encodeObject:v8 forKey:@"updateTimestamp"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDSoftwareUpdate updateState](self, "updateState"), @"updateState");
}

- (ASDSoftwareUpdate)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDSoftwareUpdate;
  int64_t v5 = [(ASDSoftwareUpdate *)&v23 init];
  if (v5)
  {
    v5->_autoUpdateEnabled = [v4 decodeBoolForKey:@"autoUpdateEnabled"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"blockedBy"];
    blockedBy = v5->_blockedBy;
    v5->_blockedBy = (NSArray *)v9;

    v5->_deviceFamilies = [v4 decodeIntegerForKey:@"deviceFamilies"];
    v5->_downloaded = [v4 decodeBoolForKey:@"IsDownloaded"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installDate"];
    installDate = v5->_installDate;
    v5->_installDate = (NSDate *)v11;

    v5->_iOSBinaryMacOSCompatible = [v4 decodeBoolForKey:@"iOSBinaryMacOSCompatible"];
    v5->_perDevice = [v4 decodeBoolForKey:@"IsPerDevice"];
    v5->_profileValidated = [v4 decodeBoolForKey:@"IsProfileValidated"];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    void v24[3] = objc_opt_class();
    v24[4] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"metrics"];
    metrics = v5->_metrics;
    v5->_metrics = (NSDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateTimestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v17;

    v5->_packageType = [v4 decodeIntegerForKey:@"packageType"];
    v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"updateDictionary"];
    rawUpdateDictionary = v5->_rawUpdateDictionary;
    v5->_rawUpdateDictionary = (NSDictionary *)v20;

    v5->_rawUpdateState = [v4 decodeIntegerForKey:@"rawUpdateState"];
    v5->_updateState = [v4 decodeIntegerForKey:@"updateState"];
  }
  return v5;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  self->_autoUpdateEnabled = a3;
}

- (NSArray)blockedBy
{
  return self->_blockedBy;
}

- (void)setBlockedBy:(id)a3
{
}

- (int64_t)deviceFamilies
{
  return self->_deviceFamilies;
}

- (void)setDeviceFamilies:(int64_t)a3
{
  self->_deviceFamilies = a3;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
}

- (BOOL)isIOSBinaryMacOSCompatible
{
  return self->_iOSBinaryMacOSCompatible;
}

- (void)setIOSBinaryMacOSCompatible:(BOOL)a3
{
  self->_iOSBinaryMacOSCompatible = a3;
}

- (BOOL)isDownloaded
{
  return self->_downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (int64_t)packageType
{
  return self->_packageType;
}

- (void)setPackageType:(int64_t)a3
{
  self->_packageType = a3;
}

- (BOOL)isPerDevice
{
  return self->_perDevice;
}

- (void)setPerDevice:(BOOL)a3
{
  self->_perDevice = a3;
}

- (BOOL)isProfileValidated
{
  return self->_profileValidated;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (NSDictionary)rawUpdateDictionary
{
  return self->_rawUpdateDictionary;
}

- (BOOL)requiresRosetta
{
  return self->_requiresRosetta;
}

- (BOOL)runsOnIntel
{
  return self->_runsOnIntel;
}

- (BOOL)runsOnAppleSilicon
{
  return self->_runsOnAppleSilicon;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (int64_t)rawUpdateState
{
  return self->_rawUpdateState;
}

- (void)setRawUpdateState:(int64_t)a3
{
  self->_rawUpdateState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_rawUpdateDictionary, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_blockedBy, 0);
}

@end