@interface LSApplicationProxy
+ (BOOL)supportsSecureCoding;
+ (id)applicationProxyForBundleType:(unint64_t)a3 identifier:(id)a4 isCompanion:(BOOL)a5 URL:(id)a6 itemID:(id)a7 bundleUnit:(unsigned int *)a8;
+ (id)applicationProxyForBundleURL:(id)a3;
+ (id)applicationProxyForCompanionIdentifier:(id)a3;
+ (id)applicationProxyForIdentifier:(id)a3;
+ (id)applicationProxyForIdentifier:(id)a3 placeholder:(BOOL)a4;
+ (id)applicationProxyForIdentifier:(id)a3 withContext:(LSContext *)a4;
+ (id)applicationProxyForItemID:(id)a3;
+ (id)applicationProxyForSystemPlaceholder:(id)a3;
+ (id)applicationProxyWithBundleUnitID:(unsigned int)a3 withContext:(LSContext *)a4;
- (BOOL)UPPValidated;
- (BOOL)_usesSystemPersona;
- (BOOL)fileSharingEnabled;
- (BOOL)freeProfileValidated;
- (BOOL)gameCenterEverEnabled;
- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4;
- (BOOL)hasMIDBasedSINF;
- (BOOL)iconIsPrerendered;
- (BOOL)iconUsesAssetCatalog;
- (BOOL)isAppUpdate;
- (BOOL)isBetaApp;
- (BOOL)isDeletableIgnoringRestrictions;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isGameCenterEnabled;
- (BOOL)isInstalled;
- (BOOL)isNewsstandApp;
- (BOOL)isPlaceholder;
- (BOOL)isPurchasedReDownload;
- (BOOL)isRemoveableSystemApp;
- (BOOL)isRemovedSystemApp;
- (BOOL)isRestricted;
- (BOOL)isStandaloneWatchApp;
- (BOOL)isWatchKitApp;
- (BOOL)isWhitelisted;
- (BOOL)missingRequiredSINF;
- (BOOL)profileValidated;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)supportsODR;
- (BOOL)userInitiatedUninstall;
- (LSApplicationProxy)initWithCoder:(id)a3;
- (LSApplicationRecord)correspondingApplicationRecord;
- (NSArray)activityTypes;
- (NSArray)deviceFamily;
- (NSArray)plugInKitPlugins;
- (NSArray)requiredDeviceCapabilities;
- (NSArray)subgenres;
- (NSDate)registeredDate;
- (NSDictionary)siriActionDefinitionURLs;
- (NSNumber)ODRDiskUsage;
- (NSNumber)betaExternalVersionIdentifier;
- (NSNumber)downloaderDSID;
- (NSNumber)dynamicDiskUsage;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)familyID;
- (NSNumber)genreID;
- (NSNumber)installFailureReason;
- (NSNumber)itemID;
- (NSNumber)platform;
- (NSNumber)purchaserDSID;
- (NSNumber)ratingRank;
- (NSNumber)staticDiskUsage;
- (NSNumber)storeFront;
- (NSProgress)installProgress;
- (NSSet)claimedDocumentContentTypes;
- (NSSet)claimedURLSchemes;
- (NSString)appIDPrefix;
- (NSString)applicationDSID;
- (NSString)applicationVariant;
- (NSString)companionApplicationIdentifier;
- (NSString)complicationPrincipalClass;
- (NSString)genre;
- (NSString)itemName;
- (NSString)preferredArchitecture;
- (NSString)ratingLabel;
- (NSString)sourceAppIdentifier;
- (NSString)storeCohortMetadata;
- (NSString)teamID;
- (NSString)vendorName;
- (_LSApplicationState)appState;
- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleIdentifier:(id)a5;
- (id)_initWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 applicationRecord:(id)a5 bundleID:(id)a6 resolveAndDetach:(BOOL)a7;
- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4;
- (id)_managedPersonas;
- (id)_stringLocalizerForTable:(id)a3;
- (id)alternateIconName;
- (id)bundleType;
- (id)dataContainerURL;
- (id)description;
- (id)environmentVariables;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)getBundleMetadata;
- (id)groupContainerURLs;
- (id)handlerRankOfClaimForContentType:(id)a3;
- (id)iconDataForVariant:(int)a3;
- (id)iconDataForVariant:(int)a3 withOptions:(int)a4;
- (id)installProgressSync;
- (id)localizedNameForContext:(id)a3;
- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4;
- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4 useShortNameOnly:(BOOL)a5;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)primaryIconDataForVariant:(int)a3;
- (id)signerIdentity;
- (id)signerOrganization;
- (id)valueForUndefinedKey:(id)a3;
- (int)bundleModTime;
- (int64_t)deviceManagementPolicy;
- (unint64_t)installType;
- (unint64_t)originalInstallType;
- (void)clearAdvertisingIdentifier;
- (void)detach;
- (void)encodeWithCoder:(id)a3;
- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3;
- (void)setAlternateIconName:(id)a3 withResult:(id)a4;
- (void)setUserInitiatedUninstall:(BOOL)a3;
@end

@implementation LSApplicationProxy

- (id)_initWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 applicationRecord:(id)a5 bundleID:(id)a6 resolveAndDetach:(BOOL)a7
{
  BOOL v30 = a7;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v34 = a6;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3812000000;
  v48 = __Block_byref_object_copy__6;
  v49 = __Block_byref_object_dispose__7;
  uint64_t v50 = 256;
  id v51 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  if (v9)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __94__LSApplicationProxy__initWithContext_bundleUnit_applicationRecord_bundleID_resolveAndDetach___block_invoke;
    v40[3] = &unk_1E522BBB0;
    v40[4] = &v45;
    v40[5] = &v41;
    [v9 _performBlockWithContext:v40];
  }
  v33 = [v9 _iconFileNames];
  v10 = (void *)MEMORY[0x18530F680]();
  v11 = [v9 infoDictionary];
  v12 = [v11 objectForKey:@"CFBundleIcons" ofClass:objc_opt_class()];

  if (v12)
  {
    v32 = +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v12);
  }
  else
  {
    v32 = 0;
  }

  unsigned int v31 = *((_DWORD *)v42 + 6);
  v13 = v46;
  if ([v9 isPlaceholder]) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 1;
  }
  uint64_t v15 = [v9 bundleIdentifier];
  v16 = (void *)v15;
  if (v15) {
    id v17 = (id)v15;
  }
  else {
    id v17 = v34;
  }
  v18 = [v9 bundleContainerURL];
  v19 = [v9 _dataContainerURLFromDatabase];
  v20 = [v9 URL];
  v21 = [v9 exactBundleVersion];
  v39.receiver = self;
  v39.super_class = (Class)LSApplicationProxy;
  v22 = [(LSBundleProxy *)&v39 _initWithBundleUnit:v31 context:v13 + 6 bundleType:v14 bundleID:v17 localizedName:0 bundleContainerURL:v18 dataContainerURL:v19 resourcesDirectoryURL:v20 iconsDictionary:v32 iconFileNames:v33 version:v21];

  if (v22)
  {
    if (v30 && _LSDatabaseContextGetDetachProxyObjects(v23))
    {
      [v9 _resolveAllProperties];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v24 = [v9 claimRecords];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v52 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * i) _resolveAllProperties];
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v52 count:16];
        }
        while (v25);
      }

      [v9 detach];
    }
    objc_storeStrong(v22 + 20, a5);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v22;
}

void __94__LSApplicationProxy__initWithContext_bundleUnit_applicationRecord_bundleID_resolveAndDetach___block_invoke(uint64_t a1, id *a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
}

- (NSArray)subgenres
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  v3 = [v2 subgenres];

  return (NSArray *)v3;
}

- (NSNumber)genreID
{
  v2 = NSNumber;
  v3 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  v4 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "genreIdentifier"));

  return (NSNumber *)v4;
}

- (NSString)genre
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  v3 = [v2 genre];

  return (NSString *)v3;
}

- (id)bundleType
{
  v3 = [(LSApplicationRecord *)self->_record typeForInstallMachinery];
  if (!v3)
  {
    if ([(LSApplicationProxy *)self isInstalled]) {
      v3 = @"User";
    }
    else {
      v3 = 0;
    }
  }

  return v3;
}

- (NSArray)activityTypes
{
  v2 = [(LSApplicationRecord *)self->_record userActivityTypes];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (_LSApplicationState)appState
{
  v3 = [(LSApplicationRecord *)self->_record applicationState];
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [_LSApplicationState alloc];
    v7 = [(LSBundleProxy *)self bundleIdentifier];
    v5 = [(_LSApplicationState *)v6 initWithBundleIdentifier:v7 stateFlags:0 ratingRank:0 installType:0];
  }

  return v5;
}

- (LSApplicationRecord)correspondingApplicationRecord
{
  return self->_record;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugInKitPlugins, 0);
  objc_storeStrong((id *)&self->_record, 0);

  objc_storeStrong((id *)&self->_deviceIdentifierVendorName, 0);
}

+ (id)applicationProxyForIdentifier:(id)a3
{
  return (id)[a1 applicationProxyForBundleType:0 identifier:a3 isCompanion:0 URL:0 itemID:0 bundleUnit:0];
}

void __38__LSApplicationProxy_plugInKitPlugins__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "applicationExtensionRecords", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) uniqueIdentifier];
        v8 = +[LSPlugInKitProxy pluginKitProxyForUUID:v7];

        if (v8) {
          [*(id *)(a1 + 40) addObject:v8];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

+ (id)applicationProxyForBundleType:(unint64_t)a3 identifier:(id)a4 isCompanion:(BOOL)a5 URL:(id)a6 itemID:(id)a7 bundleUnit:(unsigned int *)a8
{
  BOOL v11 = a5;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v36 = 0;
  long long v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000;
  objc_super v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  id v41 = 0;
  if (!v14 || v11 || ([a1 canInstantiateFromDatabase] & 1) != 0)
  {
    id v34 = 0;
    if (_LSContextInit(&v34))
    {
      LODWORD(v17) = 0;
    }
    else
    {
      if (v16) {
        uint64_t v18 = [v16 unsignedLongLongValue];
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v17 = _LSFindBundleWithInfo(&v34, a3, v14, v11, v15, v18, 0);
      id v26 = objc_alloc((Class)a1);
      if (v11) {
        id v27 = 0;
      }
      else {
        id v27 = v14;
      }
      uint64_t v28 = [v26 _initWithBundleUnit:v17 context:&v34 bundleIdentifier:v27];
      id v29 = v37[5];
      v37[5] = (id)v28;

      _LSContextDestroy(&v34);
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B50] mainBundle];
    v20 = [v19 bundleIdentifier];
    int v21 = [v14 isEqual:v20];

    if (v21)
    {
      v22 = _LSDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[LSApplicationProxy applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:](v22);
      }

      __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
      __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
      v23 = +[LSBundleProxy bundleProxyForCurrentProcess];
      if (v23)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong(v37 + 5, v23);
        }
      }
    }
    if (!v37[5])
    {
      v24 = +[_LSApplicationProxyForIdentifierQuery queryWithIdentifier:v14];
      uint64_t v25 = +[_LSQueryContext defaultContext];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __97__LSApplicationProxy_applicationProxyForBundleType_identifier_isCompanion_URL_itemID_bundleUnit___block_invoke;
      v35[3] = &unk_1E522BB88;
      v35[4] = &v36;
      [v25 enumerateResolvedResultsOfQuery:v24 withBlock:v35];
    }
    LODWORD(v17) = 0;
  }
  if (!v37[5])
  {
    uint64_t v30 = [a1 applicationProxyForIdentifier:v14 withContext:0];
    id v31 = v37[5];
    v37[5] = (id)v30;
  }
  if (a8) {
    *a8 = v17;
  }
  id v32 = v37[5];
  _Block_object_dispose(&v36, 8);

  return v32;
}

- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v6 && !a4)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v11 = [NSString stringWithUTF8String:"-[LSApplicationProxy _initWithBundleUnit:context:bundleIdentifier:]"];
    [v10 handleFailureInFunction:v11, @"LSApplicationProxy.m", 290, @"Invalid parameter not satisfying: %@", @"bundleUnit == kCSStoreNullID || context != NULL" file lineNumber description];
    goto LABEL_10;
  }
  if (!v6 || !a4)
  {
    if (!a4)
    {
LABEL_11:
      id v9 = 0;
      goto LABEL_12;
    }
    long long v10 = _LSDatabaseGetCacheGUID();
    BOOL v11 = [NSNumber numberWithUnsignedLongLong:_LSDatabaseGetSequenceNumber()];
    long long v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      v19 = v10;
      __int16 v20 = 2112;
      int v21 = v11;
      _os_log_debug_impl(&dword_182959000, v12, OS_LOG_TYPE_DEBUG, "LaunchServices: failed to find bundle record for %@ {%@ %@}", buf, 0x20u);
    }

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v15 = 0;
  id v9 = [[LSApplicationRecord alloc] _initWithContext:a4 bundleID:v6 bundleData:0 error:&v15];
LABEL_12:
  id v13 = [(LSApplicationProxy *)self _initWithContext:a4 bundleUnit:v6 applicationRecord:v9 bundleID:v8 resolveAndDetach:1];

  return v13;
}

- (id)dataContainerURL
{
  return [(LSBundleRecord *)self->_record dataContainerURL];
}

+ (id)applicationProxyForIdentifier:(id)a3 placeholder:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 1;
  }
  return (id)[a1 applicationProxyForBundleType:v5 identifier:a3 isCompanion:0 URL:0 itemID:0 bundleUnit:0];
}

+ (id)applicationProxyWithBundleUnitID:(unsigned int)a3 withContext:(LSContext *)a4
{
  uint64_t v4 = 0;
  if (a3 && a4)
  {
    uint64_t v6 = *(void *)&a3;
    if (_LSBundleGet(a4->db, a3))
    {
      id v8 = (void *)_CSStringCopyCFString();
      uint64_t v4 = (void *)[objc_alloc((Class)a1) _initWithBundleUnit:v6 context:a4 bundleIdentifier:v8];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (id)groupContainerURLs
{
  return [(LSBundleRecord *)self->_record groupContainerURLs];
}

- (NSString)teamID
{
  return [(LSBundleRecord *)self->_record teamIdentifier];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LSApplicationProxy;
  if (-[LSApplicationProxy respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return +[LSApplicationRecord instancesRespondToSelector:a3];
  }
}

- (id)environmentVariables
{
  return [(LSApplicationRecord *)self->_record additionalEnvironmentVariables];
}

- (id)_managedPersonas
{
  return [(LSApplicationRecord *)self->_record managedPersonas];
}

- (BOOL)isNewsstandApp
{
  return ([(LSApplicationRecord *)self->_record _rawBundleFlags] >> 16) & 1;
}

- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4 useShortNameOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if (v5)
    {
      long long v10 = _LSDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[LSApplicationProxy(Localization) localizedNameForContext:preferredLocalizations:useShortNameOnly:]((uint64_t)v8, v10);
      }
    }
    record = self->_record;
    if (v9) {
      [(LSApplicationRecord *)record localizedNameWithContext:v8 preferredLocalizations:v9];
    }
    else {
    id v14 = [(LSApplicationRecord *)record localizedNameWithContext:v8];
    }
  }
  else
  {
    long long v12 = self->_record;
    if (v5)
    {
      if (v9) {
        [(LSBundleRecord *)v12 localizedShortNameWithPreferredLocalizations:v9];
      }
      else {
        [(LSBundleRecord *)v12 localizedShortName];
      }
    }
    else if (v9)
    {
      [(LSBundleRecord *)v12 localizedNameWithPreferredLocalizations:v9];
    }
    else
    {
      [(LSBundleRecord *)v12 localizedName];
    id v13 = };
    id v14 = v13;
    if (![v13 length])
    {
      uint64_t v15 = [(LSBundleRecord *)self->_record _fallbackLocalizedName];

      id v14 = (void *)v15;
    }
  }

  return v14;
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  return [(LSApplicationProxy *)self localizedNameForContext:0 preferredLocalizations:a3 useShortNameOnly:a4];
}

- (BOOL)isBetaApp
{
  return [(LSApplicationRecord *)self->_record isBeta];
}

- (NSArray)plugInKitPlugins
{
  v2 = self;
  objc_sync_enter(v2);
  plugInKitPlugins = v2->_plugInKitPlugins;
  if (!plugInKitPlugins)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    long long v12 = __38__LSApplicationProxy_plugInKitPlugins__block_invoke;
    id v13 = &unk_1E522BBD8;
    id v14 = v2;
    id v5 = v4;
    id v15 = v5;
    __LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__((uint64_t)&v10);
    uint64_t v6 = objc_msgSend(v5, "copy", v10, v11, v12, v13, v14);
    v7 = v2->_plugInKitPlugins;
    v2->_plugInKitPlugins = (NSArray *)v6;

    plugInKitPlugins = v2->_plugInKitPlugins;
  }
  id v8 = plugInKitPlugins;
  objc_sync_exit(v2);

  return v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v3 = self->_record;
  if (!v3)
  {
    if (forwardingTargetForSelector__once != -1) {
      dispatch_once(&forwardingTargetForSelector__once, &__block_literal_global_4);
    }
    uint64_t v3 = (LSApplicationRecord *)(id)forwardingTargetForSelector__invalidRecord;
  }

  return v3;
}

- (NSDictionary)siriActionDefinitionURLs
{
  return [(LSBundleRecord *)self->_record intentDefinitionURLs];
}

+ (id)applicationProxyForIdentifier:(id)a3 withContext:(LSContext *)a4
{
  id v6 = a3;
  if (a4) {
    uint64_t v7 = _LSFindBundleWithInfo(a4, 0, v6, 0, 0, 0, 0);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (void *)[objc_alloc((Class)a1) _initWithBundleUnit:v7 context:a4 bundleIdentifier:v6];

  return v8;
}

void __97__LSApplicationProxy_applicationProxyForBundleType_identifier_isCompanion_URL_itemID_bundleUnit___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

+ (id)applicationProxyForCompanionIdentifier:(id)a3
{
  int v5 = 0;
  uint64_t v3 = [a1 applicationProxyForBundleType:0 identifier:a3 isCompanion:1 URL:0 itemID:0 bundleUnit:&v5];
  if (v3 && !v5)
  {

    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)applicationProxyForSystemPlaceholder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v8 = 0;
  int v5 = [a1 applicationProxyForBundleType:7 identifier:v4 isCompanion:0 URL:0 itemID:0 bundleUnit:&v8];
  if (v5 && !v8)
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "No system placeholder found with identifier %@", buf, 0xCu);
    }

    int v5 = 0;
  }

  return v5;
}

+ (id)applicationProxyForBundleURL:(id)a3
{
  return (id)[a1 applicationProxyForBundleType:0 identifier:0 isCompanion:0 URL:a3 itemID:0 bundleUnit:0];
}

+ (id)applicationProxyForItemID:(id)a3
{
  int v5 = 0;
  uint64_t v3 = [a1 applicationProxyForBundleType:1 identifier:0 isCompanion:0 URL:0 itemID:a3 bundleUnit:&v5];
  if (v3 && !v5)
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (NSString)companionApplicationIdentifier
{
  return 0;
}

- (NSDate)registeredDate
{
  return [(LSBundleRecord *)self->_record registrationDate];
}

- (NSNumber)itemID
{
  v2 = NSNumber;
  uint64_t v3 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v4 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeItemIdentifier"));

  return (NSNumber *)v4;
}

- (NSString)vendorName
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  uint64_t v3 = [v2 artistName];

  return (NSString *)v3;
}

- (NSString)itemName
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  uint64_t v3 = [v2 itemName];

  return (NSString *)v3;
}

- (NSString)storeCohortMetadata
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  uint64_t v3 = [v2 storeCohort];

  return (NSString *)v3;
}

- (NSString)preferredArchitecture
{
  return [(LSApplicationRecord *)self->_record _preferredLaunchArchitecture];
}

- (void)clearAdvertisingIdentifier
{
}

- (NSProgress)installProgress
{
  uint64_t v3 = [(LSApplicationProxy *)self appState];
  int v4 = [v3 isPlaceholder];

  if (v4)
  {
    int v5 = +[LSApplicationWorkspace defaultWorkspace];
    id v6 = [(LSBundleProxy *)self bundleIdentifier];
    uint64_t v7 = [v5 installProgressForBundleID:v6 makeSynchronous:0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSProgress *)v7;
}

- (NSNumber)staticDiskUsage
{
  v2 = [(LSApplicationProxy *)self diskUsage];
  uint64_t v3 = [v2 staticUsage];

  return (NSNumber *)v3;
}

- (NSNumber)dynamicDiskUsage
{
  uint64_t v3 = [(LSApplicationProxy *)self diskUsage];
  int v4 = [v3 dynamicUsage];

  int v5 = [(LSApplicationProxy *)self diskUsage];
  id v6 = [v5 onDemandResourcesUsage];

  if (v4 && v6)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "unsignedLongLongValue") + objc_msgSend(v4, "unsignedLongLongValue"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4) {
      int v8 = v4;
    }
    else {
      int v8 = v6;
    }
    id v7 = v8;
  }
  id v9 = v7;

  return (NSNumber *)v9;
}

- (NSNumber)ODRDiskUsage
{
  v2 = [(LSApplicationProxy *)self diskUsage];
  uint64_t v3 = [v2 onDemandResourcesUsage];

  return (NSNumber *)v3;
}

- (BOOL)isInstalled
{
  v2 = [(LSApplicationProxy *)self appState];
  char v3 = [v2 isInstalled];

  return v3;
}

- (BOOL)isPlaceholder
{
  v2 = [(LSApplicationProxy *)self appState];
  char v3 = [v2 isPlaceholder];

  return v3;
}

- (BOOL)isRestricted
{
  v2 = [(LSApplicationProxy *)self appState];
  char v3 = [v2 isRestricted];

  return v3;
}

- (BOOL)isRemovedSystemApp
{
  return 0;
}

- (NSString)applicationDSID
{
  v2 = [(LSApplicationProxy *)self purchaserDSID];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (NSNumber)purchaserDSID
{
  v2 = NSNumber;
  unint64_t v3 = [(LSApplicationRecord *)self->_record applicationDSID];

  return (NSNumber *)[v2 numberWithUnsignedLongLong:v3];
}

- (NSNumber)downloaderDSID
{
  v2 = NSNumber;
  unint64_t v3 = [(LSApplicationRecord *)self->_record applicationDownloaderDSID];

  return (NSNumber *)[v2 numberWithUnsignedLongLong:v3];
}

- (NSNumber)familyID
{
  v2 = NSNumber;
  unint64_t v3 = [(LSApplicationRecord *)self->_record applicationFamilyID];

  return (NSNumber *)[v2 numberWithUnsignedLongLong:v3];
}

- (unint64_t)installType
{
  if (![(LSApplicationProxy *)self isPlaceholder]) {
    return 0;
  }

  return [(LSApplicationProxy *)self originalInstallType];
}

- (unint64_t)originalInstallType
{
  return [(LSApplicationRecord *)self->_record installType];
}

- (NSArray)requiredDeviceCapabilities
{
  v2 = [(LSApplicationRecord *)self->_record requiredDeviceCapabilities];
  if (v2)
  {
    unint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__LSApplicationProxy_requiredDeviceCapabilities__block_invoke;
    v7[3] = &unk_1E522BC00;
    id v8 = v3;
    id v4 = v3;
    [v2 enumerateKeysAndObjectsUsingBlock:v7];
    int v5 = (void *)[v4 copy];
  }
  else
  {
    int v5 = 0;
  }

  return (NSArray *)v5;
}

void __48__LSApplicationProxy_requiredDeviceCapabilities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (NSArray)deviceFamily
{
  return [(LSApplicationRecord *)self->_record deviceFamilies];
}

- (NSString)appIDPrefix
{
  id v7 = 0;
  v2 = [(LSBundleRecord *)self->_record applicationIdentifier];
  unint64_t v3 = v2;
  if (v2)
  {
    _LSSplitApplicationIdentifier(v2, &v7, 0);
    id v4 = v7;
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (NSNumber)storeFront
{
  v2 = NSNumber;
  unint64_t v3 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v4 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeFront"));

  return (NSNumber *)v4;
}

- (NSNumber)externalVersionIdentifier
{
  v2 = NSNumber;
  unint64_t v3 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v4 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "versionIdentifier"));

  return (NSNumber *)v4;
}

- (NSNumber)betaExternalVersionIdentifier
{
  v2 = NSNumber;
  unint64_t v3 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v4 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "betaVersionIdentifier"));

  return (NSNumber *)v4;
}

- (NSNumber)ratingRank
{
  v2 = NSNumber;
  unint64_t v3 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v4 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "ratingRank"));

  return (NSNumber *)v4;
}

- (NSString)ratingLabel
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  unint64_t v3 = [v2 ratingLabel];

  return (NSString *)v3;
}

- (NSString)sourceAppIdentifier
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  unint64_t v3 = [v2 sourceApp];

  return (NSString *)v3;
}

- (NSString)applicationVariant
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  unint64_t v3 = [v2 variantID];

  return (NSString *)v3;
}

- (BOOL)isAppUpdate
{
  return [(LSApplicationRecord *)self->_record isUpdate];
}

- (BOOL)isWhitelisted
{
  +[LSApplicationRestrictionsManager sharedInstance]();
  unint64_t v3 = (id *)objc_claimAutoreleasedReturnValue();
  id v4 = [(LSBundleProxy *)self bundleIdentifier];
  LOBYTE(self) = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:](v3, v4, [(LSApplicationRecord *)self->_record _rawBundleFlags]) ^ 1;

  return (char)self;
}

- (BOOL)isDeviceBasedVPP
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  char v3 = [v2 isDeviceBasedVPP];

  return v3;
}

- (BOOL)supportsODR
{
  return [(LSApplicationRecord *)self->_record supportsOnDemandResources];
}

- (BOOL)fileSharingEnabled
{
  return [(LSApplicationRecord *)self->_record isFileSharingEnabled];
}

- (BOOL)iconIsPrerendered
{
  return 0;
}

- (BOOL)iconUsesAssetCatalog
{
  return 0;
}

- (BOOL)isPurchasedReDownload
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  char v3 = [v2 isPurchasedRedownload];

  return v3;
}

- (BOOL)hasMIDBasedSINF
{
  return [(LSApplicationRecord *)self->_record applicationHasMIDBasedSINF];
}

- (BOOL)missingRequiredSINF
{
  return [(LSApplicationRecord *)self->_record applicationMissingRequiredSINF];
}

- (BOOL)isDeletableIgnoringRestrictions
{
  return ([(LSApplicationRecord *)self->_record _rawBundleFlags] >> 40) & 1;
}

- (BOOL)_usesSystemPersona
{
  return ([(LSApplicationRecord *)self->_record _rawBundleFlags] >> 56) & 1;
}

- (BOOL)isRemoveableSystemApp
{
  return 0;
}

- (BOOL)isWatchKitApp
{
  return 0;
}

- (NSString)complicationPrincipalClass
{
  return 0;
}

- (BOOL)isGameCenterEnabled
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  char v3 = [v2 isGameCenterEnabled];

  return v3;
}

- (BOOL)gameCenterEverEnabled
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  char v3 = [v2 wasGameCenterEverEnabled];

  return v3;
}

- (NSNumber)installFailureReason
{
  v2 = NSNumber;
  unint64_t v3 = [(LSApplicationRecord *)self->_record placeholderFailureReason];

  return (NSNumber *)[v2 numberWithUnsignedInteger:v3];
}

- (void)setAlternateIconName:(id)a3 withResult:(id)a4
{
}

- (id)alternateIconName
{
  return [(LSApplicationRecord *)self->_record alternateIconName];
}

- (id)primaryIconDataForVariant:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (IconServicesLibrary_frameworkLibrary
    || (id v5 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary = (uint64_t)v5) != 0))
  {
    id v5 = softLink_ISPrimaryIconDataForApplicationProxy(self, v3, 0);
  }

  return v5;
}

- (id)iconDataForVariant:(int)a3
{
  return [(LSApplicationProxy *)self iconDataForVariant:*(void *)&a3 withOptions:0];
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (IconServicesLibrary_frameworkLibrary
    || (id v7 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary = (uint64_t)v7) != 0))
  {
    id v7 = ((void (*)(void *, uint64_t, uint64_t))softLink_ISIconDataForResourceProxy[0])(self, v5, v4);
  }

  return v7;
}

- (int64_t)deviceManagementPolicy
{
  if (DeviceManagementLibrary_frameworkLibrary
    || (int64_t result = (int64_t)dlopen("/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement", 2), (DeviceManagementLibrary_frameworkLibrary = result) != 0))
  {
    uint64_t v4 = [(LSBundleProxy *)self bundleIdentifier];
    int64_t v6 = _LSGetDMFPolicy(v4, v5);

    return v6;
  }
  return result;
}

- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3
{
}

- (NSSet)claimedDocumentContentTypes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(LSBundleRecord *)self->_record claimRecords];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) typeIdentifiers];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)claimedURLSchemes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(LSBundleRecord *)self->_record claimRecords];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) URLSchemes];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)handlerRankOfClaimForContentType:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"LSApplicationProxy.m", 966, @"Invalid parameter not satisfying: %@", @"typeIdentifier != nil" object file lineNumber description];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = [(LSBundleRecord *)self->_record claimRecords];
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    __int16 v9 = 0x8000;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v12 = [v11 typeIdentifiers];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              if (![*(id *)(*((void *)&v24 + 1) + 8 * j) caseInsensitiveCompare:v5])
              {
                __int16 v18 = [v11 handlerRank];
                int v19 = _LSNumericHandlerRankFromHandlerRankString(v18);

                if (v9 <= v19) {
                  __int16 v9 = v19;
                }
                goto LABEL_19;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
LABEL_19:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    __int16 v9 = 0x8000;
  }

  __int16 v20 = _LSCopyHandlerRankStringFromNumericHandlerRank(v9);

  return v20;
}

- (NSNumber)platform
{
  uint64_t v2 = [(LSBundleRecord *)self->_record platform];
  if (v2)
  {
    id v3 = [NSNumber numberWithUnsignedInt:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (BOOL)isStandaloneWatchApp
{
  return 0;
}

- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationProxy getGenericTranslocationTargetURL:error:]", 1016, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)getBundleMetadata
{
  return [(LSApplicationRecord *)self->_record bundleMetadataReturningError:0];
}

- (id)installProgressSync
{
  id v3 = [(LSApplicationProxy *)self appState];
  int v4 = [v3 isPlaceholder];

  if (v4)
  {
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v6 = [(LSBundleProxy *)self bundleIdentifier];
    uint64_t v7 = [v5 installProgressForBundleID:v6 makeSynchronous:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (int)bundleModTime
{
  return [(LSApplicationRecord *)self->_record _bundleModTime];
}

- (BOOL)profileValidated
{
  return [(LSBundleRecord *)self->_record isProfileValidated];
}

- (BOOL)UPPValidated
{
  return [(LSBundleRecord *)self->_record isUPPValidated];
}

- (BOOL)freeProfileValidated
{
  return [(LSBundleRecord *)self->_record isFreeProfileValidated];
}

- (id)signerOrganization
{
  return [(LSBundleRecord *)self->_record signerOrganization];
}

- (id)signerIdentity
{
  return [(LSBundleRecord *)self->_record signerIdentity];
}

- (id)_stringLocalizerForTable:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  record = self->_record;
  id v5 = a3;
  uint64_t v6 = [(LSBundleRecord *)record platform];
  uint64_t v7 = [(LSBundleRecord *)self->_record SDKVersion];
  _LSVersionNumberMakeWithString(v14, v7);
  uint64_t v8 = _LSMakeDYLDVersionFromVersionNumber(v14);

  BOOL v9 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:v6 sdkVersion:v8];
  id v10 = [_LSStringLocalizer alloc];
  long long v11 = [(LSBundleProxy *)self bundleURL];
  long long v12 = [(_LSStringLocalizer *)v10 initWithBundleURL:v11 stringsFile:v5 legacyLocalizationList:v9];

  return v12;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)LSApplicationProxy;
  int v4 = [(LSApplicationProxy *)&v11 description];
  id v5 = [(LSBundleProxy *)self bundleIdentifier];
  uint64_t v6 = [(LSBundleProxy *)self bundleURL];
  uint64_t v7 = [(LSApplicationProxy *)self appState];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[LSApplicationProxy installType](self, "installType"));
  BOOL v9 = [v3 stringWithFormat:@"%@ %@ %@ <%@:%@>", v4, v5, v6, v7, v8];

  return v9;
}

void __50__LSApplicationProxy_forwardingTargetForSelector___block_invoke()
{
  id v0 = [(LSRecord *)[LSApplicationRecord alloc] _initInvalid];
  v1 = (void *)forwardingTargetForSelector__invalidRecord;
  forwardingTargetForSelector__invalidRecord = (uint64_t)v0;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LSApplicationProxy;
  int v4 = -[LSApplicationProxy methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!v4)
  {
    int v4 = +[LSApplicationRecord instanceMethodSignatureForSelector:a3];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LSApplicationProxy;
  id v4 = a3;
  [(LSBundleProxy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_record, @"record", v5.receiver, v5.super_class);
}

- (LSApplicationProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSApplicationProxy;
  objc_super v5 = [(LSBundleProxy *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"record");
    record = v5->_record;
    v5->_record = (LSApplicationRecord *)v6;
  }
  return v5;
}

- (void)detach
{
  [(LSRecord *)self->_record _resolveAllProperties];
  record = self->_record;

  [(LSRecord *)record detach];
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)[(LSApplicationRecord *)self->_record valueForKey:a3];
}

- (BOOL)userInitiatedUninstall
{
  return self->_userInitiatedUninstall;
}

- (void)setUserInitiatedUninstall:(BOOL)a3
{
  self->_userInitiatedUninstall = a3;
}

- (id)localizedNameForContext:(id)a3
{
  return [(LSApplicationProxy *)self localizedNameForContext:a3 preferredLocalizations:0 useShortNameOnly:0];
}

- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4
{
  return [(LSApplicationProxy *)self localizedNameForContext:a3 preferredLocalizations:a4 useShortNameOnly:0];
}

+ (void)applicationProxyForBundleType:(os_log_t)log identifier:isCompanion:URL:itemID:bundleUnit:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "+[LSApplicationProxy applicationProxyFor*] is not a supported method for getting the LSApplicationProxy for the current process, use +[LSBundleProxy bundleProxyForCurrentProcess] instead.", v1, 2u);
}

@end