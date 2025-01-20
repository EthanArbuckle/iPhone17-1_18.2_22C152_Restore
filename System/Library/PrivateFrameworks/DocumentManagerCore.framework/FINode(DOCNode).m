@interface FINode(DOCNode)
- (BOOL)isFullyFormed;
- (BOOL)isReadable;
- (BOOL)isWritable;
- (__CFString)identifier;
- (id)_buildFetchError;
- (id)cachedDomain;
- (id)copyingProgress;
- (id)dateForSortingByRecents;
- (id)doc_lastUsedDate;
- (id)domainDisplayName;
- (id)domainFromFileURL;
- (id)downloadingError;
- (id)downloadingProgress;
- (id)eligibleActions;
- (id)fileSize;
- (id)providerDomainID;
- (id)providerID;
- (id)syncFetchFPItem:()DOCNode;
- (id)thumbnailIdentifier;
- (id)uploadingError;
- (id)uploadingProgress;
- (uint64_t)_doc_fileTypeCompare:()DOCNode;
- (uint64_t)canPerform:()DOCNode;
- (uint64_t)contentVersion;
- (uint64_t)deepItemCount;
- (uint64_t)doc_fallbackSortIdentity;
- (uint64_t)doc_folderIconType;
- (uint64_t)doc_isCollaborationInvitation;
- (uint64_t)doc_isSMBSharepoint;
- (uint64_t)folderType;
- (uint64_t)isActionable;
- (uint64_t)isAnyParentTrashed;
- (uint64_t)isAppContainer;
- (uint64_t)isCloudItem;
- (uint64_t)isCopying;
- (uint64_t)isDownloaded;
- (uint64_t)isDownloading;
- (uint64_t)isExcludedFromSync;
- (uint64_t)isExternalDownloadPlaceholder;
- (uint64_t)isItemPinned;
- (uint64_t)isPending;
- (uint64_t)isPinnedSubitem;
- (uint64_t)isRecursivelyDownloaded;
- (uint64_t)isRootItem;
- (uint64_t)isUploaded;
- (uint64_t)isUploading;
- (uint64_t)localizedStandardTagsCompareNode:()DOCNode;
- (void)_buildFetchError;
- (void)cachedDomain;
- (void)encodeNodeWithCoder:()DOCNode;
- (void)fetchFPItem:()DOCNode;
- (void)fetchParent:()DOCNode;
- (void)fetchParents:()DOCNode;
- (void)fetchURL:()DOCNode;
@end

@implementation FINode(DOCNode)

- (id)providerDomainID
{
  v2 = [a1 fpDomain];
  v3 = [v2 identifier];

  if (!v3)
  {
    v4 = [a1 fpItem];
    v3 = [v4 providerDomainID];

    if (!v3)
    {
      v5 = [a1 domainFromFileURL];
      v6 = v5;
      if (v5)
      {
        v3 = [v5 identifier];
      }
      else
      {
        v3 = 0;
      }
    }
  }
  return v3;
}

- (id)domainDisplayName
{
  v2 = [a1 cachedDomain];

  if (v2)
  {
    v3 = [a1 cachedDomain];
    v4 = DOCLocalizedDisplayName(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)cachedDomain
{
  v2 = [a1 providerDomainID];

  if (v2)
  {
    v3 = (void *)MEMORY[0x263F054C8];
    v4 = [a1 providerDomainID];
    id v8 = 0;
    v2 = [v3 providerDomainWithID:v4 cachePolicy:3 error:&v8];
    id v5 = v8;

    if (v5)
    {
      v6 = docEnumerationLogHandle;
      if (!docEnumerationLogHandle)
      {
        DOCInitLogging();
        v6 = docEnumerationLogHandle;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(FINode(DOCNode) *)v6 cachedDomain];
      }
    }
  }
  return v2;
}

- (uint64_t)doc_isCollaborationInvitation
{
  v2 = [a1 fpItem];

  if (!v2) {
    return 0;
  }
  v3 = [a1 fpItem];
  uint64_t v4 = [v3 isCollaborationInvitation];

  return v4;
}

- (uint64_t)isAnyParentTrashed
{
  return [a1 nodeIsAll:0x800000];
}

- (uint64_t)canPerform:()DOCNode
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F05018]])
  {
    if ([a1 isContainer]) {
      uint64_t v5 = 53252;
    }
    else {
      uint64_t v5 = 20484;
    }
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F05030]])
  {
    uint64_t v5 = 2;
LABEL_21:
    uint64_t v6 = [a1 nodePermissions:v5] != 0;
    goto LABEL_22;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F04FD0]])
  {
    uint64_t v5 = 0x10000;
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F05028]])
  {
    uint64_t v5 = 1;
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F04FD8]])
  {
    uint64_t v5 = 0x400000;
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F05040]])
  {
    uint64_t v5 = 0x200000;
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F05060]])
  {
    uint64_t v5 = 0x800000;
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F05038]])
  {
    uint64_t v5 = 0x100000;
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F05020]])
  {
    uint64_t v5 = 0x2000;
    goto LABEL_21;
  }
  if (([v4 isEqualToString:*MEMORY[0x263F05000]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F05008]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F04FC8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F05048]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F05010]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F05050]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F04FE0]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F04FF0]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F04FE8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F04FF8]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F05058]])
  {
    id v8 = [a1 fpItem];
    v9 = DOCEnumerationLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FINode(DOCNode) canPerform:]();
    }
  }
  else
  {
    id v8 = [a1 fpItem];
    v9 = DOCEnumerationLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FINode(DOCNode) canPerform:]();
    }
  }

  if (v8)
  {
    uint64_t v6 = [v8 canPerform:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_22:

  return v6;
}

- (__CFString)identifier
{
  v2 = [a1 fileURL];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 description];
  }
  else
  {
    uint64_t v5 = [a1 fpItem];
    uint64_t v6 = v5;
    if (v5)
    {
      id v4 = [v5 identifier];
    }
    else
    {
      id v4 = @"UNKNOWN";
    }
  }
  return v4;
}

- (id)thumbnailIdentifier
{
  v2 = objc_opt_new();
  v3 = [a1 identifier];
  [v2 setNodeIdentifier:v3];

  id v4 = [a1 modificationDate];
  [v2 setModificationDate:v4];

  [v2 setContentVersion:0];
  objc_msgSend(v2, "setFolderType:", objc_msgSend(a1, "folderType"));
  objc_msgSend(v2, "setIsTopLevelSharedItem:", objc_msgSend(a1, "isTopLevelSharedItem"));
  objc_msgSend(v2, "setIsDownloaded:", objc_msgSend(a1, "isDownloaded"));
  uint64_t v5 = [a1 filename];
  uint64_t v6 = [v5 pathExtension];
  [v2 setFileExtension:v6];

  objc_msgSend(v2, "setIsActionable:", objc_msgSend(a1, "isActionable"));
  return v2;
}

- (id)fileSize
{
  v2 = [a1 documentSize];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    uint64_t v5 = [a1 fpItem];
    id v4 = [v5 documentSize];
  }
  return v4;
}

- (uint64_t)deepItemCount
{
  uint64_t v2 = [MEMORY[0x263F08B88] isMainThread];
  return [a1 propertyAsNumber:1684237940 async:v2 options:4 error:0];
}

- (uint64_t)folderType
{
  v1 = [a1 fpItem];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 folderType];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)doc_isSMBSharepoint
{
  uint64_t v2 = [a1 providerDomainID];
  if (DOCProviderDomainIDIsSharedServerDomainID(v2, v3) && [a1 isRootItem])
  {
    id v4 = [a1 parent];
    uint64_t v5 = [v4 isRootItem];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)doc_folderIconType
{
  uint64_t v2 = [a1 fpItem];
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v5 = +[DOCFeature dsEnumerationLocal];
    int v6 = [v5 isEnabled];

    if (v6)
    {
      v7 = [a1 filename];
      if ([v7 isEqual:@"Downloads"])
      {
        id v8 = [a1 parent];
        char v9 = [v8 isRootItem];

        if (v9)
        {
          uint64_t v4 = 4;
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    uint64_t v4 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = objc_msgSend(v2, "doc_folderIconType");
LABEL_9:

  return v4;
}

- (id)domainFromFileURL
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 fileURL];
  uint64_t v3 = [v2 path];
  uint64_t v4 = [v3 stringByStandardizingPath];

  uint64_t v5 = +[DOCFeature dsEnumerationLocal];
  int v6 = [v5 isEnabled];

  if (v6)
  {
    v7 = [MEMORY[0x263F397A8] containerNodePathPrefix];
    char v8 = [v4 hasPrefix:v7];

    if (v8)
    {
      char v9 = [MEMORY[0x263F054C8] providerDomainWithID:@"com.apple.FileProvider.LocalStorage" cachePolicy:3 error:0];
      goto LABEL_18;
    }
    if (([v4 hasSuffix:@"/"] & 1) == 0 && objc_msgSend(a1, "isContainer"))
    {
      uint64_t v10 = [v4 stringByAppendingString:@"/"];

      uint64_t v4 = (void *)v10;
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = objc_msgSend(MEMORY[0x263F054C8], "domainPathCache", 0);
  v12 = [v11 allKeys];

  char v9 = (void *)[v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v12);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v16 = [MEMORY[0x263F054C8] domainPathCache];
        v17 = [v16 objectForKeyedSubscript:v15];

        if ([v4 hasPrefix:v17])
        {
          char v9 = [MEMORY[0x263F054C8] providerDomainWithID:v15 cachePolicy:3 error:0];

          goto LABEL_17;
        }
      }
      char v9 = (void *)[v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_17:

LABEL_18:
  return v9;
}

- (id)providerID
{
  uint64_t v2 = [a1 fpDomain];
  uint64_t v3 = [v2 providerID];

  if (!v3)
  {
    uint64_t v4 = [a1 fpItem];
    uint64_t v3 = [v4 providerID];

    if (!v3)
    {
      uint64_t v5 = [a1 domainFromFileURL];
      int v6 = v5;
      if (v5)
      {
        uint64_t v3 = [v5 providerID];
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }
  return v3;
}

- (id)doc_lastUsedDate
{
  uint64_t v2 = [a1 lastUsedDate];
  uint64_t v3 = [MEMORY[0x263EFF910] distantPast];
  char v4 = [v2 isEqualToDate:v3];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [a1 lastUsedDate];
  }
  return v5;
}

- (id)dateForSortingByRecents
{
  uint64_t v2 = objc_msgSend(a1, "doc_lastUsedDate");
  if (v2) {
    objc_msgSend(a1, "doc_lastUsedDate");
  }
  else {
  uint64_t v3 = [a1 modificationDate];
  }

  return v3;
}

- (uint64_t)isActionable
{
  return 1;
}

- (BOOL)isReadable
{
  return [a1 nodePermissions:0x10000] != 0;
}

- (BOOL)isWritable
{
  if ([a1 isContainer]) {
    uint64_t v2 = 53252;
  }
  else {
    uint64_t v2 = 0x8000;
  }
  return [a1 nodePermissions:v2] != 0;
}

- (uint64_t)isPending
{
  return 0;
}

- (BOOL)isFullyFormed
{
  return [a1 nodeIs:4096] != 0;
}

- (uint64_t)isExternalDownloadPlaceholder
{
  v1 = [a1 typeIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.safari.download"];

  return v2;
}

- (uint64_t)isCloudItem
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isCloudItem];

  return v4;
}

- (uint64_t)isRootItem
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isRootItem];

  return v4;
}

- (uint64_t)isAppContainer
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isContainer];

  return v4;
}

- (uint64_t)contentVersion
{
  return 0;
}

- (uint64_t)isDownloading
{
  uint64_t v2 = [a1 fpItem];

  if (v2)
  {
    uint64_t v3 = [a1 fpItem];
    uint64_t v4 = [v3 isDownloading];
  }
  else
  {
    uint64_t v5 = [a1 downloadProgress];
    uint64_t v3 = v5;
    if (v5) {
      uint64_t v4 = [v5 isFinished] ^ 1;
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (uint64_t)isDownloaded
{
  uint64_t v2 = [a1 fpItem];

  if (v2)
  {
    uint64_t v3 = [a1 fpItem];
    uint64_t v4 = [v3 isDownloaded];

    return v4;
  }
  else
  {
    return [a1 propertyAsBool:1685548132];
  }
}

- (uint64_t)isRecursivelyDownloaded
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 1;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isRecursivelyDownloaded];

  return v4;
}

- (id)downloadingProgress
{
  uint64_t v2 = [a1 fpItem];

  if (v2)
  {
    uint64_t v3 = [a1 fpItem];
    uint64_t v4 = [v3 downloadingProgress];
  }
  else
  {
    uint64_t v4 = [a1 downloadProgress];
  }
  return v4;
}

- (id)downloadingError
{
  uint64_t v2 = [a1 fpItem];

  if (v2)
  {
    uint64_t v3 = [a1 fpItem];
    uint64_t v4 = [v3 downloadingError];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (uint64_t)isUploading
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isUploading];

  return v4;
}

- (uint64_t)isUploaded
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 1;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isUploaded];

  return v4;
}

- (id)uploadingProgress
{
  uint64_t v2 = [a1 fpItem];

  if (v2)
  {
    uint64_t v3 = [a1 fpItem];
    uint64_t v4 = [v3 uploadingProgress];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)uploadingError
{
  uint64_t v2 = [a1 fpItem];

  if (v2)
  {
    uint64_t v3 = [a1 fpItem];
    uint64_t v4 = [v3 uploadingError];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)copyingProgress
{
  uint64_t v2 = [a1 fpItem];

  if (v2)
  {
    uint64_t v3 = [a1 fpItem];
    uint64_t v4 = [v3 copyingProgress];
  }
  else
  {
    uint64_t v4 = [a1 copyProgress];
  }
  return v4;
}

- (uint64_t)isCopying
{
  v1 = [a1 copyingProgress];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 isFinished] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)isItemPinned
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isItemPinned];

  return v4;
}

- (uint64_t)isPinnedSubitem
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isPinnedSubitem];

  return v4;
}

- (uint64_t)isExcludedFromSync
{
  uint64_t v2 = [a1 fpItem];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [a1 fpItem];
  uint64_t v4 = [v3 isExcludedFromSync];

  return v4;
}

- (uint64_t)_doc_fileTypeCompare:()DOCNode
{
  id v4 = a3;
  uint64_t v5 = [a1 contentType];
  int v6 = [v4 contentType];

  uint64_t v7 = objc_msgSend(v5, "_doc_fileTypeCompare:", v6);
  return v7;
}

- (uint64_t)localizedStandardTagsCompareNode:()DOCNode
{
  id v4 = a3;
  uint64_t v5 = [a1 fpItem];
  int v6 = objc_msgSend(v4, "fpfs_fpItem");

  uint64_t v7 = [v5 localizedStandardTagsCompare:v6];
  return v7;
}

- (void)encodeNodeWithCoder:()DOCNode
{
  id v4 = a3;
  [v4 encodeInt:1 forKey:@"DOCNodeEncodedTypeKey"];
  [v4 encodeObject:a1 forKey:@"DOCNodeEncodedObjectKey"];
}

- (void)fetchParent:()DOCNode
{
  uint64_t v5 = a3;
  id v6 = [a1 parent];
  ((void (**)(void, id, void))a3)[2](v5, v6, 0);
}

- (void)fetchParents:()DOCNode
{
  char v8 = a3;
  uint64_t v4 = [a1 parent];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    do
    {
      if ([v5 isRootItem]) {
        break;
      }
      [v6 addObject:v5];
      uint64_t v7 = [v5 parent];

      uint64_t v5 = (void *)v7;
    }
    while (v7);
    if ([v5 isRootItem]) {
      [v6 addObject:v5];
    }
    v8[2](v8, v6, 0);
  }
  else
  {
    v8[2](v8, 0, 0);
  }
}

- (void)fetchURL:()DOCNode
{
  uint64_t v5 = a3;
  id v6 = [a1 nodeURL];
  ((void (**)(void, id, void))a3)[2](v5, v6, 0);
}

- (id)_buildFetchError
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSString;
  uint64_t v3 = _DocumentManagerBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"FINode (%@) has no fpItem nor fileURL, impossible to fetch a corresponding FPItem", @"FINode (%@) has no fpItem nor fileURL, impossible to fetch a corresponding FPItem", @"Localizable" value table];
  uint64_t v5 = objc_msgSend(v2, "localizedStringWithFormat:", v4, a1);

  id v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = v5;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v8 = [v6 errorWithDomain:@"com.apple.DocumentManager.Node" code:2 userInfo:v7];

  char v9 = docEnumerationLogHandle;
  if (!docEnumerationLogHandle)
  {
    DOCInitLogging();
    char v9 = docEnumerationLogHandle;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    [(FINode(DOCNode) *)v9 _buildFetchError];
  }

  return v8;
}

- (void)fetchFPItem:()DOCNode
{
  uint64_t v4 = a3;
  uint64_t v5 = [a1 fpItem];
  uint64_t v6 = [a1 fileURL];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else if (v6)
  {
    char v8 = [MEMORY[0x263F054C0] defaultManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __31__FINode_DOCNode__fetchFPItem___block_invoke;
    v10[3] = &unk_2641B5740;
    uint64_t v11 = v4;
    [v8 fetchItemForURL:v7 completionHandler:v10];
  }
  else
  {
    char v9 = [a1 _buildFetchError];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v9);
  }
}

- (id)syncFetchFPItem:()DOCNode
{
  uint64_t v5 = [a1 fpItem];
  uint64_t v6 = [a1 fileURL];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    id v8 = v5;
  }
  else if (v6)
  {
    char v9 = [MEMORY[0x263F054C0] defaultManager];
    id v8 = [v9 itemForURL:v7 error:a3];
  }
  else
  {
    uint64_t v10 = [a1 _buildFetchError];
    uint64_t v11 = v10;
    if (a3) {
      *a3 = v10;
    }

    id v8 = 0;
  }

  return v8;
}

- (id)eligibleActions
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 fpItem];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F054C0] defaultManager];
    v9[0] = v2;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    id v5 = [v3 eligibleActionsForItems:v4];

    goto LABEL_17;
  }
  if ([a1 isContainer]) {
    int v6 = 53252;
  }
  else {
    int v6 = 20484;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  int v7 = [a1 nodePermissions:0x7FFFFFFFLL];
  if ((v7 & v6) != 0) {
    [v5 addObject:*MEMORY[0x263F05018]];
  }
  if ((v7 & 2) != 0)
  {
    [v5 addObject:*MEMORY[0x263F05030]];
    if ((v7 & 0x10000) == 0)
    {
LABEL_10:
      if ((v7 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  else if ((v7 & 0x10000) == 0)
  {
    goto LABEL_10;
  }
  [v5 addObject:*MEMORY[0x263F04FD0]];
  if ((v7 & 1) == 0)
  {
LABEL_11:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v5 addObject:*MEMORY[0x263F05028]];
  if ((v7 & 0x400000) == 0)
  {
LABEL_12:
    if ((v7 & 0x200000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v5 addObject:*MEMORY[0x263F04FD8]];
  if ((v7 & 0x200000) == 0)
  {
LABEL_13:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v5 addObject:*MEMORY[0x263F05040]];
  if ((v7 & 0x800000) == 0)
  {
LABEL_14:
    if ((v7 & 0x100000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v5 addObject:*MEMORY[0x263F05060]];
  if ((v7 & 0x100000) == 0)
  {
LABEL_15:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_26:
  [v5 addObject:*MEMORY[0x263F05038]];
  if ((v7 & 0x2000) != 0) {
LABEL_16:
  }
    [v5 addObject:*MEMORY[0x263F05020]];
LABEL_17:

  return v5;
}

- (uint64_t)doc_fallbackSortIdentity
{
  return [NSNumber numberWithLong:a1];
}

- (void)cachedDomain
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a1;
  int v6 = [a2 providerDomainID];
  int v7 = [a3 localizedDescription];
  int v8 = 138412546;
  char v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_213670000, v5, OS_LOG_TYPE_ERROR, "Error getting domain from domainID: %@, domain error: %@", (uint8_t *)&v8, 0x16u);
}

- (void)_buildFetchError
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138543362;
  int v6 = v4;
  _os_log_fault_impl(&dword_213670000, v3, OS_LOG_TYPE_FAULT, "FPItem bridging error: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)canPerform:()DOCNode .cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "Unsupported action: %{public}@. Falling back to FPItem: %@");
}

- (void)canPerform:()DOCNode .cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_213670000, v0, v1, "Unknown/Unexpected action: %{public}@. Falling back to FPItem: %@");
}

@end