@interface AEMessagesShelfLayout
- (AEMessagesShelfLayoutDelegate)delegate;
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGRect)_cancelButtonFrameForGridFrame:(CGRect)a3;
- (CGRect)_frameForGridItemAtIndexPath:(PXSimpleIndexPath *)a3;
- (CGRect)_generationButtonFrameForGridFrame:(CGRect)a3;
- (CGRect)_gradientShadowFrameForItemFrame:(CGRect)result;
- (CGRect)_irisToggleFrameForGridFrame:(CGRect)a3;
- (CGRect)_loopBadgeFrameForItemFrame:(CGRect)a3;
- (CGRect)_spatialBadgeFrameForItemFrame:(CGRect)a3;
- (CGRect)_videoBadgeFrameForItemFrame:(CGRect)a3;
- (CGRect)_videoDurationFrameForItemFrame:(CGRect)a3;
- (CGRect)contentBounds;
- (double)_zPositionForShelfTileKind:(unint64_t)a3 atIndexPath:(PXSimpleIndexPath *)a4;
- (void)dealloc;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)prepareLayout;
- (void)setDelegate:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
@end

@implementation AEMessagesShelfLayout

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (AEMessagesShelfLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AEMessagesShelfLayoutDelegate *)WeakRetained;
}

- (CGRect)_videoDurationFrameForItemFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[AEMessagesShelfLayout _videoBadgeFrameForItemFrame:](self, "_videoBadgeFrameForItemFrame:");
  double v9 = v7 + v8;
  double v10 = width + -12.0 + x - v9;
  double v11 = y + height + -12.0 + -12.0;
  double v12 = 12.0;
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v11;
  result.origin.double x = v9;
  return result;
}

- (CGRect)_videoBadgeFrameForItemFrame:(CGRect)a3
{
  double v3 = a3.origin.x + 12.0;
  double v4 = a3.origin.y + a3.size.height + -12.0 + -12.0;
  double v5 = 20.0;
  double v6 = 12.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_spatialBadgeFrameForItemFrame:(CGRect)a3
{
  double v3 = a3.origin.x + 8.0;
  double v4 = a3.origin.y + 8.0;
  double v5 = 20.0;
  double v6 = 20.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_loopBadgeFrameForItemFrame:(CGRect)a3
{
  double v3 = a3.origin.x + 12.0;
  double v4 = a3.origin.y + a3.size.height + -15.0 + -12.0;
  double v5 = 19.0;
  double v6 = 15.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_gradientShadowFrameForItemFrame:(CGRect)result
{
  double v3 = result.origin.y + result.size.height + -39.0;
  double v4 = 39.0;
  result.size.double height = v4;
  result.origin.double y = v3;
  return result;
}

- (CGRect)_generationButtonFrameForGridFrame:(CGRect)a3
{
  double v3 = a3.origin.x + 4.0;
  double v4 = a3.origin.y + a3.size.height + -26.0 + -4.0;
  double v5 = 26.0;
  double v6 = 26.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_irisToggleFrameForGridFrame:(CGRect)a3
{
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  +[AEMessagesShelfRoundButton preferredTapRegionSizeForStyle:](AEMessagesShelfRoundButton, "preferredTapRegionSizeForStyle:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  double v8 = v7;
  double v9 = x;
  double v10 = y;
  result.size.double height = v8;
  result.size.double width = v6;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)_cancelButtonFrameForGridFrame:(CGRect)a3
{
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  +[AEMessagesShelfRoundButton preferredTapRegionSizeForStyle:](AEMessagesShelfRoundButton, "preferredTapRegionSizeForStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6;
  double v9 = v8;
  double v10 = x + width - v6;
  double v11 = y;
  result.size.double height = v9;
  result.size.double width = v7;
  result.origin.CGFloat y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)_frameForGridItemAtIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  itemFramesForCurrentDataSource = self->_itemFramesForCurrentDataSource;
  if (itemFramesForCurrentDataSource)
  {
    p_double x = &itemFramesForCurrentDataSource[a3->item].origin.x;
  }
  else
  {
    double v6 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (self->_wasPreparedAtLeastOnce) {
        double v7 = @"was";
      }
      else {
        double v7 = @"WAS NOT";
      }
      int v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_22B526000, v6, OS_LOG_TYPE_ERROR, "<Shelf layout> Precomputed item frames unavailable, layout %@ prepared at least once", (uint8_t *)&v12, 0xCu);
    }

    p_double x = (double *)MEMORY[0x263F001A8];
  }
  double v8 = p_x[2];
  double v9 = p_x[3];
  double v10 = *p_x;
  double v11 = p_x[1];
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.CGFloat y = v11;
  result.origin.double x = v10;
  return result;
}

- (double)_zPositionForShelfTileKind:(unint64_t)a3 atIndexPath:(PXSimpleIndexPath *)a4
{
  double result = 0.0;
  if ((uint64_t)a3 <= 1313817679)
  {
    if (a3 != 1215219281 && a3 != 1277777777 && a3 != 1295210292) {
      return result;
    }
    return 10.0;
  }
  if (a3 - 1500001336 < 3 || a3 == 1313817680) {
    return 10.0;
  }
  if (a3 == 1500001007) {
    return 0.5;
  }
  return result;
}

- (void)prepareLayout
{
  self->_wasPreparedAtLeastOnce = 1;
  v17.receiver = self;
  v17.super_class = (Class)AEMessagesShelfLayout;
  [(PXTilingLayout *)&v17 prepareLayout];
  itemFramesForCurrentDataSource = self->_itemFramesForCurrentDataSource;
  if (itemFramesForCurrentDataSource)
  {
    free(itemFramesForCurrentDataSource);
    self->_itemFramesForCurrentDataSource = 0;
  }
  double v4 = [(PXAssetsTilingLayout *)self dataSource];
  double v5 = [(AEMessagesShelfLayout *)self delegate];
  uint64_t v6 = [v4 numberOfItemsInSection:0];
  self->_itemFramesForCurrentDataSource = (CGRect *)malloc_type_malloc(32 * v6, 0x1000040E0EAB150uLL);
  uint64_t v7 = [v4 identifier];
  [(PXTilingLayout *)self referenceSize];
  UIRoundToViewScale();
  CGFloat v9 = v8;
  double v10 = 0.0;
  if (v6) {
    double v10 = 6.0;
  }
  self->_double currentContentWidth = v10;
  if (v6 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    do
    {
      v16[0] = v7;
      v16[1] = 0;
      v16[2] = v12;
      v16[3] = 0x7FFFFFFFFFFFFFFFLL;
      [v5 layout:self aspectRatioForItemAtIndexPath:v16];
      UIRoundToViewScale();
      double currentContentWidth = self->_currentContentWidth;
      self->_double currentContentWidth = v14 + currentContentWidth + 6.0;
      v15 = &self->_itemFramesForCurrentDataSource[v11];
      v15->origin.double x = currentContentWidth;
      ++v12;
      v15->origin.CGFloat y = 0.0;
      v15->size.double width = v14;
      v15->size.double height = v9;
      ++v11;
    }
    while (v6 != v12);
  }
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  uint64_t v11 = [(AEMessagesShelfLayout *)self delegate];
  int v12 = [v11 layoutShouldShowVideoDuration:self];
  unint64_t v14 = a6->var1[1];
  unint64_t v13 = a6->var1[2];
  unint64_t v15 = a6->var1[3];
  *((void *)&v105 + 1) = a6->var1[4];
  uint64_t v16 = a6->var1[0];
  if (v16 == *MEMORY[0x263F5E200] && a6->var0 == 5) {
    goto LABEL_13;
  }
  if (v16 > 1295210291)
  {
    if (v16 != 1295210292 && v16 != 1500001338)
    {
      uint64_t v18 = 1313817680;
LABEL_12:
      if (v16 == v18) {
        goto LABEL_13;
      }
LABEL_62:
      v112.receiver = self;
      v112.super_class = (Class)AEMessagesShelfLayout;
      long long v94 = *(_OWORD *)&a6->var1[5];
      long long v108 = *(_OWORD *)&a6->var1[3];
      long long v109 = v94;
      long long v110 = *(_OWORD *)&a6->var1[7];
      unint64_t v111 = a6->var1[9];
      long long v95 = *(_OWORD *)&a6->var1[1];
      long long v106 = *(_OWORD *)&a6->var0;
      long long v107 = v95;
      BOOL v80 = [(PXAssetsTilingLayout *)&v112 getGeometry:a3 group:a4 userData:a5 forTileWithIdentifier:&v106];
      id v44 = 0;
      goto LABEL_60;
    }
LABEL_13:
    v101 = a3;
    v103 = a4;
    unint64_t v19 = a6->var1[2];
    v20 = a5;
    v21 = v11;
    *(void *)&long long v105 = a6->var1[3];
    v22 = [(PXAssetsTilingLayout *)self dataSource];
    uint64_t v23 = [v22 numberOfItemsInSection:0];

    if ((uint64_t)v105 < v23 && v16 == 1295210292)
    {
      *(void *)&long long v106 = v14;
      *((void *)&v106 + 1) = v19;
      unint64_t v24 = v19;
      uint64_t v25 = *((void *)&v105 + 1);
      long long v107 = v105;
      uint64_t v11 = v21;
      v26 = v21;
      uint64_t v27 = v105;
      if ([v26 layout:self irisToggleStateForItemAtIndexPath:&v106] != *((void *)&v105 + 1)) {
        goto LABEL_59;
      }
    }
    else
    {
      BOOL v28 = (uint64_t)v105 < v23 && v16 == 1215219281;
      char v29 = !v28;
      uint64_t v11 = v21;
      if (!v28 || ((v12 ^ 1) & 1) != 0)
      {
        char v31 = v29 ^ 1;
        if ((uint64_t)v105 >= v23) {
          char v31 = 1;
        }
        uint64_t v27 = v105;
        unint64_t v24 = v19;
        uint64_t v25 = *((void *)&v105 + 1);
        if (v31) {
          goto LABEL_59;
        }
      }
      else
      {
        *(void *)&long long v106 = v14;
        *((void *)&v106 + 1) = v19;
        unint64_t v24 = v19;
        uint64_t v25 = *((void *)&v105 + 1);
        long long v107 = v105;
        v30 = v21;
        uint64_t v27 = v105;
        if (([v30 layout:self itemAtIndexPathIsVideo:&v106] & 1) == 0) {
          goto LABEL_59;
        }
      }
    }
    *(void *)&long long v106 = v14;
    *((void *)&v106 + 1) = v24;
    *(void *)&long long v107 = v27;
    *((void *)&v107 + 1) = v25;
    [(AEMessagesShelfLayout *)self _frameForGridItemAtIndexPath:&v106];
    CGFloat v36 = v32;
    CGFloat v37 = v33;
    CGFloat v38 = v34;
    CGFloat v39 = v35;
    a5 = v20;
    if (v16 == 1313817680)
    {
      -[AEMessagesShelfLayout _cancelButtonFrameForGridFrame:](self, "_cancelButtonFrameForGridFrame:", v32, v33, v34, v35);
      CGFloat v36 = v40;
      CGFloat v37 = v41;
      CGFloat v38 = v42;
      CGFloat v39 = v43;
      id v44 = 0;
      unint64_t v45 = 0;
      a4 = v104;
      uint64_t v46 = v105;
      a3 = v102;
    }
    else
    {
      a3 = v102;
      a4 = v104;
      if (v16 == 1295210292)
      {
        -[AEMessagesShelfLayout _irisToggleFrameForGridFrame:](self, "_irisToggleFrameForGridFrame:", v32, v33, v34, v35);
        CGFloat v36 = v47;
        CGFloat v37 = v48;
        CGFloat v38 = v49;
        CGFloat v39 = v50;
        id v44 = 0;
        unint64_t v45 = 2295210291;
      }
      else if (v16 == 1277777777)
      {
        -[AEMessagesShelfLayout _generationButtonFrameForGridFrame:](self, "_generationButtonFrameForGridFrame:", v32, v33, v34, v35);
        CGFloat v36 = v51;
        CGFloat v37 = v52;
        CGFloat v38 = v53;
        CGFloat v39 = v54;
        id v44 = 0;
        unint64_t v45 = 2555555555;
      }
      else
      {
        if (v16 == 1215219281)
        {
          -[AEMessagesShelfLayout _videoDurationFrameForItemFrame:](self, "_videoDurationFrameForItemFrame:", v32, v33, v34, v35);
          CGFloat v36 = v81;
          CGFloat v37 = v82;
          CGFloat v38 = v83;
          CGFloat v39 = v84;
          v85 = NSNumber;
          *(void *)&long long v106 = v14;
          *((void *)&v106 + 1) = v24;
          long long v107 = v105;
          [v11 layout:self itemAtIndexPathDuration:&v106];
          uint64_t v86 = objc_msgSend(v85, "numberWithDouble:");
          uint64_t v46 = v105;
          id v44 = (id)v86;
          unint64_t v45 = 0;
          goto LABEL_48;
        }
        if (v16 == 1500001338)
        {
          -[AEMessagesShelfLayout _spatialBadgeFrameForItemFrame:](self, "_spatialBadgeFrameForItemFrame:", v32, v33, v34, v35);
          CGFloat v36 = v66;
          CGFloat v37 = v67;
          CGFloat v38 = v68;
          CGFloat v39 = v69;
        }
        id v44 = 0;
        unint64_t v45 = 0;
      }
      uint64_t v46 = v105;
    }
LABEL_48:
    unint64_t v70 = a6->var1[0];
    *(void *)&long long v106 = v14;
    *((void *)&v106 + 1) = v24;
    *(void *)&long long v107 = v46;
    *((void *)&v107 + 1) = *((void *)&v105 + 1);
    [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:v70 atIndexPath:&v106];
    double v72 = v71;
    goto LABEL_49;
  }
  if (v16 != 795209731)
  {
    if (v16 != 1215219281)
    {
      uint64_t v18 = 1277777777;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!*((void *)&v105 + 1))
  {
LABEL_40:
    *(void *)&long long v106 = a6->var1[1];
    *((void *)&v106 + 1) = v13;
    *(void *)&long long v107 = v15;
    *((void *)&v107 + 1) = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v55 = v15;
    if (![v11 layout:self itemAtIndexPathIsVideo:&v106])
    {
      BOOL v80 = 0;
      id v44 = 0;
      goto LABEL_60;
    }
    *(void *)&long long v106 = v14;
    *((void *)&v106 + 1) = v13;
    *(void *)&long long v107 = v55;
    *((void *)&v107 + 1) = 0x7FFFFFFFFFFFFFFFLL;
    [(AEMessagesShelfLayout *)self _frameForGridItemAtIndexPath:&v106];
    if (*((void *)&v105 + 1))
    {
      -[AEMessagesShelfLayout _gradientShadowFrameForItemFrame:](self, "_gradientShadowFrameForItemFrame:", v56, v57, v58, v59);
      CGFloat v36 = v60;
      CGFloat v37 = v61;
      CGFloat v38 = v62;
      CGFloat v39 = v63;
      *(void *)&long long v106 = v14;
      *((void *)&v106 + 1) = v13;
      *(void *)&long long v107 = v55;
      *((void *)&v107 + 1) = 3;
      v64 = self;
      uint64_t v65 = 795209432;
    }
    else
    {
      -[AEMessagesShelfLayout _videoBadgeFrameForItemFrame:](self, "_videoBadgeFrameForItemFrame:", v56, v57, v58, v59);
      CGFloat v36 = v96;
      CGFloat v37 = v97;
      CGFloat v38 = v98;
      CGFloat v39 = v99;
      *(void *)&long long v106 = v14;
      *((void *)&v106 + 1) = v13;
      long long v107 = v55;
      v64 = self;
      uint64_t v65 = 1500001336;
    }
    [(AEMessagesShelfLayout *)v64 _zPositionForShelfTileKind:v65 atIndexPath:&v106];
    double v72 = v100;
    unint64_t v45 = 0;
    id v44 = 0;
    goto LABEL_49;
  }
  if (*((void *)&v105 + 1) != 4)
  {
    if (*((void *)&v105 + 1) != 3) {
      goto LABEL_62;
    }
    goto LABEL_40;
  }
  *(void *)&long long v106 = a6->var1[1];
  *((void *)&v106 + 1) = v13;
  *(void *)&long long v107 = v15;
  *((void *)&v107 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v87 = v15;
  if (![v11 layout:self itemAtIndexPathIsSpatial:&v106])
  {
LABEL_59:
    id v44 = 0;
    BOOL v80 = 0;
    goto LABEL_60;
  }
  *(void *)&long long v106 = v14;
  *((void *)&v106 + 1) = v13;
  *(void *)&long long v107 = v87;
  *((void *)&v107 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  [(AEMessagesShelfLayout *)self _frameForGridItemAtIndexPath:&v106];
  CGFloat v36 = v88;
  CGFloat v37 = v89;
  CGFloat v38 = v90;
  CGFloat v39 = v91;
  *(void *)&long long v106 = v14;
  *((void *)&v106 + 1) = v13;
  *(void *)&long long v107 = v87;
  *((void *)&v107 + 1) = 4;
  [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:795209433 atIndexPath:&v106];
  double v72 = v92;
  unint64_t v45 = 0;
  id v44 = 0;
LABEL_49:
  if (a3)
  {
    v73 = [(PXTilingLayout *)self coordinateSpaceIdentifier];
    PXRectGetCenter();
    a3->var0.origin.double x = v36;
    a3->var0.origin.CGFloat y = v37;
    a3->var0.size.double width = v38;
    a3->var0.size.double height = v39;
    a3->var1.double x = v74;
    a3->var1.CGFloat y = v75;
    a3->var2.double width = v38;
    a3->var2.double height = v39;
    uint64_t v76 = MEMORY[0x263F000D0];
    long long v77 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&a3->var3.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&a3->var3.c = v77;
    *(_OWORD *)&a3->var3.tdouble x = *(_OWORD *)(v76 + 32);
    a3->var4 = 1.0;
    a3->var5 = v72;
    *(void *)&a3->var6 = 0;
    uint64_t v78 = MEMORY[0x263F5E218];
    a3->var7.double width = v38;
    a3->var7.double height = v39;
    CGPoint v79 = *(CGPoint *)v78;
    a3->var8.size = *(CGSize *)(v78 + 16);
    a3->var8.origin = v79;
    a3->var9 = v73;
  }
  if (a4) {
    *a4 = v45;
  }
  if (a5)
  {
    id v44 = v44;
    *a5 = v44;
  }
  BOOL v80 = 1;
LABEL_60:

  return v80;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  id v160 = a4;
  uint64_t v7 = a5;
  double v8 = [(PXAssetsTilingLayout *)self dataSource];
  uint64_t v9 = [v8 identifier];

  double v10 = [(PXTilingLayout *)self coordinateSpaceIdentifier];
  uint64_t v11 = [(AEMessagesShelfLayout *)self delegate];
  int v157 = [v11 layoutShouldShowVideoDuration:self];
  v167 = v11;
  int v159 = [v11 layoutShouldShowCancelButtons:self];
  v198[0] = 0;
  int v12 = [(PXAssetsTilingLayout *)self dataSource];
  uint64_t v13 = [v12 numberOfSections];

  if (v13 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v158 = *MEMORY[0x263F5E200];
    long long v156 = xmmword_22B548100;
    v166 = v10;
    v173 = v7;
    do
    {
      unint64_t v15 = [(PXAssetsTilingLayout *)self dataSource];
      uint64_t v16 = [v15 numberOfItemsInSection:v14];

      if (v16 >= 1 && !v198[0])
      {
        uint64_t v17 = 1;
        uint64_t v161 = v16;
        do
        {
          *(void *)&long long v189 = v9;
          *((void *)&v189 + 1) = v14;
          *(void *)&long long v190 = v17 - 1;
          *((void *)&v190 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          [(AEMessagesShelfLayout *)self _frameForGridItemAtIndexPath:&v189];
          double x = v199.origin.x;
          double y = v199.origin.y;
          double width = v199.size.width;
          double height = v199.size.height;
          if (CGRectIntersectsRect(v199, a3))
          {
            memset(v197, 0, sizeof(v197));
            long long v195 = 0u;
            long long v196 = 0u;
            long long v193 = 0u;
            long long v194 = 0u;
            long long v191 = 0u;
            long long v192 = 0u;
            *(double *)&long long v189 = x;
            *((double *)&v189 + 1) = y;
            *(double *)&long long v190 = width;
            *((double *)&v190 + 1) = height;
            PXRectGetCenter();
            *(void *)&long long v191 = v22;
            *((void *)&v191 + 1) = v23;
            *(double *)&long long v192 = width;
            *((double *)&v192 + 1) = height;
            long long v171 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
            long long v172 = *MEMORY[0x263F000D0];
            long long v193 = *MEMORY[0x263F000D0];
            long long v194 = v171;
            long long v170 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
            long long v195 = v170;
            LOBYTE(v197[0]) = 0;
            long long v196 = xmmword_22B5480C0;
            *(_OWORD *)((char *)v197 + 8) = v192;
            long long v168 = *(_OWORD *)(MEMORY[0x263F5E218] + 16);
            long long v169 = *MEMORY[0x263F5E218];
            *(_OWORD *)((char *)&v197[1] + 8) = *MEMORY[0x263F5E218];
            *(_OWORD *)((char *)&v197[2] + 8) = v168;
            unint64_t v24 = v166;
            *((void *)&v197[3] + 1) = v166;
            *(void *)&long long v174 = v9;
            *((void *)&v174 + 1) = v14;
            *(void *)&long long v175 = v17 - 1;
            *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:v158 atIndexPath:&v174];
            *((void *)&v196 + 1) = v25;
            v26 = (void (*)(void *, long long *, long long *, void, void, unsigned char *))v173[2];
            *(void *)&long long v184 = 5;
            *((void *)&v184 + 1) = v158;
            uint64_t v185 = v9;
            uint64_t v186 = v14;
            uint64_t v187 = v17 - 1;
            v188[0] = 0x7FFFFFFFFFFFFFFFLL;
            memset(&v188[1], 0, 40);
            long long v182 = v197[0];
            *(_OWORD *)v183 = v197[1];
            *(_OWORD *)&v183[16] = v197[2];
            *(_OWORD *)&v183[32] = v197[3];
            long long v178 = v193;
            long long v179 = v194;
            long long v180 = v195;
            long long v181 = v196;
            long long v174 = v189;
            long long v175 = v190;
            long long v176 = v191;
            long long v177 = v192;
            v26(v173, &v184, &v174, 0, 0, v198);
            *(void *)&long long v174 = v9;
            *((void *)&v174 + 1) = v14;
            *(void *)&long long v175 = v17 - 1;
            *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            double v164 = y;
            double v165 = x;
            int v162 = [v167 layout:self itemAtIndexPathIsVideo:&v174];
            if (v162)
            {
              -[AEMessagesShelfLayout _videoBadgeFrameForItemFrame:](self, "_videoBadgeFrameForItemFrame:", x, y, width, height);
              uint64_t v28 = v27;
              uint64_t v30 = v29;
              uint64_t v32 = v31;
              uint64_t v34 = v33;
              PXRectGetCenter();
              uint64_t v36 = v35;
              uint64_t v38 = v37;
              *(void *)&long long v174 = v9;
              *((void *)&v174 + 1) = v14;
              *(void *)&long long v175 = v17 - 1;
              *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:1500001336 atIndexPath:&v174];
              CGFloat v39 = (void (*)(void *, long long *, long long *, void, void, unsigned char *))v173[2];
              long long v184 = xmmword_22B5480E0;
              uint64_t v185 = v9;
              uint64_t v186 = v14;
              uint64_t v187 = v17 - 1;
              memset(v188, 0, sizeof(v188));
              *(void *)&long long v174 = v28;
              *((void *)&v174 + 1) = v30;
              *(void *)&long long v175 = v32;
              *((void *)&v175 + 1) = v34;
              *(void *)&long long v176 = v36;
              *((void *)&v176 + 1) = v38;
              *(void *)&long long v177 = v32;
              *((void *)&v177 + 1) = v34;
              long long v178 = v172;
              long long v179 = v171;
              long long v180 = v170;
              *(void *)&long long v181 = 0x3FF0000000000000;
              *((void *)&v181 + 1) = v40;
              *(void *)&long long v182 = 0;
              *((void *)&v182 + 1) = v32;
              *(void *)v183 = v34;
              double y = v164;
              double x = v165;
              *(_OWORD *)&v183[8] = v169;
              *(_OWORD *)&v183[24] = v168;
              *(void *)&v183[40] = v166;
              v39(v173, &v184, &v174, 0, 0, v198);
              if (v157)
              {
                -[AEMessagesShelfLayout _videoDurationFrameForItemFrame:](self, "_videoDurationFrameForItemFrame:", v165, v164, width, height);
                uint64_t v42 = v41;
                uint64_t v44 = v43;
                uint64_t v46 = v45;
                uint64_t v48 = v47;
                double v49 = NSNumber;
                *(void *)&long long v174 = v9;
                *((void *)&v174 + 1) = v14;
                *(void *)&long long v175 = v17 - 1;
                *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
                [v167 layout:self itemAtIndexPathDuration:&v174];
                double v50 = objc_msgSend(v49, "numberWithDouble:");
                PXRectGetCenter();
                uint64_t v52 = v51;
                uint64_t v54 = v53;
                *(void *)&long long v174 = v9;
                *((void *)&v174 + 1) = v14;
                *(void *)&long long v175 = v17 - 1;
                *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
                [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:1215219281 atIndexPath:&v174];
                unint64_t v55 = (void (*)(void *, long long *, long long *, void, void *, unsigned char *))v173[2];
                long long v184 = v156;
                uint64_t v185 = v9;
                uint64_t v186 = v14;
                uint64_t v187 = v17 - 1;
                v188[0] = 0x7FFFFFFFFFFFFFFFLL;
                memset(&v188[1], 0, 40);
                *(void *)&long long v174 = v42;
                *((void *)&v174 + 1) = v44;
                *(void *)&long long v175 = v46;
                *((void *)&v175 + 1) = v48;
                *(void *)&long long v176 = v52;
                *((void *)&v176 + 1) = v54;
                *(void *)&long long v177 = v46;
                *((void *)&v177 + 1) = v48;
                long long v178 = v172;
                long long v179 = v171;
                long long v180 = v170;
                *(void *)&long long v181 = 0x3FF0000000000000;
                *((void *)&v181 + 1) = v56;
                *(void *)&long long v182 = 0;
                *((void *)&v182 + 1) = v46;
                *(void *)v183 = v48;
                double y = v164;
                double x = v165;
                *(_OWORD *)&v183[8] = v169;
                *(_OWORD *)&v183[24] = v168;
                *(void *)&v183[40] = v166;
                v55(v173, &v184, &v174, 0, v50, v198);

                unint64_t v24 = v166;
              }
            }
            if (enumerateTilesInRect_withOptions_usingBlock__onceToken != -1) {
              dispatch_once(&enumerateTilesInRect_withOptions_usingBlock__onceToken, &__block_literal_global_580);
            }
            if (enumerateTilesInRect_withOptions_usingBlock__canShowLoopBadges
              && (*(void *)&long long v174 = v9,
                  *((void *)&v174 + 1) = v14,
                  *(void *)&long long v175 = v17 - 1,
                  *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL,
                  [v167 layout:self itemAtIndexPathIsLoop:&v174]))
            {
              -[AEMessagesShelfLayout _loopBadgeFrameForItemFrame:](self, "_loopBadgeFrameForItemFrame:", x, y, width, height);
              uint64_t v58 = v57;
              uint64_t v60 = v59;
              uint64_t v62 = v61;
              uint64_t v64 = v63;
              PXRectGetCenter();
              uint64_t v66 = v65;
              uint64_t v68 = v67;
              *(void *)&long long v174 = v9;
              *((void *)&v174 + 1) = v14;
              *(void *)&long long v175 = v17 - 1;
              *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:1500001337 atIndexPath:&v174];
              double v69 = (void (*)(void *, long long *, long long *, void, void, unsigned char *))v173[2];
              long long v184 = xmmword_22B5480E0;
              uint64_t v185 = v9;
              uint64_t v186 = v14;
              int v70 = 1;
              uint64_t v187 = v17 - 1;
              v188[0] = 1;
              memset(&v188[1], 0, 40);
              *(void *)&long long v174 = v58;
              *((void *)&v174 + 1) = v60;
              *(void *)&long long v175 = v62;
              *((void *)&v175 + 1) = v64;
              *(void *)&long long v176 = v66;
              *((void *)&v176 + 1) = v68;
              *(void *)&long long v177 = v62;
              *((void *)&v177 + 1) = v64;
              long long v178 = v172;
              long long v179 = v171;
              long long v180 = v170;
              *(void *)&long long v181 = 0x3FF0000000000000;
              *((void *)&v181 + 1) = v71;
              *(void *)&long long v182 = 0;
              *((void *)&v182 + 1) = v62;
              *(void *)v183 = v64;
              double y = v164;
              double x = v165;
              *(_OWORD *)&v183[8] = v169;
              *(_OWORD *)&v183[24] = v168;
              *(void *)&v183[40] = v24;
              v69(v173, &v184, &v174, 0, 0, v198);
            }
            else
            {
              int v70 = 0;
            }
            *(void *)&long long v174 = v9;
            *((void *)&v174 + 1) = v14;
            *(void *)&long long v175 = v17 - 1;
            *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            int v72 = [v167 layout:self itemAtIndexPathIsSpatial:&v174];
            if (v72)
            {
              -[AEMessagesShelfLayout _spatialBadgeFrameForItemFrame:](self, "_spatialBadgeFrameForItemFrame:", x, y, width, height);
              uint64_t v74 = v73;
              uint64_t v76 = v75;
              uint64_t v78 = v77;
              uint64_t v80 = v79;
              PXRectGetCenter();
              uint64_t v82 = v81;
              uint64_t v84 = v83;
              *(void *)&long long v174 = v9;
              *((void *)&v174 + 1) = v14;
              *(void *)&long long v175 = v17 - 1;
              *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:1500001338 atIndexPath:&v174];
              v85 = (void (*)(void *, long long *, long long *, void, void, unsigned char *))v173[2];
              long long v184 = xmmword_22B5480E0;
              uint64_t v185 = v9;
              uint64_t v186 = v14;
              uint64_t v187 = v17 - 1;
              v188[0] = 7;
              memset(&v188[1], 0, 40);
              *(void *)&long long v174 = v74;
              *((void *)&v174 + 1) = v76;
              *(void *)&long long v175 = v78;
              *((void *)&v175 + 1) = v80;
              *(void *)&long long v176 = v82;
              *((void *)&v176 + 1) = v84;
              *(void *)&long long v177 = v78;
              *((void *)&v177 + 1) = v80;
              long long v178 = v172;
              long long v179 = v171;
              long long v180 = v170;
              *(void *)&long long v181 = 0x3FF0000000000000;
              *((void *)&v181 + 1) = v86;
              *(void *)&long long v182 = 0;
              *((void *)&v182 + 1) = v78;
              *(void *)v183 = v80;
              double y = v164;
              double x = v165;
              *(_OWORD *)&v183[8] = v169;
              *(_OWORD *)&v183[24] = v168;
              *(void *)&v183[40] = v166;
              v85(v173, &v184, &v174, 0, 0, v198);
            }
            *(void *)&long long v174 = v9;
            *((void *)&v174 + 1) = v14;
            *(void *)&long long v175 = v17 - 1;
            *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            [(PXAssetsTilingLayout *)self enumerateAccessoryTilesForContentTileWithIndexPath:&v174 geometry:&v189 withOptions:v160 usingBlock:v173];
            if ((v162 | v70) == 1)
            {
              -[AEMessagesShelfLayout _gradientShadowFrameForItemFrame:](self, "_gradientShadowFrameForItemFrame:", x, y, width, height);
              uint64_t v88 = v87;
              uint64_t v90 = v89;
              uint64_t v92 = v91;
              uint64_t v94 = v93;
              PXRectGetCenter();
              uint64_t v96 = v95;
              uint64_t v98 = v97;
              *(void *)&long long v174 = v9;
              *((void *)&v174 + 1) = v14;
              *(void *)&long long v175 = v17 - 1;
              *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:795209432 atIndexPath:&v174];
              double v99 = (void (*)(void *, long long *, long long *, uint64_t, void, unsigned char *))v173[2];
              long long v184 = xmmword_22B5480E0;
              uint64_t v185 = v9;
              uint64_t v186 = v14;
              uint64_t v187 = v17 - 1;
              v188[0] = 3;
              memset(&v188[1], 0, 40);
              *(void *)&long long v174 = v88;
              *((void *)&v174 + 1) = v90;
              *(void *)&long long v175 = v92;
              *((void *)&v175 + 1) = v94;
              *(void *)&long long v176 = v96;
              *((void *)&v176 + 1) = v98;
              *(void *)&long long v177 = v92;
              *((void *)&v177 + 1) = v94;
              long long v178 = v172;
              long long v179 = v171;
              long long v180 = v170;
              *(void *)&long long v181 = 0x3FF0000000000000;
              *((void *)&v181 + 1) = v100;
              *(void *)&long long v182 = 0;
              *((void *)&v182 + 1) = v92;
              *(void *)v183 = v94;
              double y = v164;
              double x = v165;
              *(_OWORD *)&v183[8] = v169;
              *(_OWORD *)&v183[24] = v168;
              *(void *)&v183[40] = v166;
              v99(v173, &v184, &v174, 136507, 0, v198);
            }
            if (v72)
            {
              PXRectGetCenter();
              uint64_t v102 = v101;
              uint64_t v104 = v103;
              *(void *)&long long v174 = v9;
              *((void *)&v174 + 1) = v14;
              *(void *)&long long v175 = v17 - 1;
              *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:795209433 atIndexPath:&v174];
              long long v105 = (void (*)(void *, long long *, long long *, uint64_t, void, unsigned char *))v173[2];
              long long v184 = xmmword_22B5480E0;
              uint64_t v185 = v9;
              uint64_t v186 = v14;
              uint64_t v187 = v17 - 1;
              v188[0] = 4;
              memset(&v188[1], 0, 40);
              *(double *)&long long v174 = x;
              *((double *)&v174 + 1) = y;
              *(double *)&long long v175 = width;
              *((double *)&v175 + 1) = height;
              *(void *)&long long v176 = v102;
              *((void *)&v176 + 1) = v104;
              *(double *)&long long v177 = width;
              *((double *)&v177 + 1) = height;
              long long v178 = v172;
              long long v179 = v171;
              long long v180 = v170;
              *(void *)&long long v181 = 0x3FF0000000000000;
              *((void *)&v181 + 1) = v106;
              *(void *)&long long v182 = 0;
              *((double *)&v182 + 1) = width;
              *(double *)v183 = height;
              *(_OWORD *)&v183[8] = v169;
              *(_OWORD *)&v183[24] = v168;
              *(void *)&v183[40] = v166;
              v105(v173, &v184, &v174, 136507, 0, v198);
            }
            if (v159)
            {
              -[AEMessagesShelfLayout _cancelButtonFrameForGridFrame:](self, "_cancelButtonFrameForGridFrame:", x, y, width, height);
              uint64_t v108 = v107;
              uint64_t v110 = v109;
              uint64_t v112 = v111;
              uint64_t v114 = v113;
              PXRectGetCenter();
              uint64_t v116 = v115;
              uint64_t v118 = v117;
              *(void *)&long long v174 = v9;
              *((void *)&v174 + 1) = v14;
              *(void *)&long long v175 = v17 - 1;
              *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:1313817680 atIndexPath:&v174];
              v119 = (void (*)(void *, long long *, long long *, void, void, unsigned char *))v173[2];
              long long v184 = xmmword_22B548110;
              uint64_t v185 = v9;
              uint64_t v186 = v14;
              uint64_t v187 = v17 - 1;
              v188[0] = 0x7FFFFFFFFFFFFFFFLL;
              memset(&v188[1], 0, 40);
              *(void *)&long long v174 = v108;
              *((void *)&v174 + 1) = v110;
              *(void *)&long long v175 = v112;
              *((void *)&v175 + 1) = v114;
              *(void *)&long long v176 = v116;
              *((void *)&v176 + 1) = v118;
              *(void *)&long long v177 = v112;
              *((void *)&v177 + 1) = v114;
              long long v178 = v172;
              long long v179 = v171;
              long long v180 = v170;
              *(void *)&long long v181 = 0x3FF0000000000000;
              *((void *)&v181 + 1) = v120;
              *(void *)&long long v182 = 0;
              *((void *)&v182 + 1) = v112;
              *(void *)v183 = v114;
              double y = v164;
              double x = v165;
              *(_OWORD *)&v183[8] = v169;
              *(_OWORD *)&v183[24] = v168;
              *(void *)&v183[40] = v166;
              v119(v173, &v184, &v174, 0, 0, v198);
            }
            *(void *)&long long v174 = v9;
            *((void *)&v174 + 1) = v14;
            *(void *)&long long v175 = v17 - 1;
            *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v121 = [v167 layout:self irisToggleStateForItemAtIndexPath:&v174];
            if (v121)
            {
              uint64_t v122 = v121;
              -[AEMessagesShelfLayout _irisToggleFrameForGridFrame:](self, "_irisToggleFrameForGridFrame:", x, y, width, height);
              uint64_t v124 = v123;
              uint64_t v126 = v125;
              uint64_t v128 = v127;
              uint64_t v130 = v129;
              PXRectGetCenter();
              uint64_t v132 = v131;
              uint64_t v134 = v133;
              *(void *)&long long v174 = v9;
              *((void *)&v174 + 1) = v14;
              *(void *)&long long v175 = v17 - 1;
              *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:1295210292 atIndexPath:&v174];
              v135 = (void (*)(void *, long long *, long long *, uint64_t, void, unsigned char *))v173[2];
              long long v184 = xmmword_22B548120;
              uint64_t v185 = v9;
              uint64_t v186 = v14;
              uint64_t v187 = v17 - 1;
              v188[0] = v122;
              memset(&v188[1], 0, 40);
              *(void *)&long long v174 = v124;
              *((void *)&v174 + 1) = v126;
              *(void *)&long long v175 = v128;
              *((void *)&v175 + 1) = v130;
              *(void *)&long long v176 = v132;
              *((void *)&v176 + 1) = v134;
              *(void *)&long long v177 = v128;
              *((void *)&v177 + 1) = v130;
              long long v178 = v172;
              long long v179 = v171;
              long long v180 = v170;
              *(void *)&long long v181 = 0x3FF0000000000000;
              *((void *)&v181 + 1) = v136;
              *(void *)&long long v182 = 0;
              *((void *)&v182 + 1) = v128;
              *(void *)v183 = v130;
              double y = v164;
              double x = v165;
              *(_OWORD *)&v183[8] = v169;
              *(_OWORD *)&v183[24] = v168;
              *(void *)&v183[40] = v166;
              v135(v173, &v184, &v174, 2295210291, 0, v198);
            }
            *(void *)&long long v174 = v9;
            *((void *)&v174 + 1) = v14;
            *(void *)&long long v175 = v17 - 1;
            *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v137 = [v167 layout:self generationStateForItemAtIndexPath:&v174];
            if (v137)
            {
              uint64_t v138 = v137;
              -[AEMessagesShelfLayout _generationButtonFrameForGridFrame:](self, "_generationButtonFrameForGridFrame:", x, y, width, height);
              uint64_t v140 = v139;
              uint64_t v142 = v141;
              uint64_t v144 = v143;
              uint64_t v146 = v145;
              PXRectGetCenter();
              uint64_t v148 = v147;
              uint64_t v150 = v149;
              *(void *)&long long v174 = v9;
              *((void *)&v174 + 1) = v14;
              *(void *)&long long v175 = v17 - 1;
              *((void *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              [(AEMessagesShelfLayout *)self _zPositionForShelfTileKind:1277777777 atIndexPath:&v174];
              v151 = (void (*)(void *, long long *, long long *, uint64_t, void, unsigned char *))v173[2];
              long long v184 = xmmword_22B548130;
              uint64_t v185 = v9;
              uint64_t v186 = v14;
              uint64_t v187 = v17 - 1;
              v188[0] = v138;
              memset(&v188[1], 0, 40);
              *(void *)&long long v174 = v140;
              *((void *)&v174 + 1) = v142;
              *(void *)&long long v175 = v144;
              *((void *)&v175 + 1) = v146;
              *(void *)&long long v176 = v148;
              *((void *)&v176 + 1) = v150;
              *(void *)&long long v177 = v144;
              *((void *)&v177 + 1) = v146;
              long long v178 = v172;
              long long v179 = v171;
              long long v180 = v170;
              *(void *)&long long v181 = 0x3FF0000000000000;
              *((void *)&v181 + 1) = v152;
              *(void *)&long long v182 = 0;
              *((void *)&v182 + 1) = v144;
              *(void *)v183 = v146;
              *(_OWORD *)&v183[8] = v169;
              *(_OWORD *)&v183[24] = v168;
              *(void *)&v183[40] = v166;
              v151(v173, &v184, &v174, 2555555555, 0, v198);
            }
            uint64_t v7 = v173;
            uint64_t v16 = v161;
          }
          if (v17 >= v16) {
            break;
          }
          ++v17;
        }
        while (!v198[0]);
      }
      ++v14;
      v153 = [(PXAssetsTilingLayout *)self dataSource];
      uint64_t v154 = [v153 numberOfSections];
      int v155 = v198[0];
    }
    while (v14 < v154 && !v155);
  }
}

void __69__AEMessagesShelfLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v11 = [v0 objectForKey:@"AssetExplorer_ShowLoopBadges"];

  if (v11) {
    char v1 = [v11 BOOLValue];
  }
  else {
    char v1 = enumerateTilesInRect_withOptions_usingBlock__canShowLoopBadges != 0;
  }
  enumerateTilesInRect_withOptions_usingBlock__canShowLoopBadges = v1;
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v3 = [v2 objectForKey:@"AssetExplorer_ShowLoopVideos"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = enumerateTilesInRect_withOptions_usingBlock__canShowLoopOverlays != 0;
  }
  enumerateTilesInRect_withOptions_usingBlock__canShowLoopOverlays = v4;
  double v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = [v5 objectForKey:@"AssetExplorer_ShowVideos"];

  if (v6) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = enumerateTilesInRect_withOptions_usingBlock__canShowVideoOverlays != 0;
  }
  enumerateTilesInRect_withOptions_usingBlock__canShowVideoOverlays = v7;
  double v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v9 = [v8 objectForKey:@"AssetExplorer_ShowAnimatedImages"];

  if (v9) {
    char v10 = [v9 BOOLValue];
  }
  else {
    char v10 = enumerateTilesInRect_withOptions_usingBlock__canShowAnimatedImageOverlays != 0;
  }
  enumerateTilesInRect_withOptions_usingBlock__canShowAnimatedImageOverlays = v10;
}

- (CGRect)contentBounds
{
  double currentContentWidth = self->_currentContentWidth;
  [(PXTilingLayout *)self referenceSize];
  double v4 = v3;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = currentContentWidth;
  result.size.double height = v4;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)setReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXTilingLayout *)self referenceSize];
  if (v7 != width || v6 != height)
  {
    v9.receiver = self;
    v9.super_class = (Class)AEMessagesShelfLayout;
    -[PXTilingLayout setReferenceSize:](&v9, sel_setReferenceSize_, width, height);
    [(PXTilingLayout *)self invalidateLayout];
  }
}

- (void)dealloc
{
  itemFramesForCurrentDataSource = self->_itemFramesForCurrentDataSource;
  if (itemFramesForCurrentDataSource)
  {
    free(itemFramesForCurrentDataSource);
    self->_itemFramesForCurrentDataSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AEMessagesShelfLayout;
  [(AEMessagesShelfLayout *)&v4 dealloc];
}

@end