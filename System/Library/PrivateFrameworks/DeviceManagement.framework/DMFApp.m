@interface DMFApp
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForBool:(id)a3 showWhenUnassigned:(BOOL)a4 valueWhenUnassigned:(BOOL)a5;
+ (id)stringForInstallationState:(unint64_t)a3;
- (BOOL)hasUpdateAvailable;
- (BOOL)isAdHocCodeSigned;
- (BOOL)isAppClip;
- (BOOL)isAppStoreVendable;
- (BOOL)isBetaApp;
- (BOOL)isBlocked;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLicenseExpired;
- (BOOL)isLicenseRevoked;
- (BOOL)isPlaceholder;
- (BOOL)isRestricted;
- (BOOL)isUPP;
- (BOOL)isUserBasedVPP;
- (BOOL)isValidated;
- (DMFApp)initWithCoder:(id)a3;
- (DMFAppManagementInformation)managementInformation;
- (NSArray)associatedDomains;
- (NSDictionary)configuration;
- (NSDictionary)feedback;
- (NSNumber)allowUserToHide;
- (NSNumber)allowUserToLock;
- (NSNumber)associatedDomainsEnableDirectDownloads;
- (NSNumber)dynamicUsage;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)onDemandResourcesUsage;
- (NSNumber)removable;
- (NSNumber)sharedUsage;
- (NSNumber)staticUsage;
- (NSNumber)storeItemIdentifier;
- (NSNumber)tapToPayScreenLock;
- (NSString)DNSProxyUUIDString;
- (NSString)VPNUUIDString;
- (NSString)bundleIdentifier;
- (NSString)cellularSliceUUIDString;
- (NSString)contentFilterUUIDString;
- (NSString)displayName;
- (NSString)distributorIdentifier;
- (NSString)relayUUIDString;
- (NSString)shortVersion;
- (NSString)sourceIdentifier;
- (NSString)version;
- (id)_stringForType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)installationState;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowUserToHide:(id)a3;
- (void)setAllowUserToLock:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCellularSliceUUIDString:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentFilterUUIDString:(id)a3;
- (void)setDNSProxyUUIDString:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDistributorIdentifier:(id)a3;
- (void)setDynamicUsage:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setFeedback:(id)a3;
- (void)setHasUpdateAvailable:(BOOL)a3;
- (void)setInstallationState:(unint64_t)a3;
- (void)setIsAdHocCodeSigned:(BOOL)a3;
- (void)setIsAppClip:(BOOL)a3;
- (void)setIsAppStoreVendable:(BOOL)a3;
- (void)setIsBetaApp:(BOOL)a3;
- (void)setIsBlocked:(BOOL)a3;
- (void)setIsDeviceBasedVPP:(BOOL)a3;
- (void)setIsLicenseExpired:(BOOL)a3;
- (void)setIsLicenseRevoked:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)setIsUPP:(BOOL)a3;
- (void)setIsUserBasedVPP:(BOOL)a3;
- (void)setIsValidated:(BOOL)a3;
- (void)setManagementInformation:(id)a3;
- (void)setOnDemandResourcesUsage:(id)a3;
- (void)setRelayUUIDString:(id)a3;
- (void)setRemovable:(id)a3;
- (void)setSharedUsage:(id)a3;
- (void)setShortVersion:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setStaticUsage:(id)a3;
- (void)setStoreItemIdentifier:(id)a3;
- (void)setTapToPayScreenLock:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setVPNUUIDString:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DMFApp

+ (id)stringForInstallationState:(unint64_t)a3
{
  if (a3 > 8) {
    return @"Unknown";
  }
  else {
    return off_1E63720F0[a3];
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DMFApp *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(DMFApp *)self bundleIdentifier];
      v6 = [(DMFApp *)v4 bundleIdentifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setType:", -[DMFApp type](self, "type"));
  v5 = [(DMFApp *)self displayName];
  [v4 setDisplayName:v5];

  v6 = [(DMFApp *)self bundleIdentifier];
  [v4 setBundleIdentifier:v6];

  char v7 = [(DMFApp *)self storeItemIdentifier];
  [v4 setStoreItemIdentifier:v7];

  v8 = [(DMFApp *)self externalVersionIdentifier];
  [v4 setExternalVersionIdentifier:v8];

  v9 = [(DMFApp *)self distributorIdentifier];
  [v4 setDistributorIdentifier:v9];

  v10 = [(DMFApp *)self version];
  [v4 setVersion:v10];

  v11 = [(DMFApp *)self shortVersion];
  [v4 setShortVersion:v11];

  v12 = [(DMFApp *)self staticUsage];
  [v4 setStaticUsage:v12];

  v13 = [(DMFApp *)self dynamicUsage];
  [v4 setDynamicUsage:v13];

  v14 = [(DMFApp *)self onDemandResourcesUsage];
  [v4 setOnDemandResourcesUsage:v14];

  v15 = [(DMFApp *)self sharedUsage];
  [v4 setSharedUsage:v15];

  objc_msgSend(v4, "setInstallationState:", -[DMFApp installationState](self, "installationState"));
  objc_msgSend(v4, "setIsPlaceholder:", -[DMFApp isPlaceholder](self, "isPlaceholder"));
  objc_msgSend(v4, "setIsRestricted:", -[DMFApp isRestricted](self, "isRestricted"));
  objc_msgSend(v4, "setIsBlocked:", -[DMFApp isBlocked](self, "isBlocked"));
  objc_msgSend(v4, "setIsUserBasedVPP:", -[DMFApp isUserBasedVPP](self, "isUserBasedVPP"));
  objc_msgSend(v4, "setIsDeviceBasedVPP:", -[DMFApp isDeviceBasedVPP](self, "isDeviceBasedVPP"));
  objc_msgSend(v4, "setIsLicenseExpired:", -[DMFApp isLicenseExpired](self, "isLicenseExpired"));
  objc_msgSend(v4, "setIsLicenseRevoked:", -[DMFApp isLicenseRevoked](self, "isLicenseRevoked"));
  objc_msgSend(v4, "setIsUPP:", -[DMFApp isUPP](self, "isUPP"));
  objc_msgSend(v4, "setIsValidated:", -[DMFApp isValidated](self, "isValidated"));
  objc_msgSend(v4, "setIsAppClip:", -[DMFApp isAppClip](self, "isAppClip"));
  objc_msgSend(v4, "setIsAppStoreVendable:", -[DMFApp isAppStoreVendable](self, "isAppStoreVendable"));
  objc_msgSend(v4, "setIsBetaApp:", -[DMFApp isBetaApp](self, "isBetaApp"));
  objc_msgSend(v4, "setIsAdHocCodeSigned:", -[DMFApp isAdHocCodeSigned](self, "isAdHocCodeSigned"));
  objc_msgSend(v4, "setHasUpdateAvailable:", -[DMFApp hasUpdateAvailable](self, "hasUpdateAvailable"));
  v16 = [(DMFApp *)self VPNUUIDString];
  [v4 setVPNUUIDString:v16];

  v17 = [(DMFApp *)self cellularSliceUUIDString];
  [v4 setCellularSliceUUIDString:v17];

  v18 = [(DMFApp *)self contentFilterUUIDString];
  [v4 setContentFilterUUIDString:v18];

  v19 = [(DMFApp *)self DNSProxyUUIDString];
  [v4 setDNSProxyUUIDString:v19];

  v20 = [(DMFApp *)self relayUUIDString];
  [v4 setRelayUUIDString:v20];

  v21 = [(DMFApp *)self associatedDomains];
  [v4 setAssociatedDomains:v21];

  v22 = [(DMFApp *)self associatedDomainsEnableDirectDownloads];
  [v4 setAssociatedDomainsEnableDirectDownloads:v22];

  v23 = [(DMFApp *)self removable];
  [v4 setRemovable:v23];

  v24 = [(DMFApp *)self tapToPayScreenLock];
  [v4 setTapToPayScreenLock:v24];

  v25 = [(DMFApp *)self allowUserToHide];
  [v4 setAllowUserToHide:v25];

  v26 = [(DMFApp *)self allowUserToLock];
  [v4 setAllowUserToLock:v26];

  v27 = [(DMFApp *)self configuration];
  [v4 setConfiguration:v27];

  v28 = [(DMFApp *)self feedback];
  [v4 setFeedback:v28];

  v29 = [(DMFApp *)self sourceIdentifier];
  [v4 setSourceIdentifier:v29];

  v30 = [(DMFApp *)self managementInformation];
  [v4 setManagementInformation:v30];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v125.receiver = self;
  v125.super_class = (Class)DMFApp;
  v5 = [(DMFApp *)&v125 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 integerValue];

    char v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v11;

    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"storeItemIdentifier"];
    storeItemIdentifier = v5->_storeItemIdentifier;
    v5->_storeItemIdentifier = (NSNumber *)v14;

    v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"externalVersionIdentifier"];
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v17;

    v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"distributorIdentifier"];
    distributorIdentifier = v5->_distributorIdentifier;
    v5->_distributorIdentifier = (NSString *)v20;

    v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v23;

    v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"shortVersion"];
    shortVersion = v5->_shortVersion;
    v5->_shortVersion = (NSString *)v26;

    v28 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"staticUsage"];
    staticUsage = v5->_staticUsage;
    v5->_staticUsage = (NSNumber *)v29;

    v31 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"dynamicUsage"];
    dynamicUsage = v5->_dynamicUsage;
    v5->_dynamicUsage = (NSNumber *)v32;

    v34 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"onDemandResourcesUsage"];
    onDemandResourcesUsage = v5->_onDemandResourcesUsage;
    v5->_onDemandResourcesUsage = (NSNumber *)v35;

    v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"sharedUsage"];
    sharedUsage = v5->_sharedUsage;
    v5->_sharedUsage = (NSNumber *)v38;

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationState"];
    v5->_installationState = [v40 integerValue];

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isPlaceholder"];
    v5->_isPlaceholder = [v41 BOOLValue];

    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRestricted"];
    v5->_isRestricted = [v42 BOOLValue];

    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBlocked"];
    v5->_isBlocked = [v43 BOOLValue];

    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isUserBasedVPP"];
    v5->_isUserBasedVPP = [v44 BOOLValue];

    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isDeviceBasedVPP"];
    v5->_isDeviceBasedVPP = [v45 BOOLValue];

    v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isLicenseExpired"];
    v5->_isLicenseExpired = [v46 BOOLValue];

    v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isLicenseRevoked"];
    v5->_isLicenseRevoked = [v47 BOOLValue];

    v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isUPP"];
    v5->_isUPP = [v48 BOOLValue];

    v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isValidated"];
    v5->_isValidated = [v49 BOOLValue];

    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAppClip"];
    v5->_isAppClip = [v50 BOOLValue];

    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAppStoreVendable"];
    v5->_isAppStoreVendable = [v51 BOOLValue];

    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBetaApp"];
    v5->_isBetaApp = [v52 BOOLValue];

    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAdHocCodeSigned"];
    v5->_isAdHocCodeSigned = [v53 BOOLValue];

    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasUpdateAvailable"];
    v5->_hasUpdateAvailable = [v54 BOOLValue];

    v55 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v56 = [v4 decodeObjectOfClasses:v55 forKey:@"VPNUUIDString"];
    VPNUUIDString = v5->_VPNUUIDString;
    v5->_VPNUUIDString = (NSString *)v56;

    v58 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v59 = [v4 decodeObjectOfClasses:v58 forKey:@"cellularSliceUUIDString"];
    cellularSliceUUIDString = v5->_cellularSliceUUIDString;
    v5->_cellularSliceUUIDString = (NSString *)v59;

    v61 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v62 = [v4 decodeObjectOfClasses:v61 forKey:@"contentFilterUUIDString"];
    contentFilterUUIDString = v5->_contentFilterUUIDString;
    v5->_contentFilterUUIDString = (NSString *)v62;

    v64 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v65 = [v4 decodeObjectOfClasses:v64 forKey:@"DNSProxyUUIDString"];
    DNSProxyUUIDString = v5->_DNSProxyUUIDString;
    v5->_DNSProxyUUIDString = (NSString *)v65;

    v67 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"relayUUIDString"];
    relayUUIDString = v5->_relayUUIDString;
    v5->_relayUUIDString = (NSString *)v68;

    v70 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v71 = objc_opt_class();
    v72 = objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
    uint64_t v73 = [v4 decodeObjectOfClasses:v72 forKey:@"associatedDomains"];
    associatedDomains = v5->_associatedDomains;
    v5->_associatedDomains = (NSArray *)v73;

    v75 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v76 = [v4 decodeObjectOfClasses:v75 forKey:@"associatedDomainsEnableDirectDownloads"];
    associatedDomainsEnableDirectDownloads = v5->_associatedDomainsEnableDirectDownloads;
    v5->_associatedDomainsEnableDirectDownloads = (NSNumber *)v76;

    v78 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v79 = [v4 decodeObjectOfClasses:v78 forKey:@"removable"];
    removable = v5->_removable;
    v5->_removable = (NSNumber *)v79;

    v81 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v82 = [v4 decodeObjectOfClasses:v81 forKey:@"tapToPayScreenLock"];
    tapToPayScreenLock = v5->_tapToPayScreenLock;
    v5->_tapToPayScreenLock = (NSNumber *)v82;

    v84 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v85 = [v4 decodeObjectOfClasses:v84 forKey:@"allowUserToHide"];
    allowUserToHide = v5->_allowUserToHide;
    v5->_allowUserToHide = (NSNumber *)v85;

    v87 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v88 = [v4 decodeObjectOfClasses:v87 forKey:@"allowUserToLock"];
    allowUserToLock = v5->_allowUserToLock;
    v5->_allowUserToLock = (NSNumber *)v88;

    v123 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v121 = objc_opt_class();
    uint64_t v119 = objc_opt_class();
    uint64_t v90 = objc_opt_class();
    uint64_t v91 = objc_opt_class();
    uint64_t v92 = objc_opt_class();
    uint64_t v93 = objc_opt_class();
    uint64_t v94 = objc_opt_class();
    uint64_t v95 = objc_opt_class();
    uint64_t v96 = objc_opt_class();
    uint64_t v97 = objc_opt_class();
    v98 = objc_msgSend(v123, "setWithObjects:", v121, v119, v90, v91, v92, v93, v94, v95, v96, v97, objc_opt_class(), 0);
    uint64_t v99 = [v4 decodeObjectOfClasses:v98 forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v99;

    v124 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v122 = objc_opt_class();
    uint64_t v120 = objc_opt_class();
    uint64_t v101 = objc_opt_class();
    uint64_t v102 = objc_opt_class();
    uint64_t v103 = objc_opt_class();
    uint64_t v104 = objc_opt_class();
    uint64_t v105 = objc_opt_class();
    uint64_t v106 = objc_opt_class();
    uint64_t v107 = objc_opt_class();
    uint64_t v108 = objc_opt_class();
    v109 = objc_msgSend(v124, "setWithObjects:", v122, v120, v101, v102, v103, v104, v105, v106, v107, v108, objc_opt_class(), 0);
    uint64_t v110 = [v4 decodeObjectOfClasses:v109 forKey:@"feedback"];
    feedback = v5->_feedback;
    v5->_feedback = (NSDictionary *)v110;

    v112 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v113 = [v4 decodeObjectOfClasses:v112 forKey:@"sourceIdentifier"];
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSString *)v113;

    v115 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v116 = [v4 decodeObjectOfClasses:v115 forKey:@"managementInformation"];
    managementInformation = v5->_managementInformation;
    v5->_managementInformation = (DMFAppManagementInformation *)v116;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[DMFApp type](self, "type"));
  [v5 encodeObject:v6 forKey:@"type"];

  char v7 = [(DMFApp *)self displayName];
  [v5 encodeObject:v7 forKey:@"displayName"];

  uint64_t v8 = [(DMFApp *)self bundleIdentifier];
  [v5 encodeObject:v8 forKey:@"bundleIdentifier"];

  v9 = [(DMFApp *)self storeItemIdentifier];
  [v5 encodeObject:v9 forKey:@"storeItemIdentifier"];

  v10 = [(DMFApp *)self externalVersionIdentifier];
  [v5 encodeObject:v10 forKey:@"externalVersionIdentifier"];

  uint64_t v11 = [(DMFApp *)self distributorIdentifier];
  [v5 encodeObject:v11 forKey:@"distributorIdentifier"];

  v12 = [(DMFApp *)self version];
  [v5 encodeObject:v12 forKey:@"version"];

  v13 = [(DMFApp *)self shortVersion];
  [v5 encodeObject:v13 forKey:@"shortVersion"];

  uint64_t v14 = [(DMFApp *)self staticUsage];
  [v5 encodeObject:v14 forKey:@"staticUsage"];

  v15 = [(DMFApp *)self dynamicUsage];
  [v5 encodeObject:v15 forKey:@"dynamicUsage"];

  v16 = [(DMFApp *)self onDemandResourcesUsage];
  [v5 encodeObject:v16 forKey:@"onDemandResourcesUsage"];

  uint64_t v17 = [(DMFApp *)self sharedUsage];
  [v5 encodeObject:v17 forKey:@"sharedUsage"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFApp installationState](self, "installationState"));
  [v5 encodeObject:v18 forKey:@"installationState"];

  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isPlaceholder](self, "isPlaceholder"));
  [v5 encodeObject:v19 forKey:@"isPlaceholder"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isRestricted](self, "isRestricted"));
  [v5 encodeObject:v20 forKey:@"isRestricted"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isBlocked](self, "isBlocked"));
  [v5 encodeObject:v21 forKey:@"isBlocked"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isUserBasedVPP](self, "isUserBasedVPP"));
  [v5 encodeObject:v22 forKey:@"isUserBasedVPP"];

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isDeviceBasedVPP](self, "isDeviceBasedVPP"));
  [v5 encodeObject:v23 forKey:@"isDeviceBasedVPP"];

  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isLicenseExpired](self, "isLicenseExpired"));
  [v5 encodeObject:v24 forKey:@"isLicenseExpired"];

  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isLicenseRevoked](self, "isLicenseRevoked"));
  [v5 encodeObject:v25 forKey:@"isLicenseRevoked"];

  uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isUPP](self, "isUPP"));
  [v5 encodeObject:v26 forKey:@"isUPP"];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isValidated](self, "isValidated"));
  [v5 encodeObject:v27 forKey:@"isValidated"];

  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isAppClip](self, "isAppClip"));
  [v5 encodeObject:v28 forKey:@"isAppClip"];

  uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isAppStoreVendable](self, "isAppStoreVendable"));
  [v5 encodeObject:v29 forKey:@"isAppStoreVendable"];

  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isBetaApp](self, "isBetaApp"));
  [v5 encodeObject:v30 forKey:@"isBetaApp"];

  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp isAdHocCodeSigned](self, "isAdHocCodeSigned"));
  [v5 encodeObject:v31 forKey:@"isAdHocCodeSigned"];

  uint64_t v32 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFApp hasUpdateAvailable](self, "hasUpdateAvailable"));
  [v5 encodeObject:v32 forKey:@"hasUpdateAvailable"];

  v33 = [(DMFApp *)self VPNUUIDString];
  [v5 encodeObject:v33 forKey:@"VPNUUIDString"];

  v34 = [(DMFApp *)self cellularSliceUUIDString];
  [v5 encodeObject:v34 forKey:@"cellularSliceUUIDString"];

  uint64_t v35 = [(DMFApp *)self contentFilterUUIDString];
  [v5 encodeObject:v35 forKey:@"contentFilterUUIDString"];

  v36 = [(DMFApp *)self DNSProxyUUIDString];
  [v5 encodeObject:v36 forKey:@"DNSProxyUUIDString"];

  v37 = [(DMFApp *)self relayUUIDString];
  [v5 encodeObject:v37 forKey:@"relayUUIDString"];

  uint64_t v38 = [(DMFApp *)self associatedDomains];
  [v5 encodeObject:v38 forKey:@"associatedDomains"];

  v39 = [(DMFApp *)self associatedDomainsEnableDirectDownloads];
  [v5 encodeObject:v39 forKey:@"associatedDomainsEnableDirectDownloads"];

  v40 = [(DMFApp *)self removable];
  [v5 encodeObject:v40 forKey:@"removable"];

  v41 = [(DMFApp *)self tapToPayScreenLock];
  [v5 encodeObject:v41 forKey:@"tapToPayScreenLock"];

  v42 = [(DMFApp *)self allowUserToHide];
  [v5 encodeObject:v42 forKey:@"allowUserToHide"];

  v43 = [(DMFApp *)self allowUserToLock];
  [v5 encodeObject:v43 forKey:@"allowUserToLock"];

  v44 = [(DMFApp *)self configuration];
  [v5 encodeObject:v44 forKey:@"configuration"];

  v45 = [(DMFApp *)self feedback];
  [v5 encodeObject:v45 forKey:@"feedback"];

  v46 = [(DMFApp *)self sourceIdentifier];
  [v5 encodeObject:v46 forKey:@"sourceIdentifier"];

  id v47 = [(DMFApp *)self managementInformation];
  [v5 encodeObject:v47 forKey:@"managementInformation"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  id v4 = [(DMFApp *)self _stringForType:[(DMFApp *)self type]];
  [v3 appendFormat:@"Type                           : %@\n", v4];

  id v5 = [(DMFApp *)self displayName];
  [v3 appendFormat:@"Display Name                   : %@\n", v5];

  v6 = [(DMFApp *)self bundleIdentifier];
  [v3 appendFormat:@"Bundle Identifier              : %@\n", v6];

  char v7 = [(DMFApp *)self storeItemIdentifier];
  [v3 appendFormat:@"Store Item Identifier          : %@\n", v7];

  uint64_t v8 = [(DMFApp *)self externalVersionIdentifier];
  [v3 appendFormat:@"External Version Identifier    : %@\n", v8];

  v9 = [(DMFApp *)self distributorIdentifier];
  [v3 appendFormat:@"Distributor Identifier         : %@\n", v9];

  v10 = [(DMFApp *)self version];
  [v3 appendFormat:@"Version                        : %@\n", v10];

  uint64_t v11 = [(DMFApp *)self shortVersion];
  [v3 appendFormat:@"Short Version                  : %@\n", v11];

  v12 = [(DMFApp *)self staticUsage];
  [v3 appendFormat:@"Static Usage                   : %@\n", v12];

  v13 = [(DMFApp *)self dynamicUsage];
  [v3 appendFormat:@"Dynamic Usage                  : %@\n", v13];

  uint64_t v14 = [(DMFApp *)self onDemandResourcesUsage];
  [v3 appendFormat:@"On Demand Resources Usage      : %@\n", v14];

  v15 = [(DMFApp *)self sharedUsage];
  [v3 appendFormat:@"Shared Usage                   : %@\n", v15];

  v16 = +[DMFApp stringForInstallationState:[(DMFApp *)self installationState]];
  [v3 appendFormat:@"Installation State             : %@\n", v16];

  if ([(DMFApp *)self isPlaceholder]) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  [v3 appendFormat:@"Is Placeholder                 : %@\n", v17];
  if ([(DMFApp *)self isRestricted]) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  [v3 appendFormat:@"Is Restricted                  : %@\n", v18];
  if ([(DMFApp *)self isBlocked]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  [v3 appendFormat:@"Is Blocked                     : %@\n", v19];
  if ([(DMFApp *)self isUserBasedVPP]) {
    uint64_t v20 = @"YES";
  }
  else {
    uint64_t v20 = @"NO";
  }
  [v3 appendFormat:@"Is User Based VPP              : %@\n", v20];
  if ([(DMFApp *)self isDeviceBasedVPP]) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  [v3 appendFormat:@"Is Device Based VPP            : %@\n", v21];
  if ([(DMFApp *)self isLicenseExpired]) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  [v3 appendFormat:@"Is License Expired             : %@\n", v22];
  if ([(DMFApp *)self isLicenseRevoked]) {
    uint64_t v23 = @"YES";
  }
  else {
    uint64_t v23 = @"NO";
  }
  [v3 appendFormat:@"Is License Revoked             : %@\n", v23];
  if ([(DMFApp *)self isUPP]) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  [v3 appendFormat:@"Is UPP                         : %@\n", v24];
  if ([(DMFApp *)self isValidated]) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  [v3 appendFormat:@"Is Validated                   : %@\n", v25];
  if ([(DMFApp *)self isAppClip]) {
    uint64_t v26 = @"YES";
  }
  else {
    uint64_t v26 = @"NO";
  }
  [v3 appendFormat:@"Is App Clip                    : %@\n", v26];
  if ([(DMFApp *)self isAppStoreVendable]) {
    v27 = @"YES";
  }
  else {
    v27 = @"NO";
  }
  [v3 appendFormat:@"Is App Store Vendable          : %@\n", v27];
  if ([(DMFApp *)self isBetaApp]) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  [v3 appendFormat:@"Is Beta App                    : %@\n", v28];
  if ([(DMFApp *)self isAdHocCodeSigned]) {
    uint64_t v29 = @"YES";
  }
  else {
    uint64_t v29 = @"NO";
  }
  [v3 appendFormat:@"Is Ad Hoc Code Signed          : %@\n", v29];
  if ([(DMFApp *)self hasUpdateAvailable]) {
    v30 = @"YES";
  }
  else {
    v30 = @"NO";
  }
  [v3 appendFormat:@"Has Update Available           : %@\n", v30];
  v31 = [(DMFApp *)self VPNUUIDString];
  [v3 appendFormat:@"VPN UUID String                : %@\n", v31];

  uint64_t v32 = [(DMFApp *)self cellularSliceUUIDString];
  [v3 appendFormat:@"CellularSlice UUID String      : %@\n", v32];

  v33 = [(DMFApp *)self contentFilterUUIDString];
  [v3 appendFormat:@"ContentFilter UUID String      : %@\n", v33];

  v34 = [(DMFApp *)self DNSProxyUUIDString];
  [v3 appendFormat:@"DNS Proxy UUID String          : %@\n", v34];

  uint64_t v35 = [(DMFApp *)self relayUUIDString];
  [v3 appendFormat:@"Relay UUID String              : %@\n", v35];

  v36 = [(DMFApp *)self associatedDomains];
  [v3 appendFormat:@"Associated Domains             : %@\n", v36];

  v37 = [(DMFApp *)self associatedDomainsEnableDirectDownloads];
  if ([v37 BOOLValue]) {
    uint64_t v38 = @"YES";
  }
  else {
    uint64_t v38 = @"NO";
  }
  [v3 appendFormat:@"AD Enabled Direct Downloads    : %@\n", v38];

  v39 = [(DMFApp *)self removable];
  if (v39)
  {
    v40 = [(DMFApp *)self removable];
    if ([v40 BOOLValue]) {
      v41 = @"YES";
    }
    else {
      v41 = @"NO";
    }
    [v3 appendFormat:@"Is Removable                   : %@\n", v41];
  }
  else
  {
    [v3 appendFormat:@"Is Removable                   : %@\n", @"YES"];
  }

  v42 = [(DMFApp *)self tapToPayScreenLock];
  if (v42)
  {
    v43 = [(DMFApp *)self tapToPayScreenLock];
    if ([v43 BOOLValue]) {
      v44 = @"YES";
    }
    else {
      v44 = @"NO";
    }
    [v3 appendFormat:@"Is Tap To Pay Screen Lock      : %@\n", v44];
  }
  else
  {
    [v3 appendFormat:@"Is Tap To Pay Screen Lock      : %@\n", @"NO"];
  }

  v45 = objc_opt_class();
  v46 = [(DMFApp *)self allowUserToHide];
  id v47 = [v45 descriptionForBool:v46 showWhenUnassigned:1 valueWhenUnassigned:1];
  [v3 appendFormat:@"Allow User To Hide             : %@\n", v47];

  v48 = objc_opt_class();
  v49 = [(DMFApp *)self allowUserToLock];
  v50 = [v48 descriptionForBool:v49 showWhenUnassigned:1 valueWhenUnassigned:1];
  [v3 appendFormat:@"Allow User To Lock             : %@\n", v50];

  v51 = [(DMFApp *)self configuration];
  [v3 appendFormat:@"Configuration                  : %@\n", v51];

  v52 = [(DMFApp *)self feedback];
  [v3 appendFormat:@"Feedback                       : %@\n", v52];

  v53 = [(DMFApp *)self sourceIdentifier];
  [v3 appendFormat:@"sourceIdentifier               : %@\n", v53];

  v54 = [(DMFApp *)self managementInformation];
  [v3 appendFormat:@"Management Information         : %@\n", v54];

  [v3 appendString:@"}>"];
  v55 = (void *)[v3 copy];

  return v55;
}

+ (id)descriptionForBool:(id)a3 showWhenUnassigned:(BOOL)a4 valueWhenUnassigned:(BOOL)a5
{
  int v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    int v5 = [v7 BOOLValue];
  }
  else if (v6)
  {
    v9 = @"Unassigned (NO)";
    v10 = @"Unassigned (YES)";
    goto LABEL_6;
  }
  v9 = @"NO";
  v10 = @"YES";
LABEL_6:
  if (v5) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  v12 = v11;

  return v12;
}

- (id)_stringForType:(unint64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"User";
  }
  if (a3 == 1) {
    return @"System";
  }
  else {
    return v3;
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (NSString)distributorIdentifier
{
  return self->_distributorIdentifier;
}

- (void)setDistributorIdentifier:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
}

- (NSNumber)staticUsage
{
  return self->_staticUsage;
}

- (void)setStaticUsage:(id)a3
{
}

- (NSNumber)dynamicUsage
{
  return self->_dynamicUsage;
}

- (void)setDynamicUsage:(id)a3
{
}

- (NSNumber)onDemandResourcesUsage
{
  return self->_onDemandResourcesUsage;
}

- (void)setOnDemandResourcesUsage:(id)a3
{
}

- (NSNumber)sharedUsage
{
  return self->_sharedUsage;
}

- (void)setSharedUsage:(id)a3
{
}

- (unint64_t)installationState
{
  return self->_installationState;
}

- (void)setInstallationState:(unint64_t)a3
{
  self->_installationState = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (BOOL)isUserBasedVPP
{
  return self->_isUserBasedVPP;
}

- (void)setIsUserBasedVPP:(BOOL)a3
{
  self->_isUserBasedVPP = a3;
}

- (BOOL)isDeviceBasedVPP
{
  return self->_isDeviceBasedVPP;
}

- (void)setIsDeviceBasedVPP:(BOOL)a3
{
  self->_isDeviceBasedVPP = a3;
}

- (BOOL)isLicenseExpired
{
  return self->_isLicenseExpired;
}

- (void)setIsLicenseExpired:(BOOL)a3
{
  self->_isLicenseExpired = a3;
}

- (BOOL)isLicenseRevoked
{
  return self->_isLicenseRevoked;
}

- (void)setIsLicenseRevoked:(BOOL)a3
{
  self->_isLicenseRevoked = a3;
}

- (BOOL)isUPP
{
  return self->_isUPP;
}

- (void)setIsUPP:(BOOL)a3
{
  self->_isUPP = a3;
}

- (BOOL)isValidated
{
  return self->_isValidated;
}

- (void)setIsValidated:(BOOL)a3
{
  self->_isValidated = a3;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (BOOL)isAppStoreVendable
{
  return self->_isAppStoreVendable;
}

- (void)setIsAppStoreVendable:(BOOL)a3
{
  self->_isAppStoreVendable = a3;
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (void)setIsBetaApp:(BOOL)a3
{
  self->_isBetaApp = a3;
}

- (BOOL)isAdHocCodeSigned
{
  return self->_isAdHocCodeSigned;
}

- (void)setIsAdHocCodeSigned:(BOOL)a3
{
  self->_isAdHocCodeSigned = a3;
}

- (BOOL)hasUpdateAvailable
{
  return self->_hasUpdateAvailable;
}

- (void)setHasUpdateAvailable:(BOOL)a3
{
  self->_hasUpdateAvailable = a3;
}

- (NSString)VPNUUIDString
{
  return self->_VPNUUIDString;
}

- (void)setVPNUUIDString:(id)a3
{
}

- (NSString)cellularSliceUUIDString
{
  return self->_cellularSliceUUIDString;
}

- (void)setCellularSliceUUIDString:(id)a3
{
}

- (NSString)contentFilterUUIDString
{
  return self->_contentFilterUUIDString;
}

- (void)setContentFilterUUIDString:(id)a3
{
}

- (NSString)DNSProxyUUIDString
{
  return self->_DNSProxyUUIDString;
}

- (void)setDNSProxyUUIDString:(id)a3
{
}

- (NSString)relayUUIDString
{
  return self->_relayUUIDString;
}

- (void)setRelayUUIDString:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (NSNumber)associatedDomainsEnableDirectDownloads
{
  return self->_associatedDomainsEnableDirectDownloads;
}

- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3
{
}

- (NSNumber)removable
{
  return self->_removable;
}

- (void)setRemovable:(id)a3
{
}

- (NSNumber)tapToPayScreenLock
{
  return self->_tapToPayScreenLock;
}

- (void)setTapToPayScreenLock:(id)a3
{
}

- (NSNumber)allowUserToHide
{
  return self->_allowUserToHide;
}

- (void)setAllowUserToHide:(id)a3
{
}

- (NSNumber)allowUserToLock
{
  return self->_allowUserToLock;
}

- (void)setAllowUserToLock:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSDictionary)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (DMFAppManagementInformation)managementInformation
{
  return self->_managementInformation;
}

- (void)setManagementInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementInformation, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_allowUserToLock, 0);
  objc_storeStrong((id *)&self->_allowUserToHide, 0);
  objc_storeStrong((id *)&self->_tapToPayScreenLock, 0);
  objc_storeStrong((id *)&self->_removable, 0);
  objc_storeStrong((id *)&self->_associatedDomainsEnableDirectDownloads, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_relayUUIDString, 0);
  objc_storeStrong((id *)&self->_DNSProxyUUIDString, 0);
  objc_storeStrong((id *)&self->_contentFilterUUIDString, 0);
  objc_storeStrong((id *)&self->_cellularSliceUUIDString, 0);
  objc_storeStrong((id *)&self->_VPNUUIDString, 0);
  objc_storeStrong((id *)&self->_sharedUsage, 0);
  objc_storeStrong((id *)&self->_onDemandResourcesUsage, 0);
  objc_storeStrong((id *)&self->_dynamicUsage, 0);
  objc_storeStrong((id *)&self->_staticUsage, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_distributorIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end