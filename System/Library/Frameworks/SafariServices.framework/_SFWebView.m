@interface _SFWebView
- (BOOL)becomeFirstResponder;
- (BOOL)hasBeenInWindow;
- (BOOL)isObscuringContents;
- (BOOL)webui_canPromptForAccountSecurityRecommendation;
- (NSArray)callStackSymbolsForLastRemovalFromWindow;
- (NSString)evOrganizationName;
- (UIEdgeInsets)hitTestInsets;
- (UIView)clippingView;
- (_SFWebView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (_SFWebViewDelegate)delegate;
- (double)bottomBarHeightAboveKeyboard;
- (id)_enclosingViewForExposedRectComputation;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)inputAccessoryView;
- (id)inputDashboardViewController;
- (id)scrollViewAtLocation:(CGPoint)a3;
- (id)undoManager;
- (int64_t)navigationGesturePolicy;
- (void)_close;
- (void)_setObscuredInsets:(UIEdgeInsets)a3;
- (void)_updateNavigationGesturesAllowed;
- (void)dealloc;
- (void)didEndFormControlInteraction;
- (void)didMoveToWindow;
- (void)didStartFormControlInteraction;
- (void)dismissDialogView:(id)a3 withAdditionalAnimations:(id)a4 forDialogController:(id)a5;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)layoutSubviews;
- (void)presentDialogView:(id)a3 withAdditionalAnimations:(id)a4 forDialogController:(id)a5;
- (void)safeAreaInsetsDidChange;
- (void)setBottomBarHeightAboveKeyboard:(double)a3;
- (void)setClippingView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHitTestInsets:(UIEdgeInsets)a3;
- (void)setNavigationGesturePolicy:(int64_t)a3;
- (void)setObscuringContents:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderImage:(id)a3 offset:(double)a4;
- (void)setSuggestedFilenameForCurrentBackForwardListItem:(id)a3;
- (void)webui_setInputDashboardViewController:(id)a3;
@end

@implementation _SFWebView

- (void)setHitTestInsets:(UIEdgeInsets)a3
{
  self->_hitTestInsets = a3;
}

- (void)_setObscuredInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(_SFWebView *)self _obscuredInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)_SFWebView;
  -[_SFWebView _setObscuredInsets:](&v19, sel__setObscuredInsets_, top, left, bottom, right);
  -[SFDialogView setObscuredInsets:](self->_dialogView, "setObscuredInsets:", top, left, bottom, right);
  if (self->_placeholderView)
  {
    if (v11 != left || v9 != top || v15 != right || v13 != bottom) {
      [(_SFWebView *)self setNeedsLayout];
    }
  }
}

- (void)setPlaceholderImage:(id)a3
{
}

- (void)setBottomBarHeightAboveKeyboard:(double)a3
{
  if ((_SFEqualWithEpsilon() & 1) == 0)
  {
    self->_bottomBarHeightAboveKeyboard = a3;
    [(SFWebFormAccessoryViewWrapper *)self->_inputAccessoryContainerView setBottomBarHeight:a3];
    [(_SFWebView *)self reloadInputViews];
  }
}

- (id)_enclosingViewForExposedRectComputation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clippingView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFWebView;
    id v5 = [(_SFWebView *)&v8 _enclosingViewForExposedRectComputation];
  }
  v6 = v5;

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)_SFWebView;
  [(_SFWebView *)&v21 layoutSubviews];
  [(_SFWebView *)self _updateNavigationGesturesAllowed];
  if (self->_placeholderView)
  {
    [(_SFWebView *)self _obscuredInsets];
    double v4 = v3;
    [(_SFWebView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7 + 0.0;
    CGFloat v10 = v4 + v9;
    CGFloat v12 = v11 - (v4 + 0.0);
    double v13 = [(UIImageView *)self->_placeholderView image];
    [v13 size];
    double v15 = v14;
    double v17 = v16;

    v22.origin.x = v8;
    v22.origin.y = v10;
    v22.size.width = v6;
    v22.size.height = v12;
    CGFloat Width = CGRectGetWidth(v22);
    CGFloat v19 = v10 + self->_placeholderOffset;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __28___SFWebView_layoutSubviews__block_invoke;
    v20[3] = &unk_1E5C78670;
    v20[4] = self;
    *(CGFloat *)&v20[5] = v8;
    *(CGFloat *)&v20[6] = v19;
    *(CGFloat *)&v20[7] = v6;
    *(double *)&v20[8] = v17 * Width / v15;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
  }
}

- (void)_updateNavigationGesturesAllowed
{
  int64_t navigationGesturePolicy = self->_navigationGesturePolicy;
  if (navigationGesturePolicy == 1)
  {
    -[_SFWebView setAllowsBackForwardNavigationGestures:](&v3, sel_setAllowsBackForwardNavigationGestures_, 0, self, _SFWebView, v4.receiver, v4.super_class);
  }
  else if (!navigationGesturePolicy)
  {
    -[_SFWebView setAllowsBackForwardNavigationGestures:](&v4, sel_setAllowsBackForwardNavigationGestures_, self->_dialogView == 0, v3.receiver, v3.super_class, self, _SFWebView);
  }
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)_SFWebView;
  [(_SFWebView *)&v7 didMoveToWindow];
  objc_super v3 = [(_SFWebView *)self window];

  if (v3)
  {
    self->_hasBeenInWindow = 1;
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v5 = (NSArray *)[v4 copy];
    callStackSymbolsForLastRemovalFromWindow = self->_callStackSymbolsForLastRemovalFromWindow;
    self->_callStackSymbolsForLastRemovalFromWindow = v5;
  }
}

- (_SFWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_SFWebView;
  objc_super v4 = -[_SFWebView initWithFrame:configuration:](&v10, sel_initWithFrame_configuration_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__sf_applicationDidEnterBackgroundOrWillTerminate_ name:*MEMORY[0x1E4FB2640] object:0];
    [v5 addObserver:v4 selector:sel__sf_applicationDidEnterBackgroundOrWillTerminate_ name:*MEMORY[0x1E4FB2740] object:0];
    CGFloat v6 = [(_SFWebView *)v4 scrollView];
    if (objc_opt_respondsToSelector()) {
      [v6 _setAlwaysAppliesKeyboardBottomInsetAdjustment:1];
    }
    [v6 setContentInsetAdjustmentBehavior:2];
    objc_super v7 = SFFocusGroupIdentifierForOwner();
    [(_SFWebView *)v4 setFocusGroupIdentifier:v7];

    CGFloat v8 = v4;
  }

  return v4;
}

- (void)safeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)_SFWebView;
  [(_SFWebView *)&v4 safeAreaInsetsDidChange];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sfWebViewDidChangeSafeAreaInsets:self];
  }
}

- (void)setPlaceholderImage:(id)a3 offset:(double)a4
{
  id v6 = a3;
  id v7 = [(UIImageView *)self->_placeholderView image];
  if (v7 == v6)
  {
    double placeholderOffset = self->_placeholderOffset;

    if (placeholderOffset == a4) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  CGFloat v8 = [(_SFWebView *)self scrollView];
  [v8 setScrollEnabled:v6 == 0];

  [(NSTimer *)self->_placeholderViewRemovalTimer invalidate];
  placeholderViewRemovalTimer = self->_placeholderViewRemovalTimer;
  self->_placeholderViewRemovalTimer = 0;

  if (v6)
  {
    objc_initWeak(&location, self);
    placeholderView = self->_placeholderView;
    if (!placeholderView)
    {
      double v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F78370]);
      CGFloat v12 = self->_placeholderView;
      self->_placeholderView = v11;

      double v13 = self->_placeholderView;
      if (self->_contentObscuringView) {
        -[_SFWebView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v13);
      }
      else {
        [(_SFWebView *)self addSubview:v13];
      }
      [(_SFWebView *)self setNeedsLayout];
      placeholderView = self->_placeholderView;
    }
    [(UIImageView *)placeholderView setImage:v6];
    [(UIImageView *)self->_placeholderView setAlpha:1.0];
    double v15 = [(UIImageView *)self->_placeholderView layer];
    [v15 removeAllAnimations];

    self->_double placeholderOffset = a4;
    double v16 = (void *)MEMORY[0x1E4F1CB00];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41___SFWebView_setPlaceholderImage_offset___block_invoke_3;
    v19[3] = &unk_1E5C733A8;
    objc_copyWeak(&v20, &location);
    double v17 = [v16 scheduledTimerWithTimeInterval:0 repeats:v19 block:5.0];
    v18 = self->_placeholderViewRemovalTimer;
    self->_placeholderViewRemovalTimer = v17;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __41___SFWebView_setPlaceholderImage_offset___block_invoke;
    v23[3] = &unk_1E5C724D8;
    v23[4] = self;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __41___SFWebView_setPlaceholderImage_offset___block_invoke_2;
    v22[3] = &unk_1E5C72678;
    v22[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0x10000 delay:v23 options:v22 animations:0.2 completion:0.05];
  }
LABEL_13:
}

- (void)dealloc
{
  [(NSTimer *)self->_placeholderViewRemovalTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SFWebView;
  [(_SFWebView *)&v3 dealloc];
}

- (id)scrollViewAtLocation:(CGPoint)a3
{
  -[_SFWebView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_super v4 = (_SFWebView *)objc_claimAutoreleasedReturnValue();
  double v5 = v4;
  id v6 = 0;
  if (!v4 || v4 == self)
  {
    id v7 = v4;
  }
  else
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v7 = [(_SFWebView *)v5 superview];

      id v6 = 0;
      if (v7)
      {
        double v5 = v7;
        if (v7 != self) {
          continue;
        }
      }
      goto LABEL_9;
    }
    id v7 = v5;
    id v6 = v7;
  }
LABEL_9:

  return v6;
}

- (void)setNavigationGesturePolicy:(int64_t)a3
{
  self->_int64_t navigationGesturePolicy = a3;
  [(_SFWebView *)self _updateNavigationGesturesAllowed];
}

- (void)_close
{
  [(WKWebView *)self _sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata];
  v3.receiver = self;
  v3.super_class = (Class)_SFWebView;
  [(_SFWebView *)&v3 _close];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(_SFWebView *)self isHidden])
  {
    id v8 = 0;
  }
  else
  {
    [(_SFWebView *)self bounds];
    double top = self->_hitTestInsets.top;
    double left = self->_hitTestInsets.left;
    v31.origin.double x = v11 + left;
    v31.origin.double y = v12 + top;
    v31.size.width = v13 - (left + self->_hitTestInsets.right);
    v31.size.height = v14 - (top + self->_hitTestInsets.bottom);
    v29.double x = x;
    v29.double y = y;
    if (CGRectContainsPoint(v31, v29))
    {
      v27.receiver = self;
      v27.super_class = (Class)_SFWebView;
      -[_SFWebView hitTest:withEvent:](&v27, sel_hitTest_withEvent_, v7, x, y);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v15 = [(_SFWebView *)self scrollView];
      [v15 bounds];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
      v30.double x = v24;
      v30.double y = v25;
      v32.origin.double x = v17;
      v32.origin.double y = v19;
      v32.size.width = v21;
      v32.size.height = v23;
      if (CGRectContainsPoint(v32, v30)) {
        id v8 = v15;
      }
      else {
        id v8 = 0;
      }
    }
  }

  return v8;
}

- (BOOL)becomeFirstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sfWebViewDidBecomeFirstResponder:self];
  }
  dialogView = self->_dialogView;
  if (dialogView)
  {
    unsigned __int8 v5 = [(SFDialogView *)dialogView becomeFirstResponder];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFWebView;
    unsigned __int8 v5 = [(_SFWebView *)&v8 becomeFirstResponder];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)didStartFormControlInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sfWebViewDidStartFormControlInteraction:self];
  }
}

- (void)didEndFormControlInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sfWebViewDidEndFormControlInteraction:self];
  }
}

- (id)inputDashboardViewController
{
  return self->_inputDashboardViewController;
}

- (id)inputAccessoryView
{
  v11.receiver = self;
  v11.super_class = (Class)_SFWebView;
  uint64_t v3 = [(_SFWebView *)&v11 inputAccessoryView];
  objc_super v4 = (void *)v3;
  if (v3)
  {
    inputAccessoryContainerView = (SFWebFormAccessoryViewWrapper *)v3;
    if (self->_bottomBarHeightAboveKeyboard != 0.0)
    {
      inputAccessoryContainerView = self->_inputAccessoryContainerView;
      if (!inputAccessoryContainerView)
      {
        BOOL v6 = (SFWebFormAccessoryViewWrapper *)[objc_alloc(MEMORY[0x1E4F78538]) initWithWebFormAccessoryView:v3 bottomBarHeight:self->_bottomBarHeightAboveKeyboard];
        id v7 = self->_inputAccessoryContainerView;
        self->_inputAccessoryContainerView = v6;

        objc_super v8 = [MEMORY[0x1E4FB1618] clearColor];
        [(SFWebFormAccessoryViewWrapper *)self->_inputAccessoryContainerView setBackgroundColor:v8];

        [(SFWebFormAccessoryViewWrapper *)self->_inputAccessoryContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
        inputAccessoryContainerView = self->_inputAccessoryContainerView;
      }
    }
    double v9 = inputAccessoryContainerView;
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)undoManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([WeakRetained overrideUndoManagerForSFWebView:self],
        (objc_super v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFWebView;
    objc_super v4 = [(_SFWebView *)&v6 undoManager];
  }

  return v4;
}

- (NSString)evOrganizationName
{
  uint64_t v2 = [(_SFWebView *)self serverTrust];
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v3 = (__SecTrust *)v2;
  objc_super v4 = (void *)SecTrustCopyInfo();
  if (v4) {
    goto LABEL_3;
  }
  id v7 = 0;
  if (!SecTrustEvaluateWithError(v3, 0)) {
    goto LABEL_15;
  }
  objc_super v4 = (void *)SecTrustCopyInfo();
  if (v4)
  {
LABEL_3:
    unsigned __int8 v5 = [v4 objectForKey:*MEMORY[0x1E4F3BCB0]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 BOOLValue])
    {
      objc_super v6 = [v4 objectForKey:*MEMORY[0x1E4F3BCC8]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 BOOLValue])
      {
        id v7 = [v4 objectForKey:*MEMORY[0x1E4F3BCA8]];
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
LABEL_11:
    id v7 = 0;
  }
LABEL_15:

  return (NSString *)v7;
}

- (void)setObscuringContents:(BOOL)a3
{
  if (self->_obscuringContents != a3)
  {
    self->_obscuringContents = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(_SFWebView *)self bounds];
      unsigned __int8 v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      contentObscuringView = self->_contentObscuringView;
      self->_contentObscuringView = v5;

      [(UIView *)self->_contentObscuringView setAutoresizingMask:18];
      id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [(UIView *)self->_contentObscuringView setBackgroundColor:v7];

      objc_super v8 = self->_contentObscuringView;
      [(_SFWebView *)self addSubview:v8];
    }
    else
    {
      [(UIView *)self->_contentObscuringView removeFromSuperview];
      double v9 = self->_contentObscuringView;
      self->_contentObscuringView = 0;
    }
  }
}

- (void)setSuggestedFilenameForCurrentBackForwardListItem:(id)a3
{
  id v4 = a3;
  id v6 = [(_SFWebView *)self backForwardList];
  unsigned __int8 v5 = [v6 currentItem];
  objc_msgSend(v5, "_sf_setExplicitSuggestedFilename:", v4);
}

- (void)presentDialogView:(id)a3 withAdditionalAnimations:(id)a4 forDialogController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)&self->_dialogView, a3);
  [(SFDialogView *)self->_dialogView setAutoresizingMask:18];
  [(_SFWebView *)self bounds];
  -[SFDialogView setFrame:](self->_dialogView, "setFrame:");
  dialogView = self->_dialogView;
  [(_SFWebView *)self _obscuredInsets];
  -[SFDialogView setObscuredInsets:](dialogView, "setObscuredInsets:");
  [(_SFWebView *)self addSubview:self->_dialogView];
  [(SFDialogView *)self->_dialogView setAlpha:0.0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke;
  v16[3] = &unk_1E5C724D8;
  v16[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v16];
  objc_super v11 = (void *)MEMORY[0x1E4FB1EB0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke_2;
  v14[3] = &unk_1E5C73300;
  id v12 = v9;
  v14[4] = self;
  id v15 = v12;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke_3;
  v13[3] = &unk_1E5C72678;
  v13[4] = self;
  [v11 _animateUsingDefaultTimingWithOptions:2 animations:v14 completion:v13];
  if (([(_SFWebView *)self isFirstResponder] & 1) != 0
    || [(_SFWebView *)self _isAncestorOfFirstResponder])
  {
    [(SFDialogView *)self->_dialogView becomeFirstResponder];
  }
}

- (void)dismissDialogView:(id)a3 withAdditionalAnimations:(id)a4 forDialogController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  dialogView = self->_dialogView;
  self->_dialogView = 0;

  [(_SFWebView *)self setNeedsLayout];
  [v7 willDisappear];
  objc_super v10 = (void *)MEMORY[0x1E4FB1EB0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77___SFWebView_dismissDialogView_withAdditionalAnimations_forDialogController___block_invoke;
  v15[3] = &unk_1E5C73300;
  id v17 = v8;
  id v16 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77___SFWebView_dismissDialogView_withAdditionalAnimations_forDialogController___block_invoke_2;
  v13[3] = &unk_1E5C72678;
  id v14 = v16;
  id v11 = v16;
  id v12 = v8;
  [v10 _animateUsingDefaultTimingWithOptions:6 animations:v15 completion:v13];
}

- (BOOL)webui_canPromptForAccountSecurityRecommendation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained sfWebViewCanPromptForAccountSecurityRecommendation];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (void)webui_setInputDashboardViewController:(id)a3
{
  unsigned __int8 v5 = (UIPredictiveViewController *)a3;
  if (self->_inputDashboardViewController != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_inputDashboardViewController, a3);
    id v6 = [(_SFWebView *)self firstResponder];
    [v6 reloadInputViews];

    unsigned __int8 v5 = v7;
  }
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_SFWebView;
  [(_SFWebView *)&v6 findInteraction:a3 didEndFindSession:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sfWebViewDidDismissFindOnPage:self];
  }
}

- (UIEdgeInsets)hitTestInsets
{
  double top = self->_hitTestInsets.top;
  double left = self->_hitTestInsets.left;
  double bottom = self->_hitTestInsets.bottom;
  double right = self->_hitTestInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)navigationGesturePolicy
{
  return self->_navigationGesturePolicy;
}

- (_SFWebViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFWebViewDelegate *)WeakRetained;
}

- (UIView)clippingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clippingView);

  return (UIView *)WeakRetained;
}

- (void)setClippingView:(id)a3
{
}

- (double)bottomBarHeightAboveKeyboard
{
  return self->_bottomBarHeightAboveKeyboard;
}

- (BOOL)isObscuringContents
{
  return self->_obscuringContents;
}

- (BOOL)hasBeenInWindow
{
  return self->_hasBeenInWindow;
}

- (NSArray)callStackSymbolsForLastRemovalFromWindow
{
  return self->_callStackSymbolsForLastRemovalFromWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callStackSymbolsForLastRemovalFromWindow, 0);
  objc_destroyWeak((id *)&self->_clippingView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputDashboardViewController, 0);
  objc_storeStrong((id *)&self->_inputAccessoryContainerView, 0);
  objc_storeStrong((id *)&self->_contentObscuringView, 0);
  objc_storeStrong((id *)&self->_placeholderViewRemovalTimer, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);

  objc_storeStrong((id *)&self->_dialogView, 0);
}

@end