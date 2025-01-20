@interface MIAppExtensionBundle
- (BOOL)targetsAppleExtensionPoint;
- (BOOL)targetsBrowserExtensionPoint;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (BOOL)validateHasCorrespondingEntitlements:(id)a3 error:(id *)a4;
- (BOOL)validateHasNoDotInBundleIDSuffix:(id *)a3;
- (Class)dataContainerClass;
- (NSDictionary)extensionCacheEntry;
- (NSString)extensionPointIdentifier;
- (NSString)validationOverrideParentBundleID;
- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
- (id)dataContainerForPersona:(id)a3 error:(id *)a4;
- (id)extensionCacheEntryWithError:(id *)a3;
- (id)initForTesting;
- (id)minimumOSVersion;
- (unint64_t)extensionPoint;
- (void)setBundleParentDirectoryURL:(id)a3;
- (void)setExtensionCacheEntry:(id)a3;
- (void)setExtensionPoint:(unint64_t)a3;
- (void)setValidationOverrideParentBundleID:(id)a3;
@end

@implementation MIAppExtensionBundle

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)MIAppExtensionBundle;
  return [(MIExecutableBundle *)&v3 initForTesting];
}

- (id)minimumOSVersion
{
  v6.receiver = self;
  v6.super_class = (Class)MIAppExtensionBundle;
  objc_super v3 = [(MIBundle *)&v6 minimumOSVersion];
  if (!v3)
  {
    v4 = [(MIBundle *)self parentBundle];
    objc_super v3 = [v4 minimumOSVersion];
  }
  return v3;
}

- (Class)dataContainerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)targetsAppleExtensionPoint
{
  v2 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
  char v3 = [v2 hasPrefix:@"com.apple."];

  return v3;
}

- (unint64_t)extensionPoint
{
  unint64_t extensionPoint = self->_extensionPoint;
  if (!extensionPoint)
  {
    v4 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
    if ([v4 isEqualToString:@"com.apple.web-browser-engine.content"])
    {
      unint64_t extensionPoint = 1;
    }
    else if ([v4 isEqualToString:@"com.apple.web-browser-engine.networking"])
    {
      unint64_t extensionPoint = 3;
    }
    else if ([v4 isEqualToString:@"com.apple.web-browser-engine.rendering"])
    {
      unint64_t extensionPoint = 2;
    }
    else
    {
      unint64_t extensionPoint = -1;
    }
    self->_unint64_t extensionPoint = extensionPoint;
  }
  return extensionPoint;
}

- (BOOL)targetsBrowserExtensionPoint
{
  return [(MIAppExtensionBundle *)self extensionPoint] - 1 < 3;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MIAppExtensionBundle;
  [(MIExecutableBundle *)&v3 setBundleParentDirectoryURL:a3];
}

- (id)dataContainerForPersona:(id)a3 error:(id *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MIAppExtensionBundle;
  v4 = [(MIExecutableBundle *)&v6 dataContainerForPersona:a3 error:a4];
  return v4;
}

- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  BOOL v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)MIAppExtensionBundle;
  uint64_t v9 = [(MIExecutableBundle *)&v15 dataContainerCreatingIfNeeded:a3 forPersona:a4 makeLive:a5 created:&v16 error:a7];
  v10 = (void *)v9;
  BOOL v11 = v16;
  if (a6) {
    *a6 = v16;
  }
  if (v9) {
    BOOL v12 = !v11;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    v13 = [(MIBundle *)self parentBundleID];
    [v10 setParentBundleID:v13];
  }
  return v10;
}

- (BOOL)validateHasNoDotInBundleIDSuffix:(id *)a3
{
  v5 = [(MIBundle *)self parentBundleID];
  objc_super v6 = [(MIAppExtensionBundle *)self validationOverrideParentBundleID];

  if (v6)
  {
    uint64_t v7 = [(MIAppExtensionBundle *)self validationOverrideParentBundleID];

    v5 = (void *)v7;
  }
  v8 = [v5 stringByAppendingString:@"."];
  uint64_t v9 = [(MIBundle *)self identifier];
  v10 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v8, "length"));

  int v11 = [v10 containsString:@"."];
  if (v11)
  {
    BOOL v12 = [(MIBundle *)self bundleURL];
    v13 = [v12 path];
    v17 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateHasNoDotInBundleIDSuffix:]", 218, @"MIInstallerErrorDomain", 89, 0, &unk_1F170F4D0, @"Appex bundle at \"%@\" with identifier \"%@\" contains a '.' in the portion after the parent app's prefix (prefix: \"%@\" ; dot in: \"%@\").'",
      v14,
      (uint64_t)v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v15 = v15;
      *a3 = v15;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v11 ^ 1;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  v5 = [(MIBundle *)self parentBundleID];
  objc_super v6 = [(MIAppExtensionBundle *)self validationOverrideParentBundleID];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;

    v5 = v8;
  }
  uint64_t v9 = [v5 stringByAppendingString:@"."];
  v10 = [(MIBundle *)self identifier];
  if (([v10 hasPrefix:v9] & 1) == 0)
  {

    goto LABEL_10;
  }
  int v11 = [(MIBundle *)self identifier];
  unint64_t v12 = [v11 length];
  unint64_t v13 = [v9 length];

  if (v12 <= v13)
  {
LABEL_10:
    v22 = [(MIBundle *)self bundleURL];
    v23 = [v22 path];
    v24 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]", 269, @"MIInstallerErrorDomain", 37, 0, &unk_1F170F4F8, @"Appex bundle at \"%@\" with identifier \"%@\" does not have expected identifier prefix \"%@\"", v25, (uint64_t)v23);
    goto LABEL_11;
  }
  uint64_t v14 = [(MIBundle *)self infoPlistSubset];
  BOOL v15 = MIHasStringValueOfNonZeroLength(v14, *MEMORY[0x1E4F1D020], 0);

  if (v15)
  {
    BOOL v16 = [(MIBundle *)self infoPlistSubset];
    BOOL v17 = MIHasStringValueOfNonZeroLength(v16, *MEMORY[0x1E4F1CC70], 1);

    if (v17)
    {
      v18 = [(MIBundle *)self infoPlistSubset];
      BOOL v19 = MIHasStringValueOfNonZeroLength(v18, *MEMORY[0x1E4F1D008], 0);

      if (v19)
      {
        id v20 = 0;
        BOOL v21 = 1;
        goto LABEL_14;
      }
      v22 = [(MIBundle *)self bundleURL];
      v23 = [v22 path];
      v24 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]", 287, @"MIInstallerErrorDomain", 52, 0, &unk_1F170F570, @"Appex bundle at %@ with ID %@ does not have a CFBundleName key with a non-zero length string value in its Info.plist", v29, (uint64_t)v23);
    }
    else
    {
      v22 = [(MIBundle *)self bundleURL];
      v23 = [v22 path];
      v24 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]", 281, @"MIInstallerErrorDomain", 40, 0, &unk_1F170F548, @"Appex bundle at %@ with ID %@ has a CFBundleShortVersionString key with a non-string value in its Info.plist", v28, (uint64_t)v23);
    }
  }
  else
  {
    v22 = [(MIBundle *)self bundleURL];
    v23 = [v22 path];
    v24 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]", 275, @"MIInstallerErrorDomain", 33, 0, &unk_1F170F520, @"Appex bundle at %@ with ID %@ does not have a CFBundleVersion key with a non-zero length string value in its Info.plist", v27, (uint64_t)v23);
  }
LABEL_11:
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    id v20 = v20;
    BOOL v21 = 0;
    *a3 = v20;
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_14:

  return v21;
}

- (BOOL)validateHasCorrespondingEntitlements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MIBundle *)self parentBundleID];
  unint64_t v8 = [(MIAppExtensionBundle *)self extensionPoint];
  if (MIHasBrowserEngineContentEntitlement(v6))
  {
    if (v8 != 1)
    {
      uint64_t v9 = [(MIBundle *)self relativePath];
      int v11 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
      uint64_t v20 = (uint64_t)v9;
      unint64_t v12 = @"The app extension at \"%@\" has the entitlement \"%@\" which is not allowed for an extension targeting the extension point \"%@\".";
      uint64_t v13 = 317;
LABEL_21:
      uint64_t v15 = 205;
      goto LABEL_22;
    }
  }
  else if (v8 == 1)
  {
    uint64_t v9 = [(MIBundle *)self relativePath];
    int v11 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
    uint64_t v20 = (uint64_t)v9;
    unint64_t v12 = @"The app extension at \"%@\" targets the extension point \"%@\" but is missing the corresponding required \"%@\" = TRUE (BOOLean) entitlement.";
    uint64_t v13 = 322;
    goto LABEL_19;
  }
  if (MIHasBrowserEngineNetworkingEntitlement(v6))
  {
    if (v8 != 3)
    {
      uint64_t v9 = [(MIBundle *)self relativePath];
      int v11 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
      uint64_t v20 = (uint64_t)v9;
      unint64_t v12 = @"The app extension at \"%@\" has the entitlement \"%@\" which is not allowed for an extension targeting the extension point \"%@\".";
      uint64_t v13 = 329;
      goto LABEL_21;
    }
  }
  else if (v8 == 3)
  {
    uint64_t v9 = [(MIBundle *)self relativePath];
    int v11 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
    uint64_t v20 = (uint64_t)v9;
    unint64_t v12 = @"The app extension at \"%@\" targets the extension point \"%@\" but is missing the corresponding required \"%@\" = TRUE (BOOLean) entitlement.";
    uint64_t v13 = 334;
    goto LABEL_19;
  }
  if (!MIHasBrowserEngineRenderingEntitlement(v6))
  {
    if (v8 != 2)
    {
      if (v8 != 1)
      {
LABEL_30:
        id v16 = 0;
        BOOL v17 = 1;
        goto LABEL_31;
      }
      v18 = MICopyMemoryTransferAcceptEntitlement(v6);
      uint64_t v9 = v18;
      if (v18 && v7 && ![v18 isEqualToString:v7])
      {
        int v11 = [(MIBundle *)self relativePath];
        uint64_t v20 = (uint64_t)v11;
        unint64_t v12 = @"The app extension at \"%@\" specifies the entitlement \"%@\" = \"%@\" where the value does not match the parent app bundle's CFBundleIdentifier, \"%@\". This entitlement, if set, must have a value that matches the bundle identifier of the parent app.";
        uint64_t v13 = 357;
        goto LABEL_33;
      }
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v9 = [(MIBundle *)self relativePath];
    int v11 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
    uint64_t v20 = (uint64_t)v9;
    unint64_t v12 = @"The app extension at \"%@\" targets the extension point \"%@\" but is missing the corresponding required \"%@\" = TRUE (BOOLean) entitlement.";
    uint64_t v13 = 346;
LABEL_19:
    uint64_t v15 = 206;
    goto LABEL_22;
  }
  if (v8 != 2)
  {
    uint64_t v9 = [(MIBundle *)self relativePath];
    int v11 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
    uint64_t v20 = (uint64_t)v9;
    unint64_t v12 = @"The app extension at \"%@\" has the entitlement \"%@\" which is not allowed for an extension targeting the extension point \"%@\".";
    uint64_t v13 = 341;
    goto LABEL_21;
  }
  uint64_t v14 = MICopyMemoryTransferSendEntitlement(v6);
  uint64_t v9 = v14;
  if (!v14 || !v7 || [v14 isEqualToString:v7]) {
    goto LABEL_29;
  }
  int v11 = [(MIBundle *)self relativePath];
  uint64_t v20 = (uint64_t)v11;
  unint64_t v12 = @"The app extension at \"%@\" specifies the entitlement \"%@\" = \"%@\" where the value does not match the parent app bundle's CFBundleIdentifier, \"%@\". This entitlement, if set, must have a value that matches the bundle identifier of the parent app.";
  uint64_t v13 = 365;
LABEL_33:
  uint64_t v15 = 207;
LABEL_22:
  _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateHasCorrespondingEntitlements:error:]", v13, @"MIInstallerErrorDomain", v15, 0, 0, v12, v10, v20);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    id v16 = v16;
    BOOL v17 = 0;
    *a4 = v16;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_31:

  return v17;
}

- (id)extensionCacheEntryWithError:(id *)a3
{
  v5 = [(MIAppExtensionBundle *)self extensionPointIdentifier];
  p_extensionCacheEntry = &self->_extensionCacheEntry;
  uint64_t v7 = self->_extensionCacheEntry;
  if (v7)
  {
    unint64_t v8 = v7;
    goto LABEL_11;
  }
  if (!v5)
  {
    unint64_t v12 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle extensionCacheEntryWithError:]", 391, @"MIInstallerErrorDomain", 45, 0, 0, @"Extension point identifier was not set for app extension with bundle ID \"%@\".", v13, (uint64_t)v12);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    if (a3)
    {
      id v11 = v11;
      uint64_t v10 = 0;
      *a3 = v11;
    }
    else
    {
      uint64_t v10 = 0;
    }
    goto LABEL_10;
  }
  uint64_t active_platform = dyld_get_active_platform();
  id v15 = 0;
  uint64_t v10 = MICopyExtensionCacheEntryWithPlatform(v5, active_platform, &v15);
  id v11 = v15;
  if (!v10) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)p_extensionCacheEntry, v10);
LABEL_10:
  unint64_t v8 = v10;

LABEL_11:
  return v8;
}

- (void)setExtensionCacheEntry:(id)a3
{
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (void)setExtensionPoint:(unint64_t)a3
{
  self->_unint64_t extensionPoint = a3;
}

- (NSString)validationOverrideParentBundleID
{
  return self->_validationOverrideParentBundleID;
}

- (void)setValidationOverrideParentBundleID:(id)a3
{
}

- (NSDictionary)extensionCacheEntry
{
  return self->_extensionCacheEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionCacheEntry, 0);
  objc_storeStrong((id *)&self->_validationOverrideParentBundleID, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
}

@end