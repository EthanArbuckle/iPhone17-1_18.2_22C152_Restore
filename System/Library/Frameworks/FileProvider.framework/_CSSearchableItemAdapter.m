@interface _CSSearchableItemAdapter
+ (id)fp_queryFetchAttributes;
- (BOOL)fp_isAddedByCurrentUser;
- (BOOL)fp_isContainer;
- (BOOL)fp_isContainerPristine;
- (BOOL)fp_isLastModifiedByCurrentUser;
- (BOOL)fp_isUbiquitous;
- (BOOL)isCollaborationInvitation;
- (BOOL)isDownloaded;
- (BOOL)isDownloading;
- (BOOL)isInPinnedFolder;
- (BOOL)isMostRecentVersionDownloaded;
- (BOOL)isPinned;
- (BOOL)isRecursivelyDownloaded;
- (BOOL)isShared;
- (BOOL)isSharedByCurrentUser;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isTrashed;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (CSSearchableItem)item;
- (CSSearchableItemAttributeSet)attributeSet;
- (NSData)originatorInfo;
- (NSData)tagData;
- (NSData)versionIdentifier;
- (NSDate)contentModificationDate;
- (NSDate)creationDate;
- (NSDate)lastUsedDate;
- (NSDictionary)userInfo;
- (NSError)downloadingError;
- (NSError)uploadingError;
- (NSFileProviderItemVersion)itemVersion;
- (NSNumber)childItemCount;
- (NSNumber)documentSize;
- (NSNumber)favoriteRank;
- (NSPersonNameComponents)fp_addedByNameComponents;
- (NSPersonNameComponents)mostRecentEditorNameComponents;
- (NSPersonNameComponents)ownerNameComponents;
- (NSString)displayName;
- (NSString)filename;
- (NSString)fp_cloudContainerIdentifier;
- (NSString)fp_domainIdentifier;
- (NSString)fp_parentDomainIdentifier;
- (NSString)itemIdentifier;
- (NSString)parentItemIdentifier;
- (NSString)preformattedMostRecentEditorName;
- (NSString)preformattedOwnerName;
- (NSString)providerIdentifier;
- (NSString)typeIdentifier;
- (UTType)contentType;
- (_CSSearchableItemAdapter)initWithSearchableItem:(id)a3;
- (id)collaborationIdentifier;
- (id)containerSubitemCount;
- (id)formerIdentifier;
- (id)fp_appContainerBundleIdentifier;
- (id)sharingCurrentUserPermissions;
- (id)sharingCurrentUserRole;
- (id)tags;
- (unint64_t)capabilities;
- (void)downloadingError;
- (void)uploadingError;
@end

@implementation _CSSearchableItemAdapter

- (UTType)contentType
{
  v2 = (void *)MEMORY[0x1E4F442D8];
  v3 = [(_CSSearchableItemAdapter *)self typeIdentifier];
  v4 = objc_msgSend(v2, "fp_cachedTypeWithIdentifier:", v3);

  return (UTType *)v4;
}

- (NSString)typeIdentifier
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 contentType];

  return (NSString *)v3;
}

- (id)tags
{
  v3 = [(_CSSearchableItemAdapter *)self attributeSet];
  v4 = [v3 attributeForKey:@"_kMDItemUserTags"];

  if (v4)
  {
    v5 = objc_msgSend(v4, "fp_mapWithIndex:", &__block_literal_global_132);
  }
  else
  {
    v6 = [(_CSSearchableItemAdapter *)self attributeSet];
    v7 = [v6 userTags];

    if (v7)
    {
      v8 = [(_CSSearchableItemAdapter *)self attributeSet];
      v9 = [v8 attributeForKey:@"FPTagColors"];

      if (v9 && (uint64_t v10 = [v7 count], v10 == objc_msgSend(v9, "count")))
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __32___CSSearchableItemAdapter_tags__block_invoke_2;
        v12[3] = &unk_1E5AF45A8;
        id v13 = v9;
        v5 = objc_msgSend(v7, "fp_mapWithIndex:", v12);
      }
      else
      {
        v5 = objc_msgSend(v7, "fp_mapWithIndex:", &__block_literal_global_135);
      }
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSError)uploadingError
{
  v3 = [(_CSSearchableItemAdapter *)self attributeSet];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v4 = (void *)getMDItemUploadErrorSymbolLoc_ptr;
  uint64_t v14 = getMDItemUploadErrorSymbolLoc_ptr;
  if (!getMDItemUploadErrorSymbolLoc_ptr)
  {
    v5 = (void *)CoreSpotlightLibrary_1();
    v12[3] = (uint64_t)dlsym(v5, "MDItemUploadError");
    getMDItemUploadErrorSymbolLoc_ptr = v12[3];
    v4 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v4) {
    -[_CSSearchableItemAdapter uploadingError]();
  }
  v6 = [v3 attributeForKey:*v4];

  if (v6)
  {
    v7 = +[FPSearchableItemError errorFromString:v6];
    v8 = [(_CSSearchableItemAdapter *)self fileURL];
    v9 = objc_msgSend(v7, "fp_annotatedErrorWithURL:variant:", v8, 0);
  }
  else
  {
    v9 = 0;
  }

  return (NSError *)v9;
}

- (NSString)providerIdentifier
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 fileProviderID];

  return (NSString *)v3;
}

- (NSString)preformattedOwnerName
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 ownerName];

  return (NSString *)v3;
}

- (NSString)preformattedMostRecentEditorName
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 lastEditorName];

  return (NSString *)v3;
}

- (NSPersonNameComponents)ownerNameComponents
{
  return 0;
}

- (NSData)originatorInfo
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"com.apple.synapse:DocumentAttributes"];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      goto LABEL_8;
    }
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = (id)objc_opt_class();
      id v6 = v9;
      _os_log_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Found invalid class for originatorInfo, expected NSData, got %@", (uint8_t *)&v8, 0xCu);
    }
  }
  id v4 = 0;
LABEL_8:

  return (NSData *)v4;
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  return 0;
}

- (NSDate)lastUsedDate
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 lastUsedDate];

  return (NSDate *)v3;
}

- (NSFileProviderItemVersion)itemVersion
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPItemVersion"];

  if (v3)
  {
    id v4 = +[FPSearchableItemVersion versionFromString:v3];
  }
  else
  {
    id v4 = objc_alloc_init(NSFileProviderItemVersion);
  }
  v5 = v4;

  return v5;
}

- (BOOL)isUploading
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 isUploading];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isUploaded
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 isUploaded];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isTrashed
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 isTrashed];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isTopLevelSharedItem
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPIsTopLevelSharedItem"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isShared
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 isShared];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isSharedByCurrentUser
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 isUserOwned];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isRecursivelyDownloaded
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPItemIsRecursivelyDownloaded"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isPinned
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPItemIsPinned"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isMostRecentVersionDownloaded
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPMostRecentVersionDownloaded"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isInPinnedFolder
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPItemIsInPinnedFolder"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isDownloading
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 isDownloading];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isDownloaded
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPDownloaded"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isCollaborationInvitation
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"com_apple_mobilesms_syndicationContentType"];
  BOOL v4 = [v3 integerValue] > 0;

  return v4;
}

- (NSString)fp_parentDomainIdentifier
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPParentDomainID"];

  return (NSString *)v3;
}

- (BOOL)fp_isUbiquitous
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPIsUbiquitous"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)fp_isLastModifiedByCurrentUser
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPLastModifiedByCurrentUser"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)fp_isContainer
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPIsContainer"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)fp_domainIdentifier
{
  v2 = [(CSSearchableItem *)self->_item attributeSet];
  v3 = [v2 fileProviderDomainIdentifier];
  char v4 = v3;
  if (!v3) {
    v3 = @"NSFileProviderDomainDefaultIdentifier";
  }
  v5 = v3;

  return v5;
}

- (NSString)fp_cloudContainerIdentifier
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPCloudContainerID"];

  return (NSString *)v3;
}

- (id)formerIdentifier
{
  v3 = [(CSSearchableItem *)self->_item attributeSet];
  char v4 = [v3 attributeForKey:@"FPOnDiskIdentifier"];

  if (v4)
  {
    v5 = [(CSSearchableItem *)self->_item uniqueIdentifier];
    id v6 = [(CSSearchableItem *)self->_item attributeSet];
    v7 = [v6 fileProviderDomainIdentifier];
    int v8 = +[FPItemID fpIdentifierFromCoreSpotlightIdentifier:v5 domainIdentifier:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (NSNumber)favoriteRank
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 favoriteRank];

  return (NSNumber *)v3;
}

- (NSError)downloadingError
{
  v3 = [(_CSSearchableItemAdapter *)self attributeSet];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v4 = (void *)getMDItemDownloadErrorSymbolLoc_ptr;
  uint64_t v14 = getMDItemDownloadErrorSymbolLoc_ptr;
  if (!getMDItemDownloadErrorSymbolLoc_ptr)
  {
    v5 = (void *)CoreSpotlightLibrary_1();
    v12[3] = (uint64_t)dlsym(v5, "MDItemDownloadError");
    getMDItemDownloadErrorSymbolLoc_ptr = v12[3];
    char v4 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v4) {
    -[_CSSearchableItemAdapter downloadingError]();
  }
  id v6 = [v3 attributeForKey:*v4];

  if (v6)
  {
    v7 = +[FPSearchableItemError errorFromString:v6];
    int v8 = [(_CSSearchableItemAdapter *)self fileURL];
    id v9 = objc_msgSend(v7, "fp_annotatedErrorWithURL:variant:", v8, 0);
  }
  else
  {
    id v9 = 0;
  }

  return (NSError *)v9;
}

- (NSDate)contentModificationDate
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 contentModificationDate];

  return (NSDate *)v3;
}

- (id)collaborationIdentifier
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPCollaborationIdentifier"];

  return v3;
}

- (NSData)tagData
{
  v3 = [(_CSSearchableItemAdapter *)self tags];
  char v4 = v3;
  if (v3)
  {
    v5 = FPGetTagsDataForTags(v3);
  }
  else
  {
    id v6 = [(_CSSearchableItemAdapter *)self attributeSet];
    v5 = [v6 attributeForKey:@"FPTagsData"];
  }

  return (NSData *)v5;
}

- (void).cxx_destruct
{
}

- (NSDate)creationDate
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 contentCreationDate];

  return (NSDate *)v3;
}

- (NSNumber)childItemCount
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 subItemCount];

  return (NSNumber *)v3;
}

- (NSString)displayName
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

- (NSNumber)documentSize
{
  v3 = [(_CSSearchableItemAdapter *)self attributeSet];
  char v4 = [v3 fileSize];

  if (v4)
  {
    v5 = NSNumber;
    id v6 = [(_CSSearchableItemAdapter *)self attributeSet];
    v7 = [v6 fileSize];
    [v7 doubleValue];
    id v9 = [v5 numberWithDouble:v8 * 1000000.0];
  }
  else
  {
    id v9 = 0;
  }

  return (NSNumber *)v9;
}

- (unint64_t)capabilities
{
  v3 = [(_CSSearchableItemAdapter *)self attributeSet];
  char v4 = [v3 attributeForKey:@"FPCapabilities"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = [(_CSSearchableItemAdapter *)self attributeSet];
  v7 = [v6 attributeForKey:@"FPEvictable"];
  LODWORD(v4) = [v7 BOOLValue];

  if (v4) {
    return v5 | 0x40;
  }
  else {
    return v5;
  }
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return [(CSSearchableItem *)self->_item attributeSet];
}

- (NSString)parentItemIdentifier
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPParentFileItemID"];

  return (NSString *)v3;
}

- (NSString)filename
{
  v3 = [(_CSSearchableItemAdapter *)self attributeSet];
  char v4 = [v3 attributeForKey:@"FPFilename"];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(_CSSearchableItemAdapter *)self item];
    v7 = [v6 attributeSet];
    id v5 = [v7 filename];
  }

  return (NSString *)v5;
}

- (NSDictionary)userInfo
{
  v3 = [(_CSSearchableItemAdapter *)self attributeSet];
  char v4 = [v3 attributeForKey:@"FPUserInfoKeys"];

  if (v4
    && ([(_CSSearchableItemAdapter *)self attributeSet],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 attributeForKey:@"FPUserInfoValues"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = FPDecodeUserInfo(v4, v6);
  }
  else
  {
    v7 = 0;
  }

  return (NSDictionary *)v7;
}

- (_CSSearchableItemAdapter)initWithSearchableItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CSSearchableItemAdapter;
  id v6 = [(_CSSearchableItemAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (NSString)itemIdentifier
{
  v3 = [(CSSearchableItem *)self->_item attributeSet];
  char v4 = [v3 attributeForKey:@"FPOnDiskIdentifier"];

  if (v4)
  {
    id v5 = objc_msgSend(NSString, "fp_fromParsedDiskIdentifier:", objc_msgSend(v4, "integerValue"));
  }
  else
  {
    id v6 = [(CSSearchableItem *)self->_item uniqueIdentifier];
    v7 = [(CSSearchableItem *)self->_item attributeSet];
    double v8 = [v7 fileProviderDomainIdentifier];
    id v5 = +[FPItemID fpIdentifierFromCoreSpotlightIdentifier:v6 domainIdentifier:v8];
  }

  return (NSString *)v5;
}

+ (id)fp_queryFetchAttributes
{
  return +[FPItem fp_queryFetchAttributes];
}

- (id)sharingCurrentUserRole
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 sharedItemCurrentUserRole];

  return v3;
}

- (id)containerSubitemCount
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 subItemCount];

  return v3;
}

- (NSPersonNameComponents)fp_addedByNameComponents
{
  return 0;
}

- (BOOL)fp_isAddedByCurrentUser
{
  return 0;
}

- (NSData)versionIdentifier
{
  v3 = [(_CSSearchableItemAdapter *)self itemVersion];
  char v4 = [v3 contentVersion];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [v3 contentVersion];
  }
  else
  {
    v7 = [(_CSSearchableItemAdapter *)self attributeSet];
    double v8 = [v7 versionIdentifier];

    if (v8) {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
    }
    else {
      id v6 = 0;
    }
  }

  return (NSData *)v6;
}

- (id)sharingCurrentUserPermissions
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPSharingCurrentUserPermissions"];

  return v3;
}

- (id)fp_appContainerBundleIdentifier
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPAppContainerBundleID"];

  return v3;
}

- (BOOL)fp_isContainerPristine
{
  v2 = [(_CSSearchableItemAdapter *)self attributeSet];
  v3 = [v2 attributeForKey:@"FPIsContainerPristine"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (CSSearchableItem)item
{
  return self->_item;
}

- (void)uploadingError
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getMDItemUploadError(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 58, @"%s", dlerror());

  __break(1u);
}

- (void)downloadingError
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getMDItemDownloadError(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 59, @"%s", dlerror());

  __break(1u);
}

@end