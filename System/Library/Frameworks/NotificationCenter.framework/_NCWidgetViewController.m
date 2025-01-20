@interface _NCWidgetViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)_reduceTransparencyDidChange:(id)a3;
+ (void)initialize;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_setVisibleFrame:(CGRect)a3;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (NCWidgetProvidingPrivate)_contentProvidingViewController;
- (NSString)_containerIdentifier;
- (NSString)_widgetIdentifier;
- (UIEdgeInsets)_clientMarginInsets;
- (UIEdgeInsets)_initialLayoutMargins;
- (UIView)_contentView;
- (_NCWidgetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)_clientPreferredContentHeight;
- (double)_clientPreferredContentHeightPermittingAutolayout:(BOOL)a3 didUseFittingSize:(BOOL *)a4;
- (double)_effectiveHeightForRequestedHeight:(double)a3;
- (int64_t)_clientLargestSupportedDisplayMode;
- (int64_t)_visibilityState;
- (void)__openTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4;
- (void)__performUpdateWithReplyHandler:(id)a3;
- (void)__requestEncodedLayerTreeToURL:(id)a3 withCodingImageFormat:(id)a4 withReplyHandler:(id)a5;
- (void)__setActiveDisplayMode:(int64_t)a3;
- (void)__setMaximumSize:(CGSize)a3 forDisplayMode:(int64_t)a4;
- (void)__updateLayoutMargins:(id)a3;
- (void)__updateVisibleFrame:(CGRect)a3 withReplyHandler:(id)a4;
- (void)_clientLargestSupportedDisplayModeDidChange;
- (void)_closeTransactionWithAppearState:(int)a3;
- (void)_encodeLayerTreeToURL:(id)a3 withCodingImageFormat:(id)a4 withReplyHandler:(id)a5;
- (void)_enqueueProxyRequest:(id)a3;
- (void)_notifyContentProvidingViewControllerOfActiveDisplayModeChange;
- (void)_performUpdateWithCompletionHandler:(id)a3;
- (void)_processInputItems:(id)a3 initialActiveDisplayMode:(int64_t *)a4;
- (void)_requestMarginInsets;
- (void)_requestPreferredViewHeight:(double)a3;
- (void)_setActiveDisplayMode:(int64_t)a3 unconditionallyNotifyingContentProvidingViewController:(BOOL)a4;
- (void)_setClientMarginInsets:(UIEdgeInsets)a3;
- (void)_setContentProvidingViewController:(id)a3;
- (void)_setContentView:(id)a3;
- (void)_setInitialLayoutMargins:(UIEdgeInsets)a3;
- (void)_setMaximumWidth:(double)a3 forDisplayMode:(int64_t)a4;
- (void)_setVisibilityState:(int64_t)a3;
- (void)_setVisibilityState:(int64_t)a3 force:(BOOL)a4;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setContentProvidingViewController:(id)a3;
- (void)setWidgetIdentifier:(id)a3;
- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _NCWidgetViewController

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D93E110];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D936AC8];
}

+ (void)initialize
{
  v24[1] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v3 = (objc_class *)objc_opt_class();
    NCSwizzleClassMethod(v3, sel_labelColor, sel_nc_labelColor);
    v4 = [MEMORY[0x263F1C850] sharedInstance];
    [v4 setKeyboardFencingEnabled:0];

    v5 = (void *)MEMORY[0x263F1CA40];
    v24[0] = objc_opt_class();
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    v7 = [v5 appearanceWhenContainedInInstancesOfClasses:v6];
    v8 = [MEMORY[0x263F1C550] clearColor];
    [v7 setBackgroundColor:v8];

    v9 = (void *)MEMORY[0x263F1CA40];
    uint64_t v23 = objc_opt_class();
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    v11 = [v9 appearanceWhenContainedInInstancesOfClasses:v10];
    objc_msgSend(v11, "setSeparatorInset:", *MEMORY[0x263F1D600], 0.0, *MEMORY[0x263F1D600], *MEMORY[0x263F1D600]);

    v12 = (void *)MEMORY[0x263F1CA48];
    uint64_t v22 = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    v14 = [v12 appearanceWhenContainedInInstancesOfClasses:v13];
    v15 = [MEMORY[0x263F1C550] clearColor];
    [v14 setBackgroundColor:v15];

    v16 = (void *)MEMORY[0x263F1C768];
    uint64_t v21 = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    v18 = [v16 appearanceWhenContainedInInstancesOfClasses:v17];
    v19 = [MEMORY[0x263F1C550] labelColor];
    [v18 setTextColor:v19];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:a1 selector:sel__reduceTransparencyDidChange_ name:*MEMORY[0x263F1CE58] object:0];

    [a1 _reduceTransparencyDidChange:0];
  }
}

+ (void)_reduceTransparencyDidChange:(id)a3
{
  v59[1] = *MEMORY[0x263EF8340];
  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    if (dyld_program_sdk_at_least())
    {
      v13 = (void *)MEMORY[0x263F1CA40];
      uint64_t v56 = objc_opt_class();
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
      v15 = [v13 appearanceWhenContainedInInstancesOfClasses:v14];
      v16 = [MEMORY[0x263F1C550] whiteColor];
      [v15 setSeparatorColor:v16];

      v17 = (void *)MEMORY[0x263F1CA40];
      uint64_t v55 = objc_opt_class();
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
      v19 = [v17 appearanceWhenContainedInInstancesOfClasses:v18];
      v20 = [MEMORY[0x263F1CB58] widgetEffectForVibrancyStyle:120];
      [v19 setSeparatorEffect:v20];

      id v21 = objc_alloc(MEMORY[0x263F1CB98]);
      uint64_t v22 = [MEMORY[0x263F1CB58] widgetEffectForVibrancyStyle:112];
      v11 = (void *)[v21 initWithEffect:v22];

      uint64_t v23 = [v11 contentView];
      v24 = [MEMORY[0x263F1C550] whiteColor];
      [v23 setBackgroundColor:v24];

      v25 = (void *)MEMORY[0x263F1CA48];
      uint64_t v54 = objc_opt_class();
      v26 = (void *)MEMORY[0x263EFF8C0];
      v27 = &v54;
    }
    else
    {
      int v28 = dyld_program_sdk_at_least();
      v29 = (void *)MEMORY[0x263F1CA40];
      uint64_t v30 = objc_opt_class();
      if (!v28)
      {
        uint64_t v50 = v30;
        v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
        v46 = [v29 appearanceWhenContainedInInstancesOfClasses:v45];
        v47 = [MEMORY[0x263F1C550] colorWithWhite:0.52 alpha:1.0];
        [v46 setSeparatorColor:v47];

        v48 = (void *)MEMORY[0x263F1CA40];
        uint64_t v49 = objc_opt_class();
        v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
        v12 = [v48 appearanceWhenContainedInInstancesOfClasses:v11];
        v44 = [MEMORY[0x263F1CB58] notificationCenterVibrancyEffect];
        [v12 setSeparatorEffect:v44];
        goto LABEL_9;
      }
      uint64_t v53 = v30;
      v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
      v32 = [v29 appearanceWhenContainedInInstancesOfClasses:v31];
      v33 = [MEMORY[0x263F54000] _visualStylingProviderForStyleSetNamed:@"platterClientStyle" inBundle:0];
      v34 = [v33 _visualStylingForStyle:2];
      v35 = [v34 color];
      [v32 setSeparatorColor:v35];

      v36 = (void *)MEMORY[0x263F1CA40];
      uint64_t v52 = objc_opt_class();
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
      v38 = [v36 appearanceWhenContainedInInstancesOfClasses:v37];
      v39 = [MEMORY[0x263F1CB58] widgetTertiaryVibrancyEffect];
      [v38 setSeparatorEffect:v39];

      id v40 = objc_alloc(MEMORY[0x263F1CB98]);
      v41 = [MEMORY[0x263F1CB58] widgetQuaternaryVibrancyEffect];
      v11 = (void *)[v40 initWithEffect:v41];

      v42 = [v11 contentView];
      v43 = [v42 tintColor];
      [v11 setBackgroundColor:v43];

      v25 = (void *)MEMORY[0x263F1CA48];
      uint64_t v51 = objc_opt_class();
      v26 = (void *)MEMORY[0x263EFF8C0];
      v27 = &v51;
    }
    v12 = [v26 arrayWithObjects:v27 count:1];
    v44 = [v25 appearanceWhenContainedInInstancesOfClasses:v12];
    [v44 _forSpringBoardSetDefaultSelectedBackgroundView:v11];
LABEL_9:

    goto LABEL_10;
  }
  v3 = (void *)MEMORY[0x263F1CA40];
  v59[0] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  v5 = [v3 appearanceWhenContainedInInstancesOfClasses:v4];
  v6 = [MEMORY[0x263F1C550] tableSeparatorLightColor];
  [v5 setSeparatorColor:v6];

  v7 = (void *)MEMORY[0x263F1CA40];
  uint64_t v58 = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
  v9 = [v7 appearanceWhenContainedInInstancesOfClasses:v8];
  [v9 setSeparatorEffect:0];

  v10 = (void *)MEMORY[0x263F1CA48];
  uint64_t v57 = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
  v12 = [v10 appearanceWhenContainedInInstancesOfClasses:v11];
  [v12 _forSpringBoardSetDefaultSelectedBackgroundView:0];
LABEL_10:
}

- (_NCWidgetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_NCWidgetViewController;
  v4 = [(_NCWidgetViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    NCRegisterWidgetsLogging();
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NotificationCenter.RVCProxyQueue", 0);
    v6 = (void *)*((void *)v4 + 122);
    *((void *)v4 + 122) = v5;

    dispatch_suspend(*((dispatch_object_t *)v4 + 122));
    if (dyld_program_sdk_at_least())
    {
      long long v7 = *MEMORY[0x263F1D1C0];
      long long v8 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    }
    else
    {
      long long v7 = xmmword_225AB01A0;
      long long v8 = xmmword_225AB01B0;
    }
    *(_OWORD *)(v4 + 1080) = v7;
    *(_OWORD *)(v4 + 1096) = v8;
    [MEMORY[0x263F1C838] _setPanGestureRecognizersEnabled:0];
    uint64_t v9 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    v10 = (void *)*((void *)v4 + 123);
    *((void *)v4 + 123) = v9;

    [v4 setViewRespectsSystemMinimumLayoutMargins:0];
  }
  return (_NCWidgetViewController *)v4;
}

- (void)dealloc
{
  remoteViewControllerProxyQueue = self->_remoteViewControllerProxyQueue;
  if (!dispatch_queue_get_specific(remoteViewControllerProxyQueue, "_NCWidgetHostViewControllerQueueIsEnabledTag")) {
    dispatch_resume(remoteViewControllerProxyQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NCWidgetViewController;
  [(_NCWidgetViewController *)&v4 dealloc];
}

- (void)_enqueueProxyRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    remoteViewControllerProxyQueue = self->_remoteViewControllerProxyQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48___NCWidgetViewController__enqueueProxyRequest___block_invoke;
    block[3] = &unk_264761470;
    id v7 = v4;
    objc_copyWeak(&v8, &location);
    dispatch_async(remoteViewControllerProxyQueue, block);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
}

- (void)_setContentProvidingViewController:(id)a3
{
  id v5 = a3;
  v6 = v5;
  p_contentProvidingViewController = (id *)&self->_contentProvidingViewController;
  if (!self->_contentProvidingViewController)
  {
    BOOL v8 = 1;
    if (!v5) {
      goto LABEL_21;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_ERROR)) {
    -[_NCWidgetViewController _setContentProvidingViewController:]();
  }
  BOOL v8 = *p_contentProvidingViewController == 0;
  if (v6)
  {
LABEL_7:
    if (v8)
    {
      objc_storeStrong((id *)&self->_contentProvidingViewController, a3);
      [*p_contentProvidingViewController setViewRespectsSystemMinimumLayoutMargins:0];
      [*p_contentProvidingViewController willMoveToParentViewController:self];
      [(_NCWidgetViewController *)self addChildViewController:*p_contentProvidingViewController];
      *(unsigned char *)&self->_contentProvidingViewControllerFlags = *(unsigned char *)&self->_contentProvidingViewControllerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
      if (objc_opt_respondsToSelector()) {
        char v9 = 2;
      }
      else {
        char v9 = 0;
      }
      *(unsigned char *)&self->_contentProvidingViewControllerFlags = *(unsigned char *)&self->_contentProvidingViewControllerFlags & 0xFD | v9;
      if (objc_opt_respondsToSelector()) {
        char v10 = 4;
      }
      else {
        char v10 = 0;
      }
      *(unsigned char *)&self->_contentProvidingViewControllerFlags = *(unsigned char *)&self->_contentProvidingViewControllerFlags & 0xFB | v10;
      if (objc_opt_respondsToSelector()) {
        char v11 = 8;
      }
      else {
        char v11 = 0;
      }
      *(unsigned char *)&self->_contentProvidingViewControllerFlags = *(unsigned char *)&self->_contentProvidingViewControllerFlags & 0xF7 | v11;
      if (objc_opt_respondsToSelector()) {
        char v12 = 16;
      }
      else {
        char v12 = 0;
      }
      *(unsigned char *)&self->_contentProvidingViewControllerFlags = *(unsigned char *)&self->_contentProvidingViewControllerFlags & 0xEF | v12;
    }
  }
LABEL_21:
}

- (void)_requestMarginInsets
{
  if ((dyld_program_sdk_at_least() & 1) == 0 && (*(unsigned char *)&self->_contentProvidingViewControllerFlags & 2) != 0)
  {
    -[NCWidgetProvidingPrivate widgetMarginInsetsForProposedMarginInsets:](self->_contentProvidingViewController, "widgetMarginInsetsForProposedMarginInsets:", self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
    self->_clientMarginInsets.top = v3;
    self->_clientMarginInsets.left = v4;
    self->_clientMarginInsets.bottom = v5;
    self->_clientMarginInsets.right = v6;
  }
}

- (void)_processInputItems:(id)a3 initialActiveDisplayMode:(int64_t *)a4
{
  id v6 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  void v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = dyld_program_sdk_at_least();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71___NCWidgetViewController__processInputItems_initialActiveDisplayMode___block_invoke;
  v7[3] = &unk_264761498;
  v7[4] = self;
  v7[5] = v26;
  v7[6] = v24;
  v7[7] = v22;
  v7[8] = v20;
  v7[9] = v18;
  v7[10] = v16;
  v7[11] = v14;
  v7[12] = v12;
  v7[13] = v10;
  v7[14] = v8;
  v7[15] = a4;
  [v6 enumerateObjectsUsingBlock:v7];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21.receiver = self;
    v21.super_class = (Class)_NCWidgetViewController;
    [(_NCWidgetViewController *)&v21 beginRequestWithExtensionContext:v4];
    [v4 _setHostViewController:self];
    CGFloat v5 = [(_NCWidgetViewController *)self childViewControllers];
    id v6 = [v5 lastObject];
    [(_NCWidgetViewController *)self _setContentProvidingViewController:v6];

    if (!self->_contentProvidingViewController)
    {
      id v7 = NCLogWidgets;
      if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225AA6000, v7, OS_LOG_TYPE_DEFAULT, "No content providing view controller found", buf, 2u);
      }
    }
    int64_t v20 = 0;
    BOOL v8 = [v4 inputItems];
    [(_NCWidgetViewController *)self _processInputItems:v8 initialActiveDisplayMode:&v20];

    char v9 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = v9;
      char v11 = [(_NCWidgetViewController *)self _widgetIdentifier];
      char v12 = [(_NCWidgetViewController *)self _containerIdentifier];
      *(_DWORD *)buf = 138543874;
      char v23 = v11;
      __int16 v24 = 2050;
      char v25 = self;
      __int16 v26 = 2114;
      char v27 = v12;
      _os_log_impl(&dword_225AA6000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Beginning request",
        buf,
        0x20u);
    }
    [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController beginRequestWithExtensionContext:v4];
    [(_NCWidgetViewController *)self _setVisibilityState:self->_visibilityState force:1];
    [(_NCWidgetViewController *)self loadViewIfNeeded];
    int64_t v13 = [(_NCWidgetViewController *)self _clientLargestSupportedDisplayMode];
    int64_t v14 = v20;
    if (v13 == -1)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __60___NCWidgetViewController_beginRequestWithExtensionContext___block_invoke;
      v19[3] = &__block_descriptor_40_e33_v16__0___NCWidgetViewController_8l;
      v19[4] = v20;
      [(_NCWidgetViewController *)self _enqueueProxyRequest:v19];
    }
    else if (v20 >= v13)
    {
      int64_t v14 = v13;
    }
    [(_NCWidgetViewController *)self _setActiveDisplayMode:v14 unconditionallyNotifyingContentProvidingViewController:1];
  }
  else
  {
    char v15 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      char v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543362;
      char v23 = v18;
      _os_log_impl(&dword_225AA6000, v16, OS_LOG_TYPE_DEFAULT, "Extension context of unexpected class (%{public}@)", buf, 0xCu);
    }
  }
}

- (void)loadView
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CGFloat v3 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    CGFloat v5 = [(_NCWidgetViewController *)self _widgetIdentifier];
    id v6 = [(_NCWidgetViewController *)self _containerIdentifier];
    int v10 = 138543874;
    char v11 = v5;
    __int16 v12 = 2050;
    int64_t v13 = self;
    __int16 v14 = 2114;
    char v15 = v6;
    _os_log_impl(&dword_225AA6000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Loading view",
      (uint8_t *)&v10,
      0x20u);
  }
  id v7 = [_NCWidgetViewControllerView alloc];
  BOOL v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 bounds];
  char v9 = -[_NCWidgetViewControllerView initWithFrame:](v7, "initWithFrame:");

  [(_NCWidgetViewControllerView *)v9 setAutoresizingMask:18];
  [(NCSizeObservingView *)v9 setDelegate:self];
  [(_NCWidgetViewController *)self setView:v9];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)_NCWidgetViewController;
  [(_NCWidgetViewController *)&v25 viewDidLoad];
  CGFloat v3 = [(_NCWidgetViewController *)self view];
  [v3 setAutoresizesSubviews:1];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];
  id v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];

  CGFloat v5 = (UIScrollViewDelayedTouchesBeganGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C948]) initWithTarget:self action:sel_delayed_];
  touchDelayGestureRecognizer = self->_touchDelayGestureRecognizer;
  self->_touchDelayGestureRecognizer = v5;

  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self->_touchDelayGestureRecognizer setDelaysTouchesBegan:1];
  [v3 addGestureRecognizer:self->_touchDelayGestureRecognizer];
  [(_NCWidgetViewController *)self _requestMarginInsets];
  SanitizedClientFrameFromHostSize(self->_initialBounds.size.width, self->_initialBounds.size.height, self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
  double v8 = v7;
  __int16 v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v9, v10, v11, v7);
  contentView = self->_contentView;
  self->_contentView = v12;

  [(_NCWidgetViewController *)self _requestPreferredViewHeight:v8];
  [(UIView *)self->_contentView setClipsToBounds:1];
  [(UIView *)self->_contentView setAutoresizesSubviews:1];
  [(UIView *)self->_contentView setAutoresizingMask:0];
  [(UIView *)self->_contentView setInsetsLayoutMarginsFromSafeArea:0];
  double v14 = *MEMORY[0x263F1D1C0];
  double v15 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v16 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v17 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  -[UIView setLayoutMargins:](self->_contentView, "setLayoutMargins:", *MEMORY[0x263F1D1C0], v15, v16, v17);
  [(UIView *)self->_contentView setPreservesSuperviewLayoutMargins:1];
  [v3 addSubview:self->_contentView];
  v18 = [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController view];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:1];

  char v19 = [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController view];
  objc_msgSend(v19, "setLayoutMargins:", v14, v15, v16, v17);

  int64_t v20 = [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController view];
  [v20 setPreservesSuperviewLayoutMargins:1];

  objc_super v21 = [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController view];
  [(UIView *)self->_contentView bounds];
  objc_msgSend(v21, "setFrame:");

  uint64_t v22 = [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController view];
  [v22 setAutoresizingMask:18];

  char v23 = self->_contentView;
  __int16 v24 = [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController view];
  [(UIView *)v23 addSubview:v24];

  objc_msgSend(v3, "setLayoutMargins:", self->_initialLayoutMargins.top, self->_initialLayoutMargins.left, self->_initialLayoutMargins.bottom, self->_initialLayoutMargins.right);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)_closeTransactionWithAppearState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  CGFloat v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    double v7 = [(_NCWidgetViewController *)self _widgetIdentifier];
    double v8 = [(_NCWidgetViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138544386;
    objc_super v25 = v7;
    __int16 v26 = 2050;
    char v27 = self;
    __int16 v28 = 2114;
    v29 = v8;
    __int16 v30 = 1026;
    int v31 = v3;
    __int16 v32 = 1026;
    int v33 = [(_NCWidgetViewController *)self _appearState];
    _os_log_impl(&dword_225AA6000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Attempting to close transaction with appear state '%{public}d' (cu"
      "rrent appear state '%{public}d')",
      buf,
      0x2Cu);
  }
  wrappedAppearStatesToOpenTransactionIDs = self->_wrappedAppearStatesToOpenTransactionIDs;
  double v10 = [NSNumber numberWithUnsignedInt:v3];
  double v11 = [(NSMapTable *)wrappedAppearStatesToOpenTransactionIDs objectForKey:v10];

  if (v11)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    int64_t v20 = __60___NCWidgetViewController__closeTransactionWithAppearState___block_invoke;
    objc_super v21 = &unk_2647614E0;
    int v23 = v3;
    id v22 = v11;
    [(_NCWidgetViewController *)self _enqueueProxyRequest:&v18];
  }
  else
  {
    __int16 v12 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = v12;
      double v14 = [(_NCWidgetViewController *)self _widgetIdentifier];
      double v15 = [(_NCWidgetViewController *)self _containerIdentifier];
      *(_DWORD *)buf = 138544130;
      objc_super v25 = v14;
      __int16 v26 = 2050;
      char v27 = self;
      __int16 v28 = 2114;
      v29 = v15;
      __int16 v30 = 1026;
      int v31 = v3;
      _os_log_impl(&dword_225AA6000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No open appearance transaction for state '%{public}d' to close",
        buf,
        0x26u);
    }
  }
  double v16 = self->_wrappedAppearStatesToOpenTransactionIDs;
  double v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3, v18, v19, v20, v21);
  [(NSMapTable *)v16 removeObjectForKey:v17];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  CGFloat v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    double v7 = [(_NCWidgetViewController *)self _widgetIdentifier];
    double v8 = [(_NCWidgetViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138543874;
    double v15 = v7;
    __int16 v16 = 2050;
    double v17 = self;
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    _os_log_impl(&dword_225AA6000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> View will appear",
      buf,
      0x20u);
  }
  remoteViewControllerProxyQueue = self->_remoteViewControllerProxyQueue;
  if (!dispatch_queue_get_specific(remoteViewControllerProxyQueue, "_NCWidgetHostViewControllerQueueIsEnabledTag"))
  {
    dispatch_queue_set_specific(remoteViewControllerProxyQueue, "_NCWidgetHostViewControllerQueueIsEnabledTag", (void *)1, 0);
    dispatch_resume((dispatch_object_t)self->_remoteViewControllerProxyQueue);
  }
  v13.receiver = self;
  v13.super_class = (Class)_NCWidgetViewController;
  [(_NCWidgetViewController *)&v13 viewWillAppear:v3];
  [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController beginAppearanceTransition:1 animated:v3];
  objc_initWeak((id *)buf, self);
  double v10 = (void *)*MEMORY[0x263F1D020];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42___NCWidgetViewController_viewWillAppear___block_invoke;
  v11[3] = &unk_264761508;
  objc_copyWeak(&v12, (id *)buf);
  [v10 _performBlockAfterCATransactionCommits:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  CGFloat v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    double v7 = [(_NCWidgetViewController *)self _widgetIdentifier];
    double v8 = [(_NCWidgetViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138543874;
    double v11 = v7;
    __int16 v12 = 2050;
    objc_super v13 = self;
    __int16 v14 = 2114;
    double v15 = v8;
    _os_log_impl(&dword_225AA6000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> View did appear",
      buf,
      0x20u);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NCWidgetViewController;
  [(_NCWidgetViewController *)&v9 viewDidAppear:v3];
  [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController endAppearanceTransition];
  [(_NCWidgetViewController *)self _closeTransactionWithAppearState:2];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  CGFloat v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    double v7 = [(_NCWidgetViewController *)self _widgetIdentifier];
    double v8 = [(_NCWidgetViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138543874;
    double v11 = v7;
    __int16 v12 = 2050;
    objc_super v13 = self;
    __int16 v14 = 2114;
    double v15 = v8;
    _os_log_impl(&dword_225AA6000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> View will disappear",
      buf,
      0x20u);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NCWidgetViewController;
  [(_NCWidgetViewController *)&v9 viewWillDisappear:v3];
  [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController beginAppearanceTransition:0 animated:v3];
  [(_NCWidgetViewController *)self _closeTransactionWithAppearState:3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  CGFloat v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    double v7 = [(_NCWidgetViewController *)self _widgetIdentifier];
    double v8 = [(_NCWidgetViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138543874;
    double v11 = v7;
    __int16 v12 = 2050;
    objc_super v13 = self;
    __int16 v14 = 2114;
    double v15 = v8;
    _os_log_impl(&dword_225AA6000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> View did disappear",
      buf,
      0x20u);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NCWidgetViewController;
  [(_NCWidgetViewController *)&v9 viewDidDisappear:v3];
  [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController endAppearanceTransition];
  [(_NCWidgetViewController *)self _closeTransactionWithAppearState:0];
}

- (double)_effectiveHeightForRequestedHeight:(double)a3
{
  return self->_clientMarginInsets.top + a3 + self->_clientMarginInsets.bottom;
}

- (void)_requestPreferredViewHeight:(double)a3
{
  [(_NCWidgetViewController *)self _effectiveHeightForRequestedHeight:a3];
  double v5 = v4;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55___NCWidgetViewController__requestPreferredViewHeight___block_invoke;
  v17[3] = &__block_descriptor_40_e33_v16__0___NCWidgetViewController_8l;
  *(double *)&v17[4] = v4;
  [(_NCWidgetViewController *)self _enqueueProxyRequest:v17];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    if ([(_NCWidgetViewController *)self isViewLoaded])
    {
      [(UIView *)self->_contentView frame];
      SanitizedClientFrameFromHostSize(v6, v7, self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
      double width = v18.size.width;
      double height = v18.size.height;
      if (CGRectGetHeight(v18) == v5)
      {
        id v10 = objc_alloc_init(MEMORY[0x263F1CD58]);
        contentProvidingViewController = self->_contentProvidingViewController;
        __int16 v12 = [v10 _transitionCoordinator];
        -[NCWidgetProvidingPrivate viewWillTransitionToSize:withTransitionCoordinator:](contentProvidingViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v12, width, height);

        if (self->_clientUsesAutolayout)
        {
          objc_initWeak(&location, self);
          objc_super v13 = [v10 _transitionCoordinator];
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __55___NCWidgetViewController__requestPreferredViewHeight___block_invoke_2;
          void v14[3] = &unk_264761530;
          objc_copyWeak(&v15, &location);
          [v13 animateAlongsideTransition:v14 completion:0];

          objc_destroyWeak(&v15);
          objc_destroyWeak(&location);
        }
        objc_msgSend(v10, "__runAlongsideAnimations");
        [v10 completeTransition:1];
      }
    }
  }
}

- (double)_clientPreferredContentHeightPermittingAutolayout:(BOOL)a3 didUseFittingSize:(BOOL *)a4
{
  BOOL v5 = a3;
  [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController preferredContentSize];
  double v8 = v7;
  if (v5 && fabs(v7) < 2.22044605e-16)
  {
    objc_super v9 = [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController view];
    id v10 = [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    LODWORD(v11) = 1148846080;
    LODWORD(v13) = 1112014848;
    objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v12, v14, v11, v13);
    double v8 = v15;

    if (a4) {
      *a4 = 1;
    }
  }
  v16.n128_u64[0] = NCMainScreenScale();
  v17.n128_f64[0] = v8;

  MEMORY[0x270F06260](v17, v16);
  return result;
}

- (double)_clientPreferredContentHeight
{
  [(_NCWidgetViewController *)self _clientPreferredContentHeightPermittingAutolayout:0 didUseFittingSize:0];
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  if (self->_contentProvidingViewController == a3)
  {
    [(_NCWidgetViewController *)self _clientPreferredContentHeight];
    -[_NCWidgetViewController _requestPreferredViewHeight:](self, "_requestPreferredViewHeight:");
  }
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  if (self->_contentProvidingViewController == a3)
  {
    [a3 preferredContentSize];
    if (fabs(v4) < 2.22044605e-16)
    {
      [(_NCWidgetViewController *)self _clientPreferredContentHeightPermittingAutolayout:1 didUseFittingSize:&self->_clientUsesAutolayout];
      -[_NCWidgetViewController _requestPreferredViewHeight:](self, "_requestPreferredViewHeight:");
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = v8;
    id v10 = [(_NCWidgetViewController *)self _widgetIdentifier];
    double v11 = [(_NCWidgetViewController *)self _containerIdentifier];
    v28.double width = width;
    v28.double height = height;
    double v12 = NSStringFromCGSize(v28);
    *(_DWORD *)buf = 138544130;
    uint64_t v20 = v10;
    __int16 v21 = 2050;
    id v22 = self;
    __int16 v23 = 2114;
    __int16 v24 = v11;
    __int16 v25 = 2114;
    __int16 v26 = v12;
    _os_log_impl(&dword_225AA6000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Transitioning to size: %{public}@",
      buf,
      0x2Au);
  }
  SanitizedClientFrameFromHostSize(width, height, self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
  double v13 = v29.size.width;
  double v14 = v29.size.height;
  double v15 = CGRectGetWidth(v29);
  -[_NCWidgetViewController _setMaximumWidth:forDisplayMode:](self, "_setMaximumWidth:forDisplayMode:", 0);
  [(_NCWidgetViewController *)self _setMaximumWidth:1 forDisplayMode:v15];
  v18.receiver = self;
  v18.super_class = (Class)_NCWidgetViewController;
  -[_NCWidgetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, v13, v14);
  if (self->_clientUsesAutolayout)
  {
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78___NCWidgetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    void v16[3] = &unk_264761530;
    objc_copyWeak(&v17, (id *)buf);
    [v7 animateAlongsideTransition:v16 completion:0];
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_performUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (*(unsigned char *)&self->_contentProvidingViewControllerFlags)
  {
    double v6 = [(_NCWidgetViewController *)self _contentProvidingViewController];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63___NCWidgetViewController__performUpdateWithCompletionHandler___block_invoke;
    v7[3] = &unk_264761558;
    id v8 = v5;
    [v6 widgetPerformUpdateWithCompletionHandler:v7];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)_clientLargestSupportedDisplayModeDidChange
{
  uint64_t v3 = [(_NCWidgetViewController *)self _clientLargestSupportedDisplayMode];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70___NCWidgetViewController__clientLargestSupportedDisplayModeDidChange__block_invoke;
  v4[3] = &__block_descriptor_40_e33_v16__0___NCWidgetViewController_8l;
  v4[4] = v3 & ~(v3 >> 63);
  [(_NCWidgetViewController *)self _enqueueProxyRequest:v4];
}

- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEBUG))
  {
    double v14 = v8;
    double v15 = [(_NCWidgetViewController *)self _widgetIdentifier];
    __n128 v16 = [(_NCWidgetViewController *)self _containerIdentifier];
    v35.CGFloat width = width;
    v35.CGFloat height = height;
    id v17 = NSStringFromCGSize(v35);
    [v7 bounds];
    v36.CGFloat width = v18;
    v36.CGFloat height = v19;
    uint64_t v20 = NSStringFromCGSize(v36);
    contentView = self->_contentView;
    int v22 = 138544642;
    __int16 v23 = v15;
    __int16 v24 = 2050;
    __int16 v25 = self;
    __int16 v26 = 2114;
    uint64_t v27 = v16;
    __int16 v28 = 2114;
    CGRect v29 = v17;
    __int16 v30 = 2114;
    int v31 = v20;
    __int16 v32 = 2114;
    int v33 = contentView;
    _os_log_debug_impl(&dword_225AA6000, v14, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p; container: %{public}@> View did change from size: %{public}@; to size: %{public}@; _conte"
      "ntView: %{public}@",
      (uint8_t *)&v22,
      0x3Eu);
  }
  p_contentView = (uint64_t *)&self->_contentView;
  if (![(UIView *)self->_contentView autoresizingMask])
  {
    id v10 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEBUG)) {
      -[_NCWidgetViewController sizeObservingView:didChangeSize:](v10, self, p_contentView);
    }
    double v11 = (void *)*p_contentView;
    [v7 bounds];
    SanitizedClientFrameFromHostSize(v12, v13, self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
    objc_msgSend(v11, "setFrame:");
    [(id)*p_contentView setAutoresizingMask:18];
  }
}

- (void)_encodeLayerTreeToURL:(id)a3 withCodingImageFormat:(id)a4 withReplyHandler:(id)a5
{
  v45[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    double v11 = dispatch_get_global_queue(17, 0);
    double v12 = [(_NCWidgetViewController *)self view];
    if (self->_snapshotTimestampsEnabled)
    {
      id v13 = objc_alloc_init(MEMORY[0x263F1C768]);
      double v14 = NSString;
      double v15 = (void *)MEMORY[0x263F08790];
      __n128 v16 = [MEMORY[0x263EFF910] date];
      id v17 = [v15 localizedStringFromDate:v16 dateStyle:1 timeStyle:2];
      CGFloat v18 = [v14 stringWithFormat:@"snapshot - %@", v17];
      [v13 setText:v18];

      CGFloat v19 = [MEMORY[0x263F1C550] redColor];
      [v13 setTextColor:v19];

      uint64_t v20 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
      [v13 setFont:v20];

      [v13 sizeToFit];
      [v12 addSubview:v13];
      [v13 bounds];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      double v26 = v25;
      double v28 = v27;
      [v12 bounds];
      double Width = CGRectGetWidth(v46);
      v47.origin.x = v22;
      v47.origin.y = v24;
      v47.size.CGFloat width = v26;
      v47.size.CGFloat height = v28;
      double v30 = Width - CGRectGetWidth(v47);
      [v12 bounds];
      double Height = CGRectGetHeight(v48);
      v49.origin.x = v22;
      v49.origin.y = v24;
      v49.size.CGFloat width = v26;
      v49.size.CGFloat height = v28;
      objc_msgSend(v13, "setFrame:", v30, Height - CGRectGetHeight(v49), v26, v28);
    }
    else
    {
      id v13 = 0;
    }
    __int16 v32 = [v12 layer];
    int v33 = v32;
    if (v8 && v11 && v32)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke;
      block[3] = &unk_2647615D0;
      id v39 = v32;
      id v40 = v8;
      id v41 = v9;
      id v42 = v13;
      id v43 = v10;
      dispatch_async(v11, block);

      uint64_t v34 = v39;
    }
    else
    {
      CGSize v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08320];
      uint64_t v34 = [NSString stringWithFormat:@"There is no layer to encode (%@), we failed to obtain a queue (%@), or no URL was provided (%@)", v32, v11, v8];
      v45[0] = v34;
      CGSize v36 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
      v37 = [v35 errorWithDomain:@"NCWidgetErrorDomain" code:3 userInfo:v36];
      (*((void (**)(id, void *))v10 + 2))(v10, v37);
    }
  }
}

- (int64_t)_clientLargestSupportedDisplayMode
{
  if (!dyld_program_sdk_at_least()) {
    return 1;
  }
  uint64_t v3 = [(_NCWidgetViewController *)self _widgetExtensionContext];
  int64_t v4 = [v3 _largestAvailableDisplayMode];

  return v4;
}

- (void)_notifyContentProvidingViewControllerOfActiveDisplayModeChange
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)&self->_contentProvidingViewControllerFlags & 4) != 0)
  {
    uint64_t v3 = [(_NCWidgetViewController *)self _widgetExtensionContext];
    uint64_t v4 = [v3 _activeDisplayMode];
    BOOL v5 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = v5;
      id v7 = [(_NCWidgetViewController *)self _widgetIdentifier];
      id v8 = [(_NCWidgetViewController *)self _containerIdentifier];
      id v9 = NCStringFromWidgetDisplayMode(v4);
      int v11 = 138544130;
      double v12 = v7;
      __int16 v13 = 2050;
      double v14 = self;
      __int16 v15 = 2114;
      __n128 v16 = v8;
      __int16 v17 = 2114;
      CGFloat v18 = v9;
      _os_log_impl(&dword_225AA6000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Notifying content providing view controller of active display mo"
        "de change: %{public}@",
        (uint8_t *)&v11,
        0x2Au);
    }
    id v10 = [(_NCWidgetViewController *)self _contentProvidingViewController];
    [v3 _maximumSizeForDisplayMode:v4];
    objc_msgSend(v10, "widgetActiveDisplayModeDidChange:withMaximumSize:", v4);
  }
}

- (void)_setActiveDisplayMode:(int64_t)a3 unconditionallyNotifyingContentProvidingViewController:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [(_NCWidgetViewController *)self _widgetIdentifier];
    id v10 = [(_NCWidgetViewController *)self _containerIdentifier];
    int v11 = NCStringFromWidgetDisplayMode(a3);
    int v14 = 138544130;
    __int16 v15 = v9;
    __int16 v16 = 2050;
    __int16 v17 = self;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    double v21 = v11;
    _os_log_impl(&dword_225AA6000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Setting active display mode: %{public}@",
      (uint8_t *)&v14,
      0x2Au);
  }
  double v12 = [(_NCWidgetViewController *)self _widgetExtensionContext];
  uint64_t v13 = [v12 _activeDisplayMode];
  [v12 _setActiveDisplayMode:a3];
  if (a4 || v13 != [v12 _activeDisplayMode]) {
    [(_NCWidgetViewController *)self _notifyContentProvidingViewControllerOfActiveDisplayModeChange];
  }
}

- (void)_setMaximumWidth:(double)a3 forDisplayMode:(int64_t)a4
{
  id v7 = [(_NCWidgetViewController *)self _widgetExtensionContext];
  [v7 _maximumSizeForDisplayMode:a4];
  double v9 = v8;

  id v10 = [(_NCWidgetViewController *)self _widgetExtensionContext];
  objc_msgSend(v10, "_setMaximumSize:forDisplayMode:", a4, a3, v9);
}

- (void)_setVisibilityState:(int64_t)a3 force:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a4 || self->_visibilityState != a3)
  {
    self->_visibilityState = a3;
    if ((*(unsigned char *)&self->_contentProvidingViewControllerFlags & 8) != 0)
    {
      BOOL v5 = (void *)NCLogWidgets;
      if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        double v6 = v5;
        id v7 = [(_NCWidgetViewController *)self _widgetIdentifier];
        double v8 = [(_NCWidgetViewController *)self _containerIdentifier];
        double v9 = NCStringFromWidgetVisibilityState(self->_visibilityState);
        int v10 = 138544130;
        int v11 = v7;
        __int16 v12 = 2050;
        uint64_t v13 = self;
        __int16 v14 = 2114;
        __int16 v15 = v8;
        __int16 v16 = 2114;
        __int16 v17 = v9;
        _os_log_impl(&dword_225AA6000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Updating visibility state: %{public}@",
          (uint8_t *)&v10,
          0x2Au);
      }
      [(NCWidgetProvidingPrivate *)self->_contentProvidingViewController widgetDidBecomeForeground:self->_visibilityState == 1];
    }
  }
}

- (void)_setVisibilityState:(int64_t)a3
{
}

- (BOOL)_setVisibleFrame:(CGRect)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  $0E4DB4B6D3D371CDD2C960DF20F7ED59 contentProvidingViewControllerFlags = self->_contentProvidingViewControllerFlags;
  if ((*(unsigned char *)&contentProvidingViewControllerFlags & 0x10) != 0)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    double v9 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v9;
      int v11 = [(_NCWidgetViewController *)self _widgetIdentifier];
      __int16 v12 = [(_NCWidgetViewController *)self _containerIdentifier];
      v25.origin.double x = x;
      v25.origin.double y = y;
      v25.size.double width = width;
      v25.size.double height = height;
      uint64_t v13 = NSStringFromCGRect(v25);
      int v16 = 138544130;
      __int16 v17 = v11;
      __int16 v18 = 2050;
      uint64_t v19 = self;
      __int16 v20 = 2114;
      double v21 = v12;
      __int16 v22 = 2114;
      double v23 = v13;
      _os_log_impl(&dword_225AA6000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Updating visibility frame: %{public}@",
        (uint8_t *)&v16,
        0x2Au);
    }
    -[NCWidgetProvidingPrivate widgetVisibleFrameDidChange:](self->_contentProvidingViewController, "widgetVisibleFrameDidChange:", x, y, width, height);
  }
  return (*(unsigned int *)&contentProvidingViewControllerFlags >> 4) & 1;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return 1;
}

- (void)__setActiveDisplayMode:(int64_t)a3
{
}

- (void)__setMaximumSize:(CGSize)a3 forDisplayMode:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = [(_NCWidgetViewController *)self _widgetExtensionContext];
  objc_msgSend(v7, "_setMaximumSize:forDisplayMode:", a4, width, height);
}

- (void)__requestEncodedLayerTreeToURL:(id)a3 withCodingImageFormat:(id)a4 withReplyHandler:(id)a5
{
  if (a5) {
    -[_NCWidgetViewController _encodeLayerTreeToURL:withCodingImageFormat:withReplyHandler:](self, "_encodeLayerTreeToURL:withCodingImageFormat:withReplyHandler:", a3, a4);
  }
}

- (void)__performUpdateWithReplyHandler:(id)a3
{
  if (a3) {
    -[_NCWidgetViewController _performUpdateWithCompletionHandler:](self, "_performUpdateWithCompletionHandler:");
  }
}

- (void)__openTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a4;
  p_wrappedAppearStatesToOpenTransactionIDs = &self->_wrappedAppearStatesToOpenTransactionIDs;
  if ([(NSMapTable *)self->_wrappedAppearStatesToOpenTransactionIDs count] >= 2)
  {
    double v8 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[_NCWidgetViewController __openTransactionForAppearanceCallWithState:withIdentifier:]((void **)&self->_wrappedAppearStatesToOpenTransactionIDs, v8);
    }
  }
  double v9 = (void *)[(NSMapTable *)*p_wrappedAppearStatesToOpenTransactionIDs copy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        -[_NCWidgetViewController _closeTransactionWithAppearState:](self, "_closeTransactionWithAppearState:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v14++), "integerValue", (void)v21));
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v35 count:16];
    }
    while (v12);
  }

  __int16 v15 = *p_wrappedAppearStatesToOpenTransactionIDs;
  int v16 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMapTable *)v15 setObject:v6 forKey:v16];

  __int16 v17 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = v17;
    uint64_t v19 = [(_NCWidgetViewController *)self _widgetIdentifier];
    __int16 v20 = [(_NCWidgetViewController *)self _containerIdentifier];
    *(_DWORD *)buf = 138544386;
    double v26 = v19;
    __int16 v27 = 2050;
    double v28 = self;
    __int16 v29 = 2114;
    double v30 = v20;
    __int16 v31 = 1026;
    int v32 = v4;
    __int16 v33 = 2114;
    id v34 = v6;
    _os_log_impl(&dword_225AA6000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Opened appearance transaction with state: %{public}d; identifier: %{public}@",
      buf,
      0x30u);
  }
}

- (void)__updateVisibleFrame:(CGRect)a3 withReplyHandler:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  BOOL v9 = -[_NCWidgetViewController _setVisibleFrame:](self, "_setVisibleFrame:", x, y, width, height);
  id v10 = v11;
  if (v11)
  {
    (*((void (**)(id, BOOL))v11 + 2))(v11, v9);
    id v10 = v11;
  }
}

- (void)__updateLayoutMargins:(id)a3
{
  string = (NSString *)a3;
  if ([(NSString *)string length])
  {
    uint64_t v4 = [(_NCWidgetViewController *)self viewIfLoaded];
    UIEdgeInsets v7 = UIEdgeInsetsFromString(string);
    objc_msgSend(v4, "setLayoutMargins:", v7.top, v7.left, v7.bottom, v7.right);
  }
}

- (NCWidgetProvidingPrivate)_contentProvidingViewController
{
  return self->_contentProvidingViewController;
}

- (void)setContentProvidingViewController:(id)a3
{
}

- (int64_t)_visibilityState
{
  return self->_visibilityState;
}

- (UIView)_contentView
{
  return self->_contentView;
}

- (void)_setContentView:(id)a3
{
}

- (UIEdgeInsets)_clientMarginInsets
{
  double top = self->_clientMarginInsets.top;
  double left = self->_clientMarginInsets.left;
  double bottom = self->_clientMarginInsets.bottom;
  double right = self->_clientMarginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setClientMarginInsets:(UIEdgeInsets)a3
{
  self->_clientMarginInsets = a3;
}

- (UIEdgeInsets)_initialLayoutMargins
{
  double top = self->_initialLayoutMargins.top;
  double left = self->_initialLayoutMargins.left;
  double bottom = self->_initialLayoutMargins.bottom;
  double right = self->_initialLayoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setInitialLayoutMargins:(UIEdgeInsets)a3
{
  self->_initialLayoutMargins = a3;
}

- (NSString)_widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
}

- (NSString)_containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentProvidingViewController, 0);
  objc_storeStrong((id *)&self->_touchDelayGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_wrappedAppearStatesToOpenTransactionIDs, 0);

  objc_storeStrong((id *)&self->_remoteViewControllerProxyQueue, 0);
}

- (void)_setContentProvidingViewController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_225AA6000, v0, OS_LOG_TYPE_ERROR, "Attempt to set content providing VC (%{public}@) when one already exists (%{public}@)", v1, 0x16u);
}

- (void)sizeObservingView:(uint64_t *)a3 didChangeSize:.cold.1(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v5 = a1;
  id v6 = [a2 _widgetIdentifier];
  UIEdgeInsets v7 = [a2 _containerIdentifier];
  uint64_t v8 = *a3;
  int v9 = 138544130;
  id v10 = v6;
  __int16 v11 = 2050;
  uint64_t v12 = a2;
  __int16 v13 = 2114;
  uint64_t v14 = v7;
  __int16 v15 = 2114;
  uint64_t v16 = v8;
  _os_log_debug_impl(&dword_225AA6000, v5, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p; container: %{public}@> Updating content view autoresizing mask: %{public}@",
    (uint8_t *)&v9,
    0x2Au);
}

- (void)__openTransactionForAppearanceCallWithState:(void *)a1 withIdentifier:(void *)a2 .cold.1(void **a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_225AA6000, v3, OS_LOG_TYPE_ERROR, "have %{public}lu open appearance transactions (expected 0 or 1): %{public}@", v4, 0x16u);
}

@end