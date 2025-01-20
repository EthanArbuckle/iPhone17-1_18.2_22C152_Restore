@interface CKMacToolbarController
+ (id)defaultSecondaryItemIdentifiers;
+ (id)primaryItemIdentifiersFullWindow;
+ (id)primaryItemIdentifiersStandaloneWindow;
- (BOOL)_shouldDisAllowTouchesToPassForProviderType:(int64_t)a3;
- (BOOL)_updateFrameWithPreferredHeightsForFrame:(CGRect)a3;
- (BOOL)isInStandaloneWindow;
- (BOOL)macToolbarView:(id)a3 shouldAllowTouchesForPoint:(CGPoint)a4 andEvent:(id)a5;
- (BOOL)reparentToolbarItemsForProvider:(id)a3;
- (BOOL)shouldDrawPrimaryBlur;
- (BOOL)shouldDrawSecondaryBlur;
- (CGRect)alignmentRectForItemWithIdentifier:(id)a3;
- (CKMacToolbarController)initWithScene:(id)a3 connectingToSession:(id)a4 inStandaloneWindow:(BOOL)a5;
- (CKMacToolbarDelegate)delegate;
- (CKMacToolbarItemProvider)primaryItemProvider;
- (CKMacToolbarItemProvider)secondaryItemProvider;
- (NSMutableDictionary)toolbarItemCache;
- (NSString)sceneSessionIdentifier;
- (UIView)primaryProvidedVirtualView;
- (UIView)secondaryProvidedVirtualView;
- (UIVisualEffectView)primaryVirtualBackgroundView;
- (UIVisualEffectView)secondaryVirtualBackgroundView;
- (UIWindowScene)windowScene;
- (double)_getPreferredHeightForProviderType:(int64_t)a3 withDefaultHeight:(double)a4;
- (double)preferredPrimaryHeight;
- (double)preferredSecondaryHeight;
- (double)splitViewDividerXPosition;
- (id)_cachedVirtualViewForProviderType:(int64_t)a3;
- (id)_providerForType:(int64_t)a3;
- (id)_virtualBackgroundViewForProviderType:(int64_t)a3;
- (int64_t)_providerTypeForItemIdentifier:(id)a3;
- (int64_t)_providerTypeForPointInsideVirtualView:(CGPoint)a3 withEvent:(id)a4;
- (void)_setVirtualView:(id)a3 forProviderType:(int64_t)a4;
- (void)_sizeMetricsDidChange;
- (void)_updateBackgroundViewsRefreshingViewHeights:(BOOL)a3;
- (void)_updateVirtualViewForProviderType:(int64_t)a3;
- (void)loadView;
- (void)removeItemProvider:(id)a3;
- (void)removeItemProviders;
- (void)removeVirtualViewForProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInStandaloneWindow:(BOOL)a3;
- (void)setPreferredPrimaryHeight:(double)a3;
- (void)setPreferredSecondaryHeight:(double)a3;
- (void)setPrimaryItemProvider:(id)a3;
- (void)setPrimaryProvidedVirtualView:(id)a3;
- (void)setSecondaryItemProvider:(id)a3;
- (void)setSecondaryProvidedVirtualView:(id)a3;
- (void)setShouldDrawPrimaryBlur:(BOOL)a3;
- (void)setShouldDrawSecondaryBlur:(BOOL)a3;
- (void)setSplitViewDividerXPosition:(double)a3;
- (void)setToolbarItemCache:(id)a3;
- (void)updateVirtualViewForProvider:(id)a3;
- (void)updateWithFrame:(CGRect)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CKMacToolbarController

+ (id)primaryItemIdentifiersFullWindow
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)primaryItemIdentifiersStandaloneWindow
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)defaultSecondaryItemIdentifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (CKMacToolbarController)initWithScene:(id)a3 connectingToSession:(id)a4 inStandaloneWindow:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKMacToolbarController;
  v10 = [(CKMacToolbarController *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_windowScene, v8);
    v12 = [v9 persistentIdentifier];
    objc_storeWeak((id *)&v11->_sceneSessionIdentifier, v12);

    v11->_shouldDrawPrimaryBlur = 1;
    v11->_shouldDrawSecondaryBlur = 1;
    v11->_isInStandaloneWindow = a5;
  }

  return v11;
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)CKMacToolbarController;
  [(CKMacToolbarController *)&v11 loadView];
  if (!self->_primaryVirtualBackgroundView || !self->_secondaryVirtualBackgroundView)
  {
    v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    primaryVirtualBackgroundView = self->_primaryVirtualBackgroundView;
    self->_primaryVirtualBackgroundView = v3;

    v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    secondaryVirtualBackgroundView = self->_secondaryVirtualBackgroundView;
    self->_secondaryVirtualBackgroundView = v5;

    v7 = objc_alloc_init(CKMacToolbarView);
    [(CKMacToolbarView *)v7 setDelegate:self];
    [(CKMacToolbarController *)self setView:v7];
    id v8 = [(CKMacToolbarController *)self view];
    [v8 addSubview:self->_primaryVirtualBackgroundView];

    id v9 = [(CKMacToolbarController *)self view];
    [v9 addSubview:self->_secondaryVirtualBackgroundView];

    v10 = [(CKMacToolbarController *)self view];
    [v10 setBackgroundColor:0];
  }
}

- (void)viewWillLayoutSubviews
{
  [(CKMacToolbarController *)self _updateBackgroundViewsRefreshingViewHeights:0];
  [(CKMacToolbarController *)self _updateVirtualViewForProviderType:1];

  [(CKMacToolbarController *)self _updateVirtualViewForProviderType:2];
}

- (double)_getPreferredHeightForProviderType:(int64_t)a3 withDefaultHeight:(double)a4
{
  v5 = [(CKMacToolbarController *)self _providerForType:a3];
  if (objc_opt_respondsToSelector())
  {
    [v5 virtualToolbarPreferredHeight];
    a4 = v6;
  }

  return a4;
}

- (void)_updateBackgroundViewsRefreshingViewHeights:(BOOL)a3
{
  if (a3)
  {
    v4 = [(CKMacToolbarController *)self view];
    [v4 frame];
    -[CKMacToolbarController _updateFrameWithPreferredHeightsForFrame:](self, "_updateFrameWithPreferredHeightsForFrame:");
  }
  v5 = [(CKMacToolbarController *)self view];
  int v6 = [v5 _shouldReverseLayoutDirection];

  v7 = [(CKMacToolbarController *)self view];
  [v7 frame];
  double v9 = v8;

  v10 = +[CKUIBehavior sharedBehaviors];
  [v10 macAppKitToolbarHeight];
  double v12 = v11;

  [(CKMacToolbarController *)self preferredPrimaryHeight];
  double v13 = v12;
  if (v14 != 0.0)
  {
    [(CKMacToolbarController *)self preferredPrimaryHeight];
    double v13 = v15;
  }
  [(CKMacToolbarController *)self preferredSecondaryHeight];
  if (v16 != 0.0)
  {
    [(CKMacToolbarController *)self preferredSecondaryHeight];
    double v12 = v17;
  }
  double v18 = 0.0;
  if ([(CKMacToolbarController *)self isInStandaloneWindow]) {
    double v19 = 0.0;
  }
  else {
    double v19 = 1.0;
  }
  [(CKMacToolbarController *)self splitViewDividerXPosition];
  BOOL v21 = v20 <= 0.0;
  if (v6)
  {
    double v22 = v9;
    if (!v21) {
      [(CKMacToolbarController *)self splitViewDividerXPosition];
    }
    double v23 = v22 - v19;
    double v24 = 0.0;
    double v25 = v22 + 0.0;
    double v18 = v9 - v22;
  }
  else
  {
    if (v20 > 0.0)
    {
      [(CKMacToolbarController *)self splitViewDividerXPosition];
      double v18 = v26;
    }
    double v24 = v19 + v18;
    double v23 = v9 - v18;
    double v25 = 0.0;
  }
  [(UIVisualEffectView *)self->_primaryVirtualBackgroundView frame];
  v32.origin.x = v25;
  v32.origin.y = 0.0;
  v32.size.width = v18;
  v32.size.height = v13;
  if (!CGRectEqualToRect(v30, v32))
  {
    -[UIVisualEffectView setFrame:](self->_primaryVirtualBackgroundView, "setFrame:", v25, 0.0, v18, v13);
    [(UIVisualEffectView *)self->_primaryVirtualBackgroundView setNeedsLayout];
    [(UIVisualEffectView *)self->_primaryVirtualBackgroundView layoutIfNeeded];
  }
  [(UIVisualEffectView *)self->_secondaryVirtualBackgroundView frame];
  v33.origin.x = v24;
  v33.origin.y = 0.0;
  v33.size.width = v23;
  v33.size.height = v12;
  if (!CGRectEqualToRect(v31, v33))
  {
    -[UIVisualEffectView setFrame:](self->_secondaryVirtualBackgroundView, "setFrame:", v24, 0.0, v23, v12);
    [(UIVisualEffectView *)self->_secondaryVirtualBackgroundView setNeedsLayout];
    [(UIVisualEffectView *)self->_secondaryVirtualBackgroundView layoutIfNeeded];
  }
  [(UIVisualEffectView *)self->_primaryVirtualBackgroundView setHidden:[(CKMacToolbarController *)self shouldDrawPrimaryBlur] ^ 1];
  uint64_t v27 = [(CKMacToolbarController *)self shouldDrawSecondaryBlur] ^ 1;
  secondaryVirtualBackgroundView = self->_secondaryVirtualBackgroundView;

  [(UIVisualEffectView *)secondaryVirtualBackgroundView setHidden:v27];
}

- (BOOL)_updateFrameWithPreferredHeightsForFrame:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 macAppKitToolbarHeight];
  double v9 = v8;

  BOOL v10 = 1;
  [(CKMacToolbarController *)self _getPreferredHeightForProviderType:1 withDefaultHeight:v9];
  double v12 = v11;
  [(CKMacToolbarController *)self _getPreferredHeightForProviderType:2 withDefaultHeight:v9];
  double v14 = v13;
  if (v12 >= v13) {
    double v15 = v12;
  }
  else {
    double v15 = v13;
  }
  [(CKMacToolbarController *)self preferredPrimaryHeight];
  if (v12 == v16)
  {
    [(CKMacToolbarController *)self preferredSecondaryHeight];
    BOOL v10 = v14 != v17;
  }
  [(CKMacToolbarController *)self setPreferredPrimaryHeight:v12];
  [(CKMacToolbarController *)self setPreferredSecondaryHeight:v14];
  double v18 = [(CKMacToolbarController *)self view];
  [v18 frame];
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.height = v15;
  BOOL v19 = CGRectEqualToRect(v22, v23);

  if (!v19)
  {
    double v20 = [(CKMacToolbarController *)self view];
    objc_msgSend(v20, "setFrame:", x, y, width, v15);

    return 1;
  }
  return v10;
}

- (BOOL)reparentToolbarItemsForProvider:(id)a3
{
  return 0;
}

- (void)setShouldDrawPrimaryBlur:(BOOL)a3
{
  if (self->_shouldDrawPrimaryBlur != a3)
  {
    self->_shouldDrawPrimaryBlur = a3;
    if ([(CKMacToolbarController *)self isViewLoaded])
    {
      [(CKMacToolbarController *)self _updateBackgroundViewsRefreshingViewHeights:0];
    }
  }
}

- (void)setShouldDrawSecondaryBlur:(BOOL)a3
{
  if (self->_shouldDrawSecondaryBlur != a3)
  {
    self->_shouldDrawSecondaryBlur = a3;
    if ([(CKMacToolbarController *)self isViewLoaded])
    {
      [(CKMacToolbarController *)self _updateBackgroundViewsRefreshingViewHeights:0];
    }
  }
}

- (void)updateWithFrame:(CGRect)a3
{
  if (-[CKMacToolbarController _updateFrameWithPreferredHeightsForFrame:](self, "_updateFrameWithPreferredHeightsForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    [(CKMacToolbarController *)self _updateBackgroundViewsRefreshingViewHeights:0];
    [(CKMacToolbarController *)self _updateVirtualViewForProviderType:1];
    [(CKMacToolbarController *)self _updateVirtualViewForProviderType:2];
    [(CKMacToolbarController *)self _sizeMetricsDidChange];
  }
}

- (void)_sizeMetricsDidChange
{
  v3 = [(CKMacToolbarController *)self primaryItemProvider];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(CKMacToolbarController *)self primaryItemProvider];
    [v5 toolbarSizeMetricsDidChange];
  }
  int v6 = [(CKMacToolbarController *)self secondaryItemProvider];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CKMacToolbarController *)self secondaryItemProvider];
    [v8 toolbarSizeMetricsDidChange];
  }
}

- (void)removeItemProviders
{
  [(CKMacToolbarController *)self setPrimaryItemProvider:0];
  [(CKMacToolbarController *)self setSecondaryItemProvider:0];

  [(CKMacToolbarController *)self reloadToolbarItems];
}

- (void)setSplitViewDividerXPosition:(double)a3
{
  if (!CKFloatApproximatelyEqualToFloatWithTolerance(a3, self->_splitViewDividerXPosition, 0.00000999999975))
  {
    self->_splitViewDividerXPosition = a3;
    [(CKMacToolbarController *)self _updateBackgroundViewsRefreshingViewHeights:0];
    [(CKMacToolbarController *)self _updateVirtualViewForProviderType:1];
    [(CKMacToolbarController *)self _updateVirtualViewForProviderType:2];
    [(CKMacToolbarController *)self _sizeMetricsDidChange];
  }
}

- (void)setPrimaryItemProvider:(id)a3
{
  v5 = (CKMacToolbarItemProvider *)a3;
  primaryItemProvider = self->_primaryItemProvider;
  char v7 = v5;
  if (primaryItemProvider != v5)
  {
    if (primaryItemProvider) {
      [(CKMacToolbarItemProvider *)primaryItemProvider providerWillBeRemovedFromToolbarController:self];
    }
    objc_storeStrong((id *)&self->_primaryItemProvider, a3);
    [(CKMacToolbarController *)self _updateBackgroundViewsRefreshingViewHeights:1];
    [(CKMacToolbarController *)self _updateVirtualViewForProviderType:1];
    if (self->_primaryItemProvider) {
      -[CKMacToolbarController reparentToolbarItemsForProvider:](self, "reparentToolbarItemsForProvider:");
    }
  }
}

- (void)setSecondaryItemProvider:(id)a3
{
  v5 = (CKMacToolbarItemProvider *)a3;
  secondaryItemProvider = self->_secondaryItemProvider;
  char v7 = v5;
  if (secondaryItemProvider != v5)
  {
    if (secondaryItemProvider) {
      [(CKMacToolbarItemProvider *)secondaryItemProvider providerWillBeRemovedFromToolbarController:self];
    }
    objc_storeStrong((id *)&self->_secondaryItemProvider, a3);
    [(CKMacToolbarController *)self _updateBackgroundViewsRefreshingViewHeights:1];
    [(CKMacToolbarController *)self _updateVirtualViewForProviderType:2];
    if (self->_secondaryItemProvider) {
      -[CKMacToolbarController reparentToolbarItemsForProvider:](self, "reparentToolbarItemsForProvider:");
    }
  }
}

- (void)removeVirtualViewForProvider:(id)a3
{
  id v11 = a3;
  id v4 = [(CKMacToolbarController *)self primaryItemProvider];

  if (v4 == v11)
  {
    uint64_t v7 = [(CKMacToolbarController *)self primaryProvidedVirtualView];
  }
  else
  {
    id v5 = [(CKMacToolbarController *)self secondaryItemProvider];

    int v6 = v11;
    if (v5 != v11) {
      goto LABEL_9;
    }
    uint64_t v7 = [(CKMacToolbarController *)self secondaryProvidedVirtualView];
  }
  id v8 = (void *)v7;
  int v6 = v11;
  if (v8)
  {
    double v9 = [v8 superview];
    BOOL v10 = [(CKMacToolbarController *)self view];

    if (v9 == v10) {
      [v8 removeFromSuperview];
    }

    int v6 = v11;
  }
LABEL_9:
}

- (void)removeItemProvider:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [(CKMacToolbarController *)self primaryItemProvider];

    if (v5 == v7)
    {
      [(CKMacToolbarController *)self setPrimaryItemProvider:0];
    }
    else
    {
      id v6 = [(CKMacToolbarController *)self secondaryItemProvider];

      id v4 = v7;
      if (v6 != v7) {
        goto LABEL_7;
      }
      [(CKMacToolbarController *)self setSecondaryItemProvider:0];
    }
    id v4 = v7;
  }
LABEL_7:
}

- (void)updateVirtualViewForProvider:(id)a3
{
  id v8 = a3;
  id v4 = [(CKMacToolbarController *)self primaryItemProvider];

  if (v4 == v8)
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v5 = [(CKMacToolbarController *)self secondaryItemProvider];

    id v6 = v8;
    if (v5 != v8) {
      goto LABEL_6;
    }
    uint64_t v7 = 2;
  }
  [(CKMacToolbarController *)self _updateBackgroundViewsRefreshingViewHeights:1];
  [(CKMacToolbarController *)self _updateVirtualViewForProviderType:v7];
  id v6 = v8;
LABEL_6:
}

- (CGRect)alignmentRectForItemWithIdentifier:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_updateVirtualViewForProviderType:(int64_t)a3
{
  -[CKMacToolbarController _providerForType:](self, "_providerForType:");
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = [(CKMacToolbarController *)self _cachedVirtualViewForProviderType:a3];
  if (v34 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v6 = [v34 virtualView];
  }
  else
  {
    double v6 = 0;
  }
  if (v6 != v5)
  {
    uint64_t v7 = [v5 superview];
    id v8 = [(CKMacToolbarController *)self view];

    if (v7 == v8) {
      [v5 removeFromSuperview];
    }
    [(CKMacToolbarController *)self _setVirtualView:v6 forProviderType:a3];
  }
  if (v34 && v6)
  {
    [v6 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double v17 = [(CKMacToolbarController *)self _virtualBackgroundViewForProviderType:a3];
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    if (objc_opt_respondsToSelector())
    {
      [v34 virtualToolbarContentInsets];
      double v19 = v19 + v26;
      double v21 = v21 + v27;
      double v23 = v23 - (v26 + v28);
      double v25 = v25 - (v27 + v29);
    }
    CGRect v30 = [v6 superview];
    CGRect v31 = [(CKMacToolbarController *)self view];

    if (v30 != v31)
    {
      CGRect v32 = [(CKMacToolbarController *)self view];
      [v32 addSubview:v6];
    }
    v36.origin.double x = v10;
    v36.origin.double y = v12;
    v36.size.double width = v14;
    v36.size.height = v16;
    v37.origin.double x = v19;
    v37.origin.double y = v21;
    v37.size.double width = v23;
    v37.size.height = v25;
    if (!CGRectEqualToRect(v36, v37))
    {
      objc_msgSend(v6, "setFrame:", v19, v21, v23, v25);
      [v6 setNeedsLayout];
      [v6 layoutIfNeeded];
    }
    CGRect v33 = [(CKMacToolbarController *)self view];
    [v33 bringSubviewToFront:v6];
  }
}

- (int64_t)_providerTypeForItemIdentifier:(id)a3
{
  return 0;
}

- (id)_providerForType:(int64_t)a3
{
  if (a3 == 2)
  {
    double v3 = [(CKMacToolbarController *)self secondaryItemProvider];
  }
  else if (a3 == 1)
  {
    double v3 = [(CKMacToolbarController *)self primaryItemProvider];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)_cachedVirtualViewForProviderType:(int64_t)a3
{
  if (a3 == 2)
  {
    double v3 = [(CKMacToolbarController *)self secondaryProvidedVirtualView];
  }
  else if (a3 == 1)
  {
    double v3 = [(CKMacToolbarController *)self primaryProvidedVirtualView];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)_virtualBackgroundViewForProviderType:(int64_t)a3
{
  if (a3 == 2)
  {
    double v3 = [(CKMacToolbarController *)self secondaryVirtualBackgroundView];
  }
  else if (a3 == 1)
  {
    double v3 = [(CKMacToolbarController *)self primaryVirtualBackgroundView];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (void)_setVirtualView:(id)a3 forProviderType:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v7 = v6;
    [(CKMacToolbarController *)self setSecondaryProvidedVirtualView:v6];
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    id v7 = v6;
    [(CKMacToolbarController *)self setPrimaryProvidedVirtualView:v6];
  }
  id v6 = v7;
LABEL_6:
}

- (BOOL)_shouldDisAllowTouchesToPassForProviderType:(int64_t)a3
{
  double v3 = [(CKMacToolbarController *)self _providerForType:a3];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 itemProviderDisablesTouches];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (int64_t)_providerTypeForPointInsideVirtualView:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(CKMacToolbarController *)self primaryProvidedVirtualView];
  double v9 = [(CKMacToolbarController *)self view];
  CGFloat v10 = [(CKMacToolbarController *)self primaryProvidedVirtualView];
  objc_msgSend(v9, "convertPoint:toView:", v10, x, y);
  char v11 = objc_msgSend(v8, "pointInside:withEvent:", v7);

  if (v11)
  {
    int64_t v12 = 1;
  }
  else
  {
    double v13 = [(CKMacToolbarController *)self secondaryProvidedVirtualView];
    CGFloat v14 = [(CKMacToolbarController *)self view];
    double v15 = [(CKMacToolbarController *)self secondaryProvidedVirtualView];
    objc_msgSend(v14, "convertPoint:toView:", v15, x, y);
    int v16 = objc_msgSend(v13, "pointInside:withEvent:", v7);

    if (v16) {
      int64_t v12 = 2;
    }
    else {
      int64_t v12 = 0;
    }
  }

  return v12;
}

- (BOOL)macToolbarView:(id)a3 shouldAllowTouchesForPoint:(CGPoint)a4 andEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(CKMacToolbarController *)self view];

  if (v11 == v10) {
    BOOL v12 = !-[CKMacToolbarController _shouldDisAllowTouchesToPassForProviderType:](self, "_shouldDisAllowTouchesToPassForProviderType:", -[CKMacToolbarController _providerTypeForPointInsideVirtualView:withEvent:](self, "_providerTypeForPointInsideVirtualView:withEvent:", v9, x, y));
  }
  else {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (CKMacToolbarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMacToolbarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sceneSessionIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneSessionIdentifier);

  return (NSString *)WeakRetained;
}

- (CKMacToolbarItemProvider)primaryItemProvider
{
  return self->_primaryItemProvider;
}

- (CKMacToolbarItemProvider)secondaryItemProvider
{
  return self->_secondaryItemProvider;
}

- (double)splitViewDividerXPosition
{
  return self->_splitViewDividerXPosition;
}

- (BOOL)shouldDrawPrimaryBlur
{
  return self->_shouldDrawPrimaryBlur;
}

- (BOOL)shouldDrawSecondaryBlur
{
  return self->_shouldDrawSecondaryBlur;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  return (UIWindowScene *)WeakRetained;
}

- (BOOL)isInStandaloneWindow
{
  return self->_isInStandaloneWindow;
}

- (void)setIsInStandaloneWindow:(BOOL)a3
{
  self->_isInStandaloneWindow = a3;
}

- (NSMutableDictionary)toolbarItemCache
{
  return self->_toolbarItemCache;
}

- (void)setToolbarItemCache:(id)a3
{
}

- (UIVisualEffectView)primaryVirtualBackgroundView
{
  return self->_primaryVirtualBackgroundView;
}

- (UIVisualEffectView)secondaryVirtualBackgroundView
{
  return self->_secondaryVirtualBackgroundView;
}

- (double)preferredPrimaryHeight
{
  return self->_preferredPrimaryHeight;
}

- (void)setPreferredPrimaryHeight:(double)a3
{
  self->_preferredPrimaryHeight = a3;
}

- (double)preferredSecondaryHeight
{
  return self->_preferredSecondaryHeight;
}

- (void)setPreferredSecondaryHeight:(double)a3
{
  self->_preferredSecondaryHeight = a3;
}

- (UIView)primaryProvidedVirtualView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryProvidedVirtualView);

  return (UIView *)WeakRetained;
}

- (void)setPrimaryProvidedVirtualView:(id)a3
{
}

- (UIView)secondaryProvidedVirtualView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondaryProvidedVirtualView);

  return (UIView *)WeakRetained;
}

- (void)setSecondaryProvidedVirtualView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_secondaryProvidedVirtualView);
  objc_destroyWeak((id *)&self->_primaryProvidedVirtualView);
  objc_storeStrong((id *)&self->_secondaryVirtualBackgroundView, 0);
  objc_storeStrong((id *)&self->_primaryVirtualBackgroundView, 0);
  objc_storeStrong((id *)&self->_toolbarItemCache, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_secondaryItemProvider, 0);
  objc_storeStrong((id *)&self->_primaryItemProvider, 0);
  objc_destroyWeak((id *)&self->_sceneSessionIdentifier);

  objc_destroyWeak((id *)&self->_delegate);
}

@end