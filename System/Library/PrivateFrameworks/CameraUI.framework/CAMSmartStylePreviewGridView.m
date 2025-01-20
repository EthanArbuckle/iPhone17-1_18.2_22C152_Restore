@interface CAMSmartStylePreviewGridView
+ (unint64_t)gridItemCountForLayout:(unint64_t)a3;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_subviewGeometryForIndex:(SEL)a3;
- (BOOL)_allowsExpandOnTap;
- (BOOL)isAnimatingGrid;
- (CAMSmartStylePreviewGridView)initWithLayout:(unint64_t)a3;
- (CAMSmartStylePreviewGridViewDelegate)delegate;
- (CEKSmartStyle)style;
- (CGRect)_subviewFrame1Big5SmallForIndex:(unint64_t)a3;
- (CGRect)_subviewFrame2x2ForIndex:(unint64_t)a3;
- (CGRect)_subviewFrameForIndex:(unint64_t)a3;
- (NSArray)_previewViews;
- (NSString)logIdentifier;
- (int64_t)_expansionAnimationCount;
- (unint64_t)expandedItemIndex;
- (unint64_t)gridItemCount;
- (unint64_t)layout;
- (void)_setExpansionAnimationCount:(int64_t)a3;
- (void)_updateStyleOnPreviewViews;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setExpandedItemIndex:(unint64_t)a3;
- (void)setExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setLogIdentifier:(id)a3;
- (void)setStyle:(id)a3;
- (void)updateGridIndex:(unint64_t)a3 withResourceLoadResult:(id)a4;
@end

@implementation CAMSmartStylePreviewGridView

- (CAMSmartStylePreviewGridView)initWithLayout:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CAMSmartStylePreviewGridView;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[CAMSmartStylePreviewGridView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x263F001A8], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    [(CAMSmartStylePreviewGridView *)v8 setClipsToBounds:1];
    v9->_layout = a3;
    v9->_expandedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v10 = +[CAMSmartStylePreviewGridView gridItemCountForLayout:a3];
    for (i = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10]; v10; --v10)
    {
      v12 = -[CAMSmartStylePreviewView initWithFrame:]([CAMSmartStylePreviewView alloc], "initWithFrame:", v4, v5, v6, v7);
      [(CAMSmartStylePreviewView *)v12 setUserInteractionEnabled:0];
      [(CAMSmartStylePreviewGridView *)v9 addSubview:v12];
      [i addObject:v12];
    }
    objc_storeStrong((id *)&v9->__previewViews, i);
    if ([(CAMSmartStylePreviewGridView *)v9 _allowsExpandOnTap])
    {
      v13 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v9 action:sel_handleTap_];
      [(CAMSmartStylePreviewGridView *)v9 addGestureRecognizer:v13];
    }
    v14 = v9;
  }
  return v9;
}

- (BOOL)_allowsExpandOnTap
{
  return [(CAMSmartStylePreviewGridView *)self layout] - 1 < 2;
}

- (void)setLogIdentifier:(id)a3
{
  double v5 = (NSString *)a3;
  logIdentifier = self->_logIdentifier;
  if (logIdentifier != v5 && ![(NSString *)logIdentifier isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_logIdentifier, a3);
    double v7 = [(CAMSmartStylePreviewGridView *)self _previewViews];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__CAMSmartStylePreviewGridView_setLogIdentifier___block_invoke;
    v8[3] = &unk_263FA2830;
    v8[4] = self;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __49__CAMSmartStylePreviewGridView_setLogIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = NSString;
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = [v5 logIdentifier];
  double v7 = [v4 stringWithFormat:@"%@/cell=%lu", v8, a3];
  [v6 setLogIdentifier:v7];
}

- (unint64_t)gridItemCount
{
  unint64_t v2 = [(CAMSmartStylePreviewGridView *)self layout];
  return +[CAMSmartStylePreviewGridView gridItemCountForLayout:v2];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSmartStylePreviewGridView;
  [(CAMSmartStylePreviewGridView *)&v5 layoutSubviews];
  v3 = [(CAMSmartStylePreviewGridView *)self _previewViews];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__CAMSmartStylePreviewGridView_layoutSubviews__block_invoke;
  v4[3] = &unk_263FA2830;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __46__CAMSmartStylePreviewGridView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 _subviewGeometryForIndex:a3];
  }
  v7[2] = v10;
  v7[3] = v11;
  v7[4] = v12;
  v7[5] = v13;
  v7[0] = v8;
  v7[1] = v9;
  CAMViewSetGeometry(v5, (uint64_t)v7);
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_subviewGeometryForIndex:(SEL)a3
{
  [(CAMSmartStylePreviewGridView *)self _subviewFrameForIndex:a4];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  result = [(CAMSmartStylePreviewGridView *)self expandedItemIndex];
  if (result != ($3B1716E7537CC2F16D6737AAC3CCCADB *)0x7FFFFFFFFFFFFFFFLL)
  {
    [(CAMSmartStylePreviewGridView *)self bounds];
    double v16 = v15;
    double v18 = v17;
    UIRectGetCenter();
    double rect_16 = v19;
    double rect_24 = v20;
    result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)[(CAMSmartStylePreviewGridView *)self _subviewFrameForIndex:[(CAMSmartStylePreviewGridView *)self expandedItemIndex]];
    if (v23 > 0.0)
    {
      CGFloat v25 = v24;
      if (v24 > 0.0)
      {
        CGFloat v26 = v23;
        CGFloat v27 = v16 / v23;
        CGFloat rect = v21;
        CGFloat rect_8 = v18 / v24;
        CGFloat v28 = v21;
        v38.origin.x = v7;
        CGFloat v31 = v22;
        v38.origin.y = v9;
        v38.size.width = v11;
        v38.size.height = v13;
        double MidX = CGRectGetMidX(v38);
        v39.origin.x = v28;
        v39.origin.y = v31;
        v39.size.width = v26;
        v39.size.height = v25;
        retstr->var1.x = rect_16 + (MidX - CGRectGetMidX(v39)) * v27;
        v40.origin.x = v7;
        v40.origin.y = v9;
        v40.size.width = v11;
        v40.size.height = v13;
        double MidY = CGRectGetMidY(v40);
        v41.origin.x = rect;
        v41.origin.y = v31;
        v41.size.width = v26;
        v41.size.height = v25;
        retstr->var1.y = rect_24 + (MidY - CGRectGetMidY(v41)) * rect_8;
        result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)CGAffineTransformMakeScale(&v37, v27, rect_8);
        long long v30 = *(_OWORD *)&v37.c;
        *(_OWORD *)&retstr->var2.a = *(_OWORD *)&v37.a;
        *(_OWORD *)&retstr->var2.c = v30;
        *(_OWORD *)&retstr->var2.tx = *(_OWORD *)&v37.tx;
      }
    }
  }
  return result;
}

- (CGRect)_subviewFrameForIndex:(unint64_t)a3
{
  unint64_t v5 = [(CAMSmartStylePreviewGridView *)self layout];
  switch(v5)
  {
    case 2uLL:
      [(CAMSmartStylePreviewGridView *)self _subviewFrame1Big5SmallForIndex:a3];
      break;
    case 1uLL:
      [(CAMSmartStylePreviewGridView *)self _subviewFrame2x2ForIndex:a3];
      break;
    case 0uLL:
      [(CAMSmartStylePreviewGridView *)self bounds];
      break;
  }
  double v6 = [(CAMSmartStylePreviewGridView *)self traitCollection];
  [v6 displayScale];
  UIRectIntegralWithScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_subviewFrame2x2ForIndex:(unint64_t)a3
{
  [(CAMSmartStylePreviewGridView *)self bounds];
  double v5 = v4 * 0.5;
  double v7 = v6 * 0.5;
  double v8 = v5 * (double)(a3 & 1);
  double v9 = v7 * (double)(a3 >> 1);
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_subviewFrame1Big5SmallForIndex:(unint64_t)a3
{
  [(CAMSmartStylePreviewGridView *)self bounds];
  double v5 = v4 / 3.0;
  double v7 = v6 / 3.0;
  double v8 = 0.0;
  double v9 = 0.0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_7;
    case 1uLL:
      double v9 = v5 + v5;
      goto LABEL_7;
    case 2uLL:
      double v9 = v5 + v5;
      double v8 = v7;
      goto LABEL_7;
    case 3uLL:
      goto LABEL_6;
    case 4uLL:
      double v9 = v5;
      goto LABEL_6;
    default:
      double v9 = v5 + v5;
LABEL_6:
      double v8 = v7 + v7;
LABEL_7:
      if (!a3)
      {
        double v7 = v7 + v7;
        double v5 = v5 + v5;
      }
      result.size.height = v7;
      result.size.width = v5;
      result.origin.y = v8;
      result.origin.x = v9;
      return result;
  }
}

+ (unint64_t)gridItemCountForLayout:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_209C795D8[a3];
  }
}

- (void)setExpandedItemIndex:(unint64_t)a3
{
}

- (void)setExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_expandedItemIndex != a3)
  {
    BOOL v4 = a4;
    unint64_t v5 = a3;
    double v7 = [(CAMSmartStylePreviewGridView *)self _previewViews];
    unint64_t v8 = [v7 count];

    if (v8 < v5) {
      unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v4)
    {
      [(CAMSmartStylePreviewGridView *)self layoutIfNeeded];
      self->_expandedItemIndex = v5;
      [(CAMSmartStylePreviewGridView *)self setNeedsLayout];
      [(CAMSmartStylePreviewGridView *)self _setExpansionAnimationCount:[(CAMSmartStylePreviewGridView *)self _expansionAnimationCount] + 1];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __62__CAMSmartStylePreviewGridView_setExpandedItemIndex_animated___block_invoke;
      v10[3] = &unk_263FA0208;
      v10[4] = self;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __62__CAMSmartStylePreviewGridView_setExpandedItemIndex_animated___block_invoke_2;
      v9[3] = &unk_263FA0430;
      v9[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v10 animations:v9 completion:0.35];
    }
    else
    {
      self->_expandedItemIndex = v5;
      [(CAMSmartStylePreviewGridView *)self setNeedsLayout];
    }
    [(CAMSmartStylePreviewGridView *)self _updateStyleOnPreviewViews];
  }
}

uint64_t __62__CAMSmartStylePreviewGridView_setExpandedItemIndex_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

uint64_t __62__CAMSmartStylePreviewGridView_setExpandedItemIndex_animated___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _expansionAnimationCount] - 1;
  return [v1 _setExpansionAnimationCount:v2];
}

- (void)_setExpansionAnimationCount:(int64_t)a3
{
  if (self->__expansionAnimationCount != a3)
  {
    BOOL v5 = [(CAMSmartStylePreviewGridView *)self isAnimatingGrid];
    self->__expansionAnimationCount = a3;
    BOOL v6 = [(CAMSmartStylePreviewGridView *)self isAnimatingGrid];
    if (v5 != v6)
    {
      BOOL v7 = v6;
      id v8 = [(CAMSmartStylePreviewGridView *)self delegate];
      [v8 smartStylePreviewGridView:self didChangeAnimatingGrid:v7];
    }
  }
}

- (BOOL)isAnimatingGrid
{
  return [(CAMSmartStylePreviewGridView *)self _expansionAnimationCount] > 0;
}

- (void)updateGridIndex:(unint64_t)a3 withResourceLoadResult:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(CAMSmartStylePreviewGridView *)self _previewViews];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    double v11 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAMSmartStylePreviewGridView updateGridIndex:withResourceLoadResult:](a3, v11);
    }
  }
  else
  {
    double v9 = [(CAMSmartStylePreviewGridView *)self _previewViews];
    double v10 = [v9 objectAtIndexedSubscript:a3];

    [v10 setResourceLoadResult:v6];
  }
}

- (void)setStyle:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v5 = (CEKSmartStyle *)a3;
  style = self->_style;
  if (style != v5 && ([(CEKSmartStyle *)style isEqualToSmartStyle:v5] & 1) == 0)
  {
    BOOL v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = [(CAMSmartStylePreviewGridView *)self logIdentifier];
      int v9 = 138543618;
      double v10 = v8;
      __int16 v11 = 2114;
      double v12 = v5;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: setting style %{public}@", (uint8_t *)&v9, 0x16u);
    }
    objc_storeStrong((id *)&self->_style, a3);
    [(CAMSmartStylePreviewGridView *)self _updateStyleOnPreviewViews];
  }
}

- (void)_updateStyleOnPreviewViews
{
  unint64_t v3 = [(CAMSmartStylePreviewGridView *)self expandedItemIndex];
  [MEMORY[0x263F58688] begin];
  BOOL v4 = [(CAMSmartStylePreviewGridView *)self _previewViews];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__CAMSmartStylePreviewGridView__updateStyleOnPreviewViews__block_invoke;
  v5[3] = &unk_263FA2858;
  v5[4] = self;
  v5[5] = v3;
  [v4 enumerateObjectsUsingBlock:v5];

  [MEMORY[0x263F58688] commit];
}

void __58__CAMSmartStylePreviewGridView__updateStyleOnPreviewViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 == a3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v5 style];
    [v6 setStyle:v7];
  }
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  if ([(CAMSmartStylePreviewGridView *)self _allowsExpandOnTap])
  {
    uint64_t v13 = 0;
    double v14 = &v13;
    uint64_t v15 = 0x2020000000;
    unint64_t v16 = [(CAMSmartStylePreviewGridView *)self expandedItemIndex];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    BOOL v5 = [(CAMSmartStylePreviewGridView *)self _previewViews];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    int v9 = __42__CAMSmartStylePreviewGridView_handleTap___block_invoke;
    double v10 = &unk_263FA2880;
    id v11 = v4;
    double v12 = &v13;
    [v5 enumerateObjectsUsingBlock:&v7];

    if (v14[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CAMSmartStylePreviewGridView handleTap:](v6);
      }
    }
    else
    {
LABEL_6:
      id v6 = [(CAMSmartStylePreviewGridView *)self delegate];
      [v6 smartStylePreviewGridView:self didTapItemAtIndex:v14[3]];
    }

    _Block_object_dispose(&v13, 8);
  }
}

BOOL __42__CAMSmartStylePreviewGridView_handleTap___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v7 locationInView:v8];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v8 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  v22.x = v10;
  v22.y = v12;
  BOOL result = CGRectContainsPoint(v23, v22);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (CAMSmartStylePreviewGridViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSmartStylePreviewGridViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)layout
{
  return self->_layout;
}

- (unint64_t)expandedItemIndex
{
  return self->_expandedItemIndex;
}

- (CEKSmartStyle)style
{
  return self->_style;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NSArray)_previewViews
{
  return self->__previewViews;
}

- (int64_t)_expansionAnimationCount
{
  return self->__expansionAnimationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__previewViews, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updateGridIndex:(uint64_t)a1 withResourceLoadResult:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Attempting to set resourceLoadResult on bad grid index: %lu", (uint8_t *)&v2, 0xCu);
}

- (void)handleTap:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Grid item not found for tap", v1, 2u);
}

@end