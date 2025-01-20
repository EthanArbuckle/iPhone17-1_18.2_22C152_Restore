@interface MIPluginKitBundle
+ (id)bundlesInParentBundle:(id)a3 overrideParentBundleIDForValidation:(id)a4 subDirectory:(id)a5 matchingPredicate:(id)a6 error:(id *)a7;
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)_validateNSExtensionWithOverlaidDictionary:(id)a3 error:(id *)a4;
- (BOOL)_validateXPCServiceWithOverlaidDictionary:(id)a3 error:(id *)a4;
- (BOOL)isFileProviderNonUIExtension;
- (BOOL)isMapsGeoServicesExtension;
- (BOOL)isMessagePayloadProviderExtension;
- (BOOL)isSiriIntentsExtension;
- (BOOL)isSiriIntentsUIExtension;
- (BOOL)isWatchKitExtension;
- (BOOL)mayContainFrameworks;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (NSDictionary)extensionAttributes;
- (NSDictionary)overlaidInfoPlist;
- (NSString)exExtensionPointIdentifier;
- (NSString)nsExtensionPointIdentifier;
- (id)_overlayDictionary:(id)a3 onDictionary:(id)a4;
- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4;
- (id)extensionPointIdentifier;
- (id)overlaidInfoPlistWithError:(id *)a3;
- (void)setOverlaidInfoPlist:(id)a3;
@end

@implementation MIPluginKitBundle

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  v7 = [(MIBundle *)self parentBundle];
  if ([v7 isWatchApp])
  {
    uint64_t v8 = [v7 currentOSVersionForValidationUsingPlatform:a3 withError:a4];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MIPluginKitBundle;
    uint64_t v8 = [(MIBundle *)&v11 currentOSVersionForValidationUsingPlatform:a3 withError:a4];
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)bundlesInParentBundle:(id)a3 overrideParentBundleIDForValidation:(id)a4 subDirectory:(id)a5 matchingPredicate:(id)a6 error:(id *)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___MIPluginKitBundle;
  v13 = objc_msgSendSuper2(&v24, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a5, a6, a7);
  v14 = v13;
  if (v12)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) setValidationOverrideParentBundleID:v12];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v16);
    }
  }

  return v14;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  return (id)[a1 bundlesInParentBundle:a3 overrideParentBundleIDForValidation:0 subDirectory:a4 matchingPredicate:a5 error:a6];
}

- (NSString)nsExtensionPointIdentifier
{
  v2 = [(MIBundle *)self infoPlistSubset];
  v3 = [v2 objectForKeyedSubscript:@"NSExtension"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (NSString *)v8;
}

- (NSString)exExtensionPointIdentifier
{
  v2 = [(MIBundle *)self infoPlistSubset];
  v3 = [v2 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (NSString *)v8;
}

- (id)extensionPointIdentifier
{
  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (!extensionPointIdentifier)
  {
    id v4 = [(MIPluginKitBundle *)self exExtensionPointIdentifier];
    id v5 = self->_extensionPointIdentifier;
    self->_extensionPointIdentifier = v4;

    extensionPointIdentifier = self->_extensionPointIdentifier;
    if (!extensionPointIdentifier)
    {
      v6 = [(MIPluginKitBundle *)self nsExtensionPointIdentifier];
      id v7 = self->_extensionPointIdentifier;
      self->_extensionPointIdentifier = v6;

      extensionPointIdentifier = self->_extensionPointIdentifier;
    }
  }
  return extensionPointIdentifier;
}

- (NSDictionary)extensionAttributes
{
  extensionAttributes = self->_extensionAttributes;
  if (!extensionAttributes)
  {
    id v4 = [(MIBundle *)self infoPlistSubset];
    id v5 = [v4 objectForKeyedSubscript:@"NSExtension"];
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      id v8 = [v7 objectForKeyedSubscript:@"NSExtensionAttributes"];
      objc_opt_class();
      id v9 = v8;
      if (objc_opt_isKindOfClass()) {
        v10 = (NSDictionary *)v9;
      }
      else {
        v10 = 0;
      }

      objc_super v11 = self->_extensionAttributes;
      self->_extensionAttributes = v10;
    }
    extensionAttributes = self->_extensionAttributes;
  }
  return extensionAttributes;
}

- (BOOL)isWatchKitExtension
{
  v2 = [(MIPluginKitBundle *)self extensionPointIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.watchkit"];

  return v3;
}

- (BOOL)isSiriIntentsExtension
{
  v2 = [(MIPluginKitBundle *)self extensionPointIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.intents-service"];

  return v3;
}

- (BOOL)isSiriIntentsUIExtension
{
  v2 = [(MIPluginKitBundle *)self extensionPointIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.intents-ui-service"];

  return v3;
}

- (BOOL)isMessagePayloadProviderExtension
{
  v2 = [(MIPluginKitBundle *)self extensionPointIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.message-payload-provider"];

  return v3;
}

- (BOOL)isFileProviderNonUIExtension
{
  v2 = [(MIPluginKitBundle *)self extensionPointIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.fileprovider-nonui"];

  return v3;
}

- (BOOL)isMapsGeoServicesExtension
{
  v2 = [(MIPluginKitBundle *)self extensionPointIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.geoservices.mapdata"];

  return v3;
}

- (BOOL)mayContainFrameworks
{
  v4.receiver = self;
  v4.super_class = (Class)MIPluginKitBundle;
  return [(MIBundle *)&v4 mayContainFrameworks]
      || [(MIPluginKitBundle *)self isWatchKitExtension];
}

- (id)_overlayDictionary:(id)a3 onDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[v6 mutableCopy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__MIPluginKitBundle__overlayDictionary_onDictionary___block_invoke;
  v13[3] = &unk_1E62E6F58;
  id v14 = v6;
  id v15 = v8;
  uint64_t v16 = self;
  id v9 = v8;
  id v10 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  objc_super v11 = (void *)[v9 copy];
  return v11;
}

void __53__MIPluginKitBundle__overlayDictionary_onDictionary___block_invoke(id *a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  *a4 = 0;
  id v8 = [a1[4] objectForKeyedSubscript:v10];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [a1[6] _overlayDictionary:v7 onDictionary:v8];
        [a1[5] setObject:v9 forKeyedSubscript:v10];
      }
    }
  }
  else
  {
    [a1[5] setObject:v7 forKeyedSubscript:v10];
  }
}

- (id)overlaidInfoPlistWithError:(id *)a3
{
  id v5 = [(MIPluginKitBundle *)self overlaidInfoPlist];

  if (v5)
  {
    id v6 = 0;
    goto LABEL_3;
  }
  id v8 = [(MIBundle *)self infoPlistSubset];
  id v9 = [v8 objectForKeyedSubscript:@"NSExtension"];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (!v11)
  {
    id v15 = [(MIBundle *)self bundleURL];
    uint64_t v16 = [v15 path];
    v41 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 177, @"MIInstallerErrorDomain", 39, 0, &unk_1F170EBC0, @"Appex bundle at %@ with id %@ does not define an NSExtension dictionary in its Info.plist", v17, (uint64_t)v16);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
    goto LABEL_23;
  }
  id v12 = [v11 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  if (!v14)
  {
    long long v21 = [(MIBundle *)self bundleURL];
    long long v22 = [v21 path];
    long long v23 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 184, @"MIInstallerErrorDomain", 45, 0, &unk_1F170EBE8, @"Appex bundle at %@ with id %@ does not define a NSExtensionPointIdentifier key with a string value in the NSExtension dictionary in its Info.plist", v24, (uint64_t)v22);
LABEL_19:
    id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  if ((MIIsValidRDNSString(v13) & 1) == 0)
  {
    long long v21 = [(MIBundle *)self bundleURL];
    long long v22 = [v21 path];
    long long v23 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 190, @"MIInstallerErrorDomain", 46, 0, &unk_1F170EC10, @"Appex bundle at %@ with id %@ does not have a legal value for the NSExtensionPointIdentifier key in the NSExtension dictionary in its Info.plist; found: %@",
      v25,
      (uint64_t)v22);
    goto LABEL_19;
  }
  v18 = [v8 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
  objc_opt_class();
  id v19 = v18;
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  long long v22 = [v20 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
  if (v22)
  {
    objc_opt_class();
    id v27 = v22;
    if (objc_opt_isKindOfClass())
    {
      if (MIIsValidRDNSString(v27))
      {

        goto LABEL_34;
      }
      v48 = v20;
      v33 = [(MIBundle *)self bundleURL];
      v34 = [v33 path];
      v43 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 202, @"MIInstallerErrorDomain", 46, 0, &unk_1F170EC38, @"Appex bundle at %@ with id %@ does not have a legal value for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@",
        v39,
        (uint64_t)v34);
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      v32 = v27;
    }
    else
    {
      v48 = v20;

      v32 = [(MIBundle *)self bundleURL];
      v33 = [v32 path];
      v34 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 206, @"MIInstallerErrorDomain", 45, 0, &unk_1F170EC60, @"Appex bundle at %@ with id %@ defines an EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string.", v35, (uint64_t)v33);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_21;
  }
LABEL_34:
  uint64_t v28 = [(MIPluginKitBundle *)self extensionPointIdentifier];
  if (!v28)
  {
    v36 = [(MIBundle *)self bundleURL];
    v37 = [v36 path];
    v42 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 215, @"MIInstallerErrorDomain", 45, 0, &unk_1F170EC88, @"Appex bundle at %@ with id %@ does not define an extension point in its Info.plist", v38, (uint64_t)v37);
    long long v21 = v20;
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  v29 = (void *)v28;
  v47 = v20;
  id v49 = 0;
  v30 = [(MIAppExtensionBundle *)self extensionCacheEntryWithError:&v49];
  id v6 = v49;
  if (v30)
  {
    v31 = [(MIPluginKitBundle *)self _overlayDictionary:v30 onDictionary:v8];
    [(MIPluginKitBundle *)self setOverlaidInfoPlist:v31];
  }
  else
  {
    v31 = [(MIBundle *)self bundleURL];
    v46 = [v31 path];
    v44 = [(MIBundle *)self identifier];
    if (v22) {
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 223, @"MIInstallerErrorDomain", 59, v6, &unk_1F170ECB0, @"Appex bundle at %@ with id %@ specifies a value (%@) for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist that does not correspond to a known extension point.", v40, (uint64_t)v46);
    }
    else {
    uint64_t v45 = _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 225, @"MIInstallerErrorDomain", 59, v6, &unk_1F170ECD8, @"Appex bundle at %@ with id %@ specifies a value (%@) for the NSExtensionPointIdentifier key in the NSExtension dictionary in its Info.plist that does not correspond to a known extension point.", v40, (uint64_t)v46);
    }

    id v6 = (id)v45;
  }

  if (v30)
  {
LABEL_3:
    id v7 = [(MIPluginKitBundle *)self overlaidInfoPlist];
    if (!a3) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
LABEL_23:
  id v7 = 0;
  if (!a3) {
    goto LABEL_26;
  }
LABEL_24:
  if (!v7) {
    *a3 = v6;
  }
LABEL_26:

  return v7;
}

- (BOOL)_validateXPCServiceWithOverlaidDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"XPCService"];
  if (!v7) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [(MIBundle *)self bundleURL];
    id v14 = [v8 path];
    id v15 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 250, @"MIInstallerErrorDomain", 38, 0, &unk_1F170ED00, @"Appex bundle at %@ with id %@ defines a value for the \"XPCService\" key in its Info.plist that is not a dictionary.", v16, (uint64_t)v14);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    id v11 = 0;
    goto LABEL_21;
  }
  id v8 = [v7 objectForKeyedSubscript:@"RunLoopType"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 length])
    {
      id v14 = [(MIBundle *)self bundleURL];
      id v15 = [v14 path];
      v18 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 260, @"MIInstallerErrorDomain", 50, 0, &unk_1F170ED28, @"Appex bundle at %@ with id %@ has an illegal value for the RunLoopType key in the XPCService dictionary in its Info.plist", v19, (uint64_t)v15);
LABEL_19:
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
  if ([v8 isEqualToString:@"_UIApplicationMain"])
  {
    id v9 = [(MIBundle *)self infoPlistSubset];
    BOOL v10 = MIHasRequiredStringValueOfNonZeroLengthCF(v9, *MEMORY[0x1E4F1CC48]);

    if (!v10)
    {
      id v14 = [(MIBundle *)self bundleURL];
      id v15 = [v14 path];
      v18 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 266, @"MIInstallerErrorDomain", 53, 0, &unk_1F170ED50, @"Appex bundle at %@ with ID %@ does not have a CFBundleDisplayName key with a non-zero length string value in its Info.plist", v21, (uint64_t)v15);
      goto LABEL_19;
    }
  }
  if (!MIHasStringValueOfNonZeroLengthIfDefined(v7, @"ServiceType"))
  {
    id v14 = [(MIBundle *)self bundleURL];
    id v15 = [v14 path];
    v18 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 272, @"MIInstallerErrorDomain", 51, 0, &unk_1F170ED78, @"Appex bundle at %@ with id %@ has an illegal value for the ServiceType key in the XPCService dictionary in its Info.plist", v20, (uint64_t)v15);
    goto LABEL_19;
  }

LABEL_10:
  id v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1CC60]];
  if (!v11
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v11 isEqualToString:@"XPC!"] & 1) != 0)
  {
    id v12 = 0;
    BOOL v13 = 1;
    goto LABEL_24;
  }
  id v8 = [(MIBundle *)self bundleURL];
  id v14 = [v8 path];
  id v15 = [(MIBundle *)self identifier];
  _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 280, @"MIInstallerErrorDomain", 41, 0, &unk_1F170EDA0, @"Appex bundle at %@ with id %@ has an illegal value for the CFBundlePackageType key in its Info.plist: %@", v17, (uint64_t)v14);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  if (a4)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_24:

  return v13;
}

- (BOOL)_validateNSExtensionWithOverlaidDictionary:(id)a3 error:(id *)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(MIBundle *)self parentBundle];
  int v7 = [v6 isWatchApp];

  if (v7) {
    id v8 = @"7.0";
  }
  else {
    id v8 = @"14.0";
  }
  id v9 = [v5 objectForKeyedSubscript:@"NSExtension"];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (!v11)
  {
    id v14 = [(MIBundle *)self bundleURL];
    id v15 = [v14 path];
    v79 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 331, @"MIInstallerErrorDomain", 39, 0, &unk_1F170EDC8, @"Appex bundle at %@ with id %@ does not define an NSExtension dictionary in its Info.plist", v16, (uint64_t)v15);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    uint64_t v19 = 0;
    id v20 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    goto LABEL_65;
  }
  id v89 = v5;
  id v12 = [v11 objectForKeyedSubscript:@"NSExtensionMainStoryboard"];
  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass()) {
    unint64_t v90 = (unint64_t)v13;
  }
  else {
    unint64_t v90 = 0;
  }

  long long v23 = [v11 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];
  objc_opt_class();
  id v24 = v23;
  if (objc_opt_isKindOfClass()) {
    id v20 = v24;
  }
  else {
    id v20 = 0;
  }

  id v96 = 0;
  uint64_t v21 = [(MIAppExtensionBundle *)self extensionCacheEntryWithError:&v96];
  id v17 = v96;
  if (!v21)
  {
    v18 = 0;
    id v22 = 0;
    uint64_t v19 = (void *)v90;
    goto LABEL_65;
  }
  unint64_t v88 = (unint64_t)v20;
  uint64_t v25 = [v21 objectForKeyedSubscript:@"NSExtension"];
  objc_opt_class();
  id v22 = v25;
  if (objc_opt_isKindOfClass()) {
    id v26 = v22;
  }
  else {
    id v26 = 0;
  }

  if (!v26)
  {
    uint64_t v34 = _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 345, @"MIInstallerErrorDomain", 154, 0, 0, @"Extension cache does not define an NSExtension dictionary in its Info.plist: %@", v27, (uint64_t)v21);

    goto LABEL_30;
  }
  uint64_t v28 = [v22 objectForKeyedSubscript:@"NSExtensionPrincipalClassProhibited"];
  int v29 = MIBooleanValue(v28, 0);

  if (v29 && ![(MIBundle *)self isApplicableToOSVersionEarlierThan:v8])
  {
    if (v90 | v88)
    {
      v37 = [(MIBundle *)self bundleURL];
      uint64_t v38 = [v37 path];
      uint64_t v39 = [(MIBundle *)self identifier];
      v84 = [(MIPluginKitBundle *)self extensionPointIdentifier];
      uint64_t v41 = _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 362, @"MIInstallerErrorDomain", 152, 0, &unk_1F170EE18, @"Appex bundle at %@ with id %@ defines either an NSExtensionMainStoryboard or NSExtensionPrincipalClass key, which is not allowed for the extension point %@", v40, (uint64_t)v38);

      uint64_t v19 = (void *)v90;
      id v20 = (id)v88;

      v18 = 0;
      id v17 = (id)v41;
      goto LABEL_65;
    }
    goto LABEL_36;
  }
  if (v90 | v88 && (!v90 || [(id)v90 length]) && (!v88 || objc_msgSend((id)v88, "length")))
  {
LABEL_36:
    if (!MIHasStringValueOfNonZeroLengthIfDefined(v11, @"NSExtensionContextClass"))
    {
      v30 = [(MIBundle *)self bundleURL];
      v31 = [v30 path];
      v32 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 369, @"MIInstallerErrorDomain", 43, 0, &unk_1F170EE40, @"Appex bundle at %@ with id %@ does not have a string value for the NSExtensionContextClass key in the NSExtension dictionary in its Info.plist", v52, (uint64_t)v31);
      goto LABEL_64;
    }
    if (!MIHasStringValueOfNonZeroLengthIfDefined(v11, @"NSExtensionContextHostClass"))
    {
      v30 = [(MIBundle *)self bundleURL];
      v31 = [v30 path];
      v32 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 375, @"MIInstallerErrorDomain", 44, 0, &unk_1F170EE68, @"Appex bundle at %@ with id %@ does not have a string value for the NSExtensionContextHostClass key in the NSExtension dictionary in its Info.plist", v53, (uint64_t)v31);
      goto LABEL_64;
    }
    if (MIHasStringValueOfNonZeroLengthIfDefined(v11, @"NSExtensionViewControllerHostClass"))
    {
      v18 = [v11 objectForKeyedSubscript:@"NSExtensionAttributes"];
      if (!v18)
      {
LABEL_61:
        BOOL v36 = 1;
        id v5 = v89;
        uint64_t v19 = (void *)v90;
        id v20 = (id)v88;
        goto LABEL_67;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = a4;
        if (MIHasStringValueOfNonZeroLengthIfDefined(v18, @"NSExtensionPointName"))
        {
          if (MIHasStringValueOfNonZeroLengthIfDefined(v18, @"NSExtensionPointVersion"))
          {
            if (![(MIPluginKitBundle *)self isSiriIntentsExtension]
              && ![(MIPluginKitBundle *)self isSiriIntentsUIExtension])
            {
              goto LABEL_61;
            }
            v42 = [v18 objectForKeyedSubscript:@"IntentsSupported"];
            objc_opt_class();
            v43 = _MIValidateObject(v42);

            if (v43 && (objc_opt_class(), MIArrayContainsOnlyClass(v43)) && [v43 count])
            {
              v44 = [v18 objectForKeyedSubscript:@"IntentsRestrictedWhileLocked"];
              if (!v44)
              {
LABEL_60:

                goto LABEL_61;
              }
              v85 = v43;
              objc_opt_class();
              v86 = v44;
              uint64_t v45 = _MIValidateObject(v44);
              if (v45)
              {
                v46 = (void *)v45;
                objc_opt_class();
                char v47 = MIArrayContainsOnlyClass(v44);

                if (v47)
                {
                  long long v94 = 0u;
                  long long v95 = 0u;
                  long long v92 = 0u;
                  long long v93 = 0u;
                  id obj = v86;
                  uint64_t v48 = [obj countByEnumeratingWithState:&v92 objects:v97 count:16];
                  if (v48)
                  {
                    uint64_t v49 = v48;
                    uint64_t v50 = *(void *)v93;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v49; ++i)
                      {
                        if (*(void *)v93 != v50) {
                          objc_enumerationMutation(obj);
                        }
                        if (![v85 containsObject:*(void *)(*((void *)&v92 + 1) + 8 * i)])
                        {
                          v74 = [(MIBundle *)self bundleURL];
                          v75 = [v74 path];
                          uint64_t v83 = [(MIBundle *)self identifier];
                          uint64_t v77 = _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 429, @"MIInstallerErrorDomain", 116, 0, &unk_1F170EF80, @"Siri Intents Appex bundle at %@ with id %@ specifies a value in the IntentsRestrictedWhileLocked key's array value in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist that is not a listed in the the IntentsSupported key's array.", v78, (uint64_t)v75);

                          id v17 = (id)v83;
                          goto LABEL_76;
                        }
                      }
                      uint64_t v49 = [obj countByEnumeratingWithState:&v92 objects:v97 count:16];
                      if (v49) {
                        continue;
                      }
                      break;
                    }
                  }

                  v43 = v85;
                  v44 = v86;
                  goto LABEL_60;
                }
              }
              id obj = [(MIBundle *)self bundleURL];
              v74 = [obj path];
              v75 = [(MIBundle *)self identifier];
              uint64_t v77 = _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 421, @"MIInstallerErrorDomain", 115, 0, &unk_1F170EF58, @"Siri Intents Appex bundle at %@ with id %@ defines an IntentsRestrictedWhileLocked key in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist, but that key's value is not an array of strings.", v76, (uint64_t)v74);
LABEL_76:

              id v17 = (id)v77;
            }
            else
            {
              [(MIBundle *)self bundleURL];
              v70 = v69 = v43;
              v71 = [v70 path];
              v82 = [(MIBundle *)self identifier];
              uint64_t v73 = _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 412, @"MIInstallerErrorDomain", 114, 0, &unk_1F170EF30, @"Siri Intents Appex bundle at %@ with id %@ does not define an IntentsSupported key with an array value containing strings in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist.", v72, (uint64_t)v71);

              id v17 = (id)v73;
            }
            goto LABEL_31;
          }
          v63 = [(MIBundle *)self bundleURL];
          v64 = [v63 path];
          v65 = [(MIBundle *)self identifier];
          _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 403, @"MIInstallerErrorDomain", 49, 0, &unk_1F170EF08, @"Appex bundle at %@ with id %@ does not define a NSExtensionPointVersion key with a string value in the NSExtensionAttributes dictionary in the NSExtension dictionary in its Info.plist", v67, (uint64_t)v64);
        }
        else
        {
          v63 = [(MIBundle *)self bundleURL];
          v64 = [v63 path];
          v65 = [(MIBundle *)self identifier];
          _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 397, @"MIInstallerErrorDomain", 48, 0, &unk_1F170EEE0, @"Appex bundle at %@ with id %@ does not define a NSExtensionPointName key with a string value in the NSExtensionAttributes dictionary in the NSExtension dictionary in its Info.plist", v66, (uint64_t)v64);
        uint64_t v68 = };

        id v17 = (id)v68;
        id v5 = v89;
LABEL_32:
        uint64_t v19 = (void *)v90;
        id v20 = (id)v88;
        if (v35)
        {
LABEL_66:
          id v17 = v17;
          BOOL v36 = 0;
          *uint64_t v35 = v17;
          goto LABEL_67;
        }
        goto LABEL_33;
      }
      v59 = [(MIBundle *)self bundleURL];
      v60 = [v59 path];
      v81 = [(MIBundle *)self identifier];
      uint64_t v62 = _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 390, @"MIInstallerErrorDomain", 47, 0, &unk_1F170EEB8, @"Appex bundle at %@ with id %@ does not define a NSExtensionAttributes key with a dictionary value in the NSExtension dictionary in its Info.plist", v61, (uint64_t)v60);

      id v17 = (id)v62;
LABEL_31:
      id v5 = v89;
      uint64_t v35 = a4;
      goto LABEL_32;
    }
    v56 = [(MIBundle *)self bundleURL];
    v57 = [v56 path];
    v80 = [(MIBundle *)self identifier];
    uint64_t v34 = _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 381, @"MIInstallerErrorDomain", 68, 0, &unk_1F170EE90, @"Appex bundle at %@ with id %@ does not have a string value for the NSExtensionViewControllerHostClass key in the NSExtension dictionary in its Info.plist", v58, (uint64_t)v57);

LABEL_30:
    v18 = 0;
    id v17 = (id)v34;
    goto LABEL_31;
  }
  v30 = [(MIBundle *)self bundleURL];
  v31 = [v30 path];
  v32 = [(MIBundle *)self identifier];
  _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 357, @"MIInstallerErrorDomain", 42, 0, &unk_1F170EDF0, @"Appex bundle at %@ with id %@ does not define either an NSExtensionMainStoryboard or NSExtensionPrincipalClass key with a string value in the NSExtension dictionary in its Info.plist", v33, (uint64_t)v31);
  uint64_t v54 = LABEL_64:;

  id v20 = (id)v88;
  v18 = 0;
  id v17 = (id)v54;
  uint64_t v19 = (void *)v90;
LABEL_65:
  uint64_t v35 = a4;
  if (a4) {
    goto LABEL_66;
  }
LABEL_33:
  BOOL v36 = 0;
LABEL_67:

  return v36;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  id v17 = 0;
  id v5 = [(MIPluginKitBundle *)self overlaidInfoPlistWithError:&v17];
  id v6 = v17;
  id v7 = v6;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)MIPluginKitBundle;
    id v16 = v6;
    unsigned int v8 = [(MIAppExtensionBundle *)&v15 validateBundleMetadataWithError:&v16];
    id v9 = v16;

    if (!v8)
    {
      BOOL v11 = 0;
LABEL_8:
      id v7 = v9;
      if (!a3) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
    id v14 = v9;
    BOOL v10 = [(MIPluginKitBundle *)self _validateXPCServiceWithOverlaidDictionary:v5 error:&v14];
    id v7 = v14;

    if (v10)
    {
      id v13 = v7;
      BOOL v11 = [(MIPluginKitBundle *)self _validateNSExtensionWithOverlaidDictionary:v5 error:&v13];
      id v9 = v13;

      goto LABEL_8;
    }
  }
  BOOL v11 = 0;
  if (!a3) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v11) {
    *a3 = v7;
  }
LABEL_11:

  return v11;
}

- (NSDictionary)overlaidInfoPlist
{
  return self->_overlaidInfoPlist;
}

- (void)setOverlaidInfoPlist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaidInfoPlist, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
}

@end