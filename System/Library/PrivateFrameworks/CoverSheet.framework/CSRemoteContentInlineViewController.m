@interface CSRemoteContentInlineViewController
- (BOOL)_dismissesOnTap;
- (BOOL)_reducesWhitePoint;
- (BOOL)_supportsLuminanceReductionForCurrentBackgroundStyle;
- (BOOL)_suppressesBottomEdgeContent;
- (BOOL)dismissForDismissType:(int64_t)a3 completion:(id)a4;
- (BOOL)handleEvent:(id)a3;
- (BOOL)insetsMargins;
- (BOOL)isInUnlockGestureMode;
- (BOOL)remoteContentHidden;
- (BOOL)shouldDismissInlineContentForNowPlaying;
- (BOOL)shouldInlineContentReceiveBackgroundTouches;
- (BOOL)suppressesDismissalForNotification;
- (BOOL)suppressesDismissalGesture;
- (BOOL)usesBackgroundView;
- (CGRect)inlineContentFrame;
- (CSDashBoardRemoteContentSettings)remoteContentSettings;
- (CSDateViewComponent)dateTimeComponent;
- (CSRemoteContentHostViewController)hostViewController;
- (CSRemoteContentInlineViewController)initWithContentDefinition:(id)a3 preferences:(id)a4 hostViewController:(id)a5 authenticationStatusProvider:(id)a6;
- (CSRemoteContentViewControllerDelegate)delegate;
- (NSArray)requiredVisualStyleCategories;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (double)remoteContentHeight;
- (id)_newDisplayLayoutElement;
- (int64_t)_backgroundStyle;
- (int64_t)_dateTimeStyle;
- (int64_t)_homeGestureMode;
- (int64_t)contentPresentationType;
- (int64_t)preferredNotificationListMode;
- (void)_addChildHostViewController:(id)a3;
- (void)_didReceiveScroll;
- (void)_didReceiveTouch;
- (void)_dismissForced:(BOOL)a3 animated:(BOOL)a4;
- (void)_removeChildHostViewController;
- (void)_setUserHasInteractedSinceWake:(BOOL)a3;
- (void)_updateContentAlpha:(double)a3 interactive:(BOOL)a4;
- (void)_updateDisplayLayoutElementForActivation:(id)a3;
- (void)_updatePreferredContentSize;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)beginCancelTouchesForCurrentEventInHostedContent;
- (void)dealloc;
- (void)endCancelTouchesForCurrentEventInHostedContent;
- (void)hostDidChangeContentBounds;
- (void)loadView;
- (void)remoteDidChangeStyle;
- (void)setContainerSize:(CGSize)a3;
- (void)setDateTimeComponent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setRemoteContentHidden:(BOOL)a3;
- (void)setRemoteContentSettings:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation CSRemoteContentInlineViewController

- (CSRemoteContentInlineViewController)initWithContentDefinition:(id)a3 preferences:(id)a4 hostViewController:(id)a5 authenticationStatusProvider:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CSRemoteContentInlineViewController;
  v15 = [(CSRemoteContentInlineViewController *)&v28 init];
  v16 = (id *)v15;
  if (!v15) {
    goto LABEL_7;
  }
  if (v11 && v12 && v13 && v14)
  {
    *(_OWORD *)(v15 + 1048) = *MEMORY[0x1E4F1DB30];
    objc_storeStrong((id *)v15 + 136, a3);
    objc_storeStrong(v16 + 137, a4);
    objc_storeStrong(v16 + 141, a6);
    objc_storeWeak(v16 + 142, v13);
    v17 = objc_opt_new();
    v18 = [v17 priority:30];
    v19 = [v16 appearanceIdentifier];
    uint64_t v20 = [v18 identifier:v19];
    id v21 = v16[143];
    v16[143] = (id)v20;

    v22 = +[CSLockScreenDomain rootSettings];
    uint64_t v23 = [v22 dashBoardRemoteContentSettings];
    id v24 = v16[144];
    v16[144] = (id)v23;

    [v16[144] addKeyObserver:v16];
LABEL_7:
    v25 = v16;
    goto LABEL_11;
  }
  v26 = SBLogDashBoard();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v30 = v16;
    __int16 v31 = 1024;
    BOOL v32 = v11 != 0;
    __int16 v33 = 1024;
    BOOL v34 = v12 != 0;
    __int16 v35 = 1024;
    BOOL v36 = v13 != 0;
    __int16 v37 = 1024;
    BOOL v38 = v14 != 0;
    _os_log_impl(&dword_1D839D000, v26, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Missing required parameters for init; definition: %d, preferences: %d, hostVC: %d, aut"
      "henticationStatusProvider: %d",
      buf,
      0x24u);
  }

  v25 = 0;
LABEL_11:

  return v25;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  if ([(CSRemoteContentInlineViewController *)self isViewLoaded] && WeakRetained) {
    [(CSRemoteContentInlineViewController *)self bs_removeChildViewController:WeakRetained];
  }

  v4.receiver = self;
  v4.super_class = (Class)CSRemoteContentInlineViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [CSRemoteContentInlineView alloc];
  objc_super v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  v6 = -[CSRemoteContentInlineView initWithFrame:](v3, "initWithFrame:");

  [(CSRemoteContentInlineView *)v6 setAutoresizingMask:0];
  [(CSRemoteContentInlineViewController *)self setView:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  if (WeakRetained) {
    [(CSRemoteContentInlineViewController *)self _addChildHostViewController:WeakRetained];
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  v14.receiver = self;
  v14.super_class = (Class)CSRemoteContentInlineViewController;
  [(CSCoverSheetViewControllerBase *)&v14 viewDidLayoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_hostViewController);
  objc_super v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  LODWORD(v2) = (unint64_t)([(CSRemoteContentInlineViewController *)v2 interfaceOrientation]- 1) < 2;
  [WeakRetained safeAreaForRemote];
  unsigned int v10 = (v8 < v6) ^ v2;
  if (v10) {
    double v11 = v8;
  }
  else {
    double v11 = v6;
  }
  if (!v10) {
    double v6 = v8;
  }
  double v12 = -(v9 + 8.0);
  id v13 = [WeakRetained view];
  objc_msgSend(v13, "setFrame:", 0.0, v12, v6, v11);
}

- (BOOL)suppressesDismissalForNotification
{
  return [(SBSRemoteContentPreferences *)self->_remoteContentPreferences suppressesNotifications];
}

- (int64_t)preferredNotificationListMode
{
  return [(SBSRemoteContentPreferences *)self->_remoteContentPreferences preferredNotificationListMode];
}

- (BOOL)suppressesDismissalGesture
{
  return (unint64_t)([(CSRemoteContentInlineViewController *)self _homeGestureMode] - 1) < 2;
}

- (BOOL)isInUnlockGestureMode
{
  return [(CSRemoteContentInlineViewController *)self _homeGestureMode] == 4;
}

- (double)remoteContentHeight
{
  [(CSRemoteContentInlineViewController *)self inlineContentFrame];
  BOOL IsNull = CGRectIsNull(v15);
  double result = 0.0;
  if (!IsNull)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    [WeakRetained safeAreaForRemote];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    [(CSRemoteContentInlineViewController *)self inlineContentFrame];
    CGRect v17 = CGRectIntegral(v16);
    double MaxY = CGRectGetMaxY(v17);
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    CGRect v19 = CGRectIntegral(v18);
    return MaxY - CGRectGetMinY(v19);
  }
  return result;
}

- (void)setRemoteContentHidden:(BOOL)a3
{
  self->_remoteContentHidden = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  [WeakRetained setHidden:self->_remoteContentHidden];
}

- (void)setHostViewController:(id)a3
{
  id obj = a3;
  uint64_t v4 = [(CSRemoteContentInlineViewController *)self _removeChildHostViewController];
  if (obj)
  {
    objc_storeWeak((id *)&self->_hostViewController, obj);
    uint64_t v4 = [(CSRemoteContentInlineViewController *)self isViewLoaded];
    if (v4) {
      uint64_t v4 = [(CSRemoteContentInlineViewController *)self _addChildHostViewController:obj];
    }
  }

  MEMORY[0x1F4181820](v4);
}

- (BOOL)dismissForDismissType:(int64_t)a3 completion:(id)a4
{
  self->_dismissing = 1;
  id v6 = a4;
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  [WeakRetained didDismissForDismissType:a3];

  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a3) = [v8 remoteContentViewController:self requestsDismissalForType:a3 completion:v6];

  return a3;
}

- (int64_t)contentPresentationType
{
  return 1;
}

- (void)hostDidChangeContentBounds
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  [WeakRetained hostDidChangeContentBounds];

  id v4 = [(CSRemoteContentInlineViewController *)self viewIfLoaded];
  [v4 setNeedsLayout];
}

- (void)remoteDidChangeStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  id obj = [WeakRetained contentPreferences];

  if (obj)
  {
    objc_storeStrong((id *)&self->_remoteContentPreferences, obj);
    if ([(CSRemoteContentInlineViewController *)self _suppressesBottomEdgeContent]) {
      [(CSRemoteContentInlineViewController *)self _setUserHasInteractedSinceWake:1];
    }
  }
  id v4 = +[CSAction actionWithType:3];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];

  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CSRemoteContentInlineViewController;
  [(CSCoverSheetViewControllerBase *)&v31 aggregateAppearance:v4];
  if (!self->_remoteContentPreferences || self->_dismissing) {
    goto LABEL_25;
  }
  int64_t v5 = [(CSRemoteContentInlineViewController *)self _backgroundStyle];
  int64_t v6 = [(CSRemoteContentInlineViewController *)self _dateTimeStyle];
  switch(v5)
  {
    case 0:
      int v8 = 0;
      char v7 = 1;
      uint64_t v9 = 1;
      break;
    case 1:
      char v7 = 0;
      int v8 = 0;
      uint64_t v9 = 5;
      break;
    case 2:
      char v7 = 0;
      int v8 = 1;
      uint64_t v9 = 6;
      break;
    case 3:
    case 4:
      char v7 = 0;
      int v8 = 1;
      uint64_t v9 = 7;
      break;
    default:
      char v7 = 0;
      uint64_t v9 = 0;
      int v8 = 0;
      break;
  }
  double v10 = objc_opt_new();
  CGFloat v11 = [v10 priority:30];
  double v12 = [NSNumber numberWithInteger:v9];
  CGFloat v13 = [v11 style:v12];
  [v4 addComponent:v13];

  if ((v7 & 1) == 0)
  {
    objc_super v14 = objc_opt_new();
    CGRect v15 = [v14 priority:30];
    CGRect v16 = [v15 shouldRenderInline:1];
    [v4 addComponent:v16];
  }
  if (v8)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F43228]);
    CGRect v18 = [MEMORY[0x1E4F428B8] whiteColor];
    CGRect v19 = (void *)[v17 initWithStyle:1 contentColor:v18];
    [v4 setLegibilitySettings:v19];
  }
  switch(v6)
  {
    case 0:
      dateTimeComponent = self->_dateTimeComponent;
      uint64_t v23 = 0;
LABEL_19:
      [(CSDateViewComponent *)dateTimeComponent setVibrantAndCentered:v23];
      uint64_t v20 = self->_dateTimeComponent;
      uint64_t v21 = 0;
      goto LABEL_20;
    case 1:
      dateTimeComponent = self->_dateTimeComponent;
      uint64_t v23 = 1;
      goto LABEL_19;
    case 2:
      [(CSDateViewComponent *)self->_dateTimeComponent setVibrantAndCentered:0];
      uint64_t v20 = self->_dateTimeComponent;
      uint64_t v21 = 1;
LABEL_20:
      [(CSDateViewComponent *)v20 setHidesTime:v21];
      break;
  }
  [v4 addComponent:self->_dateTimeComponent];
  if ([(CSRemoteContentInlineViewController *)self _suppressesBottomEdgeContent])
  {
    id v24 = +[CSComponent quickActions];
    v25 = [v24 priority:30];
    v26 = [v25 hidden:1];
    [v4 addComponent:v26];
  }
  if ([(CSRemoteContentInlineViewController *)self _reducesWhitePoint])
  {
    [(CSRemoteContentInlineViewController *)self _backgroundStyle];
    v27 = objc_opt_new();
    objc_super v28 = [v27 priority:30];
    v29 = [v28 lighterReduction:BSSettingFlagForBool()];
    v30 = [v29 hidden:0];
    [v4 addComponent:v30];
  }
LABEL_25:
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSRemoteContentInlineViewController;
  [(CSCoverSheetViewControllerBase *)&v8 aggregateBehavior:v4];
  [v4 addRestrictedCapabilities:0x2000];
  [v4 removeRestrictedCapabilities:4096];
  [v4 removeRestrictedCapabilities:130];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  if (WeakRetained)
  {
    if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings autoExtendsIdleTimer]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    if (self->_userHasInteractedSinceWake) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v6 = 2;
    uint64_t v7 = 2;
  }
  [v4 setIdleTimerMode:v6];
  [v4 setIdleTimerDuration:v7];
}

- (id)_newDisplayLayoutElement
{
  v2 = [(SBSRemoteContentDefinition *)self->_definition serviceName];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FA6A68]) initWithIdentifier:v2];
    [v3 setFillsDisplayBounds:1];
    [v3 setLayoutRole:6];
    [v3 setUIApplicationElement:1];
    [v3 setBundleIdentifier:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSRemoteContentInlineViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 _updateDisplayLayoutElementForActivation:v4];
  objc_msgSend(v4, "sb_setTransitioning:", (-[CSRemoteContentInlineViewController _appearState](self, "_appearState", v5.receiver, v5.super_class) & 0xFFFFFFFD) == 1);
}

- (BOOL)shouldDismissInlineContentForNowPlaying
{
  if ((unint64_t)([(CSRemoteContentInlineViewController *)self interfaceOrientation] - 3) < 2) {
    return 1;
  }

  return [(CSRemoteContentInlineViewController *)self _dismissesOnTap];
}

- (BOOL)shouldInlineContentReceiveBackgroundTouches
{
  if ([(CSRemoteContentInlineViewController *)self _dismissesOnTap]) {
    return 1;
  }
  remoteContentSettings = self->_remoteContentSettings;

  return [(CSDashBoardRemoteContentSettings *)remoteContentSettings undimsOnTap];
}

- (CGRect)inlineContentFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  [WeakRetained contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    [(CSRemoteContentInlineViewController *)self _updatePreferredContentSize];
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)usesBackgroundView
{
  return 0;
}

- (BOOL)insetsMargins
{
  return 0;
}

- (void)_didReceiveTouch
{
  if ([(CSRemoteContentInlineViewController *)self _dismissesOnTap])
  {
    id v3 = +[CSAction actionWithType:1];
    [(CSCoverSheetViewControllerBase *)self sendAction:v3];
  }
  else if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings undimsOnTap])
  {
    [(CSRemoteContentInlineViewController *)self _setUserHasInteractedSinceWake:1];
  }
}

- (void)_didReceiveScroll
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings undimsOnTap])
  {
    [(CSRemoteContentInlineViewController *)self _setUserHasInteractedSinceWake:1];
  }
}

- (void)_setUserHasInteractedSinceWake:(BOOL)a3
{
  if (self->_userHasInteractedSinceWake != a3)
  {
    self->_userHasInteractedSinceWake = a3;
    [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
    [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
  }
}

- (void)beginCancelTouchesForCurrentEventInHostedContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  id v3 = [WeakRetained _cancelTouchesForCurrentEventInHostedContent];
  id cancelInlineContentTouchesAssertion = self->_cancelInlineContentTouchesAssertion;
  self->_id cancelInlineContentTouchesAssertion = v3;
}

- (void)endCancelTouchesForCurrentEventInHostedContent
{
  self->_id cancelInlineContentTouchesAssertion = 0;
  MEMORY[0x1F41817F8]();
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_remoteContentSettings == a3) {
    -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self, a4);
  }
}

- (void)_updateContentAlpha:(double)a3 interactive:(BOOL)a4
{
  BOOL v4 = !a4;
  alphaSettings = self->_alphaSettings;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CSRemoteContentInlineViewController__updateContentAlpha_interactive___block_invoke;
  v7[3] = &unk_1E6AD9748;
  if (v4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 5;
  }
  v7[4] = self;
  *(double *)&v7[5] = a3;
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", alphaSettings, v6, v7, 0);
}

uint64_t __71__CSRemoteContentInlineViewController__updateContentAlpha_interactive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1064) setValue:*(double *)(a1 + 40)];
}

- (void)_dismissForced:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(CSRemoteContentInlineViewController *)self suppressesDismissalGesture] || v5)
  {
    self->_dismissing = 1;
    double v7 = 0.3;
    if (!v4) {
      double v7 = 0.0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__CSRemoteContentInlineViewController__dismissForced_animated___block_invoke;
    v9[3] = &unk_1E6AD87F8;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__CSRemoteContentInlineViewController__dismissForced_animated___block_invoke_2;
    v8[3] = &unk_1E6AD8A40;
    v8[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v9 animations:v8 completion:v7];
  }
}

void __63__CSRemoteContentInlineViewController__dismissForced_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 setBackgroundColor:0];
}

void __63__CSRemoteContentInlineViewController__dismissForced_animated___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  id v3 = *(void **)(a1 + 32);
  id v4 = +[CSAction actionWithType:1];
  [v3 sendAction:v4];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSRemoteContentInlineViewController;
  if ([(CSCoverSheetViewControllerBase *)&v8 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    goto LABEL_6;
  }
  uint64_t v5 = [v4 type];
  if (v5 == 22)
  {
    if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings undimsOnTap]) {
      [(CSRemoteContentInlineViewController *)self _setUserHasInteractedSinceWake:1];
    }
    goto LABEL_9;
  }
  if (v5 != 25)
  {
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_10;
  }
  [(CSRemoteContentInlineViewController *)self _setUserHasInteractedSinceWake:0];
LABEL_6:
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (void)_addChildHostViewController:(id)a3
{
  id v4 = a3;
  [v4 setServiceViewShouldShareTouchesWithHost:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__CSRemoteContentInlineViewController__addChildHostViewController___block_invoke;
  v6[3] = &unk_1E6AD8AF8;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  [(CSRemoteContentInlineViewController *)self bs_addChildViewController:v5 animated:1 transitionBlock:v6];
}

void __67__CSRemoteContentInlineViewController__addChildHostViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  id v3 = [*(id *)(a1 + 40) view];
  [v3 bounds];
  objc_msgSend(v2, "setFrame:");

  id v4 = [*(id *)(a1 + 32) view];
  [v4 setAutoresizingMask:0];

  [*(id *)(a1 + 32) safeAreaForRemote];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) view];
  CGAffineTransformMakeTranslation(&v10, 0.0, -v6);
  [v7 setTransform:&v10];

  objc_super v8 = [*(id *)(a1 + 40) view];
  double v9 = [*(id *)(a1 + 32) view];
  [v8 sendSubviewToBack:v9];
}

- (void)_removeChildHostViewController
{
  if ([(CSRemoteContentInlineViewController *)self isViewLoaded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    if (WeakRetained) {
      [(CSRemoteContentInlineViewController *)self bs_removeChildViewController:WeakRetained];
    }
  }

  objc_storeWeak((id *)&self->_hostViewController, 0);
}

- (int64_t)_dateTimeStyle
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
  {
    remoteContentSettings = self->_remoteContentSettings;
    return [(CSDashBoardRemoteContentSettings *)remoteContentSettings dateTimeStyleOverride];
  }
  else
  {
    remoteContentPreferences = self->_remoteContentPreferences;
    return [(SBSRemoteContentPreferences *)remoteContentPreferences dateTimeStyle];
  }
}

- (int64_t)_backgroundStyle
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
  {
    remoteContentSettings = self->_remoteContentSettings;
    return [(CSDashBoardRemoteContentSettings *)remoteContentSettings backgroundStyleOverride];
  }
  else
  {
    remoteContentPreferences = self->_remoteContentPreferences;
    return [(SBSRemoteContentPreferences *)remoteContentPreferences backgroundStyle];
  }
}

- (int64_t)_homeGestureMode
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
  {
    remoteContentSettings = self->_remoteContentSettings;
    return [(CSDashBoardRemoteContentSettings *)remoteContentSettings homeGestureModeOverride];
  }
  else if ([(SBFAuthenticationStatusProvider *)self->_authenticationStatusProvider hasAuthenticatedAtLeastOnceSinceBoot])
  {
    remoteContentPreferences = self->_remoteContentPreferences;
    return [(SBSRemoteContentPreferences *)remoteContentPreferences homeGestureMode];
  }
  else
  {
    return 4;
  }
}

- (BOOL)_suppressesBottomEdgeContent
{
  return [(SBSRemoteContentPreferences *)self->_remoteContentPreferences suppressesBottomEdgeContent];
}

- (BOOL)_dismissesOnTap
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
  {
    remoteContentSettings = self->_remoteContentSettings;
    return [(CSDashBoardRemoteContentSettings *)remoteContentSettings dismissesOnTapOverride];
  }
  else
  {
    remoteContentPreferences = self->_remoteContentPreferences;
    return [(SBSRemoteContentPreferences *)remoteContentPreferences dismissesOnTap];
  }
}

- (BOOL)_reducesWhitePoint
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings forceLuminanceReduction]|| (int v3 = [(SBSRemoteContentPreferences *)self->_remoteContentPreferences reducesWhitePoint]) != 0)
  {
    LOBYTE(v3) = [(CSRemoteContentInlineViewController *)self _supportsLuminanceReductionForCurrentBackgroundStyle];
  }
  return v3;
}

- (BOOL)_supportsLuminanceReductionForCurrentBackgroundStyle
{
  return (unint64_t)([(CSRemoteContentInlineViewController *)self _backgroundStyle] - 2) < 3;
}

- (void)_updatePreferredContentSize
{
  [(CSRemoteContentInlineViewController *)self remoteContentHeight];
  double v4 = v3;
  -[CSRemoteContentInlineViewController setPreferredContentSize:](self, "setPreferredContentSize:", self->_containerSize.width, v3);
  id v5 = [(CSRemoteContentInlineViewController *)self viewIfLoaded];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, self->_containerSize.width, v4);
}

- (CSRemoteContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSRemoteContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (CSRemoteContentHostViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (CSRemoteContentHostViewController *)WeakRetained;
}

- (BOOL)remoteContentHidden
{
  return self->_remoteContentHidden;
}

- (CSDateViewComponent)dateTimeComponent
{
  return self->_dateTimeComponent;
}

- (void)setDateTimeComponent:(id)a3
{
}

- (CSDashBoardRemoteContentSettings)remoteContentSettings
{
  return self->_remoteContentSettings;
}

- (void)setRemoteContentSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteContentSettings, 0);
  objc_storeStrong((id *)&self->_dateTimeComponent, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_cancelInlineContentTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_remoteContentPreferences, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_alphaSettings, 0);

  objc_storeStrong((id *)&self->_alphaProperty, 0);
}

@end