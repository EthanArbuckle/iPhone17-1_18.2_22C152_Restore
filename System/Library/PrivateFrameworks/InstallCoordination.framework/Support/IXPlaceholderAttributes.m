@interface IXPlaceholderAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)arcadeApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)launchProhibited;
- (BOOL)lsRequiresPostProcessing;
- (BOOL)runsIndependentlyOfCompanionApp;
- (BOOL)watchOnlyApp;
- (IXPlaceholderAttributes)init;
- (IXPlaceholderAttributes)initWithCoder:(id)a3;
- (IXPlaceholderAttributes)initWithInfoPlistDictionary:(id)a3;
- (IXPlaceholderAttributes)initWithInfoPlistFromBundle:(__CFBundle *)a3 error:(id *)a4;
- (IXPlaceholderAttributes)initWithInfoPlistFromBundleURL:(id)a3 error:(id *)a4;
- (NSArray)lsCounterpartIdentifiers;
- (NSArray)sbAppTags;
- (NSArray)uiDeviceFamily;
- (NSDictionary)exAppExtensionAttributes;
- (NSDictionary)extensionDictionary;
- (NSDictionary)requiredDeviceCapabilities;
- (NSDictionary)webKitPushBundleMetadata;
- (NSString)bundleVersion;
- (NSString)companionBundleIdentifierForWatchApp;
- (NSString)minimumOSVersion;
- (NSString)sbIconMasqueradeIdentifier;
- (id)_plistKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)infoPlistContent;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArcadeApp:(BOOL)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCompanionBundleIdentifierForWatchApp:(id)a3;
- (void)setExAppExtensionAttributes:(id)a3;
- (void)setExtensionDictionary:(id)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setLsCounterpartIdentifiers:(id)a3;
- (void)setLsRequiresPostProcessing:(BOOL)a3;
- (void)setMinimumOSVersion:(id)a3;
- (void)setRequiredDeviceCapabilities:(id)a3;
- (void)setRequiredDeviceCapabilitiesWithArray:(id)a3;
- (void)setRunsIndependentlyOfCompanionApp:(BOOL)a3;
- (void)setSbAppTags:(id)a3;
- (void)setSbIconMasqueradeIdentifier:(id)a3;
- (void)setUiDeviceFamily:(id)a3;
- (void)setWatchOnlyApp:(BOOL)a3;
- (void)setWebKitPushBundleMetadata:(id)a3;
@end

@implementation IXPlaceholderAttributes

- (IXPlaceholderAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)IXPlaceholderAttributes;
  return [(IXPlaceholderAttributes *)&v3 init];
}

- (IXPlaceholderAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)IXPlaceholderAttributes;
  v5 = [(IXPlaceholderAttributes *)&v35 init];
  if (v5)
  {
    v5->_launchProhibited = [v4 decodeBoolForKey:@"launchProhibited"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodePropertyListForKey:@"extensionDictionary"];
    extensionDictionary = v5->_extensionDictionary;
    v5->_extensionDictionary = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodePropertyListForKey:@"exAppExtensionAttributes"];
    exAppExtensionAttributes = v5->_exAppExtensionAttributes;
    v5->_exAppExtensionAttributes = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumOSVersion"];
    minimumOSVersion = v5->_minimumOSVersion;
    v5->_minimumOSVersion = (NSString *)v12;

    uint64_t v14 = [v4 decodePropertyListForKey:@"requiredDeviceCapabilities"];
    requiredDeviceCapabilities = v5->_requiredDeviceCapabilities;
    v5->_requiredDeviceCapabilities = (NSDictionary *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"sbAppTags"];
    sbAppTags = v5->_sbAppTags;
    v5->_sbAppTags = (NSArray *)v18;

    uint64_t v20 = objc_opt_class();
    v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"lsCounterpartIdentifiers"];
    lsCounterpartIdentifiers = v5->_lsCounterpartIdentifiers;
    v5->_lsCounterpartIdentifiers = (NSArray *)v22;

    v5->_lsRequiresPostProcessing = [v4 decodeBoolForKey:@"lsRequiresPostProcessing"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sbIconMasqueradeIdentifier"];
    sbIconMasqueradeIdentifier = v5->_sbIconMasqueradeIdentifier;
    v5->_sbIconMasqueradeIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionBundleIdentifierForWatchApp"];
    companionBundleIdentifierForWatchApp = v5->_companionBundleIdentifierForWatchApp;
    v5->_companionBundleIdentifierForWatchApp = (NSString *)v26;

    v5->_watchOnlyApp = [v4 decodeBoolForKey:@"watchOnlyApp"];
    v5->_runsIndependentlyOfCompanionApp = [v4 decodeBoolForKey:@"runsIndependentlyOfCompanionApp"];
    v5->_arcadeApp = [v4 decodeBoolForKey:@"arcadeApp"];
    uint64_t v28 = [v4 decodePropertyListForKey:@"webKitPushBundleMetadata"];
    webKitPushBundleMetadata = v5->_webKitPushBundleMetadata;
    v5->_webKitPushBundleMetadata = (NSDictionary *)v28;

    uint64_t v30 = objc_opt_class();
    v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"uiDeviceFamily"];
    uiDeviceFamily = v5->_uiDeviceFamily;
    v5->_uiDeviceFamily = (NSArray *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited"), @"launchProhibited");
  v5 = [(IXPlaceholderAttributes *)self bundleVersion];
  [v4 encodeObject:v5 forKey:@"bundleVersion"];

  uint64_t v6 = [(IXPlaceholderAttributes *)self extensionDictionary];
  [v4 encodeObject:v6 forKey:@"extensionDictionary"];

  v7 = [(IXPlaceholderAttributes *)self exAppExtensionAttributes];
  [v4 encodeObject:v7 forKey:@"exAppExtensionAttributes"];

  uint64_t v8 = [(IXPlaceholderAttributes *)self minimumOSVersion];
  [v4 encodeObject:v8 forKey:@"minimumOSVersion"];

  v9 = [(IXPlaceholderAttributes *)self requiredDeviceCapabilities];
  [v4 encodeObject:v9 forKey:@"requiredDeviceCapabilities"];

  uint64_t v10 = [(IXPlaceholderAttributes *)self sbAppTags];
  [v4 encodeObject:v10 forKey:@"sbAppTags"];

  v11 = [(IXPlaceholderAttributes *)self lsCounterpartIdentifiers];
  [v4 encodeObject:v11 forKey:@"lsCounterpartIdentifiers"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing"), @"lsRequiresPostProcessing");
  uint64_t v12 = [(IXPlaceholderAttributes *)self sbIconMasqueradeIdentifier];
  [v4 encodeObject:v12 forKey:@"sbIconMasqueradeIdentifier"];

  v13 = [(IXPlaceholderAttributes *)self companionBundleIdentifierForWatchApp];
  [v4 encodeObject:v13 forKey:@"companionBundleIdentifierForWatchApp"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp"), @"watchOnlyApp");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp"), @"runsIndependentlyOfCompanionApp");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp"), @"arcadeApp");
  uint64_t v14 = [(IXPlaceholderAttributes *)self webKitPushBundleMetadata];
  [v4 encodeObject:v14 forKey:@"webKitPushBundleMetadata"];

  id v15 = [(IXPlaceholderAttributes *)self uiDeviceFamily];
  [v4 encodeObject:v15 forKey:@"uiDeviceFamily"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [(IXPlaceholderAttributes *)self launchProhibited];
    if (v6 != [v5 launchProhibited])
    {
LABEL_3:
      BOOL v7 = 0;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v8 = [(IXPlaceholderAttributes *)self bundleVersion];
    v9 = [v5 bundleVersion];
    id v10 = v8;
    id v11 = v9;
    uint64_t v12 = v11;
    if ((v10 != 0) != (v11 != 0) || v10 && v11 && ![v10 isEqual:v11]) {
      goto LABEL_18;
    }

    v13 = [(IXPlaceholderAttributes *)self extensionDictionary];
    uint64_t v14 = [v5 extensionDictionary];
    id v10 = v13;
    id v15 = v14;
    uint64_t v12 = v15;
    if ((v10 != 0) != (v15 != 0) || v10 && v15 && ![v10 isEqual:v15]) {
      goto LABEL_18;
    }

    uint64_t v16 = [(IXPlaceholderAttributes *)self exAppExtensionAttributes];
    v17 = [v5 exAppExtensionAttributes];
    id v10 = v16;
    id v18 = v17;
    uint64_t v12 = v18;
    if ((v10 != 0) != (v18 != 0) || v10 && v18 && ![v10 isEqual:v18]) {
      goto LABEL_18;
    }

    v19 = [(IXPlaceholderAttributes *)self minimumOSVersion];
    uint64_t v20 = [v5 minimumOSVersion];
    id v10 = v19;
    id v21 = v20;
    uint64_t v12 = v21;
    if ((v10 != 0) != (v21 != 0) || v10 && v21 && ![v10 isEqual:v21])
    {
LABEL_18:

      BOOL v7 = 0;
    }
    else
    {

      v23 = [(IXPlaceholderAttributes *)self requiredDeviceCapabilities];
      uint64_t v24 = [v5 requiredDeviceCapabilities];
      BOOL v25 = sub_100008DF0(v23, v24);

      if (!v25) {
        goto LABEL_3;
      }
      uint64_t v26 = [(IXPlaceholderAttributes *)self sbAppTags];
      v27 = [v5 sbAppTags];
      BOOL v28 = sub_100008DF0(v26, v27);

      if (!v28) {
        goto LABEL_3;
      }
      v29 = [(IXPlaceholderAttributes *)self lsCounterpartIdentifiers];
      uint64_t v30 = [v5 lsCounterpartIdentifiers];
      BOOL v31 = sub_100008DF0(v29, v30);

      if (!v31) {
        goto LABEL_3;
      }
      unsigned int v32 = [(IXPlaceholderAttributes *)self lsRequiresPostProcessing];
      if (v32 != [v5 lsRequiresPostProcessing]) {
        goto LABEL_3;
      }
      v33 = [(IXPlaceholderAttributes *)self sbIconMasqueradeIdentifier];
      v34 = [v5 sbIconMasqueradeIdentifier];
      BOOL v35 = sub_100008DF0(v33, v34);

      if (!v35) {
        goto LABEL_3;
      }
      v36 = [(IXPlaceholderAttributes *)self companionBundleIdentifierForWatchApp];
      v37 = [v5 companionBundleIdentifierForWatchApp];
      BOOL v38 = sub_100008DF0(v36, v37);

      if (!v38) {
        goto LABEL_3;
      }
      unsigned int v39 = [(IXPlaceholderAttributes *)self watchOnlyApp];
      if (v39 != [v5 watchOnlyApp]) {
        goto LABEL_3;
      }
      unsigned int v40 = [(IXPlaceholderAttributes *)self runsIndependentlyOfCompanionApp];
      if (v40 != [v5 runsIndependentlyOfCompanionApp]) {
        goto LABEL_3;
      }
      unsigned int v41 = [(IXPlaceholderAttributes *)self arcadeApp];
      if (v41 != [v5 arcadeApp]) {
        goto LABEL_3;
      }
      v42 = [(IXPlaceholderAttributes *)self webKitPushBundleMetadata];
      v43 = [v5 webKitPushBundleMetadata];
      BOOL v44 = sub_100008DF0(v42, v43);

      if (!v44) {
        goto LABEL_3;
      }
      id v10 = [(IXPlaceholderAttributes *)self uiDeviceFamily];
      uint64_t v12 = [v5 uiDeviceFamily];
      BOOL v7 = sub_100008DF0(v10, v12);
    }

    goto LABEL_20;
  }
  BOOL v7 = 0;
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(IXPlaceholderAttributes *)self launchProhibited];
  id v4 = [(IXPlaceholderAttributes *)self bundleVersion];
  unint64_t v5 = (unint64_t)[v4 hash];

  unsigned int v6 = [(IXPlaceholderAttributes *)self extensionDictionary];
  unint64_t v7 = v5 | (unint64_t)[v6 hash] | v3;

  uint64_t v8 = [(IXPlaceholderAttributes *)self exAppExtensionAttributes];
  unint64_t v9 = (unint64_t)[v8 hash];

  id v10 = [(IXPlaceholderAttributes *)self minimumOSVersion];
  unint64_t v11 = v9 | (unint64_t)[v10 hash];

  uint64_t v12 = [(IXPlaceholderAttributes *)self requiredDeviceCapabilities];
  unint64_t v13 = v7 | v11 | (unint64_t)[v12 hash];

  uint64_t v14 = [(IXPlaceholderAttributes *)self sbAppTags];
  unint64_t v15 = (unint64_t)[v14 hash];

  uint64_t v16 = [(IXPlaceholderAttributes *)self lsCounterpartIdentifiers];
  unint64_t v17 = v15 | (unint64_t)[v16 hash];

  unint64_t v18 = v17 | [(IXPlaceholderAttributes *)self lsRequiresPostProcessing];
  v19 = [(IXPlaceholderAttributes *)self sbIconMasqueradeIdentifier];
  unint64_t v20 = v13 | v18 | (unint64_t)[v19 hash];

  id v21 = [(IXPlaceholderAttributes *)self companionBundleIdentifierForWatchApp];
  unint64_t v22 = (unint64_t)[v21 hash];

  unint64_t v23 = v22 | [(IXPlaceholderAttributes *)self watchOnlyApp];
  unint64_t v24 = v23 | [(IXPlaceholderAttributes *)self runsIndependentlyOfCompanionApp];
  unint64_t v25 = v20 | v24 | [(IXPlaceholderAttributes *)self arcadeApp];
  uint64_t v26 = [(IXPlaceholderAttributes *)self webKitPushBundleMetadata];
  unint64_t v27 = (unint64_t)[v26 hash];

  BOOL v28 = [(IXPlaceholderAttributes *)self uiDeviceFamily];
  unint64_t v29 = v25 | v27 | (unint64_t)[v28 hash];

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLaunchProhibited:", -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited"));
  unint64_t v5 = [(IXPlaceholderAttributes *)self bundleVersion];
  [v4 setBundleVersion:v5];

  unsigned int v6 = [(IXPlaceholderAttributes *)self extensionDictionary];
  [v4 setExtensionDictionary:v6];

  unint64_t v7 = [(IXPlaceholderAttributes *)self exAppExtensionAttributes];
  [v4 setExAppExtensionAttributes:v7];

  uint64_t v8 = [(IXPlaceholderAttributes *)self minimumOSVersion];
  [v4 setMinimumOSVersion:v8];

  unint64_t v9 = [(IXPlaceholderAttributes *)self requiredDeviceCapabilities];
  [v4 setRequiredDeviceCapabilities:v9];

  id v10 = [(IXPlaceholderAttributes *)self sbAppTags];
  [v4 setSbAppTags:v10];

  unint64_t v11 = [(IXPlaceholderAttributes *)self lsCounterpartIdentifiers];
  [v4 setLsCounterpartIdentifiers:v11];

  objc_msgSend(v4, "setLsRequiresPostProcessing:", -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing"));
  uint64_t v12 = [(IXPlaceholderAttributes *)self sbIconMasqueradeIdentifier];
  [v4 setSbIconMasqueradeIdentifier:v12];

  unint64_t v13 = [(IXPlaceholderAttributes *)self companionBundleIdentifierForWatchApp];
  [v4 setCompanionBundleIdentifierForWatchApp:v13];

  objc_msgSend(v4, "setWatchOnlyApp:", -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp"));
  objc_msgSend(v4, "setRunsIndependentlyOfCompanionApp:", -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp"));
  objc_msgSend(v4, "setArcadeApp:", -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp"));
  uint64_t v14 = [(IXPlaceholderAttributes *)self uiDeviceFamily];
  [v4 setUiDeviceFamily:v14];

  return v4;
}

- (id)_plistKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", kCFBundleVersionKey, @"LSApplicationLaunchProhibited", @"NSExtension", @"EXAppExtensionAttributes", @"MinimumOSVersion", @"UIRequiredDeviceCapabilities", @"SBAppTags", @"LSCounterpartIdentifiers", @"LSRequiresPostProcessing", @"SBIconMasqueradeIdentifier", @"WKCompanionAppBundleIdentifier", @"WKWatchOnly", @"WKRunsIndependentlyOfCompanionApp", @"NSApplicationRequiresArcade", @"WKPushBundleMetadata", @"UIDeviceFamily", @"PPBundleMetadata",
           0);
}

- (IXPlaceholderAttributes)initWithInfoPlistFromBundleURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(IXPlaceholderAttributes *)self _plistKeys];
  uint64_t v8 = sub_1000892DC(v6, v7, a4);

  if (v8)
  {
    self = [(IXPlaceholderAttributes *)self initWithInfoPlistDictionary:v8];
    unint64_t v9 = self;
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (IXPlaceholderAttributes)initWithInfoPlistFromBundle:(__CFBundle *)a3 error:(id *)a4
{
  id v6 = self;
  unint64_t v7 = [(IXPlaceholderAttributes *)self _plistKeys];
  uint64_t v8 = sub_10008943C(a3, v7, a4);

  if (v8)
  {
    id v6 = [(IXPlaceholderAttributes *)v6 initWithInfoPlistDictionary:v8];
    unint64_t v9 = v6;
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (IXPlaceholderAttributes)initWithInfoPlistDictionary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(IXPlaceholderAttributes *)self init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"LSApplicationLaunchProhibited"];
    [(IXPlaceholderAttributes *)v5 setLaunchProhibited:sub_100082F48(v6, 0)];

    unint64_t v7 = [v4 objectForKeyedSubscript:kCFBundleVersionKey];
    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    [(IXPlaceholderAttributes *)v5 setBundleVersion:v9];
    id v10 = [v4 objectForKeyedSubscript:@"NSExtension"];
    objc_opt_class();
    id v11 = v10;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    [(IXPlaceholderAttributes *)v5 setExtensionDictionary:v12];
    unint64_t v13 = [v4 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
    objc_opt_class();
    id v14 = v13;
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    [(IXPlaceholderAttributes *)v5 setExAppExtensionAttributes:v15];
    uint64_t v16 = [v4 objectForKeyedSubscript:@"MinimumOSVersion"];
    objc_opt_class();
    id v17 = v16;
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    [(IXPlaceholderAttributes *)v5 setMinimumOSVersion:v18];
    v19 = [v4 objectForKeyedSubscript:@"SBAppTags"];
    objc_opt_class();
    id v20 = v19;
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    objc_opt_class();
    unint64_t v22 = sub_1000830D8(v21);
    [(IXPlaceholderAttributes *)v5 setSbAppTags:v22];

    unint64_t v23 = [v4 objectForKeyedSubscript:@"LSCounterpartIdentifiers"];
    objc_opt_class();
    id v24 = v23;
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    objc_opt_class();
    uint64_t v26 = sub_1000830D8(v25);
    [(IXPlaceholderAttributes *)v5 setLsCounterpartIdentifiers:v26];

    unint64_t v27 = [v4 objectForKeyedSubscript:@"LSRequiresPostProcessing"];
    [(IXPlaceholderAttributes *)v5 setLsRequiresPostProcessing:sub_100082F48(v27, 0)];

    BOOL v28 = [v4 objectForKeyedSubscript:@"SBIconMasqueradeIdentifier"];
    objc_opt_class();
    id v29 = v28;
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }

    [(IXPlaceholderAttributes *)v5 setSbIconMasqueradeIdentifier:v30];
    BOOL v31 = [v4 objectForKeyedSubscript:@"WKCompanionAppBundleIdentifier"];
    objc_opt_class();
    id v32 = v31;
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }

    [(IXPlaceholderAttributes *)v5 setCompanionBundleIdentifierForWatchApp:v33];
    v34 = [v4 objectForKeyedSubscript:@"UIRequiredDeviceCapabilities"];
    objc_opt_class();
    id v35 = v34;
    if (objc_opt_isKindOfClass()) {
      id v36 = v35;
    }
    else {
      id v36 = 0;
    }

    if (v36)
    {
      id v37 = v35;
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      unsigned int v40 = sub_10008324C(v37, v38, v39);

      [(IXPlaceholderAttributes *)v5 setRequiredDeviceCapabilities:v40];
    }
    else
    {
      objc_opt_class();
      id v41 = v35;
      if (objc_opt_isKindOfClass()) {
        id v42 = v41;
      }
      else {
        id v42 = 0;
      }

      if (v42) {
        [(IXPlaceholderAttributes *)v5 setRequiredDeviceCapabilitiesWithArray:v41];
      }
    }
    v43 = [v4 objectForKeyedSubscript:@"WKWatchOnly"];
    [(IXPlaceholderAttributes *)v5 setWatchOnlyApp:sub_100082F48(v43, 0)];

    BOOL v44 = [v4 objectForKeyedSubscript:@"WKRunsIndependentlyOfCompanionApp"];
    [(IXPlaceholderAttributes *)v5 setRunsIndependentlyOfCompanionApp:sub_100082F48(v44, 0)];

    v45 = [v4 objectForKeyedSubscript:@"NSApplicationRequiresArcade"];
    [(IXPlaceholderAttributes *)v5 setArcadeApp:sub_100082F48(v45, 0)];

    v46 = [v4 objectForKeyedSubscript:@"WKPushBundleMetadata"];
    objc_opt_class();
    id v47 = v46;
    if (objc_opt_isKindOfClass()) {
      id v48 = v47;
    }
    else {
      id v48 = 0;
    }

    [(IXPlaceholderAttributes *)v5 setWebKitPushBundleMetadata:v48];
    v49 = [v4 objectForKeyedSubscript:@"UIDeviceFamily"];
    objc_opt_class();
    id v50 = v49;
    if (objc_opt_isKindOfClass()) {
      id v51 = v50;
    }
    else {
      id v51 = 0;
    }

    if (v51)
    {
      id v62 = v35;
      v63 = v5;
      v52 = objc_opt_new();
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v53 = v51;
      id v54 = [v53 countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (v54)
      {
        id v55 = v54;
        uint64_t v56 = *(void *)v65;
        do
        {
          for (i = 0; i != v55; i = (char *)i + 1)
          {
            if (*(void *)v65 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v59 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v58 intValue]);
              [v52 addObject:v59];
            }
          }
          id v55 = [v53 countByEnumeratingWithState:&v64 objects:v68 count:16];
        }
        while (v55);
      }

      id v60 = [v52 copy];
      unint64_t v5 = v63;
      [(IXPlaceholderAttributes *)v63 setUiDeviceFamily:v60];

      id v35 = v62;
    }
  }
  return v5;
}

- (void)setRequiredDeviceCapabilitiesWithArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v10);
        objc_opt_class();
        id v12 = v11;
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }

        if (v13) {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v12, (void)v15);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v14 = [v5 copy];
    [(IXPlaceholderAttributes *)self setRequiredDeviceCapabilities:v14];
  }
}

- (id)infoPlistContent
{
  uint64_t v3 = objc_opt_new();
  if ([(IXPlaceholderAttributes *)self launchProhibited]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"LSApplicationLaunchProhibited"];
  }
  id v4 = [(IXPlaceholderAttributes *)self bundleVersion];
  [v3 setObject:v4 forKeyedSubscript:kCFBundleVersionKey];

  unint64_t v5 = [(IXPlaceholderAttributes *)self extensionDictionary];
  [v3 setObject:v5 forKeyedSubscript:@"NSExtension"];

  id v6 = [(IXPlaceholderAttributes *)self exAppExtensionAttributes];
  [v3 setObject:v6 forKeyedSubscript:@"EXAppExtensionAttributes"];

  id v7 = [(IXPlaceholderAttributes *)self minimumOSVersion];
  [v3 setObject:v7 forKeyedSubscript:@"MinimumOSVersion"];

  id v8 = [(IXPlaceholderAttributes *)self requiredDeviceCapabilities];
  [v3 setObject:v8 forKeyedSubscript:@"UIRequiredDeviceCapabilities"];

  uint64_t v9 = [(IXPlaceholderAttributes *)self sbAppTags];
  [v3 setObject:v9 forKeyedSubscript:@"SBAppTags"];

  id v10 = [(IXPlaceholderAttributes *)self lsCounterpartIdentifiers];
  [v3 setObject:v10 forKeyedSubscript:@"LSCounterpartIdentifiers"];

  id v11 = [(IXPlaceholderAttributes *)self sbIconMasqueradeIdentifier];
  [v3 setObject:v11 forKeyedSubscript:@"SBIconMasqueradeIdentifier"];

  id v12 = [(IXPlaceholderAttributes *)self companionBundleIdentifierForWatchApp];
  [v3 setObject:v12 forKeyedSubscript:@"WKCompanionAppBundleIdentifier"];

  id v13 = [(IXPlaceholderAttributes *)self webKitPushBundleMetadata];
  [v3 setObject:v13 forKeyedSubscript:@"WKPushBundleMetadata"];

  id v14 = [(IXPlaceholderAttributes *)self uiDeviceFamily];
  [v3 setObject:v14 forKeyedSubscript:@"UIDeviceFamily"];

  if ([(IXPlaceholderAttributes *)self watchOnlyApp]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"WKWatchOnly"];
  }
  if ([(IXPlaceholderAttributes *)self runsIndependentlyOfCompanionApp]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"WKRunsIndependentlyOfCompanionApp"];
  }
  if ([(IXPlaceholderAttributes *)self arcadeApp]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"NSApplicationRequiresArcade"];
  }
  if ([(IXPlaceholderAttributes *)self lsRequiresPostProcessing]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"LSRequiresPostProcessing"];
  }
  id v15 = [v3 copy];

  return v15;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = [(IXPlaceholderAttributes *)self infoPlistContent];
  id v6 = +[NSString stringWithFormat:@"<%@<%p> : %@>", v4, self, v5];

  return v6;
}

- (BOOL)launchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSDictionary)extensionDictionary
{
  return self->_extensionDictionary;
}

- (void)setExtensionDictionary:(id)a3
{
}

- (NSDictionary)exAppExtensionAttributes
{
  return self->_exAppExtensionAttributes;
}

- (void)setExAppExtensionAttributes:(id)a3
{
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (void)setMinimumOSVersion:(id)a3
{
}

- (NSDictionary)requiredDeviceCapabilities
{
  return self->_requiredDeviceCapabilities;
}

- (void)setRequiredDeviceCapabilities:(id)a3
{
}

- (NSArray)sbAppTags
{
  return self->_sbAppTags;
}

- (void)setSbAppTags:(id)a3
{
}

- (NSArray)lsCounterpartIdentifiers
{
  return self->_lsCounterpartIdentifiers;
}

- (void)setLsCounterpartIdentifiers:(id)a3
{
}

- (NSString)sbIconMasqueradeIdentifier
{
  return self->_sbIconMasqueradeIdentifier;
}

- (void)setSbIconMasqueradeIdentifier:(id)a3
{
}

- (NSString)companionBundleIdentifierForWatchApp
{
  return self->_companionBundleIdentifierForWatchApp;
}

- (void)setCompanionBundleIdentifierForWatchApp:(id)a3
{
}

- (BOOL)watchOnlyApp
{
  return self->_watchOnlyApp;
}

- (void)setWatchOnlyApp:(BOOL)a3
{
  self->_watchOnlyApp = a3;
}

- (BOOL)runsIndependentlyOfCompanionApp
{
  return self->_runsIndependentlyOfCompanionApp;
}

- (void)setRunsIndependentlyOfCompanionApp:(BOOL)a3
{
  self->_runsIndependentlyOfCompanionApp = a3;
}

- (BOOL)arcadeApp
{
  return self->_arcadeApp;
}

- (void)setArcadeApp:(BOOL)a3
{
  self->_arcadeApp = a3;
}

- (NSDictionary)webKitPushBundleMetadata
{
  return self->_webKitPushBundleMetadata;
}

- (void)setWebKitPushBundleMetadata:(id)a3
{
}

- (BOOL)lsRequiresPostProcessing
{
  return self->_lsRequiresPostProcessing;
}

- (void)setLsRequiresPostProcessing:(BOOL)a3
{
  self->_lsRequiresPostProcessing = a3;
}

- (NSArray)uiDeviceFamily
{
  return self->_uiDeviceFamily;
}

- (void)setUiDeviceFamily:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiDeviceFamily, 0);
  objc_storeStrong((id *)&self->_webKitPushBundleMetadata, 0);
  objc_storeStrong((id *)&self->_companionBundleIdentifierForWatchApp, 0);
  objc_storeStrong((id *)&self->_sbIconMasqueradeIdentifier, 0);
  objc_storeStrong((id *)&self->_lsCounterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_sbAppTags, 0);
  objc_storeStrong((id *)&self->_requiredDeviceCapabilities, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_exAppExtensionAttributes, 0);
  objc_storeStrong((id *)&self->_extensionDictionary, 0);

  objc_storeStrong((id *)&self->_bundleVersion, 0);
}

@end