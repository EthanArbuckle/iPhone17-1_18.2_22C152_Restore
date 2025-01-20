@interface ICLBundleRecord
+ (BOOL)supportsSecureCoding;
+ (id)bundleRecordArrayToInfoDictionaryArray:(id)a3;
+ (id)infoDictionaryArrayToBundleRecordArray:(id)a3;
- (BOOL)codeSigningInfoNotAuthoritative;
- (BOOL)hasAppGroupContainers;
- (BOOL)hasSettingsBundle;
- (BOOL)hasSystemContainer;
- (BOOL)hasSystemGroupContainers;
- (BOOL)isContainerized;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNoLongerCompatible;
- (BOOL)isOnMountedDiskImage;
- (BOOL)isPlaceholder;
- (ICLBundleRecord)initWithCoder:(id)a3;
- (ICLBundleRecord)initWithLegacyRecordDictionary:(id)a3;
- (NSArray)counterpartIdentifiers;
- (NSDictionary)entitlements;
- (NSDictionary)environmentVariables;
- (NSDictionary)groupContainers;
- (NSDictionary)legacyRecordDictionary;
- (NSDictionary)personasRecordMap;
- (NSNumber)signatureVersion;
- (NSNumber)staticDiskUsage;
- (NSString)bundleIdentifier;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)codeInfoIdentifier;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSString)teamIdentifier;
- (NSURL)bundleURL;
- (NSURL)dataContainerURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)applicationType;
- (unint64_t)codeSignerType;
- (unint64_t)compatibilityState;
- (unint64_t)hash;
- (unint64_t)profileValidationType;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationType:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleShortVersion:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCodeInfoIdentifier:(id)a3;
- (void)setCodeSignerType:(unint64_t)a3;
- (void)setCodeSigningInfoNotAuthoritative:(BOOL)a3;
- (void)setCompatibilityState:(unint64_t)a3;
- (void)setCounterpartIdentifiers:(id)a3;
- (void)setDataContainerURL:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setEnvironmentVariables:(id)a3;
- (void)setGroupContainers:(id)a3;
- (void)setHasAppGroupContainers:(BOOL)a3;
- (void)setHasSettingsBundle:(BOOL)a3;
- (void)setHasSystemContainer:(BOOL)a3;
- (void)setHasSystemGroupContainers:(BOOL)a3;
- (void)setIsContainerized:(BOOL)a3;
- (void)setIsNoLongerCompatible:(BOOL)a3;
- (void)setIsOnMountedDiskImage:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setPersonasRecordMap:(id)a3;
- (void)setProfileValidationType:(unint64_t)a3;
- (void)setSignatureVersion:(id)a3;
- (void)setSignerIdentity:(id)a3;
- (void)setSignerOrganization:(id)a3;
- (void)setStaticDiskUsage:(id)a3;
- (void)setTeamIdentifier:(id)a3;
@end

@implementation ICLBundleRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLBundleRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICLBundleRecord *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleShortVersion"];
    bundleShortVersion = v5->_bundleShortVersion;
    v5->_bundleShortVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signerIdentity"];
    signerIdentity = v5->_signerIdentity;
    v5->_signerIdentity = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signatureVersion"];
    signatureVersion = v5->_signatureVersion;
    v5->_signatureVersion = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signerOrganization"];
    signerOrganization = v5->_signerOrganization;
    v5->_signerOrganization = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v20;

    v5->_codeSigningInfoNotAuthoritative = [v4 decodeBoolForKey:@"codeSigningInfoNotAuthoritative"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codeInfoIdentifier"];
    codeInfoIdentifier = v5->_codeInfoIdentifier;
    v5->_codeInfoIdentifier = (NSString *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codeSignerType"];
    v5->_codeSignerType = [v24 unsignedIntegerValue];

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileValidationType"];
    v5->_profileValidationType = [v25 unsignedIntegerValue];

    v5->_isPlaceholder = [v4 decodeBoolForKey:@"isPlaceholder"];
    v5->_isNoLongerCompatible = [v4 decodeBoolForKey:@"isNoLongerCompatible"];
    v5->_hasSettingsBundle = [v4 decodeBoolForKey:@"hasSettingsBundle"];
    v5->_isContainerized = [v4 decodeBoolForKey:@"isContainerized"];
    v5->_hasAppGroupContainers = [v4 decodeBoolForKey:@"hasAppGroupContainers"];
    v5->_hasSystemContainer = [v4 decodeBoolForKey:@"hasSystemContainer"];
    v5->_hasSystemGroupContainers = [v4 decodeBoolForKey:@"hasSystemGroupContainers"];
    v5->_isOnMountedDiskImage = [v4 decodeBoolForKey:@"isOnMountedDiskImage"];
    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compatibilityState"];
    v5->_compatibilityState = [v26 unsignedIntegerValue];

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationType"];
    v5->_applicationType = [v27 unsignedIntegerValue];

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"staticDiskUsage"];
    staticDiskUsage = v5->_staticDiskUsage;
    v5->_staticDiskUsage = (NSNumber *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"counterpartIdentifiers"];
    counterpartIdentifiers = v5->_counterpartIdentifiers;
    v5->_counterpartIdentifiers = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v35, "setWithObjects:", v36, v37, v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"entitlements"];
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSDictionary *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataContainerURL"];
    dataContainerURL = v5->_dataContainerURL;
    v5->_dataContainerURL = (NSURL *)v42;

    v44 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v45 = objc_opt_class();
    v46 = objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"environmentVariables"];
    environmentVariables = v5->_environmentVariables;
    v5->_environmentVariables = (NSDictionary *)v47;

    v49 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v49, "setWithObjects:", v50, v51, objc_opt_class(), 0);
    uint64_t v53 = [v4 decodeObjectOfClasses:v52 forKey:@"groupContainers"];
    groupContainers = v5->_groupContainers;
    v5->_groupContainers = (NSDictionary *)v53;

    v55 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    v58 = objc_msgSend(v55, "setWithObjects:", v56, v57, objc_opt_class(), 0);
    uint64_t v59 = [v4 decodeObjectOfClasses:v58 forKey:@"personasRecordMap"];
    personasRecordMap = v5->_personasRecordMap;
    v5->_personasRecordMap = (NSDictionary *)v59;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICLBundleRecord *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  uint64_t v6 = [(ICLBundleRecord *)self bundleVersion];
  [v4 encodeObject:v6 forKey:@"bundleVersion"];

  v7 = [(ICLBundleRecord *)self bundleShortVersion];
  [v4 encodeObject:v7 forKey:@"bundleShortVersion"];

  uint64_t v8 = [(ICLBundleRecord *)self bundleURL];
  [v4 encodeObject:v8 forKey:@"bundleURL"];

  v9 = [(ICLBundleRecord *)self signerIdentity];
  [v4 encodeObject:v9 forKey:@"signerIdentity"];

  uint64_t v10 = [(ICLBundleRecord *)self signatureVersion];
  [v4 encodeObject:v10 forKey:@"signatureVersion"];

  v11 = [(ICLBundleRecord *)self signerOrganization];
  [v4 encodeObject:v11 forKey:@"signerOrganization"];

  uint64_t v12 = [(ICLBundleRecord *)self teamIdentifier];
  [v4 encodeObject:v12 forKey:@"teamIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative"), @"codeSigningInfoNotAuthoritative");
  v13 = [(ICLBundleRecord *)self codeInfoIdentifier];
  [v4 encodeObject:v13 forKey:@"codeInfoIdentifier"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICLBundleRecord codeSignerType](self, "codeSignerType"));
  [v4 encodeObject:v14 forKey:@"codeSignerType"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICLBundleRecord profileValidationType](self, "profileValidationType"));
  [v4 encodeObject:v15 forKey:@"profileValidationType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord isPlaceholder](self, "isPlaceholder"), @"isPlaceholder");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible"), @"isNoLongerCompatible");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle"), @"hasSettingsBundle");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord isContainerized](self, "isContainerized"), @"isContainerized");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers"), @"hasAppGroupContainers");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer"), @"hasSystemContainer");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers"), @"hasSystemGroupContainers");
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage"), @"isOnMountedDiskImage");
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  [v4 encodeObject:v16 forKey:@"compatibilityState"];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICLBundleRecord applicationType](self, "applicationType"));
  [v4 encodeObject:v17 forKey:@"applicationType"];

  uint64_t v18 = [(ICLBundleRecord *)self staticDiskUsage];
  [v4 encodeObject:v18 forKey:@"staticDiskUsage"];

  v19 = [(ICLBundleRecord *)self counterpartIdentifiers];
  [v4 encodeObject:v19 forKey:@"counterpartIdentifiers"];

  uint64_t v20 = [(ICLBundleRecord *)self entitlements];
  [v4 encodeObject:v20 forKey:@"entitlements"];

  v21 = [(ICLBundleRecord *)self dataContainerURL];
  [v4 encodeObject:v21 forKey:@"dataContainerURL"];

  uint64_t v22 = [(ICLBundleRecord *)self environmentVariables];
  [v4 encodeObject:v22 forKey:@"environmentVariables"];

  v23 = [(ICLBundleRecord *)self groupContainers];
  [v4 encodeObject:v23 forKey:@"groupContainers"];

  id v24 = [(ICLBundleRecord *)self personasRecordMap];
  [v4 encodeObject:v24 forKey:@"personasRecordMap"];
}

- (ICLBundleRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(ICLBundleRecord *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    [(ICLBundleRecord *)v5 setBundleIdentifier:v8];
    v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];
    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    [(ICLBundleRecord *)v5 setBundleVersion:v11];
    uint64_t v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1CC70]];
    objc_opt_class();
    id v13 = v12;
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    [(ICLBundleRecord *)v5 setBundleShortVersion:v14];
    v15 = [v4 objectForKeyedSubscript:@"Path"];
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
      uint64_t v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17 isDirectory:1];
      [(ICLBundleRecord *)v5 setBundleURL:v18];
    }
    v19 = objc_msgSend(v4, "objectForKeyedSubscript:", @"SignerIdentity", v17);
    objc_opt_class();
    id v20 = v19;
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    [(ICLBundleRecord *)v5 setSignerIdentity:v21];
    uint64_t v22 = [v4 objectForKeyedSubscript:@"SignatureVersion"];
    objc_opt_class();
    id v23 = v22;
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    [(ICLBundleRecord *)v5 setSignatureVersion:v24];
    v25 = [v4 objectForKeyedSubscript:@"SignerOrganization"];
    objc_opt_class();
    id v26 = v25;
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    [(ICLBundleRecord *)v5 setSignerOrganization:v27];
    uint64_t v28 = [v4 objectForKeyedSubscript:@"TeamIdentifier"];
    objc_opt_class();
    id v29 = v28;
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }

    [(ICLBundleRecord *)v5 setTeamIdentifier:v30];
    uint64_t v31 = [v4 objectForKeyedSubscript:@"CodeSigningInfoNotAuthoritative"];
    [(ICLBundleRecord *)v5 setCodeSigningInfoNotAuthoritative:MIBooleanValue(v31, 0)];

    v32 = [v4 objectForKeyedSubscript:@"CodeInfoIdentifier"];
    objc_opt_class();
    id v33 = v32;
    if (objc_opt_isKindOfClass()) {
      id v34 = v33;
    }
    else {
      id v34 = 0;
    }

    [(ICLBundleRecord *)v5 setCodeInfoIdentifier:v34];
    v35 = [v4 objectForKeyedSubscript:@"ProfileValidated"];
    char v36 = MIBooleanValue(v35, 0);

    if (v36)
    {
      uint64_t v37 = 3;
    }
    else
    {
      uint64_t v38 = [v4 objectForKeyedSubscript:@"IsAdHocSigned"];
      char v39 = MIBooleanValue(v38, 0);

      if (v39)
      {
        uint64_t v37 = 1;
      }
      else if ([(ICLBundleRecord *)v5 isPlaceholder])
      {
        uint64_t v37 = 6;
      }
      else
      {
        uint64_t v37 = 2;
      }
    }
    [(ICLBundleRecord *)v5 setCodeSignerType:v37];
    uint64_t v40 = [v4 objectForKeyedSubscript:@"UPPValidated"];
    char v41 = MIBooleanValue(v40, 0);

    if (v41)
    {
      uint64_t v42 = 2;
    }
    else
    {
      v43 = [v4 objectForKeyedSubscript:@"FreeProfileValidated"];
      int v44 = MIBooleanValue(v43, 0);

      if (v44) {
        uint64_t v42 = 3;
      }
      else {
        uint64_t v42 = 1;
      }
    }
    [(ICLBundleRecord *)v5 setProfileValidationType:v42];
    uint64_t v45 = [v4 objectForKeyedSubscript:@"IsPlaceholder"];
    [(ICLBundleRecord *)v5 setIsPlaceholder:MIBooleanValue(v45, 0)];

    v46 = [v4 objectForKeyedSubscript:@"IsNoLongerCompatible"];
    [(ICLBundleRecord *)v5 setIsNoLongerCompatible:MIBooleanValue(v46, 0)];

    uint64_t v47 = [v4 objectForKeyedSubscript:@"HasSettingsBundle"];
    [(ICLBundleRecord *)v5 setHasSettingsBundle:MIBooleanValue(v47, 0)];

    v48 = [v4 objectForKeyedSubscript:@"IsContainerized"];
    [(ICLBundleRecord *)v5 setIsContainerized:MIBooleanValue(v48, 0)];

    v49 = [v4 objectForKeyedSubscript:@"HasAppGroupContainers"];
    [(ICLBundleRecord *)v5 setHasAppGroupContainers:MIBooleanValue(v49, 0)];

    uint64_t v50 = [v4 objectForKeyedSubscript:@"HasSystemContainer"];
    [(ICLBundleRecord *)v5 setHasSystemContainer:MIBooleanValue(v50, 0)];

    uint64_t v51 = [v4 objectForKeyedSubscript:@"HasSystemGroupContainers"];
    [(ICLBundleRecord *)v5 setHasSystemGroupContainers:MIBooleanValue(v51, 0)];

    v52 = [v4 objectForKeyedSubscript:@"IsOnMountedDiskImage"];
    [(ICLBundleRecord *)v5 setIsOnMountedDiskImage:MIBooleanValue(v52, 0)];

    uint64_t v53 = [v4 objectForKeyedSubscript:@"CompatibilityState"];
    objc_opt_class();
    id v54 = v53;
    if (objc_opt_isKindOfClass()) {
      id v55 = v54;
    }
    else {
      id v55 = 0;
    }

    -[ICLBundleRecord setCompatibilityState:](v5, "setCompatibilityState:", [v55 unsignedIntegerValue]);
    uint64_t v56 = [v4 objectForKeyedSubscript:@"ApplicationType"];
    if ([v56 isEqualToString:@"Any"])
    {
      uint64_t v57 = 6;
    }
    else if ([v56 isEqualToString:@"CoreServices"])
    {
      uint64_t v57 = 1;
    }
    else if ([v56 isEqualToString:@"System"])
    {
      uint64_t v57 = 2;
    }
    else if ([v56 isEqualToString:@"SystemAppPlaceholder"])
    {
      uint64_t v57 = 3;
    }
    else if ([v56 isEqualToString:@"User"])
    {
      uint64_t v57 = 4;
    }
    else if ([v56 isEqualToString:@"Internal"])
    {
      uint64_t v57 = 5;
    }
    else
    {
      uint64_t v57 = 0;
    }
    [(ICLBundleRecord *)v5 setApplicationType:v57];
    v58 = [v4 objectForKeyedSubscript:@"StaticDiskUsage"];
    objc_opt_class();
    id v59 = v58;
    if (objc_opt_isKindOfClass()) {
      id v60 = v59;
    }
    else {
      id v60 = 0;
    }

    [(ICLBundleRecord *)v5 setStaticDiskUsage:v60];
    v61 = [v4 objectForKeyedSubscript:@"LSCounterpartIdentifiers"];
    objc_opt_class();
    id v62 = v61;
    if (objc_opt_isKindOfClass()) {
      id v63 = v62;
    }
    else {
      id v63 = 0;
    }

    if (v63)
    {
      objc_opt_class();
      if (MIArrayContainsOnlyClass(v63)) {
        [(ICLBundleRecord *)v5 setCounterpartIdentifiers:v63];
      }
    }
    v64 = [v4 objectForKeyedSubscript:@"Entitlements"];
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
      uint64_t v67 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v66, v67, 0)) {
        [(ICLBundleRecord *)v5 setEntitlements:v66];
      }
    }
    v68 = [v4 objectForKeyedSubscript:@"Container"];
    objc_opt_class();
    id v69 = v68;
    if (objc_opt_isKindOfClass()) {
      id v70 = v69;
    }
    else {
      id v70 = 0;
    }

    if (v70)
    {
      v71 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v70 isDirectory:1];
      [(ICLBundleRecord *)v5 setDataContainerURL:v71];
    }
    v72 = [v4 objectForKeyedSubscript:@"EnvironmentVariables"];
    objc_opt_class();
    id v73 = v72;
    if (objc_opt_isKindOfClass()) {
      id v74 = v73;
    }
    else {
      id v74 = 0;
    }

    if (v74)
    {
      uint64_t v75 = objc_opt_class();
      uint64_t v76 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v74, v75, v76)) {
        [(ICLBundleRecord *)v5 setEnvironmentVariables:v74];
      }
    }
    v77 = [v4 objectForKeyedSubscript:@"GroupContainers"];
    objc_opt_class();
    id v78 = v77;
    if (objc_opt_isKindOfClass()) {
      id v79 = v78;
    }
    else {
      id v79 = 0;
    }

    if (v79)
    {
      uint64_t v80 = objc_opt_class();
      uint64_t v81 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v79, v80, v81))
      {
        v82 = objc_opt_new();
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __50__ICLBundleRecord_initWithLegacyRecordDictionary___block_invoke;
        v87[3] = &unk_1E62E7020;
        id v88 = v82;
        id v83 = v82;
        [v79 enumerateKeysAndObjectsUsingBlock:v87];
        v84 = (void *)[v83 copy];
        [(ICLBundleRecord *)v5 setGroupContainers:v84];
      }
    }
  }
  return v5;
}

void __50__ICLBundleRecord_initWithLegacyRecordDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a2;
  id v7 = [v5 fileURLWithPath:a3 isDirectory:1];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ICLBundleRecord *)self bundleIdentifier];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBundleIdentifier:v7];

  id v8 = [(ICLBundleRecord *)self bundleVersion];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setBundleVersion:v9];

  id v10 = [(ICLBundleRecord *)self bundleShortVersion];
  id v11 = (void *)[v10 copyWithZone:a3];
  [v5 setBundleShortVersion:v11];

  uint64_t v12 = [(ICLBundleRecord *)self bundleURL];
  id v13 = (void *)[v12 copyWithZone:a3];
  [v5 setBundleURL:v13];

  id v14 = [(ICLBundleRecord *)self signerIdentity];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setSignerIdentity:v15];

  id v16 = [(ICLBundleRecord *)self signatureVersion];
  id v17 = (void *)[v16 copyWithZone:a3];
  [v5 setSignatureVersion:v17];

  uint64_t v18 = [(ICLBundleRecord *)self signerOrganization];
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setSignerOrganization:v19];

  id v20 = [(ICLBundleRecord *)self teamIdentifier];
  id v21 = (void *)[v20 copyWithZone:a3];
  [v5 setTeamIdentifier:v21];

  objc_msgSend(v5, "setCodeSigningInfoNotAuthoritative:", -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative"));
  uint64_t v22 = [(ICLBundleRecord *)self codeInfoIdentifier];
  id v23 = (void *)[v22 copyWithZone:a3];
  [v5 setCodeInfoIdentifier:v23];

  objc_msgSend(v5, "setCodeSignerType:", -[ICLBundleRecord codeSignerType](self, "codeSignerType"));
  objc_msgSend(v5, "setProfileValidationType:", -[ICLBundleRecord profileValidationType](self, "profileValidationType"));
  objc_msgSend(v5, "setIsPlaceholder:", -[ICLBundleRecord isPlaceholder](self, "isPlaceholder"));
  objc_msgSend(v5, "setIsNoLongerCompatible:", -[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible"));
  objc_msgSend(v5, "setHasSettingsBundle:", -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle"));
  objc_msgSend(v5, "setIsContainerized:", -[ICLBundleRecord isContainerized](self, "isContainerized"));
  objc_msgSend(v5, "setHasAppGroupContainers:", -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers"));
  objc_msgSend(v5, "setHasSystemContainer:", -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer"));
  objc_msgSend(v5, "setHasSystemGroupContainers:", -[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers"));
  objc_msgSend(v5, "setIsOnMountedDiskImage:", -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage"));
  objc_msgSend(v5, "setCompatibilityState:", -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  objc_msgSend(v5, "setApplicationType:", -[ICLBundleRecord applicationType](self, "applicationType"));
  id v24 = [(ICLBundleRecord *)self staticDiskUsage];
  v25 = (void *)[v24 copyWithZone:a3];
  [v5 setStaticDiskUsage:v25];

  id v26 = [(ICLBundleRecord *)self counterpartIdentifiers];
  id v27 = (void *)[v26 copyWithZone:a3];
  [v5 setCounterpartIdentifiers:v27];

  uint64_t v28 = [(ICLBundleRecord *)self entitlements];
  id v29 = (void *)[v28 copyWithZone:a3];
  [v5 setEntitlements:v29];

  id v30 = [(ICLBundleRecord *)self dataContainerURL];
  uint64_t v31 = (void *)[v30 copyWithZone:a3];
  [v5 setDataContainerURL:v31];

  v32 = [(ICLBundleRecord *)self environmentVariables];
  id v33 = (void *)[v32 copyWithZone:a3];
  [v5 setEnvironmentVariables:v33];

  id v34 = [(ICLBundleRecord *)self groupContainers];
  v35 = (void *)[v34 copyWithZone:a3];
  [v5 setGroupContainers:v35];

  char v36 = [(ICLBundleRecord *)self personasRecordMap];
  uint64_t v37 = (void *)[v36 copyWithZone:a3];
  [v5 setPersonasRecordMap:v37];

  return v5;
}

- (NSDictionary)legacyRecordDictionary
{
  v3 = objc_opt_new();
  unint64_t v4 = [(ICLBundleRecord *)self applicationType] - 1;
  if (v4 <= 5) {
    [v3 setObject:off_1E62E7068[v4] forKeyedSubscript:@"ApplicationType"];
  }
  v5 = [(ICLBundleRecord *)self bundleIdentifier];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  }

  id v6 = [(ICLBundleRecord *)self bundleVersion];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F1D020]];
  }

  id v7 = [(ICLBundleRecord *)self bundleShortVersion];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1CC70]];
  }

  id v8 = [(ICLBundleRecord *)self bundleURL];
  v9 = [v8 path];

  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:@"Path"];
  }

  id v10 = [(ICLBundleRecord *)self signerIdentity];
  if (v10) {
    [v3 setObject:v10 forKeyedSubscript:@"SignerIdentity"];
  }

  id v11 = [(ICLBundleRecord *)self signatureVersion];
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"SignatureVersion"];
  }

  uint64_t v12 = [(ICLBundleRecord *)self signerOrganization];
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"SignerOrganization"];
  }

  id v13 = [(ICLBundleRecord *)self teamIdentifier];
  if (v13) {
    [v3 setObject:v13 forKeyedSubscript:@"TeamIdentifier"];
  }

  BOOL v14 = [(ICLBundleRecord *)self codeSigningInfoNotAuthoritative];
  uint64_t v15 = MEMORY[0x1E4F1CC28];
  uint64_t v16 = MEMORY[0x1E4F1CC38];
  if (v14) {
    uint64_t v17 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v17 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v17 forKeyedSubscript:@"CodeSigningInfoNotAuthoritative"];
  uint64_t v18 = [(ICLBundleRecord *)self codeInfoIdentifier];
  if (v18) {
    [v3 setObject:v18 forKeyedSubscript:@"CodeInfoIdentifier"];
  }

  if ([(ICLBundleRecord *)self codeSignerType] == 3) {
    uint64_t v19 = v16;
  }
  else {
    uint64_t v19 = v15;
  }
  [v3 setObject:v19 forKeyedSubscript:@"ProfileValidated"];
  if ([(ICLBundleRecord *)self profileValidationType] == 2) {
    uint64_t v20 = v16;
  }
  else {
    uint64_t v20 = v15;
  }
  [v3 setObject:v20 forKeyedSubscript:@"UPPValidated"];
  if ([(ICLBundleRecord *)self profileValidationType] == 3) {
    uint64_t v21 = v16;
  }
  else {
    uint64_t v21 = v15;
  }
  [v3 setObject:v21 forKeyedSubscript:@"FreeProfileValidated"];
  if ([(ICLBundleRecord *)self codeSignerType] == 1) {
    uint64_t v22 = v16;
  }
  else {
    uint64_t v22 = v15;
  }
  [v3 setObject:v22 forKeyedSubscript:@"IsAdHocSigned"];
  if ([(ICLBundleRecord *)self isPlaceholder]) {
    uint64_t v23 = v16;
  }
  else {
    uint64_t v23 = v15;
  }
  [v3 setObject:v23 forKeyedSubscript:@"IsPlaceholder"];
  if ([(ICLBundleRecord *)self isNoLongerCompatible]) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = v15;
  }
  [v3 setObject:v24 forKeyedSubscript:@"IsNoLongerCompatible"];
  if ([(ICLBundleRecord *)self hasSettingsBundle]) {
    uint64_t v25 = v16;
  }
  else {
    uint64_t v25 = v15;
  }
  [v3 setObject:v25 forKeyedSubscript:@"HasSettingsBundle"];
  if ([(ICLBundleRecord *)self isContainerized]) {
    uint64_t v26 = v16;
  }
  else {
    uint64_t v26 = v15;
  }
  [v3 setObject:v26 forKeyedSubscript:@"IsContainerized"];
  if ([(ICLBundleRecord *)self hasAppGroupContainers]) {
    uint64_t v27 = v16;
  }
  else {
    uint64_t v27 = v15;
  }
  [v3 setObject:v27 forKeyedSubscript:@"HasAppGroupContainers"];
  if ([(ICLBundleRecord *)self hasSystemContainer]) {
    uint64_t v28 = v16;
  }
  else {
    uint64_t v28 = v15;
  }
  [v3 setObject:v28 forKeyedSubscript:@"HasSystemContainer"];
  if ([(ICLBundleRecord *)self hasSystemGroupContainers]) {
    uint64_t v29 = v16;
  }
  else {
    uint64_t v29 = v15;
  }
  [v3 setObject:v29 forKeyedSubscript:@"HasSystemGroupContainers"];
  if ([(ICLBundleRecord *)self isOnMountedDiskImage]) {
    uint64_t v30 = v16;
  }
  else {
    uint64_t v30 = v15;
  }
  [v3 setObject:v30 forKeyedSubscript:@"IsOnMountedDiskImage"];
  uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  if (v31) {
    [v3 setObject:v31 forKeyedSubscript:@"CompatibilityState"];
  }

  v32 = [(ICLBundleRecord *)self staticDiskUsage];
  if (v32) {
    [v3 setObject:v32 forKeyedSubscript:@"StaticDiskUsage"];
  }

  id v33 = [(ICLBundleRecord *)self counterpartIdentifiers];
  [v3 setObject:v33 forKeyedSubscript:@"LSCounterpartIdentifiers"];

  id v34 = [(ICLBundleRecord *)self entitlements];
  if (v34) {
    [v3 setObject:v34 forKeyedSubscript:@"Entitlements"];
  }

  v35 = [(ICLBundleRecord *)self dataContainerURL];
  char v36 = [v35 path];

  if (v36) {
    [v3 setObject:v36 forKeyedSubscript:@"Container"];
  }

  uint64_t v37 = [(ICLBundleRecord *)self environmentVariables];
  if (v37) {
    [v3 setObject:v37 forKeyedSubscript:@"EnvironmentVariables"];
  }

  uint64_t v38 = [(ICLBundleRecord *)self groupContainers];
  if (v38)
  {
    char v39 = objc_opt_new();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __41__ICLBundleRecord_legacyRecordDictionary__block_invoke;
    v44[3] = &unk_1E62E7048;
    id v40 = v39;
    id v45 = v40;
    [v38 enumerateKeysAndObjectsUsingBlock:v44];
    char v41 = (void *)[v40 copy];
    if (v41) {
      [v3 setObject:v41 forKeyedSubscript:@"GroupContainers"];
    }
  }
  uint64_t v42 = (void *)[v3 copy];

  return (NSDictionary *)v42;
}

void __41__ICLBundleRecord_legacyRecordDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 path];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ICLBundleRecord *)a3;
  if (self == v4)
  {
    BOOL v31 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(ICLBundleRecord *)self bundleIdentifier];
      id v7 = [(ICLBundleRecord *)v5 bundleIdentifier];
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        v9 = [(ICLBundleRecord *)self bundleVersion];
        id v10 = [(ICLBundleRecord *)v5 bundleVersion];
        BOOL v11 = MICompareObjects(v9, v10);

        if (v11)
        {
          uint64_t v12 = [(ICLBundleRecord *)self bundleShortVersion];
          id v13 = [(ICLBundleRecord *)v5 bundleShortVersion];
          BOOL v14 = MICompareObjects(v12, v13);

          if (v14)
          {
            uint64_t v15 = [(ICLBundleRecord *)self bundleURL];
            uint64_t v16 = [(ICLBundleRecord *)v5 bundleURL];
            BOOL v17 = MICompareObjects(v15, v16);

            if (v17)
            {
              uint64_t v18 = [(ICLBundleRecord *)self signerIdentity];
              uint64_t v19 = [(ICLBundleRecord *)v5 signerIdentity];
              BOOL v20 = MICompareObjects(v18, v19);

              if (v20)
              {
                uint64_t v21 = [(ICLBundleRecord *)self signatureVersion];
                uint64_t v22 = [(ICLBundleRecord *)v5 signatureVersion];
                BOOL v23 = MICompareObjects(v21, v22);

                if (v23)
                {
                  uint64_t v24 = [(ICLBundleRecord *)self signerOrganization];
                  uint64_t v25 = [(ICLBundleRecord *)v5 signerOrganization];
                  BOOL v26 = MICompareObjects(v24, v25);

                  if (v26)
                  {
                    uint64_t v27 = [(ICLBundleRecord *)self teamIdentifier];
                    uint64_t v28 = [(ICLBundleRecord *)v5 teamIdentifier];
                    BOOL v29 = MICompareObjects(v27, v28);

                    if (v29)
                    {
                      BOOL v30 = [(ICLBundleRecord *)self codeSigningInfoNotAuthoritative];
                      if (v30 == [(ICLBundleRecord *)v5 codeSigningInfoNotAuthoritative])
                      {
                        v32 = [(ICLBundleRecord *)self codeInfoIdentifier];
                        id v33 = [(ICLBundleRecord *)v5 codeInfoIdentifier];
                        BOOL v34 = MICompareObjects(v32, v33);

                        if (v34)
                        {
                          unint64_t v35 = [(ICLBundleRecord *)self codeSignerType];
                          if (v35 == [(ICLBundleRecord *)v5 codeSignerType])
                          {
                            unint64_t v36 = [(ICLBundleRecord *)self profileValidationType];
                            if (v36 == [(ICLBundleRecord *)v5 profileValidationType])
                            {
                              BOOL v37 = [(ICLBundleRecord *)self isPlaceholder];
                              if (v37 == [(ICLBundleRecord *)v5 isPlaceholder])
                              {
                                BOOL v38 = [(ICLBundleRecord *)self isNoLongerCompatible];
                                if (v38 == [(ICLBundleRecord *)v5 isNoLongerCompatible])
                                {
                                  BOOL v39 = [(ICLBundleRecord *)self hasSettingsBundle];
                                  if (v39 == [(ICLBundleRecord *)v5 hasSettingsBundle])
                                  {
                                    BOOL v40 = [(ICLBundleRecord *)self isContainerized];
                                    if (v40 == [(ICLBundleRecord *)v5 isContainerized])
                                    {
                                      BOOL v41 = [(ICLBundleRecord *)self hasAppGroupContainers];
                                      if (v41 == [(ICLBundleRecord *)v5 hasAppGroupContainers])
                                      {
                                        BOOL v42 = [(ICLBundleRecord *)self hasSystemContainer];
                                        if (v42 == [(ICLBundleRecord *)v5 hasSystemContainer])
                                        {
                                          BOOL v43 = [(ICLBundleRecord *)self hasSystemGroupContainers];
                                          if (v43 == [(ICLBundleRecord *)v5 hasSystemGroupContainers])
                                          {
                                            BOOL v44 = [(ICLBundleRecord *)self isOnMountedDiskImage];
                                            if (v44 == [(ICLBundleRecord *)v5 isOnMountedDiskImage])
                                            {
                                              unint64_t v45 = [(ICLBundleRecord *)self compatibilityState];
                                              if (v45 == [(ICLBundleRecord *)v5 compatibilityState])
                                              {
                                                unint64_t v46 = [(ICLBundleRecord *)self applicationType];
                                                if (v46 == [(ICLBundleRecord *)v5 applicationType])
                                                {
                                                  uint64_t v47 = [(ICLBundleRecord *)self staticDiskUsage];
                                                  v48 = [(ICLBundleRecord *)v5 staticDiskUsage];
                                                  BOOL v49 = MICompareObjects(v47, v48);

                                                  if (v49)
                                                  {
                                                    uint64_t v50 = [(ICLBundleRecord *)self counterpartIdentifiers];
                                                    uint64_t v51 = [(ICLBundleRecord *)v5 counterpartIdentifiers];
                                                    BOOL v52 = MICompareObjects(v50, v51);

                                                    if (v52)
                                                    {
                                                      uint64_t v53 = [(ICLBundleRecord *)self entitlements];
                                                      id v54 = [(ICLBundleRecord *)v5 entitlements];
                                                      BOOL v55 = MICompareObjects(v53, v54);

                                                      if (v55)
                                                      {
                                                        uint64_t v56 = [(ICLBundleRecord *)self dataContainerURL];
                                                        uint64_t v57 = [(ICLBundleRecord *)v5 dataContainerURL];
                                                        BOOL v58 = MICompareObjects(v56, v57);

                                                        if (v58)
                                                        {
                                                          id v59 = [(ICLBundleRecord *)self environmentVariables];
                                                          id v60 = [(ICLBundleRecord *)v5 environmentVariables];
                                                          BOOL v61 = MICompareObjects(v59, v60);

                                                          if (v61)
                                                          {
                                                            id v62 = [(ICLBundleRecord *)self groupContainers];
                                                            id v63 = [(ICLBundleRecord *)v5 groupContainers];
                                                            BOOL v64 = MICompareObjects(v62, v63);

                                                            if (v64)
                                                            {
                                                              id v65 = [(ICLBundleRecord *)self personasRecordMap];
                                                              id v66 = [(ICLBundleRecord *)v5 personasRecordMap];
                                                              BOOL v67 = MICompareObjects(v65, v66);

                                                              if (v67)
                                                              {
                                                                BOOL v31 = 1;
LABEL_123:

                                                                goto LABEL_124;
                                                              }
                                                              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                              {
LABEL_122:
                                                                BOOL v31 = 0;
                                                                goto LABEL_123;
                                                              }
                                                            }
                                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                            {
                                                              goto LABEL_122;
                                                            }
                                                          }
                                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                          {
                                                            goto LABEL_122;
                                                          }
                                                        }
                                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                        {
                                                          goto LABEL_122;
                                                        }
                                                      }
                                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                      {
                                                        goto LABEL_122;
                                                      }
                                                    }
                                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                    {
                                                      goto LABEL_122;
                                                    }
                                                  }
                                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                  {
                                                    goto LABEL_122;
                                                  }
                                                }
                                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                {
                                                  goto LABEL_122;
                                                }
                                              }
                                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                              {
                                                goto LABEL_122;
                                              }
                                            }
                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                            {
                                              goto LABEL_122;
                                            }
                                          }
                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                          {
                                            goto LABEL_122;
                                          }
                                        }
                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
                                          goto LABEL_122;
                                        }
                                      }
                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_122;
                                      }
                                    }
                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_122;
                                    }
                                  }
                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_122;
                                  }
                                }
                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_122;
                                }
                              }
                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_122;
                              }
                            }
                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_122;
                            }
                          }
                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_122;
                          }
                        }
                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_122;
                        }
                      }
                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_122;
                      }
                    }
                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_122;
                    }
                  }
                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_122;
                  }
                }
                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_122;
                }
              }
              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_122;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_122;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_122;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_122;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_122;
      }
      MOLogWrite();
      goto LABEL_122;
    }
    BOOL v31 = 0;
  }
LABEL_124:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ICLBundleRecord *)self codeSigningInfoNotAuthoritative];
  BOOL v4 = [(ICLBundleRecord *)self isPlaceholder];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  if ([(ICLBundleRecord *)self isNoLongerCompatible]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(ICLBundleRecord *)self hasSettingsBundle];
  uint64_t v9 = 8;
  if (!v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v6 | v7 | v9;
  if ([(ICLBundleRecord *)self isContainerized]) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v12 = [(ICLBundleRecord *)self hasAppGroupContainers];
  uint64_t v13 = 32;
  if (!v12) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v11 | v13;
  BOOL v15 = [(ICLBundleRecord *)self hasSystemContainer];
  uint64_t v16 = 64;
  if (!v15) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = v10 | v14 | v16;
  if ([(ICLBundleRecord *)self hasSystemGroupContainers]) {
    uint64_t v18 = 128;
  }
  else {
    uint64_t v18 = 0;
  }
  BOOL v19 = [(ICLBundleRecord *)self isOnMountedDiskImage];
  uint64_t v20 = 256;
  if (!v19) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = v18 ^ v20;
  uint64_t v22 = [(ICLBundleRecord *)self bundleIdentifier];
  uint64_t v23 = v21 ^ [v22 hash];

  uint64_t v24 = [(ICLBundleRecord *)self bundleVersion];
  uint64_t v25 = v17 ^ v23 ^ [v24 hash];

  BOOL v26 = [(ICLBundleRecord *)self bundleShortVersion];
  uint64_t v27 = [v26 hash];

  uint64_t v28 = [(ICLBundleRecord *)self bundleURL];
  uint64_t v29 = v27 ^ [v28 hash];

  BOOL v30 = [(ICLBundleRecord *)self signerIdentity];
  uint64_t v31 = v29 ^ [v30 hash];

  v32 = [(ICLBundleRecord *)self signatureVersion];
  uint64_t v33 = v31 ^ [v32 hash];

  BOOL v34 = [(ICLBundleRecord *)self signerOrganization];
  uint64_t v35 = v33 ^ [v34 hash];

  unint64_t v36 = [(ICLBundleRecord *)self teamIdentifier];
  uint64_t v37 = v25 ^ v35 ^ [v36 hash];

  BOOL v38 = [(ICLBundleRecord *)self codeInfoIdentifier];
  uint64_t v39 = [v38 hash];

  BOOL v40 = [(ICLBundleRecord *)self staticDiskUsage];
  uint64_t v41 = v39 ^ [v40 hash];

  BOOL v42 = [(ICLBundleRecord *)self counterpartIdentifiers];
  uint64_t v43 = v41 ^ [v42 hash];

  BOOL v44 = [(ICLBundleRecord *)self entitlements];
  uint64_t v45 = v43 ^ [v44 hash];

  unint64_t v46 = [(ICLBundleRecord *)self dataContainerURL];
  uint64_t v47 = v45 ^ [v46 hash];

  v48 = [(ICLBundleRecord *)self environmentVariables];
  uint64_t v49 = v47 ^ [v48 hash];

  uint64_t v50 = [(ICLBundleRecord *)self groupContainers];
  uint64_t v51 = v37 ^ v49 ^ [v50 hash];

  BOOL v52 = [(ICLBundleRecord *)self personasRecordMap];
  uint64_t v53 = [v52 hash];

  unint64_t v54 = v53 ^ [(ICLBundleRecord *)self codeSignerType];
  unint64_t v55 = v54 ^ [(ICLBundleRecord *)self profileValidationType];
  unint64_t v56 = v55 ^ [(ICLBundleRecord *)self compatibilityState];
  return v51 ^ v56 ^ [(ICLBundleRecord *)self applicationType];
}

- (id)description
{
  v2 = [(ICLBundleRecord *)self legacyRecordDictionary];
  uint64_t v3 = [v2 description];

  return v3;
}

+ (id)bundleRecordArrayToInfoDictionaryArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "legacyRecordDictionary", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v11 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)infoDictionaryArrayToBundleRecordArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [ICLBundleRecord alloc];
          BOOL v12 = -[ICLBundleRecord initWithLegacyRecordDictionary:](v11, "initWithLegacyRecordDictionary:", v10, (void)v15);
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    long long v13 = (void *)[v4 copy];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
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

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (void)setSignerIdentity:(id)a3
{
}

- (NSNumber)signatureVersion
{
  return self->_signatureVersion;
}

- (void)setSignatureVersion:(id)a3
{
}

- (NSString)signerOrganization
{
  return self->_signerOrganization;
}

- (void)setSignerOrganization:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (BOOL)codeSigningInfoNotAuthoritative
{
  return self->_codeSigningInfoNotAuthoritative;
}

- (void)setCodeSigningInfoNotAuthoritative:(BOOL)a3
{
  self->_codeSigningInfoNotAuthoritative = a3;
}

- (NSString)codeInfoIdentifier
{
  return self->_codeInfoIdentifier;
}

- (void)setCodeInfoIdentifier:(id)a3
{
}

- (unint64_t)codeSignerType
{
  return self->_codeSignerType;
}

- (void)setCodeSignerType:(unint64_t)a3
{
  self->_codeSignerType = a3;
}

- (unint64_t)profileValidationType
{
  return self->_profileValidationType;
}

- (void)setProfileValidationType:(unint64_t)a3
{
  self->_profileValidationType = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isNoLongerCompatible
{
  return self->_isNoLongerCompatible;
}

- (void)setIsNoLongerCompatible:(BOOL)a3
{
  self->_isNoLongerCompatible = a3;
}

- (BOOL)hasSettingsBundle
{
  return self->_hasSettingsBundle;
}

- (void)setHasSettingsBundle:(BOOL)a3
{
  self->_hasSettingsBundle = a3;
}

- (BOOL)isContainerized
{
  return self->_isContainerized;
}

- (void)setIsContainerized:(BOOL)a3
{
  self->_isContainerized = a3;
}

- (BOOL)hasAppGroupContainers
{
  return self->_hasAppGroupContainers;
}

- (void)setHasAppGroupContainers:(BOOL)a3
{
  self->_hasAppGroupContainers = a3;
}

- (BOOL)hasSystemContainer
{
  return self->_hasSystemContainer;
}

- (void)setHasSystemContainer:(BOOL)a3
{
  self->_hasSystemContainer = a3;
}

- (BOOL)hasSystemGroupContainers
{
  return self->_hasSystemGroupContainers;
}

- (void)setHasSystemGroupContainers:(BOOL)a3
{
  self->_hasSystemGroupContainers = a3;
}

- (BOOL)isOnMountedDiskImage
{
  return self->_isOnMountedDiskImage;
}

- (void)setIsOnMountedDiskImage:(BOOL)a3
{
  self->_isOnMountedDiskImage = a3;
}

- (unint64_t)compatibilityState
{
  return self->_compatibilityState;
}

- (void)setCompatibilityState:(unint64_t)a3
{
  self->_compatibilityState = a3;
}

- (unint64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(unint64_t)a3
{
  self->_applicationType = a3;
}

- (NSNumber)staticDiskUsage
{
  return self->_staticDiskUsage;
}

- (void)setStaticDiskUsage:(id)a3
{
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (void)setCounterpartIdentifiers:(id)a3
{
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (void)setDataContainerURL:(id)a3
{
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setEnvironmentVariables:(id)a3
{
}

- (NSDictionary)groupContainers
{
  return self->_groupContainers;
}

- (void)setGroupContainers:(id)a3
{
}

- (NSDictionary)personasRecordMap
{
  return self->_personasRecordMap;
}

- (void)setPersonasRecordMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personasRecordMap, 0);
  objc_storeStrong((id *)&self->_groupContainers, 0);
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_staticDiskUsage, 0);
  objc_storeStrong((id *)&self->_codeInfoIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_signerOrganization, 0);
  objc_storeStrong((id *)&self->_signatureVersion, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end