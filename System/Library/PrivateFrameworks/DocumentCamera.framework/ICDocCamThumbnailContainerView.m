@interface ICDocCamThumbnailContainerView
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (UICollectionView)collectionView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)setCollectionView:(id)a3;
@end

@implementation ICDocCamThumbnailContainerView

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = objc_opt_class();
  v4 = [(ICDocCamThumbnailContainerView *)self collectionView];
  v5 = [v4 collectionViewLayout];
  v6 = DCDynamicCast(v3, (uint64_t)v5);

  v7 = [(ICDocCamThumbnailContainerView *)self collectionView];
  v8 = [v7 dataSource];
  v9 = [(ICDocCamThumbnailContainerView *)self collectionView];
  uint64_t v10 = [v8 collectionView:v9 numberOfItemsInSection:0];

  char v11 = [v6 compactLayout];
  if (v10) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)accessibilityElementsHidden
{
  uint64_t v3 = [(ICDocCamThumbnailContainerView *)self collectionView];
  v4 = [v3 dataSource];
  v5 = [(ICDocCamThumbnailContainerView *)self collectionView];
  uint64_t v6 = [v4 collectionView:v5 numberOfItemsInSection:0];

  return v6 == 0;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(ICDocCamThumbnailContainerView *)self collectionView];
  v4 = [v3 dataSource];
  v5 = [(ICDocCamThumbnailContainerView *)self collectionView];
  uint64_t v6 = [v4 collectionView:v5 numberOfItemsInSection:0];

  v7 = +[DCLocalization localizedStringForKey:@"%lu_SCANNED_IMAGE_THUMBNAILS" value:@"%lu_SCANNED_IMAGE_THUMBNAILS" table:@"Localizable"];
  v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (id)accessibilityHint
{
  if ([(ICDocCamThumbnailContainerView *)self isAccessibilityElement])
  {
    uint64_t v3 = [(ICDocCamThumbnailContainerView *)self collectionView];
    v4 = [v3 dataSource];
    v5 = [(ICDocCamThumbnailContainerView *)self collectionView];
    uint64_t v6 = [v4 collectionView:v5 numberOfItemsInSection:0];

    v7 = +[DCLocalization localizedStringForKey:@"Double-tap to preview %lu scanned images" value:@"Double-tap to preview %lu scanned images" table:@"Localizable"];
    v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)accessibilityFrame
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = (CGRect *)MEMORY[0x263F001A8];
  CGFloat v3 = *MEMORY[0x263F001A8];
  CGFloat v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v7 = [(ICDocCamThumbnailContainerView *)self collectionView];
  v8 = [v7 visibleCells];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        BOOL v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        v31.origin.x = v3;
        v31.origin.y = v4;
        v31.size.width = v5;
        v31.size.height = v6;
        if (CGRectEqualToRect(v31, *v2))
        {
          [v12 accessibilityFrame];
        }
        else
        {
          [v12 accessibilityFrame];
          v34.origin.x = v17;
          v34.origin.y = v18;
          v34.size.width = v19;
          v34.size.height = v20;
          v32.origin.x = v3;
          v32.origin.y = v4;
          v32.size.width = v5;
          v32.size.height = v6;
          *(CGRect *)&CGFloat v13 = CGRectUnion(v32, v34);
        }
        CGFloat v3 = v13;
        CGFloat v4 = v14;
        CGFloat v5 = v15;
        CGFloat v6 = v16;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  double v21 = v3;
  double v22 = v4;
  double v23 = v5;
  double v24 = v6;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end