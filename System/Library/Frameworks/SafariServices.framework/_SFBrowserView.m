@interface _SFBrowserView
- (BOOL)hasReceivedTouchEvents;
- (BOOL)isContentReadyForDisplay;
- (BOOL)shouldUseScrollToTopView;
- (CGPoint)pinnableBannerOffset;
- (CGRect)unscaledWebViewBounds;
- (SFBrowserViewDelegate)delegate;
- (SFCrashBanner)crashBanner;
- (SFNanoDomainContainerView)nanoDomainContainerView;
- (SFPinnableBanner)appBannerPendingFirstPaint;
- (SFPinnableBanner)pinnableBanner;
- (UIEdgeInsets)obscuredInsets;
- (UIView)appInfoOverlay;
- (UIView)contentContainerView;
- (UIView)currentWebViewContainerView;
- (UIView)quickLookDocumentView;
- (UIView)scrollToTopView;
- (UIView)statusBarBackgroundView;
- (WKWebView)currentWebView;
- (_SFBrowserView)initWithFrame:(CGRect)a3;
- (_SFLinkPreviewHeader)previewHeader;
- (_SFNavigationBar)navigationBar;
- (_SFToolbar)toolbar;
- (double)bottomBarOffset;
- (double)crashBannerOffset;
- (double)minimalUITopOffset;
- (double)previewScaleFactor;
- (double)topBarHeight;
- (double)unscaledWebViewWidth;
- (id)accessibilityIdentifier;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)navigationBarBehavior;
- (void)_addWebView:(id)a3 webViewContainerView:(id)a4;
- (void)_scaleContentInset;
- (void)addWebView:(id)a3;
- (void)addWebViewController:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppBannerPendingFirstPaint:(id)a3;
- (void)setAppInfoOverlay:(id)a3;
- (void)setBottomBarOffset:(double)a3;
- (void)setContentReadyForDisplay;
- (void)setCrashBanner:(id)a3;
- (void)setCrashBannerOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setMinimalUITopOffset:(double)a3;
- (void)setNanoDomainContainerView:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setNavigationBarBehavior:(unint64_t)a3;
- (void)setObscuredInsets:(UIEdgeInsets)a3;
- (void)setPinnableBanner:(id)a3;
- (void)setPinnableBannerOffset:(CGPoint)a3;
- (void)setPreviewHeader:(id)a3;
- (void)setQuickLookDocumentView:(id)a3;
- (void)setShouldUseScrollToTopView:(BOOL)a3;
- (void)setStatusBarBackgroundView:(id)a3;
- (void)setToolbar:(id)a3;
- (void)setTopBarHeight:(double)a3;
- (void)setUnscaledWebViewWidth:(double)a3;
- (void)updateDismissButtonStyle:(int64_t)a3;
- (void)updatePreviewHeaderWithURLString:(id)a3;
@end

@implementation _SFBrowserView

- (_SFBrowserView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_SFBrowserView;
  v3 = -[_SFBrowserView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    contentContainerView = v3->_contentContainerView;
    v3->_contentContainerView = (UIView *)v5;

    [(_SFBrowserView *)v3 addSubview:v3->_contentContainerView];
    v3->_topBarHeight = 44.0;
    v3->_contentReadyForDisplay = 0;
    [(_SFBrowserView *)v3 setHidden:1];
    v7 = v3;
  }

  return v3;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  [WeakRetained removeObserver:self forKeyPath:@"fullscreenState" context:kvoContext];

  v4.receiver = self;
  v4.super_class = (Class)_SFBrowserView;
  [(_SFBrowserView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v72.receiver = self;
  v72.super_class = (Class)_SFBrowserView;
  [(_SFBrowserView *)&v72 layoutSubviews];
  [(_SFBrowserView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_contentContainerView, "setFrame:");
  if ([(_SFToolbar *)self->_toolbar placement] == 1)
  {
    -[_SFToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v12 = v11;
    [(_SFBrowserView *)self _sf_bottomUnsafeAreaFrameForToolbar];
    double Height = CGRectGetHeight(v73);
    v74.origin.double x = v4;
    v74.origin.y = v6;
    v74.size.width = v8;
    v74.size.height = v10;
    CGFloat v14 = CGRectGetHeight(v74) - v12 - Height + self->_bottomBarOffset;
    v75.origin.double x = v4;
    v75.origin.y = v6;
    v75.size.width = v8;
    v75.size.height = v10;
    -[_SFToolbar setFrame:](self->_toolbar, "setFrame:", 0.0, v14, CGRectGetWidth(v75), v12);
  }
  [(_SFBrowserView *)self safeAreaInsets];
  double v16 = v15;
  [(_SFNavigationBar *)self->_navigationBar defaultHeight];
  unint64_t navigationBarBehavior = self->_navigationBarBehavior;
  if (navigationBarBehavior == 1)
  {
    double v19 = v6;
    double v6 = self->_topBarHeight - v17;
    topBardouble Height = v17;
  }
  else
  {
    double v19 = v6;
    topBardouble Height = v10;
    if (!navigationBarBehavior)
    {
      topBardouble Height = self->_topBarHeight;
      double v6 = v16;
    }
  }
  -[_SFNavigationBar setMaximumHeight:](self->_navigationBar, "setMaximumHeight:");
  [(_SFNavigationBar *)self->_navigationBar setContentUnderStatusBarHeight:v16];
  -[_SFNavigationBar setFrame:](self->_navigationBar, "setFrame:", v4, v6, v8, topBarHeight);
  [(_SFBrowserView *)self safeAreaInsets];
  double rect = v16;
  v76.origin.double x = v4;
  v76.origin.y = v19;
  v76.size.width = v8;
  v76.size.height = v10;
  CGRectGetWidth(v76);
  double v68 = 0.0;
  -[SFNanoDomainContainerView setFrame:](self->_nanoDomainContainerView, "setFrame:");
  double minimalUITopOffset = self->_minimalUITopOffset;
  -[_SFLinkPreviewHeader systemLayoutSizeFittingSize:](self->_previewHeader, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  CGFloat v66 = v22;
  CGFloat v67 = minimalUITopOffset;
  -[_SFLinkPreviewHeader setFrame:](self->_previewHeader, "setFrame:", v4, minimalUITopOffset, v8);
  -[SFPinnableBanner sizeThatFits:](self->_pinnableBanner, "sizeThatFits:", v8, v10);
  -[SFPinnableBanner setFrame:](self->_pinnableBanner, "setFrame:", self->_pinnableBannerOffset.x, self->_pinnableBannerOffset.y, v23, v24);
  -[SFCrashBanner sizeThatFits:](self->_crashBanner, "sizeThatFits:", v8, topBarHeight);
  double v26 = v25;
  double v28 = v27;
  v77.origin.double x = v4;
  v77.origin.y = v6;
  v77.size.width = v8;
  v77.size.height = topBarHeight;
  CGFloat MaxY = CGRectGetMaxY(v77);
  double v30 = v26;
  double v31 = v19;
  -[SFCrashBanner setFrame:](self->_crashBanner, "setFrame:", v4, MaxY + self->_crashBannerOffset, v30, v28);
  -[UIView setFrame:](self->_statusBarBackgroundView, "setFrame:", v4, v19, v8, rect);
  v78.origin.double x = v4;
  v78.origin.y = v19;
  v78.size.width = v8;
  v78.size.height = v10;
  -[UIView setFrame:](self->_scrollToTopView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v78), 20.0);
  if (self->_scrollToTopView)
  {
    v79.origin.double x = v4;
    v79.origin.y = v6;
    v79.size.width = v8;
    v79.size.height = topBarHeight;
    double v32 = CGRectGetMaxY(v79);
    [(_SFBrowserView *)self bounds];
    BOOL v33 = v32 <= CGRectGetMinY(v80);
  }
  else
  {
    BOOL v33 = 0;
  }
  double v34 = v6;
  -[_SFNavigationBar setHidden:](self->_navigationBar, "setHidden:", v33, *(void *)&rect);
  [(_SFBrowserView *)self setHidden:!self->_contentReadyForDisplay];
  if ([(_SFToolbar *)self->_toolbar placement] == 1)
  {
    v81.origin.double x = v4;
    v81.origin.y = v31;
    v81.size.width = v8;
    v81.size.height = v10;
    double v35 = CGRectGetHeight(v81);
    [(_SFToolbar *)self->_toolbar frame];
    double v68 = v35 - CGRectGetMinY(v82);
  }
  v83.origin.double x = v4;
  v83.origin.y = v6;
  v83.size.width = v8;
  v83.size.height = topBarHeight;
  double v36 = CGRectGetMaxY(v83);
  v84.origin.double x = v4;
  v84.size.height = v66;
  v84.origin.y = v67;
  v84.size.width = v8;
  double v37 = CGRectGetMaxY(v84);
  if (v36 <= v37) {
    double v38 = v37;
  }
  else {
    double v38 = v36;
  }
  -[UIView setFrame:](self->_quickLookDocumentView, "setFrame:", v4 + 0.0, v31 + v38, v8, v10 - (v68 + v38), *(void *)&topBarHeight);
  [(UIView *)self->_contentContainerView bounds];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebViewContainerView);
  v48 = WeakRetained;
  if (self->_unscaledWebViewWidth == 0.0)
  {
    long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v69[0] = *MEMORY[0x1E4F1DAB8];
    v69[1] = v52;
    v69[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [WeakRetained setTransform:v69];
    objc_msgSend(v48, "setFrame:", v40, v42, v44, v46);
  }
  else
  {
    [(_SFBrowserView *)self previewScaleFactor];
    double v50 = v49;
    objc_msgSend(v48, "setFrame:", v40, v42, v44, v46);
    [(_SFBrowserView *)self unscaledWebViewBounds];
    objc_msgSend(v48, "setBounds:");
    UIRectGetCenter();
    [v48 setCenter:v51 + v50 * self->_obscuredInsets.left * -0.5];
    CGAffineTransformMakeScale(&v71, v50, v50);
    CGAffineTransform v70 = v71;
    [v48 setTransform:&v70];
    [(_SFBrowserView *)self _scaleContentInset];
  }
  id v53 = objc_loadWeakRetained((id *)&self->_currentWebView);
  v54 = [v53 scrollView];
  CGFloat v55 = v34;
  [v54 bounds];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;

  double x = self->_pinnableBannerOffset.x;
  v85.origin.double x = v4;
  v85.origin.y = v55;
  v85.size.width = v8;
  v85.size.height = recta;
  CGFloat v63 = CGRectGetMaxY(v85);
  -[UIView setFrame:](self->_appInfoOverlay, "setFrame:", x + 0.0, v57 + v63 + self->_pinnableBannerOffset.y, v59, v61 - (v68 + v63 + self->_pinnableBannerOffset.y));
}

- (void)setContentReadyForDisplay
{
  if (!self->_contentReadyForDisplay)
  {
    self->_contentReadyForDisplay = 1;
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)setPreviewHeader:(id)a3
{
  double v5 = (_SFLinkPreviewHeader *)a3;
  previewHeader = self->_previewHeader;
  double v7 = v5;
  if (previewHeader != v5)
  {
    [(_SFLinkPreviewHeader *)previewHeader removeFromSuperview];
    objc_storeStrong((id *)&self->_previewHeader, a3);
    [(_SFBrowserView *)self addSubview:self->_previewHeader];
  }
}

- (void)setStatusBarBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  statusBarBackgroundView = self->_statusBarBackgroundView;
  double v7 = v5;
  if (statusBarBackgroundView != v5)
  {
    [(UIView *)statusBarBackgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_statusBarBackgroundView, a3);
    [(_SFBrowserView *)self addSubview:self->_statusBarBackgroundView];
  }
}

- (void)setToolbar:(id)a3
{
  id v5 = a3;
  [(_SFToolbar *)self->_toolbar removeFromSuperview];
  objc_storeStrong((id *)&self->_toolbar, a3);
  [(_SFBrowserView *)self addSubview:self->_toolbar];
}

- (void)setNavigationBar:(id)a3
{
  id v5 = a3;
  [(_SFNavigationBar *)self->_navigationBar removeFromSuperview];
  objc_storeStrong((id *)&self->_navigationBar, a3);
  [(_SFBrowserView *)self addSubview:self->_navigationBar];
}

- (void)updateDismissButtonStyle:(int64_t)a3
{
  id v5 = [(_SFBrowserView *)self navigationBar];
  [v5 setDismissButtonStyle:a3 animated:self->_contentReadyForDisplay];
}

- (void)setBottomBarOffset:(double)a3
{
  if (self->_bottomBarOffset != a3)
  {
    self->_bottomBarOffset = a3;
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)setTopBarHeight:(double)a3
{
  if (self->_topBarHeight != a3)
  {
    self->_topBardouble Height = a3;
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)addWebView:(id)a3
{
}

- (void)addWebViewController:(id)a3
{
  id v6 = a3;
  double v4 = [v6 webView];
  id v5 = [v6 view];
  [(_SFBrowserView *)self _addWebView:v4 webViewContainerView:v5];
}

- (void)_addWebView:(id)a3 webViewContainerView:(id)a4
{
  id obj = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  double v8 = [WeakRetained scrollView];
  [v8 setDelegate:0];

  id v9 = objc_loadWeakRetained((id *)&self->_currentWebViewContainerView);
  [v9 removeFromSuperview];

  [WeakRetained removeObserver:self forKeyPath:@"fullscreenState" context:kvoContext];
  objc_storeWeak((id *)&self->_currentWebView, obj);
  objc_storeWeak((id *)&self->_currentWebViewContainerView, v6);
  [(UIView *)self->_contentContainerView bounds];
  objc_msgSend(v6, "setFrame:");
  [(UIView *)self->_contentContainerView addSubview:v6];
  [obj addObserver:self forKeyPath:@"fullscreenState" options:1 context:kvoContext];
  if (self->_pinnableBanner)
  {
    double v10 = [obj scrollView];
    [v10 addSubview:self->_pinnableBanner];
  }
}

- (double)previewScaleFactor
{
  double unscaledWebViewWidth = self->_unscaledWebViewWidth;
  double left = self->_obscuredInsets.left;
  double right = self->_obscuredInsets.right;
  [(UIView *)self->_contentContainerView bounds];
  double Width = CGRectGetWidth(v8);
  double result = 1.0;
  if (Width != 0.0 && self->_unscaledWebViewWidth != 0.0)
  {
    double result = Width / (unscaledWebViewWidth - left - right);
    if (result > 1.0) {
      return 1.0;
    }
  }
  return result;
}

- (CGRect)unscaledWebViewBounds
{
  [(UIView *)self->_contentContainerView bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  if (CGRectGetWidth(v14) == 0.0
    || (double unscaledWebViewWidth = self->_unscaledWebViewWidth,
        unscaledWebViewWidth - self->_obscuredInsets.left - self->_obscuredInsets.right == 0.0))
  {
    [(_SFBrowserView *)self bounds];
    double unscaledWebViewWidth = v12;
  }
  else
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGRectGetHeight(v15);
    _SFCeilingFloatToPixels();
    double v9 = v8;
    double v10 = 0.0;
    double v11 = 0.0;
  }
  double v13 = unscaledWebViewWidth;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (void)_scaleContentInset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  [(_SFLinkPreviewHeader *)self->_previewHeader bounds];
  double v4 = v3;
  [(_SFBrowserView *)self previewScaleFactor];
  double v6 = v5;
  double left = self->_obscuredInsets.left;
  double right = self->_obscuredInsets.right;
  double v9 = [WeakRetained scrollView];
  double v10 = v4 / v6;
  objc_msgSend(v9, "_sf_setContentInsetAdjustments:", v10, left, 0.0, right);
  objc_msgSend(v9, "setScrollIndicatorInsets:", v10, left, 0.0, right);
  objc_msgSend(WeakRetained, "_setObscuredInsets:", v10, left, 0.0, right);
  [WeakRetained bounds];
  double v12 = v11;
  double v14 = v13 - (left + right);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained bounds];
    objc_msgSend(WeakRetained, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v14, v12 - (v10 + 0.0), v14, v12 - (v10 + 0.0), v15, v16);
  }
  else
  {
    [WeakRetained bounds];
    [WeakRetained _overrideLayoutParametersWithMinimumLayoutSize:v14 maximumUnobscuredSizeOverride:v12 - (v10 + 0.0)];
  }
}

- (void)updatePreviewHeaderWithURLString:(id)a3
{
  id v6 = a3;
  double v4 = [(_SFBrowserView *)self previewHeader];
  if (v4)
  {
    double v5 = objc_msgSend(v6, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
    [v4 setDomain:v5];
  }
}

- (void)setShouldUseScrollToTopView:(BOOL)a3
{
  if (self->_shouldUseScrollToTopView != a3)
  {
    self->_shouldUseScrollToTopView = a3;
    scrollToTopView = self->_scrollToTopView;
    if (a3)
    {
      if (!scrollToTopView)
      {
        double v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        id v6 = self->_scrollToTopView;
        self->_scrollToTopView = v5;

        [(_SFBrowserView *)self addSubview:self->_scrollToTopView];
      }
    }
    else if (scrollToTopView)
    {
      [(UIView *)scrollToTopView removeFromSuperview];
      double v7 = self->_scrollToTopView;
      self->_scrollToTopView = 0;
    }
    [(_SFBrowserView *)self bounds];
    double v8 = self->_scrollToTopView;
    -[UIView setFrame:](v8, "setFrame:", 0.0, 0.0);
  }
}

- (void)setCrashBanner:(id)a3
{
  id v5 = a3;
  [(SFCrashBanner *)self->_crashBanner removeFromSuperview];
  objc_storeStrong((id *)&self->_crashBanner, a3);
  [(_SFBrowserView *)self insertSubview:self->_crashBanner belowSubview:self->_navigationBar];
  [(_SFBrowserView *)self setNeedsLayout];
}

- (void)setCrashBannerOffset:(double)a3
{
  if (self->_crashBannerOffset != a3)
  {
    self->_crashBannerOffset = a3;
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)setPinnableBanner:(id)a3
{
  id v7 = a3;
  [(SFPinnableBanner *)self->_pinnableBanner removeFromSuperview];
  objc_storeStrong((id *)&self->_pinnableBanner, a3);
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
    id v6 = [WeakRetained scrollView];
    [v6 addSubview:v7];

    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)setPinnableBannerOffset:(CGPoint)a3
{
  if (self->_pinnableBannerOffset.x != a3.x || self->_pinnableBannerOffset.y != a3.y)
  {
    self->_pinnableBannerOffset = a3;
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)setAppInfoOverlay:(id)a3
{
  id v5 = (UIView *)a3;
  p_appInfoOverlaCGFloat y = &self->_appInfoOverlay;
  appInfoOverlaCGFloat y = self->_appInfoOverlay;
  double v10 = v5;
  if (appInfoOverlay != v5)
  {
    [(UIView *)appInfoOverlay removeFromSuperview];
    objc_storeStrong((id *)&self->_appInfoOverlay, a3);
    [(SFPinnableBanner *)self->_pinnableBanner setHidden:*p_appInfoOverlay != 0];
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
      double v9 = [WeakRetained scrollView];
      [v9 addSubview:*p_appInfoOverlay];
    }
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (![v7 type])
  {
    if (!self->_hasReceivedTouchEvents) {
      self->_hasReceivedTouchEvents = 1;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained browserViewDidReceiveTouchEvent:self];
    }
  }
  previewHeader = self->_previewHeader;
  if (!previewHeader)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFBrowserView;
    uint64_t v10 = -[_SFBrowserView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    goto LABEL_11;
  }
  [(_SFLinkPreviewHeader *)previewHeader frame];
  v15.double x = x;
  v15.double y = y;
  if (CGRectContainsPoint(v16, v15))
  {
    uint64_t v10 = -[_SFLinkPreviewHeader hitTest:withEvent:](self->_previewHeader, "hitTest:withEvent:", v7, x, y);
LABEL_11:
    double v11 = (void *)v10;
    goto LABEL_13;
  }
  double v11 = 0;
LABEL_13:

  return v11;
}

- (void)setQuickLookDocumentView:(id)a3
{
  id v6 = a3;
  quickLookDocumentView = self->_quickLookDocumentView;
  if (quickLookDocumentView) {
    [(UIView *)quickLookDocumentView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_quickLookDocumentView, a3);
  if (self->_quickLookDocumentView)
  {
    [(UIView *)self->_contentContainerView addSubview:v6];
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)setMinimalUITopOffset:(double)a3
{
  if (self->_minimalUITopOffset != a3)
  {
    self->_double minimalUITopOffset = a3;
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)setNanoDomainContainerView:(id)a3
{
  id v5 = (SFNanoDomainContainerView *)a3;
  nanoDomainContainerView = self->_nanoDomainContainerView;
  id v7 = v5;
  if (nanoDomainContainerView != v5)
  {
    [(SFNanoDomainContainerView *)nanoDomainContainerView removeFromSuperview];
    objc_storeStrong((id *)&self->_nanoDomainContainerView, a3);
    [(_SFBrowserView *)self addSubview:self->_nanoDomainContainerView];
  }
}

- (void)setUnscaledWebViewWidth:(double)a3
{
  if (self->_unscaledWebViewWidth != a3)
  {
    self->_double unscaledWebViewWidth = a3;
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (void)setObscuredInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_obscuredInsets.left
    || a3.top != self->_obscuredInsets.top
    || a3.right != self->_obscuredInsets.right
    || a3.bottom != self->_obscuredInsets.bottom)
  {
    self->_obscuredInsets = a3;
    [(_SFBrowserView *)self setNeedsLayout];
  }
}

- (id)accessibilityIdentifier
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  double v4 = WeakRetained;
  if (self->_contentReadyForDisplay) {
    id v5 = @"true";
  }
  else {
    id v5 = @"false";
  }
  v10[0] = @"IsPageLoaded";
  v10[1] = @"WebViewProcessID";
  v11[0] = v5;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (int)objc_msgSend(WeakRetained, "_webProcessIdentifier"));
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  double v8 = WBSMakeAccessibilityIdentifier();

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)kvoContext == a6)
  {
    if ([v10 isEqualToString:@"fullscreenState"])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained browserViewFullscreenStateDidChange:self];
      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_SFBrowserView;
    [(_SFBrowserView *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)isContentReadyForDisplay
{
  return self->_contentReadyForDisplay;
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (_SFToolbar)toolbar
{
  return self->_toolbar;
}

- (_SFNavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (double)bottomBarOffset
{
  return self->_bottomBarOffset;
}

- (double)topBarHeight
{
  return self->_topBarHeight;
}

- (WKWebView)currentWebView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);

  return (WKWebView *)WeakRetained;
}

- (unint64_t)navigationBarBehavior
{
  return self->_navigationBarBehavior;
}

- (void)setNavigationBarBehavior:(unint64_t)a3
{
  self->_unint64_t navigationBarBehavior = a3;
}

- (_SFLinkPreviewHeader)previewHeader
{
  return self->_previewHeader;
}

- (UIView)statusBarBackgroundView
{
  return self->_statusBarBackgroundView;
}

- (UIView)scrollToTopView
{
  return self->_scrollToTopView;
}

- (BOOL)shouldUseScrollToTopView
{
  return self->_shouldUseScrollToTopView;
}

- (SFCrashBanner)crashBanner
{
  return self->_crashBanner;
}

- (double)crashBannerOffset
{
  return self->_crashBannerOffset;
}

- (SFPinnableBanner)pinnableBanner
{
  return self->_pinnableBanner;
}

- (CGPoint)pinnableBannerOffset
{
  double x = self->_pinnableBannerOffset.x;
  double y = self->_pinnableBannerOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (SFPinnableBanner)appBannerPendingFirstPaint
{
  return self->_appBannerPendingFirstPaint;
}

- (void)setAppBannerPendingFirstPaint:(id)a3
{
}

- (BOOL)hasReceivedTouchEvents
{
  return self->_hasReceivedTouchEvents;
}

- (UIView)quickLookDocumentView
{
  return self->_quickLookDocumentView;
}

- (double)minimalUITopOffset
{
  return self->_minimalUITopOffset;
}

- (SFBrowserViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFBrowserViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)unscaledWebViewWidth
{
  return self->_unscaledWebViewWidth;
}

- (UIEdgeInsets)obscuredInsets
{
  double top = self->_obscuredInsets.top;
  double left = self->_obscuredInsets.left;
  double bottom = self->_obscuredInsets.bottom;
  double right = self->_obscuredInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)appInfoOverlay
{
  return self->_appInfoOverlay;
}

- (SFNanoDomainContainerView)nanoDomainContainerView
{
  return self->_nanoDomainContainerView;
}

- (UIView)currentWebViewContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebViewContainerView);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentWebViewContainerView);
  objc_storeStrong((id *)&self->_nanoDomainContainerView, 0);
  objc_storeStrong((id *)&self->_appInfoOverlay, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quickLookDocumentView, 0);
  objc_storeStrong((id *)&self->_appBannerPendingFirstPaint, 0);
  objc_storeStrong((id *)&self->_pinnableBanner, 0);
  objc_storeStrong((id *)&self->_crashBanner, 0);
  objc_storeStrong((id *)&self->_scrollToTopView, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_previewHeader, 0);
  objc_destroyWeak((id *)&self->_currentWebView);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);

  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end