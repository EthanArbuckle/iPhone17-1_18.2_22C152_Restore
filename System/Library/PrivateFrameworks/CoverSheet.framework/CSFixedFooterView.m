@interface CSFixedFooterView
- (CGPoint)statusTextViewOffset;
- (CSFixedFooterView)initWithFrame:(CGRect)a3;
- (CSPageControl)pageControl;
- (CSShakableView)callToActionShakeView;
- (SBFPagedScrollView)trackingScrollViewForPageControl;
- (SBUICallToActionLabel)callToActionLabel;
- (SBUILegibility)statusTextView;
- (SBUILegibilityLabel)alternateCallToActionLabel;
- (double)statusTextViewScale;
- (id)presentationRegions;
- (void)_addPageControl;
- (void)_addShakeView;
- (void)_layoutCallToActionView;
- (void)_layoutPageControl;
- (void)_layoutStatusTextView;
- (void)_updateViewsForLegibilitySettings;
- (void)layoutSubviews;
- (void)setAlternateCallToActionLabel:(id)a3;
- (void)setCallToActionLabel:(id)a3;
- (void)setStatusTextView:(id)a3;
- (void)setStatusTextViewOffset:(CGPoint)a3;
- (void)setStatusTextViewOffset:(CGPoint)a3 scale:(double)a4;
- (void)setStatusTextViewScale:(double)a3;
- (void)setTrackingScrollViewForPageControl:(id)a3;
- (void)updateForLegibilitySettings:(id)a3;
- (void)updatePageControl;
@end

@implementation CSFixedFooterView

- (CSFixedFooterView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSFixedFooterView;
  v3 = -[CSFixedFooterView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (SBFEffectiveHomeButtonType() != 2)
    {
      [(CSFixedFooterView *)v3 _addShakeView];
      [(CSFixedFooterView *)v3 _addPageControl];
    }
    v3->_statusTextViewScale = 1.0;
  }
  return v3;
}

- (id)presentationRegions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = +[CSRegion regionForCoordinateSpace:self->_callToActionShakeView];
  objc_super v5 = [v4 role:1];

  [v3 addObject:v5];
  if (self->_statusTextView)
  {
    v6 = +[CSRegion regionForCoordinateSpace:](CSRegion, "regionForCoordinateSpace:");
    v7 = [v6 role:1];
    [v3 addObject:v7];
  }

  return v3;
}

- (void)setStatusTextView:(id)a3
{
  objc_super v5 = (SBUILegibility *)a3;
  p_statusTextView = &self->_statusTextView;
  statusTextView = self->_statusTextView;
  if (statusTextView != v5)
  {
    v8 = v5;
    [(SBUILegibility *)statusTextView removeFromSuperview];
    objc_storeStrong((id *)&self->_statusTextView, a3);
    if (*p_statusTextView)
    {
      [(SBUILegibility *)*p_statusTextView bs_setHitTestingDisabled:1];
      [(CSFixedFooterView *)self addSubview:*p_statusTextView];
      [(CSFixedFooterView *)self _updateViewsForLegibilitySettings];
    }
    statusTextView = (SBUILegibility *)[(CSFixedFooterView *)self setNeedsLayout];
    objc_super v5 = v8;
  }

  MEMORY[0x1F41817F8](statusTextView, v5);
}

- (void)setStatusTextViewOffset:(CGPoint)a3
{
  if (self->_statusTextViewOffset.x != a3.x || self->_statusTextViewOffset.y != a3.y)
  {
    self->_statusTextViewOffset = a3;
    [(CSFixedFooterView *)self _layoutStatusTextView];
  }
}

- (void)setStatusTextViewScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_statusTextViewScale = a3;
    [(CSFixedFooterView *)self _layoutStatusTextView];
  }
}

- (void)setStatusTextViewOffset:(CGPoint)a3 scale:(double)a4
{
  if (self->_statusTextViewOffset.x == a3.x && self->_statusTextViewOffset.y == a3.y)
  {
    p_statusTextViewScale = &self->_statusTextViewScale;
    if (BSFloatEqualToFloat()) {
      return;
    }
  }
  else
  {
    self->_statusTextViewOffset = a3;
    p_statusTextViewScale = &self->_statusTextViewScale;
    if (BSFloatEqualToFloat()) {
      goto LABEL_9;
    }
  }
  double *p_statusTextViewScale = a4;
LABEL_9:

  [(CSFixedFooterView *)self _layoutStatusTextView];
}

- (void)setCallToActionLabel:(id)a3
{
  objc_super v5 = (SBUICallToActionLabel *)a3;
  p_callToActionLabel = &self->_callToActionLabel;
  callToActionLabel = self->_callToActionLabel;
  if (callToActionLabel != v5)
  {
    v9 = v5;
    [(SBUICallToActionLabel *)callToActionLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_callToActionLabel, a3);
    if (*p_callToActionLabel)
    {
      [(SBUICallToActionLabel *)*p_callToActionLabel bs_setHitTestingDisabled:1];
      v8 = [(CSShakableView *)self->_callToActionShakeView containerView];
      [v8 addSubview:*p_callToActionLabel];

      [(CSFixedFooterView *)self _updateViewsForLegibilitySettings];
    }
    callToActionLabel = (SBUICallToActionLabel *)[(CSFixedFooterView *)self setNeedsLayout];
    objc_super v5 = v9;
  }

  MEMORY[0x1F41817F8](callToActionLabel, v5);
}

- (void)setTrackingScrollViewForPageControl:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackingScrollViewForPageControl);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_trackingScrollViewForPageControl, obj);
    [(CSFixedFooterView *)self updatePageControl];
    objc_super v5 = obj;
  }
}

- (void)updateForLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(CSFixedFooterView *)self _updateViewsForLegibilitySettings];
  }
}

- (void)_addShakeView
{
  v3 = objc_alloc_init(CSShakableView);
  callToActionShakeView = self->_callToActionShakeView;
  self->_callToActionShakeView = v3;

  [(CSShakableView *)self->_callToActionShakeView setAutoresizingMask:2];
  id v5 = self->_callToActionShakeView;

  [(CSFixedFooterView *)self addSubview:v5];
}

- (void)_addPageControl
{
  v3 = [CSPageControl alloc];
  v4 = -[CSPageControl initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  pageControl = self->_pageControl;
  self->_pageControl = v4;

  [(UIPageControl *)self->_pageControl setHidesForSinglePage:1];
  v6 = self->_pageControl;

  [(CSFixedFooterView *)self addSubview:v6];
}

- (void)_layoutCallToActionView
{
  [(CSFixedFooterView *)self bounds];
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  v7 = (void *)MEMORY[0x1E4FA5EE0];
  callToActionLabel = self->_callToActionLabel;
  double MaxY = CGRectGetMaxY(v15);
  [(SBUILegibility *)self->_statusTextView frame];
  double v11 = MaxY - v10;
  [(SBUICallToActionLabel *)self->_callToActionLabel baselineOffset];
  objc_msgSend(v7, "suggestedFrameForCallToActionLabel:yOffset:inBounds:", callToActionLabel, v12 + v11, x, y, width, height);
  -[CSShakableView setFrame:](self->_callToActionShakeView, "setFrame:");
  v13 = self->_callToActionLabel;
  [(CSShakableView *)self->_callToActionShakeView bounds];

  -[SBUICallToActionLabel setFrame:](v13, "setFrame:");
}

- (void)_layoutStatusTextView
{
  [(CSFixedFooterView *)self bounds];
  double v4 = v3;
  +[CSPageControl suggestedFrameForPageBounds:](CSPageControl, "suggestedFrameForPageBounds:");
  objc_msgSend(MEMORY[0x1E4FA5EE0], "suggestedFrameForStatusView:inView:withInsets:", self->_statusTextView, self, 0.0, 0.0, v4 - v5, 0.0);
  statusTextView = self->_statusTextView;
  BSRectWithSize();
  -[SBUILegibility setBounds:](statusTextView, "setBounds:");
  BSRectGetCenter();
  -[SBUILegibility setCenter:](self->_statusTextView, "setCenter:");
  [(CSFixedFooterView *)self statusTextViewOffset];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CSFixedFooterView *)self statusTextViewScale];
  memset(&v19, 0, sizeof(v19));
  if (BSFloatIsOne()
    && (v8 == *MEMORY[0x1E4F1DAD8] ? (BOOL v11 = v10 == *(double *)(MEMORY[0x1E4F1DAD8] + 8)) : (BOOL v11 = 0), v11))
  {
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v19.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v19.c = v13;
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    BSRectGetCenter();
    SBFTransformForScalingAboutPointInSuperview();
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeTranslation(&v18, v8, v10);
    CGAffineTransform t1 = v19;
    CGAffineTransform t2 = v18;
    CGAffineTransformConcat(&v17, &t1, &t2);
    *(_OWORD *)&v19.a = *(_OWORD *)&v17.a;
    *(_OWORD *)&v19.c = *(_OWORD *)&v17.c;
    long long v12 = *(_OWORD *)&v17.tx;
  }
  *(_OWORD *)&v19.tdouble x = v12;
  v14 = self->_statusTextView;
  *(_OWORD *)&v18.a = *(_OWORD *)&v19.a;
  *(_OWORD *)&v18.c = *(_OWORD *)&v19.c;
  *(_OWORD *)&v18.tdouble x = v12;
  [(SBUILegibility *)v14 setTransform:&v18];
}

- (void)_layoutPageControl
{
  [(CSPageControl *)self->_pageControl sizeForNumberOfPages:[(UIPageControl *)self->_pageControl numberOfPages]];
  [(CSFixedFooterView *)self bounds];
  +[CSPageControl suggestedFrameForPageBounds:desiredSize:](CSPageControl, "suggestedFrameForPageBounds:desiredSize:");
  pageControl = self->_pageControl;

  -[CSPageControl setFrame:](pageControl, "setFrame:");
}

- (void)updatePageControl
{
  double v3 = [(CSFixedFooterView *)self trackingScrollViewForPageControl];
  if (v3)
  {
    id v8 = v3;
    uint64_t v4 = [v3 visiblePageRange];
    double v3 = v8;
    if (v5 == 1)
    {
      pageControl = self->_pageControl;
      double v7 = [v8 pageViews];
      -[UIPageControl setNumberOfPages:](pageControl, "setNumberOfPages:", [v7 count]);

      [(UIPageControl *)self->_pageControl setCurrentPage:v4];
      double v3 = v8;
    }
  }
}

- (void)_updateViewsForLegibilitySettings
{
  [(SBUILegibility *)self->_statusTextView setLegibilitySettings:self->_legibilitySettings];
  [(SBUICallToActionLabel *)self->_callToActionLabel setLegibilitySettings:self->_legibilitySettings];
  pageControl = self->_pageControl;
  legibilitySettings = self->_legibilitySettings;

  [(CSPageControl *)pageControl setLegibilitySettings:legibilitySettings];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSFixedFooterView;
  [(CSFixedFooterView *)&v3 layoutSubviews];
  [(CSFixedFooterView *)self _layoutStatusTextView];
  [(CSFixedFooterView *)self _layoutCallToActionView];
  [(CSFixedFooterView *)self _layoutPageControl];
}

- (CSShakableView)callToActionShakeView
{
  return self->_callToActionShakeView;
}

- (SBUICallToActionLabel)callToActionLabel
{
  return self->_callToActionLabel;
}

- (SBUILegibilityLabel)alternateCallToActionLabel
{
  return self->_alternateCallToActionLabel;
}

- (void)setAlternateCallToActionLabel:(id)a3
{
}

- (SBUILegibility)statusTextView
{
  return self->_statusTextView;
}

- (CGPoint)statusTextViewOffset
{
  double x = self->_statusTextViewOffset.x;
  double y = self->_statusTextViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)statusTextViewScale
{
  return self->_statusTextViewScale;
}

- (CSPageControl)pageControl
{
  return self->_pageControl;
}

- (SBFPagedScrollView)trackingScrollViewForPageControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackingScrollViewForPageControl);

  return (SBFPagedScrollView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trackingScrollViewForPageControl);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_statusTextView, 0);
  objc_storeStrong((id *)&self->_alternateCallToActionLabel, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_callToActionShakeView, 0);

  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end