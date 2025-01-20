@interface CCUIContentModuleContainerViewController
+ (double)editingBorderPulseAnimationStartTime;
+ (id)editingSettings;
+ (void)resetEditingBorderPulseAnimationStartTime;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isContentViewControllerImplicitlyExpanded;
- (BOOL)_isEffectivelyExpanded;
- (BOOL)_isForceTouchAvailable;
- (BOOL)allowsAutomaticForwardingOfAppearanceMethods;
- (BOOL)ccui_shouldPropagateAppearanceCalls;
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (BOOL)contentModuleProvidesOwnPlatter;
- (BOOL)definesContentModuleContainer;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isAuthenticatedForExpandedModulePresentation;
- (BOOL)isEditing;
- (BOOL)isExpanded;
- (BOOL)isJittering;
- (BOOL)isResizing;
- (BOOL)isTransitioning;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)showsSquareCorners;
- (BOOL)suppressesCompactContinuousCornerRadiusUpdates;
- (CCUIContentModule)contentModule;
- (CCUIContentModuleBackgroundView)backgroundView;
- (CCUIContentModuleBackgroundViewController)backgroundViewController;
- (CCUIContentModuleContainerPresentationController)presentationController;
- (CCUIContentModuleContainerViewController)init;
- (CCUIContentModuleContainerViewController)initWithCoder:(id)a3;
- (CCUIContentModuleContainerViewController)initWithModuleIdentifier:(id)a3 uniqueIdentifier:(id)a4 contentModule:(id)a5 presentationContext:(id)a6;
- (CCUIContentModuleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CCUIContentModuleContainerViewControllerDelegate)delegate;
- (CCUIContentModuleContentContainerView)contentContainerView;
- (CCUIContentModuleContentContainerView)moduleContentView;
- (CCUIContentModuleContentViewController)contentViewController;
- (CCUITouchPassThroughView)rootTouchPassThroughView;
- (CGRect)_backgroundFrameForExpandedState;
- (CGRect)_containerFrameForExpandedState;
- (CGRect)_contentBoundsForExpandedState;
- (CGRect)_contentBoundsForTransitionProgress:(double)a3;
- (CGRect)_contentFrameForExpandedState;
- (CGRect)_contentFrameForRestState;
- (CGRect)_presentationFrameForExpandedState;
- (CGRect)visibleBounds;
- (CGSize)maxResizeDimensions;
- (CGSize)minResizeDimensions;
- (NSArray)topLevelBlockingGestureRecognizers;
- (NSString)moduleIdentifier;
- (NSUUID)uniqueIdentifier;
- (SBIconImageInfo)iconImageInfo;
- (UIAction)redirectedTapAction;
- (UIControl)touchBlockingView;
- (UITapGestureRecognizer)expandModuleOnTouchTapRecognizer;
- (UITapGestureRecognizer)tapRecognizer;
- (UIView)contentView;
- (UIView)editingBorderContainerView;
- (UIView)editingBorderMaskView;
- (UIView)editingBorderView;
- (UIView)highlightWrapperView;
- (UIView)maskView;
- (_UIClickPresentationInteraction)clickPresentationInteraction;
- (double)_continuousCornerRadiusForExpandedState;
- (double)continuousCornerRadius;
- (id)_contentSourceView;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)rootPassThroughView;
- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3;
- (unint64_t)editingBorderViewRemovalAnimationGeneration;
- (unint64_t)userVisibilityStatus;
- (void)_addTopLevelGestureRecognizersFromViewAndSubviews:(id)a3 toBlockingGestureRecognizers:(id)a4;
- (void)_closeExpandedModule:(BOOL)a3;
- (void)_configureContentViewControllerEditingAnimated:(BOOL)a3;
- (void)_configureEditingAnimated:(BOOL)a3;
- (void)_configureForContentModuleGroupRenderingIfNecessary;
- (void)_configureJittering;
- (void)_configureMaskViewIfNecessary;
- (void)_configureTouchBlockingIfNecessary;
- (void)_configureTouchPassThrough;
- (void)_didEndTransitionWithContentModuleContainerTransition:(id)a3 completed:(BOOL)a4;
- (void)_ensureAndConfigureEditingBorderView;
- (void)_findTopLevelGestureRecognizersForView:(id)a3 installOnView:(id)a4;
- (void)_handleBlockedTap:(id)a3;
- (void)_handleExpandModuleForTapGestureRecognizer:(id)a3;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_loadBackgroundViewController:(id)a3;
- (void)_loadContentViewController:(id)a3;
- (void)_removeEditingBorderView;
- (void)_setDidExpandModulePreference;
- (void)_updateDisplayedCompactContinuousCornerRadius;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)dismissExpandedModuleAnimated:(BOOL)a3;
- (void)dismissModulePresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissPresentedContentAnimated:(BOOL)a3;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)displayWillTurnOff;
- (void)expandModule;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)redirectTapsWithAction:(id)a3;
- (void)setAllowsAutomaticForwardingOfAppearanceMethods:(BOOL)a3;
- (void)setAuthenticatedForExpandedModulePresentation:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewController:(id)a3;
- (void)setClickPresentationInteraction:(id)a3;
- (void)setContentContainerView:(id)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContentModule:(id)a3;
- (void)setContentModuleProvidesOwnPlatter:(BOOL)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingBorderContainerView:(id)a3;
- (void)setEditingBorderMaskView:(id)a3;
- (void)setEditingBorderView:(id)a3;
- (void)setEditingBorderViewRemovalAnimationGeneration:(unint64_t)a3;
- (void)setExpandModuleOnTouchTapRecognizer:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setHighlightWrapperView:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setJittering:(BOOL)a3;
- (void)setMaskView:(id)a3;
- (void)setMaxResizeDimensions:(CGSize)a3;
- (void)setMinResizeDimensions:(CGSize)a3;
- (void)setModuleIdentifier:(id)a3;
- (void)setPresentationController:(id)a3;
- (void)setRedirectedTapAction:(id)a3;
- (void)setResizing:(BOOL)a3;
- (void)setRootTouchPassThroughView:(id)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)setSuppressesCompactContinuousCornerRadiusUpdates:(BOOL)a3;
- (void)setTapRecognizer:(id)a3;
- (void)setTouchBlockingView:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setUserVisibilityStatus:(unint64_t)a3;
- (void)transitionToExpandedMode:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willBecomeActive;
- (void)willDismissViewController:(id)a3;
- (void)willPresentViewController:(id)a3;
- (void)willResignActive;
@end

@implementation CCUIContentModuleContainerViewController

- (CCUIContentModuleContainerViewController)initWithModuleIdentifier:(id)a3 uniqueIdentifier:(id)a4 contentModule:(id)a5 presentationContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CCUIContentModuleContainerViewController;
  v14 = [(CCUIContentModuleContainerViewController *)&v25 initWithNibName:0 bundle:0];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    moduleIdentifier = v14->_moduleIdentifier;
    v14->_moduleIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    uniqueIdentifier = v14->_uniqueIdentifier;
    v14->_uniqueIdentifier = (NSUUID *)v17;

    objc_storeStrong((id *)&v14->_contentModule, a5);
    CCUICompactModuleContinuousCornerRadius();
    SBIconImageInfoMake();
    v14->_iconImageInfo.size.width = v19;
    v14->_iconImageInfo.size.height = v20;
    v14->_iconImageInfo.scale = v21;
    v14->_iconImageInfo.continuousCornerRadius = v22;
    [(CCUIContentModuleContainerViewController *)v14 _loadContentViewController:v13];
    if (objc_opt_respondsToSelector())
    {
      contentViewController = v14->_contentViewController;
      [(CCUIContentModuleContainerViewController *)v14 _continuousCornerRadiusForCompactState];
      -[CCUIContentModuleContentViewController setCompactContinuousCornerRadius:](contentViewController, "setCompactContinuousCornerRadius:");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(CCUIContentModule *)v14->_contentModule expandsGridSizeClassesForAccessibility]&& (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(CCUIContentModuleContentViewController *)v14->_contentViewController setSupportsAccessibilityContentSizeCategories:1];
    }
    [(CCUIContentModuleContainerViewController *)v14 addChildViewController:v14->_contentViewController];
    [(CCUIContentModuleContentViewController *)v14->_contentViewController didMoveToParentViewController:v14];
    if (objc_opt_respondsToSelector()) {
      v14->_contentModuleProvidesOwnPlatter = [(CCUIContentModuleContentViewController *)v14->_contentViewController providesOwnPlatter];
    }
    [(CCUIContentModuleContainerViewController *)v14 _configureContentViewControllerEditingAnimated:0];
    [(CCUIContentModuleContainerViewController *)v14 _loadBackgroundViewController:v13];
  }

  return v14;
}

- (void)_loadContentViewController:(id)a3
{
  id v10 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [(CCUIContentModule *)self->_contentModule contentViewController];
    contentViewController = self->_contentViewController;
    self->_contentViewController = v5;
  }
  if (!self->_contentViewController)
  {
    if (objc_opt_respondsToSelector())
    {
      v7 = [(CCUIContentModule *)self->_contentModule contentViewControllerForContext:v10];
      v8 = self->_contentViewController;
      self->_contentViewController = v7;
    }
    if (!self->_contentViewController)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"CCUIContentModuleContainerViewController.m", 173, @"No valid CCUIContentModuleContentViewController was found: %@", self->_moduleIdentifier object file lineNumber description];
    }
  }
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIContentModuleContainerViewController;
  [(CCUIContentModuleContainerViewController *)&v6 dismissViewControllerWithTransition:*(void *)&a3 completion:a4];
  if (!a3) {
    [(CCUIContentModuleContentContainerView *)self->_contentContainerView setAlpha:1.0];
  }
}

- (void)_loadBackgroundViewController:(id)a3
{
  id v8 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [(CCUIContentModule *)self->_contentModule backgroundViewController];
    backgroundViewController = self->_backgroundViewController;
    self->_backgroundViewController = v4;
  }
  if (!self->_backgroundViewController && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_super v6 = [(CCUIContentModule *)self->_contentModule backgroundViewControllerForContext:v8];
    v7 = self->_backgroundViewController;
    self->_backgroundViewController = v6;
  }
}

- (void)transitionToExpandedMode:(BOOL)a3
{
  if (a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__CCUIContentModuleContainerViewController_transitionToExpandedMode___block_invoke;
    v6[3] = &unk_1E6A898F8;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
    [(CCUIContentModuleBackgroundView *)self->_backgroundView setAlpha:1.0];
    [(CCUIContentModuleBackgroundView *)self->_backgroundView setUserInteractionEnabled:1];
    [(CCUIContentModuleContainerViewController *)self _contentFrameForExpandedState];
    -[CCUIContentModuleContentContainerView setFrame:](self->_contentContainerView, "setFrame:");
    contentContainerView = self->_contentContainerView;
    [(CCUIContentModuleContainerViewController *)self _continuousCornerRadiusForExpandedState];
    -[CCUIContentModuleContentContainerView setExpandedContinuousCornerRadius:](contentContainerView, "setExpandedContinuousCornerRadius:");
    [(CCUIContentModuleContentContainerView *)self->_contentContainerView transitionToExpandedMode:1];
  }
  else
  {
    [(CCUIContentModuleBackgroundView *)self->_backgroundView setAlpha:0.0];
    [(CCUIContentModuleBackgroundView *)self->_backgroundView setUserInteractionEnabled:0];
    v5 = self->_contentContainerView;
    [(CCUIContentModuleContainerViewController *)self _continuousCornerRadiusForCompactState];
    -[CCUIContentModuleContentContainerView setCompactContinuousCornerRadius:](v5, "setCompactContinuousCornerRadius:");
    [(CCUIContentModuleContentContainerView *)self->_contentContainerView transitionToExpandedMode:0];
    [(CCUIContentModuleBackgroundViewController *)self->_backgroundViewController beginAppearanceTransition:0 animated:1];
  }
  [(CCUIContentModuleContainerViewController *)self _configureTouchPassThrough];
}

void __69__CCUIContentModuleContainerViewController_transitionToExpandedMode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _backgroundFrameForExpandedState];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) view];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1072), "setFrame:", v3, v5, v7, v9);
  id v11 = *(void **)(*(void *)(a1 + 32) + 1048);
  if (v11)
  {
    [v11 beginAppearanceTransition:1 animated:0];
    [*(id *)(a1 + 32) addChildViewController:*(void *)(*(void *)(a1 + 32) + 1048)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "didMoveToParentViewController:");
    id v12 = [*(id *)(*(void *)(a1 + 32) + 1048) view];
    [*(id *)(a1 + 32) _presentationFrameForExpandedState];
    objc_msgSend(v12, "setFrame:");
    [*(id *)(*(void *)(a1 + 32) + 1072) addSubview:v12];
  }
}

- (void)redirectTapsWithAction:(id)a3
{
  double v5 = (UIAction *)a3;
  p_redirectedTapAction = &self->_redirectedTapAction;
  if (self->_redirectedTapAction != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_redirectedTapAction, a3);
    p_redirectedTapAction = (UIAction **)[(CCUIContentModuleContainerViewController *)self _configureTouchBlockingIfNecessary];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_redirectedTapAction, v5);
}

- (CCUIContentModuleContainerViewController)init
{
  return 0;
}

- (CCUIContentModuleContainerViewController)initWithCoder:(id)a3
{
  return 0;
}

- (CCUIContentModuleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    contentViewController = self->_contentViewController;
    [(CCUIContentModuleContentViewController *)contentViewController setContentRenderingMode:a3];
  }
}

- (void)setContentMetrics:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(CCUIContentModuleContentViewController *)self->_contentViewController setContentMetrics:v4];
  }
}

- (void)setGridSizeClass:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(CCUIContentModuleContentViewController *)self->_contentViewController setGridSizeClass:a3];
    [(CCUIContentModuleContainerViewController *)self _configureTouchPassThrough];
  }
}

- (void)setResizing:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_resizing != a3)
  {
    self->_resizing = a3;
    if (objc_opt_respondsToSelector()) {
      [(CCUIContentModuleContentViewController *)self->_contentViewController setResizing:v3];
    }
    [(CCUIContentModuleContainerViewController *)self _ensureAndConfigureEditingBorderView];
  }
  contentContainerView = self->_contentContainerView;

  [(CCUIContentModuleContentContainerView *)contentContainerView setClipsToBounds:v3];
}

- (void)expandModule
{
  if (!self->_transitioning)
  {
    id v5 = [(CCUIContentModuleContainerViewController *)self moduleIdentifier];
    if (([v5 isEqualToString:@"com.apple.Home.ControlCenter"] & 1) != 0
      || [v5 isEqualToString:@"com.apple.Home.ControlCenterSingleTile"])
    {
      BOOL v3 = [(CCUIContentModuleContainerViewController *)self clickPresentationInteraction];
      [v3 cancelInteraction];
    }
    id v4 = [(CCUIContentModuleContainerViewController *)self clickPresentationInteraction];
    [v4 present];
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIContentModuleContainerViewController;
  [(CCUIContentModuleContainerViewController *)&v5 preferredContentSizeDidChangeForChildContentContainer:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__CCUIContentModuleContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v4[3] = &unk_1E6A898F8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.3];
}

uint64_t __98__CCUIContentModuleContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[135];
  [v2 _contentFrameForExpandedState];
  objc_msgSend(v3, "setFrame:");
  id v4 = *(void **)(*(void *)(a1 + 32) + 1080);

  return [v4 layoutIfNeeded];
}

- (void)dismissExpandedModuleAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__CCUIContentModuleContainerViewController_dismissExpandedModuleAnimated___block_invoke;
  v3[3] = &unk_1E6A8A660;
  v3[4] = self;
  BOOL v4 = a3;
  [(CCUIContentModuleContainerViewController *)self dismissModulePresentedContentAnimated:a3 completion:v3];
}

uint64_t __74__CCUIContentModuleContainerViewController_dismissExpandedModuleAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeExpandedModule:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dismissPresentedContentAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__CCUIContentModuleContainerViewController_dismissPresentedContentAnimated___block_invoke;
  v3[3] = &unk_1E6A8A660;
  v3[4] = self;
  BOOL v4 = a3;
  [(CCUIContentModuleContainerViewController *)self dismissModulePresentedContentAnimated:a3 completion:v3];
}

uint64_t __76__CCUIContentModuleContainerViewController_dismissPresentedContentAnimated___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _closeExpandedModule:*(unsigned __int8 *)(result + 40)];
  }
  return result;
}

- (void)dismissModulePresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(CCUIContentModuleContentViewController *)self->_contentViewController canDismissPresentedContent]&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    contentViewController = self->_contentViewController;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__CCUIContentModuleContainerViewController_dismissModulePresentedContentAnimated_completion___block_invoke;
    v8[3] = &unk_1E6A89B38;
    id v9 = v6;
    [(CCUIContentModuleContentViewController *)contentViewController dismissPresentedContentAnimated:v4 completion:v8];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __93__CCUIContentModuleContainerViewController_dismissModulePresentedContentAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_closeExpandedModule:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CCUIContentModuleContainerViewController *)self isExpanded])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__CCUIContentModuleContainerViewController__closeExpandedModule___block_invoke;
    v5[3] = &unk_1E6A8A660;
    v5[4] = self;
    BOOL v6 = v3;
    [(CCUIContentModuleContainerViewController *)self dismissModulePresentedContentAnimated:v3 completion:v5];
  }
}

uint64_t __65__CCUIContentModuleContainerViewController__closeExpandedModule___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:*(unsigned __int8 *)(a1 + 40) completion:0];
}

- (CCUIContentModuleContentContainerView)moduleContentView
{
  return self->_contentContainerView;
}

- (void)displayWillTurnOff
{
  if ([(CCUIContentModuleContainerViewController *)self _appearState] == 2
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    contentViewController = self->_contentViewController;
    [(CCUIContentModuleContentViewController *)contentViewController displayWillTurnOff];
  }
}

- (void)willBecomeActive
{
  char v3 = objc_opt_respondsToSelector();
  contentViewController = self->_contentViewController;
  if (v3)
  {
    [(CCUIContentModuleContentViewController *)contentViewController willBecomeActive];
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_super v5 = self->_contentViewController;
    [(CCUIContentModuleContentViewController *)v5 controlCenterWillPresent];
  }
}

- (void)willResignActive
{
  char v3 = objc_opt_respondsToSelector();
  contentViewController = self->_contentViewController;
  if (v3)
  {
    [(CCUIContentModuleContentViewController *)contentViewController willResignActive];
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_super v5 = self->_contentViewController;
    [(CCUIContentModuleContentViewController *)v5 controlCenterDidDismiss];
  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return self->_allowsAutomaticForwardingOfAppearanceMethods;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIContentModuleContainerViewController;
  [(CCUIContentModuleContainerViewController *)&v4 viewWillAppear:a3];
  [(CCUIContentModuleContainerViewController *)self _configureForContentModuleGroupRenderingIfNecessary];
  [(CCUIContentModuleContainerViewController *)self _configureContentViewControllerEditingAnimated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIContentModuleContainerViewController;
  [(CCUIContentModuleContainerViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  if ([(CCUIContentModuleContainerViewController *)self isExpanded])
  {
    [(CCUIContentModuleContainerViewController *)self _closeExpandedModule:v3];
  }
  else
  {
    objc_super v5 = [(CCUIContentModuleContainerViewController *)self clickPresentationInteraction];
    [v5 cancelInteraction];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contentModuleContainerViewController:self didFinishInteractionWithModule:self->_contentModule];
  }
}

- (void)loadView
{
  id v30 = objc_alloc_init(MEMORY[0x1E4F5AE68]);
  -[CCUIContentModuleContainerViewController setView:](self, "setView:");
  BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
    [v30 addInteraction:v5];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F5AE68]);
  [v30 bounds];
  objc_super v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  highlightWrapperView = self->_highlightWrapperView;
  self->_highlightWrapperView = v7;

  [(UIView *)self->_highlightWrapperView _setLayoutDebuggingIdentifier:@"HighlightWrapperView"];
  [(UIView *)self->_highlightWrapperView setAutoresizingMask:18];
  id v9 = self->_highlightWrapperView;
  id v10 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)v9 setBackgroundColor:v10];

  [v30 addSubview:self->_highlightWrapperView];
  id v11 = objc_alloc_init(CCUIContentModuleBackgroundView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v11;

  [(CCUIContentModuleBackgroundView *)self->_backgroundView setAutoresizesSubviews:0];
  id v13 = self->_backgroundView;
  [v30 bounds];
  -[CCUIContentModuleBackgroundView setFrame:](v13, "setFrame:");
  [(UIView *)self->_highlightWrapperView addSubview:self->_backgroundView];
  v14 = objc_alloc_init(CCUIContentModuleContentContainerView);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v14;

  v16 = self->_contentContainerView;
  [(CCUIContentModuleContainerViewController *)self _continuousCornerRadiusForCompactState];
  -[CCUIContentModuleContentContainerView setCompactContinuousCornerRadius:](v16, "setCompactContinuousCornerRadius:");
  uint64_t v17 = self->_contentContainerView;
  [(CCUIContentModuleContainerViewController *)self _continuousCornerRadiusForExpandedState];
  -[CCUIContentModuleContentContainerView setExpandedContinuousCornerRadius:](v17, "setExpandedContinuousCornerRadius:");
  [(CCUIContentModuleContentContainerView *)self->_contentContainerView setModuleProvidesOwnPlatter:self->_contentModuleProvidesOwnPlatter];
  v18 = self->_contentContainerView;
  [v30 bounds];
  -[CCUIContentModuleContentContainerView setFrame:](v18, "setFrame:");
  [(UIView *)self->_highlightWrapperView addSubview:self->_contentContainerView];
  CGFloat v19 = [(CCUIContentModuleContentViewController *)self->_contentViewController view];
  contentView = self->_contentView;
  self->_contentView = v19;

  [(UIView *)self->_contentView setAutoresizingMask:18];
  double v21 = self->_contentView;
  [(CCUIContentModuleContentContainerView *)self->_contentContainerView bounds];
  -[UIView setFrame:](v21, "setFrame:");
  [(CCUIContentModuleContentContainerView *)self->_contentContainerView addSubview:self->_contentView];
  [(CCUIContentModuleContainerViewController *)self _findTopLevelGestureRecognizersForView:self->_contentView installOnView:self->_contentView];
  double v22 = (_UIClickPresentationInteraction *)[objc_alloc(MEMORY[0x1E4FB2040]) initWithDelegate:self];
  clickPresentationInteraction = self->_clickPresentationInteraction;
  self->_clickPresentationInteraction = v22;

  [(_UIClickPresentationInteraction *)self->_clickPresentationInteraction setAllowSimultaneousRecognition:1];
  v24 = [(CCUIContentModuleContainerViewController *)self view];
  [v24 addInteraction:self->_clickPresentationInteraction];

  objc_super v25 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapGestureRecognizer_];
  [(CCUIContentModuleBackgroundView *)self->_backgroundView addGestureRecognizer:v25];
  [(CCUIContentModuleContainerViewController *)self setTapRecognizer:v25];
  v26 = [(CCUIContentModuleContainerViewController *)self contentViewController];
  if (objc_opt_respondsToSelector())
  {
    v27 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleExpandModuleForTapGestureRecognizer_];
    expandModuleOnTouchTapRecognizer = self->_expandModuleOnTouchTapRecognizer;
    self->_expandModuleOnTouchTapRecognizer = v27;

    v29 = [(CCUIContentModuleContainerViewController *)self view];
    [v29 addGestureRecognizer:self->_expandModuleOnTouchTapRecognizer];

    [(UITapGestureRecognizer *)self->_expandModuleOnTouchTapRecognizer setDelegate:self];
  }
  [(CCUIContentModuleContainerViewController *)self _configureTouchPassThrough];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIContentModuleContainerViewController;
  [(CCUIContentModuleContainerViewController *)&v3 viewDidLoad];
  [(CCUIContentModuleContainerViewController *)self _configureTouchBlockingIfNecessary];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_findTopLevelGestureRecognizersForView:(id)a3 installOnView:(id)a4
{
  objc_super v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v9 = objc_alloc_init(v5);
  [(CCUIContentModuleContainerViewController *)self _addTopLevelGestureRecognizersFromViewAndSubviews:v6 toBlockingGestureRecognizers:v9];

  objc_super v7 = (NSArray *)[v9 copy];
  topLevelBlockingGestureRecognizers = self->_topLevelBlockingGestureRecognizers;
  self->_topLevelBlockingGestureRecognizers = v7;
}

- (void)_addTopLevelGestureRecognizersFromViewAndSubviews:(id)a3 toBlockingGestureRecognizers:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    double v8 = [v6 topLevelBlockingGestureRecognizers];
    [v7 addObjectsFromArray:v8];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = objc_msgSend(v6, "subviews", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CCUIContentModuleContainerViewController *)self _addTopLevelGestureRecognizersFromViewAndSubviews:*(void *)(*((void *)&v14 + 1) + 8 * v13++) toBlockingGestureRecognizers:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)viewWillLayoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)CCUIContentModuleContainerViewController;
  [(CCUIContentModuleContainerViewController *)&v47 viewWillLayoutSubviews];
  if ([(CCUIContentModuleContainerViewController *)self isExpanded])
  {
    highlightWrapperView = self->_highlightWrapperView;
    [(CCUIContentModuleContainerViewController *)self _backgroundFrameForExpandedState];
    -[UIView setFrame:](highlightWrapperView, "setFrame:");
    backgroundView = self->_backgroundView;
    [(CCUIContentModuleContainerViewController *)self _backgroundFrameForExpandedState];
    -[CCUIContentModuleBackgroundView setFrame:](backgroundView, "setFrame:");
    contentContainerView = self->_contentContainerView;
    [(CCUIContentModuleContainerViewController *)self _contentFrameForExpandedState];
    -[CCUIContentModuleContentContainerView setFrame:](contentContainerView, "setFrame:");
  }
  else
  {
    id v6 = [(CCUIContentModuleContainerViewController *)self view];
    [v6 bounds];
    double v42 = v8;
    double v43 = v7;
    double v10 = v9;
    double v12 = v11;
    double v41 = v11;
    double v44 = v9;
    if (self->_resizing)
    {
      double v13 = *MEMORY[0x1E4F1DB30];
      double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v15 = 1.0;
      BOOL v16 = self->_minResizeDimensions.width == *MEMORY[0x1E4F1DB30] && self->_minResizeDimensions.height == v14;
      double v17 = 1.0;
      if (!v16)
      {
        if (BSFloatLessThanFloat()) {
          double v17 = v10 / self->_minResizeDimensions.width;
        }
        if (BSFloatLessThanFloat()) {
          double v15 = v12 / self->_minResizeDimensions.height;
        }
      }
      if (self->_maxResizeDimensions.width != v13 || self->_maxResizeDimensions.height != v14)
      {
        if (BSFloatGreaterThanFloat()) {
          double v17 = v10 / self->_maxResizeDimensions.width;
        }
        if (BSFloatGreaterThanFloat()) {
          double v15 = v12 / self->_maxResizeDimensions.height;
        }
      }
    }
    else
    {
      double v15 = 1.0;
      double v17 = 1.0;
    }
    BSRectWithSize();
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [v6 center];
    double v28 = v27;
    double v30 = v29;
    -[UIView setBounds:](self->_highlightWrapperView, "setBounds:", v20, v22, v24, v26);
    -[UIView setCenter:](self->_highlightWrapperView, "setCenter:", v28, v30);
    -[UIView setBounds:](self->_editingBorderMaskView, "setBounds:", v20, v22, v24, v26);
    if BSFloatEqualToFloat() && (BSFloatEqualToFloat())
    {
      v31 = self->_highlightWrapperView;
      long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v46.a = *MEMORY[0x1E4F1DAB8];
      long long v39 = *(_OWORD *)&v46.a;
      *(_OWORD *)&v46.c = v40;
      *(_OWORD *)&v46.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v38 = *(_OWORD *)&v46.tx;
      [(UIView *)v31 setTransform:&v46];
      editingBorderMaskView = self->_editingBorderMaskView;
      *(_OWORD *)&v46.a = v39;
      *(_OWORD *)&v46.c = v40;
      *(_OWORD *)&v46.tx = v38;
      v33 = &v46;
    }
    else
    {
      memset(&v46, 0, sizeof(v46));
      CGAffineTransformMakeScale(&v46, v17, v15);
      v34 = self->_highlightWrapperView;
      CGAffineTransform v45 = v46;
      [(UIView *)v34 setTransform:&v45];
      editingBorderMaskView = self->_editingBorderMaskView;
      CGAffineTransform v45 = v46;
      v33 = &v45;
    }
    [(UIView *)editingBorderMaskView setTransform:v33];
    -[UIView setFrame:](self->_highlightWrapperView, "setFrame:", v20, v22, v24, v26);
    -[CCUIContentModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", v20, v22, v24, v26);
    -[CCUIContentModuleContentContainerView setFrame:](self->_contentContainerView, "setFrame:", v20, v22, v24, v26);
    -[UIControl setFrame:](self->_touchBlockingView, "setFrame:", v20, v22, v24, v26);
    -[UIView setFrame:](self->_maskView, "setFrame:", v43, v42, v44, v41);
    v35 = [(id)objc_opt_class() editingSettings];
    [v35 pulsingBorderWidth];

    [v6 _shouldReverseLayoutDirection];
    UIRectInset();
    -[UIView setFrame:](self->_editingBorderContainerView, "setFrame:");
    editingBorderView = self->_editingBorderView;
    [(UIView *)self->_editingBorderContainerView bounds];
    -[UIView setFrame:](editingBorderView, "setFrame:");
    v37 = self->_editingBorderMaskView;
    -[UIView convertPoint:fromView:](self->_editingBorderView, "convertPoint:fromView:", v6, v28, v30);
    -[UIView setCenter:](v37, "setCenter:");
  }
}

- (BOOL)ccui_shouldPropagateAppearanceCalls
{
  return !self->_allowsAutomaticForwardingOfAppearanceMethods;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (int v4 = [(CCUIContentModuleContentViewController *)self->_contentViewController shouldPerformClickInteraction]) != 0)
  {
    if ([(CCUIContentModuleContainerViewController *)self _isEffectivelyExpanded]
      || (id v5 = objc_loadWeakRetained((id *)&self->_delegate),
          int v6 = [v5 contentModuleContainerViewController:self canBeginInteractionWithModule:self->_contentModule], v5, !v6))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained contentModuleContainerViewController:self didBeginInteractionWithModule:self->_contentModule];

      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(CCUIContentModuleContentViewController *)self->_contentViewController shouldBeginTransitionToExpandedContentModule])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contentModuleContainerViewController:self didFinishInteractionWithModule:self->_contentModule];

    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(CCUIContentModuleContentViewController *)self->_contentViewController shouldRequestAuthenticationForTransitionToExpandedContent]&& !self->_authenticatedForExpandedModulePresentation&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke;
    block[3] = &unk_1E6A89968;
    block[4] = self;
    id v12 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_10:
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke_3;
    v8[3] = &unk_1E6A89FA8;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E4F14428], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    BOOL v5 = 0;
    goto LABEL_11;
  }
  BOOL v5 = 1;
  self->_transitioning = 1;
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
LABEL_11:

  return v5;
}

void __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(v1 + 1024);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke_2;
  v3[3] = &unk_1E6A8A688;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 requestAuthenticationForTransitionToExpandedContentModuleWithCompletionHandler:v3];
}

void __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke_2(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 983) = a2;
  objc_super v3 = *(void **)(a1 + 40);
  if (a2)
  {
    [v3 present];
  }
  else
  {
    [v3 cancelInteraction];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1032));
    [WeakRetained contentModuleContainerViewController:*(void *)(a1 + 32) didFinishInteractionWithModule:*(void *)(*(void *)(a1 + 32) + 1040)];
  }
}

void __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained clickPresentationInteraction];
  [v1 cancelInteraction];
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contentModuleContainerViewController:self didFinishInteractionWithModule:self->_contentModule];

  presentationController = self->_presentationController;
  self->_presentationController = 0;

  self->_authenticatedForExpandedModulePresentation = 0;
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(CCUIContentModuleContainerViewController *)self view];
  if ([v4 _isInAWindow])
  {
    BOOL v5 = [v4 window];
    int v6 = (void *)*MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      double v7 = v6;
      double v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v12 = 138543874;
      double v13 = v9;
      __int16 v14 = 2114;
      double v15 = v4;
      __int16 v16 = 2114;
      double v17 = v5;
      _os_log_impl(&dword_1D7B17000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Control Center is about to call -[UITargetedPreview initWithView:], view = %{public}@, window = %{public}@", (uint8_t *)&v12, 0x20u);
    }
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v4];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(CCUIContentModuleContentViewController *)self->_contentViewController shouldFinishTransitionToExpandedContentModule])
  {
    double v7 = 0;
  }
  else
  {
    BOOL v5 = [[CCUIContentModuleContainerPresentationController alloc] initWithPresentedViewController:self presentingViewController:self];
    presentationController = self->_presentationController;
    self->_presentationController = v5;

    double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB2038]) initWithPresentedViewController:self presentationController:self->_presentationController];
    if (objc_opt_respondsToSelector())
    {
      double v8 = [(CCUIContentModuleContentViewController *)self->_contentViewController viewForTouchContinuation];
    }
    else
    {
      double v8 = 0;
    }
    [v7 setCustomViewForTouchContinuation:v8];
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      id v9 = objc_alloc_init(CCUIContentModuleContainerReducedMotionTransition);
      double v10 = objc_alloc_init(CCUIContentModuleContainerReducedMotionTransition);
      double v11 = [(CCUIContentModuleContainerViewController *)self view];
      int v12 = [v11 window];

      [(CCUIContentModuleContainerReducedMotionTransition *)v9 setSnapshotHostWindow:v12];
      [(CCUIContentModuleContainerReducedMotionTransition *)v10 setSnapshotHostWindow:v12];
      double v13 = [(CCUIContentModuleContainerViewController *)self bs_presentationContextDefiningViewController];
      __int16 v14 = [v13 view];
      double v15 = [v14 window];
      [v15 interfaceOrientation];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v23 = 0u;
      [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation];
      CCUIAffineTransformBetweenInterfaceOrientations();
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      [(CCUIContentModuleContainerReducedMotionTransition *)v9 setSnapshotCorrectiveTransform:&v20];
      long long v20 = v23;
      long long v21 = v24;
      long long v22 = v25;
      [(CCUIContentModuleContainerReducedMotionTransition *)v10 setSnapshotCorrectiveTransform:&v20];
    }
    else
    {
      __int16 v16 = [(CCUIContentModuleContainerViewController *)self contentViewController];
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        id v9 = objc_alloc_init(CCUIContentModuleContainerClientDrivenTransition);
        uint64_t v18 = CCUIContentModuleContainerClientDrivenTransition;
      }
      else
      {
        id v9 = objc_alloc_init(CCUIContentModuleContainerTransition);
        uint64_t v18 = CCUIContentModuleContainerTransition;
      }
      double v10 = (CCUIContentModuleContainerReducedMotionTransition *)objc_alloc_init(v18);
    }
    [(CCUIContentModuleContainerTransition *)v9 setViewController:self];
    [(CCUIContentModuleContainerTransition *)v9 setAppearanceTransition:1];
    [(CCUIContentModuleContainerViewController *)self _contentFrameForRestState];
    -[CCUIContentModuleContainerTransition setContentRestOverrideFrame:](v9, "setContentRestOverrideFrame:");
    [v7 setAppearanceTransition:v9];
    [(CCUIContentModuleContainerTransition *)v10 setViewController:self];
    [(CCUIContentModuleContainerTransition *)v10 setAppearanceTransition:0];
    [v7 setDisappearanceTransition:v10];
  }

  return v7;
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  return 2;
}

- (BOOL)definesContentModuleContainer
{
  return 1;
}

- (void)willPresentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIContentModuleContainerViewController *)self delegate];
  [v5 contentModuleContainerViewController:self willPresentViewController:v4];
}

- (void)willDismissViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIContentModuleContainerViewController *)self delegate];
  [v5 contentModuleContainerViewController:self willDismissViewController:v4];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  double v7 = [(CCUIContentModuleContainerViewController *)self contentViewController];
  double v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v8 userInterfaceIdiom] == 1)
  {
    if (objc_opt_respondsToSelector())
    {
      char v9 = [v7 shouldPerformHoverInteraction];

      if ((v9 & 1) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    if ([(CCUIContentModuleContainerViewController *)self isExpanded])
    {
LABEL_8:
      double v10 = 0;
      goto LABEL_11;
    }
    [v6 rect];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CCUILayoutGutter();
    CGFloat v20 = -v19;
    CCUILayoutGutter();
    CGFloat v22 = -v21;
    v30.origin.double x = v12;
    v30.origin.double y = v14;
    v30.size.double width = v16;
    v30.size.double height = v18;
    CGRect v31 = CGRectInset(v30, v20, v22);
    double x = v31.origin.x;
    double y = v31.origin.y;
    double width = v31.size.width;
    double height = v31.size.height;
    double v27 = (void *)MEMORY[0x1E4FB1AD8];
    double v8 = [(CCUIContentModuleContainerViewController *)self moduleIdentifier];
    double v10 = objc_msgSend(v27, "regionWithRect:identifier:", v8, x, y, width, height);
  }
  else
  {
    double v10 = 0;
  }

LABEL_11:

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = [(CCUIContentModuleContainerViewController *)self view];
  int v6 = [v5 _isInAWindow];

  if (v6)
  {
    double v7 = [(CCUIContentModuleContainerViewController *)self view];
    double v8 = [v7 window];
    char v9 = (void *)*MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      double v10 = v9;
      double v11 = (objc_class *)objc_opt_class();
      CGFloat v12 = NSStringFromClass(v11);
      int v30 = 138543874;
      CGRect v31 = v12;
      __int16 v32 = 2114;
      v33 = v7;
      __int16 v34 = 2114;
      v35 = v8;
      _os_log_impl(&dword_1D7B17000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Control Center is about to call -[UITargetedPreview initWithView:], view = %{public}@, window = %{public}@", (uint8_t *)&v30, 0x20u);
    }
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v7];
    CGFloat v14 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v13];
    double v15 = (void *)MEMORY[0x1E4FB1AE0];
    CGFloat v16 = [(CCUIContentModuleContainerViewController *)self view];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [(CCUIContentModuleContainerViewController *)self _continuousCornerRadiusForCompactState];
    double v26 = objc_msgSend(v15, "shapeWithRoundedRect:cornerRadius:", v18, v20, v22, v24, v25);

    double v27 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v14 shape:v26];
  }
  else
  {
    double v28 = *MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_ERROR)) {
      -[CCUIContentModuleContainerViewController pointerInteraction:styleForRegion:](v28);
    }
    double v27 = 0;
  }

  return v27;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  int v6 = [(CCUIContentModuleContainerViewController *)self contentViewController];
  if ([(CCUIContentModuleContainerViewController *)self _isEffectivelyExpanded]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = [v6 shouldExpandModuleOnTouch:v5];
  }

  return v7;
}

- (CGRect)visibleBounds
{
  [(CCUIContentModuleContainerViewController *)self iconImageInfo];

  BSRectWithSize();
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)continuousCornerRadius
{
  [(CCUIContentModuleContainerViewController *)self iconImageInfo];
  return v2;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  CGFloat v9 = v4;
  CGFloat v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if ((SBIconImageInfoEqualToIconImageInfo() & 1) == 0)
  {
    p_iconImageInfo->size.double width = v10;
    p_iconImageInfo->size.double height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    [(CCUIContentModuleContainerViewController *)self _updateDisplayedCompactContinuousCornerRadius];
  }
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController setEditing:animated:](&v7, sel_setEditing_animated_);
  if (self->_editing != v5)
  {
    self->_editing = v5;
    [(CCUIContentModuleContainerViewController *)self _configureTouchBlockingIfNecessary];
    [(CCUIContentModuleContainerViewController *)self _configureEditingAnimated:v4];
  }
}

- (void)setJittering:(BOOL)a3
{
  if (self->_jittering != a3)
  {
    self->_jittering = a3;
    [(CCUIContentModuleContainerViewController *)self _configureJittering];
  }
}

- (void)setUserVisibilityStatus:(unint64_t)a3
{
  if (self->_userVisibilityStatus != a3)
  {
    self->_userVisibilityStatus = a3;
    if (objc_opt_respondsToSelector())
    {
      contentViewController = self->_contentViewController;
      if (a3 == 2) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 2 * (a3 == 3);
      }
      [(CCUIContentModuleContentViewController *)contentViewController setUserVisibilityStatus:v6];
    }
  }
}

+ (void)resetEditingBorderPulseAnimationStartTime
{
  __editingBorderPulseAnimationStartTime = CACurrentMediaTime();
}

+ (double)editingBorderPulseAnimationStartTime
{
  return *(double *)&__editingBorderPulseAnimationStartTime;
}

+ (id)editingSettings
{
  if (editingSettings_onceToken[0] != -1) {
    dispatch_once(editingSettings_onceToken, &__block_literal_global_15);
  }
  double v2 = (void *)editingSettings___editingSettings;

  return v2;
}

void __59__CCUIContentModuleContainerViewController_editingSettings__block_invoke()
{
  id v2 = +[CCUIControlCenterDomain rootSettings];
  uint64_t v0 = [v2 editingSettings];
  uint64_t v1 = (void *)editingSettings___editingSettings;
  editingSettings___editingSettings = v0;
}

- (BOOL)_isForceTouchAvailable
{
  id v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  double v3 = [v2 traitCollection];
  BOOL v4 = [v3 forceTouchCapability] == 2;

  return v4;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v7 = a3;
  if ([(CCUIContentModuleContainerViewController *)self isExpanded]
    && (!v7 || [v7 state] == 3))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 contentModuleContainerViewControllerDismissPresentedContent:self];
    }
  }
}

- (void)_handleExpandModuleForTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  if (![(CCUIContentModuleContainerViewController *)self _isEffectivelyExpanded]
    && [v4 state] == 3)
  {
    [(CCUIContentModuleContainerViewController *)self expandModule];
  }
}

- (void)_configureTouchBlockingIfNecessary
{
  if ([(CCUIContentModuleContainerViewController *)self isViewLoaded])
  {
    if (self->_redirectedTapAction || [(CCUIContentModuleContainerViewController *)self isEditing])
    {
      if (!self->_touchBlockingView)
      {
        id v3 = objc_alloc(MEMORY[0x1E4F5ADD0]);
        id v4 = [(CCUIContentModuleContainerViewController *)self view];
        [v4 bounds];
        char v5 = (UIControl *)objc_msgSend(v3, "initWithFrame:");
        touchBlockingView = self->_touchBlockingView;
        self->_touchBlockingView = v5;

        [(UIControl *)self->_touchBlockingView addTarget:self action:sel__handleBlockedTap_ forControlEvents:64];
        id v7 = self->_touchBlockingView;
        [(CCUIContentModuleContainerViewController *)self _continuousCornerRadiusForCompactState];
        -[UIControl _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:");
        double v8 = [(UIControl *)self->_touchBlockingView layer];
        [v8 setHitTestsAsOpaque:1];

        [(UIView *)self->_highlightWrapperView addSubview:self->_touchBlockingView];
      }
      uint64_t v9 = 0;
    }
    else
    {
      double v11 = self->_touchBlockingView;
      if (v11)
      {
        [(UIControl *)v11 removeFromSuperview];
        CGFloat v12 = self->_touchBlockingView;
        self->_touchBlockingView = 0;
      }
      uint64_t v9 = 1;
    }
    expandModuleOnTouchTapRecognizer = self->_expandModuleOnTouchTapRecognizer;
    [(UITapGestureRecognizer *)expandModuleOnTouchTapRecognizer setEnabled:v9];
  }
}

- (void)_handleBlockedTap:(id)a3
{
}

- (void)_ensureAndConfigureEditingBorderView
{
  if (self->_editingBorderContainerView)
  {
    id v3 = [(CCUIContentModuleContainerViewController *)self view];
    id v4 = [(id)objc_opt_class() editingSettings];
    [v4 pulsingBorderWidth];
    uint64_t v6 = v5;
    [(CCUIContentModuleContainerViewController *)self _continuousCornerRadiusForCompactState];
    uint64_t v8 = v7;
    editingBorderView = self->_editingBorderView;
    if (!editingBorderView)
    {
      id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(UIView *)self->_editingBorderContainerView bounds];
      double v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
      CGFloat v12 = self->_editingBorderView;
      self->_editingBorderView = v11;

      double v13 = (void *)MEMORY[0x1E4FB1EB0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke;
      v21[3] = &unk_1E6A8A6B0;
      uint64_t v23 = v8;
      uint64_t v24 = v6;
      v21[4] = self;
      id v22 = v4;
      [v13 performWithoutAnimation:v21];
      [(CCUIContentModuleContainerViewController *)self _configureJittering];

      editingBorderView = self->_editingBorderView;
    }
    CGFloat v14 = [(UIView *)editingBorderView layer];
    double v15 = v14;
    CGFloat v16 = (void *)MEMORY[0x1E4FB1EB0];
    if (self->_resizing)
    {
      double v17 = v20;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke_2;
      v20[3] = &unk_1E6A8A6D8;
      v20[4] = v14;
      v20[5] = self;
      v20[6] = v3;
      v20[7] = v6;
      v20[8] = v8;
    }
    else
    {
      double v17 = v19;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke_3;
      v19[3] = &unk_1E6A8A700;
      v19[4] = v14;
      v19[5] = self;
      v19[7] = v6;
      v19[6] = v3;
    }
    id v18 = v3;
    [v16 performWithoutAnimation:v17];
  }
}

void __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1112) _setContinuousCornerRadius:*(double *)(a1 + 48) + *(double *)(a1 + 56)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1112);
  [*(id *)(a1 + 40) pulsingBorderMinAlpha];
  objc_msgSend(v2, "setAlpha:");
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1112) layer];
  id v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
  [v4 setCompositingFilter:v3];
}

uint64_t __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setBorderWidth:0.0];
  [*(id *)(a1 + 32) setBorderColor:0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (!*(void *)(v2 + 1120))
  {
    [*(id *)(a1 + 48) bounds];
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", *(double *)(a1 + 56), *(double *)(a1 + 56), v3, v4);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 1120);
    *(void *)(v6 + 1120) = v5;

    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1120);
    uint64_t v9 = [MEMORY[0x1E4FB1618] blackColor];
    [v8 setBackgroundColor:v9];

    [*(id *)(*(void *)(a1 + 40) + 1120) _setContinuousCornerRadius:*(double *)(a1 + 64)];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  id v10 = *(void **)(v2 + 1112);
  double v11 = [MEMORY[0x1E4FB1618] whiteColor];
  [v10 setBackgroundColor:v11];

  CGFloat v12 = *(void **)(a1 + 32);
  double v13 = [*(id *)(*(void *)(a1 + 40) + 1120) layer];
  [v12 setMask:v13];

  CGFloat v14 = *(void **)(a1 + 32);

  return [v14 setInvertsMask:1];
}

void __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setMask:0];
  [*(id *)(a1 + 32) setInvertsMask:0];
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(void **)(v2 + 1120);
  *(void *)(v2 + 1120) = 0;

  [*(id *)(*(void *)(a1 + 40) + 1112) setBackgroundColor:0];
  double v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 48) traitCollection];
  [v6 displayScale];
  [v4 setBorderWidth:v5 + 1.0 / v7];

  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_msgSend(v8, "setBorderColor:", objc_msgSend(v9, "CGColor"));
}

- (void)_configureEditingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL editing = self->_editing;
  uint64_t v6 = [(id)objc_opt_class() editingSettings];
  [v6 pulsingBorderFadeDuration];
  double v8 = v7;
  if (editing)
  {
    if (!self->_editingBorderContainerView)
    {
      id v9 = [(CCUIContentModuleContainerViewController *)self view];
      [v9 bounds];
      [v6 pulsingBorderWidth];
      UIRectInset();
      CGFloat v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v10, v11, v12, v13);
      editingBorderContainerView = self->_editingBorderContainerView;
      self->_editingBorderContainerView = v14;

      CGFloat v16 = [(UIView *)self->_editingBorderContainerView layer];
      [v16 setAllowsGroupBlending:0];

      [(CCUIContentModuleContainerViewController *)self _ensureAndConfigureEditingBorderView];
      double v17 = (void *)MEMORY[0x1E4FB1EB0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke;
      v28[3] = &unk_1E6A89BB0;
      v28[4] = self;
      id v29 = v9;
      BOOL v30 = v3;
      id v18 = v9;
      [v17 performWithoutAnimation:v28];
    }
    if (v3)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_2;
      v27[3] = &unk_1E6A898F8;
      v27[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v27 animations:v8];
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_3;
      v26[3] = &unk_1E6A898F8;
      v26[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v26];
    }
  }
  else if (v3)
  {
    unint64_t v19 = self->_editingBorderViewRemovalAnimationGeneration + 1;
    self->_editingBorderViewRemovalAnimationGeneration = v19;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_4;
    v25[3] = &unk_1E6A898F8;
    v25[4] = self;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_5;
    v24[3] = &unk_1E6A8A728;
    v24[4] = self;
    v24[5] = v19;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v25 animations:v24 completion:v7];
  }
  else
  {
    [(CCUIContentModuleContainerViewController *)self _removeEditingBorderView];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_6;
  v22[3] = &unk_1E6A89920;
  v22[4] = self;
  BOOL v23 = v3;
  double v20 = _Block_copy(v22);
  double v21 = v20;
  if (v3) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v20 animations:v8];
  }
  else {
    (*((void (**)(void *))v20 + 2))(v20);
  }
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1104) addSubview:*(void *)(*(void *)(a1 + 32) + 1112)];
  [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 1104)];
  uint64_t result = [*(id *)(a1 + 40) sendSubviewToBack:*(void *)(*(void *)(a1 + 32) + 1104)];
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1104);
    return [v3 setAlpha:0.0];
  }
  return result;
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1104) setAlpha:1.0];
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1104) setAlpha:1.0];
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1104) setAlpha:0.0];
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 1128) == *(void *)(a1 + 40) && !*(unsigned char *)(result + 977))
  {
    if (*(void *)(result + 1112)) {
      return [(id)result _removeEditingBorderView];
    }
  }
  return result;
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureContentViewControllerEditingAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_configureJittering
{
  editingBorderView = self->_editingBorderView;
  if (editingBorderView)
  {
    if (self->_jittering)
    {
      id v17 = [(id)objc_opt_class() editingSettings];
      [(id)objc_opt_class() editingBorderPulseAnimationStartTime];
      double v5 = v4;
      uint64_t v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v6 setBeginTime:v5];
      [v17 pulsingBorderPulseDuration];
      objc_msgSend(v6, "setDuration:");
      [v6 setAutoreverses:1];
      LODWORD(v7) = 2139095039;
      [v6 setRepeatCount:v7];
      double v8 = [NSNumber numberWithFloat:0.0];
      [v6 setFromValue:v8];

      id v9 = NSNumber;
      [v17 pulsingBorderMaxAlpha];
      double v11 = v10;
      [v17 pulsingBorderMinAlpha];
      double v13 = v11 - v12;
      *(float *)&double v13 = v13;
      CGFloat v14 = [v9 numberWithFloat:v13];
      [v6 setToValue:v14];

      [v6 setAdditive:1];
      double v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v6 setTimingFunction:v15];

      CGFloat v16 = [(UIView *)self->_editingBorderView layer];
      [v16 addAnimation:v6 forKey:@"CCUIContentModuleContainerEditingBorderPulseAnimationKey"];
    }
    else
    {
      id v17 = [(UIView *)editingBorderView layer];
      [v17 removeAnimationForKey:@"CCUIContentModuleContainerEditingBorderPulseAnimationKey"];
    }
  }
}

- (void)_configureContentViewControllerEditingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL editing = self->_editing;
  double v5 = self->_contentViewController;
  if (objc_opt_respondsToSelector())
  {
    [(CCUIContentModuleContentViewController *)v5 setEditing:editing animated:v3];
  }
  else if (objc_opt_respondsToSelector())
  {
    [(CCUIContentModuleContentViewController *)v5 setEditing:editing];
  }
}

- (void)_removeEditingBorderView
{
  [(UIView *)self->_editingBorderContainerView removeFromSuperview];
  editingBorderContainerView = self->_editingBorderContainerView;
  self->_editingBorderContainerView = 0;

  editingBorderView = self->_editingBorderView;
  self->_editingBorderView = 0;
}

- (void)_setDidExpandModulePreference
{
  BOOL v2 = [(CCUIContentModuleContainerViewController *)self _isForceTouchAvailable];
  BOOL v3 = +[CCUIControlCenterDefaults standardDefaults];
  id v4 = v3;
  if (v2) {
    [v3 setHasForceTouchedToExpandModule:1];
  }
  else {
    [v3 setHasLongPressedToExpandModule:1];
  }
}

- (id)_contentSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained compactModeSourceViewForContentModuleContainerViewController:self];

  return v4;
}

- (id)rootPassThroughView
{
  BOOL v2 = [(CCUIContentModuleContainerViewController *)self view];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (CGRect)_contentFrameForRestState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained compactModeFrameForContentModuleContainerViewController:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_contentBoundsForExpandedState
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(CCUIContentModuleContentViewController *)self->_contentViewController prefersExpandedContentSizeMatchesGridSize])
  {
    uint64_t v3 = [(CCUIContentModuleContainerViewController *)self delegate];
    [v3 controlCenterGridSizeForContentModuleContainerViewController:self];
    double v5 = v4;
    double v7 = v6;

    double v8 = 0.0;
    double v9 = 0.0;
  }
  else
  {
    CCUIDefaultExpandedContentModuleWidth();
    double v5 = v10;
    if (objc_opt_respondsToSelector())
    {
      [(CCUIContentModuleContentViewController *)self->_contentViewController preferredExpandedContentWidth];
      double v5 = v11;
      double v12 = [(CCUIContentModuleContainerViewController *)self view];
      [v12 bounds];
      double Width = CGRectGetWidth(v19);

      if (v5 >= Width) {
        double v5 = Width;
      }
    }
    [(CCUIContentModuleContentViewController *)self->_contentViewController preferredExpandedContentHeight];
    double v7 = v14;
    double v15 = [(CCUIContentModuleContainerViewController *)self view];
    [v15 bounds];
    double Height = CGRectGetHeight(v20);

    if (v7 >= Height) {
      double v7 = Height;
    }
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v17 = v5;
  double v18 = v7;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v8;
  result.origin.double x = v9;
  return result;
}

- (void)_updateDisplayedCompactContinuousCornerRadius
{
  if (!self->_suppressesCompactContinuousCornerRadiusUpdates)
  {
    [(CCUIContentModuleContainerViewController *)self _continuousCornerRadiusForCompactState];
    double v4 = v3;
    if (objc_opt_respondsToSelector()) {
      [(CCUIContentModuleContentViewController *)self->_contentViewController setCompactContinuousCornerRadius:v4];
    }
    [(CCUIContentModuleContentContainerView *)self->_contentContainerView setCompactContinuousCornerRadius:v4];
    [(CCUIContentModuleContentContainerView *)self->_contentContainerView updateContinuousCornerRadius];
    [(UIControl *)self->_touchBlockingView _setContinuousCornerRadius:v4];
    double v5 = [(id)objc_opt_class() editingSettings];
    [v5 pulsingBorderWidth];
    double v7 = v6;

    [(UIView *)self->_editingBorderView _setContinuousCornerRadius:v4 + v7];
    editingBorderMaskView = self->_editingBorderMaskView;
    [(UIView *)editingBorderMaskView _setContinuousCornerRadius:v4];
  }
}

- (void)setSuppressesCompactContinuousCornerRadiusUpdates:(BOOL)a3
{
  if (self->_suppressesCompactContinuousCornerRadiusUpdates != a3)
  {
    self->_suppressesCompactContinuousCornerRadiusUpdates = a3;
    if (!a3) {
      [(CCUIContentModuleContainerViewController *)self _updateDisplayedCompactContinuousCornerRadius];
    }
  }
}

- (BOOL)_isEffectivelyExpanded
{
  if ([(CCUIContentModuleContainerViewController *)self isExpanded]) {
    return 1;
  }

  return [(CCUIContentModuleContainerViewController *)self _isContentViewControllerImplicitlyExpanded];
}

- (void)_configureTouchPassThrough
{
  BOOL v3 = [(CCUIContentModuleContainerViewController *)self _isEffectivelyExpanded];
  id v4 = [(CCUIContentModuleContainerViewController *)self rootPassThroughView];
  [v4 setTouchPassThroughDisabled:!v3];
}

- (BOOL)_isContentViewControllerImplicitlyExpanded
{
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  char v3 = [(CCUIContentModuleContentViewController *)self->_contentViewController gridSizeClass];
  return ([(CCUIContentModuleContentViewController *)self->_contentViewController implicitlyExpandedGridSizeClasses] & (1 << v3)) != 0;
}

- (double)_continuousCornerRadiusForExpandedState
{
  if (objc_opt_respondsToSelector())
  {
    contentViewController = self->_contentViewController;
    [(CCUIContentModuleContentViewController *)contentViewController preferredExpandedContinuousCornerRadius];
  }
  else
  {
    MEMORY[0x1F4113070]();
  }
  return result;
}

- (CGRect)_contentFrameForExpandedState
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(CCUIContentModuleContentViewController *)self->_contentViewController shouldUseCompactContentFrameForExpandedContent])
  {
    [(CCUIContentModuleContainerViewController *)self _contentFrameForRestState];
  }
  else
  {
    [(CCUIContentModuleContainerViewController *)self _contentBoundsForExpandedState];
    [(CCUIContentModuleContainerViewController *)self _presentationFrameForExpandedState];
    UIRectCenteredIntegralRect();
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_backgroundFrameForExpandedState
{
  BOOL v2 = [(CCUIContentModuleContainerViewController *)self bs_presentationContextDefiningViewController];
  double v3 = [v2 view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_containerFrameForExpandedState
{
  if (self->_backgroundViewController) {
    [(CCUIContentModuleContainerViewController *)self _contentBoundsForExpandedState];
  }
  else {
    [(CCUIContentModuleContainerViewController *)self _contentBoundsForExpandedState];
  }
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  [(CCUIContentModuleContainerViewController *)self _contentFrameForRestState];
  v20.origin.double x = v15;
  v20.size.double height = v16;
  v20.size.double width = v17;
  v20.origin.double y = v18;
  v22.origin.double x = v7;
  v22.origin.double y = v8;
  v22.size.double width = v9;
  v22.size.double height = v10;
  CGRectUnion(v20, v22);

  UIRectCenteredIntegralRect();
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)_presentationFrameForExpandedState
{
  double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    [(CCUIContentModuleContainerViewController *)self _containerFrameForExpandedState];
    double v6 = v5;
    double y = v7;
    double v10 = v9;
    double height = v11;
    CGFloat v55 = v9;
    double v52 = v7;
    double v53 = v11;
    double v60 = v5;
    if (objc_opt_respondsToSelector())
    {
      [(CCUIContentModuleContainerViewController *)self _contentBoundsForExpandedState];
      UIRectCenteredIntegralRect();
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      -[CCUIContentModuleBackgroundViewController effectiveContentFrameForContainerFrame:](self->_backgroundViewController, "effectiveContentFrameForContainerFrame:", v6, y, v10, height);
      UIRectCenteredIntegralRect();
      v82.origin.CGFloat x = v14;
      v82.origin.double y = v16;
      v82.size.CGFloat width = v18;
      v82.size.double height = v20;
      CGRect v63 = CGRectUnion(v62, v82);
      CGFloat x = v63.origin.x;
      double y = v63.origin.y;
      CGFloat width = v63.size.width;
      double height = v63.size.height;
    }
    else
    {
      CGFloat width = v10;
      CGFloat x = v6;
    }
    CGFloat v56 = x;
    [(CCUIContentModuleContainerViewController *)self _backgroundFrameForExpandedState];
    CGRect v65 = CGRectInset(v64, 20.0, 20.0);
    CGFloat v30 = v65.origin.x;
    CGFloat v31 = v65.origin.y;
    CGFloat v32 = v65.size.width;
    CGFloat v33 = v65.size.height;
    v65.origin.CGFloat x = x;
    v65.origin.double y = y;
    v65.size.CGFloat width = width;
    v65.size.double height = height;
    CGFloat v34 = height;
    double MinX = CGRectGetMinX(v65);
    v66.origin.CGFloat x = v30;
    v66.origin.double y = v31;
    v66.size.CGFloat width = v32;
    v66.size.double height = v33;
    double v35 = y;
    double v36 = CGRectGetMinX(v66);
    CGFloat v54 = v31;
    v67.origin.CGFloat x = v30;
    v67.origin.double y = v31;
    CGFloat v58 = v32;
    CGFloat v59 = v33;
    v67.size.CGFloat width = v32;
    v67.size.double height = v33;
    double MaxX = CGRectGetMaxX(v67);
    if (v36 >= v60) {
      double v38 = v36;
    }
    else {
      double v38 = v60;
    }
    BOOL v39 = MinX < v36;
    CGFloat v40 = v35;
    if (v39) {
      double v41 = v38;
    }
    else {
      double v41 = v60;
    }
    v68.origin.CGFloat x = v56;
    v68.origin.double y = v40;
    v68.size.CGFloat width = width;
    v68.size.double height = v34;
    if (CGRectGetMaxX(v68) > MaxX)
    {
      v69.origin.CGFloat x = v56;
      v69.origin.double y = v40;
      v69.size.CGFloat width = width;
      v69.size.double height = v34;
      double v41 = v41 - (CGRectGetMaxX(v69) - MaxX);
    }
    CGFloat v61 = v41;
    v70.size.CGFloat width = width;
    v70.origin.CGFloat x = v56;
    v70.origin.double y = v40;
    v70.size.double height = v34;
    double v42 = CGRectGetHeight(v70);
    v71.origin.CGFloat x = v30;
    v71.origin.double y = v54;
    v71.size.CGFloat width = v58;
    v71.size.double height = v33;
    if (v42 >= CGRectGetHeight(v71))
    {
      v79.origin.CGFloat x = v30;
      v79.origin.double y = v54;
      v79.size.CGFloat width = v58;
      v79.size.double height = v33;
      double MinY = CGRectGetMinY(v79);
      v80.origin.CGFloat x = v30;
      v80.origin.double y = v54;
      v80.size.CGFloat width = v58;
      v80.size.double height = v33;
      double v29 = CGRectGetHeight(v80);
      CGFloat v27 = v55;
      double v23 = v41;
    }
    else
    {
      v72.origin.CGFloat x = v56;
      v72.origin.double y = v40;
      v72.size.CGFloat width = width;
      v72.size.double height = v34;
      double v43 = CGRectGetMinY(v72);
      v73.origin.CGFloat x = v30;
      v73.origin.double y = v54;
      v73.size.CGFloat width = v58;
      v73.size.double height = v33;
      double v44 = CGRectGetMinY(v73);
      v74.origin.CGFloat x = v30;
      v74.origin.double y = v54;
      v74.size.CGFloat width = v58;
      v74.size.double height = v59;
      double MaxY = CGRectGetMaxY(v74);
      double v29 = v53;
      if (v44 >= v52) {
        double v46 = v44;
      }
      else {
        double v46 = v52;
      }
      if (v43 >= v44) {
        double MinY = v52;
      }
      else {
        double MinY = v46;
      }
      v75.origin.CGFloat x = v61;
      v75.origin.double y = MinY;
      CGFloat v27 = v55;
      v75.size.CGFloat width = v55;
      v75.size.double height = v53;
      double v47 = CGRectGetMaxY(v75) - MaxY;
      if (v47 <= 0.0)
      {
        double v23 = v61;
      }
      else
      {
        v76.origin.CGFloat x = v61;
        v76.origin.double y = MinY;
        v76.size.CGFloat width = v55;
        v76.size.double height = v53;
        if (CGRectGetMinY(v76) > v44)
        {
          v77.origin.CGFloat x = v61;
          v77.origin.double y = MinY;
          v77.size.CGFloat width = v55;
          v77.size.double height = v53;
          double v48 = CGRectGetMinY(v77) - v44;
          if (v47 < v48) {
            double v48 = v47;
          }
          double MinY = MinY - v48;
          v78.origin.CGFloat x = v61;
          v78.origin.double y = MinY;
          v78.size.CGFloat width = v55;
          v78.size.double height = v53;
          double v47 = CGRectGetMaxY(v78) - MaxY;
        }
        double v23 = v61;
        double v29 = v53 - v47;
      }
    }
  }
  else
  {
    [(CCUIContentModuleContainerViewController *)self _backgroundFrameForExpandedState];
    double MinY = v24;
    CGFloat v27 = v26;
    double v29 = v28;
  }
  double v49 = MinY;
  double v50 = v27;
  double v51 = v29;
  result.size.double height = v51;
  result.size.CGFloat width = v50;
  result.origin.double y = v49;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGRect)_contentBoundsForTransitionProgress:(double)a3
{
  [(CCUIContentModuleContainerViewController *)self _contentFrameForRestState];
  UIRoundToScale();
  double v4 = v3;
  UIRoundToScale();
  double v6 = v5;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v9 = v4;
  result.size.double height = v6;
  result.size.CGFloat width = v9;
  result.origin.double y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)_configureMaskViewIfNecessary
{
  if (!self->_maskView)
  {
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    maskView = self->_maskView;
    self->_maskView = v3;

    [(UIView *)self->_maskView setUserInteractionEnabled:0];
    double v5 = [(CCUIContentModuleContainerViewController *)self view];
    [v5 addSubview:self->_maskView];

    id v6 = [(UIView *)self->_maskView layer];
    [v6 setCompositingFilter:*MEMORY[0x1E4F3A098]];
  }
}

- (void)_configureForContentModuleGroupRenderingIfNecessary
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(CCUIContentModuleContentViewController *)self->_contentViewController isGroupRenderingRequired])
  {
    [(CCUIContentModuleContainerViewController *)self _configureMaskViewIfNecessary];
  }
}

- (void)_didEndTransitionWithContentModuleContainerTransition:(id)a3 completed:(BOOL)a4
{
  self->_transitioning = 0;
  if (a4)
  {
    contentContainerView = self->_contentContainerView;
    uint64_t v5 = [a3 isAppearanceTransition];
    [(CCUIContentModuleContentContainerView *)contentContainerView didEndTransitionToExpandedMode:v5];
  }
}

- (NSArray)topLevelBlockingGestureRecognizers
{
  return self->_topLevelBlockingGestureRecognizers;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)showsSquareCorners
{
  return self->showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->showsSquareCorners = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isJittering
{
  return self->_jittering;
}

- (unint64_t)userVisibilityStatus
{
  return self->_userVisibilityStatus;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (void)setModuleIdentifier:(id)a3
{
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (CCUIContentModuleContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUIContentModuleContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (BOOL)isResizing
{
  return self->_resizing;
}

- (CGSize)maxResizeDimensions
{
  double width = self->_maxResizeDimensions.width;
  double height = self->_maxResizeDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxResizeDimensions:(CGSize)a3
{
  self->_maxResizeDimensions = a3;
}

- (CGSize)minResizeDimensions
{
  double width = self->_minResizeDimensions.width;
  double height = self->_minResizeDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinResizeDimensions:(CGSize)a3
{
  self->_minResizeDimensions = a3;
}

- (CCUIContentModule)contentModule
{
  return self->_contentModule;
}

- (void)setContentModule:(id)a3
{
}

- (CCUIContentModuleBackgroundViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (void)setBackgroundViewController:(id)a3
{
}

- (CCUIContentModuleContainerPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
}

- (BOOL)contentModuleProvidesOwnPlatter
{
  return self->_contentModuleProvidesOwnPlatter;
}

- (void)setContentModuleProvidesOwnPlatter:(BOOL)a3
{
  self->_contentModuleProvidesOwnPlatter = a3;
}

- (UIView)highlightWrapperView
{
  return self->_highlightWrapperView;
}

- (void)setHighlightWrapperView:(id)a3
{
}

- (CCUIContentModuleBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (CCUIContentModuleContentContainerView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)maskView
{
  return self->_maskView;
}

- (void)setMaskView:(id)a3
{
}

- (UIView)editingBorderContainerView
{
  return self->_editingBorderContainerView;
}

- (void)setEditingBorderContainerView:(id)a3
{
}

- (UIView)editingBorderView
{
  return self->_editingBorderView;
}

- (void)setEditingBorderView:(id)a3
{
}

- (UIView)editingBorderMaskView
{
  return self->_editingBorderMaskView;
}

- (void)setEditingBorderMaskView:(id)a3
{
}

- (unint64_t)editingBorderViewRemovalAnimationGeneration
{
  return self->_editingBorderViewRemovalAnimationGeneration;
}

- (void)setEditingBorderViewRemovalAnimationGeneration:(unint64_t)a3
{
  self->_editingBorderViewRemovalAnimationGeneration = a3;
}

- (CCUITouchPassThroughView)rootTouchPassThroughView
{
  return self->_rootTouchPassThroughView;
}

- (void)setRootTouchPassThroughView:(id)a3
{
}

- (UIControl)touchBlockingView
{
  return self->_touchBlockingView;
}

- (void)setTouchBlockingView:(id)a3
{
}

- (UIAction)redirectedTapAction
{
  return self->_redirectedTapAction;
}

- (void)setRedirectedTapAction:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (_UIClickPresentationInteraction)clickPresentationInteraction
{
  return self->_clickPresentationInteraction;
}

- (void)setClickPresentationInteraction:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UITapGestureRecognizer)expandModuleOnTouchTapRecognizer
{
  return self->_expandModuleOnTouchTapRecognizer;
}

- (void)setExpandModuleOnTouchTapRecognizer:(id)a3
{
}

- (BOOL)isAuthenticatedForExpandedModulePresentation
{
  return self->_authenticatedForExpandedModulePresentation;
}

- (void)setAuthenticatedForExpandedModulePresentation:(BOOL)a3
{
  self->_authenticatedForExpandedModulePresentation = a3;
}

- (BOOL)allowsAutomaticForwardingOfAppearanceMethods
{
  return self->_allowsAutomaticForwardingOfAppearanceMethods;
}

- (void)setAllowsAutomaticForwardingOfAppearanceMethods:(BOOL)a3
{
  self->_allowsAutomaticForwardingOfAppearanceMethods = a3;
}

- (BOOL)suppressesCompactContinuousCornerRadiusUpdates
{
  return self->_suppressesCompactContinuousCornerRadiusUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandModuleOnTouchTapRecognizer, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteraction, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_redirectedTapAction, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_rootTouchPassThroughView, 0);
  objc_storeStrong((id *)&self->_editingBorderMaskView, 0);
  objc_storeStrong((id *)&self->_editingBorderView, 0);
  objc_storeStrong((id *)&self->_editingBorderContainerView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_highlightWrapperView, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_contentModule, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);

  objc_storeStrong((id *)&self->_topLevelBlockingGestureRecognizers, 0);
}

- (void)pointerInteraction:(os_log_t)log styleForRegion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D7B17000, log, OS_LOG_TYPE_ERROR, "Pointer interaction view not in a window", v1, 2u);
}

@end