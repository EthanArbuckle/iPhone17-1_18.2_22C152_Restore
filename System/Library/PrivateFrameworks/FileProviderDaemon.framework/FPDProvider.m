@interface FPDProvider
+ (id)defaultNSDomainForDescriptor:(id)a3;
+ (id)fpfsDomainURLIsRootOf:(id)a3;
+ (id)getXattr:(const char *)a3 at:(const char *)a4;
+ (id)onDiskProvidersForServer:(id)a3;
+ (id)parseDomainProperties:(id)a3 descriptor:(id)a4 volume:(id)a5 replicatedByDefault:(BOOL)a6;
+ (void)_garbageCollectFoldersWithNoRelatedDomain:(id)a3 supportDir:(id)a4;
+ (void)dumpXattrsForContentsOfDirectoryAtURL:(id)a3 dumper:(id)a4;
+ (void)dumpXattrsForItemAtURL:(id)a3 to:(id)a4;
+ (void)dumpXattrsForSyncRootDirectoryOfVolume:(id)a3 dumper:(id)a4;
+ (void)dumpXattrsForSystemDirectoryOfVolume:(id)a3 dumper:(id)a4;
- (BOOL)_supportsFPFS;
- (BOOL)invalidated;
- (BOOL)isAppExtensionReachable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKnownFolderSyncingAllowedByManagement;
- (BOOL)shouldHideDomainDisplayName;
- (BOOL)supportsEnumeration;
- (BOOL)supportsFPFS;
- (BOOL)testingProvider;
- (FPDExtension)asAppExtensionBackedProvider;
- (FPDExtensionManager)manager;
- (FPDProvider)initWithDescriptor:(id)a3 server:(id)a4;
- (FPDProviderDescriptor)descriptor;
- (FPDServer)server;
- (NSArray)extensionStorageURLs;
- (NSArray)providedItemsURLs;
- (NSArray)requestedExtendedAttributes;
- (NSDictionary)nsDomainsByID;
- (NSDictionary)relevantDomainsByID;
- (NSMutableDictionary)domainsByID;
- (NSMutableDictionary)domainsByRootPath;
- (NSSet)blockedProcessNames;
- (NSString)bundleVersion;
- (NSString)identifier;
- (NSString)purposeIdentifier;
- (NSURL)providerPlistURL;
- (NSURL)supportURL;
- (OS_dispatch_queue)presentersQueue;
- (OS_dispatch_queue)queue;
- (id)_domainsWithFilter:(id)a3;
- (id)_recreateDefaultDomainIfNeededOnVolume:(id)a3;
- (id)defaultNSDomain;
- (id)description;
- (id)domainForIdentifier:(id)a3 reason:(unint64_t *)a4;
- (id)domainForRealPathURLFast:(id)a3;
- (id)domainForRealPathURLSlow:(id)a3;
- (id)domainForURL:(id)a3;
- (id)importDomainsFromLibrary:(id)a3 updatePlist:(BOOL)a4;
- (id)loggerForDomainWithIdentifier:(id)a3;
- (id)newDomainFromNSDomain:(id)a3 volume:(id)a4;
- (id)providerDomainForDomain:(id)a3;
- (void)_setEnabledOrHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 newValue:(BOOL)a5 request:(id)a6 completionHandler:(id)a7;
- (void)_startOrClearDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)_writeDomainPropertiesIntoLibrary:(id)a3 ifChangedFrom:(id)a4;
- (void)addDomain:(id)a3 byImportingDirectoryAtURL:(id)a4 knownFolders:(id)a5 userAllowedDBDrop:(BOOL)a6 unableToStartup:(BOOL)a7 startupError:(id)a8 reloadDomain:(BOOL)a9 request:(id)a10 completionHandler:(id)a11;
- (void)addDomain:(id)a3 byImportingDirectoryAtURL:(id)a4 userAllowedDBDrop:(BOOL)a5 knownFolders:(id)a6 request:(id)a7 completionHandler:(id)a8;
- (void)checkTCCAccessForDomainID:(id)a3 auditToken:(id *)a4 completionHandler:(id)a5;
- (void)dumpAllDomains:(id)a3 domains:(id)a4 auditToken:(id *)a5 request:(id)a6 providerFilter:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9;
- (void)dumpDomain:(id)a3 allowedToDump:(BOOL)a4 dumper:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8;
- (void)dumpStateTo:(id)a3 auditToken:(id *)a4 request:(id)a5 providerFilter:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8;
- (void)dumpValue:(id)a3 forKey:(id)a4 to:(id)a5;
- (void)dumpXattrsForDomains:(id)a3 dumper:(id)a4;
- (void)enableAllDomainsIfNoUserElection;
- (void)fetchTelemetryReportForAllDomains:(id)a3 resultDictionary:(id)a4 completionHandler:(id)a5;
- (void)fetchTelemetryReportWithProviderFilter:(id)a3 completionHandler:(id)a4;
- (void)invalidateAllDomainsOnVolume:(id)a3 reason:(id)a4;
- (void)invalidateSingleDomain:(id)a3 reason:(id)a4;
- (void)invalidateWithReason:(id)a3;
- (void)materializeRootForDomain:(id)a3;
- (void)reloadDomain:(id)a3 unableToStartup:(BOOL)a4 startupError:(id)a5 completionHandler:(id)a6;
- (void)removeAllDomainsForRequest:(id)a3 completionHandler:(id)a4;
- (void)removeDomain:(id)a3 mode:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6;
- (void)setBlockedProcessNames:(id)a3;
- (void)setDomainUserInfo:(id)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setEjectable:(BOOL)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)setHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)setReplicatedKnownFolders:(unint64_t)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setRequestedExtendedAttributes:(id)a3;
- (void)startDomains:(id)a3 completion:(id)a4;
- (void)startWithCompletion:(id)a3;
- (void)writeAllDomainProperties;
@end

@implementation FPDProvider

uint64_t __34__FPDProvider_relevantDomainsByID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = [v3 nsDomain];
  if ([v4 isHidden])
  {
    v5 = [v3 identifier];
    uint64_t v6 = [v5 isEqualToString:*MEMORY[0x1E4F25C00]] ^ 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (NSDictionary)nsDomainsByID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_opt_new();
  v4 = [(FPDProvider *)v2 relevantDomainsByID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__FPDProvider_nsDomainsByID__block_invoke;
  v7[3] = &unk_1E6A75490;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  objc_sync_exit(v2);
  return (NSDictionary *)v5;
}

- (NSDictionary)relevantDomainsByID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_domainsByID fp_filter:&__block_literal_global_182];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (id)providerDomainForDomain:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v7 = objc_alloc(MEMORY[0x1E4F25D60]);
  id v8 = [(FPDProvider *)v6 identifier];
  v9 = [v5 nsDomain];
  v10 = (void *)[v7 initWithProviderID:v8 domain:v9];

  v11 = [(FPDProvider *)v6 descriptor];
  uint64_t v12 = [v11 localizedName];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_1F2EC3618;
  }
  [v10 setProviderDisplayName:v14];

  v15 = [v11 extensionPointVersion];
  [v10 setVersion:v15];

  v16 = [v11 supportedFileTypes];
  [v10 setSupportedFileTypes:v16];

  objc_msgSend(v10, "setSupportsEnumeration:", objc_msgSend(v11, "supportsEnumeration"));
  objc_msgSend(v10, "setIsAvailableSystemWide:", objc_msgSend(v11, "isAvailableSystemWide"));
  char v17 = [v11 readonly];
  if (v17)
  {
    uint64_t v18 = 1;
  }
  else
  {
    id v3 = [v5 nsDomain];
    uint64_t v18 = [v3 readOnly];
  }
  [v10 setReadOnly:v18];
  if ((v17 & 1) == 0) {

  }
  objc_msgSend(v10, "setCanDisable:", objc_msgSend(v11, "canToggleDomainVisibility"));
  objc_msgSend(v10, "setShouldHideExtensionName:", objc_msgSend(v11, "shouldHideExtensionName"));
  v19 = [v11 topLevelBundleIdentifier];
  [v10 setTopLevelBundleIdentifier:v19];

  v20 = [v11 topLevelBundleURL];
  [v10 setTopLevelBundleURL:v20];

  objc_msgSend(v10, "setUsesUniqueItemIdentifiersAcrossDevices:", objc_msgSend(v11, "usesUniqueItemIdentifiersAcrossDevices"));
  v21 = [v11 supportedSearchFilters];
  [v10 setSupportedSearchFilters:v21];

  v22 = [v11 extensionBundleURL];
  [v10 setExtensionBundleURL:v22];

  objc_msgSend(v10, "setOwningApplicationIsHidden:", objc_msgSend(v11, "owningApplicationIsHidden"));
  v23 = [v5 nsDomain];
  objc_msgSend(v10, "setSupportsPickingFolders:", objc_msgSend(v5, "supportsPickingFolders"));
  objc_msgSend(v10, "setUseFPFS:", objc_msgSend(v5, "isUsingFPFS"));
  objc_msgSend(v10, "setEnabled:", objc_msgSend(v5, "userEnabled"));
  objc_msgSend(v10, "setEjectable:", objc_msgSend(v5, "ejectable"));
  unsigned __int8 v31 = 0;
  v24 = [v5 rootURLsWithTransientState:&v31];
  [v10 setStorageURLs:v24];

  [v10 setStorageURLsAreInTransientState:v31];
  v25 = [v5 indexer];
  objc_msgSend(v10, "setNeedsAuthentication:", objc_msgSend(v25, "needsAuthentication"));

  objc_msgSend(v10, "setAllowsUserControlledEviction:", objc_msgSend(v11, "allowsUserControlledEviction"));
  objc_msgSend(v10, "setAllowsSystemDeleteAlerts:", objc_msgSend(v11, "allowsSystemDeleteAlerts"));
  objc_msgSend(v10, "setAllowsContextualMenuDownloadEntry:", objc_msgSend(v11, "allowsContextualMenuDownloadEntry"));
  objc_msgSend(v10, "setDisconnectionState:", objc_msgSend(v5, "disconnectionState"));
  objc_msgSend(v10, "setAppliesChangesAtomically:", objc_msgSend(v11, "appliesChangesAtomically"));
  v26 = [v5 domainUserInfo];
  [v10 setDomainUserInfo:v26];

  objc_msgSend(v10, "setBackgroundActivityIsPaused:", objc_msgSend(v5, "backgroundActivityIsPaused"));
  objc_msgSend(v10, "setSupportsSyncingTrash:", objc_msgSend(v5, "supportsSyncingTrash"));
  objc_msgSend(v10, "setSupportsSearch:", objc_msgSend(v5, "supportsSearch"));
  objc_msgSend(v10, "setErrorGenerationCount:", objc_msgSend(v5, "errorGenerationCount"));
  v27 = [v5 indexer];
  objc_msgSend(v10, "setIsIndexed:", objc_msgSend(v27, "isIndexed"));

  objc_msgSend(v10, "setSupportsRemoteVersions:", objc_msgSend(v5, "supportsRemoteVersions"));
  v28 = [v5 volume];
  if ([v28 role] == 1)
  {
    BOOL v29 = [(FPDProvider *)v6 isKnownFolderSyncingAllowedByManagement];

    if (!v29) {
      goto LABEL_13;
    }
    v28 = [v5 nsDomain];
    objc_msgSend(v10, "setSupportedKnownFolders:", objc_msgSend(v28, "supportedKnownFolders"));
  }

LABEL_13:
  objc_sync_exit(v6);

  return v10;
}

- (NSString)identifier
{
  return [(FPDProviderDescriptor *)self->_descriptor identifier];
}

- (FPDProviderDescriptor)descriptor
{
  return self->_descriptor;
}

- (BOOL)isKnownFolderSyncingAllowedByManagement
{
  if (isKnownFolderSyncingAllowedByManagement_onceToken != -1) {
    dispatch_once(&isKnownFolderSyncingAllowedByManagement_onceToken, &__block_literal_global_16);
  }
  id v3 = [(FPDProvider *)self descriptor];
  v4 = [v3 topLevelBundleIdentifier];

  if (isKnownFolderSyncingAllowedByManagement_knownFolderSyncingIsGloballyDisallowed)
  {
    char v5 = 0;
  }
  else if (isKnownFolderSyncingAllowedByManagement_allowedBundleIDs)
  {
    char v5 = [(id)isKnownFolderSyncingAllowedByManagement_allowedBundleIDs containsObject:v4];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (NSArray)providedItemsURLs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v5 = [(NSMutableDictionary *)v4->_domainsByID allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) rootURLs];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return (NSArray *)v3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (id)domainForIdentifier:(id)a3 reason:(unint64_t *)a4
{
  id v6 = a3;
  if (!v6)
  {
    long long v13 = [NSString stringWithFormat:@"[ASSERT] ‼️ no domain identifier"];
    long long v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDProvider domainForIdentifier:reason:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProvider.m", 530, (const char *)[v13 UTF8String]);
  }
  uint64_t v7 = v6;
  id v8 = self;
  objc_sync_enter(v8);
  domainsByID = v8->_domainsByID;
  v10 = [v7 precomposedStringWithCanonicalMapping];
  long long v11 = [(NSMutableDictionary *)domainsByID objectForKeyedSubscript:v10];

  if (a4 && !v11) {
    *a4 = 1;
  }
  objc_sync_exit(v8);

  return v11;
}

- (BOOL)shouldHideDomainDisplayName
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPDProvider *)v2 identifier];
  if ([v3 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"])
  {
    BOOL v4 = 0;
LABEL_6:

    goto LABEL_7;
  }
  char v5 = [(FPDProvider *)v2 identifier];
  char v6 = [v5 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

  if ((v6 & 1) == 0)
  {
    id v3 = [(FPDProvider *)v2 relevantDomainsByID];
    BOOL v4 = (unint64_t)[v3 count] < 2;
    goto LABEL_6;
  }
  BOOL v4 = 0;
LABEL_7:
  objc_sync_exit(v2);

  return v4;
}

- (void)_writeDomainPropertiesIntoLibrary:(id)a3 ifChangedFrom:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v42 = a4;
  uint64_t section = __fp_create_section();
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(FPDProvider *)self identifier];
    *(_DWORD *)buf = 134218498;
    uint64_t v53 = section;
    __int16 v54 = 2114;
    id v55 = v8;
    __int16 v56 = 2114;
    id v57 = v6;
    _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx writing domain properties for %{public}@ onto %{public}@", buf, 0x20u);
  }
  v9 = self;
  objc_sync_enter(v9);
  v44 = objc_opt_new();
  BOOL v10 = v42 != 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obj = v9->_domainsByID;
  uint64_t v11 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        v15 = [(NSMutableDictionary *)v9->_domainsByID objectForKeyedSubscript:v14];
        uint64_t v16 = v15;
        if (!v6
          || ([v15 volume],
              id v17 = (id)objc_claimAutoreleasedReturnValue(),
              BOOL v18 = v17 == v6,
              v17,
              v18))
        {
          v19 = fp_current_or_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = [v16 nsDomain];
            *(_DWORD *)buf = 138543362;
            uint64_t v53 = (uint64_t)v20;
            _os_log_impl(&dword_1D744C000, v19, OS_LOG_TYPE_INFO, "[INFO] writing properties for domain %{public}@", buf, 0xCu);
          }
          [v16 nsDomainOrNilForDefault];

          v21 = [v16 nsDomainOrNilForDefault];
          v22 = [v21 plistDictionary];
          v23 = v22;
          if (!v22) {
            v22 = (void *)MEMORY[0x1E4F1CC08];
          }
          v24 = (void *)[v22 mutableCopy];

          v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "userEnabled"));
          [v24 setObject:v25 forKeyedSubscript:@"Enabled"];

          v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "ejectable"));
          [v24 setObject:v26 forKeyedSubscript:@"Connected"];

          v27 = [v16 domainUserInfo];
          [v24 setObject:v27 forKeyedSubscript:@"DomainUserInfo"];

          [v44 setObject:v24 forKeyedSubscript:v14];
          BOOL v10 = 1;
        }
      }
      uint64_t v11 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v11);
  }

  if (v10)
  {
    if ([v6 role] != 1) {
      [v6 role];
    }
    if (([v44 isEqualToDictionary:v42] & 1) == 0)
    {
      v28 = [v6 systemDirectory];
      BOOL v29 = v28;
      if (v28)
      {
        id v30 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F1CB10], "fp_supportDirectory");
        id v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      unsigned __int8 v31 = v30;

      v32 = [(FPDProviderDescriptor *)v9->_descriptor identifier];
      v33 = fp_current_or_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v53 = (uint64_t)v32;
        __int16 v54 = 2112;
        id v55 = v6;
        __int16 v56 = 2112;
        id v57 = v31;
        _os_log_impl(&dword_1D744C000, v33, OS_LOG_TYPE_INFO, "[INFO] Updating plist for %@ on %@ (%@)", buf, 0x20u);
      }

      v34 = [v31 URLByAppendingPathComponent:v32];
      v35 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v35 createDirectoryAtURL:v34 withIntermediateDirectories:1 attributes:0 error:0];

      id v45 = 0;
      LODWORD(v35) = [v6 writeDomainsProperties:v44 underDirectoryAtURL:v34 error:&v45];
      id v36 = v45;
      if (v35)
      {
        v37 = fp_current_or_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = [(FPDProvider *)v9 identifier];
          v39 = [(NSMutableDictionary *)v9->_domainsByID allKeys];
          *(_DWORD *)buf = 138412802;
          uint64_t v53 = (uint64_t)v38;
          __int16 v54 = 2112;
          id v55 = v34;
          __int16 v56 = 2112;
          id v57 = v39;
          _os_log_debug_impl(&dword_1D744C000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] updated domain plist for %@ at %@: %@", buf, 0x20u);
        }
      }
      else
      {
        v37 = fp_current_or_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v40 = [(FPDProvider *)v9 identifier];
          v41 = objc_msgSend(v36, "fp_prettyDescription");
          *(_DWORD *)buf = 138412802;
          uint64_t v53 = (uint64_t)v40;
          __int16 v54 = 2112;
          id v55 = v34;
          __int16 v56 = 2112;
          id v57 = v41;
          _os_log_error_impl(&dword_1D744C000, v37, OS_LOG_TYPE_ERROR, "[ERROR] error while writing domain plist for %@ at %@: %@", buf, 0x20u);
        }
      }
    }
  }

  objc_sync_exit(v9);
  __fp_leave_section_Notice();
}

void __28__FPDProvider_nsDomainsByID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 nsDomainOrNilForDefault];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNsDomainOrNilForDefault:*(void *)(a1 + 40)];
}

- (id)domainForRealPathURLFast:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v47 = v4;
  obj = v4->_domainsByRootPath;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v5)
  {
    uint64_t v46 = *(void *)v54;
    uint64_t v45 = *MEMORY[0x1E4F25C00];
    *(void *)&long long v6 = 138412546;
    long long v39 = v6;
LABEL_3:
    uint64_t v7 = 0;
    uint64_t v44 = v5;
    while (1)
    {
      if (*(void *)v54 != v46) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v53 + 1) + 8 * v7);
      v9 = (void *)MEMORY[0x1D9471CC0]();
      BOOL v10 = [(NSMutableDictionary *)v47->_domainsByRootPath objectForKeyedSubscript:v8];
      uint64_t v11 = [v10 identifier];
      char v12 = [v11 isEqualToString:v45];

      if (v12)
      {
        int v13 = 3;
      }
      else
      {
        uint64_t v14 = [v41 path];
        long long v48 = objc_msgSend(v8, "fp_relativePathWithRealpath:", v14);

        if (v48)
        {
          domainsByID = v47->_domainsByID;
          uint64_t v16 = [v10 identifier];
          id v17 = [v16 precomposedStringWithCanonicalMapping];
          v43 = [(NSMutableDictionary *)domainsByID objectForKeyedSubscript:v17];

          if (v43 == v10)
          {
            v22 = [v10 rootURLs];
            v23 = (void *)[v22 copy];

            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            BOOL v18 = v23;
            uint64_t v24 = [v18 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v50;
              while (2)
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v50 != v25) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "path", v39);
                  v28 = objc_msgSend((id)v27, "fp_realpath");

                  LOBYTE(v27) = [v28 isEqual:v8];
                  if (v27)
                  {

                    id v30 = fp_current_or_default_log();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                    {
                      unsigned __int8 v31 = [v10 identifier];
                      v32 = objc_msgSend(v31, "fp_obfuscatedProviderDomainID");
                      v33 = objc_msgSend(v41, "fp_shortDescription");
                      *(_DWORD *)buf = v39;
                      v59 = v32;
                      __int16 v60 = 2112;
                      v61 = v33;
                      _os_log_debug_impl(&dword_1D744C000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] Found domain %@ with fast path for %@", buf, 0x16u);
                    }
                    id v40 = v10;
                    int v13 = 1;
                    goto LABEL_28;
                  }
                }
                uint64_t v24 = [v18 countByEnumeratingWithState:&v49 objects:v57 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }

            BOOL v29 = fp_current_or_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v34 = objc_msgSend(v41, "fp_shortDescription");
              v35 = [v10 identifier];
              id v36 = objc_msgSend(v35, "fp_obfuscatedProviderDomainID");
              *(_DWORD *)buf = 138543618;
              v59 = v34;
              __int16 v60 = 2114;
              v61 = v36;
              _os_log_error_impl(&dword_1D744C000, v29, OS_LOG_TYPE_ERROR, "[ERROR] Fast path %{public}@ for domain %{public}@ not accurate: root path not present", buf, 0x16u);
            }
          }
          else
          {
            BOOL v18 = fp_current_or_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = objc_msgSend(v8, "fp_prettyPath");
              v20 = [v10 identifier];
              v21 = objc_msgSend(v20, "fp_obfuscatedProviderDomainID");
              *(_DWORD *)buf = 138543618;
              v59 = v19;
              __int16 v60 = 2114;
              v61 = v21;
              _os_log_error_impl(&dword_1D744C000, v18, OS_LOG_TYPE_ERROR, "[ERROR] Fast path %{public}@ for domain %{public}@ not accurate: domain not in domainsByID", buf, 0x16u);
            }
          }
          int v13 = 2;
LABEL_28:
        }
        else
        {
          int v13 = 3;
        }
      }
      if (v13 != 3) {
        break;
      }
      if (++v7 == v44)
      {
        uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v5) {
          goto LABEL_3;
        }
        LOBYTE(v13) = 0;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  objc_sync_exit(v47);
  if (v13) {
    v37 = v40;
  }
  else {
    v37 = 0;
  }

  return v37;
}

- (FPDExtensionManager)manager
{
  return self->_manager;
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_118(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (([a2 isEqualToString:*MEMORY[0x1E4F25C00]] & 1) == 0
    && ([v7 isHiddenByUser] & 1) == 0)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_118_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_116(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (([a2 isEqualToString:*MEMORY[0x1E4F25C00]] & 1) == 0
    && [v7 userEnabled])
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_116_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)addDomain:(id)a3 byImportingDirectoryAtURL:(id)a4 userAllowedDBDrop:(BOOL)a5 knownFolders:(id)a6 request:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a5;
  id v14 = a8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke;
  v17[3] = &unk_1E6A75368;
  id v18 = v14;
  id v15 = v14;
  LOBYTE(v16) = 0;
  [(FPDProvider *)self addDomain:a3 byImportingDirectoryAtURL:a4 knownFolders:a6 userAllowedDBDrop:v10 unableToStartup:0 startupError:0 reloadDomain:v16 request:a7 completionHandler:v17];
}

- (void)addDomain:(id)a3 byImportingDirectoryAtURL:(id)a4 knownFolders:(id)a5 userAllowedDBDrop:(BOOL)a6 unableToStartup:(BOOL)a7 startupError:(id)a8 reloadDomain:(BOOL)a9 request:(id)a10 completionHandler:(id)a11
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v26 = a8;
  id v18 = a10;
  id v19 = a11;
  v20 = [v15 identifier];
  v21 = [(FPDProvider *)self loggerForDomainWithIdentifier:v20];

  v33 = fpfs_adopt_log();
  if (FPFeatureFlagEbihilIsEnabled()) {
    __assert_rtn("-[FPDProvider addDomain:byImportingDirectoryAtURL:knownFolders:userAllowedDBDrop:unableToStartup:startupError:reloadDomain:request:completionHandler:]", "FPDProvider.m", 1107, "!FPFeatureFlagEbihilIsEnabled()");
  }
  if ([v15 isReplicated]
    && ![(FPDProvider *)self supportsFPFS]
    && ![(FPDProvider *)self testingProvider])
  {
    v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v15;
      _os_log_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] domain %@ was asked with FPFS, but it's not supported, will fallback", buf, 0xCu);
    }

    [v15 setReplicated:0];
  }
  if (([v15 isReplicated] & 1) == 0)
  {
    v23 = [(FPDProvider *)self identifier];
    int IsForcedForFPFS = FPFSProviderIsForcedForFPFS();

    if (IsForcedForFPFS)
    {
      uint64_t v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v15;
        _os_log_impl(&dword_1D744C000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] domain %@ was asked without FPFS, but provider is forced", buf, 0xCu);
      }

      [v15 setReplicated:1];
    }
  }
  id v27 = v15;
  id v32 = v19;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v31 = v26;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) identifier];
  id v115 = 0;
  char v4 = objc_msgSend(v3, "fp_isValidDomainIdentifierWithError:", &v115);
  id v97 = v115;

  if ((v4 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_106;
  }
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v6 = *(void **)(a1 + 32);
    id v7 = [v6 identifier];
    id v8 = objc_msgSend(v7, "fp_obfuscatedFilename");
    v9 = [*(id *)(a1 + 40) identifier];
    BOOL v10 = objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 56), "fp_map:", &__block_literal_global_109_0);
    char v12 = [v11 componentsJoinedByString:@","];
    uint64_t v13 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v119 = v9;
    __int16 v120 = 2114;
    v121 = v10;
    __int16 v122 = 2114;
    v123 = v12;
    __int16 v124 = 2114;
    uint64_t v125 = v13;
    _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] Adding domain %@ (%{public}@) for extension %@, importing directory %{public}@ (known folders: %{public}@), for %{public}@", buf, 0x3Eu);
  }
  if (*(unsigned char *)(*(void *)(a1 + 40) + 16))
  {
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_7(a1);
    }

    uint64_t v15 = *(void *)(a1 + 80);
    id v16 = FPProviderXPCInvalidError();
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

    goto LABEL_106;
  }
  id v17 = [*v2 identifier];
  uint64_t v18 = *MEMORY[0x1E4F25C00];
  if (![v17 isEqualToString:*MEMORY[0x1E4F25C00]])
  {

    goto LABEL_15;
  }
  int v19 = [*v2 isReplicated];

  if (!v19)
  {
LABEL_15:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v119) = 0;
    uint64_t v111 = 0;
    v112 = &v111;
    uint64_t v113 = 0x2020000000;
    char v114 = 0;
    id v23 = *(id *)(a1 + 40);
    objc_sync_enter(v23);
    char v24 = [*(id *)(*(void *)(a1 + 40) + 32) enabledByDefault];
    *(unsigned char *)(*(void *)&buf[8] + 24) = v24;
    *((unsigned char *)v112 + 24) = 1;
    if ([*(id *)(*(void *)(a1 + 40) + 80) count] != 1
      || ([*(id *)(*(void *)(a1 + 40) + 80) objectForKeyedSubscript:v18],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          BOOL v26 = v25 == 0,
          v25,
          v26))
    {
      if (!*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        id v32 = *(void **)(*(void *)(a1 + 40) + 80);
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_116;
        v110[3] = &unk_1E6A753B0;
        v110[4] = buf;
        [v32 enumerateKeysAndObjectsUsingBlock:v110];
      }
      v33 = *(void **)(*(void *)(a1 + 40) + 80);
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_118;
      v109[3] = &unk_1E6A753B0;
      v109[4] = &v111;
      [v33 enumerateKeysAndObjectsUsingBlock:v109];
    }
    else
    {
      if (!*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        id v27 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKeyedSubscript:v18];
        char v28 = [v27 userEnabled];
        *(unsigned char *)(*(void *)&buf[8] + 24) = v28;
      }
      id v29 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKeyedSubscript:v18];
      char v30 = [v29 isHiddenByUser];
      *((unsigned char *)v112 + 24) = v30;

      id v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_6();
      }
    }
    v34 = *(void **)(a1 + 32);
    id v35 = [*(id *)(a1 + 40) descriptor];
    objc_msgSend(v34, "setIsContentManaged:", objc_msgSend(v35, "owningApplicationIsManaged") | objc_msgSend(v34, "isContentManaged"));

    uint64_t v36 = *(void **)(*(void *)(a1 + 40) + 80);
    v37 = [*(id *)(a1 + 32) identifier];
    v38 = [v37 precomposedStringWithCanonicalMapping];
    long long v39 = [v36 objectForKeyedSubscript:v38];

    if (v39)
    {
      if (*(void *)(a1 + 48))
      {
        uint64_t v40 = *(void *)(a1 + 80);
        id v41 = [MEMORY[0x1E4F25CF0] errorWithDomain:*MEMORY[0x1E4F281F8] code:516 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v40 + 16))(v40, 0, v41);
LABEL_28:

        objc_sync_exit(v23);
LABEL_105:

        _Block_object_dispose(&v111, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_106;
      }
      v43 = fp_current_or_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_5();
      }

      id v41 = [v39 nsDomainOrNilForDefault];
      if (v41) {
        [*v2 copyValuesFromExistingDomain:v41];
      }
      uint64_t v44 = [v41 testingModes];
      if (v44 == [*v2 testingModes]
        && (int v45 = [v41 isReplicated], v45 == objc_msgSend(*v2, "isReplicated"))
        && !*(unsigned char *)(a1 + 96))
      {
        int v96 = 0;
        v95 = 0;
        char v42 = 1;
      }
      else
      {
        if (([v41 testingModes] & 2) != 0 && (objc_msgSend(*v2, "testingModes") & 2) != 0)
        {
          uint64_t v52 = *(void *)(a1 + 80);
          long long v53 = FPInvalidParameterError();
          (*(void (**)(uint64_t, void, void *))(v52 + 16))(v52, 0, v53);

          goto LABEL_28;
        }
        uint64_t v46 = [v41 testingModes];
        if (v46 == [*v2 testingModes])
        {
          int v47 = [v41 isReplicated];
          if (v47 == [*v2 isReplicated])
          {
            long long v48 = fp_current_or_default_log();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              id v54 = *v2;
              *(_DWORD *)v116 = 138412290;
              id v117 = v54;
              _os_log_impl(&dword_1D744C000, v48, OS_LOG_TYPE_DEFAULT, "[NOTICE] need a new domain for %@ because we were asked to reload the domain", v116, 0xCu);
            }
            long long v50 = @"domainReload";
          }
          else
          {
            long long v48 = fp_current_or_default_log();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              id v49 = *v2;
              *(_DWORD *)v116 = 138412290;
              id v117 = v49;
              _os_log_impl(&dword_1D744C000, v48, OS_LOG_TYPE_DEFAULT, "[NOTICE] need a new domain for %@ because replicated status changed", v116, 0xCu);
            }
            long long v50 = @"domainReplicationUpdate";
          }
        }
        else
        {
          long long v48 = fp_current_or_default_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            id v51 = *v2;
            *(_DWORD *)v116 = 138412290;
            id v117 = v51;
            _os_log_impl(&dword_1D744C000, v48, OS_LOG_TYPE_DEFAULT, "[NOTICE] need a new domain for %@ because testing modes changed", v116, 0xCu);
          }
          long long v50 = @"domainTestingModeUpdate";
        }
        v95 = v50;

        char v42 = 0;
        int v96 = 1;
      }
    }
    else
    {
      char v42 = 0;
      v95 = @"domainCreation";
      int v96 = 1;
    }
    objc_sync_exit(v23);

    if (((v39 != 0) & v42) == 1)
    {
      long long v55 = [v39 serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_135;
      block[3] = &unk_1E6A736C0;
      id v107 = v39;
      id v108 = *v2;
      dispatch_sync(v55, block);
    }
    if (v96) {
      [v39 stopIndexer];
    }
    id v56 = *(id *)(a1 + 40);
    objc_sync_enter(v56);
    id v57 = [v39 volume];
    if (v57)
    {
      id v58 = 0;
    }
    else
    {
      id v59 = [*v2 volumeUUID];
      __int16 v60 = *(void **)(a1 + 40);
      if (v59)
      {
        v61 = [v60 server];
        v62 = [v61 volumeManager];
        id v105 = 0;
        id v57 = [v62 libraryForVolume:v59 createIfNeeded:1 error:&v105];
        id v58 = v105;

        if (!v57)
        {
          v93 = fp_current_or_default_log();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            v94 = objc_msgSend(v58, "fp_prettyDescription");
            __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_3((uint64_t)v59, v94, (uint64_t)v116);
          }

          (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
          id v23 = 0;
          goto LABEL_100;
        }
        if (([v57 isDefaultVolumeForCurrentPersona] & 1) == 0)
        {
          if (!FPFeatureFlagEbihilIsEnabled()
            || ([*(id *)(a1 + 40) descriptor],
                uint64_t v63 = objc_claimAutoreleasedReturnValue(),
                char v64 = [v63 allowsExternalVolumes],
                v63,
                (v64 & 1) == 0))
          {
            v65 = fp_current_or_default_log();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_4();
            }

            uint64_t v66 = *(void *)(a1 + 80);
            v67 = FPNotSupportedError();
            (*(void (**)(uint64_t, void, void *))(v66 + 16))(v66, 0, v67);

            id v23 = 0;
            goto LABEL_100;
          }
        }
      }
      else
      {
        v68 = [v60 server];
        v69 = [v68 volumeManager];
        id v57 = [v69 defaultVolumeForCurrentPersona];

        id v58 = 0;
      }
    }
    if ([v57 role] != 3)
    {
      v70 = [*v2 identifier];
      int v71 = [v70 hasPrefix:*MEMORY[0x1E4F25E68]];

      if (v71)
      {
        v72 = fp_current_or_default_log();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_2();
        }

        uint64_t v73 = *(void *)(a1 + 80);
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 19);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void, id))(v73 + 16))(v73, 0, v59);
        id v23 = 0;
        goto LABEL_100;
      }
    }
    if (v96)
    {
      v74 = [MEMORY[0x1E4F29128] UUID];
      v75 = [v74 UUIDString];
      [*v2 setSpotlightDomainIdentifier:v75];

      v76 = (void *)[*(id *)(a1 + 40) newDomainFromNSDomain:*(void *)(a1 + 32) volume:v57];
      [v76 setUnableToStartup:*(unsigned __int8 *)(a1 + 97)];
      [v76 setStartupError:*(void *)(a1 + 72)];
      v77 = [v76 serialQueue];
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_138;
      v102[3] = &unk_1E6A736C0;
      id v23 = v76;
      id v103 = v23;
      id v104 = *v2;
      dispatch_sync(v77, v102);

      if (v39)
      {
        objc_msgSend(v23, "setUserEnabled:", objc_msgSend(v39, "userEnabled"));
        v78 = [v39 fpfsRootBookmarkData];
        [v23 setFpfsRootBookmarkData:v78];

        v79 = v95;
        uint64_t v80 = [v39 isHiddenByUser];
      }
      else
      {
        [v23 setUserEnabled:*(unsigned __int8 *)(*(void *)&buf[8] + 24)];
        v79 = v95;
        uint64_t v80 = *((unsigned char *)v112 + 24) != 0;
      }
      [v23 setHiddenByUser:v80];
      if ([v23 userEnabled]) {
        uint64_t v81 = 1;
      }
      else {
        uint64_t v81 = [*v2 testingModes] & 1;
      }
      [v23 setUserEnabled:v81];
      [v23 setEjectable:0];
      [v23 finishSetup];
      if (v39)
      {
        if (!v79) {
          v79 = @"domainConfigurationUpdate";
        }
      }
      else if ([v23 isUsingFPFS])
      {
        uint64_t v83 = *(void *)(a1 + 48);
        uint64_t v82 = *(void *)(a1 + 56);
        id v101 = v58;
        char v84 = [v23 createRootByImportingDirectoryAtURL:v83 knownFolders:v82 error:&v101];
        if (v83) {
          v79 = @"domainImport";
        }
        id v85 = v101;

        if ((v84 & 1) == 0)
        {
          (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

          id v59 = v103;
          id v58 = v85;
LABEL_100:

          int v92 = 0;
LABEL_101:

          objc_sync_exit(v56);
          if (v92)
          {
            if (v96)
            {
              [v39 invalidateWithReason:@"replaced with newer instance"];
              [v39 invalidateSession];
            }
            (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
          }
          goto LABEL_105;
        }
        id v58 = v85;
      }
      v86 = *(void **)(a1 + 40);
      uint64_t v87 = *(unsigned __int8 *)(a1 + 98);
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_2_145;
      v98[3] = &unk_1E6A75278;
      char v100 = *(unsigned char *)(a1 + 97);
      v98[4] = v86;
      id v23 = v23;
      id v99 = v23;
      [v86 _startOrClearDomain:v23 userAllowedDBDrop:v87 reason:v79 completion:v98];
      v88 = *(void **)(*(void *)(a1 + 40) + 80);
      v89 = [*(id *)(a1 + 32) identifier];
      v90 = [v89 precomposedStringWithCanonicalMapping];
      [v88 setObject:v23 forKeyedSubscript:v90];

      addRootPathKeys(*(void **)(*(void *)(a1 + 40) + 88), v23);
    }
    else
    {
      id v23 = 0;
    }
    if ([v57 isDefaultVolumeForCurrentPersona]) {
      id v91 = (id)[*(id *)(a1 + 40) _recreateDefaultDomainIfNeededOnVolume:v57];
    }
    [*(id *)(a1 + 40) _writeDomainPropertiesIntoLibrary:v57 ifChangedFrom:0];
    int v92 = 1;
    goto LABEL_101;
  }
  v20 = fp_current_or_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_1(v20);
  }

  uint64_t v21 = *(void *)(a1 + 80);
  v22 = FPNotSupportedError();
  (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);

LABEL_106:
}

void __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6) {
    goto LABEL_8;
  }
  id v7 = [v5 rootURLs];
  if (![v7 count])
  {

LABEL_8:
    id v11 = 0;
    goto LABEL_9;
  }
  id v8 = [v5 rootURLs];
  v9 = [v8 objectAtIndexedSubscript:0];
  char v10 = FPClearImportCookieForDomainURL();
  id v11 = 0;

  if ((v10 & 1) == 0)
  {
    char v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke_cold_1();
    }
  }
LABEL_9:
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = [v5 provider];
  uint64_t v15 = [v14 identifier];
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v15, v6);
}

- (id)_recreateDefaultDomainIfNeededOnVolume:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = *MEMORY[0x1E4F25C00];
  id v7 = [(NSMutableDictionary *)v5->_domainsByID objectForKeyedSubscript:*MEMORY[0x1E4F25C00]];

  if (v7)
  {
    id v8 = [(NSMutableDictionary *)v5->_domainsByID objectForKeyedSubscript:v6];
    v9 = [v8 nsDomain];
    int v10 = [v9 isHidden];

    if ([(NSMutableDictionary *)v5->_domainsByID count] == 1
      && [(FPDProviderDescriptor *)v5->_descriptor defaultDomainVisible])
    {
      if (!v10)
      {
        uint64_t v12 = 0;
        goto LABEL_18;
      }
      id v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        [(FPDProvider *)v5 identifier];
        objc_claimAutoreleasedReturnValue();
        -[FPDProvider _recreateDefaultDomainIfNeededOnVolume:]();
      }
      uint64_t v12 = 0;
    }
    else
    {
      if (v10)
      {
        uint64_t v12 = 1;
LABEL_18:
        uint64_t v13 = [(NSMutableDictionary *)v5->_domainsByID objectForKeyedSubscript:v6];
        id v17 = [v13 nsDomain];
        [v17 setHidden:v12];

        id v14 = 0;
        goto LABEL_19;
      }
      id v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        [(FPDProvider *)v5 identifier];
        objc_claimAutoreleasedReturnValue();
        -[FPDProvider _recreateDefaultDomainIfNeededOnVolume:]();
      }
      uint64_t v12 = 1;
    }

    goto LABEL_18;
  }
  uint64_t v13 = [(FPDProvider *)v5 defaultNSDomain];
  id v14 = [(FPDProvider *)v5 newDomainFromNSDomain:v13 volume:v4];
  uint64_t v15 = [(FPDProvider *)v5 descriptor];
  objc_msgSend(v14, "setUserEnabled:", objc_msgSend(v15, "enabledByDefault"));

  [v14 setEjectable:0];
  objc_msgSend(v14, "setShouldIndexWhenStart:", objc_msgSend(v14, "userEnabled"));
  id v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [(FPDProvider *)v5 identifier];
    objc_claimAutoreleasedReturnValue();
    -[FPDProvider _recreateDefaultDomainIfNeededOnVolume:]();
  }

  [(NSMutableDictionary *)v5->_domainsByID setObject:v14 forKeyedSubscript:v6];
LABEL_19:

  objc_sync_exit(v5);
  return v14;
}

- (id)loggerForDomainWithIdentifier:(id)a3
{
  id v4 = (id)*MEMORY[0x1E4F25C00];
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  uint64_t v6 = NSString;
  id v7 = [(FPDProvider *)self identifier];
  id v8 = objc_msgSend(v6, "fp_providerDomainIDFromProviderID:domainIdentifier:", v7, v5);

  objc_msgSend(v8, "fp_obfuscatedProviderDomainID");
  id v9 = objc_claimAutoreleasedReturnValue();
  [v9 UTF8String];
  int v10 = fpfs_create_log_for_provider();

  return v10;
}

- (FPDProvider)initWithDescriptor:(id)a3 server:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v54.receiver = self;
  v54.super_class = (Class)FPDProvider;
  id v9 = [(FPDProvider *)&v54 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    domainsByID = v9->_domainsByID;
    v9->_domainsByID = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    domainsByRootPath = v9->_domainsByRootPath;
    v9->_domainsByRootPath = (NSMutableDictionary *)v12;

    p_descriptor = (id *)&v9->_descriptor;
    objc_storeStrong((id *)&v9->_descriptor, a3);
    uint64_t v15 = [(FPDProviderDescriptor *)v9->_descriptor identifier];
    id v16 = [v15 stringByAppendingString:@".domain"];
    id v17 = (const char *)[v16 UTF8String];
    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    domainQueue = v9->_domainQueue;
    v9->_domainQueue = (OS_dispatch_queue *)v19;

    id v21 = [v15 stringByAppendingString:@".queue"];
    v22 = (const char *)[v21 UTF8String];
    id v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v24;

    id v26 = [v15 stringByAppendingString:@".presenters"];
    id v27 = (const char *)[v26 UTF8String];
    char v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
    presentersQueue = v9->_presentersQueue;
    v9->_presentersQueue = (OS_dispatch_queue *)v29;

    objc_storeStrong((id *)&v9->_server, a4);
    uint64_t v31 = [v8 extensionManager];
    manager = v9->_manager;
    v9->_manager = (FPDExtensionManager *)v31;

    v33 = [MEMORY[0x1E4FB36F8] sharedManager];
    v34 = [v33 currentPersona];

    id v53 = 0;
    id v35 = [v34 userPersonaUniqueString];
    uint64_t v36 = [(FPDProviderDescriptor *)v9->_descriptor personaIdentifier];
    if (v35 == v36)
    {
      uint64_t v44 = 0;
      int v45 = v35;
    }
    else
    {
      v37 = [*p_descriptor personaIdentifier];
      char v38 = [v35 isEqualToString:v37];

      if ((v38 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
      {
        uint64_t v44 = 0;
LABEL_15:
        int v47 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_supportDirectory");
        long long v48 = [v47 URLByAppendingPathComponent:v15 isDirectory:1];
        objc_storeStrong((id *)&v9->_supportURL, v48);
        uint64_t v49 = [v48 URLByAppendingPathComponent:@"Provider.plist" isDirectory:0];
        providerPlistURL = v9->_providerPlistURL;
        v9->_providerPlistURL = (NSURL *)v49;

        _FPRestorePersona();
        goto LABEL_16;
      }
      id v52 = 0;
      long long v39 = (void *)[v34 copyCurrentPersonaContextWithError:&v52];
      id v40 = v52;
      id v41 = v53;
      id v53 = v39;

      if (v40)
      {
        char v42 = fp_current_or_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[FPDProviderDescriptor initWithExtensionRecord:].cold.8();
        }
      }
      v43 = [*p_descriptor personaIdentifier];
      uint64_t v44 = [v34 generateAndRestorePersonaContextWithPersonaUniqueString:v43];

      if (!v44) {
        goto LABEL_15;
      }
      int v45 = fp_current_or_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = [*p_descriptor personaIdentifier];
        -[FPDProvider initWithDescriptor:server:](v46, (uint64_t)v44, (uint64_t)v55);
      }
    }

    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (void)startDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  domainQueue = self->_domainQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__FPDProvider_startDomains_completion___block_invoke;
  block[3] = &unk_1E6A73418;
  id v13 = v6;
  id v14 = self;
  dispatch_group_t v15 = v8;
  uint64_t v10 = v8;
  id v11 = v6;
  dispatch_sync(domainQueue, block);
  dispatch_group_notify(v10, (dispatch_queue_t)self->_queue, v7);
}

void __39__FPDProvider_startDomains_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v16 + 1) + 8 * v5);
        id v15 = 0;
        id v7 = [v6 log];
        fpfs_adopt_log();
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (([v6 started] & 1) == 0 && (objc_msgSend(v6, "invalidated") & 1) == 0)
        {
          dispatch_group_t v8 = *(void **)(*(void *)(a1 + 40) + 80);
          id v9 = [v6 identifier];
          uint64_t v10 = [v8 objectForKeyedSubscript:v9];
          LOBYTE(v8) = v6 == v10;

          if (v8)
          {
            [v6 finishSetup];
            id v11 = *(id *)(a1 + 40);
            objc_sync_enter(v11);
            addRootPathKeys(*(void **)(*(void *)(a1 + 40) + 88), v6);
            objc_sync_exit(v11);

            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v13[0] = MEMORY[0x1E4F143A8];
            v13[1] = 3221225472;
            v13[2] = __39__FPDProvider_startDomains_completion___block_invoke_2;
            v13[3] = &unk_1E6A73FE8;
            uint64_t v12 = *(void **)(a1 + 40);
            id v14 = *(id *)(a1 + 48);
            [v12 _startOrClearDomain:v6 userAllowedDBDrop:0 reason:@"domainStartup" completion:v13];
          }
        }
        __fp_pop_log();

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

void __39__FPDProvider_startDomains_completion___block_invoke_2(uint64_t a1)
{
}

- (void)startWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t section = __fp_create_section();
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FPDProvider *)self identifier];
    *(_DWORD *)buf = 134218242;
    uint64_t v11 = section;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Starting domains for %{public}@", buf, 0x16u);
  }
  id v7 = self;
  objc_sync_enter(v7);
  dispatch_group_t v8 = [(NSMutableDictionary *)v7->_domainsByID allValues];
  objc_sync_exit(v7);

  [(FPDProvider *)v7 startDomains:v8 completion:v4];
  __fp_leave_section_Notice();
}

- (void)invalidateSingleDomain:(id)a3 reason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t section = __fp_create_section();
  dispatch_group_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = section;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Tearing down %{public}@ (reason: %{public}@)", buf, 0x20u);
  }

  domainQueue = self->_domainQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FPDProvider_invalidateSingleDomain_reason___block_invoke;
  block[3] = &unk_1E6A736C0;
  void block[4] = self;
  id v10 = v6;
  id v13 = v10;
  dispatch_sync(domainQueue, block);
  uint64_t v11 = [NSString stringWithFormat:@"invalidating domain %@ (reason: %@)", v10, v7];
  [v10 invalidateWithReason:v11];

  [v10 invalidateSession];
  __fp_leave_section_Notice();
}

void __45__FPDProvider_invalidateSingleDomain_reason___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  id v2 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = [*(id *)(a1 + 40) nsDomain];
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 precomposedStringWithCanonicalMapping];
  [v2 removeObjectForKey:v5];

  removeRootPathKeys(*(void **)(*(void *)(a1 + 32) + 88), *(void **)(a1 + 40));
  objc_sync_exit(obj);
}

- (void)invalidateAllDomainsOnVolume:(id)a3 reason:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  uint64_t section = __fp_create_section();
  dispatch_group_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = section;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    id v27 = v7;
    _os_log_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Tearing down all domains on %{public}@ (reason: %{public}@)", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v27 = __Block_byref_object_copy__9;
  char v28 = __Block_byref_object_dispose__9;
  id v29 = 0;
  id v29 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  domainQueue = self->_domainQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__FPDProvider_invalidateAllDomainsOnVolume_reason___block_invoke;
  block[3] = &unk_1E6A75318;
  void block[4] = self;
  id v10 = v6;
  id v22 = v10;
  id v23 = buf;
  dispatch_sync(domainQueue, block);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v16 = [NSString stringWithFormat:@"invalidating domain %@ (reason: %@)", v15, v7, (void)v17];
        [v15 invalidateWithReason:v16];

        [v15 invalidateSession];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(buf, 8);
  __fp_leave_section_Notice();
}

void __51__FPDProvider_invalidateAllDomainsOnVolume_reason___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) domainsByID];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v27;
    *(void *)&long long v6 = 138412290;
    long long v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "volume", v21);
        BOOL v11 = v10 == *(void **)(a1 + 40);

        if (v11)
        {
          uint64_t v12 = fp_current_or_default_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            id v32 = v9;
            _os_log_impl(&dword_1D744C000, v12, OS_LOG_TYPE_INFO, "[INFO] Invalidating domain %@...", buf, 0xCu);
          }

          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
          removeRootPathKeys(*(void **)(*(void *)(a1 + 32) + 88), v9);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v5);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = *(void **)(*(void *)(a1 + 32) + 80);
        long long v18 = [*(id *)(*((void *)&v22 + 1) + 8 * j) nsDomain];
        long long v19 = [v18 identifier];
        long long v20 = [v19 precomposedStringWithCanonicalMapping];
        [v17 removeObjectForKey:v20];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  objc_sync_exit(v2);
}

- (void)invalidateWithReason:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v43 = (uint64_t (*)(uint64_t, uint64_t))a3;
  uint64_t section = __fp_create_section();
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = section;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    id v58 = v43;
    _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Invalidating %{public}@ (reason: %{public}@)...", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v58 = __Block_byref_object_copy__9;
  id v59 = __Block_byref_object_dispose__9;
  id v60 = 0;
  domainQueue = self->_domainQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FPDProvider_invalidateWithReason___block_invoke;
  block[3] = &unk_1E6A74870;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(domainQueue, block);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v5)
  {
    uint64_t v42 = *(void *)v47;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v46 + 1) + 8 * v6);
        dispatch_group_t v8 = [NSString stringWithFormat:@"invalidating the provider instance (reason: %@)", v43];
        [v7 invalidateWithReason:v8];

        id v9 = [v7 nsDomain];
        id v10 = [v9 personaIdentifier];

        if (v10)
        {
          BOOL v11 = [MEMORY[0x1E4FB36F8] sharedManager];
          uint64_t v12 = [v11 currentPersona];

          id v45 = 0;
          id v13 = [v12 userPersonaUniqueString];
          uint64_t v14 = [v7 nsDomain];
          uint64_t v15 = [v14 personaIdentifier];
          if (v13 != v15)
          {
            uint64_t v16 = [v7 nsDomain];
            long long v17 = [v16 personaIdentifier];
            char v18 = [v13 isEqualToString:v17];

            if ((v18 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
            {
              long long v25 = 0;
            }
            else
            {
              id v44 = 0;
              long long v19 = (void *)[v12 copyCurrentPersonaContextWithError:&v44];
              id v20 = v44;
              id v21 = v45;
              id v45 = v19;

              if (v20)
              {
                long long v22 = fp_current_or_default_log();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)id v52 = 138412290;
                  id v53 = v20;
                  _os_log_error_impl(&dword_1D744C000, v22, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", v52, 0xCu);
                }
              }
              long long v23 = [v7 nsDomain];
              long long v24 = [v23 personaIdentifier];
              long long v25 = [v12 generateAndRestorePersonaContextWithPersonaUniqueString:v24];

              if (v25)
              {
                uint64_t v14 = fp_current_or_default_log();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  long long v26 = [v7 nsDomain];
                  long long v27 = [v26 personaIdentifier];
                  *(_DWORD *)id v52 = 138412546;
                  id v53 = v27;
                  __int16 v54 = 2112;
                  long long v55 = v25;
                  _os_log_error_impl(&dword_1D744C000, v14, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", v52, 0x16u);
                }
LABEL_21:
              }
            }
            long long v28 = [MEMORY[0x1E4FB36F8] sharedManager];
            long long v29 = [v28 currentPersona];
            uint64_t v30 = [v29 userPersonaUniqueString];

            if (v30)
            {
              uint64_t v31 = [v7 nsDomain];
              id v32 = [v31 personaIdentifier];
              char v33 = [v30 isEqualToString:v32];

              if ((v33 & 1) == 0)
              {
                uint64_t v34 = fp_current_or_default_log();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v36 = [v7 nsDomain];
                  v37 = [v36 personaIdentifier];
                  *(_DWORD *)id v52 = 138412290;
                  id v53 = v37;
                  _os_log_fault_impl(&dword_1D744C000, v34, OS_LOG_TYPE_FAULT, "[CRIT] domain's persona %@ doesn't exist anymore, cleaning up", v52, 0xCu);
                }
                id v35 = (id)[v7 cleanupDomainWithMode:0];
              }
            }

            _FPRestorePersona();
            goto LABEL_28;
          }

          long long v25 = 0;
          goto LABEL_21;
        }
LABEL_28:
        [v7 invalidateSession];
        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v5);
  }

  server = self->_server;
  self->_server = 0;

  manager = self->_manager;
  self->_manager = 0;

  _Block_object_dispose(buf, 8);
  __fp_leave_section_Notice();
}

void __36__FPDProvider_invalidateWithReason___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_group_t v8 = *(void **)(v7 + 88);
  *(void *)(v7 + 88) = 0;

  objc_sync_exit(obj);
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(FPDProviderDescriptor *)self->_descriptor identifier];
  uint64_t v6 = [(FPDProviderDescriptor *)self->_descriptor extensionUUID];
  uint64_t v7 = [(FPDProviderDescriptor *)self->_descriptor personaIdentifier];
  dispatch_group_t v8 = [v3 stringWithFormat:@"<%@:%p \"%@\" uuid:\"%@\" persona:\"%@\">", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FPDProvider *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      descriptor = self->_descriptor;
      dispatch_group_t v8 = [(FPDProvider *)v4 descriptor];
      char v6 = [(FPDProviderDescriptor *)descriptor isEqual:v8];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isAppExtensionReachable
{
  return 0;
}

- (FPDExtension)asAppExtensionBackedProvider
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: -asAppExtensionBackedProvider called on a non-app extension backed provider"];
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDProvider asAppExtensionBackedProvider]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProvider.m", 337, (const char *)[v2 UTF8String]);
}

- (BOOL)_supportsFPFS
{
  uint64_t v3 = [(FPDProvider *)self identifier];
  char v4 = [v3 isEqualToString:@"com.apple.FileProvider.TestingHarness.TestFileProvider"];

  if (v4) {
    return 0;
  }
  uint64_t v5 = [(FPDProvider *)self identifier];
  char v6 = [v5 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

  if (v6) {
    return 0;
  }
  uint64_t v7 = [(FPDProvider *)self identifier];
  char v8 = [v7 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];

  if (v8) {
    return 0;
  }
  id v9 = [(FPDProvider *)self identifier];
  char v10 = [v9 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

  if (v10) {
    return 0;
  }
  uint64_t v12 = [(FPDProvider *)self identifier];
  char IsDeniedForFPFS = FPFSProviderIsDeniedForFPFS();

  return IsDeniedForFPFS ^ 1;
}

- (BOOL)supportsFPFS
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(FPDProvider *)self supportsEnumeration];
  if (v3)
  {
    if (![(FPDProvider *)self _supportsFPFS])
    {
      char v4 = [(FPDProvider *)self identifier];
      int IsForcedForFPFS = FPFSProviderIsForcedForFPFS();

      if (!IsForcedForFPFS)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
      char v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [(FPDProvider *)self identifier];
        int v9 = 138412290;
        char v10 = v7;
        _os_log_impl(&dword_1D744C000, v6, OS_LOG_TYPE_INFO, "[INFO] %@ is fpfs-forced", (uint8_t *)&v9, 0xCu);
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)testingProvider
{
  uint64_t v2 = [(FPDProvider *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.FileProvider.TestingHarness.TestFileProvider"];

  return v3;
}

- (id)domainForURL:(id)a3
{
  char v4 = objc_msgSend(a3, "fp_realpathURL");
  uint64_t v5 = [(FPDProvider *)self domainForRealPathURLFast:v4];
  char v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(FPDProvider *)self domainForRealPathURLSlow:v4];
  }
  char v8 = v7;

  return v8;
}

- (id)domainForRealPathURLSlow:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  char v6 = [(NSMutableDictionary *)v5->_domainsByID allValues];
  objc_sync_exit(v5);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  id v8 = 0;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    uint64_t v11 = *MEMORY[0x1E4F25C00];
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "isProviderForRealPathURL:", v4, (void)v18))
        {
          uint64_t v14 = [v13 identifier];
          int v15 = [v14 isEqualToString:v11];

          id v16 = v13;
          if (!v15)
          {

            goto LABEL_13;
          }

          id v8 = v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v8 = v8;
  id v16 = v8;
LABEL_13:

  return v16;
}

void __54__FPDProvider_isKnownFolderSyncingAllowedByManagement__block_invoke()
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
  if (([v5 objectIsForcedForKey:@"ManagementAllowsKnownFolderSyncing"] & 1) != 0
    || FPIgnoresForcedKeyChecks())
  {
    isKnownFolderSyncingAllowedByManagement_knownFolderSyncingIsGloballyDisallowed = [v5 BOOLForKey:@"ManagementAllowsKnownFolderSyncing"] ^ 1;
  }
  if (([v5 objectIsForcedForKey:@"ManagementKnownFolderSyncingAllowList"] & 1) != 0
    || FPIgnoresForcedKeyChecks())
  {
    v0 = [v5 stringArrayForKey:@"ManagementKnownFolderSyncingAllowList"];

    if (v0)
    {
      v1 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v2 = [v5 stringArrayForKey:@"ManagementKnownFolderSyncingAllowList"];
      uint64_t v3 = [v1 setWithArray:v2];
      id v4 = (void *)isKnownFolderSyncingAllowedByManagement_allowedBundleIDs;
      isKnownFolderSyncingAllowedByManagement_allowedBundleIDs = v3;
    }
  }
}

- (NSString)purposeIdentifier
{
  return [(FPDProviderDescriptor *)self->_descriptor purposeIdentifier];
}

- (NSString)bundleVersion
{
  return [(FPDProviderDescriptor *)self->_descriptor bundleVersion];
}

- (NSArray)extensionStorageURLs
{
  return [(FPDProviderDescriptor *)self->_descriptor extensionStorageURLs];
}

- (BOOL)supportsEnumeration
{
  return [(FPDProviderDescriptor *)self->_descriptor supportsEnumeration];
}

+ (id)fpfsDomainURLIsRootOf:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "fp_fpfsProviderDomainID:skipTypeCheck:error:", 0, 1, 0);
  if (v4)
  {
    id v5 = v3;
    id v6 = 0;
    if (getxattr((const char *)[v5 fileSystemRepresentation], "com.apple.fileprovider.detached#B", 0, 0, 0, 0) < 0)
    {
      id v7 = v5;
      id v6 = 0;
      if (getxattr((const char *)[v7 fileSystemRepresentation], "com.apple.fileprovider.detached", 0, 0, 0, 0) < 0)
      {
        id v6 = 0;
        if (getxattr((const char *)[v7 fileSystemRepresentation], "com.apple.fileprovider.detached#PN", 0, 0, 0, 0) < 0)id v6 = v4; {
      }
        }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)onDiskProvidersForServer:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v41 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_supportDirectory");
  id v5 = objc_opt_new();
  uint64_t section = __fp_create_section();
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(v41, "fp_shortDescription");
    *(_DWORD *)buf = 134218242;
    uint64_t v72 = section;
    __int16 v73 = 2114;
    id v74 = v7;
    _os_log_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Listing domains & providers in %{public}@", buf, 0x16u);
  }
  id v8 = [v43 volumeManager];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __40__FPDProvider_onDiskProvidersForServer___block_invoke;
  v64[3] = &unk_1E6A75340;
  id v40 = v4;
  id v65 = v40;
  id v67 = a1;
  id v50 = v5;
  id v66 = v50;
  [v8 enumerateLibrariesWithBlock:v64];

  id v42 = (id)objc_opt_new();
  [v40 enumeratorAtURL:v41 includingPropertiesForKeys:0 options:1 errorHandler:0];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v9)
  {
    uint64_t v48 = *(void *)v61;
    do
    {
      uint64_t v49 = v9;
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v61 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if (objc_msgSend(v11, "fp_isFolder", v40))
        {
          uint64_t v12 = [v11 URLByAppendingPathComponent:@"Provider.plist"];
          id v59 = 0;
          char v13 = [v12 checkResourceIsReachableAndReturnError:&v59];
          id v14 = v59;
          if (v13)
          {
            uint64_t v58 = 0;
            uint64_t v58 = __fp_create_section();
            int v15 = fp_current_or_default_log();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = v58;
              long long v17 = [v11 lastPathComponent];
              *(_DWORD *)buf = 134218242;
              uint64_t v72 = v16;
              __int16 v73 = 2114;
              id v74 = v17;
              _os_log_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Loading %{public}@", buf, 0x16u);
            }
            long long v46 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
            if (v46)
            {
              long long v18 = (void *)MEMORY[0x1E4F28DC0];
              uint64_t v19 = objc_opt_class();
              id v57 = v14;
              os_log_t log = [v18 unarchivedObjectOfClass:v19 fromData:v46 error:&v57];
              id v44 = v57;

              if (log)
              {
                long long v20 = [[FPDProvider alloc] initWithDescriptor:log server:v43];
                if (v20)
                {
                  long long v21 = [v43 volumeManager];
                  long long v22 = [log personaIdentifier];
                  v55[0] = MEMORY[0x1E4F143A8];
                  v55[1] = 3221225472;
                  v55[2] = __40__FPDProvider_onDiskProvidersForServer___block_invoke_71;
                  v55[3] = &unk_1E6A73508;
                  long long v20 = v20;
                  uint64_t v56 = v20;
                  [v21 enumerateLibrariesForPersona:v22 withBlock:v55];

                  long long v53 = 0u;
                  long long v54 = 0u;
                  long long v51 = 0u;
                  long long v52 = 0u;
                  uint64_t v23 = [(NSMutableDictionary *)v20->_domainsByID allValues];
                  uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v69 count:16];
                  if (v24)
                  {
                    uint64_t v25 = *(void *)v52;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v24; ++j)
                      {
                        if (*(void *)v52 != v25) {
                          objc_enumerationMutation(v23);
                        }
                        long long v27 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                        long long v28 = [v27 providerDomainID];
                        char v29 = [v50 containsObject:v28];

                        if (v29)
                        {

                          char v38 = fp_current_or_default_log();
                          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138543362;
                            uint64_t v72 = (uint64_t)v20;
                            _os_log_impl(&dword_1D744C000, v38, OS_LOG_TYPE_DEFAULT, "[NOTICE] Read provider %{public}@ from disk", buf, 0xCu);
                          }

                          [v42 addObject:v20];
                          goto LABEL_39;
                        }
                        uint64_t v30 = fp_current_or_default_log();
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                        {
                          [v27 providerDomainID];
                          objc_claimAutoreleasedReturnValue();
                          +[FPDProvider onDiskProvidersForServer:]();
                        }
                      }
                      uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v69 count:16];
                      if (v24) {
                        continue;
                      }
                      break;
                    }
                  }

                  uint64_t v31 = fp_current_or_default_log();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v72 = (uint64_t)v20;
                    _os_log_impl(&dword_1D744C000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] no root reachable for provider %@, skipping", buf, 0xCu);
                  }

LABEL_39:
                }
              }
              else
              {
                fp_current_or_default_log();
                long long v20 = (FPDProvider *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_DEFAULT))
                {
                  v37 = objc_msgSend(v12, "fp_shortDescription");
                  *(_DWORD *)buf = 138412546;
                  uint64_t v72 = (uint64_t)v37;
                  __int16 v73 = 2112;
                  id v74 = v44;
                  _os_log_impl(&dword_1D744C000, &v20->super, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't upack provider descriptor for %@: %@", buf, 0x16u);
                }
              }

              id v14 = v44;
            }
            else
            {
              fp_current_or_default_log();
              os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v36 = objc_msgSend(v12, "fp_shortDescription");
                *(_DWORD *)buf = 138412290;
                uint64_t v72 = (uint64_t)v36;
                _os_log_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't load data for %@", buf, 0xCu);
              }
            }

            __fp_leave_section_Notice();
          }
          else
          {
            id v32 = objc_msgSend(v11, "fp_fpfsProviderDomainID:skipTypeCheck:error:", 0, 1, 0);
            BOOL v33 = v32 == 0;

            if (v33)
            {
              uint64_t v34 = fp_current_or_default_log();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                id v35 = objc_msgSend(v11, "fp_shortDescription");
                *(_DWORD *)buf = 138543362;
                uint64_t v72 = (uint64_t)v35;
                _os_log_impl(&dword_1D744C000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] found directory with no domain plist in it: %{public}@", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v9);
  }

  __fp_leave_section_Notice();
  return v42;
}

uint64_t __40__FPDProvider_onDiskProvidersForServer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  uint64_t section = __fp_create_section();
  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v25 = section;
    __int16 v26 = 2114;
    id v27 = v17;
    _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Listing domains & providers in %{public}@", buf, 0x16u);
  }

  id v4 = *(void **)(a1 + 32);
  id v5 = [v17 syncRootsDirectory];
  id v6 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:1 errorHandler:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "fp_isFolder"))
        {
          uint64_t v12 = [*(id *)(a1 + 48) fpfsDomainURLIsRootOf:v11];
          char v13 = fp_current_or_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v14 = objc_msgSend(v12, "fp_obfuscatedProviderDomainID");
            int v15 = objc_msgSend(v11, "fp_shortDescription");
            *(_DWORD *)buf = 138412546;
            uint64_t v25 = (uint64_t)v14;
            __int16 v26 = 2112;
            id v27 = v15;
            _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] found domain xattr '%@' on %@", buf, 0x16u);
          }
          if (v12) {
            [*(id *)(a1 + 40) addObject:v12];
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  __fp_leave_section_Notice();
  return 1;
}

uint64_t __40__FPDProvider_onDiskProvidersForServer___block_invoke_71(uint64_t a1, uint64_t a2)
{
  id v2 = (id)[*(id *)(a1 + 32) importDomainsFromLibrary:a2 updatePlist:1];
  return 1;
}

- (void)writeAllDomainProperties
{
  id v3 = [(FPDProvider *)self server];
  id v4 = [v3 volumeManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__FPDProvider_writeAllDomainProperties__block_invoke;
  v5[3] = &unk_1E6A73508;
  v5[4] = self;
  [v4 enumerateLibrariesWithBlock:v5];
}

uint64_t __39__FPDProvider_writeAllDomainProperties__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)defaultNSDomain
{
  id v3 = objc_alloc(MEMORY[0x1E4F25DC0]);
  id v4 = (void *)[v3 initWithIdentifier:*MEMORY[0x1E4F25C00] displayName:&stru_1F2EC3618 pathRelativeToDocumentStorage:&stru_1F2EC3618];
  objc_msgSend(v4, "setHidden:", -[FPDProviderDescriptor defaultDomainVisible](self->_descriptor, "defaultDomainVisible") ^ 1);
  id v5 = [(FPDProviderDescriptor *)self->_descriptor personaIdentifier];
  [v4 setPersonaIdentifier:v5];

  return v4;
}

- (id)newDomainFromNSDomain:(id)a3 volume:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 pathRelativeToDocumentStorage];
  if ([v8 length])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = [(FPDProviderDescriptor *)self->_descriptor extensionStorageURLs];
    uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [(FPDProviderDescriptor *)self->_descriptor extensionStorageURLs];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v24 + 1) + 8 * i) URLByAppendingPathComponent:v8 isDirectory:1];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }
  }
  else
  {
    uint64_t v12 = [(FPDProviderDescriptor *)self->_descriptor extensionStorageURLs];
    uint64_t v11 = (void *)[v12 mutableCopy];
  }

  long long v18 = [FPDDomain alloc];
  long long v19 = [v6 identifier];
  long long v20 = [(FPDProvider *)self purposeIdentifier];
  long long v21 = [(FPDProvider *)self server];
  long long v22 = -[FPDDomain initWithIdentifier:nsDomain:extensionStorageURLs:purposeIdentifier:fpfsClass:provider:volume:](v18, "initWithIdentifier:nsDomain:extensionStorageURLs:purposeIdentifier:fpfsClass:provider:volume:", v19, v6, v11, v20, [v21 fpfsClass], self, v7);

  return v22;
}

- (void)_startOrClearDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
}

+ (id)defaultNSDomainForDescriptor:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F25DC0];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4F25C00] displayName:&stru_1F2EC3618 pathRelativeToDocumentStorage:&stru_1F2EC3618];
  objc_msgSend(v6, "setHidden:", objc_msgSend(v4, "defaultDomainVisible") ^ 1);
  id v7 = [v4 personaIdentifier];

  [v6 setPersonaIdentifier:v7];
  return v6;
}

+ (id)parseDomainProperties:(id)a3 descriptor:(id)a4 volume:(id)a5 replicatedByDefault:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v37 = (id)objc_opt_new();
  id v43 = v10;
  uint64_t v12 = [v10 identifier];
  int v44 = [v12 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"];

  uint64_t v36 = v11;
  if (v11)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v14 = objc_msgSend(v11, "root", v11);
    id v42 = [v13 fileURLWithPath:v14 isDirectory:1];
  }
  else
  {
    id v42 = 0;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v46;
    uint64_t v40 = *MEMORY[0x1E4F25C00];
    unsigned int v39 = v6;
    do
    {
      uint64_t v19 = 0;
      uint64_t v41 = v17;
      do
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v45 + 1) + 8 * v19);
        long long v21 = objc_msgSend(v15, "objectForKeyedSubscript:", v20, v36);
        if (v21)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v44 && [v20 hasPrefix:@"Ciconia-"])
            {
              long long v22 = fp_current_or_default_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] found leftover Ciconia domain - skipping", buf, 2u);
              }
            }
            else
            {
              long long v22 = [MEMORY[0x1E4F25DC0] domainFromPlistDictionary:v21 identifier:v20 volumeURL:v42 replicatedByDefault:v6];
              if (v22
                || [v20 isEqualToString:v40]
                && ([a1 defaultNSDomainForDescriptor:v43],
                    (long long v22 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                long long v24 = [v43 personaIdentifier];
                [v22 setPersonaIdentifier:v24];

                long long v25 = [v22 personaIdentifier];

                if (v25)
                {
                  long long v26 = (void *)MEMORY[0x1E4FB3710];
                  long long v27 = [v22 personaIdentifier];
                  uint64_t v28 = [v26 personaAttributesForPersonaUniqueString:v27];

                  if (v28)
                  {
                    -[NSObject setIsEnterpriseDomain:](v22, "setIsEnterpriseDomain:", [v28 isEnterprisePersona]);
                    -[NSObject setIsDataSeparatedDomain:](v22, "setIsDataSeparatedDomain:", [v28 isDataSeparatedPersona]);
                  }
                }
                uint64_t v29 = [v21 objectForKeyedSubscript:@"Enabled"];
                if (!v29)
                {
                  uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v43, "enabledByDefault"));
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  -[NSObject setUserEnabled:](v22, "setUserEnabled:", [v29 BOOLValue]);
                  uint64_t v30 = [v21 objectForKeyedSubscript:@"Connected"];
                  if (v30) {
                    uint64_t v31 = v30;
                  }
                  else {
                    uint64_t v31 = MEMORY[0x1E4F1CC28];
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v22 setEjectable:[v31 BOOLValue]];
                    id v32 = [v21 objectForKeyedSubscript:@"DomainUserInfo"];
                    uint64_t v17 = v41;
                    if (v32)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v22 setDomainUserInfo:v32];
                        goto LABEL_34;
                      }
                      uint64_t v34 = fp_current_or_default_log();
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        long long v52 = v22;
                        __int16 v53 = 2112;
                        long long v54 = v21;
                        _os_log_error_impl(&dword_1D744C000, v34, OS_LOG_TYPE_ERROR, "[ERROR] unhandled user info for domain %{public}@ of unknown type: %@", buf, 0x16u);
                      }
                    }
                    else
                    {
LABEL_34:
                      BOOL v33 = [v20 precomposedStringWithCanonicalMapping];
                      [v37 setObject:v22 forKeyedSubscript:v33];

                      uint64_t v34 = fp_current_or_default_log();
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        long long v52 = v22;
                        _os_log_impl(&dword_1D744C000, v34, OS_LOG_TYPE_INFO, "[INFO] loaded domain from plist %{public}@", buf, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    id v32 = fp_current_or_default_log();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      long long v52 = v22;
                      __int16 v53 = 2112;
                      long long v54 = v21;
                      _os_log_error_impl(&dword_1D744C000, v32, OS_LOG_TYPE_ERROR, "[ERROR] unhandled domain state %{public}@ of unknown type: %@", buf, 0x16u);
                    }
                    uint64_t v17 = v41;
                  }

                  uint64_t v6 = v39;
                }
                else
                {
                  uint64_t v31 = fp_current_or_default_log();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    long long v52 = v22;
                    __int16 v53 = 2114;
                    long long v54 = v21;
                    _os_log_error_impl(&dword_1D744C000, v31, OS_LOG_TYPE_ERROR, "[ERROR] unhandled domain state %{public}@ of unknown type: %{public}@", buf, 0x16u);
                  }
                  uint64_t v17 = v41;
                }

                goto LABEL_51;
              }
              long long v22 = fp_current_or_default_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                +[FPDProvider parseDomainProperties:descriptor:volume:replicatedByDefault:]((uint64_t)v49, (uint64_t)v20);
              }
            }
          }
          else
          {
            long long v22 = fp_current_or_default_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = objc_msgSend(v20, "fp_obfuscatedFilename");
              *(_DWORD *)buf = 138543618;
              long long v52 = v23;
              __int16 v53 = 2112;
              long long v54 = v21;
              _os_log_error_impl(&dword_1D744C000, v22, OS_LOG_TYPE_ERROR, "[ERROR] unhandled domain %{public}@ of unknown type: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          long long v22 = fp_current_or_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            +[FPDProvider parseDomainProperties:descriptor:volume:replicatedByDefault:]((uint64_t)v50, (uint64_t)v20);
          }
        }
LABEL_51:

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v17);
  }

  return v37;
}

- (id)importDomainsFromLibrary:(id)a3 updatePlist:(BOOL)a4
{
  BOOL v39 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v42 = v5;
  BOOL v7 = [v5 role] == 1 || objc_msgSend(v5, "role") == 2;
  if ([(FPDProviderDescriptor *)v6->_descriptor allowsExternalVolumes] || v7)
  {
    uint64_t v8 = [v42 systemDirectory];
    id v9 = [(FPDProvider *)v6 identifier];
    uint64_t v40 = [v8 URLByAppendingPathComponent:v9];

    uint64_t section = __fp_create_section();
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v35 = [(FPDProvider *)v6 identifier];
      uint64_t v36 = objc_msgSend(v40, "fp_shortDescription");
      *(_DWORD *)buf = 134218498;
      uint64_t v51 = section;
      __int16 v52 = 2114;
      __int16 v53 = v35;
      __int16 v54 = 2114;
      long long v55 = v36;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx loading domain list for %{public}@ from disk %{public}@", buf, 0x20u);
    }
    id v47 = 0;
    uint64_t v11 = [v42 readDomainsPropertiesUnderDirectoryAtURL:v40 error:&v47];
    id v37 = v47;
    uint64_t v41 = (void *)v11;
    if (!v11)
    {
      uint64_t v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v37, "fp_prettyDescription");
        objc_claimAutoreleasedReturnValue();
        -[FPDProvider importDomainsFromLibrary:updatePlist:]();
      }
    }
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = (void *)v11;
    if (!v11) {
      uint64_t v14 = objc_opt_new();
    }
    id v15 = objc_msgSend(v13, "parseDomainProperties:descriptor:volume:replicatedByDefault:", v14, v6->_descriptor, v42, 0, v37);
    if (!v11) {

    }
    uint64_t v16 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(v17);
          }
          long long v21 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          domainsByID = v6->_domainsByID;
          uint64_t v23 = [v21 precomposedStringWithCanonicalMapping];
          long long v24 = [(NSMutableDictionary *)domainsByID objectForKeyedSubscript:v23];

          if (v24)
          {
            long long v25 = fp_current_or_default_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              long long v26 = objc_msgSend(v21, "fp_obfuscatedFilename");
              *(_DWORD *)buf = 138543618;
              uint64_t v51 = (uint64_t)v26;
              __int16 v52 = 2114;
              __int16 v53 = v42;
              _os_log_error_impl(&dword_1D744C000, v25, OS_LOG_TYPE_ERROR, "[ERROR] Found domain %{public}@ on %{public}@, which is already known, ignoring", buf, 0x16u);
            }
          }
          else
          {
            long long v25 = [v17 objectForKeyedSubscript:v21];
            id v27 = [(FPDProvider *)v6 newDomainFromNSDomain:v25 volume:v42];
            objc_msgSend(v27, "setUserEnabled:", -[NSObject userEnabled](v25, "userEnabled"));
            objc_msgSend(v27, "setEjectable:", -[NSObject isEjectable](v25, "isEjectable"));
            uint64_t v28 = [v25 domainUserInfo];
            [v27 setDomainUserInfo:v28];

            uint64_t v29 = [v21 precomposedStringWithCanonicalMapping];
            [v16 setObject:v27 forKeyedSubscript:v29];
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v18);
    }

    if (!v6->_domainsByRootPath)
    {
      uint64_t v30 = objc_opt_new();
      domainsByRootPath = v6->_domainsByRootPath;
      v6->_domainsByRootPath = (NSMutableDictionary *)v30;
    }
    if (v6->_domainsByID) {
      [(NSMutableDictionary *)v6->_domainsByID addEntriesFromDictionary:v16];
    }
    else {
      objc_storeStrong((id *)&v6->_domainsByID, v16);
    }
    if ([v42 isDefaultVolumeForCurrentPersona]) {
      id v33 = [(FPDProvider *)v6 _recreateDefaultDomainIfNeededOnVolume:v42];
    }
    if (v39) {
      [(FPDProvider *)v6 _writeDomainPropertiesIntoLibrary:v42 ifChangedFrom:v41];
    }
    id v32 = [v16 allValues];

    __fp_leave_section_Debug();
  }
  else
  {
    id v32 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v6);

  return v32;
}

- (void)materializeRootForDomain:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && [v3 isUsingFPFS]
    && [v4 userEnabled]
    && ([v4 isHidden] & 1) == 0)
  {
    id v5 = [v4 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__FPDProvider_materializeRootForDomain___block_invoke;
    block[3] = &unk_1E6A73FE8;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __40__FPDProvider_materializeRootForDomain___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) invalidated])
  {
    id v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      long long v21 = v3;
      _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] [Mat] Tried to materialize invalidated domain %@", buf, 0xCu);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) defaultBackend];
    id v5 = [v4 rootURLs];
    uint64_t v6 = [v5 firstObject];

    id v7 = [*(id *)(a1 + 32) provider];
    uint64_t v8 = [v7 identifier];
    int v9 = objc_msgSend(v8, "fp_isiCloudDriveOrCloudDocsIdentifier");

    if (v9)
    {
      id v10 = @"com~apple~CloudDocs";
      uint64_t v11 = [v6 URLByAppendingPathComponent:@"com~apple~CloudDocs"];

      uint64_t v6 = (void *)v11;
    }
    else
    {
      id v10 = @"root";
    }
    uint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_msgSend(v6, "fp_shortDescription");
      *(_DWORD *)buf = 138412546;
      long long v21 = v10;
      __int16 v22 = 2114;
      uint64_t v23 = v13;
      _os_log_impl(&dword_1D744C000, v12, OS_LOG_TYPE_INFO, "[INFO] [Mat] Will try to materialize %@ %{public}@", buf, 0x16u);
    }
    uint64_t v14 = [*(id *)(a1 + 32) defaultBackend];
    id v15 = +[FPDRequest requestForSelf];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__FPDProvider_materializeRootForDomain___block_invoke_102;
    v17[3] = &unk_1E6A73C80;
    uint64_t v18 = v10;
    id v19 = v6;
    id v2 = v6;
    id v16 = (id)[v14 startProvidingItemAtURL:v2 readerID:@"materializeRootForDomain" readingOptions:0 request:v15 completionHandler:v17];
  }
}

void __40__FPDProvider_materializeRootForDomain___block_invoke_102(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    id v7 = objc_msgSend(v3, "fp_prettyDescription");
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_INFO, "[INFO] [Mat] Materialized %{public}@ %{public}@ with error: %@", (uint8_t *)&v8, 0x20u);
  }
}

id __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 knownFolder];
  id v3 = objc_msgSend(v2, "fp_shortDescription");

  return v3;
}

uint64_t __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_138(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNsDomainOrNilForDefault:*(void *)(a1 + 40)];
}

uint64_t __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_2_145(uint64_t result)
{
  if (!*(unsigned char *)(result + 48)) {
    return [*(id *)(result + 32) materializeRootForDomain:*(void *)(result + 40)];
  }
  return result;
}

- (void)removeAllDomainsForRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  domainQueue = self->_domainQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__FPDProvider_removeAllDomainsForRequest_completionHandler___block_invoke;
  v12[3] = &unk_1E6A73ED8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(domainQueue, v12);
}

void __60__FPDProvider_removeAllDomainsForRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v1 = (id)fpfs_adopt_log();
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) identifier];
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    long long v43 = v3;
    __int16 v44 = 2114;
    uint64_t v45 = v4;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] Removing all domains for %@ for %{public}@", buf, 0x16u);
  }
  uint64_t v5 = *(unsigned char **)(a1 + 32);
  if (v5[16])
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__FPDProvider_removeAllDomainsForRequest_completionHandler___block_invoke_cold_3(a1);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v34 = FPProviderXPCInvalidError();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v34);
  }
  else
  {
    id v8 = v5;
    objc_sync_enter(v8);
    uint64_t v34 = (void *)[*(id *)(*(void *)(a1 + 32) + 80) copy];
    objc_sync_exit(v8);

    if ([v34 count] == 1)
    {
      uint64_t v9 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F25C00]];
      BOOL v10 = v9 == 0;

      if (v10)
      {
        id v11 = [NSString stringWithFormat:@"[ASSERT] ‼️ Only domain expected to be the default domain"];
        __int16 v12 = fp_current_or_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          +[FPDVolume prettyNameForDomain:]();
        }

        __assert_rtn("-[FPDProvider removeAllDomainsForRequest:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProvider.m", 1414, (const char *)[v11 UTF8String]);
      }
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = [v34 allValues];
      int v13 = 0;
      uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v38;
        uint64_t v16 = *MEMORY[0x1E4F25C00];
        int v17 = 1;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            [v19 invalidateWithReason:@"removing all domains"];
            id v20 = (id)[v19 cleanupDomainWithMode:0];
            [v19 invalidateSession];
            long long v21 = [v19 identifier];
            char v22 = [v21 isEqualToString:v16];

            if ((v22 & 1) == 0)
            {
              v13 |= [v19 userEnabled];
              v17 &= [v19 isHiddenByUser];
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v14);
      }
      else
      {
        LOBYTE(v17) = 1;
      }

      id v23 = *(id *)(a1 + 32);
      objc_sync_enter(v23);
      uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 80) count];
      if (v24 != [v34 count])
      {
        id v32 = [NSString stringWithFormat:@"[ASSERT] ‼️ Unexpected number of domains to remove"];
        id v33 = fp_current_or_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          +[FPDVolume prettyNameForDomain:]();
        }

        __assert_rtn("-[FPDProvider removeAllDomainsForRequest:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProvider.m", 1440, (const char *)[v32 UTF8String]);
      }
      [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
      [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
      long long v25 = *(void **)(a1 + 32);
      long long v26 = [v25 server];
      id v27 = [v26 volumeManager];
      uint64_t v28 = [v27 defaultVolumeForCurrentPersona];
      uint64_t v29 = [v25 _recreateDefaultDomainIfNeededOnVolume:v28];

      if ([*(id *)(*(void *)(a1 + 32) + 32) canToggleDomainVisibility])
      {
        [v29 setUserEnabled:v13 & 1];
        [v29 setHiddenByUser:v17 & 1];
      }
      [v29 finishSetup];
      uint64_t v30 = *(void ***)(a1 + 32);
      if (v29)
      {
        addRootPathKeys(v30[11], v29);
        [*(id *)(a1 + 32) _startOrClearDomain:v29 userAllowedDBDrop:0 reason:@"domainCreation" completion:&__block_literal_global_159];
      }
      else
      {
        uint64_t v31 = [*(id *)(a1 + 32) defaultNSDomain];
        [v30 reloadDomain:v31 unableToStartup:0 startupError:0 completionHandler:&__block_literal_global_161];
      }
      [*(id *)(a1 + 32) writeAllDomainProperties];

      objc_sync_exit(v23);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)removeDomain:(id)a3 mode:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = [(FPDProvider *)self loggerForDomainWithIdentifier:v9];
  uint64_t v16 = fpfs_adopt_log();
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) identifier];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v37 = v3;
    __int16 v38 = 2112;
    long long v39 = v4;
    __int16 v40 = 2114;
    uint64_t v41 = v5;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] Removing domain %@ on extension %@ for %{public}@", buf, 0x20u);
  }
  if (!*(unsigned char *)(*(void *)(a1 + 40) + 16))
  {
    uint64_t v9 = *MEMORY[0x1E4F25C00];
    if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F25C00]])
    {
      uint64_t v10 = *(void *)(a1 + 56);
      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"Default domain cannot be removed");
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v8);
      goto LABEL_29;
    }
    id v11 = *(id *)(a1 + 40);
    objc_sync_enter(v11);
    id v8 = (void *)[*(id *)(*(void *)(a1 + 40) + 80) mutableCopy];
    __int16 v12 = (void *)[*(id *)(*(void *)(a1 + 40) + 88) mutableCopy];
    id v13 = [*(id *)(a1 + 32) precomposedStringWithCanonicalMapping];
    id v14 = [v8 objectForKeyedSubscript:v13];

    if (!v14)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      objc_sync_exit(v11);
LABEL_28:

      goto LABEL_29;
    }
    removeRootPathKeys(v12, v14);
    id v15 = [*(id *)(a1 + 32) precomposedStringWithCanonicalMapping];
    [v8 setObject:0 forKeyedSubscript:v15];

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 80), v8);
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 88), v12);
    uint64_t v16 = [v8 objectForKeyedSubscript:v9];
    if (v16 && [v8 count] == 1 || !objc_msgSend(v8, "count"))
    {
      uint64_t v17 = [v14 userEnabled];
      uint64_t v18 = [v14 isHiddenByUser];
      id v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke_cold_2(v17, v19);
      }
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
    }
    [v16 setUserEnabled:v17];
    [v16 setHiddenByUser:v18];
    id v20 = *(void **)(a1 + 40);
    long long v21 = [v20 server];
    char v22 = [v21 volumeManager];
    id v23 = [v22 defaultVolumeForCurrentPersona];
    uint64_t v24 = [v20 _recreateDefaultDomainIfNeededOnVolume:v23];

    [v24 finishSetup];
    long long v25 = *(void ***)(a1 + 40);
    if (v24)
    {
      addRootPathKeys(v25[11], v24);
      [*(id *)(a1 + 40) _startOrClearDomain:v24 userAllowedDBDrop:0 reason:@"domainCreation" completion:&__block_literal_global_174];
    }
    else
    {
      long long v26 = [*(id *)(a1 + 40) defaultNSDomain];
      [v25 reloadDomain:v26 unableToStartup:0 startupError:0 completionHandler:&__block_literal_global_176];
    }
    objc_sync_exit(v11);

    id v27 = [v14 rootURLs];
    if ([v27 count])
    {
      uint64_t v28 = [v14 rootURLs];
      uint64_t v29 = [v28 objectAtIndexedSubscript:0];
      char v30 = FPClearImportCookieForDomainURL();
      id v31 = 0;

      if (v30)
      {
LABEL_27:
        [v14 invalidateWithReason:@"removing domain"];
        id v32 = [v14 cleanupDomainWithMode:*(void *)(a1 + 72)];
        [v14 invalidateSession];
        id v33 = *(id *)(a1 + 40);
        objc_sync_enter(v33);
        uint64_t v34 = *(void **)(a1 + 40);
        id v35 = [v14 volume];
        [v34 _writeDomainPropertiesIntoLibrary:v35 ifChangedFrom:&unk_1F2EDBC88];

        objc_sync_exit(v33);
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

        id v11 = v31;
        goto LABEL_28;
      }
      id v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke_cold_1();
      }
    }
    else
    {
      id v31 = 0;
    }

    goto LABEL_27;
  }
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke_cold_3(a1);
  }

  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = FPProviderXPCInvalidError();
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
LABEL_29:
}

- (void)reloadDomain:(id)a3 unableToStartup:(BOOL)a4 startupError:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = self->_server;
  id v12 = a5;
  id v13 = a3;
  id v14 = +[FPDRequest requestForSelf];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__FPDProvider_reloadDomain_unableToStartup_startupError_completionHandler___block_invoke;
  v18[3] = &unk_1E6A75448;
  id v19 = v11;
  id v20 = v10;
  id v15 = v10;
  uint64_t v16 = v11;
  LOBYTE(v17) = 1;
  [(FPDProvider *)self addDomain:v13 byImportingDirectoryAtURL:0 knownFolders:MEMORY[0x1E4F1CBF0] userAllowedDBDrop:0 unableToStartup:v7 startupError:v12 reloadDomain:v17 request:v14 completionHandler:v18];
}

void __75__FPDProvider_reloadDomain_unableToStartup_startupError_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__FPDProvider_reloadDomain_unableToStartup_startupError_completionHandler___block_invoke_cold_1((uint64_t)v5, v6, v7);
    }
  }
  [*(id *)(a1 + 32) signalProviderChanges];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setEnabledOrHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 newValue:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a7;
  id v13 = [(FPDProvider *)self loggerForDomainWithIdentifier:v10];
  uint64_t v18 = fpfs_adopt_log();
  if ([(FPDProviderDescriptor *)self->_descriptor canToggleDomainVisibility])
  {
    id v14 = (void *)*MEMORY[0x1E4F25C00];
    if (v10) {
      id v14 = v10;
    }
    id v15 = v14;

    id v17 = v12;
    id v10 = v15;
    fp_dispatch_async_with_logs();
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v16);
  }
  __fp_pop_log();
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_cold_2(a1);
    }

    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = FPProviderXPCInvalidError();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }
  id v6 = v2;
  objc_sync_enter(v6);
  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 80);
  id v8 = [*(id *)(a1 + 40) precomposedStringWithCanonicalMapping];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  if (v9)
  {
    id v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    id v11 = *(void **)(*(void *)(a1 + 32) + 80);
    id v12 = [*(id *)(a1 + 40) precomposedStringWithCanonicalMapping];
    id v13 = [v11 objectForKeyedSubscript:v12];

    if (*(unsigned char *)(a1 + 64))
    {
      int v14 = [v13 userEnabled];
      int v15 = *(unsigned __int8 *)(a1 + 65);
      if (v15 != v14)
      {
        [v13 setUserEnabled:v15 != 0];
        BOOL v16 = *(unsigned char *)(a1 + 65) != 0;
        id v17 = fp_current_or_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v13;
          _os_log_impl(&dword_1D744C000, v17, OS_LOG_TYPE_INFO, "[INFO] reloading domain because userEnabled state changed for %@", (uint8_t *)&buf, 0xCu);
        }
LABEL_19:

        char v22 = *(void **)(a1 + 32);
        id v23 = [v13 volume];
        [v22 _writeDomainPropertiesIntoLibrary:v23 ifChangedFrom:0];

        char v21 = 1;
        goto LABEL_20;
      }
    }
    else
    {
      int v19 = [v13 isHiddenByUser];
      int v20 = *(unsigned __int8 *)(a1 + 65);
      if (v20 != v19)
      {
        [v13 setHiddenByUser:v20 != 0];
        id v17 = fp_current_or_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v13;
          _os_log_impl(&dword_1D744C000, v17, OS_LOG_TYPE_INFO, "[INFO] reloading domain because hiddenByUser state changed for %@", (uint8_t *)&buf, 0xCu);
        }
        BOOL v16 = 0;
        goto LABEL_19;
      }
    }
    BOOL v16 = 0;
    char v21 = 0;
LABEL_20:
    if ([v13 userEnabled]) {
      uint64_t v24 = [v13 isHiddenByUser] ^ 1;
    }
    else {
      uint64_t v24 = 0;
    }
    objc_sync_exit(v10);

    if (v16)
    {
      long long v25 = [v13 defaultBackend];
      char v26 = objc_opt_respondsToSelector();

      if (v26)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = [v27 initWithDomain:*MEMORY[0x1E4F25C08] code:-2011 userInfo:0];
        uint64_t v29 = [v13 defaultBackend];
        [v29 signalErrorResolved:v28 completionHandler:&__block_literal_global_193];
      }
      else
      {
        uint64_t v28 = fp_current_or_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_cold_1(v28);
        }
      }
    }
    if (v21)
    {
      char v30 = [v13 indexer];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v38 = 0x3032000000;
      long long v39 = __Block_byref_object_copy__9;
      __int16 v40 = __Block_byref_object_dispose__9;
      id v41 = 0;
      if (v30)
      {
        dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_194;
        v34[3] = &unk_1E6A754B8;
        p_long long buf = &buf;
        id v32 = v31;
        id v35 = v32;
        [v30 setIndexingEnabled:v24 completionHandler:v34];
        dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    return;
  }
  uint64_t v18 = *(void *)(a1 + 48);
  id v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:MEMORY[0x1E4F1CC08]];
  (*(void (**)(uint64_t))(v18 + 16))(v18);
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_191(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_191_cold_1();
    }
  }
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_194(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)setHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 request:(id)a5 completionHandler:(id)a6
{
}

- (void)enableAllDomainsIfNoUserElection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = dispatch_group_create();
  id v4 = self;
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSMutableDictionary *)v4->_domainsByID allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        dispatch_group_enter(v3);
        id v10 = [v9 identifier];
        id v11 = +[FPDRequest requestForSelf];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __47__FPDProvider_enableAllDomainsIfNoUserElection__block_invoke;
        v12[3] = &unk_1E6A73580;
        id v13 = v3;
        [(FPDProvider *)v4 setEnabled:1 forDomainIdentifier:v10 request:v11 completionHandler:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

void __47__FPDProvider_enableAllDomainsIfNoUserElection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_msgSend(v3, "fp_prettyDescription");
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] unhandled error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setEjectable:(BOOL)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(FPDProvider *)self loggerForDomainWithIdentifier:v8];
  long long v14 = fpfs_adopt_log();
  id v10 = (void *)*MEMORY[0x1E4F25C00];
  if (v8) {
    id v10 = v8;
  }
  id v11 = v10;

  id v13 = v7;
  id v12 = v11;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke_cold_2(a1);
    }

    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = FPProviderXPCInvalidError();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    int v6 = v2;
    objc_sync_enter(v6);
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke_cold_1(a1, v7);
    }

    id v8 = *(void **)(*(void *)(a1 + 32) + 80);
    uint64_t v9 = [*(id *)(a1 + 40) precomposedStringWithCanonicalMapping];
    id v10 = [v8 objectForKeyedSubscript:v9];

    [v10 setEjectable:*(unsigned __int8 *)(a1 + 64)];
    id v11 = *(void **)(a1 + 32);
    id v12 = [v10 volume];
    [v11 _writeDomainPropertiesIntoLibrary:v12 ifChangedFrom:0];

    objc_sync_exit(v6);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)setDomainUserInfo:(id)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(FPDProvider *)self loggerForDomainWithIdentifier:v10];
  long long v17 = fpfs_adopt_log();
  id v12 = (void *)*MEMORY[0x1E4F25C00];
  if (v10) {
    id v12 = v10;
  }
  id v13 = v12;

  id v16 = v9;
  id v14 = v13;
  id v15 = v8;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke_cold_2(a1);
    }

    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = FPProviderXPCInvalidError();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    int v6 = v2;
    objc_sync_enter(v6);
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke_cold_1();
    }

    id v8 = *(void **)(*(void *)(a1 + 32) + 80);
    id v9 = [*(id *)(a1 + 40) precomposedStringWithCanonicalMapping];
    id v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      [v10 setDomainUserInfo:*(void *)(a1 + 48)];
      id v11 = *(void **)(a1 + 32);
      id v12 = [v10 volume];
      [v11 _writeDomainPropertiesIntoLibrary:v12 ifChangedFrom:0];
    }
    objc_sync_exit(v6);

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)setReplicatedKnownFolders:(unint64_t)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(FPDProvider *)self loggerForDomainWithIdentifier:v8];
  id v14 = fpfs_adopt_log();
  id v10 = (void *)*MEMORY[0x1E4F25C00];
  if (v8) {
    id v10 = v8;
  }
  id v11 = v10;

  id v13 = v7;
  id v12 = v11;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke_cold_2(a1);
    }

    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = FPProviderXPCInvalidError();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    int v6 = v2;
    objc_sync_enter(v6);
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke_cold_1();
    }

    id v8 = *(void **)(*(void *)(a1 + 32) + 80);
    id v9 = [*(id *)(a1 + 40) precomposedStringWithCanonicalMapping];
    id v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      id v11 = [v10 nsDomain];
      uint64_t v12 = [v11 replicatedKnownFolders];
      uint64_t v13 = *(void *)(a1 + 64);

      if (v12 != v13)
      {
        uint64_t v14 = *(void *)(a1 + 64);
        id v15 = [v10 nsDomain];
        [v15 setReplicatedKnownFolders:v14];

        id v16 = *(void **)(a1 + 32);
        long long v17 = [v10 volume];
        [v16 _writeDomainPropertiesIntoLibrary:v17 ifChangedFrom:0];
      }
    }

    objc_sync_exit(v6);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)dumpValue:(id)a3 forKey:(id)a4 to:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = (__CFString *)a3;
  id v8 = a5;
  id v9 = [a4 stringByAppendingString:@":"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v7;
      [v8 write:@"  + %@ (%lu)\n", v9, -[__CFString count](v10, "count")];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = v10;
      uint64_t v12 = [(__CFString *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v17 = objc_msgSend(v16, "fp_shortDescription");
              [v8 write:@"    - %@\n", v17];
            }
            else
            {
              [v8 write:@"    - %@\n", v16];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [(__CFString *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_19;
      }
      id v11 = [(__CFString *)v7 fp_shortDescription];
      [v8 write:@"  + %-25@ %@\n", v9, v11];
    }

    goto LABEL_22;
  }
  if (![(__CFString *)v7 count])
  {
    objc_msgSend(v8, "write:", @"  + %-25@ {}\n", v9, v19);
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v18 = @"none";
  if (v7) {
    uint64_t v18 = v7;
  }
  [v8 write:@"  + %-25@ %@\n", v9, v18];
LABEL_22:
}

+ (id)getXattr:(const char *)a3 at:(const char *)a4
{
  ssize_t v6 = getxattr(a4, a3, 0, 0, 0, 1);
  if (v6 < 1)
  {
    id v10 = &stru_1F2EC3618;
  }
  else
  {
    size_t v7 = v6;
    id v8 = malloc_type_malloc(v6, 0x4DA14440uLL);
    ssize_t v9 = getxattr(a4, a3, v8, v7, 0, 1);
    if (v9 < 1) {
      id v10 = &stru_1F2EC3618;
    }
    else {
      id v10 = (__CFString *)[[NSString alloc] initWithBytes:v8 length:v9 encoding:4];
    }
    free(v8);
  }
  return v10;
}

+ (void)dumpXattrsForItemAtURL:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v17 = v5;
  size_t v7 = (const char *)[v17 fileSystemRepresentation];
  ssize_t v8 = listxattr(v7, 0, 0, 0);
  if (v8 >= 1)
  {
    size_t v9 = v8;
    id v10 = (char *)malloc_type_malloc(v8, 0xCCE9C79FuLL);
    ssize_t v11 = listxattr(v7, v10, v9, 0);
    if (v11 >= 1)
    {
      ssize_t v12 = v11;
      uint64_t v13 = [v17 lastPathComponent];
      [v6 write:@"%@\n", v13];

      uint64_t v14 = &v10[v12];
      uint64_t v15 = v10;
      do
      {
        id v16 = +[FPDProvider getXattr:v15 at:v7];
        [v6 write:@"    %s: %@\n", v15, v16];

        v15 += strnlen(v15, v14 - v15) + 1;
      }
      while (v15 < v14);
    }
    free(v10);
  }
}

- (void)dumpXattrsForDomains:(id)a3 dumper:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 write:@"== CloudStorage xattrs ==\n"];
  [v6 write:@"=========================\n"];
  size_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_cloudStorageDirectory");
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v5;
  uint64_t v29 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v45;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(obj);
        }
        size_t v9 = [(FPDProvider *)self providerDomainForDomain:*(void *)(*((void *)&v44 + 1) + 8 * v8)];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v10 = [v9 storageURLs];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v41;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v41 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v14), "fp_commonDirectDescendantOf:", v7);
              if (v15) {
                +[FPDProvider dumpXattrsForItemAtURL:v15 to:v6];
              }

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v29);
  }

  [v6 write:@"\n"];
  [v6 write:@"== FileProvider xattrs ==\n"];
  [v6 write:@"=========================\n"];
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_supportDirectory");
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obja = obj;
  uint64_t v30 = [obja countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v37;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obja);
        }
        id v17 = [(FPDProvider *)self providerDomainForDomain:*(void *)(*((void *)&v36 + 1) + 8 * v16)];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v18 = [v17 storageURLs];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v48 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v33;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v33 != v21) {
                objc_enumerationMutation(v18);
              }
              long long v23 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v22), "fp_commonDirectDescendantOf:", v7);
              if (v23) {
                +[FPDProvider dumpXattrsForItemAtURL:v23 to:v6];
              }

              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v48 count:16];
          }
          while (v20);
        }

        ++v16;
      }
      while (v16 != v30);
      uint64_t v30 = [obja countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v30);
  }

  [v6 write:@"\n"];
}

+ (void)dumpXattrsForSyncRootDirectoryOfVolume:(id)a3 dumper:(id)a4
{
  id v6 = a4;
  id v7 = [a3 syncRootsDirectory];
  [a1 dumpXattrsForContentsOfDirectoryAtURL:v7 dumper:v6];
}

+ (void)dumpXattrsForSystemDirectoryOfVolume:(id)a3 dumper:(id)a4
{
  id v6 = a4;
  id v7 = [a3 systemDirectory];
  [a1 dumpXattrsForContentsOfDirectoryAtURL:v7 dumper:v6];
}

+ (void)dumpXattrsForContentsOfDirectoryAtURL:(id)a3 dumper:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 lastPathComponent];
    [v6 write:@"== %@ xattrs ==\n", v7];

    [v6 write:@"=========================\n"];
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    size_t v9 = [MEMORY[0x1E4F1C978] array];
    id v19 = v5;
    id v10 = [v8 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v9 options:0 error:0];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v17 = [v16 lastPathComponent];
          char v18 = [v17 isEqualToString:@".DS_Store"];

          if ((v18 & 1) == 0) {
            +[FPDProvider dumpXattrsForItemAtURL:v16 to:v6];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v6 write:@"\n"];
    id v5 = v19;
  }
}

- (void)checkTCCAccessForDomainID:(id)a3 auditToken:(id *)a4 completionHandler:(id)a5
{
}

- (void)dumpDomain:(id)a3 allowedToDump:(BOOL)a4 dumper:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  if (a4) {
    [a3 dumpStateTo:a5 options:a6 request:a7 completionHandler:a8];
  }
  else {
    (*((void (**)(id, void))a8 + 2))(a8, 0);
  }
}

- (void)dumpAllDomains:(id)a3 domains:(id)a4 auditToken:(id *)a5 request:(id)a6 providerFilter:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(void))a9;
  if ([v16 count])
  {
    uint64_t v30 = v18;
    [v16 firstObject];
    long long v21 = v20 = a8;
    [v16 removeObjectAtIndex:0];
    long long v22 = NSString;
    long long v23 = [(FPDProvider *)self identifier];
    [v21 identifier];
    v24 = dispatch_semaphore_t v31 = v17;
    uint64_t v25 = objc_msgSend(v22, "fp_providerDomainIDFromProviderID:domainIdentifier:", v23, v24);

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __98__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_options_completionHandler___block_invoke;
    v33[3] = &unk_1E6A75580;
    id v34 = v25;
    long long v35 = self;
    id v36 = v21;
    id v37 = v15;
    unint64_t v42 = v20;
    id v38 = v31;
    id v39 = v16;
    long long v26 = *(_OWORD *)&a5->var0[4];
    long long v43 = *(_OWORD *)a5->var0;
    long long v44 = v26;
    id v18 = v30;
    id v40 = v30;
    long long v41 = v19;
    long long v27 = *(_OWORD *)&a5->var0[4];
    v32[0] = *(_OWORD *)a5->var0;
    v32[1] = v27;
    id v28 = v21;
    id v29 = v25;
    [(FPDProvider *)self checkTCCAccessForDomainID:v29 auditToken:v32 completionHandler:v33];

    id v17 = v31;
  }
  else
  {
    v19[2](v19);
  }
}

void __98__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __98__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_options_completionHandler___block_invoke_cold_1(a1, v5, v6);
    }
  }
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 96);
  id v10 = *(void **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_options_completionHandler___block_invoke_238;
  v16[3] = &unk_1E6A75558;
  v16[4] = v7;
  id v17 = v10;
  id v18 = *(id *)(a1 + 72);
  long long v12 = *(_OWORD *)(a1 + 120);
  long long v23 = *(_OWORD *)(a1 + 104);
  long long v24 = v12;
  id v19 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 80);
  id v15 = *(void **)(a1 + 88);
  uint64_t v14 = *(void *)(a1 + 96);
  id v20 = v13;
  uint64_t v22 = v14;
  id v21 = v15;
  [v7 dumpDomain:v8 allowedToDump:a2 dumper:v17 options:v9 request:v11 completionHandler:v16];
}

uint64_t __98__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_options_completionHandler___block_invoke_238(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 104);
  v10[0] = *(_OWORD *)(a1 + 88);
  v10[1] = v8;
  return [v2 dumpAllDomains:v1 domains:v3 auditToken:v10 request:v4 providerFilter:v7 options:v5 completionHandler:v6];
}

- (id)_domainsWithFilter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(FPDProvider *)v5 domainsByID];
  uint64_t v7 = [v6 allValues];
  long long v8 = (void *)[v7 copy];

  objc_sync_exit(v5);
  if ([v4 length])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __34__FPDProvider__domainsWithFilter___block_invoke;
    v11[3] = &unk_1E6A755A8;
    id v12 = v4;
    uint64_t v9 = objc_msgSend(v8, "fp_filter:", v11);

    long long v8 = (void *)v9;
  }

  return v8;
}

uint64_t __34__FPDProvider__domainsWithFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 providerDomainID];
  if ([v4 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 nsDomain];
    uint64_t v7 = [v6 displayName];
    uint64_t v5 = [v7 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];
  }
  return v5;
}

- (void)dumpStateTo:(id)a3 auditToken:(id *)a4 request:(id)a5 providerFilter:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(void))a8;
  id v18 = v16;
  id v19 = v17;
  id v20 = [(FPDProvider *)self _domainsWithFilter:v18];
  if ([v20 count])
  {
    unint64_t v47 = a7;
    [v14 write:@"=====================================================\n"];
    [(FPDProvider *)self identifier];
    v21 = long long v46 = a4;
    [v14 write:@"%@\n", v21];

    [v14 write:@"=====================================================\n"];
    uint64_t v22 = [(FPDProvider *)self descriptor];
    long long v23 = [v22 extensionPointVersion];
    [(FPDProvider *)self dumpValue:v23 forKey:@"version" to:v14];

    id v48 = v15;
    long long v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "isAvailableSystemWide"));
    [(FPDProvider *)self dumpValue:v24 forKey:@"available system wide" to:v14];

    uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "supportsEnumeration"));
    [(FPDProvider *)self dumpValue:v25 forKey:@"supports enumeration" to:v14];

    long long v26 = objc_msgSend(NSNumber, "numberWithBool:", -[FPDProvider supportsFPFS](self, "supportsFPFS"));
    [(FPDProvider *)self dumpValue:v26 forKey:@"supports FPFS" to:v14];

    long long v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "readonly"));
    [(FPDProvider *)self dumpValue:v27 forKey:@"read-only" to:v14];

    id v28 = [(FPDProvider *)self extensionStorageURLs];
    [(FPDProvider *)self dumpValue:v28 forKey:@"extension storage URLs" to:v14];

    id v29 = [(FPDProvider *)self purposeIdentifier];
    [(FPDProvider *)self dumpValue:v29 forKey:@"file coordination purpose ID" to:v14];

    uint64_t v30 = [v22 localizedName];
    [(FPDProvider *)self dumpValue:v30 forKey:@"display name" to:v14];

    dispatch_semaphore_t v31 = [v22 extensionBundleURL];
    [(FPDProvider *)self dumpValue:v31 forKey:@"bundle URL" to:v14];

    long long v32 = [v22 topLevelBundleIdentifier];
    [(FPDProvider *)self dumpValue:v32 forKey:@"containing bundle identifier" to:v14];

    long long v33 = [v22 personaIdentifier];
    [(FPDProvider *)self dumpValue:v33 forKey:@"persona" to:v14];

    id v34 = [v22 documentGroupName];
    [(FPDProvider *)self dumpValue:v34 forKey:@"document group name" to:v14];

    long long v35 = [v22 supportedFileTypes];
    [(FPDProvider *)self dumpValue:v35 forKey:@"supported file types" to:v14];

    id v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "usesUniqueItemIdentifiersAcrossDevices"));
    [(FPDProvider *)self dumpValue:v36 forKey:@"uses unique item identifiers across devices" to:v14];

    id v37 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "appliesChangesAtomically"));
    [(FPDProvider *)self dumpValue:v37 forKey:@"applies changes atomically" to:v14];

    id v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "disallowedByMDM"));
    [(FPDProvider *)self dumpValue:v38 forKey:@"disallowed by MDM" to:v14];

    id v39 = [(FPDProvider *)self manager];
    long long v45 = [v39 pushConnection];

    id v40 = [v22 topLevelBundleIdentifier];
    long long v44 = [v45 _debugTopicsForApplicationIdentifier:v40];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __87__FPDProvider_dumpStateTo_auditToken_request_providerFilter_options_completionHandler___block_invoke;
    v56[3] = &unk_1E6A755D0;
    v56[4] = self;
    id v41 = v14;
    id v57 = v41;
    [v44 enumerateKeysAndObjectsUsingBlock:v56];
    [v41 write:@"\n"];
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v42 addObjectsFromArray:v20];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __87__FPDProvider_dumpStateTo_auditToken_request_providerFilter_options_completionHandler___block_invoke_2;
    v50[3] = &unk_1E6A73DC0;
    id v51 = v41;
    id v52 = v18;
    __int16 v53 = self;
    id v54 = v20;
    long long v55 = v19;
    long long v43 = *(_OWORD *)&v46->var0[4];
    v49[0] = *(_OWORD *)v46->var0;
    v49[1] = v43;
    id v15 = v48;
    [(FPDProvider *)self dumpAllDomains:v51 domains:v42 auditToken:v49 request:v48 providerFilter:v52 options:v47 completionHandler:v50];
  }
  else
  {
    v19[2](v19);
  }
}

void __87__FPDProvider_dumpStateTo_auditToken_request_providerFilter_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = NSString;
  id v7 = a3;
  id v8 = [v6 stringWithFormat:@"push topics (%@)", a2];
  [v5 dumpValue:v7 forKey:v8 to:*(void *)(a1 + 40)];
}

uint64_t __87__FPDProvider_dumpStateTo_auditToken_request_providerFilter_options_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) write:@"\n"];
  if ([*(id *)(a1 + 40) length]) {
    [*(id *)(a1 + 48) dumpXattrsForDomains:*(void *)(a1 + 56) dumper:*(void *)(a1 + 32)];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

- (void)fetchTelemetryReportForAllDomains:(id)a3 resultDictionary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v11 = [v8 firstObject];
    [v8 removeObjectAtIndex:0];
    id v12 = [v11 defaultBackend];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = [v11 defaultBackend];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __84__FPDProvider_fetchTelemetryReportForAllDomains_resultDictionary_completionHandler___block_invoke;
      v15[3] = &unk_1E6A755F8;
      id v16 = v9;
      id v17 = v11;
      id v18 = self;
      id v19 = v8;
      id v20 = v10;
      [v14 fetchTelemetryReportWithCompletionHandler:v15];
    }
    else
    {
      [(FPDProvider *)self fetchTelemetryReportForAllDomains:v8 resultDictionary:v9 completionHandler:v10];
    }
  }
  else
  {
    (*((void (**)(id, id, void))v10 + 2))(v10, v9, 0);
  }
}

void __84__FPDProvider_fetchTelemetryReportForAllDomains_resultDictionary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) identifier];
  if (v6) {
    id v5 = v6;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }
  [v3 setObject:v5 forKeyedSubscript:v4];

  [*(id *)(a1 + 48) fetchTelemetryReportForAllDomains:*(void *)(a1 + 56) resultDictionary:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 64)];
}

- (void)fetchTelemetryReportWithProviderFilter:(id)a3 completionHandler:(id)a4
{
  id v9 = a4;
  id v6 = [(FPDProvider *)self _domainsWithFilter:a3];
  if ([v6 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v7 addObjectsFromArray:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(FPDProvider *)self fetchTelemetryReportForAllDomains:v7 resultDictionary:v8 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CC08], 0);
  }
}

+ (void)_garbageCollectFoldersWithNoRelatedDomain:(id)a3 supportDir:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v22 = v5;
  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  long long v23 = v6;
  id v8 = [v6 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:1 errorHandler:0];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    uint64_t v13 = *MEMORY[0x1E4F1C628];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        id v25 = 0;
        [v15 getResourceValue:&v25 forKey:v13 error:0];
        id v16 = v25;
        if ([v16 BOOLValue])
        {
          id v17 = objc_msgSend(v15, "fp_fpfsProviderDomainID:skipTypeCheck:error:", 0, 1, 0);
          if ([v17 length])
          {
            id v18 = [v17 componentsSeparatedByString:@"/"];
            id v19 = [v18 objectAtIndex:0];

            if (([v24 containsObject:v19] & 1) == 0)
            {
              id v20 = fp_current_or_default_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                +[FPDProvider _garbageCollectFoldersWithNoRelatedDomain:supportDir:]((uint64_t)v30, (uint64_t)v15);
              }

              id v21 = [v15 path];
              [v23 removeItemAtPath:v21 error:0];
            }
          }
        }
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }
}

- (OS_dispatch_queue)presentersQueue
{
  return self->_presentersQueue;
}

- (NSSet)blockedProcessNames
{
  return self->_blockedProcessNames;
}

- (void)setBlockedProcessNames:(id)a3
{
}

- (NSURL)supportURL
{
  return self->_supportURL;
}

- (NSURL)providerPlistURL
{
  return self->_providerPlistURL;
}

- (FPDServer)server
{
  return self->_server;
}

- (NSMutableDictionary)domainsByID
{
  return self->_domainsByID;
}

- (NSMutableDictionary)domainsByRootPath
{
  return self->_domainsByRootPath;
}

- (NSArray)requestedExtendedAttributes
{
  return self->_requestedExtendedAttributes;
}

- (void)setRequestedExtendedAttributes:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestedExtendedAttributes, 0);
  objc_storeStrong((id *)&self->_domainsByRootPath, 0);
  objc_storeStrong((id *)&self->_domainsByID, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_providerPlistURL, 0);
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_blockedProcessNames, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_presentersQueue, 0);
  objc_storeStrong((id *)&self->_domainQueue, 0);
}

- (void)initWithDescriptor:(uint64_t)a3 server:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6_0((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v6, v4, "[ERROR] Can't adopt persona %@: %@", v5);
}

+ (void)onDiskProvidersForServer:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  _DWORD *v1 = 138412290;
  *id v3 = v2;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v5, (uint64_t)v3, "[DEBUG] no root reachable for domain %@", v4);
}

- (void)_recreateDefaultDomainIfNeededOnVolume:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v3, (uint64_t)v3, "[DEBUG] creating default domain for %@", v4);
}

- (void)_recreateDefaultDomainIfNeededOnVolume:.cold.2()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v3, (uint64_t)v3, "[DEBUG] exposing default domain for %@", v4);
}

- (void)_recreateDefaultDomainIfNeededOnVolume:.cold.3()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v3, (uint64_t)v3, "[DEBUG] hiding default domain for %@", v4);
}

+ (void)parseDomainProperties:(uint64_t)a1 descriptor:(uint64_t)a2 volume:replicatedByDefault:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_6_1(a1, a2), "fp_obfuscatedFilename");
  *id v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_13_1(&dword_1D744C000, v5, v6, "[ERROR] unhandled domain %{public}@ with missing properties");
}

+ (void)parseDomainProperties:(uint64_t)a1 descriptor:(uint64_t)a2 volume:replicatedByDefault:.cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_6_1(a1, a2), "fp_obfuscatedFilename");
  *id v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_13_1(&dword_1D744C000, v5, v6, "[ERROR] cannot parse nsDomain for domain %{public}@");
}

- (void)importDomainsFromLibrary:updatePlist:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v3, (uint64_t)v3, "[ERROR] could not load the domain properties: %{public}@", v4);
}

void __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_18(&dword_1D744C000, v0, v1, "[ERROR] failed to clear import cookie for domain %@: %@");
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] Cannot use the default domain for the FPFS", v1, 2u);
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] Can't add domain %@ with external identifier to a default volume", v2);
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_3(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v6, v4, "[ERROR] Unable to resolve library to setup domain at path %@: %@", v5);
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_18(&dword_1D744C000, v0, v1, "[ERROR] Can't add domain %@ on non-default volume %@: not supported");
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] domain %@ already exists", v2, v3, v4, v5, v6);
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  LODWORD(v0) = *(unsigned __int8 *)(v0 + 24);
  int v2 = *(unsigned __int8 *)(*(void *)v1 + 24);
  v4[0] = 67109376;
  v4[1] = v0;
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_debug_impl(&dword_1D744C000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] inheriting userEnable=%{BOOL}d hiddenByUser=%{BOOL}d from default domain", (uint8_t *)v4, 0xEu);
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_7(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 88));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] %@ called on already invalidated provider", v4, v5, v6, v7, v8);
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_116_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] creating domain as userEnabled because the provider already has one enabled domain: %@", v2, v3, v4, v5, v6);
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_118_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] creating domain as not hiddenByUser because the provider already has one visible domain: %@", v2, v3, v4, v5, v6);
}

void __60__FPDProvider_removeAllDomainsForRequest_completionHandler___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_14_0(a1);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v3, v4, "[ERROR] %@ called on already invalidated provider", v5, v6, v7, v8, v9);
}

void __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke_cold_2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] removing last domain, marking defaultDomain as userEnabled=%{BOOL}d", (uint8_t *)v2, 8u);
}

void __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 64));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] %@ called on already invalidated provider", v4, v5, v6, v7, v8);
}

void __75__FPDProvider_reloadDomain_unableToStartup_startupError_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, a3, v6, "[ERROR] reactivation of domain %@ failed: %@", (uint8_t *)&v7);
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Not signaling domainDisabled as resolved, the backend does not respond", v1, 2u);
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_14_0(a1);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v3, v4, "[ERROR] %@ called on already invalidated provider", v5, v6, v7, v8, v9);
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_191_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] error signaling error resolved during domain enablement transition: %@", v2);
}

void __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = 67109378;
  v4[1] = v2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] setting ejectable=%{BOOL}d for domain %@", (uint8_t *)v4, 0x12u);
}

void __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_14_0(a1);
  int v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v3, v4, "[ERROR] %@ called on already invalidated provider", v5, v6, v7, v8, v9);
}

void __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] setting domainUserInfo for domain %@", v2, v3, v4, v5, v6);
}

void __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 64));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] %@ called on already invalidated provider", v4, v5, v6, v7, v8);
}

void __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] setting replicatedKnownFolders for domain %@", v2, v3, v4, v5, v6);
}

void __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_14_0(a1);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v3, v4, "[ERROR] %@ called on already invalidated provider", v5, v6, v7, v8, v9);
}

void __98__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_options_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "fp_obfuscatedProviderDomainID");
  uint64_t v6 = objc_msgSend(a2, "fp_prettyDescription");
  int v8 = 138543618;
  uint8_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, a3, v7, "[ERROR] TCC access check failed for domain %{public}@ error: %@", (uint8_t *)&v8);
}

+ (void)_garbageCollectFoldersWithNoRelatedDomain:(uint64_t)a1 supportDir:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_6_1(a1, a2), "path");
  *(_DWORD *)uint64_t v4 = 138412290;
  *uint64_t v3 = v5;
  _os_log_debug_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] No provider for %@, deleting directory", v4, 0xCu);
}

@end