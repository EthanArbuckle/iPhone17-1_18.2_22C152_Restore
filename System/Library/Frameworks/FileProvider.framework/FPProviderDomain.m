@interface FPProviderDomain
+ (BOOL)hasProviderDomainAccess;
+ (BOOL)supportsSecureCoding;
+ (FPProviderDomain)providerDomainWithID:(id)a3 allowCached:(BOOL)a4 completionHandler:(id)a5;
+ (FPProviderDomain)providerDomainWithID:(id)a3 allowCached:(BOOL)a4 error:(id *)a5;
+ (FPProviderDomain)providerDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5;
+ (FPProviderDomain)providerDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
+ (FPProviderDomain)providerDomainWithID:(id)a3 error:(id *)a4;
+ (id)__providerDomainForItemBuggyNullability:(id)a3 error:(id *)a4;
+ (id)__providerDomainWithIDBuggyNullability:(id)a3 allowCached:(BOOL)a4 error:(id *)a5;
+ (id)__providerDomainWithIDBuggyNullability:(id)a3 error:(id *)a4;
+ (id)_generateDomainIDFromDSID:(id)a3;
+ (id)beginMonitoringProviderDomainChangesWithHandler:(id)a3;
+ (id)cachedProviderDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
+ (id)mainICloudDriveDomainID;
+ (id)projectedFPFSMainICloudDriveDomainID;
+ (id)providerDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
+ (id)providerDomainForItem:(id)a3 error:(id *)a4;
+ (id)providerDomainForURL:(id)a3 error:(id *)a4;
+ (id)providerDomainsWithError:(id *)a3;
+ (id)rootURLForProviderDomainID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
+ (void)_t_discardCache;
+ (void)accumulatedSizeOfItemsInDomain:(id)a3 completion:(id)a4;
+ (void)accumulatedSizeOfPinnedItemsInDomain:(id)a3 completion:(id)a4;
+ (void)endMonitoringProviderDomainChanges:(id)a3;
+ (void)fetchProviderDomainForItem:(id)a3 allowCached:(BOOL)a4 completionHandler:(id)a5;
+ (void)fetchProviderDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5;
+ (void)fetchProviderDomainForItem:(id)a3 completionHandler:(id)a4;
+ (void)fetchProviderDomainWithID:(id)a3 completionHandler:(id)a4;
+ (void)removeDomainAndPreserveDataWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5;
+ (void)removeDomainWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5;
+ (void)selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5;
- (BOOL)allowsContextualMenuDownloadEntry;
- (BOOL)allowsSystemDeleteAlerts;
- (BOOL)allowsUserControlledEviction;
- (BOOL)appliesChangesAtomically;
- (BOOL)backgroundActivityIsPaused;
- (BOOL)canDisable;
- (BOOL)canDisconnect;
- (BOOL)containsPhotos;
- (BOOL)isAvailableSystemWide;
- (BOOL)isConnectedToAppExtension;
- (BOOL)isDataSeparatedDomain;
- (BOOL)isDefaultDomain;
- (BOOL)isEjectable;
- (BOOL)isEmpty;
- (BOOL)isEnabled;
- (BOOL)isEnterpriseDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isErasable;
- (BOOL)isFPFSiCloudDriveProvider;
- (BOOL)isFruitBasketProvider;
- (BOOL)isHidden;
- (BOOL)isHiddenByProvider;
- (BOOL)isHiddenByUser;
- (BOOL)isIndexed;
- (BOOL)isMainiCloudDriveDomain;
- (BOOL)isReadOnly;
- (BOOL)isUsingFPFS;
- (BOOL)isiCloudDriveProvider;
- (BOOL)needsAuthentication;
- (BOOL)owningApplicationIsHidden;
- (BOOL)shouldHideDomainDisplayName;
- (BOOL)shouldHideExtensionName;
- (BOOL)storageURLsAreInTransientState;
- (BOOL)supportsEnumeration;
- (BOOL)supportsPickingFolders;
- (BOOL)supportsRemoteVersions;
- (BOOL)supportsSearch;
- (BOOL)supportsSyncingTrash;
- (BOOL)usesDSCopyEngine;
- (BOOL)usesUniqueItemIdentifiersAcrossDevices;
- (FPProviderDomain)init;
- (FPProviderDomain)initWithCoder:(id)a3;
- (FPProviderDomain)initWithProviderID:(id)a3 domain:(id)a4;
- (NSArray)storageURLs;
- (NSArray)supportedFileTypes;
- (NSArray)supportedSearchFilters;
- (NSDictionary)domainUserInfo;
- (NSError)error;
- (NSFileProviderDomain)domain;
- (NSFileProviderManager)manager;
- (NSProgress)progress;
- (NSString)disconnectionReason;
- (NSString)domainDisplayName;
- (NSString)domainFullDisplayName;
- (NSString)extensionBundleIdentifier;
- (NSString)iCloudAccountIdentifier;
- (NSString)identifier;
- (NSString)localizedDisconnectionBannerText;
- (NSString)personaIdentifier;
- (NSString)providerDisplayName;
- (NSString)providerID;
- (NSString)purposeIdentifier;
- (NSString)spotlightMountPoint;
- (NSString)topLevelBundleIdentifier;
- (NSString)version;
- (NSURL)extensionBundleURL;
- (NSURL)topLevelBundleURL;
- (id)description;
- (id)storageURL;
- (int64_t)errorGenerationCount;
- (unint64_t)disconnectionState;
- (unint64_t)hash;
- (unint64_t)replicatedKnownFolders;
- (unint64_t)supportedKnownFolders;
- (unint64_t)testingModes;
- (void)domainFullDisplayName;
- (void)domainStateWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)reconnectAndReimportDomainWithCompletionHandler:(id)a3;
- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3;
- (void)setAllowsSystemDeleteAlerts:(BOOL)a3;
- (void)setAllowsUserControlledEviction:(BOOL)a3;
- (void)setAppliesChangesAtomically:(BOOL)a3;
- (void)setBackgroundActivityIsPaused:(BOOL)a3;
- (void)setCanDisable:(BOOL)a3;
- (void)setDisconnectionState:(unint64_t)a3;
- (void)setDomain:(id)a3;
- (void)setDomainUserInfo:(id)a3;
- (void)setEjectable:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setErrorGenerationCount:(int64_t)a3;
- (void)setExtensionBundleURL:(id)a3;
- (void)setHiddenByUser:(BOOL)a3 completionHandler:(id)a4;
- (void)setIndexingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setIsAvailableSystemWide:(BOOL)a3;
- (void)setIsIndexed:(BOOL)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setOwningApplicationIsHidden:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setProviderDisplayName:(id)a3;
- (void)setPurposeIdentifier:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setShouldHideDomainDisplayName:(BOOL)a3;
- (void)setShouldHideExtensionName:(BOOL)a3;
- (void)setStorageURLs:(id)a3;
- (void)setStorageURLsAreInTransientState:(BOOL)a3;
- (void)setSupportedFileTypes:(id)a3;
- (void)setSupportedKnownFolders:(unint64_t)a3;
- (void)setSupportedSearchFilters:(id)a3;
- (void)setSupportsEnumeration:(BOOL)a3;
- (void)setSupportsPickingFolders:(BOOL)a3;
- (void)setSupportsRemoteVersions:(BOOL)a3;
- (void)setSupportsSearch:(BOOL)a3;
- (void)setSupportsSyncingTrash:(BOOL)a3;
- (void)setTopLevelBundleIdentifier:(id)a3;
- (void)setTopLevelBundleURL:(id)a3;
- (void)setUseFPFS:(BOOL)a3;
- (void)setUsesUniqueItemIdentifiersAcrossDevices:(BOOL)a3;
- (void)setVersion:(id)a3;
@end

@implementation FPProviderDomain

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)owningApplicationIsHidden
{
  return self->_owningApplicationIsHidden;
}

- (BOOL)isAvailableSystemWide
{
  return self->_isAvailableSystemWide;
}

- (void)setStorageURLs:(id)a3
{
}

- (BOOL)isiCloudDriveProvider
{
  return [(NSString *)self->_providerID fp_isiCloudDriveOrCloudDocsIdentifier];
}

- (BOOL)supportsEnumeration
{
  return self->_supportsEnumeration;
}

- (void)setUsesUniqueItemIdentifiersAcrossDevices:(BOOL)a3
{
  self->_usesUniqueItemIdentifiersAcrossDevices = a3;
}

- (void)setUseFPFS:(BOOL)a3
{
  self->_useFPFS = a3;
}

- (void)setSupportsSyncingTrash:(BOOL)a3
{
  self->_supportsSyncingTrash = a3;
}

- (void)setSupportsSearch:(BOOL)a3
{
  self->_supportsSearch = a3;
}

- (void)setSupportsRemoteVersions:(BOOL)a3
{
  self->_supportsRemoteVersions = a3;
}

- (void)setSupportsPickingFolders:(BOOL)a3
{
  self->_supportsPickingFolders = a3;
}

- (void)setSupportsEnumeration:(BOOL)a3
{
  self->_supportsEnumeration = a3;
}

- (void)setSupportedKnownFolders:(unint64_t)a3
{
  self->_supportedKnownFolders = a3;
}

- (void)setStorageURLsAreInTransientState:(BOOL)a3
{
  self->_storageURLsAreInTransientState = a3;
}

- (void)setShouldHideExtensionName:(BOOL)a3
{
  self->_shouldHideExtensionName = a3;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void)setOwningApplicationIsHidden:(BOOL)a3
{
  self->_owningApplicationIsHidden = a3;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (void)setIsIndexed:(BOOL)a3
{
  self->_isIndexed = a3;
}

- (void)setIsAvailableSystemWide:(BOOL)a3
{
  self->_isAvailableSystemWide = a3;
}

- (void)setErrorGenerationCount:(int64_t)a3
{
  self->_errorGenerationCount = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setEjectable:(BOOL)a3
{
  self->_ejectable = a3;
}

- (void)setDisconnectionState:(unint64_t)a3
{
  self->_disconnectionState = a3;
}

- (void)setCanDisable:(BOOL)a3
{
  self->_canDisable = a3;
}

- (void)setBackgroundActivityIsPaused:(BOOL)a3
{
  self->_backgroundActivityIsPaused = a3;
}

- (void)setAppliesChangesAtomically:(BOOL)a3
{
  self->_appliesChangesAtomically = a3;
}

- (void)setAllowsUserControlledEviction:(BOOL)a3
{
  self->_allowsUserControlledEviction = a3;
}

- (void)setAllowsSystemDeleteAlerts:(BOOL)a3
{
  self->_allowsSystemDeleteAlerts = a3;
}

- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3
{
  self->_allowsContextualMenuDownloadEntry = a3;
}

- (void)setShouldHideDomainDisplayName:(BOOL)a3
{
  self->_shouldHideDomainDisplayName = a3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)canDisconnect
{
  return self->_ejectable;
}

- (void)setVersion:(id)a3
{
}

- (void)setTopLevelBundleURL:(id)a3
{
}

- (void)setTopLevelBundleIdentifier:(id)a3
{
}

- (void)setSupportedSearchFilters:(id)a3
{
}

- (void)setSupportedFileTypes:(id)a3
{
}

- (void)setProviderDisplayName:(id)a3
{
}

- (void)setExtensionBundleURL:(id)a3
{
}

- (void)setDomainUserInfo:(id)a3
{
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (NSArray)supportedFileTypes
{
  return self->_supportedFileTypes;
}

- (unint64_t)disconnectionState
{
  return self->_disconnectionState;
}

+ (id)mainICloudDriveDomainID
{
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_lmdURL");
    v4 = objc_msgSend(v3, "fp_fpfsProviderDomainID:", 0);
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [a1 _generateDomainIDFromDSID:v3];
    }
    v7 = v6;
  }
  else
  {
    v7 = objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", @"com.apple.CloudDocs.MobileDocumentsFileProvider", @"NSFileProviderDomainDefaultIdentifier");
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_providerID forKey:@"_providerID"];
  [v5 encodeObject:self->_domain forKey:@"_domain"];
  [v5 encodeObject:self->_providerDisplayName forKey:@"_providerDisplayName"];
  [v5 encodeObject:self->_extensionBundleURL forKey:@"_extensionBundleURL"];
  [v5 encodeObject:self->_supportedFileTypes forKey:@"_supportedFileTypes"];
  [v5 encodeObject:self->_topLevelBundleIdentifier forKey:@"_topLevelBundleIdentifier"];
  [v5 encodeObject:self->_topLevelBundleURL forKey:@"_topLevelBundleURL"];
  [v5 encodeObject:self->_storageURLs forKey:@"_storageURLs"];
  [v5 encodeBool:self->_storageURLsAreInTransientState forKey:@"_storageURLsAreInTransientState"];
  [v5 encodeObject:self->_version forKey:@"_version"];
  [v5 encodeBool:self->_isAvailableSystemWide forKey:@"_isAvailableSystemWide"];
  [v5 encodeBool:self->_supportsEnumeration forKey:@"_supportsEnumeration"];
  [v5 encodeBool:self->_enabled forKey:@"_enabled"];
  [v5 encodeBool:self->_canDisable forKey:@"_canDisable"];
  [v5 encodeBool:self->_shouldHideExtensionName forKey:@"_shouldHideExtensionName"];
  [v5 encodeBool:self->_shouldHideDomainDisplayName forKey:@"_shouldHideDomainDisplayName"];
  [v5 encodeBool:self->_ejectable forKey:@"_ejectable"];
  [v5 encodeBool:self->_readOnly forKey:@"_readOnly"];
  [v5 encodeObject:self->_supportedSearchFilters forKey:@"_supportedSearchFilters"];
  [v5 encodeBool:self->_usesUniqueItemIdentifiersAcrossDevices forKey:@"_usesUniqueItemIdentifiersAcrossDevices"];
  [v5 encodeBool:self->_hiddenByUser forKey:@"_hiddenByUser"];
  [v5 encodeBool:self->_hiddenByProvider forKey:@"_hiddenByProvider"];
  [v5 encodeBool:self->_supportsPickingFolders forKey:@"_supportsPickingFolders"];
  [v5 encodeBool:self->_needsAuthentication forKey:@"_needsAuthentication"];
  [v5 encodeObject:self->_domainUserInfo forKey:@"_domainUserInfo"];
  [v5 encodeBool:self->_allowsUserControlledEviction forKey:@"_allowsUserControlledEviction"];
  [v5 encodeBool:self->_allowsSystemDeleteAlerts forKey:@"_allowsSystemDeleteAlerts"];
  [v5 encodeBool:self->_allowsContextualMenuDownloadEntry forKey:@"_allowsContextualMenuDownloadEntry"];
  [v5 encodeBool:self->_supportsSyncingTrash forKey:@"_supportsSyncingTrash"];
  [v5 encodeBool:self->_supportsSearch forKey:@"_supportsSearch"];
  [v5 encodeInteger:self->_disconnectionState forKey:@"_disconnectionState"];
  [v5 encodeBool:self->_useFPFS forKey:@"_useFPFS"];
  [v5 encodeBool:self->_appliesChangesAtomically forKey:@"_appliesChangesAtomically"];
  [v5 encodeBool:self->_backgroundActivityIsPaused forKey:@"_backgroundActivityIsPaused"];
  [v5 encodeInteger:self->_errorGenerationCount forKey:@"_errorGenerationCount"];
  [v5 encodeBool:self->_isIndexed forKey:@"_isIndexed"];
  [v5 encodeBool:self->_owningApplicationIsHidden forKey:@"_owningApplicationIsHidden"];
  [v5 encodeInteger:self->_supportedKnownFolders forKey:@"_supportedKnownFolders"];
  [v5 encodeBool:self->_supportsRemoteVersions forKey:@"_supportsRemoteVersions"];
}

+ (id)rootURLForProviderDomainID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    v8 = objc_msgSend(v7, "fp_toProviderID");
    if ([v8 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"])
    {
      v9 = +[FPProviderDomain providerDomainWithID:v7 cachePolicy:3 error:0];
      if (v9)
      {
        v10 = v9;
        v11 = [v9 storageURLs];
        v12 = [v11 firstObject];

LABEL_10:
        goto LABEL_12;
      }
      v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_lmdURL");
      v13 = objc_msgSend(v12, "fp_fpfsProviderDomainID:", 0);
      char v14 = [v13 isEqualToString:v7];

      if (v14) {
        goto LABEL_12;
      }
    }
  }
  v15 = +[FPProviderDomain providerDomainWithID:v7 cachePolicy:a4 error:a5];
  v8 = v15;
  if (v15)
  {
    v10 = [v15 storageURLs];
    v12 = [v10 firstObject];
    goto LABEL_10;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

+ (id)providerDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  v8 = [a3 providerDomainID];
  v9 = [a1 providerDomainWithID:v8 cachePolicy:a4 error:a5];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (BOOL)supportsSyncingTrash
{
  return self->_supportsSyncingTrash;
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4)
  {
    id v29 = 0;
    id v9 = [a1 cachedProviderDomainWithID:v8 cachePolicy:a4 error:&v29];
    id v10 = v29;
    v11 = v10;
    if (v9)
    {
      id v12 = v9;
LABEL_4:

      goto LABEL_12;
    }
    if (v10)
    {
      if (a5) {
        *a5 = v10;
      }
      goto LABEL_4;
    }
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14;
  v27 = __Block_byref_object_dispose__14;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  id v22 = 0;
  v13 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__FPProviderDomain_providerDomainWithID_cachePolicy_error___block_invoke;
  v16[3] = &unk_1E5AF3A08;
  v16[4] = &v17;
  v16[5] = &v23;
  [v13 providerDomainForIdentifier:v8 completionHandler:v16];

  char v14 = (void *)v18[5];
  if (a5 && !v14)
  {
    *a5 = (id) v24[5];
    char v14 = (void *)v18[5];
  }
  id v9 = v14;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
LABEL_12:

  return (FPProviderDomain *)v9;
}

+ (id)cachedProviderDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[FPProviderDomainChangesReceiver sharedChangesReceiverIfAvailable];
  id v9 = [v8 cachedProviderDomainsByID];

  if (a4 != 3 || v9)
  {
    v11 = [v9 objectForKeyedSubscript:v7];
    id v10 = v11;
    if (v11)
    {
      id v18 = v11;
    }
    else if (a4 == 3 || a4 == 2 && v9)
    {
      FPProviderNotFoundError((uint64_t)v7, 1uLL, v12, v13, v14, v15, v16, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v10 = 0;
    *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"NSFileProviderInternalErrorDomain" code:19 userInfo:0];
  }

  return v10;
}

- (FPProviderDomain)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)FPProviderDomain;
  id v5 = [(FPProviderDomain *)&v41 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1A6248870]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_providerID"];
    providerID = v5->_providerID;
    v5->_providerID = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domain"];
    domain = v5->_domain;
    v5->_domain = (NSFileProviderDomain *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_providerDisplayName"];
    providerDisplayName = v5->_providerDisplayName;
    v5->_providerDisplayName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionBundleURL"];
    extensionBundleURL = v5->_extensionBundleURL;
    v5->_extensionBundleURL = (NSURL *)v15;

    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"_supportedFileTypes"];
    supportedFileTypes = v5->_supportedFileTypes;
    v5->_supportedFileTypes = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_topLevelBundleIdentifier"];
    topLevelBundleIdentifier = v5->_topLevelBundleIdentifier;
    v5->_topLevelBundleIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_topLevelBundleURL"];
    topLevelBundleURL = v5->_topLevelBundleURL;
    v5->_topLevelBundleURL = (NSURL *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    id v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"_storageURLs"];
    storageURLs = v5->_storageURLs;
    v5->_storageURLs = (NSArray *)v29;

    v5->_storageURLsAreInTransientState = [v4 decodeBoolForKey:@"_storageURLsAreInTransientState"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_version"];
    version = v5->_version;
    v5->_version = (NSString *)v31;

    v5->_isAvailableSystemWide = [v4 decodeBoolForKey:@"_isAvailableSystemWide"];
    v5->_supportsEnumeration = [v4 decodeBoolForKey:@"_supportsEnumeration"];
    v5->_enabled = [v4 decodeBoolForKey:@"_enabled"];
    v5->_canDisable = [v4 decodeBoolForKey:@"_canDisable"];
    v5->_shouldHideExtensionName = [v4 decodeBoolForKey:@"_shouldHideExtensionName"];
    v5->_shouldHideDomainDisplayName = [v4 decodeBoolForKey:@"_shouldHideDomainDisplayName"];
    v5->_ejectable = [v4 decodeBoolForKey:@"_ejectable"];
    v5->_readOnly = [v4 decodeBoolForKey:@"_readOnly"];
    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"_supportedSearchFilters"];
    supportedSearchFilters = v5->_supportedSearchFilters;
    v5->_supportedSearchFilters = (NSArray *)v36;

    v5->_usesUniqueItemIdentifiersAcrossDevices = [v4 decodeBoolForKey:@"_usesUniqueItemIdentifiersAcrossDevices"];
    v5->_hiddenByProvider = [v4 decodeBoolForKey:@"_hiddenByProvider"];
    v5->_hiddenByUser = [v4 decodeBoolForKey:@"_hiddenByUser"];
    v5->_supportsPickingFolders = [v4 decodeBoolForKey:@"_supportsPickingFolders"];
    v5->_needsAuthentication = [v4 decodeBoolForKey:@"_needsAuthentication"];
    uint64_t v38 = objc_msgSend(v4, "fp_safeDecodeNSDictionaryForKey:", @"_domainUserInfo");
    domainUserInfo = v5->_domainUserInfo;
    v5->_domainUserInfo = (NSDictionary *)v38;

    v5->_allowsUserControlledEviction = [v4 decodeBoolForKey:@"_allowsUserControlledEviction"];
    v5->_allowsSystemDeleteAlerts = [v4 decodeBoolForKey:@"_allowsSystemDeleteAlerts"];
    v5->_allowsContextualMenuDownloadEntry = [v4 decodeBoolForKey:@"_allowsContextualMenuDownloadEntry"];
    v5->_supportsSyncingTrash = [v4 decodeBoolForKey:@"_supportsSyncingTrash"];
    v5->_supportsSearch = [v4 decodeBoolForKey:@"_supportsSearch"];
    v5->_disconnectionState = [v4 decodeIntegerForKey:@"_disconnectionState"];
    v5->_useFPFS = [v4 decodeBoolForKey:@"_useFPFS"];
    v5->_appliesChangesAtomically = [v4 decodeBoolForKey:@"_appliesChangesAtomically"];
    v5->_backgroundActivityIsPaused = [v4 decodeBoolForKey:@"_backgroundActivityIsPaused"];
    v5->_errorGenerationCount = [v4 decodeIntegerForKey:@"_errorGenerationCount"];
    v5->_isIndexed = [v4 decodeBoolForKey:@"_isIndexed"];
    v5->_owningApplicationIsHidden = [v4 decodeBoolForKey:@"_owningApplicationIsHidden"];
    v5->_supportedKnownFolders = [v4 decodeIntegerForKey:@"_supportedKnownFolders"];
    v5->_supportsRemoteVersions = [v4 decodeBoolForKey:@"_supportsRemoteVersions"];
  }

  return v5;
}

- (BOOL)isEnterpriseDomain
{
  v2 = [(FPProviderDomain *)self domain];
  char v3 = [v2 isEnterpriseDomain];

  return v3;
}

- (NSString)personaIdentifier
{
  v2 = [(FPProviderDomain *)self domain];
  char v3 = [v2 personaIdentifier];

  return (NSString *)v3;
}

- (BOOL)isDataSeparatedDomain
{
  v2 = [(FPProviderDomain *)self domain];
  char v3 = [v2 isDataSeparatedDomain];

  return v3;
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (id)description
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  char v3 = [(FPProviderDomain *)self testingModes];
  id v4 = [(NSFileProviderDomain *)self->_domain backingStoreIdentity];

  if (v4)
  {
    id v5 = [NSString alloc];
    id v6 = [(NSFileProviderDomain *)self->_domain backingStoreIdentity];
    v72 = (void *)[v5 initWithData:v6 encoding:4];
  }
  else
  {
    v72 = 0;
  }
  if (self->_errorGenerationCount)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" errorGenCount:%lld", self->_errorGenerationCount);
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = &stru_1EF68D1F8;
  }
  uint64_t v7 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v8 = self->_storageURLs;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v73 objects:v77 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v74 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        if ([v7 length]) {
          [v7 appendString:@","];
        }
        uint64_t v14 = objc_msgSend(v13, "fp_shortDescription");
        [v7 appendString:v14];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v73 objects:v77 count:16];
    }
    while (v10);
  }

  v69 = NSString;
  uint64_t v67 = objc_opt_class();
  v70 = [(NSString *)self->_identifier fp_obfuscatedProviderDomainID];
  v68 = [(NSString *)self->_providerDisplayName fp_obfuscatedFilename];
  NSUInteger v66 = [(NSArray *)self->_storageURLs count];
  if (self->_enabled)
  {
    if (self->_needsAuthentication) {
      uint64_t v15 = "needAuth";
    }
    else {
      uint64_t v15 = "enabled";
    }
  }
  else
  {
    uint64_t v15 = "disabled";
  }
  v65 = v15;
  unint64_t v16 = self->_disconnectionState - 2;
  uint64_t v17 = "";
  if (v16 <= 7) {
    uint64_t v17 = off_1E5AF3AC8[v16];
  }
  v52 = v17;
  if (self->_owningApplicationIsHidden) {
    uint64_t v18 = ",appHidden";
  }
  else {
    uint64_t v18 = "";
  }
  if (self->_hiddenByProvider) {
    uint64_t v19 = ",providerHidden";
  }
  else {
    uint64_t v19 = "";
  }
  v63 = v19;
  v64 = v18;
  if (self->_hiddenByUser) {
    uint64_t v20 = ",userHidden";
  }
  else {
    uint64_t v20 = "";
  }
  v62 = v20;
  if (self->_backgroundActivityIsPaused) {
    v21 = ",backgroundPaused";
  }
  else {
    v21 = "";
  }
  if (self->_storageURLsAreInTransientState) {
    uint64_t v22 = ",changing";
  }
  else {
    uint64_t v22 = "";
  }
  v60 = v21;
  v61 = v22;
  if (v3) {
    uint64_t v23 = ",test:alwaysEnabled";
  }
  else {
    uint64_t v23 = "";
  }
  uint64_t v24 = ",test:interactive";
  if ((v3 & 2) == 0) {
    uint64_t v24 = "";
  }
  v58 = v24;
  v59 = v23;
  if (self->_supportsEnumeration) {
    uint64_t v25 = "enum";
  }
  else {
    uint64_t v25 = "";
  }
  if (self->_useFPFS) {
    v26 = ",fpfs";
  }
  else {
    v26 = "";
  }
  v56 = v26;
  v57 = v25;
  if (self->_canDisable) {
    uint64_t v27 = ",disable";
  }
  else {
    uint64_t v27 = "";
  }
  if (self->_ejectable) {
    id v28 = ",eject";
  }
  else {
    id v28 = "";
  }
  v54 = v28;
  v55 = v27;
  if (self->_usesUniqueItemIdentifiersAcrossDevices) {
    uint64_t v29 = ",uniqueID";
  }
  else {
    uint64_t v29 = "";
  }
  v53 = v29;
  if (self->_supportsPickingFolders) {
    v30 = ",pickFolder";
  }
  else {
    v30 = "";
  }
  if (self->_readOnly) {
    uint64_t v31 = ",RO";
  }
  else {
    uint64_t v31 = "";
  }
  v50 = v31;
  v51 = v30;
  if ([(NSFileProviderDomain *)self->_domain isErasable]) {
    v32 = ",erasable";
  }
  else {
    v32 = "";
  }
  if (self->_isAvailableSystemWide) {
    v33 = ",systemWide";
  }
  else {
    v33 = "";
  }
  v48 = v33;
  v49 = v32;
  if (self->_supportedSearchFilters) {
    uint64_t v34 = ",searchFilt";
  }
  else {
    uint64_t v34 = "";
  }
  if (self->_allowsUserControlledEviction) {
    v35 = ",userEvict";
  }
  else {
    v35 = "";
  }
  v46 = v35;
  v47 = v34;
  if (self->_allowsSystemDeleteAlerts) {
    uint64_t v36 = "";
  }
  else {
    uint64_t v36 = ",noDeleteAlert";
  }
  if (self->_allowsContextualMenuDownloadEntry) {
    v37 = ",downloadAllow";
  }
  else {
    v37 = "";
  }
  if (self->_supportsSyncingTrash) {
    uint64_t v38 = ",supportsSyncingTrash";
  }
  else {
    uint64_t v38 = "";
  }
  if (self->_supportsSearch) {
    v39 = ",search";
  }
  else {
    v39 = "";
  }
  if (self->_supportsRemoteVersions) {
    v40 = ",remoteVersions";
  }
  else {
    v40 = "";
  }
  if (self->_appliesChangesAtomically) {
    objc_super v41 = ",atomic";
  }
  else {
    objc_super v41 = "";
  }
  v42 = FPKnownFoldersDescription(@" supportedKF:", self->_supportedKnownFolders);
  v43 = FPKnownFoldersDescription(@" replicatedKF:", [(NSFileProviderDomain *)self->_domain replicatedKnownFolders]);
  objc_msgSend(v69, "stringWithFormat:", @"<%@:%p id:\"%@\" name:\"%@\" urls(%d%s):%@ db:%@%@ state:%s%s%s%s%s%s%s%s features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%@%@>", v67, self, v70, v68, v66, v61, v7, v72, v71, v65, v60, v62, v63, v64, v52, v59,
    v58,
    v57,
    v56,
    v55,
    v54,
    v53,
    v51,
    v50,
    v49,
    v48,
    v47,
    v46,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
  v44 = v43);

  return v44;
}

- (unint64_t)testingModes
{
  return [(NSFileProviderDomain *)self->_domain testingModes];
}

- (BOOL)isUsingFPFS
{
  return self->_useFPFS;
}

- (NSArray)storageURLs
{
  return self->_storageURLs;
}

- (FPProviderDomain)initWithProviderID:(id)a3 domain:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"FPProviderDomain.m", 184, @"Invalid parameter not satisfying: %@", @"providerID" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)FPProviderDomain;
  uint64_t v10 = [(FPProviderDomain *)&v19 init];
  if (v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [v9 identifier];
    uint64_t v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    else {
      uint64_t v14 = @"NSFileProviderDomainDefaultIdentifier";
    }
    uint64_t v15 = objc_msgSend(v11, "fp_providerDomainIDFromProviderID:domainIdentifier:", v8, v14);
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v15;

    objc_storeStrong((id *)&v10->_domain, a4);
    objc_storeStrong((id *)&v10->_providerID, a3);
    v10->_hiddenByUser = [v9 isHiddenByUser];
    v10->_hiddenByProvider = [v9 isHidden];
    if (v9)
    {
      v10->_supportsSyncingTrash = [v9 supportsSyncingTrash];
      v10->_supportsSearch = [v9 supportsSearch];
      v10->_supportsRemoteVersions = [v9 supportsRemoteVersions];
    }
    else
    {
      v10->_supportsSyncingTrash = 1;
      *(_WORD *)&v10->_supportsSearch = 0;
    }
  }

  return v10;
}

- (BOOL)needsAuthentication
{
  return [(FPProviderDomain *)self isDefaultDomain]
      && [(FPProviderDomain *)self isFPFSiCloudDriveProvider]
      || self->_needsAuthentication;
}

- (BOOL)isDefaultDomain
{
  v2 = [(NSFileProviderDomain *)self->_domain identifier];
  char v3 = [v2 isEqualToString:@"NSFileProviderDomainDefaultIdentifier"];

  return v3;
}

- (BOOL)isHidden
{
  if ([(FPProviderDomain *)self isHiddenByProvider]
    || [(FPProviderDomain *)self isHiddenByUser])
  {
    return 1;
  }

  return [(FPProviderDomain *)self owningApplicationIsHidden];
}

- (BOOL)isHiddenByProvider
{
  return self->_hiddenByProvider;
}

- (BOOL)isHiddenByUser
{
  return self->_hiddenByUser;
}

- (BOOL)isFPFSiCloudDriveProvider
{
  return [(NSString *)self->_providerID fp_isiCloudDriveIdentifier];
}

- (NSString)providerID
{
  return self->_providerID;
}

- (NSString)topLevelBundleIdentifier
{
  return self->_topLevelBundleIdentifier;
}

- (NSString)domainFullDisplayName
{
  char v3 = [(FPProviderDomain *)self providerDisplayName];
  id v4 = [(FPProviderDomain *)self domainDisplayName];
  if (!v3)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(FPProviderDomain *)(uint64_t)self domainFullDisplayName];
    }
  }
  if ([v3 length])
  {
    if ([v4 length])
    {
      if (v3)
      {
        if (!self->_shouldHideDomainDisplayName)
        {
          id v6 = [NSString stringWithFormat:@"%@ - %@", v3, v4];
          goto LABEL_15;
        }
        goto LABEL_14;
      }
LABEL_13:
      id v6 = v4;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(FPProviderDomain *)(uint64_t)self domainFullDisplayName];
    }

    if ([v4 length]) {
      goto LABEL_13;
    }
  }
LABEL_14:
  id v6 = v3;
LABEL_15:
  id v8 = v6;

  return (NSString *)v8;
}

- (NSString)providerDisplayName
{
  if (self->_shouldHideExtensionName)
  {
    v2 = [(NSFileProviderDomain *)self->_domain displayName];
  }
  else
  {
    v2 = self->_providerDisplayName;
  }

  return v2;
}

- (NSString)domainDisplayName
{
  if (self->_shouldHideDomainDisplayName || self->_shouldHideExtensionName)
  {
    id v2 = 0;
  }
  else
  {
    id v4 = [(NSFileProviderDomain *)self->_domain displayName];
    if ([v4 length]) {
      id v2 = v4;
    }
    else {
      id v2 = 0;
    }
  }

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_purposeIdentifier, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_domainUserInfo, 0);
  objc_storeStrong((id *)&self->_supportedSearchFilters, 0);
  objc_storeStrong((id *)&self->_storageURLs, 0);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_topLevelBundleURL, 0);
  objc_storeStrong((id *)&self->_topLevelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedFileTypes, 0);
  objc_storeStrong((id *)&self->_providerDisplayName, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_itemCollection, 0);
}

+ (void)endMonitoringProviderDomainChanges:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"FPProviderDomain.m", 168, @"Invalid parameter not satisfying: %@", @"monitoringContext" object file lineNumber description];
  }
  id v5 = +[FPProviderDomainChangesReceiver sharedChangesReceiver];
  [v5 removeChangesHandlerToken:v7];
}

+ (id)beginMonitoringProviderDomainChangesWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[FPProviderDomainChangesReceiver sharedChangesReceiver];
  id v5 = [v4 addChangesHandler:v3];

  return v5;
}

- (NSString)spotlightMountPoint
{
  if ([(NSString *)self->_providerID isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"])
  {
    id v3 = [(NSFileProviderDomain *)self->_domain identifier];
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

void __59__FPProviderDomain_providerDomainWithID_cachePolicy_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)storageURL
{
  id v2 = [(FPProviderDomain *)self storageURLs];
  id v3 = [v2 firstObject];

  return v3;
}

- (FPProviderDomain)init
{
  v3.receiver = self;
  v3.super_class = (Class)FPProviderDomain;
  return [(FPProviderDomain *)&v3 init];
}

+ (void)_t_discardCache
{
  id v2 = +[FPProviderDomainChangesReceiver sharedChangesReceiver];
  objc_msgSend(v2, "_t_discardCache");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)extensionBundleIdentifier
{
  return self->_providerID;
}

- (BOOL)containsPhotos
{
  return [(NSFileProviderDomain *)self->_domain containsPhotos];
}

- (BOOL)isErasable
{
  return [(NSFileProviderDomain *)self->_domain isErasable];
}

- (NSString)iCloudAccountIdentifier
{
  if ([(NSString *)self->_providerID isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"])
  {
    objc_super v3 = [(NSFileProviderDomain *)self->_domain identifier];
  }
  else
  {
    objc_super v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)disconnectionReason
{
  return [(NSFileProviderDomain *)self->_domain _disconnectionReason];
}

- (BOOL)isConnectedToAppExtension
{
  return self->_disconnectionState == 1;
}

- (NSString)localizedDisconnectionBannerText
{
  switch(self->_disconnectionState)
  {
    case 2uLL:
      uint64_t v9 = @"DISCONNECTION_REASON_ERROR";
      goto LABEL_14;
    case 3uLL:
      id v11 = [(NSFileProviderDomain *)self->_domain _disconnectionReason];

      if (v11) {
        goto LABEL_7;
      }
      uint64_t v9 = @"DISCONNECTION_REASON_TEMPORARY";
      goto LABEL_14;
    case 4uLL:
      uint64_t v12 = [(NSFileProviderDomain *)self->_domain _disconnectionReason];

      if (v12)
      {
LABEL_7:
        uint64_t v13 = [(NSFileProviderDomain *)self->_domain _disconnectionReason];
        goto LABEL_15;
      }
      uint64_t v14 = [(FPProviderDomain *)self providerDisplayName];
      FPLoc(@"DISCONNECTION_REASON_PERMANENT_%@", v29, v30, v31, v32, v33, v34, v35, (uint64_t)v14);
      goto LABEL_18;
    case 5uLL:
      uint64_t v14 = [(FPProviderDomain *)self providerDisplayName];
      FPLoc(@"DISCONNECTION_REASON_ORPHANED_%@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v14);
      goto LABEL_18;
    case 6uLL:
      uint64_t v9 = @"DISCONNECTION_REASON_LOW_DISK_SPACE";
      goto LABEL_14;
    case 7uLL:
      uint64_t v9 = @"DISCONNECTION_REASON_INCOMPATIBLE_DB";
      goto LABEL_14;
    case 8uLL:
      uint64_t v9 = @"DISCONNECTION_REASON_FORBIDDEN_MDM";
      goto LABEL_14;
    case 9uLL:
      if ([(FPProviderDomain *)self isiCloudDriveProvider])
      {
        uint64_t v9 = @"DISCONNECTION_EXTERNAL_REJECTED_ICLOUDDRIVE";
LABEL_14:
        uint64_t v13 = FPLoc(v9, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v37);
LABEL_15:
        uint64_t v10 = (void *)v13;
      }
      else
      {
        uint64_t v14 = [(FPProviderDomain *)self providerDisplayName];
        FPLoc(@"DISCONNECTION_EXTERNAL_REJECTED_%@", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v14);
        uint64_t v10 = LABEL_18:;
      }
LABEL_19:
      return (NSString *)v10;
    default:
      uint64_t v10 = 0;
      goto LABEL_19;
  }
}

- (unint64_t)replicatedKnownFolders
{
  return [(NSFileProviderDomain *)self->_domain replicatedKnownFolders];
}

+ (void)selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = +[FPDaemonConnection sharedConnectionProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__FPProviderDomain_selectNewProviderDomain_knownFolders_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF0790;
  id v12 = v7;
  id v10 = v7;
  [v9 selectNewProviderDomain:v8 knownFolders:a4 completionHandler:v11];
}

void __75__FPProviderDomain_selectNewProviderDomain_knownFolders_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  id v8 = @"NSFileProviderErrorDomain";
  uint64_t v9 = v3;
  uint64_t v10 = *MEMORY[0x1E4F28798];
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  uint64_t v6 = [v4 arrayWithObjects:&v8 count:3];
  id v7 = objc_msgSend(v5, "fp_unwrappedErrorForDomains:", v6, v8, v9, v10, v11);

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v7);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    uint64_t v6 = [v4 identifier];
    char v7 = [(NSString *)identifier isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  self->_enabled = a3;
  id v6 = a4;
  id v10 = +[FPDaemonConnection sharedConnectionProxy];
  uint64_t v7 = [(NSFileProviderDomain *)self->_domain identifier];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = @"NSFileProviderDomainDefaultIdentifier";
  }
  [v10 setEnabled:v4 forDomainIdentifier:v9 providerIdentifier:self->_providerID completionHandler:v6];
}

- (void)setHiddenByUser:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  self->_hiddenByUser = a3;
  id v6 = a4;
  id v10 = +[FPDaemonConnection remoteObjectProxyWithErrorHandler:v6];
  uint64_t v7 = [(NSFileProviderDomain *)self->_domain identifier];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = @"NSFileProviderDomainDefaultIdentifier";
  }
  [v10 setHiddenByUser:v4 forDomainIdentifier:v9 providerIdentifier:self->_providerID completionHandler:v6];
}

- (void)setIndexingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v10 = +[FPDaemonConnection remoteObjectProxyWithErrorHandler:v6];
  uint64_t v7 = [(NSFileProviderDomain *)self->_domain identifier];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = @"NSFileProviderDomainDefaultIdentifier";
  }
  [v10 setIndexingEnabled:v4 forDomainIdentifier:v9 providerIdentifier:self->_providerID completionHandler:v6];
}

- (BOOL)isMainiCloudDriveDomain
{
  if ([(FPProviderDomain *)self isiCloudDriveProvider])
  {
    uint64_t v3 = [(FPProviderDomain *)self domain];
    int v4 = [v3 isEnterpriseDomain] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isFruitBasketProvider
{
  return [(NSString *)self->_providerID isEqualToString:@"com.apple.FruitBasket.Provider"];
}

- (BOOL)isEmpty
{
  return 0;
}

- (NSError)error
{
  return [(NSFileProviderDomain *)self->_domain error];
}

+ (id)providerDomainForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__14;
  uint64_t v21 = __Block_byref_object_dispose__14;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__14;
  uint64_t v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  id v6 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__FPProviderDomain_providerDomainForURL_error___block_invoke;
  v10[3] = &unk_1E5AF3A08;
  v10[4] = &v17;
  v10[5] = &v11;
  [v6 providerDomainForURL:v5 completionHandler:v10];

  uint64_t v7 = (void *)v12[5];
  if (a4 && !v7)
  {
    *a4 = (id) v18[5];
    uint64_t v7 = (void *)v12[5];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

void __47__FPProviderDomain_providerDomainForURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (void)fetchProviderDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"FPProviderDomain.m", 693, @"Invalid parameter not satisfying: %@", @"providerDomainID" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, a1, @"FPProviderDomain.m", 694, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  [a1 providerDomainWithID:v10 cachePolicy:0 completionHandler:v7];
}

+ (BOOL)hasProviderDomainAccess
{
  if (hasProviderDomainAccess_onceToken != -1) {
    dispatch_once(&hasProviderDomainAccess_onceToken, &__block_literal_global_27);
  }
  return hasProviderDomainAccess_hasEntitlements;
}

void __43__FPProviderDomain_hasProviderDomainAccess__block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef Default = CFAllocatorGetDefault();
  SecTaskRef v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    uint64_t v2 = v1;
    v7[0] = @"com.apple.fileprovider.acl-read";
    v7[1] = @"com.apple.fileprovider.acl-write";
    v7[2] = @"com.apple.fileprovider.enumerate";
    CFArrayRef v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
    CFErrorRef error = 0;
    CFDictionaryRef v4 = SecTaskCopyValuesForEntitlements(v2, v3, &error);
    CFRelease(v2);
    if (v4)
    {
      if ([(__CFDictionary *)v4 count]) {
        hasProviderDomainAccess_hasEntitlements = 1;
      }
    }
    else if (error)
    {
      id v5 = fp_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __43__FPProviderDomain_hasProviderDomainAccess__block_invoke_cold_2((uint64_t)v2, (uint64_t *)&error, v5);
      }

      CFRelease(error);
    }
  }
  else
  {
    fp_current_or_default_log();
    CFArrayRef v3 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
      __43__FPProviderDomain_hasProviderDomainAccess__block_invoke_cold_1((os_log_t)v3);
    }
  }
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 error:(id *)a4
{
  return (FPProviderDomain *)[a1 providerDomainWithID:a3 cachePolicy:0 error:a4];
}

+ (id)__providerDomainWithIDBuggyNullability:(id)a3 error:(id *)a4
{
  return (id)[a1 providerDomainWithID:a3 cachePolicy:0 error:a4];
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 allowCached:(BOOL)a4 completionHandler:(id)a5
{
  return (FPProviderDomain *)[a1 providerDomainWithID:a3 cachePolicy:a4 completionHandler:a5];
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, id))a5;
  if (!a4) {
    goto LABEL_7;
  }
  id v14 = 0;
  id v10 = [a1 cachedProviderDomainWithID:v8 cachePolicy:a4 error:&v14];
  id v11 = v14;
  id v12 = v11;
  if (!v10)
  {
    if (v11)
    {
      v9[2](v9, 0, v11);
      goto LABEL_6;
    }
LABEL_7:
    id v12 = +[FPDaemonConnection sharedConnectionProxy];
    [v12 providerDomainForIdentifier:v8 completionHandler:v9];
    goto LABEL_8;
  }
  ((void (**)(id, void *, id))v9)[2](v9, v10, 0);
LABEL_6:

LABEL_8:
  return result;
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 allowCached:(BOOL)a4 error:(id *)a5
{
  return (FPProviderDomain *)[a1 providerDomainWithID:a3 cachePolicy:a4 error:a5];
}

+ (id)__providerDomainWithIDBuggyNullability:(id)a3 allowCached:(BOOL)a4 error:(id *)a5
{
  return (id)[a1 providerDomainWithID:a3 cachePolicy:a4 error:a5];
}

+ (id)providerDomainsWithError:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__14;
  uint64_t v19 = __Block_byref_object_dispose__14;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  uint64_t v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  CFDictionaryRef v4 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__FPProviderDomain_providerDomainsWithError___block_invoke;
  v8[3] = &unk_1E5AF3A30;
  v8[4] = &v15;
  v8[5] = &v9;
  [v4 providerDomainsCompletionHandler:v8];

  id v5 = (void *)v10[5];
  if (a3 && !v5)
  {
    *a3 = (id) v16[5];
    id v5 = (void *)v10[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __45__FPProviderDomain_providerDomainsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

+ (id)providerDomainForItem:(id)a3 error:(id *)a4
{
  id v6 = [a3 providerDomainID];
  uint64_t v7 = [a1 providerDomainWithID:v6 cachePolicy:0 error:a4];

  return v7;
}

+ (id)__providerDomainForItemBuggyNullability:(id)a3 error:(id *)a4
{
  id v6 = [a3 providerDomainID];
  uint64_t v7 = [a1 providerDomainWithID:v6 cachePolicy:0 error:a4];

  return v7;
}

+ (void)fetchProviderDomainForItem:(id)a3 completionHandler:(id)a4
{
}

+ (void)fetchProviderDomainForItem:(id)a3 allowCached:(BOOL)a4 completionHandler:(id)a5
{
}

+ (void)fetchProviderDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 providerDomainID];
  [a1 providerDomainWithID:v9 cachePolicy:a4 completionHandler:v8];
}

+ (void)removeDomainAndPreserveDataWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[FPDaemonConnection sharedConnectionProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__FPProviderDomain_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF3A58;
  id v12 = v7;
  id v10 = v7;
  [v9 removeDomainAndPreserveDataWithID:v8 mode:a4 completionHandler:v11];
}

void __77__FPProviderDomain_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 url];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

+ (void)removeDomainWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__FPProviderDomain_removeDomainWithID_mode_completionHandler___block_invoke;
  v10[3] = &unk_1E5AF1A60;
  id v11 = v8;
  id v9 = v8;
  [a1 removeDomainAndPreserveDataWithID:a3 mode:a4 completionHandler:v10];
}

uint64_t __62__FPProviderDomain_removeDomainWithID_mode_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)usesDSCopyEngine
{
  if ([(FPProviderDomain *)self isUsingFPFS]) {
    return 1;
  }
  uint64_t v4 = [(FPProviderDomain *)self providerID];
  if ([v4 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
  {
    char v3 = 1;
  }
  else
  {
    id v5 = [(FPProviderDomain *)self providerID];
    if ([v5 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"])
    {
      char v3 = 1;
    }
    else
    {
      id v6 = [(FPProviderDomain *)self providerID];
      if ([v6 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"])
      {
        char v3 = 1;
      }
      else
      {
        id v7 = [(FPProviderDomain *)self providerID];
        if ([v7 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"])
        {
          char v3 = 1;
        }
        else
        {
          id v8 = [(FPProviderDomain *)self providerID];
          if ([v8 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
          {
            char v3 = 1;
          }
          else
          {
            id v9 = [(FPProviderDomain *)self providerID];
            char v3 = [v9 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];
          }
        }
      }
    }
  }
  return v3;
}

- (void)domainStateWithCompletionHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v6 = [v5 currentPersona];

  id v30 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = [(FPProviderDomain *)self personaIdentifier];
  if (v7 == v8)
  {

LABEL_13:
    id v16 = 0;
    goto LABEL_14;
  }
  id v9 = [(FPProviderDomain *)self personaIdentifier];
  char v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v29 = 0;
  id v11 = (void *)[v6 copyCurrentPersonaContextWithError:&v29];
  id v12 = v29;
  id v13 = v30;
  id v30 = v11;

  if (v12)
  {
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FPProviderDomain domainStateWithCompletionHandler:]((uint64_t)v12, v14);
    }
  }
  uint64_t v15 = [(FPProviderDomain *)self personaIdentifier];
  id v16 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v15];

  if (v16)
  {
    uint64_t v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [(FPProviderDomain *)self personaIdentifier];
      -[FPProviderDomain domainStateWithCompletionHandler:](v18, (uint64_t)v16, buf, v17);
    }
  }
LABEL_14:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__FPProviderDomain_domainStateWithCompletionHandler___block_invoke;
  v27[3] = &unk_1E5AF14E8;
  id v19 = v4;
  id v28 = v19;
  id v20 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v27];
  uint64_t v21 = [(FPProviderDomain *)self identifier];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__FPProviderDomain_domainStateWithCompletionHandler___block_invoke_2;
  v24[3] = &unk_1E5AF3A80;
  id v22 = v20;
  id v25 = v22;
  id v23 = v19;
  id v26 = v23;
  [v22 FPStateForDomainWithID:v21 completionHandler:v24];

  _FPRestorePersona(&v30);
}

uint64_t __53__FPProviderDomain_domainStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __53__FPProviderDomain_domainStateWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2 || v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    }
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

- (void)reconnectAndReimportDomainWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NSFileProviderDomain *)self->_domain copy];
  [v5 setDisconnected:0];
  [v5 _setDisconnectionReason:0];
  [v5 _setDisconnectionOptions:0];
  uint64_t v6 = +[FPDaemonConnection sharedConnectionProxy];
  id v7 = [(FPProviderDomain *)self providerID];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__FPProviderDomain_reconnectAndReimportDomainWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5AF3AA8;
  id v10 = v4;
  id v8 = v4;
  [v6 addDomain:v5 forProviderIdentifier:v7 byImportingDirectoryAtURL:0 nonWrappedURL:0 userAllowedDBDrop:1 knownFolders:MEMORY[0x1E4F1CBF0] completionHandler:v9];
}

uint64_t __68__FPProviderDomain_reconnectAndReimportDomainWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_generateDomainIDFromDSID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[FPProviderDomain _generateDomainIDFromDSID:](v3, v4);
  }

  id v5 = v3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 1048836);
  if (v6 < 0)
  {
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[FPProviderDomain _generateDomainIDFromDSID:](v14);
    }

    goto LABEL_13;
  }
  int v7 = v6;
  ssize_t v8 = fgetxattr(v6, "com.apple.ubd.prsid", 0, 0, 0, 0);
  if (v8 < 1 || (int64_t v9 = v8, (v10 = malloc_type_calloc(1uLL, v8 + 1, 0xDA64527FuLL)) == 0))
  {
    close(v7);
LABEL_13:
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  id v11 = v10;
  if (fpfs_fgetxattr_checked(v7, "com.apple.ubd.prsid", v10, v9) < 1)
  {
    id v13 = 0;
  }
  else
  {
    id v12 = [NSString stringWithCString:v11 encoding:4];
    if ([v12 hasSuffix:@".CloudDocs"])
    {
      id v13 = [v12 substringToIndex:objc_msgSend(v12, "length") - objc_msgSend(@".CloudDocs", "length")];
    }
    else
    {
      id v13 = 0;
    }
  }
  free(v11);
  uint64_t v17 = close(v7);
  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v18 = (void *)MEMORY[0x1A6248870](v17);
  id v19 = [MEMORY[0x1E4F179C8] defaultStore];
  id v20 = [v19 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];
  [v19 accountsWithAccountType:v20];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = (void *)[v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v22)
  {
    id v28 = v20;
    id v29 = v18;
    uint64_t v23 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v26 = objc_msgSend(v25, "aa_personID", v28, v29, (void)v30);
        int v27 = [v26 isEqualToString:v13];

        if (v27)
        {
          id v22 = [v25 identifier];
          goto LABEL_31;
        }
      }
      id v22 = (void *)[v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v22) {
        continue;
      }
      break;
    }
LABEL_31:
    id v20 = v28;
    uint64_t v18 = v29;
  }

  if (v22)
  {
    uint64_t v15 = objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", @"com.apple.CloudDocs.iCloudDriveFileProvider", v22);
  }
  else
  {
    uint64_t v15 = 0;
  }

LABEL_14:

  return v15;
}

+ (id)projectedFPFSMainICloudDriveDomainID
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_lmdURL");
  id v4 = objc_msgSend(v3, "fp_fpfsProviderDomainID:", 0);
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [a1 _generateDomainIDFromDSID:v3];
  }

  return v5;
}

+ (void)accumulatedSizeOfPinnedItemsInDomain:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v5 = (void (**)(id, void, void *))a4;
  if (FPPinningIsEnabledForDomainID(v7))
  {
    int v6 = +[FPDaemonConnection sharedConnectionProxy];
    [v6 accumulatedSizeOfPinnedItemsInDomain:v7 completion:v5];
  }
  else
  {
    int v6 = FPNotSupportedError();
    v5[2](v5, 0, v6);
  }
}

+ (void)accumulatedSizeOfItemsInDomain:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FPDaemonConnection sharedConnectionProxy];
  [v7 accumulatedSizeOfItemsInDomain:v6 completion:v5];
}

- (unint64_t)supportedKnownFolders
{
  return self->_supportedKnownFolders;
}

- (NSURL)topLevelBundleURL
{
  return self->_topLevelBundleURL;
}

- (BOOL)storageURLsAreInTransientState
{
  return self->_storageURLsAreInTransientState;
}

- (BOOL)canDisable
{
  return self->_canDisable;
}

- (BOOL)backgroundActivityIsPaused
{
  return self->_backgroundActivityIsPaused;
}

- (NSArray)supportedSearchFilters
{
  return self->_supportedSearchFilters;
}

- (BOOL)usesUniqueItemIdentifiersAcrossDevices
{
  return self->_usesUniqueItemIdentifiersAcrossDevices;
}

- (BOOL)supportsPickingFolders
{
  return self->_supportsPickingFolders;
}

- (NSDictionary)domainUserInfo
{
  return self->_domainUserInfo;
}

- (BOOL)allowsUserControlledEviction
{
  return self->_allowsUserControlledEviction;
}

- (BOOL)allowsSystemDeleteAlerts
{
  return self->_allowsSystemDeleteAlerts;
}

- (BOOL)allowsContextualMenuDownloadEntry
{
  return self->_allowsContextualMenuDownloadEntry;
}

- (BOOL)appliesChangesAtomically
{
  return self->_appliesChangesAtomically;
}

- (int64_t)errorGenerationCount
{
  return self->_errorGenerationCount;
}

- (BOOL)isIndexed
{
  return self->_isIndexed;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSFileProviderManager)manager
{
  return self->_manager;
}

- (void)setDomain:(id)a3
{
}

- (BOOL)isEjectable
{
  return self->_ejectable;
}

- (NSString)purposeIdentifier
{
  return self->_purposeIdentifier;
}

- (void)setPurposeIdentifier:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)shouldHideExtensionName
{
  return self->_shouldHideExtensionName;
}

- (BOOL)shouldHideDomainDisplayName
{
  return self->_shouldHideDomainDisplayName;
}

- (BOOL)supportsSearch
{
  return self->_supportsSearch;
}

- (BOOL)supportsRemoteVersions
{
  return self->_supportsRemoteVersions;
}

- (void)domainFullDisplayName
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_FAULT, "[CRIT] providerDisplayName was nil in domainFullDisplayName, providerId: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __43__FPProviderDomain_hasProviderDomainAccess__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)SecTaskRef v1 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] Cannot get SecureTask", v1, 2u);
}

void __43__FPProviderDomain_hasProviderDomainAccess__block_invoke_cold_2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] Cannot fetch entitlements from SecureTask %{public}@ error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)domainStateWithCompletionHandler:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
}

- (void)domainStateWithCompletionHandler:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_generateDomainIDFromDSID:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A33AE000, a1, OS_LOG_TYPE_ERROR, "[ERROR] Failed opening URL: %d", (uint8_t *)v3, 8u);
}

+ (void)_generateDomainIDFromDSID:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  uint64_t v4 = objc_msgSend(v3, "fp_prettyPath");
  int v5 = 138412290;
  __int16 v6 = v4;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Generating domainID for %@", (uint8_t *)&v5, 0xCu);
}

@end