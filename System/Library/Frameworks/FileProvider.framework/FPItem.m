@interface FPItem
+ (BOOL)supportsSecureCoding;
+ (id)allUbiquitousResourceKeys;
+ (id)appLibraryFromContainerItem:(id)a3 documentsItem:(id)a4;
+ (id)archivePlaceholderForItem:(id)a3 underParent:(id)a4 inProviderDomainID:(id)a5 withArchiveFormat:(unint64_t)a6;
+ (id)fp_minimalAttributesForEviction;
+ (id)fp_minimalAttributesForEvictionPriority;
+ (id)fp_queryFetchAttributes;
+ (id)generatePlaceholderIdentifier;
+ (id)generatePlaceholderIdentifierWithOriginalID:(id)a3;
+ (id)genericArchivePlaceholderUnderParent:(id)a3 inProviderDomainID:(id)a4 withArchiveFormat:(unint64_t)a5;
+ (id)placeholderWithCopyOfExistingItem:(id)a3 lastUsageUpdatePolicy:(unint64_t)a4 underParent:(id)a5 inProviderDomainID:(id)a6;
+ (id)placeholderWithName:(id)a3 contentType:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7;
+ (id)placeholderWithName:(id)a3 isFolder:(BOOL)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7;
+ (id)placeholderWithName:(id)a3 typeIdentifier:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7;
+ (id)temporaryPlaceholderFromItem:(id)a3;
- (BOOL)allowsContextualMenuDownloadEntry;
- (BOOL)fp_isAddedByCurrentUser;
- (BOOL)fp_isCloudDocsContainer;
- (BOOL)fp_isDownloadRequested;
- (BOOL)fp_isLastModifiedByCurrentUser;
- (BOOL)isActionable;
- (BOOL)isBusy;
- (BOOL)isCloudItem;
- (BOOL)isCollaborationInvitation;
- (BOOL)isContainer;
- (BOOL)isContainerPristine;
- (BOOL)isContentZoneRoot;
- (BOOL)isDownloaded;
- (BOOL)isDownloading;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItem:(id)a3;
- (BOOL)isExcludedFromSync;
- (BOOL)isExternalDownloadPlaceholder;
- (BOOL)isFlattenedPackage;
- (BOOL)isFolder;
- (BOOL)isIgnoreRoot;
- (BOOL)isInPinnedFolder;
- (BOOL)isKnownByTheProvider;
- (BOOL)isMostRecentVersionDownloaded;
- (BOOL)isOffline;
- (BOOL)isPackage;
- (BOOL)isPending;
- (BOOL)isPinned;
- (BOOL)isPinnedSubitem;
- (BOOL)isPlaceholder;
- (BOOL)isReadable;
- (BOOL)isRecursivelyDownloaded;
- (BOOL)isShared;
- (BOOL)isSharedByCurrentUser;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isTrashed;
- (BOOL)isUbiquitous;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (BOOL)isValidAppLibrary;
- (BOOL)isValidContainerForAppLibrary;
- (BOOL)isWritable;
- (BOOL)supportsMostRecentVersionDownloaded;
- (FPItem)initWithCoder:(id)a3;
- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 contentType:(id)a7;
- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 isDirectory:(BOOL)a7;
- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 typeIdentifier:(id)a7;
- (FPItem)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5 parentItemIdentifier:(id)a6 filename:(id)a7 contentType:(id)a8;
- (FPItem)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5 parentItemIdentifier:(id)a6 filename:(id)a7 isDirectory:(BOOL)a8;
- (FPItem)initWithSearchableItem:(id)a3;
- (FPItem)initWithVendorItem:(id)a3 provider:(id)a4 domain:(id)a5 spotlightDomainIdentifier:(id)a6 extensionCapabilities:(unint64_t)a7 useFPFS:(BOOL)a8;
- (FPItemID)formerItemID;
- (FPItemID)itemID;
- (FPItemID)parentFormerItemID;
- (FPItemID)parentItemID;
- (FPItemID)providerItemID;
- (NSArray)conflictingVersions;
- (NSArray)decorations;
- (NSArray)itemDecorations;
- (NSArray)tags;
- (NSData)originatorInfo;
- (NSData)quarantineBlob;
- (NSData)tagData;
- (NSData)versionIdentifier;
- (NSDate)contentModificationDate;
- (NSDate)creationDate;
- (NSDate)lastUsedDate;
- (NSDictionary)extendedAttributes;
- (NSDictionary)inheritedUserInfo;
- (NSDictionary)resolvedUserInfo;
- (NSDictionary)userInfo;
- (NSError)downloadingError;
- (NSError)uploadingError;
- (NSFileProviderItemVersion)itemVersion;
- (NSFileProviderTypeAndCreator)typeAndCreator;
- (NSNumber)childItemCount;
- (NSNumber)documentSize;
- (NSNumber)favoriteRank;
- (NSNumber)hasUnresolvedConflicts;
- (NSNumber)isDownloadRequested;
- (NSPersonNameComponents)fp_addedByNameComponents;
- (NSPersonNameComponents)mostRecentEditorNameComponents;
- (NSPersonNameComponents)ownerNameComponents;
- (NSProgress)copyingProgress;
- (NSProgress)downloadingProgress;
- (NSProgress)progress;
- (NSProgress)uploadingProgress;
- (NSSet)fp_cloudContainerClientBundleIdentifiers;
- (NSString)cloudContainerIdentifier;
- (NSString)collaborationIdentifier;
- (NSString)containerDisplayName;
- (NSString)description;
- (NSString)displayName;
- (NSString)domainIdentifier;
- (NSString)fileSystemFilename;
- (NSString)filename;
- (NSString)formerIdentifier;
- (NSString)fp_appContainerBundleIdentifier;
- (NSString)fp_displayName;
- (NSString)fp_parentDomainIdentifier;
- (NSString)fp_spotlightSubDomainIdentifier;
- (NSString)itemIdentifier;
- (NSString)localizedSharingStatusString;
- (NSString)parentFormerIdentifier;
- (NSString)parentItemIdentifier;
- (NSString)placeholderIdentifier;
- (NSString)preformattedMostRecentEditorName;
- (NSString)preformattedOwnerName;
- (NSString)providerDomainID;
- (NSString)providerID;
- (NSString)providerIDForDeduplication;
- (NSString)providerIdentifier;
- (NSString)providerItemIdentifier;
- (NSString)sharingPermissions;
- (NSString)spotlightDomainIdentifier;
- (NSString)symlinkTargetPath;
- (NSString)typeIdentifier;
- (NSURL)detachedRootLogicalURL;
- (NSURL)fileURL;
- (UTType)contentType;
- (id)_downloadingStatus;
- (id)_sharedByDecorationType;
- (id)copyAsPending;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreSpotlightIdentifier;
- (id)descriptionForFPCTL:(BOOL)a3;
- (id)fieldDifferencesWithItem:(id)a3;
- (id)fieldDifferencesWithItem:(id)a3 onlyMetadata:(BOOL)a4;
- (id)fp_valueForKeyPath:(id)a3;
- (id)humanReadableCapabilities;
- (id)scopedSearchQueryUnderItem;
- (id)strippedCopy;
- (id)toSearchableItem;
- (id)ubiquitousResourceKeysDiffAgainstItem:(id)a3;
- (int64_t)contentPolicy;
- (int64_t)effectiveContentPolicy;
- (int64_t)inheritedContentPolicy;
- (int64_t)localizedStandardTagsCompare:(id)a3;
- (unint64_t)capabilities;
- (unint64_t)depthInHierarchy;
- (unint64_t)enumerationOrigin;
- (unint64_t)exclusionType;
- (unint64_t)fileID;
- (unint64_t)fileSystemFlags;
- (unint64_t)folderType;
- (unint64_t)hash;
- (unint64_t)state;
- (unint64_t)unsupportedFields;
- (unsigned)documentID;
- (void)_coreSpotlightAttributeForKey:(id)a3;
- (void)_evaluateTypes:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)itemIsSupportedSearchScope:(id)a3;
- (void)itemIsSupportedSearchScopeWithCachePolicy:(unint64_t)a3 completionHandler:(id)a4;
- (void)overrideFields:(id)a3 ofItem:(id)a4;
- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setChildItemCount:(id)a3;
- (void)setCloudContainerIdentifier:(id)a3;
- (void)setCollaborationIdentifier:(id)a3;
- (void)setConflictingVersions:(id)a3;
- (void)setContainerDisplayName:(id)a3;
- (void)setContentModificationDate:(id)a3;
- (void)setContentPolicy:(int64_t)a3;
- (void)setContentType:(id)a3;
- (void)setContentZoneRoot:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setDecorations:(id)a3;
- (void)setDetachedRootLogicalURL:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDocumentID:(unsigned int)a3;
- (void)setDocumentSize:(id)a3;
- (void)setDownloaded:(BOOL)a3;
- (void)setDownloading:(BOOL)a3;
- (void)setDownloadingError:(id)a3;
- (void)setEffectiveContentPolicy:(int64_t)a3;
- (void)setEnumerationOrigin:(unint64_t)a3;
- (void)setExcludedFromSync:(BOOL)a3;
- (void)setExclusionType:(unint64_t)a3;
- (void)setExtendedAttributes:(id)a3;
- (void)setFavoriteRank:(id)a3;
- (void)setFileID:(unint64_t)a3;
- (void)setFileSystemFilename:(id)a3;
- (void)setFileSystemFlags:(unint64_t)a3;
- (void)setFileURL:(id)a3;
- (void)setFilename:(id)a3;
- (void)setFolderType:(unint64_t)a3;
- (void)setFormerIdentifier:(id)a3;
- (void)setFp_appContainerBundleIdentifier:(id)a3;
- (void)setFp_displayName:(id)a3;
- (void)setFp_isDownloadRequested:(BOOL)a3;
- (void)setFp_lastModifiedByCurrentUser:(BOOL)a3;
- (void)setFp_parentDomainIdentifier:(id)a3;
- (void)setFp_spotlightSubDomainIdentifier:(id)a3;
- (void)setHasUnresolvedConflicts:(id)a3;
- (void)setIgnoreRoot:(BOOL)a3;
- (void)setInPinnedFolder:(BOOL)a3;
- (void)setInheritedContentPolicy:(int64_t)a3;
- (void)setInheritedUserInfo:(id)a3;
- (void)setIsContainer:(BOOL)a3;
- (void)setIsContainerPristine:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemVersion:(id)a3;
- (void)setLastUsedDate:(id)a3;
- (void)setMostRecentEditorNameComponents:(id)a3;
- (void)setMostRecentVersionDownloaded:(BOOL)a3;
- (void)setOffline:(BOOL)a3;
- (void)setOriginatorInfo:(id)a3;
- (void)setOwnerNameComponents:(id)a3;
- (void)setParentFormerIdentifier:(id)a3;
- (void)setParentItemIdentifier:(id)a3;
- (void)setPending:(BOOL)a3;
- (void)setPinned:(BOOL)a3;
- (void)setPlaceholderIdentifier:(id)a3;
- (void)setPreformattedMostRecentEditorName:(id)a3;
- (void)setPreformattedOwnerName:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProviderDomainID:(id)a3;
- (void)setProviderID:(id)a3;
- (void)setQuarantineBlob:(id)a3;
- (void)setRecursivelyDownloaded:(BOOL)a3;
- (void)setShared:(BOOL)a3;
- (void)setSharedByCurrentUser:(BOOL)a3;
- (void)setSharingPermissions:(id)a3;
- (void)setSpotlightDomainIdentifier:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSupportsMostRecentVersionDownloaded:(BOOL)a3;
- (void)setSymlinkTargetPath:(id)a3;
- (void)setTagData:(id)a3;
- (void)setTags:(id)a3;
- (void)setTopLevelSharedItem:(BOOL)a3;
- (void)setTrashed:(BOOL)a3;
- (void)setTypeAndCreator:(NSFileProviderTypeAndCreator)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)setUbiquitous:(BOOL)a3;
- (void)setUploaded:(BOOL)a3;
- (void)setUploading:(BOOL)a3;
- (void)setUploadingError:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVersionIdentifier:(id)a3;
@end

@implementation FPItem

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (NSDate)contentModificationDate
{
  return self->_contentModificationDate;
}

- (BOOL)isTopLevelSharedItem
{
  return self->_topLevelSharedItem;
}

- (NSNumber)documentSize
{
  return self->_documentSize;
}

- (BOOL)isUploaded
{
  return self->_uploaded;
}

- (FPItem)initWithVendorItem:(id)a3 provider:(id)a4 domain:(id)a5 spotlightDomainIdentifier:(id)a6 extensionCapabilities:(unint64_t)a7 useFPFS:(BOOL)a8
{
  BOOL v220 = a8;
  char v216 = a7;
  uint64_t v227 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v18 = [v13 conformsToProtocol:&unk_1EF6C9170];
  if (v18)
  {
    if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector())
    {
      id v19 = [v13 providerIdentifier];

      if (isKindOfClass) {
        goto LABEL_9;
      }
    }
    else
    {
      id v19 = v14;
    }
    if (objc_opt_respondsToSelector())
    {
LABEL_9:
      objc_msgSend(v13, "fp_domainIdentifier");
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {
    id v19 = v14;
  }
  id v20 = v15;
LABEL_11:
  v21 = v20;

  if (v19)
  {
    int v215 = v18;
    v219 = v21;
    v22 = [v13 parentItemIdentifier];
    v23 = [v13 itemIdentifier];
    v24 = v23;
    if (v220)
    {
      v25 = @"NSFileProviderRootContainerItemIdentifier";
      if (([v23 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"] & 1) != 0
        || (v25 = @"NSFileProviderTrashContainerItemIdentifier",
            [v24 isEqualToString:@"NSFileProviderTrashContainerItemIdentifier"]))
      {
        v26 = v25;

        v22 = v26;
      }
    }
    id v217 = v16;
    v218 = v22;
    SEL v214 = a2;
    if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector())
    {
      v27 = [v13 itemVersion];
      p_itemVersion = &self->_itemVersion;
      itemVersion = self->_itemVersion;
      self->_itemVersion = v27;

      if (self->_itemVersion) {
        goto LABEL_25;
      }
      if (isKindOfClass)
      {
LABEL_24:
        v32 = [v13 versionIdentifier];
        v33 = [NSFileProviderItemVersion alloc];
        v34 = [MEMORY[0x1E4F1C9B8] data];
        uint64_t v35 = [(NSFileProviderItemVersion *)v33 initWithContentVersion:v32 metadataVersion:v34];
        v36 = *p_itemVersion;
        *p_itemVersion = (NSFileProviderItemVersion *)v35;

LABEL_25:
        v37 = [v13 filename];
        if (isKindOfClass)
        {
LABEL_29:
          v38 = [v13 contentType];
          objc_opt_class();
          char v39 = objc_opt_isKindOfClass();

          if (v39)
          {
            id v40 = [v13 contentType];
            goto LABEL_36;
          }
          if (isKindOfClass)
          {
LABEL_33:
            id v40 = [v13 typeIdentifier];

            if (v40)
            {
              v41 = (void *)MEMORY[0x1E4F442D8];
              v42 = [v13 typeIdentifier];
              objc_msgSend(v41, "fp_cachedTypeWithIdentifier:", v42);
              id v40 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_36:
            if (![(__CFString *)v37 length]
              && (dyld_program_sdk_at_least() & 1) == 0
              && [v24 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
            {
              v43 = fp_current_or_default_log();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A33AE000, v43, OS_LOG_TYPE_DEFAULT, "[WARNING] Working around missing file name for root item of legacy provider", buf, 2u);
              }

              v37 = @"Root";
            }
            if (!v40)
            {
              if (dyld_program_sdk_at_least())
              {
                id v40 = 0;
              }
              else
              {
                v44 = fp_current_or_default_log();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v226 = v24;
                  _os_log_impl(&dword_1A33AE000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Working around missing type identifier of legacy provider for item %@", buf, 0xCu);
                }

                id v40 = (id)*MEMORY[0x1E4F44408];
              }
            }
            if ([v19 length]
              && [v24 length]
              && [(__CFString *)v37 length]
              && v40)
            {
              if (!v220 || *p_itemVersion)
              {
                v45 = [(FPItem *)self initWithProviderID:v19 domainIdentifier:v219 itemIdentifier:v24 parentItemIdentifier:v218 filename:v37 contentType:v40];

                if (!v45)
                {
LABEL_367:
                  self = v45;
                  v30 = self;
                  id v16 = v217;
LABEL_63:

                  v21 = v219;
                  goto LABEL_64;
                }
                if (isKindOfClass)
                {
                  v45->_capabilities = [v13 capabilities];
                  int v46 = v215;
                }
                else
                {
                  if (v220) {
                    uint64_t v58 = 67;
                  }
                  else {
                    uint64_t v58 = 3;
                  }
                  if (objc_opt_respondsToSelector()) {
                    uint64_t v58 = [v13 capabilities];
                  }
                  v45->_capabilities = v58;
                  int v46 = v215;
                  if ((objc_opt_respondsToSelector() & 1) == 0)
                  {
                    documentSize = v45->_documentSize;
                    v45->_documentSize = 0;

                    goto LABEL_75;
                  }
                }
                uint64_t v59 = [v13 documentSize];
                v60 = v45->_documentSize;
                v45->_documentSize = (NSNumber *)v59;

                if (isKindOfClass)
                {
                  uint64_t v61 = [v13 childItemCount];
                  childItemCount = v45->_childItemCount;
                  v45->_childItemCount = (NSNumber *)v61;

                  goto LABEL_79;
                }
LABEL_75:
                if (objc_opt_respondsToSelector())
                {
                  uint64_t v64 = [v13 childItemCount];
                  v65 = v45->_childItemCount;
                  v45->_childItemCount = (NSNumber *)v64;
                }
                else
                {
                  v65 = v45->_childItemCount;
                  v45->_childItemCount = 0;
                }

                if ((objc_opt_respondsToSelector() & 1) == 0)
                {
                  uint64_t v68 = [MEMORY[0x1E4F1C9C8] date];
                  creationDate = v45->_creationDate;
                  v45->_creationDate = (NSDate *)v68;

                  v45->_unsupportedFields |= 0x40uLL;
LABEL_82:
                  if ((objc_opt_respondsToSelector() & 1) == 0)
                  {
                    uint64_t v72 = [MEMORY[0x1E4F1C9C8] date];
                    contentModificationDate = v45->_contentModificationDate;
                    v45->_contentModificationDate = (NSDate *)v72;

                    v45->_unsupportedFields |= 0x80uLL;
                    if ((v46 & 1) == 0) {
                      goto LABEL_89;
                    }
                    goto LABEL_87;
                  }
LABEL_83:
                  uint64_t v70 = [v13 contentModificationDate];
                  v71 = v45->_contentModificationDate;
                  v45->_contentModificationDate = (NSDate *)v70;

                  if ((v46 & 1) == 0) {
                    goto LABEL_89;
                  }
                  if (isKindOfClass) {
                    goto LABEL_88;
                  }
LABEL_87:
                  if (objc_opt_respondsToSelector())
                  {
LABEL_88:
                    uint64_t v74 = [v13 formerIdentifier];
                    formerIdentifier = v45->_formerIdentifier;
                    v45->_formerIdentifier = (NSString *)v74;
LABEL_90:

                    if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector())
                    {
                      uint64_t v76 = [v13 lastUsedDate];
                      lastUsedDate = v45->_lastUsedDate;
                      v45->_lastUsedDate = (NSDate *)v76;

                      if ((v46 & 1) == 0) {
                        goto LABEL_98;
                      }
                      if (isKindOfClass) {
                        goto LABEL_97;
                      }
                    }
                    else
                    {
                      v78 = v45->_lastUsedDate;
                      v45->_lastUsedDate = 0;

                      v45->_unsupportedFields |= 8uLL;
                      if ((v46 & 1) == 0) {
                        goto LABEL_98;
                      }
                    }
                    if (objc_opt_respondsToSelector())
                    {
LABEL_97:
                      uint64_t v79 = [v13 tags];
                      tags = v45->_tags;
                      v45->_tags = (NSArray *)v79;
                      goto LABEL_99;
                    }
LABEL_98:
                    tags = v45->_tags;
                    v45->_tags = 0;
LABEL_99:

                    if (!v45->_tags)
                    {
                      if ((isKindOfClass & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
                      {
                        v45->_unsupportedFields |= 0x10uLL;
                        goto LABEL_108;
                      }
                      v81 = [v13 tagData];
                      v82 = v81;
                      if (v81)
                      {
                        uint64_t v83 = FPGetTagsFromTagsData(v81);
                        v84 = v45->_tags;
                        v45->_tags = (NSArray *)v83;
                      }
                      int v46 = v215;
                    }
                    if (isKindOfClass)
                    {
                      uint64_t v85 = [v13 favoriteRank];
                      favoriteRank = v45->_favoriteRank;
                      v45->_favoriteRank = (NSNumber *)v85;

                      v45->_trashed = [v13 isTrashed];
                      v45->_uploaded = [v13 isUploaded];
                      v45->_uploading = [v13 isUploading];
                      goto LABEL_120;
                    }
LABEL_108:
                    if (objc_opt_respondsToSelector())
                    {
                      uint64_t v87 = [v13 favoriteRank];
                      v88 = v45->_favoriteRank;
                      v45->_favoriteRank = (NSNumber *)v87;
                    }
                    else
                    {
                      v89 = v45->_favoriteRank;
                      v45->_favoriteRank = 0;

                      v45->_unsupportedFields |= 0x20uLL;
                    }
                    if (objc_opt_respondsToSelector()) {
                      char v90 = [v13 isTrashed];
                    }
                    else {
                      char v90 = 0;
                    }
                    v45->_trashed = v90;
                    char v91 = objc_opt_respondsToSelector();
                    char v92 = v220;
                    if (v91) {
                      char v92 = [v13 isUploaded];
                    }
                    v45->_uploaded = v92;
                    if (objc_opt_respondsToSelector()) {
                      char v93 = [v13 isUploading];
                    }
                    else {
                      char v93 = 0;
                    }
                    v45->_uploading = v93;
                    if ((objc_opt_respondsToSelector() & 1) == 0)
                    {
                      v94 = 0;
LABEL_122:
                      uint64_t v95 = objc_msgSend(v94, "fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:", @"item.uploadingError", 0);
                      uploadingError = v45->_uploadingError;
                      v45->_uploadingError = (NSError *)v95;

                      if (isKindOfClass)
                      {
                        v45->_downloading = [v13 isDownloading];
                        v45->_char downloaded = [v13 isDownloaded];
                        v45->_mostRecentVersionDownloaded = [v13 isMostRecentVersionDownloaded];
                        v45->_supportsMostRecentVersionDownloaded = 1;
                      }
                      else
                      {
                        if (objc_opt_respondsToSelector()) {
                          char v97 = [v13 isDownloading];
                        }
                        else {
                          char v97 = 0;
                        }
                        v45->_downloading = v97;
                        if (objc_opt_respondsToSelector()) {
                          char v98 = [v13 isDownloaded];
                        }
                        else {
                          char v98 = 0;
                        }
                        v45->_char downloaded = v98;
                        if (objc_opt_respondsToSelector()) {
                          char downloaded = [v13 isMostRecentVersionDownloaded];
                        }
                        else {
                          char downloaded = v45->_downloaded;
                        }
                        v45->_mostRecentVersionDownloaded = downloaded;
                        if (objc_opt_respondsToSelector()) {
                          v45->_supportsMostRecentVersionDownloaded = 1;
                        }
                        int v46 = v215;
                        if ((objc_opt_respondsToSelector() & 1) == 0)
                        {
                          v100 = 0;
LABEL_138:
                          v213 = v100;
                          uint64_t v101 = objc_msgSend(v100, "fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:", @"item.downloadingError", 0);
                          downloadingError = v45->_downloadingError;
                          v45->_downloadingError = (NSError *)v101;

                          if (isKindOfClass)
                          {
                            v45->_char shared = [v13 isShared];
                            v45->_sharedByCurrentUser = [v13 isSharedByCurrentUser];
                            if ((v46 & 1) == 0) {
                              goto LABEL_151;
                            }
                          }
                          else
                          {
                            if (objc_opt_respondsToSelector()) {
                              char v103 = [v13 isShared];
                            }
                            else {
                              char v103 = 0;
                            }
                            v45->_char shared = v103;
                            if (objc_opt_respondsToSelector())
                            {
                              v45->_sharedByCurrentUser = [v13 isSharedByCurrentUser];
                              if ((v46 & 1) == 0)
                              {
LABEL_151:
                                v45->_fp_lastModifiedByCurrentUser = 0;
                                if (isKindOfClass) {
                                  goto LABEL_153;
                                }
                                goto LABEL_152;
                              }
                            }
                            else
                            {
                              v45->_sharedByCurrentUser = 0;
                              if (!v46) {
                                goto LABEL_151;
                              }
                            }
                            if ((objc_opt_respondsToSelector() & 1) == 0) {
                              goto LABEL_151;
                            }
                          }
                          v45->_fp_lastModifiedByCurrentUser = objc_msgSend(v13, "fp_isLastModifiedByCurrentUser");
                          if (isKindOfClass) {
                            goto LABEL_153;
                          }
LABEL_152:
                          if ((objc_opt_respondsToSelector() & 1) == 0)
                          {
                            if ((v46 & 1) == 0) {
                              goto LABEL_161;
                            }
                            goto LABEL_157;
                          }
LABEL_153:
                          uint64_t v104 = [v13 collaborationIdentifier];
                          collaborationIdentifier = v45->_collaborationIdentifier;
                          v45->_collaborationIdentifier = (NSString *)v104;

                          if ((v46 & 1) == 0) {
                            goto LABEL_161;
                          }
                          if (isKindOfClass)
                          {
LABEL_158:
                            v45->_isCollaborationInvitation = [v13 isCollaborationInvitation];
                            if ((isKindOfClass & 1) == 0) {
                              goto LABEL_159;
                            }
                            goto LABEL_162;
                          }
LABEL_157:
                          if (objc_opt_respondsToSelector()) {
                            goto LABEL_158;
                          }
LABEL_161:
                          v45->_isCollaborationInvitation = 0;
                          if ((isKindOfClass & 1) == 0)
                          {
LABEL_159:
                            if (objc_opt_respondsToSelector())
                            {
                              uint64_t v106 = [v13 ownerNameComponents];
                              ownerNameComponents = v45->_ownerNameComponents;
                              v45->_ownerNameComponents = (NSPersonNameComponents *)v106;
                            }
                            else
                            {
                              ownerNameComponents = v45->_ownerNameComponents;
                              v45->_ownerNameComponents = 0;
                            }

                            if ((objc_opt_respondsToSelector() & 1) == 0)
                            {
                              mostRecentEditorNameComponents = v45->_mostRecentEditorNameComponents;
                              v45->_mostRecentEditorNameComponents = 0;

                              if ((v46 & 1) == 0) {
                                goto LABEL_171;
                              }
                              goto LABEL_169;
                            }
LABEL_165:
                            uint64_t v110 = [v13 mostRecentEditorNameComponents];
                            v111 = v45->_mostRecentEditorNameComponents;
                            v45->_mostRecentEditorNameComponents = (NSPersonNameComponents *)v110;

                            if ((v46 & 1) == 0) {
                              goto LABEL_171;
                            }
                            if (isKindOfClass) {
                              goto LABEL_170;
                            }
LABEL_169:
                            if (objc_opt_respondsToSelector())
                            {
LABEL_170:
                              uint64_t v113 = [v13 originatorInfo];
                              originatorInfo = v45->_originatorInfo;
                              v45->_originatorInfo = (NSData *)v113;
LABEL_172:

                              if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector())
                              {
                                uint64_t v115 = [v13 userInfo];
                                userInfo = v45->_userInfo;
                                v45->_userInfo = (NSDictionary *)v115;

                                if (v46)
                                {
                                  if (isKindOfClass)
                                  {
                                    v45->_excludedFromSync = [v13 isExcludedFromSync];
                                    v45->_ignoreRoot = [v13 isIgnoreRoot];
LABEL_186:
                                    uint64_t v119 = [v13 exclusionType];
                                    goto LABEL_188;
                                  }
LABEL_178:
                                  if (objc_opt_respondsToSelector()) {
                                    char v118 = [v13 isExcludedFromSync];
                                  }
                                  else {
                                    char v118 = 0;
                                  }
                                  v45->_excludedFromSync = v118;
                                  if (objc_opt_respondsToSelector()) {
                                    char v120 = [v13 isIgnoreRoot];
                                  }
                                  else {
                                    char v120 = 0;
                                  }
                                  v45->_ignoreRoot = v120;
                                  if ((objc_opt_respondsToSelector() & 1) == 0)
                                  {
                                    uint64_t v119 = 0;
                                    goto LABEL_188;
                                  }
                                  goto LABEL_186;
                                }
                              }
                              else
                              {
                                v117 = v45->_userInfo;
                                v45->_userInfo = 0;

                                if (v46) {
                                  goto LABEL_178;
                                }
                              }
                              uint64_t v119 = 0;
                              *(_WORD *)&v45->_excludedFromSync = 0;
LABEL_188:
                              v45->_exclusionType = v119;
                              if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector())
                              {
                                uint64_t v121 = [v13 symlinkTargetPath];
                                symlinkTargetPath = v45->_symlinkTargetPath;
                                v45->_symlinkTargetPath = (NSString *)v121;
                              }
                              else
                              {
                                symlinkTargetPath = v45->_symlinkTargetPath;
                                v45->_symlinkTargetPath = 0;
                              }

                              if (!v220)
                              {
                                if (v46 && ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
                                {
                                  uint64_t v123 = [v13 fileURL];
                                  fileURL = v45->_fileURL;
                                  v45->_fileURL = (NSURL *)v123;
                                }
                                else
                                {
                                  fileURL = v45->_fileURL;
                                  v45->_fileURL = 0;
                                }
                              }
                              if (v217)
                              {
                                objc_storeStrong((id *)&v45->_spotlightDomainIdentifier, a6);
                                if (v46)
                                {
                                  if (isKindOfClass)
                                  {
                                    uint64_t v125 = objc_msgSend(v13, "fp_spotlightSubDomainIdentifier");
                                    fp_spotlightSubDomainIdentifier = v45->_fp_spotlightSubDomainIdentifier;
                                    v45->_fp_spotlightSubDomainIdentifier = (NSString *)v125;

                                    goto LABEL_217;
                                  }
LABEL_207:
                                  if (objc_opt_respondsToSelector())
                                  {
                                    if (objc_opt_respondsToSelector())
                                    {
LABEL_209:
                                      uint64_t v129 = objc_msgSend(v13, "fp_spotlightSubDomainIdentifier");
                                      v130 = v45->_fp_spotlightSubDomainIdentifier;
                                      v45->_fp_spotlightSubDomainIdentifier = (NSString *)v129;

                                      if (isKindOfClass)
                                      {
                                        uint64_t v131 = [v13 displayName];
                                        displayName = v45->_displayName;
                                        v45->_displayName = (NSString *)v131;

                                        goto LABEL_221;
                                      }
LABEL_216:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v144 = v45->_displayName;
                                        v45->_displayName = 0;

                                        goto LABEL_220;
                                      }
LABEL_217:
                                      uint64_t v140 = [v13 displayName];
                                      v141 = v45->_displayName;
                                      v45->_displayName = (NSString *)v140;

                                      if (isKindOfClass)
                                      {
                                        uint64_t v142 = [v13 hasUnresolvedConflicts];
                                        hasUnresolvedConflicts = v45->_hasUnresolvedConflicts;
                                        v45->_hasUnresolvedConflicts = (NSNumber *)v142;

                                        goto LABEL_225;
                                      }
LABEL_220:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v149 = v45->_hasUnresolvedConflicts;
                                        v45->_hasUnresolvedConflicts = 0;

                                        goto LABEL_224;
                                      }
LABEL_221:
                                      uint64_t v145 = [v13 hasUnresolvedConflicts];
                                      v146 = v45->_hasUnresolvedConflicts;
                                      v45->_hasUnresolvedConflicts = (NSNumber *)v145;

                                      if (isKindOfClass)
                                      {
                                        uint64_t v147 = [v13 isDownloadRequested];
                                        isDownloadRequested = v45->_isDownloadRequested;
                                        v45->_isDownloadRequested = (NSNumber *)v147;

                                        goto LABEL_229;
                                      }
LABEL_224:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v154 = v45->_isDownloadRequested;
                                        v45->_isDownloadRequested = 0;

                                        goto LABEL_228;
                                      }
LABEL_225:
                                      uint64_t v150 = [v13 isDownloadRequested];
                                      v151 = v45->_isDownloadRequested;
                                      v45->_isDownloadRequested = (NSNumber *)v150;

                                      if (isKindOfClass)
                                      {
                                        uint64_t v152 = [v13 sharingPermissions];
                                        sharingPermissions = v45->_sharingPermissions;
                                        v45->_sharingPermissions = (NSString *)v152;

                                        goto LABEL_230;
                                      }
LABEL_228:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v158 = v45->_sharingPermissions;
                                        v45->_sharingPermissions = 0;

                                        goto LABEL_234;
                                      }
LABEL_229:
                                      uint64_t v155 = [v13 sharingPermissions];
                                      v156 = v45->_sharingPermissions;
                                      v45->_sharingPermissions = (NSString *)v155;

                                      if (isKindOfClass)
                                      {
LABEL_230:
                                        char v157 = objc_msgSend(v13, "fp_isContainer");
                                        v45->_isContainer = v157;
                                        p_isContainer = &v45->_isContainer;
                                        if ((v157 & 1) == 0) {
                                          goto LABEL_242;
                                        }
                                        if (isKindOfClass)
                                        {
                                          v45->_isContainerPristine = objc_msgSend(v13, "fp_isContainerPristine");
LABEL_241:
                                          uint64_t v161 = objc_msgSend(v13, "fp_appContainerBundleIdentifier");
                                          fp_appContainerBundleIdentifier = v45->_fp_appContainerBundleIdentifier;
                                          v45->_fp_appContainerBundleIdentifier = (NSString *)v161;

LABEL_242:
                                          if (isKindOfClass) {
                                            goto LABEL_246;
                                          }
LABEL_245:
                                          if (objc_opt_respondsToSelector())
                                          {
LABEL_246:
                                            uint64_t v164 = [v13 containerDisplayName];
                                            containerDisplayName = v45->_containerDisplayName;
                                            v45->_containerDisplayName = (NSString *)v164;
                                            goto LABEL_248;
                                          }
LABEL_247:
                                          containerDisplayName = v45->_containerDisplayName;
                                          v45->_containerDisplayName = 0;
LABEL_248:

                                          if (!v45->_fp_appContainerBundleIdentifier)
                                          {
                                            if ((isKindOfClass & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
                                            {
                                              if (v46) {
                                                goto LABEL_256;
                                              }
                                              goto LABEL_258;
                                            }
                                            v166 = [v13 performSelector:sel_fp_cloudContainerClientBundleIdentifiers];
                                            uint64_t v167 = +[FPAppMetadata findBundleIDForCurrentPlatformInSet:v166];
                                            v168 = v45->_fp_appContainerBundleIdentifier;
                                            v45->_fp_appContainerBundleIdentifier = (NSString *)v167;
                                          }
                                          if (v46)
                                          {
                                            if (isKindOfClass)
                                            {
                                              uint64_t v169 = objc_msgSend(v13, "fp_parentDomainIdentifier");
                                              fp_parentDomainIdentifier = v45->_fp_parentDomainIdentifier;
                                              v45->_fp_parentDomainIdentifier = (NSString *)v169;

                                              goto LABEL_263;
                                            }
LABEL_256:
                                            if (objc_opt_respondsToSelector())
                                            {
                                              uint64_t v171 = objc_msgSend(v13, "fp_parentDomainIdentifier");
                                              v172 = v45->_fp_parentDomainIdentifier;
                                              v45->_fp_parentDomainIdentifier = (NSString *)v171;
                                            }
                                            else
                                            {
                                              v172 = v45->_fp_parentDomainIdentifier;
                                              v45->_fp_parentDomainIdentifier = 0;
                                            }

                                            if ((objc_opt_respondsToSelector() & 1) == 0)
                                            {
                                              cloudContainerIdentifier = v45->_cloudContainerIdentifier;
                                              v45->_cloudContainerIdentifier = 0;

                                              if (!v45->_excludedFromSync) {
                                                goto LABEL_269;
                                              }
                                              goto LABEL_267;
                                            }
LABEL_263:
                                            uint64_t v176 = objc_msgSend(v13, "fp_cloudContainerIdentifier");
                                            v177 = v45->_cloudContainerIdentifier;
                                            v45->_cloudContainerIdentifier = (NSString *)v176;

                                            if (!v45->_excludedFromSync)
                                            {
                                              if (isKindOfClass) {
                                                goto LABEL_270;
                                              }
LABEL_269:
                                              if (objc_opt_respondsToSelector())
                                              {
LABEL_270:
                                                v45->_isUbiquitous = objc_msgSend(v13, "fp_isUbiquitous");
                                                goto LABEL_273;
                                              }
                                              goto LABEL_271;
                                            }
LABEL_267:
                                            v45->_isUbiquitous = 0;
                                            if (v46)
                                            {
LABEL_273:
                                              if (isKindOfClass)
                                              {
                                                v45->_topLevelSharedItem = [v13 isTopLevelSharedItem];
                                                v45->_contentZoneRoot = [v13 isContentZoneRoot];
                                                v45->_inPinnedFolder = [v13 isInPinnedFolder];
                                                v45->_pinned = [v13 isPinned];
                                                v45->_recursivelyDownloaded = [v13 isRecursivelyDownloaded];
LABEL_292:
                                                uint64_t v184 = [v13 conflictingVersions];
                                                conflictingVersions = v45->_conflictingVersions;
                                                v45->_conflictingVersions = (NSArray *)v184;
LABEL_294:

                                                if ((isKindOfClass & 1) != 0
                                                  || (objc_opt_respondsToSelector() & 1) != 0)
                                                {
                                                  v186 = [v13 extendedAttributes];
                                                  if (v186)
                                                  {
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                    {
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                      {
                                                        v211 = [MEMORY[0x1E4F28B00] currentHandler];
                                                        uint64_t v210 = objc_opt_class();
                                                        [v211 handleFailureInMethod:v214, v45, @"FPItem.m", 831, @"extendedAttributes on %@ has class %@ instead of %@", v13, v210, objc_opt_class() object file lineNumber description];
                                                      }
                                                    }
                                                    v221[0] = MEMORY[0x1E4F143A8];
                                                    v221[1] = 3221225472;
                                                    v221[2] = __101__FPItem_initWithVendorItem_provider_domain_spotlightDomainIdentifier_extensionCapabilities_useFPFS___block_invoke;
                                                    v221[3] = &unk_1E5AF16F8;
                                                    id v222 = v13;
                                                    SEL v224 = v214;
                                                    v187 = v45;
                                                    v223 = v187;
                                                    uint64_t v188 = objc_msgSend(v186, "fp_filter:", v221);
                                                    extendedAttributes = v187->_extendedAttributes;
                                                    v187->_extendedAttributes = (NSDictionary *)v188;

                                                    int v46 = v215;
                                                  }

                                                  if (isKindOfClass)
                                                  {
                                                    v45->_fileSystemFlags = [v13 fileSystemFlags];
                                                    v45->_enumerationOrigin = 0;
                                                    goto LABEL_317;
                                                  }
                                                }
                                                else
                                                {
                                                  v45->_unsupportedFields |= 0x200uLL;
                                                }
                                                if (objc_opt_respondsToSelector())
                                                {
                                                  v45->_fileSystemFlags = [v13 fileSystemFlags];
                                                }
                                                else
                                                {
                                                  if ((v45->_capabilities & 2) != 0) {
                                                    uint64_t v190 = 20;
                                                  }
                                                  else {
                                                    uint64_t v190 = 16;
                                                  }
                                                  unint64_t v191 = v190 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v45->_capabilities & 1));
                                                  if (v46
                                                    && (objc_opt_respondsToSelector() & 1) != 0
                                                    && [v13 isHidden])
                                                  {
                                                    uint64_t v192 = v191 | 8;
                                                  }
                                                  else
                                                  {
                                                    BOOL v193 = [(NSString *)v45->_filename hasPrefix:@"."];
                                                    uint64_t v192 = v191 | 8;
                                                    if (!v193) {
                                                      uint64_t v192 = v191;
                                                    }
                                                  }
                                                  v45->_fileSystemFlags = v192;
                                                  v45->_unsupportedFields |= 0x100uLL;
                                                }
                                                v45->_enumerationOrigin = 0;
                                                if ((objc_opt_respondsToSelector() & 1) == 0)
                                                {
                                                  v45->_contentPolicy = 0;
                                                  if (v220) {
                                                    goto LABEL_326;
                                                  }
LABEL_320:
                                                  if (!v45->_downloaded
                                                    || !v45->_uploaded
                                                    || *p_isContainer
                                                    || [(FPItem *)v45 isFolder]
                                                    || (uint64_t v207 = [(NSNumber *)v45->_documentSize integerValue], (v216 & 2) == 0)|| v207 <= 2048)
                                                  {
                                                    if (!v45->_inPinnedFolder) {
                                                      v45->_capabilities &= ~0x40uLL;
                                                    }
                                                  }
LABEL_326:
                                                  if ((v216 & 4) != 0) {
                                                    v45->_capabilities |= 0x20000000uLL;
                                                  }
                                                  if (v46)
                                                  {
                                                    if (isKindOfClass)
                                                    {
                                                      uint64_t v194 = [v13 preformattedOwnerName];
                                                      preformattedOwnerName = v45->_preformattedOwnerName;
                                                      v45->_preformattedOwnerName = (NSString *)v194;

LABEL_336:
                                                      uint64_t v199 = [v13 preformattedMostRecentEditorName];
                                                      preformattedMostRecentEditorName = v45->_preformattedMostRecentEditorName;
                                                      v45->_preformattedMostRecentEditorName = (NSString *)v199;
                                                      goto LABEL_338;
                                                    }
                                                    if (objc_opt_respondsToSelector())
                                                    {
                                                      uint64_t v197 = [v13 preformattedOwnerName];
                                                      v198 = v45->_preformattedOwnerName;
                                                      v45->_preformattedOwnerName = (NSString *)v197;
                                                    }
                                                    else
                                                    {
                                                      v198 = v45->_preformattedOwnerName;
                                                      v45->_preformattedOwnerName = 0;
                                                    }

                                                    if (objc_opt_respondsToSelector()) {
                                                      goto LABEL_336;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v196 = v45->_preformattedOwnerName;
                                                    v45->_preformattedOwnerName = 0;
                                                  }
                                                  preformattedMostRecentEditorName = v45->_preformattedMostRecentEditorName;
                                                  v45->_preformattedMostRecentEditorName = 0;
LABEL_338:

                                                  if ([(NSData *)v45->_versionIdentifier length] >= 0x3E9)
                                                  {
                                                    v208 = [MEMORY[0x1E4F28B00] currentHandler];
                                                    objc_msgSend(v208, "handleFailureInMethod:object:file:lineNumber:description:", v214, v45, @"FPItem.m", 899, @"version identifiers are limited to %lu bytes", 1000);
                                                  }
                                                  if ([v13 conformsToProtocol:&unk_1EF6C8488])
                                                  {
                                                    if ((isKindOfClass & 1) == 0
                                                      && (objc_opt_respondsToSelector() & 1) == 0)
                                                    {
                                                      if (v46)
                                                      {
LABEL_348:
                                                        if (objc_opt_respondsToSelector()) {
                                                          uint64_t v203 = [v13 fileID];
                                                        }
                                                        else {
                                                          uint64_t v203 = 0;
                                                        }
                                                        v45->_fileID = v203;
                                                        if (objc_opt_respondsToSelector()) {
                                                          unsigned int v204 = [v13 documentID];
                                                        }
                                                        else {
                                                          unsigned int v204 = 0;
                                                        }
                                                        v45->_documentID = v204;
                                                        if (objc_opt_respondsToSelector()) {
                                                          goto LABEL_356;
                                                        }
LABEL_357:
                                                        inheritedUserInfo = v45->_inheritedUserInfo;
                                                        v45->_inheritedUserInfo = 0;
                                                        goto LABEL_358;
                                                      }
LABEL_350:
                                                      v45->_fileID = 0;
                                                      v45->_documentID = 0;
                                                      goto LABEL_357;
                                                    }
                                                    uint64_t v201 = [v13 decorations];
                                                    decorations = v45->_decorations;
                                                    v45->_decorations = (NSArray *)v201;
                                                  }
                                                  if (v46)
                                                  {
                                                    if (isKindOfClass)
                                                    {
                                                      v45->_fileID = [v13 fileID];
                                                      v45->_documentID = [v13 documentID];
LABEL_356:
                                                      uint64_t v205 = [v13 inheritedUserInfo];
                                                      inheritedUserInfo = v45->_inheritedUserInfo;
                                                      v45->_inheritedUserInfo = (NSDictionary *)v205;
LABEL_358:

                                                      if ((isKindOfClass & 1) != 0
                                                        || (objc_opt_respondsToSelector() & 1) != 0)
                                                      {
                                                        v45->_typeAndCreator.type = [v13 typeAndCreator];
                                                        v45->_typeAndCreator.creator = (unint64_t)[v13 typeAndCreator] >> 32;
                                                        if ((v46 & 1) == 0) {
                                                          goto LABEL_366;
                                                        }
                                                        if (isKindOfClass) {
                                                          goto LABEL_365;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v45->_typeAndCreator = 0;
                                                        v45->_unsupportedFields |= 0x400uLL;
                                                        if ((v46 & 1) == 0) {
                                                          goto LABEL_366;
                                                        }
                                                      }
                                                      if (objc_opt_respondsToSelector()) {
LABEL_365:
                                                      }
                                                        v45->_unsupportedFields = [v13 unsupportedFields];
LABEL_366:

                                                      goto LABEL_367;
                                                    }
                                                    goto LABEL_348;
                                                  }
                                                  goto LABEL_350;
                                                }
LABEL_317:
                                                __FILEPROVIDER_BAD_CONTENT_POLICY__([v13 contentPolicy], v220);
                                                v45->_contentPolicy = [v13 contentPolicy];
                                                v45->_capabilities |= 0x40uLL;
                                                if (v220) {
                                                  goto LABEL_326;
                                                }
                                                goto LABEL_320;
                                              }
                                              if (objc_opt_respondsToSelector()) {
                                                char shared = [v13 isTopLevelSharedItem];
                                              }
                                              else {
                                                char shared = v45->_shared;
                                              }
                                              v45->_topLevelSharedItem = shared;
                                              if (objc_opt_respondsToSelector()) {
                                                char v180 = [v13 isContentZoneRoot];
                                              }
                                              else {
                                                char v180 = 0;
                                              }
                                              v45->_contentZoneRoot = v180;
                                              if (objc_opt_respondsToSelector()) {
                                                char v181 = [v13 isInPinnedFolder];
                                              }
                                              else {
                                                char v181 = 0;
                                              }
                                              v45->_inPinnedFolder = v181;
                                              if (objc_opt_respondsToSelector()) {
                                                char v182 = [v13 isPinned];
                                              }
                                              else {
                                                char v182 = 0;
                                              }
                                              v45->_pinned = v182;
                                              if (objc_opt_respondsToSelector()) {
                                                char v183 = [v13 isRecursivelyDownloaded];
                                              }
                                              else {
                                                char v183 = 0;
                                              }
                                              v45->_recursivelyDownloaded = v183;
                                              if (objc_opt_respondsToSelector()) {
                                                goto LABEL_292;
                                              }
LABEL_293:
                                              conflictingVersions = v45->_conflictingVersions;
                                              v45->_conflictingVersions = 0;
                                              goto LABEL_294;
                                            }
LABEL_275:
                                            v45->_topLevelSharedItem = v45->_shared;
                                            v45->_contentZoneRoot = 0;
                                            *(_WORD *)&v45->_inPinnedFolder = 0;
                                            v45->_recursivelyDownloaded = 0;
                                            goto LABEL_293;
                                          }
LABEL_258:
                                          v173 = v45->_fp_parentDomainIdentifier;
                                          v45->_fp_parentDomainIdentifier = 0;

                                          v174 = v45->_cloudContainerIdentifier;
                                          v45->_cloudContainerIdentifier = 0;

                                          if (!v45->_excludedFromSync)
                                          {
                                            if (isKindOfClass)
                                            {
                                              char v175 = 1;
                                              goto LABEL_272;
                                            }
LABEL_271:
                                            char v175 = objc_opt_respondsToSelector();
LABEL_272:
                                            v45->_isUbiquitous = v175 & 1;
                                            if (v46) {
                                              goto LABEL_273;
                                            }
                                            goto LABEL_275;
                                          }
                                          goto LABEL_267;
                                        }
LABEL_236:
                                        if (objc_opt_respondsToSelector()) {
                                          char v160 = objc_msgSend(v13, "fp_isContainerPristine");
                                        }
                                        else {
                                          char v160 = 0;
                                        }
                                        v45->_isContainerPristine = v160;
                                        if ((objc_opt_respondsToSelector() & 1) == 0)
                                        {
                                          v163 = v45->_fp_appContainerBundleIdentifier;
                                          v45->_fp_appContainerBundleIdentifier = 0;

                                          goto LABEL_245;
                                        }
                                        goto LABEL_241;
                                      }
LABEL_234:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v45->_isContainer = 0;
                                        p_isContainer = &v45->_isContainer;
                                        goto LABEL_245;
                                      }
                                      char v159 = objc_msgSend(v13, "fp_isContainer");
                                      v45->_isContainer = v159;
                                      p_isContainer = &v45->_isContainer;
                                      if ((v159 & 1) == 0) {
                                        goto LABEL_245;
                                      }
                                      goto LABEL_236;
                                    }
                                  }
                                  else if (objc_opt_respondsToSelector())
                                  {
                                    uint64_t v138 = objc_msgSend(v13, "fp_spotlightDomainIdentifier");
                                    v139 = v45->_fp_spotlightSubDomainIdentifier;
                                    v45->_fp_spotlightSubDomainIdentifier = (NSString *)v138;
LABEL_215:

                                    goto LABEL_216;
                                  }
                                  v139 = v45->_fp_spotlightSubDomainIdentifier;
                                  v45->_fp_spotlightSubDomainIdentifier = 0;
                                  goto LABEL_215;
                                }
                              }
                              else if (isKindOfClass)
                              {
                                uint64_t v127 = [v13 spotlightDomainIdentifier];
                                spotlightDomainIdentifier = v45->_spotlightDomainIdentifier;
                                v45->_spotlightDomainIdentifier = (NSString *)v127;

                                if (v46) {
                                  goto LABEL_209;
                                }
                              }
                              else if (v46)
                              {
                                goto LABEL_207;
                              }
                              v133 = v45->_fp_spotlightSubDomainIdentifier;
                              v45->_fp_spotlightSubDomainIdentifier = 0;

                              v134 = v45->_displayName;
                              v45->_displayName = 0;

                              v135 = v45->_hasUnresolvedConflicts;
                              v45->_hasUnresolvedConflicts = 0;

                              v136 = v45->_isDownloadRequested;
                              v45->_isDownloadRequested = 0;

                              v137 = v45->_sharingPermissions;
                              v45->_sharingPermissions = 0;

                              v45->_isContainer = 0;
                              p_isContainer = &v45->_isContainer;
                              goto LABEL_247;
                            }
LABEL_171:
                            originatorInfo = v45->_originatorInfo;
                            v45->_originatorInfo = 0;
                            goto LABEL_172;
                          }
LABEL_162:
                          uint64_t v108 = [v13 ownerNameComponents];
                          v109 = v45->_ownerNameComponents;
                          v45->_ownerNameComponents = (NSPersonNameComponents *)v108;

                          goto LABEL_165;
                        }
                      }
                      v100 = [v13 downloadingError];
                      goto LABEL_138;
                    }
LABEL_120:
                    v94 = [v13 uploadingError];
                    goto LABEL_122;
                  }
LABEL_89:
                  formerIdentifier = v45->_formerIdentifier;
                  v45->_formerIdentifier = 0;
                  goto LABEL_90;
                }
LABEL_79:
                uint64_t v66 = [v13 creationDate];
                v67 = v45->_creationDate;
                v45->_creationDate = (NSDate *)v66;

                if (isKindOfClass) {
                  goto LABEL_83;
                }
                goto LABEL_82;
              }
              BOOL v48 = 1;
              int v47 = v220;
            }
            else
            {
              int v47 = v220;
              BOOL v48 = v220 && *p_itemVersion == 0;
            }
            __FILEPROVIDER_BAD_ITEM__(v13, v19, v24, v37, (uint64_t)v40, v48, v47);
            fp_simulate_crash(@"can't create item because at least one of the required properties is missing. See the log for more details.", v49, v50, v51, v52, v53, v54, v55, v209);
            v56 = fp_current_or_default_log();
            id v16 = v217;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
              -[FPItem initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:]();
            }

            v30 = 0;
            goto LABEL_63;
          }
LABEL_32:
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            id v40 = 0;
            goto LABEL_36;
          }
          goto LABEL_33;
        }
LABEL_28:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_32;
        }
        goto LABEL_29;
      }
    }
    else
    {
      p_itemVersion = &self->_itemVersion;
      v31 = self->_itemVersion;
      self->_itemVersion = 0;

      if (self->_itemVersion) {
        goto LABEL_27;
      }
    }
    if (objc_opt_respondsToSelector()) {
      goto LABEL_24;
    }
LABEL_27:
    v37 = [v13 filename];
    goto LABEL_28;
  }
  v30 = 0;
LABEL_64:

  return v30;
}

- (BOOL)isExternalDownloadPlaceholder
{
  v2 = [(FPItem *)self typeIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.safari.download"];

  return v3;
}

- (NSString)typeIdentifier
{
  v2 = [(FPItem *)self contentType];
  char v3 = [v2 identifier];

  return (NSString *)v3;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (unint64_t)folderType
{
  if (![(FPItem *)self isFolder]) {
    return 0;
  }
  unint64_t result = self->_folderType;
  if (!result)
  {
    v4 = [(FPItem *)self filename];
    v5 = [(FPItem *)self parentItemIdentifier];
    v6 = [(FPItem *)self providerID];
    v7 = [(FPItem *)self detachedRootLogicalURL];
    v8 = v7;
    if (!v7)
    {
      v8 = [(FPItem *)self fileURL];
    }
    int v9 = [(FPItem *)self isContainer];
    v10 = [(FPItem *)self cloudContainerIdentifier];
    self->_folderType = CalculateFolderType(v4, v5, v6, v8, v9, v10);

    if (!v7) {
    return self->_folderType;
    }
  }
  return result;
}

- (BOOL)isFolder
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_typesEvaluated)
  {
    BOOL isFolder = v2->_isFolder;
    objc_sync_exit(v2);
  }
  else
  {
    v4 = v2->_contentType;
    objc_sync_exit(v2);

    [(FPItem *)v2 _evaluateTypes:v4];
    BOOL isFolder = v2->_isFolder;
    v2 = (FPItem *)v4;
  }

  return isFolder;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (FPItem)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5 parentItemIdentifier:(id)a6 filename:(id)a7 contentType:(id)a8
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v15 = (__CFString *)a6;
  id v16 = a7;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)FPItem;
  int v18 = [(FPItem *)&v30 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_providerID, a3);
    objc_storeStrong((id *)&v19->_domainIdentifier, a4);
    objc_storeStrong((id *)&v19->_itemIdentifier, a5);
    objc_storeStrong((id *)&v19->_parentItemIdentifier, a6);
    if (@"NSFileProviderTrashContainerItemIdentifier" == v15) {
      v19->_trashed = 1;
    }
    objc_storeStrong((id *)&v19->_filename, a7);
    v19->_capabilities = 3;
    v19->_contentPolicy = 0;
    BOOL v20 = [(NSString *)v19->_filename hasPrefix:@"."];
    uint64_t v21 = 22;
    if (v20) {
      uint64_t v21 = 30;
    }
    v19->_fileSystemFlags = v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:v19 file:@"FPItem.m" lineNumber:491 description:@"contentType is not of the current type"];
      }
    }
    -[FPItem setContentType:](v19, "setContentType:", v17, a2, v27, v28, v29);
    if (!v19->_domainIdentifier)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:v26 object:v19 file:@"FPItem.m" lineNumber:494 description:@"domain identifier must not be nil"];
    }
    [(FPItem *)v19 setAllowsContextualMenuDownloadEntry:1];
  }

  return v19;
}

- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3
{
  self->_allowsContextualMenuDownloadEntry = a3;
}

- (void)setContentType:(id)a3
{
  v4 = (UTType *)a3;
  obj = self;
  objc_sync_enter(obj);
  contentType = obj->_contentType;
  obj->_contentType = v4;

  obj->_typesEvaluated = 0;
  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSystemFilename, 0);
  objc_storeStrong((id *)&self->_originatorInfo, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_quarantineBlob, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_cloudContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_favoriteRank, 0);
  objc_storeStrong((id *)&self->_placeholderIdentifier, 0);
  objc_storeStrong((id *)&self->_hasUnresolvedConflicts, 0);
  objc_storeStrong((id *)&self->_parentFormerIdentifier, 0);
  objc_storeStrong((id *)&self->_formerIdentifier, 0);
  objc_storeStrong((id *)&self->_preformattedMostRecentEditorName, 0);
  objc_storeStrong((id *)&self->_preformattedOwnerName, 0);
  objc_storeStrong((id *)&self->_fp_appContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_fp_spotlightSubDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_conflictingVersions, 0);
  objc_storeStrong((id *)&self->_inheritedUserInfo, 0);
  objc_storeStrong((id *)&self->_symlinkTargetPath, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_detachedRootLogicalURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fp_parentDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_extendedAttributes, 0);
  objc_storeStrong((id *)&self->_containerDisplayName, 0);
  objc_storeStrong((id *)&self->_sharingPermissions, 0);
  objc_storeStrong((id *)&self->_isDownloadRequested, 0);
  objc_storeStrong((id *)&self->_mostRecentEditorNameComponents, 0);
  objc_storeStrong((id *)&self->_ownerNameComponents, 0);
  objc_storeStrong((id *)&self->_itemVersion, 0);
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_documentSize, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_childItemCount, 0);
  objc_storeStrong((id *)&self->_uploadingError, 0);
  objc_storeStrong((id *)&self->_downloadingError, 0);
  objc_storeStrong((id *)&self->_contentModificationDate, 0);
  objc_storeStrong((id *)&self->_parentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedUserInfoCache, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_tags, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)_evaluateTypes:(id)a3
{
  BOOL v4 = [(UTType *)self->_contentType conformsToType:*MEMORY[0x1E4F44468]];
  BOOL v5 = [(UTType *)self->_contentType conformsToType:*MEMORY[0x1E4F44390]];
  BOOL v6 = 1;
  if (!v4) {
    BOOL v6 = [(FPItem *)self isFlattenedPackage];
  }
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isFolder = v5 && !v4;
  obj->_isPackage = v6;
  obj->_typesEvaluated = 1;
  objc_sync_exit(obj);
}

- (NSNumber)childItemCount
{
  return self->_childItemCount;
}

- (NSDictionary)extendedAttributes
{
  return self->_extendedAttributes;
}

- (NSArray)tags
{
  return self->_tags;
}

- (NSData)originatorInfo
{
  return self->_originatorInfo;
}

- (NSFileProviderItemVersion)itemVersion
{
  itemVersion = self->_itemVersion;
  if (itemVersion) {
    char v3 = itemVersion;
  }
  else {
    char v3 = objc_alloc_init(NSFileProviderItemVersion);
  }

  return v3;
}

- (BOOL)isContentZoneRoot
{
  return self->_contentZoneRoot;
}

- (NSNumber)favoriteRank
{
  return self->_favoriteRank;
}

- (NSProgress)copyingProgress
{
  v2 = [(FPItem *)self progress];
  if (objc_msgSend(v2, "fp_isAccountedAsCopyProgress")) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  BOOL v4 = v3;

  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_providerID hash];
  NSUInteger v4 = [(NSString *)self->_domainIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_itemIdentifier hash];
}

- (FPItem)initWithSearchableItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[_CSSearchableItemAdapter alloc] initWithSearchableItem:v4];

  BOOL v6 = [(_CSSearchableItemAdapter *)v5 attributeSet];
  v7 = [v6 fileProviderID];
  if (![v7 length]) {
    goto LABEL_14;
  }
  v8 = [(_CSSearchableItemAdapter *)v5 typeIdentifier];
  if (![v8 length])
  {
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  int v9 = [(_CSSearchableItemAdapter *)v5 filename];
  if (![v9 length])
  {
LABEL_12:

    goto LABEL_13;
  }
  v10 = [(_CSSearchableItemAdapter *)v5 parentItemIdentifier];
  if (![v10 length])
  {

    goto LABEL_12;
  }
  v11 = [(_CSSearchableItemAdapter *)v5 itemIdentifier];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
LABEL_15:
    objc_super v30 = [(_CSSearchableItemAdapter *)v5 typeIdentifier];
    v23 = (void *)[v30 length];

    if (v23)
    {
      v23 = [(_CSSearchableItemAdapter *)v5 contentType];
    }
    v24 = [(_CSSearchableItemAdapter *)v5 attributeSet];
    v25 = [v24 fileProviderID];
    uint64_t v26 = [(_CSSearchableItemAdapter *)v5 itemIdentifier];
    id v27 = [(_CSSearchableItemAdapter *)v5 filename];
    __FILEPROVIDER_BAD_ITEM__(v5, v25, v26, v27, (uint64_t)v23, 0, 0);
    v22 = 0;
    goto LABEL_18;
  }
  id v13 = [FPItem alloc];
  id v14 = [(_CSSearchableItemAdapter *)v5 attributeSet];
  id v15 = [v14 fileProviderID];
  id v16 = [(_CSSearchableItemAdapter *)v5 attributeSet];
  uint64_t v17 = [v16 fileProviderDomainIdentifier];
  int v18 = (void *)v17;
  if (v17) {
    id v19 = (__CFString *)v17;
  }
  else {
    id v19 = @"NSFileProviderDomainDefaultIdentifier";
  }
  BOOL v20 = [(_CSSearchableItemAdapter *)v5 attributeSet];
  uint64_t v21 = [v20 domainIdentifier];
  v22 = [(FPItem *)v13 initWithVendorItem:v5 provider:v15 domain:v19 spotlightDomainIdentifier:v21 extensionCapabilities:-1 useFPFS:0];

  [(FPItem *)v22 setEnumerationOrigin:2];
  if ([(FPItem *)v22 isFolder])
  {
    v23 = [(FPItem *)v22 filename];
    v24 = [(FPItem *)v22 parentItemIdentifier];
    v25 = [(FPItem *)v22 providerID];
    uint64_t v26 = [(_CSSearchableItemAdapter *)v5 attributeSet];
    id v27 = [v26 contentURL];
    int v28 = [(FPItem *)v22 isContainer];
    id v29 = [(FPItem *)v22 cloudContainerIdentifier];
    [(FPItem *)v22 setFolderType:CalculateFolderType(v23, v24, v25, v27, v28, v29)];

LABEL_18:
  }

  return v22;
}

- (void)setEnumerationOrigin:(unint64_t)a3
{
  self->_enumerationOrigin = a3;
}

- (void)setMostRecentVersionDownloaded:(BOOL)a3
{
  self->_mostRecentVersionDownloaded = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSProgress)progress
{
  v2 = self;
  objc_sync_enter(v2);
  progress = v2->_progress;
  if (progress)
  {
    id v4 = progress;
    objc_sync_exit(v2);
    BOOL v5 = v2;
  }
  else
  {
    objc_sync_exit(v2);

    BOOL v5 = +[FPProgressManager defaultManager];
    if (v2->_offline)
    {
      BOOL v6 = 0;
    }
    else
    {
      if (v2->_downloading || [(FPItem *)v2 isExternalDownloadPlaceholder])
      {
        uint64_t v7 = [v5 downloadProgressForItem:v2];
      }
      else if (v2->_uploading)
      {
        uint64_t v7 = [v5 uploadProgressForItem:v2];
      }
      else
      {
        uint64_t v7 = [v5 copyProgressForItem:v2];
      }
      BOOL v6 = (void *)v7;
    }
    v8 = v2;
    objc_sync_enter(v8);
    int v9 = v2->_progress;
    if (!v9)
    {
      objc_storeStrong((id *)&v2->_progress, v6);
      int v9 = v2->_progress;
    }
    id v4 = v9;
    objc_sync_exit(v8);
  }

  return v4;
}

- (NSArray)itemDecorations
{
  NSUInteger v3 = [(FPItem *)self providerID];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  decorations = self->_decorations;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __25__FPItem_itemDecorations__block_invoke;
  uint64_t v17 = &unk_1E5AF1768;
  id v5 = v3;
  id v18 = v5;
  id v19 = v20;
  uint64_t v6 = [(NSArray *)decorations fp_map:&v14];
  uint64_t v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  v10 = objc_msgSend(v9, "mutableCopy", v14, v15, v16, v17);
  if ([(FPItem *)self isShared])
  {
    v11 = [(FPItem *)self _sharedByDecorationType];
    uint64_t v12 = +[FPItemDecoration decorationWithIdentifier:v11 bundleIdentifier:@"com.apple.FileProvider"];

    [v10 addObject:v12];
  }

  _Block_object_dispose(v20, 8);

  return (NSArray *)v10;
}

- (BOOL)isShared
{
  return self->_shared;
}

- (BOOL)isDownloading
{
  return self->_downloading;
}

- (BOOL)isUploading
{
  return self->_uploading;
}

- (FPItemID)itemID
{
  v2 = [[FPItemID alloc] initWithProviderID:self->_providerID domainIdentifier:self->_domainIdentifier itemIdentifier:self->_itemIdentifier];

  return v2;
}

- (FPItemID)formerItemID
{
  if (self->_formerIdentifier) {
    v2 = [[FPItemID alloc] initWithProviderID:self->_providerID domainIdentifier:self->_domainIdentifier itemIdentifier:self->_formerIdentifier];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setOffline:(BOOL)a3
{
  self->_offline = a3;
}

- (NSString)parentItemIdentifier
{
  return self->_parentItemIdentifier;
}

- (BOOL)isBusy
{
  v2 = [(FPItem *)self creationDate];
  [v2 timeIntervalSince1970];
  char is_busy_date = fpfs_is_busy_date((uint64_t)v3);

  return is_busy_date;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (unint64_t)fileSystemFlags
{
  return self->_fileSystemFlags;
}

- (BOOL)isReadable
{
  return self->_capabilities & 1;
}

- (BOOL)isIgnoreRoot
{
  return self->_ignoreRoot;
}

- (void)setFileID:(unint64_t)a3
{
  self->_fileID = a3;
}

- (void)setFp_lastModifiedByCurrentUser:(BOOL)a3
{
  self->_fp_lastModifiedByCurrentUser = a3;
}

- (void)setUploading:(BOOL)a3
{
  self->_uploading = a3;
}

- (void)setUploaded:(BOOL)a3
{
  self->_uploaded = a3;
}

- (NSError)uploadingError
{
  uploadingError = self->_uploadingError;
  if (uploadingError)
  {
    double v3 = uploadingError;
  }
  else if (self->_uploading && self->_offline)
  {
    double v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-1004 userInfo:0];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (NSProgress)uploadingProgress
{
  if (self->_uploading)
  {
    v2 = [(FPItem *)self progress];
  }
  else
  {
    v2 = 0;
  }

  return (NSProgress *)v2;
}

- (NSError)downloadingError
{
  downloadingError = self->_downloadingError;
  if (downloadingError)
  {
    double v3 = downloadingError;
  }
  else if (self->_downloading && self->_offline)
  {
    double v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-1004 userInfo:0];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (void)setSupportsMostRecentVersionDownloaded:(BOOL)a3
{
  self->_supportsMostRecentVersionDownloaded = a3;
}

- (void)setRecursivelyDownloaded:(BOOL)a3
{
  self->_recursivelyDownloaded = a3;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (void)setInPinnedFolder:(BOOL)a3
{
  self->_inPinnedFolder = a3;
}

- (void)setDownloading:(BOOL)a3
{
  self->_downloading = a3;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (BOOL)fp_isLastModifiedByCurrentUser
{
  return self->_fp_lastModifiedByCurrentUser;
}

- (BOOL)isPinnedSubitem
{
  BOOL v3 = [(FPItem *)self isInPinnedFolder];
  if (v3) {
    LOBYTE(v3) = ![(FPItem *)self isPinned];
  }
  return v3;
}

- (BOOL)isInPinnedFolder
{
  return self->_inPinnedFolder;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_char downloaded = a3;
}

- (BOOL)isPackage
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_typesEvaluated)
  {
    BOOL isPackage = v2->_isPackage;
    objc_sync_exit(v2);
  }
  else
  {
    id v4 = v2->_contentType;
    objc_sync_exit(v2);

    [(FPItem *)v2 _evaluateTypes:v4];
    BOOL isPackage = v2->_isPackage;
    v2 = (FPItem *)v4;
  }

  return isPackage;
}

- (NSProgress)downloadingProgress
{
  if (self->_downloading || [(FPItem *)self isExternalDownloadPlaceholder])
  {
    BOOL v3 = [(FPItem *)self progress];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSProgress *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isMostRecentVersionDownloaded
{
  return self->_mostRecentVersionDownloaded;
}

- (NSNumber)isDownloadRequested
{
  return self->_isDownloadRequested;
}

- (void)setQuarantineBlob:(id)a3
{
}

- (void)setFp_displayName:(id)a3
{
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (void)setIsContainer:(BOOL)a3
{
  self->_isContainer = a3;
}

- (void)setFp_appContainerBundleIdentifier:(id)a3
{
}

- (NSString)fp_appContainerBundleIdentifier
{
  return self->_fp_appContainerBundleIdentifier;
}

- (BOOL)isContainerPristine
{
  return self->_isContainerPristine;
}

- (NSString)cloudContainerIdentifier
{
  return self->_cloudContainerIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FPItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(FPItem *)self isEqualToItem:v4];
  }

  return v5;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4 = (FPItem *)a3;
  BOOL v5 = v4;
  if (self == v4) {
    goto LABEL_9;
  }
  itemIdentifier = self->_itemIdentifier;
  uint64_t v7 = [(FPItem *)v4 itemIdentifier];
  LODWORD(itemIdentifier) = [(NSString *)itemIdentifier isEqualToString:v7];

  if (!itemIdentifier) {
    goto LABEL_11;
  }
  domainIdentifier = self->_domainIdentifier;
  uint64_t v9 = [(FPItem *)v5 domainIdentifier];
  if (domainIdentifier == (NSString *)v9)
  {
  }
  else
  {
    v10 = (void *)v9;
    uint64_t v11 = [(FPItem *)v5 domainIdentifier];
    if (!v11)
    {

      goto LABEL_11;
    }
    uint64_t v12 = (void *)v11;
    id v13 = self->_domainIdentifier;
    uint64_t v14 = [(FPItem *)v5 domainIdentifier];
    LODWORD(v13) = [(NSString *)v13 isEqualToString:v14];

    if (!v13) {
      goto LABEL_11;
    }
  }
  providerID = self->_providerID;
  id v16 = [(FPItem *)v5 providerID];
  LOBYTE(providerID) = [(NSString *)providerID isEqualToString:v16];

  if ((providerID & 1) == 0)
  {
LABEL_11:
    BOOL v17 = 0;
    goto LABEL_12;
  }
LABEL_9:
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (BOOL)isFlattenedPackage
{
  v2 = [(FPItem *)self filename];
  BOOL v3 = [v2 pathExtension];
  char v4 = [v3 isEqualToString:@"pkgf"];

  return v4;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)providerIDForDeduplication
{
  v2 = [(FPItem *)self providerID];
  if (!FPIsCloudDocsWithFPFSEnabled()) {
    goto LABEL_6;
  }
  if ([v2 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
  {
    BOOL v3 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
    goto LABEL_7;
  }
  if ([v2 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"]) {
    BOOL v3 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
  }
  else {
LABEL_6:
  }
    BOOL v3 = v2;
LABEL_7:

  return (NSString *)v3;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!self->_providerID || (itemIdentifier = self->_itemIdentifier) == 0 || !self->_filename || !self->_contentType)
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(FPItem *)self encodeWithCoder:v6];
    }

    fp_simulate_crash(@"item does not have all the required properties; encoding will be invalid",
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v13,
      v19);
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[FPItem encodeWithCoder:]();
    }

    itemIdentifier = self->_itemIdentifier;
  }
  [v4 encodeObject:itemIdentifier forKey:@"_itemIdentifier"];
  [v4 encodeObject:self->_formerIdentifier forKey:@"_formerIdentifier"];
  [v4 encodeObject:self->_parentItemIdentifier forKey:@"_parentItemIdentifier"];
  [v4 encodeObject:self->_providerID forKey:@"_providerIdentifier"];
  [v4 encodeObject:self->_domainIdentifier forKey:@"_domainIdentifier"];
  [v4 encodeObject:self->_filename forKey:@"_filename"];
  [v4 encodeObject:self->_displayName forKey:@"_displayName"];
  [v4 encodeObject:self->_contentType forKey:@"_contentType"];
  [v4 encodeObject:self->_documentSize forKey:@"_documentSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    urlWrapper = self->_urlWrapper;
    if (urlWrapper)
    {
      [v4 encodeObject:urlWrapper forKey:@"_urlWrapper"];
    }
    else
    {
      id v16 = self;
      objc_sync_enter(v16);
      BOOL v17 = v16->_fileURL;
      objc_sync_exit(v16);

      if (v17)
      {
        id v18 = +[FPSandboxingURLWrapper wrapperWithURL:v17 readonly:0 error:0];
        [v4 encodeObject:v18 forKey:@"_urlWrapper"];
      }
    }
  }
  [v4 encodeObject:self->_detachedRootLogicalURL forKey:@"_detachedRootLogicalURL"];
  [v4 encodeInteger:self->_capabilities forKey:@"_capabilities"];
  [v4 encodeInteger:self->_enumerationOrigin forKey:@"_enumerationOrigin"];
  [v4 encodeObject:self->_creationDate forKey:@"_creationDate"];
  [v4 encodeObject:self->_contentModificationDate forKey:@"_contentModificationDate"];
  [v4 encodeBool:self->_trashed forKey:@"_trashed"];
  [v4 encodeObject:self->_lastUsedDate forKey:@"_lastUsedDate"];
  [v4 encodeObject:self->_tags forKey:@"_tags"];
  [v4 encodeObject:self->_favoriteRank forKey:@"_favoriteRank"];
  [v4 encodeBool:self->_uploaded forKey:@"_uploaded"];
  [v4 encodeBool:self->_uploading forKey:@"_uploading"];
  [v4 encodeObject:self->_uploadingError forKey:@"_uploadingError"];
  [v4 encodeBool:self->_excludedFromSync forKey:@"_excludedFromSync"];
  [v4 encodeBool:self->_ignoreRoot forKey:@"_ignoreRoot"];
  [v4 encodeInteger:self->_exclusionType forKey:@"_exclusionType"];
  [v4 encodeBool:self->_downloaded forKey:@"_downloaded"];
  [v4 encodeBool:self->_downloading forKey:@"_downloading"];
  [v4 encodeObject:self->_downloadingError forKey:@"_downloadingError"];
  [v4 encodeBool:self->_mostRecentVersionDownloaded forKey:@"_mostRecentVersionDownloaded"];
  [v4 encodeBool:self->_shared forKey:@"_shared"];
  [v4 encodeBool:self->_sharedByCurrentUser forKey:@"_sharedByCurrentUser"];
  [v4 encodeBool:self->_fp_lastModifiedByCurrentUser forKey:@"_fp_lastModifiedByCurrentUser"];
  [v4 encodeObject:self->_ownerNameComponents forKey:@"_ownerNameComponents"];
  [v4 encodeObject:self->_mostRecentEditorNameComponents forKey:@"_mostRecentEditorNameComponents"];
  [v4 encodeObject:self->_collaborationIdentifier forKey:@"_collaborationIdentifier"];
  [v4 encodeObject:self->_originatorInfo forKey:@"_originatorInfo"];
  [v4 encodeObject:self->_childItemCount forKey:@"_childItemCount"];
  [v4 encodeObject:self->_userInfo forKey:@"_userInfo"];
  [v4 encodeInteger:self->_state forKey:@"_state"];
  [v4 encodeObject:self->_placeholderIdentifier forKey:@"_placeholdIdentifier"];
  [v4 encodeObject:self->_versionIdentifier forKey:@"_versionIdentifier"];
  [v4 encodeObject:self->_itemVersion forKey:@"_itemVersion"];
  [v4 encodeObject:self->_spotlightDomainIdentifier forKey:@"rsdi"];
  [v4 encodeObject:self->_fp_spotlightSubDomainIdentifier forKey:@"_spotlightDomainIdentifier"];
  [v4 encodeBool:self->_inPinnedFolder forKey:@"_inPinnedFolder"];
  [v4 encodeBool:self->_pinned forKey:@"_pinned"];
  [v4 encodeObject:self->_hasUnresolvedConflicts forKey:@"_hasUnresolvedConflicts"];
  [v4 encodeObject:self->_isDownloadRequested forKey:@"_isDownloadRequested"];
  [v4 encodeObject:self->_sharingPermissions forKey:@"_sharingPermissions"];
  [v4 encodeObject:self->_containerDisplayName forKey:@"_containerDisplayName"];
  [v4 encodeBool:self->_supportsMostRecentVersionDownloaded forKey:@"_supportsMostRecentVersionDownloaded"];
  [v4 encodeObject:self->_fp_appContainerBundleIdentifier forKey:@"_fp_appContainerBundleIdentifier"];
  [v4 encodeObject:self->_fp_parentDomainIdentifier forKey:@"_fp_parentDomainIdentifier"];
  [v4 encodeObject:self->_cloudContainerIdentifier forKey:@"_cloudContainerIdentifier"];
  [v4 encodeBool:self->_isUbiquitous forKey:@"_isUbiquitous"];
  [v4 encodeBool:self->_isContainer forKey:@"_isContainer"];
  [v4 encodeBool:self->_isContainerPristine forKey:@"_isContainerPristine"];
  [v4 encodeBool:self->_topLevelSharedItem forKey:@"_topLevelSharedItem"];
  [v4 encodeBool:self->_recursivelyDownloaded forKey:@"_recursivelyDownloaded"];
  [v4 encodeBool:self->_contentZoneRoot forKey:@"_contentZoneRoot"];
  [v4 encodeObject:self->_conflictingVersions forKey:@"_conflictingVersions"];
  [v4 encodeBool:self->_isCollaborationInvitation forKey:@"_isCollaborationInvitation"];
  [v4 encodeInteger:self->_fileSystemFlags forKey:@"_fileSystemFlags"];
  [v4 encodeObject:self->_extendedAttributes forKey:@"_extendedAttributes"];
  [v4 encodeObject:self->_decorations forKey:@"_decorations"];
  [v4 encodeInt64:self->_fileID forKey:@"_fileID"];
  [v4 encodeInt32:self->_documentID forKey:@"_documentID"];
  [v4 encodeObject:self->_inheritedUserInfo forKey:@"_inheritedUserInfo"];
  [v4 encodeBool:self->_allowsContextualMenuDownloadEntry forKey:@"_allowsContextualMenuDownloadEntry"];
  [v4 encodeInt32:self->_typeAndCreator.type forKey:@"_typeAndCreator.type"];
  [v4 encodeInt32:self->_typeAndCreator.creator forKey:@"_typeAndCreator.creator"];
  [v4 encodeInteger:self->_contentPolicy forKey:@"_contentPolicy"];
  [v4 encodeInteger:self->_inheritedContentPolicy forKey:@"_inheritedContentPolicy"];
  [v4 encodeInteger:self->_effectiveContentPolicy forKey:@"_effectiveContentPolicy"];
  [v4 encodeInteger:self->_unsupportedFields forKey:@"_unsupportedFields"];
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (NSString)providerDomainID
{
  return (NSString *)objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", self->_providerID, self->_domainIdentifier);
}

- (BOOL)isActionable
{
  return (self->_state & 9) == 0;
}

- (BOOL)isDownloaded
{
  return self->_downloaded;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (BOOL)isExcludedFromSync
{
  return self->_excludedFromSync;
}

- (BOOL)isCloudItem
{
  return [(FPItem *)self isUbiquitous] || self->_uploaded || self->_downloaded;
}

- (BOOL)isUbiquitous
{
  return self->_isUbiquitous;
}

- (unint64_t)exclusionType
{
  return self->_exclusionType;
}

- (BOOL)fp_isCloudDocsContainer
{
  if (![(FPItem *)self isContainer]) {
    return 0;
  }
  BOOL v3 = [(FPItem *)self providerItemIdentifier];
  if ([v3 isEqualToString:@"a1"])
  {
    id v4 = [(FPItem *)self providerID];
    char v5 = objc_msgSend(v4, "fp_isiCloudDriveOrCloudDocsIdentifier");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isCollaborationInvitation
{
  return self->_isCollaborationInvitation;
}

- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 contentType:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  BOOL v17 = objc_msgSend(v16, "fp_toProviderID");
  id v18 = objc_msgSend(v16, "fp_toDomainIdentifier");

  uint64_t v19 = [(FPItem *)self initWithProviderID:v17 domainIdentifier:v18 itemIdentifier:v15 parentItemIdentifier:v14 filename:v13 contentType:v12];
  return v19;
}

- (NSURL)fileURL
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_fileURL;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isRecursivelyDownloaded
{
  return self->_recursivelyDownloaded;
}

- (NSString)providerItemIdentifier
{
  v2 = [(FPItem *)self providerItemID];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

- (FPItemID)providerItemID
{
  BOOL v3 = [(FPItem *)self itemID];
  int v4 = [v3 isDiskIdentifier];

  if (v4) {
    [(FPItem *)self formerItemID];
  }
  else {
  char v5 = [(FPItem *)self itemID];
  }

  return (FPItemID *)v5;
}

- (BOOL)allowsContextualMenuDownloadEntry
{
  return self->_allowsContextualMenuDownloadEntry;
}

- (void)setIsContainerPristine:(BOOL)a3
{
  self->_isContainerPristine = a3;
}

- (void)setUploadingError:(id)a3
{
}

- (void)setUbiquitous:(BOOL)a3
{
  self->_isUbiquitous = a3;
}

- (void)setTypeAndCreator:(NSFileProviderTypeAndCreator)a3
{
  self->_typeAndCreator = a3;
}

- (void)setTopLevelSharedItem:(BOOL)a3
{
  self->_topLevelSharedItem = a3;
}

- (void)setTags:(id)a3
{
}

- (void)setSpotlightDomainIdentifier:(id)a3
{
}

- (void)setSharingPermissions:(id)a3
{
}

- (void)setSharedByCurrentUser:(BOOL)a3
{
  self->_sharedByCurrentUser = a3;
}

- (void)setShared:(BOOL)a3
{
  self->_char shared = a3;
}

- (void)setLastUsedDate:(id)a3
{
}

- (void)setInheritedUserInfo:(id)a3
{
}

- (void)setInheritedContentPolicy:(int64_t)a3
{
  self->_inheritedContentPolicy = a3;
}

- (void)setIgnoreRoot:(BOOL)a3
{
  self->_ignoreRoot = a3;
}

- (void)setHasUnresolvedConflicts:(id)a3
{
}

- (void)setFileSystemFlags:(unint64_t)a3
{
  self->_fileSystemFlags = a3;
}

- (void)setFavoriteRank:(id)a3
{
}

- (void)setExcludedFromSync:(BOOL)a3
{
  self->_excludedFromSync = a3;
}

- (void)setEffectiveContentPolicy:(int64_t)a3
{
  self->_effectiveContentPolicy = a3;
}

- (void)setDownloadingError:(id)a3
{
}

- (void)setDocumentSize:(id)a3
{
}

- (void)setCreationDate:(id)a3
{
}

- (void)setContentPolicy:(int64_t)a3
{
  self->_contentPolicy = a3;
}

- (void)setContentModificationDate:(id)a3
{
}

- (void)setContainerDisplayName:(id)a3
{
}

- (void)setCloudContainerIdentifier:(id)a3
{
}

- (void)setChildItemCount:(id)a3
{
}

- (NSString)parentFormerIdentifier
{
  return self->_parentFormerIdentifier;
}

- (BOOL)isPending
{
  return (LOBYTE(self->_state) >> 2) & 1;
}

- (NSString)displayName
{
  unint64_t v3 = [(FPItem *)self fileSystemFlags];
  unint64_t v11 = [(FPItem *)self folderType] - 2;
  if (v11 > 2)
  {
    id v12 = 0;
  }
  else
  {
    FPLoc(off_1E5AF17B0[v11], v4, v5, v6, v7, v8, v9, v10, v21);
    id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  if ([(NSString *)v12 length])
  {
    BOOL v13 = [(FPItem *)self isFolder];
    id v14 = v12;
    uint64_t v15 = (v3 >> 4) & 1;
LABEL_6:
    id v16 = [(NSString *)v14 fp_displayNameFromFilenameWithHiddenPathExtension:v15 isFolder:v13];
    goto LABEL_9;
  }
  displayName = self->_displayName;
  if (!displayName)
  {
    filename = self->_filename;
    BOOL v13 = [(FPItem *)self isFolder];
    id v14 = filename;
    uint64_t v15 = 1;
    goto LABEL_6;
  }
  id v16 = displayName;
LABEL_9:
  id v18 = v16;

  return v18;
}

- (void)setUserInfo:(id)a3
{
}

- (void)setParentFormerIdentifier:(id)a3
{
}

- (void)setItemVersion:(id)a3
{
}

- (void)setFormerIdentifier:(id)a3
{
}

- (void)setExtendedAttributes:(id)a3
{
}

- (void)setDecorations:(id)a3
{
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (NSString)sharingPermissions
{
  return self->_sharingPermissions;
}

- (BOOL)isSharedByCurrentUser
{
  return self->_sharedByCurrentUser;
}

- (FPItem)initWithCoder:(id)a3
{
  v125[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  context = (void *)MEMORY[0x1A6248870]();
  v122 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_providerIdentifier"];
  uint64_t v123 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_domainIdentifier"];
  if (!v123) {
    uint64_t v123 = @"NSFileProviderDomainDefaultIdentifier";
  }
  uint64_t v6 = objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", v122, v123);
  int v7 = objc_msgSend(v5, "fp_checkProviderIdentifier:", v6);

  if (!v7)
  {
    int v20 = 1;
    goto LABEL_22;
  }
  uint64_t v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
  uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_parentItemIdentifier"];
  uint64_t v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_filename"];
  unint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_contentType"];
  if (v11)
  {
    id v12 = v11;
    BOOL v13 = v10;
    id v14 = v9;
    uint64_t v15 = v8;
    id v16 = (void *)MEMORY[0x1E4F442D8];
    BOOL v17 = [v11 identifier];
    uint64_t v18 = objc_msgSend(v16, "fp_cachedTypeWithIdentifier:alreadyAvailableType:", v17, v12);

    uint64_t v19 = (void *)v18;
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = v15;
        uint64_t v9 = v14;
        uint64_t v10 = v13;
        goto LABEL_14;
      }
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"FPItem.m" lineNumber:961 description:@"received contentType with an invalid type"];
    }
    uint64_t v8 = v15;
    uint64_t v9 = v14;
    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v22 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_typeIdentifier"];
  if (!v22)
  {
    uint64_t v70 = fp_current_or_default_log();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
      -[FPItem initWithCoder:]((uint64_t)v8, v10);
    }
    int v20 = 1;
    goto LABEL_19;
  }
  v23 = (void *)v22;
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F442D8], "fp_cachedTypeWithIdentifier:", v22);
  v25 = v19;
  uint64_t v19 = (void *)v24;

LABEL_14:
  self = [(FPItem *)self initWithProviderID:v122 domainIdentifier:v123 itemIdentifier:v8 parentItemIdentifier:v9 filename:v10 contentType:v19];
  if (!self)
  {
    int v20 = 0;
    goto LABEL_21;
  }
  uint64_t v26 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_formerIdentifier"];
  formerIdentifier = self->_formerIdentifier;
  self->_formerIdentifier = v26;

  int v28 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
  displayName = self->_displayName;
  self->_displayName = v28;

  objc_super v30 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_documentSize"];
  documentSize = self->_documentSize;
  self->_documentSize = v30;

  v32 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_urlWrapper"];
  urlWrapper = self->_urlWrapper;
  self->_urlWrapper = v32;

  v34 = [(FPSandboxingURLWrapper *)self->_urlWrapper url];
  fileURL = self->_fileURL;
  self->_fileURL = v34;

  v36 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_detachedRootLogicalURL"];
  detachedRootLogicalURL = self->_detachedRootLogicalURL;
  self->_detachedRootLogicalURL = v36;

  self->_capabilities = [v5 decodeIntegerForKey:@"_capabilities"];
  self->_enumerationOrigin = [v5 decodeIntegerForKey:@"_enumerationOrigin"];
  v38 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_creationDate"];
  creationDate = self->_creationDate;
  self->_creationDate = v38;

  id v40 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_contentModificationDate"];
  contentModificationDate = self->_contentModificationDate;
  self->_contentModificationDate = v40;

  self->_trashed = [v5 decodeBoolForKey:@"_trashed"];
  v42 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_lastUsedDate"];
  lastUsedDate = self->_lastUsedDate;
  self->_lastUsedDate = v42;

  v44 = (void *)MEMORY[0x1E4F1CAD0];
  char v120 = v19;
  uint64_t v45 = objc_opt_class();
  int v46 = objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  int v47 = [v5 decodeObjectOfClasses:v46 forKey:@"_tags"];
  tags = self->_tags;
  self->_tags = v47;

  uint64_t v49 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_favoriteRank"];
  favoriteRank = self->_favoriteRank;
  self->_favoriteRank = v49;

  self->_uploaded = [v5 decodeBoolForKey:@"_uploaded"];
  self->_uploading = [v5 decodeBoolForKey:@"_uploading"];
  uint64_t v51 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_uploadingError"];
  uploadingError = self->_uploadingError;
  self->_uploadingError = v51;

  self->_excludedFromSync = [v5 decodeBoolForKey:@"_excludedFromSync"];
  self->_ignoreRoot = [v5 decodeBoolForKey:@"_ignoreRoot"];
  self->_exclusionType = [v5 decodeIntegerForKey:@"_exclusionType"];
  self->_char downloaded = [v5 decodeBoolForKey:@"_downloaded"];
  self->_downloading = [v5 decodeBoolForKey:@"_downloading"];
  uint64_t v53 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_downloadingError"];
  downloadingError = self->_downloadingError;
  self->_downloadingError = v53;

  self->_mostRecentVersionDownloaded = [v5 decodeBoolForKey:@"_mostRecentVersionDownloaded"];
  self->_char shared = [v5 decodeBoolForKey:@"_shared"];
  self->_sharedByCurrentUser = [v5 decodeBoolForKey:@"_sharedByCurrentUser"];
  self->_fp_lastModifiedByCurrentUser = [v5 decodeBoolForKey:@"_fp_lastModifiedByCurrentUser"];
  uint64_t v55 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerNameComponents"];
  ownerNameComponents = self->_ownerNameComponents;
  self->_ownerNameComponents = v55;

  v57 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_mostRecentEditorNameComponents"];
  mostRecentEditorNameComponents = self->_mostRecentEditorNameComponents;
  self->_mostRecentEditorNameComponents = v57;

  uint64_t v59 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_collaborationIdentifier"];
  collaborationIdentifier = self->_collaborationIdentifier;
  self->_collaborationIdentifier = v59;

  uint64_t v61 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_originatorInfo"];
  originatorInfo = self->_originatorInfo;
  self->_originatorInfo = v61;

  v63 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_childItemCount"];
  childItemCount = self->_childItemCount;
  self->_childItemCount = v63;

  v117 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v116 = objc_opt_class();
  uint64_t v65 = objc_opt_class();
  char v118 = v9;
  uint64_t v66 = objc_opt_class();
  uint64_t v67 = objc_opt_class();
  uint64_t v119 = v8;
  uint64_t v68 = objc_opt_class();
  uint64_t v69 = objc_opt_class();
  uint64_t v19 = v120;
  uint64_t v70 = objc_msgSend(v117, "setWithObjects:", v116, v65, v66, v67, v68, v69, objc_opt_class(), 0);
  v71 = [v5 decodeObjectOfClasses:v70 forKey:@"_userInfo"];
  userInfo = self->_userInfo;
  self->_userInfo = v71;

  self->_state = [v5 decodeIntegerForKey:@"_state"];
  v73 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_placeholdIdentifier"];
  placeholderIdentifier = self->_placeholderIdentifier;
  self->_placeholderIdentifier = v73;

  v75 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_versionIdentifier"];
  versionIdentifier = self->_versionIdentifier;
  self->_versionIdentifier = v75;

  v77 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_itemVersion"];
  itemVersion = self->_itemVersion;
  self->_itemVersion = v77;

  uint64_t v79 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"rsdi"];
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  self->_spotlightDomainIdentifier = v79;

  v81 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_spotlightDomainIdentifier"];
  fp_spotlightSubDomainIdentifier = self->_fp_spotlightSubDomainIdentifier;
  self->_fp_spotlightSubDomainIdentifier = v81;

  uint64_t v83 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_hasUnresolvedConflicts"];
  hasUnresolvedConflicts = self->_hasUnresolvedConflicts;
  self->_hasUnresolvedConflicts = v83;

  uint64_t v85 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_isDownloadRequested"];
  isDownloadRequested = self->_isDownloadRequested;
  self->_isDownloadRequested = v85;

  uint64_t v87 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_sharingPermissions"];
  sharingPermissions = self->_sharingPermissions;
  self->_sharingPermissions = v87;

  v89 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_containerDisplayName"];
  containerDisplayName = self->_containerDisplayName;
  self->_containerDisplayName = v89;

  self->_supportsMostRecentVersionDownloaded = [v5 decodeBoolForKey:@"_supportsMostRecentVersionDownloaded"];
  char v91 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_fp_appContainerBundleIdentifier"];
  fp_appContainerBundleIdentifier = self->_fp_appContainerBundleIdentifier;
  self->_fp_appContainerBundleIdentifier = v91;

  char v93 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_fp_parentDomainIdentifier"];
  fp_parentDomainIdentifier = self->_fp_parentDomainIdentifier;
  self->_fp_parentDomainIdentifier = v93;

  uint64_t v95 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_cloudContainerIdentifier"];
  cloudContainerIdentifier = self->_cloudContainerIdentifier;
  self->_cloudContainerIdentifier = v95;

  self->_isUbiquitous = [v5 decodeBoolForKey:@"_isUbiquitous"];
  self->_isContainer = [v5 decodeBoolForKey:@"_isContainer"];
  self->_isContainerPristine = [v5 decodeBoolForKey:@"_isContainerPristine"];
  self->_topLevelSharedItem = [v5 decodeBoolForKey:@"_topLevelSharedItem"];
  self->_inPinnedFolder = [v5 decodeBoolForKey:@"_inPinnedFolder"];
  self->_pinned = [v5 decodeBoolForKey:@"_pinned"];
  self->_contentZoneRoot = [v5 decodeBoolForKey:@"_contentZoneRoot"];
  self->_isCollaborationInvitation = [v5 decodeBoolForKey:@"_isCollaborationInvitation"];
  self->_recursivelyDownloaded = [v5 decodeBoolForKey:@"_recursivelyDownloaded"];
  char v97 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v98 = objc_opt_class();
  v99 = objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
  v100 = [v5 decodeObjectOfClasses:v99 forKey:@"_conflictingVersions"];
  conflictingVersions = self->_conflictingVersions;
  self->_conflictingVersions = v100;

  self->_fileSystemFlags = [v5 decodeIntegerForKey:@"_fileSystemFlags"];
  v102 = (void *)MEMORY[0x1E4F1CAD0];
  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  v125[2] = objc_opt_class();
  char v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:3];
  uint64_t v104 = [v102 setWithArray:v103];
  v105 = [v5 decodeObjectOfClasses:v104 forKey:@"_extendedAttributes"];
  extendedAttributes = self->_extendedAttributes;
  self->_extendedAttributes = v105;

  v107 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = v118;
  uint64_t v8 = v119;
  v124[0] = objc_opt_class();
  v124[1] = objc_opt_class();
  uint64_t v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:2];
  v109 = [v107 setWithArray:v108];
  uint64_t v110 = [v5 decodeObjectOfClasses:v109 forKey:@"_decorations"];
  decorations = self->_decorations;
  self->_decorations = v110;

  self->_fileID = [v5 decodeInt64ForKey:@"_fileID"];
  self->_documentID = [v5 decodeInt32ForKey:@"_documentID"];
  v112 = [v5 decodeObjectOfClasses:v70 forKey:@"_inheritedUserInfo"];
  inheritedUserInfo = self->_inheritedUserInfo;
  self->_inheritedUserInfo = v112;

  self->_allowsContextualMenuDownloadEntry = [v5 decodeBoolForKey:@"_allowsContextualMenuDownloadEntry"];
  self->_typeAndCreator.type = [v5 decodeInt32ForKey:@"_typeAndCreator.type"];
  self->_typeAndCreator.creator = [v5 decodeInt32ForKey:@"_typeAndCreator.creator"];
  self->_contentPolicy = [v5 decodeIntegerForKey:@"_contentPolicy"];
  self->_inheritedContentPolicy = [v5 decodeIntegerForKey:@"_inheritedContentPolicy"];
  self->_effectiveContentPolicy = [v5 decodeIntegerForKey:@"_effectiveContentPolicy"];
  int v20 = 0;
  self->_unsupportedFields = [v5 decodeIntegerForKey:@"_unsupportedFields"];
LABEL_19:

LABEL_21:
LABEL_22:

  if (v20) {
    v114 = 0;
  }
  else {
    v114 = self;
  }

  return v114;
}

- (void)setFileURL:(id)a3
{
  uint64_t v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  fileURL = obj->_fileURL;
  obj->_fileURL = v4;

  objc_sync_exit(obj);
}

- (void)setFp_isDownloadRequested:(BOOL)a3
{
  self->_isDownloadRequested = [NSNumber numberWithBool:a3];

  MEMORY[0x1F41817F8]();
}

- (void)setTypeIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F442D8], "fp_cachedTypeWithIdentifier:", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(FPItem *)self setContentType:v4];
}

+ (id)fp_queryFetchAttributes
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  v2 = (id *)getMDItemFilenameSymbolLoc_ptr;
  uint64_t v87 = getMDItemFilenameSymbolLoc_ptr;
  if (!getMDItemFilenameSymbolLoc_ptr)
  {
    unint64_t v3 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v3, "MDItemFilename");
    getMDItemFilenameSymbolLoc_ptr = v85[3];
    v2 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v2) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]();
  }
  id v4 = *v2;
  v88[0] = v4;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  id v5 = (id *)getMDItemDisplayNameSymbolLoc_ptr;
  uint64_t v87 = getMDItemDisplayNameSymbolLoc_ptr;
  if (!getMDItemDisplayNameSymbolLoc_ptr)
  {
    uint64_t v6 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v6, "MDItemDisplayName");
    getMDItemDisplayNameSymbolLoc_ptr = v85[3];
    id v5 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v5) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]();
  }
  id v7 = *v5;
  v88[1] = v7;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v8 = (id *)getMDItemContentTypeSymbolLoc_ptr;
  uint64_t v87 = getMDItemContentTypeSymbolLoc_ptr;
  if (!getMDItemContentTypeSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v9, "MDItemContentType");
    getMDItemContentTypeSymbolLoc_ptr = v85[3];
    uint64_t v8 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v8) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]();
  }
  id v10 = *v8;
  v88[2] = v10;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  unint64_t v11 = (id *)getMDItemContentCreationDateSymbolLoc_ptr;
  uint64_t v87 = getMDItemContentCreationDateSymbolLoc_ptr;
  if (!getMDItemContentCreationDateSymbolLoc_ptr)
  {
    id v12 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v12, "MDItemContentCreationDate");
    getMDItemContentCreationDateSymbolLoc_ptr = v85[3];
    unint64_t v11 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v11) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.4();
  }
  id v80 = *v11;
  v88[3] = v80;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  BOOL v13 = (id *)getMDItemContentModificationDateSymbolLoc_ptr;
  uint64_t v87 = getMDItemContentModificationDateSymbolLoc_ptr;
  if (!getMDItemContentModificationDateSymbolLoc_ptr)
  {
    id v14 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v14, "MDItemContentModificationDate");
    getMDItemContentModificationDateSymbolLoc_ptr = v85[3];
    BOOL v13 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v13) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.5();
  }
  id v79 = *v13;
  v88[4] = v79;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v15 = (id *)getMDItemUserTagsSymbolLoc_ptr;
  uint64_t v87 = getMDItemUserTagsSymbolLoc_ptr;
  if (!getMDItemUserTagsSymbolLoc_ptr)
  {
    id v16 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v16, "MDItemUserTags");
    getMDItemUserTagsSymbolLoc_ptr = v85[3];
    uint64_t v15 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v15) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.6();
  }
  uint64_t v76 = v7;
  v77 = v10;
  v75 = v4;
  id v78 = *v15;
  v88[5] = v78;
  v88[6] = @"_kMDItemUserTags";
  uint64_t v83 = getMDItemFileProviderDomainIdentifier();
  v88[7] = v83;
  v88[8] = @"FPTagColors";
  v88[9] = @"FPFilename";
  v82 = getMDItemLastUsedDate();
  v88[10] = v82;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  BOOL v17 = (id *)getMDItemFavoriteRankSymbolLoc_ptr;
  uint64_t v87 = getMDItemFavoriteRankSymbolLoc_ptr;
  if (!getMDItemFavoriteRankSymbolLoc_ptr)
  {
    uint64_t v18 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v18, "MDItemFavoriteRank");
    getMDItemFavoriteRankSymbolLoc_ptr = v85[3];
    BOOL v17 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v17) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.7();
  }
  id v19 = *v17;
  v88[11] = v19;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  int v20 = (id *)getMDItemIsUploadedSymbolLoc_ptr;
  uint64_t v87 = getMDItemIsUploadedSymbolLoc_ptr;
  if (!getMDItemIsUploadedSymbolLoc_ptr)
  {
    uint64_t v21 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v21, "MDItemIsUploaded");
    getMDItemIsUploadedSymbolLoc_ptr = v85[3];
    int v20 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v20) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.8();
  }
  id v22 = *v20;
  v88[12] = v22;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  v23 = (id *)getMDItemIsUploadingSymbolLoc_ptr;
  uint64_t v87 = getMDItemIsUploadingSymbolLoc_ptr;
  if (!getMDItemIsUploadingSymbolLoc_ptr)
  {
    uint64_t v24 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v24, "MDItemIsUploading");
    getMDItemIsUploadingSymbolLoc_ptr = v85[3];
    v23 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v23) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.9();
  }
  id v25 = *v23;
  v88[13] = v25;
  v88[14] = @"FPUploadingError";
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v26 = (id *)getMDItemDownloadingStatusSymbolLoc_ptr;
  uint64_t v87 = getMDItemDownloadingStatusSymbolLoc_ptr;
  if (!getMDItemDownloadingStatusSymbolLoc_ptr)
  {
    id v27 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v27, "MDItemDownloadingStatus");
    getMDItemDownloadingStatusSymbolLoc_ptr = v85[3];
    uint64_t v26 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v26) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]0();
  }
  id v74 = *v26;
  v88[15] = v74;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  int v28 = (id *)getMDItemVersionIdentifierSymbolLoc_ptr;
  uint64_t v87 = getMDItemVersionIdentifierSymbolLoc_ptr;
  if (!getMDItemVersionIdentifierSymbolLoc_ptr)
  {
    id v29 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v29, "MDItemVersionIdentifier");
    getMDItemVersionIdentifierSymbolLoc_ptr = v85[3];
    int v28 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v28) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]1();
  }
  id v73 = *v28;
  v88[16] = v73;
  v88[17] = @"FPDownloaded";
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  objc_super v30 = (id *)getMDItemIsDownloadingSymbolLoc_ptr;
  uint64_t v87 = getMDItemIsDownloadingSymbolLoc_ptr;
  if (!getMDItemIsDownloadingSymbolLoc_ptr)
  {
    v31 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v31, "MDItemIsDownloading");
    getMDItemIsDownloadingSymbolLoc_ptr = v85[3];
    objc_super v30 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v30) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]2();
  }
  id v72 = *v30;
  v88[18] = v72;
  v88[19] = @"FPMostRecentVersionDownloaded";
  v88[20] = @"FPDownloadingError";
  v88[21] = @"FPUserInfoValues";
  v88[22] = @"FPUserInfoKeys";
  v88[23] = @"FPCapabilities";
  v88[24] = @"FPSharingCurrentUserPermissions";
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  v32 = (id *)getMDItemUserOwnedSymbolLoc_ptr;
  uint64_t v87 = getMDItemUserOwnedSymbolLoc_ptr;
  if (!getMDItemUserOwnedSymbolLoc_ptr)
  {
    v33 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v33, "MDItemUserOwned");
    getMDItemUserOwnedSymbolLoc_ptr = v85[3];
    v32 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v32) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]3();
  }
  uint64_t v69 = v22;
  uint64_t v70 = v25;
  uint64_t v68 = v19;
  id v71 = *v32;
  v88[25] = v71;
  v81 = getMDItemFileSize();
  v88[26] = v81;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  v34 = (id *)getMDItemSubItemCountSymbolLoc_ptr;
  uint64_t v87 = getMDItemSubItemCountSymbolLoc_ptr;
  if (!getMDItemSubItemCountSymbolLoc_ptr)
  {
    uint64_t v35 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v35, "MDItemSubItemCount");
    getMDItemSubItemCountSymbolLoc_ptr = v85[3];
    v34 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v34) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]4();
  }
  id v36 = *v34;
  v88[27] = v36;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  v37 = (id *)getMDItemIsSharedSymbolLoc_ptr_0;
  uint64_t v87 = getMDItemIsSharedSymbolLoc_ptr_0;
  if (!getMDItemIsSharedSymbolLoc_ptr_0)
  {
    v38 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v38, "MDItemIsShared");
    getMDItemIsSharedSymbolLoc_ptr_0 = v85[3];
    v37 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v37) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]5();
  }
  id v39 = *v37;
  v88[28] = v39;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  id v40 = (id *)getMDItemOwnerNameSymbolLoc_ptr_0;
  uint64_t v87 = getMDItemOwnerNameSymbolLoc_ptr_0;
  if (!getMDItemOwnerNameSymbolLoc_ptr_0)
  {
    v41 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v41, "MDItemOwnerName");
    getMDItemOwnerNameSymbolLoc_ptr_0 = v85[3];
    id v40 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v40) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]6();
  }
  id v42 = *v40;
  v88[29] = v42;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  v43 = (id *)getMDItemLastEditorNameSymbolLoc_ptr;
  uint64_t v87 = getMDItemLastEditorNameSymbolLoc_ptr;
  if (!getMDItemLastEditorNameSymbolLoc_ptr)
  {
    v44 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v44, "MDItemLastEditorName");
    getMDItemLastEditorNameSymbolLoc_ptr = v85[3];
    v43 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v43) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]7();
  }
  id v45 = *v43;
  v88[30] = v45;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  int v46 = (id *)getMDItemIsTrashedSymbolLoc_ptr;
  uint64_t v87 = getMDItemIsTrashedSymbolLoc_ptr;
  if (!getMDItemIsTrashedSymbolLoc_ptr)
  {
    int v47 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v47, "MDItemIsTrashed");
    getMDItemIsTrashedSymbolLoc_ptr = v85[3];
    int v46 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v46) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]8();
  }
  id v48 = *v46;
  v88[31] = v48;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v49 = (id *)getMDItemContentURLSymbolLoc_ptr;
  uint64_t v87 = getMDItemContentURLSymbolLoc_ptr;
  if (!getMDItemContentURLSymbolLoc_ptr)
  {
    uint64_t v50 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v50, "MDItemContentURL");
    getMDItemContentURLSymbolLoc_ptr = v85[3];
    uint64_t v49 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v49) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]9();
  }
  uint64_t v66 = v36;
  uint64_t v67 = v39;
  id v51 = *v49;
  v88[32] = v51;
  uint64_t v52 = getMDItemFileItemID();
  v88[33] = v52;
  uint64_t v53 = getMDItemFileProviderID();
  v88[34] = v53;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v54 = (id *)getMDItemParentFileItemIDSymbolLoc_ptr;
  uint64_t v87 = getMDItemParentFileItemIDSymbolLoc_ptr;
  if (!getMDItemParentFileItemIDSymbolLoc_ptr)
  {
    uint64_t v55 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v55, "MDItemParentFileItemID");
    getMDItemParentFileItemIDSymbolLoc_ptr = v85[3];
    uint64_t v54 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v54) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]0();
  }
  id v56 = *v54;
  v88[35] = v56;
  v88[36] = @"FPAppContainerBundleID";
  v88[37] = @"FPCloudContainerID";
  v88[38] = @"FPIsContainer";
  v88[39] = @"FPIsContainerPristine";
  v88[40] = @"FPIsUbiquitous";
  v88[41] = @"FPParentFileItemID";
  v88[42] = @"FPLastModifiedByCurrentUser";
  v88[43] = @"FPEvictable";
  v88[44] = @"FPItemIsPinned";
  v88[45] = @"FPItemIsInPinnedFolder";
  v88[46] = @"FPIsTopLevelSharedItem";
  v88[47] = @"FPCollaborationIdentifier";
  v88[48] = @"FPParentDomainID";
  v88[49] = @"FPItemVersion";
  v88[50] = @"FPItemIsRecursivelyDownloaded";
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  v57 = (id *)getMDItemDocumentIdentifierSymbolLoc_ptr;
  uint64_t v87 = getMDItemDocumentIdentifierSymbolLoc_ptr;
  if (!getMDItemDocumentIdentifierSymbolLoc_ptr)
  {
    uint64_t v58 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v58, "MDItemDocumentIdentifier");
    getMDItemDocumentIdentifierSymbolLoc_ptr = v85[3];
    v57 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v57) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]1();
  }
  id v59 = *v57;
  v88[51] = v59;
  v88[52] = @"com_apple_mobilesms_syndicationContentType";
  v88[53] = @"FPOnDiskIdentifier";
  v88[54] = @"com.apple.synapse:DocumentAttributes";
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  v60 = (id *)getMDItemAttributeChangeDateSymbolLoc_ptr;
  uint64_t v87 = getMDItemAttributeChangeDateSymbolLoc_ptr;
  if (!getMDItemAttributeChangeDateSymbolLoc_ptr)
  {
    uint64_t v61 = (void *)CoreSpotlightLibrary_1();
    v85[3] = (uint64_t)dlsym(v61, "MDItemAttributeChangeDate");
    getMDItemAttributeChangeDateSymbolLoc_ptr = v85[3];
    v60 = (id *)v85[3];
  }
  _Block_object_dispose(&v84, 8);
  if (!v60) {
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes]2();
  }
  id v89 = *v60;
  v62 = (void *)MEMORY[0x1E4F1C978];
  id v63 = v89;
  uint64_t v64 = [v62 arrayWithObjects:v88 count:56];

  return v64;
}

- (void)setFilename:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_filename, a3);
    displayName = self->_displayName;
    self->_displayName = 0;
  }
  else
  {
    fp_simulate_crash(@"can't set a nil filename", v5, v6, v7, v8, v9, v10, v11, v15);
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[FPItem setFilename:]();
    }
  }
}

- (FPItem)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5 parentItemIdentifier:(id)a6 filename:(id)a7 isDirectory:(BOOL)a8
{
  uint64_t v8 = (void *)MEMORY[0x1E4F443C8];
  if (!a8) {
    uint64_t v8 = (void *)MEMORY[0x1E4F44408];
  }
  return [(FPItem *)self initWithProviderID:a3 domainIdentifier:a4 itemIdentifier:a5 parentItemIdentifier:a6 filename:a7 contentType:*v8];
}

- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 typeIdentifier:(id)a7
{
  id v12 = (void *)MEMORY[0x1E4F442D8];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  BOOL v17 = objc_msgSend(v12, "fp_cachedTypeWithIdentifier:", a7);
  uint64_t v18 = [(FPItem *)self initWithProviderDomainID:v16 itemIdentifier:v15 parentItemIdentifier:v14 filename:v13 contentType:v17];

  return v18;
}

- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 isDirectory:(BOOL)a7
{
  uint64_t v7 = (void *)MEMORY[0x1E4F443C8];
  if (!a7) {
    uint64_t v7 = (void *)MEMORY[0x1E4F44408];
  }
  return [(FPItem *)self initWithProviderDomainID:a3 itemIdentifier:a4 parentItemIdentifier:a5 filename:a6 contentType:*v7];
}

uint64_t __101__FPItem_initWithVendorItem_provider_domain_spotlightDomainIdentifier_extensionCapabilities_useFPFS___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  unsigned __int8 v8 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v12 = a1[4];
    uint64_t v13 = objc_opt_class();
    [v9 handleFailureInMethod:v10, v11, @"FPItem.m", 835, @"Key %@ in extendedAttributes of item %@ has class %@ instead of %@", v5, v12, v13, objc_opt_class() object file lineNumber description];
  }
  if ((v8 & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = a1[5];
    uint64_t v15 = a1[6];
    uint64_t v17 = a1[4];
    uint64_t v18 = objc_opt_class();
    [v14 handleFailureInMethod:v15, v16, @"FPItem.m", 836, @"Value %@ in extendedAttributes of item %@ has class %@ instead of %@", v6, v17, v18, objc_opt_class() object file lineNumber description];
  }
  return isKindOfClass & v8 & 1;
}

- (id)fieldDifferencesWithItem:(id)a3
{
  return [(FPItem *)self fieldDifferencesWithItem:a3 onlyMetadata:0];
}

- (id)fieldDifferencesWithItem:(id)a3 onlyMetadata:(BOOL)a4
{
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  if (a4) {
    goto LABEL_52;
  }
  uint64_t v10 = [v8 itemIdentifier];
  if (v10)
  {
    id v4 = [(FPItem *)self itemIdentifier];
    id v5 = [v8 itemIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_9:
      [v9 addObject:@"itemIdentifier"];
      goto LABEL_12;
    }
  }
  uint64_t v11 = [(FPItem *)self itemIdentifier];
  if (v11)
  {
    uint64_t v12 = [v8 itemIdentifier];

    if (v10)
    {
    }
    if (!v12) {
      goto LABEL_9;
    }
  }
  else
  {

    if (v10)
    {
    }
  }
LABEL_12:
  uint64_t v13 = [v8 formerIdentifier];
  if (v13)
  {
    id v4 = [(FPItem *)self formerIdentifier];
    id v5 = [v8 formerIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_19:
      [v9 addObject:@"formerIdentifier"];
      goto LABEL_22;
    }
  }
  id v14 = [(FPItem *)self formerIdentifier];
  if (v14)
  {
    uint64_t v15 = [v8 formerIdentifier];

    if (v13)
    {
    }
    if (!v15) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v13)
    {
    }
  }
LABEL_22:
  uint64_t v16 = [v8 parentItemIdentifier];
  if (v16)
  {
    id v4 = [(FPItem *)self parentItemIdentifier];
    id v5 = [v8 parentItemIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_29:
      [v9 addObject:@"parentItemIdentifier"];
      goto LABEL_32;
    }
  }
  uint64_t v17 = [(FPItem *)self parentItemIdentifier];
  if (v17)
  {
    uint64_t v18 = [v8 parentItemIdentifier];

    if (v16)
    {
    }
    if (!v18) {
      goto LABEL_29;
    }
  }
  else
  {

    if (v16)
    {
    }
  }
LABEL_32:
  id v19 = [v8 providerID];
  if (v19)
  {
    id v4 = [(FPItem *)self providerID];
    id v5 = [v8 providerID];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_39:
      [v9 addObject:@"providerID"];
      goto LABEL_42;
    }
  }
  int v20 = [(FPItem *)self providerID];
  if (!v20)
  {

    if (v19)
    {
    }
    goto LABEL_42;
  }
  uint64_t v21 = [v8 providerID];

  if (v19)
  {
  }
  if (!v21) {
    goto LABEL_39;
  }
LABEL_42:
  id v22 = [v8 domainIdentifier];
  if (v22)
  {
    id v4 = [(FPItem *)self domainIdentifier];
    id v5 = [v8 domainIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_49:
      [v9 addObject:@"domainIdentifier"];
      goto LABEL_52;
    }
  }
  v23 = [(FPItem *)self domainIdentifier];
  if (v23)
  {
    uint64_t v24 = [v8 domainIdentifier];

    if (v22)
    {
    }
    if (!v24) {
      goto LABEL_49;
    }
  }
  else
  {

    if (v22)
    {
    }
  }
LABEL_52:
  id v25 = [v8 filename];
  if (v25)
  {
    id v4 = [(FPItem *)self filename];
    id v5 = [v8 filename];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_59:
      [v9 addObject:@"filename"];
      goto LABEL_62;
    }
  }
  uint64_t v26 = [(FPItem *)self filename];
  if (v26)
  {
    id v27 = [v8 filename];

    if (v25)
    {
    }
    if (!v27) {
      goto LABEL_59;
    }
  }
  else
  {

    if (v25)
    {
    }
  }
LABEL_62:
  int v28 = [v8 displayName];
  if (v28)
  {
    id v4 = [(FPItem *)self displayName];
    id v5 = [v8 displayName];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_69:
      [v9 addObject:@"displayName"];
      goto LABEL_72;
    }
  }
  id v29 = [(FPItem *)self displayName];
  if (v29)
  {
    objc_super v30 = [v8 displayName];

    if (v28)
    {
    }
    if (!v30) {
      goto LABEL_69;
    }
  }
  else
  {

    if (v28)
    {
    }
  }
LABEL_72:
  v31 = [v8 contentType];
  if (v31)
  {
    id v4 = [(FPItem *)self contentType];
    id v5 = [v8 contentType];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_79:
      [v9 addObject:@"contentType"];
      goto LABEL_82;
    }
  }
  v32 = [(FPItem *)self contentType];
  if (v32)
  {
    v33 = [v8 contentType];

    if (v31)
    {
    }
    if (!v33) {
      goto LABEL_79;
    }
  }
  else
  {

    if (v31)
    {
    }
  }
LABEL_82:
  v34 = [v8 documentSize];
  if (v34)
  {
    id v4 = [(FPItem *)self documentSize];
    id v5 = [v8 documentSize];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_89:
      [v9 addObject:@"documentSize"];
      goto LABEL_92;
    }
  }
  uint64_t v35 = [(FPItem *)self documentSize];
  if (v35)
  {
    id v36 = [v8 documentSize];

    if (v34)
    {
    }
    if (!v36) {
      goto LABEL_89;
    }
  }
  else
  {

    if (v34)
    {
    }
  }
LABEL_92:
  v37 = [v8 fileURL];
  if (v37)
  {
    id v4 = [(FPItem *)self fileURL];
    id v5 = [v8 fileURL];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_99:
      [v9 addObject:@"fileURL"];
      goto LABEL_102;
    }
  }
  v38 = [(FPItem *)self fileURL];
  if (v38)
  {
    id v39 = [v8 fileURL];

    if (v37)
    {
    }
    if (!v39) {
      goto LABEL_99;
    }
  }
  else
  {

    if (v37)
    {
    }
  }
LABEL_102:
  unint64_t v40 = [(FPItem *)self capabilities];
  if (v40 != [v8 capabilities]) {
    [v9 addObject:@"capabilities"];
  }
  unint64_t v41 = [(FPItem *)self enumerationOrigin];
  if (v41 != [v8 enumerationOrigin]) {
    [v9 addObject:@"enumerationOrigin"];
  }
  id v42 = [v8 creationDate];
  if (v42)
  {
    id v4 = [(FPItem *)self creationDate];
    id v5 = [v8 creationDate];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_113:
      [v9 addObject:@"creationDate"];
      goto LABEL_116;
    }
  }
  v43 = [(FPItem *)self creationDate];
  if (v43)
  {
    v44 = [v8 creationDate];

    if (v42)
    {
    }
    if (!v44) {
      goto LABEL_113;
    }
  }
  else
  {

    if (v42)
    {
    }
  }
LABEL_116:
  id v45 = [v8 contentModificationDate];
  if (v45)
  {
    id v4 = [(FPItem *)self contentModificationDate];
    id v5 = [v8 contentModificationDate];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_123:
      [v9 addObject:@"contentModificationDate"];
      goto LABEL_126;
    }
  }
  int v46 = [(FPItem *)self contentModificationDate];
  if (v46)
  {
    int v47 = [v8 contentModificationDate];

    if (v45)
    {
    }
    if (!v47) {
      goto LABEL_123;
    }
  }
  else
  {

    if (v45)
    {
    }
  }
LABEL_126:
  int v48 = [(FPItem *)self isTrashed];
  if (v48 != [v8 isTrashed]) {
    [v9 addObject:@"isTrashed"];
  }
  uint64_t v49 = [v8 lastUsedDate];
  if (v49)
  {
    id v4 = [(FPItem *)self lastUsedDate];
    id v5 = [v8 lastUsedDate];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_135:
      [v9 addObject:@"lastUsedDate"];
      goto LABEL_138;
    }
  }
  uint64_t v50 = [(FPItem *)self lastUsedDate];
  if (v50)
  {
    id v51 = [v8 lastUsedDate];

    if (v49)
    {
    }
    if (!v51) {
      goto LABEL_135;
    }
  }
  else
  {

    if (v49)
    {
    }
  }
LABEL_138:
  uint64_t v52 = [v8 tags];
  if (v52)
  {
    id v4 = [(FPItem *)self tags];
    id v5 = [v8 tags];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_145:
      [v9 addObject:@"tags"];
      goto LABEL_148;
    }
  }
  uint64_t v53 = [(FPItem *)self tags];
  if (v53)
  {
    uint64_t v54 = [v8 tags];

    if (v52)
    {
    }
    if (!v54) {
      goto LABEL_145;
    }
  }
  else
  {

    if (v52)
    {
    }
  }
LABEL_148:
  uint64_t v55 = [v8 favoriteRank];
  if (v55)
  {
    id v4 = [(FPItem *)self favoriteRank];
    id v5 = [v8 favoriteRank];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_155:
      [v9 addObject:@"favoriteRank"];
      goto LABEL_158;
    }
  }
  id v56 = [(FPItem *)self favoriteRank];
  if (v56)
  {
    v57 = [v8 favoriteRank];

    if (v55)
    {
    }
    if (!v57) {
      goto LABEL_155;
    }
  }
  else
  {

    if (v55)
    {
    }
  }
LABEL_158:
  if (a4) {
    goto LABEL_225;
  }
  int v58 = [(FPItem *)self isUploaded];
  if (v58 != [v8 isUploaded]) {
    [v9 addObject:@"isUploaded"];
  }
  int v59 = [(FPItem *)self isUploading];
  if (v59 != [v8 isUploading]) {
    [v9 addObject:@"isUploading"];
  }
  v60 = [v8 uploadingError];
  if (v60)
  {
    id v4 = [(FPItem *)self uploadingError];
    id v5 = [v8 uploadingError];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_170:
      [v9 addObject:@"uploadingError"];
      goto LABEL_173;
    }
  }
  uint64_t v61 = [(FPItem *)self uploadingError];
  if (v61)
  {
    v62 = [v8 uploadingError];

    if (v60)
    {
    }
    if (!v62) {
      goto LABEL_170;
    }
  }
  else
  {

    if (v60)
    {
    }
  }
LABEL_173:
  int v63 = [(FPItem *)self isDownloaded];
  if (v63 != [v8 isDownloaded]) {
    [v9 addObject:@"isDownloaded"];
  }
  int v64 = [(FPItem *)self isDownloading];
  if (v64 != [v8 isDownloading]) {
    [v9 addObject:@"isDownloading"];
  }
  uint64_t v65 = [v8 downloadingError];
  if (v65)
  {
    id v4 = [(FPItem *)self downloadingError];
    id v5 = [v8 downloadingError];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_184:
      [v9 addObject:@"downloadingError"];
      goto LABEL_187;
    }
  }
  uint64_t v66 = [(FPItem *)self downloadingError];
  if (v66)
  {
    uint64_t v67 = [v8 downloadingError];

    if (v65)
    {
    }
    if (!v67) {
      goto LABEL_184;
    }
  }
  else
  {

    if (v65)
    {
    }
  }
LABEL_187:
  int v68 = [(FPItem *)self isMostRecentVersionDownloaded];
  if (v68 != [v8 isMostRecentVersionDownloaded]) {
    [v9 addObject:@"isMostRecentVersionDownloaded"];
  }
  int v69 = [(FPItem *)self isShared];
  if (v69 != [v8 isShared]) {
    [v9 addObject:@"isShared"];
  }
  int v70 = [(FPItem *)self isSharedByCurrentUser];
  if (v70 != [v8 isSharedByCurrentUser]) {
    [v9 addObject:@"isSharedByCurrentUser"];
  }
  int v71 = [(FPItem *)self fp_isLastModifiedByCurrentUser];
  if (v71 != objc_msgSend(v8, "fp_isLastModifiedByCurrentUser")) {
    [v9 addObject:@"fp_isLastModifiedByCurrentUser"];
  }
  id v72 = [v8 ownerNameComponents];
  if (v72)
  {
    id v4 = [(FPItem *)self ownerNameComponents];
    id v5 = [v8 ownerNameComponents];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_202:
      [v9 addObject:@"ownerNameComponents"];
      goto LABEL_205;
    }
  }
  id v73 = [(FPItem *)self ownerNameComponents];
  if (v73)
  {
    id v74 = [v8 ownerNameComponents];

    if (v72)
    {
    }
    if (!v74) {
      goto LABEL_202;
    }
  }
  else
  {

    if (v72)
    {
    }
  }
LABEL_205:
  v75 = [v8 mostRecentEditorNameComponents];
  if (v75)
  {
    id v4 = [(FPItem *)self mostRecentEditorNameComponents];
    id v5 = [v8 mostRecentEditorNameComponents];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_212:
      [v9 addObject:@"mostRecentEditorNameComponents"];
      goto LABEL_215;
    }
  }
  uint64_t v76 = [(FPItem *)self mostRecentEditorNameComponents];
  if (!v76)
  {

    if (v75)
    {
    }
    goto LABEL_215;
  }
  v77 = [v8 mostRecentEditorNameComponents];

  if (v75)
  {
  }
  if (!v77) {
    goto LABEL_212;
  }
LABEL_215:
  id v78 = [v8 collaborationIdentifier];
  if (v78)
  {
    id v4 = [(FPItem *)self collaborationIdentifier];
    id v5 = [v8 collaborationIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_222:
      [v9 addObject:@"collaborationIdentifier"];
      goto LABEL_225;
    }
  }
  id v79 = [(FPItem *)self collaborationIdentifier];
  if (v79)
  {
    id v80 = [v8 collaborationIdentifier];

    if (v78)
    {
    }
    if (!v80) {
      goto LABEL_222;
    }
  }
  else
  {

    if (v78)
    {
    }
  }
LABEL_225:
  v81 = [v8 childItemCount];
  if (v81)
  {
    id v4 = [(FPItem *)self childItemCount];
    id v5 = [v8 childItemCount];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_232:
      [v9 addObject:@"childItemCount"];
      goto LABEL_235;
    }
  }
  v82 = [(FPItem *)self childItemCount];
  if (v82)
  {
    uint64_t v83 = [v8 childItemCount];

    if (v81)
    {
    }
    if (!v83) {
      goto LABEL_232;
    }
  }
  else
  {

    if (v81)
    {
    }
  }
LABEL_235:
  uint64_t v84 = [v8 userInfo];
  if (v84)
  {
    id v4 = [(FPItem *)self userInfo];
    id v5 = [v8 userInfo];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_242:
      [v9 addObject:@"userInfo"];
      goto LABEL_245;
    }
  }
  uint64_t v85 = [(FPItem *)self userInfo];
  if (v85)
  {
    uint64_t v86 = [v8 userInfo];

    if (v84)
    {
    }
    if (!v86) {
      goto LABEL_242;
    }
  }
  else
  {

    if (v84)
    {
    }
  }
LABEL_245:
  if (a4) {
    goto LABEL_394;
  }
  unint64_t v87 = [(FPItem *)self state];
  if (v87 != [v8 state]) {
    [v9 addObject:@"state"];
  }
  v88 = [v8 placeholderIdentifier];
  if (v88)
  {
    uint64_t v84 = [(FPItem *)self placeholderIdentifier];
    id v4 = [v8 placeholderIdentifier];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_255:
      [v9 addObject:@"placeholderIdentifier"];
      goto LABEL_258;
    }
  }
  id v89 = [(FPItem *)self placeholderIdentifier];
  if (v89)
  {
    uint64_t v90 = [v8 placeholderIdentifier];

    if (v88)
    {
    }
    if (!v90) {
      goto LABEL_255;
    }
  }
  else
  {

    if (v88)
    {
    }
  }
LABEL_258:
  char v91 = [v8 versionIdentifier];
  if (v91)
  {
    uint64_t v84 = [(FPItem *)self versionIdentifier];
    id v4 = [v8 versionIdentifier];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_265:
      [v9 addObject:@"versionIdentifier"];
      goto LABEL_268;
    }
  }
  char v92 = [(FPItem *)self versionIdentifier];
  if (v92)
  {
    char v93 = [v8 versionIdentifier];

    if (v91)
    {
    }
    if (!v93) {
      goto LABEL_265;
    }
  }
  else
  {

    if (v91)
    {
    }
  }
LABEL_268:
  v94 = [v8 itemVersion];
  if (v94)
  {
    uint64_t v84 = [(FPItem *)self itemVersion];
    id v4 = [v8 itemVersion];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_275:
      [v9 addObject:@"itemVersion"];
      goto LABEL_278;
    }
  }
  uint64_t v95 = [(FPItem *)self itemVersion];
  if (v95)
  {
    v96 = [v8 itemVersion];

    if (v94)
    {
    }
    if (!v96) {
      goto LABEL_275;
    }
  }
  else
  {

    if (v94)
    {
    }
  }
LABEL_278:
  char v97 = [v8 spotlightDomainIdentifier];
  if (v97)
  {
    uint64_t v84 = [(FPItem *)self spotlightDomainIdentifier];
    id v4 = [v8 spotlightDomainIdentifier];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_285:
      [v9 addObject:@"spotlightDomainIdentifier"];
      goto LABEL_288;
    }
  }
  uint64_t v98 = [(FPItem *)self spotlightDomainIdentifier];
  if (v98)
  {
    v99 = [v8 spotlightDomainIdentifier];

    if (v97)
    {
    }
    if (!v99) {
      goto LABEL_285;
    }
  }
  else
  {

    if (v97)
    {
    }
  }
LABEL_288:
  v100 = objc_msgSend(v8, "fp_spotlightSubDomainIdentifier");
  if (v100)
  {
    uint64_t v84 = [(FPItem *)self fp_spotlightSubDomainIdentifier];
    id v4 = objc_msgSend(v8, "fp_spotlightSubDomainIdentifier");
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_295:
      [v9 addObject:@"fp_spotlightSubDomainIdentifier"];
      goto LABEL_298;
    }
  }
  uint64_t v101 = [(FPItem *)self fp_spotlightSubDomainIdentifier];
  if (v101)
  {
    v102 = objc_msgSend(v8, "fp_spotlightSubDomainIdentifier");

    if (v100)
    {
    }
    if (!v102) {
      goto LABEL_295;
    }
  }
  else
  {

    if (v100)
    {
    }
  }
LABEL_298:
  int v103 = [(FPItem *)self isInPinnedFolder];
  if (v103 != [v8 isInPinnedFolder]) {
    [v9 addObject:@"isInPinnedFolder"];
  }
  int v104 = [(FPItem *)self isPinned];
  if (v104 != [v8 isPinned]) {
    [v9 addObject:@"isPinned"];
  }
  v105 = [v8 hasUnresolvedConflicts];
  if (v105)
  {
    uint64_t v84 = [(FPItem *)self hasUnresolvedConflicts];
    id v4 = [v8 hasUnresolvedConflicts];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_309:
      [v9 addObject:@"hasUnresolvedConflicts"];
      goto LABEL_312;
    }
  }
  uint64_t v106 = [(FPItem *)self hasUnresolvedConflicts];
  if (v106)
  {
    v107 = [v8 hasUnresolvedConflicts];

    if (v105)
    {
    }
    if (!v107) {
      goto LABEL_309;
    }
  }
  else
  {

    if (v105)
    {
    }
  }
LABEL_312:
  uint64_t v108 = [v8 isDownloadRequested];
  if (v108)
  {
    uint64_t v84 = [(FPItem *)self isDownloadRequested];
    id v4 = [v8 isDownloadRequested];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_319:
      [v9 addObject:@"isDownloadRequested"];
      goto LABEL_322;
    }
  }
  v109 = [(FPItem *)self isDownloadRequested];
  if (v109)
  {
    uint64_t v110 = [v8 isDownloadRequested];

    if (v108)
    {
    }
    if (!v110) {
      goto LABEL_319;
    }
  }
  else
  {

    if (v108)
    {
    }
  }
LABEL_322:
  v111 = [v8 sharingPermissions];
  if (v111)
  {
    uint64_t v84 = [(FPItem *)self sharingPermissions];
    id v4 = [v8 sharingPermissions];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_329:
      [v9 addObject:@"sharingPermissions"];
      goto LABEL_332;
    }
  }
  v112 = [(FPItem *)self sharingPermissions];
  if (v112)
  {
    uint64_t v113 = [v8 sharingPermissions];

    if (v111)
    {
    }
    if (!v113) {
      goto LABEL_329;
    }
  }
  else
  {

    if (v111)
    {
    }
  }
LABEL_332:
  v114 = [v8 containerDisplayName];
  if (v114)
  {
    uint64_t v84 = [(FPItem *)self containerDisplayName];
    id v4 = [v8 containerDisplayName];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_339:
      [v9 addObject:@"containerDisplayName"];
      goto LABEL_342;
    }
  }
  uint64_t v115 = [(FPItem *)self containerDisplayName];
  if (v115)
  {
    uint64_t v116 = [v8 containerDisplayName];

    if (v114)
    {
    }
    if (!v116) {
      goto LABEL_339;
    }
  }
  else
  {

    if (v114)
    {
    }
  }
LABEL_342:
  int v117 = [(FPItem *)self supportsMostRecentVersionDownloaded];
  if (v117 != [v8 supportsMostRecentVersionDownloaded]) {
    [v9 addObject:@"supportsMostRecentVersionDownloaded"];
  }
  char v118 = objc_msgSend(v8, "fp_appContainerBundleIdentifier");
  if (v118)
  {
    uint64_t v84 = [(FPItem *)self fp_appContainerBundleIdentifier];
    id v4 = objc_msgSend(v8, "fp_appContainerBundleIdentifier");
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_351:
      [v9 addObject:@"fp_appContainerBundleIdentifier"];
      goto LABEL_354;
    }
  }
  uint64_t v119 = [(FPItem *)self fp_appContainerBundleIdentifier];
  if (v119)
  {
    char v120 = objc_msgSend(v8, "fp_appContainerBundleIdentifier");

    if (v118)
    {
    }
    if (!v120) {
      goto LABEL_351;
    }
  }
  else
  {

    if (v118)
    {
    }
  }
LABEL_354:
  uint64_t v121 = objc_msgSend(v8, "fp_parentDomainIdentifier");
  if (v121)
  {
    uint64_t v84 = [(FPItem *)self fp_parentDomainIdentifier];
    id v4 = objc_msgSend(v8, "fp_parentDomainIdentifier");
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_361:
      [v9 addObject:@"fp_parentDomainIdentifier"];
      goto LABEL_364;
    }
  }
  v122 = [(FPItem *)self fp_parentDomainIdentifier];
  if (v122)
  {
    uint64_t v123 = objc_msgSend(v8, "fp_parentDomainIdentifier");

    if (v121)
    {
    }
    if (!v123) {
      goto LABEL_361;
    }
  }
  else
  {

    if (v121)
    {
    }
  }
LABEL_364:
  v124 = [v8 cloudContainerIdentifier];
  if (v124)
  {
    uint64_t v84 = [(FPItem *)self cloudContainerIdentifier];
    id v4 = [v8 cloudContainerIdentifier];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_371:
      [v9 addObject:@"cloudContainerIdentifier"];
      goto LABEL_374;
    }
  }
  uint64_t v125 = [(FPItem *)self cloudContainerIdentifier];
  if (v125)
  {
    v126 = [v8 cloudContainerIdentifier];

    if (v124)
    {
    }
    if (!v126) {
      goto LABEL_371;
    }
  }
  else
  {

    if (v124)
    {
    }
  }
LABEL_374:
  int v127 = [(FPItem *)self isUbiquitous];
  if (v127 != [v8 isUbiquitous]) {
    [v9 addObject:@"isUbiquitous"];
  }
  int v128 = [(FPItem *)self isContainer];
  if (v128 != [v8 isContainer]) {
    [v9 addObject:@"isContainer"];
  }
  int v129 = [(FPItem *)self isContainerPristine];
  if (v129 != [v8 isContainerPristine]) {
    [v9 addObject:@"isContainerPristine"];
  }
  int v130 = [(FPItem *)self isTopLevelSharedItem];
  if (v130 != [v8 isTopLevelSharedItem]) {
    [v9 addObject:@"isTopLevelSharedItem"];
  }
  int v131 = [(FPItem *)self isRecursivelyDownloaded];
  if (v131 != [v8 isRecursivelyDownloaded]) {
    [v9 addObject:@"isRecursivelyDownloaded"];
  }
  v132 = [v8 conflictingVersions];
  if (v132)
  {
    uint64_t v84 = [(FPItem *)self conflictingVersions];
    id v4 = [v8 conflictingVersions];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_391:
      [v9 addObject:@"conflictingVersions"];
      goto LABEL_394;
    }
  }
  v133 = [(FPItem *)self conflictingVersions];
  if (v133)
  {
    v134 = [v8 conflictingVersions];

    if (v132)
    {
    }
    if (!v134) {
      goto LABEL_391;
    }
  }
  else
  {

    if (v132)
    {
    }
  }
LABEL_394:
  unint64_t v135 = [(FPItem *)self fileSystemFlags];
  if (v135 != [v8 fileSystemFlags]) {
    [v9 addObject:@"fileSystemFlags"];
  }
  v136 = [v8 extendedAttributes];
  if (v136)
  {
    uint64_t v84 = [(FPItem *)self extendedAttributes];
    id v4 = [v8 extendedAttributes];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_403:
      [v9 addObject:@"extendedAttributes"];
      goto LABEL_406;
    }
  }
  v137 = [(FPItem *)self extendedAttributes];
  if (v137)
  {
    uint64_t v138 = [v8 extendedAttributes];

    if (v136)
    {
    }
    if (!v138) {
      goto LABEL_403;
    }
  }
  else
  {

    if (v136)
    {
    }
  }
LABEL_406:
  v139 = [v8 decorations];
  if (v139)
  {
    uint64_t v84 = [(FPItem *)self decorations];
    id v4 = [v8 decorations];
    if (([v84 isEqual:v4] & 1) == 0)
    {

LABEL_413:
      [v9 addObject:@"decorations"];
      goto LABEL_416;
    }
  }
  uint64_t v140 = [(FPItem *)self decorations];
  if (v140)
  {
    v141 = [v8 decorations];

    if (v139)
    {
    }
    if (!v141) {
      goto LABEL_413;
    }
  }
  else
  {

    if (v139)
    {
    }
  }
LABEL_416:
  int v142 = (int)[(FPItem *)self typeAndCreator];
  if (v142 != [v8 typeAndCreator]
    || (unint64_t v143 = (unint64_t)[(FPItem *)self typeAndCreator] >> 32,
        v143 != (unint64_t)[v8 typeAndCreator] >> 32))
  {
    [v9 addObject:@"typeAndCreator"];
  }
  int64_t v144 = [(FPItem *)self contentPolicy];
  if (v144 != [v8 contentPolicy]) {
    [v9 addObject:@"contentPolicy"];
  }
  int64_t v145 = [(FPItem *)self inheritedContentPolicy];
  if (v145 != [v8 inheritedContentPolicy]) {
    [v9 addObject:@"inheritedContentPolicy"];
  }
  int64_t v146 = [(FPItem *)self effectiveContentPolicy];
  if (v146 != [v8 effectiveContentPolicy]) {
    [v9 addObject:@"effectiveContentPolicy"];
  }
  uint64_t v147 = fp_current_or_default_log();
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG)) {
    -[FPItem fieldDifferencesWithItem:onlyMetadata:]((uint64_t)v9, v8);
  }

  id v148 = v9;
  return v148;
}

- (void)overrideFields:(id)a3 ofItem:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 containsObject:@"itemIdentifier"]) {
    goto LABEL_14;
  }
  uint64_t v10 = [v9 itemIdentifier];
  if (v10)
  {
    id v4 = [(FPItem *)self itemIdentifier];
    id v5 = [v9 itemIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

LABEL_9:
      uint64_t v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.62();
      }

      id v14 = [v9 itemIdentifier];
      itemIdentifier = self->_itemIdentifier;
      self->_itemIdentifier = v14;

      goto LABEL_14;
    }
  }
  uint64_t v11 = [(FPItem *)self itemIdentifier];
  if (v11)
  {
    uint64_t v12 = [v9 itemIdentifier];

    if (v10)
    {
    }
    if (!v12) {
      goto LABEL_9;
    }
  }
  else
  {

    if (v10)
    {
    }
  }
LABEL_14:
  if (![v8 containsObject:@"formerIdentifier"]) {
    goto LABEL_28;
  }
  formerIdentifier = [v9 formerIdentifier];
  if (formerIdentifier)
  {
    id v4 = [(FPItem *)self formerIdentifier];
    id v5 = [v9 formerIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_22;
    }
  }
  uint64_t v17 = [(FPItem *)self formerIdentifier];
  if (!v17)
  {

    if (!formerIdentifier) {
      goto LABEL_28;
    }

    goto LABEL_27;
  }
  uint64_t v18 = [v9 formerIdentifier];

  if (formerIdentifier)
  {
  }
  if (!v18)
  {
LABEL_22:
    id v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.61();
    }

    int v20 = [v9 formerIdentifier];
    formerIdentifier = self->_formerIdentifier;
    self->_formerIdentifier = v20;
LABEL_27:
  }
LABEL_28:
  if (![v8 containsObject:@"parentItemIdentifier"]) {
    goto LABEL_42;
  }
  parentItemIdentifier = [v9 parentItemIdentifier];
  if (parentItemIdentifier)
  {
    id v4 = [(FPItem *)self parentItemIdentifier];
    id v5 = [v9 parentItemIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_36;
    }
  }
  id v22 = [(FPItem *)self parentItemIdentifier];
  if (!v22)
  {

    if (!parentItemIdentifier) {
      goto LABEL_42;
    }

    goto LABEL_41;
  }
  v23 = [v9 parentItemIdentifier];

  if (parentItemIdentifier)
  {
  }
  if (!v23)
  {
LABEL_36:
    uint64_t v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.60();
    }

    id v25 = [v9 parentItemIdentifier];
    parentItemIdentifier = self->_parentItemIdentifier;
    self->_parentItemIdentifier = v25;
LABEL_41:
  }
LABEL_42:
  if (![v8 containsObject:@"providerID"]) {
    goto LABEL_56;
  }
  providerID = [v9 providerID];
  if (providerID)
  {
    id v4 = [(FPItem *)self providerID];
    id v5 = [v9 providerID];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_50;
    }
  }
  id v27 = [(FPItem *)self providerID];
  if (!v27)
  {

    if (!providerID) {
      goto LABEL_56;
    }

    goto LABEL_55;
  }
  int v28 = [v9 providerID];

  if (providerID)
  {
  }
  if (!v28)
  {
LABEL_50:
    id v29 = fp_current_or_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.59();
    }

    objc_super v30 = [v9 providerID];
    providerID = self->_providerID;
    self->_providerID = v30;
LABEL_55:
  }
LABEL_56:
  if (![v8 containsObject:@"domainIdentifier"]) {
    goto LABEL_70;
  }
  domainIdentifier = [v9 domainIdentifier];
  if (domainIdentifier)
  {
    id v4 = [(FPItem *)self domainIdentifier];
    id v5 = [v9 domainIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_64;
    }
  }
  v32 = [(FPItem *)self domainIdentifier];
  if (!v32)
  {

    if (!domainIdentifier) {
      goto LABEL_70;
    }

    goto LABEL_69;
  }
  v33 = [v9 domainIdentifier];

  if (domainIdentifier)
  {
  }
  if (!v33)
  {
LABEL_64:
    v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.58();
    }

    uint64_t v35 = [v9 domainIdentifier];
    domainIdentifier = self->_domainIdentifier;
    self->_domainIdentifier = v35;
LABEL_69:
  }
LABEL_70:
  if (![v8 containsObject:@"filename"]) {
    goto LABEL_84;
  }
  filename = [v9 filename];
  if (filename)
  {
    id v4 = [(FPItem *)self filename];
    id v5 = [v9 filename];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_78;
    }
  }
  v37 = [(FPItem *)self filename];
  if (!v37)
  {

    if (!filename) {
      goto LABEL_84;
    }

    goto LABEL_83;
  }
  v38 = [v9 filename];

  if (filename)
  {
  }
  if (!v38)
  {
LABEL_78:
    id v39 = fp_current_or_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.57();
    }

    unint64_t v40 = [v9 filename];
    filename = self->_filename;
    self->_filename = v40;
LABEL_83:
  }
LABEL_84:
  if (![v8 containsObject:@"displayName"]) {
    goto LABEL_98;
  }
  displayName = [v9 displayName];
  if (displayName)
  {
    id v4 = [(FPItem *)self displayName];
    id v5 = [v9 displayName];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_92;
    }
  }
  id v42 = [(FPItem *)self displayName];
  if (!v42)
  {

    if (!displayName) {
      goto LABEL_98;
    }

    goto LABEL_97;
  }
  v43 = [v9 displayName];

  if (displayName)
  {
  }
  if (!v43)
  {
LABEL_92:
    v44 = fp_current_or_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.56();
    }

    id v45 = [v9 displayName];
    displayName = self->_displayName;
    self->_displayName = v45;
LABEL_97:
  }
LABEL_98:
  if (![v8 containsObject:@"contentType"]) {
    goto LABEL_112;
  }
  int v46 = [v9 contentType];
  if (v46)
  {
    id v4 = [(FPItem *)self contentType];
    id v5 = [v9 contentType];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_106;
    }
  }
  int v47 = [(FPItem *)self contentType];
  if (!v47)
  {

    if (!v46) {
      goto LABEL_112;
    }

    goto LABEL_111;
  }
  int v48 = [v9 contentType];

  if (v46)
  {
  }
  if (!v48)
  {
LABEL_106:
    uint64_t v49 = fp_current_or_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.55();
    }

    int v46 = [v9 contentType];
    [(FPItem *)self setContentType:v46];
LABEL_111:
  }
LABEL_112:
  if (![v8 containsObject:@"documentSize"]) {
    goto LABEL_126;
  }
  documentSize = [v9 documentSize];
  if (documentSize)
  {
    id v4 = [(FPItem *)self documentSize];
    id v5 = [v9 documentSize];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_120;
    }
  }
  id v51 = [(FPItem *)self documentSize];
  if (!v51)
  {

    if (!documentSize) {
      goto LABEL_126;
    }

    goto LABEL_125;
  }
  uint64_t v52 = [v9 documentSize];

  if (documentSize)
  {
  }
  if (!v52)
  {
LABEL_120:
    uint64_t v53 = fp_current_or_default_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.54();
    }

    uint64_t v54 = [v9 documentSize];
    documentSize = self->_documentSize;
    self->_documentSize = v54;
LABEL_125:
  }
LABEL_126:
  if ([v8 containsObject:@"fileURL"])
  {
    fileURL = [v9 fileURL];
    if (fileURL)
    {
      id v4 = [(FPItem *)self fileURL];
      id v5 = [v9 fileURL];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_134:
        int v58 = fp_current_or_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:].cold.53();
        }

        int v59 = [v9 fileURL];
        fileURL = self->_fileURL;
        self->_fileURL = v59;
        goto LABEL_139;
      }
    }
    id v56 = [(FPItem *)self fileURL];
    if (v56)
    {
      v57 = [v9 fileURL];

      if (fileURL)
      {
      }
      if (!v57) {
        goto LABEL_134;
      }
    }
    else
    {

      if (fileURL)
      {

LABEL_139:
      }
    }
  }
  if ([v8 containsObject:@"capabilities"])
  {
    unint64_t v60 = [(FPItem *)self capabilities];
    if (v60 != [v9 capabilities])
    {
      uint64_t v61 = fp_current_or_default_log();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.52(v9, self, v61);
      }

      self->_capabilities = [v9 capabilities];
    }
  }
  if ([v8 containsObject:@"enumerationOrigin"])
  {
    unint64_t v62 = [(FPItem *)self enumerationOrigin];
    if (v62 != [v9 enumerationOrigin])
    {
      int v63 = fp_current_or_default_log();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.51(v9, self, v63);
      }

      self->_enumerationOrigin = [v9 enumerationOrigin];
    }
  }
  if ([v8 containsObject:@"creationDate"])
  {
    creationDate = [v9 creationDate];
    if (creationDate)
    {
      id v4 = [(FPItem *)self creationDate];
      id v5 = [v9 creationDate];
      if (([v4 isEqual:v5] & 1) == 0)
      {

        goto LABEL_158;
      }
    }
    uint64_t v65 = [(FPItem *)self creationDate];
    if (!v65)
    {

      if (!creationDate) {
        goto LABEL_164;
      }

      goto LABEL_163;
    }
    uint64_t v66 = [v9 creationDate];

    if (creationDate)
    {
    }
    if (!v66)
    {
LABEL_158:
      uint64_t v67 = fp_current_or_default_log();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.50();
      }

      int v68 = [v9 creationDate];
      creationDate = self->_creationDate;
      self->_creationDate = v68;
LABEL_163:
    }
  }
LABEL_164:
  if ([v8 containsObject:@"contentModificationDate"])
  {
    contentModificationDate = [v9 contentModificationDate];
    if (contentModificationDate)
    {
      id v4 = [(FPItem *)self contentModificationDate];
      id v5 = [v9 contentModificationDate];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_172:
        id v72 = fp_current_or_default_log();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:].cold.49();
        }

        id v73 = [v9 contentModificationDate];
        contentModificationDate = self->_contentModificationDate;
        self->_contentModificationDate = v73;
        goto LABEL_177;
      }
    }
    int v70 = [(FPItem *)self contentModificationDate];
    if (v70)
    {
      int v71 = [v9 contentModificationDate];

      if (contentModificationDate)
      {
      }
      if (!v71) {
        goto LABEL_172;
      }
    }
    else
    {

      if (contentModificationDate)
      {

LABEL_177:
      }
    }
  }
  if ([v8 containsObject:@"isTrashed"])
  {
    int v74 = [(FPItem *)self isTrashed];
    if (v74 != [v9 isTrashed])
    {
      v75 = fp_current_or_default_log();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.48(v9, self, v75);
      }

      self->_trashed = [v9 isTrashed];
    }
  }
  if ([v8 containsObject:@"lastUsedDate"])
  {
    lastUsedDate = [v9 lastUsedDate];
    if (lastUsedDate)
    {
      id v4 = [(FPItem *)self lastUsedDate];
      id v5 = [v9 lastUsedDate];
      if (([v4 isEqual:v5] & 1) == 0)
      {

        goto LABEL_191;
      }
    }
    v77 = [(FPItem *)self lastUsedDate];
    if (!v77)
    {

      if (!lastUsedDate) {
        goto LABEL_197;
      }

      goto LABEL_196;
    }
    id v78 = [v9 lastUsedDate];

    if (lastUsedDate)
    {
    }
    if (!v78)
    {
LABEL_191:
      id v79 = fp_current_or_default_log();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.47();
      }

      id v80 = [v9 lastUsedDate];
      lastUsedDate = self->_lastUsedDate;
      self->_lastUsedDate = v80;
LABEL_196:
    }
  }
LABEL_197:
  if (![v8 containsObject:@"tags"]) {
    goto LABEL_211;
  }
  tags = [v9 tags];
  if (tags)
  {
    id v4 = [(FPItem *)self tags];
    id v5 = [v9 tags];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_205;
    }
  }
  v82 = [(FPItem *)self tags];
  if (!v82)
  {

    if (!tags) {
      goto LABEL_211;
    }

    goto LABEL_210;
  }
  uint64_t v83 = [v9 tags];

  if (tags)
  {
  }
  if (!v83)
  {
LABEL_205:
    uint64_t v84 = fp_current_or_default_log();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.46();
    }

    uint64_t v85 = [v9 tags];
    tags = self->_tags;
    self->_tags = v85;
LABEL_210:
  }
LABEL_211:
  if ([v8 containsObject:@"favoriteRank"])
  {
    favoriteRank = [v9 favoriteRank];
    if (favoriteRank)
    {
      id v4 = [(FPItem *)self favoriteRank];
      id v5 = [v9 favoriteRank];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_219:
        id v89 = fp_current_or_default_log();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:].cold.45();
        }

        uint64_t v90 = [v9 favoriteRank];
        favoriteRank = self->_favoriteRank;
        self->_favoriteRank = v90;
        goto LABEL_224;
      }
    }
    unint64_t v87 = [(FPItem *)self favoriteRank];
    if (v87)
    {
      v88 = [v9 favoriteRank];

      if (favoriteRank)
      {
      }
      if (!v88) {
        goto LABEL_219;
      }
    }
    else
    {

      if (favoriteRank)
      {

LABEL_224:
      }
    }
  }
  if ([v8 containsObject:@"isUploaded"])
  {
    int v91 = [(FPItem *)self isUploaded];
    if (v91 != [v9 isUploaded])
    {
      char v92 = fp_current_or_default_log();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.44(v9, self, v92);
      }

      self->_uploaded = [v9 isUploaded];
    }
  }
  if ([v8 containsObject:@"isUploading"])
  {
    int v93 = [(FPItem *)self isUploading];
    if (v93 != [v9 isUploading])
    {
      v94 = fp_current_or_default_log();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.43(v9, self, v94);
      }

      self->_uploading = [v9 isUploading];
    }
  }
  if ([v8 containsObject:@"uploadingError"])
  {
    uploadingError = [v9 uploadingError];
    if (uploadingError)
    {
      id v4 = [(FPItem *)self uploadingError];
      id v5 = [v9 uploadingError];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_243:
        uint64_t v98 = fp_current_or_default_log();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:].cold.42();
        }

        v99 = [v9 uploadingError];
        uploadingError = self->_uploadingError;
        self->_uploadingError = v99;
        goto LABEL_248;
      }
    }
    v96 = [(FPItem *)self uploadingError];
    if (v96)
    {
      char v97 = [v9 uploadingError];

      if (uploadingError)
      {
      }
      if (!v97) {
        goto LABEL_243;
      }
    }
    else
    {

      if (uploadingError)
      {

LABEL_248:
      }
    }
  }
  if ([v8 containsObject:@"isDownloaded"])
  {
    int v100 = [(FPItem *)self isDownloaded];
    if (v100 != [v9 isDownloaded])
    {
      uint64_t v101 = fp_current_or_default_log();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.41(v9, self, v101);
      }

      self->_char downloaded = [v9 isDownloaded];
    }
  }
  if ([v8 containsObject:@"isDownloading"])
  {
    int v102 = [(FPItem *)self isDownloading];
    if (v102 != [v9 isDownloading])
    {
      int v103 = fp_current_or_default_log();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.40(v9, self, v103);
      }

      self->_downloading = [v9 isDownloading];
    }
  }
  if ([v8 containsObject:@"downloadingError"])
  {
    downloadingError = [v9 downloadingError];
    if (downloadingError)
    {
      id v4 = [(FPItem *)self downloadingError];
      id v5 = [v9 downloadingError];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_267:
        v107 = fp_current_or_default_log();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:]9();
        }

        uint64_t v108 = [v9 downloadingError];
        downloadingError = self->_downloadingError;
        self->_downloadingError = v108;
        goto LABEL_272;
      }
    }
    v105 = [(FPItem *)self downloadingError];
    if (v105)
    {
      uint64_t v106 = [v9 downloadingError];

      if (downloadingError)
      {
      }
      if (!v106) {
        goto LABEL_267;
      }
    }
    else
    {

      if (downloadingError)
      {

LABEL_272:
      }
    }
  }
  if ([v8 containsObject:@"isMostRecentVersionDownloaded"])
  {
    int v109 = [(FPItem *)self isMostRecentVersionDownloaded];
    if (v109 != [v9 isMostRecentVersionDownloaded])
    {
      uint64_t v110 = fp_current_or_default_log();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]8(v9, self, v110);
      }

      self->_mostRecentVersionDownloaded = [v9 isMostRecentVersionDownloaded];
    }
  }
  if ([v8 containsObject:@"isShared"])
  {
    int v111 = [(FPItem *)self isShared];
    if (v111 != [v9 isShared])
    {
      v112 = fp_current_or_default_log();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]7(v9, self, v112);
      }

      self->_char shared = [v9 isShared];
    }
  }
  if ([v8 containsObject:@"isSharedByCurrentUser"])
  {
    int v113 = [(FPItem *)self isSharedByCurrentUser];
    if (v113 != [v9 isSharedByCurrentUser])
    {
      v114 = fp_current_or_default_log();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]6(v9, self, v114);
      }

      self->_sharedByCurrentUser = [v9 isSharedByCurrentUser];
    }
  }
  if ([v8 containsObject:@"fp_isLastModifiedByCurrentUser"])
  {
    int v115 = [(FPItem *)self fp_isLastModifiedByCurrentUser];
    if (v115 != objc_msgSend(v9, "fp_isLastModifiedByCurrentUser"))
    {
      uint64_t v116 = fp_current_or_default_log();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]5(v9, self, v116);
      }

      self->_fp_lastModifiedByCurrentUser = objc_msgSend(v9, "fp_isLastModifiedByCurrentUser");
    }
  }
  if ([v8 containsObject:@"ownerNameComponents"])
  {
    ownerNameComponents = [v9 ownerNameComponents];
    if (ownerNameComponents)
    {
      id v4 = [(FPItem *)self ownerNameComponents];
      id v5 = [v9 ownerNameComponents];
      if (([v4 isEqual:v5] & 1) == 0)
      {

        goto LABEL_301;
      }
    }
    char v118 = [(FPItem *)self ownerNameComponents];
    if (!v118)
    {

      if (!ownerNameComponents) {
        goto LABEL_307;
      }

      goto LABEL_306;
    }
    uint64_t v119 = [v9 ownerNameComponents];

    if (ownerNameComponents)
    {
    }
    if (!v119)
    {
LABEL_301:
      char v120 = fp_current_or_default_log();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]4();
      }

      uint64_t v121 = [v9 ownerNameComponents];
      ownerNameComponents = self->_ownerNameComponents;
      self->_ownerNameComponents = v121;
LABEL_306:
    }
  }
LABEL_307:
  if (![v8 containsObject:@"mostRecentEditorNameComponents"]) {
    goto LABEL_321;
  }
  mostRecentEditorNameComponents = [v9 mostRecentEditorNameComponents];
  if (mostRecentEditorNameComponents)
  {
    id v4 = [(FPItem *)self mostRecentEditorNameComponents];
    id v5 = [v9 mostRecentEditorNameComponents];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_315;
    }
  }
  uint64_t v123 = [(FPItem *)self mostRecentEditorNameComponents];
  if (!v123)
  {

    if (!mostRecentEditorNameComponents) {
      goto LABEL_321;
    }

    goto LABEL_320;
  }
  v124 = [v9 mostRecentEditorNameComponents];

  if (mostRecentEditorNameComponents)
  {
  }
  if (!v124)
  {
LABEL_315:
    uint64_t v125 = fp_current_or_default_log();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]3();
    }

    v126 = [v9 mostRecentEditorNameComponents];
    mostRecentEditorNameComponents = self->_mostRecentEditorNameComponents;
    self->_mostRecentEditorNameComponents = v126;
LABEL_320:
  }
LABEL_321:
  if (![v8 containsObject:@"collaborationIdentifier"]) {
    goto LABEL_335;
  }
  collaborationIdentifier = [v9 collaborationIdentifier];
  if (collaborationIdentifier)
  {
    id v4 = [(FPItem *)self collaborationIdentifier];
    id v5 = [v9 collaborationIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_329;
    }
  }
  int v128 = [(FPItem *)self collaborationIdentifier];
  if (!v128)
  {

    if (!collaborationIdentifier) {
      goto LABEL_335;
    }

    goto LABEL_334;
  }
  int v129 = [v9 collaborationIdentifier];

  if (collaborationIdentifier)
  {
  }
  if (!v129)
  {
LABEL_329:
    int v130 = fp_current_or_default_log();
    if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]2();
    }

    int v131 = [v9 collaborationIdentifier];
    collaborationIdentifier = self->_collaborationIdentifier;
    self->_collaborationIdentifier = v131;
LABEL_334:
  }
LABEL_335:
  if (![v8 containsObject:@"childItemCount"]) {
    goto LABEL_349;
  }
  childItemCount = [v9 childItemCount];
  if (childItemCount)
  {
    id v4 = [(FPItem *)self childItemCount];
    id v5 = [v9 childItemCount];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_343;
    }
  }
  v133 = [(FPItem *)self childItemCount];
  if (!v133)
  {

    if (!childItemCount) {
      goto LABEL_349;
    }

    goto LABEL_348;
  }
  v134 = [v9 childItemCount];

  if (childItemCount)
  {
  }
  if (!v134)
  {
LABEL_343:
    unint64_t v135 = fp_current_or_default_log();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]1();
    }

    v136 = [v9 childItemCount];
    childItemCount = self->_childItemCount;
    self->_childItemCount = v136;
LABEL_348:
  }
LABEL_349:
  if ([v8 containsObject:@"userInfo"])
  {
    userInfo = [v9 userInfo];
    if (userInfo)
    {
      id v4 = [(FPItem *)self userInfo];
      id v5 = [v9 userInfo];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_357:
        uint64_t v140 = fp_current_or_default_log();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:]0();
        }

        v141 = [v9 userInfo];
        userInfo = self->_userInfo;
        self->_userInfo = v141;
        goto LABEL_362;
      }
    }
    uint64_t v138 = [(FPItem *)self userInfo];
    if (v138)
    {
      v139 = [v9 userInfo];

      if (userInfo)
      {
      }
      if (!v139) {
        goto LABEL_357;
      }
    }
    else
    {

      if (userInfo)
      {

LABEL_362:
      }
    }
  }
  if ([v8 containsObject:@"state"])
  {
    unint64_t v142 = [(FPItem *)self state];
    if (v142 != [v9 state])
    {
      unint64_t v143 = fp_current_or_default_log();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]9(v9, self, v143);
      }

      self->_state = [v9 state];
    }
  }
  if ([v8 containsObject:@"placeholderIdentifier"])
  {
    placeholderIdentifier = [v9 placeholderIdentifier];
    if (placeholderIdentifier)
    {
      id v4 = [(FPItem *)self placeholderIdentifier];
      id v5 = [v9 placeholderIdentifier];
      if (([v4 isEqual:v5] & 1) == 0)
      {

        goto LABEL_376;
      }
    }
    int64_t v145 = [(FPItem *)self placeholderIdentifier];
    if (!v145)
    {

      if (!placeholderIdentifier) {
        goto LABEL_382;
      }

      goto LABEL_381;
    }
    int64_t v146 = [v9 placeholderIdentifier];

    if (placeholderIdentifier)
    {
    }
    if (!v146)
    {
LABEL_376:
      uint64_t v147 = fp_current_or_default_log();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]8();
      }

      id v148 = [v9 placeholderIdentifier];
      placeholderIdentifier = self->_placeholderIdentifier;
      self->_placeholderIdentifier = v148;
LABEL_381:
    }
  }
LABEL_382:
  if (![v8 containsObject:@"versionIdentifier"]) {
    goto LABEL_396;
  }
  versionIdentifier = [v9 versionIdentifier];
  if (versionIdentifier)
  {
    id v4 = [(FPItem *)self versionIdentifier];
    id v5 = [v9 versionIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_390;
    }
  }
  uint64_t v150 = [(FPItem *)self versionIdentifier];
  if (!v150)
  {

    if (!versionIdentifier) {
      goto LABEL_396;
    }

    goto LABEL_395;
  }
  v151 = [v9 versionIdentifier];

  if (versionIdentifier)
  {
  }
  if (!v151)
  {
LABEL_390:
    uint64_t v152 = fp_current_or_default_log();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]7();
    }

    v153 = [v9 versionIdentifier];
    versionIdentifier = self->_versionIdentifier;
    self->_versionIdentifier = v153;
LABEL_395:
  }
LABEL_396:
  if (![v8 containsObject:@"itemVersion"]) {
    goto LABEL_410;
  }
  itemVersion = [v9 itemVersion];
  if (itemVersion)
  {
    id v4 = [(FPItem *)self itemVersion];
    id v5 = [v9 itemVersion];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_404;
    }
  }
  uint64_t v155 = [(FPItem *)self itemVersion];
  if (!v155)
  {

    if (!itemVersion) {
      goto LABEL_410;
    }

    goto LABEL_409;
  }
  v156 = [v9 itemVersion];

  if (itemVersion)
  {
  }
  if (!v156)
  {
LABEL_404:
    char v157 = fp_current_or_default_log();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]6();
    }

    v158 = [v9 itemVersion];
    itemVersion = self->_itemVersion;
    self->_itemVersion = v158;
LABEL_409:
  }
LABEL_410:
  if (![v8 containsObject:@"spotlightDomainIdentifier"]) {
    goto LABEL_424;
  }
  spotlightDomainIdentifier = [v9 spotlightDomainIdentifier];
  if (spotlightDomainIdentifier)
  {
    id v4 = [(FPItem *)self spotlightDomainIdentifier];
    id v5 = [v9 spotlightDomainIdentifier];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_418;
    }
  }
  char v160 = [(FPItem *)self spotlightDomainIdentifier];
  if (!v160)
  {

    if (!spotlightDomainIdentifier) {
      goto LABEL_424;
    }

    goto LABEL_423;
  }
  uint64_t v161 = [v9 spotlightDomainIdentifier];

  if (spotlightDomainIdentifier)
  {
  }
  if (!v161)
  {
LABEL_418:
    v162 = fp_current_or_default_log();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]5();
    }

    v163 = [v9 spotlightDomainIdentifier];
    spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
    self->_spotlightDomainIdentifier = v163;
LABEL_423:
  }
LABEL_424:
  if ([v8 containsObject:@"fp_spotlightSubDomainIdentifier"])
  {
    fp_spotlightSubDomainIdentifier = objc_msgSend(v9, "fp_spotlightSubDomainIdentifier");
    if (fp_spotlightSubDomainIdentifier)
    {
      id v4 = [(FPItem *)self fp_spotlightSubDomainIdentifier];
      id v5 = objc_msgSend(v9, "fp_spotlightSubDomainIdentifier");
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_432:
        uint64_t v167 = fp_current_or_default_log();
        if (os_log_type_enabled(v167, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:]4();
        }

        objc_msgSend(v9, "fp_spotlightSubDomainIdentifier");
        v168 = (NSString *)objc_claimAutoreleasedReturnValue();
        fp_spotlightSubDomainIdentifier = self->_fp_spotlightSubDomainIdentifier;
        self->_fp_spotlightSubDomainIdentifier = v168;
        goto LABEL_437;
      }
    }
    v165 = [(FPItem *)self fp_spotlightSubDomainIdentifier];
    if (v165)
    {
      v166 = objc_msgSend(v9, "fp_spotlightSubDomainIdentifier");

      if (fp_spotlightSubDomainIdentifier)
      {
      }
      if (!v166) {
        goto LABEL_432;
      }
    }
    else
    {

      if (fp_spotlightSubDomainIdentifier)
      {

LABEL_437:
      }
    }
  }
  if ([v8 containsObject:@"isInPinnedFolder"])
  {
    int v169 = [(FPItem *)self isInPinnedFolder];
    if (v169 != [v9 isInPinnedFolder])
    {
      v170 = fp_current_or_default_log();
      if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]3(v9, self, v170);
      }

      self->_inPinnedFolder = [v9 isInPinnedFolder];
    }
  }
  if ([v8 containsObject:@"isPinned"])
  {
    int v171 = [(FPItem *)self isPinned];
    if (v171 != [v9 isPinned])
    {
      v172 = fp_current_or_default_log();
      if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]2(v9, self, v172);
      }

      self->_pinned = [v9 isPinned];
    }
  }
  if ([v8 containsObject:@"hasUnresolvedConflicts"])
  {
    hasUnresolvedConflicts = [v9 hasUnresolvedConflicts];
    if (hasUnresolvedConflicts)
    {
      id v4 = [(FPItem *)self hasUnresolvedConflicts];
      id v5 = [v9 hasUnresolvedConflicts];
      if (([v4 isEqual:v5] & 1) == 0)
      {

        goto LABEL_456;
      }
    }
    v174 = [(FPItem *)self hasUnresolvedConflicts];
    if (!v174)
    {

      if (!hasUnresolvedConflicts) {
        goto LABEL_462;
      }

      goto LABEL_461;
    }
    char v175 = [v9 hasUnresolvedConflicts];

    if (hasUnresolvedConflicts)
    {
    }
    if (!v175)
    {
LABEL_456:
      uint64_t v176 = fp_current_or_default_log();
      if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]1();
      }

      v177 = [v9 hasUnresolvedConflicts];
      hasUnresolvedConflicts = self->_hasUnresolvedConflicts;
      self->_hasUnresolvedConflicts = v177;
LABEL_461:
    }
  }
LABEL_462:
  if (![v8 containsObject:@"isDownloadRequested"]) {
    goto LABEL_476;
  }
  isDownloadRequested = [v9 isDownloadRequested];
  if (isDownloadRequested)
  {
    id v4 = [(FPItem *)self isDownloadRequested];
    id v5 = [v9 isDownloadRequested];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_470;
    }
  }
  v179 = [(FPItem *)self isDownloadRequested];
  if (!v179)
  {

    if (!isDownloadRequested) {
      goto LABEL_476;
    }

    goto LABEL_475;
  }
  char v180 = [v9 isDownloadRequested];

  if (isDownloadRequested)
  {
  }
  if (!v180)
  {
LABEL_470:
    char v181 = fp_current_or_default_log();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]0();
    }

    char v182 = [v9 isDownloadRequested];
    isDownloadRequested = self->_isDownloadRequested;
    self->_isDownloadRequested = v182;
LABEL_475:
  }
LABEL_476:
  if (![v8 containsObject:@"sharingPermissions"]) {
    goto LABEL_490;
  }
  sharingPermissions = [v9 sharingPermissions];
  if (sharingPermissions)
  {
    id v4 = [(FPItem *)self sharingPermissions];
    id v5 = [v9 sharingPermissions];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_484;
    }
  }
  uint64_t v184 = [(FPItem *)self sharingPermissions];
  if (!v184)
  {

    if (!sharingPermissions) {
      goto LABEL_490;
    }

    goto LABEL_489;
  }
  v185 = [v9 sharingPermissions];

  if (sharingPermissions)
  {
  }
  if (!v185)
  {
LABEL_484:
    v186 = fp_current_or_default_log();
    if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]9();
    }

    v187 = [v9 sharingPermissions];
    sharingPermissions = self->_sharingPermissions;
    self->_sharingPermissions = v187;
LABEL_489:
  }
LABEL_490:
  if ([v8 containsObject:@"containerDisplayName"])
  {
    containerDisplayName = [v9 containerDisplayName];
    if (containerDisplayName)
    {
      id v4 = [(FPItem *)self containerDisplayName];
      id v5 = [v9 containerDisplayName];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_498:
        unint64_t v191 = fp_current_or_default_log();
        if (os_log_type_enabled(v191, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:]8();
        }

        uint64_t v192 = [v9 containerDisplayName];
        containerDisplayName = self->_containerDisplayName;
        self->_containerDisplayName = v192;
        goto LABEL_503;
      }
    }
    v189 = [(FPItem *)self containerDisplayName];
    if (v189)
    {
      uint64_t v190 = [v9 containerDisplayName];

      if (containerDisplayName)
      {
      }
      if (!v190) {
        goto LABEL_498;
      }
    }
    else
    {

      if (containerDisplayName)
      {

LABEL_503:
      }
    }
  }
  if ([v8 containsObject:@"supportsMostRecentVersionDownloaded"])
  {
    int v193 = [(FPItem *)self supportsMostRecentVersionDownloaded];
    if (v193 != [v9 supportsMostRecentVersionDownloaded])
    {
      uint64_t v194 = fp_current_or_default_log();
      if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]7(v9, self, v194);
      }

      self->_supportsMostRecentVersionDownloaded = [v9 supportsMostRecentVersionDownloaded];
    }
  }
  if ([v8 containsObject:@"fp_appContainerBundleIdentifier"])
  {
    fp_appContainerBundleIdentifier = objc_msgSend(v9, "fp_appContainerBundleIdentifier");
    if (fp_appContainerBundleIdentifier)
    {
      id v4 = [(FPItem *)self fp_appContainerBundleIdentifier];
      id v5 = objc_msgSend(v9, "fp_appContainerBundleIdentifier");
      if (([v4 isEqual:v5] & 1) == 0)
      {

        goto LABEL_517;
      }
    }
    v196 = [(FPItem *)self fp_appContainerBundleIdentifier];
    if (!v196)
    {

      if (!fp_appContainerBundleIdentifier) {
        goto LABEL_523;
      }

      goto LABEL_522;
    }
    uint64_t v197 = objc_msgSend(v9, "fp_appContainerBundleIdentifier");

    if (fp_appContainerBundleIdentifier)
    {
    }
    if (!v197)
    {
LABEL_517:
      v198 = fp_current_or_default_log();
      if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]6();
      }

      objc_msgSend(v9, "fp_appContainerBundleIdentifier");
      uint64_t v199 = (NSString *)objc_claimAutoreleasedReturnValue();
      fp_appContainerBundleIdentifier = self->_fp_appContainerBundleIdentifier;
      self->_fp_appContainerBundleIdentifier = v199;
LABEL_522:
    }
  }
LABEL_523:
  if (![v8 containsObject:@"fp_parentDomainIdentifier"]) {
    goto LABEL_537;
  }
  fp_parentDomainIdentifier = objc_msgSend(v9, "fp_parentDomainIdentifier");
  if (fp_parentDomainIdentifier)
  {
    id v4 = [(FPItem *)self fp_parentDomainIdentifier];
    id v5 = objc_msgSend(v9, "fp_parentDomainIdentifier");
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_531;
    }
  }
  uint64_t v201 = [(FPItem *)self fp_parentDomainIdentifier];
  if (!v201)
  {

    if (!fp_parentDomainIdentifier) {
      goto LABEL_537;
    }

    goto LABEL_536;
  }
  v202 = objc_msgSend(v9, "fp_parentDomainIdentifier");

  if (fp_parentDomainIdentifier)
  {
  }
  if (!v202)
  {
LABEL_531:
    uint64_t v203 = fp_current_or_default_log();
    if (os_log_type_enabled(v203, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:]5();
    }

    objc_msgSend(v9, "fp_parentDomainIdentifier");
    unsigned int v204 = (NSString *)objc_claimAutoreleasedReturnValue();
    fp_parentDomainIdentifier = self->_fp_parentDomainIdentifier;
    self->_fp_parentDomainIdentifier = v204;
LABEL_536:
  }
LABEL_537:
  if ([v8 containsObject:@"cloudContainerIdentifier"])
  {
    cloudContainerIdentifier = [v9 cloudContainerIdentifier];
    if (cloudContainerIdentifier)
    {
      id v4 = [(FPItem *)self cloudContainerIdentifier];
      id v5 = [v9 cloudContainerIdentifier];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_545:
        v208 = fp_current_or_default_log();
        if (os_log_type_enabled(v208, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:]4();
        }

        uint64_t v209 = [v9 cloudContainerIdentifier];
        cloudContainerIdentifier = self->_cloudContainerIdentifier;
        self->_cloudContainerIdentifier = v209;
        goto LABEL_550;
      }
    }
    v206 = [(FPItem *)self cloudContainerIdentifier];
    if (v206)
    {
      uint64_t v207 = [v9 cloudContainerIdentifier];

      if (cloudContainerIdentifier)
      {
      }
      if (!v207) {
        goto LABEL_545;
      }
    }
    else
    {

      if (cloudContainerIdentifier)
      {

LABEL_550:
      }
    }
  }
  if ([v8 containsObject:@"isUbiquitous"])
  {
    int v210 = [(FPItem *)self isUbiquitous];
    if (v210 != [v9 isUbiquitous])
    {
      v211 = fp_current_or_default_log();
      if (os_log_type_enabled(v211, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]3(v9, self, v211);
      }

      self->_isUbiquitous = [v9 isUbiquitous];
    }
  }
  if ([v8 containsObject:@"isContainer"])
  {
    int v212 = [(FPItem *)self isContainer];
    if (v212 != [v9 isContainer])
    {
      v213 = fp_current_or_default_log();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]2(v9, self, v213);
      }

      self->_isContainer = [v9 isContainer];
    }
  }
  if ([v8 containsObject:@"isContainerPristine"])
  {
    int v214 = [(FPItem *)self isContainerPristine];
    if (v214 != [v9 isContainerPristine])
    {
      int v215 = fp_current_or_default_log();
      if (os_log_type_enabled(v215, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]1(v9, self, v215);
      }

      self->_isContainerPristine = [v9 isContainerPristine];
    }
  }
  if ([v8 containsObject:@"isTopLevelSharedItem"])
  {
    int v216 = [(FPItem *)self isTopLevelSharedItem];
    if (v216 != [v9 isTopLevelSharedItem])
    {
      id v217 = fp_current_or_default_log();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:]0(v9, self, v217);
      }

      self->_topLevelSharedItem = [v9 isTopLevelSharedItem];
    }
  }
  if ([v8 containsObject:@"isRecursivelyDownloaded"])
  {
    int v218 = [(FPItem *)self isRecursivelyDownloaded];
    if (v218 != [v9 isRecursivelyDownloaded])
    {
      v219 = fp_current_or_default_log();
      if (os_log_type_enabled(v219, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.9(v9, self, v219);
      }

      self->_recursivelyDownloaded = [v9 isRecursivelyDownloaded];
    }
  }
  if ([v8 containsObject:@"conflictingVersions"])
  {
    conflictingVersions = [v9 conflictingVersions];
    if (conflictingVersions)
    {
      id v4 = [(FPItem *)self conflictingVersions];
      id v5 = [v9 conflictingVersions];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_584:
        v223 = fp_current_or_default_log();
        if (os_log_type_enabled(v223, OS_LOG_TYPE_DEBUG)) {
          -[FPItem overrideFields:ofItem:].cold.8();
        }

        SEL v224 = [v9 conflictingVersions];
        conflictingVersions = self->_conflictingVersions;
        self->_conflictingVersions = v224;
        goto LABEL_589;
      }
    }
    v221 = [(FPItem *)self conflictingVersions];
    if (v221)
    {
      id v222 = [v9 conflictingVersions];

      if (conflictingVersions)
      {
      }
      if (!v222) {
        goto LABEL_584;
      }
    }
    else
    {

      if (conflictingVersions)
      {

LABEL_589:
      }
    }
  }
  if ([v8 containsObject:@"fileSystemFlags"])
  {
    unint64_t v225 = [(FPItem *)self fileSystemFlags];
    if (v225 != [v9 fileSystemFlags])
    {
      v226 = fp_current_or_default_log();
      if (os_log_type_enabled(v226, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.7(v9, self, v226);
      }

      self->_fileSystemFlags = [v9 fileSystemFlags];
    }
  }
  if ([v8 containsObject:@"extendedAttributes"])
  {
    extendedAttributes = [v9 extendedAttributes];
    if (extendedAttributes)
    {
      id v4 = [(FPItem *)self extendedAttributes];
      id v5 = [v9 extendedAttributes];
      if (([v4 isEqual:v5] & 1) == 0)
      {

        goto LABEL_603;
      }
    }
    v228 = [(FPItem *)self extendedAttributes];
    if (!v228)
    {

      if (!extendedAttributes) {
        goto LABEL_609;
      }

      goto LABEL_608;
    }
    v229 = [v9 extendedAttributes];

    if (extendedAttributes)
    {
    }
    if (!v229)
    {
LABEL_603:
      v230 = fp_current_or_default_log();
      if (os_log_type_enabled(v230, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:].cold.6();
      }

      v231 = [v9 extendedAttributes];
      extendedAttributes = self->_extendedAttributes;
      self->_extendedAttributes = v231;
LABEL_608:
    }
  }
LABEL_609:
  if (![v8 containsObject:@"decorations"]) {
    goto LABEL_623;
  }
  decorations = [v9 decorations];
  if (decorations)
  {
    id v4 = [(FPItem *)self decorations];
    id v5 = [v9 decorations];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      goto LABEL_617;
    }
  }
  v233 = [(FPItem *)self decorations];
  if (!v233)
  {

    if (!decorations) {
      goto LABEL_623;
    }

    goto LABEL_622;
  }
  v234 = [v9 decorations];

  if (decorations)
  {
  }
  if (!v234)
  {
LABEL_617:
    v235 = fp_current_or_default_log();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.5();
    }

    v236 = [v9 decorations];
    decorations = self->_decorations;
    self->_decorations = v236;
LABEL_622:
  }
LABEL_623:
  if ([v8 containsObject:@"typeAndCreator"])
  {
    v237 = fp_current_or_default_log();
    if (os_log_type_enabled(v237, OS_LOG_TYPE_DEBUG)) {
      -[FPItem overrideFields:ofItem:].cold.4(v9, v237);
    }

    self->_typeAndCreator = (NSFileProviderTypeAndCreator)[v9 typeAndCreator];
  }
  if ([v8 containsObject:@"contentPolicy"])
  {
    int64_t v238 = [(FPItem *)self contentPolicy];
    if (v238 != [v9 contentPolicy])
    {
      v239 = fp_current_or_default_log();
      if (os_log_type_enabled(v239, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:](v9, self, v239);
      }

      self->_contentPolicy = [v9 contentPolicy];
    }
  }
  if ([v8 containsObject:@"inheritedContentPolicy"])
  {
    int64_t v240 = [(FPItem *)self inheritedContentPolicy];
    if (v240 != [v9 inheritedContentPolicy])
    {
      v241 = fp_current_or_default_log();
      if (os_log_type_enabled(v241, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:](v9, self, v241);
      }

      self->_inheritedContentPolicy = [v9 inheritedContentPolicy];
    }
  }
  if ([v8 containsObject:@"effectiveContentPolicy"])
  {
    int64_t v242 = [(FPItem *)self effectiveContentPolicy];
    if (v242 != [v9 effectiveContentPolicy])
    {
      v243 = fp_current_or_default_log();
      if (os_log_type_enabled(v243, OS_LOG_TYPE_DEBUG)) {
        -[FPItem overrideFields:ofItem:](v9, self, v243);
      }

      self->_effectiveContentPolicy = [v9 effectiveContentPolicy];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[FPItem alloc] initWithVendorItem:self provider:self->_providerID domain:self->_domainIdentifier spotlightDomainIdentifier:self->_spotlightDomainIdentifier extensionCapabilities:-1 useFPFS:0];
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    v4->_state = self->_state;
    objc_storeStrong((id *)&v4->_uploadingError, self->_uploadingError);
    objc_storeStrong(p_isa + 14, self->_downloadingError);
    id v6 = p_isa;
  }

  return p_isa;
}

- (id)copyAsPending
{
  id result = (id)[(FPItem *)self copy];
  *((void *)result + 56) = 6;
  return result;
}

- (id)strippedCopy
{
  unint64_t v3 = [FPItem alloc];
  id v4 = [(FPItem *)self providerDomainID];
  id v5 = [(FPItem *)self itemIdentifier];
  id v6 = [(FPItem *)self parentItemIdentifier];
  uint64_t v7 = [(FPItem *)self filename];
  id v8 = [(FPItem *)self typeIdentifier];
  id v9 = [(FPItem *)v3 initWithProviderDomainID:v4 itemIdentifier:v5 parentItemIdentifier:v6 filename:v7 typeIdentifier:v8];

  uint64_t v10 = [(FPItem *)self itemVersion];
  [(FPItem *)v9 setItemVersion:v10];

  return v9;
}

- (NSSet)fp_cloudContainerClientBundleIdentifiers
{
  return 0;
}

- (NSDictionary)resolvedUserInfo
{
  resolvedUserInfoCache = self->_resolvedUserInfoCache;
  if (!resolvedUserInfoCache)
  {
    if ([(NSDictionary *)self->_userInfo count] || [(NSDictionary *)self->_inheritedUserInfo count])
    {
      id v4 = [[FPUserInfo alloc] initWithUserInfo:self->_userInfo];
      id v5 = [[FPUserInfo alloc] initWithUserInfo:self->_inheritedUserInfo];
      id v6 = +[FPUserInfo mergeWithUserInfo:v4 intoParentUserInfo:v5];
      uint64_t v7 = [v6 userInfo];
      id v8 = self->_resolvedUserInfoCache;
      self->_resolvedUserInfoCache = v7;
    }
    resolvedUserInfoCache = self->_resolvedUserInfoCache;
  }
  id v9 = resolvedUserInfoCache;

  return v9;
}

- (BOOL)isWritable
{
  return (LOBYTE(self->_capabilities) >> 1) & 1;
}

- (BOOL)isPlaceholder
{
  return self->_state & 1;
}

- (void)setProviderID:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_providerID, a3);
  }
  else
  {
    fp_simulate_crash(@"can't set a nil provider identifier", v5, v6, v7, v8, v9, v10, v11, v14);
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[FPItem setProviderID:]();
    }
  }
}

- (NSString)providerIdentifier
{
  return self->_providerID;
}

- (void)setItemIdentifier:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_itemIdentifier, a3);
  }
  else
  {
    fp_simulate_crash(@"can't set a nil item identifier", v5, v6, v7, v8, v9, v10, v11, v14);
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[FPItem setItemIdentifier:]();
    }
  }
}

- (void)setParentItemIdentifier:(id)a3
{
}

- (FPItemID)parentItemID
{
  unint64_t v3 = [FPItemID alloc];
  fp_parentDomainIdentifier = self->_fp_parentDomainIdentifier;
  if (!fp_parentDomainIdentifier) {
    fp_parentDomainIdentifier = self->_domainIdentifier;
  }
  uint64_t v5 = [(FPItemID *)v3 initWithProviderID:self->_providerID domainIdentifier:fp_parentDomainIdentifier itemIdentifier:self->_parentItemIdentifier];

  return v5;
}

- (FPItemID)parentFormerItemID
{
  if (self->_parentFormerIdentifier) {
    v2 = [[FPItemID alloc] initWithProviderID:self->_providerID domainIdentifier:self->_domainIdentifier itemIdentifier:self->_parentFormerIdentifier];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setProviderDomainID:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "fp_toProviderID");
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  providerID = self->_providerID;
  self->_providerID = v5;

  objc_msgSend(v4, "fp_toDomainIdentifier");
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  domainIdentifier = self->_domainIdentifier;
  self->_domainIdentifier = v7;
}

- (NSString)description
{
  return (NSString *)[(FPItem *)self descriptionForFPCTL:0];
}

- (id)humanReadableCapabilities
{
  unint64_t capabilities = self->_capabilities;
  id v4 = NSString;
  BOOL v5 = [(FPItem *)self isReadable];
  BOOL v6 = [(FPItem *)self isWritable];
  uint64_t v7 = 83;
  uint64_t v8 = 45;
  if ((capabilities & 0x2000000) == 0) {
    uint64_t v7 = 45;
  }
  uint64_t v9 = 120;
  if ((capabilities & 0x80) == 0) {
    uint64_t v9 = 45;
  }
  uint64_t v27 = v9;
  uint64_t v28 = v7;
  uint64_t v10 = 85;
  if ((capabilities & 0x8000000) == 0) {
    uint64_t v10 = 45;
  }
  uint64_t v11 = 80;
  if ((capabilities & 0x10000000) == 0) {
    uint64_t v11 = 45;
  }
  uint64_t v25 = v11;
  uint64_t v26 = v10;
  uint64_t v12 = 84;
  if ((capabilities & 0x10) == 0) {
    uint64_t v12 = 45;
  }
  uint64_t v13 = 116;
  if ((capabilities & 0x20000000) == 0) {
    uint64_t v13 = 45;
  }
  uint64_t v23 = v13;
  uint64_t v24 = v12;
  uint64_t v14 = 101;
  if ((capabilities & 0x40) == 0) {
    uint64_t v14 = 45;
  }
  uint64_t v15 = 102;
  if ((capabilities & 8) == 0) {
    uint64_t v15 = 45;
  }
  uint64_t v21 = v15;
  uint64_t v22 = v14;
  uint64_t v16 = 112;
  if ((capabilities & 4) == 0) {
    uint64_t v16 = 45;
  }
  uint64_t v17 = 100;
  if ((capabilities & 0x20) == 0) {
    uint64_t v17 = 45;
  }
  uint64_t v20 = v16;
  uint64_t v18 = 119;
  if (!v6) {
    uint64_t v18 = 45;
  }
  if (v5) {
    uint64_t v8 = 114;
  }
  return (id)objc_msgSend(v4, "stringWithFormat:", @"%c%c%c%c%c%c%c%c%c%c%c%c", v8, v18, v17, v20, v21, v22, v23, v24, v25, v26, v27, v28);
}

- (id)descriptionForFPCTL:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F28E78] stringWithCapacity:256];
  BOOL v6 = v5;
  if (!v3) {
    [v5 appendFormat:@"<"];
  }
  p_isa = self->_itemIdentifier;
  if ([(NSString *)p_isa isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
  {
    uint64_t v8 = @"root";
  }
  else
  {
    if (![(NSString *)p_isa isEqualToString:@"NSFileProviderTrashContainerItemIdentifier"]) {
      goto LABEL_8;
    }
    uint64_t v8 = @"trash";
  }

  p_isa = &v8->isa;
LABEL_8:
  if (v3) {
    [v6 appendFormat:@"i:%@", p_isa, v76, v77];
  }
  else {
    [v6 appendFormat:@"%@ %p:%@", objc_opt_class(), self, p_isa];
  }
  if (self->_formerIdentifier) {
    [v6 appendFormat:@" (replacing:%@)", self->_formerIdentifier];
  }
  unint64_t state = self->_state;
  if (state)
  {
    if ((state & 4) != 0)
    {
      [v6 appendString:@" pending"];
      unint64_t state = self->_state;
      if ((state & 2) == 0)
      {
LABEL_16:
        if ((state & 1) == 0) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else if ((state & 2) == 0)
    {
      goto LABEL_16;
    }
    [v6 appendString:@" has-update"];
    if (self->_state) {
LABEL_17:
    }
      [v6 appendString:@" is-placeholder"];
  }
LABEL_18:
  displayName = self->_displayName;
  if (v3)
  {
    if (displayName) {
      [v6 appendFormat:@" l:\"%@\"", self->_displayName];
    }
    else {
      [v6 appendFormat:@" f:\"%@\"", self->_filename];
    }
  }
  else
  {
    if (displayName)
    {
      uint64_t v11 = [(NSString *)displayName fp_obfuscatedFilename];
      [v6 appendFormat:@" l:\"%@\"", v11];
    }
    else
    {
      uint64_t v11 = [(NSString *)self->_filename fp_obfuscatedFilename];
      [v6 appendFormat:@" f:\"%@\"", v11];
    }
  }
  if (self->_trashed) {
    [v6 appendFormat:@" trashed"];
  }
  if (self->_isContainer)
  {
    uint64_t v12 = self->_isContainerPristine ? @" container-pristine" : @" container";
    [v6 appendFormat:v12];
    if (self->_fp_appContainerBundleIdentifier) {
      [v6 appendFormat:@" bid:%@", self->_fp_appContainerBundleIdentifier];
    }
  }
  uint64_t v13 = self->_parentItemIdentifier;
  if ([(NSString *)v13 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
  {
    uint64_t v14 = @"root";
  }
  else
  {
    if (![(NSString *)v13 isEqualToString:@"NSFileProviderTrashContainerItemIdentifier"]) {
      goto LABEL_42;
    }
    uint64_t v14 = @"trash";
  }

  uint64_t v13 = &v14->isa;
LABEL_42:
  [v6 appendFormat:@" p:%@", v13];
  documentSize = self->_documentSize;
  if (documentSize)
  {
    if ([(NSNumber *)documentSize unsignedLongLongValue])
    {
      [(NSNumber *)self->_documentSize unsignedLongLongValue];
      uint64_t v16 = NSLocalizedFileSizeDescription();
      [v6 appendFormat:@" sz:%@", v16];
    }
    else
    {
      [v6 appendFormat:@" sz:%@", @"0"];
    }
  }
  if (self->_childItemCount) {
    [v6 appendFormat:@" c:%@", self->_childItemCount];
  }
  uint64_t v17 = [(FPItem *)self humanReadableCapabilities];
  [v6 appendFormat:@" cap:%@", v17];

  [(NSDate *)self->_creationDate timeIntervalSince1970];
  objc_msgSend(v6, "appendFormat:", @" bt:%lld", (uint64_t)v18);
  [(NSDate *)self->_contentModificationDate timeIntervalSince1970];
  objc_msgSend(v6, "appendFormat:", @" mt:%lld", (uint64_t)v19);
  if ([(FPItem *)self isItemPinned] || [(FPItem *)self isPinnedSubitem])
  {
    BOOL v20 = [(FPItem *)self isPinnedSubitem];
    uint64_t v21 = 114;
    if (v20) {
      uint64_t v21 = 115;
    }
    objc_msgSend(v6, "appendFormat:", @" pin:%c", v21);
  }
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate)
  {
    [(NSDate *)lastUsedDate timeIntervalSince1970];
    objc_msgSend(v6, "appendFormat:", @" lu:%lld", (uint64_t)v23);
  }
  if (self->_shared)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v25 = v24;
    if (self->_sharedByCurrentUser)
    {
      [v24 addObject:@"shared-by-me"];
    }
    else
    {
      ownerNameComponents = self->_ownerNameComponents;
      if (ownerNameComponents)
      {
        uint64_t v27 = NSString;
        uint64_t v28 = [(NSPersonNameComponents *)ownerNameComponents givenName];
        id v29 = [v27 stringWithFormat:@"shared-by:%@", v28];

        [v25 addObject:v29];
      }
    }
    if (self->_fp_lastModifiedByCurrentUser)
    {
      [v25 addObject:@"mod-by-me"];
    }
    else
    {
      mostRecentEditorNameComponents = self->_mostRecentEditorNameComponents;
      if (mostRecentEditorNameComponents)
      {
        v31 = NSString;
        v32 = [(NSPersonNameComponents *)mostRecentEditorNameComponents givenName];
        v33 = [v31 stringWithFormat:@"mod-by:%@", v32];

        [v25 addObject:v33];
      }
    }
    if (self->_topLevelSharedItem) {
      [v25 addObject:@"top-lvl"];
    }
    if ([v25 count])
    {
      v34 = [v25 componentsJoinedByString:@"|"];
      [v6 appendFormat:@" shared{%@}", v34];
    }
    else
    {
      [v6 appendString:@" shared"];
    }
  }
  uint64_t v35 = [(FPItem *)self tags];
  uint64_t v36 = [v35 count];

  if (v36)
  {
    v37 = [(FPItem *)self tags];
    v38 = objc_msgSend(v37, "fp_map:", &__block_literal_global_2);
    id v39 = [v38 componentsJoinedByString:@","];
    [v6 appendFormat:@" tags:[%@]", v39];
  }
  favoriteRank = self->_favoriteRank;
  if (favoriteRank) {
    objc_msgSend(v6, "appendFormat:", @" fr:%llu", -[NSNumber unsignedLongLongValue](favoriteRank, "unsignedLongLongValue"));
  }
  if (!v3)
  {
    unint64_t v41 = self;
    objc_sync_enter(v41);
    id v42 = v41->_fileURL;
    objc_sync_exit(v41);

    if (v42)
    {
      v43 = [(NSURL *)v42 fp_shortDescription];
      [v6 appendFormat:@" url:\"%@\"", v43];
    }
  }
  extendedAttributes = self->_extendedAttributes;
  id v45 = "";
  if (extendedAttributes && [(NSDictionary *)extendedAttributes count]) {
    id v45 = "@";
  }
  unint64_t fileSystemFlags = self->_fileSystemFlags;
  uint64_t v47 = 101;
  if ((fileSystemFlags & 0x10) == 0) {
    uint64_t v47 = 45;
  }
  uint64_t v48 = 104;
  if ((fileSystemFlags & 8) == 0) {
    uint64_t v48 = 45;
  }
  uint64_t v78 = v48;
  uint64_t v79 = v47;
  uint64_t v49 = 120;
  if ((fileSystemFlags & 1) == 0) {
    uint64_t v49 = 45;
  }
  uint64_t v50 = 119;
  if ((fileSystemFlags & 4) == 0) {
    uint64_t v50 = 45;
  }
  uint64_t v51 = 114;
  if ((self->_fileSystemFlags & 2) == 0) {
    uint64_t v51 = 45;
  }
  objc_msgSend(v6, "appendFormat:", @" mode:%s%c%c%c%c%c", v45, v51, v50, v49, v78, v79);
  if (self->_contentZoneRoot) {
    [v6 appendString:@" czr"];
  }
  if (self->_fileID) {
    objc_msgSend(v6, "appendFormat:", @" fid:%llu", self->_fileID);
  }
  if (self->_documentID) {
    objc_msgSend(v6, "appendFormat:", @" did:%u", self->_documentID);
  }
  if (self->_typeAndCreator.type) {
    objc_msgSend(v6, "appendFormat:", @" ostype:%x", self->_typeAndCreator.type);
  }
  if (self->_typeAndCreator.creator) {
    objc_msgSend(v6, "appendFormat:", @" creatorcode:%x", self->_typeAndCreator.creator);
  }
  uint64_t v52 = [(FPItem *)self typeIdentifier];
  [v6 appendFormat:@" uti:%@", v52];

  symlinkTargetPath = self->_symlinkTargetPath;
  if (symlinkTargetPath)
  {
    uint64_t v54 = [(NSString *)symlinkTargetPath fp_obfuscatedPath];
    [v6 appendFormat:@" tg:\"%@\"", v54];
  }
  if (self->_uploading)
  {
    uint64_t v55 = self;
    objc_sync_enter(v55);
    id v56 = v55->_progress;
    objc_sync_exit(v55);

    if ([(NSProgress *)v56 fp_isOfFileOperationKind:*MEMORY[0x1E4F28880]]) {
      v57 = v56;
    }
    else {
      v57 = 0;
    }
    int v58 = v57;
    [v6 appendFormat:@" ul:uploading"];
    if (v58)
    {
      if ([(NSProgress *)v58 isIndeterminate])
      {
        [v6 appendString:@"(?%)"];
      }
      else
      {
        [(NSProgress *)v58 fractionCompleted];
        [v6 appendFormat:@"(%.2f)", v59];
      }
    }
  }
  else if (self->_uploaded)
  {
    [v6 appendString:@" ul:uploaded"];
  }
  if (self->_uploadingError) {
    [v6 appendFormat:@" ul-error:%@", self->_uploadingError];
  }
  conflictingVersions = self->_conflictingVersions;
  if (conflictingVersions)
  {
    uint64_t v61 = [(NSArray *)conflictingVersions componentsJoinedByString:@","];
    [v6 appendFormat:@" conflicts:[%@]", v61];
  }
  if (self->_downloading || [(FPItem *)self isExternalDownloadPlaceholder])
  {
    unint64_t v62 = self;
    objc_sync_enter(v62);
    int v63 = v62->_progress;
    objc_sync_exit(v62);

    if ([(NSProgress *)v63 fp_isOfFileOperationKind:*MEMORY[0x1E4F28858]]) {
      int v64 = v63;
    }
    else {
      int v64 = 0;
    }
    uint64_t v65 = v64;
    [v6 appendFormat:@" dl:downloading"];
    if (v65)
    {
      if ([(NSProgress *)v65 isIndeterminate])
      {
        [v6 appendString:@"(?%)"];
      }
      else
      {
        [(NSProgress *)v65 fractionCompleted];
        [v6 appendFormat:@"(%.2f)", v66];
      }
    }
  }
  else
  {
    if (self->_mostRecentVersionDownloaded)
    {
      v75 = @" dl:current";
    }
    else if (self->_downloaded)
    {
      v75 = @" dl:downloaded";
    }
    else
    {
      if (![(FPItem *)self isCloudItem]) {
        goto LABEL_128;
      }
      v75 = @" dl:fault";
    }
    [v6 appendString:v75];
  }
LABEL_128:
  if (self->_downloadingError) {
    [v6 appendFormat:@" dl-error:%@", self->_downloadingError];
  }
  if ([(FPItem *)self isFolder])
  {
    if (self->_recursivelyDownloaded)
    {
      uint64_t v67 = @" rec-dl:yes";
LABEL_136:
      [v6 appendString:v67];
      goto LABEL_137;
    }
LABEL_135:
    uint64_t v67 = @" rec-dl:no";
    goto LABEL_136;
  }
  if ([(FPItem *)self isPackage] && !self->_recursivelyDownloaded) {
    goto LABEL_135;
  }
LABEL_137:
  if (self->_fp_spotlightSubDomainIdentifier) {
    [v6 appendFormat:@" spd:%@", self->_fp_spotlightSubDomainIdentifier];
  }
  if (self->_excludedFromSync)
  {
    if (self->_ignoreRoot) {
      [v6 appendString:@" excluded:root"];
    }
    else {
      [v6 appendFormat:@" excluded:yes"];
    }
  }
  if (self->_contentPolicy) {
    objc_msgSend(v6, "appendFormat:", @" contentPolicy:%lu", self->_contentPolicy);
  }
  if ([(NSArray *)self->_decorations count])
  {
    int v68 = [(NSArray *)self->_decorations componentsJoinedByString:@","];
    [v6 appendFormat:@" deco:%@", v68];
  }
  if (v3)
  {
    if ([(NSDictionary *)self->_userInfo count])
    {
      [v6 appendString:@" ui:{"];
      userInfo = self->_userInfo;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __30__FPItem_descriptionForFPCTL___block_invoke_2;
      v82[3] = &unk_1E5AF1740;
      id v70 = v6;
      id v83 = v70;
      [(NSDictionary *)userInfo enumerateKeysAndObjectsUsingBlock:v82];
      if ([v70 hasSuffix:@", "]) {
        objc_msgSend(v70, "replaceCharactersInRange:withString:", objc_msgSend(v70, "length") - 2, 2, @"} ");
      }
    }
    if ([(NSDictionary *)self->_inheritedUserInfo count])
    {
      [v6 appendString:@" iui:{"];
      inheritedUserInfo = self->_inheritedUserInfo;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __30__FPItem_descriptionForFPCTL___block_invoke_3;
      v80[3] = &unk_1E5AF1740;
      id v72 = v6;
      id v81 = v72;
      [(NSDictionary *)inheritedUserInfo enumerateKeysAndObjectsUsingBlock:v80];
      if ([v72 hasSuffix:@", "]) {
        objc_msgSend(v72, "replaceCharactersInRange:withString:", objc_msgSend(v72, "length") - 2, 2, @"} ");
      }
    }
  }
  else
  {
    [v6 appendString:@">"];
  }
  id v73 = v6;

  return v73;
}

uint64_t __30__FPItem_descriptionForFPCTL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

uint64_t __30__FPItem_descriptionForFPCTL___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@: %@, ", a2, a3];
}

uint64_t __30__FPItem_descriptionForFPCTL___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@: %@, ", a2, a3];
}

- (NSData)tagData
{
  tags = self->_tags;
  if (tags)
  {
    tags = FPGetTagsDataForTags(tags);
  }

  return (NSData *)tags;
}

- (void)setTagData:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4)
  {
    tags = self->_tags;
    self->_tags = 0;

    id v4 = 0;
  }
  FPGetTagsFromTagsData(v4);
  BOOL v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = self->_tags;
  self->_tags = v6;
}

- (int64_t)localizedStandardTagsCompare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FPItem *)self tags];
  BOOL v6 = [v4 tags];
  unint64_t v7 = [v5 count];
  if (v7 >= [v6 count]) {
    id v8 = v6;
  }
  else {
    id v8 = v5;
  }
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = (void *)MEMORY[0x1A6248870]();
      uint64_t v13 = [v5 objectAtIndexedSubscript:v11];
      uint64_t v14 = [v6 objectAtIndexedSubscript:v11];
      int64_t v15 = [v13 localizedStandardCompare:v14];

      if (v15) {
        break;
      }
      if (v10 == ++v11) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    if ([v5 count] && objc_msgSend(v6, "count"))
    {
      unint64_t v16 = [v5 count];
      if (v16 >= [v6 count])
      {
        uint64_t v17 = [v5 count];
        int64_t v15 = v17 != [v6 count];
      }
      else
      {
        int64_t v15 = -1;
      }
    }
    else if ([v5 count] || objc_msgSend(v6, "count"))
    {
      if ([v5 count]) {
        int64_t v15 = -1;
      }
      else {
        int64_t v15 = 1;
      }
    }
    else
    {
      int64_t v15 = 0;
    }
  }

  return v15;
}

- (NSPersonNameComponents)ownerNameComponents
{
  if (!self->_ownerNameComponents && [(NSString *)self->_preformattedOwnerName length])
  {
    BOOL v3 = objc_opt_new();
    id v4 = [v3 personNameComponentsFromString:self->_preformattedOwnerName];
    ownerNameComponents = self->_ownerNameComponents;
    self->_ownerNameComponents = v4;
  }
  BOOL v6 = self->_ownerNameComponents;

  return v6;
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  if (!self->_mostRecentEditorNameComponents && [(NSString *)self->_preformattedMostRecentEditorName length])
  {
    BOOL v3 = objc_opt_new();
    id v4 = [v3 personNameComponentsFromString:self->_preformattedMostRecentEditorName];
    mostRecentEditorNameComponents = self->_mostRecentEditorNameComponents;
    self->_mostRecentEditorNameComponents = v4;
  }
  BOOL v6 = self->_mostRecentEditorNameComponents;

  return v6;
}

- (NSData)versionIdentifier
{
  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier)
  {
    BOOL v3 = versionIdentifier;
  }
  else
  {
    BOOL v3 = [(NSFileProviderItemVersion *)self->_itemVersion contentVersion];
  }

  return v3;
}

- (id)_sharedByDecorationType
{
  if ([(FPItem *)self isFolder]) {
    goto LABEL_2;
  }
  if ([(FPItem *)self fp_isLastModifiedByCurrentUser]) {
    return @"com.apple.FileProvider.ModifiedByMe";
  }
  BOOL v5 = [(FPItem *)self mostRecentEditorNameComponents];

  if (v5) {
    return @"com.apple.FileProvider.ModifiedByOther";
  }
LABEL_2:
  if ([(FPItem *)self isSharedByCurrentUser]) {
    return @"com.apple.FileProvider.SharedByMe";
  }
  id v4 = [(FPItem *)self ownerNameComponents];

  if (v4) {
    return @"com.apple.FileProvider.SharedByOther";
  }
  else {
    return @"com.apple.FileProvider.GenericShared";
  }
}

id __25__FPItem_itemDecorations__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = +[FPItemDecoration decorationWithIdentifier:a2 bundleIdentifier:*(void *)(a1 + 32)];
  id v4 = [v3 type];
  int v5 = [v4 isEqualToString:@"Sharing"];

  if (v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }

  return v3;
}

+ (id)allUbiquitousResourceKeys
{
  v13[15] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F1C790];
  v13[0] = *MEMORY[0x1E4F1C690];
  v13[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1C778];
  v13[2] = *MEMORY[0x1E4F1C798];
  v13[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1C7A0];
  v13[4] = *MEMORY[0x1E4F1C758];
  v13[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1C7C0];
  v13[6] = *MEMORY[0x1E4F1C740];
  v13[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1C768];
  v13[8] = *MEMORY[0x1E4F1C7B8];
  v13[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1C738];
  v13[10] = *MEMORY[0x1E4F1C730];
  v13[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1C7B0];
  v13[12] = *MEMORY[0x1E4F1C788];
  v13[13] = v9;
  v13[14] = *MEMORY[0x1E4F1C7A8];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:15];
  uint64_t v11 = [v2 setWithArray:v10];

  return v11;
}

- (id)ubiquitousResourceKeysDiffAgainstItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  int v6 = [(FPItem *)self isCloudItem];
  if (v6 != [v4 isCloudItem]) {
    [v5 addObject:*MEMORY[0x1E4F1C690]];
  }
  int v7 = [(FPItem *)self isUploaded];
  if (v7 != [v4 isUploaded]) {
    [v5 addObject:*MEMORY[0x1E4F1C790]];
  }
  int v8 = [(FPItem *)self isUploading];
  if (v8 != [v4 isUploading]) {
    [v5 addObject:*MEMORY[0x1E4F1C798]];
  }
  int v9 = [(FPItem *)self isDownloading];
  if (v9 != [v4 isDownloading]) {
    [v5 addObject:*MEMORY[0x1E4F1C778]];
  }
  uint64_t v10 = [(FPItem *)self _downloadingStatus];
  uint64_t v11 = [v4 _downloadingStatus];
  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_16;
  }
  uint64_t v14 = v13;
  if (!v13)
  {

    goto LABEL_15;
  }
  char v15 = [v12 isEqual:v13];

  if ((v15 & 1) == 0) {
LABEL_15:
  }
    [v5 addObject:*MEMORY[0x1E4F1C758]];
LABEL_16:
  unint64_t v16 = [(FPItem *)self uploadingError];
  uint64_t v17 = [v4 uploadingError];
  id v18 = v16;
  id v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_23;
  }
  BOOL v20 = v19;
  if (!v19)
  {

    goto LABEL_22;
  }
  char v21 = [v18 isEqual:v19];

  if ((v21 & 1) == 0) {
LABEL_22:
  }
    [v5 addObject:*MEMORY[0x1E4F1C7A0]];
LABEL_23:
  uint64_t v22 = [(FPItem *)self downloadingError];
  double v23 = [v4 downloadingError];
  id v24 = v22;
  id v25 = v23;
  if (v24 == v25)
  {

    goto LABEL_30;
  }
  uint64_t v26 = v25;
  if (!v25)
  {

    goto LABEL_29;
  }
  char v27 = [v24 isEqual:v25];

  if ((v27 & 1) == 0) {
LABEL_29:
  }
    [v5 addObject:*MEMORY[0x1E4F1C740]];
LABEL_30:
  uint64_t v28 = [(FPItem *)self ownerNameComponents];
  id v29 = [v4 ownerNameComponents];
  id v30 = v28;
  id v31 = v29;
  if (v30 == v31)
  {

    goto LABEL_37;
  }
  v32 = v31;
  if (!v31)
  {

    goto LABEL_36;
  }
  char v33 = [v30 isEqual:v31];

  if ((v33 & 1) == 0) {
LABEL_36:
  }
    [v5 addObject:*MEMORY[0x1E4F1C7C0]];
LABEL_37:
  v34 = [(FPItem *)self mostRecentEditorNameComponents];
  uint64_t v35 = [v4 mostRecentEditorNameComponents];
  id v36 = v34;
  id v37 = v35;
  if (v36 == v37)
  {

    goto LABEL_44;
  }
  v38 = v37;
  if (!v37)
  {

    goto LABEL_43;
  }
  char v39 = [v36 isEqual:v37];

  if ((v39 & 1) == 0) {
LABEL_43:
  }
    [v5 addObject:*MEMORY[0x1E4F1C7B8]];
LABEL_44:
  unint64_t v40 = [(FPItem *)self hasUnresolvedConflicts];
  unint64_t v41 = [v4 hasUnresolvedConflicts];
  id v42 = v40;
  id v43 = v41;
  if (v42 == v43)
  {

    goto LABEL_51;
  }
  v44 = v43;
  if (!v43)
  {

    goto LABEL_50;
  }
  char v45 = [v42 isEqual:v43];

  if ((v45 & 1) == 0) {
LABEL_50:
  }
    [v5 addObject:*MEMORY[0x1E4F1C768]];
LABEL_51:
  int v46 = [(FPItem *)self containerDisplayName];
  uint64_t v47 = [v4 containerDisplayName];
  id v48 = v46;
  id v49 = v47;
  if (v48 == v49)
  {

    goto LABEL_58;
  }
  uint64_t v50 = v49;
  if (!v49)
  {

    goto LABEL_57;
  }
  char v51 = [v48 isEqual:v49];

  if ((v51 & 1) == 0) {
LABEL_57:
  }
    [v5 addObject:*MEMORY[0x1E4F1C730]];
LABEL_58:
  uint64_t v52 = [(FPItem *)self isDownloadRequested];
  uint64_t v53 = [v4 isDownloadRequested];
  id v54 = v52;
  id v55 = v53;
  if (v54 == v55)
  {

    goto LABEL_65;
  }
  id v56 = v55;
  if (!v55)
  {

    goto LABEL_64;
  }
  char v57 = [v54 isEqual:v55];

  if ((v57 & 1) == 0) {
LABEL_64:
  }
    [v5 addObject:*MEMORY[0x1E4F1C738]];
LABEL_65:
  int v58 = [(FPItem *)self isShared];
  if (v58 != [v4 isShared]) {
    [v5 addObject:*MEMORY[0x1E4F1C788]];
  }
  if ([(FPItem *)self isShared])
  {
    if ([v4 isShared])
    {
      int v59 = [(FPItem *)self isSharedByCurrentUser];
      if (v59 != [v4 isSharedByCurrentUser]) {
        [v5 addObject:*MEMORY[0x1E4F1C7B0]];
      }
    }
  }
  if ([(FPItem *)self isShared])
  {
    if ([v4 isShared])
    {
      int v60 = [(FPItem *)self isWritable];
      if (v60 != [v4 isWritable]) {
        [v5 addObject:*MEMORY[0x1E4F1C7A8]];
      }
    }
  }
  uint64_t v61 = [(FPItem *)self sharingPermissions];
  unint64_t v62 = [v4 sharingPermissions];
  id v63 = v61;
  id v64 = v62;
  if (v63 == v64)
  {

    goto LABEL_82;
  }
  uint64_t v65 = v64;
  if (!v64)
  {

    goto LABEL_81;
  }
  char v66 = [v63 isEqual:v64];

  if ((v66 & 1) == 0) {
LABEL_81:
  }
    [v5 addObject:*MEMORY[0x1E4F1C7D0]];
LABEL_82:
  uint64_t v67 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  return v67;
}

- (id)_downloadingStatus
{
  if ([(FPItem *)self isCloudItem])
  {
    if ([(FPItem *)self isDownloaded])
    {
      if ([(FPItem *)self supportsMostRecentVersionDownloaded])
      {
        BOOL v3 = [(FPItem *)self isMostRecentVersionDownloaded];
        id v4 = (id *)MEMORY[0x1E4F1C748];
        if (!v3) {
          id v4 = (id *)MEMORY[0x1E4F1C750];
        }
      }
      else
      {
        id v4 = (id *)MEMORY[0x1E4F1C748];
      }
    }
    else
    {
      id v4 = (id *)MEMORY[0x1E4F1C760];
    }
    id v5 = *v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSString)fp_displayName
{
  return self->_displayName;
}

- (BOOL)isKnownByTheProvider
{
  BOOL v3 = [(FPItem *)self itemIdentifier];
  if ([v3 hasPrefix:@"__fp/"])
  {
    id v4 = [(FPItem *)self formerIdentifier];
    if (v4)
    {
      id v5 = [(FPItem *)self formerIdentifier];
      int v6 = [v5 hasPrefix:@"__fp/"] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)itemIsSupportedSearchScope:(id)a3
{
}

- (void)itemIsSupportedSearchScopeWithCachePolicy:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (![(FPItem *)self isFolder]
    || [(FPItem *)self exclusionType]
    || [(FPItem *)self isIgnoreRoot])
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__FPItem_itemIsSupportedSearchScopeWithCachePolicy_completionHandler___block_invoke;
    v7[3] = &unk_1E5AF1790;
    id v8 = v6;
    +[FPProviderDomain fetchProviderDomainForItem:self cachePolicy:a3 completionHandler:v7];
  }
}

uint64_t __70__FPItem_itemIsSupportedSearchScopeWithCachePolicy_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [a2 supportsSearch];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = v3;
    a3 = 0;
  }

  return v4(v5, v6, a3);
}

- (id)fp_valueForKeyPath:(id)a3
{
  id v13 = 0;
  id v14 = 0;
  int v4 = objc_msgSend(a3, "fp_splitKeyPathInProperty:remainder:", &v14, &v13);
  id v5 = v14;
  id v6 = v13;
  int v7 = 0;
  if (v4)
  {
    id v8 = FPExtensionMatchingDictionaryForItem(self, 0);
    int v9 = [v8 objectForKeyedSubscript:v5];
    uint64_t v10 = v9;
    if (v9)
    {
      if (!v6)
      {
        id v11 = v9;
        goto LABEL_8;
      }
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v10, "fp_valueForKeyPath:", v6);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
        int v7 = v11;
        goto LABEL_9;
      }
    }
    int v7 = 0;
LABEL_9:
  }

  return v7;
}

- (id)scopedSearchQueryUnderItem
{
  if ([(FPItem *)self isFolder])
  {
    uint64_t v3 = [NSFileProviderSearchQuery alloc];
    int v4 = [(FPItem *)self itemID];
    id v5 = [(FPItem *)self providerItemID];
    id v6 = [(NSFileProviderSearchQuery *)v3 initWithSearchScopedToItemID:v4 alternateItemID:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)coreSpotlightIdentifier
{
  uint64_t v3 = [(FPItem *)self formerIdentifier];

  if (v3) {
    [(FPItem *)self formerItemID];
  }
  else {
  int v4 = [(FPItem *)self itemID];
  }
  id v5 = [v4 coreSpotlightIdentifier];

  return v5;
}

- (unint64_t)enumerationOrigin
{
  return self->_enumerationOrigin;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setVersionIdentifier:(id)a3
{
}

- (void)setTrashed:(BOOL)a3
{
  self->_trashed = a3;
}

- (void)setOwnerNameComponents:(id)a3
{
}

- (void)setMostRecentEditorNameComponents:(id)a3
{
}

- (NSString)containerDisplayName
{
  return self->_containerDisplayName;
}

- (BOOL)supportsMostRecentVersionDownloaded
{
  return self->_supportsMostRecentVersionDownloaded;
}

- (BOOL)isOffline
{
  return self->_offline;
}

- (NSString)fp_parentDomainIdentifier
{
  return self->_fp_parentDomainIdentifier;
}

- (void)setFp_parentDomainIdentifier:(id)a3
{
}

- (NSURL)detachedRootLogicalURL
{
  return self->_detachedRootLogicalURL;
}

- (void)setDetachedRootLogicalURL:(id)a3
{
}

- (NSArray)decorations
{
  return self->_decorations;
}

- (void)setContentZoneRoot:(BOOL)a3
{
  self->_contentZoneRoot = a3;
}

- (NSString)symlinkTargetPath
{
  return self->_symlinkTargetPath;
}

- (void)setSymlinkTargetPath:(id)a3
{
}

- (NSDictionary)inheritedUserInfo
{
  return self->_inheritedUserInfo;
}

- (int64_t)contentPolicy
{
  return self->_contentPolicy;
}

- (int64_t)inheritedContentPolicy
{
  return self->_inheritedContentPolicy;
}

- (int64_t)effectiveContentPolicy
{
  return self->_effectiveContentPolicy;
}

- (NSArray)conflictingVersions
{
  return self->_conflictingVersions;
}

- (void)setConflictingVersions:(id)a3
{
}

- (NSString)fp_spotlightSubDomainIdentifier
{
  return self->_fp_spotlightSubDomainIdentifier;
}

- (void)setFp_spotlightSubDomainIdentifier:(id)a3
{
}

- (NSString)spotlightDomainIdentifier
{
  return self->_spotlightDomainIdentifier;
}

- (void)setFolderType:(unint64_t)a3
{
  self->_folderType = a3;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setProgress:(id)a3
{
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (void)setExclusionType:(unint64_t)a3
{
  self->_exclusionType = a3;
}

- (NSString)preformattedOwnerName
{
  return self->_preformattedOwnerName;
}

- (void)setPreformattedOwnerName:(id)a3
{
}

- (NSString)preformattedMostRecentEditorName
{
  return self->_preformattedMostRecentEditorName;
}

- (void)setPreformattedMostRecentEditorName:(id)a3
{
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (unsigned)documentID
{
  return self->_documentID;
}

- (void)setDocumentID:(unsigned int)a3
{
  self->_documentID = a3;
}

- (unint64_t)unsupportedFields
{
  return self->_unsupportedFields;
}

- (NSString)formerIdentifier
{
  return self->_formerIdentifier;
}

- (NSNumber)hasUnresolvedConflicts
{
  return self->_hasUnresolvedConflicts;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSString)placeholderIdentifier
{
  return self->_placeholderIdentifier;
}

- (void)setPlaceholderIdentifier:(id)a3
{
}

- (NSFileProviderTypeAndCreator)typeAndCreator
{
  return self->_typeAndCreator;
}

- (NSData)quarantineBlob
{
  return self->_quarantineBlob;
}

- (void)setOriginatorInfo:(id)a3
{
}

- (NSString)fileSystemFilename
{
  return self->_fileSystemFilename;
}

- (void)setFileSystemFilename:(id)a3
{
}

- (BOOL)fp_isDownloadRequested
{
  return [(NSNumber *)self->_isDownloadRequested BOOLValue];
}

+ (id)appLibraryFromContainerItem:(id)a3 documentsItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:a1 file:@"FPItem+FPAppLibraryCollection.m" lineNumber:20 description:@"containerItem must not be nil"];

    if (v9) {
      goto LABEL_3;
    }
  }
  char v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2 object:a1 file:@"FPItem+FPAppLibraryCollection.m" lineNumber:21 description:@"documentsItem must not be nil"];

LABEL_3:
  if (objc_msgSend(v7, "fp_isCloudDocsContainer"))
  {
    id v10 = 0;
  }
  else
  {
    id v11 = (void *)[v7 copy];
    id v12 = [v9 fileURL];
    [v11 setFileURL:v12];

    id v13 = [v9 itemIdentifier];
    [v11 setItemIdentifier:v13];

    objc_msgSend(v11, "setFileID:", objc_msgSend(v9, "fileID"));
    id v14 = [v9 formerIdentifier];
    [v11 setFormerIdentifier:v14];

    char v15 = [v9 creationDate];
    [v11 setCreationDate:v15];

    unint64_t v16 = [v9 lastUsedDate];
    [v11 setLastUsedDate:v16];

    uint64_t v17 = [v9 contentModificationDate];
    [v11 setContentModificationDate:v17];

    objc_msgSend(v11, "setRecursivelyDownloaded:", objc_msgSend(v9, "isRecursivelyDownloaded"));
    objc_msgSend(v11, "setDownloaded:", objc_msgSend(v9, "isDownloaded"));
    objc_msgSend(v11, "setDownloading:", objc_msgSend(v9, "isDownloading"));
    objc_msgSend(v11, "setCapabilities:", objc_msgSend(v9, "capabilities"));
    id v18 = [v9 favoriteRank];
    [v11 setFavoriteRank:v18];

    id v19 = [v9 childItemCount];
    [v11 setChildItemCount:v19];

    objc_msgSend(v11, "setPinned:", objc_msgSend(v9, "isPinned"));
    objc_msgSend(v11, "setInPinnedFolder:", objc_msgSend(v9, "isInPinnedFolder"));
    if ([v11 isValidAppLibrary])
    {
      id v10 = v11;
    }
    else
    {
      uint64_t v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        +[FPItem(FPAppLibraryCollection) appLibraryFromContainerItem:documentsItem:]((uint64_t)v11, v22);
      }

      id v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isValidAppLibrary
{
  BOOL v3 = [(FPItem *)self isValidContainerForAppLibrary];
  if (v3)
  {
    int v4 = [(FPItem *)self fileURL];
    id v5 = [v4 lastPathComponent];
    char v6 = [v5 isEqualToString:@"Documents"];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isValidContainerForAppLibrary
{
  if ([(FPItem *)self fp_isCloudDocsContainer] || ![(FPItem *)self isContainer]) {
    return 0;
  }
  BOOL v3 = [(FPItem *)self fp_appContainerBundleIdentifier];
  if ([v3 length])
  {
    int v4 = [(FPItem *)self displayName];
    if ([v4 length])
    {
      id v5 = [(FPItem *)self fileURL];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)toSearchableItem
{
  uint64_t v126 = 0;
  int v127 = &v126;
  uint64_t v128 = 0x2050000000;
  BOOL v3 = (void *)getCSSearchableItemAttributeSetClass_softClass;
  int v129 = (void *)getCSSearchableItemAttributeSetClass_softClass;
  if (!getCSSearchableItemAttributeSetClass_softClass)
  {
    uint64_t v121 = MEMORY[0x1E4F143A8];
    uint64_t v122 = 3221225472;
    uint64_t v123 = __getCSSearchableItemAttributeSetClass_block_invoke;
    v124 = &unk_1E5AF1950;
    uint64_t v125 = &v126;
    __getCSSearchableItemAttributeSetClass_block_invoke((uint64_t)&v121);
    BOOL v3 = (void *)v127[3];
  }
  int v4 = v3;
  _Block_object_dispose(&v126, 8);
  id v5 = objc_alloc_init(v4);
  BOOL v6 = [(FPItem *)self coreSpotlightIdentifier];
  [v5 setFileItemID:v6];

  id v7 = [(FPItem *)self providerID];
  [v5 setFileProviderID:v7];

  id v8 = [(FPItem *)self domainIdentifier];
  [v5 setFileProviderDomainIdentifier:v8];

  int v9 = [(FPItem *)self filename];
  [v5 setFilename:v9];

  id v10 = [(FPItem *)self filename];
  [v5 setAttribute:v10 forKey:@"FPFilename"];

  id v11 = [(FPItem *)self displayName];
  [v5 setDisplayName:v11];

  id v12 = [(FPItem *)self typeIdentifier];
  [v5 setContentType:v12];

  uint64_t v13 = [(FPItem *)self formerIdentifier];
  if (v13)
  {
    id v14 = (void *)v13;
    char v15 = [(FPItem *)self formerIdentifier];
    unint64_t v16 = [(FPItem *)self itemID];
    uint64_t v17 = [v16 identifier];
    char v18 = [v15 isEqualToString:v17];

    if ((v18 & 1) == 0)
    {
      uint64_t v121 = 0;
      id v19 = [(FPItem *)self itemIdentifier];
      int v20 = objc_msgSend(v19, "fp_getParsedDiskIdentifier:", &v121);

      if (v20)
      {
        char v21 = [NSNumber numberWithInteger:v121];
        [v5 setAttribute:v21 forKey:@"FPOnDiskIdentifier"];
      }
      else
      {
        char v21 = fp_current_or_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          [(FPItem(CSSearchableItem) *)(uint64_t)self toSearchableItem];
        }
      }
    }
  }
  uint64_t v22 = [(FPItem *)self contentType];
  if (v22
    && (![(FPItem *)self isCloudItem] || [(FPItem *)self isDownloaded])
    && (([v22 conformsToType:*MEMORY[0x1E4F44400]] & 1) != 0
     || [v22 conformsToType:*MEMORY[0x1E4F44448]]))
  {
    [v5 setEligibleForPhotosProcessing:MEMORY[0x1E4F1CC38]];
  }
  double v23 = [(FPItem *)self contentType];
  uint64_t v24 = [v23 _localizedDescriptionDictionary];

  if (v24)
  {
    uint64_t v126 = 0;
    int v127 = &v126;
    uint64_t v128 = 0x2050000000;
    id v25 = (void *)getCSLocalizedStringClass_softClass;
    int v129 = (void *)getCSLocalizedStringClass_softClass;
    if (!getCSLocalizedStringClass_softClass)
    {
      uint64_t v121 = MEMORY[0x1E4F143A8];
      uint64_t v122 = 3221225472;
      uint64_t v123 = __getCSLocalizedStringClass_block_invoke;
      v124 = &unk_1E5AF1950;
      uint64_t v125 = &v126;
      __getCSLocalizedStringClass_block_invoke((uint64_t)&v121);
      id v25 = (void *)v127[3];
    }
    uint64_t v26 = v25;
    _Block_object_dispose(&v126, 8);
    char v27 = (void *)[[v26 alloc] initWithLocalizedStrings:v24];
    [v5 setKind:v27];
  }
  uint64_t v28 = [(FPItem *)self creationDate];
  [v5 setContentCreationDate:v28];

  id v29 = [(FPItem *)self contentModificationDate];
  [v5 setContentModificationDate:v29];

  id v30 = [(FPItem *)self tags];
  if ([v30 count])
  {
    id v31 = objc_msgSend(v30, "fp_map:", &__block_literal_global_36);
    [v5 setUserTags:v31];

    uint64_t v32 = [v30 count];
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __44__FPItem_CSSearchableItem__toSearchableItem__block_invoke_2;
    v119[3] = &unk_1E5AF4560;
    id v120 = v30;
    char v33 = v119;
    uint64_t v126 = 0;
    int v127 = &v126;
    uint64_t v128 = 0x2020000000;
    v34 = (uint64_t (*)(uint64_t, void *))getMDPropertyCreateUserTagStringsSymbolLoc_ptr;
    int v129 = getMDPropertyCreateUserTagStringsSymbolLoc_ptr;
    if (!getMDPropertyCreateUserTagStringsSymbolLoc_ptr)
    {
      uint64_t v121 = MEMORY[0x1E4F143A8];
      uint64_t v122 = 3221225472;
      uint64_t v123 = __getMDPropertyCreateUserTagStringsSymbolLoc_block_invoke;
      v124 = &unk_1E5AF1950;
      uint64_t v125 = &v126;
      uint64_t v35 = (void *)MetadataUtilitiesLibrary_0();
      id v36 = dlsym(v35, "MDPropertyCreateUserTagStrings");
      *(void *)(v125[1] + 24) = v36;
      getMDPropertyCreateUserTagStringsSymbolLoc_ptr = *(_UNKNOWN **)(v125[1] + 24);
      v34 = (uint64_t (*)(uint64_t, void *))v127[3];
    }
    _Block_object_dispose(&v126, 8);
    if (!v34) {
      -[FPItem(CSSearchableItem) toSearchableItem]();
    }
    id v37 = (void *)v34(v32, v33);

    [v5 setAttribute:v37 forKey:@"_kMDItemUserTags"];
    v38 = v120;
  }
  else
  {
    [v5 setUserTags:0];
    v38 = [MEMORY[0x1E4F1CA98] null];
    [v5 setAttribute:v38 forKey:@"_kMDItemUserTags"];
  }

  char v39 = [(FPItem *)self lastUsedDate];
  [v5 setLastUsedDate:v39];

  unint64_t v40 = [(FPItem *)self favoriteRank];
  [v5 setFavoriteRank:v40];

  unint64_t v41 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isUploaded](self, "isUploaded"));
  [v5 setUploaded:v41];

  id v42 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isUploaded](self, "isUploaded"));
  [v5 setUploaded:v42];

  id v43 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isUploading](self, "isUploading"));
  [v5 setUploading:v43];

  v44 = [(FPItem *)self uploadingError];
  char v45 = +[FPSearchableItemError stringFromError:v44];
  [v5 setAttribute:v45 forKey:@"FPUploadingError"];

  int v46 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isDownloaded](self, "isDownloaded"));
  [v5 setAttribute:v46 forKey:@"FPDownloaded"];

  uint64_t v47 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isDownloading](self, "isDownloading"));
  [v5 setDownloading:v47];

  id v48 = [(FPItem *)self downloadingError];
  id v49 = +[FPSearchableItemError stringFromError:v48];
  [v5 setAttribute:v49 forKey:@"FPDownloadingError"];

  uint64_t v50 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isRecursivelyDownloaded](self, "isRecursivelyDownloaded"));
  [v5 setAttribute:v50 forKey:@"FPItemIsRecursivelyDownloaded"];

  char v51 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FPItem capabilities](self, "capabilities"));
  [v5 setAttribute:v51 forKey:@"FPCapabilities"];

  uint64_t v52 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isPinned](self, "isPinned"));
  [v5 setAttribute:v52 forKey:@"FPItemIsPinned"];

  uint64_t v53 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isInPinnedFolder](self, "isInPinnedFolder"));
  [v5 setAttribute:v53 forKey:@"FPItemIsInPinnedFolder"];

  id v54 = [(FPItem *)self itemVersion];
  id v55 = v54;
  if (v54 && ([v54 isEmpty] & 1) == 0)
  {
    int v60 = +[FPSearchableItemVersion stringFromVersion:v55];
    [v5 setAttribute:v60 forKey:@"FPItemVersion"];
  }
  else
  {
    id v56 = [(FPItem *)self versionIdentifier];

    if (!v56) {
      goto LABEL_32;
    }
    id v57 = [NSString alloc];
    int v58 = [(FPItem *)self versionIdentifier];
    int v59 = [v58 base64EncodedDataWithOptions:0];
    int v60 = (void *)[v57 initWithData:v59 encoding:4];

    [v5 setVersionIdentifier:v60];
  }

LABEL_32:
  uint64_t v61 = [(FPItem *)self providerID];
  [v5 setBundleID:v61];

  unint64_t v62 = [(FPItem *)self fp_appContainerBundleIdentifier];
  [v5 setAttribute:v62 forKey:@"FPAppContainerBundleID"];

  id v63 = [(FPItem *)self cloudContainerIdentifier];
  [v5 setAttribute:v63 forKey:@"FPCloudContainerID"];

  id v64 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isContainer](self, "isContainer"));
  [v5 setAttribute:v64 forKey:@"FPIsContainer"];

  uint64_t v65 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isContainerPristine](self, "isContainerPristine"));
  [v5 setAttribute:v65 forKey:@"FPIsContainerPristine"];

  char v66 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isUbiquitous](self, "isUbiquitous"));
  [v5 setAttribute:v66 forKey:@"FPIsUbiquitous"];

  uint64_t v67 = [(FPItem *)self fp_parentDomainIdentifier];

  if (v67)
  {
    int v68 = [(FPItem *)self fp_parentDomainIdentifier];
    [v5 setAttribute:v68 forKey:@"FPParentDomainID"];
  }
  uint64_t v116 = [(FPItem *)self userInfo];
  if ([v116 count])
  {
    id v117 = 0;
    id v118 = 0;
    int v69 = FPEncodeUserInfo(v116, &v118, &v117);
    id v70 = v118;
    id v71 = v117;
    if (v69)
    {
      [v5 setAttribute:v70 forKey:@"FPUserInfoKeys"];
      [v5 setAttribute:v71 forKey:@"FPUserInfoValues"];
    }
  }
  int v113 = v30;
  id v72 = [(FPItem *)self documentSize];
  id v73 = v72;
  if (v72)
  {
    int v74 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v72, "unsignedIntegerValue") / 1000000.0);
    [v5 setFileSize:v74];
  }
  v75 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isShared](self, "isShared"));
  [v5 setShared:v75];

  uint64_t v76 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isSharedByCurrentUser](self, "isSharedByCurrentUser"));
  [v5 setUserOwned:v76];

  uint64_t v77 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem fp_isLastModifiedByCurrentUser](self, "fp_isLastModifiedByCurrentUser"));
  [v5 setAttribute:v77 forKey:@"FPLastModifiedByCurrentUser"];

  uint64_t v78 = [(FPItem *)self preformattedOwnerName];

  int v115 = v22;
  if (v78)
  {
    uint64_t v79 = [(FPItem *)self preformattedOwnerName];
    [v5 setOwnerName:v79];
    id v80 = 0;
LABEL_44:

    goto LABEL_45;
  }
  id v81 = [(FPItem *)self ownerNameComponents];

  if (v81)
  {
    id v80 = objc_opt_new();
    uint64_t v79 = [(FPItem *)self ownerNameComponents];
    v82 = [v80 stringFromPersonNameComponents:v79];
    [v5 setOwnerName:v82];

    goto LABEL_44;
  }
  id v80 = 0;
LABEL_45:
  id v83 = [(FPItem *)self preformattedMostRecentEditorName];

  v114 = (void *)v24;
  if (v83)
  {
    uint64_t v84 = [(FPItem *)self preformattedMostRecentEditorName];
    [v5 setLastEditorName:v84];
  }
  else
  {
    uint64_t v85 = [(FPItem *)self mostRecentEditorNameComponents];

    if (!v85) {
      goto LABEL_52;
    }
    if (!v80) {
      id v80 = objc_opt_new();
    }
    uint64_t v84 = [(FPItem *)self mostRecentEditorNameComponents];
    uint64_t v86 = [v80 stringFromPersonNameComponents:v84];
    [v5 setLastEditorName:v86];
  }
LABEL_52:
  unint64_t v87 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isMostRecentVersionDownloaded](self, "isMostRecentVersionDownloaded"));
  [v5 setAttribute:v87 forKey:@"FPMostRecentVersionDownloaded"];

  v88 = objc_msgSend(NSNumber, "numberWithBool:", -[FPItem isTrashed](self, "isTrashed"));
  [v5 setTrashed:v88];

  id v89 = [(FPItem *)self fileURL];
  uint64_t v90 = [(FPItem *)self fileURL];
  int v91 = (void *)_CFURLPromiseCopyPhysicalURL();

  if (v91)
  {
    id v92 = v91;

    id v89 = v92;
  }
  [v5 setContentURL:v89];
  int v93 = [(FPItem *)self parentFormerIdentifier];
  if (v93)
  {
    [v5 setAttribute:v93 forKey:@"FPParentFileItemID"];
  }
  else
  {
    v94 = [(FPItem *)self parentItemIdentifier];
    [v5 setAttribute:v94 forKey:@"FPParentFileItemID"];
  }
  unint64_t v95 = [(FPItem *)self capabilities];
  v96 = [NSNumber numberWithBool:(v95 >> 6) & 1];
  [v5 setAttribute:v96 forKey:@"FPEvictable"];

  if ([(FPItem *)self isTopLevelSharedItem]) {
    [v5 setAttribute:MEMORY[0x1E4F1CC38] forKey:@"FPIsTopLevelSharedItem"];
  }
  char v97 = [(FPItem *)self collaborationIdentifier];

  if (v97)
  {
    uint64_t v98 = [(FPItem *)self collaborationIdentifier];
    [v5 setAttribute:v98 forKey:@"FPCollaborationIdentifier"];
  }
  uint64_t v99 = [(FPItem *)self spotlightDomainIdentifier];
  if (v99)
  {
    int v100 = (void *)v99;
    uint64_t v101 = v55;
    int v102 = [(FPItem *)self fp_spotlightSubDomainIdentifier];
    if (v102)
    {
      uint64_t v103 = [v100 stringByAppendingPathExtension:v102];

      int v100 = (void *)v103;
    }
    uint64_t v126 = 0;
    int v127 = &v126;
    uint64_t v128 = 0x2050000000;
    int v104 = (void *)getCSSearchableItemClass_softClass;
    int v129 = (void *)getCSSearchableItemClass_softClass;
    if (!getCSSearchableItemClass_softClass)
    {
      uint64_t v121 = MEMORY[0x1E4F143A8];
      uint64_t v122 = 3221225472;
      uint64_t v123 = __getCSSearchableItemClass_block_invoke;
      v124 = &unk_1E5AF1950;
      uint64_t v125 = &v126;
      __getCSSearchableItemClass_block_invoke((uint64_t)&v121);
      int v104 = (void *)v127[3];
    }
    v105 = v104;
    _Block_object_dispose(&v126, 8);
    id v106 = [v105 alloc];
    v107 = [(FPItem *)self coreSpotlightIdentifier];
    uint64_t v108 = (void *)[v106 initWithUniqueIdentifier:v107 domainIdentifier:v100 attributeSet:v5];

    int v109 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v108 setExpirationDate:v109];

    uint64_t v110 = v108;
    int v111 = v110;
    id v55 = v101;
  }
  else
  {
    uint64_t v110 = fp_current_or_default_log();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT)) {
      -[FPItem(CSSearchableItem) toSearchableItem](v110);
    }
    int v111 = 0;
  }

  return v111;
}

uint64_t __44__FPItem_CSSearchableItem__toSearchableItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

void __44__FPItem_CSSearchableItem__toSearchableItem__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  BOOL v6 = [v7 label];
  *a3 = v6;

  *a4 = [v7 color];
}

+ (id)fp_minimalAttributesForEvictionPriority
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = getMDItemLastUsedDate();
  v8[0] = v2;
  BOOL v3 = getMDItemFileSize();
  v8[1] = v3;
  int v4 = getMDItemFileProviderID();
  v8[2] = v4;
  id v5 = getMDItemFileProviderDomainIdentifier();
  v8[3] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)fp_minimalAttributesForEviction
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = getMDItemLastUsedDate();
  v9[0] = v2;
  BOOL v3 = getMDItemFileSize();
  v9[1] = v3;
  int v4 = getMDItemFileItemID();
  v9[2] = v4;
  id v5 = getMDItemFileProviderID();
  v9[3] = v5;
  BOOL v6 = getMDItemFileProviderDomainIdentifier();
  v9[4] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)generatePlaceholderIdentifier
{
  v2 = NSString;
  BOOL v3 = [MEMORY[0x1E4F29128] UUID];
  int v4 = [v3 UUIDString];
  id v5 = [v4 componentsSeparatedByString:@"-"];
  BOOL v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v2 stringWithFormat:@"%@/%@", @"__fp", v6];

  return v7;
}

+ (id)generatePlaceholderIdentifierWithOriginalID:(id)a3
{
  BOOL v3 = NSString;
  int v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  BOOL v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v7 componentsSeparatedByString:@"-"];
  int v9 = [v8 objectAtIndexedSubscript:0];
  id v10 = [v3 stringWithFormat:@"%@/%@/%@", @"__fp", v9, v5];

  return v10;
}

+ (id)temporaryPlaceholderFromItem:(id)a3
{
  BOOL v3 = (void *)[a3 copyAsPending];
  [v3 setFavoriteRank:0];
  [v3 setUploading:0];
  [v3 setDownloading:0];
  objc_msgSend(v3, "setFp_lastModifiedByCurrentUser:", 0);
  [v3 setOwnerNameComponents:0];
  [v3 setMostRecentEditorNameComponents:0];
  [v3 setEnumerationOrigin:0];
  objc_msgSend(v3, "setFp_spotlightSubDomainIdentifier:", 0);
  [v3 setContainerDisplayName:0];
  objc_msgSend(v3, "setFp_appContainerBundleIdentifier:", 0);
  objc_msgSend(v3, "setFp_parentDomainIdentifier:", 0);
  [v3 setCloudContainerIdentifier:0];
  [v3 setFileURL:0];
  [v3 setShared:0];
  [v3 setSharedByCurrentUser:0];
  [v3 setState:5];

  return v3;
}

+ (id)placeholderWithCopyOfExistingItem:(id)a3 lastUsageUpdatePolicy:(unint64_t)a4 underParent:(id)a5 inProviderDomainID:(id)a6
{
  id v10 = a6;
  id v11 = (__CFString *)a5;
  id v12 = a3;
  uint64_t v13 = [a1 temporaryPlaceholderFromItem:v12];
  id v14 = [a1 generatePlaceholderIdentifier];
  [v13 setItemIdentifier:v14];

  char v15 = [v12 itemIdentifier];

  [v13 setPlaceholderIdentifier:v15];
  [v13 setParentItemIdentifier:v11];

  if (@"NSFileProviderTrashContainerItemIdentifier" == v11) {
    [v13 setTrashed:1];
  }
  [v13 setProviderDomainID:v10];
  if (a4)
  {
    if (a4 == 2)
    {
      unint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      [v13 setLastUsedDate:v16];
    }
  }
  else
  {
    [v13 setLastUsedDate:0];
  }

  return v13;
}

+ (id)genericArchivePlaceholderUnderParent:(id)a3 inProviderDomainID:(id)a4 withArchiveFormat:(unint64_t)a5
{
  id v23 = 0;
  id v7 = a4;
  id v8 = a3;
  int v9 = +[FPArchiveOperation extensionForArchiveFormat:a5 utType:&v23];
  id v10 = v23;
  char v18 = FPLoc(@"ARCHIVE_FILENAME", v11, v12, v13, v14, v15, v16, v17, v22);
  id v19 = [v18 stringByAppendingPathExtension:v9];
  int v20 = +[FPItem placeholderWithName:v19 contentType:v10 contentAccessDate:0 underParent:v8 inProviderDomainID:v7];

  return v20;
}

+ (id)archivePlaceholderForItem:(id)a3 underParent:(id)a4 inProviderDomainID:(id)a5 withArchiveFormat:(unint64_t)a6
{
  id v22 = 0;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[FPArchiveOperation extensionForArchiveFormat:a6 utType:&v22];
  id v13 = v22;
  uint64_t v14 = [v11 filename];
  uint64_t v15 = objc_msgSend(v14, "fp_displayNameFromFilenameWithHiddenPathExtension:isFolder:", 1, objc_msgSend(v11, "isFolder"));
  uint64_t v16 = objc_msgSend(v15, "fp_filenameFromDisplayNameWithExtension:", v12);

  uint64_t v17 = +[FPItem placeholderWithName:v16 contentType:v13 contentAccessDate:0 underParent:v10 inProviderDomainID:v9];

  char v18 = [v11 displayName];
  [v17 setDisplayName:v18];

  id v19 = [v11 itemIdentifier];
  [v17 setPlaceholderIdentifier:v19];

  objc_msgSend(v17, "setCapabilities:", objc_msgSend(v11, "capabilities"));
  objc_msgSend(v17, "setEnumerationOrigin:", objc_msgSend(v11, "enumerationOrigin"));
  uint64_t v20 = [v11 fileSystemFlags];

  [v17 setFileSystemFlags:v20];

  return v17;
}

+ (id)placeholderWithName:(id)a3 contentType:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [FPItem alloc];
  char v18 = [a1 generatePlaceholderIdentifier];
  id v19 = [(FPItem *)v17 initWithProviderDomainID:v13 itemIdentifier:v18 parentItemIdentifier:v14 filename:v16 contentType:v15];

  if (v12) {
    [(FPItem *)v19 setLastUsedDate:v12];
  }
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
  [(FPItem *)v19 setCreationDate:v20];

  char v21 = [(FPItem *)v19 creationDate];
  [(FPItem *)v19 setContentModificationDate:v21];

  [(FPItem *)v19 setState:5];

  return v19;
}

+ (id)placeholderWithName:(id)a3 typeIdentifier:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  id v11 = (void *)MEMORY[0x1E4F442D8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = objc_msgSend(v11, "fp_cachedTypeWithIdentifier:", a4);
  uint64_t v17 = +[FPItem placeholderWithName:v15 contentType:v16 contentAccessDate:v14 underParent:v13 inProviderDomainID:v12];

  return v17;
}

+ (id)placeholderWithName:(id)a3 isFolder:(BOOL)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  id v7 = (void *)MEMORY[0x1E4F443C8];
  if (!a4) {
    id v7 = (void *)MEMORY[0x1E4F44408];
  }
  return (id)[a1 placeholderWithName:a3 contentType:*v7 contentAccessDate:a5 underParent:a6 inProviderDomainID:a7];
}

- (void)_coreSpotlightAttributeForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"kMDItemIsTrashed"])
  {
    id v5 = @"isTrashed";
LABEL_8:
    BOOL v6 = (void *)[(FPItem *)self valueForKey:v5];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"kMDItemDisplayName"])
  {
    id v5 = @"displayName";
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"FPDomainIdentifier"]
    || [v4 isEqualToString:@"kMDItemFileProviderID"])
  {
    id v5 = @"providerDomainID";
    goto LABEL_8;
  }
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[FPItem(MDSimpleQueryEvaluator) _coreSpotlightAttributeForKey:]((uint64_t)v4, v8);
  }

  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (unint64_t)depthInHierarchy
{
  return 0;
}

- (BOOL)fp_isAddedByCurrentUser
{
  return 0;
}

- (NSPersonNameComponents)fp_addedByNameComponents
{
  return 0;
}

- (NSString)localizedSharingStatusString
{
  return 0;
}

- (void)initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_14_0(&dword_1A33AE000, v0, v1, "[SIMCRASH] can't create item because at least one of the required properties is missing. See the log for more details.", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_obfuscatedFilename");
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] attempting to unarchive item without type (%@, %@)", v5, v6, v7, v8, v9);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_14_0(&dword_1A33AE000, v0, v1, "[SIMCRASH] item does not have all the required properties; encoding will be invalid",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)encodeWithCoder:(os_log_t)log .cold.2(void *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  uint64_t v4 = a1[10];
  uint64_t v5 = a1[45];
  uint64_t v6 = a1[22];
  int v7 = 138413314;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v3;
  __int16 v11 = 2112;
  uint64_t v12 = v4;
  __int16 v13 = 2112;
  uint64_t v14 = v5;
  __int16 v15 = 2112;
  uint64_t v16 = v6;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] item %@ does not have all the required properties; encoding will be invalid (%@, %@, %@, %@)",
    (uint8_t *)&v7,
    0x34u);
}

- (void)fieldDifferencesWithItem:(uint64_t)a1 onlyMetadata:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 itemID];
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] Found different fields %@ for itemID %@", v5, v6, v7, v8, v9);
}

- (void)overrideFields:(void *)a1 ofItem:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 itemID];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Overriding field typeAndCreator for itemID %@", (uint8_t *)&v4, 0xCu);
}

- (void)overrideFields:ofItem:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() decorations];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() decorations];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() extendedAttributes];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() extendedAttributes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() conflictingVersions];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() conflictingVersions];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.14()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() cloudContainerIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() cloudContainerIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.15()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(), "fp_parentDomainIdentifier");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "fp_parentDomainIdentifier");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.16()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(), "fp_appContainerBundleIdentifier");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "fp_appContainerBundleIdentifier");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.18()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() containerDisplayName];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() containerDisplayName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.19()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() sharingPermissions];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() sharingPermissions];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.20()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() isDownloadRequested];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() isDownloadRequested];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.21()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() hasUnresolvedConflicts];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() hasUnresolvedConflicts];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.24()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(), "fp_spotlightSubDomainIdentifier");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "fp_spotlightSubDomainIdentifier");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.25()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() spotlightDomainIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() spotlightDomainIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.26()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() itemVersion];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() itemVersion];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.27()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() versionIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() versionIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.28()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() placeholderIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() placeholderIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.30()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() userInfo];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() userInfo];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.31()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() childItemCount];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() childItemCount];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.32()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() collaborationIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() collaborationIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.33()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() mostRecentEditorNameComponents];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() mostRecentEditorNameComponents];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.34()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() ownerNameComponents];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() ownerNameComponents];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.39()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() downloadingError];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() downloadingError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.42()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() uploadingError];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() uploadingError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.45()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() favoriteRank];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() favoriteRank];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.46()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() tags];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() tags];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.47()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() lastUsedDate];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() lastUsedDate];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.49()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() contentModificationDate];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() contentModificationDate];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.50()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() creationDate];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() creationDate];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.53()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() fileURL];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() fileURL];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.54()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() documentSize];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() documentSize];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.55()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() contentType];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() contentType];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.56()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() displayName];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() displayName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.57()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() filename];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() filename];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.58()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() domainIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() domainIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.59()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() providerID];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() providerID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.60()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() parentItemIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() parentItemIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.61()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() formerIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() formerIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)overrideFields:ofItem:.cold.62()
{
  OUTLINED_FUNCTION_3_0();
  [v2 itemID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_9_0() itemIdentifier];
  id v4 = [(id)OUTLINED_FUNCTION_8_0() itemIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1A33AE000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);
}

- (void)setFilename:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_14_0(&dword_1A33AE000, v0, v1, "[SIMCRASH] can't set a nil filename", v2, v3, v4, v5, v6);
}

- (void)setProviderID:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_14_0(&dword_1A33AE000, v0, v1, "[SIMCRASH] can't set a nil provider identifier", v2, v3, v4, v5, v6);
}

- (void)setItemIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_14_0(&dword_1A33AE000, v0, v1, "[SIMCRASH] can't set a nil item identifier", v2, v3, v4, v5, v6);
}

@end