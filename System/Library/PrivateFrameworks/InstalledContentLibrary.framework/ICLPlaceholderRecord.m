@interface ICLPlaceholderRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isBeta;
- (BOOL)isDeletable;
- (BOOL)isEligibleForWatchAppInstall;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMarketplace;
- (BOOL)isOnDemandInstallCapable;
- (BOOL)isSwiftPlaygroundsApp;
- (BOOL)isWebNotificationBundle;
- (ICLPlaceholderRecord)initWithCoder:(id)a3;
- (ICLPlaceholderRecord)initWithLegacyRecordDictionary:(id)a3;
- (ICLSinfInfo)sinfInfo;
- (NSArray)parentIdentifiers;
- (NSData)installSessionID;
- (NSData)uniqueInstallID;
- (NSDate)installDate;
- (NSNumber)lsInstallType;
- (NSString)alternateIconName;
- (NSString)appManagementDomain;
- (NSString)linkedParentBundleID;
- (NSURL)bundleContainerURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legacyRecordDictionary;
- (unint64_t)hash;
- (unint64_t)placeholderFailureReason;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateIconName:(id)a3;
- (void)setAppManagementDomain:(id)a3;
- (void)setBundleContainerURL:(id)a3;
- (void)setInstallDate:(id)a3;
- (void)setInstallSessionID:(id)a3;
- (void)setIsBeta:(BOOL)a3;
- (void)setIsDeletable:(BOOL)a3;
- (void)setIsEligibleForWatchAppInstall:(BOOL)a3;
- (void)setIsMarketplace:(BOOL)a3;
- (void)setIsOnDemandInstallCapable:(BOOL)a3;
- (void)setIsSwiftPlaygroundsApp:(BOOL)a3;
- (void)setIsWebNotificationBundle:(BOOL)a3;
- (void)setLinkedParentBundleID:(id)a3;
- (void)setLsInstallType:(id)a3;
- (void)setParentIdentifiers:(id)a3;
- (void)setPlaceholderFailureReason:(unint64_t)a3;
- (void)setSinfInfo:(id)a3;
- (void)setUniqueInstallID:(id)a3;
@end

@implementation ICLPlaceholderRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLPlaceholderRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ICLPlaceholderRecord;
  v5 = [(ICLBundleRecord *)&v31 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleContainerURL"];
    bundleContainerURL = v5->_bundleContainerURL;
    v5->_bundleContainerURL = (NSURL *)v6;

    v5->_isOnDemandInstallCapable = [v4 decodeBoolForKey:@"isOnDemandInstallCapable"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"parentIdentifiers"];
    parentIdentifiers = v5->_parentIdentifiers;
    v5->_parentIdentifiers = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appManagementDomain"];
    appManagementDomain = v5->_appManagementDomain;
    v5->_appManagementDomain = (NSString *)v13;

    v5->_isSwiftPlaygroundsApp = [v4 decodeBoolForKey:@"isSwiftPlaygroundsApp"];
    v5->_isDeletable = [v4 decodeBoolForKey:@"isDeletable"];
    v5->_isBeta = [v4 decodeBoolForKey:@"isBeta"];
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureReason"];
    v5->_placeholderFailureReason = [v15 unsignedIntegerValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateIconName"];
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installDate"];
    installDate = v5->_installDate;
    v5->_installDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsInstallType"];
    lsInstallType = v5->_lsInstallType;
    v5->_lsInstallType = (NSNumber *)v20;

    v5->_isWebNotificationBundle = [v4 decodeBoolForKey:@"isWebNotificationBundle"];
    v5->_isEligibleForWatchAppInstall = [v4 decodeBoolForKey:@"isEligibleForWatchAppInstall"];
    v5->_isMarketplace = [v4 decodeBoolForKey:@"isMarketplace"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sinfInfo"];
    sinfInfo = v5->_sinfInfo;
    v5->_sinfInfo = (ICLSinfInfo *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueInstallID"];
    uniqueInstallID = v5->_uniqueInstallID;
    v5->_uniqueInstallID = (NSData *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installSessionID"];
    installSessionID = v5->_installSessionID;
    v5->_installSessionID = (NSData *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkedParentBundleID"];
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)ICLPlaceholderRecord;
  id v4 = a3;
  [(ICLBundleRecord *)&v16 encodeWithCoder:v4];
  v5 = [(ICLPlaceholderRecord *)self bundleContainerURL];
  [v4 encodeObject:v5 forKey:@"bundleContainerURL"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable"), @"isOnDemandInstallCapable");
  uint64_t v6 = [(ICLPlaceholderRecord *)self parentIdentifiers];
  [v4 encodeObject:v6 forKey:@"parentIdentifiers"];

  v7 = [(ICLPlaceholderRecord *)self appManagementDomain];
  [v4 encodeObject:v7 forKey:@"appManagementDomain"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp"), @"isSwiftPlaygroundsApp");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isDeletable](self, "isDeletable"), @"isDeletable");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isBeta](self, "isBeta"), @"isBeta");
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  [v4 encodeObject:v8 forKey:@"placeholderFailureReason"];

  uint64_t v9 = [(ICLPlaceholderRecord *)self alternateIconName];
  [v4 encodeObject:v9 forKey:@"alternateIconName"];

  v10 = [(ICLPlaceholderRecord *)self installDate];
  [v4 encodeObject:v10 forKey:@"installDate"];

  uint64_t v11 = [(ICLPlaceholderRecord *)self lsInstallType];
  [v4 encodeObject:v11 forKey:@"lsInstallType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle"), @"isWebNotificationBundle");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall"), @"isEligibleForWatchAppInstall");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace"), @"isMarketplace");
  v12 = [(ICLPlaceholderRecord *)self sinfInfo];
  [v4 encodeObject:v12 forKey:@"sinfInfo"];

  uint64_t v13 = [(ICLPlaceholderRecord *)self uniqueInstallID];
  [v4 encodeObject:v13 forKey:@"uniqueInstallID"];

  v14 = [(ICLPlaceholderRecord *)self installSessionID];
  [v4 encodeObject:v14 forKey:@"installSessionID"];

  v15 = [(ICLPlaceholderRecord *)self linkedParentBundleID];
  [v4 encodeObject:v15 forKey:@"linkedParentBundleID"];
}

- (ICLPlaceholderRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)ICLPlaceholderRecord;
  v5 = [(ICLBundleRecord *)&v45 initWithLegacyRecordDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"BundleContainer"];
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
      uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
      [(ICLPlaceholderRecord *)v5 setBundleContainerURL:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"IsOnDemandInstallCapable"];
    [(ICLPlaceholderRecord *)v5 setIsOnDemandInstallCapable:MIBooleanValue(v10, 0)];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"ParentIdentifiers"];
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
      objc_opt_class();
      if (MIArrayContainsOnlyClass(v13)) {
        [(ICLPlaceholderRecord *)v5 setParentIdentifiers:v13];
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"AppManagementDomain"];
    objc_opt_class();
    id v15 = v14;
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    [(ICLPlaceholderRecord *)v5 setAppManagementDomain:v16];
    v17 = [v4 objectForKeyedSubscript:@"IsSwiftPlaygroundsApp"];
    [(ICLPlaceholderRecord *)v5 setIsSwiftPlaygroundsApp:MIBooleanValue(v17, 0)];

    uint64_t v18 = [v4 objectForKeyedSubscript:@"IsDeletable"];
    [(ICLPlaceholderRecord *)v5 setIsDeletable:MIBooleanValue(v18, 0)];

    v19 = [v4 objectForKeyedSubscript:@"PlaceholderFailureReason"];
    objc_opt_class();
    id v20 = v19;
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    -[ICLPlaceholderRecord setPlaceholderFailureReason:](v5, "setPlaceholderFailureReason:", [v21 unsignedIntegerValue]);
    uint64_t v22 = [v4 objectForKeyedSubscript:@"AlternateIconName"];
    objc_opt_class();
    id v23 = v22;
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    [(ICLPlaceholderRecord *)v5 setAlternateIconName:v24];
    v25 = [v4 objectForKeyedSubscript:@"AppInstallDate"];
    objc_opt_class();
    id v26 = v25;
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    [(ICLPlaceholderRecord *)v5 setInstallDate:v27];
    uint64_t v28 = [v4 objectForKeyedSubscript:@"LSInstallType"];
    objc_opt_class();
    id v29 = v28;
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }

    [(ICLPlaceholderRecord *)v5 setLsInstallType:v30];
    objc_super v31 = [v4 objectForKeyedSubscript:@"IsWebNotificationBundle"];
    [(ICLPlaceholderRecord *)v5 setIsWebNotificationBundle:MIBooleanValue(v31, 0)];

    v32 = [v4 objectForKeyedSubscript:@"IsEligibleForWatchAppInstall"];
    [(ICLPlaceholderRecord *)v5 setIsEligibleForWatchAppInstall:MIBooleanValue(v32, 0)];

    v33 = [v4 objectForKeyedSubscript:@"IsMarketplace"];
    [(ICLPlaceholderRecord *)v5 setIsMarketplace:MIBooleanValue(v33, 0)];

    v34 = [[ICLSinfInfo alloc] initWithLegacySinfInfoDictionary:v4];
    [(ICLPlaceholderRecord *)v5 setSinfInfo:v34];

    v35 = [v4 objectForKeyedSubscript:@"UniqueInstallID"];
    objc_opt_class();
    id v36 = v35;
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }

    [(ICLPlaceholderRecord *)v5 setUniqueInstallID:v37];
    v38 = [v4 objectForKeyedSubscript:@"InstallSessionID"];
    objc_opt_class();
    id v39 = v38;
    if (objc_opt_isKindOfClass()) {
      id v40 = v39;
    }
    else {
      id v40 = 0;
    }

    [(ICLPlaceholderRecord *)v5 setInstallSessionID:v40];
    v41 = [v4 objectForKeyedSubscript:@"LinkedParentBundleID"];
    objc_opt_class();
    id v42 = v41;
    if (objc_opt_isKindOfClass()) {
      id v43 = v42;
    }
    else {
      id v43 = 0;
    }

    [(ICLPlaceholderRecord *)v5 setLinkedParentBundleID:v43];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v27.receiver = self;
  v27.super_class = (Class)ICLPlaceholderRecord;
  id v5 = -[ICLBundleRecord copyWithZone:](&v27, sel_copyWithZone_);
  uint64_t v6 = [(ICLPlaceholderRecord *)self bundleContainerURL];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBundleContainerURL:v7];

  objc_msgSend(v5, "setIsOnDemandInstallCapable:", -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable"));
  id v8 = [(ICLPlaceholderRecord *)self parentIdentifiers];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setParentIdentifiers:v9];

  v10 = [(ICLPlaceholderRecord *)self appManagementDomain];
  uint64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setAppManagementDomain:v11];

  objc_msgSend(v5, "setIsSwiftPlaygroundsApp:", -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp"));
  objc_msgSend(v5, "setIsDeletable:", -[ICLPlaceholderRecord isDeletable](self, "isDeletable"));
  objc_msgSend(v5, "setIsBeta:", -[ICLPlaceholderRecord isBeta](self, "isBeta"));
  objc_msgSend(v5, "setPlaceholderFailureReason:", -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  id v12 = [(ICLPlaceholderRecord *)self alternateIconName];
  id v13 = (void *)[v12 copyWithZone:a3];
  [v5 setAlternateIconName:v13];

  v14 = [(ICLPlaceholderRecord *)self installDate];
  id v15 = (void *)[v14 copyWithZone:a3];
  [v5 setInstallDate:v15];

  id v16 = [(ICLPlaceholderRecord *)self lsInstallType];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setLsInstallType:v17];

  objc_msgSend(v5, "setIsWebNotificationBundle:", -[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle"));
  objc_msgSend(v5, "setIsEligibleForWatchAppInstall:", -[ICLPlaceholderRecord isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall"));
  objc_msgSend(v5, "setIsMarketplace:", -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace"));
  uint64_t v18 = [(ICLPlaceholderRecord *)self sinfInfo];
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setSinfInfo:v19];

  id v20 = [(ICLPlaceholderRecord *)self uniqueInstallID];
  id v21 = (void *)[v20 copyWithZone:a3];
  [v5 setUniqueInstallID:v21];

  uint64_t v22 = [(ICLPlaceholderRecord *)self installSessionID];
  id v23 = (void *)[v22 copyWithZone:a3];
  [v5 setInstallSessionID:v23];

  id v24 = [(ICLPlaceholderRecord *)self linkedParentBundleID];
  v25 = (void *)[v24 copyWithZone:a3];
  [v5 setLinkedParentBundleID:v25];

  return v5;
}

- (id)legacyRecordDictionary
{
  v3 = objc_opt_new();
  v29.receiver = self;
  v29.super_class = (Class)ICLPlaceholderRecord;
  id v4 = [(ICLBundleRecord *)&v29 legacyRecordDictionary];
  [v3 addEntriesFromDictionary:v4];

  id v5 = [(ICLPlaceholderRecord *)self bundleContainerURL];
  uint64_t v6 = [v5 path];

  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"BundleContainer"];
  }

  BOOL v7 = [(ICLPlaceholderRecord *)self isOnDemandInstallCapable];
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  if (v7) {
    uint64_t v10 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v10 forKeyedSubscript:@"IsOnDemandInstallCapable"];
  uint64_t v11 = [(ICLPlaceholderRecord *)self parentIdentifiers];
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"ParentIdentifiers"];
  }

  id v12 = [(ICLPlaceholderRecord *)self appManagementDomain];
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"AppManagementDomain"];
  }

  if ([(ICLPlaceholderRecord *)self isSwiftPlaygroundsApp]) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = v8;
  }
  [v3 setObject:v13 forKeyedSubscript:@"IsSwiftPlaygroundsApp"];
  if ([(ICLPlaceholderRecord *)self isDeletable]) {
    uint64_t v14 = v9;
  }
  else {
    uint64_t v14 = v8;
  }
  [v3 setObject:v14 forKeyedSubscript:@"IsDeletable"];
  id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:@"PlaceholderFailureReason"];
  }

  id v16 = [(ICLPlaceholderRecord *)self alternateIconName];
  if (v16) {
    [v3 setObject:v16 forKeyedSubscript:@"AlternateIconName"];
  }

  v17 = [(ICLPlaceholderRecord *)self installDate];
  if (v17) {
    [v3 setObject:v17 forKeyedSubscript:@"AppInstallDate"];
  }

  uint64_t v18 = [(ICLPlaceholderRecord *)self lsInstallType];
  if (v18) {
    [v3 setObject:v18 forKeyedSubscript:@"LSInstallType"];
  }

  if ([(ICLPlaceholderRecord *)self isWebNotificationBundle]) {
    uint64_t v19 = v9;
  }
  else {
    uint64_t v19 = v8;
  }
  [v3 setObject:v19 forKeyedSubscript:@"IsWebNotificationBundle"];
  if ([(ICLPlaceholderRecord *)self isEligibleForWatchAppInstall]) {
    uint64_t v20 = v9;
  }
  else {
    uint64_t v20 = v8;
  }
  [v3 setObject:v20 forKeyedSubscript:@"IsEligibleForWatchAppInstall"];
  if ([(ICLPlaceholderRecord *)self isMarketplace]) {
    uint64_t v21 = v9;
  }
  else {
    uint64_t v21 = v8;
  }
  [v3 setObject:v21 forKeyedSubscript:@"IsMarketplace"];
  uint64_t v22 = [(ICLPlaceholderRecord *)self sinfInfo];
  id v23 = [v22 legacySinfInfoDictionary];
  [v3 addEntriesFromDictionary:v23];

  id v24 = [(ICLPlaceholderRecord *)self uniqueInstallID];
  if (v24) {
    [v3 setObject:v24 forKeyedSubscript:@"UniqueInstallID"];
  }

  v25 = [(ICLPlaceholderRecord *)self installSessionID];
  if (v25) {
    [v3 setObject:v25 forKeyedSubscript:@"InstallSessionID"];
  }

  id v26 = [(ICLPlaceholderRecord *)self linkedParentBundleID];
  if (v26) {
    [v3 setObject:v26 forKeyedSubscript:@"LinkedParentBundleID"];
  }

  objc_super v27 = (void *)[v3 copy];
  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLPlaceholderRecord *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46.receiver = self;
      v46.super_class = (Class)ICLPlaceholderRecord;
      if ([(ICLBundleRecord *)&v46 isEqual:v4])
      {
        id v5 = v4;
        uint64_t v6 = [(ICLPlaceholderRecord *)self bundleContainerURL];
        BOOL v7 = [(ICLPlaceholderRecord *)v5 bundleContainerURL];
        BOOL v8 = MICompareObjects(v6, v7);

        if (v8)
        {
          BOOL v9 = [(ICLPlaceholderRecord *)self isOnDemandInstallCapable];
          if (v9 == [(ICLPlaceholderRecord *)v5 isOnDemandInstallCapable])
          {
            uint64_t v11 = [(ICLPlaceholderRecord *)self parentIdentifiers];
            id v12 = [(ICLPlaceholderRecord *)v5 parentIdentifiers];
            BOOL v13 = MICompareObjects(v11, v12);

            if (v13)
            {
              uint64_t v14 = [(ICLPlaceholderRecord *)self appManagementDomain];
              id v15 = [(ICLPlaceholderRecord *)v5 appManagementDomain];
              BOOL v16 = MICompareObjects(v14, v15);

              if (v16)
              {
                BOOL v17 = [(ICLPlaceholderRecord *)self isSwiftPlaygroundsApp];
                if (v17 == [(ICLPlaceholderRecord *)v5 isSwiftPlaygroundsApp])
                {
                  BOOL v18 = [(ICLPlaceholderRecord *)self isDeletable];
                  if (v18 == [(ICLPlaceholderRecord *)v5 isDeletable])
                  {
                    BOOL v19 = [(ICLPlaceholderRecord *)self isBeta];
                    if (v19 == [(ICLPlaceholderRecord *)v5 isBeta])
                    {
                      unint64_t v20 = [(ICLPlaceholderRecord *)self placeholderFailureReason];
                      if (v20 == [(ICLPlaceholderRecord *)v5 placeholderFailureReason])
                      {
                        uint64_t v21 = [(ICLPlaceholderRecord *)self alternateIconName];
                        uint64_t v22 = [(ICLPlaceholderRecord *)v5 alternateIconName];
                        BOOL v23 = MICompareObjects(v21, v22);

                        if (v23)
                        {
                          id v24 = [(ICLPlaceholderRecord *)self installDate];
                          v25 = [(ICLPlaceholderRecord *)v5 installDate];
                          BOOL v26 = MICompareObjects(v24, v25);

                          if (v26)
                          {
                            objc_super v27 = [(ICLPlaceholderRecord *)self lsInstallType];
                            uint64_t v28 = [(ICLPlaceholderRecord *)v5 lsInstallType];
                            BOOL v29 = MICompareObjects(v27, v28);

                            if (v29)
                            {
                              id v30 = [(ICLPlaceholderRecord *)self sinfInfo];
                              objc_super v31 = [(ICLPlaceholderRecord *)v5 sinfInfo];
                              BOOL v32 = MICompareObjects(v30, v31);

                              if (v32)
                              {
                                BOOL v33 = [(ICLPlaceholderRecord *)self isWebNotificationBundle];
                                if (v33 == [(ICLPlaceholderRecord *)v5 isWebNotificationBundle])
                                {
                                  BOOL v35 = [(ICLPlaceholderRecord *)self isEligibleForWatchAppInstall];
                                  if (v35 == [(ICLPlaceholderRecord *)v5 isEligibleForWatchAppInstall])
                                  {
                                    BOOL v36 = [(ICLPlaceholderRecord *)self isMarketplace];
                                    if (v36 == [(ICLPlaceholderRecord *)v5 isMarketplace])
                                    {
                                      id v37 = [(ICLPlaceholderRecord *)self uniqueInstallID];
                                      v38 = [(ICLPlaceholderRecord *)v5 uniqueInstallID];
                                      BOOL v39 = MICompareObjects(v37, v38);

                                      if (v39)
                                      {
                                        id v40 = [(ICLPlaceholderRecord *)self installSessionID];
                                        v41 = [(ICLPlaceholderRecord *)v5 installSessionID];
                                        BOOL v42 = MICompareObjects(v40, v41);

                                        if (v42)
                                        {
                                          id v43 = [(ICLPlaceholderRecord *)self linkedParentBundleID];
                                          v44 = [(ICLPlaceholderRecord *)v5 linkedParentBundleID];
                                          BOOL v45 = MICompareObjects(v43, v44);

                                          if (v45)
                                          {
                                            BOOL v10 = 1;
                                            goto LABEL_59;
                                          }
                                          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                          {
LABEL_58:
                                            BOOL v10 = 0;
LABEL_59:

                                            goto LABEL_60;
                                          }
                                        }
                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
                                          goto LABEL_58;
                                        }
                                      }
                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_58;
                                      }
                                    }
                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_58;
                                    }
                                  }
                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_58;
                                  }
                                }
                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_58;
                                }
                              }
                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_58;
                              }
                            }
                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_58;
                            }
                          }
                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_58;
                          }
                        }
                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_58;
                        }
                      }
                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_58;
                      }
                    }
                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_58;
                    }
                  }
                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_58;
                  }
                }
                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_58;
                }
              }
              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_58;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_58;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_58;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_58;
        }
        MOLogWrite();
        goto LABEL_58;
      }
    }
    BOOL v10 = 0;
  }
LABEL_60:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ICLPlaceholderRecord *)self isOnDemandInstallCapable];
  BOOL v4 = [(ICLPlaceholderRecord *)self isSwiftPlaygroundsApp];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  if ([(ICLPlaceholderRecord *)self isDeletable]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(ICLPlaceholderRecord *)self isBeta];
  uint64_t v9 = 8;
  if (!v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v6 | v7 | v9 | (16 * ([(ICLPlaceholderRecord *)self placeholderFailureReason] != 0));
  if ([(ICLPlaceholderRecord *)self isWebNotificationBundle]) {
    uint64_t v11 = 32;
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v12 = [(ICLPlaceholderRecord *)self isEligibleForWatchAppInstall];
  uint64_t v13 = 64;
  if (!v12) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v10 | v11 | v13;
  if ([(ICLPlaceholderRecord *)self isMarketplace]) {
    uint64_t v15 = 128;
  }
  else {
    uint64_t v15 = 0;
  }
  BOOL v16 = [(ICLPlaceholderRecord *)self bundleContainerURL];
  uint64_t v17 = v15 ^ [v16 hash];

  BOOL v18 = [(ICLPlaceholderRecord *)self parentIdentifiers];
  uint64_t v19 = v17 ^ [v18 hash];

  unint64_t v20 = [(ICLPlaceholderRecord *)self appManagementDomain];
  uint64_t v21 = v19 ^ [v20 hash];

  uint64_t v22 = [(ICLPlaceholderRecord *)self alternateIconName];
  uint64_t v23 = v21 ^ [v22 hash];

  id v24 = [(ICLPlaceholderRecord *)self installDate];
  uint64_t v25 = v14 ^ v23 ^ [v24 hash];

  BOOL v26 = [(ICLPlaceholderRecord *)self lsInstallType];
  uint64_t v27 = [v26 hash];

  uint64_t v28 = [(ICLPlaceholderRecord *)self sinfInfo];
  uint64_t v29 = v27 ^ [v28 hash];

  id v30 = [(ICLPlaceholderRecord *)self uniqueInstallID];
  uint64_t v31 = v29 ^ [v30 hash];

  BOOL v32 = [(ICLPlaceholderRecord *)self installSessionID];
  uint64_t v33 = v31 ^ [v32 hash];

  v34 = [(ICLPlaceholderRecord *)self linkedParentBundleID];
  uint64_t v35 = v33 ^ [v34 hash];

  v37.receiver = self;
  v37.super_class = (Class)ICLPlaceholderRecord;
  return v25 ^ v35 ^ [(ICLBundleRecord *)&v37 hash];
}

- (NSURL)bundleContainerURL
{
  return self->_bundleContainerURL;
}

- (void)setBundleContainerURL:(id)a3
{
}

- (BOOL)isOnDemandInstallCapable
{
  return self->_isOnDemandInstallCapable;
}

- (void)setIsOnDemandInstallCapable:(BOOL)a3
{
  self->_isOnDemandInstallCapable = a3;
}

- (NSArray)parentIdentifiers
{
  return self->_parentIdentifiers;
}

- (void)setParentIdentifiers:(id)a3
{
}

- (NSString)appManagementDomain
{
  return self->_appManagementDomain;
}

- (void)setAppManagementDomain:(id)a3
{
}

- (BOOL)isSwiftPlaygroundsApp
{
  return self->_isSwiftPlaygroundsApp;
}

- (void)setIsSwiftPlaygroundsApp:(BOOL)a3
{
  self->_isSwiftPlaygroundsApp = a3;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setIsBeta:(BOOL)a3
{
  self->_isBeta = a3;
}

- (unint64_t)placeholderFailureReason
{
  return self->_placeholderFailureReason;
}

- (void)setPlaceholderFailureReason:(unint64_t)a3
{
  self->_placeholderFailureReason = a3;
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
}

- (NSNumber)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(id)a3
{
}

- (BOOL)isWebNotificationBundle
{
  return self->_isWebNotificationBundle;
}

- (void)setIsWebNotificationBundle:(BOOL)a3
{
  self->_isWebNotificationBundle = a3;
}

- (ICLSinfInfo)sinfInfo
{
  return self->_sinfInfo;
}

- (void)setSinfInfo:(id)a3
{
}

- (NSData)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (void)setUniqueInstallID:(id)a3
{
}

- (NSData)installSessionID
{
  return self->_installSessionID;
}

- (void)setInstallSessionID:(id)a3
{
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
}

- (BOOL)isEligibleForWatchAppInstall
{
  return self->_isEligibleForWatchAppInstall;
}

- (void)setIsEligibleForWatchAppInstall:(BOOL)a3
{
  self->_isEligibleForWatchAppInstall = a3;
}

- (BOOL)isMarketplace
{
  return self->_isMarketplace;
}

- (void)setIsMarketplace:(BOOL)a3
{
  self->_isMarketplace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedParentBundleID, 0);
  objc_storeStrong((id *)&self->_installSessionID, 0);
  objc_storeStrong((id *)&self->_uniqueInstallID, 0);
  objc_storeStrong((id *)&self->_sinfInfo, 0);
  objc_storeStrong((id *)&self->_lsInstallType, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_alternateIconName, 0);
  objc_storeStrong((id *)&self->_appManagementDomain, 0);
  objc_storeStrong((id *)&self->_parentIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleContainerURL, 0);
}

@end