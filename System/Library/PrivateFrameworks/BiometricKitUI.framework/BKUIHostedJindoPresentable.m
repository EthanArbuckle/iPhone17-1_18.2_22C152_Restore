@interface BKUIHostedJindoPresentable
+ (id)_bundleID;
- (BKJindoPresentableObserving)observingDelegate;
- (BKUIHostedJindoPresentable)initWithCustomLayout:(int64_t)a3 enrollView:(id)a4 destination:(int64_t)a5;
- (BKUIPearlEnrollView)enrollView;
- (BNBannerSourceLayoutDescription)layoutDescription;
- (BNPresentableContext)presentableContext;
- (BOOL)canRequestAlertingAssertion;
- (BOOL)isTouchOutsideDismissalEnabled;
- (BOOL)preventsInteractiveDismissal;
- (BOOL)providesHostedContent;
- (NSLayoutConstraint)centerYAnchor;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIView)contentView;
- (UIViewController)rootViewController;
- (double)height;
- (id)userInfoForPosting;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)destination;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredCustomLayout;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)collapse;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)revoke;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setCanRequestAlertingAssertion:(BOOL)a3;
- (void)setCenterYAnchor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setEnrollView:(id)a3;
- (void)setHeight:(double)a3;
- (void)setLayoutDescription:(id)a3;
- (void)setObservingDelegate:(id)a3;
- (void)setPreferredCustomLayout:(int64_t)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPresentableContext:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation BKUIHostedJindoPresentable

- (BKUIHostedJindoPresentable)initWithCustomLayout:(int64_t)a3 enrollView:(id)a4 destination:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BKUIHostedJindoPresentable;
  v10 = [(BKUIHostedJindoPresentable *)&v13 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    v10->_destination = a5;
    objc_storeStrong((id *)&v10->_enrollView, a4);
    v11->_preferredLayoutMode = 4;
    v11->_preferredCustomLayout = a3;
  }

  return v11;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (BKUIPearlEnrollView)enrollView
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  enrollView = self->_enrollView;

  return enrollView;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__BKUIHostedJindoPresentable_viewWillLayoutSubviewsWithTransitionCoordinator___block_invoke;
  v3[3] = &unk_1E6EA2770;
  v3[4] = self;
  [a3 animateAlongsideTransition:v3 completion:0];
}

void __78__BKUIHostedJindoPresentable_viewWillLayoutSubviewsWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) enrollView];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) enrollView];
  [v3 layoutIfNeeded];
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)BKUIHostedJindoPresentable;
  [(BKUIHostedJindoPresentable *)&v21 viewWillAppear:a3];
  v4 = [(BKUIHostedJindoPresentable *)self view];
  v5 = [(BKUIHostedJindoPresentable *)self enrollView];
  [v4 addSubview:v5];

  v20 = [(BKUIHostedJindoPresentable *)self enrollView];
  v18 = [v20 centerYAnchor];
  v19 = [(BKUIHostedJindoPresentable *)self view];
  v17 = [v19 centerYAnchor];
  v6 = [v18 constraintEqualToAnchor:v17];
  [(BKUIHostedJindoPresentable *)self setCenterYAnchor:v6];
  v7 = (void *)MEMORY[0x1E4F28DC8];
  v8 = [(BKUIHostedJindoPresentable *)self enrollView];
  id v9 = [v8 centerXAnchor];
  v10 = [(BKUIHostedJindoPresentable *)self view];
  v11 = [v10 centerXAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v22[0] = v12;
  objc_super v13 = [(BKUIHostedJindoPresentable *)self centerYAnchor];
  v22[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v7 activateConstraints:v14];

  v15 = [(BKUIHostedJindoPresentable *)self enrollView];
  v16 = [(BKUIHostedJindoPresentable *)self view];
  [v15 setupAnimationViewWithSuperView:v16];
}

- (void)revoke
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F4F5B8];
  int64_t v4 = [(BKUIHostedJindoPresentable *)self destination];
  v5 = [(BKUIHostedJindoPresentable *)self requesterIdentifier];
  v6 = [v3 bannerSourceForDestination:v4 forRequesterIdentifier:v5];

  v7 = [(BKUIHostedJindoPresentable *)self requestIdentifier];
  id v11 = 0;
  id v8 = (id)[v6 revokePresentableWithRequestIdentifier:v7 reason:@"revoke" animated:1 userInfo:0 error:&v11];
  id v9 = v11;

  if (v9)
  {
    v10 = _BKUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "Error revoking post  %{public}@", buf, 0xCu);
    }
  }
}

- (void)collapse
{
  [(BKUIHostedJindoPresentable *)self setPreferredCustomLayout:1];
  id v3 = [(BKUIHostedJindoPresentable *)self systemApertureElementContext];
  [v3 setElementNeedsUpdate];
}

- (id)userInfoForPosting
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FA7FB8];
  v5[0] = MEMORY[0x1E4F1CC38];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (NSString)requesterIdentifier
{
  v2 = objc_opt_class();

  return (NSString *)[v2 _bundleID];
}

- (NSString)requestIdentifier
{
  requestIdentifier = self->_requestIdentifier;
  if (!requestIdentifier)
  {
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    v5 = [v4 UUIDString];
    v6 = self->_requestIdentifier;
    self->_requestIdentifier = v5;

    requestIdentifier = self->_requestIdentifier;
  }

  return requestIdentifier;
}

+ (id)_bundleID
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BKUIHostedJindoPresentable__bundleID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundleID_onceToken != -1) {
    dispatch_once(&_bundleID_onceToken, block);
  }
  v2 = (void *)_bundleID___bundleID;

  return v2;
}

void __39__BKUIHostedJindoPresentable__bundleID__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v1 = [v3 bundleIdentifier];
  v2 = (void *)_bundleID___bundleID;
  _bundleID___bundleID = v1;
}

- (unint64_t)presentationBehaviors
{
  return 2;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  if (self->_activeLayoutMode != a3)
  {
    self->_activeLayoutMode = a3;
    id v4 = [(BKUIHostedJindoPresentable *)self observingDelegate];
    [v4 didChangeActiveLayoutMode:self];
  }
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return 0;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return 0;
}

- (void)setCanRequestAlertingAssertion:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self->_canRequestAlertingAssertion = a3;
  if (a3)
  {
    id v4 = [(BKUIHostedJindoPresentable *)self systemApertureElementContext];
    v5 = [v4 requestAlertingAssertion];
    [v5 setAutomaticallyInvalidatable:0];

    v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = self;
      v7 = "Jindo: Acquired alert assertion %p";
LABEL_6:
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = self;
      v7 = "Jindo: Could not get alert assertion, host set setCanRequestAlertingAssertion NO %p";
      goto LABEL_6;
    }
  }
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = self;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Jindo: Banner will appear %p", (uint8_t *)&v9, 0xCu);
  }

  v6 = [(BKUIHostedJindoPresentable *)self observingDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(BKUIHostedJindoPresentable *)self observingDelegate];
    [v8 presentableWillAppearAsBanner:v4];
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = self;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Jindo: Banner did appear %p", (uint8_t *)&v9, 0xCu);
  }

  v6 = [(BKUIHostedJindoPresentable *)self observingDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(BKUIHostedJindoPresentable *)self observingDelegate];
    [v8 presentableDidAppearAsBanner:v4];
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  char v7 = [(BKUIHostedJindoPresentable *)self observingDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(BKUIHostedJindoPresentable *)self observingDelegate];
    [v9 presentableWillDisappearAsBanner:v10 withReason:v6];
  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  char v7 = [(BKUIHostedJindoPresentable *)self observingDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(BKUIHostedJindoPresentable *)self observingDelegate];
    [v9 presentableDidDisappearAsBanner:v10 withReason:v6];
  }
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  char v7 = [(BKUIHostedJindoPresentable *)self observingDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(BKUIHostedJindoPresentable *)self observingDelegate];
    [v9 presentableWillNotAppearAsBanner:v10 withReason:v6];
  }
}

- (int64_t)destination
{
  return self->_destination;
}

- (BNBannerSourceLayoutDescription)layoutDescription
{
  return self->_layoutDescription;
}

- (void)setLayoutDescription:(id)a3
{
}

- (UIViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (BNPresentableContext)presentableContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableContext);

  return (BNPresentableContext *)WeakRetained;
}

- (void)setPresentableContext:(id)a3
{
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (BOOL)canRequestAlertingAssertion
{
  return self->_canRequestAlertingAssertion;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  self->_preferredLayoutMode = a3;
}

- (int64_t)preferredCustomLayout
{
  return self->_preferredCustomLayout;
}

- (void)setPreferredCustomLayout:(int64_t)a3
{
  self->_preferredCustomLayout = a3;
}

- (void)setEnrollView:(id)a3
{
}

- (BKJindoPresentableObserving)observingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observingDelegate);

  return (BKJindoPresentableObserving *)WeakRetained;
}

- (void)setObservingDelegate:(id)a3
{
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (NSLayoutConstraint)centerYAnchor
{
  return self->_centerYAnchor;
}

- (void)setCenterYAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerYAnchor, 0);
  objc_destroyWeak((id *)&self->_observingDelegate);
  objc_storeStrong((id *)&self->_enrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_presentableContext);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_destroyWeak((id *)&self->_rootViewController);

  objc_storeStrong((id *)&self->_layoutDescription, 0);
}

@end