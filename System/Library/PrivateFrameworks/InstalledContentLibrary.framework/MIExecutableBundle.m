@interface MIExecutableBundle
+ (BOOL)isGrandfatheredNonContainerizedForSigningInfo:(id)a3;
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)_hasNoConflictWithSystemAppsForSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_hasNonContainerizingEntitlement:(id)a3 checkSeatbeltProfiles:(BOOL)a4;
- (BOOL)_hasResource:(id)a3 withExtension:(id)a4;
- (BOOL)_validateWithError:(id *)a3;
- (BOOL)allowsAppleAppExtensionsNotInExtensionCache;
- (BOOL)executableExistsWithError:(id *)a3;
- (BOOL)getSinfDataType:(unsigned int *)a3 withError:(id *)a4;
- (BOOL)hasExecutableSliceForCPUType:(int)a3 subtype:(int)a4 error:(id *)a5;
- (BOOL)hasExecutableSliceForPlatform:(unsigned int)a3 error:(id *)a4;
- (BOOL)hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:(id)a3 forPersona:(id)a4 error:(id *)a5;
- (BOOL)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)hasSinf;
- (BOOL)hasWatchCustomNotification;
- (BOOL)hasWatchGlance;
- (BOOL)isExtensionBasedWatchKitApp;
- (BOOL)isExtensionlessWatchKitApp;
- (BOOL)isWatchOnlyApp;
- (BOOL)makeAndSetNewInstallationIdentityWithError:(id *)a3;
- (BOOL)makeExecutableWithError:(id *)a3;
- (BOOL)minimumWatchOSVersionIsPreV6;
- (BOOL)needsDataContainer;
- (BOOL)needsSinf;
- (BOOL)onlyHasExecutableSlicesForPlatform:(unsigned int)a3 error:(id *)a4;
- (BOOL)replicateRootSinfWithError:(id *)a3;
- (BOOL)setLaunchWarningData:(id)a3 withError:(id *)a4;
- (BOOL)setSinfDataType:(unsigned int)a3 withError:(id *)a4;
- (BOOL)sinfDataTypeIsSet;
- (BOOL)transferInstallationIdentityFromBundle:(id)a3 error:(id *)a4;
- (BOOL)updateMCMWithCodeSigningInfoAsAdvanceCopy:(BOOL)a3 withError:(id *)a4;
- (BOOL)updateSinfWithData:(id)a3 error:(id *)a4;
- (BOOL)validatePluginKitMetadataWithError:(id *)a3;
- (BOOL)validateSinfWithError:(id *)a3;
- (BOOL)watchKitAppRunsIndependentlyOfCompanion;
- (Class)dataContainerClass;
- (MIBundleContainer)bundleContainer;
- (MICodeSigningInfo)codeSigningInfo;
- (MIEmbeddedWatchBundle)wk2AppBundle;
- (MIExecutableBundle)initWithBundleInContainer:(id)a3 withExtension:(id)a4 error:(id *)a5;
- (MIInstallationIdentity)installationIdentity;
- (MIPluginKitBundle)watchKitPlugin;
- (NSArray)counterpartIdentifiers;
- (NSArray)executableImageSlices;
- (NSError)codeSigningInfoError;
- (NSError)wk2AppBundleError;
- (NSString)companionAppIdentifier;
- (NSString)executableName;
- (NSString)watchKitAppExecutableHash;
- (NSURL)executableURL;
- (NSURL)relativeExecutablePath;
- (NSURL)rootSinfURL;
- (NSURL)rootSupfURL;
- (NSURL)rootSuppURL;
- (__CFBundle)cfBundle;
- (id)_codeSigningInfoFromMCM;
- (id)_dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 checkIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8;
- (id)_discoverWatchAppBundleAsPlaceholder:(BOOL)a3 error:(id *)a4;
- (id)_nameListForPlatformSet:(id)a3;
- (id)bundleSignatureVersionWithError:(id *)a3;
- (id)codeSigningInfoByValidatingResources:(BOOL)a3 performingOnlineAuthorization:(BOOL)a4 ignoringCachedSigningInfo:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 skippingProfileIDValidation:(BOOL)a7 error:(id *)a8;
- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
- (id)dataContainerForPersona:(id)a3 error:(id *)a4;
- (id)enumerateDylibsWithBlock:(id)a3;
- (id)executableImageSlicesWithError:(id *)a3;
- (id)executablePlatformsWithError:(id *)a3;
- (id)fairPlaySinfInfoWithError:(id *)a3;
- (id)initForTesting;
- (id)installationIdentitySettingIfNotSet:(BOOL)a3 withError:(id *)a4;
- (id)lsInstallTypeWithError:(id *)a3;
- (id)updateAndValidateSinf:(id)a3 error:(id *)a4;
- (id)updateAndValidateSinf:(id)a3 withRollback:(BOOL)a4 error:(id *)a5;
- (id)watchKitAppBundleForWKVersionOrEarlier:(unsigned __int8)a3 error:(id *)a4;
- (id)watchKitAppExecutableHashWithError:(id *)a3;
- (id)watchKitPluginWithError:(id *)a3;
- (id)watchKitV2AppBundleWithError:(id *)a3;
- (int)_installEmbeddedProvisioningProfileAtURL:(id)a3 withProgress:(id)a4;
- (int)dataProtectionClass;
- (int)installEmbeddedProvisioningProfileWithProgress:(id)a3;
- (int)installMacStyleEmbeddedProvisioningProfileWithProgress:(id)a3;
- (unint64_t)codeSignatureVerificationState;
- (unint64_t)compatibilityState;
- (unint64_t)dataContainerContentClass;
- (unint64_t)estimatedMemoryUsageToValidate;
- (unint64_t)lsInstallType;
- (unsigned)maxLinkedSDKVersion;
- (unsigned)sinfDataType;
- (unsigned)watchKitVersionWithError:(id *)a3;
- (void)bestEffortRollbackSinfData:(id)a3;
- (void)dealloc;
- (void)removeSinf;
- (void)setBundleContainer:(id)a3;
- (void)setBundleParentDirectoryURL:(id)a3;
- (void)setCodeSigningInfo:(id)a3;
- (void)setCodeSigningInfoError:(id)a3;
- (void)setExecutableImageSlices:(id)a3;
- (void)setInstallationIdentity:(id)a3;
- (void)setLsInstallType:(unint64_t)a3;
- (void)setSinfDataType:(unsigned int)a3;
- (void)setSinfDataTypeIsSet:(BOOL)a3;
- (void)setWatchKitAppExecutableHash:(id)a3;
- (void)setWatchKitPlugin:(id)a3;
- (void)setWk2AppBundle:(id)a3;
- (void)setWk2AppBundleError:(id)a3;
@end

@implementation MIExecutableBundle

- (void)dealloc
{
  cfBundle = self->_cfBundle;
  if (cfBundle)
  {
    CFRelease(cfBundle);
    self->_cfBundle = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MIExecutableBundle;
  [(MIExecutableBundle *)&v4 dealloc];
}

- (BOOL)_validateWithError:(id *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MIExecutableBundle;
  id v24 = 0;
  unsigned __int8 v5 = [(MIBundle *)&v23 _validateWithError:&v24];
  id v6 = v24;
  id v7 = v6;
  if (v5)
  {
    v8 = [(MIBundle *)self infoPlistSubset];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF0]];
    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (!v11) {
      goto LABEL_11;
    }
    if (![v11 length]) {
      goto LABEL_11;
    }
    v13 = +[MIFileManager defaultManager];
    v14 = [(MIBundle *)self bundleURL];
    v15 = [v14 URLByAppendingPathComponent:v11 isDirectory:0];
    v16 = [(MIBundle *)self bundleURL];
    v17 = [v13 realPathForURL:v15 ifChildOfURL:v16];

    if (v17)
    {
      BOOL v12 = 1;
    }
    else
    {
LABEL_11:
      v18 = [(MIBundle *)self bundleURL];
      v19 = [v18 path];
      v21 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle _validateWithError:]", 108, @"MIInstallerErrorDomain", 11, 0, &unk_1F170F188, @"Bundle at path %@ has missing or invalid CFBundleExecutable in its Info.plist", v20, (uint64_t)v19);

      if (a3)
      {
        id v7 = v21;
        BOOL v12 = 0;
        *a3 = v7;
      }
      else
      {
        BOOL v12 = 0;
        id v7 = v21;
      }
    }
  }
  else if (a3)
  {
    id v7 = v6;
    BOOL v12 = 0;
    *a3 = v7;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)MIExecutableBundle;
  return [(MIBundle *)&v3 initForTesting];
}

- (MIExecutableBundle)initWithBundleInContainer:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 containerURL];
  v13.receiver = self;
  v13.super_class = (Class)MIExecutableBundle;
  id v11 = [(MIBundle *)&v13 initWithBundleInDirectory:v10 withExtension:v9 error:a5];

  if (v11) {
    objc_storeWeak((id *)&v11->_bundleContainer, v8);
  }

  return v11;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MIExecutableBundle;
  id v6 = objc_msgSendSuper2(&v8, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a4, a5, a6);
  return v6;
}

- (BOOL)allowsAppleAppExtensionsNotInExtensionCache
{
  v3.receiver = self;
  v3.super_class = (Class)MIExecutableBundle;
  return [(MIBundle *)&v3 allowsAppleAppExtensionsNotInExtensionCache];
}

- (NSString)executableName
{
  v2 = [(MIBundle *)self infoPlistSubset];
  objc_super v3 = v2;
  if (v2)
  {
    objc_super v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF0]];
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSURL)executableURL
{
  objc_super v3 = [(MIBundle *)self bundleURL];
  objc_super v4 = [(MIExecutableBundle *)self executableName];
  id v5 = [v3 URLByAppendingPathComponent:v4 isDirectory:0];

  return (NSURL *)v5;
}

- (NSURL)relativeExecutablePath
{
  objc_super v3 = [(MIBundle *)self relativePath];
  objc_super v4 = [(MIExecutableBundle *)self executableName];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSURL *)v5;
}

- (__CFBundle)cfBundle
{
  result = self->_cfBundle;
  if (!result)
  {
    objc_super v4 = [(MIBundle *)self bundleURL];
    self->_cfBundle = (__CFBundle *)_CFBundleCreateUnique();

    return self->_cfBundle;
  }
  return result;
}

- (id)executableImageSlicesWithError:(id *)a3
{
  if ([(MIBundle *)self isPlaceholder])
  {
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle executableImageSlicesWithError:]", 198, @"MIInstallerErrorDomain", 4, 0, 0, @"This bundle is a placeholder and so does not have an executable, so executable image slices are not available.", v5, v17);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = 0;
    goto LABEL_3;
  }
  p_executableImageSlices = &self->_executableImageSlices;
  executableImageSlices = self->_executableImageSlices;
  if (executableImageSlices)
  {
    id v11 = executableImageSlices;
    goto LABEL_12;
  }
  id v12 = [(MIExecutableBundle *)self executableURL];
  objc_super v13 = (const char *)[v12 fileSystemRepresentation];

  id v18 = 0;
  MIMachOFileImageSlices(v13, &v18);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v18;
  if (!v7) {
    goto LABEL_3;
  }
  if (![v7 count])
  {
    uint64_t v16 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle executableImageSlicesWithError:]", 213, @"MIInstallerErrorDomain", 73, 0, 0, @"Executable at %s contained no image slices", v14, (uint64_t)v13);

    id v6 = (id)v16;
LABEL_3:
    if (a3)
    {
      id v6 = v6;
      objc_super v8 = 0;
      *a3 = v6;
    }
    else
    {
      objc_super v8 = 0;
    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)p_executableImageSlices, v7);
  id v7 = v7;
  objc_super v8 = v7;
LABEL_11:
  id v11 = v8;

LABEL_12:
  return v11;
}

- (NSArray)executableImageSlices
{
  return (NSArray *)[(MIExecutableBundle *)self executableImageSlicesWithError:0];
}

- (id)executablePlatformsWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  id v20 = 0;
  id v6 = [(MIExecutableBundle *)self executableImageSlicesWithError:&v20];
  id v7 = v20;
  if (!v6)
  {
    uint64_t v14 = 0;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "platform", (void)v16));
        [v5 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v5 copy];
  if (a3)
  {
LABEL_12:
    if (!v14) {
      *a3 = v7;
    }
  }
LABEL_14:

  return v14;
}

- (BOOL)hasExecutableSliceForPlatform:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v18 = 0;
  id v7 = [(MIExecutableBundle *)self executablePlatformsWithError:&v18];
  id v8 = v18;
  if (v7)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v5];
    char v10 = [v7 containsObject:v9];

    if (v10)
    {
      BOOL v11 = 1;
      goto LABEL_8;
    }
    id v12 = MIMachOStringForPlatform(v5);
    objc_super v13 = [(MIExecutableBundle *)self executableURL];
    uint64_t v14 = [v13 path];
    uint64_t v16 = _CreateError((uint64_t)"-[MIExecutableBundle hasExecutableSliceForPlatform:error:]", 269, @"MIInstallerErrorDomain", 198, 0, 0, @"Executable at %@ did not contain a slice built for platform %@.", v15, (uint64_t)v14);

    id v8 = (id)v16;
  }
  if (a4)
  {
    id v8 = v8;
    BOOL v11 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_8:

  return v11;
}

- (id)_nameListForPlatformSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = MIMachOStringForPlatform(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unsignedIntValue", (void)v14));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  BOOL v11 = [v4 allObjects];
  id v12 = [v11 componentsJoinedByString:@", "];

  return v12;
}

- (BOOL)onlyHasExecutableSlicesForPlatform:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = MIMachOStringForPlatform(*(uint64_t *)&a3);
  id v25 = 0;
  uint64_t v8 = [(MIExecutableBundle *)self executablePlatformsWithError:&v25];
  id v9 = v25;
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v10 = [v8 count];
  BOOL v11 = [NSNumber numberWithUnsignedInt:v5];
  int v12 = [v8 containsObject:v11];

  if (v10 == 1)
  {
    if (v12)
    {
      BOOL v13 = 1;
      goto LABEL_14;
    }
    id v20 = [v8 allObjects];
    long long v14 = [v20 firstObject];

    long long v16 = MIMachOStringForPlatform([v14 unsignedIntValue]);
    long long v17 = [(MIExecutableBundle *)self executableURL];
    uint64_t v18 = [v17 path];
    _CreateError((uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]", 325, @"MIInstallerErrorDomain", 198, 0, 0, @"Executable at %@ did not contain a slice built for platform %@ (found only platform %@).", v21, v18);
  }
  else
  {
    if (!v12)
    {
      long long v14 = [(MIExecutableBundle *)self _nameListForPlatformSet:v8];
      long long v16 = [(MIExecutableBundle *)self executableURL];
      long long v17 = [v16 path];
      uint64_t v22 = _CreateError((uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]", 318, @"MIInstallerErrorDomain", 198, 0, 0, @"Expected to find one or more platform slices for %@ in executable at %@ but only found other platforms: %@", v23, (uint64_t)v7);
      goto LABEL_10;
    }
    long long v14 = (void *)[v8 mutableCopy];
    long long v15 = [NSNumber numberWithUnsignedInt:v5];
    [v14 removeObject:v15];

    long long v16 = [(MIExecutableBundle *)self _nameListForPlatformSet:v14];
    long long v17 = [(MIExecutableBundle *)self executableURL];
    uint64_t v18 = [v17 path];
    _CreateError((uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]", 313, @"MIInstallerErrorDomain", 198, 0, 0, @"Expected to find only one or more platform slices for %@ in executable at %@ but also found other platforms: %@", v19, (uint64_t)v7);
  uint64_t v22 = };

  id v9 = (id)v18;
LABEL_10:

  id v9 = (id)v22;
LABEL_11:
  if (a4)
  {
    id v9 = v9;
    BOOL v13 = 0;
    *a4 = v9;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_14:

  return v13;
}

- (BOOL)hasExecutableSliceForCPUType:(int)a3 subtype:(int)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  id v9 = [(MIExecutableBundle *)self executableImageSlicesWithError:&v30];
  id v10 = v30;
  BOOL v11 = v10;
  if (!v9)
  {
    BOOL v21 = 0;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  id v24 = v10;
  id v25 = a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v18 = [v17 cpuSubtype];
        if ([v17 cpuType] == v7 && (v18 & 0xFFFFFF) == a4)
        {
          BOOL v21 = 1;
          BOOL v11 = v24;
          goto LABEL_15;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v12 = [(MIBundle *)self bundleURL];
  uint64_t v23 = [v12 path];
  BOOL v11 = _CreateError((uint64_t)"-[MIExecutableBundle hasExecutableSliceForCPUType:subtype:error:]", 356, @"MIInstallerErrorDomain", 198, 0, 0, @"Did not find at least one executable slice with CPU type %d and subtype %d in bundle %@", v20, v7);

  BOOL v21 = 0;
LABEL_15:

  a5 = v25;
  if (v25)
  {
LABEL_18:
    if (!v21) {
      *a5 = v11;
    }
  }
LABEL_20:

  return v21;
}

- (id)lsInstallTypeWithError:(id *)a3
{
  if (self->_lsInstallType)
  {
    objc_super v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    goto LABEL_14;
  }
  uint64_t v6 = [(MIExecutableBundle *)self bundleContainer];
  uint64_t v8 = v6;
  if (!v6)
  {
    uint64_t v14 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]", 430, @"MIInstallerErrorDomain", 158, 0, 0, @"Could not get install type because no bundle container relation is set on %@", v7, (uint64_t)self);
    id v9 = 0;
    goto LABEL_11;
  }
  id v19 = 0;
  id v9 = [v6 bundleMetadataWithError:&v19];
  id v11 = v19;
  if (!v9)
  {
    uint64_t v15 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]", 436, @"MIInstallerErrorDomain", 158, v11, 0, @"Could not get install type because bundle metadata could not be read from %@", v10, (uint64_t)v8);
LABEL_10:
    uint64_t v14 = (void *)v15;

LABEL_11:
    long long v16 = +[MIFileManager defaultManager];
    long long v17 = [(MIBundle *)self bundleURL];
    objc_super v4 = [v16 installTypeFromExtendedAttributeOnBundle:v17 error:a3];

    if (v4) {
      self->_lsInstallType = [v4 unsignedIntegerValue];
    }
    goto LABEL_13;
  }
  unint64_t v12 = [v9 installType];
  if (!v12)
  {
    uint64_t v15 = _CreateError((uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]", 442, @"MIInstallerErrorDomain", 158, 0, 0, @"Install type not set in bundle metadata for %@", v13, (uint64_t)v8);
    goto LABEL_10;
  }
  self->_lsInstallType = v12;
  objc_super v4 = [NSNumber numberWithUnsignedInteger:v12];

LABEL_13:
LABEL_14:
  return v4;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MIExecutableBundle;
  [(MIBundle *)&v6 setBundleParentDirectoryURL:a3];
  objc_super v4 = [(MIBundle *)self bundleURL];
  uint64_t v5 = [(MIExecutableBundle *)self wk2AppBundle];
  [v5 setBundleParentDirectoryURL:v4];
}

- (id)watchKitAppExecutableHashWithError:(id *)a3
{
  uint64_t v5 = [(MIExecutableBundle *)self watchKitAppExecutableHash];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    uint64_t v7 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  if ([(MIBundle *)self isPlaceholder] || [(MIBundle *)self bundleType] != 4)
  {
    uint64_t v14 = [(MIBundle *)self identifier];
    _CreateError((uint64_t)"-[MIExecutableBundle watchKitAppExecutableHashWithError:]", 512, @"MIInstallerErrorDomain", 85, 0, 0, @"%@ is not expected to contain watch app executables", v15, (uint64_t)v14);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v7 = 0;
  }
  else
  {
    id v20 = 0;
    id v9 = [(MIExecutableBundle *)self watchKitAppBundleForWKVersionOrEarlier:3 error:&v20];
    id v10 = v20;
    if (!v9)
    {
LABEL_8:

      uint64_t v7 = 0;
      id v8 = v10;
      goto LABEL_10;
    }
    if ([v9 isPlaceholder])
    {
      id v11 = [(MIBundle *)self identifier];
      uint64_t v13 = _CreateError((uint64_t)"-[MIExecutableBundle watchKitAppExecutableHashWithError:]", 504, @"MIInstallerErrorDomain", 139, 0, 0, @"%@ contains a placeholder watch app, so an executable hash is not possible.", v12, (uint64_t)v11);

      id v10 = (id)v13;
      goto LABEL_8;
    }
    uint64_t v7 = [v9 executableURL];

    id v19 = v10;
    objc_super v6 = MICreateSHA256Digest(v7, &v19);
    id v8 = v19;

    if (v6)
    {
      [(MIExecutableBundle *)self setWatchKitAppExecutableHash:v6];
      goto LABEL_13;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      long long v17 = [(MIBundle *)self identifier];
      int v18 = [v7 path];
      MOLogWrite();
    }
  }
LABEL_10:
  if (a3)
  {
    id v8 = v8;
    objc_super v6 = 0;
    *a3 = v8;
  }
  else
  {
    objc_super v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)installationIdentitySettingIfNotSet:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(MIExecutableBundle *)self installationIdentity];

  if (v7)
  {
    id v8 = [(MIExecutableBundle *)self installationIdentity];
  }
  else
  {
    id v8 = +[MIInstallationIdentity installationIdentityForBundle:self settingIfNotSet:v5 error:a4];
    [(MIExecutableBundle *)self setInstallationIdentity:v8];
  }
  return v8;
}

- (BOOL)transferInstallationIdentityFromBundle:(id)a3 error:(id *)a4
{
  id v14 = 0;
  objc_super v6 = +[MIInstallationIdentity identityForUpdateOfBundle:a3 error:&v14];
  id v7 = v14;
  id v8 = v7;
  if (v6)
  {
    id v13 = v7;
    char v9 = [v6 writeToBundle:self error:&v13];
    id v10 = v13;

    if (v9)
    {
      [(MIExecutableBundle *)self setInstallationIdentity:v6];
      BOOL v11 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = v7;
  }
  if (a4) {
    *a4 = v10;
  }
  [(MIExecutableBundle *)self setInstallationIdentity:0];
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)makeAndSetNewInstallationIdentityWithError:(id *)a3
{
  id v5 = +[MIInstallationIdentity newIdentityForBundle:self];
  int v6 = [v5 writeToBundle:self error:a3];
  if (v6) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  [(MIExecutableBundle *)self setInstallationIdentity:v7];

  return v6;
}

- (unsigned)maxLinkedSDKVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(MIExecutableBundle *)self executableImageSlices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unsigned int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) sdkVersion];
        if (v5 <= v8) {
          unsigned int v5 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (unint64_t)estimatedMemoryUsageToValidate
{
  v2 = [(MIBundle *)self bundleURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"_CodeSignature/CodeResources" isDirectory:0];

  memset(&v9, 0, sizeof(v9));
  id v4 = v3;
  if (lstat((const char *)[v4 fileSystemRepresentation], &v9))
  {
    int v5 = *__error();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v6 = [v4 path];
      strerror(v5);
      MOLogWrite();
    }
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = (unint64_t)((double)v9.st_size * 3.9);
  }

  return v7;
}

- (unint64_t)compatibilityState
{
  if ([(MIBundle *)self isPlaceholder]
    || [(MIBundle *)self bundleType] == 7
    || [(MIBundle *)self bundleType] == 9)
  {
    id v3 = 0;
LABEL_5:
    unint64_t v4 = 0;
    goto LABEL_6;
  }
  id v6 = [(MIExecutableBundle *)self executableURL];
  id v11 = 0;
  char v7 = MIMachOFileMatchesMyArchitecture((const char *)[v6 fileSystemRepresentation], &v11);
  id v3 = v11;

  if (v7) {
    goto LABEL_5;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    unsigned int v8 = [(MIBundle *)self identifier];
    stat v9 = [(MIBundle *)self bundleURL];
    long long v10 = [v9 path];
    MOLogWrite();
  }
  id v3 = 0;
  unint64_t v4 = 2;
LABEL_6:

  return v4;
}

+ (BOOL)isGrandfatheredNonContainerizedForSigningInfo:(id)a3
{
  uint64_t v3 = isGrandfatheredNonContainerizedForSigningInfo__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isGrandfatheredNonContainerizedForSigningInfo__onceToken, &__block_literal_global_6);
  }
  int v5 = (void *)isGrandfatheredNonContainerizedForSigningInfo__grandfatheredSigningIDs;
  id v6 = [v4 codeInfoIdentifier];

  char v7 = [v5 containsObject:v6];
  return v7;
}

uint64_t __68__MIExecutableBundle_isGrandfatheredNonContainerizedForSigningInfo___block_invoke()
{
  isGrandfatheredNonContainerizedForSigningInfo__grandfatheredSigningIDs = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F170F998];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)_hasNonContainerizingEntitlement:(id)a3 checkSeatbeltProfiles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [v6 entitlements];
  int v8 = MIHasNoContainerEntitlement(v7);

  if (v8)
  {
    if (![(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v6]
      || !gLogHandle
      || *(int *)(gLogHandle + 44) < 7)
    {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  stat v9 = [v6 entitlements];
  int v10 = MIHasNoSandboxEntitlement(v9);

  if (v10)
  {
    if (![(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v6]
      || !gLogHandle
      || *(int *)(gLogHandle + 44) < 7)
    {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (!v4
    || ([v6 entitlements],
        id v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = MIHasSeatbeltProfilesEntitlement(v11),
        v11,
        !v12))
  {
    BOOL v14 = 0;
    goto LABEL_18;
  }
  if ([(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v6]
    && gLogHandle
    && *(int *)(gLogHandle + 44) >= 7)
  {
LABEL_16:
    long long v13 = [(MIBundle *)self identifier];
    MOLogWrite();
  }
LABEL_17:
  BOOL v14 = 1;
LABEL_18:

  return v14;
}

- (BOOL)needsDataContainer
{
  uint64_t v3 = [(MIExecutableBundle *)self codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0];
  char v4 = 0;
  switch([(MIBundle *)self bundleType])
  {
    case 1u:
      if (!v3)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
          goto LABEL_18;
        }
LABEL_19:
        char v4 = 1;
        goto LABEL_22;
      }
      id v6 = [v3 entitlements];
      int v7 = MIHasContainerRequiredEntitlement(v6);

      if (v7)
      {
        if ([(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v3]
          && gLogHandle
          && *(int *)(gLogHandle + 44) >= 7)
        {
LABEL_18:
          stat v9 = [(MIBundle *)self identifier];
          MOLogWrite();

          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if ([(MIExecutableBundle *)self _hasNonContainerizingEntitlement:v3 checkSeatbeltProfiles:1])
      {
LABEL_21:
        char v4 = 0;
      }
      else
      {
        char v8 = [(id)objc_opt_class() isGrandfatheredNonContainerizedForSigningInfo:v3];
LABEL_12:
        char v4 = v8 ^ 1;
      }
LABEL_22:

      return v4;
    case 2u:
    case 5u:
      if (v3)
      {
        int v5 = [v3 entitlements];
        char v4 = MIHasContainerRequiredEntitlement(v5);

        goto LABEL_22;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        id v11 = [(MIBundle *)self identifier];
        MOLogWrite();
      }
      goto LABEL_21;
    case 3u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
      goto LABEL_22;
    case 4u:
      char v8 = [(MIExecutableBundle *)self _hasNonContainerizingEntitlement:v3 checkSeatbeltProfiles:0];
      goto LABEL_12;
    case 6u:
      goto LABEL_19;
    default:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unhandled bundle type %hhu", -[MIBundle bundleType](self, "bundleType"));
      goto LABEL_21;
  }
}

- (int)dataProtectionClass
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [(MIExecutableBundle *)self codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0];
  uint64_t v3 = [v2 entitlements];
  char v4 = MICopyDataProtectionIfAvailableEntitlement(v3);
  if (!v4) {
    goto LABEL_23;
  }
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
    objc_opt_class();
    id v8 = v5;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            int v15 = _ProtectionClassForString(*(void **)(*((void *)&v19 + 1) + 8 * i));
            if (v15)
            {
              int v7 = v15;
              goto LABEL_22;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      int v7 = 0;
LABEL_22:

      if (v7) {
        goto LABEL_30;
      }
    }
LABEL_23:
    long long v16 = MICopyDataProtectionClassEntitlement(v3);
    long long v17 = v16;
    if (v16)
    {
      int v7 = _ProtectionClassForString(v16);
      if (v7)
      {
LABEL_29:

        goto LABEL_30;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
    }
    int v7 = 0;
    goto LABEL_29;
  }
  int v7 = _ProtectionClassForString(v5);
  if (!v7) {
    goto LABEL_23;
  }
LABEL_30:

  return v7;
}

- (BOOL)updateMCMWithCodeSigningInfoAsAdvanceCopy:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  if ([(MIExecutableBundle *)self codeSignatureVerificationState] - 1 >= 2)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
      MOLogWrite();
    }
    goto LABEL_17;
  }
  if ([(MIBundle *)self bundleType] - 1 > 5)
  {
LABEL_17:
    id v16 = 0;
    BOOL v17 = 1;
    goto LABEL_18;
  }
  int v7 = objc_opt_new();
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MIExecutableBundle dataContainerContentClass](self, "dataContainerContentClass"));
  [v7 setObject:v8 forKeyedSubscript:@"com.apple.MobileContainerManager.DataContainerClass"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(MIBundle *)self parentBundleID];
    [v7 setObject:v9 forKeyedSubscript:@"com.apple.MobileContainerManager.ParentBundleID"];
  }
  if ([(MIBundle *)self isPlaceholder]) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"com.apple.MobileContainerManager.PlaceholderEntitlements"];
  }
  if (v5) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"com.apple.MobileContainerManager.AdvanceCopy"];
  }
  id v10 = [(MIExecutableBundle *)self codeSigningInfo];
  uint64_t v11 = [v10 dictionaryRepresentation];

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    [(MIBundle *)self identifier];
    uint64_t v23 = v11;
    v22 = uint64_t v24 = v7;
    MOLogWrite();
  }
  id v12 = [(MIBundle *)self identifier];
  [v12 UTF8String];
  uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v15 = container_set_code_signing_info_for_identifier();

  if (v15 == 1)
  {

    goto LABEL_17;
  }
  long long v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MIContainerManagerErrorDomain" code:v15 userInfo:0];
  long long v20 = [(MIBundle *)self identifier];
  [(MIBundle *)self isPlaceholder];
  _CreateAndLogError((uint64_t)"-[MIExecutableBundle updateMCMWithCodeSigningInfoAsAdvanceCopy:withError:]", 955, @"MIInstallerErrorDomain", 110, v19, 0, @"Failed to set code signing info with MCM for %@, isPlaceholder: %c", v21, (uint64_t)v20);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v17 = 0;
  if (a4 && v16)
  {
    id v16 = v16;
    BOOL v17 = 0;
    *a4 = v16;
  }
LABEL_18:

  return v17;
}

- (id)_codeSigningInfoFromMCM
{
  if ([(MIBundle *)self bundleType] - 1 > 5)
  {
    id v8 = 0;
    goto LABEL_18;
  }
  id v3 = [(MIBundle *)self identifier];
  [v3 UTF8String];
  char v4 = (void *)container_copy_code_signing_info_for_identifier();

  if (!v4)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v11 = [(MIBundle *)self identifier];
      MOLogWrite();
    }
    id v6 = 0;
    goto LABEL_16;
  }
  BOOL v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (!v7)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
LABEL_16:
    id v9 = 0;
    goto LABEL_17;
  }
  id v9 = [[MICodeSigningInfo alloc] initWithDictionaryRepresentation:v6 fromSource:3];
LABEL_17:
  id v8 = v9;

LABEL_18:
  return v8;
}

- (id)codeSigningInfoByValidatingResources:(BOOL)a3 performingOnlineAuthorization:(BOOL)a4 ignoringCachedSigningInfo:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 skippingProfileIDValidation:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  BOOL v13 = a3;
  unint64_t v15 = [(MIExecutableBundle *)self codeSignatureVerificationState];
  if (!a5 && v15 - 3 >= 0xFFFFFFFFFFFFFFFELL)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) < 7) {
      goto LABEL_26;
    }
    id v16 = [(MIBundle *)self identifier];
    v67 = v16;
    MOLogWrite();
LABEL_25:

LABEL_26:
    BOOL v17 = [(MIExecutableBundle *)self codeSigningInfo];
    goto LABEL_27;
  }
  if (v15 == 6 || v15 == 3)
  {
    if (a8)
    {
      [(MIExecutableBundle *)self codeSigningInfoError];
      BOOL v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  if (a5
    || [(MIBundle *)self bundleType] != 4
    || ([(MIExecutableBundle *)self _codeSigningInfoFromMCM],
        (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v19 = [(MIBundle *)self isStaticContent];
    if (v19 && [(MIBundle *)self bundleType] == 7)
    {
      long long v20 = +[MIFileManager defaultManager];
      uint64_t v21 = [(MIExecutableBundle *)self executableURL];
      int v22 = [v20 itemDoesNotExistAtURL:v21];

      if (v22)
      {
        self->_codeSignatureVerificationState = 4;
        uint64_t v24 = _CreateError((uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]", 1042, @"MIInstallerErrorDomain", 71, 0, 0, @"Built in framework is expectedly missing its bundle executable.", v23, (uint64_t)v67);
        id v25 = v24;
        if (a8) {
          *a8 = v24;
        }

LABEL_22:
        BOOL v17 = 0;
        goto LABEL_27;
      }
    }
    if ([(MIBundle *)self isPlaceholder])
    {
      self->_codeSignatureVerificationState = 1;
      long long v26 = [MICodeSigningInfo alloc];
      id v16 = [(MIBundle *)self identifier];
      long long v27 = [(MIBundle *)self bundleURL];
      long long v28 = MICopyPlaceholderEntitlements(v27);
      long long v29 = [(MICodeSigningInfo *)v26 initWithSignerIdentity:@"Unsigned Placeholder" signerOrganization:@"Unsigned Placeholder" codeInfoIdentifier:v16 teamIdentifier:@"Unsigned Placeholder" signatureVersion:&unk_1F170FA70 entitlements:v28 signerType:6 profileType:1 signingInfoSource:1 launchWarningData:0];
      [(MIExecutableBundle *)self setCodeSigningInfo:v29];

      goto LABEL_25;
    }
    v31 = +[MICodeSigningVerifier codeSigningVerifierForBundle:self];
    uint64_t v32 = v31;
    if (!v31)
    {
      v37 = [(MIBundle *)self bundleURL];
      v39 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]", 1065, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to create verifier for executable %@", v38, (uint64_t)v37);

      if (a8) {
        *a8 = v39;
      }

      BOOL v17 = 0;
      goto LABEL_80;
    }
    if (v13)
    {
      [v31 setValidateResources:1];
      if (!v12)
      {
LABEL_33:
        if (!v9) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    else if (!v12)
    {
      goto LABEL_33;
    }
    [v32 setPerformOnlineAuthorization:1];
    if (!v9)
    {
LABEL_35:
      v33 = [(MIBundle *)self parentBundle];
      v34 = +[MIDaemonConfiguration sharedInstance];
      int v35 = [v34 codeSigningEnforcementIsDisabled];

      if (v35)
      {
        [v32 setAllowAdhocSigning:1];
        [v32 setVerifyTrustCachePresence:0];
        [v32 setValidateUsingDetachedSignature:0];
        if ([(MIBundle *)self isRemovableSystemApp]
          || [v33 isRemovableSystemApp])
        {
          [v32 setValidateResources:0];
        }
        if (!v19 && ![(MIBundle *)self isRemovableSystemApp])
        {
          int v36 = [v33 isRemovableSystemApp] ^ 1;
          if (a6) {
            goto LABEL_62;
          }
          goto LABEL_61;
        }
        goto LABEL_60;
      }
      if ([(MIBundle *)self isRemovableSystemApp])
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          v67 = [(MIBundle *)self identifier];
          MOLogWrite();
        }
        objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
        v40 = v32;
        uint64_t v41 = 1;
      }
      else
      {
        if (![v33 isRemovableSystemApp])
        {
          if (v19)
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              v67 = [(MIBundle *)self identifier];
              MOLogWrite();
            }
            objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
            [v32 setVerifyTrustCachePresence:1];
            [v32 setValidateResources:0];
          }
          else
          {
            if (!MGGetBoolAnswer())
            {
              char v74 = 0;
              v63 = +[MITestManager sharedInstance];
              id v73 = 0;
              char v64 = [v63 isRunningInTestMode:&v74 outError:&v73];
              id v65 = v73;

              if ((v64 & 1) == 0)
              {
                if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                {
                  v67 = v65;
                  MOLogWrite();
                }
                char v74 = 0;

                id v65 = 0;
              }
              int v36 = v74 != 0;
              if (v74)
              {
                if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
                {
                  v66 = [(MIBundle *)self bundleURL];
                  v67 = [v66 path];
                  MOLogWrite();
                }
                objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
              }

              if (a6)
              {
LABEL_62:
                id v72 = 0;
                char v42 = objc_msgSend(v32, "performValidationWithError:", &v72, v67);
                id v43 = v72;
                if (v42)
                {
                  v44 = [v32 signingInfo];
                  v45 = [v44 codeInfoIdentifier];
                  v46 = [(MIBundle *)self identifier];
                  char v47 = [v45 isEqualToString:v46];

                  if (v47)
                  {
                    self->_codeSignatureVerificationState = 2;
                    v48 = [v32 signingInfo];
                    [(MIExecutableBundle *)self setCodeSigningInfo:v48];

                    if (v36)
                    {
                      v49 = [(MIExecutableBundle *)self codeSigningInfo];
                      uint64_t v50 = [v49 codeSignerType];

                      if (v50 == 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
                      {
                        v51 = [(MIBundle *)self bundleURL];
                        v69 = [v51 path];
                        MOLogWrite();
                      }
                    }
                    BOOL v17 = [(MIExecutableBundle *)self codeSigningInfo];
                    goto LABEL_79;
                  }
                  v71 = v33;
                  self->_codeSignatureVerificationState = 6;
                  v52 = [v32 signingInfo];
                  v53 = [v52 codeInfoIdentifier];
                  v54 = [(MIBundle *)self identifier];
                  v55 = [(MIBundle *)self bundleURL];
                  v70 = [v55 path];
                  v57 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]", 1166, @"MIInstallerErrorDomain", 77, 0, &unk_1F170F1B0, @"Code signing identifier (%@) does not match bundle identifier (%@) for %@", v56, (uint64_t)v53);
                  [(MIExecutableBundle *)self setCodeSigningInfoError:v57];

                  if (a8)
                  {
                    *a8 = [(MIExecutableBundle *)self codeSigningInfoError];
                  }
                  id v58 = [(MIExecutableBundle *)self executableURL];
                  int v59 = lchmod((const char *)[v58 fileSystemRepresentation], 0x1A4u);

                  v33 = v71;
                  if (v59 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
                  {
                    id v60 = [(MIExecutableBundle *)self executableURL];
                    [v60 fileSystemRepresentation];
                    v61 = __error();
                    strerror(*v61);
                    MOLogWrite();
                  }
                }
                else
                {
                  self->_codeSignatureVerificationState = 3;
                  [(MIExecutableBundle *)self setCodeSigningInfoError:v43];
                  if (a8)
                  {
                    BOOL v17 = 0;
                    *a8 = v43;
LABEL_79:

LABEL_80:
                    goto LABEL_27;
                  }
                }
                BOOL v17 = 0;
                goto LABEL_79;
              }
LABEL_61:
              objc_msgSend(v32, "setVerifyTrustCachePresence:", 0, v67);
              goto LABEL_62;
            }
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              v62 = [(MIBundle *)self bundleURL];
              v67 = [v62 path];
              MOLogWrite();
            }
            objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
          }
LABEL_60:
          int v36 = 0;
          if (a6) {
            goto LABEL_62;
          }
          goto LABEL_61;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          v67 = [(MIBundle *)self identifier];
          MOLogWrite();
        }
        objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
        [v32 setValidateResources:0];
        v40 = v32;
        uint64_t v41 = 0;
      }
      [v40 setValidateUsingDetachedSignature:v41];
      [v32 setVerifyTrustCachePresence:1];
      goto LABEL_60;
    }
LABEL_34:
    [v32 setSkipProfileIDValidation:1];
    goto LABEL_35;
  }
  BOOL v17 = (void *)v18;
  [(MIExecutableBundle *)self setCodeSigningInfo:v18];
  self->_codeSignatureVerificationState = 5;
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v68 = [(MIBundle *)self identifier];
    MOLogWrite();
  }
LABEL_27:
  return v17;
}

- (int)_installEmbeddedProvisioningProfileAtURL:(id)a3 withProgress:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, __CFString *, void))a4;
  memset(&v11, 0, sizeof(v11));
  id v7 = v5;
  if (lstat((const char *)[v7 fileSystemRepresentation], &v11))
  {
    int v8 = *__error();
    if (v8 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      [v7 fileSystemRepresentation];
      strerror(v8);
      MOLogWrite();
    }
    int v9 = 0;
  }
  else
  {
    if (v6) {
      v6[2](v6, @"InstallingEmbeddedProfile", 0);
    }
    int v9 = MIInstallProfileAtURL(v7);
  }

  return v9;
}

- (int)installEmbeddedProvisioningProfileWithProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(MIBundle *)self bundleURL];
  id v6 = [v5 URLByAppendingPathComponent:@"embedded.mobileprovision" isDirectory:0];

  LODWORD(self) = [(MIExecutableBundle *)self _installEmbeddedProvisioningProfileAtURL:v6 withProgress:v4];
  return (int)self;
}

- (int)installMacStyleEmbeddedProvisioningProfileWithProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(MIBundle *)self bundleURL];
  id v6 = [v5 URLByAppendingPathComponent:@"embedded.provisionprofile" isDirectory:0];

  LODWORD(self) = [(MIExecutableBundle *)self _installEmbeddedProvisioningProfileAtURL:v6 withProgress:v4];
  return (int)self;
}

- (BOOL)_hasNoConflictWithSystemAppsForSigningInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MIBundle *)self bundleTypeDescription];
  if ([(MIBundle *)self bundleType] == 1)
  {
    int v8 = [v6 entitlements];
    int v9 = MIHasSystemApplicationEntitlement(v8);

    if (v9)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        long long v26 = [(MIBundle *)self identifier];
        MOLogWrite();
      }
      id v10 = +[MIDaemonConfiguration sharedInstance];
      stat v11 = [v10 systemAppPlaceholderXPCServiceBundleIDs];
      BOOL v12 = [(MIBundle *)self identifier];
      if (_hasNoConflictWithSystemAppBundleIDs(v11, v12, @"System App XPC Service", v7, a4))
      {
        BOOL v13 = +[MIDaemonConfiguration sharedInstance];
        BOOL v14 = [v13 systemAppPlaceholderAppExtensionBundleIDs];
        unint64_t v15 = [(MIBundle *)self identifier];
        char hasNoConflictWithSystemAppBundleIDs = _hasNoConflictWithSystemAppBundleIDs(v14, v15, @"System App Extension", v7, a4);

        goto LABEL_19;
      }
      char hasNoConflictWithSystemAppBundleIDs = 0;
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
  }
  BOOL v17 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v18 = [v17 systemAppPlaceholderBundleIDs];
  BOOL v19 = [(MIBundle *)self identifier];
  int v20 = _hasNoConflictWithSystemAppBundleIDs(v18, v19, @"System App", v7, a4);

  if (v20)
  {
    id v10 = [(MIBundle *)self parentBundle];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      stat v11 = [v10 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0];
      uint64_t v21 = [v11 entitlements];
      int v22 = MIHasSystemApplicationEntitlement(v21);

      if (v22)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
        {
          char hasNoConflictWithSystemAppBundleIDs = 1;
          goto LABEL_23;
        }
        BOOL v12 = [(MIBundle *)self identifier];
        MOLogWrite();
        char hasNoConflictWithSystemAppBundleIDs = 1;
        goto LABEL_22;
      }
    }
    stat v11 = +[MIDaemonConfiguration sharedInstance];
    BOOL v12 = [v11 systemAppPlaceholderXPCServiceBundleIDs];
    BOOL v13 = [(MIBundle *)self identifier];
    if (!_hasNoConflictWithSystemAppBundleIDs(v12, v13, @"System App XPC Service", v7, a4))
    {
      char hasNoConflictWithSystemAppBundleIDs = 0;
      goto LABEL_21;
    }
    BOOL v14 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v23 = [v14 systemAppPlaceholderAppExtensionBundleIDs];
    uint64_t v24 = [(MIBundle *)self identifier];
    char hasNoConflictWithSystemAppBundleIDs = _hasNoConflictWithSystemAppBundleIDs(v23, v24, @"System App Extension", v7, a4);

LABEL_19:
LABEL_21:

    goto LABEL_22;
  }
  char hasNoConflictWithSystemAppBundleIDs = 0;
LABEL_24:

  return hasNoConflictWithSystemAppBundleIDs;
}

- (BOOL)hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MIBundle *)self bundleTypeDescription];
  unsigned int v11 = [(MIBundle *)self bundleType];
  if (v11 > 0xB) {
    goto LABEL_21;
  }
  BOOL v13 = 1;
  if (((1 << v11) & 0x1E) != 0)
  {
    unint64_t v15 = [(MIBundle *)self identifier];
    id v38 = 0;
    int v16 = _checkIdentifierForConflict(v15, (uint64_t)v9, 4, @"App Extension", v10, &v38);
    id v17 = v38;

    if (v16)
    {
      id v37 = v17;
      BOOL v18 = [(MIExecutableBundle *)self _hasNoConflictWithSystemAppsForSigningInfo:v8 error:&v37];
      id v14 = v37;

      if (v18)
      {
        uint64_t v19 = [v8 codeInfoIdentifier];
        if (v19)
        {
          int v20 = (void *)v19;
          uint64_t v21 = [v8 codeInfoIdentifier];
          id v36 = v14;
          char v22 = _checkIdentifierForConflict(v21, (uint64_t)v9, 4, @"App Extension", v10, &v36);
          uint64_t v23 = v36;
          goto LABEL_9;
        }
LABEL_24:
        BOOL v13 = 1;
        goto LABEL_27;
      }
LABEL_22:
      if (!a5) {
        goto LABEL_26;
      }
      goto LABEL_23;
    }
LABEL_19:
    id v14 = v17;
    if (!a5) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  if (((1 << v11) & 0xB80) == 0)
  {
    if (v11 == 6)
    {
      id v25 = [(MIBundle *)self identifier];
      id v43 = 0;
      int v26 = _checkIdentifierForConflict(v25, (uint64_t)v9, 2, @"App", v10, &v43);
      id v14 = v43;

      if (!v26) {
        goto LABEL_22;
      }
      id v42 = v14;
      BOOL v27 = [(MIExecutableBundle *)self _hasNoConflictWithSystemAppsForSigningInfo:v8 error:&v42];
      id v17 = v42;

      if (v27)
      {
        uint64_t v28 = [v8 codeInfoIdentifier];
        if (!v28) {
          goto LABEL_30;
        }
        long long v29 = (void *)v28;
        id v30 = [v8 codeInfoIdentifier];
        id v41 = v17;
        int v31 = _checkIdentifierForConflict(v30, (uint64_t)v9, 2, @"App", v10, &v41);
        id v14 = v41;

        id v17 = v14;
        if (v31)
        {
LABEL_30:
          uint64_t v32 = [(MIBundle *)self identifier];
          id v40 = v17;
          int hasNoConflictWithNonContainerizedSystemApp = _hasNoConflictWithNonContainerizedSystemApp(v32, v10, &v40);
          id v14 = v40;

          if (hasNoConflictWithNonContainerizedSystemApp)
          {
            uint64_t v34 = [v8 codeInfoIdentifier];
            if (v34)
            {
              int v20 = (void *)v34;
              uint64_t v21 = [v8 codeInfoIdentifier];
              id v39 = v14;
              char v22 = _hasNoConflictWithNonContainerizedSystemApp(v21, v10, &v39);
              uint64_t v23 = v39;
LABEL_9:
              id v24 = v23;

              if (v22)
              {
                BOOL v13 = 1;
                id v14 = v24;
                goto LABEL_27;
              }
              id v14 = v24;
              if (!a5)
              {
LABEL_26:
                BOOL v13 = 0;
                goto LABEL_27;
              }
LABEL_23:
              id v14 = v14;
              BOOL v13 = 0;
              *a5 = v14;
              goto LABEL_27;
            }
            goto LABEL_24;
          }
        }
        goto LABEL_22;
      }
      goto LABEL_19;
    }
LABEL_21:
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:forPersona:error:]", 1467, @"MIInstallerErrorDomain", 4, 0, 0, @"Don't know how to check bundle %@ for conflicts.", v12, (uint64_t)self);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  id v14 = 0;
LABEL_27:

  return v13;
}

- (unint64_t)dataContainerContentClass
{
  unsigned int v2 = [(MIBundle *)self bundleType];
  if (v2 > 0xB) {
    return 0;
  }
  else {
    return qword_1BCB0A490[(char)v2];
  }
}

- (Class)dataContainerClass
{
  return (Class)objc_opt_class();
}

- (id)dataContainerForPersona:(id)a3 error:(id *)a4
{
  return [(MIExecutableBundle *)self _dataContainerCreatingIfNeeded:0 forPersona:a3 makeLive:0 checkIfNeeded:0 created:0 error:a4];
}

- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  return [(MIExecutableBundle *)self _dataContainerCreatingIfNeeded:a3 forPersona:a4 makeLive:a5 checkIfNeeded:1 created:a6 error:a7];
}

- (id)_dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 checkIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a3;
  id v14 = a4;
  if (v10 && ![(MIExecutableBundle *)self needsDataContainer])
  {
    uint64_t v23 = [(MIBundle *)self bundleURL];
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle _dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:]", 1534, @"MIInstallerErrorDomain", 4, 0, 0, @"Asked for data container for %@ but none is needed.", v24, (uint64_t)v23);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    unint64_t v15 = 0;
    if (a8) {
      goto LABEL_29;
    }
LABEL_23:
    id v20 = 0;
    goto LABEL_30;
  }
  id v34 = 0;
  unint64_t v15 = [(objc_class *)[(MIExecutableBundle *)self dataContainerClass] dataContainerForExecutableBundle:self forPersona:v14 createIfNeeded:v12 temporary:0 created:a7 error:&v34];
  id v16 = v34;
  id v17 = v16;
  if (!v15)
  {
    if (!v12)
    {
      uint64_t v21 = [v16 domain];
      if ([v21 isEqualToString:@"MIContainerManagerErrorDomain"])
      {
        uint64_t v22 = [v17 code];

        if (v22 == 21) {
          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v30 = [(MIBundle *)self identifier];
      MOLogWrite();
    }
LABEL_28:
    unint64_t v15 = 0;
    id v19 = v17;
    if (a8) {
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  if (!v12 || !v11) {
    goto LABEL_8;
  }
  id v33 = v16;
  char v18 = [v15 makeContainerLiveWithError:&v33];
  id v19 = v33;

  if (v18)
  {
    id v17 = v19;
LABEL_8:
    id v20 = v15;
    unint64_t v15 = v20;
    id v19 = v17;
    goto LABEL_30;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    long long v29 = [(MIBundle *)self identifier];
    id v31 = v19;
    MOLogWrite();
  }
  id v25 = [(MIBundle *)self identifier];
  id v32 = 0;
  char v26 = [v15 removeUnderlyingContainerWaitingForDeletion:0 error:&v32];
  id v27 = v32;
  if ((v26 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
    MOLogWrite();
  }

  if (!a8) {
    goto LABEL_23;
  }
LABEL_29:
  id v19 = v19;
  id v20 = 0;
  *a8 = v19;
LABEL_30:

  return v20;
}

- (BOOL)executableExistsWithError:(id *)a3
{
  if ([(MIBundle *)self isPlaceholder])
  {
    id v5 = 0;
LABEL_4:
    BOOL v9 = 1;
    goto LABEL_5;
  }
  id v6 = +[MIFileManager defaultManager];
  id v7 = [(MIExecutableBundle *)self executableURL];
  id v15 = 0;
  char v8 = [v6 itemExistsAtURL:v7 error:&v15];
  id v5 = v15;

  if (v8) {
    goto LABEL_4;
  }
  BOOL v11 = [(MIBundle *)self relativePath];
  id v14 = [(MIExecutableBundle *)self relativeExecutablePath];
  BOOL v13 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle executableExistsWithError:]", 1580, @"MIInstallerErrorDomain", 71, v5, 0, @"%@ is missing its bundle executable. Please check your build settings to make sure that a bundle executable is produced at the path \"%@\".", v12, (uint64_t)v11);

  if (a3)
  {
    id v5 = v13;
    BOOL v9 = 0;
    *a3 = v5;
  }
  else
  {
    BOOL v9 = 0;
    id v5 = v13;
  }
LABEL_5:

  return v9;
}

- (BOOL)makeExecutableWithError:(id *)a3
{
  if ([(MIBundle *)self isLaunchProhibited]
    || [(MIBundle *)self isPlaceholder]
    || ([(MIExecutableBundle *)self executableURL],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = lchmod((const char *)[v5 fileSystemRepresentation], 0x1EDu),
        v5,
        !v6))
  {
    id v12 = 0;
    BOOL v13 = 1;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    char v8 = [(MIExecutableBundle *)self executableURL];
    BOOL v9 = [v8 path];
    BOOL v10 = __error();
    strerror(*v10);
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle makeExecutableWithError:]", 1618, @"MIInstallerErrorDomain", 4, v7, &unk_1F170F1D8, @"Failed to chmod %@ : %s", v11, (uint64_t)v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v12 = v12;
      BOOL v13 = 0;
      *a3 = v12;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)setLaunchWarningData:(id)a3 withError:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v24 = +[MIFileManager defaultManager];
  id v31 = 0;
  id v7 = [(MIBundle *)self thisBundleAndAllContainedBundlesWithError:&v31];
  id v8 = v31;
  if (v7)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v23 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v22 = a4;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 mayHaveExecutableProgram])
          {
            id v15 = [v14 executableURL];
            if (v6)
            {
              id v26 = v8;
              char v16 = [v24 setData:v6 forExtendedAttributeNamed:@"com.apple.mis.warning" onURL:v15 error:&v26];
              id v17 = v26;

              if ((v16 & 1) == 0) {
                goto LABEL_18;
              }
            }
            else
            {
              id v25 = v8;
              int v18 = [v24 removeExtendedAttributeNamed:@"com.apple.mis.warning" fromURL:v15 error:&v25];
              id v17 = v25;

              if (!v18)
              {
LABEL_18:
                id v8 = v15;
                a4 = v22;
                id v7 = v23;
                goto LABEL_19;
              }
            }

            id v8 = v17;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    BOOL v19 = 1;
    id v17 = v8;
    id v7 = v23;
  }
  else
  {
    id v9 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle setLaunchWarningData:withError:]", 1640, @"MIInstallerErrorDomain", 4, v8, 0, @"Failed to get all bundles within app %@", v20, (uint64_t)v9);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    if (a4)
    {
      id v17 = v17;
      BOOL v19 = 0;
      *a4 = v17;
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (BOOL)validatePluginKitMetadataWithError:(id *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MIExecutableBundle;
  id v19 = 0;
  unsigned int v5 = [(MIBundle *)&v18 validatePluginKitMetadataWithError:&v19];
  id v6 = v19;
  if (v5)
  {
    id v7 = [(MIExecutableBundle *)self watchKitV2AppBundleWithError:0];
    id v8 = v7;
    if (!v7)
    {
      BOOL v11 = 1;
      goto LABEL_16;
    }
    id v9 = [v7 siriIntents];
    if (!v9)
    {
      BOOL v11 = 1;
LABEL_15:

LABEL_16:
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    uint64_t v10 = [(MIBundle *)self siriIntents];
    if (v10)
    {
      if ([v9 isSubsetOfSet:v10])
      {
        BOOL v11 = 1;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v12 = [v8 identifier];
      BOOL v13 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle validatePluginKitMetadataWithError:]", 1696, @"MIInstallerErrorDomain", 126, 0, &unk_1F170F228, @"Siri Intents in the WatchKit app %@ are not a subset of the Siri Intents in the companion app %@", v15, (uint64_t)v12);
    }
    else
    {
      uint64_t v12 = [v8 identifier];
      BOOL v13 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle validatePluginKitMetadataWithError:]", 1693, @"MIInstallerErrorDomain", 126, 0, &unk_1F170F200, @"Siri Intents app extension is present in the WatchKit app %@ but there are no Siri Intents in the companion app %@", v14, (uint64_t)v12);
    uint64_t v16 = };

    BOOL v11 = 0;
    id v6 = (id)v16;
    goto LABEL_14;
  }
  BOOL v11 = 0;
  if (!a3) {
    goto LABEL_19;
  }
LABEL_17:
  if (!v11) {
    *a3 = v6;
  }
LABEL_19:

  return v11;
}

- (id)bundleSignatureVersionWithError:(id *)a3
{
  unsigned int v13 = 0;
  unsigned int v5 = [(MIExecutableBundle *)self executableURL];
  id v6 = MIFetchSignatureVersionForExecutableURL(v5, &v13);

  if (!v6)
  {
    id v7 = [(MIExecutableBundle *)self executableURL];
    id v8 = [v7 path];
    uint64_t v12 = MIErrorStringForMISError(v13);
    uint64_t v10 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle bundleSignatureVersionWithError:]", 1715, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to fetch signature version for executable at %@ with libMIS error %@", v9, (uint64_t)v8);

    if (a3) {
      *a3 = v10;
    }
  }
  return v6;
}

- (id)enumerateDylibsWithBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MIBundle *)self bundleURL];
  id v6 = [v5 URLByAppendingPathComponent:@"Frameworks" isDirectory:1];

  id v7 = +[MIFileManager defaultManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__MIExecutableBundle_enumerateDylibsWithBlock___block_invoke;
  v16[3] = &unk_1E62E73A8;
  id v17 = v4;
  id v8 = v4;
  uint64_t v9 = [v7 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v16];

  if (!v9)
  {
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = [v9 domain];
  if (![v10 isEqualToString:*MEMORY[0x1E4F28798]])
  {

    goto LABEL_7;
  }
  uint64_t v11 = [v9 code];

  if (v11 != 2)
  {
LABEL_7:
    uint64_t v13 = [v6 path];
    uint64_t v12 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle enumerateDylibsWithBlock:]", 1746, @"MIInstallerErrorDomain", 54, v9, 0, @"Failed to discover dylibs in directory %@", v14, v13);

    uint64_t v9 = (void *)v13;
    goto LABEL_8;
  }
  uint64_t v12 = 0;
LABEL_8:

LABEL_9:
  return v12;
}

uint64_t __47__MIExecutableBundle_enumerateDylibsWithBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 8
    && ([v5 pathExtension],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"dylib"],
        v7,
        v8))
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (NSURL)rootSinfURL
{
  id v3 = [(MIBundle *)self bundleURL];
  id v4 = [v3 URLByAppendingPathComponent:@"SC_Info" isDirectory:1];
  id v5 = NSString;
  id v6 = [(MIExecutableBundle *)self executableName];
  id v7 = [v5 stringWithFormat:@"%@.sinf", v6];
  int v8 = [v4 URLByAppendingPathComponent:v7 isDirectory:0];

  return (NSURL *)v8;
}

- (NSURL)rootSuppURL
{
  id v3 = [(MIBundle *)self bundleURL];
  id v4 = [v3 URLByAppendingPathComponent:@"SC_Info" isDirectory:1];
  id v5 = NSString;
  id v6 = [(MIExecutableBundle *)self executableName];
  id v7 = [v5 stringWithFormat:@"%@.supp", v6];
  int v8 = [v4 URLByAppendingPathComponent:v7 isDirectory:0];

  return (NSURL *)v8;
}

- (NSURL)rootSupfURL
{
  id v3 = [(MIBundle *)self bundleURL];
  id v4 = [v3 URLByAppendingPathComponent:@"SC_Info" isDirectory:1];
  id v5 = NSString;
  id v6 = [(MIExecutableBundle *)self executableName];
  id v7 = [v5 stringWithFormat:@"%@.supf", v6];
  int v8 = [v4 URLByAppendingPathComponent:v7 isDirectory:0];

  return (NSURL *)v8;
}

- (BOOL)updateSinfWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v8 = [v7 uid];

  uint64_t v9 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v10 = [v9 gid];

  uint64_t v11 = [(MIBundle *)self bundleURL];
  uint64_t v12 = [(MIExecutableBundle *)self executableName];
  id v16 = 0;
  char v13 = MIUpdateSinfWithData(v6, v11, v12, v8, v10, &v16);

  id v14 = v16;
  if (a4 && (v13 & 1) == 0) {
    *a4 = v14;
  }

  return v13;
}

- (void)bestEffortRollbackSinfData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = 0;
    BOOL v5 = [(MIExecutableBundle *)self updateSinfWithData:v4 error:&v9];
    id v6 = v9;
    if (!v5 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      unsigned int v8 = [(MIBundle *)self identifier];
      MOLogWrite();
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v7 = [(MIBundle *)self identifier];
      MOLogWrite();
    }
    [(MIExecutableBundle *)self removeSinf];
    id v6 = 0;
  }
}

- (id)updateAndValidateSinf:(id)a3 error:(id *)a4
{
  return [(MIExecutableBundle *)self updateAndValidateSinf:a3 withRollback:1 error:a4];
}

- (id)updateAndValidateSinf:(id)a3 withRollback:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!v6)
  {
    uint64_t v11 = 0;
    goto LABEL_12;
  }
  id v9 = (void *)MEMORY[0x1E4F1C9B8];
  unsigned int v10 = [(MIExecutableBundle *)self rootSinfURL];
  id v31 = 0;
  uint64_t v11 = [v9 dataWithContentsOfURL:v10 options:2 error:&v31];
  id v12 = v31;

  if (!v11)
  {
    char v13 = [v12 domain];
    if ([v13 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v14 = [v12 code];

      if (v14 == 260) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v15 = [(MIExecutableBundle *)self rootSinfURL];
      id v16 = [v15 path];
      id v26 = [(MIBundle *)self identifier];
      id v27 = v12;
      id v25 = v16;
      MOLogWrite();
    }
  }
LABEL_11:

LABEL_12:
  id v30 = 0;
  BOOL v17 = -[MIExecutableBundle updateSinfWithData:error:](self, "updateSinfWithData:error:", v8, &v30, v25, v26, v27);
  id v18 = v30;
  id v19 = v18;
  if (!v17)
  {
    uint64_t v22 = 0;
    id v21 = v18;
    if (!a5) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  id v29 = v18;
  BOOL v20 = [(MIExecutableBundle *)self validateSinfWithError:&v29];
  id v21 = v29;

  if (v20)
  {
    id v28 = v21;
    uint64_t v22 = [(MIExecutableBundle *)self fairPlaySinfInfoWithError:&v28];
    id v23 = v28;

    id v21 = v23;
    if (!a5) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (v6) {
    [(MIExecutableBundle *)self bestEffortRollbackSinfData:v11];
  }
  uint64_t v22 = 0;
  if (a5)
  {
LABEL_21:
    if (!v22) {
      *a5 = v21;
    }
  }
LABEL_23:

  return v22;
}

- (BOOL)replicateRootSinfWithError:(id *)a3
{
  BOOL v5 = [(MIBundle *)self bundleURL];
  BOOL v6 = [(MIExecutableBundle *)self executableName];
  id v7 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v8 = [v7 uid];
  id v9 = +[MIDaemonConfiguration sharedInstance];
  LOBYTE(a3) = MIReplicateRootSinf(v5, v6, v8, [v9 gid], a3);

  return (char)a3;
}

- (void)removeSinf
{
  id v4 = [(MIBundle *)self bundleURL];
  id v3 = [(MIExecutableBundle *)self executableName];
  MIRemoveSinf(v4, v3);
}

- (BOOL)needsSinf
{
  id v3 = +[MIFileManager defaultManager];
  id v4 = [(MIExecutableBundle *)self rootSuppURL];
  if ([v3 itemExistsAtURL:v4])
  {
    char v5 = 1;
  }
  else
  {
    BOOL v6 = +[MIFileManager defaultManager];
    id v7 = [(MIExecutableBundle *)self rootSupfURL];
    char v5 = [v6 itemExistsAtURL:v7];
  }
  return v5;
}

- (BOOL)hasSinf
{
  id v3 = +[MIFileManager defaultManager];
  id v4 = [(MIExecutableBundle *)self rootSinfURL];
  char v5 = [v3 itemExistsAtURL:v4];

  return v5;
}

- (id)fairPlaySinfInfoWithError:(id *)a3
{
  int v38 = -1;
  id v37 = 0;
  BOOL v5 = [(MIExecutableBundle *)self getSinfDataType:&v38 withError:&v37];
  id v6 = v37;
  id v7 = v6;
  if (!v5)
  {
    id v9 = 0;
    id v11 = v6;
    goto LABEL_5;
  }
  if (v38)
  {
    unsigned int v8 = objc_opt_new();
    [v8 setIsMissingRequiredSINF:0];
    id v9 = 0;
    id v10 = 0;
    goto LABEL_29;
  }
  id v9 = [(MIExecutableBundle *)self rootSinfURL];
  id v36 = v7;
  id v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9 options:2 error:&v36];
  id v11 = v36;

  if (!v12)
  {
    id v16 = [v11 domain];
    if ([v16 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v17 = [v11 code];

      if (v17 == 260) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v31 = [v9 path];
      MOLogWrite();
    }
LABEL_5:
    id v10 = 0;
    unsigned int v8 = 0;
    if (!a3) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  uint64_t v35 = 0;
  id v10 = v12;
  hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), 42, (uint64_t)&v35);
  if (v13 == -42031)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      id v30 = [v9 path];
      MOLogWrite();
    }
    uint64_t v35 = 0;
  }
  else if (v13)
  {
    uint64_t v14 = [v9 path];
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]", 1917, @"MIInstallerErrorDomain", 4, 0, 0, @"Could not get MID-based SINF status from SINF at %@: %ld", v15, (uint64_t)v14);
    id v7 = LABEL_28:;

    unsigned int v8 = 0;
LABEL_29:
    id v11 = v7;
    if (!a3) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  uint64_t v34 = 0;
  id v10 = v10;
  hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), 1, (uint64_t)&v34);
  if (v18)
  {
    uint64_t v14 = [v9 path];
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]", 1929, @"MIInstallerErrorDomain", 4, 0, 0, @"Could not get purchaser DSID from SINF at %@: %ld", v19, (uint64_t)v14);
    goto LABEL_28;
  }
  uint64_t v33 = 0;
  id v10 = v10;
  hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), 41, (uint64_t)&v33);
  if (v20)
  {
    uint64_t v14 = [v9 path];
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]", 1937, @"MIInstallerErrorDomain", 4, 0, 0, @"Could not get family ID from SINF at %@: %ld", v21, (uint64_t)v14);
    goto LABEL_28;
  }
  uint64_t v32 = 0;
  id v10 = v10;
  hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), 40, (uint64_t)&v32);
  if (v22)
  {
    uint64_t v14 = [v9 path];
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]", 1945, @"MIInstallerErrorDomain", 4, 0, 0, @"Could not get downloader DSID from SINF at %@: %ld", v23, (uint64_t)v14);
    goto LABEL_28;
  }
  BOOL v26 = v35 != 0;
  unsigned int v8 = objc_opt_new();
  id v27 = [NSNumber numberWithUnsignedLongLong:v34];
  [v8 setApplicationDSID:v27];

  id v28 = [NSNumber numberWithUnsignedLongLong:v33];
  [v8 setFamilyID:v28];

  id v29 = [NSNumber numberWithUnsignedLongLong:v32];
  [v8 setDownloaderDSID:v29];

  [v8 setHasMIDBasedSINF:v26];
  [v8 setIsMissingRequiredSINF:0];
  if (!a3) {
    goto LABEL_32;
  }
LABEL_30:
  if (!v8) {
    *a3 = v11;
  }
LABEL_32:
  id v24 = v8;

  return v24;
}

- (BOOL)setSinfDataType:(unsigned int)a3 withError:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (![(MIBundle *)self isPlaceholder])
  {
    uint64_t v39 = 0;
    id v40 = (id *)&v39;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__7;
    id v43 = __Block_byref_object_dispose__7;
    id v44 = 0;
    [(MIExecutableBundle *)self setSinfDataType:v5];
    [(MIExecutableBundle *)self setSinfDataTypeIsSet:1];
    if ([(MIBundle *)self isAppTypeBundle])
    {
      BOOL v8 = [(MIExecutableBundle *)self needsSinf];
      if (v5) {
        BOOL v9 = v8;
      }
      else {
        BOOL v9 = 0;
      }
      if (!v9) {
        goto LABEL_8;
      }
    }
    else if (!v5)
    {
LABEL_8:
      id v10 = 0;
      BOOL v7 = 1;
LABEL_31:

      _Block_object_dispose(&v39, 8);
      return v7;
    }
    id v11 = v40 + 5;
    id obj = v40[5];
    id v29 = [(MIBundle *)self thisBundleAndAllContainedBundlesWithError:&obj];
    id v28 = a4;
    objc_storeStrong(v11, obj);
    if (v29)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v12 = v29;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
      id v30 = v12;
      if (v13)
      {
        uint64_t v14 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = [v16 executableURL];
              int v18 = v40 + 5;
              id v33 = v40[5];
              char v19 = MISetSinfDataType(v17, v5, &v33);
              objc_storeStrong(v18, v33);
              if ((v19 & 1) == 0) {
                goto LABEL_28;
              }
              if ([v16 isAppTypeBundle])
              {
                id v20 = v40[5];
                v40[5] = 0;

                v31[0] = MEMORY[0x1E4F143A8];
                v31[1] = 3221225472;
                v31[2] = __48__MIExecutableBundle_setSinfDataType_withError___block_invoke;
                v31[3] = &unk_1E62E73D0;
                int v32 = v5;
                v31[4] = &v39;
                uint64_t v21 = [(MIExecutableBundle *)self enumerateDylibsWithBlock:v31];
                int v22 = v21;
                if (v40[5]) {
                  goto LABEL_27;
                }
                if (v21)
                {
                  objc_storeStrong(v40 + 5, v21);
LABEL_27:

                  goto LABEL_28;
                }
              }

              id v12 = v30;
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      BOOL v7 = 1;
      id v10 = v30;
    }
    else
    {
      id v23 = v40[5];
      uint64_t v24 = [(MIBundle *)self identifier];
      uint64_t v26 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle setSinfDataType:withError:]", 1993, @"MIInstallerErrorDomain", 4, v23, 0, @"Failed to get all bundles within app %@", v25, v24);
      id v30 = (void *)v24;
      id v17 = v40[5];
      v40[5] = (id)v26;
LABEL_28:

      BOOL v7 = 0;
      if (v28) {
        *id v28 = v40[5];
      }
      id v10 = v29;
    }
    goto LABEL_31;
  }
  return 1;
}

uint64_t __48__MIExecutableBundle_setSinfDataType_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 40);
  id v9 = 0;
  uint64_t v5 = MISetSinfDataType(a2, v4, &v9);
  id v6 = v9;
  id v7 = v9;
  if ((v5 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  }

  return v5;
}

- (BOOL)getSinfDataType:(unsigned int *)a3 withError:(id *)a4
{
  if ([(MIExecutableBundle *)self sinfDataTypeIsSet])
  {
    if (*a3) {
      *a3 = [(MIExecutableBundle *)self sinfDataType];
    }
    return 1;
  }
  else
  {
    BOOL v8 = [(MIExecutableBundle *)self executableURL];
    char v9 = MIGetSinfDataType(v8, a3, a4);

    return v9;
  }
}

- (BOOL)validateSinfWithError:(id *)a3
{
  if (![(MIExecutableBundle *)self hasSinf] || [(MIBundle *)self isPlaceholder])
  {
    id v5 = 0;
LABEL_4:
    BOOL v6 = 1;
    goto LABEL_5;
  }
  int v21 = -1;
  id v20 = 0;
  BOOL v8 = [(MIExecutableBundle *)self getSinfDataType:&v21 withError:&v20];
  id v5 = v20;
  if (v8)
  {
    if (v21) {
      goto LABEL_4;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      int v18 = self;
      MOLogWrite();
    }
    id v9 = [(MIExecutableBundle *)self executableURL];
    [v9 fileSystemRepresentation];
    mm0Euuzhc();
    int v11 = v10;

    switch(v11)
    {
      case -42057:
        id v12 = [(MIBundle *)self bundleURL];
        uint64_t v13 = [v12 path];
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle validateSinfWithError:]", 2089, @"MIInstallerErrorDomain", 174, 0, &unk_1F170F278, @"The SINF provided for the bundle at %@ does not have a matching key in the FairPlay keybag.", v15, (uint64_t)v13);
        break;
      case 0:
        goto LABEL_4;
      case -42056:
        id v12 = [(MIBundle *)self bundleURL];
        uint64_t v13 = [v12 path];
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle validateSinfWithError:]", 2086, @"MIInstallerErrorDomain", 120, 0, &unk_1F170F250, @"The SINF provided for the bundle at %@ is not valid so this application will not run.", v14, (uint64_t)v13);
        break;
      default:
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          id v17 = [(MIBundle *)self bundleURL];
          char v19 = [v17 path];
          MOLogWrite();
        }
        goto LABEL_4;
    uint64_t v16 = };

    id v5 = (id)v16;
  }
  if (a3)
  {
    id v5 = v5;
    BOOL v6 = 0;
    *a3 = v5;
  }
  else
  {
    BOOL v6 = 0;
  }
LABEL_5:

  return v6;
}

- (BOOL)_hasResource:(id)a3 withExtension:(id)a4
{
  BOOL v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  BOOL v8 = [(MIExecutableBundle *)self cfBundle];
  if (v8 && (CFURLRef v9 = CFBundleCopyResourceURL(v8, v6, v7, 0)) != 0)
  {
    CFRelease(v9);
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)hasWatchCustomNotification
{
  return [(MIExecutableBundle *)self _hasResource:@"Interface-notification" withExtension:@"plist"];
}

- (BOOL)hasWatchGlance
{
  return [(MIExecutableBundle *)self _hasResource:@"Interface-glance" withExtension:@"plist"];
}

- (BOOL)isExtensionBasedWatchKitApp
{
  unsigned int v2 = [(MIBundle *)self infoPlistSubset];
  id v3 = [v2 objectForKeyedSubscript:@"WKWatchKitApp"];
  char v4 = MIBooleanValue(v3, 0);

  return v4;
}

- (BOOL)isExtensionlessWatchKitApp
{
  unsigned int v2 = [(MIBundle *)self infoPlistSubset];
  id v3 = [v2 objectForKeyedSubscript:@"WKApplication"];
  char v4 = MIBooleanValue(v3, 0);

  return v4;
}

- (NSString)companionAppIdentifier
{
  unsigned int v2 = [(MIBundle *)self infoPlistSubset];
  id v3 = [v2 objectForKeyedSubscript:@"WKCompanionAppBundleIdentifier"];
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

- (NSArray)counterpartIdentifiers
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(MIBundle *)self bundleType] == 1 || [(MIBundle *)self bundleType] == 10)
  {
    id v3 = [(MIBundle *)self infoPlistSubset];
    id v4 = [v3 objectForKeyedSubscript:@"LSCounterpartIdentifiers"];
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    objc_opt_class();
    if (MIArrayContainsOnlyClass(v6)) {
      goto LABEL_15;
    }
  }
  if ([(MIBundle *)self bundleType] == 4)
  {
    id v7 = [(MIExecutableBundle *)self watchKitAppBundleForWKVersionOrEarlier:3 error:0];
    if (v7)
    {
      BOOL v8 = v7;
      CFURLRef v9 = [v7 identifier];
      v12[0] = v9;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

LABEL_13:
      goto LABEL_15;
    }
  }
  else if ([(MIBundle *)self bundleType] == 9)
  {
    BOOL v8 = [(MIExecutableBundle *)self companionAppIdentifier];
    int v11 = v8;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    goto LABEL_13;
  }
  id v6 = 0;
LABEL_15:
  return (NSArray *)v6;
}

- (BOOL)minimumWatchOSVersionIsPreV6
{
  unsigned int v2 = [(MIBundle *)self minimumOSVersion];
  id v3 = v2;
  BOOL v4 = !v2
    || ([v2 hasPrefix:@"8.2"] & 1) != 0
    || [v3 compare:@"6.0" options:64] == -1;

  return v4;
}

- (BOOL)watchKitAppRunsIndependentlyOfCompanion
{
  id v3 = [(MIBundle *)self infoPlistSubset];
  BOOL v4 = [v3 objectForKeyedSubscript:@"WKRunsIndependentlyOfCompanionApp"];
  char v5 = MIBooleanValue(v4, 0);

  if (v5) {
    return 1;
  }
  unsigned int v7 = [(MIBundle *)self bundleType];
  char v6 = 0;
  if (v7 <= 0xA && ((1 << v7) & 0x63E) != 0)
  {
    id v15 = 0;
    BOOL v8 = [(MIExecutableBundle *)self watchKitPluginWithError:&v15];
    id v9 = v15;
    BOOL v10 = v9;
    if (v8)
    {
      char v6 = [v8 watchKitAppRunsIndependentlyOfCompanion];
LABEL_15:

      return v6;
    }
    int v11 = [v9 domain];
    if ([v11 isEqualToString:@"MIInstallerErrorDomain"])
    {
      uint64_t v12 = [v10 code];

      if (v12 == 96)
      {

        char v6 = 0;
        BOOL v10 = 0;
        goto LABEL_15;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v14 = [(MIBundle *)self identifier];
      MOLogWrite();
    }
    char v6 = 0;
    goto LABEL_15;
  }
  return v6;
}

- (BOOL)isWatchOnlyApp
{
  id v3 = [(MIBundle *)self infoPlistSubset];
  BOOL v4 = [v3 objectForKeyedSubscript:@"WKWatchOnly"];
  char v5 = MIBooleanValue(v4, 0);

  if (v5) {
    return 1;
  }
  unsigned int v7 = [(MIBundle *)self bundleType];
  char v6 = 0;
  if (v7 <= 0xA && ((1 << v7) & 0x63E) != 0)
  {
    id v15 = 0;
    BOOL v8 = [(MIExecutableBundle *)self watchKitPluginWithError:&v15];
    id v9 = v15;
    BOOL v10 = v9;
    if (v8)
    {
      char v6 = [v8 isWatchOnlyApp];
LABEL_15:

      return v6;
    }
    int v11 = [v9 domain];
    if ([v11 isEqualToString:@"MIInstallerErrorDomain"])
    {
      uint64_t v12 = [v10 code];

      if (v12 == 96)
      {

        char v6 = 0;
        BOOL v10 = 0;
        goto LABEL_15;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v14 = [(MIBundle *)self identifier];
      MOLogWrite();
    }
    char v6 = 0;
    goto LABEL_15;
  }
  return v6;
}

- (id)watchKitPluginWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v5 = [(MIExecutableBundle *)self watchKitPlugin];

  if (v5)
  {
    id v6 = [(MIExecutableBundle *)self watchKitPlugin];
  }
  else
  {
    unsigned int v7 = [(MIBundle *)self pluginKitBundlesWithError:a3];
    BOOL v8 = v7;
    if (!v7) {
      goto LABEL_14;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "isWatchKitExtension", (void)v17))
          {
            [(MIExecutableBundle *)self setWatchKitPlugin:v14];
            id v6 = v14;

            goto LABEL_16;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if (a3)
    {
      _CreateError((uint64_t)"-[MIExecutableBundle watchKitPluginWithError:]", 2275, @"MIInstallerErrorDomain", 96, 0, 0, @"No WatchKit extension found", v15, v17);
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_14:
      id v6 = 0;
    }
LABEL_16:
  }
  return v6;
}

- (unsigned)watchKitVersionWithError:(id *)a3
{
  if ([(MIExecutableBundle *)self isExtensionlessWatchKitApp]) {
    return 3;
  }
  if ([(MIExecutableBundle *)self isExtensionBasedWatchKitApp])
  {
    id v13 = 0;
    id v6 = [(MIExecutableBundle *)self watchKitPluginWithError:&v13];
    id v7 = v13;
    BOOL v8 = v7;
    if (v6)
    {
      unsigned __int8 v5 = 3;
LABEL_16:

      return v5;
    }
    id v9 = [v7 domain];
    if ([v9 isEqualToString:@"MIInstallerErrorDomain"])
    {
      uint64_t v10 = [v8 code];

      if (v10 == 96)
      {
        unsigned __int8 v5 = 2;
        goto LABEL_16;
      }
    }
    else
    {
    }
    unsigned __int8 v5 = 0;
    if (a3) {
      *a3 = v8;
    }
    goto LABEL_16;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    uint64_t v12 = [(MIBundle *)self identifier];
    MOLogWrite();
  }
  return 1;
}

- (id)watchKitAppBundleForWKVersionOrEarlier:(unsigned __int8)a3 error:(id *)a4
{
  if (a3 == 3)
  {
    id v9 = 0;
    id v6 = [(MIExecutableBundle *)self watchKitV2AppBundleWithError:&v9];
    id v7 = v9;
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    if (a3 == 2) {
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitAppBundleForWKVersionOrEarlier:error:]", 2314, @"MIInstallerErrorDomain", 133, 0, 0, @"WatchKit version enum value %hhu is no longer supported", v4, 2);
    }
    else {
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitAppBundleForWKVersionOrEarlier:error:]", 2321, @"MIInstallerErrorDomain", 4, 0, 0, @"Unknown WatchKit version enum value %hhu", v4, a3);
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!v6) {
    *a4 = v7;
  }
LABEL_10:

  return v6;
}

- (id)_discoverWatchAppBundleAsPlaceholder:(BOOL)a3 error:(id *)a4
{
  if (a3) {
    id v7 = @"com.apple.WatchPlaceholder";
  }
  else {
    id v7 = @"Watch";
  }
  BOOL v8 = [(MIBundle *)self bundleURL];
  id v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:1];

  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x3032000000;
  long long v34 = __Block_byref_object_copy__7;
  long long v35 = __Block_byref_object_dispose__7;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = (id *)&v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__7;
  id v29 = __Block_byref_object_dispose__7;
  id v30 = 0;
  uint64_t v10 = +[MIFileManager defaultManager];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__MIExecutableBundle__discoverWatchAppBundleAsPlaceholder_error___block_invoke;
  v19[3] = &unk_1E62E73F8;
  uint64_t v22 = &v31;
  id v23 = &v25;
  long long v20 = v7;
  int v21 = self;
  BOOL v24 = a3;
  uint64_t v11 = [v10 enumerateURLsForItemsInDirectoryAtURL:v9 ignoreSymlinks:1 withBlock:v19];

  if (v11)
  {
    if (!v26[5]) {
      objc_storeStrong(v26 + 5, v11);
    }
    uint64_t v12 = (void *)v32[5];
    v32[5] = 0;
    goto LABEL_8;
  }
  if (!v32[5] && !v26[5])
  {
    uint64_t v12 = [(MIBundle *)self identifier];
    uint64_t v17 = _CreateError((uint64_t)"-[MIExecutableBundle _discoverWatchAppBundleAsPlaceholder:error:]", 2387, @"MIInstallerErrorDomain", 85, 0, 0, @"No WatchKit 2.0 app bundle or placeholder found for app %@", v16, (uint64_t)v12);
    id v18 = v26[5];
    v26[5] = (id)v17;

LABEL_8:
  }
  id v13 = (void *)v32[5];
  if (a4 && !v13)
  {
    *a4 = v26[5];
    id v13 = (void *)v32[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

uint64_t __65__MIExecutableBundle__discoverWatchAppBundleAsPlaceholder_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    id v7 = [v5 pathExtension];
    if ([v7 isEqualToString:@"app"])
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        BOOL v8 = [v6 lastPathComponent];
        id v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bundleURL];
        long long v37 = [v9 lastPathComponent];
        uint64_t v11 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle _discoverWatchAppBundleAsPlaceholder:error:]_block_invoke", 2354, @"MIInstallerErrorDomain", 91, 0, &unk_1F170F2A0, @"Unexpectedly found a second watch app, \"%@\", in this app's \"%@\" directory when we had already found \"%@\" in that directory. An iOS app may only have one embedded watch app.", v10, (uint64_t)v8);
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
        id v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = 0;

LABEL_5:
        uint64_t v16 = 0;
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v17 = [MIEmbeddedWatchBundle alloc];
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      long long v20 = [v6 lastPathComponent];
      uint64_t v21 = *(unsigned __int8 *)(a1 + 64);
      id v38 = 0;
      uint64_t v22 = [(MIEmbeddedWatchBundle *)v17 initWithParentBundle:v18 parentSubdirectory:v19 bundleName:v20 isPlaceholder:v21 error:&v38];
      id v23 = v38;
      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v22;

      uint64_t v26 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v26)
      {
        uint64_t v31 = [v6 path];
        uint64_t v33 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle _discoverWatchAppBundleAsPlaceholder:error:]_block_invoke", 2362, @"MIInstallerErrorDomain", 92, v23, &unk_1F170F2C8, @"Could not create bundle for WatchKit app at %@", v32, (uint64_t)v31);
        uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8);
        long long v35 = *(void **)(v34 + 40);
        *(void *)(v34 + 40) = v33;

        goto LABEL_5;
      }
      if (([v26 isApplicableToKnownWatchOSVersion] & 1) == 0)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          uint64_t v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bundleURL];
          id v36 = [v27 path];
          MOLogWrite();
        }
        uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
        id v29 = *(void **)(v28 + 40);
        *(void *)(v28 + 40) = 0;
      }
    }
    uint64_t v16 = 1;
    goto LABEL_15;
  }
  uint64_t v16 = 1;
LABEL_16:

  return v16;
}

- (id)watchKitV2AppBundleWithError:(id *)a3
{
  id v5 = [(MIExecutableBundle *)self wk2AppBundle];
  if (v5)
  {

    goto LABEL_4;
  }
  id v6 = [(MIExecutableBundle *)self wk2AppBundleError];

  if (!v6)
  {
    id v38 = 0;
    uint64_t v10 = [(MIExecutableBundle *)self _discoverWatchAppBundleAsPlaceholder:0 error:&v38];
    id v11 = v38;
    id v12 = v11;
    if (v10)
    {
LABEL_12:
      if (([v10 isExtensionBasedWatchKitApp] & 1) != 0
        || ([v10 isExtensionlessWatchKitApp] & 1) != 0)
      {
        id v36 = v12;
        int v13 = [v10 watchKitVersionWithError:&v36];
        id v14 = v36;

        if (v13 == 3)
        {
          id v12 = v14;
LABEL_38:
          [(MIExecutableBundle *)self setWk2AppBundle:v10];
          [(MIExecutableBundle *)self setWk2AppBundleError:v12];
          id v8 = v10;

          goto LABEL_8;
        }
        id v12 = [v10 bundleURL];
        uint64_t v18 = [v12 path];
        uint64_t v20 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2440, @"MIInstallerErrorDomain", 92, v14, &unk_1F170F368, @"Found WatchKit app at %@ but it was not a WatchKit 2 app. Is it missing its app extension?", v19, (uint64_t)v18);
      }
      else
      {
        uint64_t v25 = [v10 bundleURL];
        uint64_t v26 = [v25 path];
        uint64_t v20 = _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2432, @"MIInstallerErrorDomain", 92, 0, &unk_1F170F340, @"Found WatchKit 2.0 app at %@ but it does not have a WKWatchKitApp or WKApplication key set to true in its Info.plist", v27, (uint64_t)v26);

        id v12 = v25;
      }
      goto LABEL_34;
    }
    uint64_t v15 = [v11 domain];
    uint64_t v16 = *MEMORY[0x1E4F28798];
    if (![v15 isEqualToString:*MEMORY[0x1E4F28798]] || objc_msgSend(v12, "code") != 2)
    {
      uint64_t v17 = [v12 domain];
      if (![v17 isEqualToString:v16] || objc_msgSend(v12, "code") != 20)
      {
        uint64_t v21 = [v12 domain];
        if ([v21 isEqualToString:@"MIInstallerErrorDomain"])
        {
          uint64_t v22 = [v12 code];

          if (v22 == 85) {
            goto LABEL_25;
          }
        }
        else
        {
        }
        uint64_t v10 = [(MIBundle *)self bundleURL];
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2415, @"MIInstallerErrorDomain", 92, v12, &unk_1F170F2F0, @"Could not get contents of Watch directory in %@", v28, (uint64_t)v10);
        goto LABEL_32;
      }
    }
LABEL_25:

    id v37 = 0;
    uint64_t v10 = [(MIExecutableBundle *)self _discoverWatchAppBundleAsPlaceholder:1 error:&v37];
    id v23 = v37;
    id v12 = v23;
    if (v10) {
      goto LABEL_12;
    }
    uint64_t v24 = [v23 domain];
    if ([v24 isEqualToString:v16] && objc_msgSend(v12, "code") == 2)
    {

LABEL_41:
      uint64_t v10 = [(MIBundle *)self identifier];
      uint64_t v29 = _CreateError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2423, @"MIInstallerErrorDomain", 85, 0, 0, @"No WatchKit 2.0 placeholder found for app %@", v32, (uint64_t)v10);
      goto LABEL_33;
    }
    id v30 = [v12 domain];
    if ([v30 isEqualToString:v16])
    {
      uint64_t v31 = [v12 code];

      if (v31 == 20) {
        goto LABEL_41;
      }
    }
    else
    {
    }
    uint64_t v33 = [v12 domain];
    if ([v33 isEqualToString:@"MIInstallerErrorDomain"])
    {
      uint64_t v34 = [v12 code];

      if (v34 == 85)
      {
LABEL_35:
        if (a3)
        {
          id v12 = v12;
          uint64_t v10 = 0;
          *a3 = v12;
        }
        else
        {
          uint64_t v10 = 0;
        }
        goto LABEL_38;
      }
    }
    else
    {
    }
    uint64_t v10 = [(MIBundle *)self bundleURL];
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2425, @"MIInstallerErrorDomain", 92, v12, &unk_1F170F318, @"Could not get contents of watch placeholder directory in %@", v35, (uint64_t)v10);
    uint64_t v29 = LABEL_32:;
LABEL_33:
    uint64_t v20 = v29;
LABEL_34:

    id v12 = (id)v20;
    goto LABEL_35;
  }
LABEL_4:
  if (a3)
  {
    id v7 = [(MIExecutableBundle *)self wk2AppBundle];

    if (!v7)
    {
      *a3 = [(MIExecutableBundle *)self wk2AppBundleError];
    }
  }
  id v8 = [(MIExecutableBundle *)self wk2AppBundle];
LABEL_8:
  return v8;
}

- (BOOL)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:(unsigned __int8)a3 error:(id *)a4
{
  int v5 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__onceToken != -1) {
    dispatch_once(&hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__onceToken, &__block_literal_global_517);
  }
  if ((v5 & 0xFE) != 2) {
    -[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]();
  }
  id v7 = [(MIBundle *)self bundleURL];
  id v8 = MILoadInfoPlist(v7, 0);

  if (v5 == 2)
  {
    id v9 = &hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV1Keys;
  }
  else
  {
    if (v5 != 3) {
      -[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]();
    }
    id v9 = &hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV2Keys;
  }
  id v10 = (id)*v9;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
LABEL_10:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
      objc_opt_class();
      id v17 = v16;
      id v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v17 : 0;

      if (!v18) {
        break;
      }
      if (([v10 containsObject:v17] & 1) == 0)
      {
        uint64_t v24 = @"Unknown";
        if (v5 == 3) {
          uint64_t v24 = @"2.0";
        }
        if (v5 == 2) {
          uint64_t v24 = @"1.0";
        }
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]", 2553, @"MIInstallerErrorDomain", 99, 0, &unk_1F170F3B8, @"WatchKit %@ app has disallowed Info.plist key: %@", v20, (uint64_t)v24);
LABEL_31:
        id v21 = (id)objc_claimAutoreleasedReturnValue();

        if (a4)
        {
          id v21 = v21;
          BOOL v22 = 0;
          *a4 = v21;
        }
        else
        {
          BOOL v22 = 0;
        }
        goto LABEL_34;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v13) {
          goto LABEL_10;
        }
        goto LABEL_20;
      }
    }
    id v23 = @"Unknown";
    if (v5 == 3) {
      id v23 = @"2.0";
    }
    if (v5 == 2) {
      id v23 = @"1.0";
    }
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]", 2548, @"MIInstallerErrorDomain", 98, 0, &unk_1F170F390, @"WatchKit %@ app had an Info.plist key that was not a string.", v19, (uint64_t)v23);
    goto LABEL_31;
  }
LABEL_20:

  id v21 = 0;
  BOOL v22 = 1;
LABEL_34:

  return v22;
}

uint64_t __85__MIExecutableBundle_hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error___block_invoke()
{
  v0 = (void *)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV1Keys;
  hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV1Keys = (uint64_t)&unk_1F170F9B0;

  hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV2Keys = [&unk_1F170F9B0 arrayByAddingObjectsFromArray:&unk_1F170F9C8];
  return MEMORY[0x1F41817F8]();
}

- (void)setExecutableImageSlices:(id)a3
{
}

- (MIBundleContainer)bundleContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bundleContainer);
  return (MIBundleContainer *)WeakRetained;
}

- (void)setBundleContainer:(id)a3
{
}

- (unint64_t)codeSignatureVerificationState
{
  return self->_codeSignatureVerificationState;
}

- (NSError)wk2AppBundleError
{
  return self->_wk2AppBundleError;
}

- (void)setWk2AppBundleError:(id)a3
{
}

- (MIEmbeddedWatchBundle)wk2AppBundle
{
  return self->_wk2AppBundle;
}

- (void)setWk2AppBundle:(id)a3
{
}

- (MICodeSigningInfo)codeSigningInfo
{
  return self->_codeSigningInfo;
}

- (void)setCodeSigningInfo:(id)a3
{
}

- (NSError)codeSigningInfoError
{
  return self->_codeSigningInfoError;
}

- (void)setCodeSigningInfoError:(id)a3
{
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
}

- (MIPluginKitBundle)watchKitPlugin
{
  return self->_watchKitPlugin;
}

- (void)setWatchKitPlugin:(id)a3
{
}

- (MIInstallationIdentity)installationIdentity
{
  return self->_installationIdentity;
}

- (void)setInstallationIdentity:(id)a3
{
}

- (unint64_t)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(unint64_t)a3
{
  self->_lsInstallType = a3;
}

- (unsigned)sinfDataType
{
  return self->_sinfDataType;
}

- (void)setSinfDataType:(unsigned int)a3
{
  self->_sinfDataType = a3;
}

- (BOOL)sinfDataTypeIsSet
{
  return self->_sinfDataTypeIsSet;
}

- (void)setSinfDataTypeIsSet:(BOOL)a3
{
  self->_sinfDataTypeIsSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installationIdentity, 0);
  objc_storeStrong((id *)&self->_watchKitPlugin, 0);
  objc_storeStrong((id *)&self->_watchKitAppExecutableHash, 0);
  objc_storeStrong((id *)&self->_codeSigningInfoError, 0);
  objc_storeStrong((id *)&self->_codeSigningInfo, 0);
  objc_storeStrong((id *)&self->_wk2AppBundle, 0);
  objc_storeStrong((id *)&self->_wk2AppBundleError, 0);
  objc_destroyWeak((id *)&self->_bundleContainer);
  objc_storeStrong((id *)&self->_executableImageSlices, 0);
}

- (void)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:.cold.1()
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) > 2) {
    MOLogWrite();
  }
  __assert_rtn("-[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]", "MIExecutableBundle.m", 2542, "false");
}

- (void)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:.cold.2()
{
  __assert_rtn("-[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]", "MIExecutableBundle.m", 2526, "MIWatchKitVersion_1_0 == version || MIWatchKitVersion_2_0 == version");
}

@end