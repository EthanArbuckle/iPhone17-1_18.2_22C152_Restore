@interface LSBundleRecordBuilder
- (BOOL)containerized;
- (BOOL)parseInfoPlist:(id)a3;
- (BOOL)parseInstallationInfo:(id)a3;
- (BOOL)registerChildItemsTrusted;
- (BOOL)webNotificationPlaceholder;
- (LSBundleData)buildBundleData:(SEL)a3 error:(id)a4;
- (NSArray)URLClaims;
- (NSArray)activityTypes;
- (NSArray)alternateNames;
- (NSArray)bgPermittedIdentifiers;
- (NSArray)bundlePersonas;
- (NSArray)carPlayInstrumentClusterURLSchemes;
- (NSArray)deviceFamily;
- (NSArray)documentClaims;
- (NSArray)driverExtensionPaths;
- (NSArray)exportedTypes;
- (NSArray)iconFileNames;
- (NSArray)importedTypes;
- (NSArray)libraryItems;
- (NSArray)machOUUIDs;
- (NSArray)parentApplicationIdentifiers;
- (NSArray)queriableSchemes;
- (NSArray)slices;
- (NSArray)supportedComplicationFamilies;
- (NSDictionary)distributorInfo;
- (NSDictionary)entitlements;
- (NSDictionary)extensionSDK;
- (NSDictionary)groupContainers;
- (NSDictionary)iconsDict;
- (NSDictionary)intentDefinitionURLs;
- (NSDictionary)localizedIdentityUsageDescription;
- (NSDictionary)localizedMicrophoneUsageDescription;
- (NSDictionary)localizedNames;
- (NSDictionary)localizedShortNames;
- (NSDictionary)localizedStrings;
- (NSDictionary)mobileInstallIDs;
- (NSDictionary)pluginMIDicts;
- (NSDictionary)pluginPlists;
- (NSDictionary)sandboxEnvironmentVariables;
- (NSDictionary)stashedAppInfo;
- (NSDictionary)unlocalizedNamesWithContext;
- (NSMutableSet)counterpartAppBundleIDs;
- (NSMutableSet)equivalentBundleIDs;
- (NSNumber)compatibilityState;
- (NSNumber)directoryClass;
- (NSNumber)downloaderDSID;
- (NSNumber)familyID;
- (NSNumber)genreID;
- (NSNumber)installFailureReason;
- (NSNumber)installType;
- (NSNumber)itemID;
- (NSNumber)purchaserDSID;
- (NSNumber)ratingRank;
- (NSNumber)signatureVersion;
- (NSNumber)staticDiskUsage;
- (NSNumber)storefront;
- (NSNumber)versionID;
- (NSString)alternatePrimaryIconName;
- (NSString)appStoreToolsBuildVersion;
- (NSString)appType;
- (NSString)appVariant;
- (NSString)applicationManagementDomain;
- (NSString)bundleName;
- (NSString)categoryType;
- (NSString)codeInfoIdentifier;
- (NSString)complicationPrincipalClass;
- (NSString)displayName;
- (NSString)execPath;
- (NSString)genre;
- (NSString)identifier;
- (NSString)identityUsageDescription;
- (NSString)itemName;
- (NSString)libraryPath;
- (NSString)linkedParentBundleID;
- (NSString)managementDeclarationIdentifier;
- (NSString)maxSystemVersion;
- (NSString)microphoneUsageDescription;
- (NSString)minSystemVersion;
- (NSString)primaryIconName;
- (NSString)ratingLabel;
- (NSString)sdkVersion;
- (NSString)secondCategoryType;
- (NSString)shortDisplayName;
- (NSString)shortVersionString;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSString)sourceAppBundleID;
- (NSString)teamID;
- (NSString)vendorName;
- (NSString)version;
- (NSString)watchKitVersion;
- (NSURL)bundleContainerURL;
- (NSURL)dataContainerURL;
- (id)_LSBundleFlagMap;
- (id)_LSKeyTypeMap;
- (id)_LSPlistRaritiesMap;
- (id)iconsDictionaryFromDict:(id)a3;
- (id)truncate:(BOOL *)a3 queriableSchemesIfNeeded:(id)a4;
- (int)activateBindings:(id)a3 unitID:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
- (int)registerQueriableSchemes:(id)a3 bundleData:(LSBundleData *)a4;
- (unint64_t)sequenceNumber;
- (unsigned)previousInstallType;
- (unsigned)profileValidationState;
- (unsigned)registerBundleRecord:(id)a3 error:(id *)a4;
- (unsigned)retries;
- (void)addBundleFlag:(unint64_t)a3;
- (void)addIconFlag:(unsigned __int8)a3;
- (void)addItemInfoFlag:(unsigned int)a3;
- (void)addPlistFlag:(unsigned int)a3;
- (void)parseActivityTypesFromDictionary:(id)a3;
- (void)parseArchitecturesFromDict:(id)a3;
- (void)parseDeviceFamilyFromDict:(id)a3;
- (void)parseDocumentClaimsFromDict:(id)a3;
- (void)parseIconFilenamesFromDict:(id)a3 forPlatform:(unsigned int)a4;
- (void)parseNSExtensionSDKDefinitionsFromDictionary:(id)a3;
- (void)parseURLClaimsFromDict:(id)a3;
- (void)setCommonInfoPlistKeysFromDictionary:(id)a3;
- (void)setFlagsFromDictionary:(id)a3;
- (void)setPreviousInstallType:(unsigned int)a3;
- (void)setProfileValidationState:(unsigned __int8)a3;
- (void)setRaritiesFromDictionary:(id)a3;
- (void)setRegistrationInfo:(id)a3 alias:(id)a4;
- (void)setRetries:(unsigned __int8)a3;
- (void)setSequenceNumber:(unint64_t)a3;
@end

@implementation LSBundleRecordBuilder

- (void)setRegistrationInfo:(id)a3 alias:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9) {
    v7 = (LSRegistrationInfo *)[v9 mutableCopy];
  }
  else {
    v7 = objc_alloc_init(LSRegistrationInfo);
  }
  registrationInfo = self->_registrationInfo;
  self->_registrationInfo = v7;

  self->_bundleClass = self->_registrationInfo->bundleClass;
  self->_itemFlags = self->_registrationInfo->itemFlags;
  if (v6) {
    objc_storeStrong((id *)&self->_bundleAlias, a4);
  }
  *(void *)&self->_hfsCreator = self->_registrationInfo->inoExec;
}

- (void)addBundleFlag:(unint64_t)a3
{
  self->_bundleFlags |= a3;
}

- (void)addPlistFlag:(unsigned int)a3
{
  self->_plistContentFlags |= a3;
}

- (void)addIconFlag:(unsigned __int8)a3
{
  self->_iconFlags |= a3;
}

- (void)addItemInfoFlag:(unsigned int)a3
{
  self->_itemFlags |= a3;
}

- (int)registerQueriableSchemes:(id)a3 bundleData:(LSBundleData *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  context = (void *)MEMORY[0x18530F680]();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  char v28 = 0;
  id v6 = self->_exportedTypes;
  if (v6)
  {
    v7 = v6;
    v8 = [(LSBundleRecordBuilder *)self truncate:&v28 queriableSchemesIfNeeded:v6];

    [v5 addObjectsFromArray:v8];
  }
  else
  {
    v8 = 0;
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = self->_documentClaims;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    uint64_t v12 = *MEMORY[0x1E4F1CCB0];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = [v14 objectForKey:v12];
          v17 = (void *)v16;
          if (v15 && v16)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v17 = 0;
LABEL_16:

              continue;
            }
          }
          else if (!v16)
          {
            goto LABEL_16;
          }
          [v5 addObjectsFromArray:v17];
          goto LABEL_16;
        }
      }
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  if (!v5 || ![v5 count])
  {
    int v19 = 0;
    a4->types = 0;
LABEL_27:
    if (v28) {
      *(_WORD *)&self->_moreFlags |= 0x40u;
    }
    goto LABEL_29;
  }
  v18 = [v5 allObjects];
  a4->types = _LSDatabaseCreateStringArray(v23, v18, 1, 0);

  if (a4->types) {
    int v19 = 0;
  }
  else {
    int v19 = -9493;
  }
  if (a4->types) {
    goto LABEL_27;
  }
LABEL_29:

  return v19;
}

- (id)truncate:(BOOL *)a3 queriableSchemesIfNeeded:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  _LSMakeVersionNumber(15, 0, 0, &v19);
  v7 = +[_LSCanOpenURLManager sharedManager];
  unint64_t v8 = [v7 schemeQueryLimit];

  long long v9 = *(_OWORD *)&self->_sdkVersionNumber._opaque[8];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)&self->_supportedGameControllers;
  *(_OWORD *)&v16[16] = v9;
  v21[0] = v19;
  v21[1] = v20;
  if ((unint64_t)_LSVersionNumberCompare(v16, v21) > 1 || [v6 count] <= v8)
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v10 = _LSInstallLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      installType = self->_installType;
      if (!installType) {
        installType = (NSNumber *)self->_shortDisplayName;
      }
      uint64_t v15 = [v6 count];
      *(_DWORD *)uint64_t v16 = 138413058;
      *(void *)&v16[4] = installType;
      *(_WORD *)&v16[12] = 2048;
      *(void *)&v16[14] = v15;
      *(_WORD *)&v16[22] = 2048;
      *(void *)&v16[24] = v8;
      __int16 v17 = 2048;
      unint64_t v18 = v8;
      _os_log_error_impl(&dword_182959000, v10, OS_LOG_TYPE_ERROR, "Application %@ has requested permission to query %llu URL schemes, but the maximum queriable is %llu. Limiting to the first %llu listed in its Info.plist.", v16, 0x2Au);
    }

    objc_msgSend(v6, "subarrayWithRange:", 0, v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v12 = 1;
    if (v11)
    {
      if (!a3) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  id v11 = v6;
  if (a3) {
LABEL_6:
  }
    *a3 = v12;
LABEL_7:

  return v11;
}

- (id)_LSBundleFlagMap
{
  if (-[LSBundleRecordBuilder _LSBundleFlagMap]::onceToken != -1) {
    dispatch_once(&-[LSBundleRecordBuilder _LSBundleFlagMap]::onceToken, &__block_literal_global_19);
  }
  v2 = (void *)-[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap;

  return v2;
}

void __41__LSBundleRecordBuilder__LSBundleFlagMap__block_invoke()
{
  v3[47] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F1CC48];
  v2[1] = @"LSHasLocalizedDisplayName";
  v3[0] = &unk_1ECB43318;
  v3[1] = &unk_1ECB43318;
  v2[2] = *MEMORY[0x1E4F1D008];
  v2[3] = @"LSUIElement";
  v3[2] = &unk_1ECB43318;
  v3[3] = &unk_1ECB43330;
  v2[4] = @"NSUIElement";
  v2[5] = @"UINewsstandApp";
  v3[4] = &unk_1ECB43330;
  v3[5] = &unk_1ECB43348;
  v2[6] = @"LSBackgroundOnly";
  v2[7] = @"NSBGOnly";
  v3[6] = &unk_1ECB43360;
  v3[7] = &unk_1ECB43360;
  v2[8] = @"LSMultipleInstancesProhibited";
  v2[9] = @"_LSIsExecutableForParentBundle";
  v3[8] = &unk_1ECB43378;
  v3[9] = &unk_1ECB43390;
  v2[10] = @"_LSInfoPlistIsMissing";
  v2[11] = @"_LSNoExecutableInfo";
  v3[10] = &unk_1ECB433A8;
  v3[11] = &unk_1ECB433C0;
  v2[12] = @"LSFileQuarantineEnabled";
  v2[13] = @"_LSRequiresOldJavaStub";
  v3[12] = &unk_1ECB433D8;
  v3[13] = &unk_1ECB433F0;
  v2[14] = @"_LSRequiresJavaRuntime";
  v2[15] = @"_LSRequiresIPhoneSimulator";
  v3[14] = &unk_1ECB43408;
  v3[15] = &unk_1ECB43420;
  v2[16] = @"LSRequiresIPhoneOS";
  v2[17] = @"_LSBundleVersionTooLow";
  v3[16] = &unk_1ECB43438;
  v3[17] = &unk_1ECB43450;
  v2[18] = @"ASAccountAuthenticationModificationOptOutOfSecurityPromptsOnSignIn";
  v2[19] = @"is-purchased-redownload";
  v3[18] = &unk_1ECB43468;
  v3[19] = &unk_1ECB43480;
  v2[20] = @"DeviceBasedVPP";
  v2[21] = @"IsPlaceholder";
  v3[20] = &unk_1ECB43498;
  v3[21] = &unk_1ECB434B0;
  v2[22] = @"HasMIDBasedSINF";
  v2[23] = @"MissingSINF";
  v3[22] = &unk_1ECB434C8;
  v3[23] = &unk_1ECB434E0;
  v2[24] = @"RestrictedDownload";
  v2[25] = @"IsParallelPlaceholder";
  v3[24] = &unk_1ECB434F8;
  v3[25] = &unk_1ECB43510;
  v2[26] = @"IsUpdatedSystemApp";
  v2[27] = @"IsDeletable";
  v3[26] = &unk_1ECB43510;
  v3[27] = &unk_1ECB43528;
  v2[28] = @"IsAdHocSigned";
  v2[29] = @"HasSettingsBundle";
  v3[28] = &unk_1ECB43540;
  v3[29] = &unk_1ECB43558;
  v2[30] = @"NSSupportsPurgeableLocalStorage";
  v2[31] = @"HasCustomNotificationKey";
  v3[30] = &unk_1ECB43570;
  v3[31] = &unk_1ECB43588;
  v2[32] = @"HasWatchGlance";
  v2[33] = @"SkipWatchAppInstall";
  v3[32] = &unk_1ECB435A0;
  v3[33] = &unk_1ECB435B8;
  v2[34] = @"SupportsAudiobooks";
  v2[35] = @"MPSupportsExternallyPlayableContent";
  v3[34] = &unk_1ECB435D0;
  v3[35] = &unk_1ECB435E8;
  v2[36] = @"UIFileSharingEnabled";
  v2[37] = @"LSSupportsOpeningDocumentsInPlace";
  v3[36] = &unk_1ECB43600;
  v3[37] = &unk_1ECB43618;
  v2[38] = @"UISupportsDocumentBrowser";
  v2[39] = @"_LSBundleIsInGenerationalStorage";
  v3[38] = &unk_1ECB43618;
  v3[39] = &unk_1ECB43630;
  v2[40] = @"_LSBundleIsApplet";
  v2[41] = @"LSApplicationIsStickerProvider";
  v3[40] = &unk_1ECB43648;
  v3[41] = &unk_1ECB43660;
  v2[42] = @"LSApplicationLaunchProhibited";
  v2[43] = @"initialODRSize";
  v3[42] = &unk_1ECB43660;
  v3[43] = &unk_1ECB43678;
  v2[44] = @"gameCenterEnabled";
  v2[45] = @"gameCenterEverEnabled";
  v3[44] = &unk_1ECB43690;
  v3[45] = &unk_1ECB436A8;
  v2[46] = @"NSApplicationRequiresArcade";
  v3[46] = &unk_1ECB436C0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:47];
  v1 = (void *)-[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap;
  -[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap = v0;
}

- (id)_LSPlistRaritiesMap
{
  if (-[LSBundleRecordBuilder _LSPlistRaritiesMap]::onceToken != -1) {
    dispatch_once(&-[LSBundleRecordBuilder _LSPlistRaritiesMap]::onceToken, &__block_literal_global_218);
  }
  v2 = (void *)-[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap;

  return v2;
}

void __44__LSBundleRecordBuilder__LSPlistRaritiesMap__block_invoke()
{
  v3[18] = *MEMORY[0x1E4F143B8];
  v2[0] = @"LSLaunchDLabel";
  v2[1] = @"LSFileQuarantineExcludedPathPatterns";
  v3[0] = &unk_1ECB436D8;
  v3[1] = &unk_1ECB436F0;
  v2[2] = @"MKDirectionsApplicationSupportedModes";
  v2[3] = @"UIBackgroundModes";
  v3[2] = &unk_1ECB43708;
  v3[3] = &unk_1ECB43720;
  v2[4] = @"AudioComponents";
  v2[5] = @"UIVPNPlugin";
  v3[4] = &unk_1ECB43738;
  v3[5] = &unk_1ECB43750;
  v2[6] = @"SBAppTags";
  v2[7] = @"UIRequiredDeviceCapabilities";
  v3[6] = &unk_1ECB43768;
  v3[7] = &unk_1ECB43780;
  v2[8] = @"UISupportedExternalAccessoryProtocols";
  v2[9] = @"LSMinimumSystemVersionByArchitecture";
  v3[8] = &unk_1ECB43798;
  v3[9] = &unk_1ECB437B0;
  v2[10] = @"LSEnvironment";
  v2[11] = @"storeCohort";
  v3[10] = &unk_1ECB437C8;
  v3[11] = &unk_1ECB437E0;
  v2[12] = @"subgenres";
  v2[13] = @"INIntentsSupported";
  v3[12] = &unk_1ECB437F8;
  v3[13] = &unk_1ECB43810;
  v2[14] = @"INIntentsRestrictedWhileLocked";
  v2[15] = @"INIntentsRestrictedWhileProtectedDataUnavailable";
  v3[14] = &unk_1ECB43810;
  v3[15] = &unk_1ECB43810;
  v2[16] = @"INSupportedMediaCategories";
  v2[17] = @"LSEligibilityDeletionDomain";
  v3[16] = &unk_1ECB43810;
  v3[17] = &unk_1ECB43828;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:18];
  v1 = (void *)-[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap;
  -[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap = v0;
}

- (id)_LSKeyTypeMap
{
  if (-[LSBundleRecordBuilder _LSKeyTypeMap]::onceToken != -1) {
    dispatch_once(&-[LSBundleRecordBuilder _LSKeyTypeMap]::onceToken, &__block_literal_global_305);
  }
  v2 = (void *)-[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap;

  return v2;
}

void __38__LSBundleRecordBuilder__LSKeyTypeMap__block_invoke()
{
  v3[13] = *MEMORY[0x1E4F143B8];
  v2[0] = @"LSLaunchDLabel";
  v3[0] = objc_opt_class();
  v2[1] = @"LSFileQuarantineExcludedPathPatterns";
  v3[1] = objc_opt_class();
  v2[2] = @"MKDirectionsApplicationSupportedModes";
  v3[2] = objc_opt_class();
  v2[3] = @"UIBackgroundModes";
  v3[3] = objc_opt_class();
  v2[4] = @"AudioComponents";
  v3[4] = objc_opt_class();
  v2[5] = @"SBAppTags";
  v3[5] = objc_opt_class();
  v2[6] = @"UIRequiredDeviceCapabilities";
  v3[6] = objc_opt_class();
  v2[7] = @"UISupportedExternalAccessoryProtocols";
  v3[7] = objc_opt_class();
  v2[8] = @"LSMinimumSystemVersionByArchitecture";
  v3[8] = objc_opt_class();
  v2[9] = @"LSEnvironment";
  v3[9] = objc_opt_class();
  v2[10] = @"storeCohort";
  v3[10] = objc_opt_class();
  v2[11] = @"subgenres";
  v3[11] = objc_opt_class();
  v2[12] = @"LSEligibilityDeletionDomain";
  v3[12] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:13];
  v1 = (void *)-[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap;
  -[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap = v0;
}

- (void)setFlagsFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(LSBundleRecordBuilder *)self _LSBundleFlagMap];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__LSBundleRecordBuilder_setFlagsFromDictionary___block_invoke;
  v14[3] = &unk_1E522DBD8;
  id v6 = v4;
  id v15 = v6;
  uint64_t v16 = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v14];

  v7 = [v6 objectForKey:*MEMORY[0x1E4F1CC48]];

  if (v7) {
    [(LSBundleRecordBuilder *)self addBundleFlag:2];
  }
  unint64_t v8 = [v6 objectForKey:@"Java"];

  if (v8) {
    [(LSBundleRecordBuilder *)self addBundleFlag:0x2000];
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v6 objectForKey:@"UIApplicationSceneManifest"];
  id v11 = (void *)v10;
  if (v9 && v10)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v11 = 0;
      goto LABEL_14;
    }
  }
  else if (!v10)
  {
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "_LS_BoolForKey:", @"CPSupportsDashboardNavigationScene")) {
    [(LSBundleRecordBuilder *)self addBundleFlag:0x4000000000000000];
  }
  if (objc_msgSend(v11, "_LS_BoolForKey:", @"CPSupportsInstrumentClusterNavigationScene")) {
    [(LSBundleRecordBuilder *)self addBundleFlag:0x8000000000000000];
  }
LABEL_14:

  registrationInfo = self->_registrationInfo;
  if (registrationInfo)
  {
    if (registrationInfo->bundleClass == 2)
    {
      char v13 = 0;
      [(LSBundleRecordBuilder *)self addItemInfoFlag:_LSGetApplicationFlagsFromPlist((const __CFDictionary *)v6, 0, (LOBYTE(registrationInfo->itemFlags) >> 3) & 1, 0, 0, &v13)];
      if (v13) {
        [(LSBundleRecordBuilder *)self addBundleFlag:0x2000000000];
      }
    }
  }
}

void __48__LSBundleRecordBuilder_setFlagsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_LS_BoolForKey:", v6)) {
    objc_msgSend(*(id *)(a1 + 40), "addBundleFlag:", objc_msgSend(v5, "unsignedLongLongValue"));
  }
}

- (void)setRaritiesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(LSBundleRecordBuilder *)self _LSPlistRaritiesMap];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__LSBundleRecordBuilder_setRaritiesFromDictionary___block_invoke;
  v7[3] = &unk_1E522DBD8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __51__LSBundleRecordBuilder_setRaritiesFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _LSKeyTypeMap];
  id v7 = (id)[v6 objectForKey:v14];

  uint64_t v8 = [*(id *)(a1 + 40) objectForKey:v14];
  uint64_t v9 = (void *)v8;
  if (v7 && v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v9 = 0;
      goto LABEL_9;
    }
  }
  else if (!v8)
  {
    goto LABEL_9;
  }
  uint64_t v10 = *(void **)(a1 + 32);
  if (!v10[15])
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    uint64_t v12 = *(void *)(a1 + 32);
    char v13 = *(void **)(v12 + 120);
    *(void *)(v12 + 120) = v11;

    uint64_t v10 = *(void **)(a1 + 32);
  }
  objc_msgSend(v10, "addPlistFlag:", objc_msgSend(v5, "unsignedLongLongValue"));
  [*(id *)(*(void *)(a1 + 32) + 120) setObject:v9 forKey:v14];
LABEL_9:
}

- (void)setCommonInfoPlistKeysFromDictionary:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__LSBundleRecordBuilder_setCommonInfoPlistKeysFromDictionary___block_invoke;
  v3[3] = &unk_1E522DC00;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __62__LSBundleRecordBuilder_setCommonInfoPlistKeysFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (_NSIsNSString() && _LSBundleInfoPlistKeyIsCommon(v10))
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 128);
    if (!v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 128);
      *(void *)(v8 + 128) = v7;

      id v6 = *(void **)(*(void *)(a1 + 32) + 128);
    }
    [v6 setObject:v5 forKey:v10];
  }
}

- (void)parseArchitecturesFromDict:(id)a3
{
  id v6 = a3;
  id v4 = [v6 objectForKey:@"_LSSliceInfosKey"];
  mobileInstallIDs = self->_mobileInstallIDs;
  self->_mobileInstallIDs = v4;
}

- (id)iconsDictionaryFromDict:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 objectForKey:@"CFBundleIcons"];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v7 = 0;
  }
  uint64_t v9 = objc_msgSend(v4, "_LS_BoolForKey:", @"UIPrerenderedIcon");
  if (v9) {
    [(LSBundleRecordBuilder *)self addIconFlag:2];
  }
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [v7 objectForKey:@"CFBundlePrimaryIcon"];
  uint64_t v12 = (void *)v11;
  if (!v10 || !v11)
  {
    if (!v11) {
      goto LABEL_15;
    }
LABEL_14:
    char v13 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
    v31 = @"CFBundleIconName";
    v32[0] = v12;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v13 setObject:v14 forKeyedSubscript:@"CFBundlePrimaryIcon"];

    uint64_t v15 = [v13 copy];
    uint64_t v7 = (void *)v15;
    goto LABEL_15;
  }
  if (objc_opt_isKindOfClass()) {
    goto LABEL_14;
  }

  uint64_t v12 = 0;
LABEL_15:
  if (!v7 || ![v7 count])
  {
    uint64_t v16 = [v4 objectForKey:@"CFBundleIconFiles"];
    if (_NSIsNSArray())
    {
      id v17 = v16;
      id v18 = 0;
      if (!v17) {
        goto LABEL_29;
      }
      goto LABEL_23;
    }
    if (_NSIsNSString())
    {
      id v18 = v16;
      if (v18) {
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = [v4 objectForKey:*MEMORY[0x1E4F1CC58]];
      long long v24 = (void *)v23;
      if (v22 && v23 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        id v18 = 0;
      }
      else
      {
        id v18 = v24;
        if (v24)
        {
LABEL_22:
          id v30 = v18;
          id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
          if (!v17)
          {
LABEL_29:

            goto LABEL_30;
          }
LABEL_23:
          char v28 = @"CFBundlePrimaryIcon";
          long long v19 = objc_msgSend(NSNumber, "numberWithBool:", v9, @"CFBundleIconFiles", @"UIPrerenderedIcon", v17);
          v27[1] = v19;
          long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:2];
          v29 = v20;
          uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

          uint64_t v7 = (void *)v21;
          goto LABEL_29;
        }
      }
    }
    id v17 = 0;
    goto LABEL_29;
  }
LABEL_30:

  return v7;
}

- (void)parseIconFilenamesFromDict:(id)a3 forPlatform:(unsigned int)a4
{
  id v10 = a3;
  -[LSBundleRecordBuilder iconsDictionaryFromDict:](self, "iconsDictionaryFromDict:");
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  alternatePrimaryIconName = self->_alternatePrimaryIconName;
  self->_alternatePrimaryIconName = v6;

  if (_LSIconDictionarySupportsAssetCatalogs(self->_alternatePrimaryIconName))
  {
    [(LSBundleRecordBuilder *)self addIconFlag:4];
    _LSIconDictionaryGetPrimaryIconName(self->_alternatePrimaryIconName);
    BOOL v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    distributorInfo = self->_distributorInfo;
    self->_distributorInfo = v8;
  }
  if (a4 - 13 <= 0xFFFFFFFD && _LSIconDictionarySupportsAlternateIcons((NSDictionary *)self->_alternatePrimaryIconName)) {
    [(LSBundleRecordBuilder *)self addIconFlag:8];
  }
}

- (void)parseDeviceFamilyFromDict:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"UIDeviceFamily"];
  if (!v5)
  {
    uint64_t v5 = [v4 objectForKey:@"DeviceFamily"];
    if (!v5)
    {
      uint64_t v5 = [v4 objectForKey:@"ProductType"];
    }
  }
  if (_NSIsNSArray())
  {
    objc_storeStrong((id *)&self->_activityTypes, v5);
  }
  else if ((_NSIsNSString() & 1) != 0 || _NSIsNSNumber())
  {
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    activityTypes = self->_activityTypes;
    self->_activityTypes = v6;
  }
}

- (void)parseDocumentClaimsFromDict:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v21 objectForKey:*MEMORY[0x1E4F1CC50]];
  uint64_t v6 = (NSArray *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v6 = 0;
  }
  libraryItems = self->_libraryItems;
  self->_libraryItems = v6;

  uint64_t v9 = (NSArray *)LSCopyClaimListWithoutClaimsClaimingDefaultAppTypes(self->_libraryItems);
  id v10 = self->_libraryItems;
  self->_libraryItems = v9;

  uint64_t v11 = self->_libraryItems;
  if (!v11) {
    goto LABEL_26;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = v11;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v13) {
    goto LABEL_25;
  }
  uint64_t v14 = *(void *)v23;
  uint64_t v15 = *MEMORY[0x1E4F1CC98];
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (_NSIsNSDictionary())
      {
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = [v17 objectForKey:v15];
        long long v20 = (void *)v19;
        if (v18 && v19)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            long long v20 = 0;
LABEL_20:

            continue;
          }
        }
        else if (!v19)
        {
          goto LABEL_20;
        }
        if (![v20 caseInsensitiveCompare:@"Shell"])
        {
          *(_WORD *)&self->_moreFlags |= 0x4000u;

          goto LABEL_25;
        }
        goto LABEL_20;
      }
    }
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_25:

LABEL_26:
}

- (void)parseURLClaimsFromDict:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 objectForKey:@"PrivateURLSchemes"];
  BOOL v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    BOOL v7 = 0;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v4 objectForKey:*MEMORY[0x1E4F1CCB8]];
  uint64_t v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    if (v7) {
      goto LABEL_14;
    }
    uint64_t v11 = 0;
LABEL_17:
    objc_storeStrong((id *)&self->_documentClaims, v11);
    goto LABEL_18;
  }
  if (!v7) {
    goto LABEL_17;
  }
  if (!v11)
  {
LABEL_14:
    uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = (NSArray *)[v11 mutableCopy];
LABEL_15:
  v15[0] = *MEMORY[0x1E4F1CCB0];
  v15[1] = @"CFBundleURLIsPrivate";
  v16[0] = v7;
  v16[1] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [(NSArray *)v12 addObject:v13];
  documentClaims = self->_documentClaims;
  self->_documentClaims = v12;

LABEL_18:
}

- (BOOL)parseInfoPlist:(id)a3
{
  uint64_t v303 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((_NSIsNSDictionary() & 1) == 0) {
    goto LABEL_38;
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F1CFF8]];
  BOOL v7 = (NSNumber *)v6;
  if (v5 && v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    BOOL v7 = 0;
  }
  installType = self->_installType;
  self->_installType = v7;

  if (!self->_installType)
  {
LABEL_38:
    BOOL v32 = 0;
    goto LABEL_355;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v4 objectForKey:@"LSExecutableSDKVersion"];
  uint64_t v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v11 = 0;
  }
  maxSystemVersion = self->_maxSystemVersion;
  self->_maxSystemVersion = (NSString *)v11;

  uint64_t v13 = self->_maxSystemVersion;
  if (v13)
  {
    _LSVersionNumberMakeWithString(buf, v13);
    long long v14 = v302;
    *(_OWORD *)&self->_supportedGameControllers = *(_OWORD *)buf;
    *(_OWORD *)&self->_sdkVersionNumber._opaque[8] = v14;
  }
  [(LSBundleRecordBuilder *)self setFlagsFromDictionary:v4];
  [(LSBundleRecordBuilder *)self setRaritiesFromDictionary:v4];
  [(LSBundleRecordBuilder *)self setCommonInfoPlistKeysFromDictionary:v4];
  uint64_t v15 = [v4 valueForKey:@"LSIsSecuredSystemContent"];
  if ([v15 BOOLValue]) {
    char v16 = 16;
  }
  else {
    char v16 = 0;
  }
  *((unsigned char *)&self->_moreFlags + 3) = *((unsigned char *)&self->_moreFlags + 3) & 0xEF | v16;

  v289 = [v4 objectForKey:@"UIApplicationSupportsAlwaysOnDisplay"];
  if (v289 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ([v289 BOOLValue]) {
      __int16 v17 = 512;
    }
    else {
      __int16 v17 = 0;
    }
    int v18 = *(_WORD *)&self->_moreFlags & 0xFDFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
    *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFDFF | v17;
    *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v18);
  }
  p_moreFlags = &self->_moreFlags;
  if (objc_msgSend(v4, "_LS_BoolForKey:", @"UIDefaultsToPrivateAlwaysOnDisplayTreatment")) {
    __int16 v20 = 1024;
  }
  else {
    __int16 v20 = 0;
  }
  int v21 = *(_WORD *)&self->_moreFlags & 0xFBFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)p_moreFlags = *(_WORD *)&self->_moreFlags & 0xFBFF | v20;
  *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v21);
  if (objc_msgSend(v4, "_LS_BoolForKey:", @"LSRequiresPostProcessing")) {
    __int16 v22 = 0x2000;
  }
  else {
    __int16 v22 = 0;
  }
  int v23 = *(_WORD *)&self->_moreFlags & 0xDFFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)p_moreFlags = *(_WORD *)p_moreFlags & 0xDFFF | v22;
  *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v23);
  long long v24 = &self->_moreFlags;
  if (objc_msgSend(v4, "_LS_BoolForKey:", @"NSSupportsLiveActivities")) {
    __int16 v25 = 2048;
  }
  else {
    __int16 v25 = 0;
  }
  int v26 = *(_WORD *)&self->_moreFlags & 0xF7FF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)long long v24 = *(_WORD *)&self->_moreFlags & 0xF7FF | v25;
  *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v26);
  if (objc_msgSend(v4, "_LS_BoolForKey:", @"NSSupportsLiveActivitiesFrequentUpdates")) {
    __int16 v27 = 4096;
  }
  else {
    __int16 v27 = 0;
  }
  int v28 = *(_WORD *)&self->_moreFlags & 0xEFFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)long long v24 = *(_WORD *)v24 & 0xEFFF | v27;
  *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v28);
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = [v4 objectForKey:@"_LSIsLinkEnabled"];
  v31 = (void *)v30;
  if (!v29 || !v30)
  {
    if (!v30) {
      goto LABEL_45;
    }
    goto LABEL_40;
  }
  if (objc_opt_isKindOfClass())
  {
LABEL_40:
    if ([v31 BOOLValue]) {
      char v33 = 8;
    }
    else {
      char v33 = 0;
    }
    *((unsigned char *)&self->_moreFlags + 3) = *((unsigned char *)&self->_moreFlags + 3) & 0xF7 | v33;
  }

LABEL_45:
  v34 = [v4 objectForKey:@"_LSIsLinkEnabled"];
  if ([v34 BOOLValue]) {
    char v35 = 8;
  }
  else {
    char v35 = 0;
  }
  *((unsigned char *)&self->_moreFlags + 3) = *((unsigned char *)&self->_moreFlags + 3) & 0xF7 | v35;

  uint64_t v36 = objc_opt_class();
  uint64_t v37 = [v4 objectForKey:@"PurchaserID"];
  v38 = (NSArray *)v37;
  if (v36 && v37 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v38 = 0;
  }
  iconFileNames = self->_iconFileNames;
  self->_iconFileNames = v38;

  self->_minSystemVersionPlatform = _LSGetRawOSTypeForPossibleString((const __CFString *)[v4 objectForKey:*MEMORY[0x1E4F1CC60]]);
  self->_uint64_t baseFlags = 0;
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = [v4 objectForKey:@"LSExecutablePlatformKey"];
  v42 = (void *)v41;
  if (v40 && v41)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  if (v41)
  {
LABEL_57:
    self->_uint64_t baseFlags = (LSBundleBaseFlags)[v42 unsignedLongLongValue];
LABEL_58:
  }
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = [v4 objectForKey:@"DTAppStoreToolsBuild"];
  v45 = (void *)v44;
  if (v43 && v44 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v45 = 0;
  }
  sdkVersion = self->_sdkVersion;
  self->_sdkVersion = (NSString *)v45;

  uint64_t v47 = objc_opt_class();
  uint64_t v48 = [v4 objectForKey:*MEMORY[0x1E4F1D020]];
  v49 = (NSNumber *)v48;
  if (v47 && v48 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v49 = 0;
  }
  installFailureReason = self->_installFailureReason;
  self->_installFailureReason = v49;

  uint64_t baseFlags = self->_baseFlags;
  _LSVersionNumberMakeWithString(v300, self->_maxSystemVersion);
  _LSGetMinimumOSVersionStringAndReferencePlatformForPlatformSDKLinkage(v4, baseFlags, v300, (id *)&self->_version, &self->_platform);
  uint64_t v52 = objc_opt_class();
  uint64_t v53 = [v4 objectForKey:@"LSMaximumSystemVersion"];
  v54 = (void *)v53;
  if (v52 && v53 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v54 = 0;
  }
  minSystemVersion = self->_minSystemVersion;
  self->_minSystemVersion = (NSString *)v54;

  uint64_t v56 = objc_opt_class();
  uint64_t v57 = [v4 objectForKey:*MEMORY[0x1E4F1CC70]];
  v58 = (void *)v57;
  if (v56 && v57 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v58 = 0;
  }
  appStoreToolsBuildVersion = self->_appStoreToolsBuildVersion;
  self->_appStoreToolsBuildVersion = (NSString *)v58;

  uint64_t v60 = objc_opt_class();
  uint64_t v287 = *MEMORY[0x1E4F1D008];
  uint64_t v61 = objc_msgSend(v4, "objectForKey:");
  v62 = (void *)v61;
  if (v60 && v61 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v62 = 0;
  }
  shortDisplayName = self->_shortDisplayName;
  self->_shortDisplayName = (NSString *)v62;

  uint64_t v64 = objc_opt_class();
  uint64_t v286 = *MEMORY[0x1E4F1CC48];
  uint64_t v65 = objc_msgSend(v4, "objectForKey:");
  v66 = (void *)v65;
  if (v64 && v65 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v66 = 0;
  }
  identifier = self->_identifier;
  self->_identifier = (NSString *)v66;

  uint64_t v68 = objc_opt_class();
  uint64_t v69 = [v4 objectForKey:v287];
  v70 = (void *)v69;
  if (v68 && v69 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v70 = 0;
  }
  displayName = self->_displayName;
  self->_displayName = (NSString *)v70;

  uint64_t v72 = objc_opt_class();
  uint64_t v73 = [v4 objectForKey:@"NSMicrophoneUsageDescription"];
  v74 = (NSDictionary *)v73;
  if (v72 && v73 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v74 = 0;
  }
  localizedShortNames = self->_localizedShortNames;
  self->_localizedShortNames = v74;

  uint64_t v76 = objc_opt_class();
  uint64_t v77 = [v4 objectForKey:@"NSIdentityUsageDescription"];
  v78 = (NSDictionary *)v77;
  if (v76 && v77 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v78 = 0;
  }
  localizedMicrophoneUsageDescription = self->_localizedMicrophoneUsageDescription;
  self->_localizedMicrophoneUsageDescription = v78;

  uint64_t v80 = objc_opt_class();
  uint64_t v81 = [v4 objectForKey:@"artistName"];
  v82 = (void *)v81;
  if (v80 && v81 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v82 = 0;
  }
  secondCategoryType = self->_secondCategoryType;
  self->_secondCategoryType = (NSString *)v82;

  uint64_t v84 = objc_opt_class();
  uint64_t v85 = [v4 objectForKey:@"itemName"];
  v86 = (void *)v85;
  if (v84 && v85 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v86 = 0;
  }
  signerOrganization = self->_signerOrganization;
  self->_signerOrganization = (NSString *)v86;

  uint64_t v88 = objc_opt_class();
  uint64_t v89 = [v4 objectForKey:@"s"];
  v90 = (void *)v89;
  if (v88 && v89 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v90 = 0;
  }
  itemName = self->_itemName;
  self->_itemName = (NSString *)v90;

  uint64_t v92 = objc_opt_class();
  uint64_t v93 = [v4 objectForKey:@"softwareVersionExternalIdentifier"];
  v94 = (NSNumber *)v93;
  if (v92 && v93 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v94 = 0;
  }
  storefront = self->_storefront;
  self->_storefront = v94;

  if (!self->_storefront)
  {
    uint64_t v96 = objc_opt_class();
    uint64_t v97 = [v4 objectForKey:@"betaExternalVersionIdentifier"];
    v98 = (NSNumber *)v97;
    if (v96 && v97 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v98 = 0;
    }
    v99 = self->_storefront;
    self->_storefront = v98;
  }
  uint64_t v100 = objc_opt_class();
  uint64_t v101 = [v4 objectForKey:@"sourceApp"];
  v102 = (NSNumber *)v101;
  if (v100 && v101 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v102 = 0;
  }
  versionID = self->_versionID;
  self->_versionID = v102;

  uint64_t v104 = objc_opt_class();
  uint64_t v105 = [v4 objectForKey:@"variantID"];
  v106 = (void *)v105;
  if (v104 && v105 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v106 = 0;
  }
  sourceAppBundleID = self->_sourceAppBundleID;
  self->_sourceAppBundleID = (NSString *)v106;

  uint64_t v108 = objc_opt_class();
  uint64_t v109 = [v4 objectForKey:@"_LSExecutablePath"];
  v110 = (void *)v109;
  if (v108 && v109 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v110 = 0;
  }
  shortVersionString = self->_shortVersionString;
  self->_shortVersionString = (NSString *)v110;

  uint64_t v112 = objc_opt_class();
  uint64_t v113 = [v4 objectForKey:@"genre"];
  v114 = (NSNumber *)v113;
  if (v112 && v113 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v114 = 0;
  }
  ratingRank = self->_ratingRank;
  self->_ratingRank = v114;

  uint64_t v116 = objc_opt_class();
  uint64_t v117 = [v4 objectForKey:@"distributorInfo"];
  v118 = (NSNumber *)v117;
  if (v116 && v117 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v118 = 0;
  }
  genreID = self->_genreID;
  self->_genreID = v118;

  uint64_t v120 = objc_opt_class();
  uint64_t v121 = [v4 objectForKey:@"managementDeclarationIdentifier"];
  v122 = (void *)v121;
  if (v120 && v121 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v122 = 0;
  }
  appVariant = self->_appVariant;
  self->_appVariant = (NSString *)v122;

  v124 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  counterpartAppBundleIDs = self->_counterpartAppBundleIDs;
  self->_counterpartAppBundleIDs = v124;

  v126 = (NSString *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  managementDeclarationIdentifier = self->_managementDeclarationIdentifier;
  self->_managementDeclarationIdentifier = v126;

  uint64_t v128 = objc_opt_class();
  uint64_t v129 = [v4 objectForKey:@"LSCounterpartIdentifiers"];
  v288 = (void *)v129;
  uint64_t v130 = v129;
  if (v128 && v129)
  {
    uint64_t v130 = v129;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_147:
      v288 = 0;
      goto LABEL_148;
    }
  }
  else if (!v129)
  {
    goto LABEL_147;
  }
  [(NSString *)self->_managementDeclarationIdentifier addObjectsFromArray:v130];
  [(NSMutableSet *)self->_counterpartAppBundleIDs addObjectsFromArray:v130];
LABEL_148:
  uint64_t v131 = objc_opt_class();
  uint64_t v132 = [v4 objectForKey:@"NSEquivalentBundleIdentifiers"];
  v290 = (void *)v132;
  v133 = (void *)v132;
  if (v131 && v132)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    v133 = v290;
    if ((isKindOfClass & 1) == 0)
    {

LABEL_154:
      v290 = 0;
      goto LABEL_155;
    }
  }
  else if (!v132)
  {
    goto LABEL_154;
  }
  [(NSMutableSet *)self->_counterpartAppBundleIDs addObjectsFromArray:v133];
LABEL_155:
  uint64_t v135 = objc_opt_class();
  uint64_t v136 = [v4 objectForKey:@"label"];
  v137 = (NSArray *)v136;
  if (v135 && v136 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v137 = 0;
  }
  supportedComplicationFamilies = self->_supportedComplicationFamilies;
  self->_supportedComplicationFamilies = v137;

  uint64_t v139 = objc_opt_class();
  uint64_t v140 = [v4 objectForKey:@"itemId"];
  v141 = (NSArray *)v140;
  if (v139 && v140 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v141 = 0;
  }
  machOUUIDs = self->_machOUUIDs;
  self->_machOUUIDs = v141;

  uint64_t v143 = objc_opt_class();
  uint64_t v144 = [v4 objectForKey:@"rank"];
  v145 = (void *)v144;
  if (v143 && v144 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v145 = 0;
  }
  ratingLabel = self->_ratingLabel;
  self->_ratingLabel = (NSString *)v145;

  uint64_t v147 = objc_opt_class();
  uint64_t v148 = [v4 objectForKey:@"genreId"];
  v149 = (void *)v148;
  if (v147 && v148 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v149 = 0;
  }
  genre = self->_genre;
  self->_genre = (NSString *)v149;

  uint64_t v151 = objc_opt_class();
  uint64_t v152 = [v4 objectForKey:@"LSApplicationCategoryType"];
  v153 = (NSURL *)v152;
  if (v151 && v152 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v153 = 0;
  }
  bundleContainerURL = self->_bundleContainerURL;
  self->_bundleContainerURL = v153;

  uint64_t v155 = objc_opt_class();
  uint64_t v156 = [v4 objectForKey:@"LSApplicationSecondaryCategoryType"];
  v157 = (void *)v156;
  if (v155 && v156 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v157 = 0;
  }
  categoryType = self->_categoryType;
  self->_categoryType = (NSString *)v157;

  if (!self->_bundleContainerURL && !self->_categoryType)
  {
    uint64_t v159 = objc_opt_class();
    uint64_t v160 = [v4 objectForKey:@"categories"];
    v161 = (void *)v160;
    if (v159 && v160 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v161 = 0;
    }
    v162 = [v161 firstObject];
    objc_opt_class();
    char v163 = objc_opt_isKindOfClass();

    if (v163)
    {
      v164 = [v161 firstObject];
      v165 = self->_bundleContainerURL;
      self->_bundleContainerURL = v164;

      if ((unint64_t)[v161 count] >= 2)
      {
        v166 = [v161 objectAtIndex:1];
        objc_opt_class();
        char v167 = objc_opt_isKindOfClass();

        if (v167)
        {
          v168 = [v161 objectAtIndex:1];
          v169 = self->_categoryType;
          self->_categoryType = v168;
        }
      }
    }
  }
  uint64_t v170 = objc_opt_class();
  uint64_t v171 = [v4 objectForKey:@"MachOUUIDs"];
  v172 = (void *)v171;
  if (v170 && v171 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v172 = 0;
  }
  execPath = self->_execPath;
  self->_execPath = (NSString *)v172;

  uint64_t v174 = objc_opt_class();
  uint64_t v175 = [v4 objectForKey:@"LSApplicationQueriesSchemes"];
  v176 = (NSArray *)v175;
  if (v174 && v175 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v176 = 0;
  }
  exportedTypes = self->_exportedTypes;
  self->_exportedTypes = v176;

  uint64_t v178 = objc_opt_class();
  uint64_t v179 = [v4 objectForKey:@"_LSBundleLibraryPath"];
  v180 = (NSNumber *)v179;
  if (v178 && v179 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v180 = 0;
  }
  staticDiskUsage = self->_staticDiskUsage;
  self->_staticDiskUsage = v180;

  uint64_t v182 = objc_opt_class();
  uint64_t v183 = [v4 objectForKey:@"_LSBundleLibraryItems"];
  v184 = (void *)v183;
  if (v182 && v183 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v184 = 0;
  }
  libraryPath = self->_libraryPath;
  self->_libraryPath = (NSString *)v184;

  uint64_t v186 = objc_opt_class();
  uint64_t v187 = [v4 objectForKey:@"UTExportedTypeDeclarations"];
  v188 = (NSArray *)v187;
  if (v186 && v187 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v188 = 0;
  }
  importedTypes = self->_importedTypes;
  self->_importedTypes = v188;

  uint64_t v190 = objc_opt_class();
  uint64_t v191 = [v4 objectForKey:@"UTImportedTypeDeclarations"];
  v192 = (NSArray *)v191;
  if (v190 && v191 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v192 = 0;
  }
  URLClaims = self->_URLClaims;
  self->_URLClaims = v192;

  [(LSBundleRecordBuilder *)self parseDocumentClaimsFromDict:v4];
  uint64_t v194 = objc_opt_class();
  uint64_t v195 = [v4 objectForKey:@"_LSBundlePlugins"];
  v196 = (NSArray *)v195;
  if (v194 && v195 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v196 = 0;
  }
  queriableSchemes = self->_queriableSchemes;
  self->_queriableSchemes = v196;

  uint64_t v198 = objc_opt_class();
  uint64_t v199 = [v4 objectForKey:@"_LSIntentDefinitionURLs"];
  v200 = (NSDictionary *)v199;
  if (v198 && v199 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v200 = 0;
  }
  extensionSDK = self->_extensionSDK;
  self->_extensionSDK = v200;

  uint64_t v202 = objc_opt_class();
  uint64_t v203 = [v4 objectForKey:@"BGTaskSchedulerPermittedIdentifiers"];
  v204 = (NSDictionary *)v203;
  if (v202 && v203 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v204 = 0;
  }
  intentDefinitionURLs = self->_intentDefinitionURLs;
  self->_intentDefinitionURLs = v204;

  uint64_t v206 = objc_opt_class();
  uint64_t v207 = [v4 objectForKey:@"CARInstrumentClusterURLSchemes"];
  v208 = (NSArray *)v207;
  if (v206 && v207 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v208 = 0;
  }
  bgPermittedIdentifiers = self->_bgPermittedIdentifiers;
  self->_bgPermittedIdentifiers = v208;

  uint64_t v210 = objc_opt_class();
  uint64_t v211 = [v4 objectForKey:@"GCSupportsControllerUserInteraction"];
  v212 = (void *)v211;
  if (v210 && v211)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_239:

      goto LABEL_240;
    }
LABEL_235:
    if ([v212 BOOLValue]) {
      __int16 v213 = 4;
    }
    else {
      __int16 v213 = 0;
    }
    int v214 = *(_WORD *)&self->_moreFlags & 0xFFFB | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
    *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFFB | v213;
    *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v214);
    goto LABEL_239;
  }
  if (v211) {
    goto LABEL_235;
  }
LABEL_240:
  uint64_t v215 = objc_opt_class();
  uint64_t v216 = [v4 objectForKey:@"GCSupportedGameControllers"];
  v217 = (NSMutableDictionary *)v216;
  if (v215 && v216 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v217 = 0;
  }
  commonInfoPlistEntries = self->_commonInfoPlistEntries;
  self->_commonInfoPlistEntries = v217;

  uint64_t v219 = objc_opt_class();
  uint64_t v220 = [v4 objectForKey:@"CoreSpotlightContinuation"];
  v221 = (void *)v220;
  if (v219 && v220)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_253:

      goto LABEL_254;
    }
LABEL_249:
    if ([v221 BOOLValue]) {
      __int16 v222 = 8;
    }
    else {
      __int16 v222 = 0;
    }
    int v223 = *(_WORD *)&self->_moreFlags & 0xFFF7 | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
    *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFF7 | v222;
    *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v223);
    goto LABEL_253;
  }
  if (v220) {
    goto LABEL_249;
  }
LABEL_254:
  uint64_t v224 = objc_opt_class();
  uint64_t v225 = [v4 objectForKey:@"CoreSpotlightActions"];
  v226 = (void *)v225;
  if (v224 && v225)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_260;
    }
    goto LABEL_259;
  }
  if (v225)
  {
LABEL_259:
    *(_WORD *)&self->_moreFlags |= 0x10u;
LABEL_260:
  }
  uint64_t v227 = objc_opt_class();
  uint64_t v228 = [v4 objectForKey:@"_LSLocalizedStringsDictionary"];
  v229 = (void *)v228;
  if (v227 && v228)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v229 = 0;
      goto LABEL_282;
    }
  }
  else if (!v228)
  {
    goto LABEL_282;
  }
  v230 = objc_opt_class();
  v231 = objc_opt_class();
  if (_LSIsDictionaryWithKeysAndValuesOfClass(v229, v230, v231))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&long long v302 = 0x2020000000;
    BYTE8(v302) = 1;
    v298[0] = MEMORY[0x1E4F143A8];
    v298[1] = 3221225472;
    v298[2] = __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke;
    v298[3] = &unk_1E522DC28;
    v298[4] = buf;
    [v229 enumerateKeysAndObjectsUsingBlock:v298];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      objc_storeStrong((id *)&self->_localizedIdentityUsageDescription, v229);
      v232 = [v229 objectForKeyedSubscript:v286];
      v233 = v232;
      if (v232 && [v232 count]) {
        objc_storeStrong((id *)&self->_carPlayInstrumentClusterURLSchemes, v233);
      }

      v234 = [v229 objectForKeyedSubscript:v287];
      v235 = v234;
      if (v234 && [v234 count]) {
        objc_storeStrong((id *)&self->_localizedNames, v235);
      }

      v236 = [v229 objectForKeyedSubscript:@"NSMicrophoneUsageDescription"];
      v237 = v236;
      if (v236 && [v236 count]) {
        objc_storeStrong((id *)&self->_microphoneUsageDescription, v237);
      }

      v238 = [v229 objectForKeyedSubscript:@"NSIdentityUsageDescription"];
      v239 = v238;
      if (v238 && [v238 count]) {
        objc_storeStrong((id *)&self->_identityUsageDescription, v239);
      }

      id v240 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v295[0] = MEMORY[0x1E4F143A8];
      v295[1] = 3221225472;
      v295[2] = __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke_2;
      v295[3] = &unk_1E522DC50;
      id v241 = v240;
      id v296 = v241;
      id v297 = v4;
      _LSBundleDisplayNameContextEnumerate(v295);
      v242 = (NSDictionary *)[v241 copy];
      localizedStrings = self->_localizedStrings;
      self->_localizedStrings = v242;
    }
    _Block_object_dispose(buf, 8);
  }
LABEL_282:

  *((unsigned char *)&self->_moreFlags + 3) = (2 * *((unsigned char *)&self->_moreFlags + 3)) & 0x20 | *((unsigned char *)&self->_moreFlags + 3) & 0xDF;
  uint64_t v244 = objc_opt_class();
  uint64_t v245 = [v4 objectForKey:@"bundlePersonas"];
  v246 = (NSDictionary *)v245;
  if (v244 && v245 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v246 = 0;
  }
  unlocalizedNamesWithContext = self->_unlocalizedNamesWithContext;
  self->_unlocalizedNamesWithContext = v246;

  v248 = [v4 objectForKey:@"_LSUsesSystemPersona"];
  int v249 = [v248 BOOLValue];

  if (v249) {
    [(LSBundleRecordBuilder *)self addBundleFlag:0x100000000000000];
  }
  long long v293 = 0u;
  long long v294 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  v250 = self->_unlocalizedNamesWithContext;
  uint64_t v251 = [(NSDictionary *)v250 countByEnumeratingWithState:&v291 objects:v299 count:16];
  if (v251)
  {
    uint64_t v252 = *(void *)v292;
    do
    {
      for (uint64_t i = 0; i != v251; ++i)
      {
        if (*(void *)v292 != v252) {
          objc_enumerationMutation(v250);
        }
        uint64_t v254 = *(void *)(*((void *)&v291 + 1) + 8 * i);
        if (-[_LSPersonaWithAttributes personaType](v254) != 1 && -[_LSPersonaWithAttributes personaType](v254) != 3) {
          *((unsigned char *)&self->_moreFlags + 3) &= ~0x20u;
        }
      }
      uint64_t v251 = [(NSDictionary *)v250 countByEnumeratingWithState:&v291 objects:v299 count:16];
    }
    while (v251);
  }

  uint64_t v255 = objc_opt_class();
  uint64_t v256 = [v4 objectForKey:@"_LSDirectoryClass"];
  v257 = (NSArray *)v256;
  if (v255 && v256 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v257 = 0;
  }
  bundlePersonas = self->_bundlePersonas;
  self->_bundlePersonas = v257;

  [(LSBundleRecordBuilder *)self parseURLClaimsFromDict:v4];
  [(LSBundleRecordBuilder *)self parseIconFilenamesFromDict:v4 forPlatform:*(_DWORD *)&self->_baseFlags];
  [(LSBundleRecordBuilder *)self parseDeviceFamilyFromDict:v4];
  [(LSBundleRecordBuilder *)self parseArchitecturesFromDict:v4];
  uint64_t v259 = objc_opt_class();
  uint64_t v260 = [v4 objectForKey:@"_LSRequiresGarbageCollection"];
  v261 = (void *)v260;
  if (v259 && v260)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_311:

      goto LABEL_312;
    }
LABEL_307:
    if ([v261 BOOLValue]) {
      char v262 = 2;
    }
    else {
      char v262 = 0;
    }
    *((unsigned char *)&self->_moreFlags + 3) = *((unsigned char *)&self->_moreFlags + 3) & 0xFD | v262;
    goto LABEL_311;
  }
  if (v260) {
    goto LABEL_307;
  }
LABEL_312:
  uint64_t v263 = objc_opt_class();
  uint64_t v264 = [v4 objectForKey:@"NSBuiltWithThreadSanitizer"];
  v265 = (void *)v264;
  if (v263 && v264)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_321:

      goto LABEL_322;
    }
LABEL_317:
    if ([v265 BOOLValue]) {
      char v266 = 4;
    }
    else {
      char v266 = 0;
    }
    *((unsigned char *)&self->_moreFlags + 3) = *((unsigned char *)&self->_moreFlags + 3) & 0xFB | v266;
    goto LABEL_321;
  }
  if (v264) {
    goto LABEL_317;
  }
LABEL_322:
  uint64_t v267 = objc_opt_class();
  uint64_t v268 = [v4 objectForKey:@"LSExecutableFormat"];
  v269 = (void *)v268;
  if (v267 && v268)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v269 = 0;
      goto LABEL_329;
    }
  }
  else if (!v268)
  {
    goto LABEL_329;
  }
  if ([v269 isEqualToString:@"LSExecutable#!Format"]) {
    [(LSBundleRecordBuilder *)self addBundleFlag:16];
  }
LABEL_329:
  if (*(void *)&self->_hfsCreator)
  {
    BOOL v270 = 0;
  }
  else
  {
    v271 = [v4 objectForKey:*MEMORY[0x1E4F1CFF0]];
    BOOL v270 = v271 != 0;
  }
  uint64_t v272 = objc_opt_class();
  uint64_t v273 = [v4 objectForKey:@"LSEligibilityInstallPredicate"];
  v274 = (void *)v273;
  if (!v272 || !v273)
  {
    if (!v273) {
      goto LABEL_338;
    }
LABEL_337:

LABEL_343:
    [(LSBundleRecordBuilder *)self addPlistFlag:0x2000000];
    goto LABEL_344;
  }
  if (objc_opt_isKindOfClass()) {
    goto LABEL_337;
  }

LABEL_338:
  uint64_t v275 = objc_opt_class();
  uint64_t v276 = [v4 objectForKey:@"LSEligibilityUninstallPredicate"];
  v277 = (void *)v276;
  if (v275 && v276 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v277 = 0;
  }

  if (v277) {
    goto LABEL_343;
  }
LABEL_344:
  uint64_t v278 = objc_opt_class();
  v279 = [v4 objectForKey:@"LSRequiredFeatureFlags"];
  v280 = v279;
  if (v278 && v279)
  {
    char v281 = objc_opt_isKindOfClass();

    if ((v281 & 1) == 0) {
      goto LABEL_350;
    }
    goto LABEL_349;
  }
  BOOL v282 = v279 == 0;

  if (!v282) {
LABEL_349:
  }
    [(LSBundleRecordBuilder *)self addPlistFlag:0x4000000];
LABEL_350:
  if (v270)
  {
    [(LSBundleRecordBuilder *)self addBundleFlag:512];
    v283 = _LSInstallLog();
    if (os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT))
    {
      v284 = self->_installType;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v284;
      _os_log_impl(&dword_182959000, v283, OS_LOG_TYPE_DEFAULT, "Placeholder detected - Flagging bundle %@ incomplete", buf, 0xCu);
    }
  }
  BOOL v32 = 1;
LABEL_355:

  return v32;
}

void __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  uint64_t v6 = objc_opt_class();
  BOOL v7 = objc_opt_class();
  if ((_LSIsDictionaryWithKeysAndValuesOfClass(v8, v6, v7) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 objectForKey:a4];
  id v9 = (id)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = (id)v8;
    if (objc_opt_isKindOfClass())
    {
      id v9 = v11;
    }
    else
    {

      id v9 = 0;
    }
  }
  id v12 = v9;
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:a4];
}

- (BOOL)parseInstallationInfo:(id)a3
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = _NSIsNSDictionary();
  if ((v5 & 1) == 0) {
    goto LABEL_160;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 objectForKey:@"Entitlements"];
  uint64_t v8 = (NSDictionary *)v7;
  if (v6 && v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v8 = 0;
  }
  groupContainers = self->_groupContainers;
  self->_groupContainers = v8;

  BOOL v10 = self->_groupContainers;
  if (v10 && (*(_WORD *)&self->_moreFlags & 0x8000) == 0) {
    [(NSDictionary *)v10 enumerateKeysAndObjectsWithOptions:0 usingBlock:&__block_literal_global_540];
  }
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [v4 objectForKey:@"BundleContainer"];
  uint64_t v13 = (void *)v12;
  if (v11 && v12)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v12)
  {
LABEL_14:
    long long v14 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v13 isDirectory:1];
    dataContainerURL = self->_dataContainerURL;
    self->_dataContainerURL = v14;

LABEL_15:
  }
  [(LSBundleRecordBuilder *)self setFlagsFromDictionary:v4];
  [(LSBundleRecordBuilder *)self setRaritiesFromDictionary:v4];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = [v4 objectForKey:@"CompatibilityState"];
  int v18 = (void *)v17;
  if (v16 && v17 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    int v18 = 0;
  }
  uint64_t v19 = *(void **)&self->_containerized;
  *(void *)&self->_containerized = v18;

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = [v4 objectForKey:@"PlaceholderFailureReason"];
  __int16 v22 = (NSNumber *)v21;
  if (v20 && v21 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    __int16 v22 = 0;
  }
  compatibilityState = self->_compatibilityState;
  self->_compatibilityState = v22;

  uint64_t v24 = objc_opt_class();
  uint64_t v25 = [v4 objectForKey:@"LSInstallType"];
  int v26 = (NSArray *)v25;
  if (v24 && v25 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    int v26 = 0;
  }
  deviceFamily = self->_deviceFamily;
  self->_deviceFamily = v26;

  int v28 = objc_msgSend(v4, "_LS_BoolForKey:", @"IsContainerized");
  self->_sdkVersionNumber._opaque[24] = v28;
  if (v28)
  {
    [(LSBundleRecordBuilder *)self addBundleFlag:0x4000000000];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = [v4 objectForKey:@"Container"];
    v31 = (void *)v30;
    if (v29 && v30)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    if (v30)
    {
LABEL_34:
      BOOL v32 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v31 isDirectory:1];
      alternateNames = self->_alternateNames;
      self->_alternateNames = v32;

LABEL_35:
    }
  }
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = [v4 objectForKey:@"StashedVersionInfo"];
  uint64_t v36 = (NSNumber *)v35;
  if (v34 && v35 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v36 = 0;
  }
  signatureVersion = self->_signatureVersion;
  self->_signatureVersion = v36;

  v38 = [v4 objectForKey:@"ApplicationDSID"];

  if (v38)
  {
    iconFileNames = self->_iconFileNames;
    if (iconFileNames)
    {
      self->_iconFileNames = 0;
    }
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = [v4 objectForKey:@"ApplicationDSID"];
    v42 = (NSArray *)v41;
    if (v40 && v41 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v42 = 0;
    }
    uint64_t v43 = self->_iconFileNames;
    self->_iconFileNames = v42;
  }
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = [v4 objectForKey:@"DownloaderDSID"];
  v46 = (NSNumber *)v45;
  if (v44 && v45 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v46 = 0;
  }
  purchaserDSID = self->_purchaserDSID;
  self->_purchaserDSID = v46;

  uint64_t v48 = objc_opt_class();
  uint64_t v49 = [v4 objectForKey:@"FamilyID"];
  v50 = (NSNumber *)v49;
  if (v48 && v49 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v50 = 0;
  }
  downloaderDSID = self->_downloaderDSID;
  self->_downloaderDSID = v50;

  uint64_t v52 = objc_opt_class();
  uint64_t v53 = [v4 objectForKey:@"SignerIdentity"];
  v54 = (void *)v53;
  if (v52 && v53 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v54 = 0;
  }
  appType = self->_appType;
  self->_appType = (NSString *)v54;

  uint64_t v56 = objc_opt_class();
  uint64_t v57 = [v4 objectForKey:@"CodeInfoIdentifier"];
  v58 = (void *)v57;
  if (v56 && v57 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v58 = 0;
  }
  signerIdentity = self->_signerIdentity;
  self->_signerIdentity = (NSString *)v58;

  uint64_t v60 = objc_opt_class();
  uint64_t v61 = [v4 objectForKey:@"SignerOrganization"];
  v62 = (void *)v61;
  if (v60 && v61 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v62 = 0;
  }
  codeInfoIdentifier = self->_codeInfoIdentifier;
  self->_codeInfoIdentifier = (NSString *)v62;

  uint64_t v64 = objc_opt_class();
  uint64_t v65 = [v4 objectForKey:@"ApplicationType"];
  v66 = (void *)v65;
  if (v64 && v65 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v66 = 0;
  }
  vendorName = self->_vendorName;
  self->_vendorName = (NSString *)v66;

  if ([(NSString *)self->_vendorName isEqualToString:@"SystemAppPlaceholder"])
  {
    self->_bundleClass = 14;
    uint64_t v68 = _LSRegistrationLog();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      installType = self->_installType;
      int v150 = 138412290;
      uint64_t v151 = installType;
      _os_log_impl(&dword_182959000, v68, OS_LOG_TYPE_DEBUG, "Setting LSBundleClassSystemPlaceholder for app %@", (uint8_t *)&v150, 0xCu);
    }
  }
  uint64_t v70 = objc_opt_class();
  uint64_t v71 = [v4 objectForKey:@"WatchKitVersion"];
  uint64_t v72 = (NSArray *)v71;
  if (v70 && v71 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v72 = 0;
  }
  parentApplicationIdentifiers = self->_parentApplicationIdentifiers;
  self->_parentApplicationIdentifiers = v72;

  uint64_t v74 = objc_opt_class();
  uint64_t v75 = [v4 objectForKey:@"ComplicationPrincipalClass"];
  uint64_t v76 = (void *)v75;
  if (v74 && v75 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v76 = 0;
  }
  watchKitVersion = self->_watchKitVersion;
  self->_watchKitVersion = (NSString *)v76;

  uint64_t v78 = objc_opt_class();
  uint64_t v79 = [v4 objectForKey:@"StaticDiskUsage"];
  uint64_t v80 = (NSNumber *)v79;
  if (v78 && v79 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v80 = 0;
  }
  familyID = self->_familyID;
  self->_familyID = v80;

  uint64_t v82 = objc_opt_class();
  uint64_t v83 = [v4 objectForKey:@"SupportedComplicationFamilies"];
  uint64_t v84 = (void *)v83;
  if (v82 && v83 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v84 = 0;
  }
  complicationPrincipalClass = self->_complicationPrincipalClass;
  self->_complicationPrincipalClass = (NSString *)v84;

  uint64_t v86 = objc_opt_class();
  uint64_t v87 = [v4 objectForKey:@"LSCounterpartIdentifiers"];
  uint64_t v88 = (void *)v87;
  if (v86 && v87)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v88 = 0;
      goto LABEL_98;
    }
  }
  else if (!v87)
  {
    goto LABEL_98;
  }
  [(NSString *)self->_managementDeclarationIdentifier addObjectsFromArray:v88];
  [(NSMutableSet *)self->_counterpartAppBundleIDs addObjectsFromArray:v88];
LABEL_98:
  uint64_t v89 = objc_opt_class();
  uint64_t v90 = [v4 objectForKey:@"GroupContainers"];
  v91 = (NSArray *)v90;
  if (v89 && v90 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v91 = 0;
  }
  driverExtensionPaths = self->_driverExtensionPaths;
  self->_driverExtensionPaths = v91;

  uint64_t v93 = objc_opt_class();
  uint64_t v94 = [v4 objectForKey:@"EnvironmentVariables"];
  v95 = (NSDictionary *)v94;
  if (v93 && v94 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v95 = 0;
  }
  entitlements = self->_entitlements;
  self->_entitlements = v95;

  uint64_t v97 = objc_opt_class();
  uint64_t v98 = [v4 objectForKey:@"_LSBundlePlugins"];
  v99 = (NSDictionary *)v98;
  if (v97 && v98 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v99 = 0;
  }
  pluginPlists = self->_pluginPlists;
  self->_pluginPlists = v99;

  uint64_t v101 = objc_opt_class();
  uint64_t v102 = [v4 objectForKey:@"DriverKitExtensionPaths"];
  v103 = (NSDictionary *)v102;
  if (v101 && v102 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v103 = 0;
  }
  pluginMIDicts = self->_pluginMIDicts;
  self->_pluginMIDicts = v103;

  _LSGetTeamIdentifierFromInstallDict(v4);
  uint64_t v105 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  itemID = self->_itemID;
  self->_itemID = v105;

  uint64_t v107 = objc_opt_class();
  uint64_t v108 = [v4 objectForKey:@"IsOnDemandInstallCapable"];
  uint64_t v109 = (void *)v108;
  if (v107 && v108 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v109 = 0;
  }
  if ([v109 BOOLValue])
  {
    [(LSBundleRecordBuilder *)self addBundleFlag:0x1000000000000000];
    uint64_t v110 = objc_opt_class();
    uint64_t v111 = [v4 objectForKey:@"ParentIdentifiers"];
    uint64_t v112 = (NSMutableSet *)v111;
    if (v110 && v111 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v112 = 0;
    }
    equivalentBundleIDs = self->_equivalentBundleIDs;
    self->_equivalentBundleIDs = v112;
  }
  [(LSBundleRecordBuilder *)self setProfileValidationState:_LSGetProfileValidationStateFromInstallDictionary((const __CFDictionary *)v4)];
  id v114 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v115 = objc_opt_class();
  uint64_t v116 = [v4 objectForKey:@"UniqueInstallID"];
  uint64_t v117 = (void *)v116;
  if (v115 && v116 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v117 = 0;
  }
  [v114 setObject:v117 forKeyedSubscript:@"UniqueInstallID"];

  uint64_t v118 = objc_opt_class();
  uint64_t v119 = [v4 objectForKey:@"InstallSessionID"];
  uint64_t v120 = (void *)v119;
  if (v118 && v119 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v120 = 0;
  }
  [v114 setObject:v120 forKeyedSubscript:@"InstallSessionID"];

  if ([v114 count])
  {
    uint64_t v121 = (NSNumber *)[v114 copy];
    directoryClass = self->_directoryClass;
    self->_directoryClass = v121;
  }
  p_moreFlags = &self->_moreFlags;
  if (objc_msgSend(v4, "_LS_BoolForKey:", @"CodeSigningInfoNotAuthoritative")) {
    __int16 v124 = 32;
  }
  else {
    __int16 v124 = 0;
  }
  int v125 = *(_WORD *)&self->_moreFlags & 0xFFDF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)p_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFDF | v124;
  *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v125);
  if (objc_msgSend(v4, "_LS_BoolForKey:", @"IsSwiftPlaygroundsApp")) {
    __int16 v126 = 256;
  }
  else {
    __int16 v126 = 0;
  }
  int v127 = *(_WORD *)&self->_moreFlags & 0xFEFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)p_moreFlags = *(_WORD *)&self->_moreFlags & 0xFEFF | v126;
  *((unsigned char *)&self->_moreFlags + 2) = BYTE2(v127);
  uint64_t v128 = objc_opt_class();
  uint64_t v129 = [v4 objectForKey:@"AppManagementDomain"];
  uint64_t v130 = (NSDictionary *)v129;
  if (v128 && v129 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v130 = 0;
  }
  stashedAppInfo = self->_stashedAppInfo;
  self->_stashedAppInfo = v130;

  uint64_t v132 = objc_opt_class();
  uint64_t v133 = [v4 objectForKey:@"LinkedParentBundleID"];
  v134 = (void *)v133;
  if (v132 && v133 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v134 = 0;
  }
  applicationManagementDomain = self->_applicationManagementDomain;
  self->_applicationManagementDomain = (NSString *)v134;

  uint64_t v136 = objc_opt_class();
  uint64_t v137 = [v4 objectForKey:@"SignatureVersion"];
  v138 = (NSArray *)v137;
  if (v136 && v137 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v138 = 0;
  }
  slices = self->_slices;
  self->_slices = v138;

  uint64_t v140 = objc_opt_class();
  uint64_t v141 = [v4 objectForKey:@"AlternateIconName"];
  v142 = (void *)v141;
  if (v140 && v141 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v142 = 0;
  }
  primaryIconName = self->_primaryIconName;
  self->_primaryIconName = (NSString *)v142;

  self->_sdkVersionNumber._opaque[25] = objc_msgSend(v4, "_LS_BoolForKey:", @"IsWebNotificationBundle");
  uint64_t v144 = &self->_moreFlags;
  BOOL v145 = objc_msgSend(v4, "_LS_BoolForKey:", @"IsEligibleForWatchAppInstall") != 0;
  unsigned int v146 = (*(_WORD *)v144 | (*((unsigned __int8 *)v144 + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)uint64_t v144 = *(_WORD *)v144;
  *((unsigned char *)v144 + 2) = BYTE2(v146) | v145;
  if (objc_msgSend(v4, "_LS_BoolForKey:", @"IsMarketplace")) {
    int v147 = 0x80000;
  }
  else {
    int v147 = 0;
  }
  unsigned int v148 = (*(_WORD *)v144 | (*((unsigned __int8 *)v144 + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)uint64_t v144 = *(_WORD *)v144;
  *((unsigned char *)v144 + 2) = (v148 | v147) >> 16;

LABEL_160:
  return v5;
}

- (void)parseActivityTypesFromDictionary:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  uint64_t v21 = 0;
  groupContainers = self->_groupContainers;
  if (groupContainers)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [(NSDictionary *)groupContainers objectForKey:@"useractivity-team-identifier"];
    itemID = (__CFString *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (v7)
      {
LABEL_12:
        uint64_t v21 = itemID;
LABEL_19:
        installType = self->_installType;
        goto LABEL_20;
      }
    }
    else
    {
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        goto LABEL_12;
      }
    }
    uint64_t v12 = self->_groupContainers;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [(NSDictionary *)v12 objectForKey:@"com.apple.developer.team-identifier"];
    itemID = (__CFString *)v14;
    if (v13 && v14 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      itemID = 0;
    }
    uint64_t v21 = itemID;
    if (itemID) {
      goto LABEL_19;
    }
    uint64_t v17 = self->_groupContainers;
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = [(NSDictionary *)v17 objectForKey:@"application-identifier"];
    uint64_t v20 = (void *)v19;
    if (v18 && v19)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v20 = 0;
        goto LABEL_30;
      }
    }
    else if (!v19)
    {
      goto LABEL_30;
    }
    _LSSplitApplicationIdentifier(v20, (void **)&v21, 0);
LABEL_30:

    itemID = v21;
    installType = self->_installType;
    if (v21) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  installType = self->_installType;
LABEL_10:
  itemID = (__CFString *)self->_itemID;
LABEL_20:
  CFArrayRef v15 = _LSCopyActivityTypesClaimedHashedAdvertisingStrings((uint64_t)installType, itemID, v4, (const __CFDictionary *)self->_groupContainers);
  CFArrayRef v16 = v15;
  if (v15 && [(__CFArray *)v15 count]) {
    objc_storeStrong((id *)&self->_teamID, v16);
  }
}

- (void)parseNSExtensionSDKDefinitionsFromDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  context = (void *)MEMORY[0x18530F680]();
  CFDictionaryRef v4 = objc_opt_new();
  groupContainers = self->_groupContainers;
  if (groupContainers)
  {
    uint64_t v6 = [(NSDictionary *)groupContainers objectForKey:@"com.apple.private.coreservices.definesExtensionPoint"];

    if (v6)
    {
      LOBYTE(self->_inode) = 1;
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [v26 objectForKey:@"NSExtensionSDK"];
      BOOL v9 = (void *)v8;
      if (v7 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        BOOL v9 = 0;
      }
      [v4 addEntriesFromDictionary:v9];
    }
    else
    {
      LOBYTE(self->_inode) = 0;
    }
  }
  if ([(id)__LSDefaultsGetSharedInstance() allowsUnentitledExtensionPointDeclaration])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v26 objectForKey:@"_LSBundleExtensionPoints"];
    uint64_t v12 = (void *)v11;
    if (v10 && v11 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v12 = 0;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v20 = _LSExtensionsLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              uint64_t v21 = (objc_class *)objc_opt_class();
              __int16 v22 = NSStringFromClass(v21);
              [(LSBundleRecordBuilder *)v22 parseNSExtensionSDKDefinitionsFromDictionary:v20];
            }

            goto LABEL_30;
          }
          uint64_t v18 = _LSExtensionsLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = v17;
            _os_log_impl(&dword_182959000, v18, OS_LOG_TYPE_DEFAULT, "Registering extension point definition: %@", buf, 0xCu);
          }

          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v17];
          if (v19) {
            [v4 addEntriesFromDictionary:v19];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_30:
  }
  if ([v4 count])
  {
    int v23 = (NSDictionary *)[v4 copy];
    sandboxEnvironmentVariables = self->_sandboxEnvironmentVariables;
    self->_sandboxEnvironmentVariables = v23;
  }
}

- (LSBundleData)buildBundleData:(SEL)a3 error:(id)a4
{
  v249[4] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  bzero(retstr, 0x230uLL);
  unsigned __int8 retries = self->_retries;
  LOBYTE(retstr->activityTypes) = 11;
  BYTE1(retstr->activityTypes) = retries;
  retstr->_clas = self->_bundleClass;
  v205 = self;
  uint64_t v206 = v7;
  bundleAlias = self->_bundleAlias;
  id v232 = 0;
  obuint64_t j = _LSAliasAdd(v7, bundleAlias, &v232);
  id v200 = v232;
  unsigned int v10 = obj;
  if (!obj)
  {
    int v11 = _LSGetOSStatusFromNSError(v200);
    unsigned int v10 = 0;
    if (v11)
    {
      id v24 = v200;
LABEL_152:
      if (a5)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v11, (uint64_t)"-[LSBundleRecordBuilder buildBundleData:error:]", 2169, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_310;
    }
  }
  retstr->base.bookmaruint64_t k = v10;
  registrationInfo = self->_registrationInfo;
  if (registrationInfo)
  {
    retstr->base.container = registrationInfo->containerUnit;
    _LSBundleDataSetModTime((uint64_t)retstr, (int)registrationInfo->contentModDate);
  }
  else
  {
    retstr->base.container = 0;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  _LSBundleDataSetRegTime((uint64_t)retstr, (int)Current);
  CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
  unsigned int minSystemVersionPlatform = self->_minSystemVersionPlatform;
  retstr->sandboxEnvironmentVariables = (int)v14;
  *(_DWORD *)&retstr->_iconFlags = minSystemVersionPlatform;
  retstr->base.platforuint64_t m = self->_baseFlags;
  CFArrayRef v16 = *(void **)&self->_containerized;
  uint64_t v202 = retstr;
  if (v16)
  {
    uint64_t v17 = (unsigned int *)[v16 unsignedLongLongValue];
    retstr->sequenceNumber = (unint64_t)v17;
    if (v17)
    {
      uint64_t v18 = _LSRegistrationLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        installType = (unsigned int *)v205->_installType;
        LODWORD(buf.__begin_) = 138412546;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__begin_ + 4) = installType;
        WORD2(buf.__end_) = 2048;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__end_ + 6) = v17;
        _os_log_impl(&dword_182959000, v18, OS_LOG_TYPE_DEBUG, "Registering app %@ with compatibility state %llu", (uint8_t *)&buf, 0x16u);
      }
    }
  }
  compatibilityState = v205->_compatibilityState;
  if (compatibilityState)
  {
    uint64_t v21 = [(NSNumber *)compatibilityState unsignedLongLongValue];
    *(void *)&retstr->shortVersionString = v21;
    if (v21)
    {
      __int16 v22 = _LSRegistrationLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = (unsigned int *)v205->_installType;
        LODWORD(buf.__begin_) = 138412546;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__begin_ + 4) = v23;
        WORD2(buf.__end_) = 2048;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__end_ + 6) = v21;
        _os_log_impl(&dword_182959000, v22, OS_LOG_TYPE_ERROR, "Registering app %@ with install failure reason %llu", (uint8_t *)&buf, 0x16u);
      }
    }
  }
  if ([(id)__LSDefaultsGetSharedInstance() isInEducationMode])
  {
    unsigned int v198 = 0;
    id v24 = v200;
  }
  else
  {
    alternateNames = v205->_alternateNames;
    id v24 = v200;
    if (alternateNames)
    {
      id v231 = v200;
      unsigned int v198 = _LSAliasAddURL(v7, alternateNames, &v231);
      id v24 = v231;

      if (!v198)
      {
        int v11 = _LSGetOSStatusFromNSError(v24);
        unsigned int v198 = 0;
        int v197 = 0;
        if (v11) {
          goto LABEL_146;
        }
      }
    }
    else
    {
      unsigned int v198 = 0;
    }
  }
  retstr->base.dataContainerAlias = v198;
  dataContainerURL = v205->_dataContainerURL;
  if (dataContainerURL)
  {
    id v230 = v24;
    unsigned int v27 = _LSAliasAddURL(v7, dataContainerURL, &v230);
    id v201 = v230;

    if (!v27)
    {
      int v11 = _LSGetOSStatusFromNSError(v201);
      unsigned int v27 = 0;
      if (v11)
      {
        int v197 = 0;
        goto LABEL_145;
      }
    }
  }
  else
  {
    unsigned int v27 = 0;
    id v201 = v24;
  }
  int v197 = v27;
  retstr->extensionPoints = v27;
  installFailureReasouint64_t n = v205->_installFailureReason;
  if (installFailureReason)
  {
    long long v29 = (long long *)v249;
    _LSVersionNumberMakeWithString(v249, installFailureReason);
  }
  else
  {
    appStoreToolsBuildVersiouint64_t n = v205->_appStoreToolsBuildVersion;
    if (appStoreToolsBuildVersion)
    {
      long long v29 = (long long *)v248;
      _LSVersionNumberMakeWithString(v248, appStoreToolsBuildVersion);
    }
    else
    {
      long long v29 = &kLSVersionNumberNull;
    }
  }
  long long v31 = v29[1];
  *(_OWORD *)retstr->base.version._opaque = *v29;
  *(_OWORD *)&retstr->base.version._opaque[16] = v31;
  versiouint64_t n = v205->_version;
  if (version)
  {
    _LSVersionNumberMakeWithString(v247, version);
    *(_OWORD *)&retstr->_mtime = v247[0];
    *(_OWORD *)&retstr->_minSystemVersion._opaque[8] = v247[1];
  }
  else
  {
    *(_OWORD *)&retstr->_mtime = kLSVersionNumberNull;
    *(_OWORD *)&retstr->_minSystemVersion._opaque[8] = *(_OWORD *)algn_182AF9270;
  }
  retstr->_hfsType = v205->_platform;
  minSystemVersiouint64_t n = v205->_minSystemVersion;
  if (minSystemVersion)
  {
    _LSVersionNumberMakeWithString(v246, minSystemVersion);
    *(_OWORD *)&retstr->_minSystemVersion._opaque[24] = v246[0];
    *(_OWORD *)&retstr->_maxSystemVersion._opaque[8] = v246[1];
  }
  else
  {
    *(_OWORD *)&retstr->_minSystemVersion._opaque[24] = kLSVersionNumberNull;
    *(_OWORD *)&retstr->_maxSystemVersion._opaque[8] = *(_OWORD *)algn_182AF9270;
  }
  long long v34 = *(_OWORD *)&v205->_sdkVersionNumber._opaque[8];
  *(_OWORD *)retstr->base.execSDKVersion._opaque = *(_OWORD *)&v205->_supportedGameControllers;
  *(_OWORD *)&retstr->base.execSDKVersion._opaque[16] = v34;
  *(_DWORD *)&retstr->_maxSystemVersion._opaque[24] = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_sdkVersion, 0);
  deviceFamily = v205->_deviceFamily;
  if (deviceFamily && [(NSArray *)deviceFamily unsignedLongLongValue])
  {
    unsigned int previousInstallType = [(NSArray *)v205->_deviceFamily unsignedLongLongValue];
  }
  else
  {
    unsigned int previousInstallType = v205->_previousInstallType;
    if (!previousInstallType) {
      goto LABEL_44;
    }
  }
  retstr->bundleVersiouint64_t n = previousInstallType;
LABEL_44:
  *(void *)&retstr->_maxSystemVersion._opaque[28] = v205->_sequenceNumber;
  purchaserDSID = v205->_purchaserDSID;
  if (purchaserDSID) {
    retstr->purchaserDSID = [(NSNumber *)purchaserDSID unsignedLongLongValue];
  }
  iconFileNames = v205->_iconFileNames;
  if (iconFileNames) {
    retstr->staticDiskUsage = [(NSArray *)iconFileNames unsignedLongLongValue];
  }
  downloaderDSID = v205->_downloaderDSID;
  if (downloaderDSID) {
    retstr->downloaderDSID = [(NSNumber *)downloaderDSID unsignedLongLongValue];
  }
  ratingLabel = v205->_ratingLabel;
  if (ratingLabel) {
    *(void *)&retstr->sourceAppBundleID = [(NSString *)ratingLabel unsignedLongLongValue];
  }
  genre = v205->_genre;
  if (genre) {
    *(void *)(&retstr->managementDeclarationIdentifier + 1) = [(NSString *)genre unsignedLongLongValue];
  }
  machOUUIDs = v205->_machOUUIDs;
  if (machOUUIDs) {
    retstr->compatibilityState = [(NSArray *)machOUUIDs unsignedLongLongValue];
  }
  familyID = v205->_familyID;
  if (familyID) {
    *(void *)&retstr->vendorName = [(NSNumber *)familyID unsignedLongLongValue];
  }
  itemName = v205->_itemName;
  if (itemName) {
    *(unint64_t *)((char *)&retstr->familyID + 4) = [(NSString *)itemName unsignedLongLongValue];
  }
  storefront = v205->_storefront;
  if (storefront) {
    *(void *)(&retstr->itemName + 1) = [(NSNumber *)storefront unsignedLongLongValue];
  }
  HIDWORD(retstr->storefront) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_versionID, 0);
  HIDWORD(retstr->itemID) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_installType, 1);
  retstr->base.exactIdentifier = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_installType, 0);
  retstr->base.bundleName = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_shortDisplayName, 0);
  retstr->base.execPath = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_shortVersionString, 0);
  retstr->base.displayName = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_identifier, 0);
  retstr->secondaryCategoryType = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_installFailureReason, 0);
  retstr->filename = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_appStoreToolsBuildVersion, 0);
  LODWORD(retstr->installFailureReason) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_secondCategoryType, 0);
  vendorName = v205->_vendorName;
  if (vendorName)
  {
    if ([(NSString *)vendorName isEqualToString:@"CoreServices"])
    {
      int StringForCFString = _LSDatabaseCreateStringForCFString(v206, @"Hidden", 0);
      goto LABEL_68;
    }
    CFStringRef v48 = (const __CFString *)v205->_vendorName;
  }
  else
  {
    CFStringRef v48 = 0;
  }
  int StringForCFString = _LSDatabaseCreateStringForCFString(v206, v48, 0);
LABEL_68:
  HIDWORD(retstr->installFailureReason) = StringForCFString;
  LODWORD(retstr->familyID) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_signerOrganization, 0);
  LODWORD(retstr->versionIdentifier) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_sourceAppBundleID, 0);
  HIDWORD(retstr->versionIdentifier) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_appVariant, 0);
  managementDeclarationIdentifier = v205->_managementDeclarationIdentifier;
  if (managementDeclarationIdentifier)
  {
    v50 = [(NSString *)managementDeclarationIdentifier allObjects];
    retstr->deviceFamilies = _LSDatabaseCreateStringArray(v206, v50, 0, 0);
  }
  counterpartAppBundleIDs = v205->_counterpartAppBundleIDs;
  if (counterpartAppBundleIDs)
  {
    uint64_t v52 = [(NSMutableSet *)counterpartAppBundleIDs allObjects];
    retstr->identifier = _LSDatabaseCreateStringArray(v206, v52, 0, 0);
  }
  equivalentBundleIDs = v205->_equivalentBundleIDs;
  if (equivalentBundleIDs) {
    *(_DWORD *)&retstr->revisiouint64_t n = _LSDatabaseCreateStringArray(v206, equivalentBundleIDs, 0, 0);
  }
  if ([(NSDictionary *)v205->_unlocalizedNamesWithContext count])
  {
    v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSDictionary count](v205->_unlocalizedNamesWithContext, "count"));
    memset(&buf, 0, sizeof(buf));
    std::vector<unsigned int>::reserve(&buf, [(NSDictionary *)v205->_unlocalizedNamesWithContext count]);
    long long v228 = 0u;
    long long v229 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    v55 = v205->_unlocalizedNamesWithContext;
    uint64_t v56 = [(NSDictionary *)v55 countByEnumeratingWithState:&v226 objects:v245 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v227;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v227 != v57) {
            objc_enumerationMutation(v55);
          }
          uint64_t v59 = *(void *)(*((void *)&v226 + 1) + 8 * i);
          uint64_t v60 = -[_LSDatabase store](v59);
          [v54 addObject:v60];

          unsigned int v61 = -[_LSPersonaWithAttributes personaType](v59);
          unsigned int v62 = v61;
          std::vector<unsigned int>::pointer end = buf.__end_;
          if (buf.__end_ >= buf.__end_cap_.__value_)
          {
            std::vector<unsigned int>::pointer begin = buf.__begin_;
            int64_t v66 = buf.__end_ - buf.__begin_;
            unint64_t v67 = v66 + 1;
            if ((unint64_t)(v66 + 1) >> 62) {
              abort();
            }
            int64_t v68 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
            if (((char *)buf.__end_cap_.__value_ - (char *)buf.__begin_) >> 1 > v67) {
              unint64_t v67 = v68 >> 1;
            }
            if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v69 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v69 = v67;
            }
            if (v69)
            {
              uint64_t v70 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&buf.__end_cap_, v69);
              std::vector<unsigned int>::pointer end = buf.__end_;
              std::vector<unsigned int>::pointer begin = buf.__begin_;
            }
            else
            {
              uint64_t v70 = 0;
            }
            uint64_t v71 = (unsigned int *)&v70[4 * v66];
            *uint64_t v71 = v62;
            uint64_t v64 = v71 + 1;
            while (end != begin)
            {
              unsigned int v72 = *--end;
              *--uint64_t v71 = v72;
            }
            buf.__begin_ = v71;
            buf.__end_ = v64;
            buf.__end_cap_.__value_ = (unsigned int *)&v70[4 * v69];
            if (begin) {
              operator delete(begin);
            }
          }
          else
          {
            *buf.__end_ = v61;
            uint64_t v64 = end + 1;
          }
          buf.__end_ = v64;
        }
        uint64_t v56 = [(NSDictionary *)v55 countByEnumeratingWithState:&v226 objects:v245 count:16];
      }
      while (v56);
    }

    retstr->uint64_t carPlayInstrumentClusterURLSchemes = _LSDatabaseCreateStringArray(v206, v54, 0, 0);
    unsigned int v73 = _CSArrayCreate();
    retstr->uint64_t appContainerAlias = v73;
    if (!retstr->carPlayInstrumentClusterURLSchemes || !v73)
    {
      uint64_t v74 = _LSRegistrationLog();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        uint64_t carPlayInstrumentClusterURLSchemes = retstr->carPlayInstrumentClusterURLSchemes;
        uint64_t appContainerAlias = retstr->appContainerAlias;
        *(_DWORD *)v242 = 134218240;
        *(void *)&v242[4] = carPlayInstrumentClusterURLSchemes;
        __int16 v243 = 2048;
        uint64_t v244 = appContainerAlias;
        _os_log_impl(&dword_182959000, v74, OS_LOG_TYPE_ERROR, "failed to allocate personas (%llx) or persona types (%llx) CSArray", v242, 0x16u);
      }

      *(void *)&retstr->uint64_t carPlayInstrumentClusterURLSchemes = 0;
    }
    if (buf.__begin_)
    {
      buf.__end_ = buf.__begin_;
      operator delete(buf.__begin_);
    }
  }
  bundlePersonas = v205->_bundlePersonas;
  if (bundlePersonas) {
    unsigned __int8 v78 = [(NSArray *)bundlePersonas unsignedLongLongValue];
  }
  else {
    unsigned __int8 v78 = -1;
  }
  retstr->base.containingDirectoryClass = v78;
  retstr->base.profileValidationState = [(LSBundleRecordBuilder *)v205 profileValidationState];
  retstr->managementDeclarationIdentifier = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_supportedComplicationFamilies, 0);
  HIDWORD(retstr->ratingRank) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_ratingRank, 0);
  retstr->ratingLabel = _LSPlistAdd((uint64_t)v206, v205->_genreID);
  uint64_t v79 = +[FSNode nameForBookmarkData:v205->_bundleAlias error:0];
  if (v79) {
    retstr->categoryType = _LSDatabaseCreateStringForCFString(v206, v79, 1);
  }

  if (!retstr->categoryType)
  {
    int v11 = -10817;
    goto LABEL_145;
  }
  retstr->counterpartIdentifiers = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_bundleContainerURL, 0);
  retstr->equivalentBundleIdentifiers = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_categoryType, 0);
  activityTypes = v205->_activityTypes;
  if (activityTypes)
  {
    memset(&buf, 0, sizeof(buf));
    long long v222 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    long long v225 = 0u;
    uint64_t v81 = activityTypes;
    uint64_t v82 = [(NSArray *)v81 countByEnumeratingWithState:&v222 objects:v241 count:16];
    if (v82)
    {
      uint64_t v83 = *(void *)v223;
      do
      {
        for (uint64_t j = 0; j != v82; ++j)
        {
          if (*(void *)v223 != v83) {
            objc_enumerationMutation(v81);
          }
          uint64_t v85 = *(void **)(*((void *)&v222 + 1) + 8 * j);
          if (objc_opt_respondsToSelector())
          {
            signed int v86 = [v85 intValue];
            unsigned int v87 = v86;
            if (v86 >= 1)
            {
              std::vector<unsigned int>::pointer v88 = buf.__end_;
              if (buf.__end_ >= buf.__end_cap_.__value_)
              {
                std::vector<unsigned int>::pointer v90 = buf.__begin_;
                int64_t v91 = buf.__end_ - buf.__begin_;
                unint64_t v92 = v91 + 1;
                if ((unint64_t)(v91 + 1) >> 62) {
                  abort();
                }
                int64_t v93 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
                if (((char *)buf.__end_cap_.__value_ - (char *)buf.__begin_) >> 1 > v92) {
                  unint64_t v92 = v93 >> 1;
                }
                if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v94 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v94 = v92;
                }
                if (v94)
                {
                  v95 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&buf.__end_cap_, v94);
                  std::vector<unsigned int>::pointer v88 = buf.__end_;
                  std::vector<unsigned int>::pointer v90 = buf.__begin_;
                }
                else
                {
                  v95 = 0;
                }
                uint64_t v96 = (unsigned int *)&v95[4 * v91];
                *uint64_t v96 = v87;
                uint64_t v89 = v96 + 1;
                while (v88 != v90)
                {
                  unsigned int v97 = *--v88;
                  *--uint64_t v96 = v97;
                }
                buf.__begin_ = v96;
                buf.__end_ = v89;
                buf.__end_cap_.__value_ = (unsigned int *)&v95[4 * v94];
                if (v90) {
                  operator delete(v90);
                }
              }
              else
              {
                *buf.__end_ = v86;
                uint64_t v89 = v88 + 1;
              }
              buf.__end_ = v89;
            }
          }
        }
        uint64_t v82 = [(NSArray *)v81 countByEnumeratingWithState:&v222 objects:v241 count:16];
      }
      while (v82);
    }

    *(void *)v242 = 0;
    int v98 = _CSArrayCreate();
    LODWORD(v202->itemID) = v98;
    if (v98) {
      int v11 = 0;
    }
    else {
      int v11 = _LSGetOSStatusFromNSError(*(void **)v242);
    }

    if (buf.__begin_)
    {
      buf.__end_ = buf.__begin_;
      operator delete(buf.__begin_);
    }
    retstr = v202;
    if (v11) {
      goto LABEL_145;
    }
  }
  execPath = v205->_execPath;
  if (execPath) {
    retstr->base.machOUUIDs = _LSDatabaseCreateStringArray(v206, execPath, 0, 0);
  }
  int v11 = [(LSBundleRecordBuilder *)v205 registerQueriableSchemes:v206 bundleData:retstr];
  if (v11) {
    goto LABEL_145;
  }
  *(&retstr->ratingLabel + 1) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_distributorInfo, 0);
  LODWORD(retstr->genreID) = _LSDatabaseCreateStringForCFString(v206, (const __CFString *)v205->_primaryIconName, 0);
  HIDWORD(retstr->genreID) = _LSPlistAdd((uint64_t)v206, v205->_alternatePrimaryIconName);
  iconsDict = v205->_iconsDict;
  if (iconsDict)
  {
    unsigned int StringArray = _LSDatabaseCreateStringArray(v206, iconsDict, 0, 0);
    retstr->genre = StringArray;
    if (!StringArray) {
      goto LABEL_315;
    }
  }
  if ([*(id *)&v205->_canDefineSystemExtensionPoint count]
    || [(NSMutableDictionary *)v205->_plistRarities count])
  {
    id v102 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v103 = v102;
    if (*(void *)&v205->_canDefineSystemExtensionPoint) {
      objc_msgSend(v102, "addEntriesFromDictionary:");
    }
    if (v205->_plistRarities) {
      objc_msgSend(v103, "addEntriesFromDictionary:");
    }
    retstr->base.infoDictionary = _LSPlistAdd((uint64_t)v206, v103);

    retstr = v202;
  }
  else
  {
    retstr->base.infoDictionary = 0;
  }
  retstr->base.groupContainers = _LSPlistAdd((uint64_t)v206, v205->_driverExtensionPaths);
  retstr->base.entitlements = _LSPlistAdd((uint64_t)v206, v205->_groupContainers);
  retstr->queriableSchemes = _LSPlistAdd((uint64_t)v206, v205->_entitlements);
  retstr->base.intentDefinitionURLs = _LSPlistAdd((uint64_t)v206, v205->_extensionSDK);
  retstr->plugins = _LSDatabaseCreateStringArray(v206, v205->_intentDefinitionURLs, 0, 0);
  retstr->driverExtensions = _LSDatabaseCreateStringArray(v206, v205->_bgPermittedIdentifiers, 0, 0);
  uint64_t v104 = (void *)MEMORY[0x18530F680]();
  memset(&buf, 0, sizeof(buf));
  long long v218 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  uint64_t v105 = v205->_commonInfoPlistEntries;
  uint64_t v106 = [(NSMutableDictionary *)v105 countByEnumeratingWithState:&v218 objects:v240 count:16];
  if (v106)
  {
    uint64_t v107 = *(void *)v219;
    do
    {
      for (uint64_t k = 0; k != v106; ++k)
      {
        if (*(void *)v219 != v107) {
          objc_enumerationMutation(v105);
        }
        unsigned int v109 = _LSPlistAdd((uint64_t)v206, *(void **)(*((void *)&v218 + 1) + 8 * k));
        unsigned int v110 = v109;
        if (v109)
        {
          std::vector<unsigned int>::pointer v111 = buf.__end_;
          if (buf.__end_ >= buf.__end_cap_.__value_)
          {
            std::vector<unsigned int>::pointer v113 = buf.__begin_;
            int64_t v114 = buf.__end_ - buf.__begin_;
            unint64_t v115 = v114 + 1;
            if ((unint64_t)(v114 + 1) >> 62) {
              abort();
            }
            int64_t v116 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
            if (((char *)buf.__end_cap_.__value_ - (char *)buf.__begin_) >> 1 > v115) {
              unint64_t v115 = v116 >> 1;
            }
            if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v117 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v117 = v115;
            }
            if (v117)
            {
              uint64_t v118 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&buf.__end_cap_, v117);
              std::vector<unsigned int>::pointer v111 = buf.__end_;
              std::vector<unsigned int>::pointer v113 = buf.__begin_;
            }
            else
            {
              uint64_t v118 = 0;
            }
            uint64_t v119 = (unsigned int *)&v118[4 * v114];
            *uint64_t v119 = v110;
            uint64_t v112 = v119 + 1;
            while (v111 != v113)
            {
              unsigned int v120 = *--v111;
              *--uint64_t v119 = v120;
            }
            buf.__begin_ = v119;
            buf.__end_ = v112;
            buf.__end_cap_.__value_ = (unsigned int *)&v118[4 * v117];
            if (v113) {
              operator delete(v113);
            }
          }
          else
          {
            *buf.__end_ = v109;
            uint64_t v112 = v111 + 1;
          }
          buf.__end_ = v112;
        }
      }
      uint64_t v106 = [(NSMutableDictionary *)v105 countByEnumeratingWithState:&v218 objects:v240 count:16];
    }
    while (v106);
  }

  uint64_t v121 = buf.__begin_;
  if (buf.__begin_ == buf.__end_)
  {
    v122 = v202;
    if (!buf.__begin_) {
      goto LABEL_194;
    }
    goto LABEL_193;
  }
  v122 = v202;
  v202->localizedNameWithContext[0] = _CSArrayCreate();
  uint64_t v121 = buf.__begin_;
  if (buf.__begin_)
  {
LABEL_193:
    buf.__end_ = v121;
    operator delete(v121);
  }
LABEL_194:
  v122->base.localizedDisplayName = LaunchServices::LocalizedString::Add(v206, v205->_carPlayInstrumentClusterURLSchemes, v205->_identifier);
  v122->base.localizedShortDisplayName = LaunchServices::LocalizedString::Add(v206, v205->_localizedNames, v205->_displayName);
  v122->base.localizedMicrophoneUsageDescriptiouint64_t n = LaunchServices::LocalizedString::Add(v206, v205->_microphoneUsageDescription, v205->_localizedShortNames);
  v122->base.localizedIdentityUsageDescriptiouint64_t n = LaunchServices::LocalizedString::Add(v206, v205->_identityUsageDescription, v205->_localizedMicrophoneUsageDescription);
  buf.__begin_ = 0;
  buf.__end_ = (std::vector<unsigned int>::pointer)&buf;
  buf.__end_cap_.__value_ = (unsigned int *)0x26012000000;
  v236 = __Block_byref_object_copy__11;
  v237 = __Block_byref_object_dispose__11;
  v238 = &unk_182B5933F;
  memcpy(v239, v122, sizeof(v239));
  v215[0] = MEMORY[0x1E4F143A8];
  v215[1] = 3221225472;
  v215[2] = __47__LSBundleRecordBuilder_buildBundleData_error___block_invoke;
  v215[3] = &unk_1E522DC98;
  v215[4] = v205;
  p_std::vector<unsigned int> buf = &buf;
  id v199 = v206;
  id v216 = v199;
  _LSBundleDisplayNameContextEnumerate(v215);
  memcpy(v122, buf.__end_ + 12, 0x230uLL);

  _Block_object_dispose(&buf, 8);
  v123 = v202;
  v202->distributorInfo = _LSDatabaseCreateStringForCFString(v199, (const __CFString *)v205->_staticDiskUsage, 0);
  libraryPath = v205->_libraryPath;
  if (libraryPath)
  {
    unsigned int v125 = _LSDatabaseCreateStringArray(v199, libraryPath, 0, 0);
    v202->primaryIconName = v125;
    if (!v125)
    {
LABEL_315:
      int v11 = -9493;
      goto LABEL_145;
    }
  }
  __int16 v126 = v205;
  if ((v205->_bundleFlags & 0x100) != 0) {
    goto LABEL_223;
  }
  importedTypes = v205->_importedTypes;
  if (importedTypes || v205->_URLClaims)
  {
    buf.__begin_ = 0;
    [(NSArray *)importedTypes count];
    [(NSArray *)v205->_URLClaims count];
    unsigned int v128 = _CSArrayCreateWithCapacity();
    v202->iconsDict = v128;
    if (!v128)
    {
      int v11 = _LSGetOSStatusFromNSError(buf.__begin_);
      if (v11) {
        goto LABEL_318;
      }
    }
    uint64_t v129 = v205->_importedTypes;
    if (v129 && [(NSArray *)v129 count]
      || (URLClaims = v205->_URLClaims) != 0 && [(NSArray *)URLClaims count])
    {
      [(LSBundleRecordBuilder *)v205 addPlistFlag:0x10000];
    }
  }
  documentClaims = v205->_documentClaims;
  if (!documentClaims && !v205->_libraryItems) {
    goto LABEL_217;
  }
  buf.__begin_ = 0;
  [(NSArray *)documentClaims count];
  [(NSArray *)v205->_libraryItems count];
  unsigned int v132 = _CSArrayCreateWithCapacity();
  v202->alternatePrimaryIconName = v132;
  if (!v132)
  {
    int v11 = _LSGetOSStatusFromNSError(buf.__begin_);
    if (v11)
    {
LABEL_318:

      goto LABEL_145;
    }
  }
  uint64_t v133 = v205->_documentClaims;
  if (v133 && [(NSArray *)v133 count]
    || (libraryItems = v205->_libraryItems) != 0 && [(NSArray *)libraryItems count])
  {
    [(LSBundleRecordBuilder *)v205 addPlistFlag:0x10000];
  }

LABEL_217:
  queriableSchemes = v205->_queriableSchemes;
  if (queriableSchemes)
  {
    buf.__begin_ = 0;
    [(NSArray *)queriableSchemes count];
    unsigned int v136 = _CSArrayCreateWithCapacity();
    v202->iconFileNames = v136;
    if (v136)
    {
    }
    else
    {
      int v11 = _LSGetOSStatusFromNSError(buf.__begin_);

      if (v11) {
        goto LABEL_145;
      }
    }
  }
  __int16 v126 = v205;
  sandboxEnvironmentVariables = v205->_sandboxEnvironmentVariables;
  v123 = v202;
  if (sandboxEnvironmentVariables)
  {
    buf.__begin_ = 0;
    [(NSDictionary *)sandboxEnvironmentVariables count];
    unsigned int v138 = _CSArrayCreateWithCapacity();
    v202->libraryItems = v138;
    if (v138)
    {

      v123 = v202;
      __int16 v126 = v205;
      goto LABEL_223;
    }
    int v11 = _LSGetOSStatusFromNSError(buf.__begin_);

    v123 = v202;
    __int16 v126 = v205;
    if (!v11) {
      goto LABEL_223;
    }
LABEL_145:
    id v24 = v201;
LABEL_146:
    if (obj) {
      _LSAliasRemove(v206, obj);
    }
    if (v197) {
      _LSAliasRemove(v206, v197);
    }
    if (v198) {
      _LSAliasRemove(v206, v198);
    }
    goto LABEL_152;
  }
LABEL_223:
  pluginMIDicts = v126->_pluginMIDicts;
  if (pluginMIDicts) {
    v123->libraryPath = _LSDatabaseCreateStringArray(v199, pluginMIDicts, 0, 0);
  }
  uint64_t v140 = v205;
  uint64_t v141 = v205->_installType;
  if (v141)
  {
    char v142 = [(NSNumber *)v141 hasPrefix:@"com.apple."];
    uint64_t v140 = v205;
    if (v142) {
      goto LABEL_233;
    }
  }
  uint64_t v143 = v140->_vendorName;
  if (!v143) {
    goto LABEL_253;
  }
  BOOL v144 = [(NSString *)v143 isEqualToString:@"Internal"];
  uint64_t v140 = v205;
  if (v144) {
    goto LABEL_233;
  }
  BOOL v145 = [(NSString *)v205->_vendorName isEqualToString:@"System"];
  uint64_t v140 = v205;
  if (v145
    || (BOOL v146 = [(NSString *)v205->_vendorName isEqualToString:@"SystemAppPlaceholder"],
        uint64_t v140 = v205,
        v146)
    || (BOOL v147 = [(NSString *)v205->_vendorName isEqualToString:@"CoreServices"],
        uint64_t v140 = v205,
        v147)
    || (v148 = [(NSString *)v205->_vendorName isEqualToString:@"Hidden"], uint64_t v140 = v205, v148))
  {
LABEL_233:
    *((unsigned char *)&v140->_moreFlags + 3) |= 1u;
  }
  v149 = v140->_vendorName;
  if (v149 && ![(NSString *)v149 isEqualToString:@"User"])
  {
    if ((v205->_plistContentFlags & 0x800) != 0)
    {
      uint64_t v151 = *(void **)&v205->_canDefineSystemExtensionPoint;
      uint64_t v152 = objc_opt_class();
      uint64_t v153 = [v151 objectForKey:@"SBAppTags"];
      v154 = (void *)v153;
      if (v152 && v153 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        v154 = 0;
      }
      if ([v154 containsObject:@"hidden"]) {
        [(LSBundleRecordBuilder *)v205 addBundleFlag:0x40000000000];
      }

      v123 = v202;
    }
    else if ([(NSString *)v205->_vendorName isEqualToString:@"CoreServices"] {
           || (int v150 = v205->_installType) != 0
    }
           && [(NSNumber *)v150 isEqualToString:@"com.apple.purplebuddy"])
    {
      [(LSBundleRecordBuilder *)v205 addBundleFlag:0x40000000000];
    }
  }
LABEL_253:
  CFStringRef itemID = (const __CFString *)v205->_itemID;
  if (itemID)
  {
LABEL_256:
    v123->base.teamID = _LSDatabaseCreateStringForCFString(v199, itemID, 0);
    goto LABEL_257;
  }
  if (*((unsigned char *)&v205->_moreFlags + 3))
  {
    CFStringRef itemID = @"0000000000";
    goto LABEL_256;
  }
LABEL_257:
  uint64_t v156 = v205;
  if ((v205->_bundleFlags & 0x1000000000000000) != 0)
  {
    uint64_t v157 = [(NSString *)v205->_teamID count];
    uint64_t v156 = v205;
    if (v157)
    {
      v158 = _LSInstallLog();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v159 = (unsigned int *)v205->_installType;
        LODWORD(buf.__begin_) = 138412290;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__begin_ + 4) = v159;
        _os_log_impl(&dword_182959000, v158, OS_LOG_TYPE_DEFAULT, "App %@ is an app clip; ignoring its activity types.",
          (uint8_t *)&buf,
          0xCu);
      }

      v123 = v202;
      goto LABEL_264;
    }
  }
  teamID = v156->_teamID;
  if (teamID)
  {
    unsigned int v161 = _LSDatabaseCreateStringArray(v199, teamID, 0, 0);
    v123->claims = v161;
    if (!v161) {
      goto LABEL_315;
    }
  }
LABEL_264:
  v123->base.signerIdentity = _LSDatabaseCreateStringForCFString(v199, (const __CFString *)v205->_appType, 0);
  v123->base.codeInfoIdentifier = _LSDatabaseCreateStringForCFString(v199, (const __CFString *)v205->_signerIdentity, 0);
  v123->base.signerOrganizatiouint64_t n = _LSDatabaseCreateStringForCFString(v199, (const __CFString *)v205->_codeInfoIdentifier, 0);
  v123->base.signatureVersiouint64_t n = [(NSArray *)v205->_slices unsignedLongLongValue];
  v123->bundlePersonas = _LSPlistAdd((uint64_t)v199, v205->_directoryClass);
  v123->bundlePersonaTypes = _LSDatabaseCreateStringForCFString(v199, (const __CFString *)v205->_stashedAppInfo, 0);
  v123->recordModificationTime = _LSDatabaseCreateStringForCFString(v199, (const __CFString *)v205->_applicationManagementDomain, 0);
  v162 = v205;
  if (v205->_documentClaims)
  {
    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    obja = v205->_documentClaims;
    uint64_t v163 = [(NSArray *)obja countByEnumeratingWithState:&v211 objects:v234 count:16];
    if (v163)
    {
      uint64_t v164 = *(void *)v212;
      uint64_t v165 = *MEMORY[0x1E4F1CCB0];
      do
      {
        for (uint64_t m = 0; m != v163; ++m)
        {
          if (*(void *)v212 != v164) {
            objc_enumerationMutation(obja);
          }
          char v167 = *(void **)(*((void *)&v211 + 1) + 8 * m);
          if (_NSIsNSDictionary())
          {
            uint64_t v168 = objc_opt_class();
            uint64_t v169 = [v167 objectForKey:v165];
            uint64_t v170 = (void *)v169;
            if (v168 && v169 && (objc_opt_isKindOfClass() & 1) == 0)
            {

              uint64_t v170 = 0;
            }
            long long v209 = 0u;
            long long v210 = 0u;
            long long v207 = 0u;
            long long v208 = 0u;
            id v171 = v170;
            uint64_t v172 = [v171 countByEnumeratingWithState:&v207 objects:v233 count:16];
            if (v172)
            {
              uint64_t v173 = *(void *)v208;
              while (2)
              {
                for (uint64_t n = 0; n != v172; ++n)
                {
                  if (*(void *)v208 != v173) {
                    objc_enumerationMutation(v171);
                  }
                  uint64_t v175 = *(void **)(*((void *)&v207 + 1) + 8 * n);
                  if (_NSIsNSString() && ![v175 caseInsensitiveCompare:@"file"])
                  {
                    [(LSBundleRecordBuilder *)v205 addBundleFlag:0x8000000];
                    goto LABEL_286;
                  }
                }
                uint64_t v172 = [v171 countByEnumeratingWithState:&v207 objects:v233 count:16];
                if (v172) {
                  continue;
                }
                break;
              }
            }
LABEL_286:
          }
        }
        uint64_t v163 = [(NSArray *)obja countByEnumeratingWithState:&v211 objects:v234 count:16];
      }
      while (v163);
    }

    v123 = v202;
    v162 = v205;
  }
  groupContainers = v162->_groupContainers;
  if (groupContainers)
  {
    v177 = [(NSDictionary *)groupContainers objectForKey:@"beta-reports-active"];
    BOOL v178 = v177 == 0;

    v123 = v202;
    if (!v178) {
      [(LSBundleRecordBuilder *)v205 addBundleFlag:0x200000];
    }
    v162 = v205;
    if ((([(NSString *)v205->_vendorName isEqualToString:@"System"] | ((*((unsigned char *)&v205->_moreFlags + 3) & 0x10) >> 4)) & 1) == 0)
    {
      uint64_t v179 = [(NSDictionary *)v205->_groupContainers objectForKey:@"com.apple.developer.web-browser-engine.host"];
      BOOL v180 = v179 == 0;

      if (!v180) {
        *((unsigned char *)&v205->_moreFlags + 2) |= 2u;
      }
      v181 = [(NSDictionary *)v205->_groupContainers objectForKey:@"com.apple.developer.embedded-web-browser-engine"];
      BOOL v182 = v181 == 0;

      v123 = v202;
      v162 = v205;
      if (!v182) {
        *((unsigned char *)&v205->_moreFlags + 2) |= 4u;
      }
    }
  }
  v123->appClipFields.parentAppIDs = _LSPlistAdd((uint64_t)v199, v162->_signatureVersion);
  v123->base._sliceMasuint64_t k = _LSSliceMaskForSliceArray(v205->_mobileInstallIDs);
  if (v205->_sdkVersionNumber._opaque[25]) {
    [(LSBundleRecordBuilder *)v205 addBundleFlag:0x8000000000];
  }
  uint64_t v183 = v205->_registrationInfo;
  if ((v183->options & 0x40) != 0 || v183->bundleClass == 16) {
    [(LSBundleRecordBuilder *)v205 addBundleFlag:0x40000];
  }
  unint64_t bundleFlags = v205->_bundleFlags;
  *(_WORD *)((char *)&v123->_itemFlags + 1) = v205->_moreFlags;
  v185 = (unsigned __int16 *)((char *)&v123->_itemFlags + 1);
  *(void *)((char *)v185 - 17) = bundleFlags;
  *(_DWORD *)((char *)v185 - 9) = v205->_plistContentFlags;
  unsigned int itemFlags = v205->_itemFlags;
  *((unsigned char *)v185 - 1) = v205->_iconFlags;
  *(_DWORD *)((char *)v185 - 5) = itemFlags;
  LOBYTE(bundleFlags) = *((unsigned char *)&v205->_moreFlags + 2);
  char v187 = *((unsigned char *)&v205->_moreFlags + 3);
  *((unsigned char *)v185 + 2) = bundleFlags;
  *((unsigned char *)v185 - 25) = v187;
  int v188 = bundleFlags;
  v189 = v185;
  int v190 = *v185;
  uint64_t v191 = +[_LSDAppProtectionClient hiddenApplicationsForLSDUseOnly];
  if ([v191 containsObject:v205->_installType]) {
    int v192 = 0x100000;
  }
  else {
    int v192 = 0;
  }

  v193 = +[_LSDAppProtectionClient lockedApplicationsForLSDUseOnly];
  if ([v193 containsObject:v205->_installType]) {
    int v194 = 0x200000;
  }
  else {
    int v194 = 0;
  }

  unsigned __int16 *v189 = v192 | v190 | v194;
  *((unsigned char *)v189 + 2) = (v192 | (v190 | (v188 << 16)) & 0xFFCFFFFF | v194) >> 16;
  id v24 = v201;
LABEL_310:

  return result;
}

void __47__LSBundleRecordBuilder_buildBundleData_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = [*(id *)(*(void *)(a1 + 32) + 808) objectForKeyedSubscript:a4];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 800) objectForKeyedSubscript:a4];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 4 * a2 + 564) = LaunchServices::LocalizedString::Add(*(void **)(a1 + 40), v7, v8);
}

- (int)activateBindings:(id)a3 unitID:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  id v7 = a3;
  int v8 = _LSBindableActivate(v7, a4);
  if (!v8)
  {
    int v8 = _LSBindableActivate(v7, a4);
    if (!v8 && (!a5->base.bundleName || (int v8 = _LSBindableActivate(v7, a4)) == 0))
    {
      if (a5->recordModificationTime) {
        int v8 = _LSBindableActivate(v7, a4);
      }
      else {
        int v8 = 0;
      }
    }
  }

  return v8;
}

- (unsigned)registerBundleRecord:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unsigned int v37 = 0;
  memset(__src, 0, 512);
  id v31 = a3;
  uint64_t v32 = self;
  -[LSBundleRecordBuilder buildBundleData:error:](self, "buildBundleData:error:");
  memcpy(__dst, __src, sizeof(__dst));
  unsigned int v29 = _LSBundleAdd(v31, (uint64_t)__dst, &v37);
  if (v29)
  {
    unsigned int v37 = 0;
  }
  else
  {
    unsigned int v29 = [(LSBundleRecordBuilder *)self activateBindings:v31 unitID:v37 bundleData:__src];
    if (!v29)
    {
      importedTypes = self->_importedTypes;
      int v7 = DWORD2(__src[29]);
      if (importedTypes && DWORD2(__src[29]))
      {
        _LSRegisterTypeDeclarationsForBundle(v31, v37, (uint64_t)__src, importedTypes, self->_localizedIdentityUsageDescription);
        int v7 = DWORD2(__src[29]);
      }
      URLClaims = self->_URLClaims;
      if (URLClaims && v7) {
        _LSRegisterTypeDeclarationsForBundle(v31, v37, (uint64_t)__src, URLClaims, self->_localizedIdentityUsageDescription);
      }
      int v9 = DWORD1(__src[29]);
      if (self->_libraryItems && DWORD1(__src[29]))
      {
        _LSRegisterDocumentTypes((uint64_t)v31);
        int v9 = DWORD1(__src[29]);
      }
      if (self->_documentClaims && v9) {
        _LSRegisterURLTypes((uint64_t)v31);
      }
      unsigned int v29 = _LSRegisterDefaultAppsClaims(v31, v37, (uint64_t)__src, self->_groupContainers);
      if (DWORD2(__src[30])) {
        unsigned int v29 = _LSBundleActivateBindingsForUserActivityTypes(v31, v37, (uint64_t)__src);
      }
      if (!self->_registrationInfo
        || !self->_queriableSchemes
        || !HIDWORD(__src[29])
        || _LSBundleDataIsInUnsupportedLocation((uint64_t)v31, (uint64_t)__src)
        || _LSBundleDataGetUnsupportedFormatFlag()
        || (BYTE12(__src[10]) & 0x80) != 0)
      {
        int v11 = _LSExtensionsLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[LSBundleRecordBuilder registerBundleRecord:error:](v11);
        }
      }
      else
      {
        unsigned int v10 = _LSExtensionsLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[LSBundleRecordBuilder registerBundleRecord:error:](v10);
        }

        unsigned int v29 = _LSRegisterPlugins(v31, self->_registrationInfo->containerUnit, v37, (const __CFDictionary *)self->_queriableSchemes, self->_pluginPlists, 0);
      }
      if (self->_sandboxEnvironmentVariables && DWORD1(__src[30]))
      {
        [(id)getEXEnumeratorClass() extensionPointDefinitionEnumeratorWithSDKDictionary:self->_sandboxEnvironmentVariables];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(__CFString **)(*((void *)&v33 + 1) + 8 * i);
              CFArrayRef v16 = [(__CFString *)v15 identifier];
              uint64_t v17 = [(__CFString *)v15 platform];
              CFDictionaryRef v18 = [(__CFString *)v15 SDKDictionary];
              uint64_t v19 = [(__CFString *)v15 url];
              if (LOBYTE(v32->_inode)
                || ![(__CFString *)v16 hasPrefix:@"com.apple."])
              {
                uint64_t v21 = _LSExtensionsLog();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)std::vector<unsigned int> buf = 136315394;
                  v39 = "-[LSBundleRecordBuilder registerBundleRecord:error:]";
                  __int16 v40 = 2112;
                  uint64_t v41 = v15;
                  _os_log_debug_impl(&dword_182959000, v21, OS_LOG_TYPE_DEBUG, "%s Registering extension point: %@", buf, 0x16u);
                }

                _LSRegisterExtensionPoint(v31, v37, v16, v17, v18, v19);
              }
              else
              {
                uint64_t v20 = _LSExtensionsLog();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  __int16 v22 = [(LSBundleRecordBuilder *)v32 identifier];
                  *(_DWORD *)std::vector<unsigned int> buf = 136315650;
                  v39 = "-[LSBundleRecordBuilder registerBundleRecord:error:]";
                  __int16 v40 = 2112;
                  uint64_t v41 = v16;
                  __int16 v42 = 2112;
                  uint64_t v43 = v22;
                  _os_log_error_impl(&dword_182959000, v20, OS_LOG_TYPE_ERROR, "%s Skipping extension point '%@' unentitled app '%@' is not permitted to register a system extension point", buf, 0x20u);
                }
              }
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
          }
          while (v12);
        }
      }
      _LSBundleSetLegacySpecialApplicationTypes(v31, v37, 0, 0);
    }
  }
  signed int v23 = v29;
  if (v29 && v37)
  {
    _LSBundleRemove(v31, v37, 0);
    unsigned int v37 = 0;
    signed int v23 = v29;
  }
  else if (!v29)
  {
    v32->_registerChildItemsTrusted = (BYTE12(__src[10]) & 0x80) == 0;
    goto LABEL_54;
  }
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v23, (uint64_t)"-[LSBundleRecordBuilder registerBundleRecord:error:]", 2354, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_54:
  if (v32->_installType)
  {
    if ([(id)__LSDefaultsGetSharedInstance() allowsAlternateIcons]) {
      BOOL v24 = (v32->_bundleFlags & 0x40000) == 0;
    }
    else {
      BOOL v24 = 0;
    }
    uint64_t v25 = (void *)MEMORY[0x18530F680]();
    if (([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer] & 1) == 0
      && (IconServicesLibrary(void)::frameworkLibrary
       || (IconServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0))
    {
      softLink_ISInvalidateCacheEntriesForBundleIdentifier((NSString *)&v32->_installType->super.super.isa);
    }
    if (v24)
    {
      id v26 = +[LSAltIconManager sharedInstance];
      [v26 clearAlternateNameForBundleIdentifier:v32->_installType validationDictionary:v32->_alternatePrimaryIconName];
    }
  }
  unsigned int v27 = v37;

  return v27;
}

- (unsigned)retries
{
  return self->_retries;
}

- (void)setRetries:(unsigned __int8)a3
{
  self->_unsigned __int8 retries = a3;
}

- (unsigned)previousInstallType
{
  return self->_previousInstallType;
}

- (void)setPreviousInstallType:(unsigned int)a3
{
  self->_unsigned int previousInstallType = a3;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (BOOL)registerChildItemsTrusted
{
  return self->_registerChildItemsTrusted;
}

- (BOOL)containerized
{
  return self->_sdkVersionNumber._opaque[24];
}

- (BOOL)webNotificationPlaceholder
{
  return self->_sdkVersionNumber._opaque[25];
}

- (NSNumber)compatibilityState
{
  return *(NSNumber **)&self->_containerized;
}

- (NSNumber)installFailureReason
{
  return self->_compatibilityState;
}

- (NSString)version
{
  return (NSString *)&self->_installFailureReason->super.super.isa;
}

- (NSString)minSystemVersion
{
  return self->_version;
}

- (NSString)maxSystemVersion
{
  return self->_minSystemVersion;
}

- (NSString)sdkVersion
{
  return self->_maxSystemVersion;
}

- (NSString)appStoreToolsBuildVersion
{
  return self->_sdkVersion;
}

- (NSString)shortVersionString
{
  return self->_appStoreToolsBuildVersion;
}

- (NSString)execPath
{
  return self->_shortVersionString;
}

- (NSArray)machOUUIDs
{
  return (NSArray *)self->_execPath;
}

- (NSNumber)itemID
{
  return (NSNumber *)self->_machOUUIDs;
}

- (NSString)teamID
{
  return (NSString *)&self->_itemID->super.super.isa;
}

- (NSArray)activityTypes
{
  return (NSArray *)self->_teamID;
}

- (NSArray)deviceFamily
{
  return self->_activityTypes;
}

- (NSNumber)installType
{
  return (NSNumber *)self->_deviceFamily;
}

- (NSString)identifier
{
  return (NSString *)&self->_installType->super.super.isa;
}

- (NSString)displayName
{
  return self->_identifier;
}

- (NSString)shortDisplayName
{
  return self->_displayName;
}

- (NSString)bundleName
{
  return self->_shortDisplayName;
}

- (NSArray)alternateNames
{
  return (NSArray *)self->_bundleName;
}

- (NSURL)dataContainerURL
{
  return (NSURL *)self->_alternateNames;
}

- (NSURL)bundleContainerURL
{
  return self->_dataContainerURL;
}

- (NSString)categoryType
{
  return (NSString *)&self->_bundleContainerURL->super.isa;
}

- (NSString)secondCategoryType
{
  return self->_categoryType;
}

- (NSString)vendorName
{
  return self->_secondCategoryType;
}

- (NSString)appType
{
  return self->_vendorName;
}

- (NSString)signerIdentity
{
  return self->_appType;
}

- (NSString)codeInfoIdentifier
{
  return self->_signerIdentity;
}

- (NSString)signerOrganization
{
  return self->_codeInfoIdentifier;
}

- (NSString)itemName
{
  return self->_signerOrganization;
}

- (NSNumber)storefront
{
  return (NSNumber *)self->_itemName;
}

- (NSNumber)versionID
{
  return self->_storefront;
}

- (NSString)sourceAppBundleID
{
  return (NSString *)&self->_versionID->super.super.isa;
}

- (NSString)appVariant
{
  return self->_sourceAppBundleID;
}

- (NSString)managementDeclarationIdentifier
{
  return self->_appVariant;
}

- (NSMutableSet)counterpartAppBundleIDs
{
  return (NSMutableSet *)self->_managementDeclarationIdentifier;
}

- (NSMutableSet)equivalentBundleIDs
{
  return self->_counterpartAppBundleIDs;
}

- (NSArray)parentApplicationIdentifiers
{
  return (NSArray *)self->_equivalentBundleIDs;
}

- (NSString)watchKitVersion
{
  return (NSString *)&self->_parentApplicationIdentifiers->super.isa;
}

- (NSString)complicationPrincipalClass
{
  return self->_watchKitVersion;
}

- (NSArray)supportedComplicationFamilies
{
  return (NSArray *)self->_complicationPrincipalClass;
}

- (NSString)ratingLabel
{
  return (NSString *)&self->_supportedComplicationFamilies->super.isa;
}

- (NSNumber)ratingRank
{
  return (NSNumber *)self->_ratingLabel;
}

- (NSString)genre
{
  return (NSString *)&self->_ratingRank->super.super.isa;
}

- (NSNumber)genreID
{
  return (NSNumber *)self->_genre;
}

- (NSDictionary)distributorInfo
{
  return (NSDictionary *)self->_genreID;
}

- (NSString)primaryIconName
{
  return (NSString *)&self->_distributorInfo->super.isa;
}

- (NSString)alternatePrimaryIconName
{
  return self->_primaryIconName;
}

- (NSDictionary)iconsDict
{
  return (NSDictionary *)self->_alternatePrimaryIconName;
}

- (NSArray)iconFileNames
{
  return (NSArray *)self->_iconsDict;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)self->_iconFileNames;
}

- (NSNumber)downloaderDSID
{
  return self->_purchaserDSID;
}

- (NSNumber)familyID
{
  return self->_downloaderDSID;
}

- (NSNumber)staticDiskUsage
{
  return self->_familyID;
}

- (NSString)libraryPath
{
  return (NSString *)&self->_staticDiskUsage->super.super.isa;
}

- (NSArray)libraryItems
{
  return (NSArray *)self->_libraryPath;
}

- (NSArray)documentClaims
{
  return self->_libraryItems;
}

- (NSArray)URLClaims
{
  return self->_documentClaims;
}

- (NSArray)importedTypes
{
  return self->_URLClaims;
}

- (NSArray)exportedTypes
{
  return self->_importedTypes;
}

- (NSArray)queriableSchemes
{
  return self->_exportedTypes;
}

- (NSDictionary)pluginPlists
{
  return (NSDictionary *)self->_queriableSchemes;
}

- (NSDictionary)pluginMIDicts
{
  return self->_pluginPlists;
}

- (NSArray)driverExtensionPaths
{
  return (NSArray *)self->_pluginMIDicts;
}

- (NSDictionary)groupContainers
{
  return (NSDictionary *)self->_driverExtensionPaths;
}

- (NSDictionary)entitlements
{
  return self->_groupContainers;
}

- (NSDictionary)sandboxEnvironmentVariables
{
  return self->_entitlements;
}

- (NSDictionary)extensionSDK
{
  return self->_sandboxEnvironmentVariables;
}

- (NSDictionary)intentDefinitionURLs
{
  return self->_extensionSDK;
}

- (NSArray)bgPermittedIdentifiers
{
  return (NSArray *)self->_intentDefinitionURLs;
}

- (NSArray)carPlayInstrumentClusterURLSchemes
{
  return self->_bgPermittedIdentifiers;
}

- (unsigned)profileValidationState
{
  return self->_sdkVersionNumber._opaque[26];
}

- (void)setProfileValidationState:(unsigned __int8)a3
{
  self->_sdkVersionNumber._opaque[26] = a3;
}

- (NSDictionary)localizedNames
{
  return (NSDictionary *)self->_carPlayInstrumentClusterURLSchemes;
}

- (NSDictionary)localizedShortNames
{
  return self->_localizedNames;
}

- (NSString)microphoneUsageDescription
{
  return (NSString *)&self->_localizedShortNames->super.isa;
}

- (NSDictionary)localizedMicrophoneUsageDescription
{
  return (NSDictionary *)self->_microphoneUsageDescription;
}

- (NSString)identityUsageDescription
{
  return (NSString *)&self->_localizedMicrophoneUsageDescription->super.isa;
}

- (NSDictionary)localizedIdentityUsageDescription
{
  return (NSDictionary *)self->_identityUsageDescription;
}

- (NSDictionary)localizedStrings
{
  return self->_localizedIdentityUsageDescription;
}

- (NSDictionary)unlocalizedNamesWithContext
{
  return self->_localizedStrings;
}

- (NSArray)bundlePersonas
{
  return (NSArray *)self->_unlocalizedNamesWithContext;
}

- (NSNumber)directoryClass
{
  return (NSNumber *)self->_bundlePersonas;
}

- (NSDictionary)mobileInstallIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 832, 1);
}

- (NSArray)slices
{
  return (NSArray *)self->_mobileInstallIDs;
}

- (NSNumber)signatureVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 848, 1);
}

- (NSDictionary)stashedAppInfo
{
  return (NSDictionary *)self->_signatureVersion;
}

- (NSString)applicationManagementDomain
{
  return (NSString *)&self->_stashedAppInfo->super.isa;
}

- (NSString)linkedParentBundleID
{
  return self->_applicationManagementDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationManagementDomain, 0);
  objc_storeStrong((id *)&self->_stashedAppInfo, 0);
  objc_storeStrong((id *)&self->_signatureVersion, 0);
  objc_storeStrong((id *)&self->_slices, 0);
  objc_storeStrong((id *)&self->_mobileInstallIDs, 0);
  objc_storeStrong((id *)&self->_directoryClass, 0);
  objc_storeStrong((id *)&self->_bundlePersonas, 0);
  objc_storeStrong((id *)&self->_unlocalizedNamesWithContext, 0);
  objc_storeStrong((id *)&self->_localizedStrings, 0);
  objc_storeStrong((id *)&self->_localizedIdentityUsageDescription, 0);
  objc_storeStrong((id *)&self->_identityUsageDescription, 0);
  objc_storeStrong((id *)&self->_localizedMicrophoneUsageDescription, 0);
  objc_storeStrong((id *)&self->_microphoneUsageDescription, 0);
  objc_storeStrong((id *)&self->_localizedShortNames, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_carPlayInstrumentClusterURLSchemes, 0);
  objc_storeStrong((id *)&self->_bgPermittedIdentifiers, 0);
  objc_storeStrong((id *)&self->_intentDefinitionURLs, 0);
  objc_storeStrong((id *)&self->_extensionSDK, 0);
  objc_storeStrong((id *)&self->_sandboxEnvironmentVariables, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_groupContainers, 0);
  objc_storeStrong((id *)&self->_driverExtensionPaths, 0);
  objc_storeStrong((id *)&self->_pluginMIDicts, 0);
  objc_storeStrong((id *)&self->_pluginPlists, 0);
  objc_storeStrong((id *)&self->_queriableSchemes, 0);
  objc_storeStrong((id *)&self->_exportedTypes, 0);
  objc_storeStrong((id *)&self->_importedTypes, 0);
  objc_storeStrong((id *)&self->_URLClaims, 0);
  objc_storeStrong((id *)&self->_documentClaims, 0);
  objc_storeStrong((id *)&self->_libraryItems, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
  objc_storeStrong((id *)&self->_staticDiskUsage, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_iconFileNames, 0);
  objc_storeStrong((id *)&self->_iconsDict, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryIconName, 0);
  objc_storeStrong((id *)&self->_primaryIconName, 0);
  objc_storeStrong((id *)&self->_distributorInfo, 0);
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_ratingRank, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_supportedComplicationFamilies, 0);
  objc_storeStrong((id *)&self->_complicationPrincipalClass, 0);
  objc_storeStrong((id *)&self->_watchKitVersion, 0);
  objc_storeStrong((id *)&self->_parentApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_equivalentBundleIDs, 0);
  objc_storeStrong((id *)&self->_counterpartAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_managementDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_appVariant, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleID, 0);
  objc_storeStrong((id *)&self->_versionID, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_signerOrganization, 0);
  objc_storeStrong((id *)&self->_codeInfoIdentifier, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
  objc_storeStrong((id *)&self->_appType, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_secondCategoryType, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_bundleContainerURL, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_shortDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_installType, 0);
  objc_storeStrong((id *)&self->_deviceFamily, 0);
  objc_storeStrong((id *)&self->_activityTypes, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_machOUUIDs, 0);
  objc_storeStrong((id *)&self->_execPath, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_appStoreToolsBuildVersion, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_maxSystemVersion, 0);
  objc_storeStrong((id *)&self->_minSystemVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_installFailureReason, 0);
  objc_storeStrong((id *)&self->_compatibilityState, 0);
  objc_storeStrong((id *)&self->_containerized, 0);
  objc_storeStrong((id *)&self->_commonInfoPlistEntries, 0);
  objc_storeStrong((id *)&self->_plistRarities, 0);
  objc_storeStrong((id *)&self->_canDefineSystemExtensionPoint, 0);
  objc_storeStrong((id *)&self->_bundleAlias, 0);

  objc_storeStrong((id *)&self->_registrationInfo, 0);
}

- (void)parseNSExtensionSDKDefinitionsFromDictionary:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)std::vector<unsigned int> buf = 136315650;
  *(void *)(buf + 4) = "-[LSBundleRecordBuilder parseNSExtensionSDKDefinitionsFromDictionary:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = @"_LSBundleExtensionPoints";
}

- (void)registerBundleRecord:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[LSBundleRecordBuilder registerBundleRecord:error:]";
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "%s Skipped registering extensions", (uint8_t *)&v1, 0xCu);
}

- (void)registerBundleRecord:(os_log_t)log error:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[LSBundleRecordBuilder registerBundleRecord:error:]";
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "%s Registering extensions", (uint8_t *)&v1, 0xCu);
}

@end