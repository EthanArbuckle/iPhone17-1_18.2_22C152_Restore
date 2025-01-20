@interface FCUIActivityPickerViewController
+ (BOOL)isOnboardingComplete;
+ (BOOL)isOnboardingEncountered;
+ (void)_markOnboardingComplete;
+ (void)_markOnboardingEncountered;
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isConfiguringEducationCard;
- (BOOL)_updateHeaderOrFooterIfNecessary;
- (BOOL)isFooterPinnedToBottom;
- (CGRect)setContractedFrame:(CGRect)a3 representedActivity:(id)a4 presentationStyle:(int64_t)a5 transitionCoordinator:(id)a6;
- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7;
- (FCActivityManager)_activityManager;
- (FCUIActivityPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7FocusUI26ActivityEditViewController)_editViewController;
- (id)_activityListView;
- (void)_configureActivityListViewWithAvailableActivities:(id)a3;
- (void)_configureActivityView:(id)a3 withLifetimesDescriptionsForActivity:(id)a4;
- (void)_configureEducationCardIfNecessary;
- (void)_dismissHeader;
- (void)_openEditUI:(id)a3;
- (void)_openSetupUI:(id)a3;
- (void)_openURL:(id)a3;
- (void)_presentActivityEditUI:(id)a3;
- (void)_setActivityManager:(id)a3;
- (void)_setConfiguringEducationCard:(BOOL)a3;
- (void)_setEditViewController:(id)a3;
- (void)_updatePreferredContentSize;
- (void)_updateSelectedStateOfActivityControl:(id)a3 activeActivity:(id)a4 lifetimeOfActiveActivity:(id)a5;
- (void)_updateSelectedStateOfActivityViews;
- (void)activityManager:(id)a3 lifetimeDescriptionsDidChangeForActivity:(id)a4;
- (void)availableActivitiesDidChangeForManager:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetScrollForStaticPresentation;
- (void)setFooterPinnedToBottom:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FCUIActivityPickerViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FCUIRegisterLogging();
  }
}

+ (BOOL)isOnboardingEncountered
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"FCUIActivityPickerViewControllerOnboardingEncountered"];

  return v3;
}

+ (BOOL)isOnboardingComplete
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"FCUIActivityPickerViewControllerOnboardingComplete"];

  return v3;
}

- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v13 = a3.size.height;
  double v14 = a3.size.width;
  double v15 = a3.origin.y;
  double v16 = a3.origin.x;
  id v18 = a5;
  id v19 = a7;
  [(FCUIActivityPickerViewController *)self loadViewIfNeeded];
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    v21 = [(FCUIActivityPickerViewController *)self _activityListView];
    v22 = [v21 activityViews];
    id v20 = [v22 lastObject];
  }
  v23 = [(FCUIActivityPickerViewController *)self _activityListView];
  objc_msgSend(v23, "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", v20, a6, v19, v16, v15, v14, v13, x, y, width, height);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (CGRect)setContractedFrame:(CGRect)a3 representedActivity:(id)a4 presentationStyle:(int64_t)a5 transitionCoordinator:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a6;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    double v16 = [(FCUIActivityPickerViewController *)self _activityListView];
    v17 = [v16 activityViews];
    id v15 = [v17 lastObject];
  }
  id v18 = [(FCUIActivityPickerViewController *)self _activityListView];
  objc_msgSend(v18, "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", v15, a5, v14, x, y, width, height);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)resetScrollForStaticPresentation
{
  id v2 = [(FCUIActivityPickerViewController *)self _activityListView];
  [v2 resetScrollForStaticPresentation];
}

- (FCUIActivityPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)FCUIActivityPickerViewController;
  v4 = [(FCUIActivityPickerViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F3F3A0] sharedActivityManager];
    activityManager = v4->_activityManager;
    v4->_activityManager = (FCActivityManager *)v5;

    [(FCActivityManager *)v4->_activityManager addObserver:v4];
    v4->_footerPinnedToBottom = 1;
    v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v7 addObserver:v4 forKeyPath:@"FCUIActivityPickerViewControllerOnboardingComplete" options:1 context:0];
  }
  return v4;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"FCUIActivityPickerViewControllerOnboardingComplete"];

  v4.receiver = self;
  v4.super_class = (Class)FCUIActivityPickerViewController;
  [(FCUIActivityPickerViewController *)&v4 dealloc];
}

- (void)loadView
{
  char v3 = objc_alloc_init(FCUIActivityListView);
  [(FCUIActivityPickerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)FCUIActivityPickerViewController;
  [(FCUIActivityPickerViewController *)&v11 viewDidLoad];
  char v3 = [(FCUIActivityPickerViewController *)self _activityListView];
  [v3 setFooterPinnedToBottom:self->_footerPinnedToBottom];

  objc_super v4 = self;
  v12[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v6 = (id)[(FCUIActivityPickerViewController *)self registerForTraitChanges:v5 withHandler:&__block_literal_global];

  SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke_2;
  v8[3] = &unk_264542AA0;
  objc_copyWeak(&v9, &location);
  dispatch_async(SerialWithQoS, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  objc_super v4 = [a3 preferredContentSizeCategory];
  uint64_t v5 = [v9 traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v4, v6);

  if (v7)
  {
    v8 = [v9 _activityListView];
    [v8 adjustForContentSizeCategoryChange];
  }
}

void __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained[123] availableActivities];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke_3;
    v5[3] = &unk_264542A78;
    v5[4] = v2;
    id v6 = v3;
    id v4 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __47__FCUIActivityPickerViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureActivityListViewWithAvailableActivities:*(void *)(a1 + 40)];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FCUIActivityPickerViewController;
  [(FCUIActivityPickerViewController *)&v4 viewWillAppear:a3];
  [(FCActivityManager *)self->_activityManager setLifetimeDescriptionsUpdatingEnabled:1];
  [(FCUIActivityPickerViewController *)self activeActivityDidChangeForManager:self->_activityManager];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCUIActivityPickerViewController;
  [(FCUIActivityPickerViewController *)&v3 viewDidAppear:a3];
  [(id)objc_opt_class() _markOnboardingEncountered];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FCUIActivityPickerViewController;
  -[FCUIActivityPickerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  [(FCActivityManager *)self->_activityManager setLifetimeDescriptionsUpdatingEnabled:0];
  [(ActivityEditViewController *)self->_editViewController dismissViewControllerAnimated:v3 completion:0];
  editViewController = self->_editViewController;
  self->_editViewController = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  id v4 = [a3 availableActivities];
  [(FCUIActivityPickerViewController *)self _configureActivityListViewWithAvailableActivities:v4];
}

- (void)activityManager:(id)a3 lifetimeDescriptionsDidChangeForActivity:(id)a4
{
  id v5 = a4;
  if (([v5 isPlaceholder] & 1) == 0)
  {
    objc_super v6 = [(FCUIActivityPickerViewController *)self _activityListView];
    NSComparisonResult v7 = [v6 activityViews];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __93__FCUIActivityPickerViewController_activityManager_lifetimeDescriptionsDidChangeForActivity___block_invoke;
    v10[3] = &unk_264542AC8;
    id v8 = v5;
    id v11 = v8;
    id v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v10);

    [(FCUIActivityPickerViewController *)self _configureActivityView:v9 withLifetimesDescriptionsForActivity:v8];
  }
}

uint64_t __93__FCUIActivityPickerViewController_activityManager_lifetimeDescriptionsDidChangeForActivity___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 activityUniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) activityUniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (BSEqualStrings()
    && [(FCUIActivityPickerViewController *)self _updateHeaderOrFooterIfNecessary])
  {
    [(FCUIActivityPickerViewController *)self _updatePreferredContentSize];
    NSComparisonResult v7 = [(FCUIActivityPickerViewController *)self viewIfLoaded];
    [v7 setNeedsLayout];

    [(UIViewController *)self fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation];
  }
}

+ (void)_markOnboardingEncountered
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setBool:1 forKey:@"FCUIActivityPickerViewControllerOnboardingEncountered"];
}

+ (void)_markOnboardingComplete
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setBool:1 forKey:@"FCUIActivityPickerViewControllerOnboardingComplete"];
}

- (id)_activityListView
{
  id v2 = [(FCUIActivityPickerViewController *)self view];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_updatePreferredContentSize
{
  if ([(FCUIActivityPickerViewController *)self isViewLoaded])
  {
    id v6 = [(FCUIActivityPickerViewController *)self _activityListView];
    uint64_t v3 = [(FCUIActivityPickerViewController *)self view];
    [v3 bounds];
    objc_msgSend(v6, "sizeThatFits:", v4, v5);
    -[FCUIActivityPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)_updateSelectedStateOfActivityControl:(id)a3 activeActivity:(id)a4 lifetimeOfActiveActivity:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    v10 = [v7 activityUniqueIdentifier];
    id v24 = v8;
    id v11 = [v8 activityUniqueIdentifier];
    uint64_t v12 = [v10 isEqual:v11];

    [v7 setSelected:v12];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = [v7 menuItemElements];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
          if (v12)
          {
            double v19 = [*(id *)(*((void *)&v25 + 1) + 8 * v17) representedObjectIdentifier];
            double v20 = [v9 lifetimeIdentifier];
            objc_msgSend(v18, "setSelected:", objc_msgSend(v19, "isEqualToString:", v20));
          }
          else
          {
            [*(id *)(*((void *)&v25 + 1) + 8 * v17) setSelected:0];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    id v8 = v24;
    if (([v7 isPlaceholder] & 1) == 0)
    {
      if (([v7 showsPersistentDetailText] ^ 1 | v12))
      {
        if (!v12)
        {
          [v7 setDetailText:0];
          goto LABEL_19;
        }
        uint64_t v21 = [(FCActivityManager *)self->_activityManager localizedTerminationDescriptionForActiveActivity];
      }
      else
      {
        uint64_t v21 = [v7 activityDetailText];
      }
      double v22 = (void *)v21;
      objc_msgSend(v7, "setDetailText:", v21, self);
    }
  }
LABEL_19:
}

- (void)_updateSelectedStateOfActivityViews
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FCActivityManager *)self->_activityManager activeActivity];
  double v4 = [(FCActivityManager *)self->_activityManager lifetimeOfActivity:v3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = [(FCUIActivityPickerViewController *)self _activityListView];
  id v6 = [v5 activityViews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        uint64_t v12 = objc_opt_class();
        id v13 = v11;
        if (v12)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v14 = v13;
          }
          else {
            uint64_t v14 = 0;
          }
        }
        else
        {
          uint64_t v14 = 0;
        }
        id v15 = v14;

        [(FCUIActivityPickerViewController *)self _updateSelectedStateOfActivityControl:v15 activeActivity:v3 lifetimeOfActiveActivity:v4];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(UIViewController *)self fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation];
}

- (void)_presentActivityEditUI:(id)a3
{
  id v4 = a3;
  double v5 = [_TtC7FocusUI26ActivityEditViewController alloc];
  id v6 = [v4 activityDescription];
  uint64_t v7 = [(ActivityEditViewController *)v5 initWithActivityDescription:v6];

  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke;
  v17[3] = &unk_264542B18;
  objc_copyWeak(&v18, &location);
  [(ActivityEditViewController *)v7 setWillDisappearBlock:v17];
  [(FCUIActivityPickerViewController *)self presentViewController:v7 animated:1 completion:0];
  uint64_t v8 = [(FCUIActivityPickerViewController *)self transitionCoordinator];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke_3;
  v13[3] = &unk_264542B40;
  objc_copyWeak(&v16, &location);
  uint64_t v9 = v7;
  uint64_t v14 = v9;
  id v10 = v4;
  id v15 = v10;
  [v8 animateAlongsideTransition:v13 completion:0];

  editViewController = self->_editViewController;
  self->_editViewController = v9;
  uint64_t v12 = v9;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained transitionCoordinator];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke_2;
  v3[3] = &unk_264542AF0;
  v3[4] = WeakRetained;
  [v2 animateAlongsideTransition:v3 completion:0];
}

uint64_t __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _activityListView];
  [v2 endIsolation];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _setEditViewController:0];
}

void __59__FCUIActivityPickerViewController__presentActivityEditUI___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  double v5 = [v4 containerView];

  id v6 = [WeakRetained _activityListView];
  [*(id *)(a1 + 32) visibleHeight];
  objc_msgSend(v5, "convertPoint:toView:", v6, 0.0, v7);
  objc_msgSend(v6, "isolateActivityView:withInset:", *(void *)(a1 + 40), 0.0, 0.0, v8, 0.0);
}

- (void)_openURL:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__FCUIActivityPickerViewController__openURL___block_invoke;
  block[3] = &unk_264542B68;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __45__FCUIActivityPickerViewController__openURL___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = (uint64_t *)(a1 + 32);
  uint64_t v5 = *MEMORY[0x263F3F608];
  v14[0] = *MEMORY[0x263F3F5E8];
  v14[1] = v5;
  v15[0] = MEMORY[0x263EFFA88];
  v15[1] = MEMORY[0x263EFFA88];
  v14[2] = *MEMORY[0x263F3F5C0];
  v15[2] = @"FCUIAppLaunchOriginActivityPicker";
  id v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v11 = 0;
  int v7 = [v2 openSensitiveURL:v4 withOptions:v6 error:&v11];
  id v8 = v11;

  uint64_t v9 = FCUILogSelection;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *v3;
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_21FEDE000, v9, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_ERROR))
  {
    __45__FCUIActivityPickerViewController__openURL___block_invoke_cold_1();
  }
}

- (void)_openEditUI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 activitySettingsURL];

  [(FCUIActivityPickerViewController *)self _openURL:v8];
}

- (void)_openSetupUI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [v7 activitySetupURL];
  }
  else {
  id v8 = objc_msgSend(NSURL, "dnd_defaultSetupURL");
  }
  [(FCUIActivityPickerViewController *)self _openURL:v8];
}

- (void)_dismissHeader
{
  id v2 = objc_opt_class();
  [v2 _markOnboardingComplete];
}

- (BOOL)_isConfiguringEducationCard
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL isConfiguringEducationCard = v2->_isConfiguringEducationCard;
  objc_sync_exit(v2);

  return isConfiguringEducationCard;
}

- (void)_setConfiguringEducationCard:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isConfiguringEducationCard = a3;
  objc_sync_exit(obj);
}

- (void)_configureEducationCardIfNecessary
{
  id v3 = [(FCUIActivityPickerViewController *)self _activityListView];
  id v4 = [v3 headerView];
  if (v4)
  {
  }
  else if (![(FCUIActivityPickerViewController *)self _isConfiguringEducationCard])
  {
    [(FCUIActivityPickerViewController *)self _setConfiguringEducationCard:1];
    uint64_t v5 = +[FCUIActivityPickerEducationCardView defaultEducationCardViewActivityIdentifiers];
    id v6 = +[FCUIActivityPickerEducationCardView defaultEducationCardViewFallbackBaubleDescriptions];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy_;
    v22[4] = __Block_byref_object_dispose_;
    id v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 bundleIdentifier];
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    id v11 = [v8 stringByAppendingFormat:@"%@.educationCardBaubleDescriptions", v10];
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();

    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke;
    block[3] = &unk_264542C00;
    objc_copyWeak(&v20, &location);
    id v16 = v5;
    id v17 = v6;
    long long v19 = v22;
    id v18 = v3;
    id v13 = v6;
    id v14 = v5;
    dispatch_async(SerialWithQoS, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    _Block_object_dispose(v22, 8);
  }
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && [*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3];
      uint64_t v5 = [WeakRetained[123] activityWithIdentifier:v4];
      if (v5)
      {
        id v6 = [[FCUIActivityBaubleDescription alloc] initWithActivityDescription:v5];
      }
      else
      {
        id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v3];
      }
      id v7 = v6;
      if (v6) {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v6];
      }

      ++v3;
    }
    while (v3 < [*(id *)(a1 + 32) count]);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_2;
  block[3] = &unk_264542BD8;
  void block[4] = WeakRetained;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v9;
  long long v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_2(uint64_t a1)
{
  if (([(id)objc_opt_class() isOnboardingComplete] & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    unint64_t v3 = (void *)MEMORY[0x263F823D0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_3;
    v10[3] = &unk_264542B90;
    objc_copyWeak(&v11, &location);
    id v4 = [v3 actionWithHandler:v10];
    uint64_t v5 = +[FCUIActivityPickerEducationCardView defaultEducationCardViewWithProminentViewBaubleDescriptions:v2 dismissAction:v4];

    id v6 = [MEMORY[0x263F823D0] actionWithHandler:&__block_literal_global_46];
    [v5 setDefaultAction:v6];

    [*(id *)(a1 + 40) setHeaderView:v5];
    [*(id *)(a1 + 32) _setConfiguringEducationCard:0];
    [*(id *)(a1 + 32) _updatePreferredContentSize];
    id v7 = (void *)MEMORY[0x263F82E00];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_48;
    v8[3] = &unk_264542B68;
    id v9 = *(id *)(a1 + 40);
    objc_msgSend(v7, "fcui_animateWithDefaultParameters:completion:", v8, 0);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG)) {
    __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_3_cold_1();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissHeader];
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_44(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG)) {
    __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_44_cold_1();
  }
}

uint64_t __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)_updateHeaderOrFooterIfNecessary
{
  if (![(FCUIActivityPickerViewController *)self isViewLoaded])
  {
    id v3 = 0;
    goto LABEL_8;
  }
  id v3 = [(FCUIActivityPickerViewController *)self _activityListView];
  if (v3)
  {
    if ([(id)objc_opt_class() isOnboardingComplete])
    {
      [v3 setHeaderView:0];
      id v4 = [v3 activityViews];
      unint64_t v5 = [v4 count];
      unint64_t v6 = [(FCActivityManager *)self->_activityManager maximumActivityCountForUserInterface];

      id v7 = [v3 footerView];
      id v8 = v7;
      if (v5 < v6)
      {

        if (!v8)
        {
          objc_initWeak(&location, self);
          objc_initWeak(&from, v3);
          id v9 = [FCUIAddActivityFooterView alloc];
          uint64_t v10 = (void *)MEMORY[0x263F823D0];
          id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = [v11 localizedStringForKey:@"ACTIVITY_NEW_FOCUS" value:&stru_26D1B4698 table:0];
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __68__FCUIActivityPickerViewController__updateHeaderOrFooterIfNecessary__block_invoke_2;
          v17[3] = &unk_264542C28;
          objc_copyWeak(&v18, &location);
          objc_copyWeak(&v19, &from);
          id v13 = [v10 actionWithTitle:v12 image:0 identifier:@"newFocus" handler:v17];
          id v14 = [(FCUIAddActivityFooterView *)v9 initWithAction:v13];
          [v3 setFooterView:v14];

          objc_destroyWeak(&v19);
          objc_destroyWeak(&v18);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
LABEL_14:
          BOOL v15 = 1;
          goto LABEL_9;
        }
        goto LABEL_8;
      }

      if (!v8) {
        goto LABEL_8;
      }
    }
    else
    {
      if (![(FCActivityManager *)self->_activityManager isDefaultConfiguration])
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __68__FCUIActivityPickerViewController__updateHeaderOrFooterIfNecessary__block_invoke;
        block[3] = &unk_264542B68;
        void block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
        goto LABEL_8;
      }
      [(FCUIActivityPickerViewController *)self _configureEducationCardIfNecessary];
    }
    [v3 setFooterView:0];
    goto LABEL_14;
  }
LABEL_8:
  BOOL v15 = 0;
LABEL_9:

  return v15;
}

uint64_t __68__FCUIActivityPickerViewController__updateHeaderOrFooterIfNecessary__block_invoke()
{
  v0 = objc_opt_class();
  return [v0 _markOnboardingComplete];
}

void __68__FCUIActivityPickerViewController__updateHeaderOrFooterIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
  {
    id v3 = [v2 footerView];
    [WeakRetained _openSetupUI:v3];
  }
}

- (void)_configureActivityView:(id)a3 withLifetimesDescriptionsForActivity:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (([v6 isPlaceholder] & 1) == 0)
  {
    id v7 = [v5 activityUniqueIdentifier];
    id v8 = [v6 activityUniqueIdentifier];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
      {
        id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v26 = v6;
        id obj = [v6 activityLifetimeDescriptions];
        uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(obj);
              }
              BOOL v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              id v16 = [v15 lifetimeIdentifier];
              id v17 = (void *)MEMORY[0x263F823D0];
              id v18 = [v15 lifetimeName];
              v29[0] = MEMORY[0x263EF8330];
              v29[1] = 3221225472;
              v29[2] = __96__FCUIActivityPickerViewController__configureActivityView_withLifetimesDescriptionsForActivity___block_invoke;
              v29[3] = &unk_264542C50;
              id v30 = v5;
              double v31 = self;
              double v32 = v15;
              id v19 = [v17 actionWithTitle:v18 image:0 identifier:v16 handler:v29];

              id v20 = [v15 lifetimeMetadata];
              [v19 setDiscoverabilityTitle:v20];

              [v10 addObject:v19];
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v12);
        }

        if ([v10 count])
        {
          [v5 setMenuItemActions:v10];
          uint64_t v21 = [(FCActivityManager *)self->_activityManager activeActivity];
          double v22 = [(FCActivityManager *)self->_activityManager lifetimeOfActivity:v21];
          [(FCUIActivityPickerViewController *)self _updateSelectedStateOfActivityControl:v5 activeActivity:v21 lifetimeOfActiveActivity:v22];

          id v6 = v26;
        }
        else
        {
          id v6 = v26;
          id v23 = [v26 activityLifetimesAlternativeDescription];
          uint64_t v24 = [v23 length];

          if (!v24)
          {
LABEL_17:
            long long v25 = [(FCUIActivityPickerViewController *)self view];
            [v25 setNeedsLayout];

            [(UIViewController *)self fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation];
            goto LABEL_18;
          }
          uint64_t v21 = [v26 activityLifetimesAlternativeDescription];
          [v5 setMenuAlternativeDescription:v21];
        }

        goto LABEL_17;
      }
    }
  }
LABEL_18:
}

void __96__FCUIActivityPickerViewController__configureActivityView_withLifetimesDescriptionsForActivity___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG)) {
    __96__FCUIActivityPickerViewController__configureActivityView_withLifetimesDescriptionsForActivity___block_invoke_cold_1();
  }
  double v22 = v3;
  id v4 = [a1[5] _activityManager];
  id v5 = [v4 activeActivity];

  id v6 = [a1[5] _activityManager];
  id v7 = [v6 lifetimeOfActivity:v5];

  id v8 = a1[4];
  id v9 = a1[6];
  id v10 = [v5 activityUniqueIdentifier];
  uint64_t v11 = [v8 activityUniqueIdentifier];
  uint64_t v21 = v7;
  if ([v10 isEqual:v11])
  {
    uint64_t v12 = [v7 lifetimeIdentifier];
    uint64_t v13 = [v9 lifetimeIdentifier];
    uint64_t v14 = [v12 isEqualToString:v13] ^ 1;
  }
  else
  {
    uint64_t v14 = 1;
  }

  BOOL v15 = [a1[5] _activityManager];
  if (v14) {
    id v16 = v8;
  }
  else {
    id v16 = 0;
  }
  id v17 = NSString;
  id v18 = [v22 identifier];
  id v19 = [v17 stringWithFormat:@"Activity control menu item tapped: %@", v18];
  [v15 setActivity:v16 active:v14 withLifetime:v9 reason:v19];

  id v20 = [a1[5] view];
  [v20 setNeedsLayout];

  objc_msgSend(a1[5], "fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation");
}

- (void)_configureActivityListViewWithAvailableActivities:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  val = self;
  id v23 = [(FCUIActivityPickerViewController *)self _activityListView];
  [v23 setAdjustsFontForContentSizeCategory:1];
  objc_initWeak(&location, self);
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = [v23 activityViews];
  id v6 = (void *)[v5 mutableCopy];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v7)
  {
    uint64_t v25 = *(void *)v47;
    do
    {
      uint64_t v28 = v7;
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x3032000000;
        v43 = __Block_byref_object_copy_;
        v44 = __Block_byref_object_dispose_;
        id v45 = 0;
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke;
        v39[3] = &unk_264542C78;
        v39[4] = v9;
        v39[5] = &v40;
        [v6 enumerateObjectsUsingBlock:v39];
        id v10 = (void *)v41[5];
        if (v10)
        {
          uint64_t v11 = objc_opt_class();
          id v12 = v10;
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              uint64_t v13 = v12;
            }
            else {
              uint64_t v13 = 0;
            }
          }
          else
          {
            uint64_t v13 = 0;
          }
          uint64_t v14 = v13;
        }
        else
        {
          uint64_t v14 = [[FCUIActivityControl alloc] initWithActivityDescription:v9 style:1];
        }
        if (v41[5])
        {
          [(FCUIActivityControl *)v14 setActivityDescription:v9];
          [v6 removeObject:v41[5]];
        }
        objc_initWeak(&from, v14);
        BOOL v15 = (void *)MEMORY[0x263F823D0];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_2;
        v35[3] = &unk_264542CA0;
        objc_copyWeak(&v36, &from);
        objc_copyWeak(&v37, &location);
        v35[4] = v9;
        id v16 = [v15 actionWithHandler:v35];
        [(FCUIActivityControl *)v14 setDefaultAction:v16];
        if (([v9 isPlaceholder] & 1) == 0)
        {
          id v17 = (void *)MEMORY[0x263F823D0];
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_71;
          v32[3] = &unk_264542C28;
          objc_copyWeak(&v33, &from);
          objc_copyWeak(&v34, &location);
          id v18 = [v17 actionWithHandler:v32];
          [(FCUIActivityControl *)v14 setOptionsAction:v18];
          [(FCUIActivityPickerViewController *)val _configureActivityView:v14 withLifetimesDescriptionsForActivity:v9];
          id v19 = (void *)MEMORY[0x263F823D0];
          id v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v21 = [v20 localizedStringForKey:@"ACTIVITY_SETTINGS" value:&stru_26D1B4698 table:0];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_77;
          v29[3] = &unk_264542C28;
          objc_copyWeak(&v30, &from);
          objc_copyWeak(&v31, &location);
          double v22 = [v19 actionWithTitle:v21 image:0 identifier:0 handler:v29];
          [(FCUIActivityControl *)v14 setFooterAction:v22];

          objc_destroyWeak(&v31);
          objc_destroyWeak(&v30);

          objc_destroyWeak(&v34);
          objc_destroyWeak(&v33);
        }
        [v26 addObject:v14];

        objc_destroyWeak(&v37);
        objc_destroyWeak(&v36);
        objc_destroyWeak(&from);

        _Block_object_dispose(&v40, 8);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v7);
  }

  [v23 setActivityViews:v26];
  [(FCUIActivityPickerViewController *)val _updateHeaderOrFooterIfNecessary];
  [(FCUIActivityPickerViewController *)val _updateSelectedStateOfActivityViews];
  [(FCUIActivityPickerViewController *)val _updatePreferredContentSize];

  objc_destroyWeak(&location);
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = [v10 activityUniqueIdentifier];
  id v8 = [*(id *)(a1 + 32) activityUniqueIdentifier];
  int v9 = BSEqualObjects();

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
  {
    __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_2_cold_1();
    if (!WeakRetained) {
      goto LABEL_11;
    }
  }
  else if (!WeakRetained)
  {
    goto LABEL_11;
  }
  if (([WeakRetained isExpanded] & 1) == 0)
  {
    int v3 = [WeakRetained isPlaceholder];
    id v4 = objc_loadWeakRetained(a1 + 6);
    id v5 = v4;
    if (v3)
    {
      [v4 _openSetupUI:WeakRetained];
    }
    else
    {
      id v6 = [v4 _activityManager];
      uint64_t v7 = [v6 activeActivity];

      id v8 = [a1[4] activityUniqueIdentifier];
      int v9 = [v7 activityUniqueIdentifier];
      int v10 = [v8 isEqual:v9];
      char v11 = v10;
      uint64_t v12 = v10 ^ 1u;

      uint64_t v13 = [v5 _activityManager];
      if (v11) {
        id v14 = 0;
      }
      else {
        id v14 = a1[4];
      }
      BOOL v15 = [NSString stringWithFormat:@"Activity control tapped: %@", WeakRetained];
      [v13 setActivity:v14 active:v12 reason:v15];
    }
  }
LABEL_11:
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_71(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
  {
    __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_71_cold_1();
    if (!WeakRetained) {
      goto LABEL_7;
    }
  }
  else if (!WeakRetained)
  {
    goto LABEL_7;
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_alloc_init(_FCCCAnimator);
  id v5 = objc_alloc_init(MEMORY[0x263F83158]);
  id v6 = [v3 view];
  [v5 _setContainerView:v6];

  [v5 _setAnimator:v4];
  uint64_t v7 = [v5 _transitionCoordinator];
  id v8 = [v3 _activityListView];
  if ([WeakRetained isExpanded]) {
    id v9 = 0;
  }
  else {
    id v9 = WeakRetained;
  }
  [v8 setExpandedActivityView:v9 withTransitionCoordinator:v7];

  [(_FCCCAnimator *)v4 animateTransition:v5];
  [v3 _updatePreferredContentSize];

LABEL_7:
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_77(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
  {
    __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_77_cold_1();
    if (!WeakRetained) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (WeakRetained)
  {
LABEL_3:
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    [v3 _openEditUI:WeakRetained];
  }
LABEL_4:
}

- (BOOL)isFooterPinnedToBottom
{
  return self->_footerPinnedToBottom;
}

- (void)setFooterPinnedToBottom:(BOOL)a3
{
  self->_footerPinnedToBottom = a3;
}

- (FCActivityManager)_activityManager
{
  return self->_activityManager;
}

- (void)_setActivityManager:(id)a3
{
}

- (_TtC7FocusUI26ActivityEditViewController)_editViewController
{
  return self->_editViewController;
}

- (void)_setEditViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editViewController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

void __45__FCUIActivityPickerViewController__openURL___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21FEDE000, v0, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", v1, 0x16u);
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21FEDE000, v0, v1, "Activity picker education view dismiss action triggered: %{public}@", v2, v3, v4, v5, v6);
}

void __70__FCUIActivityPickerViewController__configureEducationCardIfNecessary__block_invoke_44_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21FEDE000, v0, v1, "Activity picker education view default action triggered: %{public}@", v2, v3, v4, v5, v6);
}

void __96__FCUIActivityPickerViewController__configureActivityView_withLifetimesDescriptionsForActivity___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21FEDE000, v0, OS_LOG_TYPE_DEBUG, "Activity control menu action triggered: activityView: %{public}@; menuAction: %{public}@",
    v1,
    0x16u);
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21FEDE000, v0, v1, "Activity control tapped: %{public}@", v2, v3, v4, v5, v6);
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_71_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21FEDE000, v0, v1, "Activity control options action triggered: %{public}@", v2, v3, v4, v5, v6);
}

void __86__FCUIActivityPickerViewController__configureActivityListViewWithAvailableActivities___block_invoke_77_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21FEDE000, v0, v1, "Activity view footer action triggered: %{public}@", v2, v3, v4, v5, v6);
}

@end