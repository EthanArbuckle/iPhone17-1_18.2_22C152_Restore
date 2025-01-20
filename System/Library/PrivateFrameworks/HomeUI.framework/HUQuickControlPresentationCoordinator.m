@interface HUQuickControlPresentationCoordinator
- (BOOL)_isRTL;
- (BOOL)_shouldCancelPresentation;
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)hasDetailsActionForQuickControlViewController:(id)a3 item:(id)a4;
- (BOOL)isActionSetTile;
- (BOOL)isCameraTile;
- (BOOL)isEditing;
- (BOOL)isQuickControlPresented;
- (BOOL)isTileOff;
- (BOOL)shouldDismissWholePresentationHierarchy;
- (CGRect)baseIconFrameInNavigationBar;
- (CGRect)iconFrameInActionSetTile;
- (CGRect)iconFrameInNavigationBar;
- (CGRect)iconFrameInTile;
- (CGRect)primaryLabelFrameInActionSetTile;
- (CGRect)primaryLabelFrameInNavigationBar;
- (CGRect)primaryLabelFrameInTile;
- (CGRect)secondaryLabelFrameInActionSetTile;
- (CGRect)secondaryLabelFrameInNavigationBar;
- (CGRect)secondaryLabelFrameInTile;
- (CGRect)sourceFrameForAnimationController;
- (CGRect)titleAndDescriptionViewFrameInActionSetTile;
- (HUBaseIconView)transitionBaseIconView;
- (HUCardViewController)cardViewController;
- (HUForceInterpolatedPressGestureRecognizer)pressGestureRecognizer;
- (HUGridActionSetTitleAndDescriptionView)transitionTitleAndDescriptionView;
- (HUGridServiceCell)pressedTile_legacy;
- (HUGridServiceCellTextView)transitionTextView;
- (HUGridServiceCellTextView)transitionTextViewVibrant;
- (HUIconView)transitionIconView;
- (HUIconView)transitionIconViewVibrant;
- (HUPressedItemContext)activePressedItemContext;
- (HUQuickControlContainerViewController)quickControlViewController;
- (HUQuickControlNavigationController)cardNavigationController;
- (HUQuickControlPresentationContext)presentationContext;
- (HUQuickControlPresentationCoordinator)initWithCornerRadius:(double)a3;
- (HUQuickControlPresentationCoordinator)initWithTargetView:(id)a3 delegate:(id)a4;
- (HUQuickControlPresentationCoordinator)initWithTargetView:(id)a3 delegate:(id)a4 cornerRadius:(double)a5;
- (HUQuickControlPresentationCoordinatorDelegate)delegate;
- (HUQuickControlPresentationTransitionDelegate)pressedTile;
- (HUTouchGestureRecognizer)touchGestureRecognizer;
- (NACancelable)pressGestureActiveTimerCancellationToken;
- (NSMapTable)pressedItemContexts;
- (NSMutableSet)mutuallyExclusiveGestureRecognizers;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UILabel)transitionPrefixLabel;
- (UILabel)transitionPrimaryLabel;
- (UILabel)transitionSecondaryLabel;
- (UINavigationController)statusDetailsNavigationController;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UITapGestureRecognizer)singleTapGestureRecognizer;
- (UITraitCollection)traitCollection;
- (UIView)pressedTileBlurEffectView;
- (UIView)pressedTilePrerenderedView;
- (UIView)targetView;
- (UIView)transitionBackgroundView;
- (UIViewController)presentingViewController;
- (UIViewController)settingsViewController;
- (UIViewController)statusDetailsViewController;
- (UIVisualEffectView)transitionBlurView;
- (UIVisualEffectView)transitionSecondaryLabelVibrantEffectView;
- (UIVisualEffectView)transitionTextViewVibrantEffectView;
- (UIVisualEffectView)transitionTitleAndDescriptionVibrantEffectView;
- (_UIClickPresentationInteraction)presentationInteraction;
- (double)cornerRadius;
- (double)quickControlViewController:(id)a3 sourceViewInitialScaleForPresentation:(BOOL)a4;
- (id)_animationControllerForDismissedController:(id)a3;
- (id)_animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_beginControlPresentationAnimated:(BOOL)a3;
- (id)_buildCardNavigationController;
- (id)_buildQuickControlViewController;
- (id)_buildSoftwareUpdateNavigationController;
- (id)_buildStatusDetailsNavigationController;
- (id)_createPressedContextForItem:(id)a3 userInitiated:(BOOL)a4;
- (id)_dismissCardViewController;
- (id)_dismissChildViewController;
- (id)_dismissQuickControlViewControllerAnimated:(BOOL)a3;
- (id)_dismissServiceDetailsViewController:(id)a3 animated:(BOOL)a4;
- (id)_legacyAnimationControllerForDismissedController:(id)a3;
- (id)_legacyAnimationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_prepareSettingsViewController;
- (id)_sheetPresentationControllerViewForTouchContinuation:(id)a3;
- (id)_viewControllerToPresent;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (id)createNavigationControllerForPresentationContext:(id)a3;
- (id)detailsViewControllerForQuickControlViewController:(id)a3 item:(id)a4;
- (id)dismissQuickControlAnimated:(BOOL)a3;
- (id)dismissQuickControlAnimated:(BOOL)a3 wasDismissed:(BOOL *)a4;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)presentQuickControlWithContext:(id)a3 animated:(BOOL)a4;
- (id)quickControlViewController:(id)a3 applierForSourceViewTransitionWithAnimationSettings:(id)a4 presenting:(BOOL)a5;
- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3;
- (unint64_t)iconSizeInActionSetTile;
- (unint64_t)iconSizeInNavigationBar;
- (unint64_t)iconSizeInTile;
- (void)__createLegacyTransitionViewsForDismissal;
- (void)__createLegacyTransitionViewsForPresentation;
- (void)__createTransitionViewsForDismissal;
- (void)__createTransitionViewsForPresentation;
- (void)_actuateTapticFeedback;
- (void)_cleanupForQuickControlDismissal;
- (void)_configureInitialStateForPressedItemContext:(id)a3 userInitiated:(BOOL)a4;
- (void)_createTransitionViewsForDismissal;
- (void)_createTransitionViewsForPresentation;
- (void)_handleDoubleTapGesture:(id)a3;
- (void)_handleMutuallyExclusiveGesture:(id)a3;
- (void)_handlePressGesture:(id)a3;
- (void)_handleSingleTapGesture:(id)a3;
- (void)_handleTouchGesture:(id)a3;
- (void)_initiateProgrammaticBounceForItem:(id)a3;
- (void)_installGestureRecognizer;
- (void)_prepareForTapticFeedback;
- (void)_preparePressedItemContextForItem:(id)a3 startApplier:(BOOL)a4;
- (void)_pressGestureDidBecomeActive;
- (void)_pressGestureDidBeginWithLocation:(CGPoint)a3;
- (void)_pressGestureDidEnd:(BOOL)a3;
- (void)_pressedStateDidEndForItem:(id)a3 clearPresentationContext:(BOOL)a4;
- (void)_restoreOriginalTile;
- (void)_updateCardController;
- (void)_updateOverrideAttributesWithScale:(double)a3 forItem:(id)a4;
- (void)_updateOverrideAttributesWithTransform:(CGAffineTransform *)a3 alpha:(double)a4 forItem:(id)a5;
- (void)_validatePresentationContext:(id)a3;
- (void)addMutuallyExclusiveGestureRecognizer:(id)a3;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)itemManager:(id)a3 didChangeSourceItem:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)playBounceForItem:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)quickControlViewControllerDidTapDetailsButton:(id)a3;
- (void)quickControlViewControllerWillDismissDetailsViewController:(id)a3 shouldDismissQuickControl:(BOOL)a4;
- (void)removeAllTransitionSubviews;
- (void)removeMutuallyExclusiveGestureRecognizer:(id)a3;
- (void)setCardNavigationController:(id)a3;
- (void)setCardViewController:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setPresentationContext:(id)a3;
- (void)setPresentationInteraction:(id)a3;
- (void)setPressGestureActiveTimerCancellationToken:(id)a3;
- (void)setPressGestureRecognizer:(id)a3;
- (void)setPressedTile:(id)a3;
- (void)setPressedTileBlurEffectView:(id)a3;
- (void)setPressedTilePrerenderedView:(id)a3;
- (void)setPressedTile_legacy:(id)a3;
- (void)setQuickControlViewController:(id)a3;
- (void)setSettingsViewController:(id)a3;
- (void)setSingleTapGestureRecognizer:(id)a3;
- (void)setStatusDetailsNavigationController:(id)a3;
- (void)setStatusDetailsViewController:(id)a3;
- (void)setTouchGestureRecognizer:(id)a3;
- (void)setTransitionBackgroundView:(id)a3;
- (void)setTransitionBaseIconView:(id)a3;
- (void)setTransitionBlurView:(id)a3;
- (void)setTransitionIconView:(id)a3;
- (void)setTransitionIconViewVibrant:(id)a3;
- (void)setTransitionPrefixLabel:(id)a3;
- (void)setTransitionPrimaryLabel:(id)a3;
- (void)setTransitionSecondaryLabel:(id)a3;
- (void)setTransitionSecondaryLabelVibrantEffectView:(id)a3;
- (void)setTransitionTextView:(id)a3;
- (void)setTransitionTextViewVibrant:(id)a3;
- (void)setTransitionTextViewVibrantEffectView:(id)a3;
- (void)setTransitionTitleAndDescriptionVibrantEffectView:(id)a3;
- (void)setTransitionTitleAndDescriptionView:(id)a3;
- (void)statusDetailsViewControllerDidFinish:(id)a3;
@end

@implementation HUQuickControlPresentationCoordinator

uint64_t __82__HUQuickControlPresentationCoordinator_initWithTargetView_delegate_cornerRadius___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareForTapticFeedback];
}

- (void)_prepareForTapticFeedback
{
  v3 = [(HUQuickControlPresentationCoordinator *)self feedbackGenerator];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:4];
    [(HUQuickControlPresentationCoordinator *)self setFeedbackGenerator:v4];

    id v5 = [(HUQuickControlPresentationCoordinator *)self feedbackGenerator];
    [v5 prepare];
  }
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (void)addMutuallyExclusiveGestureRecognizer:(id)a3
{
  id v7 = a3;
  v4 = [(HUQuickControlPresentationCoordinator *)self mutuallyExclusiveGestureRecognizers];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    v6 = [(HUQuickControlPresentationCoordinator *)self mutuallyExclusiveGestureRecognizers];
    [v6 addObject:v7];

    [v7 addTarget:self action:sel__handleMutuallyExclusiveGesture_];
  }
}

- (NSMutableSet)mutuallyExclusiveGestureRecognizers
{
  return self->_mutuallyExclusiveGestureRecognizers;
}

- (HUQuickControlPresentationCoordinator)initWithTargetView:(id)a3 delegate:(id)a4 cornerRadius:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUQuickControlPresentationCoordinator;
  v10 = [(HUQuickControlPresentationCoordinator *)&v20 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_targetView, v8);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_cornerRadius = a5;
    uint64_t v12 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    pressedItemContexts = v11->_pressedItemContexts;
    v11->_pressedItemContexts = (NSMapTable *)v12;

    uint64_t v14 = objc_opt_new();
    mutuallyExclusiveGestureRecognizers = v11->_mutuallyExclusiveGestureRecognizers;
    v11->_mutuallyExclusiveGestureRecognizers = (NSMutableSet *)v14;

    [(HUQuickControlPresentationCoordinator *)v11 _installGestureRecognizer];
    v16 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__HUQuickControlPresentationCoordinator_initWithTargetView_delegate_cornerRadius___block_invoke;
    v18[3] = &unk_1E6386018;
    v19 = v11;
    [v16 performBlock:v18];
  }
  return v11;
}

- (HUQuickControlPresentationCoordinator)initWithTargetView:(id)a3 delegate:(id)a4
{
  return [(HUQuickControlPresentationCoordinator *)self initWithTargetView:a3 delegate:a4 cornerRadius:20.0];
}

- (void)_installGestureRecognizer
{
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleDoubleTapGesture_];
    [(HUQuickControlPresentationCoordinator *)self setDoubleTapGestureRecognizer:v3];

    v4 = [(HUQuickControlPresentationCoordinator *)self doubleTapGestureRecognizer];
    [v4 setNumberOfTapsRequired:2];

    char v5 = [(HUQuickControlPresentationCoordinator *)self doubleTapGestureRecognizer];
    [v5 setName:@"doubleTapGestureRecognizer"];

    v6 = [(HUQuickControlPresentationCoordinator *)self doubleTapGestureRecognizer];
    [v6 setMaximumIntervalBetweenSuccessiveTaps:0.15];

    id v7 = [(HUQuickControlPresentationCoordinator *)self doubleTapGestureRecognizer];
    [v7 setDelegate:self];

    id v8 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
    id v9 = [(HUQuickControlPresentationCoordinator *)self doubleTapGestureRecognizer];
    [v8 addGestureRecognizer:v9];
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F430E8]) initWithDelegate:self];
    [(HUQuickControlPresentationCoordinator *)self setPresentationInteraction:v10];

    v11 = [(HUQuickControlPresentationCoordinator *)self presentationInteraction];
    uint64_t v12 = [v11 gestureRecognizerForExclusionRelationship];
    [v12 setDelegate:self];

    v13 = [(HUQuickControlPresentationCoordinator *)self presentationInteraction];
    [v13 setAllowSimultaneousRecognition:1];

    id v8 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
    id v9 = [(HUQuickControlPresentationCoordinator *)self presentationInteraction];
    [v8 addInteraction:v9];
  }

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleSingleTapGesture_];
  [(HUQuickControlPresentationCoordinator *)self setSingleTapGestureRecognizer:v14];

  v15 = [(HUQuickControlPresentationCoordinator *)self singleTapGestureRecognizer];
  [v15 setDelegate:self];

  v16 = [(HUQuickControlPresentationCoordinator *)self singleTapGestureRecognizer];
  [v16 setDelaysTouchesEnded:1];

  v17 = [(HUQuickControlPresentationCoordinator *)self singleTapGestureRecognizer];
  [v17 setName:@"singleTapGestureRecognizer"];

  v18 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
  v19 = [(HUQuickControlPresentationCoordinator *)self singleTapGestureRecognizer];
  [v18 addGestureRecognizer:v19];

  objc_super v20 = [[HUTouchGestureRecognizer alloc] initWithTarget:self action:sel__handleTouchGesture_];
  [(HUQuickControlPresentationCoordinator *)self setTouchGestureRecognizer:v20];

  v21 = [(HUQuickControlPresentationCoordinator *)self touchGestureRecognizer];
  [v21 setDelegate:self];

  v22 = [(HUQuickControlPresentationCoordinator *)self touchGestureRecognizer];
  [v22 setDelaysTouchesEnded:1];

  v23 = [(HUQuickControlPresentationCoordinator *)self touchGestureRecognizer];
  [v23 setName:@"touchGestureRecognizer"];

  id v25 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
  v24 = [(HUQuickControlPresentationCoordinator *)self touchGestureRecognizer];
  [v25 addGestureRecognizer:v24];
}

- (HUTouchGestureRecognizer)touchGestureRecognizer
{
  return self->_touchGestureRecognizer;
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->_singleTapGestureRecognizer;
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

  return (UIView *)WeakRetained;
}

- (_UIClickPresentationInteraction)presentationInteraction
{
  return self->_presentationInteraction;
}

- (void)setTouchGestureRecognizer:(id)a3
{
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
}

- (void)setPresentationInteraction:(id)a3
{
}

- (HUQuickControlPresentationCoordinator)initWithCornerRadius:(double)a3
{
  return [(HUQuickControlPresentationCoordinator *)self initWithTargetView:0 delegate:0 cornerRadius:a3];
}

- (UITraitCollection)traitCollection
{
  v3 = [(HUQuickControlPresentationCoordinator *)self delegate];
  v4 = [v3 traitCollectionForPresentationCoordinator:self];

  return (UITraitCollection *)v4;
}

- (UIViewController)presentingViewController
{
  v2 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  v3 = [v2 sourceViewController];

  return (UIViewController *)v3;
}

- (HUPressedItemContext)activePressedItemContext
{
  v3 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  v4 = [v3 item];

  if (v4)
  {
    char v5 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
    v6 = [v5 objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }

  return (HUPressedItemContext *)v6;
}

- (void)setPresentationContext:(id)a3
{
  v4 = (HUQuickControlPresentationContext *)a3;
  if (v4) {
    [(HUQuickControlPresentationCoordinator *)self _validatePresentationContext:v4];
  }
  char v5 = [(HUQuickControlPresentationContext *)self->_presentationContext itemManager];
  [v5 setDelegate:0];

  v6 = [(HUQuickControlPresentationContext *)v4 itemManager];
  [v6 setDelegate:self];

  presentationContext = self->_presentationContext;
  self->_presentationContext = v4;
}

- (void)removeMutuallyExclusiveGestureRecognizer:(id)a3
{
  id v7 = a3;
  v4 = [(HUQuickControlPresentationCoordinator *)self mutuallyExclusiveGestureRecognizers];
  int v5 = [v4 containsObject:v7];

  if (v5)
  {
    v6 = [(HUQuickControlPresentationCoordinator *)self mutuallyExclusiveGestureRecognizers];
    [v6 removeObject:v7];

    [v7 removeTarget:self action:sel__handleMutuallyExclusiveGesture_];
  }
}

- (void)setIsEditing:(BOOL)a3
{
  if (self->_isEditing != a3)
  {
    BOOL v3 = a3;
    self->_isEditing = a3;
    int v5 = [(HUQuickControlPresentationCoordinator *)self presentationInteraction];

    if (v5)
    {
      id v7 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
      v6 = [(HUQuickControlPresentationCoordinator *)self presentationInteraction];
      if (v3) {
        [v7 removeInteraction:v6];
      }
      else {
        [v7 addInteraction:v6];
      }
    }
  }
}

- (id)createNavigationControllerForPresentationContext:(id)a3
{
  [(HUQuickControlPresentationCoordinator *)self setPresentationContext:a3];

  return [(HUQuickControlPresentationCoordinator *)self _buildCardNavigationController];
}

- (void)playBounceForItem:(id)a3
{
  id v8 = a3;
  v4 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
  int v5 = [v4 objectForKey:v8];

  if (![v5 isUserInitiated] || (objc_msgSend(v5, "isActive") & 1) == 0)
  {
    if (v5)
    {
      [(HUQuickControlPresentationCoordinator *)self _configureInitialStateForPressedItemContext:v5 userInitiated:0];
    }
    else
    {
      int v5 = [(HUQuickControlPresentationCoordinator *)self _createPressedContextForItem:v8 userInitiated:0];
      v6 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
      [v6 setObject:v5 forKey:v8];

      id v7 = [v5 applier];
      [v7 start];
    }
    [(HUQuickControlPresentationCoordinator *)self _initiateProgrammaticBounceForItem:v8];
  }
}

- (void)_handleMutuallyExclusiveGesture:(id)a3
{
  if ([a3 state] == 1)
  {
    v4 = [(HUQuickControlPresentationCoordinator *)self presentationInteraction];
    int v5 = [v4 gestureRecognizerForExclusionRelationship];
    [v5 setEnabled:0];

    id v7 = [(HUQuickControlPresentationCoordinator *)self presentationInteraction];
    v6 = [v7 gestureRecognizerForExclusionRelationship];
    [v6 setEnabled:1];
  }
}

- (void)_handleSingleTapGesture:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    BOOL v5 = [(HUQuickControlPresentationCoordinator *)self isQuickControlPresented];
    v6 = HFLogForCategory();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        int v53 = 138412546;
        v54 = v9;
        __int16 v55 = 2112;
        id v56 = v4;
        v10 = "%@+Controls ignoring single tap gesture %@ because quick control is presented";
LABEL_7:
        _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v53, 0x16u);
      }
    }
    else
    {
      if (v7)
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        int v53 = 138412546;
        v54 = v13;
        __int16 v55 = 2112;
        id v56 = v4;
        _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@+Controls handling single tap gesture %@", (uint8_t *)&v53, 0x16u);
      }
      uint64_t v14 = [(HUQuickControlPresentationCoordinator *)self targetView];
      [v4 locationInView:v14];
      double v16 = v15;
      double v18 = v17;

      v19 = [(HUQuickControlPresentationCoordinator *)self delegate];
      objc_super v20 = objc_msgSend(v19, "presentationCoordinator:contextForPresentationAtPoint:", self, v16, v18);
      [(HUQuickControlPresentationCoordinator *)self setPresentationContext:v20];

      v21 = (void *)MEMORY[0x1E4F68EE0];
      uint64_t v22 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      [v21 logAndSendTileInteractionEventOfType:1 withPresentationContext:v22 presentationCoordinator:self];

      v23 = [(HUQuickControlPresentationCoordinator *)self delegate];
      LOBYTE(v22) = objc_opt_respondsToSelector();

      if (v22)
      {
        v24 = [(HUQuickControlPresentationCoordinator *)self delegate];
        id v25 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
        [v24 presentationCoordinatorSendTileInteractionEventOfType:1 withPresentationContext:v25 presentationCoordinator:self];
      }
      v26 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      v27 = [v26 item];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        +[HUEnergyAnalytics saveTapEvent:46 withInteractionType:1];
      }
      v29 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      v30 = [v29 item];
      [(HUQuickControlPresentationCoordinator *)self _preparePressedItemContextForItem:v30 startApplier:1];

      v31 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      v32 = [v31 item];
      [(HUQuickControlPresentationCoordinator *)self _initiateProgrammaticBounceForItem:v32];

      objc_opt_class();
      v33 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
      if (objc_opt_isKindOfClass()) {
        v34 = v33;
      }
      else {
        v34 = 0;
      }
      v6 = v34;

      if (v6)
      {
        v35 = -[NSObject indexPathForItemAtPoint:](v6, "indexPathForItemAtPoint:", v16, v18);
        if (v35)
        {
          v36 = [v6 cellForItemAtIndexPath:v35];
          if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
          {
            [(HUQuickControlPresentationCoordinator *)self setPressedTile_legacy:v36];
          }
          else
          {
            id v37 = v36;
            if ([v37 conformsToProtocol:&unk_1F19E3E20]) {
              v38 = v37;
            }
            else {
              v38 = 0;
            }
            id v39 = v38;

            [(HUQuickControlPresentationCoordinator *)self setPressedTile:v39];
          }
        }
      }
      v40 = [(HUQuickControlPresentationCoordinator *)self delegate];
      char v41 = objc_opt_respondsToSelector();

      if (v41)
      {
        v42 = [(HUQuickControlPresentationCoordinator *)self delegate];
        v43 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
        v44 = [v43 item];
        v45 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
        v46 = [v45 tappedArea];
        [v42 presentationCoordinator:self didRecognizeTapForItem:v44 tappedArea:v46];
      }
      v47 = [(HUQuickControlPresentationCoordinator *)self delegate];
      char v48 = objc_opt_respondsToSelector();

      if ((v48 & 1) == 0) {
        goto LABEL_31;
      }
      v49 = [(HUQuickControlPresentationCoordinator *)self delegate];
      v50 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      v51 = [v50 item];
      int v52 = [v49 presentationCoordinator:self shouldAllowTapticFeedbackForItem:v51];

      if (v52) {
LABEL_31:
      }
        [(HUQuickControlPresentationCoordinator *)self _actuateTapticFeedback];
    }
  }
  else
  {
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v11);
      int v53 = 138412546;
      v54 = v9;
      __int16 v55 = 2112;
      id v56 = v4;
      v10 = "%@+Controls ignoring single tap gesture %@ because its state isn't recognized";
      goto LABEL_7;
    }
  }
}

- (void)_handleTouchGesture:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [v24 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    BOOL v5 = [(HUQuickControlPresentationCoordinator *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      goto LABEL_13;
    }
    BOOL v7 = [(HUQuickControlPresentationCoordinator *)self delegate];
    id v8 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    id v9 = [v8 item];
    v10 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    v11 = [v10 tappedArea];
    [v7 presentationCoordinator:self touchDidEndForItem:v9 tappedArea:v11];
    goto LABEL_11;
  }
  if (v4 != 1) {
    goto LABEL_13;
  }
  objc_opt_class();
  uint64_t v12 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  double v15 = [(HUQuickControlPresentationCoordinator *)self targetView];
  [v24 locationInView:v15];
  double v17 = v16;
  double v19 = v18;

  BOOL v7 = objc_msgSend(v14, "indexPathForItemAtPoint:", v17, v19);

  if (v7)
  {
    objc_super v20 = [(HUQuickControlPresentationCoordinator *)self delegate];
    uint64_t v21 = objc_msgSend(v20, "presentationCoordinator:contextForPresentationAtPoint:", self, v17, v19);
    [(HUQuickControlPresentationCoordinator *)self setPresentationContext:v21];

    uint64_t v22 = [(HUQuickControlPresentationCoordinator *)self delegate];
    LOBYTE(v21) = objc_opt_respondsToSelector();

    if (v21)
    {
      id v8 = [(HUQuickControlPresentationCoordinator *)self delegate];
      id v9 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      v10 = [v9 item];
      v11 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      v23 = [v11 tappedArea];
      [v8 presentationCoordinator:self touchDidBeginForItem:v10 tappedArea:v23];

LABEL_11:
    }
  }

LABEL_13:
}

- (void)_handleDoubleTapGesture:(id)a3
{
  id v26 = a3;
  if ([v26 state] == 3)
  {
    uint64_t v4 = [(HUQuickControlPresentationCoordinator *)self targetView];
    [v26 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    id v9 = [(HUQuickControlPresentationCoordinator *)self delegate];
    v10 = objc_msgSend(v9, "presentationCoordinator:contextForPresentationAtPoint:", self, v6, v8);

    if (!v10)
    {
LABEL_24:

      goto LABEL_25;
    }
    [MEMORY[0x1E4F68EE0] logAndSendTileInteractionEventOfType:2 withPresentationContext:v10 presentationCoordinator:self];
    v11 = [(HUQuickControlPresentationCoordinator *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(HUQuickControlPresentationCoordinator *)self delegate];
      [v13 presentationCoordinatorSendTileInteractionEventOfType:2 withPresentationContext:v10 presentationCoordinator:self];
    }
    objc_opt_class();
    id v14 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
    if (objc_opt_isKindOfClass()) {
      double v15 = v14;
    }
    else {
      double v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      double v17 = objc_msgSend(v16, "indexPathForItemAtPoint:", v6, v8);
      if (v17)
      {
        double v18 = [v16 cellForItemAtIndexPath:v17];
        [(HUQuickControlPresentationCoordinator *)self setPressedTile_legacy:v18];
        if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
        {
          [(HUQuickControlPresentationCoordinator *)self setPressedTile_legacy:v18];
        }
        else
        {
          id v19 = v18;
          if ([v19 conformsToProtocol:&unk_1F19E3E20]) {
            objc_super v20 = v19;
          }
          else {
            objc_super v20 = 0;
          }
          id v21 = v20;

          if (![v21 recognizeDoubleClickGesture])
          {

            goto LABEL_23;
          }
          id v22 = v19;
          if ([v22 conformsToProtocol:&unk_1F19E3E20]) {
            v23 = v22;
          }
          else {
            v23 = 0;
          }
          id v24 = v23;

          [(HUQuickControlPresentationCoordinator *)self setPressedTile:v24];
        }
      }
    }
    id v25 = [(HUQuickControlPresentationCoordinator *)self presentQuickControlWithContext:v10 animated:1];
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:
}

- (void)_handlePressGesture:(id)a3
{
  id v4 = a3;
  double v5 = [(HUQuickControlPresentationCoordinator *)self targetView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [v4 state];
  if (v10 == 4)
  {
    v11 = self;
    uint64_t v12 = 0;
  }
  else
  {
    if (v10 != 3)
    {
      if (v10 == 1)
      {
        -[HUQuickControlPresentationCoordinator _pressGestureDidBeginWithLocation:](self, "_pressGestureDidBeginWithLocation:", v7, v9);
      }
      return;
    }
    v11 = self;
    uint64_t v12 = 1;
  }

  [(HUQuickControlPresentationCoordinator *)v11 _pressGestureDidEnd:v12];
}

- (void)_pressGestureDidBeginWithLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(HUQuickControlPresentationCoordinator *)self delegate];
  double v7 = objc_msgSend(v6, "presentationCoordinator:contextForPresentationAtPoint:", self, x, y);
  [(HUQuickControlPresentationCoordinator *)self setPresentationContext:v7];

  double v8 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  double v9 = [v8 item];
  [(HUQuickControlPresentationCoordinator *)self _preparePressedItemContextForItem:v9 startApplier:1];

  objc_initWeak(&location, self);
  uint64_t v10 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __75__HUQuickControlPresentationCoordinator__pressGestureDidBeginWithLocation___block_invoke;
  double v15 = &unk_1E63862A0;
  objc_copyWeak(&v16, &location);
  v11 = [v10 afterDelay:&v12 performBlock:0.15];
  -[HUQuickControlPresentationCoordinator setPressGestureActiveTimerCancellationToken:](self, "setPressGestureActiveTimerCancellationToken:", v11, v12, v13, v14, v15);

  [(HUQuickControlPresentationCoordinator *)self _prepareForTapticFeedback];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __75__HUQuickControlPresentationCoordinator__pressGestureDidBeginWithLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pressGestureDidBecomeActive];
}

- (void)_pressGestureDidBecomeActive
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(HUQuickControlPresentationCoordinator *)self mutuallyExclusiveGestureRecognizers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 isEnabled])
        {
          [v7 setEnabled:0];
          [v7 setEnabled:1];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_pressGestureDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HUQuickControlPresentationCoordinator *)self pressGestureActiveTimerCancellationToken];
  [v5 cancel];

  [(HUQuickControlPresentationCoordinator *)self setPressGestureActiveTimerCancellationToken:0];
  double v6 = [(HUQuickControlPresentationCoordinator *)self activePressedItemContext];
  if (v6)
  {
    id v26 = v6;
    double v7 = [v6 applier];
    [v7 setCompletesWhenAtRest:1];

    [v26 setActive:0];
    double v8 = CACurrentMediaTime();
    [v26 beginTime];
    double v6 = v26;
    if (v3)
    {
      double v10 = v8 - v9;
      long long v11 = (void *)MEMORY[0x1E4F68EE0];
      uint64_t v12 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      if (v10 <= 0.25)
      {
        [v11 logAndSendTileInteractionEventOfType:1 withPresentationContext:v12 presentationCoordinator:self];

        double v17 = [(HUQuickControlPresentationCoordinator *)self delegate];
        char v18 = objc_opt_respondsToSelector();

        if (v18)
        {
          id v19 = [(HUQuickControlPresentationCoordinator *)self delegate];
          objc_super v20 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
          [v19 presentationCoordinatorSendTileInteractionEventOfType:1 withPresentationContext:v20 presentationCoordinator:self];
        }
        double v15 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
        if (v15) {
          goto LABEL_12;
        }
        id v21 = [(HUQuickControlPresentationCoordinator *)self delegate];
        char v22 = objc_opt_respondsToSelector();

        double v6 = v26;
        if ((v22 & 1) == 0) {
          goto LABEL_13;
        }
        double v15 = [(HUQuickControlPresentationCoordinator *)self delegate];
        id v16 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
        v23 = [v16 item];
        id v24 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
        id v25 = [v24 tappedArea];
        [v15 presentationCoordinator:self didRecognizeTapForItem:v23 tappedArea:v25];
      }
      else
      {
        [v11 logAndSendTileInteractionEventOfType:3 withPresentationContext:v12 presentationCoordinator:self];

        uint64_t v13 = [(HUQuickControlPresentationCoordinator *)self delegate];
        char v14 = objc_opt_respondsToSelector();

        double v6 = v26;
        if ((v14 & 1) == 0) {
          goto LABEL_13;
        }
        double v15 = [(HUQuickControlPresentationCoordinator *)self delegate];
        id v16 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
        [v15 presentationCoordinatorSendTileInteractionEventOfType:3 withPresentationContext:v16 presentationCoordinator:self];
      }

LABEL_12:
      double v6 = v26;
    }
  }
LABEL_13:
}

- (id)_sheetPresentationControllerViewForTouchContinuation:(id)a3
{
  return 0;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUQuickControlPresentationCoordinator *)self targetView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [v4 view];

  long long v11 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0
    && ([(HUQuickControlPresentationCoordinator *)self delegate],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = objc_msgSend(v13, "presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:", self, v10, v7, v9), v13, !v14))
  {
    BOOL v20 = 0;
  }
  else
  {
    objc_opt_class();
    double v15 = [(HUQuickControlPresentationCoordinator *)self _gestureInstallationView];
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    if (v17)
    {
      char v18 = objc_msgSend(v17, "indexPathForItemAtPoint:", v7, v9);
      if (v18)
      {
        id v19 = [v17 cellForItemAtIndexPath:v18];
        if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
        {
          [(HUQuickControlPresentationCoordinator *)self setPressedTile_legacy:v19];
        }
        else
        {
          id v21 = v19;
          if ([v21 conformsToProtocol:&unk_1F19E3E20]) {
            char v22 = v21;
          }
          else {
            char v22 = 0;
          }
          id v23 = v22;

          [(HUQuickControlPresentationCoordinator *)self setPressedTile:v23];
        }
        id v24 = [(HUQuickControlPresentationCoordinator *)self delegate];
        uint64_t v25 = objc_msgSend(v24, "presentationCoordinator:contextForPresentationAtPoint:", self, v7, v9);
        [(HUQuickControlPresentationCoordinator *)self setPresentationContext:v25];

        id v26 = [(HUQuickControlPresentationCoordinator *)self delegate];
        LOBYTE(v25) = objc_opt_respondsToSelector();

        if ((v25 & 1) != 0
          && ([(HUQuickControlPresentationCoordinator *)self delegate],
              v27 = objc_claimAutoreleasedReturnValue(),
              [(HUQuickControlPresentationCoordinator *)self presentationContext],
              v28 = objc_claimAutoreleasedReturnValue(),
              int v29 = [v27 presentationCoordinator:self shouldBeginLongPressPresentationWithContext:v28],
              v28,
              v27,
              !v29))
        {
          BOOL v20 = 0;
        }
        else
        {
          v30 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
          v31 = [v30 item];
          [(HUQuickControlPresentationCoordinator *)self _preparePressedItemContextForItem:v31 startApplier:0];

          BOOL v20 = 1;
        }
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  return v20;
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  if (objc_msgSend(MEMORY[0x1E4F69758], "shouldUseLegacyQuickControlPresentation", a3, a4.x, a4.y))
  {
    uint64_t v5 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];

    if (!v5) {
      goto LABEL_7;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F43360]);
    uint64_t v7 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  }
  else
  {
    uint64_t v5 = [(HUQuickControlPresentationCoordinator *)self pressedTile];

    if (!v5) {
      goto LABEL_7;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F43360]);
    uint64_t v7 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  }
  double v8 = (void *)v7;
  uint64_t v5 = (void *)[v6 initWithView:v7];

LABEL_7:

  return v5;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HUQuickControlPresentationCoordinator *)self delegate];
    uint64_t v7 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    int v8 = [v6 presentationCoordinator:self shouldBeginLongPressPresentationWithContext:v7];

    if (!v8) {
      return 0;
    }
  }
  double v9 = (void *)MEMORY[0x1E4F68EE0];
  uint64_t v10 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  [v9 logAndSendTileInteractionEventOfType:3 withPresentationContext:v10 presentationCoordinator:self];

  long long v11 = [(HUQuickControlPresentationCoordinator *)self delegate];
  LOBYTE(v10) = objc_opt_respondsToSelector();

  if (v10)
  {
    char v12 = [(HUQuickControlPresentationCoordinator *)self delegate];
    uint64_t v13 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    [v12 presentationCoordinatorSendTileInteractionEventOfType:3 withPresentationContext:v13 presentationCoordinator:self];
  }
  BOOL v14 = 1;
  id v15 = [(HUQuickControlPresentationCoordinator *)self _beginControlPresentationAnimated:1];
  return v14;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  if (a4 && ![(HUQuickControlPresentationCoordinator *)self isQuickControlPresented])
  {
    char v5 = [(HUQuickControlPresentationCoordinator *)self singleTapGestureRecognizer];
    uint64_t v6 = [v5 state];

    if (v6 == 5)
    {
      id v8 = [(HUQuickControlPresentationCoordinator *)self activePressedItemContext];
      uint64_t v7 = [v8 item];
      [(HUQuickControlPresentationCoordinator *)self _updateOverrideAttributesWithScale:v7 forItem:1.0];
    }
  }
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  return 0;
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F69758], "shouldUseControlCenterMaterials", a3)) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldDismissWholePresentationHierarchy
{
  return 0;
}

- (void)_createTransitionViewsForPresentation
{
  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
  {
    [(HUQuickControlPresentationCoordinator *)self __createLegacyTransitionViewsForPresentation];
  }
  else
  {
    [(HUQuickControlPresentationCoordinator *)self __createTransitionViewsForPresentation];
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F69758];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if ([v8 shouldUseLegacyQuickControlPresentation]) {
    [(HUQuickControlPresentationCoordinator *)self _legacyAnimationControllerForPresentedController:v11 presentingController:v10 sourceController:v9];
  }
  else {
  char v12 = [(HUQuickControlPresentationCoordinator *)self _animationControllerForPresentedController:v11 presentingController:v10 sourceController:v9];
  }

  return v12;
}

- (void)_createTransitionViewsForDismissal
{
  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
  {
    [(HUQuickControlPresentationCoordinator *)self __createLegacyTransitionViewsForDismissal];
  }
  else
  {
    [(HUQuickControlPresentationCoordinator *)self __createTransitionViewsForDismissal];
  }
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F69758];
  id v5 = a3;
  if ([v4 shouldUseLegacyQuickControlPresentation]) {
    [(HUQuickControlPresentationCoordinator *)self _legacyAnimationControllerForDismissedController:v5];
  }
  else {
  uint64_t v6 = [(HUQuickControlPresentationCoordinator *)self _animationControllerForDismissedController:v5];
  }

  return v6;
}

- (void)__createTransitionViewsForPresentation
{
  [(HUQuickControlPresentationCoordinator *)self removeAllTransitionSubviews];
  BOOL v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  [v3 updateUIWithAnimation:0];

  id v4 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  id v5 = [v4 navigationBarTitleView];
  uint64_t v6 = [v5 summaryView];
  [v6 setHidden:1];

  uint64_t v7 = [MEMORY[0x1E4F428B8] clearColor];
  id v8 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  id v9 = [v8 navigationBarTitleView];
  [v9 setBackgroundColor:v7];

  id v10 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  id v11 = [v10 view];
  [v11 setAlpha:0.0];

  char v12 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v13 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  BOOL v14 = [v13 view];
  [v14 setBackgroundColor:v12];

  if (([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials] & 1) == 0)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(HUQuickControlPresentationCoordinator *)self setTransitionBackgroundView:v15];

    id v16 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    id v17 = [v16 backgroundColor];
    char v18 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
    [v18 setBackgroundColor:v17];

    id v19 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
    [v19 setHidden:1];

    BOOL v20 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
    [v20 setAlpha:1.0];

    id v21 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    [v21 tileFrame];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v30 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
    objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

    v31 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
    [v31 setNeedsLayout];

    v32 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    v33 = [v32 view];
    v34 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
    [v33 addSubview:v34];

    v35 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v36 = [v35 createBackgroundBlurView];
    [(HUQuickControlPresentationCoordinator *)self setPressedTileBlurEffectView:v36];

    id v37 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
    [v37 setHidden:1];

    v38 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
    [v38 setAlpha:1.0];

    id v39 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    [v39 tileFrame];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    char v48 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
    objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

    v49 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
    [v49 setNeedsLayout];

    v50 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    v51 = [v50 view];
    int v52 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
    [v51 insertSubview:v52 atIndex:0];
  }
  int v53 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:0.0];
  v54 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v53];
  [(HUQuickControlPresentationCoordinator *)self setTransitionBlurView:v54];

  __int16 v55 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
  [v55 setAutoresizingMask:18];

  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    id v56 = [MEMORY[0x1E4F42D90] mainScreen];
    [v56 bounds];
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    v65 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
    objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

    v66 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    v67 = [v66 view];
    v68 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
    [v67 insertSubview:v68 atIndex:0];
  }
  else
  {
    v69 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
    v70 = [v69 view];
    [v70 bounds];
    double v72 = v71;
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    v79 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
    objc_msgSend(v79, "setFrame:", v72, v74, v76, v78);

    v66 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
    v67 = [v66 tabBarController];
    v68 = [v67 view];
    v80 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
    [v68 addSubview:v80];
  }
  v81 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  v82 = [v81 closeButton];
  [v82 setAlpha:0.0];

  v83 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v84 = [v83 baseIconViewConfiguration];

  v85 = objc_alloc_init(HUBaseIconView);
  [(HUQuickControlPresentationCoordinator *)self setTransitionBaseIconView:v85];

  v86 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v86 setConfiguration:v84];

  v87 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  [v87 iconViewTileFrame];
  double v89 = v88;
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  v96 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  objc_msgSend(v96, "setFrame:", v89, v91, v93, v95);

  v97 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v97 setHidden:1];

  v98 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v98 setNeedsLayout];

  v99 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v99 layoutIfNeeded];

  v100 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  v101 = [v100 view];
  v102 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v101 addSubview:v102];

  v103 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v104 = [v103 prefixString];

  if (v104)
  {
    v105 = objc_opt_new();
    [(HUQuickControlPresentationCoordinator *)self setTransitionPrefixLabel:v105];

    v106 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v107 = [v106 prefixString];
    v108 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v108 setText:v107];

    v109 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v110 = [v109 prefixLabelFont];
    v111 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v111 setFont:v110];

    v112 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v113 = [v112 prefixLabelTextColor];
    v114 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v114 setTextColor:v113];

    v115 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    [v115 prefixLabelTileFrame];
    double v117 = v116;
    double v119 = v118;
    double v121 = v120;
    double v123 = v122;
    v124 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    objc_msgSend(v124, "setFrame:", v117, v119, v121, v123);

    v125 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v125 setNumberOfLines:1];

    v126 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v126 setHidden:1];

    v127 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v127 setAllowsDefaultTighteningForTruncation:1];

    v128 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v128 setContentMode:1];

    v129 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v129 setAlpha:1.0];

    v130 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v130 setNeedsLayout];

    v131 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    v132 = [v131 view];
    v133 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v132 addSubview:v133];
  }
  v134 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v135 = [v134 primaryString];

  if (v135)
  {
    v136 = objc_opt_new();
    [(HUQuickControlPresentationCoordinator *)self setTransitionPrimaryLabel:v136];

    v137 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v138 = [v137 primaryString];
    v139 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v139 setText:v138];

    v140 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v141 = [v140 primaryLabelFont];
    v142 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v142 setFont:v141];

    v143 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v144 = [v143 primaryLabelTextColor];
    v145 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v145 setTextColor:v144];

    v146 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    [v146 primaryLabelTileFrame];
    double v148 = v147;
    double v150 = v149;
    double v152 = v151;
    double v154 = v153;
    v155 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    objc_msgSend(v155, "setFrame:", v148, v150, v152, v154);

    v156 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v156 setNumberOfLines:0];

    v157 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v157 setHidden:1];

    v158 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v158 setAllowsDefaultTighteningForTruncation:1];

    v159 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v159 setContentMode:1];

    v160 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v160 setNeedsLayout];

    v161 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    v162 = [v161 view];
    v163 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v162 addSubview:v163];
  }
  v164 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v165 = [v164 secondaryString];
  if (v165)
  {
  }
  else
  {
    v166 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v167 = [v166 secondaryAttributedString];

    if (!v167) {
      return;
    }
  }
  v168 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
  [(HUQuickControlPresentationCoordinator *)self setTransitionSecondaryLabelVibrantEffectView:v168];

  v169 = objc_opt_new();
  [(HUQuickControlPresentationCoordinator *)self setTransitionSecondaryLabel:v169];

  v170 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v171 = [v170 secondaryString];

  v172 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v173 = v172;
  if (v171)
  {
    v174 = [v172 secondaryString];
    v175 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v175 setText:v174];
  }
  else
  {
    v174 = [v172 secondaryAttributedString];
    v175 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v175 setAttributedText:v174];
  }

  v176 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v177 = [v176 secondaryLabelFont];
  v178 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v178 setFont:v177];

  v179 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v180 = [v179 secondaryLabelTextColor];
  v181 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v181 setTextColor:v180];

  v182 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v182 setHidden:1];

  v183 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  [v183 secondaryLabelTileFrame];
  double v185 = v184;
  double v187 = v186;
  double v189 = v188;
  double v191 = v190;
  v192 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  objc_msgSend(v192, "setFrame:", v185, v187, v189, v191);

  v193 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v193 bounds];
  double v195 = v194;
  double v197 = v196;
  double v199 = v198;
  double v201 = v200;
  v202 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  objc_msgSend(v202, "setFrame:", v195, v197, v199, v201);

  v203 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v203 setHidden:1];

  v204 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v204 setNumberOfLines:0];

  v205 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v205 setAdjustsFontSizeToFitWidth:1];

  v206 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v206 setMinimumScaleFactor:0.8];

  v207 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v207 setAllowsDefaultTighteningForTruncation:1];

  v208 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v208 setContentMode:1];

  v209 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v209 sizeToFit];

  v210 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v210 setNeedsLayout];

  v211 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  v212 = [v211 contentView];
  v213 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v212 addSubview:v213];

  v214 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v214 setNeedsLayout];

  id v217 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  v215 = [v217 view];
  v216 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v215 addSubview:v216];
}

- (id)_animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  [(HUQuickControlPresentationCoordinator *)self _createTransitionViewsForPresentation];
  id v6 = objc_alloc_init(MEMORY[0x1E4F432E8]);
  [v6 setIsReversed:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v9[3] = &unk_1E6386018;
  v9[4] = self;
  [v6 setNoninteractiveAnimations:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_4;
  v8[3] = &unk_1E6386730;
  v8[4] = self;
  [v6 setNoninteractiveCompletion:v8];
  [(HUQuickControlPresentationCoordinator *)self sourceFrameForAnimationController];
  objc_msgSend(v6, "setSourceFrame:");

  return v6;
}

uint64_t __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cardViewController];
  BOOL v3 = [v2 navigationBarTitleView];
  id v4 = [v3 summaryView];
  [v4 setHidden:1];

  CAFrameRateRange v5 = [*(id *)(a1 + 32) cardNavigationController];
  uint64_t v6 = [v5 navigationBar];
  [(id)v6 setNeedsLayout];

  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 presentationCoordinatorWillBeginTransition:*(void *)(a1 + 32) presenting:1];
  }
  id v9 = [*(id *)(a1 + 32) transitionBackgroundView];
  [v9 setHidden:0];

  id v10 = [*(id *)(a1 + 32) transitionBackgroundView];
  [v10 setAlpha:0.0];

  id v11 = [*(id *)(a1 + 32) cardNavigationController];
  char v12 = [v11 view];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [*(id *)(a1 + 32) transitionBackgroundView];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  double v22 = [*(id *)(a1 + 32) cardViewController];
  double v23 = [v22 view];
  double v24 = [v23 backgroundColor];
  double v25 = [*(id *)(a1 + 32) transitionBackgroundView];
  [v25 setBackgroundColor:v24];

  double v26 = [*(id *)(a1 + 32) transitionBackgroundView];
  [v26 layoutIfNeeded];

  double v27 = [*(id *)(a1 + 32) cardViewController];
  double v28 = [v27 view];
  [v28 setAlpha:1.0];

  double v29 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
  [v29 setHidden:0];

  v30 = [*(id *)(a1 + 32) cardNavigationController];
  v31 = [v30 view];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v40 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  double v41 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
  [v41 layoutIfNeeded];

  double v42 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:20.0];
  double v43 = [*(id *)(a1 + 32) transitionBlurView];
  [v43 setEffect:v42];

  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_3;
  v134[3] = &unk_1E6386018;
  v134[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F42FF0] animateKeyframesWithDuration:0 delay:v134 options:0 animations:0.5 completion:0.115];
  double v44 = [*(id *)(a1 + 32) transitionBaseIconView];
  [v44 setHidden:0];

  [*(id *)(a1 + 32) baseIconFrameInNavigationBar];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  int v53 = [*(id *)(a1 + 32) transitionBaseIconView];
  objc_msgSend(v53, "setFrame:", v46, v48, v50, v52);

  v54 = [*(id *)(a1 + 32) transitionBaseIconView];
  [v54 startTransitionToTargetViewState:3];

  __int16 v55 = [*(id *)(a1 + 32) transitionBaseIconView];
  [v55 layoutIfNeeded];

  id v56 = [*(id *)(a1 + 32) transitionPrefixLabel];
  [v56 setHidden:0];

  double v57 = [*(id *)(a1 + 32) transitionPrefixLabel];
  [v57 setAlpha:0.0];

  double v58 = [*(id *)(a1 + 32) cardViewController];
  double v59 = [v58 navigationBarTitleView];
  double v60 = [v59 summaryView];
  double v61 = [v60 primaryLabel];
  double v62 = [v61 font];
  double v63 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v63 setFont:v62];

  double v64 = [*(id *)(a1 + 32) cardViewController];
  v65 = [v64 navigationBarTitleView];
  v66 = [v65 summaryView];
  v67 = [v66 primaryLabel];
  v68 = [v67 text];
  v69 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v69 setText:v68];

  v70 = [*(id *)(a1 + 32) cardViewController];
  double v71 = [v70 navigationBarTitleView];
  double v72 = [v71 summaryView];
  double v73 = [v72 primaryLabel];
  double v74 = [v73 textColor];
  double v75 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v75 setTextColor:v74];

  double v76 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v76 setHidden:0];

  [*(id *)(a1 + 32) primaryLabelFrameInNavigationBar];
  double v78 = v77;
  double v80 = v79;
  double v82 = v81;
  double v84 = v83;
  v85 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  objc_msgSend(v85, "setFrame:", v78, v80, v82, v84);

  v86 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v86 layoutIfNeeded];

  v87 = [*(id *)(a1 + 32) cardViewController];
  double v88 = [v87 navigationBarTitleView];
  double v89 = [v88 summaryView];
  double v90 = [v89 secondaryLabel];
  double v91 = [v90 font];
  double v92 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v92 setFont:v91];

  double v93 = [*(id *)(a1 + 32) cardViewController];
  double v94 = [v93 navigationBarTitleView];
  double v95 = [v94 summaryView];
  v96 = [v95 secondaryLabel];
  v97 = [v96 textColor];
  v98 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v98 setTextColor:v97];

  v99 = [*(id *)(a1 + 32) cardViewController];
  v100 = [v99 navigationBarTitleView];
  v101 = [v100 summaryView];
  v102 = [v101 secondaryLabel];
  v103 = [v102 text];

  v104 = [*(id *)(a1 + 32) cardViewController];
  v105 = [v104 navigationBarTitleView];
  v106 = [v105 summaryView];
  v107 = [v106 secondaryLabel];
  v108 = v107;
  if (v103)
  {
    v109 = [v107 text];
    v110 = [*(id *)(a1 + 32) transitionSecondaryLabel];
    [v110 setText:v109];
  }
  else
  {
    v109 = [v107 attributedText];
    v110 = [*(id *)(a1 + 32) transitionSecondaryLabel];
    [v110 setAttributedText:v109];
  }

  v111 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v111 setHidden:0];

  [*(id *)(a1 + 32) secondaryLabelFrameInNavigationBar];
  double v113 = v112;
  double v115 = v114;
  double v117 = v116;
  double v119 = v118;
  double v120 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  objc_msgSend(v120, "setFrame:", v113, v115, v117, v119);

  double v121 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v121 layoutIfNeeded];

  double v122 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v122 setHidden:0];

  double v123 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v123 bounds];
  double v125 = v124;
  double v127 = v126;
  double v129 = v128;
  double v131 = v130;
  v132 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  objc_msgSend(v132, "setFrame:", v125, v127, v129, v131);

  v133 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v133 layoutIfNeeded];
}

void __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardViewController];
  v1 = [v2 closeButton];
  [v1 setAlpha:1.0];
}

uint64_t __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardViewController];
  BOOL v3 = [v2 navigationBarTitleView];
  id v4 = [v3 summaryView];
  [v4 setHidden:0];

  CAFrameRateRange v5 = *(void **)(a1 + 32);

  return [v5 removeAllTransitionSubviews];
}

- (void)__createTransitionViewsForDismissal
{
  [(HUQuickControlPresentationCoordinator *)self removeAllTransitionSubviews];
  BOOL v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  [v3 updateUIWithAnimation:0];

  id v4 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  [v4 setHidden:1];

  id v5 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(HUQuickControlPresentationCoordinator *)self setTransitionBackgroundView:v5];

  uint64_t v6 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  uint64_t v7 = [v6 backgroundColor];
  id v8 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
  [v8 setBackgroundColor:v7];

  id v9 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
  [v9 setHidden:1];

  id v10 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
  [v10 setAlpha:0.0];

  id v11 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  char v12 = [v11 view];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  double v22 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
  [v22 setNeedsLayout];

  double v23 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v24 = [v23 view];
  double v25 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
  [v24 addSubview:v25];

  double v26 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  double v27 = [v26 createBackgroundBlurView];
  [(HUQuickControlPresentationCoordinator *)self setPressedTileBlurEffectView:v27];

  double v28 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
  [v28 setHidden:1];

  double v29 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
  [v29 setAlpha:1.0];

  v30 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  v31 = [v30 view];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v40 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  double v41 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
  [v41 setNeedsLayout];

  double v42 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v43 = [v42 view];
  double v44 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
  [v43 insertSubview:v44 atIndex:0];

  double v45 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  double v46 = [v45 baseIconViewConfiguration];

  uint64_t v47 = [v46 appearance];
  [v46 setAppearance:3];
  double v48 = objc_alloc_init(HUBaseIconView);
  [(HUQuickControlPresentationCoordinator *)self setTransitionBaseIconView:v48];

  double v49 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v49 setConfiguration:v46];

  double v50 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v50 prepareForTransitionToTargetViewState:v47];

  [(HUQuickControlPresentationCoordinator *)self baseIconFrameInNavigationBar];
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v59 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  objc_msgSend(v59, "setFrame:", v52, v54, v56, v58);

  double v60 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v60 setHidden:1];

  double v61 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v61 setNeedsLayout];

  double v62 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v63 = [v62 view];
  double v64 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v63 addSubview:v64];

  v65 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v66 = [v65 prefixString];

  if (v66)
  {
    v67 = objc_opt_new();
    [(HUQuickControlPresentationCoordinator *)self setTransitionPrefixLabel:v67];

    v68 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v69 = [v68 prefixString];
    v70 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v70 setText:v69];

    double v71 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    double v72 = [v71 prefixLabelFont];
    double v73 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v73 setFont:v72];

    double v74 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    double v75 = [v74 prefixLabelTextColor];
    double v76 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v76 setTextColor:v75];

    double v77 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    [v77 prefixLabelTileFrame];
    double v79 = v78;
    double v81 = v80;
    double v83 = v82;
    double v85 = v84;
    v86 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    objc_msgSend(v86, "setFrame:", v79, v81, v83, v85);

    v87 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v87 setNumberOfLines:1];

    double v88 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v88 setHidden:1];

    double v89 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v89 setContentMode:1];

    double v90 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v90 setAlpha:0.0];

    double v91 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v91 setNeedsLayout];

    double v92 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v93 = [v92 view];
    double v94 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
    [v93 addSubview:v94];
  }
  double v95 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v96 = [v95 primaryString];

  if (v96)
  {
    v97 = objc_opt_new();
    [(HUQuickControlPresentationCoordinator *)self setTransitionPrimaryLabel:v97];

    v98 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    v99 = [v98 navigationBarTitleView];
    v100 = [v99 summaryView];
    v101 = [v100 primaryLabel];
    v102 = [v101 font];
    v103 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v103 setFont:v102];

    v104 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    v105 = [v104 navigationBarTitleView];
    v106 = [v105 summaryView];
    v107 = [v106 primaryLabel];
    v108 = [v107 text];
    v109 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v109 setText:v108];

    v110 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    v111 = [v110 navigationBarTitleView];
    double v112 = [v111 summaryView];
    double v113 = [v112 primaryLabel];
    double v114 = [v113 textColor];
    double v115 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v115 setTextColor:v114];

    double v116 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v116 setNumberOfLines:0];

    [(HUQuickControlPresentationCoordinator *)self primaryLabelFrameInNavigationBar];
    double v118 = v117;
    double v120 = v119;
    double v122 = v121;
    double v124 = v123;
    double v125 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    objc_msgSend(v125, "setFrame:", v118, v120, v122, v124);

    double v126 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v126 setHidden:1];

    double v127 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v127 setContentMode:1];

    double v128 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v128 sizeToFit];

    double v129 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v129 setNeedsLayout];

    double v130 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v131 = [v130 view];
    v132 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v131 addSubview:v132];
  }
  v133 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  v134 = [v133 secondaryString];
  if (v134)
  {
  }
  else
  {
    v135 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    v136 = [v135 secondaryAttributedString];

    if (!v136) {
      return;
    }
  }
  v137 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
  [(HUQuickControlPresentationCoordinator *)self setTransitionSecondaryLabelVibrantEffectView:v137];

  id v138 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUQuickControlPresentationCoordinator *)self setTransitionSecondaryLabel:v138];

  v139 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  v140 = [v139 navigationBarTitleView];
  v141 = [v140 summaryView];
  v142 = [v141 secondaryLabel];
  v143 = [v142 font];
  v144 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v144 setFont:v143];

  v145 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  v146 = [v145 navigationBarTitleView];
  double v147 = [v146 summaryView];
  double v148 = [v147 secondaryLabel];
  double v149 = [v148 textColor];
  double v150 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v150 setTextColor:v149];

  double v151 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v152 = [v151 navigationBarTitleView];
  double v153 = [v152 summaryView];
  double v154 = [v153 secondaryLabel];
  v155 = [v154 text];

  v156 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  v157 = [v156 navigationBarTitleView];
  v158 = [v157 summaryView];
  v159 = [v158 secondaryLabel];
  v160 = v159;
  if (v155)
  {
    v161 = [v159 text];
    v162 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v162 setText:v161];
  }
  else
  {
    v161 = [v159 attributedText];
    v162 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v162 setAttributedText:v161];
  }

  v163 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v163 setHidden:1];

  [(HUQuickControlPresentationCoordinator *)self secondaryLabelFrameInNavigationBar];
  double v165 = v164;
  double v167 = v166;
  double v169 = v168;
  double v171 = v170;
  v172 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  objc_msgSend(v172, "setFrame:", v165, v167, v169, v171);

  v173 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v173 setNumberOfLines:1];

  v174 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v174 setAllowsDefaultTighteningForTruncation:1];

  v175 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v175 setAdjustsFontSizeToFitWidth:1];

  +[HUGridServiceCellTextView minimumDescriptionScaleFactor];
  double v177 = v176;
  v178 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v178 setMinimumScaleFactor:v177];

  v179 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v179 sizeToFit];

  v180 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v180 bounds];
  double v182 = v181;
  double v184 = v183;
  double v186 = v185;
  double v188 = v187;
  double v189 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  objc_msgSend(v189, "setFrame:", v182, v184, v186, v188);

  double v190 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v190 setNeedsLayout];

  double v191 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  v192 = [v191 contentView];
  v193 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v192 addSubview:v193];

  double v194 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v194 setNeedsLayout];

  id v197 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v195 = [v197 view];
  double v196 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v195 addSubview:v196];
}

- (id)_animationControllerForDismissedController:(id)a3
{
  id v4 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  id v5 = [v4 viewControllers];
  uint64_t v6 = [v5 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = 0;
  }
  else
  {
    [(HUQuickControlPresentationCoordinator *)self _createTransitionViewsForDismissal];
    id v8 = objc_alloc_init(MEMORY[0x1E4F432E8]);
    [v8 setIsReversed:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke;
    v11[3] = &unk_1E6386018;
    v11[4] = self;
    [v8 setNoninteractiveAnimations:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_4;
    v10[3] = &unk_1E6386730;
    v10[4] = self;
    [v8 setNoninteractiveCompletion:v10];
    [(HUQuickControlPresentationCoordinator *)self sourceFrameForAnimationController];
    objc_msgSend(v8, "setSourceFrame:");
  }

  return v8;
}

uint64_t __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardNavigationController];
  BOOL v3 = [v2 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  CAFrameRateRange v5 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v6 = [v5 cardViewController];
    uint64_t v7 = [v6 scrollView];
    [v7 setShowsVerticalScrollIndicator:0];

    id v8 = [*(id *)(a1 + 32) cardViewController];
    id v9 = [v8 navigationBarTitleView];
    id v10 = [v9 summaryView];
    [v10 setHidden:1];

    id v11 = [*(id *)(a1 + 32) cardViewController];
    char v12 = [v11 quickControlViewController];
    double v13 = [v12 controlContainerView];
    [v13 setHidden:1];
  }
  else
  {
    double v14 = [v5 cardNavigationController];
    double v15 = [v14 topViewController];
    double v16 = [v15 view];
    [v16 setHidden:1];

    id v11 = [*(id *)(a1 + 32) cardNavigationController];
    char v12 = [v11 navigationBar];
    [v12 setHidden:1];
  }

  double v17 = [*(id *)(a1 + 32) delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    double v19 = [*(id *)(a1 + 32) delegate];
    [v19 presentationCoordinatorWillBeginTransition:*(void *)(a1 + 32) presenting:0];
  }
  double v20 = [*(id *)(a1 + 32) cardViewController];
  id v21 = [v20 view];
  [v21 setAlpha:0.0];

  double v22 = [*(id *)(a1 + 32) cardViewController];
  double v23 = [v22 navigationItem];
  [v23 _setManualScrollEdgeAppearanceProgress:0.0];

  double v24 = [MEMORY[0x1E4F428B8] clearColor];
  double v25 = [*(id *)(a1 + 32) cardViewController];
  [v25 setBackgroundColor:v24];

  double v26 = [MEMORY[0x1E4F428B8] clearColor];
  double v27 = [*(id *)(a1 + 32) cardNavigationController];
  double v28 = [v27 view];
  [v28 setBackgroundColor:v26];

  double v29 = [*(id *)(a1 + 32) transitionBackgroundView];
  [v29 setHidden:0];

  v30 = [*(id *)(a1 + 32) pressedTile];
  [v30 tileFrame];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v39 = [*(id *)(a1 + 32) transitionBackgroundView];
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  double v40 = [*(id *)(a1 + 32) transitionBackgroundView];
  [v40 setAlpha:1.0];

  double v41 = [*(id *)(a1 + 32) pressedTile];
  double v42 = [v41 backgroundColor];
  double v43 = [*(id *)(a1 + 32) transitionBackgroundView];
  [v43 setBackgroundColor:v42];

  double v44 = [*(id *)(a1 + 32) transitionBackgroundView];
  [v44 layoutIfNeeded];

  double v45 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
  [v45 setHidden:0];

  double v46 = [*(id *)(a1 + 32) pressedTile];
  [v46 tileFrame];
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v55 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
  objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

  double v56 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
  [v56 setNeedsLayout];

  double v57 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:0.0];
  double v58 = [*(id *)(a1 + 32) transitionBlurView];
  [v58 setEffect:v57];

  v137[0] = MEMORY[0x1E4F143A8];
  v137[1] = 3221225472;
  v137[2] = __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_3;
  v137[3] = &unk_1E6386018;
  v137[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F42FF0] animateKeyframesWithDuration:0 delay:v137 options:0 animations:0.1 completion:0.0];
  double v59 = [*(id *)(a1 + 32) transitionBaseIconView];
  [v59 setHidden:0];

  double v60 = [*(id *)(a1 + 32) pressedTile];
  double v61 = [v60 baseIconViewConfiguration];

  double v62 = [*(id *)(a1 + 32) transitionBaseIconView];
  objc_msgSend(v62, "startTransitionToTargetViewState:", objc_msgSend(v61, "appearance"));

  double v63 = [*(id *)(a1 + 32) pressedTile];
  [v63 iconViewTileFrame];
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  double v71 = v70;
  double v72 = [*(id *)(a1 + 32) transitionBaseIconView];
  objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

  double v73 = [*(id *)(a1 + 32) transitionBaseIconView];
  [v73 layoutIfNeeded];

  double v74 = [*(id *)(a1 + 32) transitionPrefixLabel];
  [v74 setHidden:0];

  double v75 = [*(id *)(a1 + 32) transitionPrefixLabel];
  [v75 setAlpha:1.0];

  double v76 = [*(id *)(a1 + 32) pressedTile];
  double v77 = [v76 primaryLabelFont];
  double v78 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v78 setFont:v77];

  double v79 = [*(id *)(a1 + 32) pressedTile];
  double v80 = [v79 primaryLabelTextColor];
  double v81 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v81 setTextColor:v80];

  double v82 = [*(id *)(a1 + 32) pressedTile];
  double v83 = [v82 primaryString];
  double v84 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v84 setText:v83];

  double v85 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v85 setHidden:0];

  v86 = [*(id *)(a1 + 32) pressedTile];
  [v86 primaryLabelTileFrame];
  double v88 = v87;
  double v90 = v89;
  double v92 = v91;
  double v94 = v93;
  double v95 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

  v96 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v96 layoutIfNeeded];

  v97 = [*(id *)(a1 + 32) pressedTile];
  v98 = [v97 secondaryString];
  if (v98)
  {
  }
  else
  {
    v99 = [*(id *)(a1 + 32) pressedTile];
    v100 = [v99 secondaryAttributedString];

    if (!v100) {
      return;
    }
  }
  v101 = [*(id *)(a1 + 32) pressedTile];
  v102 = [v101 secondaryLabelFont];
  v103 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v103 setFont:v102];

  v104 = [*(id *)(a1 + 32) pressedTile];
  v105 = [v104 secondaryLabelTextColor];
  v106 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v106 setTextColor:v105];

  v107 = [*(id *)(a1 + 32) pressedTile];
  v108 = [v107 secondaryString];

  v109 = [*(id *)(a1 + 32) pressedTile];
  v110 = v109;
  if (v108)
  {
    v111 = [v109 secondaryString];
    double v112 = [*(id *)(a1 + 32) transitionSecondaryLabel];
    [v112 setText:v111];
  }
  else
  {
    v111 = [v109 secondaryAttributedString];
    double v112 = [*(id *)(a1 + 32) transitionSecondaryLabel];
    [v112 setAttributedText:v111];
  }

  double v113 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v113 setHidden:0];

  double v114 = [*(id *)(a1 + 32) pressedTile];
  [v114 secondaryLabelTileFrame];
  double v116 = v115;
  double v118 = v117;
  double v120 = v119;
  double v122 = v121;
  double v123 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  objc_msgSend(v123, "setFrame:", v116, v118, v120, v122);

  double v124 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v124 layoutIfNeeded];

  double v125 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v125 setHidden:0];

  double v126 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v126 bounds];
  double v128 = v127;
  double v130 = v129;
  double v132 = v131;
  double v134 = v133;
  v135 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  objc_msgSend(v135, "setFrame:", v128, v130, v132, v134);

  v136 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v136 layoutIfNeeded];
}

void __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardViewController];
  v1 = [v2 closeButton];
  [v1 setAlpha:0.0];
}

void __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pressedTile];
  [v2 setHidden:0];

  [*(id *)(a1 + 32) setPressedTile:0];
  BOOL v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    CAFrameRateRange v5 = [*(id *)(a1 + 32) delegate];
    [v5 presentationCoordinatorWillEndTransition:*(void *)(a1 + 32) presenting:0];
  }
  [*(id *)(a1 + 32) removeAllTransitionSubviews];
  [*(id *)(a1 + 32) _restoreOriginalTile];
  id v6 = [*(id *)(a1 + 32) transitionBlurView];
  [v6 removeFromSuperview];
}

- (void)__createLegacyTransitionViewsForPresentation
{
  [(HUQuickControlPresentationCoordinator *)self removeAllTransitionSubviews];
  BOOL v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  [v3 updateUIWithAnimation:0];

  char v4 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  CAFrameRateRange v5 = [v4 navigationBarTitleView];
  id v6 = [v5 summaryView];
  [v6 setHidden:1];

  uint64_t v7 = [MEMORY[0x1E4F428B8] clearColor];
  id v8 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  id v9 = [v8 navigationBarTitleView];
  [v9 setBackgroundColor:v7];

  if ([(HUQuickControlPresentationCoordinator *)self isTileOff])
  {
    if (+[HUGraphicsUtilities shouldReduceVisualEffects])
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
      [(HUQuickControlPresentationCoordinator *)self setPressedTileBlurEffectView:v10];

      id v11 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
      char v12 = [v11 gridBackgroundView];

      double v13 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      double v14 = [v13 view];
      [v14 frame];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v23 = [(HUQuickControlPresentationCoordinator *)self pressedTilePrerenderedView];
      objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

      double v24 = [v12 layer];
      [v24 contentsRect];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v33 = [(HUQuickControlPresentationCoordinator *)self pressedTilePrerenderedView];
      double v34 = [v33 layer];
      objc_msgSend(v34, "setContentsRect:", v26, v28, v30, v32);

      double v35 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      double v36 = [v35 view];
      double v37 = [(HUQuickControlPresentationCoordinator *)self pressedTilePrerenderedView];
      [v36 insertSubview:v37 atIndex:0];
    }
    else
    {
      if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
      {
        if ([MEMORY[0x1E4F69138] isSpringBoard]) {
          [MEMORY[0x1E4F5AE10] controlCenterModuleBackgroundMaterial];
        }
        else {
        double v38 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
        }
        [(HUQuickControlPresentationCoordinator *)self setPressedTileBlurEffectView:v38];
      }
      else
      {
        double v38 = [MEMORY[0x1E4F427D8] effectWithStyle:1202];
        double v39 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v38];
        [(HUQuickControlPresentationCoordinator *)self setPressedTileBlurEffectView:v39];
      }
      double v40 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
      [v40 setHidden:1];

      double v41 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
      [v41 setAlpha:1.0];

      double v42 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      double v43 = [v42 view];
      [v43 frame];
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v52 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
      objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

      double v53 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
      [v53 setNeedsLayout];

      char v12 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      double v35 = [v12 view];
      double v36 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
      [v35 insertSubview:v36 atIndex:0];
    }

    double v54 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    double v55 = [v54 view];
    [v55 setAlpha:0.0];

    double v56 = [MEMORY[0x1E4F428B8] clearColor];
    double v57 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v58 = [v57 view];
    [v58 setBackgroundColor:v56];
  }
  double v59 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:0.0];
  double v60 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v59];
  [(HUQuickControlPresentationCoordinator *)self setTransitionBlurView:v60];

  double v61 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
  [v61 setAutoresizingMask:18];

  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    double v62 = [MEMORY[0x1E4F42D90] mainScreen];
    [v62 bounds];
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;
    double v71 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
    objc_msgSend(v71, "setFrame:", v64, v66, v68, v70);

    double v72 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v73 = [v72 view];
    double v74 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
    [v73 insertSubview:v74 atIndex:0];
  }
  else
  {
    double v75 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
    double v76 = [v75 view];
    [v76 bounds];
    double v78 = v77;
    double v80 = v79;
    double v82 = v81;
    double v84 = v83;
    double v85 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
    objc_msgSend(v85, "setFrame:", v78, v80, v82, v84);

    double v72 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
    double v73 = [v72 tabBarController];
    double v74 = [v73 view];
    v86 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
    [v74 addSubview:v86];
  }
  double v87 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v88 = [v87 closeButton];
  [v88 setAlpha:0.0];

  id v89 = objc_alloc_init(MEMORY[0x1E4F6A428]);
  [(HUQuickControlPresentationCoordinator *)self setTransitionIconView:v89];

  double v90 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  uint64_t v91 = 1;
  [v90 setContentMode:1];

  double v92 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v93 = [v92 item];
  double v94 = [v93 latestResults];
  double v95 = [v94 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];

  if ([(HUQuickControlPresentationCoordinator *)self isTileOff])
  {
    if ([(HUQuickControlPresentationCoordinator *)self isActionSetTile]) {
      uint64_t v91 = 1;
    }
    else {
      uint64_t v91 = 3;
    }
  }
  v96 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v96 updateWithIconDescriptor:v95 displayStyle:v91 animated:0];

  if ([(HUQuickControlPresentationCoordinator *)self isActionSetTile])
  {
    unint64_t v97 = [(HUQuickControlPresentationCoordinator *)self iconSizeInActionSetTile];
    v98 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
    [v98 setIconSize:v97];

    [(HUQuickControlPresentationCoordinator *)self iconFrameInActionSetTile];
  }
  else
  {
    unint64_t v103 = [(HUQuickControlPresentationCoordinator *)self iconSizeInTile];
    v104 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
    [v104 setIconSize:v103];

    [(HUQuickControlPresentationCoordinator *)self iconFrameInTile];
  }
  double v105 = v99;
  double v106 = v100;
  double v107 = v101;
  double v108 = v102;
  v109 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  objc_msgSend(v109, "setFrame:", v105, v106, v107, v108);

  v110 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v110 setHidden:1];

  v111 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v112 = [v111 view];
  double v113 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v112 addSubview:v113];

  id v114 = objc_alloc_init(MEMORY[0x1E4F6A428]);
  [(HUQuickControlPresentationCoordinator *)self setTransitionIconViewVibrant:v114];

  double v115 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v115 setContentMode:1];

  if ([(HUQuickControlPresentationCoordinator *)self isActionSetTile])
  {
    unint64_t v116 = [(HUQuickControlPresentationCoordinator *)self iconSizeInActionSetTile];
    double v117 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
    [v117 setIconSize:v116];

    [(HUQuickControlPresentationCoordinator *)self iconFrameInActionSetTile];
  }
  else
  {
    unint64_t v122 = [(HUQuickControlPresentationCoordinator *)self iconSizeInTile];
    double v123 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
    [v123 setIconSize:v122];

    [(HUQuickControlPresentationCoordinator *)self iconFrameInTile];
  }
  double v124 = v118;
  double v125 = v119;
  double v126 = v120;
  double v127 = v121;
  double v128 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  objc_msgSend(v128, "setFrame:", v124, v125, v126, v127);

  double v129 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v129 setHidden:1];

  double v130 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v131 = [v130 navigationBarTitleView];
  double v132 = [v131 summaryView];
  double v133 = [v132 iconView];
  double v134 = [v133 tintColor];
  v135 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v135 setTintColor:v134];

  v136 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  v137 = [v136 navigationBarTitleView];
  id v138 = [v137 summaryView];
  v139 = [v138 iconView];
  v140 = [v139 tintColor];
  v141 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v141 setTintColor:v140];

  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    v142 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
    v143 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
    [v143 setVibrancyEffect:v142];
  }
  else
  {
    v142 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
    v143 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v142 style:4];
    v144 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
    [v144 setVibrancyEffect:v143];
  }
  v145 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v145 updateWithIconDescriptor:v95 displayStyle:2 animated:0];

  v146 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v146 layoutIfNeeded];

  double v147 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v147 layoutIfNeeded];

  double v148 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v149 = [v148 view];
  double v150 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  double v151 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v149 insertSubview:v150 above:v151];

  double v152 = objc_opt_new();
  [(HUQuickControlPresentationCoordinator *)self setTransitionPrimaryLabel:v152];

  LODWORD(v148) = [(HUQuickControlPresentationCoordinator *)self isActionSetTile];
  double v153 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v154 = v153;
  if (v148)
  {
    v155 = [v153 titleAndDescriptionView];
    v156 = [v155 titleLabel];
    v157 = [v156 font];
    v158 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v158 setFont:v157];

    v159 = [v154 titleAndDescriptionView];
    v160 = [v159 titleLabel];
    v161 = [v160 text];
    v162 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v162 setText:v161];

    [(HUQuickControlPresentationCoordinator *)self primaryLabelFrameInActionSetTile];
    double v164 = v163;
    double v166 = v165;
    double v168 = v167;
    double v170 = v169;
    double v171 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    objc_msgSend(v171, "setFrame:", v164, v166, v168, v170);
  }
  else
  {
    v172 = [v153 serviceTextView];
    v173 = [v172 font];
    v174 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v174 setFont:v173];

    v175 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    double v176 = [v175 item];
    double v177 = [v176 latestResults];
    v178 = [v177 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    v179 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    [v179 setText:v178];

    [(HUQuickControlPresentationCoordinator *)self primaryLabelFrameInTile];
    double v181 = v180;
    double v183 = v182;
    double v185 = v184;
    double v187 = v186;
    double v154 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
    objc_msgSend(v154, "setFrame:", v181, v183, v185, v187);
  }

  double v188 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
  [v188 setHidden:1];

  double v189 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
  [v189 setNumberOfLines:2];

  double v190 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
  [v190 setContentMode:1];

  double v191 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  v192 = [v191 view];
  v193 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
  [v192 addSubview:v193];

  double v194 = objc_opt_new();
  [(HUQuickControlPresentationCoordinator *)self setTransitionSecondaryLabel:v194];

  LODWORD(v192) = [(HUQuickControlPresentationCoordinator *)self isActionSetTile];
  double v195 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v196 = v195;
  if (v192)
  {
    id v197 = [v195 titleAndDescriptionView];
    double v198 = [v197 descriptionLabel];
    double v199 = [v198 font];
    double v200 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v200 setFont:v199];

    double v201 = [v196 titleAndDescriptionView];
    v202 = [v201 descriptionLabel];
    v203 = [v202 text];
    v204 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v204 setText:v203];

    v205 = [v196 titleAndDescriptionView];
    v206 = [v205 descriptionLabel];
    v207 = [v206 textColor];
    v208 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v208 setTextColor:v207];

    [(HUQuickControlPresentationCoordinator *)self secondaryLabelFrameInActionSetTile];
    double v210 = v209;
    double v212 = v211;
    double v214 = v213;
    double v216 = v215;
    id v217 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    objc_msgSend(v217, "setFrame:", v210, v212, v214, v216);
  }
  else
  {
    v218 = [v195 coloredDescriptionLabel];
    v219 = [v218 font];
    v220 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v220 setFont:v219];

    v221 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    v222 = [v221 coloredDescriptionLabel];
    v223 = [v222 text];
    v224 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v224 setText:v223];

    v225 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    v226 = [v225 coloredDescriptionLabel];
    v227 = [v226 textColor];
    v228 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v228 setTextColor:v227];

    [(HUQuickControlPresentationCoordinator *)self secondaryLabelFrameInTile];
    double v230 = v229;
    double v232 = v231;
    double v234 = v233;
    double v236 = v235;
    double v196 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    objc_msgSend(v196, "setFrame:", v230, v232, v234, v236);
  }

  v237 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v237 setHidden:1];

  v238 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v238 setNumberOfLines:0];

  v239 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v239 setContentMode:1];

  v240 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v240 sizeToFit];

  v241 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
  [(HUQuickControlPresentationCoordinator *)self setTransitionSecondaryLabelVibrantEffectView:v241];

  if ([(HUQuickControlPresentationCoordinator *)self isTileOff])
  {
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v242 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
      v243 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
      [v243 setEffect:v242];
    }
    else
    {
      v242 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
      v243 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v242 style:2];
      v244 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
      [v244 setEffect:v243];
    }
  }
  v245 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v245 setHidden:1];

  [(HUQuickControlPresentationCoordinator *)self secondaryLabelFrameInTile];
  double v247 = v246;
  double v249 = v248;
  double v251 = v250;
  double v253 = v252;
  v254 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  objc_msgSend(v254, "setFrame:", v247, v249, v251, v253);

  v255 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v255 bounds];
  double v257 = v256;
  double v259 = v258;
  double v261 = v260;
  double v263 = v262;
  v264 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  objc_msgSend(v264, "setFrame:", v257, v259, v261, v263);

  v265 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v265 setNeedsLayout];

  v266 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v266 setNeedsLayout];

  v267 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  v268 = [v267 contentView];
  v269 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v268 addSubview:v269];

  id v272 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  v270 = [v272 view];
  v271 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v270 addSubview:v271];
}

- (id)_legacyAnimationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  [(HUQuickControlPresentationCoordinator *)self _createTransitionViewsForPresentation];
  id v6 = objc_alloc_init(MEMORY[0x1E4F432E8]);
  [v6 setIsReversed:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v9[3] = &unk_1E6386018;
  v9[4] = self;
  [v6 setNoninteractiveAnimations:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_4;
  v8[3] = &unk_1E6386730;
  v8[4] = self;
  [v6 setNoninteractiveCompletion:v8];
  [(HUQuickControlPresentationCoordinator *)self sourceFrameForAnimationController];
  objc_msgSend(v6, "setSourceFrame:");

  return v6;
}

uint64_t __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardViewController];
  BOOL v3 = [v2 navigationBarTitleView];
  char v4 = [v3 summaryView];
  [v4 setHidden:1];

  CAFrameRateRange v5 = [*(id *)(a1 + 32) cardNavigationController];
  uint64_t v6 = [v5 navigationBar];
  [(id)v6 setNeedsLayout];

  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 presentationCoordinatorWillBeginTransition:*(void *)(a1 + 32) presenting:1];
  }
  id v9 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
  [v9 setHidden:0];

  if ([*(id *)(a1 + 32) isTileOff])
  {
    id v10 = [*(id *)(a1 + 32) cardNavigationController];
    id v11 = [v10 view];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    double v21 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
    [v21 layoutIfNeeded];

    double v22 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
    [v22 setAlpha:0.0];
  }
  double v23 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:20.0];
  double v24 = [*(id *)(a1 + 32) transitionBlurView];
  [v24 setEffect:v23];

  double v25 = [*(id *)(a1 + 32) cardViewController];
  double v26 = [v25 view];
  [v26 setAlpha:1.0];

  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_3;
  v123[3] = &unk_1E6386018;
  v123[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F42FF0] animateKeyframesWithDuration:0 delay:v123 options:0 animations:0.5 completion:0.115];
  double v27 = [*(id *)(a1 + 32) transitionIconView];
  [v27 setHidden:0];

  uint64_t v28 = [*(id *)(a1 + 32) iconSizeInNavigationBar];
  double v29 = [*(id *)(a1 + 32) transitionIconView];
  [v29 setIconSize:v28];

  [*(id *)(a1 + 32) iconFrameInNavigationBar];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v38 = [*(id *)(a1 + 32) transitionIconView];
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  double v39 = [*(id *)(a1 + 32) transitionIconView];
  [v39 layoutIfNeeded];

  if ([*(id *)(a1 + 32) isTileOff])
  {
    double v40 = [*(id *)(a1 + 32) transitionIconViewVibrant];
    [v40 setHidden:0];

    uint64_t v41 = [*(id *)(a1 + 32) iconSizeInNavigationBar];
    double v42 = [*(id *)(a1 + 32) transitionIconViewVibrant];
    [v42 setIconSize:v41];

    [*(id *)(a1 + 32) iconFrameInNavigationBar];
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v51 = [*(id *)(a1 + 32) transitionIconViewVibrant];
    objc_msgSend(v51, "setFrame:", v44, v46, v48, v50);

    double v52 = [*(id *)(a1 + 32) transitionIconViewVibrant];
    [v52 layoutIfNeeded];
  }
  int v53 = [MEMORY[0x1E4F69758] shouldUseControlCenterMaterials];
  double v54 = *(void **)(a1 + 32);
  if (v53)
  {
    double v55 = [v54 transitionIconView];
    [v55 setAlpha:0.0];

    double v56 = [*(id *)(a1 + 32) transitionIconViewVibrant];
    double v57 = v56;
    double v58 = 1.0;
  }
  else
  {
    double v56 = [v54 transitionIconViewVibrant];
    double v57 = v56;
    double v58 = 0.0;
  }
  [v56 setAlpha:v58];

  double v59 = [*(id *)(a1 + 32) cardViewController];
  double v60 = [v59 navigationBarTitleView];
  double v61 = [v60 summaryView];
  double v62 = [v61 primaryLabel];
  double v63 = [v62 font];
  double v64 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v64 setFont:v63];

  double v65 = [*(id *)(a1 + 32) cardViewController];
  double v66 = [v65 navigationBarTitleView];
  double v67 = [v66 summaryView];
  double v68 = [v67 primaryLabel];
  double v69 = [v68 text];
  double v70 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v70 setText:v69];

  double v71 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v71 setHidden:0];

  [*(id *)(a1 + 32) primaryLabelFrameInNavigationBar];
  double v73 = v72;
  double v75 = v74;
  double v77 = v76;
  double v79 = v78;
  double v80 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  objc_msgSend(v80, "setFrame:", v73, v75, v77, v79);

  double v81 = [*(id *)(a1 + 32) transitionPrimaryLabel];
  [v81 layoutIfNeeded];

  double v82 = [*(id *)(a1 + 32) cardViewController];
  double v83 = [v82 navigationBarTitleView];
  double v84 = [v83 summaryView];
  double v85 = [v84 secondaryLabel];
  v86 = [v85 font];
  double v87 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v87 setFont:v86];

  double v88 = [*(id *)(a1 + 32) cardViewController];
  id v89 = [v88 navigationBarTitleView];
  double v90 = [v89 summaryView];
  uint64_t v91 = [v90 secondaryLabel];
  double v92 = [v91 text];
  double v93 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v93 setText:v92];

  double v94 = [*(id *)(a1 + 32) cardViewController];
  double v95 = [v94 navigationBarTitleView];
  v96 = [v95 summaryView];
  unint64_t v97 = [v96 secondaryLabel];
  v98 = [v97 textColor];
  double v99 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v99 setTextColor:v98];

  double v100 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v100 setHidden:0];

  double v101 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v101 setHidden:0];

  [*(id *)(a1 + 32) secondaryLabelFrameInNavigationBar];
  double v103 = v102;
  double v105 = v104;
  double v107 = v106;
  double v109 = v108;
  v110 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  objc_msgSend(v110, "setFrame:", v103, v105, v107, v109);

  v111 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v111 bounds];
  double v113 = v112;
  double v115 = v114;
  double v117 = v116;
  double v119 = v118;
  double v120 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  objc_msgSend(v120, "setFrame:", v113, v115, v117, v119);

  double v121 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v121 layoutIfNeeded];

  unint64_t v122 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v122 layoutIfNeeded];
}

void __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardViewController];
  v1 = [v2 closeButton];
  [v1 setAlpha:1.0];
}

uint64_t __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardViewController];
  BOOL v3 = [v2 navigationBarTitleView];
  char v4 = [v3 summaryView];
  [v4 setHidden:0];

  CAFrameRateRange v5 = *(void **)(a1 + 32);

  return [v5 removeAllTransitionSubviews];
}

- (void)__createLegacyTransitionViewsForDismissal
{
  v298[2] = *MEMORY[0x1E4F143B8];
  [(HUQuickControlPresentationCoordinator *)self removeAllTransitionSubviews];
  BOOL v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  [v3 updateUIWithAnimation:0];

  unint64_t v4 = 0x1E4F42000uLL;
  if ([(HUQuickControlPresentationCoordinator *)self isTileOff])
  {
    if (+[HUGraphicsUtilities shouldReduceVisualEffects])
    {
      CAFrameRateRange v5 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
      [(HUQuickControlPresentationCoordinator *)self setPressedTileBlurEffectView:v5];

      uint64_t v6 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
      uint64_t v7 = [v6 gridBackgroundView];

      id v8 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      id v9 = [v8 view];
      [v9 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v18 = [(HUQuickControlPresentationCoordinator *)self pressedTilePrerenderedView];
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

      double v19 = [v7 layer];
      [v19 contentsRect];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      uint64_t v28 = [(HUQuickControlPresentationCoordinator *)self pressedTilePrerenderedView];
      double v29 = [v28 layer];
      objc_msgSend(v29, "setContentsRect:", v21, v23, v25, v27);

      double v30 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      double v31 = [v30 view];
      double v32 = [(HUQuickControlPresentationCoordinator *)self pressedTilePrerenderedView];
      [v31 insertSubview:v32 atIndex:0];
    }
    else
    {
      if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
      {
        if ([MEMORY[0x1E4F69138] isSpringBoard]) {
          [MEMORY[0x1E4F5AE10] controlCenterModuleBackgroundMaterial];
        }
        else {
        double v35 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
        }
        [(HUQuickControlPresentationCoordinator *)self setPressedTileBlurEffectView:v35];
      }
      else
      {
        double v35 = [MEMORY[0x1E4F427D8] effectWithStyle:1202];
        double v36 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v35];
        [(HUQuickControlPresentationCoordinator *)self setPressedTileBlurEffectView:v36];
      }
      double v37 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
      [v37 setHidden:1];

      double v38 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      double v39 = [v38 view];
      [v39 frame];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      double v48 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
      objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

      uint64_t v7 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      double v30 = [v7 view];
      double v31 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
      [v30 insertSubview:v31 atIndex:0];
    }
  }
  else
  {
    if (![MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
      goto LABEL_14;
    }
    double v33 = [MEMORY[0x1E4F428B8] clearColor];
    double v34 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    [v34 setBackgroundColor:v33];

    uint64_t v7 = [MEMORY[0x1E4F428B8] clearColor];
    double v30 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v31 = [v30 view];
    [v31 setBackgroundColor:v7];
  }

LABEL_14:
  id v49 = objc_alloc_init(MEMORY[0x1E4F6A428]);
  [(HUQuickControlPresentationCoordinator *)self setTransitionIconView:v49];

  double v50 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v51 = [v50 item];
  double v52 = [v51 latestResults];
  int v53 = [v52 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];

  double v54 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v54 setContentMode:1];

  unint64_t v55 = [(HUQuickControlPresentationCoordinator *)self iconSizeInNavigationBar];
  double v56 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v56 setIconSize:v55];

  [(HUQuickControlPresentationCoordinator *)self iconFrameInNavigationBar];
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  double v65 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

  double v66 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v66 setHidden:1];

  double v67 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  double v68 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v69 = [v68 navigationBarTitleView];
  double v70 = [v69 summaryView];
  double v71 = [v70 iconView];
  objc_msgSend(v67, "updateWithIconDescriptor:displayStyle:animated:", v53, objc_msgSend(v71, "displayStyle"), 0);

  double v72 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v73 = [v72 view];
  double v74 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v73 addSubview:v74];

  unint64_t v75 = 0x1E4F69000uLL;
  id v76 = objc_alloc_init(MEMORY[0x1E4F6A428]);
  [(HUQuickControlPresentationCoordinator *)self setTransitionIconViewVibrant:v76];

  double v77 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v77 setContentMode:1];

  unint64_t v78 = [(HUQuickControlPresentationCoordinator *)self iconSizeInNavigationBar];
  double v79 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v79 setIconSize:v78];

  [(HUQuickControlPresentationCoordinator *)self iconFrameInNavigationBar];
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  double v88 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  objc_msgSend(v88, "setFrame:", v81, v83, v85, v87);

  id v89 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v89 setHidden:1];

  double v90 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v91 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v91 setTintColor:v90];

  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    if ([MEMORY[0x1E4F69138] isHomeControlService])
    {
      double v92 = (void *)MEMORY[0x1E4F428C0];
      double v93 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      double v94 = [v92 colorEffectMonochromeTint:v93 blendingAmount:1.0 brightnessAdjustment:0.45];

      double v95 = (void *)MEMORY[0x1E4F43020];
      v298[0] = v94;
      v96 = [MEMORY[0x1E4F42FE8] controlCenterPrimaryVibrancyEffect];
      v298[1] = v96;
      unint64_t v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v298 count:2];
      v98 = [v95 effectCombiningEffects:v97];
      double v99 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
      [v99 setVibrancyEffect:v98];

      goto LABEL_20;
    }
    double v94 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
    double v100 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
    [v100 setVibrancyEffect:v94];
  }
  else
  {
    double v94 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
    double v100 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v94 style:4];
    double v101 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
    [v101 setVibrancyEffect:v100];
  }
LABEL_20:

  double v102 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v102 updateWithIconDescriptor:v53 displayStyle:2 animated:0];

  double v103 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v104 = [v103 view];
  double v105 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  double v106 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v104 insertSubview:v105 below:v106];

  double v107 = off_1E6381000;
  if ([(HUQuickControlPresentationCoordinator *)self isActionSetTile])
  {
    double v108 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    uint64_t v109 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
    BOOL v110 = [(HUQuickControlPresentationCoordinator *)self isTileOff];
    id v111 = objc_alloc(MEMORY[0x1E4F43028]);
    double v112 = v111;
    v297 = (void *)v109;
    if (v110)
    {
      double v113 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v109 style:4];
      double v114 = (void *)[v112 initWithEffect:v113];
      [(HUQuickControlPresentationCoordinator *)self setTransitionTitleAndDescriptionVibrantEffectView:v114];
    }
    else
    {
      double v113 = (void *)[v111 initWithEffect:0];
      [(HUQuickControlPresentationCoordinator *)self setTransitionTitleAndDescriptionVibrantEffectView:v113];
    }

    [(HUQuickControlPresentationCoordinator *)self titleAndDescriptionViewFrameInActionSetTile];
    double v172 = v171;
    double v174 = v173;
    double v176 = v175;
    double v178 = v177;
    v179 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionVibrantEffectView];
    objc_msgSend(v179, "setFrame:", v172, v174, v176, v178);

    [(HUQuickControlPresentationCoordinator *)self primaryLabelFrameInNavigationBar];
    double v181 = v180;
    [(HUQuickControlPresentationCoordinator *)self primaryLabelFrameInNavigationBar];
    double v183 = v182;
    double v184 = [v108 titleAndDescriptionView];
    [v184 frame];
    double v186 = v185;
    double v187 = [v108 titleAndDescriptionView];
    [v187 frame];
    double v189 = v188;

    double v190 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v191 = [v190 view];
    v192 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionVibrantEffectView];
    [v191 addSubview:v192];

    v193 = [HUGridActionSetTitleAndDescriptionView alloc];
    double v194 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionVibrantEffectView];
    double v195 = [v194 contentView];
    double v196 = -[HUGridActionSetTitleAndDescriptionView initWithFrame:titleLabelSuperview:](v193, "initWithFrame:titleLabelSuperview:", v195, v181, v183, v186, v189);
    [(HUQuickControlPresentationCoordinator *)self setTransitionTitleAndDescriptionView:v196];

    id v197 = [v108 sceneCellLayoutOptions];
    uint64_t v198 = [v197 numberOfTitleLines];
    double v199 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionView];
    double v200 = [v199 titleLabel];
    [v200 setNumberOfLines:v198];

    [v197 titleDescriptionLineSpacing];
    double v202 = v201;
    v203 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionView];
    [v203 setTitleDescriptionLineSpacing:v202];

    v204 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionView];
    v205 = [v108 titleAndDescriptionView];
    v206 = [v205 titleLabel];
    v207 = [v206 attributedText];
    v208 = [v108 titleAndDescriptionView];
    double v209 = [v208 descriptionLabel];
    double v210 = [v209 attributedText];
    [v204 updateTitleText:v207 descriptionText:v210];

    double v211 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionView];
    [v211 setHidden:1];

    double v212 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionVibrantEffectView];
    [v212 setHidden:1];

    double v213 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v214 = [v213 view];
    double v215 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionView];
    [v214 addSubview:v215];

    unint64_t v4 = 0x1E4F42000;
    unint64_t v75 = 0x1E4F69000;
    double v107 = off_1E6381000;
    double v216 = v297;
  }
  else
  {
    double v115 = objc_alloc_init(HUGridServiceCellTextView);
    [(HUQuickControlPresentationCoordinator *)self setTransitionTextView:v115];

    double v116 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    uint64_t v117 = [v116 shouldShowRoomName];
    double v118 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v118 setShouldShowRoomName:v117];

    double v119 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    double v120 = [v119 serviceTextView];
    [v120 lineHeight];
    double v122 = v121;
    double v123 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v123 setLineHeight:v122];

    double v124 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    double v125 = [v124 serviceTextView];
    double v126 = [v125 font];
    double v127 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v127 setFont:v126];

    double v128 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    double v129 = [v128 serviceTextView];
    double v130 = [v129 serviceNameComponents];
    double v131 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v131 setServiceNameComponents:v130];

    [(HUQuickControlPresentationCoordinator *)self primaryLabelFrameInNavigationBar];
    double v133 = v132;
    [(HUQuickControlPresentationCoordinator *)self primaryLabelFrameInNavigationBar];
    double v135 = v134;
    v136 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    v137 = [v136 serviceTextView];
    [v137 frame];
    double v139 = v138;
    v140 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    v141 = [v140 serviceTextView];
    [v141 frame];
    double v143 = v142;
    v144 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    objc_msgSend(v144, "setFrame:", v133, v135, v139, v143);

    v145 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v145 setHidden:1];

    v146 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v146 setNeedsLayout];

    double v147 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v148 = [v147 view];
    double v149 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v148 addSubview:v149];

    double v150 = objc_alloc_init(HUGridServiceCellTextView);
    [(HUQuickControlPresentationCoordinator *)self setTransitionTextViewVibrant:v150];

    double v151 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    uint64_t v152 = [v151 shouldShowRoomName];
    double v153 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrant];
    [v153 setShouldShowRoomName:v152];

    double v154 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    v155 = [v154 serviceTextView];
    [v155 lineHeight];
    double v157 = v156;
    v158 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrant];
    [v158 setLineHeight:v157];

    v159 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    v160 = [v159 serviceTextView];
    v161 = [v160 font];
    v162 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrant];
    [v162 setFont:v161];

    double v163 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    double v164 = [v163 serviceTextView];
    double v165 = [v164 serviceNameComponents];
    double v166 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrant];
    [v166 setServiceNameComponents:v165];

    double v167 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrant];
    [v167 sizeToFit];

    double v168 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    [(HUQuickControlPresentationCoordinator *)self setTransitionTextViewVibrantEffectView:v168];

    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      double v169 = [MEMORY[0x1E4F42FE8] controlCenterPrimaryVibrancyEffect];
      double v170 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrantEffectView];
      [v170 setEffect:v169];
    }
    else
    {
      double v169 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
      double v170 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v169 style:4];
      id v217 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrantEffectView];
      [v217 setEffect:v170];
    }
    v218 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v218 frame];
    double v220 = v219;
    double v222 = v221;
    double v224 = v223;
    double v226 = v225;
    v227 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrantEffectView];
    objc_msgSend(v227, "setFrame:", v220, v222, v224, v226);

    v228 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrantEffectView];
    [v228 bounds];
    double v230 = v229;
    double v232 = v231;
    double v234 = v233;
    double v236 = v235;
    v237 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrant];
    objc_msgSend(v237, "setFrame:", v230, v232, v234, v236);

    v238 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrantEffectView];
    [v238 setHidden:1];

    v239 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrantEffectView];
    v240 = [v239 contentView];
    v241 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrant];
    [v240 addSubview:v241];

    double v108 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v216 = [v108 view];
    id v197 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrantEffectView];
    double v213 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
    [v216 insertSubview:v197 below:v213];
  }

  if (![(HUQuickControlPresentationCoordinator *)self isActionSetTile])
  {
    id v242 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUQuickControlPresentationCoordinator *)self setTransitionSecondaryLabel:v242];

    v243 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v243 setNumberOfLines:1];

    if (![(HUQuickControlPresentationCoordinator *)self isTileOff]) {
      goto LABEL_33;
    }
    v244 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    v245 = [v244 serviceTextView];
    double v246 = [v245 descriptionText];

    if (v246)
    {
      double v247 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
      double v248 = [v247 serviceTextView];
      double v249 = [v248 font];
      double v250 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
      [v250 setFont:v249];

      double v251 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
      double v252 = [v251 serviceTextView];
      double v253 = [v252 descriptionText];
      v254 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
      [v254 setText:v253];
    }
    else
    {
LABEL_33:
      v255 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
      double v256 = [v255 coloredDescriptionLabel];
      double v257 = [v256 attributedText];
      double v258 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
      [v258 setAttributedText:v257];

      double v251 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
      double v252 = [v251 coloredDescriptionLabel];
      double v253 = [v252 textColor];
      v254 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
      [v254 setTextColor:v253];
    }

    double v259 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v259 setAllowsDefaultTighteningForTruncation:1];

    double v260 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v260 setAdjustsFontSizeToFitWidth:1];

    [(__objc2_class *)v107[296] minimumDescriptionScaleFactor];
    double v262 = v261;
    double v263 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v263 setMinimumScaleFactor:v262];

    v264 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v264 sizeToFit];

    v265 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    [(HUQuickControlPresentationCoordinator *)self setTransitionSecondaryLabelVibrantEffectView:v265];

    if ([(HUQuickControlPresentationCoordinator *)self isTileOff])
    {
      if ([*(id *)(v75 + 1880) shouldUseControlCenterMaterials])
      {
        v266 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
        v267 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
        [v267 setEffect:v266];
      }
      else
      {
        v266 = [*(id *)(v4 + 2008) effectWithStyle:7];
        v267 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v266 style:2];
        v268 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
        [v268 setEffect:v267];
      }
    }
    v269 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
    [v269 setHidden:1];

    [(HUQuickControlPresentationCoordinator *)self secondaryLabelFrameInNavigationBar];
    double v271 = v270;
    double v273 = v272;
    double v275 = v274;
    double v277 = v276;
    v278 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
    objc_msgSend(v278, "setFrame:", v271, v273, v275, v277);

    v279 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
    [v279 bounds];
    double v281 = v280;
    double v283 = v282;
    double v285 = v284;
    double v287 = v286;
    v288 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    objc_msgSend(v288, "setFrame:", v281, v283, v285, v287);

    v289 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v289 setNeedsLayout];

    v290 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
    [v290 setNeedsLayout];

    v291 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
    v292 = [v291 contentView];
    v293 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
    [v292 addSubview:v293];

    v294 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    v295 = [v294 view];
    v296 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
    [v295 addSubview:v296];
  }
}

- (id)_legacyAnimationControllerForDismissedController:(id)a3
{
  unint64_t v4 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  CAFrameRateRange v5 = [v4 viewControllers];
  uint64_t v6 = [v5 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = 0;
  }
  else
  {
    [(HUQuickControlPresentationCoordinator *)self _createTransitionViewsForDismissal];
    id v8 = objc_alloc_init(MEMORY[0x1E4F432E8]);
    [v8 setIsReversed:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke;
    v11[3] = &unk_1E6386018;
    v11[4] = self;
    [v8 setNoninteractiveAnimations:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_4;
    v10[3] = &unk_1E6386730;
    v10[4] = self;
    [v8 setNoninteractiveCompletion:v10];
    [(HUQuickControlPresentationCoordinator *)self sourceFrameForAnimationController];
    objc_msgSend(v8, "setSourceFrame:");
  }

  return v8;
}

uint64_t __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardNavigationController];
  BOOL v3 = [v2 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  CAFrameRateRange v5 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v6 = [v5 cardViewController];
    uint64_t v7 = [v6 scrollView];
    [v7 setShowsVerticalScrollIndicator:0];

    id v8 = [*(id *)(a1 + 32) cardViewController];
    id v9 = [v8 navigationBarTitleView];
    double v10 = [v9 summaryView];
    [v10 setHidden:1];

    double v11 = [*(id *)(a1 + 32) cardViewController];
    double v12 = [v11 quickControlViewController];
    double v13 = [v12 controlContainerView];
    [v13 setHidden:1];
  }
  else
  {
    double v14 = [v5 cardNavigationController];
    double v15 = [v14 topViewController];
    double v16 = [v15 view];
    [v16 setHidden:1];

    double v11 = [*(id *)(a1 + 32) cardNavigationController];
    double v12 = [v11 navigationBar];
    [v12 setHidden:1];
  }

  double v17 = [*(id *)(a1 + 32) delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    double v19 = [*(id *)(a1 + 32) delegate];
    [v19 presentationCoordinatorWillBeginTransition:*(void *)(a1 + 32) presenting:0];
  }
  double v20 = objc_msgSend(*(id *)(a1 + 32), "pressedTile_legacy");
  uint64_t v21 = [v20 backgroundState];

  if (v21 == 1)
  {
    double v22 = [MEMORY[0x1E4F428B8] whiteColor];
    double v23 = [*(id *)(a1 + 32) cardViewController];
    [v23 setBackgroundColor:v22];

    [MEMORY[0x1E4F428B8] whiteColor];
  }
  else
  {
    double v24 = [MEMORY[0x1E4F428B8] clearColor];
    double v25 = [*(id *)(a1 + 32) cardViewController];
    [v25 setBackgroundColor:v24];

    [MEMORY[0x1E4F428B8] clearColor];
  double v26 = };
  double v27 = [*(id *)(a1 + 32) cardNavigationController];
  uint64_t v28 = [v27 view];
  [v28 setBackgroundColor:v26];

  double v29 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
  [v29 setHidden:0];

  if ([*(id *)(a1 + 32) isTileOff])
  {
    double v30 = [*(id *)(a1 + 32) cardNavigationController];
    double v31 = [v30 view];
    [v31 frame];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v40 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

    double v41 = [*(id *)(a1 + 32) pressedTileBlurEffectView];
    [v41 setNeedsLayout];
  }
  double v42 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:0.0];
  double v43 = [*(id *)(a1 + 32) transitionBlurView];
  [v43 setEffect:v42];

  double v44 = [*(id *)(a1 + 32) cardViewController];
  double v45 = [v44 view];
  [v45 setAlpha:0.0];

  double v46 = [*(id *)(a1 + 32) cardViewController];
  double v47 = [v46 navigationItem];
  [v47 _setManualScrollEdgeAppearanceProgress:0.0];

  v159[0] = MEMORY[0x1E4F143A8];
  v159[1] = 3221225472;
  v159[2] = __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_3;
  v159[3] = &unk_1E6386018;
  v159[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F42FF0] animateKeyframesWithDuration:0 delay:v159 options:0 animations:0.1 completion:0.0];
  double v48 = [*(id *)(a1 + 32) transitionIconView];
  [v48 setHidden:0];

  int v49 = [*(id *)(a1 + 32) isActionSetTile];
  double v50 = *(void **)(a1 + 32);
  if (v49)
  {
    uint64_t v51 = [v50 iconSizeInActionSetTile];
    double v52 = [*(id *)(a1 + 32) transitionIconView];
    [v52 setIconSize:v51];

    [*(id *)(a1 + 32) iconFrameInActionSetTile];
  }
  else
  {
    uint64_t v57 = [v50 iconSizeInTile];
    double v58 = [*(id *)(a1 + 32) transitionIconView];
    [v58 setIconSize:v57];

    [*(id *)(a1 + 32) iconFrameInTile];
  }
  double v59 = v53;
  double v60 = v54;
  double v61 = v55;
  double v62 = v56;
  double v63 = [*(id *)(a1 + 32) transitionIconView];
  objc_msgSend(v63, "setFrame:", v59, v60, v61, v62);

  double v64 = [*(id *)(a1 + 32) transitionIconView];
  [v64 setNeedsLayout];

  if ([*(id *)(a1 + 32) isTileOff])
  {
    double v65 = [*(id *)(a1 + 32) transitionIconView];
    [v65 setAlpha:0.0];

    double v66 = [*(id *)(a1 + 32) transitionIconViewVibrant];
    [v66 setHidden:0];

    int v67 = [*(id *)(a1 + 32) isActionSetTile];
    double v68 = *(void **)(a1 + 32);
    if (v67)
    {
      uint64_t v69 = [v68 iconSizeInActionSetTile];
      double v70 = [*(id *)(a1 + 32) transitionIconViewVibrant];
      [v70 setIconSize:v69];

      [*(id *)(a1 + 32) iconFrameInActionSetTile];
    }
    else
    {
      uint64_t v75 = [v68 iconSizeInTile];
      id v76 = [*(id *)(a1 + 32) transitionIconViewVibrant];
      [v76 setIconSize:v75];

      [*(id *)(a1 + 32) iconFrameInTile];
    }
    double v77 = v71;
    double v78 = v72;
    double v79 = v73;
    double v80 = v74;
    double v81 = [*(id *)(a1 + 32) transitionIconViewVibrant];
    objc_msgSend(v81, "setFrame:", v77, v78, v79, v80);

    double v82 = [*(id *)(a1 + 32) transitionIconViewVibrant];
    [v82 setNeedsLayout];
  }
  int v83 = [*(id *)(a1 + 32) isActionSetTile];
  double v84 = *(void **)(a1 + 32);
  if (v83)
  {
    double v85 = [v84 transitionTitleAndDescriptionView];
    [v85 setHidden:0];

    double v86 = [*(id *)(a1 + 32) transitionTitleAndDescriptionVibrantEffectView];
    [v86 setHidden:0];

    [*(id *)(a1 + 32) titleAndDescriptionViewFrameInActionSetTile];
    double v88 = v87;
    double v90 = v89;
    double v92 = v91;
    double v94 = v93;
    double v95 = [*(id *)(a1 + 32) transitionTitleAndDescriptionView];
    objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

    if ([*(id *)(a1 + 32) isTileOff]) {
      goto LABEL_25;
    }
    v96 = objc_msgSend(*(id *)(a1 + 32), "pressedTile_legacy");
    unint64_t v97 = [v96 titleAndDescriptionView];
    v98 = [v97 titleLabel];
    double v99 = [v98 textColor];
    double v100 = [*(id *)(a1 + 32) transitionTitleAndDescriptionView];
    double v101 = [v100 titleLabel];
    [v101 setTextColor:v99];
  }
  else
  {
    double v102 = [v84 transitionTextView];
    [v102 setHidden:0];

    [*(id *)(a1 + 32) primaryLabelFrameInTile];
    double v104 = v103;
    double v106 = v105;
    double v108 = v107;
    double v110 = v109;
    id v111 = [*(id *)(a1 + 32) transitionTextView];
    objc_msgSend(v111, "setFrame:", v104, v106, v108, v110);

    double v112 = objc_msgSend(*(id *)(a1 + 32), "pressedTile_legacy");
    double v113 = [v112 serviceTextView];
    double v114 = [v113 textColor];
    double v115 = [*(id *)(a1 + 32) transitionTextView];
    [v115 setTextColor:v114];

    if (![*(id *)(a1 + 32) isTileOff]) {
      goto LABEL_25;
    }
    double v116 = [*(id *)(a1 + 32) transitionTextView];
    [v116 setAlpha:0.0];

    uint64_t v117 = [*(id *)(a1 + 32) transitionTextViewVibrantEffectView];
    [v117 setHidden:0];

    [*(id *)(a1 + 32) primaryLabelFrameInTile];
    double v119 = v118;
    double v121 = v120;
    double v123 = v122;
    double v125 = v124;
    double v126 = [*(id *)(a1 + 32) transitionTextViewVibrantEffectView];
    objc_msgSend(v126, "setFrame:", v119, v121, v123, v125);

    v96 = [*(id *)(a1 + 32) transitionTextViewVibrantEffectView];
    [v96 bounds];
    double v128 = v127;
    double v130 = v129;
    double v132 = v131;
    double v134 = v133;
    unint64_t v97 = [*(id *)(a1 + 32) transitionTextViewVibrant];
    objc_msgSend(v97, "setFrame:", v128, v130, v132, v134);
  }

LABEL_25:
  double v135 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v135 setHidden:0];

  int v136 = [*(id *)(a1 + 32) isActionSetTile];
  v137 = *(void **)(a1 + 32);
  if (v136) {
    [v137 secondaryLabelFrameInActionSetTile];
  }
  else {
    [v137 secondaryLabelFrameInTile];
  }
  double v142 = v138;
  double v143 = v139;
  double v144 = v140;
  double v145 = v141;
  v146 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  objc_msgSend(v146, "setFrame:", v142, v143, v144, v145);

  double v147 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v147 bounds];
  double v149 = v148;
  double v151 = v150;
  double v153 = v152;
  double v155 = v154;
  double v156 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  objc_msgSend(v156, "setFrame:", v149, v151, v153, v155);

  double v157 = [*(id *)(a1 + 32) transitionSecondaryLabel];
  [v157 layoutIfNeeded];

  v158 = [*(id *)(a1 + 32) transitionSecondaryLabelVibrantEffectView];
  [v158 layoutIfNeeded];
}

void __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardViewController];
  v1 = [v2 closeButton];
  [v1 setAlpha:0.0];
}

void __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 32) delegate];
    [v4 presentationCoordinatorWillEndTransition:*(void *)(a1 + 32) presenting:0];
  }
  if ([*(id *)(a1 + 32) isTileOff]) {
    [*(id *)(a1 + 32) removeAllTransitionSubviews];
  }
  [*(id *)(a1 + 32) _restoreOriginalTile];
  id v5 = [*(id *)(a1 + 32) transitionBlurView];
  [v5 removeFromSuperview];
}

- (void)removeAllTransitionSubviews
{
  char v3 = [(HUQuickControlPresentationCoordinator *)self pressedTileBlurEffectView];
  [v3 removeFromSuperview];

  unint64_t v4 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
  [v4 removeFromSuperview];

  id v5 = [(HUQuickControlPresentationCoordinator *)self transitionIconViewVibrant];
  [v5 removeFromSuperview];

  uint64_t v6 = [(HUQuickControlPresentationCoordinator *)self transitionPrimaryLabel];
  [v6 removeFromSuperview];

  uint64_t v7 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v7 removeFromSuperview];

  id v8 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabelVibrantEffectView];
  [v8 removeFromSuperview];

  id v9 = [(HUQuickControlPresentationCoordinator *)self transitionTextView];
  [v9 removeFromSuperview];

  double v10 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrant];
  [v10 removeFromSuperview];

  double v11 = [(HUQuickControlPresentationCoordinator *)self transitionTextViewVibrantEffectView];
  [v11 removeFromSuperview];

  double v12 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionView];
  [v12 removeFromSuperview];

  double v13 = [(HUQuickControlPresentationCoordinator *)self transitionTitleAndDescriptionVibrantEffectView];
  [v13 removeFromSuperview];

  double v14 = [(HUQuickControlPresentationCoordinator *)self transitionPrefixLabel];
  [v14 removeFromSuperview];

  double v15 = [(HUQuickControlPresentationCoordinator *)self transitionBaseIconView];
  [v15 removeFromSuperview];

  id v16 = [(HUQuickControlPresentationCoordinator *)self transitionBackgroundView];
  [v16 removeFromSuperview];
}

- (BOOL)isTileOff
{
  char v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  if ([v3 primaryState] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    BOOL v4 = [v5 primaryState] == 0;
  }
  return v4;
}

- (BOOL)isActionSetTile
{
  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation]) {
    [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  }
  else {
  char v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isCameraTile
{
  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation]) {
    [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  }
  else {
  char v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)iconSizeInTile
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  char v3 = [v2 iconView];
  unint64_t v4 = [v3 iconSize];

  return v4;
}

- (unint64_t)iconSizeInActionSetTile
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  char v3 = [v2 iconView];
  unint64_t v4 = [v3 iconSize];

  return v4;
}

- (CGRect)iconFrameInTile
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  char v3 = [v2 iconView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)iconFrameInActionSetTile
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  char v3 = [v2 sceneCellLayoutOptions];
  double v4 = [v2 iconView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  [v3 iconInnerHorizontalMargin];
  double v10 = v9;
  [v3 cellHeight];
  double v12 = v11 * 0.5 - v8 * 0.5;

  double v13 = v10;
  double v14 = v12;
  double v15 = v6;
  double v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (unint64_t)iconSizeInNavigationBar
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  char v3 = [v2 navigationBarTitleView];
  double v4 = [v3 summaryView];
  double v5 = [v4 iconView];
  unint64_t v6 = [v5 iconSize];

  return v6;
}

- (CGRect)iconFrameInNavigationBar
{
  [(HUQuickControlPresentationCoordinator *)self iconSizeInNavigationBar];
  HUDefaultSizeForIconSize();
  double v4 = v3;
  double v6 = v5;
  double v7 = 14.0;
  if ([(HUQuickControlPresentationCoordinator *)self _isRTL])
  {
    double v8 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    double v9 = [v8 navigationBarTitleView];
    [v9 frame];
    double v7 = v10 + -14.0 - v4;
  }
  double v11 = v7;
  double v12 = 22.0;
  double v13 = v4;
  double v14 = v6;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)primaryLabelFrameInTile
{
  double v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  [v3 frame];
  double v5 = v4;
  double v6 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v7 = [v6 layoutOptions];
  [v7 cellInnerMargin];
  double v9 = v5 + v8 * -2.0;

  double v10 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v11 = [v10 serviceTextView];
  [v11 frame];
  double v13 = v12;

  double v14 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v15 = [v14 layoutOptions];
  [v15 cellInnerMargin];
  double v17 = v16;

  char v18 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v19 = [v18 contentView];
  [v19 bounds];
  double MaxY = CGRectGetMaxY(v36);
  uint64_t v21 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v22 = [v21 layoutOptions];
  [v22 cellInnerMargin];
  double v24 = MaxY - v23;

  double v25 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v26 = [v25 serviceTextView];
  [v26 frame];
  double v27 = v24 - CGRectGetHeight(v37);
  uint64_t v28 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v29 = [v28 serviceTextView];
  [v29 lastBaselineToBottomDistance];
  double v31 = HURoundToScreenScale(v27 + v30);

  double v32 = v17;
  double v33 = v31;
  double v34 = v9;
  double v35 = v13;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (CGRect)primaryLabelFrameInActionSetTile
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v3 = [v2 titleAndDescriptionView];
  double v4 = [v3 titleLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)baseIconFrameInNavigationBar
{
  double v3 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v4 = [v3 navigationBarTitleView];
  double v5 = [v4 summaryView];
  double v6 = [v5 baseIconView];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v16 = [v15 navigationBarTitleView];
  [v16 frame];
  double v18 = v17;

  BOOL v19 = [(HUQuickControlPresentationCoordinator *)self _isRTL];
  double v20 = v18 - v12 + -14.0;
  if (!v19) {
    double v20 = v8;
  }
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)primaryLabelFrameInNavigationBar
{
  double v3 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v4 = [v3 navigationBarTitleView];
  double v5 = [v4 summaryView];
  double v6 = [v5 primaryLabel];
  [v6 frame];
  double v8 = v7;

  double v9 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v10 = [v9 navigationBarTitleView];
  double v11 = [v10 summaryView];
  double v12 = [v11 primaryLabel];
  [v12 frame];
  double v14 = v13;

  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
  {
    if (![(HUQuickControlPresentationCoordinator *)self _isRTL])
    {
      double v26 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
      [v26 frame];
      double v28 = v27;
      double v29 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
      [v29 frame];
      double v25 = v28 + v30 + 14.0;

      goto LABEL_9;
    }
    [(HUQuickControlPresentationCoordinator *)self iconFrameInNavigationBar];
    double v16 = v15 + -14.0;
  }
  else
  {
    [(HUQuickControlPresentationCoordinator *)self baseIconFrameInNavigationBar];
    double v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    if (![(HUQuickControlPresentationCoordinator *)self _isRTL])
    {
      v35.origin.double x = v18;
      v35.origin.double y = v20;
      v35.size.width = v22;
      v35.size.height = v24;
      double v25 = CGRectGetMaxX(v35) + 14.0;
      goto LABEL_9;
    }
    double v16 = v18 + -14.0;
  }
  double v25 = v16 - v8;
LABEL_9:
  double v31 = 16.0;
  double v32 = v25;
  double v33 = v8;
  double v34 = v14;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.double y = v31;
  result.origin.double x = v32;
  return result;
}

- (CGRect)secondaryLabelFrameInTile
{
  double v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v4 = [v3 contentView];
  [v4 bounds];
  double Width = CGRectGetWidth(v33);
  double v6 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v7 = [v6 layoutOptions];
  [v7 cellInnerMargin];
  double v9 = Width + v8 * -2.0;

  double v10 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v10 bounds];
  CGFloat Height = CGRectGetHeight(v34);

  double v12 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v13 = [v12 contentView];
  [v13 bounds];
  double MinX = CGRectGetMinX(v35);
  double v15 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v16 = [v15 layoutOptions];
  [v16 cellInnerMargin];
  double v18 = MinX + v17;

  double v19 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  CGFloat v20 = [v19 contentView];
  [v20 bounds];
  double MaxY = CGRectGetMaxY(v36);
  CGFloat v22 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v23 = [v22 layoutOptions];
  [v23 cellInnerMargin];
  double v25 = MaxY - v24;

  double v26 = [(HUQuickControlPresentationCoordinator *)self transitionSecondaryLabel];
  [v26 _lastLineBaseline];
  double v28 = HURoundToScreenScale(v25 - v27);

  double v29 = v18;
  double v30 = v28;
  double v31 = v9;
  double v32 = Height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)secondaryLabelFrameInActionSetTile
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v3 = [v2 titleAndDescriptionView];
  double v4 = [v3 descriptionLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)secondaryLabelFrameInNavigationBar
{
  double v3 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v4 = [v3 navigationBarTitleView];
  double v5 = [v4 summaryView];
  double v6 = [v5 secondaryLabel];
  [v6 frame];
  double v8 = v7;

  double v9 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v10 = [v9 navigationBarTitleView];
  double v11 = [v10 summaryView];
  double v12 = [v11 secondaryLabel];
  [v12 frame];
  double v14 = v13;

  double v15 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v16 = [v15 navigationBarTitleView];
  double v17 = [v16 summaryView];
  double v18 = [v17 primaryLabel];
  [v18 frame];
  double v20 = v19;

  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
  {
    if (![(HUQuickControlPresentationCoordinator *)self _isRTL])
    {
      double v32 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
      [v32 frame];
      double v34 = v33;
      CGRect v35 = [(HUQuickControlPresentationCoordinator *)self transitionIconView];
      [v35 frame];
      double v31 = v34 + v36 + 14.0;

      goto LABEL_9;
    }
    [(HUQuickControlPresentationCoordinator *)self iconFrameInNavigationBar];
    double v22 = v21 + -14.0;
  }
  else
  {
    [(HUQuickControlPresentationCoordinator *)self baseIconFrameInNavigationBar];
    double v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    if (![(HUQuickControlPresentationCoordinator *)self _isRTL])
    {
      v41.origin.double x = v24;
      v41.origin.double y = v26;
      v41.size.width = v28;
      v41.size.height = v30;
      double v31 = CGRectGetMaxX(v41) + 14.0;
      goto LABEL_9;
    }
    double v22 = v24 + -14.0;
  }
  double v31 = v22 - v8;
LABEL_9:
  double v37 = v20 + 16.0;
  double v38 = v31;
  double v39 = v8;
  double v40 = v14;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.double y = v37;
  result.origin.double x = v38;
  return result;
}

- (CGRect)titleAndDescriptionViewFrameInActionSetTile
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  double v3 = [v2 titleAndDescriptionView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_preparePressedItemContextForItem:(id)a3 startApplier:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  double v6 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
  double v7 = [v6 objectForKey:v10];

  if (v7)
  {
    [(HUQuickControlPresentationCoordinator *)self _configureInitialStateForPressedItemContext:v7 userInitiated:1];
  }
  else
  {
    double v7 = [(HUQuickControlPresentationCoordinator *)self _createPressedContextForItem:v10 userInitiated:1];
    double v8 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
    [v8 setObject:v7 forKey:v10];

    if (v4)
    {
      double v9 = [v7 applier];
      [v9 start];
    }
  }
}

- (void)_configureInitialStateForPressedItemContext:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  [v8 setBeginTime:CACurrentMediaTime()];
  [v8 setRawInputProgress:0.433333333];
  double v5 = [v8 applier];
  [v5 setCompletesWhenAtRest:0];

  [v8 setActive:1];
  [v8 setIsUserInitiated:v4];
  double v6 = [v8 programmaticBounceTimer];

  if (v6)
  {
    double v7 = [v8 programmaticBounceTimer];
    [v7 invalidate];

    [v8 setProgrammaticBounceTimer:0];
  }
}

- (void)_initiateProgrammaticBounceForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
  double v6 = [v5 objectForKey:v4];

  double v7 = (void *)MEMORY[0x1E4F1CB00];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__HUQuickControlPresentationCoordinator__initiateProgrammaticBounceForItem___block_invoke;
  v10[3] = &unk_1E638CFE0;
  id v11 = v6;
  id v8 = v6;
  double v9 = [v7 scheduledTimerWithTimeInterval:0 repeats:v10 block:0.17];
  [v8 setProgrammaticBounceTimer:v9];
}

void __76__HUQuickControlPresentationCoordinator__initiateProgrammaticBounceForItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActive:0];
  id v2 = [*(id *)(a1 + 32) applier];
  [v2 setCompletesWhenAtRest:1];
}

- (id)_createPressedContextForItem:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
  id v8 = [v7 objectForKey:v6];

  if (v8) {
    NSLog(&cfstr_PressedItemCon.isa, v6);
  }
  double v9 = objc_alloc_init(HUPressedItemContext);
  [(HUPressedItemContext *)v9 setItem:v6];
  [(HUPressedItemContext *)v9 setIsUserInitiated:v4];
  objc_initWeak(location, self);
  objc_initWeak(&from, v9);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  id v10 = [HUElasticApplier alloc];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke;
  v22[3] = &unk_1E63925E8;
  v22[4] = v25;
  objc_copyWeak(&v23, location);
  objc_copyWeak(&v24, &from);
  id v11 = [(HUElasticApplier *)v10 initWithProgressInputBlock:v22];
  [(HUElasticApplier *)v11 setTension:600.0];
  [(HUElasticApplier *)v11 setFriction:10.0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_3;
  v18[3] = &unk_1E6392610;
  objc_copyWeak(&v20, location);
  objc_copyWeak(&v21, &from);
  id v12 = v6;
  id v19 = v12;
  [(HUApplier *)v11 addApplierBlock:v18];
  [(HUElasticApplier *)v11 setCompletesWhenAtRest:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_4;
  v15[3] = &unk_1E638F298;
  objc_copyWeak(&v17, location);
  id v13 = v12;
  id v16 = v13;
  [(HUApplier *)v11 addCompletionBlock:v15];
  [(HUPressedItemContext *)v9 setApplier:v11];
  [(HUQuickControlPresentationCoordinator *)self _configureInitialStateForPressedItemContext:v9 userInitiated:v4];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  _Block_object_dispose(v25, 8);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v9;
}

double __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke(uint64_t a1, double a2)
{
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_2;
  v17[3] = &unk_1E63925C0;
  v17[4] = *(void *)(a1 + 32);
  *(double *)&v17[5] = a2;
  BOOL v4 = (void (**)(void))_Block_copy(v17);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  double v7 = v6;
  if (WeakRetained && ([v6 isActive] & 1) != 0)
  {
    id v8 = [WeakRetained pressGestureRecognizer];
    [v8 currentForceMultiplier];
    double v10 = v9;

    double v11 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    [v7 rawInputProgress];
    [v7 setRawInputProgress:v12 + (a2 - v11) / 0.2 * v10];
  }
  else
  {
    [v7 setRawInputProgress:0.0];
  }
  [v7 rawInputProgress];
  double v14 = v13;

  if (v4) {
    v4[2](v4);
  }
  double v15 = HURubberBandedValue(v14, 0.0, 0.333333333, 0.0, 1.5);

  return v15;
}

double __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_2(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_3(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateOverrideAttributesWithScale:*(void *)(a1 + 32) forItem:(1.0 - a2) * 0.2 + 0.8];
  double v5 = CACurrentMediaTime();
  [v4 beginTime];
  double v7 = v6;
  id v8 = [WeakRetained pressGestureRecognizer];
  [v8 overallForceMultiplier];
  double v10 = v9;

  if ([v4 isUserInitiated]
    && [v4 isActive]
    && (v5 - v7) * v10 >= 0.5)
  {
    id v11 = (id)[WeakRetained _beginControlPresentationAnimated:1];
  }
}

void __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _pressedStateDidEndForItem:*(void *)(a1 + 32) clearPresentationContext:1];
  }
}

- (void)_updateOverrideAttributesWithScale:(double)a3 forItem:(id)a4
{
  id v6 = a4;
  CGAffineTransformMakeScale(&v7, a3, a3);
  [(HUQuickControlPresentationCoordinator *)self _updateOverrideAttributesWithTransform:&v7 alpha:v6 forItem:1.0];
}

- (void)_updateOverrideAttributesWithTransform:(CGAffineTransform *)a3 alpha:(double)a4 forItem:(id)a5
{
  id v8 = a5;
  double v9 = objc_alloc_init(HUControllableCollectionViewLayoutOverrideAttributes);
  long long v10 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v10;
  v14[2] = *(_OWORD *)&a3->tx;
  [(HUControllableCollectionViewLayoutOverrideAttributes *)v9 setTransform:v14];
  [(HUControllableCollectionViewLayoutOverrideAttributes *)v9 setAlpha:a4];
  [(HUControllableCollectionViewLayoutOverrideAttributes *)v9 setZIndex:1000];
  id v11 = [(HUQuickControlPresentationCoordinator *)self delegate];
  [v11 presentationCoordinator:self applyOverrideAttributes:v9 toItem:v8];

  double v12 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
  double v13 = [v12 objectForKey:v8];

  if (v13) {
    [v13 setCurrentViewScale:a3->a];
  }
}

- (void)_pressedStateDidEndForItem:(id)a3 clearPresentationContext:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CGAffineTransform v7 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
  id v8 = [v7 objectForKey:v6];

  if (v8)
  {
    double v9 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__HUQuickControlPresentationCoordinator__pressedStateDidEndForItem_clearPresentationContext___block_invoke;
    v15[3] = &unk_1E63850E0;
    void v15[4] = self;
    id v10 = v6;
    id v16 = v10;
    [v9 performWithoutAnimation:v15];
    id v11 = [(HUQuickControlPresentationCoordinator *)self pressedItemContexts];
    [v11 removeObjectForKey:v10];

    if (v4)
    {
      double v12 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      double v13 = [v12 item];
      int v14 = [v13 isEqual:v10];

      if (v14) {
        [(HUQuickControlPresentationCoordinator *)self setPresentationContext:0];
      }
    }
  }
  else
  {
    NSLog(&cfstr_MissingPressed.isa, v6);
  }
}

void __93__HUQuickControlPresentationCoordinator__pressedStateDidEndForItem_clearPresentationContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 presentationCoordinator:*(void *)(a1 + 32) clearOverrideAttributesForItem:*(void *)(a1 + 40)];
}

- (void)_actuateTapticFeedback
{
  double v3 = [(HUQuickControlPresentationCoordinator *)self feedbackGenerator];
  [v3 impactOccurred];

  id v4 = [(HUQuickControlPresentationCoordinator *)self feedbackGenerator];
  [v4 prepare];
}

- (id)presentQuickControlWithContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(HUQuickControlPresentationCoordinator *)self setPresentationContext:v6];
  CGAffineTransform v7 = [v6 item];

  if (v7)
  {
    id v8 = [v6 item];
    [(HUQuickControlPresentationCoordinator *)self _preparePressedItemContextForItem:v8 startApplier:0];
  }
  double v9 = [(HUQuickControlPresentationCoordinator *)self _beginControlPresentationAnimated:v4];

  return v9;
}

- (BOOL)_shouldCancelPresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  double v5 = [(HUQuickControlPresentationCoordinator *)self delegate];
  id v6 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  int v7 = [v5 presentationCoordinator:self shouldBeginPresentationWithContext:v6];

  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = [(HUQuickControlPresentationCoordinator *)self delegate];
    int v13 = 138412802;
    int v14 = v10;
    __int16 v15 = 1024;
    int v16 = v7;
    __int16 v17 = 2112;
    double v18 = v11;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@+Controls _shouldCancelPresentation: delegate responded to shouldBeginPresentationWithContext with %{BOOL}d delegate %@", (uint8_t *)&v13, 0x1Cu);
  }
  return v7 ^ 1;
}

- (id)_beginControlPresentationAnimated:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v4 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];

  if (v4) {
    NSLog(&cfstr_AttemptingToBe.isa);
  }
  double v5 = [(HUQuickControlPresentationCoordinator *)self presentationContext];

  if (!v5) {
    NSLog(&cfstr_AttemptingToBe_0.isa);
  }
  id v6 = [(HUQuickControlPresentationCoordinator *)self activePressedItemContext];
  int v7 = [v6 applier];
  [v7 cancel];

  LODWORD(v7) = [(HUQuickControlPresentationCoordinator *)self _shouldCancelPresentation];
  id v8 = HFLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412290;
      CGFloat v26 = v11;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@+Controls canceling presentation", buf, 0xCu);
    }
    id v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    if (v9)
    {
      int v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412290;
      CGFloat v26 = v14;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@+Controls beginning control presentation", buf, 0xCu);
    }
    __int16 v15 = [(HUQuickControlPresentationCoordinator *)self _viewControllerToPresent];
    id v16 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    if (v15)
    {
      __int16 v17 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
      double v18 = objc_msgSend(v17, "hu_presentPreloadableViewController:animated:", v15, 1);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __75__HUQuickControlPresentationCoordinator__beginControlPresentationAnimated___block_invoke;
      v22[3] = &unk_1E638DA48;
      v22[4] = self;
      id v19 = v16;
      id v23 = v19;
      id v24 = v15;
      id v20 = (id)[v18 addCompletionBlock:v22];

      id v12 = v19;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
  }

  return v12;
}

uint64_t __75__HUQuickControlPresentationCoordinator__beginControlPresentationAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) delegate];
    double v5 = *(void **)(a1 + 32);
    id v6 = [v5 presentationContext];
    [v4 presentationCoordinator:v5 didBeginPresentationWithContext:v6];
  }
  int v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);

  return [v7 finishWithResult:v8];
}

- (id)_viewControllerToPresent
{
  char v3 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  char v4 = [v3 item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(HUQuickControlPresentationCoordinator *)self _buildSoftwareUpdateNavigationController];
  }
  else
  {
    int v7 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    uint64_t v8 = [v7 item];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if (v9) {
      [(HUQuickControlPresentationCoordinator *)self _buildStatusDetailsNavigationController];
    }
    else {
    id v6 = [(HUQuickControlPresentationCoordinator *)self _buildCardNavigationController];
    }
  }

  return v6;
}

- (id)_buildQuickControlViewController
{
  char v3 = [HUQuickControlContainerViewController alloc];
  char v4 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  double v5 = [(HUQuickControlContainerViewController *)v3 initWithPresentationContext:v4];

  [(HUQuickControlContainerViewController *)v5 setDelegate:self];
  [(HUQuickControlContainerViewController *)v5 setPresentationDelegate:self];
  id v6 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(HUQuickControlPresentationCoordinator *)self delegate];
    char v9 = [v8 detailViewURLHandlerForPresentationCoordinator:self];
    [(HUQuickControlContainerViewController *)v5 setDetailViewURLHandler:v9];
  }
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    [(HUQuickControlContainerViewController *)v5 presentControlForMacAnimated:1];
  }
  else
  {
    id v10 = [(HUQuickControlContainerViewController *)v5 view];
    id v11 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    [v11 sourceRect];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    id v20 = [(HUQuickControlPresentationCoordinator *)self targetView];
    objc_msgSend(v10, "convertRect:fromView:", v20, v13, v15, v17, v19);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    -[HUQuickControlContainerViewController presentControlFromSourceRect:animated:](v5, "presentControlFromSourceRect:animated:", 1, v22, v24, v26, v28);
  }

  return v5;
}

- (void)_updateCardController
{
  char v3 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  uint64_t v4 = [v3 item];
  if (v4)
  {
    double v5 = (void *)v4;
    id v6 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    uint64_t v7 = [v6 sourceItem];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      char v9 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      id v10 = [v9 item];
      id v11 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
      double v12 = [v11 sourceItem];

      if (v10 == v12) {
        return;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  double v13 = [(HUQuickControlPresentationCoordinator *)self _buildQuickControlViewController];
  [(HUQuickControlPresentationCoordinator *)self setQuickControlViewController:v13];

  double v14 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
  double v15 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  double v16 = [v15 item];
  BOOL v17 = [(HUQuickControlPresentationCoordinator *)self hasDetailsActionForQuickControlViewController:v14 item:v16];

  if (v17
    || ([(HUQuickControlPresentationCoordinator *)self presentationContext],
        double v18 = objc_claimAutoreleasedReturnValue(),
        [v18 item],
        double v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v19 conformsToProtocol:&unk_1F1A3D558],
        v19,
        v18,
        (v20 & 1) == 0))
  {
    double v21 = [(HUQuickControlPresentationCoordinator *)self _prepareSettingsViewController];
    [(HUQuickControlPresentationCoordinator *)self setSettingsViewController:v21];
  }
  double v22 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  double v23 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
  double v24 = [(HUQuickControlPresentationCoordinator *)self settingsViewController];
  double v25 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  [v22 updateWithQuickControlViewController:v23 settingsViewController:v24 presentationContext:v25];

  if (([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation] & 1) == 0)
  {
    double v26 = [(HUQuickControlPresentationCoordinator *)self pressedTile];

    if (v26)
    {
      double v27 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
      double v28 = [v27 baseIconViewConfiguration];

      [(HUBaseIconViewConfiguration *)v28 setAppearance:3];
      double v29 = objc_alloc_init(HUBaseIconView);
      [(HUBaseIconView *)v29 setConfiguration:v28];
      CGFloat v30 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
      double v31 = [v30 navigationBarTitleView];
      double v32 = [v31 summaryView];
      [v32 setBaseIconView:v29];
    }
    else
    {
      double v33 = [HUBaseIconViewConfiguration alloc];
      double v34 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      CGRect v35 = [v34 item];
      double v28 = [(HUBaseIconViewConfiguration *)v33 initWithItem:v35 appearance:3];

      double v29 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
      CGFloat v30 = [(HUBaseIconView *)v29 navigationBarTitleView];
      double v31 = [v30 summaryView];
      double v32 = [v31 baseIconView];
      [v32 setConfiguration:v28];
    }
  }
  double v36 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  double v37 = [v36 item];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v38 = 0;
  }
  else
  {
    double v39 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    double v40 = [v39 controlItems];
    BOOL v38 = [v40 count] != 0;
  }
  CGRect v41 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  double v42 = [v41 controlItems];
  int v43 = objc_msgSend(v42, "na_any:", &__block_literal_global_293);

  int v44 = [MEMORY[0x1E4F69758] isAMac];
  if ([MEMORY[0x1E4F69758] isInternalInstall] && HFHideQuickControls())
  {
    double v45 = HFLogForCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v50 = 0;
      _os_log_impl(&dword_1BE345000, v45, OS_LOG_TYPE_DEFAULT, "Hiding all quick controls because pref is set (see Internal Settings)", v50, 2u);
    }

    int v46 = 1;
  }
  else
  {
    int v46 = 0;
  }
  uint64_t v47 = v46 | v38 & (v44 ^ 1 | v43) ^ 1u;
  double v48 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  [v48 setHideControls:v47];

  int v49 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  [v49 setHideSettings:!v17];
}

BOOL __62__HUQuickControlPresentationCoordinator__updateCardController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_buildCardNavigationController
{
  [(HUQuickControlPresentationCoordinator *)self setCardViewController:0];
  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    uint64_t v4 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    int v5 = [v4 isConfiguredForNonHomeUser];

    if (v5)
    {
      id v6 = [HUCardViewController alloc];
      uint64_t v7 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      uint64_t v8 = [v7 controlItems];
      char v9 = [(HUCardViewController *)v6 initWithControlItems:v8];
      [(HUQuickControlPresentationCoordinator *)self setCardViewController:v9];

      id v10 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
      [v10 setIsConfiguredForNonHomeUser:1];

      [(HUQuickControlPresentationCoordinator *)self _updateCardController];
    }
  }
  id v11 = [(HUQuickControlPresentationCoordinator *)self cardViewController];

  if (!v11)
  {
    double v12 = objc_alloc_init(HUCardViewController);
    [(HUQuickControlPresentationCoordinator *)self setCardViewController:v12];
  }
  double v13 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  double v14 = [v13 item];

  if (v14)
  {
    [(HUQuickControlPresentationCoordinator *)self _updateCardController];
  }
  else
  {
    double v15 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    double v16 = [v15 itemManager];
    id v17 = (id)[v16 reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
  double v18 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  [v18 setDelegate:self];

  double v19 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    double v21 = [(HUQuickControlPresentationCoordinator *)self delegate];
    double v22 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    [v21 presentationCoordinator:self willBeginPresentationWithContext:v22];
  }
  double v23 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    double v25 = [(HUQuickControlPresentationCoordinator *)self delegate];
    uint64_t v26 = [v25 presentationCoordinatorShouldDisablePullToUnlockSettings:self];
    double v27 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    [v27 setDisablePullToUnlockSettings:v26];
  }
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    id v28 = objc_alloc(MEMORY[0x1E4F42BF8]);
    double v29 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
    CGFloat v30 = (void *)[v28 initWithRootViewController:v29];

    [v30 setModalPresentationStyle:2];
    double v31 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
    double v32 = [v31 controlContainerView];
    [v32 setNeedsLayout];

    double v33 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
    double v34 = [v33 controlContainerView];
    [v34 layoutIfNeeded];

    CGRect v35 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
    double v36 = [v35 controlContainerView];
    objc_msgSend(v36, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
    double v38 = v37;
    double v40 = v39;

    CGRect v41 = [v30 navigationBar];
    [v41 bounds];
    double v43 = v40 + v42;

    if (v43 > 621.0)
    {
      if (v43 <= 671.0) {
        double v44 = v43;
      }
      else {
        double v44 = 671.0;
      }
      objc_msgSend(v30, "setPreferredContentSize:", v38, v44);
    }
    if ([MEMORY[0x1E4F69138] isMacShortcuts])
    {
      [v30 preferredContentSize];
      [v30 setPreferredContentSize:668.0];
    }
    goto LABEL_52;
  }
  double v45 = [HUQuickControlNavigationController alloc];
  int v46 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  uint64_t v47 = [(HUQuickControlNavigationController *)v45 initWithRootViewController:v46];
  [(HUQuickControlPresentationCoordinator *)self setCardNavigationController:v47];

  double v48 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  if ([v48 prefersSystemTransitions]) {
    int v49 = 0;
  }
  else {
    int v49 = self;
  }
  double v50 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  [v50 setTransitioningDelegate:v49];

  uint64_t v51 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  double v52 = [v51 presentationController];
  [v52 setDelegate:self];

  double v53 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
  [v53 setDelegate:self];

  double v54 = [(HUQuickControlPresentationCoordinator *)self settingsViewController];
  if ([v54 conformsToProtocol:&unk_1F1AD8F10]) {
    double v55 = v54;
  }
  else {
    double v55 = 0;
  }
  id v56 = v55;

  if (v56)
  {
    uint64_t v57 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    double v58 = [v57 item];
    double v59 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    [v56 recreateDetailsViewFor:v58 navigationController:v59 dismiss:0];
  }
  double v60 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  if (([v60 prefersSystemTransitions] & 1) == 0)
  {
    double v61 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v62 = [v61 presentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_48;
    }
    double v64 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    double v60 = [v64 presentationController];

    if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation]) {
      [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    }
    else {
    double v65 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    }
    double v66 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
    objc_opt_class();
    char v67 = objc_opt_isKindOfClass();

    if (v67)
    {
      double v68 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
      uint64_t v69 = [v68 presentationController];
      objc_opt_class();
      char v70 = objc_opt_isKindOfClass();

      if (v70)
      {
        double v71 = [v68 presentationController];
        double v72 = [v71 _sourceView];

        if (v72)
        {
          uint64_t v73 = [v71 _sourceView];

          double v65 = (void *)v73;
        }
      }
    }
    [v60 _setSourceView:v65];
    if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
    {
      double v74 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
      uint64_t v75 = [v74 layoutOptions];
      [v75 cellCornerRadius];
      objc_msgSend(v60, "_setCornerRadiusForPresentationAndDismissal:");
    }
    else
    {
      double v74 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
      [v74 backgroundCornerRadius];
      objc_msgSend(v60, "_setCornerRadiusForPresentationAndDismissal:");
    }

    [(HUQuickControlPresentationCoordinator *)self cornerRadius];
    objc_msgSend(v60, "_setPreferredCornerRadius:");
    [v60 _setShouldDismissWhenTappedOutside:1];
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]
      && [MEMORY[0x1E4F69758] isAnIPad])
    {
      [v60 _setIndexOfLastUndimmedDetent:0];
    }
  }
LABEL_48:
  id v76 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
  uint64_t v77 = [v76 view];
  double v78 = [(id)v77 window];
  double v79 = [v78 _rootSheetPresentationController];
  [v79 _setShouldScaleDownBehindDescendantSheets:0];

  double v80 = [(HUQuickControlPresentationCoordinator *)self delegate];
  LOBYTE(v77) = objc_opt_respondsToSelector();

  if (v77)
  {
    double v81 = [(HUQuickControlPresentationCoordinator *)self delegate];
    int v82 = [v81 shouldOverrideTraitCollectionForPresentationCoordinator:self];

    if (v82)
    {
      int v83 = [(HUQuickControlPresentationCoordinator *)self delegate];
      double v84 = [v83 traitCollectionForPresentationCoordinator:self];

      uint64_t v85 = [v84 userInterfaceStyle];
      double v86 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
      [v86 setOverrideUserInterfaceStyle:v85];
    }
  }
  CGFloat v30 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];

LABEL_52:

  return v30;
}

- (id)_buildStatusDetailsNavigationController
{
  objc_opt_class();
  char v3 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  uint64_t v4 = [v3 item];
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [[HUStatusDetailsViewController alloc] initWithStatusItem:v6 delegate:self];
  [(HUQuickControlPresentationCoordinator *)self setStatusDetailsViewController:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F42BF8]);
  char v9 = [(HUQuickControlPresentationCoordinator *)self statusDetailsViewController];
  id v10 = (void *)[v8 initWithRootViewController:v9];
  [(HUQuickControlPresentationCoordinator *)self setStatusDetailsNavigationController:v10];

  id v11 = [(HUQuickControlPresentationCoordinator *)self statusDetailsNavigationController];
  [v11 setModalPresentationStyle:2];

  double v12 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
  double v13 = [v12 view];
  double v14 = [v13 window];
  double v15 = [v14 _rootSheetPresentationController];
  [v15 _setShouldScaleDownBehindDescendantSheets:0];

  return [(HUQuickControlPresentationCoordinator *)self statusDetailsNavigationController];
}

- (id)_buildSoftwareUpdateNavigationController
{
  char v3 = [HUSoftwareUpdateStandaloneViewController alloc];
  uint64_t v4 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  int v5 = [v4 home];
  id v6 = [(HUSoftwareUpdateStandaloneViewController *)v3 initWithHome:v5];

  [(HUSoftwareUpdateStandaloneViewController *)v6 setShowDoneButtonInNavBar:1];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v6];
  [v7 setModalPresentationStyle:2];

  return v7;
}

- (void)_validatePresentationContext:(id)a3
{
  id v12 = a3;
  if (!v12) {
    NSLog(&cfstr_Presentationco.isa);
  }
  char v3 = [MEMORY[0x1E4F69758] isProxHandOffV2Config];
  uint64_t v4 = v12;
  if ((v3 & 1) == 0)
  {
    char v5 = [v12 isConfiguredForNonHomeUser];
    uint64_t v4 = v12;
    if ((v5 & 1) == 0)
    {
      id v6 = [v12 item];
      if (v6)
      {
      }
      else
      {
        uint64_t v7 = [v12 itemManager];
        id v8 = [v7 homeKitObjectUUID];

        if (!v8) {
          NSLog(&cfstr_ContextMustInc.isa, v12);
        }
      }
      char v9 = [v12 home];

      uint64_t v4 = v12;
      if (!v9)
      {
        NSLog(&cfstr_ContextMustInc_0.isa, v12);
        uint64_t v4 = v12;
      }
    }
  }
  id v10 = [v4 item];
  if (v10 && ([v12 sourceRect], CGRectIsEmpty(v14)))
  {
    char v11 = [v12 prefersSystemTransitions];

    if ((v11 & 1) == 0) {
      NSLog(&cfstr_ContextMustInc_1.isa, v12);
    }
  }
  else
  {
  }
}

- (id)dismissQuickControlAnimated:(BOOL)a3 wasDismissed:(BOOL *)a4
{
  BOOL v4 = a3;
  if (a4) {
    *a4 = [(HUQuickControlPresentationCoordinator *)self isQuickControlPresented];
  }

  return [(HUQuickControlPresentationCoordinator *)self dismissQuickControlAnimated:v4];
}

- (id)dismissQuickControlAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
  if (v5
    && (id v6 = (void *)v5,
        [(HUQuickControlPresentationCoordinator *)self quickControlViewController],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isControlDismissedOrDismissing],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    id v10 = [(HUQuickControlPresentationCoordinator *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(HUQuickControlPresentationCoordinator *)self delegate];
      double v13 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      [v12 presentationCoordinator:self willEndPresentationWithContext:v13];
    }
    CGRect v14 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
    char v9 = [v14 dismissControlAnimated:v3];
  }
  else
  {
    char v9 = [(HUQuickControlPresentationCoordinator *)self _dismissQuickControlViewControllerAnimated:v3];
  }

  return v9;
}

- (id)_dismissQuickControlViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  id v6 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(HUQuickControlPresentationCoordinator *)self delegate];
    [v8 presentationCoordinator:self willEndPresentationWithContext:v5];
  }
  uint64_t v9 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
  if (v9
    && (id v10 = (void *)v9,
        [(HUQuickControlPresentationCoordinator *)self quickControlViewController],
        char v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isBeingDismissed],
        v11,
        v10,
        !v12))
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    double v15 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke;
    v19[3] = &unk_1E63850E0;
    v19[4] = self;
    id v16 = v14;
    id v20 = v16;
    [v15 dismissViewControllerAnimated:v3 completion:v19];

    id v17 = v20;
    id v13 = v16;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v13;
}

void __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke_2;
  aBlock[3] = &unk_1E63850E0;
  id v2 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v11 = v2;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  BOOL v4 = [*(id *)(a1 + 32) quickControlViewController];
  uint64_t v5 = [v4 presentingViewController];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) quickControlViewController];
    char v7 = [v6 presentingViewController];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke_3;
    v8[3] = &unk_1E6386040;
    uint64_t v9 = v3;
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cardNavigationController];
  BOOL v3 = [v2 transitioningDelegate];
  BOOL v4 = *(void **)(a1 + 32);

  if (v3 == v4) {
    [*(id *)(a1 + 32) _restoreOriginalTile];
  }
  uint64_t v5 = *(void **)(a1 + 40);

  return [v5 finishWithNoResult];
}

uint64_t __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_restoreOriginalTile
{
  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
  {
    uint64_t v3 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      uint64_t v5 = [(HUQuickControlPresentationCoordinator *)self presentationContext];

      if (v5)
      {
        CGAffineTransformMakeScale(&v18, 1.0, 1.0);
        id v6 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
        char v7 = [v6 item];
        [(HUQuickControlPresentationCoordinator *)self _updateOverrideAttributesWithTransform:&v18 alpha:v7 forItem:1.0];

        char v8 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
LABEL_9:
        double v15 = v8;
        id v16 = [v8 item];
        [(HUQuickControlPresentationCoordinator *)self _pressedStateDidEndForItem:v16 clearPresentationContext:1];
      }
    }
  }
  else
  {
    uint64_t v9 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    if (!v9) {
      return;
    }
    id v17 = (id)v9;
    uint64_t v10 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    if (v10)
    {
      id v11 = (void *)v10;
      BOOL v12 = [(HUQuickControlPresentationCoordinator *)self isActionSetTile];

      if (v12) {
        return;
      }
      CGAffineTransformMakeScale(&v19, 1.0, 1.0);
      id v13 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      id v14 = [v13 item];
      [(HUQuickControlPresentationCoordinator *)self _updateOverrideAttributesWithTransform:&v19 alpha:v14 forItem:1.0];

      char v8 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      goto LABEL_9;
    }
  }
}

- (void)_cleanupForQuickControlDismissal
{
  [(HUQuickControlPresentationCoordinator *)self setQuickControlViewController:0];
  [(HUQuickControlPresentationCoordinator *)self setSettingsViewController:0];
  [(HUQuickControlPresentationCoordinator *)self setPresentationContext:0];

  [(HUQuickControlPresentationCoordinator *)self setPressedTile_legacy:0];
}

- (BOOL)isQuickControlPresented
{
  uint64_t v3 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
  if (v3)
  {
    BOOL v4 = [(HUQuickControlPresentationCoordinator *)self quickControlViewController];
    int v5 = [v4 isBeingDismissed] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_prepareSettingsViewController
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HUQuickControlPresentationCoordinator__prepareSettingsViewController__block_invoke;
  aBlock[3] = &unk_1E6392638;
  aBlock[4] = self;
  uint64_t v3 = (void (**)(void *, id))_Block_copy(aBlock);
  BOOL v4 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  int v5 = [v4 item];
  int v6 = [v5 conformsToProtocol:&unk_1F1A3D558];

  if (v6)
  {
    char v7 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    char v8 = [v7 item];
    if ([v8 conformsToProtocol:&unk_1F1A3D558]) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    objc_opt_class();
    id v11 = (HUSceneActionEditorViewController *)v10;
    if (objc_opt_isKindOfClass()) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      id v14 = [(HUSceneActionEditorViewController *)v13 accessory];
      int v15 = objc_msgSend(v14, "hf_isSingleServiceLikeAccessory");

      if (v15)
      {
        id v16 = [(HUSceneActionEditorViewController *)v13 accessory];
        id v17 = objc_msgSend(v16, "hf_primaryService");
        uint64_t v18 = [(HUSceneActionEditorViewController *)v13 serviceItemForService:v17];

        id v11 = (HUSceneActionEditorViewController *)v18;
      }
    }
    CGAffineTransform v19 = v3[2](v3, v11);
    objc_opt_class();
    id v20 = v19;
    if (objc_opt_isKindOfClass()) {
      double v21 = v20;
    }
    else {
      double v21 = 0;
    }
    double v22 = v21;

    if (v22)
    {
      double v23 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      -[HUSceneActionEditorViewController setShouldIncludeRoomNameInHeaderTitle:](v22, "setShouldIncludeRoomNameInHeaderTitle:", [v23 shouldIncludeRoomNameInHeaderTitle]);
    }
LABEL_39:

    goto LABEL_40;
  }
  char v24 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  double v25 = [v24 item];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v27 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    id v28 = [v27 item];
    double v29 = v3[2](v3, v28);

    objc_opt_class();
    id v11 = v29;
    if (objc_opt_isKindOfClass()) {
      CGFloat v30 = v11;
    }
    else {
      CGFloat v30 = 0;
    }
    double v31 = v30;

    id v20 = v11;
    if (!v31)
    {
      objc_opt_class();
      double v32 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      double v33 = [v32 item];
      if (objc_opt_isKindOfClass()) {
        double v34 = v33;
      }
      else {
        double v34 = 0;
      }
      id v35 = v34;

      id v36 = objc_alloc(MEMORY[0x1E4F68EB0]);
      double v37 = [v35 actionSet];

      double v38 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      double v39 = [v38 home];
      double v40 = (void *)[v36 initWithExistingObject:v37 inHome:v39];

      id v20 = [[HUSceneActionEditorViewController alloc] initWithActionSetBuilder:v40 mode:0];
    }
    [(HUSceneActionEditorViewController *)v20 setShowCancelButton:0];
    goto LABEL_39;
  }
  CGRect v41 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  double v42 = [v41 item];
  objc_opt_class();
  char v43 = objc_opt_isKindOfClass();

  if (v43)
  {
    objc_opt_class();
    double v44 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    double v45 = [v44 item];
    if (objc_opt_isKindOfClass()) {
      int v46 = v45;
    }
    else {
      int v46 = 0;
    }
    id v47 = v46;

    double v48 = [v47 sourceItem];

    if ([v48 conformsToProtocol:&unk_1F1A3D558]) {
      int v49 = v48;
    }
    else {
      int v49 = 0;
    }
    id v50 = v49;

    uint64_t v51 = v3[2](v3, v50);

    objc_opt_class();
    id v20 = v51;
    if (objc_opt_isKindOfClass()) {
      double v52 = v20;
    }
    else {
      double v52 = 0;
    }
    id v11 = v52;

    if (v11)
    {
      double v53 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
      -[HUSceneActionEditorViewController setShouldIncludeRoomNameInHeaderTitle:](v11, "setShouldIncludeRoomNameInHeaderTitle:", [v53 shouldIncludeRoomNameInHeaderTitle]);

      id v11 = v20;
    }
    goto LABEL_39;
  }
  id v20 = 0;
LABEL_40:
  [(HUSceneActionEditorViewController *)v20 setPresentationDelegate:self];

  return v20;
}

id __71__HUQuickControlPresentationCoordinator__prepareSettingsViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) presentationContext];
  int v5 = [v4 detailsViewController];

  int v6 = *(void **)(a1 + 32);
  if (v5)
  {
    char v7 = [v6 presentationContext];
    uint64_t v8 = [v7 detailsViewController];
LABEL_3:
    uint64_t v9 = (void *)v8;

    goto LABEL_8;
  }
  uint64_t v10 = [v6 delegate];
  if (v10)
  {
    id v11 = (void *)v10;
    BOOL v12 = [*(id *)(a1 + 32) delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      char v7 = [*(id *)(a1 + 32) delegate];
      uint64_t v8 = [v7 detailsViewControllerForPresentationCoordinator:*(void *)(a1 + 32) item:v3];
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v9 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  uint64_t v8 = [v9 navigationBarTitleView];
  [v8 setHidden:(isKindOfClass & 1) == 0];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  BOOL v4 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
  int v5 = [v4 transitionCoordinator];

  if (v5)
  {
    id v6 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
    char v7 = [v6 transitionCoordinator];
    void v8[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__HUQuickControlPresentationCoordinator_presentationControllerWillDismiss___block_invoke;
    v9[3] = &unk_1E6385548;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__HUQuickControlPresentationCoordinator_presentationControllerWillDismiss___block_invoke_2;
    v8[3] = &unk_1E6385548;
    [v7 animateAlongsideTransition:v9 completion:v8];
  }
}

void __75__HUQuickControlPresentationCoordinator_presentationControllerWillDismiss___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:0.0];
  id v2 = [*(id *)(a1 + 32) transitionBlurView];
  [v2 setEffect:v3];
}

void __75__HUQuickControlPresentationCoordinator_presentationControllerWillDismiss___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = [a2 isCancelled];
  BOOL v4 = *(void **)(a1 + 32);
  if (v3)
  {
    int v5 = [v4 delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v9 = [*(id *)(a1 + 32) delegate];
      [v9 presentationCoordinatorDidCancelDismissalTransition:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v7 = (id)[v4 _dismissChildViewController];
    id v8 = (id)[*(id *)(a1 + 32) dismissQuickControlAnimated:0];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  char v6 = [(HUQuickControlPresentationCoordinator *)self targetView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  id v11 = [v5 view];

  BOOL v12 = [(HUQuickControlPresentationCoordinator *)self delegate];
  LOBYTE(self) = objc_msgSend(v12, "presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:", self, v11, v8, v10);

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HUQuickControlPresentationCoordinator *)self singleTapGestureRecognizer];
  if (v9 != v7)
  {

LABEL_4:
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v14 = (objc_class *)objc_opt_class();
      int v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(a2);
      int v20 = 138412546;
      double v21 = v15;
      __int16 v22 = 2112;
      double v23 = v16;
      _os_log_debug_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEBUG, "%@+Controls: %@ returning NO", (uint8_t *)&v20, 0x16u);
    }
    BOOL v12 = 0;
    goto LABEL_7;
  }
  id v10 = [(HUQuickControlPresentationCoordinator *)self doubleTapGestureRecognizer];

  if (v10 != v8) {
    goto LABEL_4;
  }
  id v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    CGAffineTransform v19 = NSStringFromSelector(a2);
    int v20 = 138412546;
    double v21 = v18;
    __int16 v22 = 2112;
    double v23 = v19;
    _os_log_debug_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEBUG, "%@+Controls: %@ returning YES", (uint8_t *)&v20, 0x16u);
  }
  BOOL v12 = 1;
LABEL_7:

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(HUQuickControlPresentationCoordinator *)self touchGestureRecognizer];
  if ((id)v9 == v7)
  {

LABEL_6:
    id v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      double v23 = (objc_class *)objc_opt_class();
      CGAffineTransform v19 = NSStringFromClass(v23);
      int v20 = NSStringFromSelector(a2);
      int v27 = 138413058;
      id v28 = v19;
      __int16 v29 = 2112;
      CGFloat v30 = v20;
      __int16 v31 = 2112;
      id v32 = v7;
      __int16 v33 = 2112;
      id v34 = v8;
      double v21 = "%@+Controls: %@ returning YES (first case) %@ %@";
      goto LABEL_16;
    }
LABEL_7:
    BOOL v15 = 1;
    goto LABEL_14;
  }
  id v10 = (void *)v9;
  id v11 = [(HUQuickControlPresentationCoordinator *)self touchGestureRecognizer];

  if (v11 == v8) {
    goto LABEL_6;
  }
  BOOL v12 = [(HUQuickControlPresentationCoordinator *)self presentationInteraction];
  id v13 = [v12 gestureRecognizerForExclusionRelationship];
  if (v13 == v7)
  {
    id v16 = [(HUQuickControlPresentationCoordinator *)self mutuallyExclusiveGestureRecognizers];
    int v17 = [v16 containsObject:v8];

    if (!v17) {
      goto LABEL_11;
    }
    id v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = (objc_class *)objc_opt_class();
      CGAffineTransform v19 = NSStringFromClass(v18);
      int v20 = NSStringFromSelector(a2);
      int v27 = 138413058;
      id v28 = v19;
      __int16 v29 = 2112;
      CGFloat v30 = v20;
      __int16 v31 = 2112;
      id v32 = v7;
      __int16 v33 = 2112;
      id v34 = v8;
      double v21 = "%@+Controls: %@ returning YES (second case) %@, %@";
LABEL_16:
      _os_log_debug_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEBUG, v21, (uint8_t *)&v27, 0x2Au);

      goto LABEL_7;
    }
    goto LABEL_7;
  }

LABEL_11:
  id v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = (objc_class *)objc_opt_class();
    double v25 = NSStringFromClass(v24);
    uint64_t v26 = NSStringFromSelector(a2);
    int v27 = 138412546;
    id v28 = v25;
    __int16 v29 = 2112;
    CGFloat v30 = v26;
    _os_log_debug_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEBUG, "%@+Controls: %@ returning NO", (uint8_t *)&v27, 0x16u);
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (double)quickControlViewController:(id)a3 sourceViewInitialScaleForPresentation:(BOOL)a4
{
  if (!a4) {
    return 1.0;
  }
  BOOL v4 = [(HUQuickControlPresentationCoordinator *)self activePressedItemContext];
  [v4 currentViewScale];
  double v6 = v5;

  return v6;
}

- (id)quickControlViewController:(id)a3 applierForSourceViewTransitionWithAnimationSettings:(id)a4 presenting:(BOOL)a5
{
  id v7 = a4;
  id v8 = [(HUQuickControlPresentationCoordinator *)self activePressedItemContext];
  uint64_t v9 = [v8 item];

  id v10 = +[HUAnimationApplier dynamicApplierWithAnimationSettings:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __131__HUQuickControlPresentationCoordinator_quickControlViewController_applierForSourceViewTransitionWithAnimationSettings_presenting___block_invoke;
  v13[3] = &unk_1E6392660;
  BOOL v15 = a5;
  v13[4] = self;
  id v14 = v9;
  id v11 = v9;
  [v10 addApplierBlock:v13];

  return v10;
}

uint64_t __131__HUQuickControlPresentationCoordinator_quickControlViewController_applierForSourceViewTransitionWithAnimationSettings_presenting___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    uint64_t v1 = result;
    id v2 = *(void **)(result + 32);
    CGAffineTransformMakeScale(&v3, 1.0, 1.0);
    return [v2 _updateOverrideAttributesWithTransform:&v3 alpha:*(void *)(v1 + 40) forItem:0.0];
  }
  return result;
}

- (BOOL)hasDetailsActionForQuickControlViewController:(id)a3 item:(id)a4
{
  id v5 = a4;
  double v6 = [(HUQuickControlPresentationCoordinator *)self delegate];
  LOBYTE(self) = [v6 hasDetailsActionForPresentationCoordinator:self item:v5];

  return (char)self;
}

- (id)detailsViewControllerForQuickControlViewController:(id)a3 item:(id)a4
{
  id v5 = a4;
  double v6 = [(HUQuickControlPresentationCoordinator *)self delegate];
  id v7 = [v6 detailsViewControllerForPresentationCoordinator:self item:v5];

  return v7;
}

- (void)quickControlViewControllerWillDismissDetailsViewController:(id)a3 shouldDismissQuickControl:(BOOL)a4
{
  if (a4)
  {
    id v6 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    id v5 = [v6 item];
    [(HUQuickControlPresentationCoordinator *)self _pressedStateDidEndForItem:v5 clearPresentationContext:0];
  }
}

- (void)quickControlViewControllerDidTapDetailsButton:(id)a3
{
  id v3 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  [v3 scrollToDetailsViewAnimated:1];
}

- (void)statusDetailsViewControllerDidFinish:(id)a3
{
  id v3 = [(HUQuickControlPresentationCoordinator *)self statusDetailsNavigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    id v7 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    if (v7)
    {
      int isKindOfClass = 0;
    }
    else
    {
      uint64_t v9 = [v6 parentViewController];
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    int isKindOfClass = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    id v11 = [v10 topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_11:

LABEL_12:
      uint64_t v14 = [(HUQuickControlPresentationCoordinator *)self _dismissServiceDetailsViewController:v6 animated:v4];
      goto LABEL_22;
    }
    BOOL v12 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];
    id v13 = [v12 topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      goto LABEL_11;
    }
    BOOL v15 = [(HUQuickControlPresentationCoordinator *)self cardNavigationController];

    if (!v15) {
      goto LABEL_12;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & isKindOfClass)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__HUQuickControlPresentationCoordinator_finishPresentation_animated___block_invoke;
    v22[3] = &unk_1E6386018;
    v22[4] = self;
    [v6 dismissViewControllerAnimated:1 completion:v22];
  }
  else
  {
    id v16 = v6;
    if ([v16 conformsToProtocol:&unk_1F19E7BA8]) {
      int v17 = v16;
    }
    else {
      int v17 = 0;
    }
    id v18 = v17;

    int v19 = [v18 requiresPresentingViewControllerDismissal];
    if (v19)
    {
      uint64_t v14 = [(HUQuickControlPresentationCoordinator *)self _dismissCardViewController];
      goto LABEL_22;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_22:
  int v20 = (void *)v14;

  return v20;
}

void __69__HUQuickControlPresentationCoordinator_finishPresentation_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupForQuickControlDismissal];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [v4 presentationContext];
    [v6 presentationCoordinator:v4 didEndPresentationWithContext:v5];
  }
}

- (void)itemManager:(id)a3 didChangeSourceItem:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  id v8 = [v7 itemManager];

  if (v8 == v12)
  {
    uint64_t v9 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    [v9 setItem:v6];

    id v10 = [v12 childItemsForItem:v6 ofClass:objc_opt_class()];
    id v11 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
    [v11 setControlItems:v10];

    [(HUQuickControlPresentationCoordinator *)self _updateCardController];
  }
}

- (id)_dismissChildViewController
{
  char v3 = [(HUQuickControlPresentationCoordinator *)self settingsViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(HUQuickControlPresentationCoordinator *)self settingsViewController];
    id v6 = (id)[v5 commitChanges];
    goto LABEL_10;
  }
  id v5 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  if ([v5 hideSettings]) {
    goto LABEL_10;
  }
  id v7 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  id v8 = [v7 item];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v9 = [(HUQuickControlPresentationCoordinator *)self settingsViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  id v10 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  int v11 = [v10 settingsUnlocked];

  if (!v11) {
    goto LABEL_11;
  }
  id v5 = [(HUQuickControlPresentationCoordinator *)self settingsViewController];
  [v5 commitChanges];
LABEL_10:

LABEL_11:
  id v12 = [(HUQuickControlPresentationCoordinator *)self settingsViewController];
  if ([v12 conformsToProtocol:&unk_1F19E7BA8]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  [v14 setRequiresPresentingViewControllerDismissal:0];

  return [(HUQuickControlPresentationCoordinator *)self _dismissCardViewController];
}

- (id)_dismissCardViewController
{
  id v3 = [(HUQuickControlPresentationCoordinator *)self dismissQuickControlAnimated:0];
  BOOL v4 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  id v5 = [(HUQuickControlPresentationCoordinator *)self _dismissQuickControlViewControllerAnimated:1];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HUQuickControlPresentationCoordinator__dismissCardViewController__block_invoke;
  v9[3] = &unk_1E6386150;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = (id)[v5 addCompletionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __67__HUQuickControlPresentationCoordinator__dismissCardViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _cleanupForQuickControlDismissal];
  id v2 = [WeakRetained delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    BOOL v4 = [WeakRetained delegate];
    [v4 presentationCoordinator:WeakRetained didEndPresentationWithContext:*(void *)(a1 + 32)];
  }
  [WeakRetained setCardViewController:0];
  [WeakRetained setCardNavigationController:0];
}

- (id)_dismissServiceDetailsViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUQuickControlPresentationCoordinator *)self presentationContext];
  id v8 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(HUQuickControlPresentationCoordinator *)self delegate];
    [v10 presentationCoordinator:self willEndPresentationWithContext:v7];
  }
  id v11 = [(HUQuickControlPresentationCoordinator *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(HUQuickControlPresentationCoordinator *)self delegate];
    [v13 presentationCoordinatorWillBeginTransition:self presenting:0];
  }
  id v14 = [(HUQuickControlPresentationCoordinator *)self transitionBlurView];
  [v14 removeFromSuperview];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  int v20 = __87__HUQuickControlPresentationCoordinator__dismissServiceDetailsViewController_animated___block_invoke;
  double v21 = &unk_1E63850E0;
  __int16 v22 = self;
  id v23 = v7;
  id v15 = v7;
  [v6 dismissViewControllerAnimated:v4 completion:&v18];

  id v16 = objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithNoResult", v18, v19, v20, v21, v22);

  return v16;
}

void __87__HUQuickControlPresentationCoordinator__dismissServiceDetailsViewController_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupForQuickControlDismissal];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 presentationCoordinator:*(void *)(a1 + 32) didEndPresentationWithContext:*(void *)(a1 + 40)];
  }
}

- (BOOL)_isRTL
{
  id v2 = [(HUQuickControlPresentationCoordinator *)self cardViewController];
  char v3 = [v2 traitCollection];
  BOOL v4 = [v3 layoutDirection] == 1;

  return v4;
}

- (CGRect)sourceFrameForAnimationController
{
  char v3 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [MEMORY[0x1E4F69138] isHomeControlService];

    if ((v4 & 1) == 0)
    {
      id v5 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v6 = [(HUQuickControlPresentationCoordinator *)self presentingViewController];
  id v5 = [v6 presentingViewController];

LABEL_6:
  id v7 = [v5 splitViewController];
  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
  {
    id v8 = [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
    [(HUQuickControlPresentationCoordinator *)self pressedTile_legacy];
  }
  else
  {
    id v8 = [(HUQuickControlPresentationCoordinator *)self pressedTile];
    [(HUQuickControlPresentationCoordinator *)self pressedTile];
  char v9 = };
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if (v7) {
    uint64_t v18 = v7;
  }
  else {
    uint64_t v18 = v5;
  }
  uint64_t v19 = [v18 view];
  objc_msgSend(v8, "convertRect:toView:", v19, v11, v13, v15, v17);
  CGFloat x = v20;
  CGFloat y = v22;
  CGFloat width = v24;
  CGFloat height = v26;

  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0)
  {
    id v28 = [v5 presentationController];
    [v28 frameOfPresentedViewInContainerView];
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    CGRect v38 = CGRectOffset(v37, v30, v32);
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
  }

  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (HUCardViewController)cardViewController
{
  return self->_cardViewController;
}

- (void)setCardViewController:(id)a3
{
}

- (HUQuickControlPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (HUQuickControlContainerViewController)quickControlViewController
{
  return self->_quickControlViewController;
}

- (void)setQuickControlViewController:(id)a3
{
}

- (HUGridServiceCell)pressedTile_legacy
{
  return self->_pressedTile_legacy;
}

- (void)setPressedTile_legacy:(id)a3
{
}

- (HUQuickControlPresentationTransitionDelegate)pressedTile
{
  return self->_pressedTile;
}

- (void)setPressedTile:(id)a3
{
}

- (HUQuickControlPresentationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUQuickControlPresentationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (HUQuickControlNavigationController)cardNavigationController
{
  return self->_cardNavigationController;
}

- (void)setCardNavigationController:(id)a3
{
}

- (UIViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
}

- (UINavigationController)statusDetailsNavigationController
{
  return self->_statusDetailsNavigationController;
}

- (void)setStatusDetailsNavigationController:(id)a3
{
}

- (UIViewController)statusDetailsViewController
{
  return self->_statusDetailsViewController;
}

- (void)setStatusDetailsViewController:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (HUForceInterpolatedPressGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void)setPressGestureRecognizer:(id)a3
{
}

- (NACancelable)pressGestureActiveTimerCancellationToken
{
  return self->_pressGestureActiveTimerCancellationToken;
}

- (void)setPressGestureActiveTimerCancellationToken:(id)a3
{
}

- (NSMapTable)pressedItemContexts
{
  return self->_pressedItemContexts;
}

- (UIView)pressedTileBlurEffectView
{
  return self->_pressedTileBlurEffectView;
}

- (void)setPressedTileBlurEffectView:(id)a3
{
}

- (UIView)pressedTilePrerenderedView
{
  return self->_pressedTilePrerenderedView;
}

- (void)setPressedTilePrerenderedView:(id)a3
{
}

- (HUIconView)transitionIconView
{
  return self->_transitionIconView;
}

- (void)setTransitionIconView:(id)a3
{
}

- (HUIconView)transitionIconViewVibrant
{
  return self->_transitionIconViewVibrant;
}

- (void)setTransitionIconViewVibrant:(id)a3
{
}

- (UILabel)transitionPrimaryLabel
{
  return self->_transitionPrimaryLabel;
}

- (void)setTransitionPrimaryLabel:(id)a3
{
}

- (HUGridServiceCellTextView)transitionTextView
{
  return self->_transitionTextView;
}

- (void)setTransitionTextView:(id)a3
{
}

- (HUGridServiceCellTextView)transitionTextViewVibrant
{
  return self->_transitionTextViewVibrant;
}

- (void)setTransitionTextViewVibrant:(id)a3
{
}

- (UIVisualEffectView)transitionTextViewVibrantEffectView
{
  return self->_transitionTextViewVibrantEffectView;
}

- (void)setTransitionTextViewVibrantEffectView:(id)a3
{
}

- (HUGridActionSetTitleAndDescriptionView)transitionTitleAndDescriptionView
{
  return self->_transitionTitleAndDescriptionView;
}

- (void)setTransitionTitleAndDescriptionView:(id)a3
{
}

- (UIVisualEffectView)transitionTitleAndDescriptionVibrantEffectView
{
  return self->_transitionTitleAndDescriptionVibrantEffectView;
}

- (void)setTransitionTitleAndDescriptionVibrantEffectView:(id)a3
{
}

- (UILabel)transitionSecondaryLabel
{
  return self->_transitionSecondaryLabel;
}

- (void)setTransitionSecondaryLabel:(id)a3
{
}

- (UIVisualEffectView)transitionSecondaryLabelVibrantEffectView
{
  return self->_transitionSecondaryLabelVibrantEffectView;
}

- (void)setTransitionSecondaryLabelVibrantEffectView:(id)a3
{
}

- (UIVisualEffectView)transitionBlurView
{
  return self->_transitionBlurView;
}

- (void)setTransitionBlurView:(id)a3
{
}

- (HUBaseIconView)transitionBaseIconView
{
  return self->_transitionBaseIconView;
}

- (void)setTransitionBaseIconView:(id)a3
{
}

- (UIView)transitionBackgroundView
{
  return self->_transitionBackgroundView;
}

- (void)setTransitionBackgroundView:(id)a3
{
}

- (UILabel)transitionPrefixLabel
{
  return self->_transitionPrefixLabel;
}

- (void)setTransitionPrefixLabel:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_transitionPrefixLabel, 0);
  objc_storeStrong((id *)&self->_transitionBackgroundView, 0);
  objc_storeStrong((id *)&self->_transitionBaseIconView, 0);
  objc_storeStrong((id *)&self->_transitionBlurView, 0);
  objc_storeStrong((id *)&self->_transitionSecondaryLabelVibrantEffectView, 0);
  objc_storeStrong((id *)&self->_transitionSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_transitionTitleAndDescriptionVibrantEffectView, 0);
  objc_storeStrong((id *)&self->_transitionTitleAndDescriptionView, 0);
  objc_storeStrong((id *)&self->_transitionTextViewVibrantEffectView, 0);
  objc_storeStrong((id *)&self->_transitionTextViewVibrant, 0);
  objc_storeStrong((id *)&self->_transitionTextView, 0);
  objc_storeStrong((id *)&self->_transitionPrimaryLabel, 0);
  objc_storeStrong((id *)&self->_transitionIconViewVibrant, 0);
  objc_storeStrong((id *)&self->_transitionIconView, 0);
  objc_storeStrong((id *)&self->_pressedTilePrerenderedView, 0);
  objc_storeStrong((id *)&self->_pressedTileBlurEffectView, 0);
  objc_storeStrong((id *)&self->_presentationInteraction, 0);
  objc_storeStrong((id *)&self->_pressedItemContexts, 0);
  objc_storeStrong((id *)&self->_touchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pressGestureActiveTimerCancellationToken, 0);
  objc_storeStrong((id *)&self->_mutuallyExclusiveGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusDetailsViewController, 0);
  objc_storeStrong((id *)&self->_statusDetailsNavigationController, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_cardNavigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_pressedTile, 0);
  objc_storeStrong((id *)&self->_pressedTile_legacy, 0);
  objc_storeStrong((id *)&self->_quickControlViewController, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);

  objc_storeStrong((id *)&self->_cardViewController, 0);
}

@end