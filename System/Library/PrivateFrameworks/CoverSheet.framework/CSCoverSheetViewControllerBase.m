@interface CSCoverSheetViewControllerBase
+ (Class)viewClass;
- (BOOL)_canShowWhileLocked;
- (BOOL)_presentationParticipant;
- (BOOL)_rebuildAppearance;
- (BOOL)_rebuildBehavior;
- (BOOL)_rebuildPresentation;
- (BOOL)handleAction:(id)a3 fromController:(id)a4;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isDisappeared;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isPresentation;
- (BOOL)needsContentView;
- (BOOL)presentationCancelsTouches;
- (BOOL)sendAppearanceTransitionForChildViewControllers;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CAFrameRateRange)presentationPreferredFrameRateRange;
- (CGSize)effectiveContentSizeForScrollView:(id)a3;
- (CSAppearance)activeAppearance;
- (CSBehavior)activeBehavior;
- (CSCoverSheetViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4;
- (CSCoverSheetViewPresenting)presenter;
- (CSPresentation)externalPresentation;
- (NSArray)presentationRegions;
- (NSSet)components;
- (NSString)appearanceIdentifier;
- (NSString)coverSheetIdentifier;
- (NSString)description;
- (SBSDisplayLayoutElement)_displayLayoutElement;
- (UICoordinateSpace)presentationCoordinateSpace;
- (UIViewController)kitPresentedViewController;
- (_UILegibilitySettings)legibilitySettings;
- (id)_displayLayoutPublisher;
- (id)_newDisplayLayoutElement;
- (id)_presenter;
- (id)_regionsForView:(id)a3;
- (id)_timelinesForDateInterval:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)presentationAltitude;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationTransition;
- (int64_t)presentationType;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (unsigned)presentationFrameRateRangeReason;
- (void)_layoutIfNeededForPresentation;
- (void)_rebuildDisposition;
- (void)_setDisplayLayoutElementActive:(BOOL)a3 immediately:(BOOL)a4;
- (void)_updateDisplayLayoutElementForActivation:(id)a3;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregatePresentation:(id)a3;
- (void)dealloc;
- (void)didTransitionToPresented:(BOOL)a3;
- (void)dismiss;
- (void)handleAction:(id)a3 fromSender:(id)a4;
- (void)loadView;
- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5;
- (void)rebuildAppearance;
- (void)rebuildBehavior;
- (void)rebuildEverythingForReason:(id)a3;
- (void)registerView:(id)a3 forRole:(int64_t)a4;
- (void)registerView:(id)a3 forRole:(int64_t)a4 options:(unint64_t)a5;
- (void)sendAction:(id)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setPresenter:(id)a3;
- (void)unregisterAllViews;
- (void)unregisterView:(id)a3;
- (void)updateAppearance:(id)a3;
- (void)updateAppearance:(id)a3 completion:(id)a4;
- (void)updateAppearanceForController:(id)a3;
- (void)updateAppearanceForController:(id)a3 withAnimationSettings:(id)a4 completion:(id)a5;
- (void)updateBehavior:(id)a3;
- (void)updateBehaviorForController:(id)a3;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
- (void)updateForPresentation:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToPresented:(BOOL)a3;
@end

@implementation CSCoverSheetViewControllerBase

- (void)updateBehaviorForController:(id)a3
{
  id v4 = a3;
  if ([(CSCoverSheetViewControllerBase *)self _rebuildBehavior])
  {
    v5 = [(CSCoverSheetViewControllerBase *)self _presenter];
    [v5 updateBehaviorForController:self];
  }
  else
  {
    v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CSCoverSheetViewControllerBase updateBehaviorForController:]((uint64_t)self, v4);
    }
  }
}

- (BOOL)_rebuildBehavior
{
  v3 = +[CSBehavior behavior];
  [(CSCoverSheetViewControllerBase *)self aggregateBehavior:v3];
  p_behavior = &self->_behavior;
  BOOL v5 = [(CSBehavior *)*p_behavior isEqual:v3];
  if (!v5) {
    objc_storeStrong((id *)p_behavior, v3);
  }

  return !v5;
}

- (id)_presenter
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if (!WeakRetained)
  {
    BOOL v5 = [(CSCoverSheetViewControllerBase *)self parentViewController];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0
      || ([(CSCoverSheetViewControllerBase *)self parentViewController],
          (WeakRetained = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v7 = [(CSCoverSheetViewControllerBase *)self presentingViewController];
      char v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0
        || ([(CSCoverSheetViewControllerBase *)self presentingViewController],
            (WeakRetained = objc_claimAutoreleasedReturnValue()) == 0))
      {
        WeakRetained = [(CSCoverSheetViewControllerBase *)self navigationController];
        if (WeakRetained)
        {
          v9 = [(CSCoverSheetViewControllerBase *)self navigationController];
          v10 = [v9 parentViewController];
          char v11 = objc_opt_respondsToSelector();

          if (v11)
          {
            v12 = [(CSCoverSheetViewControllerBase *)self navigationController];
            WeakRetained = [v12 parentViewController];
          }
          else
          {
            WeakRetained = 0;
          }
        }
      }
    }
  }

  return WeakRetained;
}

- (int64_t)scrollingStrategy
{
  return [(CSBehavior *)self->_behavior scrollingStrategy];
}

- (unint64_t)restrictedCapabilities
{
  return [(CSBehavior *)self->_behavior restrictedCapabilities];
}

- (int64_t)proximityDetectionMode
{
  return [(CSBehavior *)self->_behavior proximityDetectionMode];
}

- (int64_t)notificationBehavior
{
  return [(CSBehavior *)self->_behavior notificationBehavior];
}

- (int64_t)idleWarnMode
{
  return [(CSBehavior *)self->_behavior idleWarnMode];
}

- (int64_t)idleTimerMode
{
  return [(CSBehavior *)self->_behavior idleTimerMode];
}

- (int64_t)idleTimerDuration
{
  return [(CSBehavior *)self->_behavior idleTimerDuration];
}

- (int64_t)participantState
{
  if ([(CSCoverSheetViewControllerBase *)self isDisappeared]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)isDisappeared
{
  return [(CSCoverSheetViewControllerBase *)self _appearState] == 0;
}

- (void)rebuildBehavior
{
}

- (CSCoverSheetViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CSCoverSheetViewControllerBase;
  id v4 = [(CSCoverSheetViewControllerBase *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    BOOL v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CSCoverSheetViewControllerBase initWithNibName:bundle:]();
    }

    char v6 = [MEMORY[0x1E4F4F718] descriptionForObject:v4];
    uint64_t v7 = +[CSAppearance appearanceWithIdentifier:v6];
    appearance = v4->_appearance;
    v4->_appearance = (CSAppearance *)v7;

    uint64_t v9 = +[CSBehavior behavior];
    behavior = v4->_behavior;
    v4->_behavior = (CSBehavior *)v9;
  }
  return v4;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CSCoverSheetViewControllerBase initWithNibName:bundle:]();
  }

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerBase;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc((Class)[(id)objc_opt_class() viewClass]);
  objc_super v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  id v8 = (id)objc_msgSend(v3, "initWithFrame:");

  BOOL v5 = [v8 layer];
  char v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 setName:v7];

  [v8 setAutoresizingMask:18];
  [v8 setAutoresizesSubviews:1];
  [(CSCoverSheetViewControllerBase *)self setView:v8];
}

- (void)viewDidLoad
{
  OUTLINED_FUNCTION_6_0();
  v1 = v0;
  OUTLINED_FUNCTION_5_0();
  v2 = _SBFLoggingMethodProem();
  id v3 = (void *)MEMORY[0x1E4F4F718];
  objc_super v4 = [v1 view];
  BOOL v5 = [v3 descriptionForObject:v4];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D839D000, v6, v7, "%@ %@", v8, v9, v10, v11, v12);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v17, sel_viewWillAppear_);
  BOOL v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = _SBFLoggingMethodProem();
    uint8_t v12 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    __int16 v21 = 2112;
    v22 = v12;
    _os_log_debug_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEBUG, "%@ animated: %@", buf, 0x16u);
  }
  if (([(CSCoverSheetViewControllerBase *)self shouldAutomaticallyForwardAppearanceMethods] & 1) == 0&& [(CSCoverSheetViewControllerBase *)self sendAppearanceTransitionForChildViewControllers])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [(CSCoverSheetViewControllerBase *)self childViewControllers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [(CSCoverSheetViewControllerBase *)self bs_beginAppearanceTransitionForChildViewController:*(void *)(*((void *)&v13 + 1) + 8 * v10++) toVisible:1 animated:v3];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v16, sel_viewDidAppear_);
  objc_super v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = _SBFLoggingMethodProem();
    uint64_t v11 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    _os_log_debug_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEBUG, "%@ animated: %@", buf, 0x16u);
  }
  [(CSCoverSheetViewControllerBase *)self setDisplayLayoutElementActive:1];
  if (([(CSCoverSheetViewControllerBase *)self shouldAutomaticallyForwardAppearanceMethods] & 1) == 0&& [(CSCoverSheetViewControllerBase *)self sendAppearanceTransitionForChildViewControllers])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v5 = [(CSCoverSheetViewControllerBase *)self childViewControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [(CSCoverSheetViewControllerBase *)self bs_endAppearanceTransitionForChildViewController:*(void *)(*((void *)&v12 + 1) + 8 * v9++) toVisible:1];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  [(CSCoverSheetViewControllerBase *)self rebuildEverythingForReason:@"ViewController Did Appear"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v17, sel_viewWillDisappear_);
  BOOL v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = _SBFLoggingMethodProem();
    long long v12 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    uint64_t v22 = v12;
    _os_log_debug_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEBUG, "%@ animated: %@", buf, 0x16u);
  }
  [(CSCoverSheetViewControllerBase *)self setDisplayLayoutElementActive:0];
  if (([(CSCoverSheetViewControllerBase *)self shouldAutomaticallyForwardAppearanceMethods] & 1) == 0&& [(CSCoverSheetViewControllerBase *)self sendAppearanceTransitionForChildViewControllers])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [(CSCoverSheetViewControllerBase *)self childViewControllers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [(CSCoverSheetViewControllerBase *)self bs_beginAppearanceTransitionForChildViewController:*(void *)(*((void *)&v13 + 1) + 8 * v10++) toVisible:0 animated:v3];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v16, sel_viewDidDisappear_);
  objc_super v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = _SBFLoggingMethodProem();
    uint64_t v11 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    _os_log_debug_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEBUG, "%@ animated: %@", buf, 0x16u);
  }
  if (([(CSCoverSheetViewControllerBase *)self shouldAutomaticallyForwardAppearanceMethods] & 1) == 0&& [(CSCoverSheetViewControllerBase *)self sendAppearanceTransitionForChildViewControllers])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v5 = [(CSCoverSheetViewControllerBase *)self childViewControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [(CSCoverSheetViewControllerBase *)self bs_endAppearanceTransitionForChildViewController:*(void *)(*((void *)&v12 + 1) + 8 * v9++) toVisible:0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)viewWillLayoutSubviews
{
  BOOL v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CSCoverSheetViewControllerBase initWithNibName:bundle:]();
  }

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerBase;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerBase;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidLayoutSubviews];
  BOOL v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CSCoverSheetViewControllerBase initWithNibName:bundle:]();
  }

  if ([(CSCoverSheetViewControllerBase *)self _presentationParticipant])
  {
    if (!self->_forcingLayoutForPresentation) {
      [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if ([(CSCoverSheetViewControllerBase *)self _presentationParticipant])
  {
    v8[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__CSCoverSheetViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v9[3] = &unk_1E6AD97F8;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__CSCoverSheetViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v8[3] = &unk_1E6AD97F8;
    [v7 animateAlongsideTransition:v9 completion:v8];
  }
}

uint64_t __85__CSCoverSheetViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rebuildAppearance];
}

uint64_t __85__CSCoverSheetViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) rebuildAppearance];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)registerView:(id)a3 forRole:(int64_t)a4
{
}

- (void)registerView:(id)a3 forRole:(int64_t)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v9 = a3;
  if (a4)
  {
    if (!v9) {
      goto LABEL_6;
    }
  }
  else
  {
    id v14 = v9;
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CSCoverSheetViewControllerBase.m", 193, @"Invalid parameter not satisfying: %@", @"role != CSRegionRoleNone" object file lineNumber description];

    id v9 = v14;
    if (!v14) {
      goto LABEL_6;
    }
  }
  id v13 = v9;
  if (!self->_regionProviders)
  {
    objc_super v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    regionProviders = self->_regionProviders;
    self->_regionProviders = v10;
  }
  [v13 setCoverSheetRegionRole:a4];
  [v13 setCoverSheetRegionReservedForHorizontalScrolling:v5 & 1];
  [(NSHashTable *)self->_regionProviders addObject:v13];
  id v9 = v13;
LABEL_6:
}

- (void)unregisterView:(id)a3
{
  id v4 = a3;
  [v4 setCoverSheetRegionRole:0];
  [v4 setCoverSheetRegionReservedForHorizontalScrolling:0];
  [(NSHashTable *)self->_regionProviders removeObject:v4];
}

- (void)unregisterAllViews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_regionProviders;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setCoverSheetRegionRole:", 0, (void)v9);
        [v8 setCoverSheetRegionReservedForHorizontalScrolling:0];
      }
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSHashTable *)self->_regionProviders removeAllObjects];
}

- (void)rebuildAppearance
{
}

- (void)rebuildEverythingForReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = _SBFLoggingMethodProem();
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEBUG, "%@ reason = %@", (uint8_t *)&v7, 0x16u);
  }
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
}

- (void)updateAppearance:(id)a3
{
}

- (void)updateAppearance:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    (*((void (**)(id, CSAppearance *))a3 + 2))(a3, self->_appearance);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self withAnimationSettings:a3 completion:v6];
}

- (void)updateBehavior:(id)a3
{
  if (a3) {
    (*((void (**)(id, CSBehavior *))a3 + 2))(a3, self->_behavior);
  }
  id v4 = [(CSCoverSheetViewControllerBase *)self _presenter];
  [v4 updateBehaviorForController:self];
}

- (void)sendAction:(id)a3
{
  id v4 = a3;
  id v5 = [(CSCoverSheetViewControllerBase *)self _presenter];
  [v5 handleAction:v4 fromSender:self];
}

- (void)dismiss
{
  if (dismiss_onceToken != -1) {
    dispatch_once(&dismiss_onceToken, &__block_literal_global_21);
  }
  uint64_t v3 = dismiss___DismissAction;

  [(CSCoverSheetViewControllerBase *)self sendAction:v3];
}

uint64_t __41__CSCoverSheetViewControllerBase_dismiss__block_invoke()
{
  uint64_t v0 = +[CSAction actionWithType:1];
  uint64_t v1 = dismiss___DismissAction;
  dismiss___DismissAction = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)presentationCancelsTouches
{
  return 1;
}

- (UIViewController)kitPresentedViewController
{
  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerBase;
  v2 = [(CSCoverSheetViewControllerBase *)&v4 presentedViewController];

  return (UIViewController *)v2;
}

- (void)willTransitionToPresented:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = _SBFLoggingMethodProem();
    uint64_t v8 = NSStringFromBOOL();
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    long long v12 = v8;
    _os_log_debug_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEBUG, "%@ presented = %@", (uint8_t *)&v9, 0x16u);
  }
  BOOL v6 = a3 || self->_isBeingPresented;
  self->_isBeingPresented = v6;
}

- (void)didTransitionToPresented:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = _SBFLoggingMethodProem();
    int v7 = NSStringFromBOOL();
    int v8 = 138412546;
    int v9 = v6;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_debug_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEBUG, "%@ presented = %@", (uint8_t *)&v8, 0x16u);
  }
  self->_isBeingPresented = a3;
}

- (void)updateForPresentation:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 presentationForRole:2];
  v35 = v4;
  BOOL v6 = [v4 presentationForRole:3];
  v37 = v5;
  [v5 unionPresentation:v6];

  [(CSCoverSheetViewControllerBase *)self _rebuildPresentation];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  int v7 = [(CSCoverSheetViewControllerBase *)self presentationRegions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
        uint64_t v13 = [v12 identity];
        uint64_t v14 = objc_opt_class();
        id v15 = v13;
        if (v14)
        {
          if (objc_opt_isKindOfClass()) {
            objc_super v16 = v15;
          }
          else {
            objc_super v16 = 0;
          }
        }
        else
        {
          objc_super v16 = 0;
        }
        id v17 = v16;

        if (v17)
        {
          regionProviders = self->_regionProviders;
          v19 = [v12 provider];
          LODWORD(regionProviders) = [(NSHashTable *)regionProviders containsObject:v19];

          if (regionProviders)
          {
            if ([v12 role] == 2) {
              [v37 firstRegionIntersectingCoordinateSpace:v17 excludingRegionsWithRole:3];
            }
            else {
            __int16 v20 = [v37 firstRegionIntersectingCoordinateSpace:v17];
            }
            if (v20)
            {
              __int16 v21 = SBLogDashBoard();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                v32 = [MEMORY[0x1E4F4F718] descriptionForObject:v17];
                *(_DWORD *)buf = 138412546;
                v43 = v32;
                __int16 v44 = 2112;
                uint64_t v45 = (uint64_t)v20;
                _os_log_debug_impl(&dword_1D839D000, v21, OS_LOG_TYPE_DEBUG, "View %@ intersects %@.", buf, 0x16u);
              }
              double v22 = 0.0;
            }
            else
            {
              double v22 = 1.0;
            }
            [v17 alpha];
            if ((BSFloatEqualToFloat() & 1) == 0)
            {
              [v17 setAlpha:v22];
              uint64_t v23 = SBLogDashBoard();
              BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

              if (v24)
              {
                v25 = SBLogDashBoard();
                BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
                if (v20)
                {
                  if (v26)
                  {
                    v36 = [MEMORY[0x1E4F4F718] descriptionForObject:v17];
                    uint64_t v27 = [v37 identifier];
                    *(_DWORD *)buf = 138412802;
                    v43 = v36;
                    __int16 v44 = 2112;
                    uint64_t v45 = (uint64_t)v20;
                    __int16 v46 = 2112;
                    uint64_t v47 = v27;
                    v28 = (void *)v27;
                    v29 = v25;
                    v30 = "Hiding view %@ because it intersects %@ within %@";
                    uint32_t v31 = 32;
                    goto LABEL_32;
                  }
                }
                else if (v26)
                {
                  v36 = [MEMORY[0x1E4F4F718] descriptionForObject:v17];
                  uint64_t v33 = [v37 identifier];
                  *(_DWORD *)buf = 138412546;
                  v43 = v36;
                  __int16 v44 = 2112;
                  uint64_t v45 = v33;
                  v28 = (void *)v33;
                  v29 = v25;
                  v30 = "Showing view %@ because it doesn't intersect any regions within %@.";
                  uint32_t v31 = 22;
LABEL_32:
                  _os_log_debug_impl(&dword_1D839D000, v29, OS_LOG_TYPE_DEBUG, v30, buf, v31);
                }
              }
            }
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v34 = [v7 countByEnumeratingWithState:&v38 objects:v48 count:16];
      uint64_t v9 = v34;
    }
    while (v34);
  }

  [(CSCoverSheetViewControllerBase *)self _rebuildPresentation];
}

- (void)aggregateAppearance:(id)a3
{
  id v8 = a3;
  uint64_t v3 = [v8 legibilitySettings];

  if (!v3)
  {
    id v4 = [v8 componentForType:19 property:4];
    id v5 = [v4 value];
    uint64_t v6 = [v5 integerValue];

    int v7 = CSGetLegibilitySettingsForBackgroundStyle(v6);
    if (v7) {
      [v8 setLegibilitySettings:v7];
    }
  }
}

- (void)aggregatePresentation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CSCoverSheetViewControllerBase *)self externalPresentation];
  [v4 unionPresentation:v5];

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v7 = self->_regionProviders;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = -[CSCoverSheetViewControllerBase _regionsForView:](self, "_regionsForView:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        [v6 addObjectsFromArray:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [v4 addRegions:v6];
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (BOOL)handleAction:(id)a3 fromController:(id)a4
{
  return 0;
}

- (BOOL)sendAppearanceTransitionForChildViewControllers
{
  return 1;
}

- (id)_newDisplayLayoutElement
{
  return 0;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  id v4 = a3;
  id v7 = [(CSCoverSheetViewControllerBase *)self view];
  id v5 = [v7 window];
  [v5 level];
  [v4 setLevel:(uint64_t)v6];
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  [(CSCoverSheetViewControllerBase *)self setDisplayLayoutElementActive:a3];
  if (v4 && self->_displayLayoutElement)
  {
    id v6 = [(CSCoverSheetViewControllerBase *)self _displayLayoutPublisher];
    [v6 flush];
  }
}

- (id)_displayLayoutPublisher
{
  return (id)[MEMORY[0x1E4F62438] sharedInstance];
}

- (void)_layoutIfNeededForPresentation
{
  if ([(CSCoverSheetViewControllerBase *)self _appearState])
  {
    self->_forcingLayoutForPresentation = 1;
    uint64_t v3 = [(CSCoverSheetViewControllerBase *)self view];
    [v3 layoutIfNeeded];

    self->_forcingLayoutForPresentation = 0;
  }
}

- (BOOL)_rebuildAppearance
{
  p_appearance = &self->_appearance;
  BOOL v4 = [(CSAppearance *)self->_appearance identifier];
  id v5 = +[CSAppearance appearanceWithIdentifier:v4];

  [(CSCoverSheetViewControllerBase *)self aggregateAppearance:v5];
  BOOL v6 = [(CSCoverSheetViewControllerBase *)self _rebuildPresentation];
  if (![(CSAppearance *)*p_appearance isEqualToAppearance:v5])
  {
    objc_storeStrong((id *)p_appearance, v5);
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_rebuildPresentation
{
  if (![(CSCoverSheetViewControllerBase *)self _presentationParticipant]) {
    return 0;
  }
  p_presentation = (id *)&self->_presentation;
  BOOL v4 = [(CSPresentation *)self->_presentation coordinateSpace];
  id v5 = [(CSCoverSheetViewControllerBase *)self view];
  BOOL v6 = [v5 window];

  if (v4 != v6)
  {
    id v7 = [(CSCoverSheetViewControllerBase *)self view];
    uint64_t v8 = [v7 window];
    uint64_t v9 = +[CSPresentation presentationWithCoordinateSpace:v8];
    id v10 = *p_presentation;
    id *p_presentation = (id)v9;

    id v11 = *p_presentation;
    uint64_t v12 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
    [v11 setIdentifier:v12];
  }
  long long v13 = [*p_presentation presentationForRole:0];
  [(CSCoverSheetViewControllerBase *)self _layoutIfNeededForPresentation];
  [(CSCoverSheetViewControllerBase *)self aggregatePresentation:v13];
  char v14 = [*p_presentation isEqual:v13];
  if ((v14 & 1) == 0) {
    objc_storeStrong(p_presentation, v13);
  }
  char v15 = v14 ^ 1;

  return v15;
}

- (void)_rebuildDisposition
{
  [(CSCoverSheetViewControllerBase *)self _rebuildAppearance];

  [(CSCoverSheetViewControllerBase *)self _rebuildBehavior];
}

- (SBSDisplayLayoutElement)_displayLayoutElement
{
  displayLayoutElement = self->_displayLayoutElement;
  if (!displayLayoutElement)
  {
    BOOL v4 = [(CSCoverSheetViewControllerBase *)self _newDisplayLayoutElement];
    id v5 = self->_displayLayoutElement;
    self->_displayLayoutElement = v4;

    displayLayoutElement = self->_displayLayoutElement;
  }

  return displayLayoutElement;
}

- (id)_timelinesForDateInterval:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSCoverSheetViewControllerBase;
  id v5 = [(CSCoverSheetViewControllerBase *)&v18 _timelinesForDateInterval:v4];
  BOOL v6 = (void *)[v5 mutableCopy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(CSCoverSheetViewControllerBase *)self childViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _timelinesForDateInterval:v4];
        if (v12) {
          [v6 addObjectsFromArray:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSCoverSheetViewControllerBase;
  [(CSCoverSheetViewControllerBase *)&v14 _updateWithFrameSpecifier:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(CSCoverSheetViewControllerBase *)self childViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _updateWithFrameSpecifier:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSString)coverSheetIdentifier
{
  v2 = objc_opt_class();

  return (NSString *)[v2 coverSheetIdentifier];
}

- (CSAppearance)activeAppearance
{
  v2 = [(CSCoverSheetViewControllerBase *)self _presenter];
  uint64_t v3 = [v2 activeAppearance];

  return (CSAppearance *)v3;
}

- (CSBehavior)activeBehavior
{
  v2 = [(CSCoverSheetViewControllerBase *)self _presenter];
  uint64_t v3 = [v2 activeBehavior];

  return (CSBehavior *)v3;
}

- (CSPresentation)externalPresentation
{
  v2 = [(CSCoverSheetViewControllerBase *)self _presenter];
  uint64_t v3 = [v2 externalPresentation];

  return (CSPresentation *)v3;
}

- (BOOL)needsContentView
{
  return 0;
}

- (void)updateAppearanceForController:(id)a3
{
}

- (void)updateAppearanceForController:(id)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = (void (**)(id, void))a5;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F42FF0] _currentAnimationSettings];
  }
  long long v12 = v11;
  id v17 = v11;
  BOOL v13 = [(CSCoverSheetViewControllerBase *)self handleAppearanceUpdateFromController:v8 animationSettings:&v17];
  id v14 = v17;

  if (v13)
  {
    long long v15 = [(CSCoverSheetViewControllerBase *)self _presenter];
    [v15 updateAppearanceForController:self withAnimationSettings:v14 completion:v10];
  }
  else
  {
    uint64_t v16 = SBLogDashBoard();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[CSCoverSheetViewControllerBase updateAppearanceForController:withAnimationSettings:completion:]((uint64_t)self, v8);
    }

    if (v10) {
      v10[2](v10, 0);
    }
  }
}

- (void)handleAction:(id)a3 fromSender:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(CSCoverSheetViewControllerBase *)self handleAction:v8 fromController:v6])
  {
    uint64_t v7 = [(CSCoverSheetViewControllerBase *)self _presenter];
    [v7 handleAction:v8 fromSender:v6];
  }
}

- (int64_t)presentationStyle
{
  return 0;
}

- (int64_t)presentationType
{
  return 0;
}

- (int64_t)presentationPriority
{
  return 0;
}

- (int64_t)presentationTransition
{
  return 0;
}

- (int64_t)presentationAltitude
{
  return 0;
}

- (CAFrameRateRange)presentationPreferredFrameRateRange
{
  float v2 = *MEMORY[0x1E4F39AF0];
  float v3 = *(float *)(MEMORY[0x1E4F39AF0] + 4);
  float v4 = *(float *)(MEMORY[0x1E4F39AF0] + 8);
  result.preferred = v4;
  result.maximum = v3;
  result.minimum = v2;
  return result;
}

- (unsigned)presentationFrameRateRangeReason
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)([v4 type] - 5) <= 2)
  {
    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
  }
  if (([v4 isConsumable] & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(CSCoverSheetViewControllerBase *)self childViewControllers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 handleEvent:v4];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (NSString)appearanceIdentifier
{
  return [(CSAppearance *)self->_appearance identifier];
}

- (NSSet)components
{
  return [(CSAppearance *)self->_appearance components];
}

- (_UILegibilitySettings)legibilitySettings
{
  return [(CSAppearance *)self->_appearance legibilitySettings];
}

- (UICoordinateSpace)presentationCoordinateSpace
{
  return [(CSPresentation *)self->_presentation coordinateSpace];
}

- (NSArray)presentationRegions
{
  return [(CSPresentation *)self->_presentation regions];
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  long long v14 = (void (**)(id, void *))a3;
  id v5 = [(CSCoverSheetViewControllerBase *)self _displayLayoutElement];
  if (v5)
  {
    if (self->_displayLayoutElementAssertion)
    {
      id v6 = [(CSCoverSheetViewControllerBase *)self _displayLayoutPublisher];
      if (!v6)
      {
        long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewControllerBase.m" lineNumber:717 description:@"No publisher"];
      }
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = [v6 transitionAssertionWithReason:v8];

      [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
      displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = 0;

      v14[2](v14, v5);
      id v11 = [v6 addElement:v5];
      long long v12 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v11;

      [v9 invalidate];
    }
    else
    {
      v14[2](v14, v5);
    }
  }
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(CSCoverSheetViewControllerBase *)self _displayLayoutElement];
  if (v6)
  {
    id v15 = v6;
    uint64_t v7 = [(CSCoverSheetViewControllerBase *)self _displayLayoutPublisher];
    if (!v7)
    {
      long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"CSCoverSheetViewControllerBase.m" lineNumber:744 description:@"No publisher"];
    }
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 transitionAssertionWithReason:v9];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    if (v3)
    {
      [(CSCoverSheetViewControllerBase *)self _updateDisplayLayoutElementForActivation:v15];
      long long v12 = [v7 addElement:v15];
      long long v13 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v12;
    }
    [v10 invalidate];

    id v6 = v15;
  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (NSString)description
{
  return (NSString *)[(CSCoverSheetViewControllerBase *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  float v2 = [(CSCoverSheetViewControllerBase *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(CSCoverSheetViewControllerBase *)self _displayLayoutElement];
  id v5 = [v4 identifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"layoutID" skipIfNil:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(CSCoverSheetViewControllerBase *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(CSCoverSheetViewControllerBase *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CSCoverSheetViewControllerBase_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AD88C0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __72__CSCoverSheetViewControllerBase_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  float v2 = (void *)MEMORY[0x1E4F4F718];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _presenter];
  id v5 = [v2 descriptionForObject:v4];
  id v6 = (id)[v3 appendObject:v5 withName:@"presenter"];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) viewIfLoaded];
  id v9 = (id)[v7 appendObject:v8 withName:@"view"];

  id v10 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _appearState];
  id v11 = SBFStringForAppearState();
  id v12 = (id)[v10 appendObject:v11 withName:@"appearState"];

  long long v13 = *(void **)(a1 + 32);
  long long v14 = [*(id *)(a1 + 40) childViewControllers];
  [v13 appendArraySection:v14 withName:@"childViewControllers" skipIfEmpty:1];

  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "presentationStyle"), @"presentationStyle");
  id v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "presentationType"), @"presentationType");
  id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "presentationPriority"), @"presentationPriority");
  id v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "presentationTransition"), @"presentationTransition");
  v19 = *(void **)(a1 + 32);
  uint64_t v20 = [*(id *)(*(void *)(a1 + 40) + 1024) allObjects];
  __int16 v21 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v19 appendArraySection:v20 withName:@"regionProviders" multilinePrefix:v21 skipIfEmpty:1 objectTransformer:&__block_literal_global_98];

  id v22 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 976) withName:@"appearance"];
  id v23 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 984) withName:@"behavior"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 992) withName:@"presentation" skipIfNil:1];
}

uint64_t __72__CSCoverSheetViewControllerBase_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] descriptionForObject:a2];
}

- (BOOL)_presentationParticipant
{
  if (!self->_isBeingPresented)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  BOOL v3 = [(CSCoverSheetViewControllerBase *)self viewIfLoaded];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_regionsForView:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 superview];
  id v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5)
  {
    if ([v4 isCoverSheetView])
    {
      uint64_t v8 = [v4 presentationRegions];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v4;
        id v10 = [v9 superview];
        [(CSCoverSheetViewControllerBase *)self effectiveContentSizeForScrollView:v9];
        BSRectWithSize();
        objc_msgSend(v9, "convertRect:toView:", v10);
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        [v9 frame];
        v49.origin.x = v19;
        v49.origin.y = v20;
        v49.size.double width = v21;
        v49.size.double height = v22;
        v47.origin.x = v12;
        v47.origin.y = v14;
        v47.size.double width = v16;
        v47.size.double height = v18;
        CGRect v48 = CGRectIntersection(v47, v49);
        objc_msgSend(v9, "convertRect:fromView:", v10, v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
        id v23 = +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", v9);

        v45[0] = v23;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
      }
      else
      {
        [v4 bounds];
        id v10 = +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", v4);
        __int16 v44 = v10;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      }
    }
    uint64_t v38 = objc_msgSend(v4, "coverSheetRegionRole", v6);
    uint64_t v24 = [v4 coverSheetRegionIsReservedForHorizontalScrolling];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v7 = v8;
    uint64_t v25 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v7);
          }
          v29 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v30 = [v29 identity];
          uint64_t v31 = objc_opt_class();
          id v32 = v30;
          if (v31)
          {
            if (objc_opt_isKindOfClass()) {
              uint64_t v33 = v32;
            }
            else {
              uint64_t v33 = 0;
            }
          }
          else
          {
            uint64_t v33 = 0;
          }
          id v34 = v33;

          if ([v29 role])
          {
            if (!v34) {
              goto LABEL_27;
            }
          }
          else
          {
            [v29 setRole:v38];
            if (!v34) {
              goto LABEL_27;
            }
          }
          [v34 alpha];
          if (BSFloatIsZero()) {
            uint64_t v35 = 1;
          }
          else {
            uint64_t v35 = [v34 isHidden];
          }
          [v29 setHidden:v35];
LABEL_27:
          if (([v29 isReservedForHorizontalScrolling] & 1) == 0) {
            [v29 setReservedForHorizontalScrolling:v24];
          }
          [v29 setProvider:v4];
        }
        uint64_t v26 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v26);
    }

    id v6 = v37;
  }

  return v7;
}

- (CGSize)effectiveContentSizeForScrollView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 collectionViewLayout];

    [v4 collectionViewContentSize];
    double v6 = v5;
    double v8 = v7;
    id v3 = v4;
  }
  else
  {
    [v3 contentSize];
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)isPresentation
{
  return self->_isBeingPresented;
}

- (CSCoverSheetViewPresenting)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (CSCoverSheetViewPresenting *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_regionProviders, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_behavior, 0);

  objc_storeStrong((id *)&self->_appearance, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0();
  uint64_t v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_1D839D000, v1, v2, "%@", v3, v4, v5, v6, v7);
}

- (void)updateBehaviorForController:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 coverSheetIdentifier];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D839D000, v6, v7, "%@: Ignoring behavior update from %@.", v8, v9, v10, v11, v12);
}

- (void)updateAppearanceForController:(uint64_t)a1 withAnimationSettings:(void *)a2 completion:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 coverSheetIdentifier];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D839D000, v6, v7, "%@: Ignoring appearance update from %@", v8, v9, v10, v11, v12);
}

@end