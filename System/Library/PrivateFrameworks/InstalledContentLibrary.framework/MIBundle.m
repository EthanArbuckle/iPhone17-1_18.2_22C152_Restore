@interface MIBundle
+ (BOOL)bundleIsInDenyList:(id)a3;
+ (id)_URLOfFirstBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5;
+ (id)bundleForURL:(id)a3 error:(id *)a4;
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)_isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 requiredOS:(unint64_t)a5 error:(id *)a6;
- (BOOL)_validateAppNSPrivacyTrackingDomainsWithError:(id *)a3;
- (BOOL)_validateExtensions:(id)a3 error:(id *)a4;
- (BOOL)_validateWithError:(id *)a3;
- (BOOL)allowsAppleAppExtensionsNotInExtensionCache;
- (BOOL)getIsBuiltForiOSPlatform:(BOOL *)a3 error:(id *)a4;
- (BOOL)isAppTypeBundle;
- (BOOL)isApplicableToCurrentDeviceCapabilitiesWithError:(id *)a3;
- (BOOL)isApplicableToCurrentDeviceFamilyWithError:(id *)a3;
- (BOOL)isApplicableToCurrentOSVersionWithError:(id *)a3;
- (BOOL)isApplicableToOSVersion:(id)a3 error:(id *)a4;
- (BOOL)isApplicableToOSVersionEarlierThan:(id)a3;
- (BOOL)isCompatibleWithDeviceFamily:(int)a3;
- (BOOL)isDeletable;
- (BOOL)isLaunchProhibited;
- (BOOL)isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 error:(id *)a5;
- (BOOL)isPlaceholder;
- (BOOL)isPlaceholderStatusValid;
- (BOOL)isRemovableSystemApp;
- (BOOL)isStaticContent;
- (BOOL)isWatchApp;
- (BOOL)mayHaveExecutableProgram;
- (BOOL)needsDataContainer;
- (BOOL)sdkBuildVersionIsAtLeast:(id)a3;
- (BOOL)setIsPlaceholderWithError:(id *)a3;
- (BOOL)thinningMatchesCurrentDeviceWithError:(id *)a3;
- (BOOL)validateAppMetadataWithError:(id *)a3;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (BOOL)validateDriverKitExtensionMetadataWithError:(id *)a3;
- (BOOL)validateExtensionKitMetadataWithError:(id *)a3;
- (BOOL)validatePluginKitMetadataWithError:(id *)a3;
- (MIBundle)initWithBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5;
- (MIBundle)initWithBundleParentURL:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6;
- (MIBundle)initWithBundleURL:(id)a3 error:(id *)a4;
- (MIBundle)initWithParentBundle:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6;
- (MIBundle)parentBundle;
- (NSArray)deviceFamilies;
- (NSArray)driverKitExtensionBundles;
- (NSArray)extensionKitBundles;
- (NSArray)frameworkBundles;
- (NSArray)pluginKitBundles;
- (NSArray)supportedDevices;
- (NSArray)xpcServiceBundles;
- (NSDictionary)infoPlistSubset;
- (NSSet)siriIntents;
- (NSString)bundleName;
- (NSString)bundleParentSubdirectory;
- (NSString)bundleShortVersion;
- (NSString)bundleTypeDescription;
- (NSString)bundleVersion;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)minimumOSVersion;
- (NSString)parentBundleID;
- (NSString)relativePath;
- (NSString)sdkBuildVersion;
- (NSURL)bundleParentDirectoryURL;
- (NSURL)bundleURL;
- (id)_filterExtensionBundles:(id)a3 forValidationFlags:(unsigned __int8)a4;
- (id)_filterExtensionBundlesNotInCacheIfNeeded:(id)a3;
- (id)_infoPlistKeysToLoad;
- (id)appExtensionBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)appExtensionBundlesWithError:(id *)a3;
- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4;
- (id)description;
- (id)driverKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)driverKitExtensionBundlesWithError:(id *)a3;
- (id)extensionKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)extensionKitBundlesWithError:(id *)a3;
- (id)frameworkBundlesWithError:(id *)a3;
- (id)initForTesting;
- (id)pluginKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4;
- (id)pluginKitBundlesWithError:(id *)a3;
- (id)thisBundleAndAllContainedBundlesWithError:(id *)a3;
- (id)xpcServiceBundlesWithError:(id *)a3;
- (unsigned)bundleType;
- (void)infoPlistSubsetForTesting:(id)a3;
- (void)setBundleParentDirectoryURL:(id)a3;
- (void)setDriverKitExtensionBundles:(id)a3;
- (void)setExtensionKitBundles:(id)a3;
- (void)setFrameworkBundles:(id)a3;
- (void)setIsPlaceholderStatusValid:(BOOL)a3;
- (void)setPluginKitBundles:(id)a3;
- (void)setXpcServiceBundles:(id)a3;
@end

@implementation MIBundle

- (BOOL)_validateWithError:(id *)a3
{
  v5 = [(MIBundle *)self infoPlistSubset];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9 && [v9 length])
    {
      if (![v9 containsString:@"/"])
      {
        id v15 = 0;
        BOOL v16 = 1;
        goto LABEL_14;
      }
      v17 = [(MIBundle *)self bundleURL];
      v18 = [v17 path];
      _CreateAndLogError((uint64_t)"-[MIBundle _validateWithError:]", 79, @"MIInstallerErrorDomain", 69, 0, &unk_1F170E918, @"Bundle at path %@ had an invalid CFBundleIdentifier in its Info.plist: %@", v19, (uint64_t)v18);
    }
    else
    {
      v17 = [(MIBundle *)self bundleURL];
      v18 = [v17 path];
      _CreateAndLogError((uint64_t)"-[MIBundle _validateWithError:]", 71, @"MIInstallerErrorDomain", 12, 0, &unk_1F170E8F0, @"Bundle at path %@ did not have a CFBundleIdentifier in its Info.plist", v20, (uint64_t)v18);
    }
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3) {
      goto LABEL_13;
    }
  }
  else
  {
    v10 = [(MIBundle *)self bundleURL];
    id v9 = [v10 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];

    v11 = [(MIBundle *)self bundleURL];
    v12 = [v11 path];
    v13 = +[MIFileManager defaultManager];
    v22 = [v13 debugDescriptionForItemAtURL:v9];
    _CreateAndLogError((uint64_t)"-[MIBundle _validateWithError:]", 64, @"MIInstallerErrorDomain", 35, 0, &unk_1F170E8C8, @"Failed to load Info.plist from bundle at path %@; %@",
      v14,
      (uint64_t)v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
LABEL_13:
      id v15 = v15;
      BOOL v16 = 0;
      *a3 = v15;
      goto LABEL_14;
    }
  }
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)MIBundle;
  return [(MIBundle *)&v3 init];
}

- (void)infoPlistSubsetForTesting:(id)a3
{
}

- (MIBundle)initWithBundleParentURL:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MIBundle;
  uint64_t v14 = [(MIBundle *)&v20 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v14->_bundleName, a5);
  objc_storeStrong((id *)&v15->_bundleParentSubdirectory, a4);
  objc_storeStrong((id *)&v15->_bundleParentDirectoryURL, a3);
  parentBundleID = v15->_parentBundleID;
  v15->_parentBundleID = 0;

  BOOL v17 = [(MIBundle *)v15 _validateWithError:a6];
  v18 = 0;
  if (v17) {
LABEL_3:
  }
    v18 = v15;

  return v18;
}

- (MIBundle)initWithParentBundle:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MIBundle;
  id v13 = [(MIBundle *)&v21 init];
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v13->_bundleName, a5);
  objc_storeStrong((id *)&v14->_bundleParentSubdirectory, a4);
  uint64_t v15 = [v10 bundleURL];
  bundleParentDirectoryURL = v14->_bundleParentDirectoryURL;
  v14->_bundleParentDirectoryURL = (NSURL *)v15;

  uint64_t v17 = [v10 identifier];
  parentBundleID = v14->_parentBundleID;
  v14->_parentBundleID = (NSString *)v17;

  objc_storeWeak((id *)&v14->_parentBundle, v10);
  if (![(MIBundle *)v14 _validateWithError:a6]) {
    uint64_t v19 = 0;
  }
  else {
LABEL_3:
  }
    uint64_t v19 = v14;

  return v19;
}

- (MIBundle)initWithBundleURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 URLByDeletingLastPathComponent];
  id v8 = [v6 lastPathComponent];

  id v9 = [(MIBundle *)self initWithBundleParentURL:v7 parentSubdirectory:0 bundleName:v8 error:a4];
  return v9;
}

+ (id)_URLOfFirstBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  id v9 = +[MIFileManager defaultManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__MIBundle__URLOfFirstBundleInDirectory_withExtension_error___block_invoke;
  v18[3] = &unk_1E62E6DA0;
  id v10 = v8;
  id v19 = v10;
  objc_super v20 = &v21;
  id v11 = [v9 enumerateURLsForItemsInDirectoryAtURL:v7 ignoreSymlinks:1 withBlock:v18];

  id v12 = (void *)v22[5];
  if (!v12)
  {
    uint64_t v17 = [v7 path];
    uint64_t v14 = _CreateAndLogError((uint64_t)"+[MIBundle _URLOfFirstBundleInDirectory:withExtension:error:]", 160, @"MIInstallerErrorDomain", 36, 0, 0, @"Failed to locate a bundle with extension %@ in directory %@", v13, (uint64_t)v10);

    id v12 = (void *)v22[5];
    if (!a5 || v12)
    {
      id v11 = v14;
    }
    else
    {
      id v11 = v14;
      *a5 = v11;
      id v12 = (void *)v22[5];
    }
  }
  id v15 = v12;

  _Block_object_dispose(&v21, 8);
  return v15;
}

uint64_t __61__MIBundle__URLOfFirstBundleInDirectory_withExtension_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  id v7 = v6;
  if (a3 == 4)
  {
    id v8 = [v6 pathExtension];
    int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];
    if (v9) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
    uint64_t v10 = v9 ^ 1u;
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

- (MIBundle)initWithBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() _URLOfFirstBundleInDirectory:v9 withExtension:v8 error:a5];

  if (v10)
  {
    self = [(MIBundle *)self initWithBundleURL:v10 error:a5];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_infoPlistKeysToLoad
{
  if (_infoPlistKeysToLoad_onceToken != -1) {
    dispatch_once(&_infoPlistKeysToLoad_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_infoPlistKeysToLoad_keysSet;
  return v2;
}

uint64_t __32__MIBundle__infoPlistKeysToLoad__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1CFF0], *MEMORY[0x1E4F1CFF8], *MEMORY[0x1E4F1CC70], *MEMORY[0x1E4F1D020], *MEMORY[0x1E4F1CC60], *MEMORY[0x1E4F1D008], *MEMORY[0x1E4F1CC48], @"MinimumProductVersion", @"MinimumOSVersion", @"UIDeviceFamily", @"InstallDeviceClasses", @"UIBackgroundModes", @"XPCService", @"NSExtension", @"EXAppExtensionAttributes", @"UIRequiredDeviceCapabilities", @"UISupportedDevices",
    @"SupportedDevices",
    @"WKCompanionAppBundleIdentifier",
    @"CLKComplicationPrincipalClass",
    @"CLKComplicationSupportedFamilies",
    @"WKApplication",
    @"WKWatchKitApp",
    @"WKWatchOnly",
    @"WKRunsIndependentlyOfCompanionApp",
    @"LSApplicationLaunchProhibited",
    @"LSCounterpartIdentifiers",
    @"INAlternativeAppNames",
    @"INIntentsSupported",
    @"ITSWatchOnlyContainer",
    @"DTSDKBuild",
    @"NSPrivacyTrackingDomains",
    @"OSMinimumDriverKitVersion",
  _infoPlistKeysToLoad_keysSet = 0);
  return MEMORY[0x1F41817F8]();
}

- (NSDictionary)infoPlistSubset
{
  infoPlistSubset = self->_infoPlistSubset;
  if (infoPlistSubset) {
    goto LABEL_4;
  }
  v4 = [(MIBundle *)self bundleURL];
  v5 = [(MIBundle *)self _infoPlistKeysToLoad];
  id v6 = MILoadInfoPlist(v4, v5);
  id v7 = (NSDictionary *)[v6 copy];
  id v8 = self->_infoPlistSubset;
  self->_infoPlistSubset = v7;

  if ([(NSDictionary *)self->_infoPlistSubset count])
  {
    infoPlistSubset = self->_infoPlistSubset;
LABEL_4:
    id v9 = infoPlistSubset;
    goto LABEL_5;
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    id v11 = [(MIBundle *)self bundleURL];
    id v12 = [v11 path];
    MOLogWrite();
  }
  id v9 = 0;
LABEL_5:
  return v9;
}

- (NSString)identifier
{
  v2 = [(MIBundle *)self infoPlistSubset];
  objc_super v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)bundleVersion
{
  v2 = [(MIBundle *)self infoPlistSubset];
  objc_super v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)bundleShortVersion
{
  v2 = [(MIBundle *)self infoPlistSubset];
  objc_super v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CC70]];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isRemovableSystemApp
{
  objc_super v3 = +[MIDaemonConfiguration sharedInstance];
  id v4 = [v3 systemAppPlaceholderBundleIDToInfoMap];
  id v5 = [(MIBundle *)self identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

- (unsigned)bundleType
{
  objc_super v3 = [(MIBundle *)self identifier];
  if (v3)
  {
    unsigned __int8 bundleType = self->_bundleType;
    if (!bundleType)
    {
      id v5 = [(MIBundle *)self bundleURL];
      id v6 = [v5 pathExtension];

      BOOL v7 = MIDiskImageManagerProxy();
      if (![v6 isEqualToString:@"app"])
      {
        if ([v6 isEqualToString:@"appex"]
          || [v6 isEqualToString:@"appex"])
        {
          unsigned __int8 v14 = 6;
        }
        else if ([v6 isEqualToString:@"framework"])
        {
          unsigned __int8 v14 = 7;
        }
        else if ([v6 isEqualToString:@"xpc"])
        {
          unsigned __int8 v14 = 8;
        }
        else
        {
          if (![v6 isEqualToString:@"dext"])
          {
            self->_unsigned __int8 bundleType = 0;
            goto LABEL_15;
          }
          unsigned __int8 v14 = 11;
        }
        self->_unsigned __int8 bundleType = v14;
LABEL_15:

        unsigned __int8 bundleType = self->_bundleType;
        goto LABEL_16;
      }
      v41 = [(MIBundle *)self bundleParentDirectoryURL];
      id v8 = [v41 path];
      id v9 = +[MIDaemonConfiguration sharedInstance];
      uint64_t v10 = [v9 systemAppsDirectory];
      id v11 = [v10 path];
      char v12 = [v8 isEqualToString:v11];

      if (v12) {
        goto LABEL_5;
      }
      id v15 = +[MIDaemonConfiguration sharedInstance];
      BOOL v16 = [v15 internalAppsDirectory];
      uint64_t v17 = [v16 path];
      char v18 = [v8 isEqualToString:v17];

      if (v18)
      {
        unsigned __int8 v13 = 2;
        goto LABEL_13;
      }
      id v19 = v41;
      if ([v7 URLIsOnKnownImageMount:v41])
      {
        unsigned __int8 v13 = 3;
        goto LABEL_14;
      }
      uint64_t v21 = +[MIDaemonConfiguration sharedInstance];
      v22 = [v21 coreServicesDirectory];
      uint64_t v23 = [v22 path];
      char v24 = [v8 hasPrefix:v23];

      if (v24)
      {
LABEL_24:
        unsigned __int8 v13 = 5;
        goto LABEL_14;
      }
      v25 = +[MIDaemonConfiguration sharedInstance];
      id v26 = [v25 systemAppPlaceholdersDirectory];
      v27 = [v26 path];
      char v28 = [v8 hasPrefix:v27];

      if (v28)
      {
        unsigned __int8 v13 = 10;
        goto LABEL_14;
      }
      v29 = +[MIDaemonConfiguration sharedInstance];
      v30 = [v29 systemAppBundleIDToInfoMap];
      v31 = [v30 objectForKeyedSubscript:v3];
      if (v31)
      {
      }
      else
      {
        v40 = +[MIDaemonConfiguration sharedInstance];
        v32 = [v40 systemAppPlaceholderBundleIDToInfoMap];
        v33 = [v32 objectForKeyedSubscript:v3];

        if (!v33)
        {
          v34 = +[MIDaemonConfiguration sharedInstance];
          v35 = [v34 coreServicesAppBundleIDToInfoMap];
          v36 = [v35 objectForKeyedSubscript:v3];

          id v19 = v41;
          if (!v36)
          {
            v37 = +[MIDaemonConfiguration sharedInstance];
            v38 = [v37 internalAppBundleIDToInfoMap];
            v39 = [v38 objectForKeyedSubscript:v3];

            if (v39)
            {
              unsigned __int8 v13 = 2;
            }
            else if ([v7 bundleIDIsOnKnownImageMount:v3])
            {
              unsigned __int8 v13 = 3;
            }
            else
            {
              unsigned __int8 v13 = 4;
            }
            goto LABEL_14;
          }
          goto LABEL_24;
        }
      }
LABEL_5:
      unsigned __int8 v13 = 1;
LABEL_13:
      id v19 = v41;
LABEL_14:
      self->_unsigned __int8 bundleType = v13;

      goto LABEL_15;
    }
  }
  else
  {
    unsigned __int8 bundleType = 0;
  }
LABEL_16:

  return bundleType;
}

- (BOOL)isStaticContent
{
  id v6 = self;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v2 = [(MIBundle *)self bundleParentDirectoryURL];
  objc_super v3 = [v2 path];
  id v4 = MIDiskImageManagerProxy();
  int v5 = [v6 bundleType];
  LOBYTE(v6) = 0;
  switch(v5)
  {
    case 1:
      id v23 = +[MIDaemonConfiguration sharedInstance];
      char v28 = [v23 systemAppsDirectory];
      goto LABEL_22;
    case 2:
      id v23 = +[MIDaemonConfiguration sharedInstance];
      char v28 = [v23 internalAppsDirectory];
LABEL_22:
      v29 = v28;
      v30 = [v28 path];
      char v31 = [v3 isEqual:v30];
      goto LABEL_25;
    case 3:
      LOBYTE(v6) = [v4 URLIsOnKnownImageMount:v2];
      goto LABEL_38;
    case 5:
      id v23 = +[MIDaemonConfiguration sharedInstance];
      v29 = [v23 coreServicesDirectory];
      v30 = [v29 path];
      char v31 = [v3 isEqualToString:v30];
LABEL_25:
      LOBYTE(v6) = v31;

      goto LABEL_26;
    case 6:
    case 8:
      if ([v4 URLIsOnKnownImageMount:v2]) {
        goto LABEL_37;
      }
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      BOOL v7 = +[MIDaemonConfiguration sharedInstance];
      id v6 = [v7 allExtensionKitExtensionsDirectories];

      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (!v8) {
        goto LABEL_11;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v6);
        }
        char v12 = [*(id *)(*((void *)&v48 + 1) + 8 * v11) path];
        char v13 = [v3 hasPrefix:v12];

        if (v13) {
          goto LABEL_36;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v6 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (v9) {
            goto LABEL_5;
          }
LABEL_11:

          unsigned __int8 v14 = +[MIDaemonConfiguration sharedInstance];
          id v15 = [v14 allFrameworksDirectories];
          BOOL v16 = (void *)[v15 mutableCopy];

          uint64_t v17 = +[MIDaemonConfiguration sharedInstance];
          char v18 = [v17 systemAppsDirectory];
          [v16 addObject:v18];

          id v19 = +[MIDaemonConfiguration sharedInstance];
          objc_super v20 = [v19 coreServicesDirectory];
          [v16 addObject:v20];

          uint64_t v21 = +[MIDaemonConfiguration sharedInstance];
          v22 = [v21 internalAppsDirectory];
          [v16 addObject:v22];

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v23 = v16;
          id v6 = (void *)[v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v6)
          {
            uint64_t v24 = *(void *)v45;
            while (2)
            {
              for (i = 0; i != v6; i = (char *)i + 1)
              {
                if (*(void *)v45 != v24) {
                  objc_enumerationMutation(v23);
                }
                id v26 = [*(id *)(*((void *)&v44 + 1) + 8 * i) path];
                char v27 = [v3 hasPrefix:v26];

                if (v27)
                {
                  LOBYTE(v6) = 1;
                  goto LABEL_40;
                }
              }
              id v6 = (void *)[v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
              if (v6) {
                continue;
              }
              break;
            }
          }
LABEL_40:

LABEL_26:
          goto LABEL_38;
        }
      }
    case 7:
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v32 = +[MIDaemonConfiguration sharedInstance];
      id v6 = [v32 allFrameworksDirectories];

      uint64_t v33 = [v6 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (!v33) {
        goto LABEL_35;
      }
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v41;
      break;
    default:
      goto LABEL_38;
  }
  while (2)
  {
    for (uint64_t j = 0; j != v34; ++j)
    {
      if (*(void *)v41 != v35) {
        objc_enumerationMutation(v6);
      }
      v37 = [*(id *)(*((void *)&v40 + 1) + 8 * j) path];
      char v38 = [v3 hasPrefix:v37];

      if (v38)
      {
LABEL_36:

LABEL_37:
        LOBYTE(v6) = 1;
        goto LABEL_38;
      }
    }
    uint64_t v34 = [v6 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v34) {
      continue;
    }
    break;
  }
LABEL_35:

  LOBYTE(v6) = 0;
LABEL_38:

  return (char)v6;
}

- (NSString)bundleTypeDescription
{
  unsigned int v2 = [(MIBundle *)self bundleType] - 1;
  if (v2 > 0xA) {
    return (NSString *)@"unknown bundle type";
  }
  else {
    return &off_1E62E6E30[(char)v2]->isa;
  }
}

- (BOOL)isPlaceholder
{
  if (![(MIBundle *)self isPlaceholderStatusValid])
  {
    if ([(MIBundle *)self bundleType] == 10)
    {
      self->_isPlaceholder = 1;
    }
    else
    {
      objc_super v3 = [(MIBundle *)self parentBundle];
      id v4 = v3;
      if (v3 && [v3 isPlaceholder])
      {
        self->_isPlaceholder = 1;
      }
      else
      {
        int v5 = +[MIFileManager defaultManager];
        id v6 = [(MIBundle *)self bundleURL];
        self->_isPlaceholder = [v5 bundleAtURLIsPlaceholder:v6];
      }
    }
    [(MIBundle *)self setIsPlaceholderStatusValid:1];
  }
  return self->_isPlaceholder;
}

- (BOOL)setIsPlaceholderWithError:(id *)a3
{
  int v5 = +[MIFileManager defaultManager];
  id v6 = [(MIBundle *)self bundleURL];
  uint64_t v7 = [v5 markBundleAsPlaceholder:v6 withError:a3];

  if (v7) {
    self->_isPlaceholder = 1;
  }
  [(MIBundle *)self setIsPlaceholderStatusValid:v7];
  return v7;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = objc_opt_new();
  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = __Block_byref_object_copy__2;
  long long v41 = __Block_byref_object_dispose__2;
  id v42 = 0;
  unsigned __int8 v14 = [v10 bundleURL];
  id v15 = [v14 URLByAppendingPathComponent:v11 isDirectory:1];

  BOOL v16 = +[MIFileManager defaultManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__MIBundle_bundlesInParentBundle_subDirectory_matchingPredicate_error___block_invoke;
  v30[3] = &unk_1E62E6DC8;
  id v17 = v12;
  id v34 = v17;
  id v36 = a1;
  id v18 = v10;
  id v31 = v18;
  id v19 = v11;
  id v32 = v19;
  uint64_t v35 = &v37;
  id v20 = v13;
  id v33 = v20;
  uint64_t v21 = [v16 enumerateURLsForItemsInDirectoryAtURL:v15 ignoreSymlinks:1 withBlock:v30];

  if (!v38[5])
  {
    if (!v21) {
      goto LABEL_6;
    }
    v22 = [v21 domain];
    if ([v22 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v23 = [v21 code];

      if (v23 == 2)
      {

LABEL_6:
        uint64_t v24 = (void *)[v20 copy];
        uint64_t v21 = 0;
        if (!a6) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
    v25 = [v15 path];
    uint64_t v27 = _CreateAndLogError((uint64_t)"+[MIBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:]", 540, @"MIInstallerErrorDomain", 54, v21, 0, @"Failed to discover bundles in directory %@", v26, (uint64_t)v25);
    char v28 = (void *)v38[5];
    v38[5] = v27;
  }
  uint64_t v24 = 0;
  if (!a6) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v24) {
    *a6 = (id) v38[5];
  }
LABEL_13:

  _Block_object_dispose(&v37, 8);
  return v24;
}

BOOL __71__MIBundle_bundlesInParentBundle_subDirectory_matchingPredicate_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3 == 4 && ((uint64_t v6 = *(void *)(a1 + 56)) == 0 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v5)))
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [v5 lastPathComponent];
    id v16 = 0;
    id v11 = (void *)[v7 initWithParentBundle:v8 parentSubdirectory:v9 bundleName:v10 error:&v16];
    id v12 = v16;
    id v13 = v16;

    BOOL v14 = v11 != 0;
    if (v11) {
      [*(id *)(a1 + 48) addObject:v11];
    }
    else {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v12);
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)allowsAppleAppExtensionsNotInExtensionCache
{
  return 0;
}

- (BOOL)isDeletable
{
  int v3 = [(MIBundle *)self bundleType];
  id v4 = [(MIBundle *)self bundleParentDirectoryURL];
  id v5 = [v4 path];

  if (v3 == 4) {
    goto LABEL_6;
  }
  if (v3 == 2)
  {
    uint64_t v9 = +[MIDaemonConfiguration sharedInstance];
    id v10 = [v9 internalAppsDirectory];
    id v11 = [v10 path];
    if (([v5 isEqualToString:v11] & 1) == 0)
    {
LABEL_10:
      id v12 = +[MIDaemonConfiguration sharedInstance];
      char v8 = [v12 allowsInternalSecurityPolicy];

      goto LABEL_11;
    }
LABEL_9:
    char v8 = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (v3 != 1
    || (+[MIDaemonConfiguration sharedInstance],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 allowDeletableSystemApps],
        v6,
        !v7))
  {
    char v8 = 0;
    goto LABEL_12;
  }
  if (![(MIBundle *)self isRemovableSystemApp])
  {
    uint64_t v9 = +[MIDaemonConfiguration sharedInstance];
    id v10 = [v9 systemAppsDirectory];
    id v11 = [v10 path];
    if (([v5 isEqualToString:v11] & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_6:
  char v8 = 1;
LABEL_12:

  return v8;
}

- (id)_filterExtensionBundlesNotInCacheIfNeeded:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MIBundle *)self allowsAppleAppExtensionsNotInExtensionCache])
  {
    id v5 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v7) {
      goto LABEL_21;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        if (!objc_msgSend(v11, "targetsAppleExtensionPoint", v19))
        {
          id v13 = 0;
LABEL_13:
          [v5 addObject:v11];
          goto LABEL_14;
        }
        id v21 = 0;
        id v12 = [v11 extensionCacheEntryWithError:&v21];
        id v13 = v21;

        if (v12) {
          goto LABEL_13;
        }
        BOOL v14 = [v13 domain];
        if ([v14 isEqualToString:@"MIInstallerErrorDomain"])
        {
          uint64_t v15 = [v13 code];

          if (v15 == 45) {
            goto LABEL_13;
          }
        }
        else
        {
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          id v19 = [v11 identifier];
          MOLogWrite();
        }
LABEL_14:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v16 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v8 = v16;
      if (!v16)
      {
LABEL_21:

        id v17 = (id)[v5 copy];
        id v4 = v20;
        goto LABEL_23;
      }
    }
  }
  id v17 = v4;
LABEL_23:

  return v17;
}

- (id)_filterExtensionBundles:(id)a3 forValidationFlags:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v27 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v9) {
      goto LABEL_32;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ((v4 & 2) == 0
          || ([*(id *)(*((void *)&v30 + 1) + 8 * i) isApplicableToCurrentOSVersionWithError:0] & 1) != 0)
        {
          if ((v4 & 1) == 0) {
            goto LABEL_12;
          }
          id v29 = 0;
          char v14 = [v13 isApplicableToCurrentDeviceCapabilitiesWithError:&v29];
          id v15 = v29;
          if (v14)
          {
LABEL_11:

LABEL_12:
            objc_msgSend(v7, "addObject:", v13, v24, v25);
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_26;
          }
          id v18 = [v13 minimumOSVersion];
          if ([v18 compare:@"8.2" options:64] == -1 && v15 != 0)
          {
            id v20 = [v15 domain];
            if ([v20 isEqualToString:@"MIInstallerErrorDomain"])
            {
              uint64_t v28 = [v15 code];

              if (v28 == 66) {
                goto LABEL_11;
              }
              goto LABEL_26;
            }
          }
LABEL_26:
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
          {
            id v21 = objc_msgSend(v13, "bundleTypeDescription", v24, v25);
            long long v25 = [v13 identifier];
            id v26 = v15;
            long long v24 = v21;
            MOLogWrite();
          }
          continue;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          uint64_t v16 = objc_msgSend(v13, "bundleTypeDescription", v24, v25, v26);
          id v17 = [v13 bundleURL];
          [v17 path];
          v25 = long long v24 = v16;
          MOLogWrite();
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (!v10)
      {
LABEL_32:

        long long v22 = (void *)[v7 copy];
        id v6 = v27;
        goto LABEL_34;
      }
    }
  }
  long long v22 = (void *)[v5 copy];
LABEL_34:

  return v22;
}

- (id)pluginKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(MIBundle *)self pluginKitBundles];
  if (v7)
  {
    id v8 = (id)v7;
    id v9 = 0;
    goto LABEL_20;
  }
  id v31 = 0;
  id v8 = +[MIPluginKitBundle bundlesInParentBundle:self subDirectory:@"PlugIns" matchingPredicate:&__block_literal_global_184 error:&v31];
  id v9 = v31;
  if (!v8)
  {
    id v17 = 0;
    id v18 = 0;
    if (!a4) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (![(MIBundle *)self isWatchApp])
  {
LABEL_19:
    [(MIBundle *)self setPluginKitBundles:v8];
LABEL_20:
    id v17 = [(MIBundle *)self _filterExtensionBundles:v8 forValidationFlags:v5];
    id v18 = [(MIBundle *)self _filterExtensionBundlesNotInCacheIfNeeded:v17];
    if (!a4) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v8;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v10)
  {
LABEL_13:
    uint64_t v15 = (uint64_t)v8;
    id v16 = v9;
LABEL_18:

    id v8 = (id)v15;
    id v9 = v16;
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v28;
LABEL_7:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v28 != v12) {
      objc_enumerationMutation(v8);
    }
    char v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
    if ([v14 isWatchKitExtension]) {
      break;
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v11) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  v32[0] = @"PlugIns";
  id v19 = [v14 bundleName];
  v32[1] = v19;
  v32[2] = @"PlugIns";
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];

  id v21 = [NSString pathWithComponents:v20];
  long long v22 = [v14 identifier];
  id v26 = v9;
  long long v23 = +[MIPluginKitBundle bundlesInParentBundle:self overrideParentBundleIDForValidation:v22 subDirectory:v21 matchingPredicate:&__block_literal_global_184 error:&v26];
  id v16 = v26;

  if (v23)
  {
    uint64_t v15 = [v8 arrayByAddingObjectsFromArray:v23];

    goto LABEL_18;
  }

  id v17 = 0;
  id v18 = 0;
  id v9 = v16;
  if (a4)
  {
LABEL_21:
    if (!v18) {
      *a4 = v9;
    }
  }
LABEL_23:
  id v24 = v18;

  return v24;
}

uint64_t __67__MIBundle_pluginKitBundlesPerformingPlatformValidation_withError___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"appex"];

  return v3;
}

- (id)pluginKitBundlesWithError:(id *)a3
{
  return [(MIBundle *)self pluginKitBundlesPerformingPlatformValidation:3 withError:a3];
}

- (BOOL)validatePluginKitMetadataWithError:(id *)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(MIBundle *)self isLaunchProhibited];
  id v6 = [(MIBundle *)self identifier];
  int v7 = [v6 isEqualToString:@"com.apple.MapsExternalComponents"];

  id v91 = 0;
  id v8 = [(MIBundle *)self pluginKitBundlesWithError:&v91];
  id v9 = v91;
  if (!v8)
  {
    v77 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    if (a3)
    {
LABEL_97:
      id v9 = v9;
      BOOL v14 = 0;
      *a3 = v9;
      goto LABEL_98;
    }
LABEL_5:
    BOOL v14 = 0;
    goto LABEL_98;
  }
  if ([(MIBundle *)self isWatchApp]) {
    BOOL v68 = [(MIBundle *)self isApplicableToOSVersion:@"2.9.9" error:0];
  }
  else {
    BOOL v68 = 0;
  }
  if (!-[MIBundle isPlaceholder](self, "isPlaceholder") && v5 && ![v8 count])
  {
    obuint64_t j = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 772, @"MIInstallerErrorDomain", 122, 0, &unk_1F170E940, @"The app extension stub app %@ must have at least one app extension, but none were found.", v46, (uint64_t)obj);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = 0;
    v77 = 0;
    uint64_t v10 = 0;
    uint64_t v75 = 0;
    uint64_t v13 = 0;
LABEL_95:

LABEL_96:
    id v9 = v15;
    uint64_t v11 = (void *)v75;
    uint64_t v12 = (void *)v76;
    if (a3) {
      goto LABEL_97;
    }
    goto LABEL_5;
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = v8;
  uint64_t v69 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
  if (!v69)
  {
    uint64_t v76 = 0;
    v77 = 0;
    uint64_t v10 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    id v15 = v9;
    goto LABEL_75;
  }
  uint64_t v76 = 0;
  v77 = 0;
  uint64_t v10 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v72 = *(void *)v88;
  int v71 = v5 & v7;
  char v70 = !v5 | v7;
  id v15 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v69; ++i)
    {
      id v17 = v15;
      if (*(void *)v88 != v72) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v87 + 1) + 8 * i);
      id v86 = v15;
      int v19 = objc_msgSend(v18, "validateBundleMetadataWithError:", &v86, v63);
      id v15 = v86;

      if (!v19)
      {
        uint64_t v13 = (void *)v74;
        goto LABEL_96;
      }
      if ([v18 isFileProviderNonUIExtension])
      {
        if (v74)
        {
          id v9 = [v18 identifier];
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 786, @"MIInstallerErrorDomain", 62, 0, &unk_1F170E968, @"Multiple file provider app extensions found in app but only one is allowed (found %@ ; already found %@)",
            v51,
          uint64_t v52 = (uint64_t)v9);

          id v15 = (id)v52;
          uint64_t v13 = (void *)v74;
          goto LABEL_95;
        }
        uint64_t v74 = [v18 identifier];
      }
      if (v71)
      {
        if (([v18 isMapsGeoServicesExtension] & 1) == 0)
        {
          id v20 = [(MIBundle *)self identifier];
          char v21 = [v20 isEqualToString:@"com.apple.MapsExternalComponents"];

          if ((v21 & 1) == 0)
          {
            id v9 = [(MIBundle *)self identifier];
            v64 = [v18 extensionPointIdentifier];
            uint64_t v59 = _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 794, @"MIInstallerErrorDomain", 59, 0, &unk_1F170E990, @"App %@ is forbidden from providing an extension of type %@", v58, (uint64_t)v9);

            id v15 = (id)v59;
            goto LABEL_94;
          }
        }
      }
      if ((v70 & 1) == 0 && ([v18 isMessagePayloadProviderExtension] & 1) == 0)
      {
        id v9 = [v18 identifier];
        v53 = [v18 extensionPointIdentifier];
        _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 801, @"MIInstallerErrorDomain", 123, 0, &unk_1F170E9B8, @"Messages stub apps may only have a single message payload provider app extension, but this stub app has an extension %@ of type %@", v54, (uint64_t)v9);
        uint64_t v57 = LABEL_88:;

        goto LABEL_93;
      }
      if ([v18 isMessagePayloadProviderExtension])
      {
        if (v75)
        {
          id v9 = [v18 identifier];
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 810, @"MIInstallerErrorDomain", 121, 0, &unk_1F170E9E0, @"Multiple message payload provider extensions found in app but only one is allowed (found %@ ; already found %@)",
            v55,
            (uint64_t)v9);
          uint64_t v57 = LABEL_85:;

          goto LABEL_93;
        }
        uint64_t v75 = [v18 identifier];
      }
      if (![v18 isWatchKitExtension])
      {
        if (v68)
        {
          long long v27 = [v18 bundleParentSubdirectory];
          int v28 = [v27 isEqualToString:@"PlugIns"];

          if (v28)
          {
            id v9 = [v18 bundleURL];
            v53 = [v9 path];
            _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 853, @"MIInstallerErrorDomain", 118, 0, &unk_1F170EAA8, @"WatchKit 2 app contains a non-WatchKit extension at %@. WatchKit apps specifying a MinimumOSVersion earlier than 3.0 must have non-WatchKit extensions embedded within the WatchKit extension.", v60, (uint64_t)v53);
            goto LABEL_88;
          }
        }
        if ([v18 isSiriIntentsExtension])
        {
          if (!v10) {
            uint64_t v10 = objc_opt_new();
          }
          long long v29 = [v18 extensionAttributes];
          id v9 = v29;
          if (!v29) {
            goto LABEL_70;
          }
          v66 = a3;
          v67 = v8;
          long long v30 = [v29 objectForKeyedSubscript:@"IntentsSupported"];
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id v31 = v30;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v82 objects:v93 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v83;
            while (2)
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v83 != v34) {
                  objc_enumerationMutation(v31);
                }
                if ([v10 containsObject:*(void *)(*((void *)&v82 + 1) + 8 * j)])
                {
                  long long v47 = [(MIBundle *)self identifier];
                  _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 871, @"MIInstallerErrorDomain", 117, 0, &unk_1F170EAD0, @"More than one Siri Intents app extension in the app %@ declares the value %@ in the IntentsSupported array in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist.", v48, (uint64_t)v47);
                  goto LABEL_79;
                }
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v82 objects:v93 count:16];
              if (v33) {
                continue;
              }
              break;
            }
          }

          id v36 = v10;
        }
        else
        {
          if (![v18 isSiriIntentsUIExtension]) {
            continue;
          }
          if (!v77) {
            v77 = objc_opt_new();
          }
          uint64_t v37 = [v18 extensionAttributes];
          id v9 = v37;
          if (!v37) {
            goto LABEL_70;
          }
          v66 = a3;
          v67 = v8;
          char v38 = [v37 objectForKeyedSubscript:@"IntentsSupported"];
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v31 = v38;
          uint64_t v39 = [v31 countByEnumeratingWithState:&v78 objects:v92 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v79;
            while (2)
            {
              for (uint64_t k = 0; k != v40; ++k)
              {
                if (*(void *)v79 != v41) {
                  objc_enumerationMutation(v31);
                }
                if ([v77 containsObject:*(void *)(*((void *)&v78 + 1) + 8 * k)])
                {
                  long long v47 = [(MIBundle *)self identifier];
                  _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 891, @"MIInstallerErrorDomain", 117, 0, &unk_1F170EAF8, @"More than one Siri Intents UI app extension in the app %@ declares the value %@ in the IntentsSupported array in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist.", v49, (uint64_t)v47);
                  uint64_t v50 = LABEL_79:;

                  id v15 = (id)v50;
                  a3 = v66;
                  id v8 = v67;
                  goto LABEL_94;
                }
              }
              uint64_t v40 = [v31 countByEnumeratingWithState:&v78 objects:v92 count:16];
              if (v40) {
                continue;
              }
              break;
            }
          }

          id v36 = v77;
        }
        [v36 addObjectsFromArray:v31];

        a3 = v66;
        id v8 = v67;
LABEL_70:

        continue;
      }
      if (v76)
      {
        id v9 = [v18 identifier];
        _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 821, @"MIInstallerErrorDomain", 82, 0, &unk_1F170EA08, @"Multiple WatchKit app extensions found in app but only one is allowed (found %@ ; already found %@)",
          v56,
          (uint64_t)v9);
        goto LABEL_85;
      }
      uint64_t v76 = [v18 identifier];
      if ([(MIBundle *)self isPlaceholder]) {
        continue;
      }
      if ([(MIBundle *)self isWatchApp])
      {
        long long v22 = [v18 extensionAttributes];
        if (!v22)
        {
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 841, @"MIInstallerErrorDomain", 93, 0, &unk_1F170EA80, @"WatchKit 2 app extension's NSExtension.NSExtensionAttributes dictionary is not present. It must contain a WKAppBundleIdentifier key set to the WatchKit app's bundle ID.", v23, v63);
          id v9 = v15;
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_94;
        }
        id v9 = v22;
        id v24 = [v22 objectForKeyedSubscript:@"WKAppBundleIdentifier"];
        objc_opt_class();
        id v25 = v24;
        if (objc_opt_isKindOfClass()) {
          id v26 = v25;
        }
        else {
          id v26 = 0;
        }

        if (!v26)
        {
          uint64_t v57 = _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 834, @"MIInstallerErrorDomain", 93, 0, &unk_1F170EA30, @"WatchKit 2 app extension's NSExtension.NSExtensionAttributes.WKAppBundleIdentifier value is missing (should be WatchKit app's bundle ID).", v43, v63);
          goto LABEL_92;
        }
        long long v44 = [(MIBundle *)self identifier];
        char v45 = [v26 isEqualToString:v44];

        if ((v45 & 1) == 0)
        {
          uint64_t v65 = [(MIBundle *)self identifier];
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 837, @"MIInstallerErrorDomain", 93, 0, &unk_1F170EA58, @"WatchKit 2 app extension's NSExtension.NSExtensionAttributes.WKAppBundleIdentifier value does not match WatchKit app's bundle ID (found \"%@\"; expected \"%@\").",
            v61,
          uint64_t v57 = (uint64_t)v26);

          id v15 = (id)v65;
LABEL_92:

LABEL_93:
          id v15 = (id)v57;
LABEL_94:
          uint64_t v13 = (void *)v74;
          goto LABEL_95;
        }

        goto LABEL_70;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        uint64_t v63 = v76;
        MOLogWrite();
      }
    }
    uint64_t v69 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
    if (v69) {
      continue;
    }
    break;
  }
LABEL_75:

  BOOL v14 = 1;
  id v9 = v15;
  uint64_t v13 = (void *)v74;
  uint64_t v11 = (void *)v75;
  uint64_t v12 = (void *)v76;
LABEL_98:

  return v14;
}

- (id)extensionKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v7 = [(MIBundle *)self extensionKitBundles];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = [(MIBundle *)self bundleURL];
  uint64_t v11 = [v10 URLByAppendingPathComponent:@"Extensions" isDirectory:1];

  uint64_t v12 = +[MIFileManager defaultManager];
  int v13 = [v12 itemDoesNotExistOrIsNotDirectoryAtURL:v11];

  if (v13)
  {
    id v8 = objc_opt_new();
    id v9 = 0;
LABEL_6:
    [(MIBundle *)self setExtensionKitBundles:v8];

LABEL_7:
    BOOL v14 = [(MIBundle *)self _filterExtensionBundles:v8 forValidationFlags:v5];
    id v15 = [(MIBundle *)self _filterExtensionBundlesNotInCacheIfNeeded:v14];
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  id v18 = 0;
  id v8 = +[MIExtensionKitBundle bundlesInParentBundle:self subDirectory:@"Extensions" matchingPredicate:&__block_literal_global_317 error:&v18];
  id v9 = v18;
  if (v8) {
    goto LABEL_6;
  }

  BOOL v14 = 0;
  id v15 = 0;
  if (!a4) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v15) {
    *a4 = v9;
  }
LABEL_10:
  id v16 = v15;

  return v16;
}

uint64_t __70__MIBundle_extensionKitBundlesPerformingPlatformValidation_withError___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"appex"];

  return v3;
}

- (id)extensionKitBundlesWithError:(id *)a3
{
  return [(MIBundle *)self extensionKitBundlesPerformingPlatformValidation:3 withError:a3];
}

- (BOOL)_validateExtensions:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v16 = v11;
        int v13 = [v12 validateBundleMetadataWithError:&v16];
        id v8 = v16;

        if (!v13)
        {

          if (a4)
          {
            id v8 = v8;
            BOOL v14 = 0;
            *a4 = v8;
          }
          else
          {
            BOOL v14 = 0;
          }
          goto LABEL_15;
        }
        ++v10;
        uint64_t v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }

  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (BOOL)validateExtensionKitMetadataWithError:(id *)a3
{
  id v12 = 0;
  id v5 = [(MIBundle *)self extensionKitBundlesWithError:&v12];
  id v6 = v12;
  uint64_t v7 = v6;
  if (v5)
  {
    id v11 = v6;
    BOOL v8 = [(MIBundle *)self _validateExtensions:v5 error:&v11];
    id v9 = v11;

    uint64_t v7 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a3 = v7;
  }
LABEL_7:

  return v8;
}

- (id)appExtensionBundlesWithError:(id *)a3
{
  return [(MIBundle *)self appExtensionBundlesPerformingPlatformValidation:3 withError:a3];
}

- (id)appExtensionBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v7 = objc_opt_new();
  BOOL v8 = [(MIBundle *)self pluginKitBundlesPerformingPlatformValidation:v5 withError:a4];
  if (v8)
  {
    id v9 = [(MIBundle *)self extensionKitBundlesPerformingPlatformValidation:v5 withError:a4];
    if (v9)
    {
      [v7 addObjectsFromArray:v8];
      [v7 addObjectsFromArray:v9];
      uint64_t v10 = (void *)[v7 copy];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)validateDriverKitExtensionMetadataWithError:(id *)a3
{
  id v12 = 0;
  uint64_t v5 = [(MIBundle *)self driverKitExtensionBundlesWithError:&v12];
  id v6 = v12;
  uint64_t v7 = v6;
  if (v5)
  {
    id v11 = v6;
    BOOL v8 = [(MIBundle *)self _validateExtensions:v5 error:&v11];
    id v9 = v11;

    uint64_t v7 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a3 = v7;
  }
LABEL_7:

  return v8;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  return 1;
}

+ (BOOL)bundleIsInDenyList:(id)a3
{
  id v3 = a3;
  if (bundleIsInDenyList__onceToken != -1) {
    dispatch_once(&bundleIsInDenyList__onceToken, &__block_literal_global_323);
  }
  int v4 = (void *)bundleIsInDenyList__denylist;
  uint64_t v5 = [v3 path];
  int v6 = [v4 containsObject:v5];

  if (v6 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    BOOL v8 = [v3 path];
    MOLogWrite();
  }
  return v6;
}

uint64_t __31__MIBundle_bundleIsInDenyList___block_invoke()
{
  bundleIsInDenyList__denylist = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F170F980];
  return MEMORY[0x1F41817F8]();
}

- (id)frameworkBundlesWithError:(id *)a3
{
  uint64_t v5 = [(MIBundle *)self frameworkBundles];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__MIBundle_frameworkBundlesWithError___block_invoke;
    v12[3] = &unk_1E62E6E10;
    v12[4] = self;
    uint64_t v7 = (void *)MEMORY[0x1C1878AA0](v12);
    id v11 = 0;
    BOOL v8 = +[MIExecutableBundle bundlesInParentBundle:self subDirectory:@"Frameworks" matchingPredicate:v7 error:&v11];
    id v6 = v11;
    if (!v8)
    {

      id v9 = 0;
      if (!a3) {
        goto LABEL_8;
      }
      goto LABEL_6;
    }
    [(MIBundle *)self setFrameworkBundles:v8];
  }
  id v9 = [(MIBundle *)self frameworkBundles];
  if (!a3) {
    goto LABEL_8;
  }
LABEL_6:
  if (!v9) {
    *a3 = v6;
  }
LABEL_8:

  return v9;
}

uint64_t __38__MIBundle_frameworkBundlesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 pathExtension];
  if ([v3 isEqualToString:@"framework"]) {
    uint64_t v4 = [(id)objc_opt_class() bundleIsInDenyList:v2] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)xpcServiceBundlesWithError:(id *)a3
{
  uint64_t v5 = [(MIBundle *)self xpcServiceBundles];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v10 = 0;
    uint64_t v7 = +[MIExecutableBundle bundlesInParentBundle:self subDirectory:@"XPCServices" matchingPredicate:&__block_literal_global_369 error:&v10];
    id v6 = v10;
    if (!v7)
    {
      BOOL v8 = 0;
      if (!a3) {
        goto LABEL_8;
      }
      goto LABEL_6;
    }
    [(MIBundle *)self setXpcServiceBundles:v7];
  }
  BOOL v8 = [(MIBundle *)self xpcServiceBundles];
  if (!a3) {
    goto LABEL_8;
  }
LABEL_6:
  if (!v8) {
    *a3 = v6;
  }
LABEL_8:

  return v8;
}

uint64_t __39__MIBundle_xpcServiceBundlesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"xpc"];

  return v3;
}

- (id)driverKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v7 = [(MIBundle *)self driverKitExtensionBundles];
  if (v7)
  {
    BOOL v8 = (void *)v7;
    id v9 = 0;
  }
  else
  {
    id v12 = 0;
    BOOL v8 = +[MIDriverKitBundle bundlesInParentBundle:self subDirectory:@"SystemExtensions" matchingPredicate:&__block_literal_global_374 error:&v12];
    id v9 = v12;
    if (!v8)
    {
      id v10 = 0;
      if (!a4) {
        goto LABEL_8;
      }
      goto LABEL_6;
    }
    [(MIBundle *)self setDriverKitExtensionBundles:v8];
  }
  id v10 = [(MIBundle *)self _filterExtensionBundles:v8 forValidationFlags:a3 & 0xFE];
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  if (!v10) {
    *a4 = v9;
  }
LABEL_8:

  return v10;
}

uint64_t __67__MIBundle_driverKitBundlesPerformingPlatformValidation_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"dext"];

  return v3;
}

- (id)driverKitExtensionBundlesWithError:(id *)a3
{
  return [(MIBundle *)self driverKitBundlesPerformingPlatformValidation:2 withError:a3];
}

- (id)thisBundleAndAllContainedBundlesWithError:(id *)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  [v5 addObject:self];
  if ([(MIBundle *)self mayContainAppExtensions])
  {
    id v70 = 0;
    id v6 = [(MIBundle *)self appExtensionBundlesPerformingPlatformValidation:0 withError:&v70];
    id v7 = v70;
    if (!v6)
    {
LABEL_52:
      id v36 = 0;
      goto LABEL_53;
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v67;
      while (2)
      {
        uint64_t v12 = 0;
        int v13 = v7;
        do
        {
          if (*(void *)v67 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v14 = *(void **)(*((void *)&v66 + 1) + 8 * v12);
          id v65 = v13;
          id v15 = [v14 thisBundleAndAllContainedBundlesWithError:&v65];
          id v7 = v65;

          if (!v15)
          {

            goto LABEL_52;
          }
          [v5 unionSet:v15];

          ++v12;
          int v13 = v7;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v66 objects:v74 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v16 = v7;
  }
  else
  {
    id v16 = 0;
  }
  if ([(MIBundle *)self isAppTypeBundle])
  {
    id v64 = v16;
    long long v17 = [(MIBundle *)self xpcServiceBundlesWithError:&v64];
    id v18 = v64;

    if (!v17)
    {
LABEL_49:

      id v36 = 0;
      id v7 = v18;
      if (!a3) {
        goto LABEL_56;
      }
      goto LABEL_54;
    }
    uint64_t v46 = a3;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v73 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v61;
      while (2)
      {
        uint64_t v23 = 0;
        id v24 = v18;
        do
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(v19);
          }
          id v25 = *(void **)(*((void *)&v60 + 1) + 8 * v23);
          id v59 = v24;
          id v26 = objc_msgSend(v25, "thisBundleAndAllContainedBundlesWithError:", &v59, v46);
          id v18 = v59;

          if (!v26)
          {

            a3 = v46;
            goto LABEL_49;
          }
          [v5 unionSet:v26];

          ++v23;
          id v24 = v18;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v73 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    id v58 = v18;
    long long v27 = [(MIBundle *)self driverKitBundlesPerformingPlatformValidation:0 withError:&v58];
    id v7 = v58;

    if (!v27)
    {
LABEL_60:

      id v36 = 0;
      a3 = v46;
      if (!v46) {
        goto LABEL_56;
      }
      goto LABEL_54;
    }
    long long v57 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v72 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v55;
      while (2)
      {
        uint64_t v32 = 0;
        uint64_t v33 = v7;
        do
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = *(void **)(*((void *)&v54 + 1) + 8 * v32);
          id v53 = v33;
          uint64_t v35 = objc_msgSend(v34, "thisBundleAndAllContainedBundlesWithError:", &v53, v46);
          id v7 = v53;

          if (!v35)
          {

            goto LABEL_60;
          }
          [v5 unionSet:v35];

          ++v32;
          uint64_t v33 = v7;
        }
        while (v30 != v32);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v72 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    id v16 = v7;
    a3 = v46;
  }
  if (![(MIBundle *)self mayContainFrameworks])
  {
    id v7 = v16;
    goto LABEL_46;
  }
  id v52 = v16;
  id v36 = [(MIBundle *)self frameworkBundlesWithError:&v52];
  id v7 = v52;

  if (v36)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v37 = v36;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v48 objects:v71 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v49;
      while (2)
      {
        uint64_t v41 = 0;
        id v42 = v7;
        do
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v43 = *(void **)(*((void *)&v48 + 1) + 8 * v41);
          id v47 = v42;
          long long v44 = [v43 thisBundleAndAllContainedBundlesWithError:&v47];
          id v7 = v47;

          if (!v44)
          {

            goto LABEL_52;
          }
          [v5 unionSet:v44];

          ++v41;
          id v42 = v7;
        }
        while (v39 != v41);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v48 objects:v71 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

LABEL_46:
    id v36 = (void *)[v5 copy];
    if (!a3) {
      goto LABEL_56;
    }
    goto LABEL_54;
  }
LABEL_53:
  if (!a3) {
    goto LABEL_56;
  }
LABEL_54:
  if (!v36) {
    *a3 = v7;
  }
LABEL_56:

  return v36;
}

- (NSURL)bundleParentDirectoryURL
{
  return self->_bundleParentDirectoryURL;
}

- (NSString)relativePath
{
  uint64_t v3 = [(MIBundle *)self parentBundle];
  uint64_t v4 = [v3 relativePath];

  if (v4)
  {
    uint64_t v5 = [(MIBundle *)self bundleParentSubdirectory];
    id v6 = [v4 stringByAppendingPathComponent:v5];
    id v7 = [(MIBundle *)self bundleURL];
    id v8 = [v7 lastPathComponent];
    uint64_t v9 = [v6 stringByAppendingPathComponent:v8];
  }
  else
  {
    uint64_t v5 = [(MIBundle *)self bundleURL];
    uint64_t v9 = [v5 lastPathComponent];
  }

  return (NSString *)v9;
}

- (NSString)displayName
{
  uint64_t v3 = [(MIBundle *)self infoPlistSubset];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CC48]];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6 || ![v6 length])
  {
    id v7 = [(MIBundle *)self infoPlistSubset];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1D008]];
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10 && [v10 length])
    {
      id v6 = v10;
    }
    else
    {
      uint64_t v11 = [(MIBundle *)self bundleURL];
      id v6 = [v11 lastPathComponent];
    }
  }
  return (NSString *)v6;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_bundleParentDirectoryURL, a3);
  id v6 = [(MIBundle *)self bundleURL];
  id v7 = [(MIBundle *)self pluginKitBundles];
  id v8 = v7;
  if (v7)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v54;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v54 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * v12++) setBundleParentDirectoryURL:v6];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v10);
    }
  }
  int v13 = [(MIBundle *)self extensionKitBundles];
  BOOL v14 = v13;
  if (v13)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v50;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * v18++) setBundleParentDirectoryURL:v6];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v60 count:16];
      }
      while (v16);
    }
  }
  id v19 = [(MIBundle *)self frameworkBundles];
  uint64_t v20 = v19;
  if (v19)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * v24++) setBundleParentDirectoryURL:v6];
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v59 count:16];
      }
      while (v22);
    }
  }
  id v25 = [(MIBundle *)self xpcServiceBundles];
  id v26 = v25;
  if (v25)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v58 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * v30++) setBundleParentDirectoryURL:v6];
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v58 count:16];
      }
      while (v28);
    }
  }
  uint64_t v31 = [(MIBundle *)self driverKitExtensionBundles];
  uint64_t v32 = v31;
  if (v31)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v38;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v38 != v35) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * v36++) setBundleParentDirectoryURL:v6];
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v37 objects:v57 count:16];
      }
      while (v34);
    }
  }
}

- (NSURL)bundleURL
{
  uint64_t v3 = [(MIBundle *)self bundleParentSubdirectory];

  uint64_t v4 = [(MIBundle *)self bundleParentDirectoryURL];
  if (v3)
  {
    id v5 = [(MIBundle *)self bundleParentSubdirectory];
    id v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:1];

    id v7 = [(MIBundle *)self bundleName];
    id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:1];
    uint64_t v4 = v6;
  }
  else
  {
    id v7 = [(MIBundle *)self bundleName];
    id v8 = [v4 URLByAppendingPathComponent:v7 isDirectory:1];
  }

  return (NSURL *)v8;
}

+ (id)bundleForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBundleURL:v5 error:a4];

  return v6;
}

- (BOOL)needsDataContainer
{
  return 0;
}

- (NSString)minimumOSVersion
{
  uint64_t v3 = [(MIBundle *)self infoPlistSubset];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"MinimumProductVersion"];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6) {
    id v7 = v6;
  }
  id v8 = [(MIBundle *)self infoPlistSubset];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"MinimumOSVersion"];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  id v12 = v6;
  if (v11)
  {
    id v12 = v11;
  }
  id v13 = v12;

  return (NSString *)v13;
}

- (NSArray)deviceFamilies
{
  id v2 = [(MIBundle *)self infoPlistSubset];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"UIDeviceFamily"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (BOOL)isWatchApp
{
  return [(MIBundle *)self isCompatibleWithDeviceFamily:4];
}

- (BOOL)isLaunchProhibited
{
  id v2 = [(MIBundle *)self infoPlistSubset];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"LSApplicationLaunchProhibited"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [v3 BOOLValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v5 = 0;
      goto LABEL_7;
    }
    char v4 = [v3 isEqualToString:@"YES"];
  }
  BOOL v5 = v4;
LABEL_7:

  return v5;
}

- (BOOL)isAppTypeBundle
{
  int v2 = [(MIBundle *)self bundleType];
  return v2 == 9 || (v2 - 1) < 5;
}

- (BOOL)mayHaveExecutableProgram
{
  int v2 = [(MIBundle *)self bundleType];
  BOOL v4 = (v2 & 0xFE) == 8 || (v2 - 1) < 6;
  return v2 == 11 || v4;
}

- (BOOL)getIsBuiltForiOSPlatform:(BOOL *)a3 error:(id *)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F170F9F8, a4, &unk_1F170FA10, 0);
  id v7 = [(MIBundle *)self deviceFamilies];
  char v8 = MIIsCompatibleWithAtLeastOneDeviceFamily(v7, v6, 1);

  if (a3) {
    *a3 = v8;
  }

  return 1;
}

- (BOOL)isCompatibleWithDeviceFamily:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = [(MIBundle *)self deviceFamilies];
  LOBYTE(v3) = MIIsCompatibleWithDeviceFamily(v4, v3);

  return v3;
}

- (BOOL)isApplicableToCurrentDeviceFamilyWithError:(id *)a3
{
  BOOL v4 = [(MIBundle *)self deviceFamilies];
  LOBYTE(a3) = MIIsApplicableToCurrentDeviceFamilyWithError(v4, a3);

  return (char)a3;
}

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  id v7 = (void *)MGCopyAnswer();
  if (v7)
  {
    id v8 = 0;
    if (a3) {
      *a3 = 1;
    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIBundle currentOSVersionForValidationUsingPlatform:withError:]", 1527, @"MIInstallerErrorDomain", 4, 0, 0, @"Could not get the product version from MobileGestalt.", v6, v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
  }

  return v7;
}

- (BOOL)isApplicableToCurrentOSVersionWithError:(id *)a3
{
  id v12 = 0;
  uint64_t v13 = 0;
  BOOL v5 = [(MIBundle *)self currentOSVersionForValidationUsingPlatform:&v13 withError:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = [(MIBundle *)self minimumOSVersion];
    id v11 = v6;
    BOOL v8 = [(MIBundle *)self _isMinimumOSVersion:v7 applicableToOSVersion:v5 requiredOS:v13 error:&v11];
    id v9 = v11;

    id v6 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a3 = v6;
  }
LABEL_7:

  return v8;
}

- (BOOL)isApplicableToOSVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MIBundle *)self minimumOSVersion];
  LOBYTE(a4) = [(MIBundle *)self isMinimumOSVersion:v7 applicableToOSVersion:v6 error:a4];

  return (char)a4;
}

- (BOOL)isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 error:(id *)a5
{
  return [(MIBundle *)self _isMinimumOSVersion:a3 applicableToOSVersion:a4 requiredOS:1 error:a5];
}

- (BOOL)_isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 requiredOS:(unint64_t)a5 error:(id *)a6
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v10 && [v11 compare:v10 options:64] == -1)
  {
    v21[0] = @"LegacyErrorString";
    v21[1] = @"RequiredOSVersion";
    v22[0] = @"DeviceOSVersionTooLow";
    v22[1] = v10;
    v21[2] = @"RequiredOS";
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a5];
    v22[2] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    uint64_t v18 = [(MIBundle *)self bundleURL];
    id v19 = [v18 path];
    _CreateError((uint64_t)"-[MIBundle _isMinimumOSVersion:applicableToOSVersion:requiredOS:error:]", 1639, @"MIInstallerErrorDomain", 9, 0, v17, @"The system version is lower than the minimum OS version specified for bundle at %@. Have %@; need %@",
      v20,
      (uint64_t)v19);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      id v13 = v13;
      BOOL v14 = 0;
      *a6 = v13;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    id v13 = 0;
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)isApplicableToOSVersionEarlierThan:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MIBundle *)self minimumOSVersion];
  if (v5) {
    BOOL v6 = [v4 compare:v5 options:64] == 1;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)isApplicableToCurrentDeviceCapabilitiesWithError:(id *)a3
{
  id v4 = [(MIBundle *)self infoPlistSubset];
  BOOL v5 = [v4 objectForKeyedSubscript:@"UIRequiredDeviceCapabilities"];

  if (!v5)
  {
    id v7 = 0;
    id v8 = 0;
    char v12 = 1;
    goto LABEL_14;
  }
  BOOL v6 = +[MICapabilitiesManager defaultManager];
  id v16 = 0;
  id v7 = [v6 checkCapabilities:v5 withOptions:0 error:&v16];
  id v8 = v16;

  if (!v7)
  {
    char v12 = 0;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v9 = [v7 objectForKeyedSubscript:@"CapabilitiesMatch"];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  char v12 = [v11 BOOLValue];
  if ((v12 & 1) == 0)
  {
    uint64_t v14 = _CreateError((uint64_t)"-[MIBundle isApplicableToCurrentDeviceCapabilitiesWithError:]", 1686, @"MIInstallerErrorDomain", 67, 0, 0, @"Device capabilities do not match requirements: %@", v13, (uint64_t)v7);

    id v8 = (id)v14;
  }

  if (a3)
  {
LABEL_12:
    if ((v12 & 1) == 0)
    {
      id v8 = v8;
      char v12 = 0;
      *a3 = v8;
    }
  }
LABEL_14:

  return v12;
}

- (NSArray)supportedDevices
{
  uint64_t v3 = [(MIBundle *)self infoPlistSubset];
  id v4 = [v3 objectForKeyedSubscript:@"UISupportedDevices"];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6)
  {
    id v7 = [(MIBundle *)self infoPlistSubset];
    id v8 = [v7 objectForKeyedSubscript:@"SupportedDevices"];
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  return (NSArray *)v6;
}

- (BOOL)thinningMatchesCurrentDeviceWithError:(id *)a3
{
  id v5 = [(MIBundle *)self supportedDevices];
  if (!v5) {
    goto LABEL_4;
  }
  int v6 = [(MIBundle *)self bundleType];
  if ((v6 - 1) >= 5 && v6 != 9)
  {
    _CreateAndLogError((uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]", 1724, @"MIInstallerErrorDomain", 4, 0, 0, @"Unexpectedly asked to validate thinning on a non-app bundle %@", v7, (uint64_t)self);
LABEL_14:
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
    goto LABEL_15;
  }
  id v8 = +[MIDaemonConfiguration sharedInstance];
  char v9 = [v8 skipThinningCheck];

  if (v9)
  {
LABEL_4:
    id v10 = 0;
    id v11 = 0;
LABEL_5:
    BOOL v12 = 1;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((MIArrayContainsOnlyClass(v5) & 1) == 0)
  {
    _CreateAndLogError((uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]", 1734, @"MIInstallerErrorDomain", 87, 0, &unk_1F170EB20, @"The value of the UISupportedDevices key in this app's Info.plist key must contain only string values.", v14, v21);
    goto LABEL_14;
  }
  id v11 = (void *)MGCopyAnswer();
  if (!v11)
  {
    _CreateAndLogError((uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]", 1744, @"MIInstallerErrorDomain", 4, 0, 0, @"MGCopyAnswer for kMGOCompatibleAppVariants returned NULL", v15, v21);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    BOOL v12 = 0;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
  id v16 = [v5 firstObjectCommonWithArray:v11];

  if (v16)
  {
    id v10 = 0;
    goto LABEL_5;
  }
  uint64_t v17 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v18 = [v17 alternateThinningModelIdentifier];

  if (v18 && [v5 containsObject:v18])
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
      MOLogWrite();
    }
    id v10 = 0;
    BOOL v12 = 1;
  }
  else
  {
    id v19 = [v5 componentsJoinedByString:@", "];
    uint64_t v22 = [v11 componentsJoinedByString:@", "];
    _CreateAndLogError((uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]", 1759, @"MIInstallerErrorDomain", 86, 0, &unk_1F170EB48, @"This app is not compatibile with this device. This app specifies a value for UISupportedDevices in its Info.plist as [%@], but none of the identifiers in this device's compatibility list are present in this app's supported devices. This device is compatible with [%@].", v20, (uint64_t)v19);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v12 = 0;
  }

  if (a3)
  {
LABEL_16:
    if (!v12)
    {
      id v10 = v10;
      BOOL v12 = 0;
      *a3 = v10;
    }
  }
LABEL_6:

  return v12;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [(MIBundle *)self bundleURL];
  uint64_t v7 = [v6 path];
  id v8 = [(MIBundle *)self identifier];
  char v9 = [(MIBundle *)self bundleTypeDescription];
  id v10 = [v3 stringWithFormat:@"<%@ : path = %@ identifier = %@ type = %@>", v5, v7, v8, v9];

  return v10;
}

- (NSSet)siriIntents
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v32 = 0;
  uint64_t v3 = [(MIBundle *)self pluginKitBundlesWithError:&v32];
  id v4 = v32;
  id v5 = v4;
  if (v3)
  {
    id v26 = v4;
    uint64_t v27 = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          BOOL v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v12 isSiriIntentsExtension])
          {
            if (!v9) {
              char v9 = objc_opt_new();
            }
            uint64_t v13 = [v12 extensionAttributes];
            uint64_t v14 = v13;
            if (v13)
            {
              uint64_t v15 = [v13 objectForKeyedSubscript:@"IntentsSupported"];
              if (v15) {
                [v9 addObjectsFromArray:v15];
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
    }

    id v5 = v26;
    uint64_t v3 = v27;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v22 = self;
      id v24 = v4;
      MOLogWrite();
    }
    char v9 = 0;
  }
  id v16 = [(MIBundle *)self infoPlistSubset];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"INIntentsSupported"];
  objc_opt_class();
  id v18 = v17;
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  if (v19)
  {
    objc_opt_class();
    if (MIArrayContainsOnlyClass(v19))
    {
      if (!v9) {
        char v9 = objc_opt_new();
      }
      [v9 addObjectsFromArray:v19];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v23 = self;
      id v25 = v19;
      MOLogWrite();
    }
  }
  uint64_t v20 = objc_msgSend(v9, "copy", v23, v25);

  return (NSSet *)v20;
}

- (BOOL)_validateAppNSPrivacyTrackingDomainsWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [(MIBundle *)self infoPlistSubset];
  id v5 = [v4 objectForKeyedSubscript:@"NSPrivacyTrackingDomains"];

  if (!v5)
  {
LABEL_12:
    id v11 = 0;
    BOOL v12 = 1;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      _CreateAndLogError((uint64_t)"-[MIBundle _validateAppNSPrivacyTrackingDomainsWithError:]", 1835, @"MIInstallerErrorDomain", 193, 0, 0, @"The \"NSPrivacyTrackingDomains\" key in the app's Info.plist must have an array value containing strings. An entry was found in that array of non-string type: %@", v18, (uint64_t)v17);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (a3) {
        goto LABEL_14;
      }
      goto LABEL_16;
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  _CreateAndLogError((uint64_t)"-[MIBundle _validateAppNSPrivacyTrackingDomainsWithError:]", 1828, @"MIInstallerErrorDomain", 193, 0, 0, @"The \"NSPrivacyTrackingDomains\" key in the app's Info.plist must have an array value. An entry was found of non-array type %@.", v15, (uint64_t)v14);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
LABEL_14:
  id v11 = v11;
  BOOL v12 = 0;
  *a3 = v11;
LABEL_17:

  return v12;
}

- (BOOL)validateAppMetadataWithError:(id *)a3
{
  id v5 = [(MIBundle *)self infoPlistSubset];
  id v6 = [v5 objectForKeyedSubscript:@"INAlternativeAppNames"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if ((unint64_t)[v8 count] >= 4)
  {
    uint64_t v9 = [(MIBundle *)self bundleURL];
    uint64_t v10 = [v9 path];
    _CreateAndLogError((uint64_t)"-[MIBundle validateAppMetadataWithError:]", 1861, @"MIInstallerErrorDomain", 132, 0, &unk_1F170EB70, @"Bundle at path %@ has %lu %@ in its Info.plist, maximum of %lu allowed", v11, (uint64_t)v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  uint64_t v13 = [(MIBundle *)self infoPlistSubset];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"ITSWatchOnlyContainer"];

  if (v14)
  {
    _CreateAndLogError((uint64_t)"-[MIBundle validateAppMetadataWithError:]", 1866, @"MIInstallerErrorDomain", 137, 0, &unk_1F170EB98, @"This app has the %@ key set in its Info.plist, which identifies it as a shell app surrounding a Watch-only app; these are not installable.",
      v15,
      @"ITSWatchOnlyContainer");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    BOOL v16 = 0;
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v18 = 0;
  BOOL v16 = [(MIBundle *)self _validateAppNSPrivacyTrackingDomainsWithError:&v18];
  id v12 = v18;
  if (!a3) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v16) {
    *a3 = v12;
  }
LABEL_11:

  return v16;
}

- (NSString)sdkBuildVersion
{
  int v2 = [(MIBundle *)self infoPlistSubset];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"DTSDKBuild"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)sdkBuildVersionIsAtLeast:(id)a3
{
  id v4 = a3;
  id v5 = [(MIBundle *)self sdkBuildVersion];
  id v6 = v5;
  if (v5) {
    BOOL v7 = [v5 compare:v4 options:64] != -1;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)bundleParentSubdirectory
{
  return self->_bundleParentSubdirectory;
}

- (MIBundle)parentBundle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentBundle);
  return (MIBundle *)WeakRetained;
}

- (NSArray)pluginKitBundles
{
  return self->_pluginKitBundles;
}

- (void)setPluginKitBundles:(id)a3
{
}

- (NSArray)extensionKitBundles
{
  return self->_extensionKitBundles;
}

- (void)setExtensionKitBundles:(id)a3
{
}

- (NSArray)frameworkBundles
{
  return self->_frameworkBundles;
}

- (void)setFrameworkBundles:(id)a3
{
}

- (NSArray)xpcServiceBundles
{
  return self->_xpcServiceBundles;
}

- (void)setXpcServiceBundles:(id)a3
{
}

- (NSArray)driverKitExtensionBundles
{
  return self->_driverKitExtensionBundles;
}

- (void)setDriverKitExtensionBundles:(id)a3
{
}

- (BOOL)isPlaceholderStatusValid
{
  return self->_isPlaceholderStatusValid;
}

- (void)setIsPlaceholderStatusValid:(BOOL)a3
{
  self->_isPlaceholderStatusValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverKitExtensionBundles, 0);
  objc_storeStrong((id *)&self->_xpcServiceBundles, 0);
  objc_storeStrong((id *)&self->_frameworkBundles, 0);
  objc_storeStrong((id *)&self->_extensionKitBundles, 0);
  objc_storeStrong((id *)&self->_pluginKitBundles, 0);
  objc_destroyWeak((id *)&self->_parentBundle);
  objc_storeStrong((id *)&self->_bundleParentSubdirectory, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_bundleParentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_infoPlistSubset, 0);
}

@end