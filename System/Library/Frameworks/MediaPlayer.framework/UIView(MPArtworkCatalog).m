@interface UIView(MPArtworkCatalog)
- (id)artworkCatalog;
- (void)clearArtworkCatalogs;
@end

@implementation UIView(MPArtworkCatalog)

- (void)clearArtworkCatalogs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [a1 artworkCatalog];
  v3 = v2;
  if (v2)
  {
    [v2 _clearDestination];
    objc_setAssociatedObject(a1, (const void *)_MPArtworkCatalogLastAssociatedObjectKey, v3, (void *)1);
    objc_setAssociatedObject(a1, (const void *)MPArtworkCatalogAssociatedObjectKey, 0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__UIView_MPArtworkCatalog__clearArtworkCatalogs__block_invoke;
    block[3] = &unk_1E57F9F98;
    id v14 = v3;
    v15 = a1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = objc_msgSend(a1, "subviews", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) clearArtworkCatalogs];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)artworkCatalog
{
  return objc_getAssociatedObject(a1, (const void *)MPArtworkCatalogAssociatedObjectKey);
}

@end