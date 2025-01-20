@interface CKMediaObjectAssetDataSource
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetTypeCounts;
- (CKMediaObjectAssetDataSource)initWithChatItems:(id)a3 parentChatItemGUID:(id)a4;
- (CKMediaObjectAssetDataSource)initWithChatItems:(id)a3 parentChatItemGUID:(id)a4 displayAssets:(id)a5 chatItemGUIDMap:(id)a6;
- (NSArray)chatItems;
- (NSArray)displayAssets;
- (NSArray)mediaObjects;
- (NSDictionary)chatItemGUIDMap;
- (NSString)parentChatItemGUID;
- (NSURL)momentShareURL;
- (PXDisplayAssetCollection)assetCollection;
- (PXSimpleIndexPath)_indexPathForMediaObject:(SEL)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)assetReferenceForMediaObject:(id)a3;
- (id)chatItemForAsset:(id)a3;
- (id)chatItemForAssetReference:(id)a3;
- (id)copyRefreshingAssetsAtIndexes:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (id)temporaryChatItemForAssetReference:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
- (void)setAssetCollection:(id)a3;
- (void)setChatItemGUIDMap:(id)a3;
- (void)setChatItems:(id)a3;
- (void)setDisplayAssets:(id)a3;
- (void)setParentChatItemGUID:(id)a3;
@end

@implementation CKMediaObjectAssetDataSource

- (CKMediaObjectAssetDataSource)initWithChatItems:(id)a3 parentChatItemGUID:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __69__CKMediaObjectAssetDataSource_initWithChatItems_parentChatItemGUID___block_invoke;
  v18 = &unk_1E562BAB0;
  id v19 = v9;
  id v20 = v10;
  id v11 = v10;
  id v12 = v9;
  [v8 enumerateObjectsUsingBlock:&v15];
  v13 = -[CKMediaObjectAssetDataSource initWithChatItems:parentChatItemGUID:displayAssets:chatItemGUIDMap:](self, "initWithChatItems:parentChatItemGUID:displayAssets:chatItemGUIDMap:", v8, v7, v12, v11, v15, v16, v17, v18);

  return v13;
}

void __69__CKMediaObjectAssetDataSource_initWithChatItems_parentChatItemGUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [[CKMediaObjectBackedAsset alloc] initWithChatItem:v3];
  [*(id *)(a1 + 32) addObject:v7];
  v4 = *(void **)(a1 + 40);
  v5 = [v3 IMChatItem];
  v6 = [v5 guid];
  [v4 setValue:v3 forKey:v6];
}

- (CKMediaObjectAssetDataSource)initWithChatItems:(id)a3 parentChatItemGUID:(id)a4 displayAssets:(id)a5 chatItemGUIDMap:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CKMediaObjectAssetDataSource;
  v14 = [(CKMediaObjectAssetDataSource *)&v20 init];
  uint64_t v15 = v14;
  if (v14)
  {
    [(CKMediaObjectAssetDataSource *)v14 setParentChatItemGUID:v11];
    [(CKMediaObjectAssetDataSource *)v15 setChatItems:v10];
    uint64_t v16 = (void *)[v13 copy];
    [(CKMediaObjectAssetDataSource *)v15 setChatItemGUIDMap:v16];

    v17 = (void *)[v12 copy];
    [(CKMediaObjectAssetDataSource *)v15 setDisplayAssets:v17];

    v18 = objc_alloc_init(CKMediaObjectAssetCollection);
    [(CKMediaObjectAssetDataSource *)v15 setAssetCollection:v18];
  }
  return v15;
}

- (id)copyRefreshingAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  v5 = [(CKMediaObjectAssetDataSource *)self chatItems];
  v6 = [(CKMediaObjectAssetDataSource *)self displayAssets];
  id v7 = (void *)[v6 mutableCopy];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __62__CKMediaObjectAssetDataSource_copyRefreshingAssetsAtIndexes___block_invoke;
  v18 = &unk_1E56240E0;
  id v19 = v5;
  id v20 = v7;
  id v8 = v7;
  id v9 = v5;
  [v4 enumerateIndexesUsingBlock:&v15];

  id v10 = [CKMediaObjectAssetDataSource alloc];
  id v11 = [(CKMediaObjectAssetDataSource *)self parentChatItemGUID];
  id v12 = [(CKMediaObjectAssetDataSource *)self chatItemGUIDMap];
  id v13 = [(CKMediaObjectAssetDataSource *)v10 initWithChatItems:v9 parentChatItemGUID:v11 displayAssets:v8 chatItemGUIDMap:v12];

  return v13;
}

void __62__CKMediaObjectAssetDataSource_copyRefreshingAssetsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v4 = [[CKMediaObjectBackedAsset alloc] initWithChatItem:v5];
  [*(id *)(a1 + 40) replaceObjectAtIndex:a2 withObject:v4];
}

- (NSArray)mediaObjects
{
  mediaObjects = self->_mediaObjects;
  if (!mediaObjects)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v5 = [(CKMediaObjectAssetDataSource *)self chatItems];
    v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    id v7 = [(CKMediaObjectAssetDataSource *)self chatItems];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__CKMediaObjectAssetDataSource_mediaObjects__block_invoke;
    v12[3] = &unk_1E5627290;
    id v13 = v6;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:v12];

    id v9 = (NSArray *)[v8 copy];
    id v10 = self->_mediaObjects;
    self->_mediaObjects = v9;

    mediaObjects = self->_mediaObjects;
  }

  return mediaObjects;
}

void __44__CKMediaObjectAssetDataSource_mediaObjects__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaObject];
  [*(id *)(a1 + 32) addObject:v3];
}

- (NSURL)momentShareURL
{
  momentShareURL = self->_momentShareURL;
  if (!momentShareURL)
  {
    if (self->_hasCheckedForMomentShareURL)
    {
      momentShareURL = 0;
    }
    else
    {
      self->_hasCheckedForMomentShareURL = 1;
      id v4 = [(CKMediaObjectAssetDataSource *)self mediaObjects];
      CKMomentShareURLForMediaObjects(v4);
      id v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v6 = self->_momentShareURL;
      self->_momentShareURL = v5;

      momentShareURL = self->_momentShareURL;
    }
  }

  return momentShareURL;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetTypeCounts
{
  id v3 = self;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!BYTE1(self[5].var2))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self displayAssets];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      unint64_t v9 = 0;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * i) mediaType];
          if (v13 == 2)
          {
            ++v8;
          }
          else if (v13 == 1)
          {
            ++v10;
          }
          else
          {
            ++v9;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v8 = 0;
      unint64_t v9 = 0;
      unint64_t v10 = 0;
    }

    v3[8].var1 = v10;
    v3[8].var2 = v8;
    v3[9].var0 = v9;
    BYTE1(v3[5].var2) = 1;
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v3[8].var1;
  retstr->var2 = v3[9].var0;
  return self;
}

- (id)assetReferenceForMediaObject:(id)a3
{
  long long v7 = 0u;
  long long v8 = 0u;
  [(CKMediaObjectAssetDataSource *)self _indexPathForMediaObject:a3];
  if (*MEMORY[0x1E4F90E60])
  {
    v6[0] = v7;
    v6[1] = v8;
    id v4 = [(CKMediaObjectAssetDataSource *)self assetReferenceAtItemIndexPath:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)chatItemForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 indexPath];
    unint64_t v6 = v16;
  }
  else
  {
    unint64_t v6 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  long long v7 = [(CKMediaObjectAssetDataSource *)self chatItems];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    uint64_t v11 = 0;
  }
  else
  {
    unint64_t v9 = [(CKMediaObjectAssetDataSource *)self chatItems];
    if (v5)
    {
      [v5 indexPath];
      uint64_t v10 = v14;
    }
    else
    {
      uint64_t v10 = 0;
      long long v13 = 0u;
      long long v14 = 0u;
    }
    uint64_t v11 = objc_msgSend(v9, "objectAtIndex:", v10, v13, v14, v15, v16);
  }

  return v11;
}

- (id)chatItemForAsset:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__68;
    long long v17 = __Block_byref_object_dispose__68;
    id v18 = 0;
    unint64_t v6 = [(CKMediaObjectAssetDataSource *)self chatItems];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__CKMediaObjectAssetDataSource_chatItemForAsset___block_invoke;
    v10[3] = &unk_1E562AA68;
    id v7 = v5;
    id v11 = v7;
    id v12 = &v13;
    [v6 enumerateObjectsUsingBlock:v10];

    id v8 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __49__CKMediaObjectAssetDataSource_chatItemForAsset___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = [v12 mediaObject];
  id v8 = [v7 transfer];
  unint64_t v9 = [v8 attributionInfo];
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F6D3F0]];

  id v11 = [*(id *)(a1 + 32) uuid];
  LODWORD(v8) = [v10 isEqualToString:v11];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)temporaryChatItemForAssetReference:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [CKTransientAttachmentMessagePartChatItem alloc];
  unint64_t v6 = [(CKMediaObjectAssetDataSource *)self parentChatItemGUID];
  id v7 = [(CKTransientAttachmentMessagePartChatItem *)v5 initWithParentChatItem:v6];

  v24[0] = *MEMORY[0x1E4F6D3F0];
  id v8 = [v4 asset];

  unint64_t v9 = [v8 uuid];
  v25[0] = v9;
  v24[1] = *MEMORY[0x1E4F6D420];
  uint64_t v10 = NSNumber;
  id v11 = [(CKMediaObjectAssetDataSource *)self chatItems];
  id v12 = [v11 firstObject];
  uint64_t v13 = [v12 message];
  long long v14 = [v13 fileTransferGUIDs];
  uint64_t v15 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v25[1] = v15;
  long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  long long v17 = [[CKTransientFileTransfer alloc] initWithAttributionInfo:v16];
  id v18 = [[CKMediaObject alloc] initWithTransfer:v17 context:0 forceInlinePreview:0];
  [(CKAttachmentMessagePartChatItem *)v7 setMediaObject:v18];
  uint64_t v19 = [(CKMediaObjectAssetDataSource *)self chatItems];
  id v20 = [v19 firstObject];
  v21 = [v20 message];
  v22 = [v21 guid];
  [(CKTransientAttachmentMessagePartChatItem *)v7 setParentGUID:v22];

  return v7;
}

- (PXSimpleIndexPath)_indexPathForMediaObject:(SEL)a3
{
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F91028] + 16);
  *(_OWORD *)&retstr->dataSourceIdentifier = *MEMORY[0x1E4F91028];
  *(_OWORD *)&retstr->item = v6;
  id v7 = a4;
  id v8 = [(CKMediaObjectAssetDataSource *)self mediaObjects];
  int64_t v9 = [v8 indexOfObject:v7];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    result = (PXSimpleIndexPath *)[(CKMediaObjectAssetDataSource *)self identifier];
    retstr->dataSourceIdentifier = (int64_t)result;
    retstr->section = 0;
    retstr->item = v9;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412802;
        id v10 = (id)objc_opt_class();
        __int16 v11 = 2080;
        id v12 = "-[CKMediaObjectAssetDataSource numberOfItemsInSection:]";
        __int16 v13 = 2048;
        int64_t v14 = a3;
        id v5 = v10;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%@ %s asked for section %ld, does not exist!", (uint8_t *)&v9, 0x20u);
      }
    }
    return 0;
  }
  else
  {
    id v7 = [(CKMediaObjectAssetDataSource *)self mediaObjects];
    int64_t v8 = [v7 count];

    return v8;
  }
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3->dataSourceIdentifier != *MEMORY[0x1E4F90E60])
  {
    if (a3->item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a3->section != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v8 = [(CKMediaObjectAssetDataSource *)self assetCollection];
        goto LABEL_7;
      }
    }
    else if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = [(CKMediaObjectAssetDataSource *)self displayAssets];
      int64_t v8 = [v10 objectAtIndex:a3->item];

      goto LABEL_7;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = objc_opt_class();
      int64_t section = a3->section;
      int v11 = 138412802;
      id v12 = v5;
      __int16 v13 = 2080;
      int64_t v14 = "-[CKMediaObjectAssetDataSource objectAtIndexPath:]";
      __int16 v15 = 2048;
      int64_t v16 = section;
      id v7 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%@ %s asked for section %ld, does not exist!", (uint8_t *)&v11, 0x20u);
    }
  }
  int64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3->dataSourceIdentifier != *MEMORY[0x1E4F90E60]
    && a3->section != 0x7FFFFFFFFFFFFFFFLL
    && a3->item == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v11 = [(CKMediaObjectAssetDataSource *)self displayAssets];
    id v10 = PXDisplayAssetFetchResultFromArray();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = objc_opt_class();
        int64_t section = a3->section;
        int v13 = 138412802;
        int64_t v14 = v7;
        __int16 v15 = 2080;
        int64_t v16 = "-[CKMediaObjectAssetDataSource objectsInIndexPath:]";
        __int16 v17 = 2048;
        int64_t v18 = section;
        id v9 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%@ %s asked for section %ld, does not exist!", (uint8_t *)&v13, 0x20u);
      }
    }
    id v10 = 0;
  }

  return v10;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6 = a4;
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  v12.receiver = self;
  v12.super_class = (Class)CKMediaObjectAssetDataSource;
  [(PXSimpleIndexPath *)&v12 indexPathForObjectReference:v6];
  if (retstr->dataSourceIdentifier == *MEMORY[0x1E4F90E60])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 asset];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v8 = [v7 mediaObject];
        [(CKMediaObjectAssetDataSource *)self _indexPathForMediaObject:v8];
        *(_OWORD *)&retstr->dataSourceIdentifier = v10;
        *(_OWORD *)&retstr->item = v11;
      }
    }
  }

  return result;
}

- (NSString)parentChatItemGUID
{
  return self->_parentChatItemGUID;
}

- (void)setParentChatItemGUID:(id)a3
{
}

- (NSArray)chatItems
{
  return self->_chatItems;
}

- (void)setChatItems:(id)a3
{
}

- (NSDictionary)chatItemGUIDMap
{
  return self->_chatItemGUIDMap;
}

- (void)setChatItemGUIDMap:(id)a3
{
}

- (NSArray)displayAssets
{
  return self->_displayAssets;
}

- (void)setDisplayAssets:(id)a3
{
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_chatItemGUIDMap, 0);
  objc_storeStrong((id *)&self->_chatItems, 0);
  objc_storeStrong((id *)&self->_parentChatItemGUID, 0);
  objc_storeStrong((id *)&self->_mediaObjects, 0);

  objc_storeStrong((id *)&self->_momentShareURL, 0);
}

@end