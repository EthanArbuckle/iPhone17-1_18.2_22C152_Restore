@interface PKPaletteView
+ (id)_makeScaleFactorPolicy;
+ (id)makeBackgroundView;
- (BOOL)_isCompactInSmallestQuickNoteWindowScene;
- (BOOL)_isPaletteContentViewHidden;
- (BOOL)_loadOptions;
- (BOOL)_shouldTrackHoverLocationForPencilTapActions;
- (BOOL)draggingEnabled;
- (BOOL)hasContextMenuVisible;
- (BOOL)ignoresSafeAreaInsetsInCompactSize;
- (BOOL)isAutoHideEnabled;
- (BOOL)isPalettePresentingPopover;
- (BOOL)isToolPreviewInstalled;
- (BOOL)isToolPreviewMinimized;
- (BOOL)isVisible;
- (BOOL)shadowVisible;
- (BOOL)shouldAdjustShadowRadiusForMinimized;
- (BOOL)shouldExpandFromCorner;
- (BOOL)shouldPalettePresentPopover;
- (BOOL)shouldStartUpMinimized;
- (BOOL)toolPreviewMatchesExpandedTool;
- (BOOL)useCompactSize;
- (BOOL)wantsCustomPalettePopoverPresentationSource;
- (BOOL)wantsToolPreviewForTraitCollection:(id)a3;
- (CGPoint)_paletteViewHoverLocation;
- (CGRect)_palettePopoverSourceRect;
- (CGRect)adjustedWindowSceneBounds;
- (CGRect)palettePopoverSourceRectToPresentViewController:(id)a3;
- (CGSize)minimizedPaletteSize;
- (CGSize)paletteSizeForEdge:(unint64_t)a3;
- (NSDirectionalEdgeInsets)edgeInsetsInCompactSize;
- (NSLayoutConstraint)paletteContainerCenterXConstraint;
- (NSLayoutConstraint)paletteContainerCenterYConstraint;
- (NSLayoutConstraint)paletteContainerCompactBottomConstraint;
- (NSLayoutConstraint)paletteContainerCompactLeftConstraint;
- (NSLayoutConstraint)paletteContainerCompactRightConstraint;
- (NSLayoutConstraint)paletteContainerCompactTopConstraint;
- (NSLayoutConstraint)paletteContainerHeightConstraint;
- (NSLayoutConstraint)paletteContainerWidthConstraint;
- (NSLayoutConstraint)toolPreviewCenterXConstraint;
- (NSLayoutConstraint)toolPreviewCenterYConstraint;
- (NSLayoutConstraint)toolPreviewHeightConstraint;
- (NSLayoutConstraint)toolPreviewWidthConstraint;
- (PKPaletteContainerView)containerView;
- (PKPaletteScaleFactorPolicy)paletteScaleFactorPolicy;
- (PKPaletteToolPreview)toolPreview;
- (PKPaletteView)initWithFrame:(CGRect)a3;
- (PKPaletteViewDelegate)delegate;
- (PKPaletteViewHosting)paletteViewHosting;
- (PKPaletteViewHoverDelegate)hoverDelegate;
- (PKPaletteViewInternalDelegate)internalDelegate;
- (UIEdgeInsets)palettePopoverLayoutSceneMargins;
- (UIScrollView)contentScrollView;
- (UIView)backgroundMaterialView;
- (UIView)clippingView;
- (UIViewController)palettePopoverPresentingController;
- (UIViewController)presentationController;
- (double)borderWidthForTraitCollection:(id)a3;
- (double)compactPaletteHeight;
- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5;
- (double)paletteContentAlpha;
- (double)paletteScaleFactor;
- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5;
- (double)shadowOpacity;
- (double)shadowRadius;
- (id)_paletteViewHoverView;
- (id)_stateDictionary;
- (id)borderColorForTraitCollection:(id)a3;
- (id)palettePopoverPassthroughViews;
- (id)palettePopoverSourceView;
- (int64_t)palettePosition;
- (unint64_t)_nextAutoHideCorner;
- (unint64_t)autoHideCorner;
- (unint64_t)edgeLocationToDockFromCorner:(unint64_t)a3;
- (unint64_t)lastEdgeLocation;
- (unint64_t)lastPaletteEdgePositionWhileDragging;
- (unint64_t)palettePopoverPermittedArrowDirections;
- (unint64_t)paletteViewType;
- (void)_didChangeAutoHideEnabled;
- (void)_installBackgroundViewInView:(id)a3;
- (void)_installClippingViewInView:(id)a3;
- (void)_installContainerViewInView:(id)a3;
- (void)_installToolPreviewInView:(id)a3;
- (void)_saveOptions;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setPaletteScaleFactor:(double)a3 notifyDidChange:(BOOL)a4;
- (void)_setShouldTrackHoverLocationForPencilTapActions:(BOOL)a3;
- (void)_uninstallToolPreview;
- (void)_updateContainerSizeConstraints;
- (void)_updateContainerSizeConstraintsForEdge:(unint64_t)a3;
- (void)_updateContainerViewConstraints;
- (void)_updateToolPreviewScalingAnimated:(BOOL)a3;
- (void)_updateToolPreviewVisibility;
- (void)_willDockPaletteToEdge:(unint64_t)a3 prepareForExpansion:(BOOL)a4 isPaletteChangingOrientation:(BOOL)a5;
- (void)didChangePalettePositionFromPosition:(int64_t)a3 toPosition:(int64_t)a4;
- (void)didChangePaletteScaleFactor;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)hostView:(id)a3 didDockPaletteToPosition:(int64_t)a4;
- (void)hostView:(id)a3 willDockPaletteToPosition:(int64_t)a4 prepareForExpansion:(BOOL)a5;
- (void)layoutSubviews;
- (void)paletteHostingWindowSceneDidChangeBounds:(id)a3;
- (void)saveOptionsIfNecessary;
- (void)setAdjustedWindowSceneBounds:(CGRect)a3;
- (void)setAutoHideCorner:(unint64_t)a3;
- (void)setAutoHideEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDraggingEnabled:(BOOL)a3;
- (void)setEdgeInsetsInCompactSize:(NSDirectionalEdgeInsets)a3;
- (void)setHoverDelegate:(id)a3;
- (void)setIgnoresSafeAreaInsetsInCompactSize:(BOOL)a3;
- (void)setInternalDelegate:(id)a3;
- (void)setLastEdgeLocation:(unint64_t)a3;
- (void)setPaletteContainerCenterXConstraint:(id)a3;
- (void)setPaletteContainerCenterYConstraint:(id)a3;
- (void)setPaletteContainerCompactBottomConstraint:(id)a3;
- (void)setPaletteContainerCompactLeftConstraint:(id)a3;
- (void)setPaletteContainerCompactRightConstraint:(id)a3;
- (void)setPaletteContainerCompactTopConstraint:(id)a3;
- (void)setPaletteContainerHeightConstraint:(id)a3;
- (void)setPaletteContainerWidthConstraint:(id)a3;
- (void)setPaletteContentAlpha:(double)a3;
- (void)setPalettePopoverLayoutSceneMargins:(UIEdgeInsets)a3;
- (void)setPalettePopoverPresentingController:(id)a3;
- (void)setPalettePosition:(int64_t)a3;
- (void)setPaletteScaleFactor:(double)a3;
- (void)setPaletteViewHosting:(id)a3;
- (void)setPresentationController:(id)a3;
- (void)setShadowVisible:(BOOL)a3;
- (void)setToolPreviewCenterXConstraint:(id)a3;
- (void)setToolPreviewCenterYConstraint:(id)a3;
- (void)setToolPreviewHeightConstraint:(id)a3;
- (void)setToolPreviewMinimized:(BOOL)a3;
- (void)setToolPreviewMinimized:(BOOL)a3 animated:(BOOL)a4;
- (void)setToolPreviewWidthConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePalettePopover:(id)a3;
- (void)willStartAppearanceAnimation:(BOOL)a3;
@end

@implementation PKPaletteView

+ (id)makeBackgroundView
{
  v2 = objc_alloc_init(PKPaletteBackgroundViewFactory);
  v3 = -[PKPaletteBackgroundViewFactory makeBackgroundViewWithName:backgroundColor:]((uint64_t)v2, @"com.apple.pencilkit.pktoolpickerbackground", 0);

  return v3;
}

+ (id)_makeScaleFactorPolicy
{
  v2 = objc_alloc_init(PKPaletteScaleFactorPolicy);

  return v2;
}

- (PKPaletteView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PKPaletteView;
  v3 = -[PKPaletteView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [v3 setBackgroundColor:v4];

    v5 = [v3 layer];
    [v5 setInheritsTiming:0];

    v6 = [v3 traitCollection];
    uint64_t v7 = [v6 layoutDirection];
    uint64_t v8 = 4;
    if (v7 == 1) {
      uint64_t v8 = 8;
    }
    *((void *)v3 + 68) = v8;

    v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 bounds];
    *((void *)v3 + 89) = v10;
    *((void *)v3 + 90) = v11;
    *((void *)v3 + 91) = v12;
    *((void *)v3 + 92) = v13;

    uint64_t v14 = +[PKPaletteView _makeScaleFactorPolicy];
    v15 = (void *)*((void *)v3 + 60);
    *((void *)v3 + 60) = v14;

    objc_msgSend(*((id *)v3 + 60), "scaleFactorForWindowBounds:", *((double *)v3 + 89), *((double *)v3 + 90), *((double *)v3 + 91), *((double *)v3 + 92));
    *((void *)v3 + 56) = v16;
    *((void *)v3 + 55) = 0;
    v3[410] = 1;
    *((void *)v3 + 61) = 0;
    *((void *)v3 + 62) = 0;
    v3[412] = 0;
    *((void *)v3 + 59) = 0;
    v3[413] = 0;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4FB12A8] + 16);
    *(_OWORD *)(v3 + 744) = *MEMORY[0x1E4FB12A8];
    *(_OWORD *)(v3 + 760) = v17;
    v3[414] = !PKIsVisionDevice();
    [v3 _installClippingViewInView:v3];
    [v3 _installBackgroundViewInView:*((void *)v3 + 69)];
    [v3 _installContainerViewInView:*((void *)v3 + 69)];
    v18 = [v3 layer];
    [v18 setShadowPathIsBounds:1];

    [v3 _loadOptions];
    _PKPaletteViewUpdateUI(v3, 0);
  }
  return (PKPaletteView *)v3;
}

- (void)setIgnoresSafeAreaInsetsInCompactSize:(BOOL)a3
{
  if (self->_ignoresSafeAreaInsetsInCompactSize != a3)
  {
    self->_ignoresSafeAreaInsetsInCompactSize = a3;
    id v4 = [(PKPaletteView *)self internalDelegate];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setEdgeInsetsInCompactSize:(NSDirectionalEdgeInsets)a3
{
  if (self->_edgeInsetsInCompactSize.leading != a3.leading
    || self->_edgeInsetsInCompactSize.top != a3.top
    || self->_edgeInsetsInCompactSize.trailing != a3.trailing
    || self->_edgeInsetsInCompactSize.bottom != a3.bottom)
  {
    self->_edgeInsetsInCompactSize = a3;
    id v7 = [(PKPaletteView *)self internalDelegate];
    [v7 paletteViewStateDidChange:self];
  }
}

- (BOOL)hasContextMenuVisible
{
  return 0;
}

- (void)_installClippingViewInView:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v5 = a3;
  v6 = (UIView *)objc_alloc_init(v4);
  clippingView = self->_clippingView;
  self->_clippingView = v6;

  [(UIView *)self->_clippingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:self->_clippingView];
  v18 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(UIView *)self->_clippingView topAnchor];
  objc_super v20 = [v5 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v22[0] = v19;
  uint64_t v8 = [(UIView *)self->_clippingView bottomAnchor];
  v9 = [v5 bottomAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  v22[1] = v10;
  uint64_t v11 = [(UIView *)self->_clippingView leftAnchor];
  uint64_t v12 = [v5 leftAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  v22[2] = v13;
  uint64_t v14 = [(UIView *)self->_clippingView rightAnchor];
  v15 = [v5 rightAnchor];

  uint64_t v16 = [v14 constraintEqualToAnchor:v15];
  v22[3] = v16;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  [v18 activateConstraints:v17];
}

- (void)_installBackgroundViewInView:(id)a3
{
  id v6 = a3;
  id v4 = [(id)objc_opt_class() makeBackgroundView];
  if (v4) {
    [v6 addSubview:v4];
  }
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v4;
}

- (void)_installContainerViewInView:(id)a3
{
  v49[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(PKPaletteContainerView);
  containerView = self->_containerView;
  self->_containerView = v5;

  id v7 = [(PKPaletteView *)self containerView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v8 = [(PKPaletteView *)self containerView];
  [v4 addSubview:v8];

  [(PKPaletteView *)self paletteSizeForEdge:4];
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(PKPaletteView *)self containerView];
  uint64_t v14 = [v13 widthAnchor];
  v15 = [v14 constraintEqualToConstant:v10];
  [(PKPaletteView *)self setPaletteContainerWidthConstraint:v15];

  uint64_t v16 = [(PKPaletteView *)self containerView];
  long long v17 = [v16 heightAnchor];
  v18 = [v17 constraintEqualToConstant:v12];
  [(PKPaletteView *)self setPaletteContainerHeightConstraint:v18];

  v19 = [(PKPaletteView *)self containerView];
  objc_super v20 = [v19 centerXAnchor];
  v21 = [v4 centerXAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  [(PKPaletteView *)self setPaletteContainerCenterXConstraint:v22];

  v23 = [(PKPaletteView *)self containerView];
  v24 = [v23 centerYAnchor];
  v25 = [v4 centerYAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [(PKPaletteView *)self setPaletteContainerCenterYConstraint:v26];

  v27 = [(PKPaletteView *)self containerView];
  v28 = [v27 topAnchor];
  v29 = [v4 topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [(PKPaletteView *)self setPaletteContainerCompactTopConstraint:v30];

  v31 = [(PKPaletteView *)self containerView];
  v32 = [v31 bottomAnchor];
  v33 = [v4 bottomAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [(PKPaletteView *)self setPaletteContainerCompactBottomConstraint:v34];

  v35 = [(PKPaletteView *)self containerView];
  v36 = [v35 leftAnchor];
  v37 = [v4 leftAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [(PKPaletteView *)self setPaletteContainerCompactLeftConstraint:v38];

  v39 = [(PKPaletteView *)self containerView];
  v40 = [v39 rightAnchor];
  v41 = [v4 rightAnchor];

  v42 = [v40 constraintEqualToAnchor:v41];
  [(PKPaletteView *)self setPaletteContainerCompactRightConstraint:v42];

  v43 = (void *)MEMORY[0x1E4F28DC8];
  v44 = [(PKPaletteView *)self paletteContainerCenterXConstraint];
  v49[0] = v44;
  v45 = [(PKPaletteView *)self paletteContainerCenterYConstraint];
  v49[1] = v45;
  v46 = [(PKPaletteView *)self paletteContainerWidthConstraint];
  v49[2] = v46;
  v47 = [(PKPaletteView *)self paletteContainerHeightConstraint];
  v49[3] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v43 activateConstraints:v48];
}

- (void)_installToolPreviewInView:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(PKPaletteToolPreview);
  toolPreview = self->_toolPreview;
  self->_toolPreview = v5;

  id v7 = [(PKPaletteView *)self toolPreview];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v8 = [(PKPaletteView *)self toolPreview];
  [v4 addSubview:v8];

  double v9 = [(PKPaletteView *)self toolPreview];
  double v10 = [v9 widthAnchor];
  double v11 = [v4 heightAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  [(PKPaletteView *)self setToolPreviewWidthConstraint:v12];

  uint64_t v13 = [(PKPaletteView *)self toolPreview];
  uint64_t v14 = [v13 heightAnchor];
  v15 = [v4 heightAnchor];

  uint64_t v16 = [v14 constraintEqualToAnchor:v15];
  [(PKPaletteView *)self setToolPreviewHeightConstraint:v16];

  long long v17 = (void *)MEMORY[0x1E4F28DC8];
  v18 = [(PKPaletteView *)self toolPreviewWidthConstraint];
  v36[0] = v18;
  v19 = [(PKPaletteView *)self toolPreviewHeightConstraint];
  v36[1] = v19;
  objc_super v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [v17 activateConstraints:v20];

  v21 = [(PKPaletteView *)self toolPreview];
  v22 = [v21 centerXAnchor];
  v23 = [(PKPaletteView *)self containerView];
  v24 = [v23 centerXAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [(PKPaletteView *)self setToolPreviewCenterXConstraint:v25];

  v26 = [(PKPaletteView *)self toolPreview];
  v27 = [v26 centerYAnchor];
  v28 = [(PKPaletteView *)self containerView];
  v29 = [v28 centerYAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [(PKPaletteView *)self setToolPreviewCenterYConstraint:v30];

  v31 = (void *)MEMORY[0x1E4F28DC8];
  v32 = [(PKPaletteView *)self toolPreviewCenterXConstraint];
  v35[0] = v32;
  v33 = [(PKPaletteView *)self toolPreviewCenterYConstraint];
  v35[1] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  [v31 activateConstraints:v34];

  [(PKPaletteView *)self _updateToolPreviewScalingAnimated:0];
}

- (void)_uninstallToolPreview
{
  v3 = [(PKPaletteView *)self toolPreview];
  [v3 removeFromSuperview];

  toolPreview = self->_toolPreview;
  self->_toolPreview = 0;
}

- (BOOL)isToolPreviewInstalled
{
  v2 = [(PKPaletteView *)self toolPreview];
  v3 = [v2 superview];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)wantsToolPreviewForTraitCollection:(id)a3
{
  return [a3 userInterfaceIdiom] != 0;
}

- (BOOL)useCompactSize
{
  v3 = [(PKPaletteView *)self traitCollection];
  BOOL v4 = [(PKPaletteView *)self window];
  id v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (void)setAutoHideEnabled:(BOOL)a3
{
  if (self->_autoHideEnabled != a3)
  {
    self->_autoHideEnabled = a3;
    [(PKPaletteView *)self _didChangeAutoHideEnabled];
  }
}

- (void)_didChangeAutoHideEnabled
{
  v3 = [(PKPaletteView *)self internalDelegate];
  [v3 paletteViewStateDidChangeAutoHide:self];

  +[PKStatisticsManager sharedStatisticsManager]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordAutoMinimizeEnabledDidChange:type:]((uint64_t)v4, [(PKPaletteView *)self isAutoHideEnabled], [(PKPaletteView *)self paletteViewType]);
}

- (BOOL)isVisible
{
  v2 = [(PKPaletteView *)self paletteViewHosting];
  char v3 = [v2 isPaletteVisible];

  return v3;
}

- (double)paletteContentAlpha
{
  v2 = [(PKPaletteView *)self containerView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setPaletteContentAlpha:(double)a3
{
  id v5 = [(PKPaletteView *)self containerView];
  [v5 setAlpha:a3];

  [(PKPaletteView *)self _updateToolPreviewVisibility];
}

- (id)borderColorForTraitCollection:(id)a3
{
  return 0;
}

- (double)borderWidthForTraitCollection:(id)a3
{
  return 0.0;
}

- (void)_updateToolPreviewVisibility
{
  double v3 = [(PKPaletteView *)self containerView];
  [v3 alpha];
  double v5 = v4;

  if ([(PKPaletteView *)self _isPaletteContentViewHidden])
  {
    double v6 = v5 * -1.6 + 1.0;
  }
  else
  {
    BOOL v7 = [(PKPaletteView *)self toolPreviewMatchesExpandedTool];
    double v6 = v5 * -2.0 + 1.0;
    if (v7) {
      double v6 = v5 * -5.0 + 4.5;
    }
  }
  double v8 = fmin(v6, 1.0);
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = [(PKPaletteView *)self toolPreview];
  [v10 setAlpha:v9];

  id v11 = [(PKPaletteView *)self toolPreview];
  [v11 setHidden:v5 >= 1.0];
}

- (BOOL)_isPaletteContentViewHidden
{
  return 0;
}

- (void)_setCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteView;
  -[PKPaletteView _setCornerRadius:](&v6, sel__setCornerRadius_);
  double v5 = [(PKPaletteView *)self clippingView];
  [v5 _setCornerRadius:a3];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteView;
  -[PKPaletteView _setContinuousCornerRadius:](&v6, sel__setContinuousCornerRadius_);
  double v5 = [(PKPaletteView *)self clippingView];
  [v5 _setContinuousCornerRadius:a3];
}

- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  return 0.0;
}

- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  return 0.0;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKPaletteView;
  [(PKPaletteView *)&v24 layoutSubviews];
  double v3 = [(PKPaletteView *)self clippingView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v25.origin.double x = v5;
  v25.origin.double y = v7;
  v25.size.double width = v9;
  v25.size.double height = v11;
  CGRect v26 = CGRectInset(v25, -6.0, -6.0);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  uint64_t v16 = [(PKPaletteView *)self backgroundMaterialView];
  objc_msgSend(v16, "setFrame:", x, y, width, height);

  if ([(PKPaletteView *)self useCompactSize])
  {
    double v17 = 0.0;
    v18 = self;
LABEL_6:
    [(PKPaletteView *)v18 _setCornerRadius:v17];
    return;
  }
  [(PKPaletteView *)self bounds];
  double MidX = CGRectGetMidX(v27);
  [(PKPaletteView *)self bounds];
  double MidY = CGRectGetMidY(v28);
  if (MidX >= MidY) {
    double MidX = MidY;
  }
  [(PKPaletteView *)self bounds];
  double v22 = v21;
  [(PKPaletteView *)self bounds];
  v18 = self;
  double v17 = MidX;
  if (v22 == v23) {
    goto LABEL_6;
  }
  [(PKPaletteView *)self _setContinuousCornerRadius:MidX];
}

- (void)_updateContainerSizeConstraints
{
  unint64_t v3 = [(PKPaletteView *)self palettePosition] - 1;
  if (v3 <= 3)
  {
    uint64_t v4 = qword_1C4829408[v3];
    [(PKPaletteView *)self _updateContainerSizeConstraintsForEdge:v4];
  }
}

- (void)_updateContainerSizeConstraintsForEdge:(unint64_t)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  -[PKPaletteView paletteSizeForEdge:](self, "paletteSizeForEdge:");
  double v6 = v5;
  double v8 = v7;
  CGFloat v9 = [(PKPaletteView *)self paletteContainerWidthConstraint];
  [v9 setConstant:v6];

  double v10 = [(PKPaletteView *)self paletteContainerHeightConstraint];
  [v10 setConstant:v8];

  if ([(PKPaletteView *)self isToolPreviewInstalled])
  {
    CGFloat v11 = (void *)MEMORY[0x1E4F28DC8];
    double v12 = [(PKPaletteView *)self toolPreviewWidthConstraint];
    v33[0] = v12;
    uint64_t v13 = [(PKPaletteView *)self toolPreviewHeightConstraint];
    v33[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    [v11 deactivateConstraints:v14];

    switch(a3)
    {
      case 1uLL:
      case 4uLL:
        v15 = [(PKPaletteView *)self toolPreview];
        uint64_t v16 = [v15 widthAnchor];
        double v17 = [(PKPaletteView *)self heightAnchor];
        v18 = [v16 constraintEqualToAnchor:v17];
        [(PKPaletteView *)self setToolPreviewWidthConstraint:v18];

        v19 = [(PKPaletteView *)self toolPreview];
        objc_super v20 = [v19 heightAnchor];
        uint64_t v21 = [(PKPaletteView *)self heightAnchor];
        goto LABEL_5;
      case 2uLL:
      case 8uLL:
        double v22 = [(PKPaletteView *)self toolPreview];
        double v23 = [v22 widthAnchor];
        objc_super v24 = [(PKPaletteView *)self widthAnchor];
        CGRect v25 = [v23 constraintEqualToAnchor:v24];
        [(PKPaletteView *)self setToolPreviewWidthConstraint:v25];

        v19 = [(PKPaletteView *)self toolPreview];
        objc_super v20 = [v19 heightAnchor];
        uint64_t v21 = [(PKPaletteView *)self widthAnchor];
LABEL_5:
        CGRect v26 = (void *)v21;
        CGRect v27 = [v20 constraintEqualToAnchor:v21];
        [(PKPaletteView *)self setToolPreviewHeightConstraint:v27];

        break;
      default:
        break;
    }
    CGRect v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(PKPaletteView *)self toolPreviewWidthConstraint];
    v32[0] = v29;
    v30 = [(PKPaletteView *)self toolPreviewHeightConstraint];
    v32[1] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v28 activateConstraints:v31];
  }
}

- (void)hostView:(id)a3 willDockPaletteToPosition:(int64_t)a4 prepareForExpansion:(BOOL)a5
{
  BOOL v5 = a5;
  [(PKPaletteView *)self _updateContainerViewConstraints];
  int v8 = 0;
  uint64_t v9 = 1;
  int64_t v10 = a4;
  switch(a4)
  {
    case 1:
      goto LABEL_5;
    case 2:
      int v8 = 1;
      int64_t v10 = 8;
      goto LABEL_5;
    case 3:
      int v8 = 0;
      int64_t v10 = 4;
      goto LABEL_5;
    case 4:
      int v8 = 1;
      int64_t v10 = 2;
LABEL_5:
      unint64_t v11 = [(PKPaletteView *)self lastPaletteEdgePositionWhileDragging];
      BOOL v13 = v11 == 2 || v11 == 8;
      [(PKPaletteView *)self _willDockPaletteToEdge:v10 prepareForExpansion:v5 isPaletteChangingOrientation:v8 ^ v13];
      break;
    case 5:
      goto LABEL_15;
    case 6:
      uint64_t v9 = 2;
      goto LABEL_15;
    case 7:
      uint64_t v9 = 8;
      goto LABEL_15;
    case 8:
      uint64_t v9 = 4;
LABEL_15:
      [(PKPaletteView *)self _willDockPaletteToCorner:v9];
      break;
    default:
      break;
  }

  [(PKPaletteView *)self setPalettePosition:a4];
}

- (void)_willDockPaletteToEdge:(unint64_t)a3 prepareForExpansion:(BOOL)a4 isPaletteChangingOrientation:(BOOL)a5
{
  BOOL v5 = a4;
  self->_lastPaletteEdgePositionWhileDragging = a3;
  int v8 = [(PKPaletteView *)self toolPreview];
  [v8 dismissPalettePopoverWithCompletion:0];

  uint64_t v9 = [(PKPaletteView *)self containerView];
  [v9 setEdgeLocation:a3];

  int64_t v10 = [(PKPaletteView *)self traitCollection];
  unint64_t v11 = [(PKPaletteView *)self window];
  double v12 = [v11 windowScene];
  BOOL v13 = PKUseCompactSize(v10, v12);

  if (!v13) {
    [(PKPaletteView *)self _updateContainerSizeConstraintsForEdge:a3];
  }
  if (v5)
  {
    id v14 = +[PKTextInputLanguageSelectionController sharedInstance];
    [v14 notifyLanguageDidChange];
  }
}

- (void)hostView:(id)a3 didDockPaletteToPosition:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) <= 3) {
    self->_lastPaletteEdgePositionWhileDragging = qword_1C4829408[a4 - 1];
  }
}

- (void)_updateContainerViewConstraints
{
  v25[8] = *MEMORY[0x1E4F143B8];
  double v22 = (void *)MEMORY[0x1E4F28DC8];
  unint64_t v3 = [(PKPaletteView *)self paletteContainerWidthConstraint];
  v25[0] = v3;
  uint64_t v4 = [(PKPaletteView *)self paletteContainerHeightConstraint];
  v25[1] = v4;
  BOOL v5 = [(PKPaletteView *)self paletteContainerCenterXConstraint];
  v25[2] = v5;
  double v6 = [(PKPaletteView *)self paletteContainerCenterYConstraint];
  v25[3] = v6;
  double v7 = [(PKPaletteView *)self paletteContainerCompactTopConstraint];
  v25[4] = v7;
  int v8 = [(PKPaletteView *)self paletteContainerCompactBottomConstraint];
  v25[5] = v8;
  uint64_t v9 = [(PKPaletteView *)self paletteContainerCompactLeftConstraint];
  v25[6] = v9;
  int64_t v10 = [(PKPaletteView *)self paletteContainerCompactRightConstraint];
  v25[7] = v10;
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:8];
  [v22 deactivateConstraints:v11];

  double v12 = [(PKPaletteView *)self traitCollection];
  BOOL v13 = [(PKPaletteView *)self window];
  id v14 = [v13 windowScene];
  LODWORD(v6) = PKUseCompactSize(v12, v14);

  v15 = (void *)MEMORY[0x1E4F28DC8];
  if (v6)
  {
    uint64_t v16 = [(PKPaletteView *)self paletteContainerCompactTopConstraint];
    v24[0] = v16;
    double v17 = [(PKPaletteView *)self paletteContainerCompactBottomConstraint];
    v24[1] = v17;
    v18 = [(PKPaletteView *)self paletteContainerCompactLeftConstraint];
    v24[2] = v18;
    v19 = [(PKPaletteView *)self paletteContainerCompactRightConstraint];
    v24[3] = v19;
    objc_super v20 = v24;
  }
  else
  {
    uint64_t v16 = [(PKPaletteView *)self paletteContainerWidthConstraint];
    v23[0] = v16;
    double v17 = [(PKPaletteView *)self paletteContainerHeightConstraint];
    v23[1] = v17;
    v18 = [(PKPaletteView *)self paletteContainerCenterXConstraint];
    v23[2] = v18;
    v19 = [(PKPaletteView *)self paletteContainerCenterYConstraint];
    v23[3] = v19;
    objc_super v20 = v23;
  }
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  [v15 activateConstraints:v21];
}

- (void)paletteHostingWindowSceneDidChangeBounds:(id)a3
{
  [a3 paletteHostingWindowSceneBounds];

  -[PKPaletteView setAdjustedWindowSceneBounds:](self, "setAdjustedWindowSceneBounds:");
}

- (void)setAdjustedWindowSceneBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_adjustedWindowSceneBounds = &self->_adjustedWindowSceneBounds;
  if (!CGRectEqualToRect(self->_adjustedWindowSceneBounds, a3))
  {
    p_adjustedWindowSceneBounds->origin.CGFloat x = x;
    p_adjustedWindowSceneBounds->origin.CGFloat y = y;
    p_adjustedWindowSceneBounds->size.CGFloat width = width;
    p_adjustedWindowSceneBounds->size.CGFloat height = height;
    _PKPaletteViewUpdateUI(self, 1);
    [(PKPaletteView *)self dismissPalettePopoverWithCompletion:0];
  }
}

- (void)setPaletteScaleFactor:(double)a3
{
}

- (void)_setPaletteScaleFactor:(double)a3 notifyDidChange:(BOOL)a4
{
  double paletteScaleFactor = self->_paletteScaleFactor;
  if (paletteScaleFactor != a3 && vabdd_f64(paletteScaleFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double paletteScaleFactor = a3;
    if (a4) {
      [(PKPaletteView *)self didChangePaletteScaleFactor];
    }
  }
}

- (void)didChangePaletteScaleFactor
{
  [(PKPaletteView *)self _updateContainerSizeConstraints];
  unint64_t v3 = [(PKPaletteView *)self internalDelegate];
  [v3 paletteViewStateDidChangeScaleFactor:self];

  [(PKPaletteView *)self _updateToolPreviewScalingAnimated:0];
  uint64_t v4 = [(PKPaletteView *)self delegate];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    double v6 = [(PKPaletteView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PKPaletteView *)self delegate];
      [v8 paletteViewDidChangeScaleFactor:self];
    }
  }
}

- (unint64_t)paletteViewType
{
  return 0;
}

- (void)setPalettePosition:(int64_t)a3
{
  if (self->_palettePosition != a3)
  {
    unint64_t v5 = [(PKPaletteView *)self palettePosition] - 1;
    if (v5 <= 3) {
      [(PKPaletteView *)self setLastEdgeLocation:qword_1C4829408[v5]];
    }
    int64_t palettePosition = self->_palettePosition;
    self->_int64_t palettePosition = a3;
    [(PKPaletteView *)self didChangePalettePositionFromPosition:palettePosition toPosition:a3];
    unint64_t v7 = [(PKPaletteView *)self _nextAutoHideCorner];
    if (v7 != -1) {
      self->_autoHideCorner = v7;
    }
    [(PKPaletteView *)self setNeedsUpdateConstraints];
  }
}

- (void)didChangePalettePositionFromPosition:(int64_t)a3 toPosition:(int64_t)a4
{
  unint64_t v7 = [(PKPaletteView *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(PKPaletteView *)self delegate];
    [v9 paletteViewDidChangePosition:self fromPosition:a3 toPosition:a4];
  }
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v7 = a3;
  if ([(PKPaletteView *)self isPalettePresentingPopover]
    && ([(PKPaletteView *)self toolPreview],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    unint64_t v5 = [(PKPaletteView *)self toolPreview];
    [v5 dismissPalettePopoverWithCompletion:v7];
  }
  else
  {
    double v6 = v7;
    if (!v7) {
      goto LABEL_7;
    }
    (*((void (**)(id))v7 + 2))(v7);
  }
  double v6 = v7;
LABEL_7:
}

- (unint64_t)_nextAutoHideCorner
{
  int64_t v3 = [(PKPaletteView *)self palettePosition] - 1;
  unint64_t result = 1;
  switch(v3)
  {
    case 0:
      unint64_t v5 = [(PKPaletteView *)self autoHideCorner];
      if (v5 == 8 || v5 == 2) {
        unint64_t result = 2;
      }
      else {
        unint64_t result = 1;
      }
      break;
    case 1:
      if ([(PKPaletteView *)self autoHideCorner] - 1 >= 2) {
        unint64_t result = 8;
      }
      else {
        unint64_t result = 2;
      }
      break;
    case 2:
      unint64_t v7 = [(PKPaletteView *)self autoHideCorner];
      if (v7 == 8 || v7 == 2) {
        unint64_t result = 8;
      }
      else {
        unint64_t result = 4;
      }
      break;
    case 3:
      if ([(PKPaletteView *)self autoHideCorner] - 1 < 2) {
        unint64_t result = 1;
      }
      else {
        unint64_t result = 4;
      }
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 2;
      break;
    case 6:
      unint64_t result = 8;
      break;
    case 7:
      unint64_t result = 4;
      break;
    default:
      unint64_t result = -1;
      break;
  }
  return result;
}

- (BOOL)isPalettePresentingPopover
{
  v2 = [(PKPaletteView *)self palettePopoverPresentingController];
  int64_t v3 = [v2 presentedViewController];

  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  unint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  double v6 = [v4 bundleIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.PaperKit"];

  if (v4 == v5) {
    char v8 = 1;
  }
  else {
    char v8 = v7;
  }
  if (v3 && (v8 & 1) != 0)
  {
    BOOL v9 = 1;
  }
  else
  {
    int64_t v10 = [v3 popoverPresentationController];
    unint64_t v11 = [v10 delegate];

    double v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

    id v14 = [v12 bundleIdentifier];
    char v15 = [v14 isEqualToString:@"com.apple.PaperKit"];

    if (v12 == v13) {
      char v16 = 1;
    }
    else {
      char v16 = v15;
    }
    if (v12) {
      BOOL v9 = v16;
    }
    else {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (BOOL)shouldPalettePresentPopover
{
  v2 = [(PKPaletteView *)self paletteViewHosting];
  char v3 = [v2 isPaletteDragging] ^ 1;

  return v3;
}

- (id)palettePopoverPassthroughViews
{
  v8[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(PKPaletteView *)self paletteViewHosting];
  if (v3)
  {
    uint64_t v4 = [(PKPaletteView *)self paletteViewHosting];
    unint64_t v5 = [v4 hostingView];
    v8[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (unint64_t)palettePopoverPermittedArrowDirections
{
  char v3 = [(PKPaletteView *)self _paletteViewHoverView];
  if ([(PKPaletteView *)self wantsCustomPalettePopoverPresentationSource]
    && v3)
  {
    unint64_t v4 = 0;
  }
  else if (-[PKPaletteView wantsCustomPalettePopoverPresentationSource](self, "wantsCustomPalettePopoverPresentationSource")&& ([MEMORY[0x1E4F28B50] mainBundle], v5 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "bundleIdentifier"), v6 = objc_claimAutoreleasedReturnValue(), int v7 = objc_msgSend(v6, "isEqualToString:", @"com.apple.mobilenotes"), v6, v5, v7))
  {
    if ([(PKPaletteView *)self useCompactSize]) {
      unint64_t v4 = 15;
    }
    else {
      unint64_t v4 = 1;
    }
  }
  else if ([(PKPaletteView *)self useCompactSize])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v8 = [(PKPaletteView *)self palettePosition] - 5;
    int64_t v9 = [(PKPaletteView *)self palettePosition];
    if (v8 > 3)
    {
      if ((unint64_t)(v9 - 1) > 3) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = qword_1C4829408[v9 - 1];
      }
      uint64_t v12 = PKUIPopoverPermittedArrowDirectionsForEdge(v11);
    }
    else
    {
      if ((unint64_t)(v9 - 5) > 3) {
        uint64_t v10 = -1;
      }
      else {
        uint64_t v10 = qword_1C48293E8[v9 - 5];
      }
      uint64_t v12 = PKUIPopoverPermittedArrowDirectionsForCorner(v10);
    }
    unint64_t v4 = v12;
  }

  return v4;
}

- (void)setPalettePopoverLayoutSceneMargins:(UIEdgeInsets)a3
{
  if (self->_palettePopoverLayoutSceneMargins.left != a3.left
    || self->_palettePopoverLayoutSceneMargins.top != a3.top
    || self->_palettePopoverLayoutSceneMargins.right != a3.right
    || self->_palettePopoverLayoutSceneMargins.bottom != a3.bottom)
  {
    self->_palettePopoverLayoutSceneMargins = a3;
    [(PKPaletteView *)self updatePopoverUI];
  }
}

- (BOOL)_isCompactInSmallestQuickNoteWindowScene
{
  char v3 = [(PKPaletteView *)self window];
  unint64_t v4 = [v3 windowScene];
  BOOL v5 = PKIsSmallestQuickNoteWindowScene(v4) && [(PKPaletteView *)self useCompactSize];

  return v5;
}

- (id)_paletteViewHoverView
{
  char v3 = [(PKPaletteView *)self hoverDelegate];

  if (v3)
  {
    unint64_t v4 = [(PKPaletteView *)self hoverDelegate];
    uint64_t v5 = [v4 paletteViewHoverView:self];
    goto LABEL_3;
  }
  if ([(PKPaletteView *)self _shouldTrackHoverLocationForPencilTapActions])
  {
    unint64_t v8 = [(PKPaletteView *)self window];
    int64_t v9 = [v8 windowScene];
    unint64_t v4 = +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v9);

    if (!v4 || (uint64_t v10 = v4[8]) == 0 || !*(unsigned char *)(v10 + 56))
    {
      double v6 = 0;
      goto LABEL_4;
    }
    uint64_t v5 = [v4 view];
LABEL_3:
    double v6 = (void *)v5;
LABEL_4:

    goto LABEL_5;
  }
  double v6 = 0;
LABEL_5:

  return v6;
}

- (CGPoint)_paletteViewHoverLocation
{
  char v3 = [(PKPaletteView *)self hoverDelegate];

  if (v3)
  {
    unint64_t v4 = [(PKPaletteView *)self hoverDelegate];
    [v4 paletteViewHoverLocation:self];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    int64_t v9 = [(PKPaletteView *)self window];
    uint64_t v10 = [v9 windowScene];
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v10);
    unint64_t v4 = (double *)objc_claimAutoreleasedReturnValue();

    if (v4 && (uint64_t v11 = *((void *)v4 + 8)) != 0 && *(unsigned char *)(v11 + 56))
    {
      double v6 = v4[15];
      double v8 = v4[16];
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DAD8];
      double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
  }

  double v12 = v6;
  double v13 = v8;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (BOOL)wantsCustomPalettePopoverPresentationSource
{
  if ([(PKPaletteView *)self _isCompactInSmallestQuickNoteWindowScene])
  {
    char v3 = [(PKPaletteView *)self paletteViewHosting];
    int v4 = [v3 isPaletteVisible] ^ 1;
  }
  else
  {
    double v5 = [(PKPaletteView *)self _paletteViewHoverView];

    if (v5)
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    char v3 = [(PKPaletteView *)self paletteViewHosting];
    if ([v3 isPaletteVisible])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      double v7 = [MEMORY[0x1E4F28B50] mainBundle];
      double v8 = [v7 bundleIdentifier];
      char v9 = [v8 isEqualToString:@"com.apple.mobilenotes"];

      if (v9)
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v11 = [v10 bundleIdentifier];
        LOBYTE(v4) = [v11 isEqualToString:@"com.apple.freeform"];
      }
    }
  }

  return v4;
}

- (CGRect)palettePopoverSourceRectToPresentViewController:(id)a3
{
  id v4 = a3;
  if (v4 && [(PKPaletteView *)self _isCompactInSmallestQuickNoteWindowScene])
  {
    double v5 = [(PKPaletteView *)self paletteViewHosting];
    if ([v5 isPaletteVisible])
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        [(PKPaletteView *)self _palettePopoverSourceRect];
        CGFloat x = v38.origin.x;
        CGFloat y = v38.origin.y;
        CGFloat width = v38.size.width;
        CGFloat height = v38.size.height;
        if (!CGRectIsNull(v38)) {
          goto LABEL_26;
        }
      }
    }
  }
  uint64_t v11 = [(PKPaletteView *)self _paletteViewHoverView];
  if (v11)
  {
    [(PKPaletteView *)self _paletteViewHoverLocation];
    double v13 = v12;
    double v15 = v14;
    char v16 = [(PKPaletteView *)self paletteViewHosting];
    double v17 = [v16 hostingView];

    CGFloat x = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v17, v13, v15, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    CGFloat y = v18;

    CGFloat height = 0.0;
LABEL_9:
    CGFloat width = 0.0;
  }
  else
  {
    [(PKPaletteView *)self _palettePopoverSourceRect];
    CGFloat x = v39.origin.x;
    CGFloat y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
    if (CGRectIsNull(v39))
    {
      int64_t v19 = [(PKPaletteView *)self palettePosition];
      objc_super v20 = [(PKPaletteView *)self paletteViewHosting];
      uint64_t v21 = [v20 hostingView];
      double v22 = [v21 safeAreaLayoutGuide];
      [v22 layoutFrame];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat y = v29;

      CGFloat height = 0.0;
      switch(v19)
      {
        case 0:
        case 5:
        case 9:
          CGFloat x = *MEMORY[0x1E4F1DAD8];
          CGFloat y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          goto LABEL_9;
        case 1:
          v40.origin.CGFloat x = v24;
          v40.origin.CGFloat y = v26;
          v40.size.CGFloat width = v28;
          v40.size.CGFloat height = y;
          double MidX = CGRectGetMidX(v40);
          goto LABEL_19;
        case 2:
          v41.origin.CGFloat x = v24;
          v41.origin.CGFloat y = v26;
          v41.size.CGFloat width = v28;
          v41.size.CGFloat height = y;
          CGFloat x = CGRectGetMaxX(v41);
          v42.origin.CGFloat x = v24;
          v42.origin.CGFloat y = v26;
          v42.size.CGFloat width = v28;
          v42.size.CGFloat height = y;
          double MidY = CGRectGetMidY(v42);
          goto LABEL_22;
        case 3:
          v43.origin.CGFloat x = v24;
          v43.origin.CGFloat y = v26;
          v43.size.CGFloat width = v28;
          v43.size.CGFloat height = y;
          double MaxX = CGRectGetMidX(v43);
          goto LABEL_21;
        case 4:
          v44.origin.CGFloat x = v24;
          v44.origin.CGFloat y = v26;
          v44.size.CGFloat width = v28;
          v44.size.CGFloat height = y;
          double MaxY = CGRectGetMidY(v44);
          goto LABEL_24;
        case 6:
          v45.origin.CGFloat x = v24;
          v45.origin.CGFloat y = v26;
          v45.size.CGFloat width = v28;
          v45.size.CGFloat height = y;
          double MidX = CGRectGetMaxX(v45);
LABEL_19:
          CGFloat x = MidX;
          CGFloat width = 0.0;
          CGFloat y = 0.0;
          break;
        case 7:
          v46.origin.CGFloat x = v24;
          v46.origin.CGFloat y = v26;
          v46.size.CGFloat width = v28;
          v46.size.CGFloat height = y;
          double MaxX = CGRectGetMaxX(v46);
LABEL_21:
          CGFloat x = MaxX;
          v47.origin.CGFloat x = v24;
          v47.origin.CGFloat y = v26;
          v47.size.CGFloat width = v28;
          v47.size.CGFloat height = y;
          double MidY = CGRectGetMaxY(v47);
LABEL_22:
          CGFloat y = MidY;
          goto LABEL_9;
        case 8:
          v48.origin.CGFloat x = v24;
          v48.origin.CGFloat y = v26;
          v48.size.CGFloat width = v28;
          v48.size.CGFloat height = y;
          double MaxY = CGRectGetMaxY(v48);
LABEL_24:
          CGFloat y = MaxY;
          CGFloat width = 0.0;
          CGFloat x = 0.0;
          break;
        default:
          CGFloat width = 0.0;
          break;
      }
    }
  }

LABEL_26:
  double v34 = x;
  double v35 = y;
  double v36 = width;
  double v37 = height;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (CGRect)_palettePopoverSourceRect
{
  char v3 = [(PKPaletteView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  id v4 = [(PKPaletteView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
LABEL_5:
    double v18 = *MEMORY[0x1E4F1DB20];
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_6;
  }
  double v6 = [(PKPaletteView *)self delegate];
  double v7 = [v6 paletteViewColorPickerPopoverPresentationSourceView:self];

  double v8 = [(PKPaletteView *)self delegate];
  [v8 paletteViewColorPickerPopoverPresentationSourceRect:self];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = [(PKPaletteView *)self palettePopoverSourceView];
  double v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v7, v17, v10, v12, v14, v16);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

LABEL_6:
  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)palettePopoverSourceView
{
  v2 = [(PKPaletteView *)self paletteViewHosting];
  char v3 = [v2 hostingView];

  return v3;
}

- (void)updatePalettePopover:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v27 = v4;
    [(PKPaletteView *)self palettePopoverLayoutMargins];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [v27 popoverPresentationController];
    objc_msgSend(v13, "setPopoverLayoutMargins:", v6, v8, v10, v12);

    double v14 = [MEMORY[0x1E4F28B50] mainBundle];
    double v15 = [v14 bundleIdentifier];
    char v16 = [v15 isEqualToString:@"com.apple.ScreenshotServicesService"];

    if ((v16 & 1) != 0 || _UIApplicationIsExtension())
    {
      double v17 = [(PKPaletteView *)self palettePopoverSourceView];
      double v18 = [v17 traitCollection];
      uint64_t v19 = [v18 userInterfaceStyle];

      double v20 = [v27 popoverPresentationController];
      double v21 = [v20 presentedView];
      [v21 setOverrideUserInterfaceStyle:v19];

      [v27 setOverrideUserInterfaceStyle:v19];
    }
    double v22 = [v27 traitCollection];
    uint64_t v23 = [v22 userInterfaceStyle];
    double v24 = [(PKPaletteView *)self traitCollection];
    uint64_t v25 = [v24 userInterfaceStyle];

    id v4 = v27;
    if (v23 != v25)
    {
      double v26 = [(PKPaletteView *)self traitCollection];
      objc_msgSend(v27, "setOverrideUserInterfaceStyle:", objc_msgSend(v26, "userInterfaceStyle"));

      id v4 = v27;
    }
  }
}

- (void)setToolPreviewMinimized:(BOOL)a3
{
}

- (void)setToolPreviewMinimized:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_toolPreviewMinimized != a3)
  {
    self->_toolPreviewMinimized = a3;
    [(PKPaletteView *)self _updateToolPreviewScalingAnimated:a4];
  }
}

- (void)_updateToolPreviewScalingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPaletteView *)self paletteScaleFactor];
  double v6 = v5;
  if ([(PKPaletteView *)self isToolPreviewMinimized]) {
    double v6 = v6 * 0.8;
  }
  id v11 = [(PKPaletteView *)self toolPreview];
  [v11 scalingFactor];
  if (v6 != v7)
  {
    double v8 = fabs(v7 * 0.000000999999997);
    double v9 = vabdd_f64(v6, v7);

    if (v9 < v8) {
      return;
    }
    double v10 = [(PKPaletteView *)self toolPreview];
    id v11 = v10;
    if (v3)
    {
      [v10 layoutIfNeeded];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __51__PKPaletteView__updateToolPreviewScalingAnimated___block_invoke;
      v12[3] = &unk_1E64C61E8;
      v12[4] = self;
      *(double *)&v12[5] = v6;
      [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDampingRatio:0 response:v12 tracking:0 dampingRatioSmoothing:0.845 responseSmoothing:0.531 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
      return;
    }
    [v10 setScalingFactor:v6];
  }
}

void __51__PKPaletteView__updateToolPreviewScalingAnimated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) toolPreview];
  [v3 setScalingFactor:v2];

  id v4 = [*(id *)(a1 + 32) toolPreview];
  [v4 layoutIfNeeded];
}

- (BOOL)toolPreviewMatchesExpandedTool
{
  return 1;
}

- (void)willStartAppearanceAnimation:(BOOL)a3
{
  if (a3)
  {
    id v3 = +[PKTextInputLanguageSelectionController sharedInstance];
    [v3 notifyLanguageDidChange];
  }
}

- (CGSize)minimizedPaletteSize
{
  [(PKPaletteView *)self paletteScaleFactor];
  double v4 = v3 * 80.0;
  [(PKPaletteView *)self paletteScaleFactor];
  double v6 = v5 * 80.0;
  double v7 = v4;
  result.CGFloat height = v6;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)paletteSizeForEdge:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteView;
  [(PKPaletteView *)&v13 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 horizontalSizeClass];
  double v6 = [(PKPaletteView *)self traitCollection];
  if (v5 != [v6 horizontalSizeClass])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v4 verticalSizeClass];
  double v8 = [(PKPaletteView *)self traitCollection];
  uint64_t v9 = [v8 verticalSizeClass];

  if (v7 != v9) {
LABEL_5:
  }
    [(PKPaletteView *)self _updateContainerViewConstraints];
  _PKPaletteViewUpdateUI(self, 1);
  double v10 = [(PKPaletteView *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    double v12 = [(PKPaletteView *)self delegate];
    [v12 paletteView:self didChangeTraitCollection:v4];
  }
}

- (unint64_t)edgeLocationToDockFromCorner:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 > 7) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (void *)qword_1E64C6C50[v4];
  }
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation"));
  uint64_t v7 = [v5 indexOfObject:v6];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    switch(v4)
    {
      case 0uLL:
        unint64_t v8 = [(PKPaletteView *)self lastEdgeLocation];
        if (v8 == 8 || v8 == 2) {
          return 2;
        }
        else {
          return 1;
        }
      case 1uLL:
        unint64_t v11 = [(PKPaletteView *)self lastEdgeLocation];
        if (v11 == 8 || v11 == 2) {
          return 8;
        }
        else {
          return 1;
        }
      case 3uLL:
        unint64_t v13 = [(PKPaletteView *)self lastEdgeLocation];
        BOOL v14 = v13 == 8 || v13 == 2;
        unint64_t v15 = 2;
        goto LABEL_29;
      case 7uLL:
        unint64_t v16 = [(PKPaletteView *)self lastEdgeLocation];
        BOOL v14 = v16 == 8 || v16 == 2;
        unint64_t v15 = 8;
LABEL_29:
        if (v14) {
          unint64_t result = v15;
        }
        else {
          unint64_t result = 4;
        }
        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    return [(PKPaletteView *)self lastEdgeLocation];
  }
  return result;
}

- (BOOL)_loadOptions
{
  double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unint64_t v4 = [v3 dictionaryForKey:@"PKPaletteDefaults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"PKPalettePosition"];
    double v6 = [v4 objectForKeyedSubscript:@"PKPaletteLastEdge"];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"PKPaletteAutoHideEnabled"];
    unint64_t v8 = [v4 objectForKeyedSubscript:@"PKPaletteAutoHideCorner"];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((int)[v5 intValue] < 1 || (int)objc_msgSend(v5, "intValue") >= 9)
        {

          uint64_t v5 = &unk_1F200E3B8;
        }
        if (!v6
          || [v6 unsignedIntegerValue] != 1
          && [v6 unsignedIntegerValue] != 4
          && [v6 unsignedIntegerValue] != 2
          && [v6 unsignedIntegerValue] != 8)
        {

          double v6 = &unk_1F200E3D0;
        }
        self->_int64_t palettePosition = (int)[v5 intValue];
        self->_lastEdgeLocation = [v6 unsignedIntegerValue];
        if (v7) {
          self->_autoHideEnabled = [v7 BOOLValue];
        }
        if (v8) {
          self->_autoHideCorner = [v8 unsignedIntegerValue];
        }
      }
    }
  }
  return 1;
}

- (void)_saveOptions
{
  id v4 = [(PKPaletteView *)self _stateDictionary];
  double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 setObject:v4 forKey:@"PKPaletteDefaults"];
  objc_storeWeak(&PKLastSavedPalette, self);
}

- (void)saveOptionsIfNecessary
{
  WeakRetained = (PKPaletteView *)objc_loadWeakRetained(&PKLastSavedPalette);

  if (WeakRetained != self)
  {
    [(PKPaletteView *)self _saveOptions];
  }
}

- (id)_stateDictionary
{
  double v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKPaletteView palettePosition](self, "palettePosition"));
  [v3 setObject:v4 forKey:@"PKPalettePosition"];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation"));
  [v3 setObject:v5 forKey:@"PKPaletteLastEdge"];

  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPaletteView autoHideCorner](self, "autoHideCorner"));
  [v3 setObject:v6 forKey:@"PKPaletteAutoHideCorner"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPaletteView isAutoHideEnabled](self, "isAutoHideEnabled"));
  [v3 setObject:v7 forKey:@"PKPaletteAutoHideEnabled"];

  return v3;
}

- (UIViewController)palettePopoverPresentingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_palettePopoverPresentingController);

  return (UIViewController *)WeakRetained;
}

- (void)setPalettePopoverPresentingController:(id)a3
{
}

- (PKPaletteViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)palettePosition
{
  return self->_palettePosition;
}

- (double)paletteScaleFactor
{
  return self->_paletteScaleFactor;
}

- (UIViewController)presentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentationController:(id)a3
{
}

- (UIView)backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (UIEdgeInsets)palettePopoverLayoutSceneMargins
{
  double top = self->_palettePopoverLayoutSceneMargins.top;
  double left = self->_palettePopoverLayoutSceneMargins.left;
  double bottom = self->_palettePopoverLayoutSceneMargins.bottom;
  double right = self->_palettePopoverLayoutSceneMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)compactPaletteHeight
{
  return self->_compactPaletteHeight;
}

- (CGRect)adjustedWindowSceneBounds
{
  double x = self->_adjustedWindowSceneBounds.origin.x;
  double y = self->_adjustedWindowSceneBounds.origin.y;
  double width = self->_adjustedWindowSceneBounds.size.width;
  double height = self->_adjustedWindowSceneBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PKPaletteScaleFactorPolicy)paletteScaleFactorPolicy
{
  return self->_paletteScaleFactorPolicy;
}

- (BOOL)isAutoHideEnabled
{
  return self->_autoHideEnabled;
}

- (BOOL)shouldStartUpMinimized
{
  return self->_shouldStartUpMinimized;
}

- (BOOL)shouldExpandFromCorner
{
  return self->_shouldExpandFromCorner;
}

- (BOOL)shadowVisible
{
  return self->_shadowVisible;
}

- (void)setShadowVisible:(BOOL)a3
{
  self->_shadowVisible = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (BOOL)shouldAdjustShadowRadiusForMinimized
{
  return self->_shouldAdjustShadowRadiusForMinimized;
}

- (BOOL)ignoresSafeAreaInsetsInCompactSize
{
  return self->_ignoresSafeAreaInsetsInCompactSize;
}

- (NSDirectionalEdgeInsets)edgeInsetsInCompactSize
{
  double top = self->_edgeInsetsInCompactSize.top;
  double leading = self->_edgeInsetsInCompactSize.leading;
  double bottom = self->_edgeInsetsInCompactSize.bottom;
  double trailing = self->_edgeInsetsInCompactSize.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (BOOL)draggingEnabled
{
  return self->_draggingEnabled;
}

- (void)setDraggingEnabled:(BOOL)a3
{
  self->_draggingEnabled = a3;
}

- (unint64_t)lastEdgeLocation
{
  return self->_lastEdgeLocation;
}

- (void)setLastEdgeLocation:(unint64_t)a3
{
  self->_lastEdgeLocation = a3;
}

- (PKPaletteViewHosting)paletteViewHosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteViewHosting);

  return (PKPaletteViewHosting *)WeakRetained;
}

- (void)setPaletteViewHosting:(id)a3
{
}

- (PKPaletteViewInternalDelegate)internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  return (PKPaletteViewInternalDelegate *)WeakRetained;
}

- (void)setInternalDelegate:(id)a3
{
}

- (PKPaletteViewHoverDelegate)hoverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hoverDelegate);

  return (PKPaletteViewHoverDelegate *)WeakRetained;
}

- (void)setHoverDelegate:(id)a3
{
}

- (BOOL)_shouldTrackHoverLocationForPencilTapActions
{
  return self->__shouldTrackHoverLocationForPencilTapActions;
}

- (void)_setShouldTrackHoverLocationForPencilTapActions:(BOOL)a3
{
  self->__shouldTrackHoverLocationForPencilTapActions = a3;
}

- (unint64_t)autoHideCorner
{
  return self->_autoHideCorner;
}

- (void)setAutoHideCorner:(unint64_t)a3
{
  self->_autoHideCorner = a3;
}

- (BOOL)isToolPreviewMinimized
{
  return self->_toolPreviewMinimized;
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (PKPaletteContainerView)containerView
{
  return self->_containerView;
}

- (NSLayoutConstraint)paletteContainerWidthConstraint
{
  return self->_paletteContainerWidthConstraint;
}

- (void)setPaletteContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteContainerHeightConstraint
{
  return self->_paletteContainerHeightConstraint;
}

- (void)setPaletteContainerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteContainerCenterXConstraint
{
  return self->_paletteContainerCenterXConstraint;
}

- (void)setPaletteContainerCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteContainerCenterYConstraint
{
  return self->_paletteContainerCenterYConstraint;
}

- (void)setPaletteContainerCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteContainerCompactTopConstraint
{
  return self->_paletteContainerCompactTopConstraint;
}

- (void)setPaletteContainerCompactTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteContainerCompactBottomConstraint
{
  return self->_paletteContainerCompactBottomConstraint;
}

- (void)setPaletteContainerCompactBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteContainerCompactLeftConstraint
{
  return self->_paletteContainerCompactLeftConstraint;
}

- (void)setPaletteContainerCompactLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteContainerCompactRightConstraint
{
  return self->_paletteContainerCompactRightConstraint;
}

- (void)setPaletteContainerCompactRightConstraint:(id)a3
{
}

- (PKPaletteToolPreview)toolPreview
{
  return self->_toolPreview;
}

- (NSLayoutConstraint)toolPreviewCenterXConstraint
{
  return self->_toolPreviewCenterXConstraint;
}

- (void)setToolPreviewCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPreviewCenterYConstraint
{
  return self->_toolPreviewCenterYConstraint;
}

- (void)setToolPreviewCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPreviewWidthConstraint
{
  return self->_toolPreviewWidthConstraint;
}

- (void)setToolPreviewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPreviewHeightConstraint
{
  return self->_toolPreviewHeightConstraint;
}

- (void)setToolPreviewHeightConstraint:(id)a3
{
}

- (unint64_t)lastPaletteEdgePositionWhileDragging
{
  return self->_lastPaletteEdgePositionWhileDragging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolPreviewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolPreviewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toolPreviewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_toolPreviewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_toolPreview, 0);
  objc_storeStrong((id *)&self->_paletteContainerCompactRightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCompactLeftConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCompactBottomConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCompactTopConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_destroyWeak((id *)&self->_hoverDelegate);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_destroyWeak((id *)&self->_paletteViewHosting);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_paletteScaleFactorPolicy, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_destroyWeak((id *)&self->_presentationController);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_palettePopoverPresentingController);
}

@end