@interface DMFApplication
+ (BOOL)supportsSecureCoding;
- (BOOL)fileSharingEnabled;
- (BOOL)isAppUpdate;
- (BOOL)isBetaApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstalled;
- (BOOL)isManaged;
- (BOOL)isPlaceholder;
- (BOOL)isRemoveable;
- (BOOL)isTapToPayScreenLock;
- (BOOL)isValidated;
- (Class)classForCoder;
- (DMFApplication)initWithApplicationIdentifier:(id)a3 bundleIdentifier:(id)a4 name:(id)a5 iconData:(id)a6 bundleVersion:(id)a7 shortVersionString:(id)a8 applicationType:(id)a9 adamID:(id)a10 externalVersionIdentifier:(id)a11 betaExternalVersionIdentifier:(id)a12 staticUsage:(id)a13 dynamicUsage:(id)a14 onDemandResourcesUsage:(id)a15 unusedRedemptionCode:(id)a16 attributes:(id)a17 configuration:(id)a18 feedback:(id)a19 state:(unint64_t)a20 managementFlags:(unint64_t)a21 isManaged:(BOOL)a22 isValidated:(BOOL)a23 isInstalled:(BOOL)a24 isPlaceholder:(BOOL)a25 isAppUpdate:(BOOL)a26 isBetaApp:(BOOL)a27 isRemoveable:(BOOL)a28 fileSharingEnabled:(BOOL)a29 progress:(id)a30;
- (DMFApplication)initWithBundleIdentifier:(id)a3 name:(id)a4 iconData:(id)a5 applicationType:(id)a6 adamID:(id)a7 externalVersionNumber:(id)a8 betaExternalVersionIdentifier:(id)a9 isInstalled:(BOOL)a10 isPlaceholder:(BOOL)a11 isAppUpdate:(BOOL)a12 isBetaApp:(BOOL)a13 isRemoveable:(BOOL)a14 fileSharingEnabled:(BOOL)a15 progress:(id)a16;
- (DMFApplication)initWithCoder:(id)a3;
- (DMFApplicationInstallProgress)progress;
- (NSData)iconData;
- (NSDictionary)attributes;
- (NSDictionary)configuration;
- (NSDictionary)feedback;
- (NSNumber)adamID;
- (NSNumber)betaExternalVersionIdentifier;
- (NSNumber)dynamicUsage;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)onDemandResourcesUsage;
- (NSNumber)staticUsage;
- (NSString)applicationIdentifier;
- (NSString)applicationType;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)name;
- (NSString)shortVersionString;
- (NSString)unusedRedemptionCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)managementFlags;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFApplication

- (DMFApplication)initWithApplicationIdentifier:(id)a3 bundleIdentifier:(id)a4 name:(id)a5 iconData:(id)a6 bundleVersion:(id)a7 shortVersionString:(id)a8 applicationType:(id)a9 adamID:(id)a10 externalVersionIdentifier:(id)a11 betaExternalVersionIdentifier:(id)a12 staticUsage:(id)a13 dynamicUsage:(id)a14 onDemandResourcesUsage:(id)a15 unusedRedemptionCode:(id)a16 attributes:(id)a17 configuration:(id)a18 feedback:(id)a19 state:(unint64_t)a20 managementFlags:(unint64_t)a21 isManaged:(BOOL)a22 isValidated:(BOOL)a23 isInstalled:(BOOL)a24 isPlaceholder:(BOOL)a25 isAppUpdate:(BOOL)a26 isBetaApp:(BOOL)a27 isRemoveable:(BOOL)a28 fileSharingEnabled:(BOOL)a29 progress:(id)a30
{
  id v82 = a3;
  id v87 = a4;
  id v35 = a5;
  id v88 = a6;
  id obj = a7;
  id v81 = a7;
  id v36 = a8;
  id v80 = a8;
  id v37 = a9;
  id v86 = a10;
  id v85 = a11;
  id v84 = a12;
  id v83 = a13;
  v38 = v35;
  id v39 = a14;
  id v40 = a15;
  id v41 = a16;
  id v42 = a17;
  id v43 = a18;
  id v44 = a19;
  id v79 = a30;
  v89.receiver = self;
  v89.super_class = (Class)DMFApplication;
  v45 = [(DMFApplication *)&v89 init];
  if (v45)
  {
    uint64_t v46 = [v82 copy];
    applicationIdentifier = v45->_applicationIdentifier;
    v45->_applicationIdentifier = (NSString *)v46;

    uint64_t v48 = [v87 copy];
    bundleIdentifier = v45->_bundleIdentifier;
    v45->_bundleIdentifier = (NSString *)v48;

    uint64_t v50 = [v38 copy];
    name = v45->_name;
    v45->_name = (NSString *)v50;

    uint64_t v52 = [v88 copy];
    iconData = v45->_iconData;
    v45->_iconData = (NSData *)v52;

    objc_storeStrong((id *)&v45->_bundleVersion, obj);
    objc_storeStrong((id *)&v45->_shortVersionString, v36);
    uint64_t v54 = [v37 copy];
    applicationType = v45->_applicationType;
    v45->_applicationType = (NSString *)v54;

    uint64_t v56 = [v86 copy];
    adamID = v45->_adamID;
    v45->_adamID = (NSNumber *)v56;

    uint64_t v58 = [v85 copy];
    externalVersionIdentifier = v45->_externalVersionIdentifier;
    v45->_externalVersionIdentifier = (NSNumber *)v58;

    uint64_t v60 = [v84 copy];
    betaExternalVersionIdentifier = v45->_betaExternalVersionIdentifier;
    v45->_betaExternalVersionIdentifier = (NSNumber *)v60;

    uint64_t v62 = [v83 copy];
    staticUsage = v45->_staticUsage;
    v45->_staticUsage = (NSNumber *)v62;

    uint64_t v64 = [v39 copy];
    dynamicUsage = v45->_dynamicUsage;
    v45->_dynamicUsage = (NSNumber *)v64;

    uint64_t v66 = [v40 copy];
    onDemandResourcesUsage = v45->_onDemandResourcesUsage;
    v45->_onDemandResourcesUsage = (NSNumber *)v66;

    uint64_t v68 = [v41 copy];
    unusedRedemptionCode = v45->_unusedRedemptionCode;
    v45->_unusedRedemptionCode = (NSString *)v68;

    uint64_t v70 = [v42 copy];
    attributes = v45->_attributes;
    v45->_attributes = (NSDictionary *)v70;

    uint64_t v72 = [v43 copy];
    configuration = v45->_configuration;
    v45->_configuration = (NSDictionary *)v72;

    uint64_t v74 = [v44 copy];
    feedback = v45->_feedback;
    v45->_feedback = (NSDictionary *)v74;

    v45->_state = a20;
    v45->_managementFlags = a21;
    v45->_isManaged = a22;
    v45->_isValidated = a23;
    v45->_isInstalled = a24;
    v45->_isPlaceholder = a25;
    v45->_isAppUpdate = a26;
    v45->_isBetaApp = a27;
    v45->_isRemoveable = a28;
    v45->_fileSharingEnabled = a29;
    objc_storeStrong((id *)&v45->_progress, a30);
  }

  return v45;
}

- (DMFApplication)initWithBundleIdentifier:(id)a3 name:(id)a4 iconData:(id)a5 applicationType:(id)a6 adamID:(id)a7 externalVersionNumber:(id)a8 betaExternalVersionIdentifier:(id)a9 isInstalled:(BOOL)a10 isPlaceholder:(BOOL)a11 isAppUpdate:(BOOL)a12 isBetaApp:(BOOL)a13 isRemoveable:(BOOL)a14 fileSharingEnabled:(BOOL)a15 progress:(id)a16
{
  id v45 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a8;
  id v27 = a9;
  id v28 = a16;
  v46.receiver = self;
  v46.super_class = (Class)DMFApplication;
  v29 = [(DMFApplication *)&v46 init];
  if (v29)
  {
    uint64_t v30 = [v45 copy];
    bundleIdentifier = v29->_bundleIdentifier;
    v29->_bundleIdentifier = (NSString *)v30;

    uint64_t v32 = [v22 copy];
    name = v29->_name;
    v29->_name = (NSString *)v32;

    uint64_t v34 = [v23 copy];
    iconData = v29->_iconData;
    v29->_iconData = (NSData *)v34;

    uint64_t v36 = [v24 copy];
    applicationType = v29->_applicationType;
    v29->_applicationType = (NSString *)v36;

    uint64_t v38 = [v25 copy];
    adamID = v29->_adamID;
    v29->_adamID = (NSNumber *)v38;

    uint64_t v40 = [v26 copy];
    externalVersionIdentifier = v29->_externalVersionIdentifier;
    v29->_externalVersionIdentifier = (NSNumber *)v40;

    uint64_t v42 = [v27 copy];
    betaExternalVersionIdentifier = v29->_betaExternalVersionIdentifier;
    v29->_betaExternalVersionIdentifier = (NSNumber *)v42;

    v29->_isInstalled = a10;
    v29->_isPlaceholder = a11;
    v29->_isAppUpdate = a12;
    v29->_isBetaApp = a13;
    v29->_isRemoveable = a14;
    v29->_fileSharingEnabled = a15;
    objc_storeStrong((id *)&v29->_progress, a16);
  }

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v27 = objc_alloc((Class)objc_opt_class());
  id v35 = [(DMFApplication *)self applicationIdentifier];
  uint64_t v34 = [(DMFApplication *)self bundleIdentifier];
  v33 = [(DMFApplication *)self name];
  uint64_t v32 = [(DMFApplication *)self iconData];
  v31 = [(DMFApplication *)self bundleVersion];
  id v26 = [(DMFApplication *)self shortVersionString];
  uint64_t v30 = [(DMFApplication *)self applicationType];
  v29 = [(DMFApplication *)self adamID];
  id v25 = [(DMFApplication *)self externalVersionIdentifier];
  v15 = [(DMFApplication *)self betaExternalVersionIdentifier];
  id v24 = [(DMFApplication *)self staticUsage];
  id v23 = [(DMFApplication *)self dynamicUsage];
  id v22 = [(DMFApplication *)self onDemandResourcesUsage];
  v21 = [(DMFApplication *)self unusedRedemptionCode];
  v20 = [(DMFApplication *)self attributes];
  v19 = [(DMFApplication *)self configuration];
  v18 = [(DMFApplication *)self feedback];
  unint64_t v17 = [(DMFApplication *)self state];
  unint64_t v16 = [(DMFApplication *)self managementFlags];
  BOOL v4 = [(DMFApplication *)self isManaged];
  BOOL v5 = [(DMFApplication *)self isValidated];
  BOOL v6 = [(DMFApplication *)self isInstalled];
  BOOL v7 = [(DMFApplication *)self isPlaceholder];
  BOOL v8 = [(DMFApplication *)self isAppUpdate];
  BOOL v9 = [(DMFApplication *)self isBetaApp];
  BOOL v10 = [(DMFApplication *)self isRemoveable];
  BOOL v11 = [(DMFApplication *)self fileSharingEnabled];
  v12 = [(DMFApplication *)self progress];
  HIBYTE(v14) = v11;
  BYTE6(v14) = v10;
  BYTE5(v14) = v9;
  BYTE4(v14) = v8;
  BYTE3(v14) = v7;
  BYTE2(v14) = v6;
  BYTE1(v14) = v5;
  LOBYTE(v14) = v4;
  id v28 = objc_msgSend(v27, "initWithApplicationIdentifier:bundleIdentifier:name:iconData:bundleVersion:shortVersionString:applicationType:adamID:externalVersionIdentifier:betaExternalVersionIdentifier:staticUsage:dynamicUsage:onDemandResourcesUsage:unusedRedemptionCode:attributes:configuration:feedback:state:managementFlags:isManaged:isValidated:isInstalled:isPlaceholder:isAppUpdate:isBetaApp:isRemoveable:fileSharingEnabled:progress:", v35, v34, v33, v32, v31, v26, v30, v29, v25, v15, v24, v23, v22, v21,
                  v20,
                  v19,
                  v18,
                  v17,
                  v16,
                  v14,
                  v12);

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (DMFApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)DMFApplication;
  BOOL v5 = [(DMFApplication *)&v104 init];
  if (v5)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v7;

    BOOL v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"iconData"];
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v19;

    v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"shortVersionString"];
    shortVersionString = v5->_shortVersionString;
    v5->_shortVersionString = (NSString *)v22;

    id v24 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"applicationType"];
    applicationType = v5->_applicationType;
    v5->_applicationType = (NSString *)v25;

    id v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"adamID"];
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v28;

    uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"externalVersionIdentifier"];
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v31;

    v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"betaExternalVersionIdentifier"];
    betaExternalVersionIdentifier = v5->_betaExternalVersionIdentifier;
    v5->_betaExternalVersionIdentifier = (NSNumber *)v34;

    uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"staticUsage"];
    staticUsage = v5->_staticUsage;
    v5->_staticUsage = (NSNumber *)v37;

    id v39 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"dynamicUsage"];
    dynamicUsage = v5->_dynamicUsage;
    v5->_dynamicUsage = (NSNumber *)v40;

    uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"onDemandResourcesUsage"];
    onDemandResourcesUsage = v5->_onDemandResourcesUsage;
    v5->_onDemandResourcesUsage = (NSNumber *)v43;

    id v45 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"unusedRedemptionCode"];
    unusedRedemptionCode = v5->_unusedRedemptionCode;
    v5->_unusedRedemptionCode = (NSString *)v46;

    v101 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v98 = objc_opt_class();
    uint64_t v95 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = objc_opt_class();
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_msgSend(v101, "setWithObjects:", v98, v95, v48, v49, v50, v51, v52, v53, v54, v55, objc_opt_class(), 0);
    uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v57;

    v102 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v99 = objc_opt_class();
    uint64_t v96 = objc_opt_class();
    uint64_t v59 = objc_opt_class();
    uint64_t v60 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    uint64_t v63 = objc_opt_class();
    uint64_t v64 = objc_opt_class();
    uint64_t v65 = objc_opt_class();
    uint64_t v66 = objc_opt_class();
    v67 = objc_msgSend(v102, "setWithObjects:", v99, v96, v59, v60, v61, v62, v63, v64, v65, v66, objc_opt_class(), 0);
    uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v68;

    v103 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v100 = objc_opt_class();
    uint64_t v97 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    uint64_t v72 = objc_opt_class();
    uint64_t v73 = objc_opt_class();
    uint64_t v74 = objc_opt_class();
    uint64_t v75 = objc_opt_class();
    uint64_t v76 = objc_opt_class();
    uint64_t v77 = objc_opt_class();
    v78 = objc_msgSend(v103, "setWithObjects:", v100, v97, v70, v71, v72, v73, v74, v75, v76, v77, objc_opt_class(), 0);
    uint64_t v79 = [v4 decodeObjectOfClasses:v78 forKey:@"feedback"];
    feedback = v5->_feedback;
    v5->_feedback = (NSDictionary *)v79;

    id v81 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    v5->_state = [v81 unsignedIntegerValue];

    id v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managementFlags"];
    v5->_managementFlags = [v82 unsignedIntegerValue];

    id v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isManaged"];
    v5->_isManaged = [v83 BOOLValue];

    id v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isValidated"];
    v5->_isValidated = [v84 BOOLValue];

    id v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isInstalled"];
    v5->_isInstalled = [v85 BOOLValue];

    id v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isPlaceholder"];
    v5->_isPlaceholder = [v86 BOOLValue];

    id v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAppUpdate"];
    v5->_isAppUpdate = [v87 BOOLValue];

    id v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBetaApp"];
    v5->_isBetaApp = [v88 BOOLValue];

    objc_super v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRemoveable"];
    v5->_isRemoveable = [v89 BOOLValue];

    v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileSharingEnabled"];
    v5->_fileSharingEnabled = [v90 BOOLValue];

    v91 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v92 = [v4 decodeObjectOfClasses:v91 forKey:@"progress"];
    progress = v5->_progress;
    v5->_progress = (DMFApplicationInstallProgress *)v92;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DMFApplication *)self applicationIdentifier];
  [v4 encodeObject:v5 forKey:@"applicationIdentifier"];

  BOOL v6 = [(DMFApplication *)self bundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleIdentifier"];

  uint64_t v7 = [(DMFApplication *)self name];
  [v4 encodeObject:v7 forKey:@"name"];

  BOOL v8 = [(DMFApplication *)self iconData];
  [v4 encodeObject:v8 forKey:@"iconData"];

  BOOL v9 = [(DMFApplication *)self bundleVersion];
  [v4 encodeObject:v9 forKey:@"bundleVersion"];

  uint64_t v10 = [(DMFApplication *)self shortVersionString];
  [v4 encodeObject:v10 forKey:@"shortVersionString"];

  BOOL v11 = [(DMFApplication *)self applicationType];
  [v4 encodeObject:v11 forKey:@"applicationType"];

  v12 = [(DMFApplication *)self adamID];
  [v4 encodeObject:v12 forKey:@"adamID"];

  uint64_t v13 = [(DMFApplication *)self externalVersionIdentifier];
  [v4 encodeObject:v13 forKey:@"externalVersionIdentifier"];

  uint64_t v14 = [(DMFApplication *)self betaExternalVersionIdentifier];
  [v4 encodeObject:v14 forKey:@"betaExternalVersionIdentifier"];

  v15 = [(DMFApplication *)self staticUsage];
  [v4 encodeObject:v15 forKey:@"staticUsage"];

  uint64_t v16 = [(DMFApplication *)self dynamicUsage];
  [v4 encodeObject:v16 forKey:@"dynamicUsage"];

  unint64_t v17 = [(DMFApplication *)self onDemandResourcesUsage];
  [v4 encodeObject:v17 forKey:@"onDemandResourcesUsage"];

  v18 = [(DMFApplication *)self unusedRedemptionCode];
  [v4 encodeObject:v18 forKey:@"unusedRedemptionCode"];

  uint64_t v19 = [(DMFApplication *)self attributes];
  [v4 encodeObject:v19 forKey:@"attributes"];

  v20 = [(DMFApplication *)self configuration];
  [v4 encodeObject:v20 forKey:@"configuration"];

  v21 = [(DMFApplication *)self feedback];
  [v4 encodeObject:v21 forKey:@"feedback"];

  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFApplication state](self, "state"));
  [v4 encodeObject:v22 forKey:@"state"];

  id v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFApplication managementFlags](self, "managementFlags"));
  [v4 encodeObject:v23 forKey:@"managementFlags"];

  id v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFApplication isManaged](self, "isManaged"));
  [v4 encodeObject:v24 forKey:@"isManaged"];

  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFApplication isValidated](self, "isValidated"));
  [v4 encodeObject:v25 forKey:@"isValidated"];

  id v26 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFApplication isInstalled](self, "isInstalled"));
  [v4 encodeObject:v26 forKey:@"isInstalled"];

  id v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFApplication isPlaceholder](self, "isPlaceholder"));
  [v4 encodeObject:v27 forKey:@"isPlaceholder"];

  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFApplication isAppUpdate](self, "isAppUpdate"));
  [v4 encodeObject:v28 forKey:@"isAppUpdate"];

  v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFApplication isBetaApp](self, "isBetaApp"));
  [v4 encodeObject:v29 forKey:@"isBetaApp"];

  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFApplication isRemoveable](self, "isRemoveable"));
  [v4 encodeObject:v30 forKey:@"isRemoveable"];

  uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFApplication fileSharingEnabled](self, "fileSharingEnabled"));
  [v4 encodeObject:v31 forKey:@"fileSharingEnabled"];

  id v32 = [(DMFApplication *)self progress];
  [v4 encodeObject:v32 forKey:@"progress"];
}

- (unint64_t)hash
{
  uint64_t v49 = [(DMFApplication *)self applicationIdentifier];
  uint64_t v3 = [v49 hash];
  uint64_t v48 = [(DMFApplication *)self bundleIdentifier];
  uint64_t v4 = [v48 hash] ^ v3;
  v47 = [(DMFApplication *)self name];
  uint64_t v5 = [v47 hash];
  uint64_t v46 = [(DMFApplication *)self iconData];
  uint64_t v6 = v4 ^ v5 ^ [v46 hash];
  id v45 = [(DMFApplication *)self bundleVersion];
  uint64_t v7 = [v45 hash];
  id v44 = [(DMFApplication *)self shortVersionString];
  uint64_t v8 = v7 ^ [v44 hash];
  uint64_t v43 = [(DMFApplication *)self applicationType];
  uint64_t v9 = v6 ^ v8 ^ [v43 hash];
  uint64_t v42 = [(DMFApplication *)self adamID];
  uint64_t v10 = [v42 hash];
  id v41 = [(DMFApplication *)self externalVersionIdentifier];
  uint64_t v11 = v10 ^ [v41 hash];
  uint64_t v40 = [(DMFApplication *)self betaExternalVersionIdentifier];
  uint64_t v12 = v11 ^ [v40 hash];
  id v39 = [(DMFApplication *)self staticUsage];
  uint64_t v13 = v9 ^ v12 ^ [v39 hash];
  uint64_t v14 = [(DMFApplication *)self dynamicUsage];
  uint64_t v15 = [v14 hash];
  uint64_t v16 = [(DMFApplication *)self onDemandResourcesUsage];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(DMFApplication *)self unusedRedemptionCode];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(DMFApplication *)self attributes];
  uint64_t v21 = v19 ^ [v20 hash];
  uint64_t v22 = [(DMFApplication *)self configuration];
  uint64_t v23 = v13 ^ v21 ^ [v22 hash];
  id v24 = [(DMFApplication *)self feedback];
  uint64_t v25 = [v24 hash];
  unint64_t v26 = v25 ^ [(DMFApplication *)self state];
  unint64_t v27 = v26 ^ [(DMFApplication *)self managementFlags];
  unint64_t v28 = v27 ^ [(DMFApplication *)self isManaged];
  unint64_t v29 = v28 ^ [(DMFApplication *)self isValidated];
  uint64_t v30 = v23 ^ v29 ^ [(DMFApplication *)self isInstalled];
  uint64_t v31 = [(DMFApplication *)self isPlaceholder];
  uint64_t v32 = v31 ^ [(DMFApplication *)self isAppUpdate];
  uint64_t v33 = v32 ^ [(DMFApplication *)self isBetaApp];
  uint64_t v34 = v33 ^ [(DMFApplication *)self isRemoveable];
  uint64_t v35 = v34 ^ [(DMFApplication *)self fileSharingEnabled];
  uint64_t v36 = [(DMFApplication *)self progress];
  unint64_t v37 = v30 ^ v35 ^ [v36 hash];

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFApplication *)a3;
  if (self == v4)
  {
    char v85 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(DMFApplication *)self applicationIdentifier];
      uint64_t v7 = [(DMFApplication *)v5 applicationIdentifier];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      if (v8 | v9)
      {
        int v10 = [(id)v8 isEqual:v9];

        if (!v10)
        {
          char v85 = 0;
LABEL_80:

          goto LABEL_81;
        }
      }
      uint64_t v11 = [(DMFApplication *)self bundleIdentifier];
      uint64_t v12 = [(DMFApplication *)v5 bundleIdentifier];
      unint64_t v13 = v11;
      unint64_t v14 = v12;
      v126 = (void *)v13;
      if (v13 | v14)
      {
        int v15 = [(id)v13 isEqual:v14];

        if (!v15)
        {
          char v85 = 0;
LABEL_79:

          goto LABEL_80;
        }
      }
      uint64_t v16 = [(DMFApplication *)self name];
      uint64_t v17 = [(DMFApplication *)v5 name];
      unint64_t v18 = v16;
      unint64_t v125 = v17;
      if (v18 | v125)
      {
        int v19 = [(id)v18 isEqual:v125];

        if (!v19)
        {
          char v85 = 0;
LABEL_78:

          goto LABEL_79;
        }
      }
      unint64_t v123 = v18;
      v20 = [(DMFApplication *)self iconData];
      uint64_t v21 = [(DMFApplication *)v5 iconData];
      unint64_t v22 = v20;
      unint64_t v124 = v21;
      if (v22 | v124)
      {
        int v23 = [(id)v22 isEqual:v124];

        if (!v23)
        {
          char v85 = 0;
          unint64_t v18 = v123;
LABEL_77:

          goto LABEL_78;
        }
      }
      unint64_t v120 = v22;
      id v24 = [(DMFApplication *)self bundleVersion];
      uint64_t v25 = [(DMFApplication *)v5 bundleVersion];
      unint64_t v26 = v24;
      unint64_t v121 = v25;
      v122 = (void *)v26;
      if (v26 | v121)
      {
        int v27 = [(id)v26 isEqual:v121];

        if (!v27)
        {
          char v85 = 0;
          unint64_t v18 = v123;
LABEL_76:

          goto LABEL_77;
        }
      }
      unint64_t v28 = [(DMFApplication *)self shortVersionString];
      unint64_t v29 = [(DMFApplication *)v5 shortVersionString];
      unint64_t v30 = v28;
      unint64_t v118 = v29;
      v119 = (void *)v30;
      if (v30 | v118)
      {
        int v31 = [(id)v30 isEqual:v118];

        if (!v31)
        {
          char v85 = 0;
          unint64_t v18 = v123;
LABEL_75:

          goto LABEL_76;
        }
      }
      uint64_t v32 = [(DMFApplication *)self applicationType];
      uint64_t v33 = [(DMFApplication *)v5 applicationType];
      unint64_t v34 = v32;
      unint64_t v35 = v33;
      v117 = (void *)v34;
      if (v34 | v35)
      {
        int v36 = [(id)v34 isEqual:v35];

        if (!v36)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v22 = v120;
LABEL_74:

          goto LABEL_75;
        }
      }
      unint64_t v110 = v35;
      unint64_t v37 = [(DMFApplication *)self adamID];
      uint64_t v38 = [(DMFApplication *)v5 adamID];
      unint64_t v39 = v37;
      unint64_t v115 = v38;
      v116 = (void *)v39;
      if (v39 | v115)
      {
        int v40 = [(id)v39 isEqual:v115];

        if (!v40)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v22 = v120;
          unint64_t v35 = v110;
LABEL_73:

          goto LABEL_74;
        }
      }
      id v41 = [(DMFApplication *)self externalVersionIdentifier];
      uint64_t v42 = [(DMFApplication *)v5 externalVersionIdentifier];
      unint64_t v43 = v41;
      unint64_t v44 = v42;
      v108 = (void *)v44;
      v109 = (void *)v43;
      if (v43 | v44)
      {
        id v45 = (void *)v44;
        int v46 = [(id)v43 isEqual:v44];

        if (!v46)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v22 = v120;
          unint64_t v35 = v110;
LABEL_72:

          goto LABEL_73;
        }
      }
      v47 = [(DMFApplication *)self betaExternalVersionIdentifier];
      uint64_t v48 = [(DMFApplication *)v5 betaExternalVersionIdentifier];
      unint64_t v49 = v47;
      unint64_t v106 = v48;
      v107 = (void *)v49;
      if (v49 | v106)
      {
        int v50 = [(id)v49 isEqual:v106];

        if (!v50)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v22 = v120;
          unint64_t v35 = v110;
LABEL_71:

          goto LABEL_72;
        }
      }
      uint64_t v51 = [(DMFApplication *)self staticUsage];
      uint64_t v52 = [(DMFApplication *)v5 staticUsage];
      unint64_t v53 = v51;
      unint64_t v104 = v52;
      v105 = (void *)v53;
      if (v53 | v104)
      {
        int v54 = [(id)v53 isEqual:v104];

        if (!v54)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v22 = v120;
          unint64_t v35 = v110;
LABEL_70:

          goto LABEL_71;
        }
      }
      uint64_t v55 = [(DMFApplication *)self dynamicUsage];
      uint64_t v56 = [(DMFApplication *)v5 dynamicUsage];
      unint64_t v57 = v55;
      unint64_t v58 = v56;
      v103 = (void *)v58;
      if (v57 | v58)
      {
        uint64_t v59 = (void *)v58;
        int v60 = [(id)v57 isEqual:v58];

        if (!v60)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v22 = v120;
          unint64_t v35 = v110;
LABEL_69:

          goto LABEL_70;
        }
      }
      uint64_t v61 = [(DMFApplication *)self onDemandResourcesUsage];
      uint64_t v62 = [(DMFApplication *)v5 onDemandResourcesUsage];
      unint64_t v63 = v61;
      unint64_t v101 = v62;
      v102 = (void *)v63;
      if (v63 | v101)
      {
        int v64 = [(id)v63 isEqual:v101];

        if (!v64)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v22 = v120;
          unint64_t v35 = v110;
LABEL_68:

          goto LABEL_69;
        }
      }
      uint64_t v65 = [(DMFApplication *)self unusedRedemptionCode];
      uint64_t v66 = [(DMFApplication *)v5 unusedRedemptionCode];
      unint64_t v67 = v65;
      unint64_t v68 = v66;
      uint64_t v100 = (void *)v68;
      if (v67 | v68)
      {
        v69 = (void *)v68;
        int v70 = [(id)v67 isEqual:v68];

        if (!v70)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v35 = v110;
LABEL_67:

          unint64_t v22 = v120;
          goto LABEL_68;
        }
      }
      uint64_t v71 = [(DMFApplication *)self attributes];
      uint64_t v72 = [(DMFApplication *)v5 attributes];
      unint64_t v73 = v71;
      unint64_t v98 = v72;
      uint64_t v99 = (void *)v73;
      if (v73 | v98)
      {
        int v111 = [(id)v73 isEqual:v98];

        if (!v111)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v35 = v110;
LABEL_66:

          goto LABEL_67;
        }
      }
      uint64_t v74 = [(DMFApplication *)self configuration];
      uint64_t v75 = [(DMFApplication *)v5 configuration];
      unint64_t v76 = v74;
      unint64_t v96 = v75;
      uint64_t v97 = (void *)v76;
      if (v76 | v96)
      {
        int v112 = [(id)v76 isEqual:v96];

        if (!v112)
        {
          char v85 = 0;
          unint64_t v18 = v123;
          unint64_t v35 = v110;
LABEL_65:

          goto LABEL_66;
        }
      }
      uint64_t v77 = [(DMFApplication *)self feedback];
      v78 = [(DMFApplication *)v5 feedback];
      unint64_t v79 = v77;
      unint64_t v94 = v78;
      uint64_t v95 = (void *)v79;
      if (v79 | v94)
      {
        int v113 = [(id)v79 isEqual:v94];

        if (!v113) {
          goto LABEL_62;
        }
      }
      unint64_t v80 = [(DMFApplication *)self state];
      unint64_t v35 = v110;
      if (v80 != [(DMFApplication *)v5 state]
        || (unint64_t v81 = [(DMFApplication *)self managementFlags],
            v81 != [(DMFApplication *)v5 managementFlags])
        || (BOOL v82 = [(DMFApplication *)self isManaged], v82 != [(DMFApplication *)v5 isManaged])
        || (BOOL v83 = [(DMFApplication *)self isValidated],
            v83 != [(DMFApplication *)v5 isValidated])
        || (BOOL v84 = [(DMFApplication *)self isInstalled],
            v84 != [(DMFApplication *)v5 isInstalled]))
      {
        char v85 = 0;
        unint64_t v18 = v123;
LABEL_64:

        goto LABEL_65;
      }
      BOOL v86 = [(DMFApplication *)self isPlaceholder];
      if (v86 == [(DMFApplication *)v5 isPlaceholder])
      {
        BOOL v88 = [(DMFApplication *)self isAppUpdate];
        v114 = v5;
        if (v88 == [(DMFApplication *)v5 isAppUpdate]
          && (BOOL v89 = [(DMFApplication *)self isBetaApp], v89 == [(DMFApplication *)v5 isBetaApp])
          && (BOOL v90 = [(DMFApplication *)self isRemoveable],
              v90 == [(DMFApplication *)v5 isRemoveable])
          && (BOOL v91 = [(DMFApplication *)self fileSharingEnabled],
              v91 == [(DMFApplication *)v5 fileSharingEnabled]))
        {
          uint64_t v92 = [(DMFApplication *)self progress];
          uint64_t v93 = [(DMFApplication *)v114 progress];
          if (v92 | v93) {
            char v85 = [(id)v92 isEqual:v93];
          }
          else {
            char v85 = 1;
          }
        }
        else
        {
          char v85 = 0;
        }
        unint64_t v18 = v123;
        uint64_t v5 = v114;
      }
      else
      {
LABEL_62:
        char v85 = 0;
        unint64_t v18 = v123;
      }
      unint64_t v35 = v110;
      goto LABEL_64;
    }
    char v85 = 0;
  }
LABEL_81:

  return v85;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  uint64_t v4 = [(DMFApplication *)self applicationIdentifier];
  [v3 appendFormat:@"\tApplication Identifier           : %@\n", v4];

  uint64_t v5 = [(DMFApplication *)self bundleIdentifier];
  [v3 appendFormat:@"\tBundle Identifier                : %@\n", v5];

  uint64_t v6 = [(DMFApplication *)self name];
  [v3 appendFormat:@"\tName                             : %@\n", v6];

  uint64_t v7 = [(DMFApplication *)self adamID];
  [v3 appendFormat:@"\tAdam ID                          : %@\n", v7];

  unint64_t v8 = [(DMFApplication *)self externalVersionIdentifier];
  [v3 appendFormat:@"\tExternal Version Identifier      : %@\n", v8];

  unint64_t v9 = [(DMFApplication *)self betaExternalVersionIdentifier];
  [v3 appendFormat:@"\tBeta External Version Identifier : %@\n", v9];

  int v10 = [(DMFApplication *)self bundleVersion];
  [v3 appendFormat:@"\tBundle Version                   : %@\n", v10];

  uint64_t v11 = [(DMFApplication *)self shortVersionString];
  [v3 appendFormat:@"\tShort Version String             : %@\n", v11];

  uint64_t v12 = [(DMFApplication *)self unusedRedemptionCode];
  [v3 appendFormat:@"\tUnused Redemption Code           : %@\n", v12];

  unint64_t v13 = [(DMFApplication *)self attributes];
  [v3 appendFormat:@"\tAttributes                       : %@\n", v13];

  unint64_t v14 = [(DMFApplication *)self configuration];
  [v3 appendFormat:@"\tConfiguration                    : %@\n", v14];

  int v15 = [(DMFApplication *)self feedback];
  [v3 appendFormat:@"\tFeedback                         : %@\n", v15];

  uint64_t v16 = [(DMFApplication *)self progress];
  [v3 appendFormat:@"\tProgress                         : %@\n", v16];

  if ([(DMFApplication *)self isManaged]) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  [v3 appendFormat:@"\tIs Managed                       : %@\n", v17];
  if ([(DMFApplication *)self isValidated]) {
    unint64_t v18 = @"YES";
  }
  else {
    unint64_t v18 = @"NO";
  }
  [v3 appendFormat:@"\tIs Validated                     : %@\n", v18];
  if ([(DMFApplication *)self isInstalled]) {
    int v19 = @"YES";
  }
  else {
    int v19 = @"NO";
  }
  [v3 appendFormat:@"\tIs Installed                     : %@\n", v19];
  if ([(DMFApplication *)self isPlaceholder]) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  [v3 appendFormat:@"\tIs Placeholder                   : %@\n", v20];
  if ([(DMFApplication *)self isAppUpdate]) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  [v3 appendFormat:@"\tIs App Update                    : %@\n", v21];
  if ([(DMFApplication *)self isBetaApp]) {
    unint64_t v22 = @"YES";
  }
  else {
    unint64_t v22 = @"NO";
  }
  [v3 appendFormat:@"\tIs Beta App                      : %@\n", v22];
  if ([(DMFApplication *)self isRemoveable]) {
    int v23 = @"YES";
  }
  else {
    int v23 = @"NO";
  }
  [v3 appendFormat:@"\tIs Removable                     : %@\n", v23];
  if ([(DMFApplication *)self fileSharingEnabled]) {
    id v24 = @"YES";
  }
  else {
    id v24 = @"NO";
  }
  [v3 appendFormat:@"\tFile Sharing Enabled             : %@\n", v24];
  [v3 appendString:@"}>"];
  uint64_t v25 = (void *)[v3 copy];

  return v25;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (NSString)applicationType
{
  return self->_applicationType;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (NSNumber)betaExternalVersionIdentifier
{
  return self->_betaExternalVersionIdentifier;
}

- (NSNumber)staticUsage
{
  return self->_staticUsage;
}

- (NSNumber)dynamicUsage
{
  return self->_dynamicUsage;
}

- (NSNumber)onDemandResourcesUsage
{
  return self->_onDemandResourcesUsage;
}

- (NSString)unusedRedemptionCode
{
  return self->_unusedRedemptionCode;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (NSDictionary)feedback
{
  return self->_feedback;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)managementFlags
{
  return self->_managementFlags;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)isValidated
{
  return self->_isValidated;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isAppUpdate
{
  return self->_isAppUpdate;
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (BOOL)isRemoveable
{
  return self->_isRemoveable;
}

- (BOOL)isTapToPayScreenLock
{
  return self->_isTapToPayScreenLock;
}

- (BOOL)fileSharingEnabled
{
  return self->_fileSharingEnabled;
}

- (DMFApplicationInstallProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_unusedRedemptionCode, 0);
  objc_storeStrong((id *)&self->_onDemandResourcesUsage, 0);
  objc_storeStrong((id *)&self->_dynamicUsage, 0);
  objc_storeStrong((id *)&self->_staticUsage, 0);
  objc_storeStrong((id *)&self->_betaExternalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_applicationType, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end