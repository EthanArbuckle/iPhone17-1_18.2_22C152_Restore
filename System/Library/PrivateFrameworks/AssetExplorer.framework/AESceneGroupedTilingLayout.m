@interface AESceneGroupedTilingLayout
- (AEBrowserLayoutDelegate)delegate;
- (AEProgressViewModelSnapshot)progressSnapshot;
- (AESceneGroupedTilingLayout)initWithDataSource:(id)a3 layoutStyle:(int64_t)a4 gradientTileInfo:(id)a5 orientation:(int64_t)a6;
- (AESceneGroupedTilingLayout)initWithDataSource:(id)a3 layoutStyle:(int64_t)a4 orientation:(int64_t)a5;
- (AETileLayoutInfo)_gradientTileLayoutInfo;
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (BOOL)isPortraitOrientation;
- (CGPoint)_boundedVisibleOrigin;
- (CGRect)_frameForGridTile:(int64_t)a3 inSection:(int64_t)a4;
- (CGRect)_gradientShadowFrameForItemFrame:(CGRect)result;
- (CGRect)_progressFrameForGridTileFrame:(CGRect)a3;
- (CGRect)contentBounds;
- (CGSize)_safeReferenceSize;
- (PXTileGeometry)_geometryWithFrame:(SEL)a3 alpha:(CGRect)a4 zPosition:(double)a5;
- (double)_zPositionForDecorativeTileSubitem:(unint64_t)a3;
- (int64_t)_thumbnailRowsForCurrentLayoutStyle;
- (int64_t)layoutStyle;
- (void)_invalidateBadgeDecorations;
- (void)dealloc;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)prepareLayout;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setPortraitOrientation:(BOOL)a3;
- (void)setProgressSnapshot:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setSelectedIndexPaths:(id)a3;
- (void)setVisibleOrigin:(CGPoint)a3;
@end

@implementation AESceneGroupedTilingLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__gradientTileLayoutInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressSnapshot, 0);
}

- (AETileLayoutInfo)_gradientTileLayoutInfo
{
  return self->__gradientTileLayoutInfo;
}

- (BOOL)isPortraitOrientation
{
  return self->_portraitOrientation;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setDelegate:(id)a3
{
}

- (AEBrowserLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AEBrowserLayoutDelegate *)WeakRetained;
}

- (AEProgressViewModelSnapshot)progressSnapshot
{
  return self->_progressSnapshot;
}

- (CGRect)_progressFrameForGridTileFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRectGetMaxX(a3);
  UIRoundToViewScale();
  double v8 = v7;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRectGetMaxY(v14);
  UIRoundToViewScale();
  double v10 = v9;
  double v11 = 26.0;
  double v12 = 26.0;
  double v13 = v8;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_frameForGridTile:(int64_t)a3 inSection:(int64_t)a4
{
  [(AESceneGroupedTilingLayout *)self _thumbnailRowsForCurrentLayoutStyle];
  [(AESceneGroupedTilingLayout *)self _safeReferenceSize];
  [(AESceneGroupedTilingLayout *)self layoutStyle];
  UIRoundToViewScale();
  double v6 = v5;
  UIRoundToViewScale();
  double v8 = v7;
  UIRoundToViewScale();
  double v10 = v9;
  double v11 = v8;
  double v12 = v6;
  double v13 = v6;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)_gradientShadowFrameForItemFrame:(CGRect)result
{
  double v3 = result.origin.y + result.size.height - self->_cachedGradientOverlaySize.height;
  double height = self->_cachedGradientOverlaySize.height;
  result.size.double height = height;
  result.origin.CGFloat y = v3;
  return result;
}

- (double)_zPositionForDecorativeTileSubitem:(unint64_t)a3
{
  if (a3 == 5) {
    return 1.0;
  }
  double result = 0.0;
  if (a3 == 6) {
    abort();
  }
  return result;
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  unint64_t v11 = a6->var1[0];
  if (a6->var0 == 5 && v11 == *MEMORY[0x263F5E200])
  {
    unint64_t v13 = a6->var1[1];
    CGRect v14 = [(PXAssetsTilingLayout *)self dataSource];
    uint64_t v15 = [v14 identifier];

    if (v13 == v15)
    {
      [(AESceneGroupedTilingLayout *)self _frameForGridTile:a6->var1[3] inSection:a6->var1[2]];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      v24 = 0;
      double v25 = 0.0;
      unint64_t v26 = 66059;
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    unint64_t v11 = a6->var1[0];
  }
  if (v11 != 795209731)
  {
    if (v11 != 112112321)
    {
LABEL_26:
      v68.receiver = self;
      v68.super_class = (Class)AESceneGroupedTilingLayout;
      CGSize v63 = *(CGSize *)&a6->var1[5];
      CGPoint v71 = *(CGPoint *)&a6->var1[3];
      CGSize v72 = v63;
      long long v73 = *(_OWORD *)&a6->var1[7];
      *(void *)&long long v74 = a6->var1[9];
      CGSize v64 = *(CGSize *)&a6->var1[1];
      CGPoint v69 = *(CGPoint *)&a6->var0;
      CGSize v70 = v64;
      BOOL v62 = [(PXAssetsTilingLayout *)&v68 getGeometry:a3 group:a4 userData:a5 forTileWithIdentifier:&v69];
      v24 = 0;
      goto LABEL_27;
    }
    unint64_t v27 = a6->var1[1];
    unint64_t v28 = a6->var1[2];
    unint64_t v29 = a6->var1[3];
    unint64_t v30 = a6->var1[4];
    v31 = [(AESceneGroupedTilingLayout *)self progressSnapshot];
    *(void *)&v69.CGFloat x = v27;
    *(void *)&v69.CGFloat y = v28;
    *(void *)&v70.CGFloat width = v29;
    *(void *)&v70.double height = v30;
    if ([v31 hasProgressForIndexPath:&v69])
    {
      [(AESceneGroupedTilingLayout *)self _frameForGridTile:v29 inSection:v28];
      -[AESceneGroupedTilingLayout _progressFrameForGridTileFrame:](self, "_progressFrameForGridTileFrame:");
      double v17 = v32;
      double v19 = v33;
      double v21 = v34;
      double v23 = v35;
      [(AESceneGroupedTilingLayout *)self _zPositionForDecorativeTileSubitem:5];
      double v25 = v36;

      v24 = 0;
      unint64_t v26 = 855060;
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_25:

    goto LABEL_26;
  }
  v67 = a4;
  unint64_t v37 = a6->var1[3];
  unint64_t v38 = a6->var1[4];
  unint64_t v39 = a6->var1[2];
  [(AESceneGroupedTilingLayout *)self _frameForGridTile:v37 inSection:v39];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  unint64_t v48 = a6->var1[1];
  v31 = [(AESceneGroupedTilingLayout *)self delegate];
  *(void *)&v69.CGFloat x = v48;
  *(void *)&v69.CGFloat y = v39;
  *(void *)&v70.CGFloat width = v37;
  v70.double height = NAN;
  unsigned int v66 = [v31 layout:self shouldShowVideoDecorationAtIndexPath:&v69];
  *(void *)&v69.CGFloat x = v48;
  *(void *)&v69.CGFloat y = v39;
  *(void *)&v70.CGFloat width = v37;
  v70.double height = NAN;
  uint64_t v49 = [v31 layout:self shouldShowCloudDecorationAtIndexPath:&v69];
  *(void *)&v69.CGFloat x = v48;
  *(void *)&v69.CGFloat y = v39;
  *(void *)&v70.CGFloat width = v37;
  v70.double height = NAN;
  uint64_t v50 = [v31 layout:self shouldShowLoopDecorationAtIndexPath:&v69];
  [(AESceneGroupedTilingLayout *)self _zPositionForDecorativeTileSubitem:v38];
  if (v38 != 5 || !(v49 | v66))
  {
    a4 = v67;
    goto LABEL_25;
  }
  double v25 = v51;
  -[AESceneGroupedTilingLayout _gradientShadowFrameForItemFrame:](self, "_gradientShadowFrameForItemFrame:", v41, v43, v45, v47);
  double v17 = v52;
  double v19 = v53;
  double v21 = v54;
  double v23 = v55;
  v24 = [[AEGridOverlayConfiguration alloc] initWithShowCloudDecoration:v49 showVideoDecoration:v66 showLoopDecoration:v50];

  unint64_t v26 = 136507;
  a4 = v67;
  if (a3)
  {
LABEL_18:
    -[AESceneGroupedTilingLayout _geometryWithFrame:alpha:zPosition:](self, "_geometryWithFrame:alpha:zPosition:", v17, v19, v21, v23, 1.0, v25);
    long long v56 = v78;
    *(_OWORD *)&a3->var6 = v77;
    *(_OWORD *)&a3->var7.double height = v56;
    long long v57 = v80;
    *(_OWORD *)&a3->var8.origin.CGFloat y = v79;
    *(_OWORD *)&a3->var8.size.double height = v57;
    long long v58 = v74;
    *(_OWORD *)&a3->var3.a = v73;
    *(_OWORD *)&a3->var3.c = v58;
    long long v59 = v76;
    *(_OWORD *)&a3->var3.tCGFloat x = v75;
    *(_OWORD *)&a3->var4 = v59;
    CGSize v60 = v70;
    a3->var0.origin = v69;
    a3->var0.size = v60;
    CGSize v61 = v72;
    a3->var1 = v71;
    a3->var2 = v61;
  }
LABEL_19:
  if (a4) {
    *a4 = v26;
  }
  if (a5)
  {
    v24 = v24;
    *a5 = v24;
  }
  BOOL v62 = 1;
LABEL_27:

  return v62;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  long long v78 = a5;
  double v12 = [(PXAssetsTilingLayout *)self dataSource];
  uint64_t v13 = [v12 identifier];

  long long v77 = [(PXTilingLayout *)self coordinateSpaceIdentifier];
  v106[0] = 0;
  CGPoint v71 = v11;
  CGRect v14 = [v11 tileGroups];
  v108.origin.CGFloat x = x;
  v108.origin.CGFloat y = y;
  v108.size.CGFloat width = width;
  v108.size.CGFloat height = height;
  if (CGRectIntersectsRect(*self->_sectionBounds, v108))
  {
    uint64_t v15 = [(PXAssetsTilingLayout *)self dataSource];
    uint64_t v16 = [v15 numberOfItemsInSection:0];

    if (v16 >= 1)
    {
      uint64_t v65 = *MEMORY[0x263F5E200];
      uint64_t v17 = 1;
      long long v62 = xmmword_22B5480D0;
      double v68 = width;
      double v69 = height;
      double v66 = x;
      double v67 = y;
      uint64_t v70 = v16;
      do
      {
        -[AESceneGroupedTilingLayout _frameForGridTile:inSection:](self, "_frameForGridTile:inSection:", v17 - 1, 0, v62);
        double v18 = v107.origin.x;
        double v19 = v107.origin.y;
        double v20 = v107.size.width;
        double v21 = v107.size.height;
        v109.origin.CGFloat x = x;
        v109.origin.CGFloat y = y;
        v109.size.CGFloat width = width;
        v109.size.CGFloat height = height;
        if (CGRectIntersectsRect(v107, v109))
        {
          memset(v105, 0, sizeof(v105));
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          *(double *)&long long v97 = v18;
          *((double *)&v97 + 1) = v19;
          *(double *)&long long v98 = v20;
          *((double *)&v98 + 1) = v21;
          PXRectGetCenter();
          *(void *)&long long v99 = v22;
          *((void *)&v99 + 1) = v23;
          *(double *)&long long v100 = v20;
          *((double *)&v100 + 1) = v21;
          long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
          long long v76 = *MEMORY[0x263F000D0];
          long long v101 = *MEMORY[0x263F000D0];
          long long v102 = v24;
          long long v73 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
          long long v74 = v24;
          long long v103 = v73;
          long long v104 = xmmword_22B5480C0;
          *(_OWORD *)((char *)v105 + 8) = v100;
          long long v25 = *(_OWORD *)(MEMORY[0x263F5E218] + 16);
          long long v75 = *MEMORY[0x263F5E218];
          *(_OWORD *)((char *)&v105[1] + 8) = *MEMORY[0x263F5E218];
          *(_OWORD *)((char *)&v105[2] + 8) = v25;
          long long v72 = v25;
          *((void *)&v105[3] + 1) = v77;
          if (!v14 || [v14 containsIndex:66059])
          {
            unint64_t v26 = (void (*)(void *, long long *, long long *, uint64_t, void, unsigned char *))v78[2];
            *(void *)&long long v89 = 5;
            *((void *)&v89 + 1) = v65;
            uint64_t v90 = v13;
            uint64_t v91 = 0;
            uint64_t v92 = v17 - 1;
            uint64_t v93 = 0x7FFFFFFFFFFFFFFFLL;
            long long v94 = 0u;
            long long v95 = 0u;
            uint64_t v96 = 0;
            long long v87 = v105[0];
            *(_OWORD *)v88 = v105[1];
            *(_OWORD *)&v88[16] = v105[2];
            *(_OWORD *)&v88[32] = v105[3];
            long long v83 = v101;
            long long v84 = v102;
            long long v85 = v103;
            long long v86 = v104;
            long long v79 = v97;
            long long v80 = v98;
            long long v81 = v99;
            long long v82 = v100;
            v26(v78, &v89, &v79, 66059, 0, v106);
            if (!v14) {
              goto LABEL_9;
            }
          }
          if ([v14 containsIndex:855060])
          {
LABEL_9:
            unint64_t v27 = [(AESceneGroupedTilingLayout *)self progressSnapshot];
            long long v79 = (unint64_t)v13;
            *(void *)&long long v80 = v17 - 1;
            *((void *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            int v28 = [v27 hasProgressForIndexPath:&v79];

            if (v28)
            {
              -[AESceneGroupedTilingLayout _progressFrameForGridTileFrame:](self, "_progressFrameForGridTileFrame:", v18, v19, v20, v21);
              uint64_t v30 = v29;
              uint64_t v32 = v31;
              uint64_t v34 = v33;
              uint64_t v36 = v35;
              PXRectGetCenter();
              uint64_t v63 = v38;
              uint64_t v64 = v37;
              [(AESceneGroupedTilingLayout *)self _zPositionForDecorativeTileSubitem:5];
              unint64_t v39 = (void (*)(void *, long long *, long long *, uint64_t, void, unsigned char *))v78[2];
              long long v89 = v62;
              uint64_t v90 = v13;
              uint64_t v91 = 0;
              uint64_t v92 = v17 - 1;
              uint64_t v93 = 0x7FFFFFFFFFFFFFFFLL;
              long long v94 = 0u;
              long long v95 = 0u;
              uint64_t v96 = 0;
              *(void *)&long long v79 = v30;
              *((void *)&v79 + 1) = v32;
              CGFloat width = v68;
              CGFloat height = v69;
              *(void *)&long long v80 = v34;
              *((void *)&v80 + 1) = v36;
              *(void *)&long long v81 = v64;
              *((void *)&v81 + 1) = v63;
              *(void *)&long long v82 = v34;
              *((void *)&v82 + 1) = v36;
              long long v83 = v76;
              long long v84 = v74;
              long long v85 = v73;
              *(void *)&long long v86 = 0x3FF0000000000000;
              *((void *)&v86 + 1) = v40;
              *(void *)&long long v87 = 0;
              *((void *)&v87 + 1) = v34;
              *(void *)v88 = v36;
              CGFloat x = v66;
              CGFloat y = v67;
              *(_OWORD *)&v88[8] = v75;
              *(_OWORD *)&v88[24] = v72;
              *(void *)&v88[40] = v77;
              v39(v78, &v89, &v79, 855060, 0, v106);
            }
          }
          long long v79 = (unint64_t)v13;
          *(void *)&long long v80 = v17 - 1;
          *((void *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          [(PXAssetsTilingLayout *)self enumerateAccessoryTilesForContentTileWithIndexPath:&v79 geometry:&v97 withOptions:v71 usingBlock:v78];
          double v41 = [(AESceneGroupedTilingLayout *)self delegate];
          long long v79 = (unint64_t)v13;
          *(void *)&long long v80 = v17 - 1;
          *((void *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v42 = [v41 layout:self shouldShowVideoDecorationAtIndexPath:&v79];
          long long v79 = (unint64_t)v13;
          *(void *)&long long v80 = v17 - 1;
          *((void *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v43 = [v41 layout:self shouldShowCloudDecorationAtIndexPath:&v79];
          long long v79 = (unint64_t)v13;
          *(void *)&long long v80 = v17 - 1;
          *((void *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v44 = [v41 layout:self shouldShowLoopDecorationAtIndexPath:&v79];
          uint64_t v45 = v44;
          if ((v43 & 1) != 0 || (v42 & 1) != 0 || v44)
          {
            -[AESceneGroupedTilingLayout _gradientShadowFrameForItemFrame:](self, "_gradientShadowFrameForItemFrame:", v18, v19, v20, v21);
            uint64_t v47 = v46;
            uint64_t v49 = v48;
            uint64_t v51 = v50;
            uint64_t v53 = v52;
            PXRectGetCenter();
            uint64_t v55 = v54;
            uint64_t v57 = v56;
            [(AESceneGroupedTilingLayout *)self _zPositionForDecorativeTileSubitem:5];
            uint64_t v59 = v58;
            CGSize v60 = [[AEGridOverlayConfiguration alloc] initWithShowCloudDecoration:v43 showVideoDecoration:v42 showLoopDecoration:v45];
            CGSize v61 = (void (*)(void *, long long *, long long *, uint64_t, AEGridOverlayConfiguration *, unsigned char *))v78[2];
            long long v89 = xmmword_22B5480E0;
            uint64_t v90 = v13;
            uint64_t v91 = 0;
            uint64_t v92 = v17 - 1;
            uint64_t v93 = 5;
            long long v94 = 0u;
            long long v95 = 0u;
            uint64_t v96 = 0;
            *(void *)&long long v79 = v47;
            *((void *)&v79 + 1) = v49;
            CGFloat width = v68;
            CGFloat height = v69;
            *(void *)&long long v80 = v51;
            *((void *)&v80 + 1) = v53;
            *(void *)&long long v81 = v55;
            *((void *)&v81 + 1) = v57;
            *(void *)&long long v82 = v51;
            *((void *)&v82 + 1) = v53;
            long long v83 = v76;
            long long v84 = v74;
            long long v85 = v73;
            *(void *)&long long v86 = 0x3FF0000000000000;
            *((void *)&v86 + 1) = v59;
            *(void *)&long long v87 = 0;
            *((void *)&v87 + 1) = v51;
            *(void *)v88 = v53;
            CGFloat x = v66;
            CGFloat y = v67;
            *(_OWORD *)&v88[8] = v75;
            *(_OWORD *)&v88[24] = v72;
            *(void *)&v88[40] = v77;
            v61(v78, &v89, &v79, 136507, v60, v106);
          }
          uint64_t v16 = v70;
        }
        if (v17 >= v16) {
          break;
        }
        ++v17;
      }
      while (!v106[0]);
    }
  }
}

- (CGPoint)_boundedVisibleOrigin
{
  [(PXTilingLayout *)self visibleOrigin];
  if (v2 < 0.0) {
    double v2 = 0.0;
  }
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (PXTileGeometry)_geometryWithFrame:(SEL)a3 alpha:(CGRect)a4 zPosition:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  *(_OWORD *)&retstr->var8.origin.CGFloat y = 0u;
  *(_OWORD *)&retstr->var8.size.CGFloat height = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var7.CGFloat height = 0u;
  *(_OWORD *)&retstr->var3.tCGFloat x = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  uint64_t v13 = [(PXTilingLayout *)self coordinateSpaceIdentifier];
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tCGFloat x = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var7.CGFloat height = 0u;
  *(_OWORD *)&retstr->var8.origin.CGFloat y = 0u;
  *(_OWORD *)&retstr->var8.size.CGFloat height = 0u;
  retstr->var0.origin.CGFloat x = x;
  retstr->var0.origin.CGFloat y = y;
  retstr->var0.size.CGFloat width = width;
  retstr->var0.size.CGFloat height = height;
  CGPoint result = (PXTileGeometry *)PXRectGetCenter();
  retstr->var1.CGFloat x = v15;
  retstr->var1.CGFloat y = v16;
  retstr->var2.CGFloat width = width;
  retstr->var2.CGFloat height = height;
  uint64_t v17 = MEMORY[0x263F000D0];
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->var3.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->var3.c = v18;
  *(_OWORD *)&retstr->var3.tCGFloat x = *(_OWORD *)(v17 + 32);
  retstr->var6 = 0;
  retstr->var7 = retstr->var2;
  CGSize v19 = *(CGSize *)(MEMORY[0x263F5E218] + 16);
  retstr->var8.origin = (CGPoint)*MEMORY[0x263F5E218];
  retstr->var8.size = v19;
  retstr->var9 = v13;
  retstr->var4 = a5;
  retstr->var5 = a6;
  return result;
}

- (void)_invalidateBadgeDecorations
{
  id v3 = objc_alloc_init(MEMORY[0x263F5E1C8]);
  [v3 invalidateTilesInGroup:855060];
  [v3 invalidateTilesInGroup:136507];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (CGSize)_safeReferenceSize
{
  [(PXTilingLayout *)self referenceSize];
  unint64_t v4 = v3;
  unint64_t v6 = v5;
  uint64_t v7 = [(PXTilingLayout *)self contentInset];
  v14.n128_u64[0] = v10.n128_u64[0];
  v15.n128_u64[0] = v11.n128_u64[0];
  unint64_t v8 = v12.n128_u64[0];
  unint64_t v9 = v13.n128_u64[0];
  v10.n128_u64[0] = v4;
  v11.n128_u64[0] = v6;
  v12.n128_u64[0] = v14.n128_u64[0];
  v13.n128_u64[0] = v15.n128_u64[0];
  v14.n128_u64[0] = v8;
  v15.n128_u64[0] = v9;
  MEMORY[0x270F53CD8](v7, v10, v11, v12, v13, v14, v15);
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (void)setSelectedIndexPaths:(id)a3
{
  id v4 = a3;
  [(AESceneGroupedTilingLayout *)self _invalidateBadgeDecorations];
  v5.receiver = self;
  v5.super_class = (Class)AESceneGroupedTilingLayout;
  [(PXAssetsTilingLayout *)&v5 setSelectedIndexPaths:v4];
}

- (void)setProgressSnapshot:(id)a3
{
  if (self->_progressSnapshot != a3)
  {
    objc_storeStrong((id *)&self->_progressSnapshot, a3);
    id v5 = objc_alloc_init(MEMORY[0x263F5E1C8]);
    [v5 invalidateAllTiles];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v5];
  }
  MEMORY[0x270F9A758]();
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(PXTilingLayout *)self contentInset];
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)AESceneGroupedTilingLayout;
    -[PXTilingLayout setContentInset:](&v9, sel_setContentInset_, top, left, bottom, right);
    id v8 = objc_alloc_init(MEMORY[0x263F5E1C8]);
    [v8 invalidateEverything];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v8];
  }
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AESceneGroupedTilingLayout;
  -[PXTilingLayout setVisibleOrigin:](&v5, sel_setVisibleOrigin_, a3.x, a3.y);
  id v4 = objc_alloc_init(MEMORY[0x263F5E1C8]);
  [v4 invalidateTilesInGroup:1111633208];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v4];
}

- (void)setPortraitOrientation:(BOOL)a3
{
  if (self->_portraitOrientation != a3)
  {
    self->_portraitOrientation = a3;
    [(PXTilingLayout *)self invalidateLayout];
  }
}

- (void)setReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXTilingLayout *)self referenceSize];
  if (v7 != width || v6 != height)
  {
    v9.receiver = self;
    v9.super_class = (Class)AESceneGroupedTilingLayout;
    -[PXTilingLayout setReferenceSize:](&v9, sel_setReferenceSize_, width, height);
    [(PXTilingLayout *)self invalidateLayout];
  }
}

- (int64_t)_thumbnailRowsForCurrentLayoutStyle
{
  unint64_t v3 = objc_alloc_init(AEGridEnvironment);
  [(AESceneGroupedTilingLayout *)self _safeReferenceSize];
  [(AEGridEnvironment *)v3 setCompactExtensionHeight:v4];
  [(AEGridEnvironment *)v3 setMinimumTileHeight:dbl_22B5480F0[(unint64_t)([(AESceneGroupedTilingLayout *)self layoutStyle] - 1) < 2]];
  objc_super v5 = +[AEGridConfiguration configurationForEnvironment:v3];
  int64_t v6 = [v5 rowCount];

  return v6;
}

- (void)prepareLayout
{
  id v12 = [(AESceneGroupedTilingLayout *)self _gradientTileLayoutInfo];
  unint64_t v3 = [(PXAssetsTilingLayout *)self dataSource];
  double v4 = ceil((double)[v3 numberOfItemsInSection:0]/ (double)-[AESceneGroupedTilingLayout _thumbnailRowsForCurrentLayoutStyle](self, "_thumbnailRowsForCurrentLayoutStyle"));
  [(AESceneGroupedTilingLayout *)self _safeReferenceSize];
  CGFloat v6 = v5;
  [(AESceneGroupedTilingLayout *)self layoutStyle];
  UIRoundToViewScale();
  double v8 = v7;
  objc_msgSend(v12, "tileSystemLayoutSizeFittingSize:");
  self->_cachedGradientOverlaySize.double width = v9;
  self->_cachedGradientOverlaySize.double height = v10;
  sectionBounds = self->_sectionBounds;
  sectionBounds->origin.CGFloat x = 0.0;
  sectionBounds->origin.CGFloat y = 0.0;
  sectionBounds->size.double width = (double)(uint64_t)v4 * (v8 + 1.0) + -1.0;
  sectionBounds->size.double height = v6;
}

- (CGRect)contentBounds
{
  CGFloat v2 = self->_sectionBounds->origin.x + self->_sectionBounds->size.width;
  [(AESceneGroupedTilingLayout *)self _safeReferenceSize];
  double v4 = v3;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = v2;
  result.size.double height = v4;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (void)dealloc
{
  free(self->_sectionBounds);
  v3.receiver = self;
  v3.super_class = (Class)AESceneGroupedTilingLayout;
  [(AESceneGroupedTilingLayout *)&v3 dealloc];
}

- (AESceneGroupedTilingLayout)initWithDataSource:(id)a3 layoutStyle:(int64_t)a4 gradientTileInfo:(id)a5 orientation:(int64_t)a6
{
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AESceneGroupedTilingLayout;
  id v12 = [(PXAssetsTilingLayout *)&v14 initWithDataSource:a3];
  if (v12)
  {
    v12->_sectionBounds = (CGRect *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v12->_layoutStyle = a4;
    v12->_portraitOrientation = (unint64_t)(a6 - 1) < 2;
    objc_storeStrong((id *)&v12->__gradientTileLayoutInfo, a5);
    [(PXAssetsTilingLayout *)v12 setSelectionBadgeOptions:1];
  }

  return v12;
}

- (AESceneGroupedTilingLayout)initWithDataSource:(id)a3 layoutStyle:(int64_t)a4 orientation:(int64_t)a5
{
  id v8 = a3;
  CGFloat v9 = +[AEGridOverlayView gridOverlayLayoutInfo];
  CGFloat v10 = [(AESceneGroupedTilingLayout *)self initWithDataSource:v8 layoutStyle:a4 gradientTileInfo:v9 orientation:a5];

  return v10;
}

@end