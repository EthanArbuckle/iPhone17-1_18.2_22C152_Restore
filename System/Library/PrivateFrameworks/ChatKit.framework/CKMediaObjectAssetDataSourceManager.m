@interface CKMediaObjectAssetDataSourceManager
- ($DE30A600513D762F9B6AB73D2AED4B95)_additionalCountInMomentShare:(id)a3 representedCounts:(id *)a4;
- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount;
- (CKMediaObjectAssetDataSource)mediaObjectDataSource;
- (CKMediaObjectAssetDataSourceManager)initWithDataSource:(id)a3;
- (NSURL)momentShareURL;
- (PHMomentShare)momentShare;
- (id)_changeDetailsForDataSource:(id)a3 oldDataSource:(id)a4;
- (void)_handleMomentShareCacheDidChange:(id)a3;
- (void)_handlePreviewDidChangeNotification:(id)a3;
- (void)_mq_handlePreviewDidChangeNotification:(id)a3;
- (void)_setAdditionalItemsCount:(id)a3;
- (void)_updateAdditionalItemsCount;
- (void)_updateMomentShare;
- (void)setMediaObjectDataSource:(id)a3;
- (void)setMediaObjectDataSource:(id)a3 withChangeDetails:(id)a4;
- (void)setMomentShare:(id)a3;
- (void)setMomentShareURL:(id)a3;
@end

@implementation CKMediaObjectAssetDataSourceManager

- (CKMediaObjectAssetDataSourceManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKMediaObjectAssetDataSourceManager;
  v6 = [(PXSectionedDataSourceManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_additionalItemsCount = ($7D1650DB7441A0F5833AC641852B48F3)*MEMORY[0x1E4F90E80];
    objc_storeStrong((id *)&v6->_mediaObjectDataSource, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__handlePreviewDidChangeNotification_ name:@"CKPreviewDidChangeNotification" object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v7 selector:sel__handleMomentShareCacheDidChange_ name:*MEMORY[0x1E4F6BB38] object:0];

    v10 = [(CKMediaObjectAssetDataSource *)v7->_mediaObjectDataSource momentShareURL];
    [(CKMediaObjectAssetDataSourceManager *)v7 setMomentShareURL:v10];
  }
  return v7;
}

- (void)setMediaObjectDataSource:(id)a3
{
}

- (void)setMediaObjectDataSource:(id)a3 withChangeDetails:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  p_mediaObjectDataSource = &self->_mediaObjectDataSource;
  if (([(CKMediaObjectAssetDataSource *)self->_mediaObjectDataSource isEqual:v12] & 1) == 0)
  {
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(CKMediaObjectAssetDataSourceManager *)self _changeDetailsForDataSource:v12 oldDataSource:*p_mediaObjectDataSource];
    }
    v10 = v9;
    objc_storeStrong((id *)&self->_mediaObjectDataSource, a3);
    [(PXSectionedDataSourceManager *)self setDataSource:*p_mediaObjectDataSource changeDetails:v10];
    v11 = [(CKMediaObjectAssetDataSource *)*p_mediaObjectDataSource momentShareURL];
    [(CKMediaObjectAssetDataSourceManager *)self setMomentShareURL:v11];
  }
}

- (id)_changeDetailsForDataSource:(id)a3 oldDataSource:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__57;
    v28 = __Block_byref_object_dispose__57;
    id v29 = 0;
    id v29 = (id)objc_opt_new();
    id v9 = [v5 chatItems];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__CKMediaObjectAssetDataSourceManager__changeDetailsForDataSource_oldDataSource___block_invoke;
    v21[3] = &unk_1E562AA68;
    id v10 = v7;
    id v22 = v10;
    v23 = &v24;
    [v9 enumerateObjectsUsingBlock:v21];

    v11 = (void *)MEMORY[0x1E4F8FFB0];
    id v12 = [v10 chatItems];
    v13 = [v5 chatItems];
    v14 = [v11 changeDetailsFromArray:v12 toArray:v13 changedObjects:v25[5] objectComparator:&__block_literal_global_208];

    id v15 = objc_alloc(MEMORY[0x1E4F90650]);
    uint64_t v16 = [v10 identifier];
    uint64_t v17 = [v5 identifier];
    v18 = [MEMORY[0x1E4F8FFB0] changeDetailsWithNoChanges];
    v30 = &unk_1EDF16B50;
    v31[0] = v14;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v8 = (void *)[v15 initWithFromDataSourceIdentifier:v16 toDataSourceIdentifier:v17 sectionChanges:v18 itemChangeDetailsBySection:v19 subitemChangeDetailsByItemBySection:0];

    _Block_object_dispose(&v24, 8);
  }

  return v8;
}

void __81__CKMediaObjectAssetDataSourceManager__changeDetailsForDataSource_oldDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  v3 = [*(id *)(a1 + 32) chatItemGUIDMap];
  v4 = [v26 IMChatItem];
  id v5 = [v4 guid];
  id v6 = [v3 objectForKey:v5];

  if (v6)
  {
    uint64_t v7 = [v26 visibleAssociatedMessageChatItems];
    v8 = (void *)v7;
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7) {
      id v10 = (void *)v7;
    }
    else {
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v11 = v10;

    uint64_t v12 = [v6 visibleAssociatedMessageChatItems];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = v9;
    }
    id v15 = v14;

    uint64_t v16 = [v11 differenceFromArray:v15];
    uint64_t v17 = [v11 count];
    uint64_t v18 = [v15 count];

    if (v17 != v18) {
      goto LABEL_11;
    }
    if ([v16 hasChanges]) {
      goto LABEL_11;
    }
    v25 = [v6 mediaObject];
    v19 = [v25 transfer];
    v20 = [v19 fileURL];
    v21 = [v26 mediaObject];
    id v22 = [v21 transfer];
    v23 = [v22 fileURL];
    char v24 = CKIsEqual(v20, v23);

    if ((v24 & 1) == 0) {
LABEL_11:
    }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v26];
  }
}

uint64_t __81__CKMediaObjectAssetDataSourceManager__changeDetailsForDataSource_oldDataSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 IMChatItem];
  id v6 = [v5 guid];
  uint64_t v7 = [v4 IMChatItem];

  v8 = [v7 guid];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)setMomentShare:(id)a3
{
  id v5 = (PHMomentShare *)a3;
  if (self->_momentShare != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_momentShare, a3);
    [(CKMediaObjectAssetDataSourceManager *)self _updateAdditionalItemsCount];
    id v5 = v6;
  }
}

- (void)setMomentShareURL:(id)a3
{
  id v5 = (NSURL *)a3;
  momentShareURL = self->_momentShareURL;
  if (momentShareURL != v5)
  {
    v8 = v5;
    char v7 = [(NSURL *)momentShareURL isEqual:v5];
    id v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_momentShareURL, a3);
      [(CKMediaObjectAssetDataSourceManager *)self _updateMomentShare];
      id v5 = v8;
    }
  }
}

- (void)_setAdditionalItemsCount:(id)a3
{
  if (self->_additionalItemsCount.count != a3.var0 || self->_additionalItemsCount.type != a3.var1)
  {
    self->_additionalItemsCount = ($7D1650DB7441A0F5833AC641852B48F3)a3;
    [(CKMediaObjectAssetDataSourceManager *)self signalChange:2];
  }
}

- (void)_updateMomentShare
{
  if (self->_momentShareURL)
  {
    v3 = [MEMORY[0x1E4F6BD40] sharedInstance];
    id v4 = [(NSURL *)self->_momentShareURL absoluteString];
    id v9 = 0;
    id v5 = [v3 momentShareForURLString:v4 error:&v9];
    id v6 = v9;

    if (!v5 && _IMWillLog())
    {
      momentShareURL = self->_momentShareURL;
      id v8 = v6;
      _IMAlwaysLog();
    }
  }
  else
  {
    id v5 = 0;
  }
  -[CKMediaObjectAssetDataSourceManager setMomentShare:](self, "setMomentShare:", v5, momentShareURL, v8);
}

- (void)_updateAdditionalItemsCount
{
  v3 = [(CKMediaObjectAssetDataSourceManager *)self momentShare];
  if (v3)
  {
    long long v11 = 0uLL;
    uint64_t v12 = 0;
    id v4 = [(CKMediaObjectAssetDataSourceManager *)self mediaObjectDataSource];
    id v5 = v4;
    if (v4)
    {
      [v4 assetTypeCounts];
    }
    else
    {
      long long v11 = 0uLL;
      uint64_t v12 = 0;
    }

    long long v9 = v11;
    uint64_t v10 = v12;
    uint64_t v6 = [(CKMediaObjectAssetDataSourceManager *)self _additionalCountInMomentShare:v3 representedCounts:&v9];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F90E80];
    uint64_t v7 = *(void *)(MEMORY[0x1E4F90E80] + 8);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__CKMediaObjectAssetDataSourceManager__updateAdditionalItemsCount__block_invoke;
  v8[3] = &unk_1E562AAB0;
  v8[4] = self;
  v8[5] = v6;
  v8[6] = v7;
  [(CKMediaObjectAssetDataSourceManager *)self performChanges:v8];
}

uint64_t __66__CKMediaObjectAssetDataSourceManager__updateAdditionalItemsCount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAdditionalItemsCount:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- ($DE30A600513D762F9B6AB73D2AED4B95)_additionalCountInMomentShare:(id)a3 representedCounts:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 photosCount];
  unint64_t v7 = [v5 videosCount];
  uint64_t v8 = [v5 assetCount];

  unint64_t v9 = v8 - (v7 + v6);
  uint64_t v10 = v6 - a4->var0;
  if (v6 >= a4->var0
    && (v11 = a4->var1, BOOL v12 = v7 >= v11, v13 = v7 - v11, v12)
    && (v14 = a4->var2, BOOL v12 = v9 >= v14, v15 = v9 - v14, v12))
  {
    if (v13 > 0)
    {
      BOOL v19 = v6 == a4->var0;
      BOOL v20 = v10 < 0;
    }
    else
    {
      BOOL v19 = 1;
      BOOL v20 = 0;
    }
    if ((v20 || v19) && v15 < 1)
    {
      uint64_t v21 = *(void *)(MEMORY[0x1E4F90E80] + 8);
      if (v13 <= 0) {
        uint64_t v13 = *MEMORY[0x1E4F90E80];
      }
      else {
        uint64_t v21 = 2;
      }
      if (v10 <= 0) {
        int64_t v18 = v21;
      }
      else {
        int64_t v18 = 1;
      }
      if (v10 <= 0) {
        unint64_t v17 = v13;
      }
      else {
        unint64_t v17 = v6 - a4->var0;
      }
    }
    else
    {
      int64_t v18 = 0;
      unint64_t v17 = v13 + v10 + v15;
    }
  }
  else
  {
    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unint64_t var0 = a4->var0;
      unint64_t var1 = a4->var1;
      unint64_t var2 = a4->var2;
      int v25 = 134219264;
      unint64_t v26 = v6;
      __int16 v27 = 2048;
      unint64_t v28 = var0;
      __int16 v29 = 2048;
      unint64_t v30 = v7;
      __int16 v31 = 2048;
      unint64_t v32 = var1;
      __int16 v33 = 2048;
      unint64_t v34 = v9;
      __int16 v35 = 2048;
      unint64_t v36 = var2;
      _os_log_error_impl(&dword_18EF18000, v16, OS_LOG_TYPE_ERROR, "Invalid moment share counts vs attachment counts %ld:%ld, %ld:%ld, %ld:%ld", (uint8_t *)&v25, 0x3Eu);
    }

    unint64_t v17 = *MEMORY[0x1E4F90E80];
    int64_t v18 = *(void *)(MEMORY[0x1E4F90E80] + 8);
  }
  result.unint64_t var1 = v18;
  result.unint64_t var0 = v17;
  return result;
}

- (void)_handleMomentShareCacheDidChange:(id)a3
{
  id v9 = a3;
  id v4 = [(CKMediaObjectAssetDataSourceManager *)self momentShareURL];
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 absoluteString];
    unint64_t v7 = [v9 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6BB40]];
    if ([v8 containsObject:v6]) {
      [(CKMediaObjectAssetDataSourceManager *)self _updateMomentShare];
    }
  }
}

- (void)_handlePreviewDidChangeNotification:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(CKMediaObjectAssetDataSourceManager *)self _mq_handlePreviewDidChangeNotification:v4];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__CKMediaObjectAssetDataSourceManager__handlePreviewDidChangeNotification___block_invoke;
    v5[3] = &unk_1E5620AF8;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __75__CKMediaObjectAssetDataSourceManager__handlePreviewDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mq_handlePreviewDidChangeNotification:", *(void *)(a1 + 40));
}

- (void)_mq_handlePreviewDidChangeNotification:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKMediaObjectAssetDataSourceManager *)self mediaObjectDataSource];
  if (v5)
  {
    id v6 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v7 = [v6 isAutoloopVideo];
    }
    else {
      int v7 = 0;
    }
    if (([v6 isMonoskiAsset] & 1) != 0 || v7)
    {
      uint64_t v8 = [v5 mediaObjects];
      uint64_t v9 = [v8 indexOfObject:v6];

      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v10 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v9];
        unint64_t v11 = (void *)[v5 copyRefreshingAssetsAtIndexes:v10];
        id v18 = objc_alloc(MEMORY[0x1E4F90650]);
        uint64_t v17 = [v5 identifier];
        uint64_t v12 = [v11 identifier];
        uint64_t v13 = [MEMORY[0x1E4F8FFB0] changeDetailsWithNoChanges];
        BOOL v19 = &unk_1EDF16B50;
        unint64_t v14 = [MEMORY[0x1E4F8FFB0] changeDetailsWithChangedIndexes:v10];
        v20[0] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
        uint64_t v16 = (void *)[v18 initWithFromDataSourceIdentifier:v17 toDataSourceIdentifier:v12 sectionChanges:v13 itemChangeDetailsBySection:v15 subitemChangeDetailsByItemBySection:0];

        [(CKMediaObjectAssetDataSourceManager *)self setMediaObjectDataSource:v11 withChangeDetails:v16];
      }
    }
  }
}

- (CKMediaObjectAssetDataSource)mediaObjectDataSource
{
  return self->_mediaObjectDataSource;
}

- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount
{
  p_additionalItemsCount = &self->_additionalItemsCount;
  unint64_t count = self->_additionalItemsCount.count;
  int64_t type = p_additionalItemsCount->type;
  result.unint64_t var1 = type;
  result.unint64_t var0 = count;
  return result;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (NSURL)momentShareURL
{
  return self->_momentShareURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShareURL, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);

  objc_storeStrong((id *)&self->_mediaObjectDataSource, 0);
}

@end