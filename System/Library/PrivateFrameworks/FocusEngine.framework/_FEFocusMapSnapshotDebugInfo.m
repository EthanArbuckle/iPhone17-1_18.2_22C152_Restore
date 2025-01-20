@interface _FEFocusMapSnapshotDebugInfo
+ (id)_summaryImageForDebugInfoArray:(id)a3 forFocusMovementWithInfo:(id)a4 scaleFactor:(double)a5;
- (CGPoint)imageAnchorPoint;
- (CGRect)_rectContainingAllFocusRegions;
- (UIImage)image;
- (_FEFocusMapSearchInfo)focusMapSearchInfo;
- (_FEFocusMapSnapshot)snapshot;
- (_FEFocusMapSnapshotDebugInfo)initWithSnapshot:(id)a3 focusMapSearchInfo:(id)a4;
- (id)_drawImage;
@end

@implementation _FEFocusMapSnapshotDebugInfo

- (_FEFocusMapSnapshotDebugInfo)initWithSnapshot:(id)a3 focusMapSearchInfo:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_FEFocusMapSnapshotDebugInfo.m", 32, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_FEFocusMapSnapshotDebugInfo;
  v10 = [(_FEFocusMapSnapshotDebugInfo *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_snapshot, a3);
    objc_storeWeak((id *)&v11->_focusMapSearchInfo, v9);
  }

  return v11;
}

- (UIImage)image
{
  image = self->_image;
  if (!image)
  {
    v4 = [(_FEFocusMapSnapshotDebugInfo *)self _drawImage];
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  return image;
}

- (CGPoint)imageAnchorPoint
{
  id v3 = [(_FEFocusMapSnapshotDebugInfo *)self image];
  double x = self->_imageAnchorPoint.x;
  double y = self->_imageAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_rectContainingAllFocusRegions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [(_FEFocusMapSnapshotDebugInfo *)self snapshot];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = objc_msgSend(v2, "regions", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        [v2 snapshotFrameForRegion:*(void *)(*((void *)&v20 + 1) + 8 * v11)];
        v29.origin.CGFloat x = v12;
        v29.origin.CGFloat y = v13;
        v29.size.CGFloat width = v14;
        v29.size.CGFloat height = v15;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (id)_drawImage
{
  return 0;
}

+ (id)_summaryImageForDebugInfoArray:(id)a3 forFocusMovementWithInfo:(id)a4 scaleFactor:(double)a5
{
  return 0;
}

- (_FEFocusMapSnapshot)snapshot
{
  return self->_snapshot;
}

- (_FEFocusMapSearchInfo)focusMapSearchInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusMapSearchInfo);
  return (_FEFocusMapSearchInfo *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusMapSearchInfo);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end