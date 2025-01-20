@interface AVAssetDownloadCache
- (AVAssetDownloadCache)initWithAsset:(id)a3;
- (BOOL)isDefunct;
- (BOOL)isPlayableOffline;
- (id)URL;
- (id)_asset;
- (id)mediaSelectionOptionsInMediaSelectionGroup:(id)a3;
- (void)dealloc;
@end

@implementation AVAssetDownloadCache

- (AVAssetDownloadCache)initWithAsset:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAssetDownloadCache;
  v4 = [(AVAssetCache *)&v7 _init];
  if (v4)
  {
    v5 = objc_alloc_init(AVAssetDownloadCacheInternal);
    v4->_internal = v5;
    if (!v5 || ([a3 _figAsset], FigAssetCacheInspectorCreate_Remote()))
    {

      return 0;
    }
  }
  return v4;
}

- (id)_asset
{
  return objc_loadWeak((id *)&self->_internal->asset);
}

- (id)URL
{
  v8 = 0;
  uint64_t CMBaseObject = FigAssetCacheInspectorGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(void (**)(uint64_t, void, void, void **))(v4 + 48);
  if (v5)
  {
    v5(CMBaseObject, *MEMORY[0x1E4F31C28], *MEMORY[0x1E4F1CF80], &v8);
    v6 = v8;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)mediaSelectionOptionsInMediaSelectionGroup:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v24 = 0;
  assetCacheInspector = self->_internal->assetCacheInspector;
  uint64_t v7 = [a3 dictionary];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = *(void (**)(CMBaseObject *, uint64_t, void, id *))(v9 + 8);
  if (v10)
  {
    v10(assetCacheInspector, v7, 0, &v24);
    id v11 = v24;
  }
  else
  {
    id v11 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
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
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v17 = (void *)[a3 options];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __67__AVAssetDownloadCache_mediaSelectionOptionsInMediaSelectionGroup___block_invoke;
        v19[3] = &unk_1E57B67E0;
        v19[4] = v16;
        objc_msgSend(v5, "addObject:", objc_msgSend((id)objc_msgSend(a3, "options"), "objectAtIndex:", objc_msgSend(v17, "indexOfObjectPassingTest:", v19)));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }

  return (id)[v5 copy];
}

uint64_t __67__AVAssetDownloadCache_mediaSelectionOptionsInMediaSelectionGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isEqualToDictionary:", objc_msgSend(a2, "dictionary"));
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)isPlayableOffline
{
  uint64_t v8 = 0;
  uint64_t CMBaseObject = FigAssetCacheInspectorGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(void (**)(uint64_t, void, void, uint64_t *))(v4 + 48);
  if (v5)
  {
    v5(CMBaseObject, *MEMORY[0x1E4F31C30], *MEMORY[0x1E4F1CF80], &v8);
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6 == *MEMORY[0x1E4F1CFD0];
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    assetCacheInspector = internal->assetCacheInspector;
    if (assetCacheInspector)
    {
      CFRelease(assetCacheInspector);
      internal = self->_internal;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetDownloadCache;
  [(AVAssetDownloadCache *)&v5 dealloc];
}

- (BOOL)isDefunct
{
  unsigned __int8 v15 = 0;
  if ([(AVAssetDownloadCache *)self _asset])
  {
    uint64_t v3 = objc_msgSend(-[AVAssetDownloadCache _asset](self, "_asset"), "_figAsset");
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    objc_super v5 = v4 ? (void *)v4 : 0;
    if (*v5 < 5uLL) {
      goto LABEL_11;
    }
    uint64_t v6 = (uint64_t (*)(uint64_t, unsigned __int8 *))v5[11];
    if (!v6) {
      goto LABEL_11;
    }
    int v7 = v6(v3, &v15);
    int v8 = v15;
    if (v15) {
      return v8 == 1;
    }
    if (v7)
    {
LABEL_11:
      int v8 = 1;
      return v8 == 1;
    }
  }
  assetCacheInspector = self->_internal->assetCacheInspector;
  v10 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  if (*v11 >= 5uLL
    && (uint64_t v12 = (unsigned int (*)(CMBaseObject *, unsigned __int8 *))v11[11]) != 0
    && v12(assetCacheInspector, &v15) == 0)
  {
    int v8 = v15;
  }
  else
  {
    int v8 = 1;
  }
  if (v15) {
    int v8 = v15;
  }
  return v8 == 1;
}

@end