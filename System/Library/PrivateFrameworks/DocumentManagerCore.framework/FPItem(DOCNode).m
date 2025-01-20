@interface FPItem(DOCNode)
- (id)cachedDomain;
- (id)contentVersion;
- (id)dateForSortingByRecents;
- (id)deepItemCount;
- (id)doc_fallbackSortIdentity;
- (id)domainDisplayName;
- (id)thumbnailIdentifier;
- (uint64_t)_doc_fileTypeCompare:()DOCNode;
- (uint64_t)canPerform:()DOCNode;
- (uint64_t)doc_folderIconType;
- (uint64_t)doc_isSMBSharepoint;
- (uint64_t)fetchFPItem:()DOCNode;
- (uint64_t)isAnyParentTrashed;
- (uint64_t)isCopying;
- (uint64_t)isFullyFormed;
- (uint64_t)isRootItem;
- (uint64_t)localizedStandardTagsCompareNode:()DOCNode;
- (uint64_t)nodeURL;
- (void)encodeNodeWithCoder:()DOCNode;
- (void)fetchParent:()DOCNode;
- (void)fetchParents:()DOCNode;
- (void)fetchURL:()DOCNode;
@end

@implementation FPItem(DOCNode)

- (uint64_t)fetchFPItem:()DOCNode
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a3 + 16))(a3, a1, 0);
}

- (uint64_t)nodeURL
{
  return 0;
}

- (uint64_t)isCopying
{
  v1 = [a1 copyingProgress];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 isFinished] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)dateForSortingByRecents
{
  v2 = objc_msgSend(a1, "doc_lastUsedDate");
  if (v2) {
    objc_msgSend(a1, "doc_lastUsedDate");
  }
  else {
  uint64_t v3 = [a1 modificationDate];
  }

  return v3;
}

- (id)thumbnailIdentifier
{
  v2 = objc_opt_new();
  uint64_t v3 = [a1 itemIdentifier];
  [v2 setNodeIdentifier:v3];

  v4 = [a1 modificationDate];
  [v2 setModificationDate:v4];

  v5 = [a1 contentVersion];
  [v2 setContentVersion:v5];

  objc_msgSend(v2, "setFolderType:", objc_msgSend(a1, "folderType"));
  objc_msgSend(v2, "setIsTopLevelSharedItem:", objc_msgSend(a1, "isTopLevelSharedItem"));
  objc_msgSend(v2, "setIsDownloaded:", objc_msgSend(a1, "isDownloaded"));
  v6 = [a1 filename];
  v7 = [v6 pathExtension];
  [v2 setFileExtension:v7];

  objc_msgSend(v2, "setIsActionable:", objc_msgSend(a1, "isActionable"));
  return v2;
}

- (id)contentVersion
{
  v1 = [a1 itemVersion];
  v2 = [v1 contentVersion];

  return v2;
}

- (id)domainDisplayName
{
  v2 = [a1 cachedDomain];

  if (v2)
  {
    uint64_t v3 = [a1 cachedDomain];
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
  v1 = (void *)MEMORY[0x263F054C8];
  v2 = [a1 providerDomainID];
  uint64_t v3 = [v1 providerDomainWithID:v2 cachePolicy:3 error:0];

  return v3;
}

- (uint64_t)isFullyFormed
{
  v2 = [a1 creationDate];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:-534528000.0];
    int v4 = [v2 isEqual:v3];
  }
  else
  {
    int v4 = [a1 isCopying];
  }

  return v4 ^ 1u;
}

- (uint64_t)isRootItem
{
  v2 = [a1 itemIdentifier];
  if ([v2 isEqualToString:*MEMORY[0x263F053F0]]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = objc_msgSend(a1, "fp_isCloudDocsContainer");
  }

  return v3;
}

- (uint64_t)doc_folderIconType
{
  uint64_t result = [a1 folderType];
  switch(result)
  {
    case 1:
      if ([a1 isTopLevelSharedItem])
      {
        uint64_t result = 5;
      }
      else if (objc_msgSend(a1, "doc_isSMBSharepoint"))
      {
        uint64_t result = 6;
      }
      else
      {
        uint64_t result = 1;
      }
      break;
    case 2:
    case 3:
    case 4:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

- (uint64_t)canPerform:()DOCNode
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((id)*MEMORY[0x263F05038] == v4)
  {
    uint64_t v9 = [a1 capabilities];
    uint64_t v8 = (*MEMORY[0x263F053D8] & ~v9) == 0;
  }
  else
  {
    v5 = [MEMORY[0x263F054C0] defaultManager];
    v11[0] = a1;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v7 = [v5 eligibleActionsForItems:v6];

    uint64_t v8 = [v7 containsObject:v4];
  }

  return v8;
}

- (uint64_t)isAnyParentTrashed
{
  v1 = [a1 fileURL];
  v2 = [v1 path];
  uint64_t v3 = [v2 containsString:@".Trash"];

  return v3;
}

- (id)deepItemCount
{
  v1 = [a1 childItemCount];
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1, "intValue") + 1);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)doc_isSMBSharepoint
{
  v2 = [a1 providerDomainID];
  if (DOCProviderDomainIDIsSharedServerDomainID(v2, v3) && [a1 isRootItem])
  {
    id v4 = [a1 parentItemIdentifier];
    uint64_t v5 = [v4 isEqualToString:*MEMORY[0x263F053F0]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)_doc_fileTypeCompare:()DOCNode
{
  id v4 = a3;
  uint64_t v5 = [a1 contentType];
  v6 = [v4 contentType];

  uint64_t v7 = objc_msgSend(v5, "_doc_fileTypeCompare:", v6);
  return v7;
}

- (uint64_t)localizedStandardTagsCompareNode:()DOCNode
{
  id v4 = objc_msgSend(a3, "fpfs_fpItem");
  uint64_t v5 = [a1 localizedStandardTagsCompare:v4];

  return v5;
}

- (void)encodeNodeWithCoder:()DOCNode
{
  id v4 = a3;
  [v4 encodeInt:0 forKey:@"DOCNodeEncodedTypeKey"];
  [v4 encodeObject:a1 forKey:@"DOCNodeEncodedObjectKey"];
}

- (void)fetchParent:()DOCNode
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F054C0] defaultManager];
  v6 = [a1 itemID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__FPItem_DOCNode__fetchParent___block_invoke;
  v8[3] = &unk_2641B59E8;
  id v9 = v4;
  id v7 = v4;
  [v5 fetchParentsForItemID:v6 recursively:0 completionHandler:v8];
}

- (void)fetchParents:()DOCNode
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F054C0] defaultManager];
  v6 = [a1 itemID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__FPItem_DOCNode__fetchParents___block_invoke;
  v8[3] = &unk_2641B59E8;
  id v9 = v4;
  id v7 = v4;
  [v5 fetchParentsForItemID:v6 recursively:1 completionHandler:v8];
}

- (void)fetchURL:()DOCNode
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F054C0] defaultManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__FPItem_DOCNode__fetchURL___block_invoke;
  v7[3] = &unk_2641B5A10;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchURLForItem:a1 completionHandler:v7];
}

- (id)doc_fallbackSortIdentity
{
  v2 = [a1 providerItemIdentifier];
  uint64_t v3 = [a1 domainIdentifier];
  id v4 = [v2 stringByAppendingString:v3];

  return v4;
}

@end