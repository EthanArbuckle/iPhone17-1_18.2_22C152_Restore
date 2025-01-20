@interface HUCardViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)disablePullToUnlockSettings;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasRequestedDismissal;
- (BOOL)hideControls;
- (BOOL)hideSettings;
- (BOOL)isConfiguredForNonHomeUser;
- (BOOL)isUnavailableHub;
- (BOOL)reachable;
- (BOOL)settingsUnlocked;
- (HFItem)sourceItem;
- (HMHome)home;
- (HUAnimationApplier)animationApplier;
- (HUCardViewController)init;
- (HUCardViewController)initWithControlItems:(id)a3;
- (HUCardViewControllerDelegate)delegate;
- (HUHubUnavailableView)hubUnavailableView;
- (HUQuickControlContainerViewController)quickControlViewController;
- (HUQuickControlProxHandOffSummaryViewUpdater)proxHandOffSummaryViewUpdater;
- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView;
- (HUQuickControlViewControllerCoordinator)viewControllerCoordinator;
- (HUVisualEffectContainerView)closeButtonEffectView;
- (NAFuture)viewControllerReadyFuture;
- (NAPromise)viewControllerReadyPromise;
- (NSMutableArray)constraints;
- (NSMutableArray)contentSizeKeyPathObservees;
- (NSSet)controlItems;
- (NSString)description;
- (UIActivityIndicatorView)spinnerView;
- (UIButton)closeButton;
- (UIColor)backgroundColor;
- (UIImpactFeedbackGenerator)impactFeedbackGenerator;
- (UILayoutGuide)quickControlLayoutGuide;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIScrollView)scrollView;
- (UIView)transitionBlurView;
- (UIViewController)settingsViewController;
- (UIVisualEffectView)backgroundVisualEffectView;
- (double)_hostViewHeight;
- (double)_quickControlScrollOffsetBoundary;
- (double)_quickControlSectionHeight;
- (id)_springAnimationSettings;
- (id)backgroundVisualEffectViewForProxHandOff;
- (id)blurEffectForProxHandOff;
- (id)hu_preloadContent;
- (id)hu_prepareForDismissalAnimated:(BOOL)a3;
- (id)keyCommands;
- (id)requestDismissal;
- (void)_actuateTapticFeedback;
- (void)_checkHubAvailability;
- (void)_closeButtonPressed:(id)a3;
- (void)_endUsingTapticFeedback;
- (void)_escapeKeyPressed;
- (void)_handlePanGesture:(id)a3;
- (void)_nudgeScrollViewToPoint:(CGPoint)a3;
- (void)_prepareForTapticFeedback;
- (void)_scrollToSettings;
- (void)_unlockSettings;
- (void)_updateCloseButtonVibrancyEffect;
- (void)_updateControlStatusTextWithPrimaryText:(id)a3 secondaryText:(id)a4;
- (void)_updateIconDescriptorAnimated:(BOOL)a3;
- (void)_updateMaterials;
- (void)_updateReachabilityState;
- (void)_updateScrollViewAndSpinnerView;
- (void)controllerCoordinator:(id)a3 didUpdateIconDescriptor:(id)a4 showOffState:(BOOL)a5;
- (void)controllerCoordinator:(id)a3 didUpdateStatusWithPrimaryText:(id)a4 secondaryText:(id)a5;
- (void)dealloc;
- (void)dismissCardAnimated:(BOOL)a3;
- (void)externalAnimationsBegan;
- (void)externalAnimationsEnded;
- (void)forceUnlockSettings;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollToDetailsViewAnimated:(BOOL)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAnimationApplier:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCloseButtonEffectView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setContentSizeKeyPathObservees:(id)a3;
- (void)setControlItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisablePullToUnlockSettings:(BOOL)a3;
- (void)setHasRequestedDismissal:(BOOL)a3;
- (void)setHideControls:(BOOL)a3;
- (void)setHideSettings:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setHubUnavailableView:(id)a3;
- (void)setImpactFeedbackGenerator:(id)a3;
- (void)setIsConfiguredForNonHomeUser:(BOOL)a3;
- (void)setIsUnavailableHub:(BOOL)a3;
- (void)setNavigationBarTitleView:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setProxHandOffSummaryViewUpdater:(id)a3;
- (void)setQuickControlLayoutGuide:(id)a3;
- (void)setQuickControlViewController:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setSettingsUnlocked:(BOOL)a3;
- (void)setSettingsViewController:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setTransitionBlurView:(id)a3;
- (void)setUpConstraints;
- (void)setViewControllerCoordinator:(id)a3;
- (void)setViewControllerReadyPromise:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithQuickControlViewController:(id)a3 settingsViewController:(id)a4 presentationContext:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUCardViewController

- (HUCardViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)HUCardViewController;
  v2 = [(HUCardViewController *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_reachable = 1;
    v2->_hideControls = 0;
    v2->_hideSettings = 0;
    v2->_disablePullToUnlockSettings = 0;
    v2->_settingsUnlocked = 0;
    v2->_isUnavailableHub = 0;
    v4 = (NAPromise *)objc_alloc_init(MEMORY[0x1E4F7A0E8]);
    viewControllerReadyPromise = v3->_viewControllerReadyPromise;
    v3->_viewControllerReadyPromise = v4;

    v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    quickControlLayoutGuide = v3->_quickControlLayoutGuide;
    v3->_quickControlLayoutGuide = v6;

    [(UILayoutGuide *)v3->_quickControlLayoutGuide setIdentifier:@"HUCardViewControllerQuickControlLayoutGuide"];
    uint64_t v8 = objc_opt_new();
    contentSizeKeyPathObservees = v3->_contentSizeKeyPathObservees;
    v3->_contentSizeKeyPathObservees = (NSMutableArray *)v8;

    v10 = [(HUCardViewController *)v3 view];
    [v10 addLayoutGuide:v3->_quickControlLayoutGuide];
  }
  return v3;
}

- (HUCardViewController)initWithControlItems:(id)a3
{
  id v5 = a3;
  v6 = [(HUCardViewController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controlItems, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(HUCardViewController *)self sourceItem];
  v7 = [v3 stringWithFormat:@"<%@: %p, sourceItem: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NAFuture)viewControllerReadyFuture
{
  v2 = [(HUCardViewController *)self viewControllerReadyPromise];
  v3 = [v2 future];

  return (NAFuture *)v3;
}

- (void)updateWithQuickControlViewController:(id)a3 settingsViewController:(id)a4 presentationContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HUCardViewController *)self setQuickControlViewController:a3];
  [(HUCardViewController *)self setSettingsViewController:v9];

  v10 = [v8 item];
  v11 = (void *)[v10 copy];
  [(HUCardViewController *)self setSourceItem:v11];

  objc_super v12 = [v8 home];
  [(HUCardViewController *)self setHome:v12];

  v13 = [HUQuickControlViewControllerCoordinator alloc];
  v14 = [v8 item];
  v15 = (void *)[v14 copy];
  v16 = [v8 controlItems];
  v17 = [v8 home];
  v18 = [(HUQuickControlViewControllerCoordinator *)v13 initWithItem:v15 controlItems:v16 home:v17 delegate:self];
  [(HUCardViewController *)self setViewControllerCoordinator:v18];

  uint64_t v19 = [v8 shouldIncludeRoomNameInHeaderTitle];
  v20 = [(HUCardViewController *)self viewControllerCoordinator];
  [v20 setShouldIncludeRoomNameInHeaderTitle:v19];

  v21 = [(HUCardViewController *)self quickControlLayoutGuide];
  v22 = [(HUCardViewController *)self quickControlViewController];
  [v22 setAvailableContentLayoutGuide:v21];

  if ([(HUCardViewController *)self isViewLoaded])
  {
    [(HUCardViewController *)self _updateScrollViewAndSpinnerView];
    v23 = [(HUCardViewController *)self viewControllerCoordinator];
    v24 = [v23 primaryStatusText];
    v25 = [(HUCardViewController *)self viewControllerCoordinator];
    v26 = [v25 secondaryStatusText];
    [(HUCardViewController *)self _updateControlStatusTextWithPrimaryText:v24 secondaryText:v26];

    [(HUCardViewController *)self _updateIconDescriptorAnimated:1];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HUCardViewController;
  [(HUCardViewController *)&v17 traitCollectionDidChange:a3];
  v4 = [(HUCardViewController *)self view];
  id v5 = [v4 traitCollection];
  v6 = +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", [v5 userInterfaceStyle]);

  int v7 = [MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials];
  if (([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials] & 1) != 0 || v7)
  {
    v14 = [MEMORY[0x1E4F428B8] clearColor];
    v15 = [(HUCardViewController *)self view];
    [v15 setBackgroundColor:v14];

    objc_super v12 = [MEMORY[0x1E4F428B8] clearColor];
    v16 = [(HUCardViewController *)self scrollView];
    [v16 setBackgroundColor:v12];

LABEL_12:
    goto LABEL_13;
  }
  BOOL v8 = [(HUCardViewController *)self hideControls];
  id v9 = v6;
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  }
  v10 = [(HUCardViewController *)self view];
  [v10 setBackgroundColor:v9];

  if (v8) {
  BOOL v11 = [(HUCardViewController *)self hideControls];
  }
  objc_super v12 = v6;
  if (v11)
  {
    objc_super v12 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  }
  v13 = [(HUCardViewController *)self scrollView];
  [v13 setBackgroundColor:v12];

  if (v11) {
    goto LABEL_12;
  }
LABEL_13:
  [(HUCardViewController *)self _updateMaterials];
  [(HUCardViewController *)self _updateCloseButtonVibrancyEffect];
}

- (void)_updateScrollViewAndSpinnerView
{
  v3 = [(HUCardViewController *)self viewControllerReadyPromise];
  v4 = [v3 future];
  char v5 = [v4 isFinished];

  if (v5) {
    return;
  }
  v6 = [(HUCardViewController *)self quickControlViewController];
  if (v6)
  {

LABEL_5:
    BOOL v8 = [(HUCardViewController *)self spinnerView];
    [v8 stopAnimating];

    id v9 = [(HUCardViewController *)self scrollView];
    [v9 setHidden:0];

    v10 = [(HUCardViewController *)self quickControlViewController];

    if (v10)
    {
      BOOL v11 = [(HUCardViewController *)self quickControlViewController];
      objc_super v12 = [(HUCardViewController *)self scrollView];
      [(HUCardViewController *)self naui_addChildViewWithViewController:v11 toView:v12];

      v13 = [(HUCardViewController *)self quickControlViewController];
      v14 = [v13 childViewControllers];

      objc_opt_class();
      v15 = [v14 firstObject];
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;

      if ([v14 count] == 1 && v17)
      {
        v18 = [v17 childViewControllers];
        uint64_t v19 = objc_msgSend(v18, "na_firstObjectPassingTest:", &__block_literal_global_242);

        v20 = [(HUCardViewController *)self contentSizeKeyPathObservees];
        v21 = [v19 collectionView];
        int v22 = [v20 containsObject:v21];

        if (v22)
        {
          v23 = [v19 collectionView];
          [v23 removeObserver:self forKeyPath:@"contentSize"];
        }
        v24 = [v19 collectionView];
        [v24 addObserver:self forKeyPath:@"contentSize" options:0 context:0];

        v25 = [(HUCardViewController *)self contentSizeKeyPathObservees];
        v26 = [v19 collectionView];
        [v25 addObject:v26];
      }
    }
    v27 = [(HUCardViewController *)self settingsViewController];

    if (v27)
    {
      v28 = [(HUCardViewController *)self settingsViewController];
      v29 = [(HUCardViewController *)self scrollView];
      [(HUCardViewController *)self naui_addChildViewWithViewController:v28 toView:v29];

      objc_opt_class();
      v30 = [(HUCardViewController *)self settingsViewController];
      if (objc_opt_isKindOfClass()) {
        v31 = v30;
      }
      else {
        v31 = 0;
      }
      id v32 = v31;

      if (v32)
      {
        v33 = [v32 tableView];
        [v33 _setFirstResponderKeyboardAvoidanceEnabled:0];

        v34 = [v32 tableView];
        [v34 setScrollEnabled:0];

        v35 = [(HUCardViewController *)self contentSizeKeyPathObservees];
        v36 = [v32 tableView];
        int v37 = [v35 containsObject:v36];

        if (v37)
        {
          v38 = [v32 tableView];
          [v38 removeObserver:self forKeyPath:@"contentSize"];
        }
        v39 = [v32 tableView];
        [v39 addObserver:self forKeyPath:@"contentSize" options:0 context:0];

        v40 = [(HUCardViewController *)self contentSizeKeyPathObservees];
        v41 = [v32 tableView];
        [v40 addObject:v41];
      }
    }
    v42 = [(HUCardViewController *)self scrollView];
    v43 = [(HUCardViewController *)self panGestureRecognizer];
    [v42 removeGestureRecognizer:v43];

    if (![(HUCardViewController *)self hideControls]
      && ![(HUCardViewController *)self hideSettings]
      && ([MEMORY[0x1E4F69758] isAMac] & 1) == 0)
    {
      v44 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__handlePanGesture_];
      [(HUCardViewController *)self setPanGestureRecognizer:v44];

      v45 = [(HUCardViewController *)self panGestureRecognizer];
      [v45 setDelegate:self];

      v46 = [(HUCardViewController *)self scrollView];
      v47 = [(HUCardViewController *)self panGestureRecognizer];
      [v46 addGestureRecognizer:v47];
    }
    id v48 = [(HUCardViewController *)self view];
    [v48 setNeedsLayout];
    goto LABEL_29;
  }
  int v7 = [(HUCardViewController *)self settingsViewController];

  if (v7) {
    goto LABEL_5;
  }
  id v48 = [(HUCardViewController *)self spinnerView];
  [v48 startAnimating];
LABEL_29:
}

uint64_t __55__HUCardViewController__updateScrollViewAndSpinnerView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)HUCardViewController;
  [(HUCardViewController *)&v35 viewDidLoad];
  [(HUCardViewController *)self _updateMaterials];
  v3 = objc_alloc_init(HUQuickControlSummaryNavigationBarTitleView);
  [(HUCardViewController *)self setNavigationBarTitleView:v3];

  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    v4 = [HUQuickControlProxHandOffSummaryViewUpdater alloc];
    char v5 = [(HUCardViewController *)self navigationBarTitleView];
    v6 = [(HUQuickControlProxHandOffSummaryViewUpdater *)v4 initWithNavigationBarTitleView:v5];
    [(HUCardViewController *)self setProxHandOffSummaryViewUpdater:v6];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F42DB0]);
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  objc_super v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
  [(HUCardViewController *)self setScrollView:v12];

  v13 = [(HUCardViewController *)self scrollView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(HUCardViewController *)self scrollView];
  [v14 setShowsHorizontalScrollIndicator:0];

  v15 = [(HUCardViewController *)self scrollView];
  [v15 setShowsVerticalScrollIndicator:1];

  v16 = [(HUCardViewController *)self scrollView];
  [v16 setDelaysContentTouches:1];

  id v17 = [(HUCardViewController *)self scrollView];
  [v17 setTracksImmediatelyWhileDecelerating:0];

  v18 = [(HUCardViewController *)self scrollView];
  [v18 setDelegate:self];

  uint64_t v19 = [(HUCardViewController *)self scrollView];
  [v19 setAlwaysBounceVertical:1];

  v20 = [(HUCardViewController *)self scrollView];
  [v20 setContentInsetAdjustmentBehavior:2];

  v21 = [(HUCardViewController *)self scrollView];
  [v21 _setIndicatorInsetAdjustmentBehavior:2];

  int v22 = [(HUCardViewController *)self scrollView];
  [v22 setHidden:1];

  v23 = [(HUCardViewController *)self view];
  uint64_t v24 = [(HUCardViewController *)self scrollView];
  [v23 addSubview:v24];

  v25 = [MEMORY[0x1E4F69430] sharedInstance];
  LOBYTE(v24) = [v25 useSAConfig];

  if ((v24 & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F427E0] buttonWithType:7];
    [(HUCardViewController *)self setCloseButton:v26];

    v27 = [(HUCardViewController *)self closeButton];
    [v27 addTarget:self action:sel__closeButtonPressed_ forControlEvents:64];

    v28 = [HUVisualEffectContainerView alloc];
    v29 = [(HUCardViewController *)self closeButton];
    v30 = [(HUVisualEffectContainerView *)v28 initWithInnerContentView:v29];
    [(HUCardViewController *)self setCloseButtonEffectView:v30];

    [(HUCardViewController *)self _updateCloseButtonVibrancyEffect];
  }
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:101];
  [v31 setHidesWhenStopped:1];
  id v32 = [(HUCardViewController *)self view];
  [v32 addSubview:v31];

  [(HUCardViewController *)self setSpinnerView:v31];
  v33 = [(HUCardViewController *)self spinnerView];
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

  v34 = -[HUHubUnavailableView initWithFrame:]([HUHubUnavailableView alloc], "initWithFrame:", v8, v9, v10, v11);
  [(HUCardViewController *)self setHubUnavailableView:v34];

  [(HUCardViewController *)self _updateScrollViewAndSpinnerView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setUpConstraints
{
  v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(HUCardViewController *)self constraints];
  [v3 deactivateConstraints:v4];

  id v92 = (id)objc_opt_new();
  char v5 = [(HUCardViewController *)self backgroundVisualEffectView];

  if (v5)
  {
    v6 = [(HUCardViewController *)self backgroundVisualEffectView];
    id v7 = [v6 topAnchor];
    double v8 = [(HUCardViewController *)self view];
    double v9 = [v8 topAnchor];
    double v10 = [v7 constraintEqualToAnchor:v9];
    [v92 addObject:v10];

    double v11 = [(HUCardViewController *)self backgroundVisualEffectView];
    objc_super v12 = [v11 bottomAnchor];
    v13 = [(HUCardViewController *)self view];
    v14 = [v13 bottomAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    [v92 addObject:v15];

    v16 = [(HUCardViewController *)self backgroundVisualEffectView];
    id v17 = [v16 leadingAnchor];
    v18 = [(HUCardViewController *)self view];
    uint64_t v19 = [v18 leadingAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    [v92 addObject:v20];

    v21 = [(HUCardViewController *)self backgroundVisualEffectView];
    int v22 = [v21 trailingAnchor];
    v23 = [(HUCardViewController *)self view];
    uint64_t v24 = [v23 trailingAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v92 addObject:v25];
  }
  v26 = [(HUCardViewController *)self scrollView];
  v27 = [v26 topAnchor];
  v28 = [(HUCardViewController *)self view];
  v29 = [v28 safeAreaLayoutGuide];
  v30 = [v29 topAnchor];
  v31 = [v27 constraintEqualToAnchor:v30];
  [v92 addObject:v31];

  id v32 = [(HUCardViewController *)self scrollView];
  v33 = [v32 bottomAnchor];
  v34 = [(HUCardViewController *)self view];
  objc_super v35 = [v34 bottomAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  [v92 addObject:v36];

  int v37 = [(HUCardViewController *)self scrollView];
  v38 = [v37 leadingAnchor];
  v39 = [(HUCardViewController *)self view];
  v40 = [v39 leadingAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v92 addObject:v41];

  v42 = [(HUCardViewController *)self scrollView];
  v43 = [v42 trailingAnchor];
  v44 = [(HUCardViewController *)self view];
  v45 = [v44 trailingAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v92 addObject:v46];

  v47 = [(HUCardViewController *)self quickControlLayoutGuide];
  id v48 = [v47 topAnchor];
  v49 = [(HUCardViewController *)self view];
  v50 = [v49 layoutMarginsGuide];
  v51 = [v50 topAnchor];
  v52 = [v48 constraintEqualToAnchor:v51];
  [v92 addObject:v52];

  v53 = [(HUCardViewController *)self quickControlLayoutGuide];
  v54 = [v53 bottomAnchor];
  v55 = [(HUCardViewController *)self view];
  v56 = [v55 bottomAnchor];
  v57 = [v54 constraintEqualToAnchor:v56];
  [v92 addObject:v57];

  v58 = [(HUCardViewController *)self quickControlLayoutGuide];
  v59 = [v58 leadingAnchor];
  v60 = [(HUCardViewController *)self view];
  v61 = [v60 layoutMarginsGuide];
  v62 = [v61 leadingAnchor];
  v63 = [v59 constraintEqualToAnchor:v62];
  [v92 addObject:v63];

  v64 = [(HUCardViewController *)self quickControlLayoutGuide];
  v65 = [v64 trailingAnchor];
  v66 = [(HUCardViewController *)self view];
  v67 = [v66 layoutMarginsGuide];
  v68 = [v67 trailingAnchor];
  v69 = [v65 constraintEqualToAnchor:v68];
  [v92 addObject:v69];

  v70 = [(HUCardViewController *)self spinnerView];
  v71 = [v70 centerXAnchor];
  v72 = [(HUCardViewController *)self view];
  v73 = [v72 centerXAnchor];
  v74 = [v71 constraintEqualToAnchor:v73];
  [v92 addObject:v74];

  v75 = [(HUCardViewController *)self spinnerView];
  v76 = [v75 centerYAnchor];
  v77 = [(HUCardViewController *)self view];
  v78 = [v77 centerYAnchor];
  v79 = [v76 constraintEqualToAnchor:v78];
  [v92 addObject:v79];

  v80 = [(HUCardViewController *)self spinnerView];
  v81 = [v80 topAnchor];
  v82 = [(HUCardViewController *)self view];
  v83 = [v82 topAnchor];
  v84 = [v81 constraintGreaterThanOrEqualToAnchor:v83];
  [v92 addObject:v84];

  v85 = [(HUCardViewController *)self spinnerView];
  v86 = [v85 bottomAnchor];
  v87 = [(HUCardViewController *)self view];
  v88 = [v87 bottomAnchor];
  v89 = [v86 constraintLessThanOrEqualToAnchor:v88];
  [v92 addObject:v89];

  [(HUCardViewController *)self setConstraints:v92];
  v90 = (void *)MEMORY[0x1E4F28DC8];
  v91 = [(HUCardViewController *)self constraints];
  [v90 activateConstraints:v91];
}

- (void)viewWillAppear:(BOOL)a3
{
  v38.receiver = self;
  v38.super_class = (Class)HUCardViewController;
  [(HUCardViewController *)&v38 viewWillAppear:a3];
  v4 = [(HUCardViewController *)self navigationController];
  if ([v4 isBeingPresented])
  {
  }
  else
  {
    char v5 = [(HUCardViewController *)self navigationController];
    v6 = [v5 viewControllers];
    uint64_t v7 = [v6 count];

    if (v7 != 1) {
      goto LABEL_12;
    }
  }
  double v8 = [(HUCardViewController *)self closeButtonEffectView];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F427C0]);
    double v10 = [(HUCardViewController *)self closeButtonEffectView];
    double v11 = (void *)[v9 initWithCustomView:v10];
    objc_super v12 = [(HUCardViewController *)self navigationItem];
    [v12 setRightBarButtonItem:v11];
  }
  v13 = [(HUCardViewController *)self navigationBarTitleView];
  v14 = [(HUCardViewController *)self navigationItem];
  [v14 setTitleView:v13];

  v15 = [(HUCardViewController *)self navigationController];
  v16 = [v15 navigationBar];
  [v16 _setHidesShadow:1];

  id v17 = objc_alloc_init(MEMORY[0x1E4F427B8]);
  [v17 configureWithTransparentBackground];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F42BF0]) initWithBarAppearance:v17];
  uint64_t v19 = [(HUCardViewController *)self navigationController];
  v20 = [v19 navigationBar];
  [v20 setScrollEdgeAppearance:v18];

  if ([(HUCardViewController *)self hideControls]) {
    double v21 = 1.0;
  }
  else {
    double v21 = 0.0;
  }
  int v22 = [(HUCardViewController *)self navigationItem];
  [v22 _setManualScrollEdgeAppearanceProgress:v21];

  v23 = [(HUCardViewController *)self navigationItem];
  [v23 _setManualScrollEdgeAppearanceEnabled:1];

  [(HUCardViewController *)self _updateIconDescriptorAnimated:1];
  uint64_t v24 = [(HUCardViewController *)self viewControllerCoordinator];
  v25 = v24;
  if (v24)
  {
    v26 = [v24 primaryStatusText];
    v27 = [v25 secondaryStatusText];
    [(HUCardViewController *)self _updateControlStatusTextWithPrimaryText:v26 secondaryText:v27];
  }
LABEL_12:
  v28 = (void *)0x1E4F69000;
  int v29 = [MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    v30 = (void *)MEMORY[0x1E4F428B8];
LABEL_16:
    v33 = [v30 clearColor];
    v28 = [(HUCardViewController *)self scrollView];
    [v28 setBackgroundColor:v33];
LABEL_17:

    goto LABEL_18;
  }
  if (v29)
  {
    v31 = [MEMORY[0x1E4F428B8] clearColor];
    id v32 = [(HUCardViewController *)self view];
    [v32 setBackgroundColor:v31];

    v30 = (void *)MEMORY[0x1E4F428B8];
    goto LABEL_16;
  }
  BOOL v34 = [(HUCardViewController *)self hideControls];
  BOOL v35 = v34;
  if (v34)
  {
    v36 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
    v33 = v36;
  }
  else
  {
    v33 = [(HUCardViewController *)self view];
    v28 = [v33 traitCollection];
    v36 = +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", [v28 userInterfaceStyle]);
  }
  int v37 = [(HUCardViewController *)self scrollView];
  [v37 setBackgroundColor:v36];

  if (!v35)
  {

    goto LABEL_17;
  }
LABEL_18:

  [(HUCardViewController *)self setUpConstraints];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUCardViewController;
  [(HUCardViewController *)&v8 viewDidDisappear:a3];
  v4 = [(HUCardViewController *)self navigationController];
  char v5 = [v4 topViewController];
  if ([v5 isEqual:self])
  {
    BOOL v6 = [(HUCardViewController *)self hasRequestedDismissal];

    if (!v6) {
      id v7 = [(HUCardViewController *)self requestDismissal];
    }
  }
  else
  {
  }
}

- (void)viewDidLayoutSubviews
{
  v64.receiver = self;
  v64.super_class = (Class)HUCardViewController;
  [(HUCardViewController *)&v64 viewDidLayoutSubviews];
  v3 = [(HUCardViewController *)self scrollView];
  char v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    char v5 = [(HUCardViewController *)self view];
    [v5 frame];
    double v7 = v6;

    [(HUCardViewController *)self _hostViewHeight];
    double v9 = v8;
    double v10 = 0.0;
    double v11 = 0.0;
    if (![(HUCardViewController *)self hideControls])
    {
      [(HUCardViewController *)self _quickControlSectionHeight];
      double v11 = v12;
    }
    if (![(HUCardViewController *)self hideSettings])
    {
      v13 = [(HUCardViewController *)self settingsViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        objc_opt_class();
        v15 = [(HUCardViewController *)self settingsViewController];
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
        id v17 = v16;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![(HUCardViewController *)self hideControls])
        {
          v18 = [v17 tableView];
          [v18 sizeToFit];
        }
        uint64_t v19 = [v17 tableView];
        [v19 contentSize];
        double v21 = v20;
        int v22 = [(HUCardViewController *)self view];
        [v22 safeAreaInsets];
        double v10 = v21 + v23;

        if (v10 < v9) {
          double v10 = v9;
        }
      }
      else
      {
        uint64_t v24 = [(HUCardViewController *)self settingsViewController];
        [v24 preferredContentSize];
        double v26 = v25;
        v27 = [(HUCardViewController *)self view];
        [v27 safeAreaInsets];
        double v10 = v26 + v28;

        if (v10 < v9) {
          double v10 = v9;
        }
      }
    }
    int v29 = [(HUCardViewController *)self quickControlViewController];
    v30 = [v29 view];
    objc_msgSend(v30, "setFrame:", 0.0, 0.0, v7, v11);

    v31 = [(HUCardViewController *)self settingsViewController];
    id v32 = [v31 view];
    objc_msgSend(v32, "setFrame:", 0.0, v11, v7, v10);

    v33 = [(HUCardViewController *)self hubUnavailableView];
    objc_msgSend(v33, "setFrame:", 0.0, 0.0, v7, v9);

    LODWORD(v32) = [(HUCardViewController *)self isUnavailableHub];
    BOOL v34 = [(HUCardViewController *)self hubUnavailableView];
    BOOL v35 = v34;
    if (v32)
    {
      v36 = [(HUCardViewController *)self sourceItem];
      int v37 = [v36 latestResults];
      objc_super v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      [v35 setAccessoryName:v38];

      BOOL v35 = [(HUCardViewController *)self scrollView];
      v39 = [(HUCardViewController *)self hubUnavailableView];
      [v35 addSubview:v39];
    }
    else
    {
      [v34 removeFromSuperview];
    }

    v40 = [(HUCardViewController *)self scrollView];
    objc_msgSend(v40, "setContentSize:", v7, v11 + v10);

    v41 = [(HUCardViewController *)self view];
    [v41 safeAreaInsets];
    double v43 = v42;
    v44 = [(HUCardViewController *)self scrollView];
    objc_msgSend(v44, "setScrollIndicatorInsets:", 0.0, 0.0, v43, 0.0);

    v45 = [(HUCardViewController *)self scrollView];
    [v45 contentSize];
    BOOL v47 = v46 > v9;
    id v48 = [(HUCardViewController *)self scrollView];
    [v48 setScrollEnabled:v47];

    v49 = [(HUCardViewController *)self transitionBlurView];

    if (v49)
    {
      v50 = [(HUCardViewController *)self view];
      [v50 bounds];
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;
      v59 = [(HUCardViewController *)self transitionBlurView];
      objc_msgSend(v59, "setFrame:", v52, v54, v56, v58);
    }
    v60 = [(HUCardViewController *)self viewControllerReadyPromise];
    v61 = [v60 future];
    char v62 = [v61 isFinished];

    if ((v62 & 1) == 0)
    {
      v63 = [(HUCardViewController *)self viewControllerReadyPromise];
      [v63 finishWithNoResult];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"contentSize", a4, a5, a6))
  {
    [(HUCardViewController *)self _checkHubAvailability];
    id v7 = [(HUCardViewController *)self view];
    [v7 setNeedsLayout];
  }
}

- (void)forceUnlockSettings
{
  [(HUCardViewController *)self setSettingsUnlocked:1];
  v3 = [(HUCardViewController *)self quickControlViewController];
  char v4 = [v3 controlContainerView];
  [v4 setShouldShowDetailsButton:0];

  id v6 = [(HUCardViewController *)self scrollView];
  char v5 = [(HUCardViewController *)self panGestureRecognizer];
  [v6 removeGestureRecognizer:v5];
}

- (void)setHideControls:(BOOL)a3
{
  if (self->_hideControls != a3)
  {
    self->_hideControls = a3;
    if ([(HUCardViewController *)self hideControls])
    {
      [(HUCardViewController *)self _unlockSettings];
      [(HUCardViewController *)self _endUsingTapticFeedback];
    }
    if (![(HUCardViewController *)self hideSettings])
    {
      char v4 = [(HUCardViewController *)self settingsViewController];
      char v5 = [v4 view];
      [v5 layoutIfNeeded];
    }
    id v6 = [(HUCardViewController *)self view];
    id v7 = [v6 window];

    if (v7)
    {
      id v8 = [(HUCardViewController *)self view];
      [v8 layoutIfNeeded];
    }
  }
}

- (void)setHideSettings:(BOOL)a3
{
  if (self->_hideSettings != a3)
  {
    self->_hideSettings = a3;
    if ([(HUCardViewController *)self hideSettings])
    {
      [(HUCardViewController *)self _unlockSettings];
      [(HUCardViewController *)self _endUsingTapticFeedback];
    }
    else
    {
      char v4 = [(HUCardViewController *)self view];
      char v5 = [v4 window];

      if (v5)
      {
        id v6 = [(HUCardViewController *)self settingsViewController];
        id v7 = [v6 view];
        [v7 layoutIfNeeded];

        id v8 = [(HUCardViewController *)self view];
        [v8 layoutIfNeeded];
      }
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  char v5 = [(HUCardViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = [(HUCardViewController *)self scrollView];
  [v6 setBackgroundColor:v4];
}

- (void)setIsUnavailableHub:(BOOL)a3
{
  if (self->_isUnavailableHub != a3)
  {
    self->_isUnavailableHub = a3;
    if ([(HUCardViewController *)self isUnavailableHub])
    {
      [(HUCardViewController *)self setHideControls:1];
      [(HUCardViewController *)self setHideSettings:1];
      id v4 = [(HUCardViewController *)self quickControlViewController];
      char v5 = [v4 view];
      id v6 = v5;
      uint64_t v7 = 1;
    }
    else
    {
      [(HUCardViewController *)self setHideControls:0];
      [(HUCardViewController *)self setHideSettings:0];
      id v4 = [(HUCardViewController *)self quickControlViewController];
      char v5 = [v4 view];
      id v6 = v5;
      uint64_t v7 = 0;
    }
    [v5 setHidden:v7];

    id v8 = [(HUCardViewController *)self view];
    [v8 layoutIfNeeded];
  }
}

- (void)externalAnimationsBegan
{
  id v2 = [(HUCardViewController *)self quickControlViewController];
  [v2 externalAnimationsBegan];
}

- (void)externalAnimationsEnded
{
  id v2 = [(HUCardViewController *)self quickControlViewController];
  [v2 externalAnimationsEnded];
}

- (void)dismissCardAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__HUCardViewController_dismissCardAnimated___block_invoke;
  v3[3] = &unk_1E6386018;
  v3[4] = self;
  [(HUCardViewController *)self dismissViewControllerAnimated:a3 completion:v3];
}

void __44__HUCardViewController_dismissCardAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) quickControlViewController];
  id v1 = (id)[v2 dismissControlAnimated:0];
}

- (void)scrollToDetailsViewAnimated:(BOOL)a3
{
  [(HUCardViewController *)self _prepareForTapticFeedback];
  [(HUCardViewController *)self _actuateTapticFeedback];
  [(HUCardViewController *)self _unlockSettings];

  [(HUCardViewController *)self _endUsingTapticFeedback];
}

- (id)blurEffectForProxHandOff
{
  id v2 = [(HUCardViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    uint64_t v4 = 19;
  }
  else {
    uint64_t v4 = 14;
  }
  char v5 = (void *)MEMORY[0x1E4F427D8];

  return (id)[v5 effectWithStyle:v4];
}

- (id)backgroundVisualEffectViewForProxHandOff
{
  id v2 = [(HUCardViewController *)self blurEffectForProxHandOff];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v2];

  return v3;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [(HUCardViewController *)self contentSizeKeyPathObservees];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412546;
    long long v14 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        double v10 = HFLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v14;
          double v21 = self;
          __int16 v22 = 2112;
          double v23 = v9;
          _os_log_debug_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEBUG, "Removing self [%@] as observer for HUContentSizeKeyPath: receiverObject = [%@]", buf, 0x16u);
        }

        [v9 removeObserver:self forKeyPath:@"contentSize"];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }

  double v11 = [(HUCardViewController *)self contentSizeKeyPathObservees];
  [v11 removeAllObjects];

  contentSizeKeyPathObservees = self->_contentSizeKeyPathObservees;
  self->_contentSizeKeyPathObservees = 0;

  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    v13 = [MEMORY[0x1E4F69430] sharedInstance];
    [v13 invalidateProxClient];
  }
  v15.receiver = self;
  v15.super_class = (Class)HUCardViewController;
  [(HUCardViewController *)&v15 dealloc];
}

- (void)_handlePanGesture:(id)a3
{
  id v4 = a3;
  [(HUCardViewController *)self _hostViewHeight];
  double v6 = v5;
  uint64_t v7 = [(HUCardViewController *)self quickControlViewController];
  uint64_t v8 = [v7 view];
  [v4 translationInView:v8];
  double v10 = v9;
  double v12 = v11;

  float v13 = -v12 / v6;
  float v14 = fminf(fmaxf(v13, 0.0), 1.0);
  [(HUCardViewController *)self _quickControlScrollOffsetBoundary];
  double v16 = v15;
  uint64_t v17 = [v4 state];

  if ((unint64_t)(v17 - 3) >= 3)
  {
    if (v17 == 2)
    {
      if (v14 >= 0.25)
      {
        id v24 = [(HUCardViewController *)self scrollView];
        [v24 contentOffset];
        if (v21 >= v16)
        {
          BOOL v22 = [(HUCardViewController *)self disablePullToUnlockSettings];

          if (!v22)
          {
            [(HUCardViewController *)self _actuateTapticFeedback];
            double v23 = [(HUCardViewController *)self scrollView];
            [v23 setScrollEnabled:0];

            [(HUCardViewController *)self _unlockSettings];
            [(HUCardViewController *)self _endUsingTapticFeedback];
          }
        }
        else
        {
        }
      }
    }
    else if (v17 == 1)
    {
      [(HUCardViewController *)self _prepareForTapticFeedback];
    }
  }
  else if (v14 < 0.25)
  {
    long long v18 = [(HUCardViewController *)self scrollView];
    [v18 contentOffset];
    double v20 = v19;

    if (v20 >= v16)
    {
      -[HUCardViewController _nudgeScrollViewToPoint:](self, "_nudgeScrollViewToPoint:", v10, v16);
    }
  }
}

- (void)_prepareForTapticFeedback
{
  uint64_t v3 = [(HUCardViewController *)self traitCollection];
  uint64_t v4 = [v3 forceTouchCapability];

  if (v4 == 2)
  {
    id v7 = [MEMORY[0x1E4F42948] currentDevice];
    double v5 = [v7 _tapticEngine];
    [v5 prepareUsingFeedback:1];
  }
  else
  {
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:1];
    [(HUCardViewController *)self setImpactFeedbackGenerator:v6];

    id v7 = [(HUCardViewController *)self impactFeedbackGenerator];
    [v7 prepare];
  }
}

- (void)_actuateTapticFeedback
{
  uint64_t v3 = [(HUCardViewController *)self traitCollection];
  uint64_t v4 = [v3 forceTouchCapability];

  if (v4 == 2)
  {
    id v7 = [MEMORY[0x1E4F42948] currentDevice];
    double v5 = [v7 _tapticEngine];
    [v5 actuateFeedback:1];
  }
  else
  {
    double v6 = [(HUCardViewController *)self impactFeedbackGenerator];
    [v6 impactOccurred];

    id v7 = [(HUCardViewController *)self impactFeedbackGenerator];
    [v7 prepare];
  }
}

- (void)_endUsingTapticFeedback
{
  uint64_t v3 = [(HUCardViewController *)self traitCollection];
  uint64_t v4 = [v3 forceTouchCapability];

  if (v4 == 2)
  {
    id v6 = [MEMORY[0x1E4F42948] currentDevice];
    double v5 = [v6 _tapticEngine];
    [v5 endUsingFeedback:1];
  }
  else
  {
    [(HUCardViewController *)self setImpactFeedbackGenerator:0];
  }
}

- (void)_updateMaterials
{
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] clearColor];
    uint64_t v4 = [(HUCardViewController *)self view];
    [v4 setBackgroundColor:v3];

    double v5 = [MEMORY[0x1E4F428B8] clearColor];
    id v6 = [(HUCardViewController *)self scrollView];
    [v6 setBackgroundColor:v5];
  }
  id v7 = [(HUCardViewController *)self transitionBlurView];
  if (v7)
  {
  }
  else if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    uint64_t v8 = [MEMORY[0x1E4F5AE10] controlCenterModuleBackgroundMaterial];
    [(HUCardViewController *)self setTransitionBlurView:v8];

    double v9 = [(HUCardViewController *)self transitionBlurView];
    [v9 setAutoresizingMask:18];

    double v10 = [(HUCardViewController *)self view];
    double v11 = [(HUCardViewController *)self transitionBlurView];
    [v10 insertSubview:v11 atIndex:0];

    goto LABEL_10;
  }
  uint64_t v12 = [(HUCardViewController *)self transitionBlurView];
  if (v12)
  {
    float v13 = (void *)v12;
    char v14 = [MEMORY[0x1E4F69758] shouldUseControlCenterMaterials];

    if ((v14 & 1) == 0)
    {
      double v15 = [(HUCardViewController *)self transitionBlurView];
      [v15 removeFromSuperview];

      [(HUCardViewController *)self setTransitionBlurView:0];
    }
  }
LABEL_10:
  if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials])
  {
    double v16 = [(HUCardViewController *)self backgroundVisualEffectView];

    if (v16)
    {
      uint64_t v17 = [(HUCardViewController *)self backgroundVisualEffectView];
      long long v18 = [(HUCardViewController *)self blurEffectForProxHandOff];
      [v17 setEffect:v18];
    }
    else
    {
      double v19 = [(HUCardViewController *)self backgroundVisualEffectViewForProxHandOff];
      [(HUCardViewController *)self setBackgroundVisualEffectView:v19];

      double v20 = [(HUCardViewController *)self backgroundVisualEffectView];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v17 = [(HUCardViewController *)self view];
      long long v18 = [(HUCardViewController *)self backgroundVisualEffectView];
      [v17 insertSubview:v18 atIndex:0];
    }

    double v21 = [(HUCardViewController *)self transitionBlurView];
    [v21 removeFromSuperview];

    [(HUCardViewController *)self setTransitionBlurView:0];
  }
}

- (double)_hostViewHeight
{
  uint64_t v3 = [(HUCardViewController *)self view];
  [v3 frame];
  double v5 = v4;
  id v6 = [(HUCardViewController *)self navigationBarTitleView];
  [v6 height];
  double v8 = v5 - v7;

  return v8;
}

- (double)_quickControlSectionHeight
{
  uint64_t v3 = [(HUCardViewController *)self quickControlViewController];
  double v4 = [v3 controlContainerView];
  [v4 frame];
  double v6 = v5;

  [(HUCardViewController *)self _hostViewHeight];
  if (v6 >= result) {
    return v6;
  }
  return result;
}

- (double)_quickControlScrollOffsetBoundary
{
  [(HUCardViewController *)self _quickControlSectionHeight];
  double v4 = v3;
  double v5 = [(HUCardViewController *)self scrollView];
  [v5 bounds];
  double v7 = v4 - v6;

  return v7;
}

- (void)_updateReachabilityState
{
  double v3 = [(HUCardViewController *)self viewControllerCoordinator];
  -[HUCardViewController setReachable:](self, "setReachable:", [v3 isReachable]);

  double v4 = [(HUCardViewController *)self viewControllerCoordinator];
  double v5 = [v4 primaryStatusText];
  double v6 = [(HUCardViewController *)self viewControllerCoordinator];
  double v7 = [v6 secondaryStatusText];
  [(HUCardViewController *)self _updateControlStatusTextWithPrimaryText:v5 secondaryText:v7];

  [(HUCardViewController *)self _updateIconDescriptorAnimated:1];
  double v8 = [(HUCardViewController *)self view];
  double v9 = [v8 window];

  if (v9)
  {
    id v10 = [(HUCardViewController *)self view];
    [v10 layoutIfNeeded];
  }
}

- (void)_updateControlStatusTextWithPrimaryText:(id)a3 secondaryText:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  double v7 = [(HUCardViewController *)self navigationBarTitleView];
  double v8 = [v7 summaryView];

  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    if ([(HUCardViewController *)self isConfiguredForNonHomeUser])
    {
      double v9 = [(HUCardViewController *)self controlItems];
      id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_146);

      double v11 = [v10 deviceName];
      [v8 setPrimaryText:v11];
    }
  }
  else
  {
    [v8 setPrimaryText:v12];
    [v8 setSecondaryText:v6];
  }
}

uint64_t __78__HUCardViewController__updateControlStatusTextWithPrimaryText_secondaryText___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateIconDescriptorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(HUCardViewController *)self viewControllerCoordinator];
  id v19 = [v5 iconDescriptor];

  if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
  {
    id v6 = [(HUCardViewController *)self viewControllerCoordinator];
    int v7 = [v6 showIconOffState];

    if (v7)
    {
      if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 3;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
    uint64_t v17 = [(HUCardViewController *)self navigationBarTitleView];
    long long v18 = [v17 summaryView];
    id v12 = [v18 iconView];

    [v12 updateWithIconDescriptor:v19 displayStyle:v8 animated:v3];
  }
  else
  {
    double v9 = [(HUCardViewController *)self navigationBarTitleView];
    id v10 = [v9 summaryView];
    double v11 = [v10 baseIconView];
    id v12 = [v11 configuration];

    if (v12)
    {
      float v13 = (void *)[v12 copyWithIconDescriptor:v19];
      char v14 = [(HUCardViewController *)self navigationBarTitleView];
      double v15 = [v14 summaryView];
      double v16 = [v15 baseIconView];
      [v16 setConfiguration:v13];
    }
  }
}

- (void)_closeButtonPressed:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    double v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: User pressed close button: %@", (uint8_t *)&v8, 0x16u);
  }

  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    id v6 = [MEMORY[0x1E4F69430] sharedInstance];
    [v6 userTappedCloseButton];
  }
  id v7 = [(HUCardViewController *)self requestDismissal];
}

- (id)requestDismissal
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    long long v18 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing card view controller: %@", (uint8_t *)&v17, 0xCu);
  }

  [(HUCardViewController *)self setHasRequestedDismissal:1];
  objc_opt_class();
  id v4 = [(HUCardViewController *)self settingsViewController];
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  [v6 viewWillDismiss];
  id v7 = [(HUCardViewController *)self quickControlViewController];
  int v8 = [v7 childViewControllers];

  objc_opt_class();
  double v9 = [v8 firstObject];
  if (objc_opt_isKindOfClass()) {
    __int16 v10 = v9;
  }
  else {
    __int16 v10 = 0;
  }
  id v11 = v10;

  if ([v8 count] == 1 && v11)
  {
    uint64_t v12 = [v11 childViewControllers];
    float v13 = objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_149_2);

    [v13 viewWillDismiss];
  }
  char v14 = [(HUCardViewController *)self delegate];
  double v15 = [v14 cardViewControllerRequestingDismissal:self];

  return v15;
}

uint64_t __40__HUCardViewController_requestDismissal__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_unlockSettings
{
  if (![(HUCardViewController *)self settingsUnlocked])
  {
    [(HUCardViewController *)self setSettingsUnlocked:1];
    BOOL v3 = [(HUCardViewController *)self quickControlViewController];
    id v4 = [v3 controlContainerView];
    [v4 setShouldShowDetailsButton:0];

    [(HUCardViewController *)self _scrollToSettings];
    id v6 = [(HUCardViewController *)self scrollView];
    double v5 = [(HUCardViewController *)self panGestureRecognizer];
    [v6 removeGestureRecognizer:v5];
  }
}

- (void)_scrollToSettings
{
  if (![(HUCardViewController *)self hideControls])
  {
    BOOL v3 = [(HUCardViewController *)self settingsViewController];
    id v4 = [v3 view];
    [v4 frame];
    double v6 = v5;

    -[HUCardViewController setContentOffset:animated:](self, "setContentOffset:animated:", 1, 0.0, v6);
  }
}

- (void)_nudgeScrollViewToPoint:(CGPoint)a3
{
  double y = a3.y;
  double v5 = [(HUCardViewController *)self scrollView];
  [v5 setScrollEnabled:0];

  -[HUCardViewController setContentOffset:animated:](self, "setContentOffset:animated:", 1, 0.0, y);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = [(HUCardViewController *)self _springAnimationSettings];
  int v8 = +[HUAnimationApplier staticApplierWithAnimationSettings:v7];
  [(HUCardViewController *)self setAnimationApplier:v8];

  objc_initWeak(&location, self);
  double v9 = [(HUCardViewController *)self animationApplier];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  float v13 = __50__HUCardViewController_setContentOffset_animated___block_invoke;
  char v14 = &unk_1E6390708;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&x;
  v15[2] = *(id *)&y;
  [v9 addApplierBlock:&v11];

  __int16 v10 = [(HUCardViewController *)self animationApplier];
  [v10 start];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __50__HUCardViewController_setContentOffset_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained scrollView];
  objc_msgSend(v2, "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));

  BOOL v3 = [WeakRetained scrollView];
  [v3 _flashScrollIndicatorsPersistingPreviousFlashes];

  id v4 = [WeakRetained scrollView];
  [v4 setScrollEnabled:1];
}

- (id)_springAnimationSettings
{
  id v2 = objc_alloc_init(HUSpringAnimationSettings);
  [(HUSpringAnimationSettings *)v2 setMass:5.0];
  [(HUSpringAnimationSettings *)v2 setStiffness:500.0];
  [(HUSpringAnimationSettings *)v2 setDamping:1000.0];
  [(HUSpringAnimationSettings *)v2 setInitialVelocity:0.0];
  LODWORD(v3) = 1044401829;
  LODWORD(v4) = 991345561;
  LODWORD(v5) = 1057634019;
  LODWORD(v6) = 1064730781;
  id v7 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v3 :v4 :v5 :v6];
  [(HUSpringAnimationSettings *)v2 setTimingFunction:v7];

  return v2;
}

- (void)_updateCloseButtonVibrancyEffect
{
  int v3 = [MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    uint64_t v4 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v12 = (id)v4;
  if (v3)
  {
    double v5 = [(HUCardViewController *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];

    if (v6 == 2) {
      uint64_t v7 = 19;
    }
    else {
      uint64_t v7 = 14;
    }
    int v8 = (void *)MEMORY[0x1E4F42FE8];
    double v9 = [MEMORY[0x1E4F427D8] effectWithStyle:v7];
    uint64_t v10 = [v8 effectForBlurEffect:v9];

    id v12 = (id)v10;
  }
  uint64_t v11 = [(HUCardViewController *)self closeButtonEffectView];
  [v11 setEffect:v12];
}

- (void)_checkHubAvailability
{
  int v3 = [(HUCardViewController *)self home];
  int v4 = objc_msgSend(v3, "hf_shouldBlockCurrentUserFromHome");

  if (v4)
  {
    objc_opt_class();
    double v5 = [(HUCardViewController *)self sourceItem];
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v13 = v6;

    if (v13)
    {
      uint64_t v7 = [v13 accessories];
      int v8 = [v7 allObjects];
      unsigned int v9 = objc_msgSend(v8, "na_all:", &__block_literal_global_158_0);

      uint64_t v10 = [v13 accessories];
      uint64_t v11 = [v10 allObjects];
      int v12 = objc_msgSend(v11, "na_any:", &__block_literal_global_160_0);

      [(HUCardViewController *)self setIsUnavailableHub:v12 & v9];
    }
  }
}

uint64_t __45__HUCardViewController__checkHubAvailability__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = objc_msgSend(v2, "hf_isAppleTV");
  }

  return v3;
}

uint64_t __45__HUCardViewController__checkHubAvailability__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isControllable] ^ 1;
}

- (id)keyCommands
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439F0] modifierFlags:0 action:sel__escapeKeyPressed];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)_escapeKeyPressed
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@: User pressed Esc key", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(HUCardViewController *)self requestDismissal];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v38 = a3;
  int v4 = [MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials];
  if ([(HUCardViewController *)self hideControls]
    || [(HUCardViewController *)self hideSettings])
  {
    goto LABEL_19;
  }
  if (([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials] | v4) == 1)
  {
    int v5 = [MEMORY[0x1E4F428B8] clearColor];
    uint64_t v6 = [(HUCardViewController *)self scrollView];
    [v6 setBackgroundColor:v5];
    goto LABEL_10;
  }
  uint64_t v7 = [(HUCardViewController *)self traitCollection];
  int v5 = +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", [v7 userInterfaceStyle]);

  [v38 frame];
  double v9 = v8;
  [v38 contentSize];
  double v11 = v10;
  [v38 contentOffset];
  float v13 = v12;
  if (v13 <= 0.0 || [(HUCardViewController *)self disablePullToUnlockSettings])
  {
    id v14 = v5;
  }
  else
  {
    float v36 = v9;
    float v37 = v11;
    if ((float)(v36 + v13) < v37)
    {
      uint64_t v6 = 0;
      goto LABEL_9;
    }
    id v14 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  }
  uint64_t v6 = v14;
LABEL_9:
  double v15 = [(HUCardViewController *)self scrollView];
  [v15 setBackgroundColor:v6];

LABEL_10:
  [v38 contentOffset];
  float v17 = v16 / 25.0;
  float v18 = fmax(fmin(v17, 1.0), 0.0);
  double v19 = v18;
  double v20 = [(HUCardViewController *)self navigationItem];
  [v20 _setManualScrollEdgeAppearanceProgress:v19];

  [(HUCardViewController *)self _quickControlScrollOffsetBoundary];
  double v22 = v21 + 80.0;
  double v23 = [(HUCardViewController *)self panGestureRecognizer];
  if ([v23 state] == 1)
  {
    BOOL v24 = 1;
  }
  else
  {
    uint64_t v25 = [(HUCardViewController *)self panGestureRecognizer];
    BOOL v24 = [v25 state] == 2;
  }
  int v26 = [MEMORY[0x1E4F69758] isAMac];
  [v38 contentOffset];
  if (v27 < v22
    || ([(HUCardViewController *)self quickControlViewController],
        double v28 = objc_claimAutoreleasedReturnValue(),
        [v28 controlContainerView],
        int v29 = objc_claimAutoreleasedReturnValue(),
        int v30 = [v29 shouldShowDetailsButton],
        v29,
        v28,
        ((v30 ^ 1 | v24 | v26) & 1) != 0))
  {
    if (v26)
    {
      [v38 contentOffset];
      double v32 = v31;
      [(HUCardViewController *)self _quickControlScrollOffsetBoundary];
      if (v32 > v33)
      {
        BOOL v34 = [(HUCardViewController *)self quickControlViewController];
        BOOL v35 = [v34 controlContainerView];
        [v35 setShouldShowDetailsButton:0];
      }
    }
  }
  else
  {
    [v38 contentOffset];
    -[HUCardViewController _nudgeScrollViewToPoint:](self, "_nudgeScrollViewToPoint:");
  }
LABEL_19:
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v10 = a3;
  [(HUCardViewController *)self _quickControlScrollOffsetBoundary];
  double v5 = v4;
  [v10 contentOffset];
  if (v6 >= v5)
  {
    uint64_t v7 = [(HUCardViewController *)self quickControlViewController];
    double v8 = [v7 controlContainerView];
    if ([v8 shouldShowDetailsButton])
    {
      char v9 = [MEMORY[0x1E4F69758] isAMac];

      if ((v9 & 1) == 0)
      {
        [v10 contentOffset];
        -[HUCardViewController _nudgeScrollViewToPoint:](self, "_nudgeScrollViewToPoint:");
      }
    }
    else
    {
    }
  }
}

- (id)hu_preloadContent
{
  objc_opt_class();
  uint64_t v3 = [(HUCardViewController *)self settingsViewController];
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    objc_msgSend(v5, "hu_preloadContent");
  }
  else {
  double v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a4;
  double v6 = [v5 view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v8 = 1;
  }
  else
  {
    char v9 = [(HUCardViewController *)self scrollView];
    id v10 = [v9 panGestureRecognizer];
    BOOL v8 = v10 == v5;
  }
  return v8;
}

- (void)controllerCoordinator:(id)a3 didUpdateIconDescriptor:(id)a4 showOffState:(BOOL)a5
{
}

- (void)controllerCoordinator:(id)a3 didUpdateStatusWithPrimaryText:(id)a4 secondaryText:(id)a5
{
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v11 = a4;
  id v6 = [(HUCardViewController *)self sourceItem];

  if (v6 == v11)
  {
    [(HUCardViewController *)self _updateIconDescriptorAnimated:1];
    uint64_t v7 = [(HUCardViewController *)self viewControllerCoordinator];
    BOOL v8 = [v7 primaryStatusText];
    char v9 = [(HUCardViewController *)self viewControllerCoordinator];
    id v10 = [v9 secondaryStatusText];
    [(HUCardViewController *)self _updateControlStatusTextWithPrimaryText:v8 secondaryText:v10];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HUCardViewController.m", 1117, @"Unknown source item %@", v11 object file lineNumber description];
  }
}

- (id)hu_prepareForDismissalAnimated:(BOOL)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v5 = [(HUCardViewController *)self requestDismissal];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__HUCardViewController_hu_prepareForDismissalAnimated___block_invoke;
  id v15[3] = &unk_1E6387DC8;
  id v6 = v4;
  id v16 = v6;
  id v7 = (id)[v5 addSuccessBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__HUCardViewController_hu_prepareForDismissalAnimated___block_invoke_177;
  v13[3] = &unk_1E6386708;
  id v8 = v6;
  id v14 = v8;
  id v9 = (id)[v5 addFailureBlock:v13];
  id v10 = v14;
  id v11 = v8;

  return v11;
}

uint64_t __55__HUCardViewController_hu_prepareForDismissalAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&unk_1F19B4FA0];
}

uint64_t __55__HUCardViewController_hu_prepareForDismissalAnimated___block_invoke_177(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&unk_1F19B4FB8];
}

- (HUQuickControlContainerViewController)quickControlViewController
{
  return self->_quickControlViewController;
}

- (void)setQuickControlViewController:(id)a3
{
}

- (UIViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (HUCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hideControls
{
  return self->_hideControls;
}

- (BOOL)hideSettings
{
  return self->_hideSettings;
}

- (BOOL)disablePullToUnlockSettings
{
  return self->_disablePullToUnlockSettings;
}

- (void)setDisablePullToUnlockSettings:(BOOL)a3
{
  self->_disablePullToUnlockSettings = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView
{
  return self->_navigationBarTitleView;
}

- (void)setNavigationBarTitleView:(id)a3
{
}

- (HUQuickControlViewControllerCoordinator)viewControllerCoordinator
{
  return self->_viewControllerCoordinator;
}

- (void)setViewControllerCoordinator:(id)a3
{
}

- (BOOL)settingsUnlocked
{
  return self->_settingsUnlocked;
}

- (void)setSettingsUnlocked:(BOOL)a3
{
  self->_settingsUnlocked = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (BOOL)isConfiguredForNonHomeUser
{
  return self->_isConfiguredForNonHomeUser;
}

- (void)setIsConfiguredForNonHomeUser:(BOOL)a3
{
  self->_isConfiguredForNonHomeUser = a3;
}

- (NAPromise)viewControllerReadyPromise
{
  return self->_viewControllerReadyPromise;
}

- (void)setViewControllerReadyPromise:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (HUQuickControlProxHandOffSummaryViewUpdater)proxHandOffSummaryViewUpdater
{
  return self->_proxHandOffSummaryViewUpdater;
}

- (void)setProxHandOffSummaryViewUpdater:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (UILayoutGuide)quickControlLayoutGuide
{
  return self->_quickControlLayoutGuide;
}

- (void)setQuickControlLayoutGuide:(id)a3
{
}

- (HUVisualEffectContainerView)closeButtonEffectView
{
  return self->_closeButtonEffectView;
}

- (void)setCloseButtonEffectView:(id)a3
{
}

- (UIView)transitionBlurView
{
  return self->_transitionBlurView;
}

- (void)setTransitionBlurView:(id)a3
{
}

- (HUHubUnavailableView)hubUnavailableView
{
  return self->_hubUnavailableView;
}

- (void)setHubUnavailableView:(id)a3
{
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (HUAnimationApplier)animationApplier
{
  return self->_animationApplier;
}

- (void)setAnimationApplier:(id)a3
{
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (void)setControlItems:(id)a3
{
}

- (NSMutableArray)contentSizeKeyPathObservees
{
  return self->_contentSizeKeyPathObservees;
}

- (void)setContentSizeKeyPathObservees:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerView);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setSpinnerView:(id)a3
{
}

- (BOOL)hasRequestedDismissal
{
  return self->_hasRequestedDismissal;
}

- (void)setHasRequestedDismissal:(BOOL)a3
{
  self->_hasRequestedDismissal = a3;
}

- (BOOL)isUnavailableHub
{
  return self->_isUnavailableHub;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spinnerView);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_contentSizeKeyPathObservees, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_animationApplier, 0);
  objc_storeStrong((id *)&self->_hubUnavailableView, 0);
  objc_storeStrong((id *)&self->_transitionBlurView, 0);
  objc_storeStrong((id *)&self->_closeButtonEffectView, 0);
  objc_storeStrong((id *)&self->_quickControlLayoutGuide, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_proxHandOffSummaryViewUpdater, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_viewControllerReadyPromise, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_viewControllerCoordinator, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);

  objc_storeStrong((id *)&self->_quickControlViewController, 0);
}

@end