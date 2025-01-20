@interface FUScrollWheel
- (CGRect)_frameForLabelAtIndex:(unint64_t)a3;
- (FUScrollWheel)initWithFrame:(CGRect)a3;
- (FUScrollWheelDataSource)dataSource;
- (FUScrollWheelDelegate)delegate;
- (UIFont)font;
- (UIScrollView)scrollView;
- (double)_startingLocation;
- (double)_yPositionForLabelAtIndex:(unint64_t)a3;
- (double)scrollWheelLabelPageSize;
- (id)_dequeueLabel;
- (id)_titleForItemAtIndex:(unint64_t)a3;
- (int64_t)itemTitleAligmnent;
- (unint64_t)_numberOfRows;
- (unint64_t)currentIndex;
- (void)_alertDidChangeToCurrentIndex:(unint64_t)a3;
- (void)_generateOpacityMask;
- (void)_layoutScrollView;
- (void)_recycleAllLabels;
- (void)_recycleLabel:(id)a3 forKey:(id)a4;
- (void)_reuseLabelsWithRange:(_NSRange)a3 contentOffset:(CGPoint)a4;
- (void)_setActiveScrollwheelIfNotActive;
- (void)_textSizeDidChange;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reloadData;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setCurrentIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setItemTitleAligmnent:(int64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollWheelLabelPageSize:(double)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation FUScrollWheel

- (FUScrollWheel)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v30.receiver = self;
  v30.super_class = (Class)FUScrollWheel;
  v4 = -[FUScrollWheel initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
    font = v4->_font;
    v4->_font = (UIFont *)v5;

    v7 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
    [v7 lineHeight];
    UICeilToViewScale();
    v4->_scrollWheelLabelHeight = v8;

    v4->_scrollWheelLabelPageSize = v4->_scrollWheelLabelHeight + -1.0;
    v4->_shouldRegenerateOpacityMask = 1;
    [(FUScrollWheel *)v4 setItemTitleAligmnent:1];
    v4->_loaded = 0;
    id v9 = objc_alloc(MEMORY[0x263F82B88]);
    [(FUScrollWheel *)v4 bounds];
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:");
    scrollView = v4->_scrollView;
    v4->_scrollView = (UIScrollView *)v10;

    [(UIScrollView *)v4->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v4->_scrollView setDelegate:v4];
    [(FUScrollWheel *)v4 addSubview:v4->_scrollView];
    uint64_t v12 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
    reusableLabelsQueue = v4->_reusableLabelsQueue;
    v4->_reusableLabelsQueue = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    usedLabels = v4->_usedLabels;
    v4->_usedLabels = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, width, 0.5);
    topDividerView = v4->_topDividerView;
    v4->_topDividerView = (UIView *)v16;

    v18 = v4->_topDividerView;
    v19 = [MEMORY[0x263F825C8] whiteColor];
    [(UIView *)v18 setBackgroundColor:v19];

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, width, 0.5);
    bottomDividerView = v4->_bottomDividerView;
    v4->_bottomDividerView = (UIView *)v20;

    v22 = v4->_bottomDividerView;
    v23 = [MEMORY[0x263F825C8] whiteColor];
    [(UIView *)v22 setBackgroundColor:v23];

    id v24 = objc_alloc(MEMORY[0x263F82828]);
    [(FUScrollWheel *)v4 bounds];
    uint64_t v25 = objc_msgSend(v24, "initWithFrame:");
    maskLayer = v4->_maskLayer;
    v4->_maskLayer = (UIImageView *)v25;

    [(UIImageView *)v4->_maskLayer setUserInteractionEnabled:0];
    [(FUScrollWheel *)v4 addSubview:v4->_maskLayer];
    v4->_numberOfRows = 0;
    [(FUScrollWheel *)v4 addSubview:v4->_topDividerView];
    [(FUScrollWheel *)v4 addSubview:v4->_bottomDividerView];
    [(UIView *)v4->_topDividerView setHidden:1];
    [(UIView *)v4->_bottomDividerView setHidden:1];
    v27 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v4 action:sel__setActiveScrollwheelIfNotActive];
    [(FUScrollWheel *)v4 addGestureRecognizer:v27];
    v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v4 selector:sel__textSizeDidChange name:*MEMORY[0x263F83428] object:0];
  }
  return v4;
}

- (void)dealloc
{
  [(UIScrollView *)self->_scrollView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)FUScrollWheel;
  [(FUScrollWheel *)&v3 dealloc];
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)_setActiveScrollwheelIfNotActive
{
  objc_super v3 = [(FUScrollWheel *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(FUScrollWheel *)self delegate];
    char v6 = [v5 scrollWheelShouldBecomeFirstResponder:self];

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 0;
  }
  if (([(UIScrollView *)self->_scrollView isFirstResponder] & 1) == 0 && (v7 & 1) == 0)
  {
    [(UIScrollView *)self->_scrollView becomeFirstResponder];
    [(UIScrollView *)self->_scrollView becomeFirstResponder];
    double v8 = [(FUScrollWheel *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(FUScrollWheel *)self delegate];
      [v10 tappedScrollWheel:self];
    }
  }
}

- (void)_textSizeDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__FUScrollWheel__textSizeDidChange__block_invoke;
  block[3] = &unk_2644A7B18;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __35__FUScrollWheel__textSizeDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 528) becomeFirstResponder];
}

- (void)setHidden:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FUScrollWheel;
  -[FUScrollWheel setHidden:](&v5, sel_setHidden_);
  if (!a3) {
    [(UIScrollView *)self->_scrollView becomeFirstResponder];
  }
}

- (void)setItemTitleAligmnent:(int64_t)a3
{
  self->_itemTitleAligmnent = a3;
  usedLabels = self->_usedLabels;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__FUScrollWheel_setItemTitleAligmnent___block_invoke;
  v8[3] = &__block_descriptor_40_e24_v32__0_8__UILabel_16_B24l;
  v8[4] = a3;
  [(NSMutableDictionary *)usedLabels enumerateKeysAndObjectsUsingBlock:v8];
  reusableLabelsQueue = self->_reusableLabelsQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__FUScrollWheel_setItemTitleAligmnent___block_invoke_2;
  v7[3] = &__block_descriptor_40_e24_v32__0__UILabel_8Q16_B24l;
  v7[4] = a3;
  [(NSMutableArray *)reusableLabelsQueue enumerateObjectsUsingBlock:v7];
}

uint64_t __39__FUScrollWheel_setItemTitleAligmnent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setTextAlignment:*(void *)(a1 + 32)];
}

uint64_t __39__FUScrollWheel_setItemTitleAligmnent___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTextAlignment:*(void *)(a1 + 32)];
}

- (void)layoutSubviews
{
  unint64_t currentIndex = self->_currentIndex;
  unint64_t numberOfRows = self->_numberOfRows;
  [(FUScrollWheel *)self _startingLocation];
  double v6 = v5;
  double v7 = v6 + v6 + (double)numberOfRows * self->_scrollWheelLabelPageSize + 1.0;
  [(FUScrollWheel *)self frame];
  double v9 = v8;
  scrollView = self->_scrollView;
  [(FUScrollWheel *)self bounds];
  -[UIScrollView setFrame:](scrollView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, v7);
  topDividerView = self->_topDividerView;
  [(FUScrollWheel *)self frame];
  -[UIView setFrame:](topDividerView, "setFrame:", 0.0, v6);
  bottomDividerView = self->_bottomDividerView;
  double v13 = v6 + self->_scrollWheelLabelPageSize;
  [(FUScrollWheel *)self frame];
  -[UIView setFrame:](bottomDividerView, "setFrame:", 0.0, v13);
  self->_unint64_t currentIndex = currentIndex;
  unint64_t v14 = self->_numberOfRows - 1;
  if (currentIndex < v14) {
    unint64_t v14 = currentIndex;
  }
  self->_unint64_t currentIndex = v14;
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, self->_scrollWheelLabelPageSize * (double)v14);
  [(FUScrollWheel *)self _recycleAllLabels];
  [(FUScrollWheel *)self _layoutScrollView];
  if (self->_shouldRegenerateOpacityMask)
  {
    self->_shouldRegenerateOpacityMask = 0;
    [(FUScrollWheel *)self _generateOpacityMask];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FUScrollWheel;
  [(FUScrollWheel *)&v4 willMoveToSuperview:a3];
  if (!self->_loaded) {
    [(FUScrollWheel *)self reloadData];
  }
}

- (void)reloadData
{
  self->_loaded = 1;
  self->_unint64_t numberOfRows = [(FUScrollWheel *)self _numberOfRows];
  [(FUScrollWheel *)self _recycleAllLabels];
  [(FUScrollWheel *)self layoutSubviews];
  [(FUScrollWheel *)self _layoutScrollView];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(FUScrollWheel *)self frame];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  self->_shouldRegenerateOpacityMask = !CGRectEqualToRect(v13, v14);
  v12.receiver = self;
  v12.super_class = (Class)FUScrollWheel;
  -[FUScrollWheel setFrame:](&v12, sel_setFrame_, x, y, width, height);
  [(FUScrollWheel *)self setNeedsLayout];
}

- (void)setCurrentIndex:(unint64_t)a3
{
}

- (void)setCurrentIndex:(unint64_t)a3 animated:(BOOL)a4
{
  self->_unint64_t currentIndex = a3;
  unint64_t v4 = self->_numberOfRows - 1;
  if (v4 >= a3) {
    unint64_t v4 = a3;
  }
  self->_unint64_t currentIndex = v4;
  -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", a4, 0.0, self->_scrollWheelLabelPageSize * (double)v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(FUScrollWheel *)self scrollViewDidEndDecelerating:a3];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  UIRoundToViewScale();
  a5->double y = v6;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)_generateOpacityMask
{
  v28[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
  uint64_t v4 = [v3 CGColor];

  id v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.0];
  uint64_t v6 = [v5 CGColor];

  v28[0] = v4;
  v28[1] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  [(FUScrollWheel *)self bounds];
  double x = v30.origin.x;
  double y = v30.origin.y;
  double width = v30.size.width;
  if (!CGRectIsEmpty(v30))
  {
    [(FUScrollWheel *)self bounds];
    UIRoundToViewScale();
    double v12 = v11;
    CGRect v13 = [MEMORY[0x263F157D0] layer];
    objc_msgSend(v13, "setFrame:", x, y, width, v12);
    [v13 setColors:v7];
    [v13 setLocations:&unk_26CF74980];
    [(FUScrollWheel *)self bounds];
    double v15 = v14 - v12;
    uint64_t v16 = [MEMORY[0x263F157D0] layer];
    objc_msgSend(v16, "setFrame:", x, v15, width, v12);
    v17 = [v7 reverseObjectEnumerator];
    v18 = [v17 allObjects];
    [v16 setColors:v18];

    [v16 setLocations:&unk_26CF74998];
    [v13 addSublayer:v16];
    [(FUScrollWheel *)self bounds];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    v23 = [MEMORY[0x263F82B60] mainScreen];
    [v23 scale];
    CGFloat v25 = v24;
    v29.double width = v20;
    v29.double height = v22;
    UIGraphicsBeginImageContextWithOptions(v29, 0, v25);

    [v13 renderInContext:UIGraphicsGetCurrentContext()];
    v26 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    maskLayer = self->_maskLayer;
    [(FUScrollWheel *)self bounds];
    -[UIImageView setFrame:](maskLayer, "setFrame:");
    [(UIImageView *)self->_maskLayer setImage:v26];
  }
}

- (void)_layoutScrollView
{
  [(UIScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(FUScrollWheel *)self _startingLocation];
  double v8 = v6 - v7;
  if (v8 < 0.0) {
    double v8 = 0.0;
  }
  NSUInteger v9 = vcvtmd_u64_f64(v8 / self->_scrollWheelLabelPageSize);
  [(FUScrollWheel *)self bounds];
  NSUInteger v11 = (unint64_t)(ceil(v10 / self->_scrollWheelLabelPageSize) + 1.0);
  -[FUScrollWheel _reuseLabelsWithRange:contentOffset:](self, "_reuseLabelsWithRange:contentOffset:", v9, v11, v4, v6);
  self->_previousRange.location = v9;
  self->_previousRange.length = v11;
}

- (double)_startingLocation
{
  [(FUScrollWheel *)self frame];
  UIRoundToViewScale();
  return result;
}

- (void)_reuseLabelsWithRange:(_NSRange)a3 contentOffset:(CGPoint)a4
{
  double y = a4.y;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v53 = *MEMORY[0x263EF8340];
  [(UIScrollView *)self->_scrollView contentOffset];
  CGFloat v9 = v8;
  [(UIScrollView *)self->_scrollView frame];
  CGFloat v11 = v10;
  [(UIScrollView *)self->_scrollView frame];
  CGFloat v13 = v12;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  double v14 = [(NSMutableDictionary *)self->_usedLabels allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        CGFloat v20 = [(NSMutableDictionary *)self->_usedLabels objectForKeyedSubscript:v19];
        [v20 frame];
        v56.origin.double x = 0.0;
        v56.origin.double y = v9;
        v56.size.double width = v11;
        v56.size.double height = v13;
        if (!CGRectIntersectsRect(v54, v56)) {
          [(FUScrollWheel *)self _recycleLabel:v20 forKey:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v16);
  }

  if (location + length >= self->_numberOfRows) {
    unint64_t numberOfRows = self->_numberOfRows;
  }
  else {
    unint64_t numberOfRows = location + length;
  }
  if (location < numberOfRows)
  {
    while (1)
    {
      usedLabels = self->_usedLabels;
      v23 = [NSNumber numberWithUnsignedInteger:location];
      double v24 = [(NSMutableDictionary *)usedLabels objectForKeyedSubscript:v23];

      if (!v24)
      {
        double v24 = [(FUScrollWheel *)self _dequeueLabel];
        CGFloat v25 = [(FUScrollWheel *)self _textForLabelAtIndex:location];
        [v24 setText:v25];

        v26 = self->_usedLabels;
        v27 = [NSNumber numberWithUnsignedInteger:location];
        [(NSMutableDictionary *)v26 setObject:v24 forKeyedSubscript:v27];
      }
      [v24 setHidden:0];
      [(FUScrollWheel *)self _frameForLabelAtIndex:location];
      objc_msgSend(v24, "setFrame:");
      v28 = [(FUScrollWheel *)self font];
      [v24 setFont:v28];

      [(FUScrollWheel *)self bounds];
      double v30 = v29 + -7.5;
      [v24 frame];
      double v32 = v31;
      [v24 center];
      double v34 = v33 - y - v30 * 0.5;
      if (v34 < 0.0) {
        double v34 = -v34;
      }
      if (v34 <= self->_scrollWheelLabelPageSize * 0.5) {
        self->_unint64_t currentIndex = location;
      }
      double v35 = (v32 - y + 2.5) / v30;
      if (v35 > 0.45)
      {
        double v36 = 15.0;
        if (v35 < 0.55) {
          goto LABEL_25;
        }
      }
      if (v35 >= 0.3 && v35 <= 0.7) {
        break;
      }
LABEL_26:
      [v24 frame];
      if (v35 > 0.7) {
        double v43 = 3.0;
      }
      else {
        double v43 = 0.0;
      }
      if (v35 <= 0.5) {
        double v43 = -3.0;
      }
      if (v35 < 0.3 || v35 > 0.5)
      {
        BOOL v45 = v35 > 0.7 || v35 <= 0.5;
        double v46 = v35 + -0.5;
        if (v45) {
          double v46 = 0.0;
        }
      }
      else
      {
        double v46 = v35 + -0.3;
      }
      double v47 = v40 + v43 + v46 / 0.2 * 3.0;
      CGRect v55 = CGRectIntegral(*(CGRect *)&v39);
      objc_msgSend(v24, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);

      if (numberOfRows == ++location) {
        return;
      }
    }
    double v37 = fabs(v35 + -0.5);
    double v36 = round(((v37 + -0.05) / -0.15 + 1.0) * 3.0 + ((v37 + -0.05) / -0.15 + 1.0) * 3.0) * 0.5 + 12.0;
LABEL_25:
    v38 = [MEMORY[0x263F81708] systemFontOfSize:v36];
    [v24 setFont:v38];

    goto LABEL_26;
  }
}

- (void)_recycleLabel:(id)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [v6 setHidden:1];
  [(NSMutableArray *)self->_reusableLabelsQueue addObject:v6];

  [(NSMutableDictionary *)self->_usedLabels removeObjectForKey:v7];
}

- (void)_recycleAllLabels
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(NSMutableDictionary *)self->_usedLabels allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        CGFloat v9 = [(NSMutableDictionary *)self->_usedLabels objectForKey:v8];
        [v9 removeFromSuperview];
        [(NSMutableDictionary *)self->_usedLabels removeObjectForKey:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_dequeueLabel
{
  if (![(NSMutableArray *)self->_reusableLabelsQueue count])
  {
    id v3 = objc_alloc(MEMORY[0x263F828E0]);
    [(FUScrollWheel *)self frame];
    uint64_t v5 = objc_msgSend(v3, "initWithFrame:", 2.0, 0.0, v4 + -4.0, self->_scrollWheelLabelHeight);
    uint64_t v6 = [MEMORY[0x263F825C8] whiteColor];
    [v5 setTextColor:v6];

    objc_msgSend(v5, "setTextAlignment:", -[FUScrollWheel itemTitleAligmnent](self, "itemTitleAligmnent"));
    [v5 setOpaque:1];
    [v5 setAdjustsFontSizeToFitWidth:1];
    [(NSMutableArray *)self->_reusableLabelsQueue addObject:v5];
    [(UIScrollView *)self->_scrollView addSubview:v5];
  }
  id v7 = [(NSMutableArray *)self->_reusableLabelsQueue lastObject];
  [(NSMutableArray *)self->_reusableLabelsQueue removeLastObject];
  return v7;
}

- (CGRect)_frameForLabelAtIndex:(unint64_t)a3
{
  [(FUScrollWheel *)self _yPositionForLabelAtIndex:a3];
  double v5 = v4;
  [(FUScrollWheel *)self frame];
  double v7 = v6 + -4.0;
  double scrollWheelLabelHeight = self->_scrollWheelLabelHeight;
  double v9 = 2.0;
  double v10 = v5;
  result.size.double height = scrollWheelLabelHeight;
  result.size.double width = v7;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (double)_yPositionForLabelAtIndex:(unint64_t)a3
{
  double v3 = (double)a3;
  double scrollWheelLabelPageSize = self->_scrollWheelLabelPageSize;
  [(FUScrollWheel *)self _startingLocation];
  return v5 + v3 * scrollWheelLabelPageSize;
}

- (id)_titleForItemAtIndex:(unint64_t)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_dataSource);
    uint64_t v8 = [v7 scrollWheel:self titleForItemAtIndex:a3];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (unint64_t)_numberOfRows
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (!WeakRetained) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_dataSource);
  unint64_t v6 = [v5 numberOfRowsInScrollWheel:self];

  return v6;
}

- (void)_alertDidChangeToCurrentIndex:(unint64_t)a3
{
  uint64_t v5 = [(FUScrollWheel *)self delegate];
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    id v7 = [(FUScrollWheel *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(FUScrollWheel *)self delegate];
      [v9 scrollWheel:self didChangeCurrentIndexTo:a3];
    }
  }
}

- (FUScrollWheelDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (FUScrollWheelDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (FUScrollWheelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FUScrollWheelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)itemTitleAligmnent
{
  return self->_itemTitleAligmnent;
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (void)setScrollView:(id)a3
{
}

- (double)scrollWheelLabelPageSize
{
  return self->_scrollWheelLabelPageSize;
}

- (void)setScrollWheelLabelPageSize:(double)a3
{
  self->_double scrollWheelLabelPageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);
  objc_storeStrong((id *)&self->_topDividerView, 0);
  objc_storeStrong((id *)&self->_usedLabels, 0);
  objc_storeStrong((id *)&self->_reusableLabelsQueue, 0);
}

@end