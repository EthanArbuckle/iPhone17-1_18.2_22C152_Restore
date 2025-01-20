@interface CEKDynamicTickMarksView
- (BOOL)_bounds:(CGRect)a3 containsTickMarkAtIndex:(unint64_t)a4;
- (BOOL)_isUsingCells;
- (BOOL)_isUsingImages;
- (BOOL)_needsTickMarkRefresh;
- (BOOL)_waveAnimationDelayActive;
- (BOOL)highlightSelectedIndex;
- (BOOL)isEnabled;
- (CEKDynamicTickMarksView)initWithFrame:(CGRect)a3;
- (CEKSliderTickMarksDelegate)delegate;
- (CEKTickMarksCellDataProvider)cellDataProvider;
- (CEKTickMarksImageDataProvider)imageDataProvider;
- (CGAffineTransform)contentTransform;
- (CGRect)_frameForTickMarkAtIndex:(unint64_t)a3 selected:(BOOL)a4;
- (CGRect)frameForTickMarkAtIndex:(unint64_t)a3;
- (CGRect)visibleBounds;
- (NSIndexSet)_installedTickMarkIndexes;
- (NSIndexSet)_selectedIndexes;
- (NSIndexSet)magneticTickMarkIndexes;
- (NSMutableDictionary)_tickMarksByIndex;
- (NSMutableIndexSet)_waveIndexes;
- (NSMutableSet)_tickMarksReusePool;
- (_TtC13CameraEditKit14TickMarksModel)tickMarksModel;
- (_TtC13CameraEditKit24TickMarksVisibilityModel)_tickMarksVisibilityModel;
- (double)_lengthForMagneticTickMark;
- (double)_lengthForSelectedTickMark;
- (double)_lengthForStandardTickMark;
- (id)_colorForTickMarkAtIndex:(unint64_t)a3 selected:(BOOL)a4 isTickEnabled:(BOOL)a5;
- (id)_indexesIntersectingVisibleBounds;
- (unint64_t)selectedTickMarkIndex;
- (void)_configureHighlightForTickMark:(id)a3 atIndex:(unint64_t)a4;
- (void)_configureTickMark:(id)a3 forIndex:(unint64_t)a4;
- (void)_configureTickMark:(id)a3 forIndex:(unint64_t)a4 selected:(BOOL)a5;
- (void)_dequeueAndInstallTickMarkForIndex:(unint64_t)a3;
- (void)_destroyAllTickMarks;
- (void)_layoutDynamicCellTickMark:(id)a3 atIndex:(unint64_t)a4;
- (void)_recycleTickMarks;
- (void)_refreshTickMarks;
- (void)_refreshTickMarksHighlight;
- (void)_removeAndEnqueueTickMarkAtIndex:(unint64_t)a3;
- (void)_setInstalledTickMarkIndexes:(id)a3;
- (void)_setNeedsRefreshTickMarks;
- (void)_setSelectedIndexes:(id)a3;
- (void)_setWaveAnimationDelayActive:(BOOL)a3;
- (void)_setWaveIndexes:(id)a3;
- (void)layoutSubviews;
- (void)performWaveAnimation;
- (void)setCellDataProvider:(id)a3;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setContentTransform:(CGAffineTransform *)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlightSelectedIndex:(BOOL)a3;
- (void)setHighlightSelectedIndex:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageDataProvider:(id)a3;
- (void)setMagneticTickMarkIndexes:(id)a3;
- (void)setSelectedTickMarkIndex:(unint64_t)a3;
- (void)setSelectedTickMarkIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setVisibleBounds:(CGRect)a3;
- (void)tickMarksModelDidChangeWidthForTickMarkCountWithModel:(id)a3;
@end

@implementation CEKDynamicTickMarksView

- (CEKDynamicTickMarksView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CEKDynamicTickMarksView;
  v3 = -[CEKDynamicTickMarksView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_TtC13CameraEditKit14TickMarksModel);
    tickMarksModel = v3->_tickMarksModel;
    v3->_tickMarksModel = v4;

    [(TickMarksModel *)v3->_tickMarksModel setTickMarkWidth:2.0];
    [(TickMarksModel *)v3->_tickMarksModel setDataSource:v3];
    [(TickMarksModel *)v3->_tickMarksModel setDelegate:v3];
    uint64_t v6 = [MEMORY[0x1E4F28D60] indexSet];
    installedTickMarkIndexes = v3->__installedTickMarkIndexes;
    v3->__installedTickMarkIndexes = (NSIndexSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E60] indexSet];
    waveIndexes = v3->__waveIndexes;
    v3->__waveIndexes = (NSMutableIndexSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    tickMarksByIndex = v3->__tickMarksByIndex;
    v3->__tickMarksByIndex = (NSMutableDictionary *)v10;

    v12 = [[_TtC13CameraEditKit24TickMarksVisibilityModel alloc] initWithModel:v3->_tickMarksModel];
    tickMarksVisibilityModel = v3->__tickMarksVisibilityModel;
    v3->__tickMarksVisibilityModel = v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    tickMarksReusePool = v3->__tickMarksReusePool;
    v3->__tickMarksReusePool = (NSMutableSet *)v14;

    uint64_t v16 = MEMORY[0x1E4F1DAB8];
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v3->_contentTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v3->_contentTransform.c = v17;
    *(_OWORD *)&v3->_contentTransform.tx = *(_OWORD *)(v16 + 32);
    uint64_t v18 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    selectedIndexes = v3->__selectedIndexes;
    v3->__selectedIndexes = (NSIndexSet *)v18;

    v3->_enabled = 1;
  }
  return v3;
}

- (void)layoutSubviews
{
  [(CEKDynamicTickMarksView *)self _recycleTickMarks];
  if ([(CEKDynamicTickMarksView *)self _needsTickMarkRefresh])
  {
    [(CEKDynamicTickMarksView *)self _refreshTickMarks];
  }
}

- (void)setVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_visibleBounds = &self->_visibleBounds;
  if (!CGRectEqualToRect(a3, self->_visibleBounds))
  {
    p_visibleBounds->origin.CGFloat x = x;
    p_visibleBounds->origin.CGFloat y = y;
    p_visibleBounds->size.CGFloat width = width;
    p_visibleBounds->size.CGFloat height = height;
    [(CEKDynamicTickMarksView *)self setNeedsLayout];
  }
}

- (void)setSelectedTickMarkIndex:(unint64_t)a3
{
}

- (void)setSelectedTickMarkIndex:(unint64_t)a3 animated:(BOOL)a4
{
  selectedTickMarkIndeCGFloat x = self->_selectedTickMarkIndex;
  if (selectedTickMarkIndex != a3)
  {
    BOOL v5 = a4;
    self->_selectedTickMarkIndeCGFloat x = a3;
    uint64_t v8 = [(CEKDynamicTickMarksView *)self _tickMarksByIndex];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke;
    aBlock[3] = &unk_1E63CD488;
    id v9 = v8;
    id v40 = v9;
    v41 = self;
    uint64_t v10 = _Block_copy(aBlock);
    if (selectedTickMarkIndex <= a3) {
      unint64_t v11 = a3;
    }
    else {
      unint64_t v11 = selectedTickMarkIndex;
    }
    if (selectedTickMarkIndex >= a3) {
      unint64_t v12 = a3;
    }
    else {
      unint64_t v12 = selectedTickMarkIndex;
    }
    unint64_t v13 = v11 - v12;
    if (v5) {
      unint64_t v14 = v12;
    }
    else {
      unint64_t v14 = a3;
    }
    if (v5) {
      uint64_t v15 = v13 + 1;
    }
    else {
      uint64_t v15 = 1;
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", v14, v15);
    [v16 removeIndex:selectedTickMarkIndex];
    long long v17 = [(CEKDynamicTickMarksView *)self _selectedIndexes];
    [(CEKDynamicTickMarksView *)self _setSelectedIndexes:v16];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_2;
    v37[3] = &unk_1E63CD4B0;
    id v18 = v10;
    id v38 = v18;
    [v16 enumerateIndexesUsingBlock:v37];
    if (v5)
    {
      v19 = [MEMORY[0x1E4FB1EE0] behaviorWithDampingRatio:0.75 response:0.4];
      v20 = (void *)MEMORY[0x1E4FB1EB0];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_4;
      v32[3] = &unk_1E63CD4D8;
      id v33 = v17;
      id v34 = v18;
      id v21 = v18;
      [v20 _animateUsingSpringBehavior:v19 tracking:0 animations:v32 completion:0];
      objc_initWeak(&location, self);
      dispatch_time_t v22 = dispatch_time(0, 20000000);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_6;
      v26[3] = &unk_1E63CD550;
      objc_copyWeak(v30, &location);
      id v23 = v16;
      v30[1] = (id)a3;
      id v27 = v23;
      id v28 = v19;
      id v29 = v9;
      id v24 = v19;
      dispatch_after(v22, MEMORY[0x1E4F14428], v26);

      objc_destroyWeak(v30);
      objc_destroyWeak(&location);
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_3;
      v35[3] = &unk_1E63CD4B0;
      id v36 = v18;
      id v25 = v18;
      [v17 enumerateIndexesUsingBlock:v35];
      id v24 = v36;
    }
  }
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (a3) {
    [v8 _removeAllRetargetableAnimations:0];
  }
  [*(id *)(a1 + 40) _configureTickMark:v8 forIndex:a2 selected:a3];
}

uint64_t __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_5;
  v2[3] = &unk_1E63CD4B0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateIndexesUsingBlock:v2];
}

uint64_t __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_6(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v2 = objc_loadWeakRetained(&to);
  id v3 = [v2 _selectedIndexes];
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28E60] indexSetWithIndex:*(void *)(a1 + 64)];
    id v6 = objc_loadWeakRetained(&to);
    [v6 _setSelectedIndexes:v5];

    v7 = *(void **)(a1 + 32);
    id v8 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "removeIndex:", objc_msgSend(v8, "selectedTickMarkIndex"));

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_7;
    v10[3] = &unk_1E63CD528;
    id v9 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    objc_copyWeak(&v13, &to);
    id v12 = *(id *)(a1 + 48);
    [v9 enumerateIndexesUsingBlock:v10];

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&to);
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_7(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_8;
  v6[3] = &unk_1E63CD500;
  objc_copyWeak(v8, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  v8[1] = a2;
  [v4 _animateUsingSpringBehavior:v5 tracking:0 animations:v6 completion:0];

  objc_destroyWeak(v8);
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v4 = [v2 objectForKeyedSubscript:v3];
  [WeakRetained _configureTickMark:v4 forIndex:*(void *)(a1 + 48) selected:0];
}

- (void)setHighlightSelectedIndex:(BOOL)a3
{
}

- (void)setHighlightSelectedIndex:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlightSelectedIndex != a3)
  {
    self->_highlightSelectedIndeCGFloat x = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __62__CEKDynamicTickMarksView_setHighlightSelectedIndex_animated___block_invoke;
      v4[3] = &unk_1E63CD380;
      v4[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v4 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      [(CEKDynamicTickMarksView *)self _refreshTickMarksHighlight];
    }
  }
}

uint64_t __62__CEKDynamicTickMarksView_setHighlightSelectedIndex_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshTickMarksHighlight];
}

- (void)performWaveAnimation
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  [(CEKDynamicTickMarksView *)self _setWaveIndexes:v3];

  [(CEKDynamicTickMarksView *)self bounds];
  if (v4 != 0.0)
  {
    uint64_t v5 = [(CEKDynamicTickMarksView *)self _installedTickMarkIndexes];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__CEKDynamicTickMarksView_performWaveAnimation__block_invoke;
    v6[3] = &unk_1E63CD5C8;
    void v6[4] = self;
    [v5 enumerateIndexesUsingBlock:v6];
  }
}

void __47__CEKDynamicTickMarksView_performWaveAnimation__block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) selectedTickMarkIndex] != a2)
  {
    [*(id *)(a1 + 32) _setWaveAnimationDelayActive:1];
    double v4 = [*(id *)(a1 + 32) _tickMarksByIndex];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
    id v6 = [v4 objectForKeyedSubscript:v5];

    id v7 = [*(id *)(a1 + 32) _waveIndexes];
    [v7 addIndex:a2];

    [*(id *)(a1 + 32) _configureTickMark:v6 forIndex:a2];
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__CEKDynamicTickMarksView_performWaveAnimation__block_invoke_2;
    v9[3] = &unk_1E63CD5A0;
    v9[4] = *(void *)(a1 + 32);
    v9[5] = a2;
    dispatch_after(v8, MEMORY[0x1E4F14428], v9);
  }
}

void __47__CEKDynamicTickMarksView_performWaveAnimation__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _tickMarksByIndex];
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  double v4 = [v2 objectForKeyedSubscript:v3];

  uint64_t v5 = [*(id *)(a1 + 32) _tickMarksByIndex];
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "selectedTickMarkIndex"));
  id v7 = [v5 objectForKeyedSubscript:v6];

  [v4 center];
  double v9 = v8;
  [v7 center];
  double v11 = v9 - v10;
  [*(id *)(a1 + 32) bounds];
  double v13 = fabs(v11 / v12);
  [*(id *)(a1 + 32) _setWaveAnimationDelayActive:0];
  [*(id *)(a1 + 32) _configureTickMark:v4 forIndex:*(void *)(a1 + 40)];
  unint64_t v14 = objc_alloc_init(CEKFluidBehaviorSettings);
  [(CEKFluidBehaviorSettings *)v14 setDefaultValues];
  [(CEKFluidBehaviorSettings *)v14 setDampingRatio:0.6];
  [(CEKFluidBehaviorSettings *)v14 setResponse:v13 * 3.0 + 0.6];
  [(CEKFluidBehaviorSettings *)v14 setRetargetImpulse:0.2];
  uint64_t v15 = (void *)MEMORY[0x1E4FB1EB0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__CEKDynamicTickMarksView_performWaveAnimation__block_invoke_3;
  v19[3] = &unk_1E63CD578;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  id v20 = v4;
  uint64_t v21 = v17;
  v19[4] = v16;
  id v18 = v4;
  objc_msgSend(v15, "cek_animateWithSettings:mode:animations:completion:", v14, 3, v19, 0);
}

uint64_t __47__CEKDynamicTickMarksView_performWaveAnimation__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _waveIndexes];
  [v2 removeIndex:*(void *)(a1 + 48)];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v3 _configureTickMark:v4 forIndex:v5];
}

- (id)_colorForTickMarkAtIndex:(unint64_t)a3 selected:(BOOL)a4 isTickEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4 && [(CEKDynamicTickMarksView *)self isEnabled])
  {
    id v7 = [(CEKDynamicTickMarksView *)self tintColor];
    if (!v5)
    {
LABEL_4:
      id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.4];
      goto LABEL_7;
    }
  }
  else
  {
    double v9 = [(CEKDynamicTickMarksView *)self tickMarksModel];
    id v7 = [v9 mainTickMarkColor];

    if (!v5) {
      goto LABEL_4;
    }
  }
  id v8 = v7;
LABEL_7:
  double v10 = v8;

  return v10;
}

- (void)_configureTickMark:(id)a3 forIndex:(unint64_t)a4
{
  id v6 = a3;
  [(CEKDynamicTickMarksView *)self _configureTickMark:v6 forIndex:a4 selected:[(CEKDynamicTickMarksView *)self selectedTickMarkIndex] == a4];
}

- (void)_configureTickMark:(id)a3 forIndex:(unint64_t)a4 selected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    double v9 = [(CEKDynamicTickMarksView *)self tickMarksModel];
    unint64_t v10 = [v9 tickMarksCount];

    if (v10 > a4)
    {
      [(CEKDynamicTickMarksView *)self _frameForTickMarkAtIndex:a4 selected:v5];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      if ([(CEKDynamicTickMarksView *)self _isUsingCells])
      {
        v19 = [(CEKDynamicTickMarksView *)self cellDataProvider];
        id v20 = [v19 configurationAtIndex:a4];

        id v21 = v8;
        [v21 setContentConfiguration:v20];
        [(CEKDynamicTickMarksView *)self contentTransform];
        v45[0] = v45[3];
        v45[1] = v45[4];
        v45[2] = v45[5];
        [v21 setTransform:v45];
        dispatch_time_t v22 = [(CEKDynamicTickMarksView *)self _colorForTickMarkAtIndex:a4 selected:v5 isTickEnabled:1];
        [v21 setTintColor:v22];

        [v21 setAccessibilityIgnoresInvertColors:1];
        [(CEKDynamicTickMarksView *)self _layoutDynamicCellTickMark:v21 atIndex:a4];
LABEL_7:

        goto LABEL_26;
      }
      if ([(CEKDynamicTickMarksView *)self _isUsingImages])
      {
        id v23 = [(CEKDynamicTickMarksView *)self imageDataProvider];
        id v20 = [v23 imageForTickMarkAtIndex:a4];

        id v24 = [(CEKDynamicTickMarksView *)self imageDataProvider];
        int v25 = [v24 isDisabledAtIndex:a4];

        id v21 = v8;
        [v21 setImage:v20];
        [(CEKDynamicTickMarksView *)self contentTransform];
        v44[0] = v44[3];
        v44[1] = v44[4];
        v44[2] = v44[5];
        [v21 setTransform:v44];
        v26 = [(CEKDynamicTickMarksView *)self _colorForTickMarkAtIndex:a4 selected:v5 isTickEnabled:v25 ^ 1u];
        [v21 setTintColor:v26];

        [v21 setAccessibilityIgnoresInvertColors:1];
        [(CEKDynamicTickMarksView *)self _configureHighlightForTickMark:v21 atIndex:a4];
        goto LABEL_7;
      }
      objc_msgSend(v8, "setFrame:", v12, v14, v16, v18);
      [v8 frame];
      double v28 = v27 * 0.5;
      id v29 = [v8 layer];
      [v29 setCornerRadius:v28];

      [v8 setAccessibilityIgnoresInvertColors:1];
      v30 = [(CEKDynamicTickMarksView *)self tickMarksModel];
      int v31 = [v30 isMainTickMarkAtIndex:a4];

      v32 = [(CEKDynamicTickMarksView *)self magneticTickMarkIndexes];
      int v33 = [v32 containsIndex:a4];

      id v34 = [(CEKDynamicTickMarksView *)self tickMarksModel];
      if ([v34 endTickMarksProminent])
      {
        if (a4)
        {
          v35 = [(CEKDynamicTickMarksView *)self tickMarksModel];
          BOOL v36 = [v35 tickMarksCount] - 1 == a4;
        }
        else
        {
          BOOL v36 = 1;
        }
      }
      else
      {
        BOOL v36 = 0;
      }

      if (v5)
      {
        BOOL v37 = [(CEKDynamicTickMarksView *)self _waveAnimationDelayActive];
      }
      else
      {
        id v38 = [(CEKDynamicTickMarksView *)self _tickMarksVisibilityModel];
        BOOL v37 = ([v38 shouldHideTickMarkAtIndex:a4] & 1) != 0
           || [(CEKDynamicTickMarksView *)self _waveAnimationDelayActive];
      }
      double v39 = 0.4;
      if (v31) {
        double v39 = 0.7;
      }
      if (v33 | v5 || v36) {
        double v39 = 1.0;
      }
      if (v37) {
        double v39 = 0.0;
      }
      [v8 setAlpha:v39];
      id v40 = (void *)MEMORY[0x1E4FB1EB0];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __64__CEKDynamicTickMarksView__configureTickMark_forIndex_selected___block_invoke;
      v41[3] = &unk_1E63CD578;
      unint64_t v43 = a4;
      v41[4] = self;
      id v42 = v8;
      [v40 performWithoutAnimation:v41];
    }
  }
LABEL_26:
}

void __64__CEKDynamicTickMarksView__configureTickMark_forIndex_selected___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_colorForTickMarkAtIndex:selected:isTickEnabled:", *(void *)(a1 + 48), *(void *)(a1 + 48) == objc_msgSend(*(id *)(a1 + 32), "selectedTickMarkIndex"), 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setBackgroundColor:v2];
}

- (void)_configureHighlightForTickMark:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(CEKDynamicTickMarksView *)self _isUsingImages])
  {
    unint64_t v7 = [(CEKDynamicTickMarksView *)self selectedTickMarkIndex];
    [(CEKDynamicTickMarksView *)self _frameForTickMarkAtIndex:a4 selected:v7 == a4];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    id v16 = v6;
    double v17 = [(CEKDynamicTickMarksView *)self imageDataProvider];
    [v17 sizeForImageAtIndex:a4];

    BOOL v18 = [(CEKDynamicTickMarksView *)self highlightSelectedIndex];
    double v19 = 1.0;
    if (v7 == a4 && v18)
    {
      memset(&v21, 0, sizeof(v21));
      CGAffineTransformMakeScale(&v21, 0.75, 0.75);
      double v19 = 0.6;
    }
    v22.origin.CGFloat x = v9;
    v22.origin.CGFloat y = v11;
    v22.size.CGFloat width = v13;
    v22.size.CGFloat height = v15;
    CGRectGetMidX(v22);
    [(CEKDynamicTickMarksView *)self bounds];
    CGRectGetMidY(v23);
    CEKRectWithSize();
    id v20 = [(CEKDynamicTickMarksView *)self traitCollection];
    [v20 displayScale];
    UIRectCenteredAboutPointScale();

    UIRectGetCenter();
    objc_msgSend(v16, "setCenter:");
    [v16 setBounds:CEKRectWithSize()];
    [v16 setAlpha:v19];
  }
}

- (void)_layoutDynamicCellTickMark:(id)a3 atIndex:(unint64_t)a4
{
  id v18 = a3;
  if ([(CEKDynamicTickMarksView *)self _isUsingCells])
  {
    [(CEKDynamicTickMarksView *)self _frameForTickMarkAtIndex:a4 selected:[(CEKDynamicTickMarksView *)self selectedTickMarkIndex] == a4];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v14 = [(CEKDynamicTickMarksView *)self traitCollection];
    [v14 displayScale];

    v20.origin.CGFloat x = v7;
    v20.origin.CGFloat y = v9;
    v20.size.CGFloat width = v11;
    v20.size.CGFloat height = v13;
    double MidX = CGRectGetMidX(v20);
    [(CEKDynamicTickMarksView *)self bounds];
    double MidY = CGRectGetMidY(v21);
    double v17 = [v18 contentConfiguration];
    [v17 contentSize];
    UISizeCeilToScale();

    CEKRectWithSize();
    UIRectCenteredAboutPointScale();
    objc_msgSend(v18, "setCenter:", MidX, MidY);
    [v18 setBounds:CEKRectWithSize()];
  }
}

- (double)_lengthForSelectedTickMark
{
  [(CEKDynamicTickMarksView *)self bounds];
  return v2;
}

- (double)_lengthForMagneticTickMark
{
  [(CEKDynamicTickMarksView *)self bounds];
  UIRoundToViewScale();
  return result;
}

- (double)_lengthForStandardTickMark
{
  [(CEKDynamicTickMarksView *)self bounds];
  UIRoundToViewScale();
  return result;
}

- (CGRect)frameForTickMarkAtIndex:(unint64_t)a3
{
  BOOL v5 = [(CEKDynamicTickMarksView *)self selectedTickMarkIndex] == a3;
  [(CEKDynamicTickMarksView *)self _frameForTickMarkAtIndex:a3 selected:v5];
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (CGRect)_frameForTickMarkAtIndex:(unint64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(CEKDynamicTickMarksView *)self tickMarksModel];
  if ([v7 endTickMarksProminent])
  {
    if (a3) {
      BOOL v8 = a3 + 1 == [v7 tickMarksCount];
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  double v9 = [(CEKDynamicTickMarksView *)self magneticTickMarkIndexes];
  int v10 = [v9 containsIndex:a3];

  if (v4)
  {
    [(CEKDynamicTickMarksView *)self _lengthForSelectedTickMark];
  }
  else if ((v10 | v8) == 1)
  {
    [(CEKDynamicTickMarksView *)self _lengthForMagneticTickMark];
  }
  else
  {
    [(CEKDynamicTickMarksView *)self _lengthForStandardTickMark];
  }
  double v12 = v11;
  [v7 xOffsetForTickMarkIndex:a3];
  double v14 = v13;
  CGFloat v15 = [(CEKDynamicTickMarksView *)self _waveIndexes];
  int v16 = [v15 containsIndex:a3];

  if (v16) {
    double v12 = 0.1;
  }
  [(CEKDynamicTickMarksView *)self bounds];
  double v18 = v17 - v12;
  [v7 tickMarkWidth];
  double v20 = v19;

  double v21 = v14;
  double v22 = v18;
  double v23 = v20;
  double v24 = v12;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (void)_recycleTickMarks
{
  id v3 = [(CEKDynamicTickMarksView *)self _indexesIntersectingVisibleBounds];
  BOOL v4 = [(CEKDynamicTickMarksView *)self _installedTickMarkIndexes];
  BOOL v5 = (void *)[v4 mutableCopy];
  [v5 removeIndexes:v3];
  double v6 = (void *)[v3 mutableCopy];
  [v6 removeIndexes:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __44__CEKDynamicTickMarksView__recycleTickMarks__block_invoke;
  v8[3] = &unk_1E63CD5C8;
  v8[4] = self;
  [v5 enumerateIndexesUsingBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CEKDynamicTickMarksView__recycleTickMarks__block_invoke_2;
  v7[3] = &unk_1E63CD5C8;
  v7[4] = self;
  [v6 enumerateIndexesUsingBlock:v7];
  [(CEKDynamicTickMarksView *)self _setInstalledTickMarkIndexes:v3];
}

uint64_t __44__CEKDynamicTickMarksView__recycleTickMarks__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeAndEnqueueTickMarkAtIndex:a2];
}

uint64_t __44__CEKDynamicTickMarksView__recycleTickMarks__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dequeueAndInstallTickMarkForIndex:a2];
}

- (void)_setNeedsRefreshTickMarks
{
  self->__needsTickMarkRefresh = 1;
  [(CEKDynamicTickMarksView *)self setNeedsLayout];
}

- (void)_refreshTickMarks
{
  id v3 = [(CEKDynamicTickMarksView *)self _installedTickMarkIndexes];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__CEKDynamicTickMarksView__refreshTickMarks__block_invoke;
  v4[3] = &unk_1E63CD5C8;
  v4[4] = self;
  [v3 enumerateIndexesUsingBlock:v4];

  self->__needsTickMarkRefresh = 0;
}

void __44__CEKDynamicTickMarksView__refreshTickMarks__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = [v3 _tickMarksByIndex];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  BOOL v5 = [v6 objectForKeyedSubscript:v4];
  [v3 _configureTickMark:v5 forIndex:a2];
}

- (void)_refreshTickMarksHighlight
{
  id v3 = [(CEKDynamicTickMarksView *)self _installedTickMarkIndexes];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__CEKDynamicTickMarksView__refreshTickMarksHighlight__block_invoke;
  v4[3] = &unk_1E63CD5C8;
  v4[4] = self;
  [v3 enumerateIndexesUsingBlock:v4];
}

void __53__CEKDynamicTickMarksView__refreshTickMarksHighlight__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = [v3 _tickMarksByIndex];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  BOOL v5 = [v6 objectForKeyedSubscript:v4];
  [v3 _configureHighlightForTickMark:v5 atIndex:a2];
}

- (id)_indexesIntersectingVisibleBounds
{
  id v3 = [(CEKDynamicTickMarksView *)self tickMarksModel];
  uint64_t v4 = [v3 tickMarksCount];

  if (!v4) {
    goto LABEL_5;
  }
  [(CEKDynamicTickMarksView *)self visibleBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(CEKDynamicTickMarksView *)self tickMarksModel];
  uint64_t v14 = [v13 floorTickMarkIndexForXOffset:v6];

  if (!-[CEKDynamicTickMarksView _bounds:containsTickMarkAtIndex:](self, "_bounds:containsTickMarkAtIndex:", v14, v6, v8, v10, v12)&& !-[CEKDynamicTickMarksView _bounds:containsTickMarkAtIndex:](self, "_bounds:containsTickMarkAtIndex:", ++v14, v6, v8, v10, v12))
  {
    goto LABEL_5;
  }
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v16 = [(CEKDynamicTickMarksView *)self tickMarksModel];
    v20.origin.CGFloat x = v6;
    v20.origin.CGFloat y = v8;
    v20.size.CGFloat width = v10;
    v20.size.CGFloat height = v12;
    uint64_t v17 = [v16 floorTickMarkIndexForXOffset:CGRectGetMaxX(v20)];

    CGFloat v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v14, v17 - v14 + 1);
  }
  else
  {
LABEL_5:
    CGFloat v15 = [MEMORY[0x1E4F28D60] indexSet];
  }
  return v15;
}

- (BOOL)_bounds:(CGRect)a3 containsTickMarkAtIndex:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CEKDynamicTickMarksView *)self frameForTickMarkAtIndex:a4];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  return CGRectIntersectsRect(*(CGRect *)&v16, *(CGRect *)&v9);
}

- (void)_dequeueAndInstallTickMarkForIndex:(unint64_t)a3
{
  id v10 = [(CEKDynamicTickMarksView *)self _tickMarksReusePool];
  uint64_t v5 = [v10 anyObject];
  if (v5)
  {
    id v6 = (id)v5;
    [v10 removeObject:v5];
  }
  else
  {
    if ([(CEKDynamicTickMarksView *)self _isUsingCells])
    {
      double v7 = (objc_class *)CEKDynamicTickCell;
    }
    else if ([(CEKDynamicTickMarksView *)self _isUsingImages])
    {
      double v7 = (objc_class *)MEMORY[0x1E4FB1838];
    }
    else
    {
      double v7 = (objc_class *)MEMORY[0x1E4FB1EB0];
    }
    id v6 = objc_alloc_init(v7);
  }
  [(CEKDynamicTickMarksView *)self addSubview:v6];
  uint64_t v8 = [(CEKDynamicTickMarksView *)self _tickMarksByIndex];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v8 setObject:v6 forKeyedSubscript:v9];

  [(CEKDynamicTickMarksView *)self _configureTickMark:v6 forIndex:a3];
}

- (void)_removeAndEnqueueTickMarkAtIndex:(unint64_t)a3
{
  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  uint64_t v4 = [(CEKDynamicTickMarksView *)self _tickMarksByIndex];
  uint64_t v5 = [v4 objectForKeyedSubscript:v8];

  id v6 = [(CEKDynamicTickMarksView *)self _tickMarksByIndex];
  [v6 setObject:0 forKeyedSubscript:v8];

  [v5 removeFromSuperview];
  [v5 _removeAllRetargetableAnimations:0];
  double v7 = [(CEKDynamicTickMarksView *)self _tickMarksReusePool];
  [v7 addObject:v5];
}

- (void)_destroyAllTickMarks
{
  id v3 = [(CEKDynamicTickMarksView *)self _installedTickMarkIndexes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CEKDynamicTickMarksView__destroyAllTickMarks__block_invoke;
  v7[3] = &unk_1E63CD5C8;
  v7[4] = self;
  [v3 enumerateIndexesUsingBlock:v7];

  uint64_t v4 = [(CEKDynamicTickMarksView *)self _tickMarksReusePool];
  [v4 removeAllObjects];

  uint64_t v5 = [MEMORY[0x1E4F28D60] indexSet];
  [(CEKDynamicTickMarksView *)self _setInstalledTickMarkIndexes:v5];

  id v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", -[CEKDynamicTickMarksView selectedTickMarkIndex](self, "selectedTickMarkIndex"));
  [(CEKDynamicTickMarksView *)self _setSelectedIndexes:v6];
}

uint64_t __47__CEKDynamicTickMarksView__destroyAllTickMarks__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeAndEnqueueTickMarkAtIndex:a2];
}

- (void)tickMarksModelDidChangeWidthForTickMarkCountWithModel:(id)a3
{
  [(CEKDynamicTickMarksView *)self _setNeedsRefreshTickMarks];
  uint64_t v4 = [(CEKDynamicTickMarksView *)self _tickMarksVisibilityModel];
  [v4 setNeedsRebuild];

  id v5 = [(CEKDynamicTickMarksView *)self delegate];
  [v5 tickMarksViewDidChangeWidthForTickMarkCount:self];
}

- (void)setImageDataProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageDataProvider);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_imageDataProvider);
    BOOL v7 = v6 == 0;

    id v8 = objc_storeWeak((id *)&self->_imageDataProvider, obj);
    if (((v7 ^ (obj != 0)) & 1) == 0) {
      [(CEKDynamicTickMarksView *)self _destroyAllTickMarks];
    }
    [(CEKDynamicTickMarksView *)self reloadContent];
    id v5 = obj;
  }
}

- (BOOL)_isUsingImages
{
  double v2 = [(CEKDynamicTickMarksView *)self imageDataProvider];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setCellDataProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellDataProvider);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_cellDataProvider);
    BOOL v7 = v6 == 0;

    id v8 = objc_storeWeak((id *)&self->_cellDataProvider, obj);
    if (((v7 ^ (obj != 0)) & 1) == 0) {
      [(CEKDynamicTickMarksView *)self _destroyAllTickMarks];
    }
    [(CEKDynamicTickMarksView *)self reloadContent];
    id v5 = obj;
  }
}

- (BOOL)_isUsingCells
{
  if ([(CEKDynamicTickMarksView *)self _isUsingImages]) {
    return 0;
  }
  uint64_t v4 = [(CEKDynamicTickMarksView *)self cellDataProvider];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  [(CEKDynamicTickMarksView *)self setContentTransform:v4 animated:0];
}

- (void)setContentTransform:(CGAffineTransform *)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_contentTransform = &self->_contentTransform;
  long long v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v8;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
  long long v9 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&self->_contentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if (v4)
    {
      [(CEKDynamicTickMarksView *)self layoutIfNeeded];
      long long v10 = *(_OWORD *)&a3->a;
      long long v11 = *(_OWORD *)&a3->tx;
      *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
      *(_OWORD *)&p_contentTransform->tCGFloat x = v11;
      *(_OWORD *)&p_contentTransform->a = v10;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__CEKDynamicTickMarksView_setContentTransform_animated___block_invoke;
      v14[3] = &unk_1E63CD380;
      v14[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v14 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      long long v12 = *(_OWORD *)&a3->a;
      long long v13 = *(_OWORD *)&a3->tx;
      *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
      *(_OWORD *)&p_contentTransform->tCGFloat x = v13;
      *(_OWORD *)&p_contentTransform->a = v12;
      [(CEKDynamicTickMarksView *)self _refreshTickMarks];
    }
  }
}

uint64_t __56__CEKDynamicTickMarksView_setContentTransform_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshTickMarks];
}

- (CEKTickMarksImageDataProvider)imageDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageDataProvider);
  return (CEKTickMarksImageDataProvider *)WeakRetained;
}

- (CEKTickMarksCellDataProvider)cellDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellDataProvider);
  return (CEKTickMarksCellDataProvider *)WeakRetained;
}

- (_TtC13CameraEditKit14TickMarksModel)tickMarksModel
{
  return self->_tickMarksModel;
}

- (CGAffineTransform)contentTransform
{
  long long v3 = *(_OWORD *)&self[11].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[11].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[12].a;
  return self;
}

- (CEKSliderTickMarksDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKSliderTickMarksDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)selectedTickMarkIndex
{
  return self->_selectedTickMarkIndex;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSIndexSet)magneticTickMarkIndexes
{
  return self->_magneticTickMarkIndexes;
}

- (void)setMagneticTickMarkIndexes:(id)a3
{
}

- (BOOL)highlightSelectedIndex
{
  return self->_highlightSelectedIndex;
}

- (NSMutableSet)_tickMarksReusePool
{
  return self->__tickMarksReusePool;
}

- (NSMutableDictionary)_tickMarksByIndex
{
  return self->__tickMarksByIndex;
}

- (_TtC13CameraEditKit24TickMarksVisibilityModel)_tickMarksVisibilityModel
{
  return self->__tickMarksVisibilityModel;
}

- (NSIndexSet)_installedTickMarkIndexes
{
  return self->__installedTickMarkIndexes;
}

- (void)_setInstalledTickMarkIndexes:(id)a3
{
}

- (NSIndexSet)_selectedIndexes
{
  return self->__selectedIndexes;
}

- (void)_setSelectedIndexes:(id)a3
{
}

- (BOOL)_needsTickMarkRefresh
{
  return self->__needsTickMarkRefresh;
}

- (NSMutableIndexSet)_waveIndexes
{
  return self->__waveIndexes;
}

- (void)_setWaveIndexes:(id)a3
{
}

- (BOOL)_waveAnimationDelayActive
{
  return self->__waveAnimationDelayActive;
}

- (void)_setWaveAnimationDelayActive:(BOOL)a3
{
  self->__waveAnimationDelayActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__waveIndexes, 0);
  objc_storeStrong((id *)&self->__selectedIndexes, 0);
  objc_storeStrong((id *)&self->__installedTickMarkIndexes, 0);
  objc_storeStrong((id *)&self->__tickMarksVisibilityModel, 0);
  objc_storeStrong((id *)&self->__tickMarksByIndex, 0);
  objc_storeStrong((id *)&self->__tickMarksReusePool, 0);
  objc_storeStrong((id *)&self->_magneticTickMarkIndexes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tickMarksModel, 0);
  objc_destroyWeak((id *)&self->_cellDataProvider);
  objc_destroyWeak((id *)&self->_imageDataProvider);
}

@end