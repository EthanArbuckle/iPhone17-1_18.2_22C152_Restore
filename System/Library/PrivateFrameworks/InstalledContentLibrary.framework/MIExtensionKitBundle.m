@interface MIExtensionKitBundle
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)_validateDelegateClassWithError:(id *)a3;
- (BOOL)_validatePresenceOfSwiftEntrySectionInFile:(int)a3 shouldHaveSwiftEntry:(BOOL)a4 withError:(id *)a5;
- (BOOL)getMayTargetThirdPartyExtensionPoint:(BOOL *)a3 withError:(id *)a4;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (NSDictionary)extensionAttributes;
- (id)extensionPointIdentifier;
@end

@implementation MIExtensionKitBundle

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MIExtensionKitBundle;
  v6 = objc_msgSendSuper2(&v8, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a4, a5, a6);
  return v6;
}

- (id)extensionPointIdentifier
{
  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (!extensionPointIdentifier)
  {
    v4 = [(MIExtensionKitBundle *)self extensionAttributes];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
      objc_opt_class();
      id v7 = v6;
      if (objc_opt_isKindOfClass()) {
        objc_super v8 = (NSString *)v7;
      }
      else {
        objc_super v8 = 0;
      }

      v9 = self->_extensionPointIdentifier;
      self->_extensionPointIdentifier = v8;
    }
    extensionPointIdentifier = self->_extensionPointIdentifier;
  }
  return extensionPointIdentifier;
}

- (NSDictionary)extensionAttributes
{
  extensionAttributes = self->_extensionAttributes;
  if (!extensionAttributes)
  {
    v4 = [(MIBundle *)self infoPlistSubset];
    v5 = [v4 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = (NSDictionary *)v6;
    }
    else {
      id v7 = 0;
    }

    objc_super v8 = self->_extensionAttributes;
    self->_extensionAttributes = v7;

    extensionAttributes = self->_extensionAttributes;
  }
  return extensionAttributes;
}

- (BOOL)getMayTargetThirdPartyExtensionPoint:(BOOL *)a3 withError:(id *)a4
{
  BOOL v5 = [(MIBundle *)self isApplicableToOSVersionEarlierThan:@"17.0", a4];
  if (a3) {
    *a3 = !v5;
  }
  return 1;
}

- (BOOL)_validatePresenceOfSwiftEntrySectionInFile:(int)a3 shouldHaveSwiftEntry:(BOOL)a4 withError:(id *)a5
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  objc_super v8 = [(MIExecutableBundle *)self executableURL];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__MIExtensionKitBundle__validatePresenceOfSwiftEntrySectionInFile_shouldHaveSwiftEntry_withError___block_invoke;
  v18[3] = &unk_1E62E6FA8;
  v18[4] = &v20;
  BOOL v19 = a4;
  v9 = (void *)MEMORY[0x1C1878AA0](v18);
  id v10 = v8;
  if (parse_macho_iterate_slices_fd(a3, [v10 fileSystemRepresentation], (uint64_t)v9))
  {
    if (*((unsigned char *)v21 + 24))
    {
      id v12 = 0;
      int v13 = 1;
      goto LABEL_9;
    }
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:]", 137, @"MIInstallerErrorDomain", 73, 0, &unk_1F170EFD0, @"Expected executable at \"%@\" %@to have a __swift5_entry section", v11, (uint64_t)v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    int v13 = *((unsigned __int8 *)v21 + 24);
    if (!a5) {
      goto LABEL_9;
    }
  }
  else
  {
    v14 = [v10 path];
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:]", 131, @"MIInstallerErrorDomain", 73, 0, &unk_1F170EFA8, @"Could not iterate slices in macho %@", v15, (uint64_t)v14);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    int v13 = 0;
    *((unsigned char *)v21 + 24) = 0;
    if (!a5) {
      goto LABEL_9;
    }
  }
  if (!v13)
  {
    id v12 = v12;
    *a5 = v12;
    int v13 = *((unsigned __int8 *)v21 + 24);
  }
LABEL_9:
  BOOL v16 = v13 != 0;

  _Block_object_dispose(&v20, 8);
  return v16;
}

uint64_t __98__MIExtensionKitBundle__validatePresenceOfSwiftEntrySectionInFile_shouldHaveSwiftEntry_withError___block_invoke(uint64_t a1, int a2, mach_header_64 *mhp)
{
  unint64_t size = 0;
  v4 = getsectiondata(mhp, "__TEXT", "__swift5_entry", &size);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(unsigned char *)(a1 + 40) == (((unint64_t)v4 | size) != 0);
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (BOOL)_validateDelegateClassWithError:(id *)a3
{
  BOOL v5 = [(MIExecutableBundle *)self executableURL];
  id v6 = [(MIExtensionKitBundle *)self extensionAttributes];
  id v7 = [v6 objectForKeyedSubscript:@"EXPrincipalClass"];

  if (v7)
  {
    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass())
    {
      if ([v8 length])
      {

        goto LABEL_5;
      }
      uint64_t v11 = [(MIBundle *)self bundleURL];
      id v12 = [v11 path];
      v30 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]", 167, @"MIInstallerErrorDomain", 185, 0, &unk_1F170EFF8, @"Appex bundle at %@ with id %@ defines an EXPrincipalClass key in the EXAppExtensionAttributes dictionary in its Info.plist with a zero length string.", v20, (uint64_t)v12);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      id v8 = [(MIBundle *)self bundleURL];
      uint64_t v11 = [v8 path];
      id v12 = [(MIBundle *)self identifier];
      _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]", 171, @"MIInstallerErrorDomain", 183, 0, &unk_1F170F020, @"Appex bundle at %@ with id %@ defines an EXPrincipalClass key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string.", v13, (uint64_t)v11);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_17;
  }
LABEL_5:
  if ([(MIBundle *)self isPlaceholder])
  {
    id v9 = 0;
    char v10 = 1;
    goto LABEL_20;
  }
  id v14 = v5;
  uint64_t v15 = open((const char *)[v14 fileSystemRepresentation], 256);
  if ((v15 & 0x80000000) != 0)
  {
    int v21 = *__error();
    uint64_t v22 = (void *)*MEMORY[0x1E4F28798];
    id v23 = v14;
    uint64_t v24 = [v23 fileSystemRepresentation];
    strerror(v21);
    v26 = _CreateError((uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]", 181, v22, v21, 0, 0, @"Failed to open %s: %s", v25, v24);
    v27 = [v23 path];
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]", 181, @"MIInstallerErrorDomain", 73, v26, &unk_1F170F048, @"Failed to open executable %@ to validate sections.", v28, (uint64_t)v27);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    char v10 = 0;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  int v16 = v15;
  id v31 = 0;
  BOOL v17 = [(MIExtensionKitBundle *)self _validatePresenceOfSwiftEntrySectionInFile:v15 shouldHaveSwiftEntry:v7 == 0 withError:&v31];
  id v18 = v31;
  BOOL v19 = v18 == 0;
  char v10 = v17 && v19;
  if (v17 && v19) {
    id v9 = 0;
  }
  else {
    id v9 = v18;
  }
  close(v16);
  if (a3)
  {
LABEL_18:
    if ((v10 & 1) == 0)
    {
      id v9 = v9;
      char v10 = 0;
      *a3 = v9;
    }
  }
LABEL_20:

  return v10 & 1;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  BOOL v5 = [(MIExtensionKitBundle *)self extensionAttributes];
  id v6 = [(MIExtensionKitBundle *)self extensionPointIdentifier];
  BOOL v7 = [(MIAppExtensionBundle *)self targetsAppleExtensionPoint];
  v52.receiver = self;
  v52.super_class = (Class)MIExtensionKitBundle;
  id v53 = 0;
  unsigned int v8 = [(MIAppExtensionBundle *)&v52 validateBundleMetadataWithError:&v53];
  id v9 = v53;
  id v10 = v9;
  if (!v8) {
    goto LABEL_17;
  }
  id v51 = v9;
  BOOL v11 = [(MIAppExtensionBundle *)self validateHasNoDotInBundleIDSuffix:&v51];
  id v12 = v51;

  if (!v11)
  {
    id v16 = 0;
    if (!a3)
    {
LABEL_28:
      BOOL v20 = 0;
      BOOL v19 = 0;
      goto LABEL_29;
    }
LABEL_20:
    id v12 = v12;
    BOOL v20 = 0;
    BOOL v19 = 0;
    *a3 = v12;
    goto LABEL_29;
  }
  if (!v5)
  {
    int v21 = [(MIBundle *)self bundleURL];
    uint64_t v22 = [v21 path];
    v41 = [(MIBundle *)self identifier];
    uint64_t v24 = _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 225, @"MIInstallerErrorDomain", 182, 0, &unk_1F170F070, @"Appex bundle at %@ with id %@ does not define an EXAppExtensionAttributes dictionary in its Info.plist", v23, (uint64_t)v22);

    id v16 = 0;
    id v12 = (id)v24;
    goto LABEL_27;
  }
  id v50 = v12;
  BOOL v13 = [(MIExtensionKitBundle *)self _validateDelegateClassWithError:&v50];
  id v10 = v50;

  if (!v13)
  {
LABEL_17:
    id v16 = 0;
    id v12 = v10;
    if (!a3) {
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
  if (!v14)
  {
    int v21 = [(MIBundle *)self bundleURL];
    uint64_t v25 = [v21 path];
    v42 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 258, @"MIInstallerErrorDomain", 45, 0, &unk_1F170F110, @"Appex bundle at %@ with id %@ does not define the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist.", v26, (uint64_t)v25);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v16 = 0;
    goto LABEL_27;
  }
  uint64_t v15 = (void *)v14;
  objc_opt_class();
  id v16 = v15;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    int v21 = [(MIBundle *)self bundleURL];
    v27 = [v21 path];
    uint64_t v28 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 254, @"MIInstallerErrorDomain", 45, 0, &unk_1F170F0E8, @"Appex bundle at %@ with id %@ defines an EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string.", v29, (uint64_t)v27);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if ((MIIsValidRDNSString(v16) & 1) == 0)
  {
    v27 = [(MIBundle *)self bundleURL];
    uint64_t v28 = [v27 path];
    uint64_t v43 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 240, @"MIInstallerErrorDomain", 46, 0, &unk_1F170F098, @"Appex bundle at %@ with id %@ does not have a legal value for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@",
      v30,
      (uint64_t)v28);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v10 = (id)v43;
    int v21 = v16;
    goto LABEL_25;
  }
  char v49 = 0;
  id v48 = v10;
  BOOL v17 = [(MIExtensionKitBundle *)self getMayTargetThirdPartyExtensionPoint:&v49 withError:&v48];
  id v12 = v48;

  if (!v17)
  {
LABEL_31:
    int v21 = v16;
    goto LABEL_27;
  }
  if (v49) {
    char v18 = 1;
  }
  else {
    char v18 = v7;
  }
  if ((v18 & 1) == 0)
  {
    v32 = [(MIBundle *)self bundleURL];
    v33 = [v32 path];
    v44 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 250, @"MIInstallerErrorDomain", 59, 0, &unk_1F170F0C0, @"Appex bundle at %@ with id %@ does not specify an Apple extension point as the value of the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@",
      v34,
    uint64_t v35 = (uint64_t)v33);

    id v12 = (id)v35;
    goto LABEL_31;
  }

  if (!v6)
  {
    int v21 = [(MIBundle *)self bundleURL];
    v36 = [v21 path];
    v45 = [(MIBundle *)self identifier];
    uint64_t v38 = _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 264, @"MIInstallerErrorDomain", 45, 0, &unk_1F170F138, @"Appex bundle at %@ with id %@ does not define an extension point in its Info.plist", v37, (uint64_t)v36);

    id v12 = (id)v38;
LABEL_27:

    if (!a3) {
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  if (v7
    && ![(MIExecutableBundle *)self allowsAppleAppExtensionsNotInExtensionCache])
  {
    id v47 = v12;
    BOOL v19 = [(MIAppExtensionBundle *)self extensionCacheEntryWithError:&v47];
    id v39 = v47;

    if (v19)
    {
      BOOL v20 = 1;
      id v12 = v39;
      goto LABEL_29;
    }
    int v21 = [(MIBundle *)self bundleURL];
    v27 = [v21 path];
    v46 = [(MIBundle *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 272, @"MIInstallerErrorDomain", 59, v39, &unk_1F170F160, @"Appex bundle at %@ with id %@ specifies a value (%@) for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist that does not correspond to a known extension point.", v40, (uint64_t)v27);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_26;
  }
  BOOL v19 = 0;
  BOOL v20 = 1;
LABEL_29:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
}

@end