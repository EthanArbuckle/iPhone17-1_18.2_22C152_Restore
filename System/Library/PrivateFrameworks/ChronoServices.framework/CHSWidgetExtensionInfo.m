@interface CHSWidgetExtensionInfo
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)allowsMixedLocalizations;
- (BOOL)disablesImplicitDiscovery;
- (BOOL)isDevelopmentExtension;
- (BOOL)wantsLocation;
- (CHSWidgetExtensionInfo)initWithBSXPCCoder:(id)a3;
- (NSArray)availableLocalizations;
- (NSArray)controlConfigurations;
- (NSArray)descriptors;
- (NSArray)liveControlURLs;
- (NSArray)livePlaceholderControlURLs;
- (NSArray)nominatedContainerBundleIdentifiers;
- (NSArray)placeholderURLs;
- (NSArray)previewControlURLs;
- (NSArray)snapshotURLs;
- (NSArray)timelineURLs;
- (NSArray)widgetConfigurations;
- (NSDate)lastModifiedDate;
- (NSObject)entitlements;
- (NSString)bundleIdentifier;
- (NSString)containerBundleIdentifier;
- (NSString)dataProtectionLevel;
- (NSString)effectiveContainerBundleIdentifier;
- (NSString)sdkVersion;
- (NSString)version;
- (NSURL)bundleURL;
- (NSURL)containerURL;
- (NSURL)systemDataContainerURL;
- (id)_init;
- (id)_initWithInfo:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CHSWidgetExtensionInfo

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetExtensionInfo;
  return [(CHSWidgetExtensionInfo *)&v3 init];
}

- (id)_initWithInfo:(id)a3
{
  v4 = (id *)a3;
  id v5 = [(CHSWidgetExtensionInfo *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4[1] copy];
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    uint64_t v8 = [v4[2] copy];
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;

    uint64_t v10 = [v4[3] copy];
    v11 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v10;

    uint64_t v12 = [v4[4] copy];
    v13 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v12;

    objc_storeStrong((id *)v5 + 5, v4[5]);
    uint64_t v14 = [v4[6] copy];
    v15 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v14;

    uint64_t v16 = [v4[7] copy];
    v17 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v16;

    uint64_t v18 = [v4[8] copy];
    v19 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v18;

    uint64_t v20 = [v4[9] copy];
    v21 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v20;

    *((unsigned char *)v5 + 81) = *((unsigned char *)v4 + 81);
    *((unsigned char *)v5 + 82) = *((unsigned char *)v4 + 82);
    uint64_t v22 = [v4[11] copy];
    v23 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v22;

    *((unsigned char *)v5 + 96) = *((unsigned char *)v4 + 96);
    objc_storeStrong((id *)v5 + 14, v4[14]);
    uint64_t v24 = [v4[15] copy];
    v25 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v24;

    uint64_t v26 = [v4[16] copy];
    v27 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v26;

    uint64_t v28 = [v4[17] copy];
    v29 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v28;

    uint64_t v30 = [v4[19] copy];
    v31 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v30;

    uint64_t v32 = [v4[20] copy];
    v33 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v32;

    uint64_t v34 = [v4[21] copy];
    v35 = (void *)*((void *)v5 + 21);
    *((void *)v5 + 21) = v34;

    uint64_t v36 = [v4[22] copy];
    v37 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = v36;

    uint64_t v38 = [v4[23] copy];
    v39 = (void *)*((void *)v5 + 23);
    *((void *)v5 + 23) = v38;

    uint64_t v40 = [v4[24] copy];
    v41 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v40;

    uint64_t v42 = [v4[25] copy];
    v43 = (void *)*((void *)v5 + 25);
    *((void *)v5 + 25) = v42;

    uint64_t v44 = [v4[13] copy];
    v45 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v44;

    *((unsigned char *)v5 + 80) = *((unsigned char *)v4 + 80);
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CHSMutableWidgetExtensionInfo alloc];
  return [(CHSWidgetExtensionInfo *)v4 _initWithInfo:self];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_bundleIdentifier forKey:@"bi"];
  [v6 encodeObject:self->_containerBundleIdentifier forKey:@"cbi"];
  [v6 encodeObject:self->_effectiveContainerBundleIdentifier forKey:@"ecbi"];
  [v6 encodeObject:self->_version forKey:@"v"];
  [v6 encodeObject:self->_lastModifiedDate forKey:@"lmd"];
  [v6 encodeObject:self->_bundleURL forKey:@"bu"];
  [v6 encodeObject:self->_containerURL forKey:@"cu"];
  [v6 encodeObject:self->_systemDataContainerURL forKey:@"sdcu"];
  [v6 encodeObject:self->_dataProtectionLevel forKey:@"dpl"];
  [v6 encodeBool:self->_isDevelopmentExtension forKey:@"ide"];
  [v6 encodeBool:self->_wantsLocation forKey:@"wl"];
  [v6 encodeObject:self->_availableLocalizations forKey:@"al"];
  [v6 encodeBool:self->_allowsMixedLocalizations forKey:@"aml"];
  [v6 encodeObject:self->_entitlements forKey:@"ent"];
  [v6 encodeObject:self->_sdkVersion forKey:@"sdkVersion"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v4 encodeObject:self->_descriptors forKey:@"desc"];
  [v4 finishEncoding];
  id v5 = [v4 encodedData];
  [v6 encodeObject:v5 forKey:@"desc"];

  [v6 encodeObject:self->_widgetConfigurations forKey:@"widgetConfigurations"];
  [v6 encodeObject:self->_controlConfigurations forKey:@"controlConfigurations"];
  [v6 encodeObject:self->_snapshotURLs forKey:@"snu"];
  [v6 encodeObject:self->_placeholderURLs forKey:@"plu"];
  [v6 encodeObject:self->_timelineURLs forKey:@"tlu"];
  [v6 encodeObject:self->_liveControlURLs forKey:@"liveControlURLs"];
  [v6 encodeObject:self->_livePlaceholderControlURLs forKey:@"livePlaceholderControlURLs"];
  [v6 encodeObject:self->_previewControlURLs forKey:@"previewControlURLs"];
  [v6 encodeObject:self->_nominatedContainerBundleIdentifiers forKey:@"ncbi"];
  [v6 encodeBool:self->_disablesImplicitDiscovery forKey:@"disablesImplicitDiscovery"];
}

- (CHSWidgetExtensionInfo)initWithBSXPCCoder:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CHSWidgetExtensionInfo *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"bi"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeStringForKey:@"cbi"];
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeStringForKey:@"ecbi"];
    effectiveContainerBundleIdentifier = v5->_effectiveContainerBundleIdentifier;
    v5->_effectiveContainerBundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeStringForKey:@"v"];
    version = v5->_version;
    v5->_version = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lmd"];
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bu"];
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cu"];
    containerURL = v5->_containerURL;
    v5->_containerURL = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sdcu"];
    systemDataContainerURL = v5->_systemDataContainerURL;
    v5->_systemDataContainerURL = (NSURL *)v20;

    uint64_t v22 = [v4 decodeStringForKey:@"dpl"];
    dataProtectionLevel = v5->_dataProtectionLevel;
    v5->_dataProtectionLevel = (NSString *)v22;

    v5->_isDevelopmentExtension = [v4 decodeBoolForKey:@"ide"];
    v5->_wantsLocation = [v4 decodeBoolForKey:@"wl"];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = [v4 decodeCollectionOfClass:v24 containingClass:objc_opt_class() forKey:@"al"];
    availableLocalizations = v5->_availableLocalizations;
    v5->_availableLocalizations = (NSArray *)v25;

    uint64_t v27 = [v4 decodeStringForKey:@"sdkVersion"];
    sdkVersion = v5->_sdkVersion;
    v5->_sdkVersion = (NSString *)v27;

    v5->_allowsMixedLocalizations = [v4 decodeBoolForKey:@"aml"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ent"];
    entitlements = v5->_entitlements;
    v5->_entitlements = (CHSEntitlementCollection *)v29;

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desc"];
    id v69 = 0;
    uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v31 error:&v69];
    id v33 = v69;
    uint64_t v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
    uint64_t v38 = [v32 decodeObjectOfClasses:v37 forKey:@"desc"];
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v38;

    if (v33)
    {
      uint64_t v40 = CHSLogChronoServices();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v71 = v33;
        _os_log_impl(&dword_190C6F000, v40, OS_LOG_TYPE_DEFAULT, "Error decoding widget info: %{public}@", buf, 0xCu);
      }
    }
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = [v4 decodeCollectionOfClass:v41 containingClass:objc_opt_class() forKey:@"widgetConfigurations"];
    widgetConfigurations = v5->_widgetConfigurations;
    v5->_widgetConfigurations = (NSArray *)v42;

    uint64_t v44 = objc_opt_class();
    uint64_t v45 = [v4 decodeCollectionOfClass:v44 containingClass:objc_opt_class() forKey:@"controlConfigurations"];
    controlConfigurations = v5->_controlConfigurations;
    v5->_controlConfigurations = (NSArray *)v45;

    uint64_t v47 = objc_opt_class();
    uint64_t v48 = [v4 decodeCollectionOfClass:v47 containingClass:objc_opt_class() forKey:@"snu"];
    snapshotURLs = v5->_snapshotURLs;
    v5->_snapshotURLs = (NSArray *)v48;

    uint64_t v50 = objc_opt_class();
    uint64_t v51 = [v4 decodeCollectionOfClass:v50 containingClass:objc_opt_class() forKey:@"plu"];
    placeholderURLs = v5->_placeholderURLs;
    v5->_placeholderURLs = (NSArray *)v51;

    uint64_t v53 = objc_opt_class();
    uint64_t v54 = [v4 decodeCollectionOfClass:v53 containingClass:objc_opt_class() forKey:@"tlu"];
    timelineURLs = v5->_timelineURLs;
    v5->_timelineURLs = (NSArray *)v54;

    uint64_t v56 = objc_opt_class();
    uint64_t v57 = [v4 decodeCollectionOfClass:v56 containingClass:objc_opt_class() forKey:@"liveControlURLs"];
    liveControlURLs = v5->_liveControlURLs;
    v5->_liveControlURLs = (NSArray *)v57;

    uint64_t v59 = objc_opt_class();
    uint64_t v60 = [v4 decodeCollectionOfClass:v59 containingClass:objc_opt_class() forKey:@"livePlaceholderControlURLs"];
    livePlaceholderControlURLs = v5->_livePlaceholderControlURLs;
    v5->_livePlaceholderControlURLs = (NSArray *)v60;

    uint64_t v62 = objc_opt_class();
    uint64_t v63 = [v4 decodeCollectionOfClass:v62 containingClass:objc_opt_class() forKey:@"previewControlURLs"];
    previewControlURLs = v5->_previewControlURLs;
    v5->_previewControlURLs = (NSArray *)v63;

    uint64_t v65 = objc_opt_class();
    uint64_t v66 = [v4 decodeCollectionOfClass:v65 containingClass:objc_opt_class() forKey:@"ncbi"];
    nominatedContainerBundleIdentifiers = v5->_nominatedContainerBundleIdentifiers;
    v5->_nominatedContainerBundleIdentifiers = (NSArray *)v66;

    v5->_disablesImplicitDiscovery = [v4 decodeBoolForKey:@"disablesImplicitDiscovery"];
  }

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)effectiveContainerBundleIdentifier
{
  return self->_effectiveContainerBundleIdentifier;
}

- (NSString)version
{
  return self->_version;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSURL)systemDataContainerURL
{
  return self->_systemDataContainerURL;
}

- (NSString)dataProtectionLevel
{
  return self->_dataProtectionLevel;
}

- (BOOL)disablesImplicitDiscovery
{
  return self->_disablesImplicitDiscovery;
}

- (BOOL)isDevelopmentExtension
{
  return self->_isDevelopmentExtension;
}

- (BOOL)wantsLocation
{
  return self->_wantsLocation;
}

- (NSArray)availableLocalizations
{
  return self->_availableLocalizations;
}

- (BOOL)allowsMixedLocalizations
{
  return self->_allowsMixedLocalizations;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (NSObject)entitlements
{
  return &self->_entitlements->super;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (NSArray)widgetConfigurations
{
  return self->_widgetConfigurations;
}

- (NSArray)controlConfigurations
{
  return self->_controlConfigurations;
}

- (NSArray)snapshotURLs
{
  return self->_snapshotURLs;
}

- (NSArray)placeholderURLs
{
  return self->_placeholderURLs;
}

- (NSArray)timelineURLs
{
  return self->_timelineURLs;
}

- (NSArray)liveControlURLs
{
  return self->_liveControlURLs;
}

- (NSArray)livePlaceholderControlURLs
{
  return self->_livePlaceholderControlURLs;
}

- (NSArray)previewControlURLs
{
  return self->_previewControlURLs;
}

- (NSArray)nominatedContainerBundleIdentifiers
{
  return self->_nominatedContainerBundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nominatedContainerBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_previewControlURLs, 0);
  objc_storeStrong((id *)&self->_livePlaceholderControlURLs, 0);
  objc_storeStrong((id *)&self->_liveControlURLs, 0);
  objc_storeStrong((id *)&self->_timelineURLs, 0);
  objc_storeStrong((id *)&self->_placeholderURLs, 0);
  objc_storeStrong((id *)&self->_snapshotURLs, 0);
  objc_storeStrong((id *)&self->_controlTemplates, 0);
  objc_storeStrong((id *)&self->_controlConfigurations, 0);
  objc_storeStrong((id *)&self->_widgetConfigurations, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_availableLocalizations, 0);
  objc_storeStrong((id *)&self->_dataProtectionLevel, 0);
  objc_storeStrong((id *)&self->_systemDataContainerURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_effectiveContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end